unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for MockGridDataGenerator()
{
  return &type metadata for MockGridDataGenerator;
}

void sub_252631788(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_252631794(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_25263179C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_2526317B0(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_2526317E0(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_2526317F4(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_252631808@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t static MockErrorURLResponder.respond(to:)()
{
  sub_2526757D0();
  MEMORY[0x270FA5388]();
  uint64_t v0 = sub_2526757F0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252675790();
  sub_2526321D4(MEMORY[0x263F8EE78]);
  sub_2526347C8(&qword_269C12590, MEMORY[0x263F07A20]);
  sub_2526753C0();
  sub_2526757E0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return swift_willThrow();
}

uint64_t sub_25263199C()
{
  sub_2526757D0();
  MEMORY[0x270FA5388]();
  uint64_t v0 = sub_2526757F0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252675790();
  sub_2526321D4(MEMORY[0x263F8EE78]);
  sub_2526347C8(&qword_269C12590, MEMORY[0x263F07A20]);
  sub_2526753C0();
  sub_2526757E0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return swift_willThrow();
}

unint64_t static MockEnergyWindowResponder.respond(to:)()
{
  return sub_252633404();
}

uint64_t sub_252631B38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v24 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12598);
  MEMORY[0x270FA5388]();
  v27 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_252675770();
  uint64_t v2 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388]();
  v23 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_252675570();
  uint64_t v4 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_252675550();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_252675530();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252675540();
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, void))(v16 + 104))((char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F072A0]);
  uint64_t v17 = v11;
  uint64_t v18 = v26;
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F07288], v17);
  v19 = v6;
  v20 = v27;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F072B8], v7);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v19, *MEMORY[0x263F072C8], v25);
  sub_252675750();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 48))(v20, 1, v18);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v23, v20, v18);
    return sub_252675560();
  }
  return result;
}

uint64_t static MockEnergyIntervalDataGenerator.windowRatings(grid:fromDate:endDate:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v4 = sub_2526324C0(a1, a2);
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = (int *)type metadata accessor for EnergyWindows(0);
    uint64_t v7 = (char *)a3 + v6[5];
    uint64_t v8 = sub_252675620();
    uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    v9(v7, 1, 1, v8);
    v9((char *)a3 + v6[6], 1, 1, v8);
    *a3 = v5;
    v10 = (uint64_t *)((char *)a3 + v6[7]);
    void *v10 = 0;
    v10[1] = 0;
    uint64_t v11 = (uint64_t *)((char *)a3 + v6[8]);
    *uint64_t v11 = 0;
    v11[1] = 0;
    *(uint64_t *)((char *)a3 + v6[9]) = 0;
    uint64_t v12 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*((void *)v6 - 1) + 56);
    uint64_t v13 = a3;
    uint64_t v14 = 0;
    uint64_t v15 = (uint64_t)v6;
  }
  else
  {
    if (qword_26B22A9E0 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_2526759F0();
    __swift_project_value_buffer(v16, (uint64_t)qword_26B22B6D8);
    uint64_t v17 = sub_2526759D0();
    os_log_type_t v18 = sub_252675E00();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_25262F000, v17, v18, "Unable to generate Mock Energy Intervals", v19, 2u);
      MEMORY[0x2533B8110](v19, -1, -1);
    }

    uint64_t v20 = type metadata accessor for EnergyWindows(0);
    uint64_t v12 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
    uint64_t v15 = v20;
    uint64_t v13 = a3;
    uint64_t v14 = 1;
  }

  return v12(v13, v14, 1, v15);
}

unint64_t sub_252632150()
{
  return sub_252633404();
}

unint64_t static MockEnergyWindowFixedDateResponder.respond(to:)()
{
  return sub_252633404();
}

void static MockEnergyWindowFixedDateResponder.urlResponse(to:)()
{
}

void sub_252632198()
{
}

void sub_2526321B0()
{
  qword_269C12B90 = (uint64_t)&unk_2702B7358;
}

uint64_t sub_2526321C4(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

unint64_t sub_2526321D4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A720);
  uint64_t v2 = sub_252676080();
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
    sub_25263486C(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_252632300(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_2526348D4(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_252632300(uint64_t a1, uint64_t a2)
{
  sub_2526761B0();
  sub_252675B20();
  uint64_t v4 = sub_2526761D0();

  return sub_252632378(a1, a2, v4);
}

unint64_t sub_252632378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_252676130() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_252676130() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_252676130()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_2526324C0(uint64_t a1, uint64_t a2)
{
  uint64_t v146 = a1;
  uint64_t v124 = sub_252675360();
  v137 = *(void (***)(char *, uint64_t))(v124 - 8);
  MEMORY[0x270FA5388](v124);
  v126 = (char *)&v109 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = sub_252675680();
  uint64_t v136 = *(void *)(v139 - 8);
  MEMORY[0x270FA5388](v139);
  v138 = (char *)&v109 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252675720();
  v135 = *(void **)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v125 = (char *)&v109 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12598);
  MEMORY[0x270FA5388](v7 - 8);
  v143 = (char *)&v109 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = sub_252675770();
  uint64_t v134 = *(void *)(v144 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v144);
  v142 = (char *)&v109 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v109 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v109 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_252675620();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v109 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  v23 = (char *)&v109 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v109 - v25;
  MEMORY[0x270FA5388](v24);
  v28 = (char *)&v109 - v27;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v109 - v27, v146, v16);
  uint64_t v29 = sub_2526347C8(&qword_269C125C0, MEMORY[0x263F07490]);
  v145 = v28;
  uint64_t v146 = v16;
  uint64_t v30 = v29;
  if (sub_252675B50())
  {
    v31 = (void *)MEMORY[0x263F8EE78];
LABEL_3:
    (*(void (**)(char *, uint64_t))(v17 + 8))(v145, v146);
    return (uint64_t)v31;
  }
  uint64_t v140 = v30;
  v110 = v26;
  v130 = v23;
  v131 = v20;
  v127 = v15;
  v128 = v12;
  v129 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v134 + 48);
  v123 = (void (**)(char *, uint64_t, uint64_t))(v134 + 32);
  unsigned int v122 = *MEMORY[0x263F07740];
  v121 = (void (**)(char *, void, uint64_t))(v136 + 104);
  v120 = (void (**)(char *, uint64_t))(v136 + 8);
  v119 = (void (**)(char *, char *, uint64_t))(v134 + 16);
  unsigned int v118 = *MEMORY[0x263F078C0];
  v114 = v137 + 1;
  v113 = (void (**)(char *, uint64_t))(v135 + 1);
  unsigned int v117 = *MEMORY[0x263F078C8];
  v112 = (void (**)(char *, uint64_t))(v134 + 8);
  v111 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 48);
  v132 = (void (**)(char *, uint64_t, uint64_t))(v17 + 32);
  v137 = (void (**)(char *, uint64_t))(v17 + 8);
  v31 = (void *)MEMORY[0x263F8EE78];
  v116 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  long long v115 = xmmword_252676970;
  uint64_t v136 = a2;
  v33 = v138;
  uint64_t v34 = v139;
  uint64_t v35 = (uint64_t)v143;
  uint64_t v36 = v144;
  v37 = v142;
  uint64_t v38 = v17;
  uint64_t v141 = v5;
  while (!v31[2])
  {
    sub_252675730();
    if ((*v129)(v35, 1, v36) == 1)
    {
      sub_252634810(v35, &qword_269C12598);
      uint64_t v42 = (uint64_t)v127;
      (*v116)(v127, 1, 1, v146);
LABEL_22:
      sub_252634810(v42, &qword_26B22AAB0);
      double v41 = 0.0;
      goto LABEL_24;
    }
    v43 = v128;
    (*v123)(v128, v35, v36);
    (*v121)(v33, v122, v34);
    v44 = v125;
    sub_252675690();
    (*v120)(v33, v34);
    (*v119)(v37, v43, v36);
    sub_252675700();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C125C8);
    uint64_t v45 = sub_252675710();
    uint64_t v46 = *(void *)(v45 - 8);
    uint64_t v47 = *(void *)(v46 + 72);
    unint64_t v48 = (*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
    uint64_t v49 = swift_allocObject();
    *(_OWORD *)(v49 + 16) = v115;
    v50 = *(void (**)(unint64_t, void, uint64_t))(v46 + 104);
    v50(v49 + v48, v118, v45);
    v50(v49 + v48 + v47, v117, v45);
    sub_252661A34(v49);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    v51 = v126;
    sub_2526756A0();
    swift_bridgeObjectRelease();
    uint64_t v52 = sub_252675310();
    if (v53) {
      uint64_t v54 = 0;
    }
    else {
      uint64_t v54 = v52;
    }
    uint64_t result = 59 - v54;
    if (__OFSUB__(59, v54)) {
      goto LABEL_71;
    }
    sub_252675320();
    uint64_t v55 = sub_252675330();
    if (v56) {
      uint64_t v57 = 0;
    }
    else {
      uint64_t v57 = v55;
    }
    uint64_t result = 60 - v57;
    if (__OFSUB__(60, v57)) {
      goto LABEL_72;
    }
    sub_252675340();
    uint64_t v58 = (uint64_t)v127;
    sub_2526756E0();
    uint64_t v42 = v58;
    (*v114)(v51, v124);
    (*v113)(v44, v5);
    (*v112)(v128, v144);
    uint64_t v59 = v146;
    int v60 = (*v111)(v58, 1, v146);
    v33 = v138;
    uint64_t v34 = v139;
    uint64_t v17 = v38;
    if (v60 == 1) {
      goto LABEL_22;
    }
    v61 = v110;
    (*v132)(v110, v58, v59);
    sub_252675500();
    double v63 = v62;
    sub_252675500();
    double v65 = v64;
    (*v137)(v61, v59);
    double v41 = v63 - v65;
LABEL_24:
    if (qword_269C123E0 != -1) {
      swift_once();
    }
    uint64_t v66 = qword_269C12B90;
    unint64_t v67 = *(void *)(qword_269C12B90 + 16);
    if (!v67) {
      goto LABEL_6;
    }
    v147[0] = 0;
    swift_bridgeObjectRetain();
    uint64_t result = MEMORY[0x2533B8120](v147, 8);
    uint64_t v68 = (v147[0] * (unsigned __int128)v67) >> 64;
    if (v67 > v147[0] * v67)
    {
      unint64_t v69 = -(uint64_t)v67 % v67;
      if (v69 > v147[0] * v67)
      {
        do
        {
          v147[0] = 0;
          uint64_t result = MEMORY[0x2533B8120](v147, 8);
        }
        while (v69 > v147[0] * v67);
        uint64_t v68 = (v147[0] * (unsigned __int128)v67) >> 64;
      }
    }
    if (v68 >= *(void *)(v66 + 16)) {
      goto LABEL_69;
    }
    int v70 = *(unsigned __int8 *)(v66 + v68 + 32);
    swift_bridgeObjectRelease();
    uint64_t v71 = qword_269C12B90;
    uint64_t v72 = *(void *)(qword_269C12B90 + 16);
    if (v72)
    {
      swift_bridgeObjectRetain();
      uint64_t v73 = 0;
      uint64_t v74 = MEMORY[0x263F8EE78];
      do
      {
        char v77 = *(unsigned char *)(v71 + v73 + 32);
        if (v77)
        {
          char v78 = sub_252676130();
          swift_bridgeObjectRelease();
          if ((v78 & 1) == 0)
          {
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v147[0] = v74;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_25265BA60(0, *(void *)(v74 + 16) + 1, 1);
              uint64_t v74 = v147[0];
            }
            unint64_t v76 = *(void *)(v74 + 16);
            unint64_t v75 = *(void *)(v74 + 24);
            if (v76 >= v75 >> 1)
            {
              sub_25265BA60(v75 > 1, v76 + 1, 1);
              uint64_t v74 = v147[0];
            }
            *(void *)(v74 + 16) = v76 + 1;
            *(unsigned char *)(v74 + v76 + 32) = v77;
          }
          uint64_t v17 = v38;
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        ++v73;
      }
      while (v72 != v73);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v74 = MEMORY[0x263F8EE78];
    }
    unint64_t v80 = *(void *)(v74 + 16);
    uint64_t v5 = v141;
    if (v80)
    {
      v147[0] = 0;
      uint64_t result = MEMORY[0x2533B8120](v147, 8);
      uint64_t v81 = (v147[0] * (unsigned __int128)v80) >> 64;
      if (v80 > v147[0] * v80)
      {
        unint64_t v82 = -(uint64_t)v80 % v80;
        if (v82 > v147[0] * v80)
        {
          do
          {
            v147[0] = 0;
            uint64_t result = MEMORY[0x2533B8120](v147, 8);
          }
          while (v82 > v147[0] * v80);
          uint64_t v81 = (v147[0] * (unsigned __int128)v80) >> 64;
        }
      }
      if (v81 >= *(void *)(v74 + 16)) {
        goto LABEL_70;
      }
      int v83 = *(unsigned __int8 *)(v74 + v81 + 32);
      swift_release();
      v135 = v31;
      if (v70)
      {
        char v84 = sub_252676130();
        swift_bridgeObjectRelease();
        if ((v84 & 1) != 0 && v41 <= 3600.0) {
LABEL_55:
        }
          int v83 = v70;
      }
      else
      {
        swift_bridgeObjectRelease();
        if (v41 <= 3600.0) {
          goto LABEL_55;
        }
      }
      id v85 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F088C0]), sel_init);
      objc_msgSend(v85, sel_setFormatOptions_, 1907);
      v86 = (void *)sub_2526755A0();
      id v87 = objc_msgSend(v85, sel_stringFromDate_, v86);

      uint64_t v133 = sub_252675BA0();
      uint64_t v134 = v88;

      v89 = v130;
      sub_252675590();
      id v90 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F088C0]), sel_init);
      objc_msgSend(v90, sel_setFormatOptions_, 1907);
      v91 = (void *)sub_2526755A0();
      id v92 = objc_msgSend(v90, sel_stringFromDate_, v91);

      uint64_t v93 = sub_252675BA0();
      uint64_t v95 = v94;

      v96 = *v137;
      (*v137)(v89, v146);
      if (v83)
      {
        v31 = v135;
        if (v83 == 1)
        {
          unint64_t v97 = 0xE400000000000000;
          uint64_t v98 = 1146048327;
        }
        else
        {
          unint64_t v97 = 0xE500000000000000;
          uint64_t v98 = 0x5453524F57;
        }
      }
      else
      {
        unint64_t v97 = 0xE400000000000000;
        uint64_t v98 = 1414743362;
        v31 = v135;
      }
      uint64_t v99 = v133;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v31 = sub_25264BE54(0, v31[2] + 1, 1, v31);
      }
      unint64_t v101 = v31[2];
      unint64_t v100 = v31[3];
      v102 = v131;
      if (v101 >= v100 >> 1)
      {
        v108 = sub_25264BE54((void *)(v100 > 1), v101 + 1, 1, v31);
        v102 = v131;
        v31 = v108;
      }
      v31[2] = v101 + 1;
      v103 = &v31[6 * v101];
      v103[4] = v98;
      v103[5] = v97;
      uint64_t v104 = v134;
      v103[6] = v99;
      v103[7] = v104;
      v103[8] = v93;
      v103[9] = v95;
      v105 = v145;
      v106 = v102;
      sub_252675590();
      uint64_t v107 = v146;
      v96(v105, v146);
      (*v132)(v105, (uint64_t)v106, v107);
      v33 = v138;
      uint64_t v34 = v139;
      uint64_t v5 = v141;
      uint64_t v17 = v38;
      goto LABEL_6;
    }
    swift_release();
    v33 = v138;
    uint64_t v34 = v139;
LABEL_6:
    char v39 = sub_252675B50();
    uint64_t v35 = (uint64_t)v143;
    uint64_t v36 = v144;
    v37 = v142;
    if (v39) {
      goto LABEL_3;
    }
  }
  do
  {
    v147[0] = 0;
    uint64_t result = MEMORY[0x2533B8120](v147, 8);
  }
  while (!(3 * v147[0]));
  unint64_t v40 = (v147[0] * (unsigned __int128)3uLL) >> 64;
  if (v40 < qword_2702B7390)
  {
    double v41 = *((double *)&unk_2702B7380 + v40 + 4);
    goto LABEL_24;
  }
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
  return result;
}

unint64_t sub_252633404()
{
  uint64_t v0 = sub_2526757D0();
  MEMORY[0x270FA5388](v0 - 8);
  v91 = (char *)v66 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_2526757F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v90 = (char *)v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C125B0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v81 = (void *)((char *)v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v82 = type metadata accessor for EnergyWindows(0);
  uint64_t v79 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  uint64_t v77 = (uint64_t)v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  int v83 = (char *)v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  id v85 = (void *)((char *)v66 - v11);
  uint64_t v87 = sub_252675580();
  uint64_t v89 = *(void *)(v87 - 8);
  MEMORY[0x270FA5388](v87);
  uint64_t v13 = (char *)v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_252675620();
  uint64_t v88 = *(void *)(v86 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v86);
  unint64_t v80 = (char *)v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v66 - v17;
  MEMORY[0x270FA5388](v16);
  char v84 = (void *)((char *)v66 - v19);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAD0);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_252675470();
  uint64_t v24 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)v66 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252675070();
  int v27 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23);
  uint64_t v92 = v3;
  if (v27 == 1)
  {
    sub_252634810((uint64_t)v22, &qword_26B22AAD0);
LABEL_17:
    uint64_t v55 = v90;
    sub_2526757B0();
    unint64_t v56 = sub_2526321D4(MEMORY[0x263F8EE78]);
    sub_2526347C8(&qword_269C12590, MEMORY[0x263F07A20]);
    sub_2526753C0();
    sub_2526757E0();
    (*(void (**)(char *, uint64_t))(v92 + 8))(v55, v2);
    swift_willThrow();
    return v56;
  }
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v26, v22, v23);
  sub_252641BE8(0x644964697267, 0xE600000000000000);
  if (!v28)
  {
    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
    goto LABEL_17;
  }
  uint64_t v74 = v23;
  uint64_t v75 = v28;
  uint64_t v72 = v2;
  uint64_t v73 = v26;
  uint64_t v76 = v24;
  id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F088C0]), sel_init);
  sub_252675600();
  sub_252631B38((uint64_t)v13);
  sub_252675510();
  uint64_t v30 = *(void (**)(char *, uint64_t))(v89 + 8);
  v89 += 8;
  v30(v13, v87);
  uint64_t v31 = v88;
  v32 = *(void (**)(char *, uint64_t))(v88 + 8);
  uint64_t v33 = v86;
  uint64_t v70 = v88 + 8;
  uint64_t v71 = v32;
  v32(v18, v86);
  uint64_t v34 = (void *)sub_252675B90();
  swift_bridgeObjectRelease();
  id v35 = objc_msgSend(v29, sel_dateFromString_, v34);

  if (!v35)
  {
    v37 = v85;
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v31 + 56))(v85, 1, 1, v33);
    goto LABEL_12;
  }
  uint64_t v68 = v30;
  sub_2526755F0();

  uint64_t v36 = *(void (**)(uint64_t *, char *, uint64_t))(v31 + 32);
  v37 = v85;
  uint64_t v69 = v31 + 32;
  v36(v85, v18, v33);
  uint64_t v38 = v31 + 56;
  char v39 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56);
  v39((char *)v37, 0, 1, v33);
  uint64_t v42 = *(unsigned int (**)(void, void, void))(v31 + 48);
  uint64_t v41 = v31 + 48;
  unint64_t v40 = v42;
  if (v42(v37, 1, v33) == 1)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v76 + 8))(v73, v74);
    char v53 = &qword_26B22AAB0;
    goto LABEL_13;
  }
  v66[1] = v38;
  v66[0] = v40;
  unint64_t v67 = v39;
  uint64_t v88 = v41;
  id v85 = (uint64_t *)v36;
  v36(v84, (char *)v37, v33);
  id v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F088C0]), sel_init);
  sub_2526755C0();
  sub_252631B38((uint64_t)v13);
  sub_252675510();
  v68(v13, v87);
  v71(v18, v33);
  v44 = (void *)sub_252675B90();
  swift_bridgeObjectRelease();
  id v45 = objc_msgSend(v43, sel_dateFromString_, v44);

  if (!v45)
  {
    uint64_t v46 = v83;
    v67(v83, 1, 1, v33);
    uint64_t v48 = v33;
    uint64_t v49 = v76;
    goto LABEL_15;
  }
  sub_2526755F0();

  uint64_t v46 = v83;
  ((void (*)(char *, char *, uint64_t))v85)(v83, v18, v33);
  v67(v46, 0, 1, v33);
  int v47 = ((uint64_t (*)(char *, uint64_t, uint64_t))v66[0])(v46, 1, v33);
  uint64_t v48 = v33;
  uint64_t v49 = v76;
  if (v47 == 1)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    v71((char *)v84, v48);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v73, v74);
    char v53 = &qword_26B22AAB0;
    uint64_t v54 = (uint64_t)v46;
    goto LABEL_16;
  }
  uint64_t v50 = (uint64_t)v80;
  ((void (*)(char *, char *, uint64_t))v85)(v80, v46, v33);
  v37 = v81;
  uint64_t v51 = (uint64_t)v84;
  static MockEnergyIntervalDataGenerator.windowRatings(grid:fromDate:endDate:)((uint64_t)v84, v50, v81);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v79 + 48))(v37, 1, v82) == 1)
  {
    uint64_t v52 = (void (*)(uint64_t, uint64_t))v71;
    v71((char *)v50, v48);
    v52(v51, v48);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v73, v74);
    char v53 = &qword_269C125B0;
LABEL_13:
    uint64_t v54 = (uint64_t)v37;
LABEL_16:
    sub_252634810(v54, v53);
    uint64_t v2 = v72;
    goto LABEL_17;
  }
  uint64_t v58 = v73;
  uint64_t v59 = v77;
  sub_252634708((uint64_t)v37, v77);
  sub_252675110();
  swift_allocObject();
  sub_252675100();
  sub_2526347C8(&qword_269C125B8, (void (*)(uint64_t))type metadata accessor for EnergyWindows);
  uint64_t v60 = v78;
  uint64_t v61 = sub_2526750F0();
  if (v60)
  {
    swift_release();
    sub_25263476C(v59);
    unint64_t v56 = v86;
    double v62 = (void (*)(uint64_t, unint64_t))v71;
    v71((char *)v50, v86);
    v62(v51, v56);
  }
  else
  {
    unint64_t v56 = v61;
    swift_release();
    sub_25263476C(v59);
    uint64_t v63 = v50;
    uint64_t v64 = v86;
    double v65 = (void (*)(uint64_t, uint64_t))v71;
    v71((char *)v63, v86);
    v65(v51, v64);
  }
  (*(void (**)(char *, uint64_t))(v49 + 8))(v58, v74);
  return v56;
}

void sub_252633F7C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12598);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_252675620();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v51 = v7;
  uint64_t v52 = v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAD0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_252675470();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252675070();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_252634810((uint64_t)v13, &qword_26B22AAD0);
LABEL_10:
    sub_252634674();
    swift_allocError();
    unsigned char *v44 = 1;
    swift_willThrow();
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
  id v18 = sub_2526413EC();
  objc_msgSend(v18, sel_copy);

  sub_252675F10();
  swift_unknownObjectRelease();
  sub_2526346C8();
  if ((swift_dynamicCast() & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    goto LABEL_10;
  }
  uint64_t v47 = v0;
  id v50 = v53;
  sub_2526755D0();
  sub_252675740();
  uint64_t v19 = sub_252675770();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v6, 1, v19) != 1)
  {
    uint64_t v21 = (void *)sub_252675760();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v6, v19);
  }
  id v22 = v50;
  objc_msgSend(v50, sel_setTimeZone_, v21);

  uint64_t v23 = (void *)sub_2526755A0();
  id v24 = objc_msgSend(v22, sel_stringFromDate_, v23);

  uint64_t v49 = sub_252675BA0();
  uint64_t v48 = v25;

  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB88);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_252676980;
  sub_252640A48((uint64_t)v3);
  uint64_t v28 = v51;
  uint64_t v27 = v52;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v52 + 48))(v3, 1, v51) == 1)
  {
    __break(1u);
  }
  else
  {
    sub_2526755E0();
    double v30 = v29;
    sub_2526755E0();
    double v32 = v30 - v31;
    uint64_t v33 = *(void (**)(char *, uint64_t))(v27 + 8);
    uint64_t v52 = v27 + 8;
    uint64_t v46 = v33;
    v33(v3, v28);
    uint64_t v34 = MEMORY[0x263F8D5B8];
    *(void *)(v26 + 56) = MEMORY[0x263F8D538];
    *(void *)(v26 + 64) = v34;
    *(double *)(v26 + 32) = v32;
    sub_252675BD0();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B22AA58);
    uint64_t inited = swift_initStackObject();
    id v45 = v10;
    uint64_t v36 = inited;
    *(_OWORD *)(inited + 16) = xmmword_252676970;
    *(void *)(inited + 32) = 1702125892;
    *(void *)(inited + 40) = 0xE400000000000000;
    uint64_t v37 = v48;
    *(void *)(inited + 48) = v49;
    *(void *)(inited + 56) = v37;
    strcpy((char *)(inited + 64), "Cache-Control");
    *(_WORD *)(inited + 78) = -4864;
    uint64_t v54 = 0x3D6567612D78616DLL;
    unint64_t v55 = 0xE800000000000000;
    sub_252675C70();
    swift_bridgeObjectRelease();
    unint64_t v38 = v55;
    *(void *)(v36 + 80) = v54;
    *(void *)(v36 + 88) = v38;
    sub_25265513C(v36);
    id v39 = objc_allocWithZone(MEMORY[0x263F088A0]);
    unint64_t v40 = (void *)sub_252675410();
    uint64_t v41 = (void *)sub_252675B90();
    uint64_t v42 = (void *)sub_252675AC0();
    swift_bridgeObjectRelease();
    id v43 = objc_msgSend(v39, sel_initWithURL_statusCode_HTTPVersion_headerFields_, v40, 200, v41, v42);

    if (v43)
    {

      v46(v45, v51);
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      return;
    }
  }
  __break(1u);
}

ValueMetadata *type metadata accessor for MockErrorURLResponder()
{
  return &type metadata for MockErrorURLResponder;
}

ValueMetadata *type metadata accessor for MockEnergyWindowResponder()
{
  return &type metadata for MockEnergyWindowResponder;
}

ValueMetadata *type metadata accessor for MockEnergyWindowFixedDateResponder()
{
  return &type metadata for MockEnergyWindowFixedDateResponder;
}

ValueMetadata *type metadata accessor for MockEnergyIntervalDataGenerator()
{
  return &type metadata for MockEnergyIntervalDataGenerator;
}

unint64_t sub_252634674()
{
  unint64_t result = qword_269C125A0;
  if (!qword_269C125A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C125A0);
  }
  return result;
}

unint64_t sub_2526346C8()
{
  unint64_t result = qword_269C125A8;
  if (!qword_269C125A8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269C125A8);
  }
  return result;
}

uint64_t sub_252634708(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EnergyWindows(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25263476C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EnergyWindows(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2526347C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_252634810(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25263486C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A6D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_2526348D4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id sub_2526348E4(void *a1)
{
  return sub_2526348FC(a1);
}

id sub_2526348FC(id a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAD0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252675470();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252675070();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_252634D24((uint64_t)v4);
LABEL_4:
    sub_252634674();
    swift_allocError();
    *uint64_t v12 = 1;
    swift_willThrow();
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  id v9 = objc_allocWithZone(MEMORY[0x263F088A0]);
  uint64_t v10 = (void *)sub_252675410();
  uint64_t v11 = (void *)sub_252675B90();
  a1 = objc_msgSend(v9, sel_initWithURL_statusCode_HTTPVersion_headerFields_, v10, 200, v11, 0);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (!a1) {
    goto LABEL_4;
  }
  return a1;
}

id static MockURLResponder.urlResponse(to:)(id a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAD0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252675470();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252675070();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_252634D24((uint64_t)v4);
LABEL_4:
    sub_252634674();
    swift_allocError();
    *uint64_t v12 = 1;
    swift_willThrow();
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  id v9 = objc_allocWithZone(MEMORY[0x263F088A0]);
  uint64_t v10 = (void *)sub_252675410();
  uint64_t v11 = (void *)sub_252675B90();
  a1 = objc_msgSend(v9, sel_initWithURL_statusCode_HTTPVersion_headerFields_, v10, 200, v11, 0);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (!a1) {
    goto LABEL_4;
  }
  return a1;
}

uint64_t sub_252634D24(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static MockURLResponder.configResponse()()
{
  uint64_t v0 = sub_252675BF0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252675BE0();
  uint64_t v4 = sub_252675BB0();
  unint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v6 >> 60 == 15) {
    return 0;
  }
  else {
    return v4;
  }
}

uint64_t sub_252634E90()
{
  uint64_t v0 = sub_252675BF0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252675BE0();
  uint64_t v4 = sub_252675BB0();
  unint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v6 >> 60 == 15) {
    return 0;
  }
  else {
    return v4;
  }
}

uint64_t sub_252634F98()
{
  return 0;
}

uint64_t static MockURLResponder.respond(to:)()
{
  if (qword_26B22A9E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2526759F0();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B22B6D8);
  uint64_t v1 = sub_2526759D0();
  os_log_type_t v2 = sub_252675E00();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_25262F000, v1, v2, "MockURLResponder default empty response being send. Check your code if this intentional!", v3, 2u);
    MEMORY[0x2533B8110](v3, -1, -1);
  }

  return 0;
}

id sub_2526350A0(void *a1)
{
  return static MockURLResponder.urlResponse(to:)(a1);
}

uint64_t sub_2526350B8()
{
  return static MockURLResponder.configResponse()();
}

BOOL static MockNetworkError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t MockNetworkError.hash(into:)()
{
  return sub_2526761C0();
}

uint64_t MockNetworkError.hashValue.getter()
{
  return sub_2526761D0();
}

BOOL sub_25263515C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_252635174()
{
  return sub_2526761D0();
}

uint64_t sub_2526351BC()
{
  return sub_2526761C0();
}

uint64_t sub_2526351E8()
{
  return sub_2526761D0();
}

uint64_t sub_25263523C()
{
  return 1;
}

uint64_t sub_252635244()
{
  uint64_t v0 = sub_2526750B0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252675050();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 1;
}

uint64_t sub_252635310@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2526750B0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a2, a1, v4);
}

id sub_25263537C()
{
  uint64_t v0 = sub_2526750B0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v10 - v5;
  sub_252675050();
  sub_252635310((uint64_t)v4, (uint64_t)v6);
  uint64_t v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v4, v0);
  uint64_t v8 = (void *)sub_252675030();
  v7(v6, v0);

  return v8;
}

id sub_2526354AC()
{
  uint64_t v1 = v0;
  unint64_t v2 = *MEMORY[0x263F8EED0] & *v0;
  uint64_t v3 = sub_2526750B0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v42 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v42 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAD0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(v1, sel_client);
  if (result)
  {
    uint64_t v17 = result;
    unint64_t v46 = v2;
    id v18 = objc_msgSend(v1, sel_request);
    sub_252675050();

    sub_252675070();
    uint64_t v19 = v12;
    uint64_t v20 = *(void (**)(char *, uint64_t))(v4 + 8);
    v20(v19, v3);
    uint64_t v21 = sub_252675470();
    uint64_t v22 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v15, 1, v21) == 1)
    {
      sub_252634D24((uint64_t)v15);
    }
    else
    {
      v44 = v7;
      id v45 = v20;
      uint64_t v23 = sub_252675400();
      uint64_t v25 = v24;
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v21);
      uint64_t v49 = v23;
      uint64_t v50 = v25;
      unint64_t v47 = 0xD000000000000013;
      unint64_t v48 = 0x8000000252679310;
      sub_25263647C();
      LOBYTE(v23) = sub_252675F00();
      swift_bridgeObjectRelease();
      if ((v23 & 1) == 0 || (sub_252635A1C() & 1) == 0)
      {
        unint64_t v26 = v46;
        uint64_t v27 = *(void *)(v46 + 80);
        id v28 = objc_msgSend(v1, sel_request);
        sub_252675050();

        uint64_t v29 = *(void *)(v26 + 88);
        uint64_t v43 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 8))(v10, v27, v29);
        unint64_t v46 = v30;
        double v31 = v45;
        v45(v10, v3);
        id v32 = objc_msgSend(v1, (SEL)&selRef_registerClass_);
        uint64_t v33 = v44;
        sub_252675050();

        uint64_t v34 = (void *)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 16))(v33, v27, v29);
        v31(v33, v3);
        objc_msgSend(v17, sel_URLProtocol_didReceiveResponse_cacheStoragePolicy_, v1, v34, 2);
        self;
        uint64_t v35 = swift_dynamicCastObjCClass();
        if (v35)
        {
          uint64_t v36 = (void *)v35;
          id v37 = v34;
          id v38 = objc_msgSend(v36, sel_statusCode);
          unint64_t v39 = v46;
          uint64_t v40 = v43;
          if (v38 == (id)304)
          {

            sub_252636330(v40, v39);
          }
          else
          {
            uint64_t v41 = (void *)sub_2526754D0();
            objc_msgSend(v17, sel_URLProtocol_didLoadData_, v1, v41);

            sub_252636330(v40, v39);
          }
        }
        else
        {

          sub_252636330(v43, v46);
        }
      }
    }
    objc_msgSend(v17, sel_URLProtocolDidFinishLoading_, v1);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

void sub_2526359D4(void *a1)
{
  id v1 = a1;
  sub_2526354AC();
}

uint64_t sub_252635A1C()
{
  id v1 = v0;
  uint64_t v2 = *MEMORY[0x263F8EED0] & *v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAD0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2526750B0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_252675470();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v32 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (*(uint64_t (**)(void))(*(void *)(v2 + 88) + 24))();
  unint64_t v15 = v14;
  id v16 = objc_msgSend(v1, sel_request);
  sub_252675050();

  sub_252675070();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v5, 1, v10) == 1)
  {
    sub_252636330(v13, v15);
    sub_252634D24((uint64_t)v5);
  }
  else
  {
    uint64_t v30 = v13;
    unint64_t v31 = v15;
    uint64_t v17 = v32;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v32, v5, v10);
    id v18 = objc_msgSend(v1, sel_client);
    if (v18)
    {
      uint64_t v19 = v18;
      id v20 = objc_allocWithZone(MEMORY[0x263F088A0]);
      uint64_t v21 = (void *)sub_252675410();
      uint64_t v22 = (void *)sub_252675B90();
      id v23 = objc_msgSend(v20, sel_initWithURL_statusCode_HTTPVersion_headerFields_, v21, 200, v22, 0);

      if (v23)
      {
        objc_msgSend(v19, sel_URLProtocol_didReceiveResponse_cacheStoragePolicy_, v1, v23, 2);
        uint64_t v24 = v17;
        uint64_t v25 = v30;
        unint64_t v26 = v31;
        uint64_t v27 = (void *)sub_2526754D0();
        objc_msgSend(v19, sel_URLProtocol_didLoadData_, v1, v27);
        sub_252636330(v25, v26);

        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v11 + 8))(v24, v10);
        return 1;
      }
      (*(void (**)(char *, uint64_t))(v11 + 8))(v17, v10);
      swift_unknownObjectRelease();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v17, v10);
    }
    sub_252636330(v30, v31);
  }
  return 0;
}

id sub_252635E0C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v7 = sub_2526750B0();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252675050();
  id v10 = a4;
  swift_unknownObjectRetain();
  id v11 = sub_252636388((uint64_t)v9, (uint64_t)a4, a5);

  swift_unknownObjectRelease();
  return v11;
}

id sub_252635ED4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MockURLProtocol();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id NSURLSession.init<A>(mockResponder:)()
{
  id v0 = objc_msgSend(self, sel_ephemeralSessionConfiguration);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C125D0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_252676980;
  *(void *)(v1 + 32) = type metadata accessor for MockURLProtocol();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C125D8);
  objc_super v2 = (void *)sub_252675D70();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setProtocolClasses_, v2);

  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sessionWithConfiguration_, v0);
  uint64_t v4 = self;
  objc_msgSend(v4, sel_registerClass_, swift_getObjCClassFromMetadata());

  return v3;
}

uint64_t type metadata accessor for MockURLProtocol()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_252636090()
{
  unint64_t result = qword_269C125E0[0];
  if (!qword_269C125E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269C125E0);
  }
  return result;
}

uint64_t dispatch thunk of static MockURLResponder.respond(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of static MockURLResponder.urlResponse(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of static MockURLResponder.configResponse()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t getEnumTagSinglePayload for MockNetworkError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MockNetworkError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2526362A4);
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

uint64_t sub_2526362CC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2526362D8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MockNetworkError()
{
  return &type metadata for MockNetworkError;
}

uint64_t sub_2526362F8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_252636330(uint64_t a1, unint64_t a2)
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

id sub_252636388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4 = v3;
  int v8 = (void *)sub_252675030();
  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for MockURLProtocol();
  id v9 = objc_msgSendSuper2(&v12, sel_initWithRequest_cachedResponse_client_, v8, a2, a3);

  uint64_t v10 = sub_2526750B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
  return v9;
}

unint64_t sub_25263647C()
{
  unint64_t result = qword_26B22AB28;
  if (!qword_26B22AB28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22AB28);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

ValueMetadata *type metadata accessor for HMACAuthController()
{
  return &type metadata for HMACAuthController;
}

uint64_t sub_252636510()
{
  uint64_t v1 = v0;
  if (v0[3])
  {
    uint64_t v2 = v0[2];
  }
  else
  {
    uint64_t v4 = *v0;
    uint64_t v5 = v0[1];
    swift_bridgeObjectRetain();
    sub_252675C70();
    sub_25263CB4C();
    sub_252675C70();
    swift_bridgeObjectRelease();
    sub_252675C70();
    sub_252675C70();
    uint64_t v2 = v4;
    v1[2] = v4;
    v1[3] = v5;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_252636600()
{
  if (v0[5])
  {
    uint64_t v1 = v0[4];
  }
  else
  {
    uint64_t v1 = sub_252636664(v0);
    v0[4] = v1;
    v0[5] = v2;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_252636664(uint64_t *a1)
{
  uint64_t v2 = *a1;
  swift_bridgeObjectRetain();
  sub_252675C70();
  sub_25263CB4C();
  sub_252675C70();
  swift_bridgeObjectRelease();
  sub_252675C70();
  sub_252675C70();
  return v2;
}

void sub_252636714()
{
  qword_26B22A9A0 = (uint64_t)&unk_2702B73E0;
}

uint64_t sub_252636728(uint64_t result, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  if (v3)
  {
    uint64_t v4 = result % v3;
    if ((v4 & 0x8000000000000000) == 0) {
      return *(unsigned __int8 *)(a3 + v4 + 32) ^ a2;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_252636754()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A9C0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A9B8);
  uint64_t v43 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  BOOL v7 = (char *)v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B22A9D0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AA20);
  sub_252675810();
  id v12 = objc_msgSend(v0, sel_allHeaderFields);
  uint64_t v13 = sub_252675AE0();

  strcpy((char *)v47, "Cache-Control");
  HIWORD(v47[1]) = -4864;
  sub_252675F50();
  if (*(void *)(v13 + 16) && (unint64_t v14 = sub_25264C490((uint64_t)&v48), (v15 & 1) != 0))
  {
    sub_252638088(*(void *)(v13 + 56) + 32 * v14, (uint64_t)&v52);
  }
  else
  {
    long long v52 = 0u;
    long long v53 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_252637ED0((uint64_t)&v48);
  if (*((void *)&v53 + 1))
  {
    if (swift_dynamicCast())
    {
      uint64_t v45 = v9;
      uint64_t v48 = v47[0];
      uint64_t v49 = v47[1];
      sub_252637F24();
      sub_252637F78();
      v44 = v11;
      uint64_t v46 = v8;
      sub_252675B30();
      swift_bridgeObjectRelease();
      uint64_t v16 = v43;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v4, 1, v5) == 1)
      {
        sub_252634810((uint64_t)v4, &qword_26B22A9C0);
        uint64_t v9 = v45;
        uint64_t v8 = v46;
        id v11 = v44;
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v7, v4, v5);
        swift_getKeyPath();
        sub_252675820();
        swift_release();
        uint64_t v32 = MEMORY[0x2533B7530](v48, v49, v50, v51);
        uint64_t v34 = v33;
        uint64_t v35 = swift_bridgeObjectRelease();
        *(void *)&long long v52 = 0;
        uint64_t v36 = MEMORY[0x270FA5388](v35);
        v42[-2] = &v52;
        uint64_t v9 = v45;
        if ((v34 & 0x1000000000000000) != 0 || !(v34 & 0x2000000000000000 | v32 & 0x1000000000000000))
        {
          sub_252675F90();
          swift_bridgeObjectRelease();
          id v11 = v44;
        }
        else
        {
          MEMORY[0x270FA5388](v36);
          v42[-2] = sub_252637FD4;
          v42[-1] = v37;
          id v11 = v44;
          if ((v34 & 0x2000000000000000) != 0)
          {
            uint64_t v48 = v32;
            uint64_t v49 = v34 & 0xFFFFFFFFFFFFFFLL;
            BOOL v41 = (v32 > 0x20u || ((0x100003E01uLL >> v32) & 1) == 0)
               && (uint64_t v40 = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0
               && *v40 == 0;
            LOBYTE(v47[0]) = v41;
            swift_bridgeObjectRelease();
          }
          else
          {
            if ((v32 & 0x1000000000000000) != 0)
            {
              uint64_t v38 = (v34 & 0xFFFFFFFFFFFFFFFLL) + 32;
              uint64_t v39 = v32 & 0xFFFFFFFFFFFFLL;
            }
            else
            {
              uint64_t v38 = sub_252675FD0();
            }
            LOBYTE(v47[0]) = sub_252637E2C(v38, v39, (void (*)(uint64_t *__return_ptr))sub_252638044) & 1;
            swift_bridgeObjectRelease();
          }
        }
        uint64_t v8 = v46;
        if (v47[0])
        {
          uint64_t v30 = v52;
          (*(void (**)(char *, uint64_t))(v43 + 8))(v7, v5);
          (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
          return v30;
        }
        (*(void (**)(char *, uint64_t))(v43 + 8))(v7, v5);
      }
    }
  }
  else
  {
    sub_252634810((uint64_t)&v52, qword_26B22AA80);
  }
  if (qword_26B22A9E0 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_2526759F0();
  __swift_project_value_buffer(v17, (uint64_t)qword_26B22B6D8);
  id v18 = sub_2526759D0();
  os_log_type_t v19 = sub_252675E00();
  if (os_log_type_enabled(v18, v19))
  {
    id v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v20 = 0;
    _os_log_impl(&dword_25262F000, v18, v19, "Unable to generate max age value based on response.", v20, 2u);
    MEMORY[0x2533B8110](v20, -1, -1);
  }

  id v21 = v1;
  uint64_t v22 = sub_2526759D0();
  os_log_type_t v23 = sub_252675E00();
  if (os_log_type_enabled(v22, v23))
  {
    v44 = v11;
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v48 = v43;
    *(_DWORD *)uint64_t v24 = 136380675;
    v42[1] = v24 + 4;
    id v25 = objc_msgSend(v21, sel_allHeaderFields);
    uint64_t v45 = v9;
    uint64_t v46 = v8;
    sub_252675AE0();

    uint64_t v26 = sub_252675AF0();
    unint64_t v28 = v27;
    swift_bridgeObjectRelease();
    *(void *)&long long v52 = sub_2526669DC(v26, v28, &v48);
    sub_252675EA0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25262F000, v22, v23, "%{private}s", v24, 0xCu);
    uint64_t v29 = v43;
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v29, -1, -1);
    MEMORY[0x2533B8110](v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v46);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return 0;
}

uint64_t sub_252636F90@<X0>(uint64_t a1@<X8>)
{
  sub_252636754();
  if (v2)
  {
    if (qword_26B22A9E0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_2526759F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_26B22B6D8);
    uint64_t v9 = sub_2526759D0();
    os_log_type_t v10 = sub_252675E00();
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_25262F000, v9, v10, "Unable to retrieve max age value from response.", v11, 2u);
      MEMORY[0x2533B8110](v11, -1, -1);
    }

    uint64_t v12 = sub_252675620();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v5 = v12;
    uint64_t v6 = a1;
    uint64_t v7 = 1;
  }
  else
  {
    sub_2526755C0();
    uint64_t v3 = sub_252675620();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
    uint64_t v5 = v3;
    uint64_t v6 = a1;
    uint64_t v7 = 0;
  }

  return v4(v6, v7, 1, v5);
}

uint64_t sub_252637100()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_allHeaderFields);
  uint64_t v3 = sub_252675AE0();

  sub_252675F50();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_25264C490((uint64_t)v21), (v5 & 1) != 0))
  {
    sub_252638088(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v22);
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_252637ED0((uint64_t)v21);
  if (*((void *)&v23 + 1))
  {
    if (swift_dynamicCast()) {
      return 1734440005;
    }
  }
  else
  {
    sub_252634810((uint64_t)&v22, qword_26B22AA80);
  }
  if (qword_26B22A9E0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_2526759F0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B22B6D8);
  uint64_t v8 = sub_2526759D0();
  os_log_type_t v9 = sub_252675E00();
  if (os_log_type_enabled(v8, v9))
  {
    os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    v21[0] = v11;
    *(_DWORD *)os_log_type_t v10 = 136315138;
    *(void *)&long long v22 = sub_2526669DC(1734440005, 0xE400000000000000, v21);
    sub_252675EA0();
    _os_log_impl(&dword_25262F000, v8, v9, "Unable to retrieve %s header from response.", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v11, -1, -1);
    MEMORY[0x2533B8110](v10, -1, -1);
  }

  id v12 = v1;
  uint64_t v13 = sub_2526759D0();
  os_log_type_t v14 = sub_252675E00();
  if (os_log_type_enabled(v13, v14))
  {
    char v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    v21[0] = v20;
    *(_DWORD *)char v15 = 136380675;
    id v16 = objc_msgSend(v12, sel_allHeaderFields);
    sub_252675AE0();

    uint64_t v17 = sub_252675AF0();
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    *(void *)&long long v22 = sub_2526669DC(v17, v19, v21);
    sub_252675EA0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25262F000, v13, v14, "%{private}s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v20, -1, -1);
    MEMORY[0x2533B8110](v15, -1, -1);
  }
  else
  {
  }
  return 0;
}

void sub_2526374E8(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  MEMORY[0x270FA5388](v3 - 8);
  char v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_252675620();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  os_log_type_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252636754();
  if ((v10 & 1) == 0)
  {
    uint64_t v11 = (void *)MEMORY[0x2533B7BC0]();
    sub_252637784(a1, (uint64_t)v5);
    if (v1)
    {
      __break(1u);
      return;
    }
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
      sub_252675590();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      return;
    }
    sub_252634810((uint64_t)v5, &qword_26B22AAB0);
  }
  if (qword_26B22A9E0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_2526759F0();
  __swift_project_value_buffer(v12, (uint64_t)qword_26B22B6D8);
  uint64_t v13 = sub_2526759D0();
  os_log_type_t v14 = sub_252675E00();
  if (os_log_type_enabled(v13, v14))
  {
    char v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v15 = 0;
    MEMORY[0x2533B8110](v15, -1, -1);
  }

  sub_252675610();
}

uint64_t sub_252637784@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v38 - v7;
  id v9 = objc_msgSend(a1, sel_allHeaderFields);
  uint64_t v10 = sub_252675AE0();

  uint64_t v42 = 1702125892;
  unint64_t v43 = 0xE400000000000000;
  sub_252675F50();
  if (*(void *)(v10 + 16) && (unint64_t v11 = sub_25264C490((uint64_t)v44), (v12 & 1) != 0))
  {
    sub_252638088(*(void *)(v10 + 56) + 32 * v11, (uint64_t)&v45);
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_252637ED0((uint64_t)v44);
  if (!*((void *)&v46 + 1))
  {
    uint64_t v17 = qword_26B22AA80;
    unint64_t v18 = (char *)&v45;
LABEL_13:
    sub_252634810((uint64_t)v18, v17);
    goto LABEL_14;
  }
  if (swift_dynamicCast())
  {
    id v13 = sub_2526413EC();
    os_log_type_t v14 = (void *)sub_252675B90();
    id v15 = objc_msgSend(v13, sel_dateFromString_, v14);

    if (v15)
    {
      sub_2526755F0();

      uint64_t v16 = sub_252675620();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 0, 1, v16);
    }
    else
    {
      uint64_t v16 = sub_252675620();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
    }
    sub_2526380E4((uint64_t)v6, (uint64_t)v8);
    swift_bridgeObjectRelease();
    sub_252675620();
    uint64_t v19 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v8, 1, v16) != 1)
    {
      uint64_t v37 = v41;
      (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v41, v8, v16);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v37, 0, 1, v16);
    }
    uint64_t v17 = &qword_26B22AAB0;
    unint64_t v18 = v8;
    goto LABEL_13;
  }
LABEL_14:
  if (qword_26B22A9E0 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_2526759F0();
  __swift_project_value_buffer(v20, (uint64_t)qword_26B22B6D8);
  id v21 = sub_2526759D0();
  os_log_type_t v22 = sub_252675E00();
  if (os_log_type_enabled(v21, v22))
  {
    long long v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    v44[0] = v24;
    *(_DWORD *)long long v23 = 136315138;
    *(void *)&long long v45 = sub_2526669DC(1702125892, 0xE400000000000000, v44);
    sub_252675EA0();
    _os_log_impl(&dword_25262F000, v21, v22, "Unable to retrieve %s header from response.", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v24, -1, -1);
    MEMORY[0x2533B8110](v23, -1, -1);
  }

  id v25 = a1;
  uint64_t v26 = sub_2526759D0();
  os_log_type_t v27 = sub_252675E00();
  if (os_log_type_enabled(v26, v27))
  {
    unint64_t v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    v44[0] = v40;
    *(_DWORD *)unint64_t v28 = 136380675;
    v38[1] = v28 + 4;
    uint64_t v39 = v28;
    id v29 = objc_msgSend(v25, sel_allHeaderFields);
    sub_252675AE0();

    uint64_t v30 = sub_252675AF0();
    unint64_t v32 = v31;
    swift_bridgeObjectRelease();
    *(void *)&long long v45 = sub_2526669DC(v30, v32, v44);
    sub_252675EA0();

    swift_bridgeObjectRelease();
    uint64_t v33 = v39;
    _os_log_impl(&dword_25262F000, v26, v27, "%{private}s", v39, 0xCu);
    uint64_t v34 = v40;
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v34, -1, -1);
    MEMORY[0x2533B8110](v33, -1, -1);
  }
  else
  {
  }
  uint64_t v35 = sub_252675620();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v41, 1, 1, v35);
}

unsigned char *sub_252637DC0@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  v7 = v6 && (unint64_t result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

uint64_t sub_252637E2C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

void *sub_252637E8C@<X0>(void *(*a1)(uint64_t *__return_ptr)@<X2>, unsigned char *a2@<X8>)
{
  unint64_t result = a1(&v5);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t sub_252637ED0(uint64_t a1)
{
  return a1;
}

unint64_t sub_252637F24()
{
  unint64_t result = qword_26B22AA00;
  if (!qword_26B22AA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22AA00);
  }
  return result;
}

unint64_t sub_252637F78()
{
  unint64_t result = qword_26B22A9C8;
  if (!qword_26B22A9C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26B22A9D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22A9C8);
  }
  return result;
}

unsigned char *sub_252637FD4@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  v7 = v6 && (unint64_t result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void *sub_252638044@<X0>(unsigned char *a1@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_252638088(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2526380E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25263814C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAD0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252675470();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2526554DC();
  if (v10 != 1)
  {
    uint64_t v11 = v9;
    swift_bridgeObjectRelease();
    if (v11)
    {
      sub_252665604((uint64_t)v4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
        sub_252675420();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        uint64_t v16 = 0;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a1, v16, 1, v5);
      }
      swift_bridgeObjectRelease();
      sub_252634810((uint64_t)v4, &qword_26B22AAD0);
    }
  }
  if (qword_26B22A9E0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_2526759F0();
  __swift_project_value_buffer(v12, (uint64_t)qword_26B22B6D8);
  id v13 = sub_2526759D0();
  os_log_type_t v14 = sub_252675E00();
  if (os_log_type_enabled(v13, v14))
  {
    id v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_25262F000, v13, v14, "Unable to compute API Path for energy windows.", v15, 2u);
    MEMORY[0x2533B8110](v15, -1, -1);
  }

  uint64_t v16 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a1, v16, 1, v5);
}

uint64_t sub_2526383E4@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v101 = a4;
  uint64_t v99 = a3;
  uint64_t v95 = a2;
  uint64_t v94 = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A938);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  v91 = (char *)&v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v92 = (char *)&v87 - v9;
  uint64_t v100 = sub_2526750B0();
  uint64_t v102 = *(void *)(v100 - 8);
  MEMORY[0x270FA5388](v100);
  uint64_t v93 = (char *)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAD0);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  os_log_type_t v14 = (char *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v96 = (uint64_t)&v87 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v87 - v17;
  uint64_t v19 = sub_252675470();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  id v90 = (char *)&v87 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  id v25 = (char *)&v87 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  unint64_t v97 = (char *)&v87 - v27;
  MEMORY[0x270FA5388](v26);
  id v29 = (char *)&v87 - v28;
  sub_25263814C((uint64_t)v18);
  uint64_t v30 = v20;
  unint64_t v31 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  if (v31(v18, 1, v19) == 1)
  {
    sub_252634810((uint64_t)v18, &qword_26B22AAD0);
    if (qword_26B22A9E0 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_2526759F0();
    __swift_project_value_buffer(v32, (uint64_t)qword_26B22B6D8);
    unint64_t v33 = v101;
    swift_bridgeObjectRetain_n();
    uint64_t v34 = sub_2526759D0();
    os_log_type_t v35 = sub_252675E00();
    BOOL v36 = os_log_type_enabled(v34, v35);
    uint64_t v37 = v102;
    if (v36)
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      v104[0] = v39;
      *(_DWORD *)uint64_t v38 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v103 = sub_2526669DC(v99, v33, v104);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v34, v35, "Request URL for EnergyWindows API not found | traceId: %s", v38, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v39, -1, -1);
      MEMORY[0x2533B8110](v38, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 56))(a5, 1, 1, v100);
  }
  else
  {
    uint64_t v89 = a5;
    uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
    v40(v29, v18, v19);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B22AA58);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_252676980;
    *(void *)(inited + 32) = 0x644964697267;
    *(void *)(inited + 40) = 0xE600000000000000;
    *(void *)(inited + 48) = v94;
    *(void *)(inited + 56) = v95;
    swift_bridgeObjectRetain();
    uint64_t v98 = v30;
    uint64_t v95 = v29;
    sub_252675400();
    sub_252675450();
    unsigned int v42 = v31(v14, 1, v19);
    unint64_t v43 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v31;
    uint64_t v88 = (void (*)(char *, uint64_t, uint64_t))v40;
    if (v42 == 1)
    {
      sub_252634810((uint64_t)v14, &qword_26B22AAD0);
      uint64_t v44 = v98;
      uint64_t v45 = v96;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v98 + 56))(v96, 1, 1, v19);
    }
    else
    {
      v40(v25, v14, v19);
      uint64_t v45 = v96;
      sub_25265A510(inited, 1, 0, v96);
      unint64_t v43 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v31;
      uint64_t v44 = v98;
      (*(void (**)(char *, uint64_t))(v98 + 8))(v25, v19);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v43(v45, 1, v19) == 1)
    {
      uint64_t v96 = v19;
      sub_252634810(v45, &qword_26B22AAD0);
      uint64_t v47 = v100;
      if (qword_26B22A9E0 != -1) {
        swift_once();
      }
      uint64_t v48 = sub_2526759F0();
      __swift_project_value_buffer(v48, (uint64_t)qword_26B22B6D8);
      unint64_t v49 = v101;
      swift_bridgeObjectRetain_n();
      uint64_t v50 = sub_2526759D0();
      os_log_type_t v51 = sub_252675E00();
      BOOL v52 = os_log_type_enabled(v50, v51);
      uint64_t v53 = v89;
      if (v52)
      {
        uint64_t v54 = (uint8_t *)swift_slowAlloc();
        uint64_t v55 = v47;
        uint64_t v56 = swift_slowAlloc();
        v104[0] = v56;
        *(_DWORD *)uint64_t v54 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v103 = sub_2526669DC(v99, v49, v104);
        sub_252675EA0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25262F000, v50, v51, "Unable to create Energy Interval URL with required query parameters | traceId: %s", v54, 0xCu);
        swift_arrayDestroy();
        uint64_t v57 = v56;
        uint64_t v47 = v55;
        MEMORY[0x2533B8110](v57, -1, -1);
        MEMORY[0x2533B8110](v54, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      (*(void (**)(char *, uint64_t))(v98 + 8))(v95, v96);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v102 + 56))(v53, 1, 1, v47);
    }
    else
    {
      uint64_t v58 = v97;
      v88(v97, v45, v19);
      (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v90, v58, v19);
      uint64_t v59 = v93;
      sub_252675060();
      sub_252675020();
      uint64_t v60 = sub_25263CDD0();
      uint64_t v61 = v102;
      if (v60)
      {
        uint64_t v62 = v89;
        uint64_t v63 = v100;
        uint64_t v64 = (uint64_t)v91;
        if (qword_26B22A9A8 != -1) {
          uint64_t v60 = swift_once();
        }
        MEMORY[0x270FA5388](v60);
        *(&v87 - 2) = v68;
        uint64_t v66 = &unk_2702B7440;
        unint64_t v67 = sub_252639234;
      }
      else
      {
        uint64_t v62 = v89;
        uint64_t v63 = v100;
        uint64_t v64 = (uint64_t)v91;
        if (qword_26B22A9A8 != -1) {
          uint64_t v60 = swift_once();
        }
        MEMORY[0x270FA5388](v60);
        *(&v87 - 2) = v65;
        uint64_t v66 = &unk_2702B7480;
        unint64_t v67 = sub_25263922C;
      }
      sub_252667044((uint64_t)v66, (uint64_t (*)(uint64_t, void))v67);
      unint64_t v69 = sub_252675C20();
      unint64_t v71 = v70;
      swift_bridgeObjectRelease();
      sub_25263CDD0();
      sub_252642044(v69, v71, 49, 0xE100000000000000, v64);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v72 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48);
      if (v72(v64, 1, v63) == 1)
      {
        sub_252634810(v64, &qword_26B22A938);
        uint64_t v73 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v61 + 56);
        uint64_t v74 = (uint64_t)v92;
        v73(v92, 1, 1, v63);
      }
      else
      {
        uint64_t v74 = (uint64_t)v92;
        (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v92, v64, v63);
        sub_252675080();
        sub_252675080();
        uint64_t v75 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
        v75(v64, v63);
        uint64_t v73 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v61 + 56);
        v73((char *)v74, 0, 1, v63);
        if (v72(v74, 1, v63) != 1)
        {
          uint64_t v85 = v89;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 32))(v89, v74, v63);
          sub_2526750A0();
          v75((uint64_t)v93, v63);
          uint64_t v86 = *(void (**)(char *, uint64_t))(v98 + 8);
          v86(v97, v19);
          v86(v95, v19);
          return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v73)(v85, 0, 1, v63);
        }
        uint64_t v59 = v93;
        uint64_t v62 = v89;
      }
      uint64_t v96 = v19;
      sub_252634810(v74, &qword_26B22A938);
      if (qword_26B22A9E0 != -1) {
        swift_once();
      }
      uint64_t v76 = sub_2526759F0();
      __swift_project_value_buffer(v76, (uint64_t)qword_26B22B6D8);
      unint64_t v77 = v101;
      swift_bridgeObjectRetain_n();
      uint64_t v78 = sub_2526759D0();
      os_log_type_t v79 = sub_252675E00();
      if (os_log_type_enabled(v78, v79))
      {
        unint64_t v80 = (uint8_t *)swift_slowAlloc();
        uint64_t v81 = swift_slowAlloc();
        v104[0] = v81;
        *(_DWORD *)unint64_t v80 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v103 = sub_2526669DC(v99, v77, v104);
        uint64_t v82 = v102;
        sub_252675EA0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25262F000, v78, v79, "Unable to create signed Energy Interval request | traceId: %s", v80, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2533B8110](v81, -1, -1);
        MEMORY[0x2533B8110](v80, -1, -1);

        (*(void (**)(char *, uint64_t))(v82 + 8))(v93, v63);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        (*(void (**)(char *, uint64_t))(v61 + 8))(v59, v63);
      }
      int v83 = *(void (**)(char *, uint64_t))(v98 + 8);
      uint64_t v84 = v96;
      v83(v97, v96);
      v83(v95, v84);
      return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v73)(v62, 1, 1, v63);
    }
  }
}

uint64_t sub_2526391F8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for EnergyWindowsRequest()
{
  return self;
}

uint64_t sub_25263922C(uint64_t a1, unsigned int a2)
{
  return sub_252636728(a1, a2, *(void *)(v2 + 16));
}

uint64_t GridLookupError.hash(into:)()
{
  return sub_2526761C0();
}

BOOL static GridLookupError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t GridLookupError.hashValue.getter()
{
  return sub_2526761D0();
}

unint64_t sub_2526392C4()
{
  unint64_t result = qword_269C12668;
  if (!qword_269C12668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12668);
  }
  return result;
}

BOOL sub_252639318(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t getEnumTagSinglePayload for GridLookupError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GridLookupError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252639488);
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

unsigned char *sub_2526394B0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GridLookupError()
{
  return &type metadata for GridLookupError;
}

uint64_t sub_2526394C8(uint64_t a1, double a2, double a3)
{
  *(void *)(v3 + 760) = a1;
  *(double *)(v3 + 752) = a3;
  *(double *)(v3 + 744) = a2;
  uint64_t v4 = sub_252675470();
  *(void *)(v3 + 768) = v4;
  *(void *)(v3 + 776) = *(void *)(v4 - 8);
  *(void *)(v3 + 784) = swift_task_alloc();
  *(void *)(v3 + 792) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAD0);
  *(void *)(v3 + 800) = swift_task_alloc();
  *(void *)(v3 + 808) = swift_task_alloc();
  *(void *)(v3 + 816) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  *(void *)(v3 + 824) = swift_task_alloc();
  uint64_t v5 = sub_252675620();
  *(void *)(v3 + 832) = v5;
  *(void *)(v3 + 840) = *(void *)(v5 - 8);
  *(void *)(v3 + 848) = swift_task_alloc();
  *(void *)(v3 + 856) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2526396B4, 0, 0);
}

uint64_t sub_2526396B4()
{
  uint64_t v136 = v0;
  uint64_t v135 = *MEMORY[0x263EF8340];
  double v1 = *(double *)(v0 + 752);
  double v2 = *(double *)(v0 + 744);
  *(void *)(v0 + 728) = 0;
  MEMORY[0x2533B8120](v0 + 728, 8);
  uint64_t v3 = *(void *)(v0 + 728);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB88);
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = MEMORY[0x263F8E970];
  *(_OWORD *)(v4 + 16) = xmmword_252676980;
  uint64_t v6 = MEMORY[0x263F8E9C0];
  *(void *)(v4 + 56) = v5;
  *(void *)(v4 + 64) = v6;
  *(void *)(v4 + 32) = v3;
  uint64_t v7 = sub_252675BD0();
  unint64_t v9 = v8;
  uint64_t v130 = v7;
  *(void *)(v0 + 864) = v7;
  *(void *)(v0 + 872) = v8;
  type metadata accessor for Geohash();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = 0;
  *(void *)(inited + 24) = 0;
  uint64_t v11 = sub_25264A868(12, v2, v1);
  unint64_t v13 = v12;
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_25264D018(2, v11, v13, v14);
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = MEMORY[0x2533B7530](v15, v17, v19, v21);
  uint64_t v24 = v23;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 880) = v22;
  *(void *)(v0 + 888) = v24;
  if (qword_26B22A6B0 != -1) {
    swift_once();
  }
  uint64_t v131 = qword_26B22B708;
  uint64_t v132 = unk_26B22B710;
  swift_bridgeObjectRetain();
  sub_25263CB4C();
  sub_252675C70();
  swift_bridgeObjectRelease();
  sub_252675C70();
  sub_252675C70();
  *(void *)(v0 + 480) = v22;
  *(void *)(v0 + 488) = v24;
  *(_OWORD *)(v0 + 496) = 0u;
  *(_OWORD *)(v0 + 512) = 0u;
  *(unsigned char *)(v0 + 944) = 1;
  id v25 = self;
  swift_bridgeObjectRetain();
  id v26 = objc_msgSend(v25, sel_defaultManager);
  uint64_t v27 = (void *)sub_252675B90();
  swift_bridgeObjectRelease();
  unsigned int v28 = objc_msgSend(v26, sel_fileExistsAtPath_isDirectory_, v27, v0 + 944);

  if (!v28)
  {
    swift_bridgeObjectRelease();
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v52 = sub_2526759F0();
    __swift_project_value_buffer(v52, (uint64_t)qword_26B22B718);
    swift_bridgeObjectRetain_n();
    uint64_t v53 = sub_2526759D0();
    os_log_type_t v54 = sub_252675E00();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v55 = (uint8_t *)swift_slowAlloc();
      uint64_t v56 = swift_slowAlloc();
      uint64_t v131 = v56;
      *(_DWORD *)uint64_t v55 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 704) = sub_2526669DC(v130, v9, &v131);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v53, v54, "Unable to find GeoHash 2 folder on disk. Proceed to fetch new file. | traceId: %s", v55, 0xCu);
      char v57 = 1;
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v56, -1, -1);
      MEMORY[0x2533B8110](v55, -1, -1);

      uint64_t v58 = 0;
      uint64_t v59 = 0;
LABEL_25:
      *(unsigned char *)(v0 + 945) = v57;
      *(void *)(v0 + 904) = v59;
      *(void *)(v0 + 896) = v58;
      uint64_t v75 = dword_269C12838;
      uint64_t v76 = (void *)swift_task_alloc();
      *(void *)(v0 + 912) = v76;
      *uint64_t v76 = v0;
      v76[1] = sub_25263AA98;
      uint64_t v77 = *(void *)(v0 + 760);
      return ((uint64_t (*)(uint64_t))((char *)&dword_269C12838 + v75))(v77);
    }
LABEL_24:
    swift_bridgeObjectRelease_n();

    uint64_t v58 = 0;
    uint64_t v59 = 0;
    char v57 = 1;
    goto LABEL_25;
  }
  sub_252636600();
  id v29 = (__CFString *)sub_252675B90();
  uint64_t v30 = (__CFString *)sub_252675B90();
  CFPropertyListRef v31 = CFPreferencesCopyAppValue(v29, v30);

  swift_bridgeObjectRelease();
  uint64_t v32 = *(void *)(v0 + 840);
  uint64_t v33 = *(void *)(v0 + 832);
  uint64_t v34 = *(void *)(v0 + 824);
  if (!v31)
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(v32 + 56))(*(void *)(v0 + 824), 1, 1, *(void *)(v0 + 832));
    goto LABEL_16;
  }
  *(void *)(v0 + 736) = v31;
  int v35 = swift_dynamicCast();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v32 + 56))(v34, v35 ^ 1u, 1, v33);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v32 + 48))(v34, 1, v33) == 1)
  {
LABEL_16:
    sub_252634810(*(void *)(v0 + 824), &qword_26B22AAB0);
    goto LABEL_17;
  }
  uint64_t v36 = *(void *)(v0 + 848);
  uint64_t v37 = *(void *)(v0 + 840);
  uint64_t v38 = *(void *)(v0 + 832);
  (*(void (**)(void, void, uint64_t))(v37 + 32))(*(void *)(v0 + 856), *(void *)(v0 + 824), v38);
  sub_252675600();
  char v39 = sub_2526755B0();
  uint64_t v40 = v38;
  uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
  v41(v36, v40);
  if ((v39 & 1) == 0)
  {
    v41(*(void *)(v0 + 856), *(void *)(v0 + 832));
LABEL_17:
    sub_252636510();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v60 = (__CFString *)sub_252675B90();
    uint64_t v61 = (__CFString *)sub_252675B90();
    CFPropertyListRef v62 = CFPreferencesCopyAppValue(v60, v61);

    swift_bridgeObjectRelease();
    if (v62)
    {
      *(void *)(v0 + 720) = v62;
      if (swift_dynamicCast())
      {
        char v57 = 0;
        uint64_t v58 = *(void *)(v0 + 560);
        uint64_t v59 = *(void *)(v0 + 568);
        goto LABEL_25;
      }
    }
    uint64_t v63 = MEMORY[0x263F8D310];
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A730);
    uint64_t v64 = swift_allocObject();
    *(_OWORD *)(v64 + 16) = xmmword_252676980;
    *(void *)(v64 + 32) = 0x64496563617274;
    *(void *)(v64 + 40) = 0xE700000000000000;
    *(void *)(v64 + 72) = v63;
    *(void *)(v64 + 48) = v130;
    *(void *)(v64 + 56) = v9;
    swift_bridgeObjectRetain();
    unint64_t v65 = sub_252655260(v64);
    id v66 = objc_msgSend(self, sel_processInfo);
    id v67 = objc_msgSend(v66, sel_processName);

    uint64_t v68 = sub_252675BA0();
    uint64_t v70 = v69;

    LOWORD(v131) = 514;
    BYTE2(v131) = 6;
    uint64_t v132 = v68;
    uint64_t v133 = v70;
    unint64_t v134 = v65;
    static AutoBugCaptureManager.sendIssue(_:)((char *)&v131);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v71 = sub_2526759F0();
    __swift_project_value_buffer(v71, (uint64_t)qword_26B22B718);
    swift_bridgeObjectRetain_n();
    uint64_t v53 = sub_2526759D0();
    os_log_type_t v72 = sub_252675E00();
    if (os_log_type_enabled(v53, v72))
    {
      uint64_t v73 = (uint8_t *)swift_slowAlloc();
      uint64_t v74 = swift_slowAlloc();
      uint64_t v131 = v74;
      *(_DWORD *)uint64_t v73 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 712) = sub_2526669DC(v130, v9, &v131);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v53, v72, "Geohash folder exist, but no ETag for geohash stored in disk. | traceId: %s", v73, 0xCu);
      char v57 = 1;
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v74, -1, -1);
      MEMORY[0x2533B8110](v73, -1, -1);

      uint64_t v58 = 0;
      uint64_t v59 = 0;
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v42 = 0x26B22A000uLL;
  if (qword_26B22A6C0 != -1) {
    swift_once();
  }
  uint64_t v43 = sub_2526759F0();
  __swift_project_value_buffer(v43, (uint64_t)qword_26B22B718);
  swift_bridgeObjectRetain_n();
  uint64_t v44 = sub_2526759D0();
  os_log_type_t v45 = sub_252675E20();
  BOOL v46 = os_log_type_enabled(v44, v45);
  uint64_t v47 = *(void *)(v0 + 856);
  uint64_t v129 = *(void *)(v0 + 832);
  if (v46)
  {
    uint64_t v128 = v43;
    uint64_t v48 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    uint64_t v131 = v49;
    *(_DWORD *)uint64_t v48 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 688) = sub_2526669DC(v130, v9, &v131);
    sub_252675EA0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25262F000, v44, v45, "Geohash folder exist, and valid. Use local geohash tiles. Skipping fetching | traceId: %s", v48, 0xCu);
    swift_arrayDestroy();
    uint64_t v50 = v49;
    unint64_t v42 = 0x26B22A000;
    MEMORY[0x2533B8110](v50, -1, -1);
    os_log_type_t v51 = v48;
    uint64_t v43 = v128;
    MEMORY[0x2533B8110](v51, -1, -1);

    v41(v47, v129);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v41(v47, v129);
  }
  uint64_t v79 = sub_252649DE8();
  if (v80)
  {
    uint64_t v81 = v80;
    uint64_t v82 = v79;
LABEL_32:
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    int v83 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    return v83(v82, v81);
  }
  uint64_t v84 = *(void *)(v0 + 800);
  uint64_t v85 = *(void *)(v0 + 776);
  uint64_t v86 = *(void *)(v0 + 768);
  sub_2526529B0(v84, *(double *)(v0 + 744), *(double *)(v0 + 752));
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v85 + 48))(v84, 1, v86) == 1)
  {
    sub_252634810(*(void *)(v0 + 800), &qword_26B22AAD0);
    if (*(void *)(v42 + 1728) != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v43, (uint64_t)qword_26B22B718);
    swift_bridgeObjectRetain_n();
    uint64_t v87 = sub_2526759D0();
    os_log_type_t v88 = sub_252675DF0();
    BOOL v89 = os_log_type_enabled(v87, v88);
    unint64_t v90 = *(void *)(v0 + 872);
    if (v89)
    {
      uint64_t v91 = *(void *)(v0 + 864);
      uint64_t v92 = *(void *)(v0 + 752);
      uint64_t v93 = *(void *)(v0 + 744);
      uint64_t v94 = swift_slowAlloc();
      uint64_t v95 = swift_slowAlloc();
      uint64_t v131 = v95;
      *(_DWORD *)uint64_t v94 = 134218498;
      *(void *)(v0 + 624) = v93;
      sub_252675EA0();
      *(_WORD *)(v94 + 12) = 2048;
      *(void *)(v0 + 632) = v92;
      sub_252675EA0();
      *(_WORD *)(v94 + 22) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 640) = sub_2526669DC(v91, v90, &v131);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v87, v88, "Unable to locate matching geohash tile for coordinate %f:%f)\n| traceId: %s", (uint8_t *)v94, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v95, -1, -1);
      MEMORY[0x2533B8110](v94, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    swift_bridgeObjectRetain();
    uint64_t v100 = sub_2526759D0();
    os_log_type_t v101 = sub_252675E00();
    BOOL v102 = os_log_type_enabled(v100, v101);
    unint64_t v103 = *(void *)(v0 + 872);
    if (v102)
    {
      uint64_t v104 = *(void *)(v0 + 864);
      v105 = (uint8_t *)swift_slowAlloc();
      uint64_t v106 = swift_slowAlloc();
      uint64_t v131 = v106;
      *(_DWORD *)v105 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 616) = sub_2526669DC(v104, v103, &v131);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v100, v101, "Returning no grid information. This could be intentional as the region is not supported\n| traceId: %s", v105, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v106, -1, -1);
      MEMORY[0x2533B8110](v105, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    sub_25263C874();
    swift_allocError();
    *uint64_t v107 = 2;
    swift_willThrow();
  }
  else
  {
    CLLocationDegrees v96 = *(double *)(v0 + 752);
    CLLocationDegrees v97 = *(double *)(v0 + 744);
    (*(void (**)(void, void, void))(*(void *)(v0 + 776) + 32))(*(void *)(v0 + 784), *(void *)(v0 + 800), *(void *)(v0 + 768));
    uint64_t v98 = sub_252653BB8(v97, v96);
    uint64_t v81 = v99;
    sub_25264A0BC(v98, v99);
    if (v81)
    {
      uint64_t v82 = v98;
      (*(void (**)(void, void))(*(void *)(v0 + 776) + 8))(*(void *)(v0 + 784), *(void *)(v0 + 768));
      goto LABEL_32;
    }
    if (*(void *)(v42 + 1728) != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v43, (uint64_t)qword_26B22B718);
    swift_bridgeObjectRetain_n();
    v108 = sub_2526759D0();
    os_log_type_t v109 = sub_252675E00();
    BOOL v110 = os_log_type_enabled(v108, v109);
    unint64_t v111 = *(void *)(v0 + 872);
    if (v110)
    {
      uint64_t v112 = *(void *)(v0 + 864);
      v113 = (uint8_t *)swift_slowAlloc();
      uint64_t v114 = swift_slowAlloc();
      uint64_t v131 = v114;
      *(_DWORD *)v113 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 672) = sub_2526669DC(v112, v111, &v131);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v108, v109, "No Grid found for provided coordinates | traceId: %s", v113, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v114, -1, -1);
      MEMORY[0x2533B8110](v113, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    swift_bridgeObjectRetain();
    long long v115 = sub_2526759D0();
    os_log_type_t v116 = sub_252675DF0();
    BOOL v117 = os_log_type_enabled(v115, v116);
    unint64_t v118 = *(void *)(v0 + 872);
    if (v117)
    {
      uint64_t v119 = *(void *)(v0 + 864);
      uint64_t v120 = *(void *)(v0 + 752);
      uint64_t v121 = *(void *)(v0 + 744);
      uint64_t v122 = swift_slowAlloc();
      uint64_t v123 = swift_slowAlloc();
      uint64_t v131 = v123;
      *(_DWORD *)uint64_t v122 = 134218498;
      *(void *)(v0 + 648) = v121;
      sub_252675EA0();
      *(_WORD *)(v122 + 12) = 2048;
      *(void *)(v0 + 656) = v120;
      sub_252675EA0();
      *(_WORD *)(v122 + 22) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 664) = sub_2526669DC(v119, v118, &v131);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v115, v116, "Grid not found for coordinate %f:%f | traceId: %s", (uint8_t *)v122, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v123, -1, -1);
      MEMORY[0x2533B8110](v122, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v124 = *(void *)(v0 + 784);
    uint64_t v125 = *(void *)(v0 + 776);
    uint64_t v126 = *(void *)(v0 + 768);
    type metadata accessor for NetworkError(0);
    sub_25263C81C();
    swift_allocError();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v124, v126);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v127 = *(uint64_t (**)(void))(v0 + 8);
  return v127();
}

uint64_t sub_25263AA98()
{
  double v1 = (void *)*v0;
  double v2 = (void *)*v0;
  swift_task_dealloc();
  uint64_t v3 = (void *)swift_task_alloc();
  v1[115] = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_25263AC94;
  uint64_t v4 = v1[113];
  uint64_t v5 = v1[112];
  uint64_t v6 = v1[111];
  uint64_t v7 = v1[110];
  uint64_t v8 = v1[109];
  uint64_t v9 = v1[108];
  uint64_t v10 = v1[102];
  uint64_t v11 = v1[95];
  return sub_252646E8C(v10, v7, v6, v11, v5, v4, v9, v8);
}

uint64_t sub_25263AC94(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 928) = a1;
  *(void *)(v3 + 936) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_25263C710;
  }
  else
  {
    uint64_t v4 = sub_25263AE00;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_25263AE00()
{
  uint64_t v169 = v0;
  uint64_t v168 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(v0 + 928);
  if (!v1)
  {
    uint64_t v10 = *(void *)(v0 + 872);
    uint64_t v11 = *(void *)(v0 + 864);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A730);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_252676980;
    *(void *)(inited + 32) = 0x64496563617274;
    *(void *)(inited + 40) = 0xE700000000000000;
    *(void *)(inited + 72) = MEMORY[0x263F8D310];
    *(void *)(inited + 48) = v11;
    *(void *)(inited + 56) = v10;
    swift_bridgeObjectRetain();
    unint64_t v13 = sub_252655260(inited);
    id v14 = objc_msgSend(self, sel_processInfo);
    id v15 = objc_msgSend(v14, sel_processName);

    uint64_t v16 = sub_252675BA0();
    uint64_t v18 = v17;

    LOWORD(v164) = 258;
    BYTE2(v164) = 7;
    uint64_t v165 = v16;
    uint64_t v166 = v18;
    unint64_t v167 = v13;
    static AutoBugCaptureManager.sendIssue(_:)((char *)&v164);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_2526759F0();
    __swift_project_value_buffer(v19, (uint64_t)qword_26B22B718);
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_2526759D0();
    os_log_type_t v21 = sub_252675E00();
    BOOL v22 = os_log_type_enabled(v20, v21);
    unint64_t v23 = *(void *)(v0 + 872);
    if (v22)
    {
      uint64_t v24 = *(void *)(v0 + 864);
      id v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v164 = v26;
      *(_DWORD *)id v25 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 600) = sub_2526669DC(v24, v23, &v164);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v20, v21, "Unknown error occurred while fetching geohash tile from server. | traceId: %s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v26, -1, -1);
      MEMORY[0x2533B8110](v25, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v54 = *(void *)(v0 + 816);
    type metadata accessor for NetworkError(0);
    sub_25263C81C();
    swift_allocError();
    *uint64_t v55 = 2;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    goto LABEL_54;
  }
  id v2 = v1;
  id v3 = objc_msgSend(v2, sel_statusCode);
  swift_bridgeObjectRelease();
  if (v3 == (id)304)
  {
    if ((*(unsigned char *)(v0 + 945) & 1) != 0 || !*(void *)(v0 + 904))
    {
      uint64_t v61 = *(void *)(v0 + 872);
      uint64_t v62 = *(void *)(v0 + 864);
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A730);
      uint64_t v63 = swift_initStackObject();
      *(_OWORD *)(v63 + 16) = xmmword_252676970;
      *(void *)(v63 + 32) = 0x64496563617274;
      *(void *)(v63 + 40) = 0xE700000000000000;
      uint64_t v64 = MEMORY[0x263F8D310];
      *(void *)(v63 + 48) = v62;
      *(void *)(v63 + 56) = v61;
      *(void *)(v63 + 72) = v64;
      *(void *)(v63 + 80) = 0x737574617473;
      *(void *)(v63 + 88) = 0xE600000000000000;
      swift_bridgeObjectRetain();
      id v65 = objc_msgSend(v2, sel_statusCode);
      *(void *)(v63 + 120) = MEMORY[0x263F8D6C8];
      *(void *)(v63 + 96) = v65;
      unint64_t v66 = sub_252655260(v63);
      id v67 = objc_msgSend(self, sel_processInfo);
      id v68 = objc_msgSend(v67, sel_processName);

      uint64_t v69 = sub_252675BA0();
      uint64_t v71 = v70;

      LOWORD(v164) = 258;
      BYTE2(v164) = 9;
      uint64_t v165 = v69;
      uint64_t v166 = v71;
      unint64_t v167 = v66;
      static AutoBugCaptureManager.sendIssue(_:)((char *)&v164);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_26B22A6C0 != -1) {
        swift_once();
      }
      uint64_t v72 = sub_2526759F0();
      __swift_project_value_buffer(v72, (uint64_t)qword_26B22B718);
      swift_bridgeObjectRetain();
      uint64_t v73 = sub_2526759D0();
      os_log_type_t v74 = sub_252675E00();
      BOOL v75 = os_log_type_enabled(v73, v74);
      unint64_t v76 = *(void *)(v0 + 872);
      if (v75)
      {
        uint64_t v162 = *(void *)(v0 + 864);
        uint64_t v77 = (uint8_t *)swift_slowAlloc();
        id v158 = v2;
        uint64_t v78 = swift_slowAlloc();
        uint64_t v164 = v78;
        *(_DWORD *)uint64_t v77 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 608) = sub_2526669DC(v162, v76, &v164);
        sub_252675EA0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25262F000, v73, v74, "Error while trying to fetch new Geohash tile from server | traceId: %s", v77, 0xCu);
        swift_arrayDestroy();
        uint64_t v79 = v78;
        id v2 = v158;
        MEMORY[0x2533B8110](v79, -1, -1);
        MEMORY[0x2533B8110](v77, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      uint64_t v54 = *(void *)(v0 + 816);
      sub_25263C874();
      swift_allocError();
      unsigned char *v128 = 1;
      goto LABEL_53;
    }
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_2526759F0();
    __swift_project_value_buffer(v27, (uint64_t)qword_26B22B718);
    swift_bridgeObjectRetain_n();
    unsigned int v28 = sub_2526759D0();
    os_log_type_t v29 = sub_252675E20();
    BOOL v30 = os_log_type_enabled(v28, v29);
    unint64_t v31 = *(void *)(v0 + 872);
    if (v30)
    {
      uint64_t v161 = *(void *)(v0 + 864);
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v164 = v33;
      *(_DWORD *)uint64_t v32 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 680) = sub_2526669DC(v161, v31, &v164);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v28, v29, "Geohash file unmodified. Continue using locally stored geohash tile | traceId: %s", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v33, -1, -1);
      MEMORY[0x2533B8110](v32, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    sub_2526493F0((uint64_t)v2, *(void *)(v0 + 880), *(void *)(v0 + 888));
    swift_bridgeObjectRelease();
  }
  else
  {
    if (v3 != (id)200)
    {
      uint64_t v34 = *(void *)(v0 + 872);
      uint64_t v35 = *(void *)(v0 + 864);
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A730);
      uint64_t v36 = swift_initStackObject();
      *(_OWORD *)(v36 + 16) = xmmword_252676970;
      *(void *)(v36 + 32) = 0x64496563617274;
      *(void *)(v36 + 40) = 0xE700000000000000;
      uint64_t v37 = MEMORY[0x263F8D310];
      *(void *)(v36 + 48) = v35;
      *(void *)(v36 + 56) = v34;
      *(void *)(v36 + 72) = v37;
      *(void *)(v36 + 80) = 0x737574617473;
      *(void *)(v36 + 88) = 0xE600000000000000;
      swift_bridgeObjectRetain();
      id v38 = objc_msgSend(v2, sel_statusCode);
      *(void *)(v36 + 120) = MEMORY[0x263F8D6C8];
      *(void *)(v36 + 96) = v38;
      unint64_t v39 = sub_252655260(v36);
      id v40 = objc_msgSend(self, sel_processInfo);
      id v41 = objc_msgSend(v40, sel_processName);

      uint64_t v42 = sub_252675BA0();
      uint64_t v44 = v43;

      LOWORD(v164) = 258;
      BYTE2(v164) = 5;
      uint64_t v165 = v42;
      uint64_t v166 = v44;
      unint64_t v167 = v39;
      static AutoBugCaptureManager.sendIssue(_:)((char *)&v164);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_26B22A6C0 != -1) {
        swift_once();
      }
      uint64_t v45 = sub_2526759F0();
      __swift_project_value_buffer(v45, (uint64_t)qword_26B22B718);
      swift_bridgeObjectRetain_n();
      BOOL v46 = sub_2526759D0();
      os_log_type_t v47 = sub_252675E00();
      BOOL v48 = os_log_type_enabled(v46, v47);
      unint64_t v49 = *(void *)(v0 + 872);
      if (v48)
      {
        id v157 = v2;
        uint64_t v50 = *(void *)(v0 + 864);
        os_log_type_t v51 = (uint8_t *)swift_slowAlloc();
        uint64_t v52 = swift_slowAlloc();
        uint64_t v164 = v52;
        *(_DWORD *)os_log_type_t v51 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v53 = v50;
        id v2 = v157;
        *(void *)(v0 + 592) = sub_2526669DC(v53, v49, &v164);
        sub_252675EA0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25262F000, v46, v47, "Unknown error occurred while fetching geohash tile from server | traceId: %s", v51, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2533B8110](v52, -1, -1);
        MEMORY[0x2533B8110](v51, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      swift_bridgeObjectRetain();
      id v80 = v2;
      uint64_t v81 = sub_2526759D0();
      os_log_type_t v82 = sub_252675E00();
      BOOL v83 = os_log_type_enabled(v81, v82);
      unint64_t v84 = *(void *)(v0 + 872);
      if (v83)
      {
        uint64_t v163 = *(void *)(v0 + 864);
        uint64_t v85 = swift_slowAlloc();
        uint64_t v86 = swift_slowAlloc();
        uint64_t v164 = v86;
        *(_DWORD *)uint64_t v85 = 134218242;
        *(void *)(v0 + 576) = objc_msgSend(v80, sel_statusCode);
        sub_252675EA0();

        *(_WORD *)(v85 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 584) = sub_2526669DC(v163, v84, &v164);
        sub_252675EA0();
        unint64_t v87 = 0x26537F000;
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25262F000, v81, v82, "Status Code returned %ld | traceId %s", (uint8_t *)v85, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2533B8110](v86, -1, -1);
        MEMORY[0x2533B8110](v85, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        unint64_t v87 = 0x26537F000uLL;
      }
      uint64_t v54 = *(void *)(v0 + 816);
      type metadata accessor for NetworkError(0);
      sub_25263C81C();
      swift_allocError();
      *os_log_type_t v88 = [v80 *(SEL *)(v87 + 2648)];
      swift_storeEnumTagMultiPayload();
      swift_willThrow();

      goto LABEL_54;
    }
    uint64_t v4 = *(void *)(v0 + 808);
    uint64_t v5 = *(void *)(v0 + 776);
    uint64_t v6 = *(void *)(v0 + 768);
    sub_25263C8C8(*(void *)(v0 + 816), v4);
    int v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v4, 1, v6);
    uint64_t v8 = *(void *)(v0 + 888);
    if (v7 == 1)
    {
      uint64_t v9 = *(void *)(v0 + 808);
      swift_bridgeObjectRelease();
      sub_252634810(v9, &qword_26B22AAD0);
LABEL_45:
      uint64_t v108 = *(void *)(v0 + 872);
      uint64_t v109 = *(void *)(v0 + 864);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A730);
      uint64_t v110 = swift_initStackObject();
      *(_OWORD *)(v110 + 16) = xmmword_252676970;
      *(void *)(v110 + 32) = 0x64496563617274;
      *(void *)(v110 + 40) = 0xE700000000000000;
      uint64_t v111 = MEMORY[0x263F8D310];
      *(void *)(v110 + 48) = v109;
      *(void *)(v110 + 56) = v108;
      *(void *)(v110 + 72) = v111;
      *(void *)(v110 + 80) = 0x737574617473;
      *(void *)(v110 + 88) = 0xE600000000000000;
      swift_bridgeObjectRetain();
      id v112 = objc_msgSend(v2, sel_statusCode);
      *(void *)(v110 + 120) = MEMORY[0x263F8D6C8];
      *(void *)(v110 + 96) = v112;
      unint64_t v113 = sub_252655260(v110);
      id v114 = objc_msgSend(self, sel_processInfo);
      id v115 = objc_msgSend(v114, sel_processName);

      uint64_t v116 = sub_252675BA0();
      uint64_t v118 = v117;

      LOWORD(v164) = 514;
      BYTE2(v164) = 8;
      uint64_t v165 = v116;
      uint64_t v166 = v118;
      unint64_t v167 = v113;
      static AutoBugCaptureManager.sendIssue(_:)((char *)&v164);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_26B22A6C0 != -1) {
        swift_once();
      }
      uint64_t v119 = sub_2526759F0();
      __swift_project_value_buffer(v119, (uint64_t)qword_26B22B718);
      swift_bridgeObjectRetain();
      uint64_t v120 = sub_2526759D0();
      os_log_type_t v121 = sub_252675E00();
      BOOL v122 = os_log_type_enabled(v120, v121);
      unint64_t v123 = *(void *)(v0 + 872);
      if (v122)
      {
        uint64_t v124 = *(void *)(v0 + 864);
        uint64_t v125 = (uint8_t *)swift_slowAlloc();
        uint64_t v126 = swift_slowAlloc();
        uint64_t v164 = v126;
        *(_DWORD *)uint64_t v125 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 696) = sub_2526669DC(v124, v123, &v164);
        sub_252675EA0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25262F000, v120, v121, "Error while creating geoHash tiles. | traceId: %s", v125, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2533B8110](v126, -1, -1);
        MEMORY[0x2533B8110](v125, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      uint64_t v54 = *(void *)(v0 + 816);
      sub_25263C874();
      swift_allocError();
      unsigned char *v127 = 0;
LABEL_53:
      swift_willThrow();

LABEL_54:
      sub_252634810(v54, &qword_26B22AAD0);
LABEL_55:
      swift_willThrow();
LABEL_56:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v129 = *(uint64_t (**)(void))(v0 + 8);
      return v129();
    }
    uint64_t v56 = *(void *)(v0 + 880);
    char v57 = *(char **)(v0 + 792);
    (*(void (**)(char *, void, void))(*(void *)(v0 + 776) + 32))(v57, *(void *)(v0 + 808), *(void *)(v0 + 768));
    if ((sub_2526485D4(v57, v56, v8) & 1) == 0)
    {
      (*(void (**)(void, void))(*(void *)(v0 + 776) + 8))(*(void *)(v0 + 792), *(void *)(v0 + 768));
      swift_bridgeObjectRelease();
      goto LABEL_45;
    }
    uint64_t v58 = *(void *)(v0 + 792);
    uint64_t v59 = *(void *)(v0 + 776);
    uint64_t v60 = *(void *)(v0 + 768);
    sub_2526493F0((uint64_t)v2, *(void *)(v0 + 880), *(void *)(v0 + 888));

    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v58, v60);
  }
  sub_252634810(*(void *)(v0 + 816), &qword_26B22AAD0);
  uint64_t v89 = *(void *)(v0 + 800);
  uint64_t v90 = *(void *)(v0 + 776);
  uint64_t v91 = *(void *)(v0 + 768);
  sub_2526529B0(v89, *(double *)(v0 + 744), *(double *)(v0 + 752));
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v90 + 48))(v89, 1, v91) == 1)
  {
    sub_252634810(*(void *)(v0 + 800), &qword_26B22AAD0);
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v92 = sub_2526759F0();
    __swift_project_value_buffer(v92, (uint64_t)qword_26B22B718);
    swift_bridgeObjectRetain_n();
    uint64_t v93 = sub_2526759D0();
    os_log_type_t v94 = sub_252675DF0();
    BOOL v95 = os_log_type_enabled(v93, v94);
    unint64_t v96 = *(void *)(v0 + 872);
    if (v95)
    {
      uint64_t v159 = *(void *)(v0 + 864);
      uint64_t v97 = *(void *)(v0 + 752);
      uint64_t v98 = *(void *)(v0 + 744);
      uint64_t v99 = swift_slowAlloc();
      uint64_t v100 = swift_slowAlloc();
      uint64_t v164 = v100;
      *(_DWORD *)uint64_t v99 = 134218498;
      *(void *)(v0 + 624) = v98;
      sub_252675EA0();
      *(_WORD *)(v99 + 12) = 2048;
      *(void *)(v0 + 632) = v97;
      sub_252675EA0();
      *(_WORD *)(v99 + 22) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 640) = sub_2526669DC(v159, v96, &v164);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v93, v94, "Unable to locate matching geohash tile for coordinate %f:%f)\n| traceId: %s", (uint8_t *)v99, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v100, -1, -1);
      MEMORY[0x2533B8110](v99, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    swift_bridgeObjectRetain();
    uint64_t v130 = sub_2526759D0();
    os_log_type_t v131 = sub_252675E00();
    BOOL v132 = os_log_type_enabled(v130, v131);
    unint64_t v133 = *(void *)(v0 + 872);
    if (v132)
    {
      uint64_t v134 = *(void *)(v0 + 864);
      uint64_t v135 = (uint8_t *)swift_slowAlloc();
      uint64_t v136 = swift_slowAlloc();
      uint64_t v164 = v136;
      *(_DWORD *)uint64_t v135 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 616) = sub_2526669DC(v134, v133, &v164);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v130, v131, "Returning no grid information. This could be intentional as the region is not supported\n| traceId: %s", v135, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v136, -1, -1);
      MEMORY[0x2533B8110](v135, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    sub_25263C874();
    swift_allocError();
    *uint64_t v137 = 2;
    goto LABEL_55;
  }
  CLLocationDegrees v101 = *(double *)(v0 + 752);
  CLLocationDegrees v102 = *(double *)(v0 + 744);
  (*(void (**)(void, void, void))(*(void *)(v0 + 776) + 32))(*(void *)(v0 + 784), *(void *)(v0 + 800), *(void *)(v0 + 768));
  uint64_t v103 = sub_252653BB8(v102, v101);
  uint64_t v105 = v104;
  sub_25264A0BC(v103, v104);
  if (!v105)
  {
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v138 = sub_2526759F0();
    __swift_project_value_buffer(v138, (uint64_t)qword_26B22B718);
    swift_bridgeObjectRetain_n();
    uint64_t v139 = sub_2526759D0();
    os_log_type_t v140 = sub_252675E00();
    BOOL v141 = os_log_type_enabled(v139, v140);
    unint64_t v142 = *(void *)(v0 + 872);
    if (v141)
    {
      uint64_t v160 = *(void *)(v0 + 864);
      v143 = (uint8_t *)swift_slowAlloc();
      uint64_t v144 = swift_slowAlloc();
      uint64_t v164 = v144;
      *(_DWORD *)v143 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 672) = sub_2526669DC(v160, v142, &v164);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v139, v140, "No Grid found for provided coordinates | traceId: %s", v143, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v144, -1, -1);
      MEMORY[0x2533B8110](v143, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    swift_bridgeObjectRetain();
    v145 = sub_2526759D0();
    os_log_type_t v146 = sub_252675DF0();
    BOOL v147 = os_log_type_enabled(v145, v146);
    unint64_t v148 = *(void *)(v0 + 872);
    if (v147)
    {
      uint64_t v149 = *(void *)(v0 + 864);
      uint64_t v150 = *(void *)(v0 + 752);
      uint64_t v151 = *(void *)(v0 + 744);
      uint64_t v152 = swift_slowAlloc();
      uint64_t v153 = swift_slowAlloc();
      uint64_t v164 = v153;
      *(_DWORD *)uint64_t v152 = 134218498;
      *(void *)(v0 + 648) = v151;
      sub_252675EA0();
      *(_WORD *)(v152 + 12) = 2048;
      *(void *)(v0 + 656) = v150;
      sub_252675EA0();
      *(_WORD *)(v152 + 22) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 664) = sub_2526669DC(v149, v148, &v164);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v145, v146, "Grid not found for coordinate %f:%f | traceId: %s", (uint8_t *)v152, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v153, -1, -1);
      MEMORY[0x2533B8110](v152, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v154 = *(void *)(v0 + 784);
    uint64_t v155 = *(void *)(v0 + 776);
    uint64_t v156 = *(void *)(v0 + 768);
    type metadata accessor for NetworkError(0);
    sub_25263C81C();
    swift_allocError();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v155 + 8))(v154, v156);
    goto LABEL_56;
  }
  (*(void (**)(void, void))(*(void *)(v0 + 776) + 8))(*(void *)(v0 + 784), *(void *)(v0 + 768));
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v106 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v106(v103, v105);
}

uint64_t sub_25263C710()
{
  swift_willThrow();
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

unint64_t sub_25263C81C()
{
  unint64_t result = qword_269C12678;
  if (!qword_269C12678)
  {
    type metadata accessor for NetworkError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12678);
  }
  return result;
}

unint64_t sub_25263C874()
{
  unint64_t result = qword_269C12680;
  if (!qword_269C12680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269C12680);
  }
  return result;
}

uint64_t sub_25263C8C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25263C930()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFB210]), sel_init);
  type metadata accessor for AppleAccountManager();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v0;
  qword_26B22B6B8 = result;
  return result;
}

uint64_t sub_25263C984()
{
  uint64_t v1 = objc_msgSend(*(id *)(v0 + 16), sel_aa_primaryAppleAccount);
  if (!v1)
  {
    if (qword_26B22A9E0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_2526759F0();
    __swift_project_value_buffer(v6, (uint64_t)qword_26B22B6D8);
    id v2 = sub_2526759D0();
    os_log_type_t v7 = sub_252675E00();
    if (os_log_type_enabled(v2, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_25262F000, v2, v7, "Unable to retrieve User Primary Apple Account information", v8, 2u);
      MEMORY[0x2533B8110](v8, -1, -1);
    }
    goto LABEL_8;
  }
  id v2 = v1;
  id v3 = [v1 aa_personID];
  if (!v3)
  {
LABEL_8:

    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = sub_252675BA0();

  return v5;
}

uint64_t sub_25263CAC0()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AppleAccountManager()
{
  return self;
}

void sub_25263CB1C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 7759204;
  if (*v1) {
    uint64_t v2 = 1685025392;
  }
  unint64_t v3 = 0xE300000000000000;
  if (*v1) {
    unint64_t v3 = 0xE400000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

BOOL sub_25263CB4C()
{
  uint64_t v0 = (__CFString *)sub_252675B90();
  uint64_t v1 = (__CFString *)sub_252675B90();
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(v0, v1);

  if (!v2 || (swift_dynamicCast() & 1) == 0) {
    return 1;
  }
  uint64_t v4 = v12;
  unint64_t v3 = v13;
  if (qword_26B22A9F0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2526759F0();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B22B6F0);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_2526759D0();
  os_log_type_t v7 = sub_252675E20();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v12 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_2526669DC(v4, v3, &v12);
    sub_252675EA0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25262F000, v6, v7, "Environment override detected. Using user set env value : %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v9, -1, -1);
    MEMORY[0x2533B8110](v8, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v12 = v4;
  unint64_t v13 = v3;
  sub_25263647C();
  uint64_t v11 = sub_252675EE0();
  swift_bridgeObjectRelease();
  return v11 == 0;
}

uint64_t sub_25263CDD0()
{
  if (!os_variant_has_internal_diagnostics())
  {
LABEL_19:
    char v7 = sub_25263CB4C();
    return v7 & 1;
  }
  if (qword_26B22A9F0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2526759F0();
  __swift_project_value_buffer(v0, (uint64_t)qword_26B22B6F0);
  uint64_t v1 = sub_2526759D0();
  os_log_type_t v2 = sub_252675E20();
  if (os_log_type_enabled(v1, v2))
  {
    unint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v3 = 0;
    _os_log_impl(&dword_25262F000, v1, v2, "Internal build variant detected. Evaluating Server URL value for Environment information.", v3, 2u);
    MEMORY[0x2533B8110](v3, -1, -1);
  }

  uint64_t v4 = sub_252655930();
  if (!v5)
  {
    id v14 = sub_2526759D0();
    os_log_type_t v15 = sub_252675E00();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_25262F000, v14, v15, "Unable to retrieve server Base URL. Returning default value", v16, 2u);
      MEMORY[0x2533B8110](v16, -1, -1);
    }

    goto LABEL_19;
  }
  v18[0] = v4;
  v18[1] = v5;
  sub_25263647C();
  char v6 = sub_252675F00();
  swift_bridgeObjectRelease();
  char v7 = v6 ^ 1;
  uint64_t v8 = sub_2526759D0();
  os_log_type_t v9 = sub_252675DE0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    v18[0] = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    if (v6) {
      uint64_t v12 = 7759204;
    }
    else {
      uint64_t v12 = 1685025392;
    }
    if (v6) {
      unint64_t v13 = 0xE300000000000000;
    }
    else {
      unint64_t v13 = 0xE400000000000000;
    }
    sub_2526669DC(v12, v13, v18);
    sub_252675EA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25262F000, v8, v9, "%s env used for Internal calculation", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v11, -1, -1);
    MEMORY[0x2533B8110](v10, -1, -1);
  }

  return v7 & 1;
}

void sub_25263D0B8()
{
  BOOL v0 = sub_25263CB4C();
  if (v0) {
    uint64_t v1 = 1685025392;
  }
  else {
    uint64_t v1 = 7759204;
  }
  unint64_t v2 = 0xE400000000000000;
  if (v0) {
    unint64_t v3 = 0xE400000000000000;
  }
  else {
    unint64_t v3 = 0xE300000000000000;
  }
  char v4 = sub_25263CDD0();
  if (v4) {
    uint64_t v5 = 1685025392;
  }
  else {
    uint64_t v5 = 7759204;
  }
  if ((v4 & 1) == 0) {
    unint64_t v2 = 0xE300000000000000;
  }
  if (qword_26B22A9F0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2526759F0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B22B6F0);
  swift_bridgeObjectRetain();
  char v7 = sub_2526759D0();
  os_log_type_t v8 = sub_252675E20();
  if (os_log_type_enabled(v7, v8))
  {
    os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = v1;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = v10;
    *(_DWORD *)os_log_type_t v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_2526669DC(v5, v2, &v17);
    sub_252675EA0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25262F000, v7, v8, "Connected Server Environment : %s", v9, 0xCu);
    swift_arrayDestroy();
    uint64_t v11 = v10;
    uint64_t v1 = v16;
    MEMORY[0x2533B8110](v11, -1, -1);
    MEMORY[0x2533B8110](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_2526759D0();
  os_log_type_t v13 = sub_252675E20();
  if (os_log_type_enabled(v12, v13))
  {
    id v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v17 = v15;
    *(_DWORD *)id v14 = 136315138;
    swift_bridgeObjectRetain();
    sub_2526669DC(v1, v3, &v17);
    sub_252675EA0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25262F000, v12, v13, "Config Environment : %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v15, -1, -1);
    MEMORY[0x2533B8110](v14, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_25263D3B8()
{
  if (qword_26B22A9B0 != -1) {
    swift_once();
  }
  uint64_t result = sub_25263C984();
  qword_26B22B730 = result;
  *(void *)algn_26B22B738 = v1;
  return result;
}

unint64_t sub_25263D41C(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    unint64_t v3 = 0;
    MEMORY[0x2533B8120](&v3, 8);
    uint64_t result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      unint64_t v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          unint64_t v3 = 0;
          MEMORY[0x2533B8120](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

double sub_25263D4A8(int64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    goto LABEL_17;
  }
  long double v30 = 0.0;
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  if ((v7 & 0x1000000000000000) != 0 || !(a3 & 0x2000000000000000 | a2 & 0x1000000000000000))
  {
    swift_bridgeObjectRetain();
    sub_252675F90();
    swift_bridgeObjectRelease();
    if ((v29 & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_8;
  }
  MEMORY[0x270FA5388](v6);
  if ((a3 & 0x2000000000000000) != 0)
  {
    if (a2 <= 0x20u && ((1 << a2) & 0x100003E01) != 0)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v26 = (unsigned __int8 *)_swift_stdlib_strtod_clocale();
      if (v26)
      {
        int v27 = *v26;
        swift_bridgeObjectRelease();
        if (v27) {
          goto LABEL_17;
        }
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  if ((a2 & 0x1000000000000000) == 0) {
    goto LABEL_34;
  }
  uint64_t v8 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
  for (uint64_t i = a2 & 0xFFFFFFFFFFFFLL; ; uint64_t i = v28)
  {
    swift_bridgeObjectRetain();
    char v10 = sub_252637E2C(v8, i, (void (*)(uint64_t *__return_ptr))sub_25263D938);
    swift_bridgeObjectRelease();
    if (v10) {
      break;
    }
LABEL_17:
    if (qword_26B22A9E0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_2526759F0();
    __swift_project_value_buffer(v17, (uint64_t)qword_26B22B6D8);
    uint64_t v18 = sub_2526759D0();
    os_log_type_t v19 = sub_252675E00();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_25262F000, v18, v19, "Unable to retrieve User's DSID or convert to a required format. Generating random jitter value.", v20, 2u);
      MEMORY[0x2533B8110](v20, -1, -1);
    }

    if (a1 < 0)
    {
      __break(1u);
    }
    else if (a1)
    {
      int64_t v21 = sub_25263D41C(a1);
      BOOL v22 = sub_2526759D0();
      os_log_type_t v23 = sub_252675DF0();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v24 = 134217984;
        sub_252675EA0();
        _os_log_impl(&dword_25262F000, v22, v23, "Generated Jitter Value: %lds", v24, 0xCu);
        MEMORY[0x2533B8110](v24, -1, -1);
      }

      return (double)v21;
    }
    __break(1u);
LABEL_34:
    uint64_t v8 = sub_252675FD0();
  }
LABEL_8:
  double v11 = fmod(v30, (double)a1);
  if (qword_26B22A9E0 != -1) {
    swift_once();
  }
  double v12 = fabs(v11);
  uint64_t v13 = sub_2526759F0();
  __swift_project_value_buffer(v13, (uint64_t)qword_26B22B6D8);
  id v14 = sub_2526759D0();
  os_log_type_t v15 = sub_252675DF0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 134217984;
    sub_252675EA0();
    _os_log_impl(&dword_25262F000, v14, v15, "Generated Jitter Value: %fs", v16, 0xCu);
    MEMORY[0x2533B8110](v16, -1, -1);
  }

  return v12;
}

unsigned char *sub_25263D91C@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_252637DC0(a1, a2);
}

void *sub_25263D938@<X0>(unsigned char *a1@<X8>)
{
  return sub_252637E8C(*(void *(**)(uint64_t *__return_ptr))(v1 + 16), a1);
}

uint64_t sub_25263D954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[86] = a4;
  v4[85] = a3;
  v4[84] = a2;
  v4[83] = a1;
  v4[87] = type metadata accessor for NetworkError(0);
  v4[88] = swift_task_alloc();
  v4[89] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  v4[90] = swift_task_alloc();
  uint64_t v5 = sub_252675620();
  v4[91] = v5;
  v4[92] = *(void *)(v5 - 8);
  v4[93] = swift_task_alloc();
  v4[94] = swift_task_alloc();
  v4[95] = swift_task_alloc();
  v4[96] = swift_task_alloc();
  v4[97] = type metadata accessor for EnergyWindows(0);
  v4[98] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A938);
  v4[99] = swift_task_alloc();
  uint64_t v6 = sub_2526750B0();
  v4[100] = v6;
  v4[101] = *(void *)(v6 - 8);
  v4[102] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25263DB74, 0, 0);
}

uint64_t sub_25263DB74()
{
  v0[75] = 0;
  MEMORY[0x2533B8120](v0 + 75, 8);
  uint64_t v1 = v0[75];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB88);
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = MEMORY[0x263F8E970];
  *(_OWORD *)(v2 + 16) = xmmword_252676980;
  uint64_t v4 = MEMORY[0x263F8E9C0];
  *(void *)(v2 + 56) = v3;
  *(void *)(v2 + 64) = v4;
  *(void *)(v2 + 32) = v1;
  v0[103] = sub_252675BD0();
  v0[104] = v5;
  os_log_type_t v9 = (uint64_t (*)(uint64_t))((char *)&dword_269C12838 + dword_269C12838);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[105] = v6;
  void *v6 = v0;
  v6[1] = sub_25263DC88;
  uint64_t v7 = v0[86];
  return v9(v7);
}

uint64_t sub_25263DC88()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25263DD84, 0, 0);
}

uint64_t sub_25263DD84()
{
  unint64_t v31 = v0;
  unint64_t v1 = v0[104];
  uint64_t v2 = v0[103];
  uint64_t v3 = v0[101];
  uint64_t v4 = v0[100];
  uint64_t v5 = v0[99];
  uint64_t v6 = (char *)v0[85];
  uint64_t v7 = v0[84];
  type metadata accessor for EnergyWindowsRequest();
  swift_initStackObject();
  sub_2526383E4(v7, v6, v2, v1, v5);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v5, 1, v4) == 1)
  {
    uint64_t v8 = v0[104];
    uint64_t v9 = v0[103];
    sub_252634810(v0[99], &qword_26B22A938);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A730);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_252676980;
    *(void *)(inited + 32) = 0x64496563617274;
    *(void *)(inited + 40) = 0xE700000000000000;
    *(void *)(inited + 72) = MEMORY[0x263F8D310];
    *(void *)(inited + 48) = v9;
    *(void *)(inited + 56) = v8;
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_252655260(inited);
    id v12 = objc_msgSend(self, sel_processInfo);
    id v13 = objc_msgSend(v12, sel_processName);

    uint64_t v14 = sub_252675BA0();
    uint64_t v16 = v15;

    LOWORD(v30[0]) = 1;
    BYTE2(v30[0]) = 1;
    v30[1] = v14;
    v30[2] = v16;
    v30[3] = v11;
    static AutoBugCaptureManager.sendIssue(_:)((char *)v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26B22A9E0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_2526759F0();
    __swift_project_value_buffer(v17, (uint64_t)qword_26B22B6D8);
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_2526759D0();
    os_log_type_t v19 = sub_252675E00();
    BOOL v20 = os_log_type_enabled(v18, v19);
    unint64_t v21 = v0[104];
    if (v20)
    {
      uint64_t v22 = v0[103];
      os_log_type_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      v30[0] = v24;
      *(_DWORD *)os_log_type_t v23 = 136315138;
      swift_bridgeObjectRetain();
      v0[71] = sub_2526669DC(v22, v21, v30);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v18, v19, "Unable generate request URL for EnergyWindow Request | traceId: %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v24, -1, -1);
      MEMORY[0x2533B8110](v23, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    sub_25264071C((unint64_t *)&qword_269C12678, (void (*)(uint64_t))type metadata accessor for NetworkError);
    swift_allocError();
    unsigned char *v27 = 0;
    swift_storeEnumTagMultiPayload();
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
    swift_task_dealloc();
    uint64_t v28 = (uint64_t (*)(void))v0[1];
    return v28();
  }
  else
  {
    (*(void (**)(void, void, void))(v0[101] + 32))(v0[102], v0[99], v0[100]);
    id v25 = (void *)swift_task_alloc();
    v0[106] = v25;
    *id v25 = v0;
    v25[1] = sub_25263E260;
    uint64_t v26 = v0[102];
    return MEMORY[0x270EF1EB0](v26, 0);
  }
}

uint64_t sub_25263E260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  v5[107] = a1;
  v5[108] = a2;
  v5[109] = a3;
  v5[110] = v3;
  swift_task_dealloc();
  if (v3) {
    uint64_t v6 = sub_2526401DC;
  }
  else {
    uint64_t v6 = sub_25263E380;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

void sub_25263E380()
{
  uint64_t v246 = v0;
  uint64_t v1 = v0;
  self;
  uint64_t v2 = swift_dynamicCastObjCClass();
  uint64_t v3 = MEMORY[0x263F8D310];
  unint64_t v4 = 0x26537F000uLL;
  unint64_t v5 = 0x26537F000uLL;
  unint64_t v6 = 0x26B22A000uLL;
  if (!v2)
  {
    uint64_t v11 = *(void *)(v0 + 832);
    uint64_t v12 = *(void *)(v0 + 824);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A730);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_252676980;
    *(void *)(inited + 32) = 0x64496563617274;
    *(void *)(inited + 40) = 0xE700000000000000;
    *(void *)(inited + 72) = v3;
    *(void *)(inited + 48) = v12;
    *(void *)(inited + 56) = v11;
    swift_bridgeObjectRetain();
    unint64_t v14 = sub_252655260(inited);
    id v15 = objc_msgSend(self, sel_processInfo);
    id v16 = objc_msgSend(v15, sel_processName);

    uint64_t v17 = sub_252675BA0();
    uint64_t v19 = v18;

    LOWORD(v242) = 257;
    BYTE2(v242) = 2;
    uint64_t v243 = v17;
    uint64_t v244 = v19;
    unint64_t v245 = v14;
    static AutoBugCaptureManager.sendIssue(_:)((char *)&v242);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26B22A9E0 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_2526759F0();
    __swift_project_value_buffer(v20, (uint64_t)qword_26B22B6D8);
    swift_bridgeObjectRetain_n();
    unint64_t v21 = sub_2526759D0();
    os_log_type_t v22 = sub_252675E00();
    BOOL v23 = os_log_type_enabled(v21, v22);
    unint64_t v24 = *(void *)(v1 + 832);
    if (v23)
    {
      uint64_t v25 = *(void *)(v1 + 824);
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v242 = v27;
      *(_DWORD *)uint64_t v26 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v28 = v25;
      unint64_t v6 = 0x26B22A000;
      *(void *)(v1 + 528) = sub_2526669DC(v28, v24, &v242);
      unint64_t v4 = 0x26537F000uLL;
      uint64_t v3 = MEMORY[0x263F8D310];
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v21, v22, "Unable to process EnergyWindow Response | traceId: %s", v26, 0xCu);
      swift_arrayDestroy();
      uint64_t v29 = v27;
      unint64_t v5 = 0x26537F000;
      MEMORY[0x2533B8110](v29, -1, -1);
      MEMORY[0x2533B8110](v26, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v52 = *(void **)(v1 + 872);
    unint64_t v53 = *(void *)(v1 + 864);
    uint64_t v54 = *(void *)(v1 + 856);
    sub_25264071C((unint64_t *)&qword_269C12678, (void (*)(uint64_t))type metadata accessor for NetworkError);
    uint64_t v55 = swift_allocError();
    *uint64_t v56 = 2;
    swift_storeEnumTagMultiPayload();
    id v239 = (id)v55;
    swift_willThrow();

    sub_252636330(v54, v53);
    goto LABEL_39;
  }
  uint64_t v7 = (void *)v2;
  id v8 = *(id *)(v0 + 872);
  v230 = v7;
  if (objc_msgSend(v7, sel_statusCode) != (id)200)
  {
    uint64_t v30 = *(void *)(v0 + 832);
    uint64_t v31 = *(void *)(v0 + 824);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A730);
    uint64_t v32 = swift_initStackObject();
    *(_OWORD *)(v32 + 16) = xmmword_252676980;
    *(void *)(v32 + 32) = 0x64496563617274;
    *(void *)(v32 + 40) = 0xE700000000000000;
    *(void *)(v32 + 72) = MEMORY[0x263F8D310];
    *(void *)(v32 + 48) = v31;
    *(void *)(v32 + 56) = v30;
    swift_bridgeObjectRetain();
    unint64_t v33 = sub_252655260(v32);
    id v34 = objc_msgSend(self, sel_processInfo);
    id v35 = objc_msgSend(v34, sel_processName);

    uint64_t v36 = sub_252675BA0();
    uint64_t v38 = v37;

    LOWORD(v242) = 257;
    BYTE2(v242) = 4;
    uint64_t v243 = v36;
    uint64_t v244 = v38;
    unint64_t v245 = v33;
    static AutoBugCaptureManager.sendIssue(_:)((char *)&v242);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26B22A9E0 != -1) {
      swift_once();
    }
    unint64_t v39 = *(void **)(v0 + 872);
    uint64_t v40 = sub_2526759F0();
    __swift_project_value_buffer(v40, (uint64_t)qword_26B22B6D8);
    id v41 = v39;
    swift_bridgeObjectRetain_n();
    id v42 = v41;
    uint64_t v43 = sub_2526759D0();
    os_log_type_t v44 = sub_252675E00();
    BOOL v45 = os_log_type_enabled(v43, v44);
    BOOL v46 = *(void **)(v0 + 872);
    unint64_t v47 = *(void *)(v0 + 832);
    if (v45)
    {
      uint64_t v224 = *(void *)(v0 + 824);
      uint64_t v48 = swift_slowAlloc();
      log = v43;
      unint64_t v49 = (void *)swift_slowAlloc();
      id v240 = (id)swift_slowAlloc();
      uint64_t v242 = (uint64_t)v240;
      *(_DWORD *)uint64_t v48 = 138412546;
      uint64_t v50 = v230;
      *(void *)(v0 + 544) = v230;
      id v51 = v46;
      sub_252675EA0();
      *unint64_t v49 = v230;

      *(_WORD *)(v48 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 552) = sub_2526669DC(v224, v47, &v242);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, log, v44, "Unhandled response code received for EnergyWindow Request. %@ | traceId: %s", (uint8_t *)v48, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C12820);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v49, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v240, -1, -1);
      MEMORY[0x2533B8110](v48, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v50 = v230;
    }
    char v57 = *(void **)(v0 + 872);
    unint64_t v58 = *(void *)(v0 + 864);
    uint64_t v59 = *(void *)(v0 + 856);
    sub_25264071C((unint64_t *)&qword_269C12678, (void (*)(uint64_t))type metadata accessor for NetworkError);
    uint64_t v60 = swift_allocError();
    void *v61 = objc_msgSend(v50, sel_statusCode);
    swift_storeEnumTagMultiPayload();
    id v239 = (id)v60;
    swift_willThrow();

    sub_252636330(v59, v58);
    unint64_t v6 = 0x26B22A000;
    unint64_t v5 = 0x26537F000;
    unint64_t v4 = 0x26537F000;
    uint64_t v3 = MEMORY[0x263F8D310];
    goto LABEL_39;
  }
  uint64_t v9 = *(void **)(v0 + 880);
  sub_2526750E0();
  swift_allocObject();
  sub_2526750D0();
  sub_25264071C(&qword_26B22A998, (void (*)(uint64_t))type metadata accessor for EnergyWindows);
  uint64_t v10 = sub_2526750C0();
  id v239 = v9;
  if (v9)
  {
    swift_release();
    unint64_t v5 = 0x26537F000;
    unint64_t v4 = 0x26537F000;
    uint64_t v3 = MEMORY[0x263F8D310];
LABEL_28:
    *(void *)(v1 + 560) = v239;
    id v98 = v239;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C12690);
    if (swift_dynamicCast())
    {
      uint64_t v99 = *(void **)(v1 + 872);
      unint64_t v100 = *(void *)(v1 + 864);
      uint64_t v101 = *(void *)(v1 + 856);
      sub_252640764(*(void *)(v1 + 704), type metadata accessor for NetworkError);
      swift_willThrow();

      sub_252636330(v101, v100);
    }
    else
    {
      uint64_t v102 = *(void *)(v1 + 832);
      uint64_t v103 = *(void *)(v1 + 824);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A730);
      uint64_t v104 = swift_initStackObject();
      *(_OWORD *)(v104 + 16) = xmmword_252676980;
      *(void *)(v104 + 32) = 0x64496563617274;
      *(void *)(v104 + 40) = 0xE700000000000000;
      *(void *)(v104 + 72) = v3;
      *(void *)(v104 + 48) = v103;
      *(void *)(v104 + 56) = v102;
      swift_bridgeObjectRetain();
      unint64_t v105 = sub_252655260(v104);
      id v106 = [self *(SEL *)(v4 + 2688)];
      id v107 = [v106 *(SEL *)(v5 + 2696)];

      uint64_t v108 = sub_252675BA0();
      uint64_t v110 = v109;

      LOWORD(v242) = 257;
      BYTE2(v242) = 3;
      uint64_t v243 = v108;
      uint64_t v244 = v110;
      unint64_t v245 = v105;
      static AutoBugCaptureManager.sendIssue(_:)((char *)&v242);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(void *)(v6 + 2528) != -1) {
        swift_once();
      }
      uint64_t v111 = sub_2526759F0();
      __swift_project_value_buffer(v111, (uint64_t)qword_26B22B6D8);
      swift_bridgeObjectRetain_n();
      id v112 = sub_2526759D0();
      os_log_type_t v113 = sub_252675E00();
      BOOL v114 = os_log_type_enabled(v112, v113);
      unint64_t v115 = *(void *)(v1 + 832);
      if (v114)
      {
        uint64_t v116 = *(void *)(v1 + 824);
        uint64_t v117 = (uint8_t *)swift_slowAlloc();
        uint64_t v118 = swift_slowAlloc();
        uint64_t v242 = v118;
        *(_DWORD *)uint64_t v117 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v1 + 592) = sub_2526669DC(v116, v115, &v242);
        sub_252675EA0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25262F000, v112, v113, "Error while decoding Energy Intervals response from server | traceId: %s", v117, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2533B8110](v118, -1, -1);
        MEMORY[0x2533B8110](v117, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      id v119 = *(id *)(v1 + 872);
      swift_bridgeObjectRetain_n();
      id v120 = v119;
      os_log_type_t v121 = sub_2526759D0();
      os_log_type_t v122 = sub_252675E00();
      BOOL v123 = os_log_type_enabled(v121, v122);
      uint64_t v124 = *(void **)(v1 + 872);
      unint64_t v125 = *(void *)(v1 + 832);
      if (v123)
      {
        os_log_t loga = *(os_log_t *)(v1 + 824);
        uint64_t v126 = swift_slowAlloc();
        uint64_t v231 = swift_slowAlloc();
        uint64_t v242 = v231;
        *(_DWORD *)uint64_t v126 = 136315394;
        id v127 = objc_msgSend(v124, sel_description);
        uint64_t v128 = sub_252675BA0();
        unint64_t v130 = v129;

        *(void *)(v1 + 576) = sub_2526669DC(v128, v130, &v242);
        sub_252675EA0();
        swift_bridgeObjectRelease();

        *(_WORD *)(v126 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v1 + 584) = sub_2526669DC((uint64_t)loga, v125, &v242);
        sub_252675EA0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25262F000, v121, v122, "URL Response %s | traceId: %s", (uint8_t *)v126, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2533B8110](v231, -1, -1);
        MEMORY[0x2533B8110](v126, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }

      unint64_t v6 = 0x26B22A000uLL;
      unint64_t v5 = 0x26537F000uLL;
      unint64_t v4 = 0x26537F000uLL;
      uint64_t v3 = MEMORY[0x263F8D310];
      os_log_type_t v131 = *(void **)(v1 + 872);
      unint64_t v132 = *(void *)(v1 + 864);
      uint64_t v133 = *(void *)(v1 + 856);
      sub_25264071C((unint64_t *)&qword_269C12678, (void (*)(uint64_t))type metadata accessor for NetworkError);
      uint64_t v134 = swift_allocError();
      unsigned char *v135 = 1;
      swift_storeEnumTagMultiPayload();
      swift_willThrow();

      sub_252636330(v133, v132);
      id v239 = (id)v134;
    }
LABEL_39:
    uint64_t v136 = *(void *)(v1 + 832);
    uint64_t v137 = *(void *)(v1 + 824);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A730);
    uint64_t v138 = swift_initStackObject();
    *(_OWORD *)(v138 + 16) = xmmword_252676980;
    *(void *)(v138 + 32) = 0x64496563617274;
    *(void *)(v138 + 40) = 0xE700000000000000;
    *(void *)(v138 + 72) = v3;
    *(void *)(v138 + 48) = v137;
    *(void *)(v138 + 56) = v136;
    swift_bridgeObjectRetain();
    id v139 = v239;
    unint64_t v140 = sub_252655260(v138);
    id v141 = [self *(SEL *)(v4 + 2688)];
    id v142 = [v141 *(SEL *)(v5 + 2696)];

    uint64_t v143 = sub_252675BA0();
    uint64_t v145 = v144;

    LOWORD(v242) = 257;
    BYTE2(v242) = 5;
    uint64_t v243 = v143;
    uint64_t v244 = v145;
    unint64_t v245 = v140;
    static AutoBugCaptureManager.sendIssue(_:)((char *)&v242);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    os_log_type_t v146 = v239;
    if (*(void *)(v6 + 2528) != -1) {
      swift_once();
    }
    uint64_t v147 = sub_2526759F0();
    __swift_project_value_buffer(v147, (uint64_t)qword_26B22B6D8);
    id v148 = v239;
    swift_bridgeObjectRetain();
    id v149 = v239;
    uint64_t v150 = sub_2526759D0();
    os_log_type_t v151 = sub_252675E00();
    BOOL v152 = os_log_type_enabled(v150, v151);
    unint64_t v153 = *(void *)(v1 + 832);
    if (v152)
    {
      os_log_t logb = *(os_log_t *)(v1 + 824);
      uint64_t v154 = swift_slowAlloc();
      uint64_t v155 = (void *)swift_slowAlloc();
      uint64_t v235 = v1;
      uint64_t v156 = swift_slowAlloc();
      uint64_t v242 = v156;
      *(_DWORD *)uint64_t v154 = 138412546;
      id v157 = v239;
      uint64_t v158 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v235 + 520) = v158;
      sub_252675EA0();
      *uint64_t v155 = v158;

      *(_WORD *)(v154 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v235 + 512) = sub_2526669DC((uint64_t)logb, v153, &v242);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v150, v151, "URLSession Error while trying to fetch Energy Intervals. %@ | traceId: %s", (uint8_t *)v154, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C12820);
      swift_arrayDestroy();
      os_log_type_t v146 = v239;
      MEMORY[0x2533B8110](v155, -1, -1);
      swift_arrayDestroy();
      uint64_t v159 = v156;
      uint64_t v1 = v235;
      MEMORY[0x2533B8110](v159, -1, -1);
      MEMORY[0x2533B8110](v154, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    *(void *)(v1 + 536) = v146;
    id v160 = v146;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C12690);
    int v161 = swift_dynamicCast();
    uint64_t v162 = *(void *)(v1 + 816);
    uint64_t v163 = *(void *)(v1 + 808);
    uint64_t v164 = *(void *)(v1 + 800);
    if (v161)
    {
      sub_252640764(*(void *)(v1 + 712), type metadata accessor for NetworkError);
      swift_willThrow();
    }
    else
    {
      sub_25265C20C(v146);
      swift_willThrow();
    }
    (*(void (**)(uint64_t, uint64_t))(v163 + 8))(v162, v164);
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
    uint64_t v165 = *(void (**)(void))(v1 + 8);
    goto LABEL_48;
  }
  uint64_t v62 = **(void **)(v0 + 784);
  if (!v62 || !*(void *)(v62 + 16))
  {
    uint64_t v76 = *(void *)(v0 + 832);
    uint64_t v77 = *(void *)(v0 + 824);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A730);
    uint64_t v78 = swift_initStackObject();
    *(_OWORD *)(v78 + 16) = xmmword_252676980;
    *(void *)(v78 + 32) = 0x64496563617274;
    *(void *)(v78 + 40) = 0xE700000000000000;
    uint64_t v3 = MEMORY[0x263F8D310];
    *(void *)(v78 + 72) = MEMORY[0x263F8D310];
    *(void *)(v78 + 48) = v77;
    *(void *)(v78 + 56) = v76;
    swift_bridgeObjectRetain();
    unint64_t v79 = sub_252655260(v78);
    unint64_t v4 = 0x26537F000uLL;
    id v80 = objc_msgSend(self, sel_processInfo);
    unint64_t v5 = 0x26537F000uLL;
    id v81 = objc_msgSend(v80, sel_processName);

    uint64_t v82 = sub_252675BA0();
    uint64_t v84 = v83;

    LOWORD(v242) = 257;
    BYTE2(v242) = 0;
    uint64_t v243 = v82;
    uint64_t v244 = v84;
    unint64_t v245 = v79;
    static AutoBugCaptureManager.sendIssue(_:)((char *)&v242);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v85 = sub_2526759F0();
    __swift_project_value_buffer(v85, (uint64_t)qword_26B22B718);
    swift_bridgeObjectRetain_n();
    uint64_t v86 = sub_2526759D0();
    os_log_type_t v87 = sub_252675E00();
    BOOL v88 = os_log_type_enabled(v86, v87);
    unint64_t v89 = *(void *)(v1 + 832);
    if (v88)
    {
      uint64_t v90 = *(void *)(v1 + 824);
      uint64_t v91 = (uint8_t *)swift_slowAlloc();
      uint64_t v92 = v1;
      uint64_t v93 = swift_slowAlloc();
      uint64_t v242 = v93;
      *(_DWORD *)uint64_t v91 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v94 = v90;
      unint64_t v4 = 0x26537F000;
      *(void *)(v92 + 608) = sub_2526669DC(v94, v89, &v242);
      unint64_t v5 = 0x26537F000;
      unint64_t v6 = 0x26B22A000;
      uint64_t v3 = MEMORY[0x263F8D310];
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v86, v87, "No EnergyWindows returned in response | traceId: %s", v91, 0xCu);
      swift_arrayDestroy();
      uint64_t v95 = v93;
      uint64_t v1 = v92;
      MEMORY[0x2533B8110](v95, -1, -1);
      MEMORY[0x2533B8110](v91, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v96 = *(void *)(v1 + 784);
    sub_25264071C((unint64_t *)&qword_269C12678, (void (*)(uint64_t))type metadata accessor for NetworkError);
    uint64_t v97 = swift_allocError();
    swift_storeEnumTagMultiPayload();
    id v239 = (id)v97;
    swift_willThrow();
    swift_release();
    sub_252640764(v96, type metadata accessor for EnergyWindows);
    goto LABEL_28;
  }
  uint64_t v63 = (void *)MEMORY[0x2533B7BC0](v10);
  sub_2526374E8(v7);
  if (qword_26B22AA68 != -1) {
    swift_once();
  }
  uint64_t v64 = *(void *)(v0 + 784);
  uint64_t v65 = *(void *)(v1 + 776);
  uint64_t v66 = *(void *)(v1 + 760);
  uint64_t v67 = *(void *)(v1 + 736);
  uint64_t v68 = *(void *)(v1 + 728);
  v234 = (void *)v1;
  uint64_t v237 = *(void *)(v1 + 720);
  uint64_t v70 = qword_26B22B730;
  uint64_t v69 = *(void *)algn_26B22B738;
  swift_bridgeObjectRetain();
  double v71 = sub_25263D4A8(600, v70, v69);
  swift_bridgeObjectRelease();
  sub_252675590();
  uint64_t v72 = v64 + *(int *)(v65 + 20);
  sub_252634810(v72, &qword_26B22AAB0);
  uint64_t v73 = *(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 16);
  v73(v72, v66, v68);
  uint64_t v74 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v67 + 56))(v72, 0, 1, v68);
  BOOL v75 = (void *)MEMORY[0x2533B7BC0](v74);
  sub_252637784(v230, v237);
  sub_2526407C4(v234[90], v234[98] + *(int *)(v234[97] + 24));
  if (qword_26B22A9E0 != -1) {
    swift_once();
  }
  uint64_t v166 = v234[96];
  uint64_t v167 = v234[94];
  uint64_t v168 = v234[91];
  uint64_t v169 = sub_2526759F0();
  __swift_project_value_buffer(v169, (uint64_t)qword_26B22B6D8);
  v73(v167, v166, v168);
  swift_bridgeObjectRetain_n();
  uint64_t v170 = sub_2526759D0();
  os_log_type_t v171 = sub_252675DF0();
  BOOL v172 = os_log_type_enabled(v170, v171);
  v173 = v234;
  unint64_t v174 = v234[104];
  v225 = v73;
  if (v172)
  {
    v216 = v170;
    uint64_t v219 = v234[103];
    uint64_t v175 = v234[94];
    uint64_t v176 = v234[92];
    uint64_t v232 = v234[91];
    uint64_t v177 = swift_slowAlloc();
    uint64_t v221 = swift_slowAlloc();
    uint64_t v242 = v221;
    *(_DWORD *)uint64_t v177 = 136315394;
    id v178 = sub_252641408();
    uint64_t v179 = v175;
    v180 = (void *)sub_2526755A0();
    id v181 = objc_msgSend(v178, (SEL)0x1F6957B98, v180);

    uint64_t v182 = sub_252675BA0();
    unint64_t v184 = v183;

    v234[81] = sub_2526669DC(v182, v184, &v242);
    sub_252675EA0();
    swift_bridgeObjectRelease();
    uint64_t v185 = v232;
    v233 = *(void (**)(uint64_t, uint64_t))(v176 + 8);
    v233(v179, v185);
    *(_WORD *)(v177 + 12) = 2080;
    swift_bridgeObjectRetain();
    v234[82] = sub_2526669DC(v219, v174, &v242);
    sub_252675EA0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25262F000, v216, v171, "Window Response valid until %s | traceId: %s", (uint8_t *)v177, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v221, -1, -1);
    MEMORY[0x2533B8110](v177, -1, -1);
  }
  else
  {
    v233 = *(void (**)(uint64_t, uint64_t))(v234[92] + 8);
    v233(v234[94], v234[91]);
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v186 = sub_2526759D0();
  os_log_type_t v187 = sub_252675DF0();
  BOOL v188 = os_log_type_enabled(v186, v187);
  unint64_t v189 = v234[104];
  if (v188)
  {
    uint64_t v190 = v234[103];
    uint64_t v191 = swift_slowAlloc();
    uint64_t v192 = swift_slowAlloc();
    uint64_t v242 = v192;
    *(_DWORD *)uint64_t v191 = 134218242;
    *((double *)v234 + 79) = v71;
    sub_252675EA0();
    *(_WORD *)(v191 + 12) = 2080;
    swift_bridgeObjectRetain();
    v173 = v234;
    v234[80] = sub_2526669DC(v190, v189, &v242);
    sub_252675EA0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25262F000, v186, v187, "Adding response jitter %fs | traceId: %s", (uint8_t *)v191, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v192, -1, -1);
    MEMORY[0x2533B8110](v191, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v225(v173[93], v173[95], v173[91]);
  swift_bridgeObjectRetain();
  v193 = sub_2526759D0();
  v194 = v173;
  os_log_type_t v195 = sub_252675DF0();
  BOOL v196 = os_log_type_enabled(v193, v195);
  unint64_t v236 = v173[108];
  v238 = (void *)v173[109];
  uint64_t v226 = v173[107];
  unint64_t v197 = v173[104];
  if (v196)
  {
    uint64_t v214 = v173[103];
    uint64_t v215 = v173[101];
    uint64_t v220 = v173[100];
    uint64_t v222 = v173[102];
    os_log_t v217 = (os_log_t)v173[95];
    *(void *)type = v173[96];
    uint64_t v213 = v173[93];
    uint64_t v223 = v173[91];
    uint64_t v198 = swift_slowAlloc();
    uint64_t v199 = swift_slowAlloc();
    uint64_t v242 = v199;
    *(_DWORD *)uint64_t v198 = 136315394;
    id v200 = sub_252641408();
    v201 = (void *)sub_2526755A0();
    id v202 = objc_msgSend(v200, sel_stringFromDate_, v201);

    uint64_t v203 = sub_252675BA0();
    unint64_t v205 = v204;

    v173[77] = sub_2526669DC(v203, v205, &v242);
    sub_252675EA0();
    swift_bridgeObjectRelease();
    v233(v213, v223);
    *(_WORD *)(v198 + 12) = 2080;
    swift_bridgeObjectRetain();
    v173[78] = sub_2526669DC(v214, v197, &v242);
    sub_252675EA0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25262F000, v193, v195, "Window Response re-poll date %s | traceId: %s", (uint8_t *)v198, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v199, -1, -1);
    MEMORY[0x2533B8110](v198, -1, -1);
    swift_release();
    sub_252636330(v226, v236);

    v233((uint64_t)v217, v223);
    v233(*(void *)type, v223);
    (*(void (**)(uint64_t, uint64_t))(v215 + 8))(v222, v220);
  }
  else
  {
    id v241 = (id)v173[102];
    uint64_t v206 = v173[101];
    uint64_t v207 = v194[100];
    uint64_t v208 = v194[96];
    uint64_t v209 = v194[95];
    uint64_t v210 = v194[93];
    uint64_t v211 = v194[91];
    swift_release();
    sub_252636330(v226, v236);

    swift_bridgeObjectRelease_n();
    v233(v210, v211);

    v233(v209, v211);
    v233(v208, v211);
    (*(void (**)(id, uint64_t))(v206 + 8))(v241, v207);
  }
  uint64_t v212 = v194[98];
  sub_25264082C(v212, v194[83]);
  sub_252640764(v212, type metadata accessor for EnergyWindows);
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
  uint64_t v165 = (void (*)(void))v194[1];
LABEL_48:
  v165();
}

uint64_t sub_2526401DC()
{
  unint64_t v33 = v0;
  uint64_t v1 = (void *)v0[110];
  uint64_t v2 = v0[104];
  uint64_t v3 = v0[103];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A730);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_252676980;
  *(void *)(inited + 32) = 0x64496563617274;
  *(void *)(inited + 40) = 0xE700000000000000;
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v3;
  *(void *)(inited + 56) = v2;
  swift_bridgeObjectRetain();
  id v5 = v1;
  unint64_t v6 = sub_252655260(inited);
  id v7 = objc_msgSend(self, sel_processInfo);
  id v8 = objc_msgSend(v7, sel_processName);

  uint64_t v9 = sub_252675BA0();
  uint64_t v11 = v10;

  LOWORD(v32[0]) = 257;
  BYTE2(v32[0]) = 5;
  v32[1] = v9;
  v32[2] = v11;
  v32[3] = v6;
  static AutoBugCaptureManager.sendIssue(_:)((char *)v32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_26B22A9E0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_2526759F0();
  __swift_project_value_buffer(v12, (uint64_t)qword_26B22B6D8);
  id v13 = v1;
  swift_bridgeObjectRetain();
  id v14 = v1;
  id v15 = sub_2526759D0();
  os_log_type_t v16 = sub_252675E00();
  BOOL v17 = os_log_type_enabled(v15, v16);
  unint64_t v18 = v0[104];
  if (v17)
  {
    uint64_t v30 = v0[103];
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = (void *)swift_slowAlloc();
    v32[0] = swift_slowAlloc();
    uint64_t v31 = v32[0];
    *(_DWORD *)uint64_t v19 = 138412546;
    id v21 = v1;
    uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
    v0[65] = v22;
    sub_252675EA0();
    void *v20 = v22;

    *(_WORD *)(v19 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[64] = sub_2526669DC(v30, v18, v32);
    sub_252675EA0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25262F000, v15, v16, "URLSession Error while trying to fetch Energy Intervals. %@ | traceId: %s", (uint8_t *)v19, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C12820);
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v20, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v31, -1, -1);
    MEMORY[0x2533B8110](v19, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }

  v0[67] = v1;
  id v23 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12690);
  int v24 = swift_dynamicCast();
  uint64_t v25 = v0[102];
  uint64_t v26 = v0[101];
  uint64_t v27 = v0[100];
  if (v24)
  {
    sub_252640764(v0[89], type metadata accessor for NetworkError);
    swift_willThrow();
  }
  else
  {
    sub_25265C20C(v1);
    swift_willThrow();
  }
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
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
  uint64_t v28 = (uint64_t (*)(void))v0[1];
  return v28();
}

uint64_t sub_25264069C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2526406C4(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t v5 = *a1 + 8;
  uint64_t result = sub_252675EA0();
  *a1 = v5;
  return result;
}

uint64_t sub_25264071C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_252640764(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2526407C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_25264082C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EnergyWindows(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_252640890(uint64_t a1)
{
  return sub_2526409C0(a1, qword_26B22B6D8);
}

uint64_t sub_2526408B8(uint64_t a1)
{
  return sub_2526409C0(a1, qword_269C12B98);
}

uint64_t sub_2526408DC(uint64_t a1)
{
  return sub_2526409C0(a1, qword_26B22B718);
}

uint64_t sub_252640904(uint64_t a1)
{
  return sub_2526409C0(a1, qword_26B22B740);
}

uint64_t sub_25264092C(uint64_t a1)
{
  return sub_2526409C0(a1, qword_269C12BB0);
}

uint64_t sub_252640954(uint64_t a1)
{
  return sub_2526409C0(a1, qword_269C12BC8);
}

uint64_t sub_252640974(uint64_t a1)
{
  return sub_2526409C0(a1, qword_26B22B6F0);
}

uint64_t sub_252640994(uint64_t a1)
{
  return sub_2526409C0(a1, qword_269C12BE0);
}

uint64_t sub_2526409C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2526759F0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  swift_bridgeObjectRetain();
  return sub_2526759E0();
}

uint64_t sub_252640A48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v1 = sub_252675720();
  uint64_t v26 = *(void *)(v1 - 8);
  uint64_t v27 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_252675360();
  uint64_t v23 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  MEMORY[0x270FA5388](v4);
  unint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(self, sel_currentCalendar);
  sub_2526756C0();

  __swift_instantiateConcreteTypeFromMangledName(&qword_269C125C8);
  uint64_t v8 = sub_252675710();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 72);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_252676DA0;
  unint64_t v13 = v12 + v11;
  id v14 = *(void (**)(unint64_t, void, uint64_t))(v9 + 104);
  v14(v13, *MEMORY[0x263F078A0], v8);
  v14(v13 + v10, *MEMORY[0x263F078A8], v8);
  v14(v13 + 2 * v10, *MEMORY[0x263F07870], v8);
  uint64_t v15 = v26;
  v14(v13 + 3 * v10, *MEMORY[0x263F07890], v8);
  uint64_t v16 = v27;
  v14(v13 + 4 * v10, *MEMORY[0x263F078C0], v8);
  sub_252661A34(v12);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_2526756A0();
  swift_bridgeObjectRelease();
  BOOL v17 = *(void (**)(char *, uint64_t))(v15 + 8);
  v17(v3, v16);
  uint64_t result = sub_252675310();
  uint64_t v19 = 0;
  if ((v20 & 1) == 0)
  {
    if (result > 19)
    {
      if ((unint64_t)result > 0x31) {
        uint64_t v21 = 80;
      }
      else {
        uint64_t v21 = 50;
      }
      BOOL v22 = __OFADD__(result, v21 - result);
      uint64_t result = v21;
      if (!v22) {
        goto LABEL_6;
      }
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
    uint64_t v19 = result;
  }
  if (!__OFSUB__(20, v19))
  {
    uint64_t result = 20;
    if (!__OFADD__(v19, 20 - v19))
    {
LABEL_6:
      sub_252675320();
      sub_2526756F0();
      sub_2526756D0();
      v17(v3, v16);
      return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v6, v24);
    }
    goto LABEL_12;
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_252640E0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v43 = a1;
  uint64_t v1 = sub_252675360();
  uint64_t v41 = *(void *)(v1 - 8);
  uint64_t v42 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_252675680();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_252675720();
  uint64_t v39 = *(void *)(v8 - 8);
  uint64_t v40 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12598);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_252675770();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  char v20 = (char *)&v37 - v19;
  sub_252675730();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_25264138C((uint64_t)v13);
    uint64_t v21 = sub_252675620();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v43, 1, 1, v21);
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v13, v14);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F07740], v4);
  sub_252675690();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  uint64_t v38 = v20;
  v23(v18, v20, v14);
  sub_252675700();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C125C8);
  uint64_t v24 = sub_252675710();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(void *)(v25 + 72);
  unint64_t v27 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_252676970;
  unint64_t v29 = v28 + v27;
  uint64_t v30 = *(void (**)(unint64_t, void, uint64_t))(v25 + 104);
  v30(v29, *MEMORY[0x263F078C0], v24);
  v30(v29 + v26, *MEMORY[0x263F078C8], v24);
  sub_252661A34(v28);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_2526756A0();
  swift_bridgeObjectRelease();
  uint64_t v31 = sub_252675310();
  if (v32) {
    uint64_t v33 = 0;
  }
  else {
    uint64_t v33 = v31;
  }
  uint64_t result = -v33;
  if (__OFSUB__(0, v33))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  sub_252675320();
  uint64_t v34 = sub_252675330();
  if (v35) {
    uint64_t v36 = 0;
  }
  else {
    uint64_t v36 = v34;
  }
  uint64_t result = -v36;
  if (__OFSUB__(0, v36)) {
    goto LABEL_14;
  }
  sub_252675340();
  sub_2526756E0();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v3, v42);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v40);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v38, v14);
}

uint64_t sub_25264138C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12598);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_2526413EC()
{
  return sub_252641424(0xD00000000000001DLL, 0x80000002526794B0);
}

id sub_252641408()
{
  return sub_252641424(0xD000000000000018, 0x8000000252679490);
}

id sub_252641424(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v2 = sub_252675680();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_252675720();
  uint64_t v6 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_252675670();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  sub_252675650();
  uint64_t v14 = (void *)sub_252675660();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  objc_msgSend(v13, sel_setLocale_, v14);

  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F07740], v2);
  sub_252675690();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v15 = (void *)sub_2526756B0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v19);
  objc_msgSend(v13, sel_setCalendar_, v15);

  uint64_t v16 = (void *)sub_252675B90();
  objc_msgSend(v13, sel_setDateFormat_, v16);

  return v13;
}

uint64_t static EnergyServices.gridIDLookup(_:withSession:)(uint64_t a1, double a2, double a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, double, double))((char *)&dword_269C12670 + dword_269C12670);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_2526417BC;
  return v9(a1, a2, a3);
}

uint64_t sub_2526417BC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  swift_task_dealloc();
  if (v2)
  {

    a1 = 0;
    a2 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  return v7(a1, a2);
}

uint64_t static EnergyServices.energyWindows(for:withSession:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_252641998;
  return sub_25263D954(a1, a2, a3, a4);
}

uint64_t sub_252641998()
{
  swift_task_dealloc();
  if (v0)
  {

    uint64_t v1 = sub_252641B4C;
  }
  else
  {
    uint64_t v1 = sub_252641AB0;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_252641AB0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = type metadata accessor for EnergyWindows(0);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 0, 1, v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_252641B4C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = type metadata accessor for EnergyWindows(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_252641BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = a2;
  uint64_t v37 = a1;
  uint64_t v2 = sub_2526751E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A940);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A948);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_252675280();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252675400();
  sub_252675270();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    uint64_t v16 = &qword_26B22A948;
    uint64_t v17 = (uint64_t)v11;
LABEL_18:
    sub_252634810(v17, v16);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  uint64_t v18 = sub_2526751F0();
  uint64_t v19 = v18;
  if (v18)
  {
    uint64_t v20 = *(void *)(v18 + 16);
    if (v20)
    {
      uint64_t v31 = v15;
      uint64_t v32 = v13;
      uint64_t v33 = v12;
      uint64_t v34 = v8;
      uint64_t v35 = v3;
      uint64_t v23 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
      uint64_t v22 = v3 + 16;
      uint64_t v21 = v23;
      unint64_t v24 = v18 + ((*(unsigned __int8 *)(v22 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 64));
      uint64_t v25 = *(void *)(v22 + 56);
      uint64_t v30 = v18;
      swift_bridgeObjectRetain();
      while (1)
      {
        v21(v5, v24, v2);
        if (sub_2526751C0() == v37 && v26 == v36) {
          break;
        }
        char v27 = sub_252676130();
        swift_bridgeObjectRelease();
        if (v27) {
          goto LABEL_14;
        }
        (*(void (**)(char *, uint64_t))(v22 - 8))(v5, v2);
        v24 += v25;
        if (!--v20)
        {
          swift_bridgeObjectRelease();
          uint64_t v28 = 1;
          uint64_t v8 = v34;
          uint64_t v3 = v35;
          goto LABEL_15;
        }
      }
      swift_bridgeObjectRelease();
LABEL_14:
      swift_bridgeObjectRelease();
      uint64_t v8 = v34;
      uint64_t v3 = v35;
      (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v34, v5, v2);
      uint64_t v28 = 0;
LABEL_15:
      uint64_t v13 = v32;
      uint64_t v12 = v33;
      uint64_t v15 = v31;
    }
    else
    {
      uint64_t v28 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, v28, 1, v2);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) != 1)
    {
      uint64_t v19 = sub_2526751D0();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      return v19;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    uint64_t v16 = &qword_26B22A940;
    uint64_t v17 = (uint64_t)v8;
    goto LABEL_18;
  }
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return v19;
}

uint64_t sub_252642044@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = v5;
  unint64_t v37 = a2;
  uint64_t v38 = a5;
  uint64_t v10 = sub_2526750B0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_252675620();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252675600();
  sub_2526755E0();
  double v19 = v18;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB88);
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = MEMORY[0x263F8D538];
  *(_OWORD *)(v20 + 16) = xmmword_252676980;
  uint64_t v22 = MEMORY[0x263F8D5B8];
  *(void *)(v20 + 56) = v21;
  *(void *)(v20 + 64) = v22;
  *(double *)(v20 + 32) = floor(v19 * 1000.0 / 300000.0) * 300000.0;
  uint64_t v23 = sub_252675BD0();
  uint64_t v25 = v24;
  unint64_t v26 = v37;
  v36[1] = a3;
  unint64_t v37 = a4;
  sub_2526424B4(a1, v26, a3, a4, v23, v25);
  if (v27)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v6, v10);
    sub_252643248();
    if (v28)
    {
      sub_252675080();
      swift_bridgeObjectRelease();
    }
    sub_252675080();
    swift_bridgeObjectRelease();
    sub_252675080();
    swift_bridgeObjectRelease();
    sub_252675080();
    sub_252675080();
    uint64_t v29 = v38;
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v38, v13, v10);
    uint64_t v30 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_269C123E8 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_2526759F0();
    __swift_project_value_buffer(v31, (uint64_t)qword_269C12B98);
    uint64_t v32 = sub_2526759D0();
    os_log_type_t v33 = sub_252675E00();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_25262F000, v32, v33, "Unable to generate HMAC Signature", v34, 2u);
      MEMORY[0x2533B8110](v34, -1, -1);
    }

    uint64_t v30 = 1;
    uint64_t v29 = v38;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(v29, v30, 1, v10);
}

uint64_t type metadata accessor for HMACConstants()
{
  return self;
}

uint64_t sub_2526424B4(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v125 = a5;
  uint64_t v126 = a6;
  uint64_t v127 = a3;
  uint64_t v128 = a4;
  unint64_t v123 = a1;
  unint64_t v124 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A5A8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v133 = (char *)v115 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_252675A80();
  uint64_t v132 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  os_log_type_t v131 = (char *)v115 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A948);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v129 = (char *)v115 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = sub_252675BF0();
  uint64_t v134 = *(void *)(v130 - 8);
  MEMORY[0x270FA5388](v130);
  uint64_t v14 = (char *)v115 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAD0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)v115 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_252675470();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)v115 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252675070();
  uint64_t v22 = v18;
  uint64_t v23 = v19;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v22) == 1)
  {
    sub_252634810((uint64_t)v17, &qword_26B22AAD0);
    if (qword_269C123E8 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_2526759F0();
    __swift_project_value_buffer(v24, (uint64_t)qword_269C12B98);
    uint64_t v25 = sub_2526759D0();
    os_log_type_t v26 = sub_252675E00();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_25262F000, v25, v26, "Unable to retrieve URL from request.", v27, 2u);
      MEMORY[0x2533B8110](v27, -1, -1);
    }

    return 0;
  }
  uint64_t v119 = v6;
  uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v19 + 32);
  uint64_t v116 = v22;
  v29(v21, v17, v22);
  sub_252675010();
  uint64_t v30 = v21;
  uint64_t v118 = v7;
  uint64_t v117 = v9;
  if (v31)
  {
    uint64_t v120 = sub_252675C00();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v120 = 0;
  }
  sub_252675430();
  v115[1] = sub_252675C00();
  uint64_t v122 = v32;
  swift_bridgeObjectRelease();
  uint64_t v33 = sub_252675040();
  if (v33) {
    uint64_t v34 = v33;
  }
  else {
    uint64_t v34 = MEMORY[0x263F8EE80];
  }
  uint64_t v35 = sub_252643248();
  if (v36)
  {
    uint64_t v37 = v35;
    uint64_t v38 = v36;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v137 = v34;
    sub_252644BA4(v37, v38, 0xD000000000000016, 0x8000000252679560, isUniquelyReferenced_nonNull_native);
    uint64_t v34 = v137;
    swift_bridgeObjectRelease();
  }
  uint64_t v40 = v126;
  swift_bridgeObjectRetain();
  char v41 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v137 = v34;
  sub_252644BA4(v125, v40, 0xD00000000000001BLL, 0x8000000252679500, v41);
  uint64_t v42 = v137;
  swift_bridgeObjectRelease();
  uint64_t v43 = v128;
  swift_bridgeObjectRetain();
  char v44 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v137 = v42;
  sub_252644BA4(v127, v43, 0xD00000000000001BLL, 0x8000000252679540, v44);
  uint64_t v45 = v137;
  swift_bridgeObjectRelease();
  uint64_t v46 = sub_252643604(v45);
  uint64_t v126 = v47;
  uint64_t v127 = v46;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB78);
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_252676970;
  sub_252675BE0();
  uint64_t v49 = sub_252675BB0();
  unint64_t v51 = v50;
  uint64_t v52 = *(void (**)(char *, uint64_t))(v134 + 8);
  uint64_t v53 = v130;
  v134 += 8;
  v52(v14, v130);
  os_log_type_t v121 = v30;
  if (v51 >> 60 == 15)
  {
    if (qword_269C123E8 != -1) {
      swift_once();
    }
    uint64_t v54 = sub_2526759F0();
    __swift_project_value_buffer(v54, (uint64_t)qword_269C12B98);
    uint64_t v55 = sub_2526759D0();
    os_log_type_t v56 = sub_252675E00();
    if (os_log_type_enabled(v55, v56))
    {
      char v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v57 = 0;
      _os_log_impl(&dword_25262F000, v55, v56, "String encoding failed. Returning empty string", v57, 2u);
      MEMORY[0x2533B8110](v57, -1, -1);
    }

    uint64_t v58 = 0;
    unint64_t v59 = 0xE000000000000000;
  }
  else
  {
    uint64_t v58 = sub_2526754E0();
    unint64_t v59 = v60;
    sub_252646E38(v49, v51);
  }
  swift_bridgeObjectRelease();
  *(void *)(v48 + 32) = v58;
  *(void *)(v48 + 40) = v59;
  sub_252675BE0();
  uint64_t v61 = sub_252675BB0();
  unint64_t v63 = v62;
  v52(v14, v53);
  if (v63 >> 60 == 15)
  {
    if (qword_269C123E8 != -1) {
      swift_once();
    }
    uint64_t v64 = sub_2526759F0();
    __swift_project_value_buffer(v64, (uint64_t)qword_269C12B98);
    uint64_t v65 = sub_2526759D0();
    os_log_type_t v66 = sub_252675E00();
    if (os_log_type_enabled(v65, v66))
    {
      uint64_t v67 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v67 = 0;
      _os_log_impl(&dword_25262F000, v65, v66, "String encoding failed. Returning empty string", v67, 2u);
      MEMORY[0x2533B8110](v67, -1, -1);
    }

    uint64_t v68 = 0;
    unint64_t v69 = 0xE000000000000000;
  }
  else
  {
    uint64_t v68 = sub_2526754E0();
    unint64_t v69 = v70;
    sub_252646E38(v61, v63);
  }
  swift_bridgeObjectRelease();
  *(void *)(v48 + 48) = v68;
  *(void *)(v48 + 56) = v69;
  uint64_t v71 = (uint64_t)v129;
  sub_252675240();
  uint64_t v72 = sub_252675280();
  uint64_t v73 = *(void *)(v72 - 8);
  int v74 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v73 + 48))(v71, 1, v72);
  uint64_t v128 = v23;
  if (v74 == 1)
  {
    sub_252634810(v71, &qword_26B22A948);
LABEL_41:
    unint64_t v88 = v123;
    unint64_t v87 = v124;
    uint64_t v79 = v127;
    goto LABEL_42;
  }
  uint64_t v75 = sub_252675210();
  unint64_t v77 = v76;
  (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v71, v72);
  if (!v77) {
    goto LABEL_41;
  }
  uint64_t v78 = HIBYTE(v77) & 0xF;
  if ((v77 & 0x2000000000000000) == 0) {
    uint64_t v78 = v75 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v79 = v127;
  if (v78)
  {
    sub_252675BE0();
    uint64_t v80 = sub_252675BB0();
    unint64_t v82 = v81;
    v52(v14, v53);
    if (v82 >> 60 == 15)
    {
      if (qword_269C123E8 != -1) {
        swift_once();
      }
      uint64_t v83 = sub_2526759F0();
      __swift_project_value_buffer(v83, (uint64_t)qword_269C12B98);
      uint64_t v84 = sub_2526759D0();
      os_log_type_t v85 = sub_252675E00();
      BOOL v86 = os_log_type_enabled(v84, v85);
      unint64_t v88 = v123;
      unint64_t v87 = v124;
      uint64_t v89 = v126;
      if (v86)
      {
        uint64_t v90 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v90 = 0;
        _os_log_impl(&dword_25262F000, v84, v85, "String encoding failed. Returning empty string", v90, 2u);
        MEMORY[0x2533B8110](v90, -1, -1);
      }

      uint64_t v91 = 0;
      unint64_t v92 = 0xE000000000000000;
    }
    else
    {
      uint64_t v91 = sub_2526754E0();
      unint64_t v92 = v111;
      sub_252646E38(v80, v82);
      unint64_t v88 = v123;
      unint64_t v87 = v124;
      uint64_t v89 = v126;
    }
    swift_bridgeObjectRelease();
    unint64_t v113 = *(void *)(v48 + 16);
    unint64_t v112 = *(void *)(v48 + 24);
    if (v113 >= v112 >> 1) {
      uint64_t v48 = (uint64_t)sub_25264BFA0((void *)(v112 > 1), v113 + 1, 1, (void *)v48);
    }
    *(void *)(v48 + 16) = v113 + 1;
    uint64_t v114 = v48 + 16 * v113;
    *(void *)(v114 + 32) = v91;
    *(void *)(v114 + 40) = v92;
    goto LABEL_43;
  }
  swift_bridgeObjectRelease();
  unint64_t v88 = v123;
  unint64_t v87 = v124;
LABEL_42:
  uint64_t v89 = v126;
LABEL_43:
  unint64_t v94 = *(void *)(v48 + 16);
  unint64_t v93 = *(void *)(v48 + 24);
  if (v94 >= v93 >> 1) {
    uint64_t v48 = (uint64_t)sub_25264BFA0((void *)(v93 > 1), v94 + 1, 1, (void *)v48);
  }
  *(void *)(v48 + 16) = v94 + 1;
  uint64_t v95 = v48 + 16 * v94;
  *(void *)(v95 + 32) = v79;
  *(void *)(v95 + 40) = v89;
  uint64_t v137 = v48;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB40);
  sub_2526469BC(&qword_26B22AB48, &qword_26B22AB40);
  unint64_t v96 = sub_252675B40();
  unint64_t v98 = v97;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v99 = sub_252643A90(v96, v98);
  uint64_t v134 = v99;
  unint64_t v101 = v100;
  swift_bridgeObjectRetain();
  uint64_t v137 = sub_252643A90(v88, v87);
  unint64_t v138 = v102;
  uint64_t v103 = v131;
  sub_252675A70();
  uint64_t v137 = v99;
  unint64_t v138 = v101;
  sub_252675AB0();
  sub_252646920(&qword_26B22AB20, MEMORY[0x263F047F8]);
  sub_252646968();
  uint64_t v104 = v133;
  sub_252675A90();
  uint64_t v105 = v119;
  uint64_t v139 = v119;
  uint64_t v140 = sub_2526469BC(&qword_26B22A9F8, &qword_26B22A5A8);
  id v106 = __swift_allocate_boxed_opaque_existential_1(&v137);
  uint64_t v107 = v118;
  (*(void (**)(uint64_t *, char *, uint64_t))(v118 + 16))(v106, v104, v105);
  __swift_project_boxed_opaque_existential_1(&v137, v139);
  sub_2526753A0();
  uint64_t v108 = v135;
  unint64_t v109 = v136;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v137);
  uint64_t v28 = sub_2526754E0();
  sub_252636330(v108, v109);
  sub_252636330(v134, v101);
  (*(void (**)(char *, uint64_t))(v107 + 8))(v104, v105);
  (*(void (**)(char *, uint64_t))(v132 + 8))(v103, v117);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v128 + 8))(v121, v116);
  return v28;
}

uint64_t sub_252643248()
{
  v17[3] = *MEMORY[0x263EF8340];
  uint64_t v0 = sub_252675AB0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_252675A60();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_252675090();
  if (v9 >> 60 == 15) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v8;
  }
  if (v9 >> 60 == 15) {
    unint64_t v11 = 0xC000000000000000;
  }
  else {
    unint64_t v11 = v9;
  }
  sub_252646920(&qword_26B22AB20, MEMORY[0x263F047F8]);
  sub_252675A50();
  switch(v11 >> 62)
  {
    case 1uLL:
      uint64_t v16 = v4;
      if (v10 >> 32 < (int)v10) {
        __break(1u);
      }
      unint64_t v15 = v11 & 0x3FFFFFFFFFFFFFFFLL;
      sub_2526468C8(v10, v11);
      sub_2526467E8((int)v10, v10 >> 32);
      sub_252636330(v10, v11);
      uint64_t v4 = v16;
      goto LABEL_15;
    case 2uLL:
      uint64_t v16 = v4;
      uint64_t v12 = *(void *)(v10 + 16);
      unint64_t v15 = *(void *)(v10 + 24);
      sub_2526468C8(v10, v11);
      swift_retain();
      swift_retain();
      sub_2526467E8(v12, v15);
      uint64_t v4 = v16;
      swift_release();
      swift_release();
      goto LABEL_14;
    case 3uLL:
      memset(v17, 0, 14);
      goto LABEL_13;
    default:
      v17[0] = v10;
      LOWORD(v17[1]) = v11;
      BYTE2(v17[1]) = BYTE2(v11);
      BYTE3(v17[1]) = BYTE3(v11);
      BYTE4(v17[1]) = BYTE4(v11);
      BYTE5(v17[1]) = BYTE5(v11);
LABEL_13:
      sub_252675A30();
LABEL_14:
      sub_252636330(v10, v11);
LABEL_15:
      sub_252675A40();
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      uint64_t v13 = sub_252643FC0();
      sub_252636330(v10, v11);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return v13;
  }
}

uint64_t sub_252643604(uint64_t a1)
{
  uint64_t v2 = sub_252675BF0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  uint64_t v6 = swift_bridgeObjectRetain();
  uint64_t v36 = sub_252645260(v6);
  sub_252645348((uint64_t *)&v36);
  swift_bridgeObjectRelease();
  uint64_t v7 = v36[2];
  if (v7)
  {
    uint64_t v35 = (void (**)(char *, uint64_t))(v3 + 8);
    uint64_t v31 = v36;
    uint64_t v32 = v2;
    uint64_t v8 = v36 + 5;
    do
    {
      if (*(void *)(a1 + 16))
      {
        uint64_t v9 = *(v8 - 1);
        uint64_t v10 = *v8;
        swift_bridgeObjectRetain();
        uint64_t v11 = sub_25264C464(v9, v10);
        if (v12)
        {
          uint64_t v13 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v11);
          uint64_t v14 = v13[1];
          uint64_t v33 = *v13;
          uint64_t v34 = v14;
          uint64_t v36 = 0;
          unint64_t v37 = 0xE000000000000000;
          swift_bridgeObjectRetain();
          sub_252675BE0();
          uint64_t v15 = sub_252675BB0();
          unint64_t v17 = v16;
          uint64_t v18 = *v35;
          (*v35)(v5, v2);
          if (v17 >> 60 == 15)
          {
            if (qword_269C123E8 != -1) {
              swift_once();
            }
            uint64_t v19 = sub_2526759F0();
            __swift_project_value_buffer(v19, (uint64_t)qword_269C12B98);
            uint64_t v20 = sub_2526759D0();
            os_log_type_t v21 = sub_252675E00();
            if (os_log_type_enabled(v20, v21))
            {
              uint64_t v22 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v22 = 0;
              _os_log_impl(&dword_25262F000, v20, v21, "String encoding failed. Returning empty string", v22, 2u);
              MEMORY[0x2533B8110](v22, -1, -1);
            }
            swift_bridgeObjectRelease();
          }
          else
          {
            sub_2526754E0();
            sub_252646E38(v15, v17);
            swift_bridgeObjectRelease();
          }
          sub_252675C70();
          swift_bridgeObjectRelease();
          sub_252675C70();
          sub_252675C70();
          swift_bridgeObjectRelease();
          uint64_t v36 = 0;
          unint64_t v37 = 0xE000000000000000;
          sub_252675BE0();
          uint64_t v23 = sub_252675BB0();
          unint64_t v25 = v24;
          uint64_t v2 = v32;
          v18(v5, v32);
          if (v25 >> 60 == 15)
          {
            if (qword_269C123E8 != -1) {
              swift_once();
            }
            uint64_t v26 = sub_2526759F0();
            __swift_project_value_buffer(v26, (uint64_t)qword_269C12B98);
            uint64_t v27 = sub_2526759D0();
            os_log_type_t v28 = sub_252675E00();
            if (os_log_type_enabled(v27, v28))
            {
              uint64_t v29 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v29 = 0;
              _os_log_impl(&dword_25262F000, v27, v28, "String encoding failed. Returning empty string", v29, 2u);
              MEMORY[0x2533B8110](v29, -1, -1);
            }
            swift_bridgeObjectRelease();
          }
          else
          {
            sub_2526754E0();
            sub_252646E38(v23, v25);
            swift_bridgeObjectRelease();
          }
          sub_252675C70();
          swift_bridgeObjectRelease();
          sub_252675C70();
          sub_252675C70();
        }
        swift_bridgeObjectRelease();
      }
      v8 += 2;
      --v7;
    }
    while (v7);
    swift_release();
    return v38;
  }
  else
  {
    swift_release();
    return 0;
  }
}

uint64_t sub_252643A90(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A950);
  if (swift_dynamicCast())
  {
    sub_252646E4C(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_1(&v41, v43);
    sub_2526753A0();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_252634810((uint64_t)v38, &qword_26B22A958);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      uint64_t v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = sub_252675FD0();
      }
      if (v4) {
        uint64_t v6 = (unsigned char *)(v4 + v5);
      }
      else {
        uint64_t v6 = 0;
      }
      uint64_t v7 = (uint64_t *)v4;
    }
    uint64_t v8 = sub_252646CC8(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    uint64_t v11 = sub_252675CA0();
    goto LABEL_17;
  }
LABEL_69:
  uint64_t v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v3) & 0xF;
  }
  else {
    uint64_t v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_252646D2C(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x270FA5388](*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)sub_252645FD8((void *(*)(uint64_t *__return_ptr, char *, char *))sub_252646DCC);
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        sub_2526754B0();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = sub_2526441D4(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = sub_252675CD0();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = sub_252675FD0();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = sub_2526441D4(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = sub_252675CB0();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      sub_2526754C0();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  uint64_t v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    sub_2526754C0();
    sub_252646E38(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_252646E38((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

uint64_t sub_252643FC0()
{
  sub_252675A60();
  sub_252646920(&qword_26B22AB18, MEMORY[0x263F045C0]);
  uint64_t v0 = sub_252675AA0();
  uint64_t v2 = sub_252646678(v0, v1);
  swift_bridgeObjectRelease();
  int64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    sub_25265BAD0(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = MEMORY[0x263F8E7C0];
    do
    {
      char v6 = *(unsigned char *)(v2 + v4 + 32);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB88);
      uint64_t v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_252676980;
      *(void *)(v7 + 56) = MEMORY[0x263F8E778];
      *(void *)(v7 + 64) = v5;
      *(unsigned char *)(v7 + 32) = v6;
      uint64_t v8 = sub_252675BD0();
      uint64_t v10 = v9;
      unint64_t v12 = *(void *)(v16 + 16);
      unint64_t v11 = *(void *)(v16 + 24);
      if (v12 >= v11 >> 1) {
        sub_25265BAD0(v11 > 1, v12 + 1, 1);
      }
      ++v4;
      *(void *)(v16 + 16) = v12 + 1;
      uint64_t v13 = v16 + 16 * v12;
      *(void *)(v13 + 32) = v8;
      *(void *)(v13 + 40) = v10;
    }
    while (v3 != v4);
  }
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB40);
  sub_2526469BC(&qword_26B22AB48, &qword_26B22AB40);
  uint64_t v14 = sub_252675B40();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_2526441D4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_252675CE0();
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
    uint64_t v5 = MEMORY[0x2533B75E0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_252644250(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AA28);
  char v42 = a2;
  uint64_t v6 = sub_252676070();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    uint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          char v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2526761B0();
    sub_252675B20();
    uint64_t result = sub_2526761D0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    void *v19 = v34;
    v19[1] = v33;
    uint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    void *v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v3 = v39;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

uint64_t sub_252644578(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A718);
  char v42 = a2;
  uint64_t v6 = sub_252676070();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    uint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          char v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2526761B0();
    sub_252675B20();
    uint64_t result = sub_2526761D0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    void *v19 = v34;
    v19[1] = v33;
    uint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    void *v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v3 = v39;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

uint64_t sub_2526448A0(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C126C0);
  char v39 = a2;
  uint64_t result = sub_252676070();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v38 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v37 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v20 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v21 = v20 | (v8 << 6);
      }
      else
      {
        int64_t v22 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v22 >= v37) {
          goto LABEL_33;
        }
        unint64_t v23 = v38[v22];
        ++v8;
        if (!v23)
        {
          int64_t v8 = v22 + 1;
          if (v22 + 1 >= v37) {
            goto LABEL_33;
          }
          unint64_t v23 = v38[v8];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v37)
            {
LABEL_33:
              if ((v39 & 1) == 0)
              {
                uint64_t result = swift_release();
                char v3 = v2;
                goto LABEL_40;
              }
              uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
              if (v36 >= 64) {
                bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v38 = -1 << v36;
              }
              char v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v23 = v38[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v8 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v37) {
                  goto LABEL_33;
                }
                unint64_t v23 = v38[v8];
                ++v24;
                if (v23) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v24;
          }
        }
LABEL_30:
        unint64_t v11 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v8 << 6);
      }
      uint64_t v29 = 16 * v21;
      uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + v29);
      uint64_t v32 = *v30;
      uint64_t v31 = v30[1];
      uint64_t v33 = (uint64_t *)(*(void *)(v5 + 56) + v29);
      uint64_t v34 = *v33;
      uint64_t v35 = v33[1];
      if ((v39 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_2526761B0();
      sub_252675B20();
      uint64_t result = sub_2526761D0();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v27 = v15 == v26;
          if (v15 == v26) {
            unint64_t v15 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v12 + 8 * v15);
        }
        while (v28 == -1);
        unint64_t v16 = __clz(__rbit64(~v28)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t v17 = 16 * v16;
      uint64_t v18 = (void *)(*(void *)(v7 + 48) + v17);
      *uint64_t v18 = v32;
      v18[1] = v31;
      unint64_t v19 = (void *)(*(void *)(v7 + 56) + v17);
      void *v19 = v34;
      v19[1] = v35;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *char v3 = v7;
  return result;
}

uint64_t sub_252644BA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_25264C464(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_252644D2C();
LABEL_7:
    unint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      unint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *unint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_252644250(v17, a5 & 1);
  uint64_t v23 = sub_25264C464(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_252676150();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  char v25 = (uint64_t *)(v20[6] + 16 * v14);
  *char v25 = a3;
  v25[1] = a4;
  unint64_t v26 = (void *)(v20[7] + 16 * v14);
  *unint64_t v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;

  return swift_bridgeObjectRetain();
}

void *sub_252644D2C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AA28);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_252676060();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    unint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    *char v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_252644EE8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A718);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_252676060();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    unint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    *char v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2526450A4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C126C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_252676060();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    unint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    *char v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_252645260(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB78);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_252646478((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_252646E84();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_252645348(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_252646A64(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_2526453B4(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_2526453B4(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_252676110();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_252645AA0(0, v3, 1, a1);
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
  unint64_t v102 = a1;
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
          sub_252645B70((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v97 = sub_252645FC4((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          unint64_t v100 = &v97[16 * v96 + 32];
          *(void *)unint64_t v100 = v98;
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
    uint64_t v7 = sub_252675D90();
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
    unint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
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
      int v19 = sub_252676130();
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      uint64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_252676130()))
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
      uint64_t v11 = sub_252645E0C(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      uint64_t v11 = sub_252645E0C((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    char v42 = v11 + 32;
    uint64_t v43 = &v11[16 * v41 + 32];
    *(void *)uint64_t v43 = v13;
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
          char v57 = &v42[16 * v12 - 32];
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
            uint64_t v79 = &v42[16 * v44];
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
        unint64_t v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        uint64_t v68 = &v42[16 * v44];
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
        uint64_t v75 = &v42[16 * v44];
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
        os_log_type_t v85 = v11;
        BOOL v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        unint64_t v88 = v42;
        unint64_t v89 = v44;
        uint64_t v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_252645B70((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)BOOL v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        uint64_t v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        char v42 = v88;
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
      uint64_t v33 = (void *)(v10 + 16 * v9);
      do
      {
        uint64_t v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        uint64_t v37 = v13;
        uint64_t v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_252676130() & 1) == 0) {
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
  uint64_t result = sub_252676040();
  __break(1u);
  return result;
}

uint64_t sub_252645AA0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
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
      if (v13 || (uint64_t result = sub_252676130(), (result & 1) == 0))
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

uint64_t sub_252645B70(char *__src, char *a2, unint64_t a3, char *__dst)
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
      uint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      uint64_t v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          uint64_t v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (sub_252676130() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)uint64_t v18 = *((_OWORD *)v17 - 1);
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
              *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
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
    unint64_t v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_252676130() & 1) == 0)
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
    sub_252645F08((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_252676090();
  __break(1u);
  return result;
}

char *sub_252645E0C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C126B8);
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
  unint64_t v14 = a4 + 32;
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

char *sub_252645F08(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_252676090();
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

char *sub_252645FC4(uint64_t a1)
{
  return sub_252645E0C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_252645FD8(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_252676DB0;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_2526752B0() && __OFSUB__((int)v4, sub_2526752E0())) {
        goto LABEL_24;
      }
      sub_2526752F0();
      swift_allocObject();
      uint64_t v13 = sub_252675290();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      uint64_t result = sub_2526463C4((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *uint64_t v5 = v4;
        goto LABEL_19;
      }
      *uint64_t v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_252675480();
      uint64_t result = sub_2526463C4(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *uint64_t v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *uint64_t v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        uint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *uint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_2526462DC@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_252646B04(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_252646BC8((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_252646C44((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_252646354(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  uint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_2526463C4(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)sub_2526752B0();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  uint64_t result = (char *)sub_2526752E0();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = sub_2526752D0();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t sub_252646478(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *unint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_252646678(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  if (v2 != a2)
  {
    if (v2 > a2)
    {
      uint64_t v5 = a2;
      if (a2 < 0)
      {
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      if (!v2)
      {
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      uint64_t v6 = result;
      uint64_t result = swift_bridgeObjectRetain();
      size_t v4 = 0;
      uint64_t v7 = v3 + 4;
      while (1)
      {
        char v8 = *(unsigned char *)(v6 + v5 + 32);
        if (!v4)
        {
          unint64_t v9 = v3[3];
          if ((uint64_t)((v9 >> 1) + 0x4000000000000000) < 0) {
            goto LABEL_29;
          }
          int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
          if (v10 <= 1) {
            uint64_t v11 = 1;
          }
          else {
            uint64_t v11 = v10;
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB80);
          int64_t v12 = (void *)swift_allocObject();
          size_t v13 = 2 * _swift_stdlib_malloc_size(v12) - 64;
          v12[2] = v11;
          v12[3] = v13;
          unint64_t v14 = (unint64_t)(v12 + 4);
          size_t v15 = v3[3] >> 1;
          if (v3[2])
          {
            if (v12 != v3 || v14 >= (unint64_t)v3 + v15 + 32) {
              memmove(v12 + 4, v3 + 4, v15);
            }
            v3[2] = 0;
          }
          uint64_t v7 = (unsigned char *)(v14 + v15);
          size_t v4 = (v13 >> 1) - v15;
          uint64_t result = swift_release();
          uint64_t v3 = v12;
        }
        BOOL v17 = __OFSUB__(v4--, 1);
        if (v17) {
          break;
        }
        ++v5;
        *v7++ = v8;
        if (v2 == v5)
        {
          uint64_t result = swift_bridgeObjectRelease();
          goto LABEL_24;
        }
      }
      __break(1u);
LABEL_29:
      __break(1u);
    }
    __break(1u);
    goto LABEL_31;
  }
  size_t v4 = 0;
LABEL_24:
  unint64_t v18 = v3[3];
  if (v18 < 2) {
    return (uint64_t)v3;
  }
  unint64_t v19 = v18 >> 1;
  BOOL v17 = __OFSUB__(v19, v4);
  unint64_t v20 = v19 - v4;
  if (!v17)
  {
    v3[2] = v20;
    return (uint64_t)v3;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_2526467E8(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2526752B0();
  if (!result || (uint64_t result = sub_2526752E0(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_2526752D0();
      sub_252675AB0();
      sub_252646920(&qword_26B22AB20, MEMORY[0x263F047F8]);
      return sub_252675A30();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2526468C8(uint64_t a1, unint64_t a2)
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

uint64_t sub_252646920(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_252646968()
{
  unint64_t result = qword_26B22A960;
  if (!qword_26B22A960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22A960);
  }
  return result;
}

uint64_t sub_2526469BC(unint64_t *a1, uint64_t *a2)
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

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_252646A64(uint64_t a1)
{
  return sub_25265BE84(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_252646A78@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_252675FB0();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      uint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_252646B04(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_252646BC8(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_2526752F0();
  swift_allocObject();
  uint64_t result = sub_2526752A0();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_2526754A0();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_252646C44(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_2526752F0();
  swift_allocObject();
  uint64_t result = sub_2526752A0();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

unsigned char *sub_252646CC8(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)sub_252646B04(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_252646BC8((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_252646C44((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_252646D2C(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_2526752F0();
      swift_allocObject();
      sub_2526752C0();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_2526754A0();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

void *sub_252646DCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  char v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  uint64_t result = sub_252646354((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_252646E64, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_252646E38(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_252636330(a1, a2);
  }
  return a1;
}

uint64_t sub_252646E4C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_252646E64@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_252646A78(a1, a2);
}

uint64_t sub_252646E84()
{
  return swift_release();
}

uint64_t sub_252646E8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[19] = a7;
  v8[20] = a8;
  v8[17] = a5;
  v8[18] = a6;
  v8[15] = a3;
  v8[16] = a4;
  v8[13] = a1;
  v8[14] = a2;
  v8[21] = type metadata accessor for NetworkError(0);
  v8[22] = swift_task_alloc();
  uint64_t v9 = sub_252675470();
  v8[23] = v9;
  v8[24] = *(void *)(v9 - 8);
  v8[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A938);
  v8[26] = swift_task_alloc();
  uint64_t v10 = sub_2526750B0();
  v8[27] = v10;
  v8[28] = *(void *)(v10 - 8);
  v8[29] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_252647014, 0, 0);
}

uint64_t sub_252647014()
{
  char v24 = v0;
  uint64_t v1 = v0[28];
  uint64_t v22 = v0[27];
  uint64_t v2 = v0[26];
  uint64_t v4 = v0[19];
  unint64_t v3 = v0[20];
  uint64_t v6 = v0[17];
  unint64_t v5 = v0[18];
  char v8 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[14];
  uint64_t v7 = (char *)v0[15];
  type metadata accessor for GridLookupRequest();
  swift_initStackObject();
  sub_252665A38(v8, v7, v6, v5, v4, v3, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v2, 1, v22) == 1)
  {
    sub_252634810(v0[26], &qword_26B22A938);
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_2526759F0();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B22B718);
    swift_bridgeObjectRetain_n();
    uint64_t v10 = sub_2526759D0();
    os_log_type_t v11 = sub_252675E00();
    BOOL v12 = os_log_type_enabled(v10, v11);
    unint64_t v13 = v0[20];
    if (v12)
    {
      uint64_t v14 = v0[19];
      size_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v23 = v16;
      *(_DWORD *)size_t v15 = 136315138;
      swift_bridgeObjectRetain();
      v0[4] = sub_2526669DC(v14, v13, &v23);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v10, v11, "Unable generate request URL for Grid ID Lookup | traceId: %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v16, -1, -1);
      MEMORY[0x2533B8110](v15, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(void, uint64_t, uint64_t, void))(v0[24] + 56))(v0[13], 1, 1, v0[23]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v20 = (uint64_t (*)(void))v0[1];
    return v20(0);
  }
  else
  {
    (*(void (**)(void, void, void))(v0[28] + 32))(v0[29], v0[26], v0[27]);
    BOOL v17 = (void *)swift_task_alloc();
    v0[30] = v17;
    *BOOL v17 = v0;
    v17[1] = sub_252647374;
    uint64_t v18 = v0[29];
    uint64_t v19 = v0[25];
    return MEMORY[0x270EF1ED8](v19, v18, 0);
  }
}

uint64_t sub_252647374(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 248) = a1;
  *(void *)(v3 + 256) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_252648278;
  }
  else {
    uint64_t v4 = sub_252647488;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_252647488()
{
  uint64_t v95 = v0;
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    id v3 = *(id *)(v0 + 248);
    id v4 = objc_msgSend(v2, sel_statusCode);
    if (v4 == (id)304)
    {
      id v92 = v2;
      if (qword_26B22A6C0 != -1) {
        swift_once();
      }
      uint64_t v24 = sub_2526759F0();
      __swift_project_value_buffer(v24, (uint64_t)qword_26B22B718);
      swift_bridgeObjectRetain_n();
      uint64_t v25 = sub_2526759D0();
      os_log_type_t v26 = sub_252675DF0();
      BOOL v27 = os_log_type_enabled(v25, v26);
      uint64_t v29 = *(void *)(v0 + 224);
      uint64_t v28 = *(void *)(v0 + 232);
      uint64_t v30 = *(void *)(v0 + 216);
      uint64_t v31 = *(void *)(v0 + 192);
      unint64_t v88 = *(void **)(v0 + 248);
      uint64_t v91 = *(void *)(v0 + 200);
      uint64_t v85 = *(void *)(v0 + 184);
      unint64_t v32 = *(void *)(v0 + 160);
      if (v27)
      {
        uint64_t v82 = *(void *)(v0 + 152);
        uint64_t v33 = (uint8_t *)swift_slowAlloc();
        uint64_t v84 = v30;
        uint64_t v34 = swift_slowAlloc();
        v94[0] = v34;
        *(_DWORD *)uint64_t v33 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 88) = sub_2526669DC(v82, v32, v94);
        sub_252675EA0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25262F000, v25, v26, "Geohash File unmodified. Use existing file on disk. | traceId: %s", v33, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2533B8110](v34, -1, -1);
        MEMORY[0x2533B8110](v33, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v91, v85);
        (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v84);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v91, v85);
        (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
      }
      (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 192) + 56))(*(void *)(v0 + 104), 1, 1, *(void *)(v0 + 184));
      uint64_t v2 = v92;
      goto LABEL_26;
    }
    if (v4 == (id)200)
    {
      if (qword_26B22A6C0 != -1) {
        swift_once();
      }
      uint64_t v5 = sub_2526759F0();
      __swift_project_value_buffer(v5, (uint64_t)qword_26B22B718);
      swift_bridgeObjectRetain_n();
      uint64_t v6 = sub_2526759D0();
      os_log_type_t v7 = sub_252675DF0();
      BOOL v8 = os_log_type_enabled(v6, v7);
      uint64_t v9 = *(void **)(v0 + 248);
      uint64_t v11 = *(void *)(v0 + 224);
      uint64_t v10 = *(void *)(v0 + 232);
      uint64_t v12 = *(void *)(v0 + 216);
      unint64_t v13 = *(void *)(v0 + 160);
      if (v8)
      {
        uint64_t v83 = *(void *)(v0 + 152);
        uint64_t v90 = *(void **)(v0 + 248);
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        uint64_t v87 = v10;
        uint64_t v15 = swift_slowAlloc();
        v94[0] = v15;
        *(_DWORD *)uint64_t v14 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 96) = sub_2526669DC(v83, v13, v94);
        sub_252675EA0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25262F000, v6, v7, "New Geo Tile fetched | traceId: %s", v14, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2533B8110](v15, -1, -1);
        MEMORY[0x2533B8110](v14, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v87, v12);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
      }
      uint64_t v50 = *(void *)(v0 + 192);
      uint64_t v51 = *(void *)(v0 + 184);
      uint64_t v52 = *(void *)(v0 + 104);
      (*(void (**)(uint64_t, void, uint64_t))(v50 + 32))(v52, *(void *)(v0 + 200), v51);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v50 + 56))(v52, 0, 1, v51);
LABEL_26:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v53 = *(uint64_t (**)(void *))(v0 + 8);
      return v53(v2);
    }
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_2526759F0();
    __swift_project_value_buffer(v35, (uint64_t)qword_26B22B718);
    swift_bridgeObjectRetain_n();
    uint64_t v36 = sub_2526759D0();
    os_log_type_t v37 = sub_252675E00();
    BOOL v38 = os_log_type_enabled(v36, v37);
    unint64_t v39 = *(void *)(v0 + 160);
    id v93 = v2;
    if (v38)
    {
      uint64_t v40 = *(void *)(v0 + 152);
      unint64_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      v94[0] = v42;
      *(_DWORD *)unint64_t v41 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 80) = sub_2526669DC(v40, v39, v94);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v36, v37, "Error while checking for geohash tiles | traceId: %s", v41, 0xCu);
      swift_arrayDestroy();
      uint64_t v43 = v42;
      uint64_t v2 = v93;
      MEMORY[0x2533B8110](v43, -1, -1);
      MEMORY[0x2533B8110](v41, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    id v55 = *(id *)(v0 + 248);
    id v56 = objc_msgSend(v2, sel_description);
    uint64_t v57 = sub_252675BA0();
    unint64_t v59 = v58;

    swift_bridgeObjectRetain();
    uint64_t v60 = sub_2526759D0();
    os_log_type_t v61 = sub_252675E00();
    if (os_log_type_enabled(v60, v61))
    {
      unint64_t v62 = (uint8_t *)swift_slowAlloc();
      uint64_t v63 = swift_slowAlloc();
      v94[0] = v63;
      *(_DWORD *)unint64_t v62 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 72) = sub_2526669DC(v57, v59, v94);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v60, v61, "%s", v62, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v63, -1, -1);
      MEMORY[0x2533B8110](v62, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v64 = *(void **)(v0 + 248);
    uint64_t v65 = *(void *)(v0 + 192);
    uint64_t v66 = *(void *)(v0 + 200);
    uint64_t v67 = *(void *)(v0 + 184);
    sub_25264A454((unint64_t *)&qword_269C12678, (void (*)(uint64_t))type metadata accessor for NetworkError);
    char v48 = (void *)swift_allocError();
    *uint64_t v68 = objc_msgSend(v93, sel_statusCode);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v66, v67);
  }
  else
  {
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_2526759F0();
    __swift_project_value_buffer(v16, (uint64_t)qword_26B22B718);
    swift_bridgeObjectRetain_n();
    BOOL v17 = sub_2526759D0();
    os_log_type_t v18 = sub_252675E00();
    BOOL v19 = os_log_type_enabled(v17, v18);
    unint64_t v20 = *(void *)(v0 + 160);
    if (v19)
    {
      uint64_t v21 = *(void *)(v0 + 152);
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      v94[0] = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 64) = sub_2526669DC(v21, v20, v94);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v17, v18, "Unable to process GeoTiles Response. | traceId: %s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v23, -1, -1);
      MEMORY[0x2533B8110](v22, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    unint64_t v44 = *(void **)(v0 + 248);
    uint64_t v46 = *(void *)(v0 + 192);
    uint64_t v45 = *(void *)(v0 + 200);
    uint64_t v47 = *(void *)(v0 + 184);
    sub_25264A454((unint64_t *)&qword_269C12678, (void (*)(uint64_t))type metadata accessor for NetworkError);
    char v48 = (void *)swift_allocError();
    *uint64_t v49 = 2;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
  }
  if (qword_26B22A6C0 != -1) {
    swift_once();
  }
  uint64_t v69 = sub_2526759F0();
  __swift_project_value_buffer(v69, (uint64_t)qword_26B22B718);
  swift_bridgeObjectRetain();
  id v70 = v48;
  swift_bridgeObjectRetain();
  id v71 = v48;
  BOOL v72 = sub_2526759D0();
  os_log_type_t v73 = sub_252675E00();
  BOOL v74 = os_log_type_enabled(v72, v73);
  unint64_t v75 = *(void *)(v0 + 160);
  if (v74)
  {
    uint64_t v86 = *(void *)(v0 + 152);
    uint64_t v76 = swift_slowAlloc();
    uint64_t v77 = (void *)swift_slowAlloc();
    uint64_t v89 = swift_slowAlloc();
    v94[0] = v89;
    *(_DWORD *)uint64_t v76 = 138412546;
    id v78 = v48;
    uint64_t v79 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 48) = v79;
    sub_252675EA0();
    *uint64_t v77 = v79;

    *(_WORD *)(v76 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 56) = sub_2526669DC(v86, v75, v94);
    sub_252675EA0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25262F000, v72, v73, "Error while trying to fetch geohash tiles from server %@ | traceId: %s", (uint8_t *)v76, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C12820);
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v77, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v89, -1, -1);
    MEMORY[0x2533B8110](v76, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }

  *(void *)(v0 + 40) = v48;
  id v80 = v48;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12690);
  if (swift_dynamicCast())
  {
    sub_25264A3F8(*(void *)(v0 + 176));
    swift_willThrow();
  }
  else
  {
    sub_25265C20C(v48);
    swift_willThrow();
  }
  (*(void (**)(void, void))(*(void *)(v0 + 224) + 8))(*(void *)(v0 + 232), *(void *)(v0 + 216));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v81 = *(uint64_t (**)(void))(v0 + 8);
  return v81();
}

uint64_t sub_252648278()
{
  BOOL v19 = v0;
  uint64_t v1 = (void *)v0[32];
  if (qword_26B22A6C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2526759F0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B22B718);
  swift_bridgeObjectRetain();
  id v3 = v1;
  swift_bridgeObjectRetain();
  id v4 = v1;
  uint64_t v5 = sub_2526759D0();
  os_log_type_t v6 = sub_252675E00();
  BOOL v7 = os_log_type_enabled(v5, v6);
  unint64_t v8 = v0[20];
  if (v7)
  {
    uint64_t v16 = v0[19];
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = v17;
    *(_DWORD *)uint64_t v9 = 138412546;
    id v11 = v1;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[6] = v12;
    sub_252675EA0();
    void *v10 = v12;

    *(_WORD *)(v9 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[7] = sub_2526669DC(v16, v8, &v18);
    sub_252675EA0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25262F000, v5, v6, "Error while trying to fetch geohash tiles from server %@ | traceId: %s", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C12820);
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v17, -1, -1);
    MEMORY[0x2533B8110](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }

  v0[5] = v1;
  id v13 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12690);
  if (swift_dynamicCast())
  {
    sub_25264A3F8(v0[22]);
    swift_willThrow();
  }
  else
  {
    sub_25265C20C(v1);
    swift_willThrow();
  }
  (*(void (**)(void, void))(v0[28] + 8))(v0[29], v0[27]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_2526485D4(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v93 = a2;
  uint64_t v5 = sub_252675470();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = sub_252675BF0();
  uint64_t v9 = *(void *)(v99 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v99);
  id v92 = (char *)v84 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v98 = (char *)v84 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v84 - v14;
  if (qword_26B22A6C0 != -1) {
    goto LABEL_54;
  }
  while (1)
  {
    uint64_t v16 = sub_2526759F0();
    uint64_t v101 = __swift_project_value_buffer(v16, (uint64_t)qword_26B22B718);
    uint64_t v17 = sub_2526759D0();
    os_log_type_t v18 = sub_252675DE0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = a3;
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_25262F000, v17, v18, "Generating individual geohash tiles from parent geohash.", v20, 2u);
      uint64_t v21 = v20;
      a3 = v19;
      MEMORY[0x2533B8110](v21, -1, -1);
    }

    uint64_t v22 = sub_252675430();
    uint64_t v24 = v23;
    sub_252675BE0();
    type metadata accessor for StreamReader();
    swift_allocObject();
    uint64_t v25 = sub_252674BA8(v22, v24, 10, 0xE100000000000000, (uint64_t)v15, 4096);
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, a1, v5);
      uint64_t v30 = sub_2526759D0();
      os_log_type_t v31 = sub_252675E00();
      if (os_log_type_enabled(v30, v31))
      {
        unint64_t v32 = (uint8_t *)swift_slowAlloc();
        uint64_t v33 = swift_slowAlloc();
        uint64_t v105 = v33;
        *(_DWORD *)unint64_t v32 = 136315138;
        uint64_t v34 = sub_252675430();
        uint64_t v103 = sub_2526669DC(v34, v35, &v105);
        sub_252675EA0();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        _os_log_impl(&dword_25262F000, v30, v31, "Unable to open file stream for file :%s", v32, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2533B8110](v33, -1, -1);
        MEMORY[0x2533B8110](v32, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      }

      goto LABEL_17;
    }
    uint64_t v15 = (char *)v25;
    if (qword_26B22A6B0 != -1) {
      swift_once();
    }
    uint64_t v105 = qword_26B22B708;
    uint64_t v106 = unk_26B22B710;
    swift_bridgeObjectRetain();
    sub_25263CB4C();
    sub_252675C70();
    swift_bridgeObjectRelease();
    sub_252675C70();
    sub_252675C70();
    os_log_type_t v26 = v106;
    id v27 = sub_252653354();
    swift_bridgeObjectRelease();
    if ((v27 & 1) == 0)
    {
      uint64_t v36 = sub_2526759D0();
      os_log_type_t v37 = sub_252675E00();
      if (os_log_type_enabled(v36, v37))
      {
        BOOL v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)BOOL v38 = 0;
        _os_log_impl(&dword_25262F000, v36, v37, "Unable to create directory for saving GeoHash Polygons", v38, 2u);
        MEMORY[0x2533B8110](v38, -1, -1);
      }
      swift_release();

      goto LABEL_17;
    }
    uint64_t v88 = a3;
    id v91 = objc_msgSend(self, sel_defaultManager);
    uint64_t v6 = OBJC_IVAR____TtC12HomeServices12StreamReader_fileHandle;
    if (!*(void *)&v15[OBJC_IVAR____TtC12HomeServices12StreamReader_fileHandle])
    {
LABEL_51:
      __break(1u);
      goto LABEL_52;
    }
    LODWORD(v90) = 0;
    uint64_t v89 = 0;
    uint64_t v29 = &v15[OBJC_IVAR____TtC12HomeServices12StreamReader_delimData];
    uint64_t v96 = &v15[OBJC_IVAR____TtC12HomeServices12StreamReader_encoding];
    uint64_t v95 = (void (**)(char *, char *, uint64_t))(v9 + 16);
    uint64_t v100 = OBJC_IVAR____TtC12HomeServices12StreamReader_atEof;
    uint64_t v97 = OBJC_IVAR____TtC12HomeServices12StreamReader_buffer;
    uint64_t v102 = OBJC_IVAR____TtC12HomeServices12StreamReader_chunkSize;
    uint64_t v87 = (void (**)(char *, uint64_t))(v9 + 8);
    uint64_t v86 = &v104;
    *(void *)&long long v28 = 136315138;
    long long v85 = v28;
    v84[1] = MEMORY[0x263F8EE58] + 8;
    unint64_t v94 = &v15[OBJC_IVAR____TtC12HomeServices12StreamReader_delimData];
LABEL_21:
    if (v15[v100]) {
      goto LABEL_45;
    }
    uint64_t v40 = *(void **)&v15[v97];
    if (!v40) {
      goto LABEL_56;
    }
    if (*((void *)v29 + 1) >> 60 == 15) {
      goto LABEL_57;
    }
    unint64_t v41 = (void *)sub_2526754D0();
    a1 = (char *)objc_msgSend(v40, sel_rangeOfData_options_range_, v41, 0, 0, objc_msgSend(v40, sel_length));
    uint64_t v43 = v42;

LABEL_27:
    if (a1 == (char *)sub_252675000()) {
      break;
    }
    id v58 = objc_msgSend(v40, sel_subdataWithRange_, 0, a1);
    unint64_t v8 = (char *)sub_2526754F0();
    unint64_t v60 = v59;

    uint64_t v5 = (uint64_t)v98;
    (*v95)(v98, v96, v99);
    a3 = sub_252675BC0();
    uint64_t v9 = v61;
    sub_252636330((uint64_t)v8, v60);
    if (!__OFADD__(a1, v43))
    {
      objc_msgSend(v40, sel_replaceBytesInRange_withBytes_length_, 0, &a1[v43], 0, 0);
      uint64_t v29 = v94;
      if (!v9) {
        goto LABEL_45;
      }
      goto LABEL_38;
    }
    __break(1u);
LABEL_54:
    swift_once();
  }
  uint64_t v47 = *(void **)&v15[v6];
  if (!v47)
  {
    __break(1u);
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
    JUMPOUT(0x2526493E0);
  }
  id v48 = objc_msgSend(v47, sel_readDataOfLength_, *(void *)&v15[v102]);
  uint64_t v49 = sub_2526754F0();
  unint64_t v51 = v50;

  switch(v51 >> 62)
  {
    case 1uLL:
      uint64_t v52 = (int)v49;
      uint64_t v53 = v49 >> 32;
      goto LABEL_32;
    case 2uLL:
      uint64_t v52 = *(void *)(v49 + 16);
      uint64_t v53 = *(void *)(v49 + 24);
LABEL_32:
      if (v52 == v53) {
        goto LABEL_33;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_33;
    default:
      if ((v51 & 0xFF000000000000) != 0)
      {
LABEL_26:
        unint64_t v44 = (void *)sub_2526754D0();
        objc_msgSend(v40, sel_appendData_, v44);

        uint64_t v45 = (void *)sub_2526754D0();
        a1 = (char *)objc_msgSend(v40, sel_rangeOfData_options_range_, v45, 0, 0, objc_msgSend(v40, sel_length));
        uint64_t v43 = v46;
        sub_252636330(v49, v51);

        goto LABEL_27;
      }
LABEL_33:
      v15[v100] = 1;
      if ((uint64_t)objc_msgSend(v40, sel_length) < 1)
      {
        sub_252636330(v49, v51);
LABEL_45:
        BOOL v72 = sub_2526759D0();
        os_log_type_t v73 = sub_252675E20();
        if (os_log_type_enabled(v72, v73))
        {
          BOOL v74 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)BOOL v74 = 0;
          _os_log_impl(&dword_25262F000, v72, v73, "Wrote all geohash tile to disk.", v74, 2u);
          MEMORY[0x2533B8110](v74, -1, -1);
        }

        swift_release();
        char v39 = (char)v90;
        return v39 & 1;
      }
      uint64_t v54 = sub_2526754F0();
      unint64_t v56 = v55;
      (*v95)(v98, v96, v99);
      a3 = sub_252675BC0();
      uint64_t v9 = v57;
      sub_252636330(v54, v56);
      objc_msgSend(v40, sel_setLength_, 0);
      sub_252636330(v49, v51);
      uint64_t v29 = v94;
      if (!v9) {
        goto LABEL_45;
      }
LABEL_38:
      sub_2526537B0(a3, v9);
      if (!v62)
      {
        swift_bridgeObjectRelease();
        os_log_type_t v26 = sub_2526759D0();
        os_log_type_t v63 = sub_252675E00();
        id v27 = (id)v63;
        if (os_log_type_enabled(v26, v63))
        {
          uint64_t v64 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v64 = 0;
          _os_log_impl(&dword_25262F000, v26, (os_log_type_t)v27, "Unable to find file name for the geo hash string", v64, 2u);
          MEMORY[0x2533B8110](v64, -1, -1);
        }
        goto LABEL_20;
      }
      uint64_t v105 = qword_26B22B708;
      uint64_t v106 = unk_26B22B710;
      swift_bridgeObjectRetain();
      sub_25263CB4C();
      sub_252675C70();
      swift_bridgeObjectRelease();
      sub_252675C70();
      sub_252675C70();
      sub_252675C70();
      sub_252675C70();
      sub_252675C70();
      swift_bridgeObjectRelease();
      uint64_t v66 = v105;
      unint64_t v65 = (unint64_t)v106;
      uint64_t v105 = a3;
      uint64_t v106 = v9;
      uint64_t v103 = v66;
      unint64_t v104 = v65;
      uint64_t v67 = v92;
      sub_252675BE0();
      sub_25263647C();
      id v27 = v89;
      sub_252675EF0();
      if (!v27)
      {
        uint64_t v89 = 0;
        (*v87)(v67, v99);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain_n();
        uint64_t v68 = sub_2526759D0();
        os_log_type_t v69 = sub_252675DF0();
        id v27 = (id)v69;
        if (os_log_type_enabled(v68, v69))
        {
          id v70 = (uint8_t *)swift_slowAlloc();
          uint64_t v71 = swift_slowAlloc();
          uint64_t v105 = v71;
          *(_DWORD *)id v70 = v85;
          uint64_t v90 = v70 + 4;
          swift_bridgeObjectRetain();
          uint64_t v103 = sub_2526669DC(v66, v65, &v105);
          sub_252675EA0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_25262F000, v68, (os_log_type_t)v27, "Successfully wrote to %s", v70, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2533B8110](v71, -1, -1);
          MEMORY[0x2533B8110](v70, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        os_log_type_t v26 = sub_252675B90();
        swift_bridgeObjectRelease();
        LODWORD(v90) = objc_msgSend(v91, sel_fileExistsAtPath_, v26);
LABEL_20:

        if (!*(void *)&v15[v6]) {
          goto LABEL_51;
        }
        goto LABEL_21;
      }
      (*v87)(v67, v99);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v76 = v27;
      id v77 = v27;
      os_log_type_t v26 = sub_2526759D0();
      os_log_type_t v78 = sub_252675E00();
      if (os_log_type_enabled(v26, v78))
      {
        uint64_t v79 = v27;
        id v80 = (uint8_t *)swift_slowAlloc();
        uint64_t v81 = (void *)swift_slowAlloc();
        *(_DWORD *)id v80 = 138412290;
        id v82 = v79;
        uint64_t v83 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v105 = v83;
        sub_252675EA0();
        *uint64_t v81 = v83;

        _os_log_impl(&dword_25262F000, v26, v78, "Error while trying to geohash String to file %@", v80, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C12820);
        swift_arrayDestroy();
        MEMORY[0x2533B8110](v81, -1, -1);
        MEMORY[0x2533B8110](v80, -1, -1);

        swift_release();
        goto LABEL_17;
      }
LABEL_52:
      swift_release();

LABEL_17:
      char v39 = 0;
      return v39 & 1;
  }
}

uint64_t sub_2526493F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  MEMORY[0x270FA5388](v6 - 8);
  unint64_t v8 = (char *)v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_252675620();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B22A6C0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_2526759F0();
  __swift_project_value_buffer(v13, (uint64_t)qword_26B22B718);
  uint64_t v14 = sub_2526759D0();
  os_log_type_t v15 = sub_252675DE0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    v39[1] = a1;
    uint64_t v17 = a2;
    os_log_type_t v18 = v12;
    uint64_t v19 = v16;
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_25262F000, v14, v15, "Trying to save metadata about downloaded geohash tile.", v16, 2u);
    uint64_t v20 = v19;
    uint64_t v12 = v18;
    a2 = v17;
    MEMORY[0x2533B8110](v20, -1, -1);
  }

  sub_252636F90((uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
    return sub_252634810((uint64_t)v8, &qword_26B22AAB0);
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  uint64_t v22 = sub_252637100();
  if (v23)
  {
    uint64_t v24 = v22;
    uint64_t v25 = v23;
    uint64_t v42 = a2;
    uint64_t v43 = a3;
    long long v44 = 0u;
    long long v45 = 0u;
    swift_bridgeObjectRetain();
    sub_252636510();
    uint64_t v41 = MEMORY[0x263F8D310];
    v40[0] = v24;
    v40[1] = v25;
    os_log_type_t v26 = (__CFString *)sub_252675B90();
    __swift_instantiateConcreteTypeFromMangledName(qword_26B22AA80);
    id v27 = (const void *)sub_252675E80();
    long long v28 = v12;
    uint64_t v29 = (__CFString *)sub_252675B90();
    CFPreferencesSetAppValue(v26, v27, v29);

    swift_unknownObjectRelease();
    uint64_t v12 = v28;
    uint64_t v30 = (__CFString *)sub_252675B90();
    CFPreferencesAppSynchronize(v30);
    swift_bridgeObjectRelease();

    sub_252634810((uint64_t)v40, qword_26B22AA80);
    sub_252636600();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v41 = v9;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v40);
    (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 16))(boxed_opaque_existential_1, v28, v9);
    unint64_t v32 = (__CFString *)sub_252675B90();
    uint64_t v33 = (const void *)sub_252675E80();
    uint64_t v34 = (__CFString *)sub_252675B90();
    CFPreferencesSetAppValue(v32, v33, v34);

    swift_unknownObjectRelease();
    unint64_t v35 = (__CFString *)sub_252675B90();
    CFPreferencesAppSynchronize(v35);
    swift_bridgeObjectRelease();

    sub_252634810((uint64_t)v40, qword_26B22AA80);
    uint64_t v36 = sub_2526759D0();
    os_log_type_t v37 = sub_252675E20();
    if (os_log_type_enabled(v36, v37))
    {
      BOOL v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v38 = 0;
      _os_log_impl(&dword_25262F000, v36, v37, "Saved metadata about downloaded geohash tile to defaults", v38, 2u);
      MEMORY[0x2533B8110](v38, -1, -1);
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_2526498A0()
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v0 = sub_252675AB0();
  uint64_t v21 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_252675A60();
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388](v3);
  os_log_type_t v18 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252675BF0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v22 = 0;
  *((void *)&v22 + 1) = 0xE000000000000000;
  sub_252675FA0();
  swift_bridgeObjectRelease();
  *(void *)&long long v22 = 0xD000000000000027;
  *((void *)&v22 + 1) = 0x8000000252679630;
  sub_25263CB4C();
  sub_252675C70();
  swift_bridgeObjectRelease();
  *(void *)&long long v22 = 0;
  *((void *)&v22 + 1) = 0xE000000000000000;
  sub_252675DA0();
  sub_252675C70();
  sub_252675DA0();
  sub_252675C70();
  sub_252675C70();
  swift_bridgeObjectRelease();
  sub_252675BE0();
  uint64_t v9 = sub_252675BB0();
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v12 = 0;
  if (v11 >> 60 != 15)
  {
    sub_25264A454(&qword_26B22AB20, MEMORY[0x263F047F8]);
    sub_252675A50();
    switch(v11 >> 62)
    {
      case 1uLL:
        if (v9 >> 32 < (int)v9) {
          __break(1u);
        }
        sub_2526468C8(v9, v11);
        sub_2526467E8((int)v9, v9 >> 32);
        break;
      case 2uLL:
        uint64_t v13 = *(void *)(v9 + 16);
        uint64_t v14 = *(void *)(v9 + 24);
        sub_25264A0A8(v9, v11);
        swift_retain();
        swift_retain();
        sub_2526467E8(v13, v14);
        swift_release();
        swift_release();
        break;
      case 3uLL:
        *(void *)((char *)&v22 + 6) = 0;
        *(void *)&long long v22 = 0;
        goto LABEL_8;
      default:
        *(void *)&long long v22 = v9;
        WORD4(v22) = v11;
        BYTE10(v22) = BYTE2(v11);
        BYTE11(v22) = BYTE3(v11);
        BYTE12(v22) = BYTE4(v11);
        BYTE13(v22) = BYTE5(v11);
LABEL_8:
        sub_252675A30();
        break;
    }
    sub_252646E38(v9, v11);
    uint64_t v15 = v21;
    uint64_t v16 = v18;
    sub_252675A40();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v2, v0);
    uint64_t v12 = sub_252643FC0();
    sub_252646E38(v9, v11);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v20);
  }
  return v12;
}

uint64_t sub_252649DE8()
{
  sub_2526498A0();
  if (!v0)
  {
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_2526759F0();
    __swift_project_value_buffer(v14, (uint64_t)qword_26B22B718);
    unint64_t v10 = sub_2526759D0();
    os_log_type_t v11 = sub_252675E00();
    if (!os_log_type_enabled(v10, v11)) {
      goto LABEL_18;
    }
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    uint64_t v13 = "Unable to generate key for looking up grid info.";
    goto LABEL_17;
  }
  uint64_t v1 = (__CFString *)sub_252675B90();
  uint64_t v2 = (__CFString *)sub_252675B90();
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(v1, v2);
  swift_bridgeObjectRelease();

  if (!v3 || (swift_dynamicCast() & 1) == 0)
  {
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_2526759F0();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B22B718);
    unint64_t v10 = sub_2526759D0();
    os_log_type_t v11 = sub_252675E00();
    if (!os_log_type_enabled(v10, v11)) {
      goto LABEL_18;
    }
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    uint64_t v13 = "Unable to lookup computed grid from disk.";
LABEL_17:
    _os_log_impl(&dword_25262F000, v10, v11, v13, v12, 2u);
    MEMORY[0x2533B8110](v12, -1, -1);
LABEL_18:

    return 0;
  }
  uint64_t v4 = v16;
  if (qword_26B22A6C0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2526759F0();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B22B718);
  uint64_t v6 = sub_2526759D0();
  os_log_type_t v7 = sub_252675E20();
  if (os_log_type_enabled(v6, v7))
  {
    unint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v8 = 0;
    _os_log_impl(&dword_25262F000, v6, v7, "Successfully retrieved computed grid from disk.", v8, 2u);
    MEMORY[0x2533B8110](v8, -1, -1);
  }

  return v4;
}

uint64_t sub_25264A0A8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2526468C8(a1, a2);
  }
  return a1;
}

void sub_25264A0BC(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_2526759F0();
    __swift_project_value_buffer(v13, (uint64_t)qword_26B22B718);
    oslog = sub_2526759D0();
    os_log_type_t v14 = sub_252675E00();
    if (!os_log_type_enabled(oslog, v14)) {
      goto LABEL_17;
    }
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    uint64_t v16 = "No grid information to save.";
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  sub_2526498A0();
  if (v4)
  {
    v19[3] = MEMORY[0x263F8D310];
    v19[0] = a1;
    v19[1] = a2;
    uint64_t v5 = (__CFString *)sub_252675B90();
    __swift_instantiateConcreteTypeFromMangledName(qword_26B22AA80);
    uint64_t v6 = (const void *)sub_252675E80();
    os_log_type_t v7 = (__CFString *)sub_252675B90();
    CFPreferencesSetAppValue(v5, v6, v7);

    swift_unknownObjectRelease();
    unint64_t v8 = (__CFString *)sub_252675B90();
    CFPreferencesAppSynchronize(v8);
    swift_bridgeObjectRelease();

    sub_252634810((uint64_t)v19, qword_26B22AA80);
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_2526759F0();
    __swift_project_value_buffer(v9, (uint64_t)qword_26B22B718);
    unint64_t v10 = sub_2526759D0();
    os_log_type_t v11 = sub_252675E20();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_25262F000, v10, v11, "Saved computed grid for coordinate value.", v12, 2u);
      MEMORY[0x2533B8110](v12, -1, -1);
    }

    return;
  }
  swift_bridgeObjectRelease();
  if (qword_26B22A6C0 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_2526759F0();
  __swift_project_value_buffer(v17, (uint64_t)qword_26B22B718);
  oslog = sub_2526759D0();
  os_log_type_t v14 = sub_252675E00();
  if (os_log_type_enabled(oslog, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    uint64_t v16 = "Unable to generate key for saving grid info.";
LABEL_16:
    _os_log_impl(&dword_25262F000, oslog, v14, v16, v15, 2u);
    MEMORY[0x2533B8110](v15, -1, -1);
  }
LABEL_17:
}

uint64_t sub_25264A3F8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NetworkError(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25264A454(unint64_t *a1, void (*a2)(uint64_t))
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

Swift::String __swiftcall CLLocationCoordinate2D.geohash(length:)(Swift::Int length)
{
  double v3 = v2;
  double v4 = v1;
  type metadata accessor for Geohash();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = 0;
  *(void *)(inited + 24) = 0;
  uint64_t v7 = sub_25264A868(length, v4, v3);
  uint64_t v9 = v8;
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = v7;
  os_log_type_t v11 = v9;
  result._object = v11;
  result._countAndFlagsBits = v10;
  return result;
}

uint64_t type metadata accessor for Geohash()
{
  return self;
}

int64_t sub_25264A54C(int64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = *(void *)(a2 + 16);
    if ((uint64_t)v2 >= result) {
      unint64_t v3 = result;
    }
    else {
      unint64_t v3 = *(void *)(a2 + 16);
    }
    if (!result) {
      unint64_t v3 = 0;
    }
    if (v2 >= v3) {
      return a2;
    }
  }
  __break(1u);
  return result;
}

Swift::String __swiftcall CLLocation.geohash(length:)(Swift::Int length)
{
  type metadata accessor for Geohash();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = 0;
  *(void *)(inited + 24) = 0;
  objc_msgSend(v1, sel_coordinate);
  double v5 = v4;
  objc_msgSend(v1, sel_coordinate);
  uint64_t v7 = sub_25264A868(length, v5, v6);
  uint64_t v9 = v8;
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = v7;
  os_log_type_t v11 = v9;
  result._object = v11;
  result._countAndFlagsBits = v10;
  return result;
}

CLLocation __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CLLocation.init(geohash:)(Swift::String geohash)
{
  object = (objc_class *)geohash._object;
  uint64_t countAndFlagsBits = geohash._countAndFlagsBits;
  type metadata accessor for Geohash();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = 0;
  *(void *)(inited + 24) = 0;
  sub_25264B200(countAndFlagsBits, (unint64_t)object);
  if (v1)
  {
    swift_setDeallocating();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v10 = v5;
    double v11 = v6;
    double v12 = v7;
    double v13 = v8;
    swift_bridgeObjectRelease();
    object = (objc_class *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithLatitude_longitude_, (v10 + v11) * 0.5, (v12 + v13) * 0.5);
    swift_setDeallocating();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_log_type_t v14 = object;
  result._internal = v9;
  result.super.isa = v14;
  return result;
}

uint64_t static Geohash.Error.== infix(_:_:)()
{
  return 1;
}

uint64_t Geohash.Error.hash(into:)()
{
  return sub_2526761C0();
}

uint64_t Geohash.Error.hashValue.getter()
{
  return sub_2526761D0();
}

uint64_t sub_25264A7BC()
{
  return sub_2526761D0();
}

uint64_t sub_25264A800()
{
  return sub_2526761C0();
}

uint64_t sub_25264A828()
{
  return sub_2526761D0();
}

uint64_t sub_25264A868(uint64_t result, double a2, double a3)
{
  double v4 = ceil((double)result * 5.0 * 0.5);
  if ((~*(void *)&v4 & 0x7FF0000000000000) == 0)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  if (v4 <= -9.22337204e18)
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  if (v4 >= 9.22337204e18)
  {
LABEL_77:
    __break(1u);
    return result;
  }
  int64_t v75 = result;
  unint64_t v78 = (uint64_t)v4;
  uint64_t v5 = sub_25264B00C((uint64_t)v4, a2);
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    double v7 = (double *)(v5 + 32);
    double v8 = (void *)MEMORY[0x263F8EE78];
    double v9 = -90.0;
    double v10 = 90.0;
    do
    {
      double v13 = *v7;
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v15 = v8;
      if (v13 >= (v10 + v9) * 0.5)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          uint64_t v15 = sub_25264BFA0(0, v8[2] + 1, 1, v8);
        }
        unint64_t v20 = v15[2];
        unint64_t v19 = v15[3];
        if (v20 >= v19 >> 1) {
          uint64_t v15 = sub_25264BFA0((void *)(v19 > 1), v20 + 1, 1, v15);
        }
        v15[2] = v20 + 1;
        double v11 = &v15[2 * v20];
        v11[4] = 49;
        double v12 = v11 + 4;
        double v9 = (v10 + v9) * 0.5;
      }
      else
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          uint64_t v15 = sub_25264BFA0(0, v8[2] + 1, 1, v8);
        }
        unint64_t v17 = v15[2];
        unint64_t v16 = v15[3];
        if (v17 >= v16 >> 1) {
          uint64_t v15 = sub_25264BFA0((void *)(v16 > 1), v17 + 1, 1, v15);
        }
        v15[2] = v17 + 1;
        os_log_type_t v18 = &v15[2 * v17];
        v18[4] = 48;
        double v12 = v18 + 4;
        double v10 = (v10 + v9) * 0.5;
      }
      v12[1] = 0xE100000000000000;
      swift_bridgeObjectRelease();
      ++v7;
      double v8 = v15;
      --v6;
    }
    while (v6);
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  uint64_t v21 = sub_25264B00C(v78, a3);
  uint64_t v22 = *(void *)(v21 + 16);
  if (v22)
  {
    uint64_t v23 = (double *)(v21 + 32);
    uint64_t v24 = (void *)MEMORY[0x263F8EE78];
    double v25 = -180.0;
    double v26 = 180.0;
    do
    {
      double v29 = *v23;
      swift_bridgeObjectRetain();
      char v30 = swift_isUniquelyReferenced_nonNull_native();
      os_log_type_t v31 = v24;
      if (v29 >= (v26 + v25) * 0.5)
      {
        if ((v30 & 1) == 0) {
          os_log_type_t v31 = sub_25264BFA0(0, v24[2] + 1, 1, v24);
        }
        unint64_t v36 = v31[2];
        unint64_t v35 = v31[3];
        if (v36 >= v35 >> 1) {
          os_log_type_t v31 = sub_25264BFA0((void *)(v35 > 1), v36 + 1, 1, v31);
        }
        v31[2] = v36 + 1;
        id v27 = &v31[2 * v36];
        v27[4] = 49;
        long long v28 = v27 + 4;
        double v25 = (v26 + v25) * 0.5;
      }
      else
      {
        if ((v30 & 1) == 0) {
          os_log_type_t v31 = sub_25264BFA0(0, v24[2] + 1, 1, v24);
        }
        unint64_t v33 = v31[2];
        unint64_t v32 = v31[3];
        if (v33 >= v32 >> 1) {
          os_log_type_t v31 = sub_25264BFA0((void *)(v32 > 1), v33 + 1, 1, v31);
        }
        v31[2] = v33 + 1;
        uint64_t v34 = &v31[2 * v33];
        v34[4] = 48;
        long long v28 = v34 + 4;
        double v26 = (v26 + v25) * 0.5;
      }
      v28[1] = 0xE100000000000000;
      swift_bridgeObjectRelease();
      ++v23;
      uint64_t v24 = v31;
      --v22;
    }
    while (v22);
  }
  else
  {
    os_log_type_t v31 = (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  uint64_t v77 = v31[2];
  if (v77)
  {
    CLLocation result = swift_bridgeObjectRetain();
    uint64_t v37 = 0;
    unint64_t v38 = 0;
    char v39 = (void *)MEMORY[0x263F8EE78];
    id v76 = v15;
    while (v38 < v15[2])
    {
      int64_t v40 = v39[2];
      int64_t v41 = v40 + 2;
      if (__OFADD__(v40, 2)) {
        goto LABEL_72;
      }
      uint64_t v42 = v31[v37 + 4];
      uint64_t v43 = v31[v37 + 5];
      uint64_t v44 = v15[v37 + 5];
      uint64_t v79 = v15[v37 + 4];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      long long v45 = (void *)swift_isUniquelyReferenced_nonNull_native();
      if (!v45 || v41 > v39[3] >> 1)
      {
        if (v40 <= v41) {
          int64_t v46 = v40 + 2;
        }
        else {
          int64_t v46 = v40;
        }
        char v39 = sub_25264BFA0(v45, v46, 1, v39);
      }
      unint64_t v48 = v39[2];
      unint64_t v47 = v39[3];
      unint64_t v49 = v48 + 1;
      swift_bridgeObjectRetain();
      if (v48 >= v47 >> 1) {
        char v39 = sub_25264BFA0((void *)(v47 > 1), v48 + 1, 1, v39);
      }
      void v39[2] = v49;
      unint64_t v50 = &v39[2 * v48];
      v50[4] = v42;
      v50[5] = v43;
      unint64_t v51 = v39[3];
      swift_bridgeObjectRetain();
      if (v49 >= v51 >> 1) {
        char v39 = sub_25264BFA0((void *)(v51 > 1), v48 + 2, 1, v39);
      }
      uint64_t v15 = v76;
      ++v38;
      void v39[2] = v48 + 2;
      uint64_t v52 = &v39[2 * v49];
      v52[4] = v79;
      v52[5] = v44;
      swift_bridgeObjectRelease();
      CLLocation result = swift_bridgeObjectRelease();
      v37 += 2;
      if (v77 == v38)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_51;
      }
    }
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  swift_bridgeObjectRelease();
  char v39 = (void *)MEMORY[0x263F8EE78];
LABEL_51:
  swift_bridgeObjectRelease();
  uint64_t v53 = v39[2];
  if (v53)
  {
    swift_bridgeObjectRetain();
    uint64_t v54 = 0;
    unint64_t v55 = 0;
    unint64_t v56 = v39 + 5;
    uint64_t v57 = (void *)MEMORY[0x263F8EE78];
    do
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      CLLocation result = sub_252675D20();
      uint64_t v59 = result;
      uint64_t v61 = v60;
      if (v54 + 5 * (v55 / 5))
      {
        if (!v57[2]) {
          goto LABEL_73;
        }
        CLLocation result = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v62 = v57;
        if (result)
        {
          uint64_t v63 = v57[2];
          if (!v63) {
            goto LABEL_74;
          }
        }
        else
        {
          CLLocation result = (uint64_t)sub_25264C75C(v57);
          uint64_t v62 = (void *)result;
          uint64_t v63 = *(void *)(result + 16);
          if (!v63) {
            goto LABEL_74;
          }
        }
        uint64_t v64 = v63 - 1;
        unint64_t v65 = &v62[2 * v64];
        uint64_t v67 = v65[4];
        uint64_t v66 = v65[5];
        v62[2] = v64;
        uint64_t v80 = v67;
        uint64_t v81 = v66;
        sub_252675C70();
        swift_bridgeObjectRelease();
        unint64_t v69 = v62[2];
        unint64_t v68 = v62[3];
        if (v69 >= v68 >> 1) {
          uint64_t v62 = sub_25264BFA0((void *)(v68 > 1), v69 + 1, 1, v62);
        }
        v62[2] = v69 + 1;
        id v58 = &v62[2 * v69];
        v58[4] = v80;
        v58[5] = v81;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v57 = v62;
      }
      else
      {
        id v70 = v57;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v70 = sub_25264BFA0(0, v57[2] + 1, 1, v57);
        }
        unint64_t v72 = v70[2];
        unint64_t v71 = v70[3];
        if (v72 >= v71 >> 1) {
          id v70 = sub_25264BFA0((void *)(v71 > 1), v72 + 1, 1, v70);
        }
        v70[2] = v72 + 1;
        os_log_type_t v73 = &v70[2 * v72];
        v73[4] = v59;
        v73[5] = v61;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v57 = v70;
      }
      v56 += 2;
      ++v55;
      --v54;
      --v53;
    }
    while (v53);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v57 = (void *)MEMORY[0x263F8EE78];
  }
  swift_retain();
  BOOL v74 = sub_25264CB84((uint64_t)v57);
  swift_bridgeObjectRelease();
  swift_release();
  sub_25264A54C(v75, (uint64_t)v74);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A710);
  sub_2526469BC(&qword_26B22A708, &qword_26B22A710);
  return sub_252675D10();
}

uint64_t sub_25264B00C(unint64_t a1, double a2)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_252676040();
    __break(1u);
    return result;
  }
  if (!a1) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t result = sub_252675D90();
  *(void *)(result + 16) = a1;
  double v4 = (double *)(result + 32);
  if (a1 < 4)
  {
    unint64_t v5 = 0;
    double v6 = a2;
LABEL_9:
    unint64_t v10 = a1 - v5;
    do
    {
      *v4++ = v6;
      --v10;
    }
    while (v10);
    return result;
  }
  unint64_t v5 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  v4 += a1 & 0xFFFFFFFFFFFFFFFCLL;
  double v6 = a2;
  int64x2_t v7 = vdupq_lane_s64(*(uint64_t *)&a2, 0);
  double v8 = (int64x2_t *)(result + 48);
  unint64_t v9 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *double v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v5 != a1) {
    goto LABEL_9;
  }
  return result;
}

double sub_25264B100(double a1, double a2)
{
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_252675C90();
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      double v8 = (a1 + a2) * 0.5;
      if (v4 == 49 && v6 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v7 = sub_252676130();
        swift_bridgeObjectRelease();
        if ((v7 & 1) == 0)
        {
          a2 = (a1 + a2) * 0.5;
          double v8 = a1;
        }
      }
      uint64_t v4 = sub_252675C90();
      uint64_t v6 = v9;
      a1 = v8;
    }
    while (v9);
  }
  else
  {
    double v8 = a1;
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_25264B200(uint64_t a1, unint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_252675C40();
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_25264C82C(v4, 0);
    swift_bridgeObjectRetain();
    char v7 = sub_25264C770(&v21, v6 + 4, v5, a1, a2);
    uint64_t result = swift_bridgeObjectRelease();
    if (v7 != (void *)v5) {
      goto LABEL_24;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v21 = 0;
  unint64_t v22 = 0xE000000000000000;
  uint64_t v9 = v6[2];
  if (v9)
  {
    swift_retain();
    unint64_t v10 = v6 + 5;
    do
    {
      uint64_t v12 = *(v10 - 1);
      uint64_t v11 = *v10;
      swift_bridgeObjectRetain_n();
      if (*(void *)(sub_25264B574() + 16)
        && (sub_25264C4D4(v12, v11, MEMORY[0x263F8D110], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25264C568), (v13 & 1) != 0))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_252675C70();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
      swift_bridgeObjectRelease();
      v10 += 2;
      --v9;
    }
    while (v9);
    swift_release_n();
    uint64_t v14 = v21;
    unint64_t v15 = v22;
  }
  else
  {
    swift_release();
    uint64_t v14 = 0;
    unint64_t v15 = 0xE000000000000000;
  }
  if (0xCCCCCCCCCCCCCCCDLL * sub_252675C40() + 0x1999999999999999 >= 0x3333333333333333)
  {
    swift_bridgeObjectRelease();
    sub_25264CD18();
    swift_allocError();
    return swift_willThrow();
  }
  uint64_t v16 = HIBYTE(v15) & 0xF;
  if ((v15 & 0x2000000000000000) == 0) {
    uint64_t v16 = v14 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v21 = v14;
  unint64_t v22 = v15;
  uint64_t v23 = 0;
  uint64_t v24 = v16;
  swift_bridgeObjectRetain();
  uint64_t result = sub_252675C90();
  uint64_t v18 = v17;
  if (!v17)
  {
LABEL_22:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25264B100(-90.0, 90.0);
    sub_25264B100(-180.0, 180.0);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  uint64_t v19 = 0;
  while (!__OFADD__(v19, 1))
  {
    MEMORY[0x2533B7580](result, v18);
    swift_bridgeObjectRelease();
    uint64_t result = sub_252675C90();
    uint64_t v18 = v20;
    ++v19;
    if (!v20) {
      goto LABEL_22;
    }
  }
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_25264B574()
{
  if (*(void *)(v0 + 16))
  {
    uint64_t v1 = *(void *)(v0 + 16);
  }
  else
  {
    uint64_t v1 = sub_25264B5D0();
    *(void *)(v0 + 16) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25264B5D0()
{
  uint64_t v0 = sub_252675C90();
  if (!v1)
  {
    uint64_t v5 = (void *)MEMORY[0x263F8EE80];
LABEL_31:
    swift_bridgeObjectRelease();
    return (uint64_t)v5;
  }
  uint64_t v2 = v0;
  uint64_t v3 = v1;
  uint64_t v4 = 0;
  uint64_t v5 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    uint64_t v8 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    sub_25264CF68();
    sub_252675D00();
    uint64_t v9 = sub_252675C40();
    if ((unint64_t)(5 - v9 % 5) >= 5) {
      unint64_t v10 = -(v9 % 5);
    }
    else {
      unint64_t v10 = 5 - v9 % 5;
    }
    if (v10)
    {
      uint64_t v11 = (void *)sub_252675D90();
      v11[2] = v10;
      v11[4] = 48;
      v11[5] = 0xE100000000000000;
      unint64_t v12 = v10 - 1;
      if (v10 != 1)
      {
        char v13 = v11 + 6;
        if (v10 < 5)
        {
          unint64_t v14 = 1;
LABEL_17:
          unint64_t v17 = v10 - v14;
          do
          {
            *char v13 = 48;
            v13[1] = 0xE100000000000000;
            v13 += 2;
            --v17;
          }
          while (v17);
          goto LABEL_19;
        }
        unint64_t v14 = v12 & 0xFFFFFFFFFFFFFFFCLL | 1;
        v13 += 2 * (v12 & 0xFFFFFFFFFFFFFFFCLL);
        unint64_t v15 = v11 + 10;
        unint64_t v16 = v12 & 0xFFFFFFFFFFFFFFFCLL;
        do
        {
          *(v15 - 2) = xmmword_252676DF0;
          *(v15 - 1) = xmmword_252676DF0;
          *unint64_t v15 = xmmword_252676DF0;
          v15[1] = xmmword_252676DF0;
          v15 += 4;
          v16 -= 4;
        }
        while (v16);
        if (v12 != (v12 & 0xFFFFFFFFFFFFFFFCLL)) {
          goto LABEL_17;
        }
      }
    }
LABEL_19:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB40);
    sub_2526469BC(&qword_26B22AB48, &qword_26B22AB40);
    uint64_t v18 = sub_252675B40();
    uint64_t v20 = v19;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_252675C70();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v23 = sub_25264C4D4(v2, v3, MEMORY[0x263F8D110], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25264C568);
    uint64_t v24 = v5[2];
    BOOL v25 = (v22 & 1) == 0;
    uint64_t v26 = v24 + v25;
    if (__OFADD__(v24, v25)) {
      goto LABEL_33;
    }
    char v27 = v22;
    if (v5[3] >= v26)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v22) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_2526450A4();
        if (v27) {
          goto LABEL_3;
        }
      }
    }
    else
    {
      sub_2526448A0(v26, isUniquelyReferenced_nonNull_native);
      uint64_t v28 = sub_25264C4D4(v2, v3, MEMORY[0x263F8D110], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25264C568);
      if ((v27 & 1) != (v29 & 1)) {
        goto LABEL_35;
      }
      unint64_t v23 = v28;
      if (v27)
      {
LABEL_3:
        uint64_t v6 = (uint64_t *)(v5[7] + 16 * v23);
        swift_bridgeObjectRelease();
        uint64_t *v6 = v18;
        v6[1] = v20;
        goto LABEL_4;
      }
    }
    v5[(v23 >> 6) + 8] |= 1 << v23;
    char v30 = (uint64_t *)(v5[6] + 16 * v23);
    *char v30 = v2;
    v30[1] = v3;
    os_log_type_t v31 = (uint64_t *)(v5[7] + 16 * v23);
    uint64_t *v31 = v18;
    v31[1] = v20;
    uint64_t v32 = v5[2];
    BOOL v33 = __OFADD__(v32, 1);
    uint64_t v34 = v32 + 1;
    if (v33) {
      goto LABEL_34;
    }
    uint64_t v5[2] = v34;
    swift_bridgeObjectRetain();
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_252675C90();
    uint64_t v3 = v7;
    uint64_t v4 = v8;
    if (!v7) {
      goto LABEL_31;
    }
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  uint64_t result = sub_252676150();
  __break(1u);
  return result;
}

uint64_t sub_25264B9B8()
{
  if (*(void *)(v0 + 24))
  {
    uint64_t v1 = *(void *)(v0 + 24);
  }
  else
  {
    uint64_t v1 = sub_25264BA14();
    *(void *)(v0 + 24) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25264BA14()
{
  uint64_t v0 = sub_252675C90();
  if (!v1)
  {
    uint64_t v5 = (void *)MEMORY[0x263F8EE80];
LABEL_29:
    swift_bridgeObjectRelease();
    return (uint64_t)v5;
  }
  uint64_t v2 = v0;
  uint64_t v3 = v1;
  uint64_t v4 = 0;
  uint64_t v5 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    uint64_t v8 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    sub_25264CF68();
    sub_252675D00();
    uint64_t v9 = sub_252675C40();
    if ((unint64_t)(5 - v9 % 5) >= 5) {
      unint64_t v10 = -(v9 % 5);
    }
    else {
      unint64_t v10 = 5 - v9 % 5;
    }
    if (v10)
    {
      uint64_t v11 = (void *)sub_252675D90();
      v11[2] = v10;
      v11[4] = 48;
      v11[5] = 0xE100000000000000;
      unint64_t v12 = v10 - 1;
      if (v10 != 1)
      {
        char v13 = v11 + 6;
        if (v10 < 5)
        {
          unint64_t v14 = 1;
LABEL_17:
          unint64_t v17 = v10 - v14;
          do
          {
            *char v13 = 48;
            v13[1] = 0xE100000000000000;
            v13 += 2;
            --v17;
          }
          while (v17);
          goto LABEL_19;
        }
        unint64_t v14 = v12 & 0xFFFFFFFFFFFFFFFCLL | 1;
        v13 += 2 * (v12 & 0xFFFFFFFFFFFFFFFCLL);
        unint64_t v15 = v11 + 10;
        unint64_t v16 = v12 & 0xFFFFFFFFFFFFFFFCLL;
        do
        {
          *(v15 - 2) = xmmword_252676DF0;
          *(v15 - 1) = xmmword_252676DF0;
          *unint64_t v15 = xmmword_252676DF0;
          v15[1] = xmmword_252676DF0;
          v15 += 4;
          v16 -= 4;
        }
        while (v16);
        if (v12 != (v12 & 0xFFFFFFFFFFFFFFFCLL)) {
          goto LABEL_17;
        }
      }
    }
LABEL_19:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB40);
    sub_2526469BC(&qword_26B22AB48, &qword_26B22AB40);
    uint64_t v18 = sub_252675B40();
    uint64_t v20 = v19;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_252675C70();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v21 = v18;
    uint64_t v22 = v20;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v25 = sub_25264C4D4(v18, v22, MEMORY[0x263F8D2A8], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25264C568);
    uint64_t v26 = v5[2];
    BOOL v27 = (v24 & 1) == 0;
    uint64_t v28 = v26 + v27;
    if (__OFADD__(v26, v27)) {
      goto LABEL_31;
    }
    char v29 = v24;
    if (v5[3] >= v28)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_252644EE8();
      }
    }
    else
    {
      sub_252644578(v28, isUniquelyReferenced_nonNull_native);
      uint64_t v30 = sub_25264C4D4(v21, v22, MEMORY[0x263F8D2A8], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25264C568);
      if ((v29 & 1) != (v31 & 1)) {
        goto LABEL_33;
      }
      unint64_t v25 = v30;
    }
    if (v29)
    {
      uint64_t v6 = (uint64_t *)(v5[7] + 16 * v25);
      swift_bridgeObjectRelease();
      uint64_t *v6 = v2;
      v6[1] = v3;
    }
    else
    {
      v5[(v25 >> 6) + 8] |= 1 << v25;
      uint64_t v32 = (uint64_t *)(v5[6] + 16 * v25);
      *uint64_t v32 = v21;
      v32[1] = v22;
      BOOL v33 = (uint64_t *)(v5[7] + 16 * v25);
      uint64_t *v33 = v2;
      v33[1] = v3;
      uint64_t v34 = v5[2];
      BOOL v35 = __OFADD__(v34, 1);
      uint64_t v36 = v34 + 1;
      if (v35) {
        goto LABEL_32;
      }
      uint64_t v5[2] = v36;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_252675C90();
    uint64_t v3 = v7;
    uint64_t v4 = v8;
    if (!v7) {
      goto LABEL_29;
    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  uint64_t result = sub_252676150();
  __break(1u);
  return result;
}

uint64_t Geohash.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Geohash.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

void *sub_25264BE54(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C126E8);
      unint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      unint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25264C8A4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25264BF7C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_25264C1E4(a1, a2, a3, a4, &qword_26B22AA48, MEMORY[0x263F06338], MEMORY[0x263F06338]);
}

void *sub_25264BFA0(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB78);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      char v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      char v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_25264C99C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25264C0B0(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A728);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      char v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      char v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_25264CA90(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25264C1C0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_25264C1E4(a1, a2, a3, a4, &qword_269C126E0, type metadata accessor for GuidanceValue, type metadata accessor for GuidanceValue);
}

uint64_t sub_25264C1E4(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_252676040();
    __break(1u);
    return result;
  }
  uint64_t v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25264D0B4(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_25264C464(uint64_t a1, uint64_t a2)
{
  return sub_25264C4D4(a1, a2, MEMORY[0x263F8D2A8], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25264C568);
}

unint64_t sub_25264C490(uint64_t a1)
{
  uint64_t v2 = sub_252675F30();

  return sub_25264C64C(a1, v2);
}

uint64_t sub_25264C4D4(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  sub_2526761B0();
  a3(v10, a1, a2);
  uint64_t v7 = sub_2526761D0();

  return a4(a1, a2, v7);
}

unint64_t sub_25264C568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_252676130() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_252676130() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_25264C64C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_25264CFBC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x2533B7860](v9, a1);
      sub_252637ED0((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_25264C714(unint64_t a1)
{
  return sub_25264C1E4(0, *(void *)(a1 + 16), 0, a1, &qword_26B22AA48, MEMORY[0x263F06338], MEMORY[0x263F06338]);
}

void *sub_25264C75C(void *a1)
{
  return sub_25264BFA0(0, a1[2], 0, a1);
}

void *sub_25264C770(void *result, uint64_t *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v5 = result;
  uint64_t v6 = HIBYTE(a5) & 0xF;
  uint64_t v12 = a4;
  unint64_t v13 = a5;
  if ((a5 & 0x2000000000000000) == 0) {
    uint64_t v6 = a4 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v14 = v6;
  if (!a2)
  {
    uint64_t v7 = 0;
LABEL_14:
    *uint64_t v5 = a4;
    v5[1] = a5;
    uint64_t v5[2] = 0;
    v5[3] = v6;
    return (void *)v7;
  }
  uint64_t v7 = a3;
  if (!a3) {
    goto LABEL_14;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = a2;
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = sub_252675C90();
      if (!v11) {
        break;
      }
      ++v9;
      *uint64_t v8 = v10;
      v8[1] = v11;
      v8 += 2;
      if (v7 == v9)
      {
        a4 = v12;
        a5 = v13;
        goto LABEL_13;
      }
    }
    a4 = v12;
    a5 = v13;
    uint64_t v7 = v9;
LABEL_13:
    uint64_t v6 = v14;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void *sub_25264C82C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A728);
  unint64_t v4 = (void *)swift_allocObject();
  int64_t v5 = _swift_stdlib_malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 17;
  }
  v4[2] = a1;
  v4[3] = 2 * (v6 >> 4);
  return v4;
}

uint64_t sub_25264C8A4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_252676090();
  __break(1u);
  return result;
}

uint64_t sub_25264C99C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_252676090();
  __break(1u);
  return result;
}

uint64_t sub_25264CA90(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_252676090();
  __break(1u);
  return result;
}

void *sub_25264CB84(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v2 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v5 = *(v2 - 1);
    uint64_t v4 = *v2;
    swift_bridgeObjectRetain_n();
    uint64_t v6 = sub_25264B9B8();
    if (*(void *)(v6 + 16)
      && (uint64_t v7 = sub_25264C4D4(v5, v4, MEMORY[0x263F8D2A8], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_25264C568), (v8 & 1) != 0))
    {
      uint64_t v9 = (uint64_t *)(*(void *)(v6 + 56) + 16 * v7);
      uint64_t v11 = *v9;
      uint64_t v10 = v9[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = sub_25264C0B0(0, v3[2] + 1, 1, v3);
      }
      unint64_t v13 = v3[2];
      unint64_t v12 = v3[3];
      if (v13 >= v12 >> 1) {
        uint64_t v3 = sub_25264C0B0((void *)(v12 > 1), v13 + 1, 1, v3);
      }
      v3[2] = v13 + 1;
      uint64_t v14 = &v3[2 * v13];
      v14[4] = v11;
      v14[5] = v10;
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
    }
    v2 += 2;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

unint64_t sub_25264CD18()
{
  unint64_t result = qword_269C126D0;
  if (!qword_269C126D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C126D0);
  }
  return result;
}

unint64_t sub_25264CD70()
{
  unint64_t result = qword_269C126D8;
  if (!qword_269C126D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C126D8);
  }
  return result;
}

uint64_t method lookup function for Geohash(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Geohash);
}

uint64_t dispatch thunk of Geohash.encode(latitude:longitude:length:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of Geohash.decode(geohash:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t getEnumTagSinglePayload for Geohash.Error(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for Geohash.Error(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25264CF28);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25264CF50()
{
  return 0;
}

ValueMetadata *type metadata accessor for Geohash.Error()
{
  return &type metadata for Geohash.Error;
}

unint64_t sub_25264CF68()
{
  unint64_t result = qword_26B22A6C8;
  if (!qword_26B22A6C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22A6C8);
  }
  return result;
}

uint64_t sub_25264CFBC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25264D018(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = sub_252675C50();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
}

uint64_t sub_25264D0B4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_252676090();
  __break(1u);
  return result;
}

uint64_t sub_25264D210()
{
  uint64_t v0 = sub_2526759C0();
  __swift_allocate_value_buffer(v0, qword_269C12BF8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269C12BF8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12718);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C12720) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_252676F00;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "accessoryId";
  *(void *)(v6 + 8) = 11;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_2526759A0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "ekSiteId";
  *(void *)(v10 + 8) = 8;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  unint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)unint64_t v12 = "subscriptionId";
  *((void *)v12 + 1) = 14;
  v12[16] = 2;
  v9();
  unint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *unint64_t v13 = 4;
  *(void *)uint64_t v14 = "usagePointRef";
  *((void *)v14 + 1) = 13;
  v14[16] = 2;
  v9();
  uint64_t v15 = (void *)(v5 + 4 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 5;
  *(void *)uint64_t v16 = "touRatePlan";
  *((void *)v16 + 1) = 11;
  v16[16] = 2;
  v9();
  unint64_t v17 = (void *)(v5 + 5 * v2);
  uint64_t v18 = (char *)v17 + v1[14];
  *unint64_t v17 = 6;
  *(void *)uint64_t v18 = "signalIdentifier";
  *((void *)v18 + 1) = 16;
  v18[16] = 2;
  v9();
  size_t v19 = (void *)(v5 + 6 * v2);
  BOOL v20 = (char *)v19 + v1[14];
  void *v19 = 7;
  *(void *)BOOL v20 = "utilityAccountIdentifier";
  *((void *)v20 + 1) = 24;
  v20[16] = 2;
  v9();
  return sub_2526759B0();
}

uint64_t sub_25264D508()
{
  uint64_t result = sub_2526758A0();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
          sub_2526758E0();
          break;
        default:
          break;
      }
      uint64_t result = sub_2526758A0();
    }
  }
  return result;
}

uint64_t sub_25264D624()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_252675970(), !v1))
  {
    unint64_t v5 = v0[3];
    uint64_t v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    }
    if (!v6 || (uint64_t result = sub_252675970(), !v1))
    {
      unint64_t v7 = v0[5];
      uint64_t v8 = HIBYTE(v7) & 0xF;
      if ((v7 & 0x2000000000000000) == 0) {
        uint64_t v8 = v0[4] & 0xFFFFFFFFFFFFLL;
      }
      if (!v8 || (uint64_t result = sub_252675970(), !v1))
      {
        unint64_t v9 = v0[7];
        uint64_t v10 = HIBYTE(v9) & 0xF;
        if ((v9 & 0x2000000000000000) == 0) {
          uint64_t v10 = v0[6] & 0xFFFFFFFFFFFFLL;
        }
        if (!v10 || (uint64_t result = sub_252675970(), !v1))
        {
          unint64_t v11 = v0[9];
          uint64_t v12 = HIBYTE(v11) & 0xF;
          if ((v11 & 0x2000000000000000) == 0) {
            uint64_t v12 = v0[8] & 0xFFFFFFFFFFFFLL;
          }
          if (!v12 || (uint64_t result = sub_252675970(), !v1))
          {
            unint64_t v13 = v0[11];
            uint64_t v14 = HIBYTE(v13) & 0xF;
            if ((v13 & 0x2000000000000000) == 0) {
              uint64_t v14 = v0[10] & 0xFFFFFFFFFFFFLL;
            }
            if (!v14 || (uint64_t result = sub_252675970(), !v1))
            {
              unint64_t v15 = v0[13];
              uint64_t v16 = HIBYTE(v15) & 0xF;
              if ((v15 & 0x2000000000000000) == 0) {
                uint64_t v16 = v0[12] & 0xFFFFFFFFFFFFLL;
              }
              if (!v16 || (uint64_t result = sub_252675970(), !v1))
              {
                type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
                return sub_252675840();
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_25264D804@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  a1[4] = 0;
  a1[5] = 0xE000000000000000;
  a1[6] = 0;
  a1[7] = 0xE000000000000000;
  a1[8] = 0;
  a1[9] = 0xE000000000000000;
  a1[10] = 0;
  a1[11] = 0xE000000000000000;
  a1[12] = 0;
  a1[13] = 0xE000000000000000;
  return sub_252675850();
}

unint64_t sub_25264D848()
{
  return 0xD000000000000019;
}

uint64_t sub_25264D868@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 44);
  uint64_t v5 = sub_252675860();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_25264D8D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 44);
  uint64_t v5 = sub_252675860();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*sub_25264D948())()
{
  return nullsub_2;
}

uint64_t sub_25264D96C()
{
  return sub_25264D508();
}

uint64_t sub_25264D984()
{
  return sub_25264D624();
}

uint64_t sub_25264D9A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25264E078(&qword_269C12710, (void (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_IdBundle);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25264DA20@<X0>(uint64_t a1@<X8>)
{
  if (qword_269C12410 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2526759C0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269C12BF8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_25264DAC8(uint64_t a1)
{
  uint64_t v2 = sub_25264E078(&qword_269C126F8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_IdBundle);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25264DB34()
{
  return sub_2526761D0();
}

uint64_t sub_25264DB8C()
{
  sub_25264E078(&qword_269C126F8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_IdBundle);

  return sub_252675930();
}

uint64_t sub_25264DC08()
{
  return sub_2526761D0();
}

uint64_t sub_25264DC5C()
{
  return sub_25264E078(&qword_269C126F0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_IdBundle);
}

uint64_t type metadata accessor for Com_Apple_Wpc_Es_IdBundle()
{
  uint64_t result = qword_269C12730;
  if (!qword_269C12730) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25264DCF0()
{
  return sub_25264E078(&qword_269C126F8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_IdBundle);
}

uint64_t sub_25264DD38()
{
  return sub_25264E078(&qword_269C12700, (void (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_IdBundle);
}

uint64_t sub_25264DD80()
{
  return sub_25264E078(&qword_269C12708, (void (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_IdBundle);
}

uint64_t sub_25264DDC8(char *a1, char *a2)
{
  uint64_t v4 = sub_252675860();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v18 - v9;
  BOOL v11 = *(void *)a1 == *(void *)a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
  if (v11 || (char v12 = 0, (sub_252676130() & 1) != 0))
  {
    BOOL v13 = *((void *)a1 + 2) == *((void *)a2 + 2) && *((void *)a1 + 3) == *((void *)a2 + 3);
    if (v13 || (char v12 = 0, (sub_252676130() & 1) != 0))
    {
      if (*((void *)a1 + 4) == *((void *)a2 + 4) && *((void *)a1 + 5) == *((void *)a2 + 5)
        || (char v12 = 0, (sub_252676130() & 1) != 0))
      {
        if (*((void *)a1 + 6) == *((void *)a2 + 6) && *((void *)a1 + 7) == *((void *)a2 + 7)
          || (char v12 = 0, (sub_252676130() & 1) != 0))
        {
          if (*((void *)a1 + 8) == *((void *)a2 + 8) && *((void *)a1 + 9) == *((void *)a2 + 9)
            || (char v12 = 0, (sub_252676130() & 1) != 0))
          {
            if (*((void *)a1 + 10) == *((void *)a2 + 10) && *((void *)a1 + 11) == *((void *)a2 + 11)
              || (char v12 = 0, (sub_252676130() & 1) != 0))
            {
              if (*((void *)a1 + 12) == *((void *)a2 + 12) && *((void *)a1 + 13) == *((void *)a2 + 13)
                || (char v12 = 0, (sub_252676130() & 1) != 0))
              {
                uint64_t v14 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
                unint64_t v15 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
                v15(v10, &a1[*(int *)(v14 + 44)], v4);
                v15(v8, &a2[*(int *)(v14 + 44)], v4);
                sub_25264E078(&qword_269C12728, MEMORY[0x263F50560]);
                char v12 = sub_252675B80();
                uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
                v16(v8, v4);
                v16(v10, v4);
              }
            }
          }
        }
      }
    }
  }
  return v12 & 1;
}

uint64_t sub_25264E078(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_25264E0C0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v8 = a2[7];
    a1[6] = a2[6];
    a1[7] = v8;
    uint64_t v9 = a2[9];
    a1[8] = a2[8];
    a1[9] = v9;
    uint64_t v10 = a2[11];
    a1[10] = a2[10];
    a1[11] = v10;
    uint64_t v11 = a2[13];
    uint64_t v12 = *(int *)(a3 + 44);
    unint64_t v17 = (char *)a1 + v12;
    uint64_t v18 = (char *)a2 + v12;
    a1[12] = a2[12];
    a1[13] = v11;
    uint64_t v13 = sub_252675860();
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v16(v17, v18, v13);
  }
  return v3;
}

uint64_t sub_25264E220(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 44);
  uint64_t v5 = sub_252675860();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_25264E2C8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  uint64_t v10 = a2[13];
  uint64_t v11 = *(int *)(a3 + 44);
  unint64_t v15 = (char *)a1 + v11;
  uint64_t v16 = (char *)a2 + v11;
  a1[12] = a2[12];
  a1[13] = v10;
  uint64_t v12 = sub_252675860();
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v15, v16, v12);
  return a1;
}

void *sub_25264E3D8(void *a1, void *a2, uint64_t a3)
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
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 44);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_252675860();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_25264E534(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  long long v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  long long v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = *(int *)(a3 + 44);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  a1[6] = a2[6];
  uint64_t v10 = sub_252675860();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

void *sub_25264E5C8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a2[9];
  a1[8] = a2[8];
  a1[9] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = a2[11];
  a1[10] = a2[10];
  a1[11] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = a2[13];
  a1[12] = a2[12];
  a1[13] = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(int *)(a3 + 44);
  uint64_t v14 = (char *)a1 + v13;
  unint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = sub_252675860();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  return a1;
}

uint64_t sub_25264E6B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25264E6C8);
}

uint64_t sub_25264E6C8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_252675860();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 44);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_25264E778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25264E78C);
}

uint64_t sub_25264E78C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_252675860();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 44);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25264E834()
{
  uint64_t result = sub_252675860();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_25264E8D8@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = result < 3;
  *(unsigned char *)(a2 + 9) = 0;
  return result;
}

void *sub_25264E8F0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result >= 3uLL;
  *(void *)a2 = *result;
  char v3 = !v2;
  *(unsigned char *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 9) = 0;
  return result;
}

uint64_t sub_25264E910(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25264F5D0();

  return MEMORY[0x270F44AF0](a1, a2, v4);
}

BOOL sub_25264E960(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_25264E974()
{
  qword_269C12C10 = (uint64_t)&unk_2702B74C0;
}

uint64_t sub_25264E988@<X0>(void *a1@<X8>)
{
  return sub_25264EBA4(&qword_269C12418, &qword_269C12C10, a1);
}

void sub_25264E9AC(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

void sub_25264E9BC(uint64_t a1@<X8>)
{
  sub_25264F5BC();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 9) = v4 & 1;
}

uint64_t sub_25264E9F0()
{
  return *(void *)v0;
}

void sub_25264E9F8(uint64_t a1@<X8>)
{
  sub_25264F5BC();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 9) = v4 & 1;
}

uint64_t sub_25264EA30()
{
  return sub_2526761D0();
}

uint64_t sub_25264EA9C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25264F624();

  return MEMORY[0x270F44AF0](a1, a2, v4);
}

uint64_t sub_25264EAE8()
{
  return sub_2526761D0();
}

BOOL sub_25264EB50(uint64_t a1, uint64_t *a2)
{
  return sub_25264F694(*(void *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

void sub_25264EB6C()
{
  qword_269C12C18 = (uint64_t)&unk_2702B7510;
}

uint64_t sub_25264EB80@<X0>(void *a1@<X8>)
{
  return sub_25264EBA4(&qword_269C12420, &qword_269C12C18, a1);
}

uint64_t sub_25264EBA4@<X0>(void *a1@<X2>, void *a2@<X3>, void *a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  *a3 = *a2;

  return swift_bridgeObjectRetain();
}

uint64_t sub_25264EBFC()
{
  uint64_t v0 = sub_2526759C0();
  __swift_allocate_value_buffer(v0, qword_269C12C20);
  __swift_project_value_buffer(v0, (uint64_t)qword_269C12C20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12718);
  unint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C12720) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2526770D0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 0;
  *(void *)unint64_t v6 = "ES_FEEDBACK_EVENT_ATTRIBUTION_UNDEFINED";
  *(void *)(v6 + 8) = 39;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_2526759A0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 1;
  *(void *)uint64_t v10 = "ES_FEEDBACK_EVENT_ATTRIBUTION_USERCHANGED";
  *((void *)v10 + 1) = 41;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 2;
  *(void *)uint64_t v11 = "ES_FEEDBACK_EVENT_ATTRIBUTION_SYSTEMCHANGED";
  *(void *)(v11 + 8) = 43;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_2526759B0();
}

uint64_t sub_25264EDFC@<X0>(uint64_t a1@<X8>)
{
  return sub_25264F1B0(&qword_269C12428, (uint64_t)qword_269C12C20, a1);
}

uint64_t sub_25264EE20()
{
  uint64_t v0 = sub_2526759C0();
  __swift_allocate_value_buffer(v0, qword_269C12C38);
  __swift_project_value_buffer(v0, (uint64_t)qword_269C12C38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12718);
  unint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C12720) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_2526770E0;
  unint64_t v4 = v24 + v3;
  unint64_t v5 = v24 + v3 + v1[14];
  *(void *)(v24 + v3) = 0;
  *(void *)unint64_t v5 = "ES_FEEDBACK_EVENT_TYPE_UNDEFINED";
  *(void *)(v5 + 8) = 32;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_2526759A0();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v4 + v2 + v1[14];
  *(void *)(v4 + v2) = 1;
  *(void *)unint64_t v9 = "ES_FEEDBACK_EVENT_TYPE_RUNNINGSTATUS";
  *(void *)(v9 + 8) = 36;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  uint64_t v10 = (void *)(v4 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  void *v10 = 2;
  *(void *)uint64_t v11 = "ES_FEEDBACK_EVENT_TYPE_TEMPERATURESAMPLE";
  *((void *)v11 + 1) = 40;
  v11[16] = 2;
  v8();
  uint64_t v12 = (void *)(v4 + 3 * v2);
  uint64_t v13 = (char *)v12 + v1[14];
  *uint64_t v12 = 3;
  *(void *)uint64_t v13 = "ES_FEEDBACK_EVENT_TYPE_TARGETTEMPERATURECHANGED";
  *((void *)v13 + 1) = 47;
  v13[16] = 2;
  v8();
  uint64_t v14 = (void *)(v4 + 4 * v2);
  unint64_t v15 = (char *)v14 + v1[14];
  void *v14 = 4;
  *(void *)unint64_t v15 = "ES_FEEDBACK_EVENT_TYPE_SYSTEMMODE";
  *((void *)v15 + 1) = 33;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v4 + 5 * v2);
  unint64_t v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 5;
  *(void *)unint64_t v17 = "ES_FEEDBACK_EVENT_TYPE_ACTIVITYSTATE";
  *((void *)v17 + 1) = 36;
  v17[16] = 2;
  v8();
  uint64_t v18 = (void *)(v4 + 6 * v2);
  size_t v19 = (char *)v18 + v1[14];
  *uint64_t v18 = 6;
  *(void *)size_t v19 = "ES_FEEDBACK_EVENT_TYPE_HOLDSET";
  *((void *)v19 + 1) = 30;
  v19[16] = 2;
  v8();
  BOOL v20 = (void *)(v4 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  void *v20 = 7;
  *(void *)uint64_t v21 = "ES_FEEDBACK_EVENT_TYPE_INTERVALREADING";
  *((void *)v21 + 1) = 38;
  v21[16] = 2;
  v8();
  uint64_t v22 = v4 + 8 * v2 + v1[14];
  *(void *)(v4 + 8 * v2) = 8;
  *(void *)uint64_t v22 = "ES_FEEDBACK_EVENT_TYPE_PRESETCHANGED";
  *(void *)(v22 + 8) = 36;
  *(unsigned char *)(v22 + 16) = 2;
  v8();
  return sub_2526759B0();
}

uint64_t sub_25264F18C@<X0>(uint64_t a1@<X8>)
{
  return sub_25264F1B0(&qword_269C12430, (uint64_t)qword_269C12C38, a1);
}

uint64_t sub_25264F1B0@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2526759C0();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t sub_25264F24C()
{
  return sub_25264F29C(&qword_269C12740, &qword_269C12748);
}

uint64_t sub_25264F274()
{
  return sub_25264F29C(&qword_269C12750, &qword_269C12758);
}

uint64_t sub_25264F29C(unint64_t *a1, uint64_t *a2)
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

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEventAttribution()
{
  return &type metadata for Com_Apple_Wpc_Es_ESFeedbackEventAttribution;
}

uint64_t getEnumTagSinglePayload for Com_Apple_Wpc_Es_ESFeedbackEventType(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Com_Apple_Wpc_Es_ESFeedbackEventType(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
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

uint64_t sub_25264F360(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25264F37C(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEventType()
{
  return &type metadata for Com_Apple_Wpc_Es_ESFeedbackEventType;
}

unint64_t sub_25264F3B0()
{
  unint64_t result = qword_269C12760;
  if (!qword_269C12760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12760);
  }
  return result;
}

unint64_t sub_25264F408()
{
  unint64_t result = qword_269C12768;
  if (!qword_269C12768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12768);
  }
  return result;
}

unint64_t sub_25264F460()
{
  unint64_t result = qword_269C12770;
  if (!qword_269C12770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12770);
  }
  return result;
}

unint64_t sub_25264F4B8()
{
  unint64_t result = qword_269C12778;
  if (!qword_269C12778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12778);
  }
  return result;
}

unint64_t sub_25264F510()
{
  unint64_t result = qword_269C12780;
  if (!qword_269C12780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12780);
  }
  return result;
}

unint64_t sub_25264F568()
{
  unint64_t result = qword_269C12788;
  if (!qword_269C12788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12788);
  }
  return result;
}

unint64_t sub_25264F5D0()
{
  unint64_t result = qword_269C12790;
  if (!qword_269C12790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12790);
  }
  return result;
}

unint64_t sub_25264F624()
{
  unint64_t result = qword_269C12798;
  if (!qword_269C12798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12798);
  }
  return result;
}

BOOL sub_25264F694(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

uint64_t sub_25264F6A0(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEC00000061746144;
  unint64_t v3 = 0x20676E697373694DLL;
  uint64_t v4 = a1;
  unint64_t v5 = 0x20676E697373694DLL;
  unint64_t v6 = 0xEC00000061746144;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD00000000000001ELL;
      uint64_t v7 = "Unable to generate request URL";
      goto LABEL_12;
    case 2:
      uint64_t v8 = "Unable to process http response";
      goto LABEL_5;
    case 3:
      uint64_t v8 = "Unable to process response body";
LABEL_5:
      unint64_t v6 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      unint64_t v5 = 0xD00000000000001FLL;
      break;
    case 4:
      unint64_t v5 = 0xD000000000000017;
      uint64_t v7 = "Unhandled response code";
      goto LABEL_12;
    case 5:
      unint64_t v5 = 0x206E776F6E6B6E55;
      unint64_t v6 = 0xEF6572756C696146;
      break;
    case 6:
      unint64_t v5 = 0xD000000000000035;
      uint64_t v7 = "Folder exists, but no ETag for geohash stored on disk";
      goto LABEL_12;
    case 7:
      unint64_t v5 = 0xD00000000000001DLL;
      uint64_t v7 = "Failed to fetch geohash tiles";
      goto LABEL_12;
    case 8:
      unint64_t v5 = 0xD000000000000022;
      uint64_t v7 = "Error while creating geoHash tiles";
      goto LABEL_12;
    case 9:
      unint64_t v5 = 0xD000000000000022;
      uint64_t v7 = "Error while fetching geoHash tiles";
LABEL_12:
      unint64_t v6 = (unint64_t)(v7 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v3 = 0xD00000000000001ELL;
      unint64_t v9 = "Unable to generate request URL";
      goto LABEL_24;
    case 2:
      uint64_t v10 = "Unable to process http response";
      goto LABEL_17;
    case 3:
      uint64_t v10 = "Unable to process response body";
LABEL_17:
      unint64_t v2 = (unint64_t)(v10 - 32) | 0x8000000000000000;
      unint64_t v3 = 0xD00000000000001FLL;
      break;
    case 4:
      unint64_t v3 = 0xD000000000000017;
      unint64_t v9 = "Unhandled response code";
      goto LABEL_24;
    case 5:
      unint64_t v3 = 0x206E776F6E6B6E55;
      unint64_t v2 = 0xEF6572756C696146;
      break;
    case 6:
      unint64_t v3 = 0xD000000000000035;
      unint64_t v9 = "Folder exists, but no ETag for geohash stored on disk";
      goto LABEL_24;
    case 7:
      unint64_t v3 = 0xD00000000000001DLL;
      unint64_t v9 = "Failed to fetch geohash tiles";
      goto LABEL_24;
    case 8:
      unint64_t v3 = 0xD000000000000022;
      unint64_t v9 = "Error while creating geoHash tiles";
      goto LABEL_24;
    case 9:
      unint64_t v3 = 0xD000000000000022;
      unint64_t v9 = "Error while fetching geoHash tiles";
LABEL_24:
      unint64_t v2 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v3 && v6 == v2) {
    char v11 = 1;
  }
  else {
    char v11 = sub_252676130();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_25264F940(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xED00006E6F697461;
  uint64_t v3 = 0x72756769666E6F43;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v5 = 0x726576726553;
    }
    else {
      uint64_t v5 = 0x73795320656C6946;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xE600000000000000;
    }
    else {
      unint64_t v6 = 0xEB000000006D6574;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  uint64_t v5 = 0x72756769666E6F43;
  unint64_t v6 = 0xED00006E6F697461;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      uint64_t v3 = 0x726576726553;
    }
    else {
      uint64_t v3 = 0x73795320656C6946;
    }
    if (v7 == 1) {
      unint64_t v2 = 0xE600000000000000;
    }
    else {
      unint64_t v2 = 0xEB000000006D6574;
    }
  }
LABEL_15:
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_252676130();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25264FA74(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 1146048327;
    }
    else {
      uint64_t v3 = 0x5453524F57;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE400000000000000;
    }
    else {
      unint64_t v4 = 0xE500000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 1146048327;
      }
      else {
        uint64_t v6 = 0x5453524F57;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE400000000000000;
      }
      else {
        unint64_t v7 = 0xE500000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE400000000000000;
    uint64_t v3 = 1414743362;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE400000000000000;
  if (v3 != 1414743362)
  {
LABEL_21:
    char v8 = sub_252676130();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25264FB68(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xEF6C616E67695320;
  uint64_t v3 = 0x65636E6164697547;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v5 = 0x5720796772656E45;
    }
    else {
      uint64_t v5 = 0x6F6F4C2064697247;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xEE0073776F646E69;
    }
    else {
      unint64_t v6 = 0xEB0000000070756BLL;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  uint64_t v5 = 0x65636E6164697547;
  unint64_t v6 = 0xEF6C616E67695320;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      uint64_t v3 = 0x5720796772656E45;
    }
    else {
      uint64_t v3 = 0x6F6F4C2064697247;
    }
    if (v7 == 1) {
      unint64_t v2 = 0xEE0073776F646E69;
    }
    else {
      unint64_t v2 = 0xEB0000000070756BLL;
    }
  }
LABEL_15:
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_252676130();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25264FCBC(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x7472617473;
    }
    else {
      uint64_t v3 = 6581861;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE500000000000000;
    }
    else {
      unint64_t v4 = 0xE300000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x7472617473;
      }
      else {
        uint64_t v6 = 6581861;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE500000000000000;
      }
      else {
        unint64_t v7 = 0xE300000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE600000000000000;
    uint64_t v3 = 0x676E69746172;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE600000000000000;
  if (v3 != 0x676E69746172)
  {
LABEL_21:
    char v8 = sub_252676130();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25264FDB8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 1685025392;
  }
  else {
    uint64_t v3 = 7759204;
  }
  if (v2) {
    unint64_t v4 = 0xE300000000000000;
  }
  else {
    unint64_t v4 = 0xE400000000000000;
  }
  if (a2) {
    uint64_t v5 = 1685025392;
  }
  else {
    uint64_t v5 = 7759204;
  }
  if (a2) {
    unint64_t v6 = 0xE400000000000000;
  }
  else {
    unint64_t v6 = 0xE300000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_252676130();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_25264FE50()
{
  uint64_t v0 = sub_2526759C0();
  __swift_allocate_value_buffer(v0, qword_269C12C50);
  __swift_project_value_buffer(v0, (uint64_t)qword_269C12C50);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12718);
  unint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C12720) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_2526773F0;
  unint64_t v4 = v26 + v3;
  unint64_t v5 = v26 + v3 + v1[14];
  *(void *)(v26 + v3) = 1;
  *(void *)unint64_t v5 = "startTime";
  *(void *)(v5 + 8) = 9;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_2526759A0();
  char v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v26 + v3 + v2 + v1[14];
  *(void *)(v4 + v2) = 2;
  *(void *)unint64_t v9 = "endTime";
  *(void *)(v9 + 8) = 7;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  uint64_t v10 = (void *)(v26 + v3 + 2 * v2);
  char v11 = (char *)v10 + v1[14];
  void *v10 = 3;
  *(void *)char v11 = "eventType";
  *((void *)v11 + 1) = 9;
  v11[16] = 2;
  v8();
  uint64_t v12 = (void *)(v26 + v3 + 3 * v2);
  uint64_t v13 = (char *)v12 + v1[14];
  *uint64_t v12 = 4;
  *(void *)uint64_t v13 = "value";
  *((void *)v13 + 1) = 5;
  v13[16] = 2;
  v8();
  uint64_t v14 = (void *)(v26 + v3 + 4 * v2);
  unint64_t v15 = (char *)v14 + v1[14];
  void *v14 = 5;
  *(void *)unint64_t v15 = "unit";
  *((void *)v15 + 1) = 4;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v26 + v3 + 5 * v2);
  unint64_t v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 6;
  *(void *)unint64_t v17 = "metadata";
  *((void *)v17 + 1) = 8;
  v17[16] = 2;
  v8();
  uint64_t v18 = (void *)(v26 + v3 + 6 * v2);
  size_t v19 = (char *)v18 + v1[14];
  *uint64_t v18 = 7;
  *(void *)size_t v19 = "attribution";
  *((void *)v19 + 1) = 11;
  v19[16] = 2;
  v8();
  BOOL v20 = (void *)(v26 + v3 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  void *v20 = 8;
  *(void *)uint64_t v21 = "ids";
  *((void *)v21 + 1) = 3;
  v21[16] = 2;
  v8();
  uint64_t v22 = v26 + v3 + 8 * v2 + v1[14];
  *(void *)(v4 + 8 * v2) = 9;
  *(void *)uint64_t v22 = "tag";
  *(void *)(v22 + 8) = 3;
  *(unsigned char *)(v22 + 16) = 2;
  v8();
  unint64_t v23 = (void *)(v26 + v3 + 9 * v2);
  uint64_t v24 = (char *)v23 + v1[14];
  void *v23 = 10;
  *(void *)uint64_t v24 = "secondaryValue";
  *((void *)v24 + 1) = 14;
  v24[16] = 2;
  v8();
  return sub_2526759B0();
}

uint64_t sub_2526501F8()
{
  uint64_t result = sub_2526758A0();
  uint64_t v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 4:
        case 5:
        case 6:
        case 9:
        case 10:
          uint64_t v4 = v3;
          sub_2526758E0();
          goto LABEL_10;
        case 3:
          sub_25264F624();
          goto LABEL_7;
        case 7:
          sub_25264F5D0();
LABEL_7:
          uint64_t v4 = v3;
          sub_2526758C0();
          goto LABEL_10;
        case 8:
          uint64_t v4 = v3;
          sub_2526503AC();
LABEL_10:
          uint64_t v3 = v4;
          break;
        default:
          break;
      }
      uint64_t result = sub_2526758A0();
    }
  }
  return result;
}

uint64_t sub_2526503AC()
{
  return sub_252675900();
}

uint64_t sub_25265045C()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_252675970(), !v1))
  {
    unint64_t v5 = v0[3];
    uint64_t v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    }
    if (!v6 || (uint64_t result = sub_252675970(), !v1))
    {
      if (!v0[4] || (sub_25264F624(), uint64_t result = sub_252675950(), !v1))
      {
        unint64_t v7 = v0[7];
        uint64_t v8 = HIBYTE(v7) & 0xF;
        if ((v7 & 0x2000000000000000) == 0) {
          uint64_t v8 = v0[6] & 0xFFFFFFFFFFFFLL;
        }
        if (!v8 || (uint64_t result = sub_252675970(), !v1))
        {
          unint64_t v9 = v0[9];
          uint64_t v10 = HIBYTE(v9) & 0xF;
          if ((v9 & 0x2000000000000000) == 0) {
            uint64_t v10 = v0[8] & 0xFFFFFFFFFFFFLL;
          }
          if (!v10 || (uint64_t result = sub_252675970(), !v1))
          {
            unint64_t v11 = v0[11];
            uint64_t v12 = HIBYTE(v11) & 0xF;
            if ((v11 & 0x2000000000000000) == 0) {
              uint64_t v12 = v0[10] & 0xFFFFFFFFFFFFLL;
            }
            if (!v12 || (uint64_t result = sub_252675970(), !v1))
            {
              if (!v0[12] || (sub_25264F5D0(), uint64_t result = sub_252675950(), !v1))
              {
                uint64_t result = sub_2526506EC((uint64_t)v0);
                if (!v1)
                {
                  unint64_t v13 = v0[15];
                  uint64_t v14 = HIBYTE(v13) & 0xF;
                  if ((v13 & 0x2000000000000000) == 0) {
                    uint64_t v14 = v0[14] & 0xFFFFFFFFFFFFLL;
                  }
                  if (v14) {
                    sub_252675970();
                  }
                  unint64_t v15 = v0[17];
                  uint64_t v16 = HIBYTE(v15) & 0xF;
                  if ((v15 & 0x2000000000000000) == 0) {
                    uint64_t v16 = v0[16] & 0xFFFFFFFFFFFFLL;
                  }
                  if (v16) {
                    sub_252675970();
                  }
                  type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent();
                  return sub_252675840();
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_2526506EC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C127C8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent();
  sub_252650E44(a1 + *(int *)(v9 + 56), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_252634810((uint64_t)v4, &qword_269C127C8);
  }
  sub_252650EAC((uint64_t)v4, (uint64_t)v8);
  sub_252651584(&qword_269C126F8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_IdBundle);
  sub_252675990();
  return sub_252650F10((uint64_t)v8);
}

uint64_t sub_2526508C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0xE000000000000000;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0xE000000000000000;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0xE000000000000000;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0xE000000000000000;
  *(void *)(a2 + 80) = 0;
  *(void *)(a2 + 88) = 0xE000000000000000;
  *(void *)(a2 + 96) = 0;
  *(unsigned char *)(a2 + 104) = 1;
  *(void *)(a2 + 112) = 0;
  *(void *)(a2 + 120) = 0xE000000000000000;
  *(void *)(a2 + 128) = 0;
  *(void *)(a2 + 136) = 0xE000000000000000;
  sub_252675850();
  uint64_t v4 = a2 + *(int *)(a1 + 56);
  uint64_t v5 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);

  return v6(v4, 1, 1, v5);
}

unint64_t sub_252650978()
{
  return 0xD000000000000020;
}

uint64_t sub_252650994@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 52);
  uint64_t v5 = sub_252675860();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_252650A04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 52);
  uint64_t v5 = sub_252675860();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*sub_252650A74())()
{
  return nullsub_2;
}

uint64_t sub_252650A98()
{
  return sub_2526501F8();
}

uint64_t sub_252650AB0()
{
  return sub_25265045C();
}

uint64_t sub_252650AC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252651584(&qword_269C127C0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_252650B44@<X0>(uint64_t a1@<X8>)
{
  if (qword_269C12438 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2526759C0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269C12C50);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_252650BEC(uint64_t a1)
{
  uint64_t v2 = sub_252651584(&qword_269C127A8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_252650C58()
{
  sub_252651584(&qword_269C127A8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent);

  return sub_252675930();
}

uint64_t sub_252650CD8()
{
  return sub_252651584(&qword_269C127A0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent);
}

uint64_t type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent()
{
  uint64_t result = qword_269C127D8;
  if (!qword_269C127D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_252650D6C()
{
  return sub_252651584(&qword_269C127A8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent);
}

uint64_t sub_252650DB4()
{
  return sub_252651584(&qword_269C127B0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent);
}

uint64_t sub_252650DFC()
{
  return sub_252651584(&qword_269C127B8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent);
}

uint64_t sub_252650E44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C127C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_252650EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_252650F10(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_252650F6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252675860();
  uint64_t v45 = *(void *)(v4 - 8);
  uint64_t v46 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v44 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v43 = (char *)&v40 - v7;
  uint64_t v8 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  uint64_t v47 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C127D0);
  MEMORY[0x270FA5388](v11);
  unint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C127C8);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  unint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  BOOL v20 = (char *)&v40 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v40 - v21;
  if (*(void *)a1 != *(void *)a2 || *(void *)(a1 + 8) != *(void *)(a2 + 8))
  {
    char v23 = 0;
    if ((sub_252676130() & 1) == 0) {
      return v23 & 1;
    }
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16) || *(void *)(a1 + 24) != *(void *)(a2 + 24))
  {
    char v23 = 0;
    if ((sub_252676130() & 1) == 0) {
      return v23 & 1;
    }
  }
  if (!sub_25264F694(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(void *)(a2 + 32))) {
    goto LABEL_33;
  }
  if (*(void *)(a1 + 48) != *(void *)(a2 + 48) || *(void *)(a1 + 56) != *(void *)(a2 + 56))
  {
    char v23 = 0;
    if ((sub_252676130() & 1) == 0) {
      return v23 & 1;
    }
  }
  if (*(void *)(a1 + 64) != *(void *)(a2 + 64) || *(void *)(a1 + 72) != *(void *)(a2 + 72))
  {
    char v23 = 0;
    if ((sub_252676130() & 1) == 0) {
      return v23 & 1;
    }
  }
  if (*(void *)(a1 + 80) != *(void *)(a2 + 80) || *(void *)(a1 + 88) != *(void *)(a2 + 88))
  {
    char v23 = 0;
    if ((sub_252676130() & 1) == 0) {
      return v23 & 1;
    }
  }
  uint64_t v24 = *(void *)(a1 + 96);
  uint64_t v25 = *(void *)(a2 + 96);
  if (*(unsigned char *)(a2 + 104) != 1)
  {
    if (v24 == v25) {
      goto LABEL_27;
    }
    goto LABEL_33;
  }
  if (!v25)
  {
    if (!v24) {
      goto LABEL_27;
    }
LABEL_33:
    char v23 = 0;
    return v23 & 1;
  }
  if (v25 != 1)
  {
    if (v24 == 2) {
      goto LABEL_27;
    }
    goto LABEL_33;
  }
  if (v24 != 1) {
    goto LABEL_33;
  }
LABEL_27:
  uint64_t v26 = type metadata accessor for Com_Apple_Wpc_Es_ESFeedbackEvent();
  sub_252650E44(a1 + *(int *)(v26 + 56), (uint64_t)v22);
  uint64_t v41 = v26;
  sub_252650E44(a2 + *(int *)(v26 + 56), (uint64_t)v20);
  uint64_t v27 = (uint64_t)&v13[*(int *)(v11 + 48)];
  sub_252650E44((uint64_t)v22, (uint64_t)v13);
  uint64_t v42 = v27;
  sub_252650E44((uint64_t)v20, v27);
  uint64_t v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48);
  if (v28((uint64_t)v13, 1, v8) == 1)
  {
    sub_252634810((uint64_t)v20, &qword_269C127C8);
    sub_252634810((uint64_t)v22, &qword_269C127C8);
    if (v28(v42, 1, v8) == 1)
    {
      sub_252634810((uint64_t)v13, &qword_269C127C8);
      goto LABEL_36;
    }
    goto LABEL_32;
  }
  sub_252650E44((uint64_t)v13, (uint64_t)v17);
  if (v28(v42, 1, v8) == 1)
  {
    sub_252634810((uint64_t)v20, &qword_269C127C8);
    sub_252634810((uint64_t)v22, &qword_269C127C8);
    sub_252650F10((uint64_t)v17);
LABEL_32:
    sub_252634810((uint64_t)v13, &qword_269C127D0);
    goto LABEL_33;
  }
  sub_252650EAC(v42, (uint64_t)v10);
  char v30 = sub_25264D800(v17, v10);
  sub_252650F10((uint64_t)v10);
  sub_252634810((uint64_t)v20, &qword_269C127C8);
  sub_252634810((uint64_t)v22, &qword_269C127C8);
  sub_252650F10((uint64_t)v17);
  sub_252634810((uint64_t)v13, &qword_269C127C8);
  if ((v30 & 1) == 0) {
    goto LABEL_33;
  }
LABEL_36:
  if (*(void *)(a1 + 112) == *(void *)(a2 + 112) && *(void *)(a1 + 120) == *(void *)(a2 + 120)
    || (char v23 = 0, (sub_252676130() & 1) != 0))
  {
    if (*(void *)(a1 + 128) == *(void *)(a2 + 128) && *(void *)(a1 + 136) == *(void *)(a2 + 136)
      || (char v23 = 0, (sub_252676130() & 1) != 0))
    {
      uint64_t v31 = v41;
      uint64_t v32 = a1 + *(int *)(v41 + 52);
      uint64_t v34 = v45;
      uint64_t v33 = v46;
      BOOL v35 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 16);
      uint64_t v36 = v43;
      v35(v43, v32, v46);
      uint64_t v37 = a2 + *(int *)(v31 + 52);
      unint64_t v38 = v44;
      v35(v44, v37, v33);
      sub_252651584(&qword_269C12728, MEMORY[0x263F50560]);
      char v23 = sub_252675B80();
      char v39 = *(void (**)(char *, uint64_t))(v34 + 8);
      v39(v38, v33);
      v39(v36, v33);
    }
  }
  return v23 & 1;
}

uint64_t sub_252651584(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_2526515CC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    *(void *)(a1 + 32) = a2[4];
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    uint64_t v10 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v10;
    uint64_t v11 = a2[11];
    *(void *)(a1 + 80) = a2[10];
    *(void *)(a1 + 88) = v11;
    *(unsigned char *)(a1 + 104) = *((unsigned char *)a2 + 104);
    *(void *)(a1 + 96) = a2[12];
    uint64_t v12 = a2[15];
    *(void *)(a1 + 112) = a2[14];
    *(void *)(a1 + 120) = v12;
    uint64_t v13 = a2[17];
    uint64_t v14 = *(int *)(a3 + 52);
    uint64_t v34 = (char *)a2 + v14;
    BOOL v35 = (char *)(a1 + v14);
    *(void *)(a1 + 128) = a2[16];
    *(void *)(a1 + 136) = v13;
    uint64_t v15 = sub_252675860();
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v37 = v16;
    uint64_t v38 = v15;
    v16(v35, v34, v15);
    uint64_t v17 = *(int *)(a3 + 56);
    uint64_t v18 = (void *)((char *)v4 + v17);
    uint64_t v19 = (uint64_t *)((char *)a2 + v17);
    uint64_t v20 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
    uint64_t v21 = *(void *)(v20 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C127C8);
      memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      uint64_t v24 = v19[1];
      *uint64_t v18 = *v19;
      v18[1] = v24;
      uint64_t v25 = v19[3];
      uint64_t v18[2] = v19[2];
      v18[3] = v25;
      uint64_t v26 = v19[5];
      v18[4] = v19[4];
      v18[5] = v26;
      uint64_t v27 = v19[7];
      v18[6] = v19[6];
      v18[7] = v27;
      uint64_t v28 = v19[9];
      v18[8] = v19[8];
      v18[9] = v28;
      uint64_t v29 = v19[11];
      v18[10] = v19[10];
      v18[11] = v29;
      uint64_t v30 = v19[13];
      v18[12] = v19[12];
      v18[13] = v30;
      uint64_t v31 = *(int *)(v20 + 44);
      uint64_t v36 = (char *)v18 + v31;
      uint64_t v32 = (char *)v19 + v31;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v37(v36, v32, v38);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
  }
  return v4;
}

uint64_t sub_2526518B0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 52);
  uint64_t v5 = sub_252675860();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v10(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 56);
  uint64_t v7 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v9 = v6 + *(int *)(v7 + 44);
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v9, v5);
  }
  return result;
}

uint64_t sub_252651A24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v10 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v10;
  uint64_t v11 = *(void *)(a2 + 136);
  uint64_t v12 = *(int *)(a3 + 52);
  uint64_t v31 = (char *)(a2 + v12);
  uint64_t v32 = (char *)(a1 + v12);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v11;
  uint64_t v13 = sub_252675860();
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v33 = v14;
  uint64_t v34 = v13;
  v14(v32, v31, v13);
  uint64_t v15 = *(int *)(a3 + 56);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  uint64_t v18 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C127C8);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    uint64_t v21 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v21;
    uint64_t v22 = v17[3];
    v16[2] = v17[2];
    void v16[3] = v22;
    uint64_t v23 = v17[5];
    v16[4] = v17[4];
    v16[5] = v23;
    uint64_t v24 = v17[7];
    v16[6] = v17[6];
    v16[7] = v24;
    uint64_t v25 = v17[9];
    v16[8] = v17[8];
    v16[9] = v25;
    uint64_t v26 = v17[11];
    v16[10] = v17[10];
    v16[11] = v26;
    uint64_t v27 = v17[13];
    v16[12] = v17[12];
    v16[13] = v27;
    uint64_t v28 = *(int *)(v18 + 44);
    uint64_t v36 = (char *)v16 + v28;
    uint64_t v29 = (char *)v17 + v28;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v33(v36, v29, v34);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  return a1;
}

uint64_t sub_252651CB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v6;
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
  uint64_t v7 = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 96) = v7;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 52);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_252675860();
  uint64_t v25 = *(void *)(v11 - 8);
  uint64_t v27 = v11;
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v25 + 24);
  ((void (*)(uint64_t, uint64_t))v12)(v9, v10);
  uint64_t v13 = *(int *)(a3 + 56);
  uint64_t v14 = (char *)(a1 + v13);
  uint64_t v15 = (char *)(a2 + v13);
  uint64_t v16 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  LODWORD(v10) = v18(v14, 1, v16);
  int v19 = v18(v15, 1, v16);
  if (!v10)
  {
    if (!v19)
    {
      *(void *)uint64_t v14 = *(void *)v15;
      *((void *)v14 + 1) = *((void *)v15 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)v14 + 2) = *((void *)v15 + 2);
      *((void *)v14 + 3) = *((void *)v15 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)v14 + 4) = *((void *)v15 + 4);
      *((void *)v14 + 5) = *((void *)v15 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)v14 + 6) = *((void *)v15 + 6);
      *((void *)v14 + 7) = *((void *)v15 + 7);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)v14 + 8) = *((void *)v15 + 8);
      *((void *)v14 + 9) = *((void *)v15 + 9);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)v14 + 10) = *((void *)v15 + 10);
      *((void *)v14 + 11) = *((void *)v15 + 11);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)v14 + 12) = *((void *)v15 + 12);
      *((void *)v14 + 13) = *((void *)v15 + 13);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v12(&v14[*(int *)(v16 + 44)], &v15[*(int *)(v16 + 44)], v27);
      return a1;
    }
    sub_252650F10((uint64_t)v14);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C127C8);
    memcpy(v14, v15, *(void *)(*(void *)(v22 - 8) + 64));
    return a1;
  }
  *(void *)uint64_t v14 = *(void *)v15;
  *((void *)v14 + 1) = *((void *)v15 + 1);
  *((void *)v14 + 2) = *((void *)v15 + 2);
  *((void *)v14 + 3) = *((void *)v15 + 3);
  *((void *)v14 + 4) = *((void *)v15 + 4);
  *((void *)v14 + 5) = *((void *)v15 + 5);
  *((void *)v14 + 6) = *((void *)v15 + 6);
  *((void *)v14 + 7) = *((void *)v15 + 7);
  *((void *)v14 + 8) = *((void *)v15 + 8);
  *((void *)v14 + 9) = *((void *)v15 + 9);
  *((void *)v14 + 10) = *((void *)v15 + 10);
  *((void *)v14 + 11) = *((void *)v15 + 11);
  *((void *)v14 + 12) = *((void *)v15 + 12);
  *((void *)v14 + 13) = *((void *)v15 + 13);
  uint64_t v20 = *(int *)(v16 + 44);
  uint64_t v21 = &v15[v20];
  uint64_t v24 = &v14[v20];
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v25 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v26(v24, v21, v27);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  return a1;
}

uint64_t sub_252652128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  long long v7 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v7;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  long long v8 = *(_OWORD *)(a2 + 128);
  uint64_t v9 = *(int *)(a3 + 52);
  uint64_t v10 = (char *)(a1 + v9);
  uint64_t v11 = (char *)(a2 + v9);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v8;
  uint64_t v12 = sub_252675860();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32);
  v13(v10, v11, v12);
  uint64_t v14 = *(int *)(a3 + 56);
  uint64_t v15 = (_OWORD *)(a1 + v14);
  uint64_t v16 = (_OWORD *)(a2 + v14);
  uint64_t v17 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C127C8);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    long long v20 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v20;
    long long v21 = v16[3];
    v15[2] = v16[2];
    v15[3] = v21;
    long long v22 = v16[5];
    v15[4] = v16[4];
    v15[5] = v22;
    v15[6] = v16[6];
    v13((char *)v15 + *(int *)(v17 + 44), (char *)v16 + *(int *)(v17 + 44), v12);
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  return a1;
}

uint64_t sub_2526522EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v10;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  uint64_t v11 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(int *)(a3 + 52);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_252675860();
  uint64_t v37 = *(void *)(v16 - 8);
  uint64_t v38 = v16;
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v37 + 40);
  ((void (*)(uint64_t, uint64_t))v17)(v14, v15);
  uint64_t v18 = *(int *)(a3 + 56);
  uint64_t v19 = (char *)(a1 + v18);
  long long v20 = (char *)(a2 + v18);
  uint64_t v21 = type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  LODWORD(v15) = v23(v19, 1, v21);
  int v24 = v23(v20, 1, v21);
  if (!v15)
  {
    if (!v24)
    {
      uint64_t v30 = *((void *)v20 + 1);
      *(void *)uint64_t v19 = *(void *)v20;
      *((void *)v19 + 1) = v30;
      swift_bridgeObjectRelease();
      uint64_t v31 = *((void *)v20 + 3);
      *((void *)v19 + 2) = *((void *)v20 + 2);
      *((void *)v19 + 3) = v31;
      swift_bridgeObjectRelease();
      uint64_t v32 = *((void *)v20 + 5);
      *((void *)v19 + 4) = *((void *)v20 + 4);
      *((void *)v19 + 5) = v32;
      swift_bridgeObjectRelease();
      uint64_t v33 = *((void *)v20 + 7);
      *((void *)v19 + 6) = *((void *)v20 + 6);
      *((void *)v19 + 7) = v33;
      swift_bridgeObjectRelease();
      uint64_t v34 = *((void *)v20 + 9);
      *((void *)v19 + 8) = *((void *)v20 + 8);
      *((void *)v19 + 9) = v34;
      swift_bridgeObjectRelease();
      uint64_t v35 = *((void *)v20 + 11);
      *((void *)v19 + 10) = *((void *)v20 + 10);
      *((void *)v19 + 11) = v35;
      swift_bridgeObjectRelease();
      uint64_t v36 = *((void *)v20 + 13);
      *((void *)v19 + 12) = *((void *)v20 + 12);
      *((void *)v19 + 13) = v36;
      swift_bridgeObjectRelease();
      v17(&v19[*(int *)(v21 + 44)], &v20[*(int *)(v21 + 44)], v38);
      return a1;
    }
    sub_252650F10((uint64_t)v19);
    goto LABEL_6;
  }
  if (v24)
  {
LABEL_6:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C127C8);
    memcpy(v19, v20, *(void *)(*(void *)(v28 - 8) + 64));
    return a1;
  }
  long long v25 = *((_OWORD *)v20 + 1);
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  *((_OWORD *)v19 + 1) = v25;
  long long v26 = *((_OWORD *)v20 + 3);
  *((_OWORD *)v19 + 2) = *((_OWORD *)v20 + 2);
  *((_OWORD *)v19 + 3) = v26;
  long long v27 = *((_OWORD *)v20 + 5);
  *((_OWORD *)v19 + 4) = *((_OWORD *)v20 + 4);
  *((_OWORD *)v19 + 5) = v27;
  *((_OWORD *)v19 + 6) = *((_OWORD *)v20 + 6);
  (*(void (**)(char *, char *, uint64_t))(v37 + 32))(&v19[*(int *)(v21 + 44)], &v20[*(int *)(v21 + 44)], v38);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  return a1;
}

uint64_t sub_2526525E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2526525F8);
}

uint64_t sub_2526525F8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_252675860();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 52);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C127C8);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 56);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_252652728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25265273C);
}

uint64_t sub_25265273C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_252675860();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 52);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C127C8);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 56);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_25265286C()
{
  sub_252675860();
  if (v0 <= 0x3F)
  {
    sub_252652958();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_252652958()
{
  if (!qword_269C127E8)
  {
    type metadata accessor for Com_Apple_Wpc_Es_IdBundle();
    unint64_t v0 = sub_252675E90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269C127E8);
    }
  }
}

uint64_t sub_2526529B0@<X0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  uint64_t v58 = a1;
  uint64_t v5 = (void *)sub_2526753F0();
  id v6 = (id)*(v5 - 1);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (uint64_t *)((char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAD0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v57 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B22A6C0 != -1) {
LABEL_19:
  }
    swift_once();
  uint64_t v11 = sub_2526759F0();
  uint64_t v59 = __swift_project_value_buffer(v11, (uint64_t)qword_26B22B718);
  uint64_t v12 = sub_2526759D0();
  os_log_type_t v13 = sub_252675DE0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_25262F000, v12, v13, "Trying to locate geohash file in geohash-2 folder.", v14, 2u);
    MEMORY[0x2533B8110](v14, -1, -1);
  }

  type metadata accessor for Geohash();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = 0;
  *(void *)(inited + 24) = 0;
  uint64_t v16 = sub_25264A868(8, a2, a3);
  unint64_t v18 = v17;
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_25264D018(2, v16, v18, v19);
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  swift_bridgeObjectRelease();
  uint64_t v60 = MEMORY[0x2533B7530](v20, v22, v24, v26);
  unint64_t v28 = v27;
  swift_bridgeObjectRelease();
  if (sub_252675C40() < 2)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_2526759D0();
    os_log_type_t v42 = sub_252675E00();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      v61[0] = v44;
      *(_DWORD *)uint64_t v43 = 136315138;
      swift_bridgeObjectRetain();
      v61[2] = sub_2526669DC(v60, v28, v61);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v41, v42, "Unable to locate matching geohash in geohash-2 Folder for : %s", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v44, -1, -1);
      MEMORY[0x2533B8110](v43, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v45 = v58;
    uint64_t v46 = sub_252675470();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v45, 1, 1, v46);
  }
  else
  {
    uint64_t v54 = v8;
    unint64_t v55 = (void (**)(uint64_t *, void, void *))v6;
    unint64_t v56 = v5;
    uint64_t v29 = self;
    if (qword_26B22A6B0 != -1) {
      swift_once();
    }
    uint64_t v8 = &qword_26B22B708;
    while (1)
    {
      v61[0] = qword_26B22B708;
      v61[1] = unk_26B22B710;
      swift_bridgeObjectRetain();
      sub_25263CB4C();
      sub_252675C70();
      swift_bridgeObjectRelease();
      sub_252675C70();
      sub_252675C70();
      sub_252675C70();
      swift_bridgeObjectRetain();
      sub_252675C70();
      swift_bridgeObjectRelease();
      sub_252675C70();
      id v30 = objc_msgSend(v29, sel_defaultManager);
      uint64_t v5 = (void *)sub_252675B90();
      id v6 = objc_msgSend(v30, sel_fileExistsAtPath_, v5);

      if (v6) {
        break;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_252675C40();
      swift_bridgeObjectRelease();
      if (__OFSUB__(v31, 1))
      {
        __break(1u);
        goto LABEL_19;
      }
      uint64_t v33 = sub_25264D018(v31 - 1, v16, v18, v32);
      uint64_t v35 = v34;
      uint64_t v37 = v36;
      uint64_t v39 = v38;
      swift_bridgeObjectRelease();
      uint64_t v16 = MEMORY[0x2533B7530](v33, v35, v37, v39);
      unint64_t v18 = v40;
      swift_bridgeObjectRelease();
      if (sub_252675C40() <= 1) {
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v48 = sub_2526759D0();
    os_log_type_t v49 = sub_252675E20();
    if (os_log_type_enabled(v48, v49))
    {
      unint64_t v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v50 = 0;
      _os_log_impl(&dword_25262F000, v48, v49, "Located geohash file in geohash-2 folder.", v50, 2u);
      MEMORY[0x2533B8110](v50, -1, -1);
    }

    uint64_t v51 = sub_252675470();
    uint64_t v52 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56);
    v52(v57, 1, 1, v51);
    v55[13](v54, *MEMORY[0x263F06E50], v56);
    uint64_t v53 = v58;
    sub_252675460();
    return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v52)(v53, 0, 1, v51);
  }
}

uint64_t sub_2526530A0()
{
  uint64_t result = sub_2526530C4();
  qword_26B22B708 = result;
  unk_26B22B710 = v1;
  return result;
}

uint64_t sub_2526530C4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAD0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_252675470();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(self, sel_defaultManager);
  id v8 = objc_msgSend(v7, sel_URLsForDirectory_inDomains_, 13, 1);
  uint64_t v9 = sub_252675D80();

  if (*(void *)(v9 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v2, v9 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)), v3);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_252634810((uint64_t)v2, &qword_26B22AAD0);

    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    v13[0] = sub_252675430();
    v13[1] = v11;
    sub_252675C70();
    sub_252675C70();

    uint64_t v10 = v13[0];
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v10;
}

id sub_252653354()
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  char v31 = 1;
  id v0 = objc_msgSend(self, sel_defaultManager);
  uint64_t v1 = (void *)sub_252675B90();
  unsigned int v2 = objc_msgSend(v0, sel_fileExistsAtPath_isDirectory_, v1, &v31);

  if (v2)
  {
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_2526759F0();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B22B718);
    uint64_t v4 = sub_2526759D0();
    os_log_type_t v5 = sub_252675E00();
    if (os_log_type_enabled(v4, v5))
    {
      id v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_25262F000, v4, v5, "Path exists", v6, 2u);
      MEMORY[0x2533B8110](v6, -1, -1);
    }

    id v7 = sub_2526759D0();
    os_log_type_t v8 = sub_252675E00();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_25262F000, v7, v8, "Deleting existing file", v9, 2u);
      MEMORY[0x2533B8110](v9, -1, -1);
    }

    uint64_t v10 = (void *)sub_252675B90();
    id v30 = 0;
    unsigned int v11 = objc_msgSend(v0, sel_removeItemAtPath_error_, v10, &v30);

    if (v11)
    {
      id v12 = v30;
    }
    else
    {
      id v13 = v30;
      uint64_t v14 = (void *)sub_2526753E0();

      swift_willThrow();
    }
  }
  uint64_t v15 = (void *)sub_252675B90();
  id v30 = 0;
  id v16 = objc_msgSend(v0, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v15, 1, 0, &v30);

  if (v16)
  {
    id v17 = v30;
  }
  else
  {
    id v18 = v30;
    unint64_t v19 = (void *)sub_2526753E0();

    swift_willThrow();
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_2526759F0();
    __swift_project_value_buffer(v20, (uint64_t)qword_26B22B718);
    id v21 = v19;
    id v22 = v19;
    uint64_t v23 = sub_2526759D0();
    os_log_type_t v24 = sub_252675E00();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 138412290;
      id v27 = v19;
      unint64_t v28 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v30 = v28;
      sub_252675EA0();
      *uint64_t v26 = v28;

      _os_log_impl(&dword_25262F000, v23, v24, "Unable to create GeoHash Directory! %@", v25, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C12820);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v26, -1, -1);
      MEMORY[0x2533B8110](v25, -1, -1);
    }
    else
    {
    }
  }
  return v16;
}

uint64_t sub_2526537B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C127F0);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C127F8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12800);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12808);
  sub_252675810();
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  sub_252637F24();
  sub_252653B5C();
  sub_252675B30();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_252634810((uint64_t)v6, &qword_269C127F0);
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_2526759F0();
    __swift_project_value_buffer(v15, (uint64_t)qword_26B22B718);
    id v16 = sub_2526759D0();
    os_log_type_t v17 = sub_252675E00();
    if (os_log_type_enabled(v16, v17))
    {
      id v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_25262F000, v16, v17, "No Matching file name found in Geo Hash", v18, 2u);
      MEMORY[0x2533B8110](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    swift_getKeyPath();
    sub_252675820();
    swift_release();
    uint64_t v19 = MEMORY[0x2533B7530](v21, v22, v23, v24);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  return v19;
}

unint64_t sub_252653B5C()
{
  unint64_t result = qword_269C12810;
  if (!qword_269C12810)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C12800);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12810);
  }
  return result;
}

uint64_t sub_252653BB8(CLLocationDegrees a1, CLLocationDegrees a2)
{
  v65[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = sub_252675BF0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (void *)MEMORY[0x2533B7BC0](v6);
  sub_252654378(v65);
  uint64_t v11 = v65[0];
  if (!v65[0])
  {
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v46 = sub_2526759F0();
    __swift_project_value_buffer(v46, (uint64_t)qword_26B22B718);
    os_log_type_t v42 = sub_2526759D0();
    os_log_type_t v43 = sub_252675E00();
    if (!os_log_type_enabled(v42, v43)) {
      goto LABEL_32;
    }
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v44 = 0;
    uint64_t v45 = "Unable to retrieve geoJSONs from geohash tile";
LABEL_31:
    _os_log_impl(&dword_25262F000, v42, v43, v45, v44, 2u);
    MEMORY[0x2533B8110](v44, -1, -1);
LABEL_32:

    return 0;
  }
  uint64_t v12 = *((void *)v65[0] + 2);
  if (!v12)
  {
LABEL_24:
    swift_bridgeObjectRelease();
    if (qword_26B22A6C0 != -1) {
LABEL_45:
    }
      swift_once();
    uint64_t v41 = sub_2526759F0();
    __swift_project_value_buffer(v41, (uint64_t)qword_26B22B718);
    os_log_type_t v42 = sub_2526759D0();
    os_log_type_t v43 = sub_252675E20();
    if (!os_log_type_enabled(v42, v43)) {
      goto LABEL_32;
    }
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v44 = 0;
    uint64_t v45 = "No matching grid polygon in geohash tile.";
    goto LABEL_31;
  }
  uint64_t v13 = 0;
  uint64_t v14 = (void (**)(char *, uint64_t))(v5 + 8);
  *(void *)&long long v10 = 138412290;
  long long v63 = v10;
  uint64_t v64 = (void (**)(char *, uint64_t))(v5 + 8);
  while (1)
  {
    if (!*(void *)(v11[v13 + 4] + 16)) {
      goto LABEL_5;
    }
    swift_bridgeObjectRetain();
    sub_25264C464(6516580, 0xE300000000000000);
    if (v15) {
      break;
    }
    swift_bridgeObjectRelease();
LABEL_5:
    if (v12 == ++v13) {
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_252675BE0();
  uint64_t v16 = sub_252675BB0();
  unint64_t v18 = v17;
  swift_bridgeObjectRelease();
  (*v14)(v8, v4);
  if (v18 >> 60 == 15) {
    goto LABEL_5;
  }
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F108D8]), sel_init);
  uint64_t v20 = (void *)sub_2526754D0();
  v65[0] = 0;
  id v21 = objc_msgSend(v19, sel_geoJSONObjectsWithData_error_, v20, v65);

  id v22 = v65[0];
  if (!v21)
  {
    id v27 = v65[0];
    unint64_t v28 = (void *)sub_2526753E0();

    swift_willThrow();
    if (qword_26B22A9E0 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_2526759F0();
    __swift_project_value_buffer(v29, (uint64_t)qword_26B22B6D8);
    id v30 = v28;
    id v31 = v28;
    uint64_t v32 = sub_2526759D0();
    os_log_type_t v33 = sub_252675E00();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = swift_slowAlloc();
      uint64_t v61 = v16;
      uint64_t v35 = v34;
      uint64_t v36 = swift_slowAlloc();
      uint64_t v62 = v4;
      uint64_t v37 = (void *)v36;
      *(_DWORD *)uint64_t v35 = v63;
      id v38 = v28;
      uint64_t v39 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v35 + 4) = v39;
      void *v37 = v39;

      _os_log_impl(&dword_25262F000, v32, v33, "Error while decoding geoJSON File %@", (uint8_t *)v35, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C12820);
      swift_arrayDestroy();
      unint64_t v40 = v37;
      uint64_t v4 = v62;
      MEMORY[0x2533B8110](v40, -1, -1);
      MEMORY[0x2533B8110](v35, -1, -1);
      sub_252646E38(v61, v18);
    }
    else
    {
      sub_252646E38(v16, v18);
    }
    uint64_t v14 = v64;
    goto LABEL_5;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A6F8);
  uint64_t v23 = sub_252675D80();
  id v24 = v22;

  if ((v23 & 0xC000000000000001) != 0)
  {
    MEMORY[0x2533B78E0](0, v23);
  }
  else
  {
    if (!*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_45;
    }
    swift_unknownObjectRetain();
  }
  swift_bridgeObjectRelease();
  self;
  uint64_t v25 = (void *)swift_dynamicCastObjCClass();
  if (!v25)
  {
    swift_unknownObjectRelease();
    sub_252646E38(v16, v18);
    uint64_t v14 = v64;
    goto LABEL_5;
  }
  uint64_t v26 = v25;
  if ((sub_252654AB8(v25, a1, a2) & 1) == 0)
  {
    sub_252646E38(v16, v18);
    swift_unknownObjectRelease();
    uint64_t v14 = v64;
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  if (qword_26B22A6C0 != -1) {
    swift_once();
  }
  uint64_t v49 = sub_2526759F0();
  __swift_project_value_buffer(v49, (uint64_t)qword_26B22B718);
  unint64_t v50 = sub_2526759D0();
  os_log_type_t v51 = sub_252675E20();
  if (os_log_type_enabled(v50, v51))
  {
    uint64_t v52 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v52 = 0;
    _os_log_impl(&dword_25262F000, v50, v51, "Found matching Polygon", v52, 2u);
    MEMORY[0x2533B8110](v52, -1, -1);
  }

  uint64_t v53 = sub_2526759D0();
  os_log_type_t v54 = sub_252675DE0();
  if (os_log_type_enabled(v53, v54))
  {
    unint64_t v55 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v55 = 0;
    _os_log_impl(&dword_25262F000, v53, v54, "Extracting Grid Info", v55, 2u);
    MEMORY[0x2533B8110](v55, -1, -1);
  }

  id v56 = objc_msgSend(v26, sel_properties);
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = sub_2526754F0();
    unint64_t v60 = v59;
  }
  else
  {
    uint64_t v58 = 0;
    unint64_t v60 = 0xF000000000000000;
  }
  uint64_t v47 = sub_252654E54(v58, v60);
  sub_252646E38(v58, v60);
  swift_unknownObjectRelease();
  sub_252646E38(v16, v18);
  return v47;
}

void sub_252654378(void *a1@<X8>)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(self, sel_defaultManager);
  uint64_t v3 = sub_25265CC68();
  unint64_t v5 = v4;

  if (v5 >> 60 != 15)
  {
    uint64_t v6 = self;
    uint64_t v7 = (void *)sub_2526754D0();
    *(void *)&long long v17 = 0;
    id v8 = objc_msgSend(v6, sel_JSONObjectWithData_options_error_, v7, 0, &v17);

    id v9 = (id)v17;
    if (v8)
    {
      sub_252675F10();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v10 = v9;
      uint64_t v11 = (void *)sub_2526753E0();

      swift_willThrow();
      memset(v19, 0, sizeof(v19));
    }
    sub_252655D5C(1935896420, 0xE400000000000000, &v17);
    if (v18)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B22A6D8);
      if (swift_dynamicCast())
      {
        sub_252646E38(v3, v5);
        sub_25265509C((uint64_t)v19);
        *a1 = v16;
        return;
      }
    }
    else
    {
      sub_25265509C((uint64_t)&v17);
    }
    if (qword_26B22A9E0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_2526759F0();
    __swift_project_value_buffer(v12, (uint64_t)qword_26B22B6D8);
    uint64_t v13 = sub_2526759D0();
    os_log_type_t v14 = sub_252675E00();
    if (os_log_type_enabled(v13, v14))
    {
      char v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v15 = 0;
      _os_log_impl(&dword_25262F000, v13, v14, "Unable to deserialize Geohash GeoJSON document", v15, 2u);
      MEMORY[0x2533B8110](v15, -1, -1);
    }
    sub_252646E38(v3, v5);

    sub_25265509C((uint64_t)v19);
  }
  *a1 = 0;
}

uint64_t sub_252654618(unint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v12 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_18;
  }
  sub_252676000();
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; ; ++i)
      {
        MEMORY[0x2533B78E0](i, v1);
        uint64_t v4 = i + 1;
        if (__OFADD__(i, 1)) {
          break;
        }
        self;
        if (!swift_dynamicCastObjCClass())
        {
          swift_unknownObjectRelease();
          goto LABEL_15;
        }
        sub_252675FE0();
        sub_252676010();
        sub_252676020();
        sub_252675FF0();
        if (v4 == v2) {
          return v12;
        }
      }
      __break(1u);
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v6 = v1 + 32;
      while (1)
      {
        uint64_t v7 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          break;
        }
        id v8 = *(void **)(v6 + 8 * v5);
        self;
        uint64_t v9 = swift_dynamicCastObjCClass();
        if (!v9)
        {
LABEL_15:
          swift_release();
          return 0;
        }
        uint64_t v1 = v9;
        id v10 = v8;
        sub_252675FE0();
        sub_252676010();
        sub_252676020();
        sub_252675FF0();
        ++v5;
        if (v7 == v2) {
          return v12;
        }
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    sub_252676050();
    swift_bridgeObjectRelease();
    sub_252676000();
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_252676050();
    swift_bridgeObjectRelease();
  }
  return v12;
}

uint64_t sub_2526547FC(void *a1)
{
  id v3 = objc_msgSend(a1, sel_geometry);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B22A6E8);
  unint64_t v4 = sub_252675D80();

  uint64_t v5 = sub_252654618(v4);
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_11;
  }
  if ((v5 & 0xC000000000000001) != 0)
  {
    id v6 = (id)MEMORY[0x2533B78E0](0, v5);
  }
  else
  {
    if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_22;
    }
    id v6 = *(id *)(v5 + 32);
  }
  uint64_t v7 = v6;
  unint64_t v1 = 0x26537F000uLL;
  id v8 = objc_msgSend(v6, sel_polygons);

  sub_2526550FC();
  unint64_t v9 = sub_252675D80();

  if (v9 >> 62)
  {
LABEL_22:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_252676050();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_7:
  swift_bridgeObjectRelease();
  if (v10)
  {
    if ((v5 & 0xC000000000000001) != 0) {
      id v11 = (id)MEMORY[0x2533B78E0](0, v5);
    }
    else {
      id v11 = *(id *)(v5 + 32);
    }
    id v19 = v11;
    swift_bridgeObjectRelease();
    id v20 = [v19 *(SEL *)(v1 + 2920)];

    uint64_t v14 = sub_252675D80();
    return v14;
  }
  swift_bridgeObjectRelease();
LABEL_11:
  id v12 = objc_msgSend(a1, sel_geometry);
  unint64_t v13 = sub_252675D80();

  uint64_t v14 = sub_252654618(v13);
  swift_bridgeObjectRelease();
  if (!v14)
  {
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_2526759F0();
    __swift_project_value_buffer(v15, (uint64_t)qword_26B22B718);
    uint64_t v16 = sub_2526759D0();
    os_log_type_t v17 = sub_252675DF0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_25262F000, v16, v17, "Unable to locate Polygons in current GeoFeature", v18, 2u);
      MEMORY[0x2533B8110](v18, -1, -1);
    }

    return 0;
  }
  return v14;
}

uint64_t sub_252654AB8(void *a1, CLLocationDegrees a2, CLLocationDegrees a3)
{
  uint64_t v37 = sub_252675800();
  uint64_t v6 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  id v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = sub_2526547FC(a1);
  if (!v9)
  {
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_2526759F0();
    __swift_project_value_buffer(v27, (uint64_t)qword_26B22B718);
    unint64_t v28 = sub_2526759D0();
    os_log_type_t v29 = sub_252675DF0();
    if (os_log_type_enabled(v28, v29))
    {
      id v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v30 = 0;
      _os_log_impl(&dword_25262F000, v28, v29, "No multiPolygons for the current Geofeature", v30, 2u);
      MEMORY[0x2533B8110](v30, -1, -1);
    }

    return 0;
  }
  unint64_t v10 = v9;
  if (v9 >> 62)
  {
LABEL_21:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_252676050();
    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_22;
  }
  uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v11)
  {
LABEL_22:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_4:
  unint64_t v38 = v10 & 0xC000000000000001;
  uint64_t v36 = (void (**)(char *, void, uint64_t))(v6 + 104);
  unsigned int v35 = *MEMORY[0x263F00040];
  os_log_type_t v33 = &v41;
  uint64_t v34 = v40;
  uint64_t v32 = (void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v12 = 4;
  unint64_t v13 = 0x26537F000;
  while (1)
  {
    uint64_t v6 = v12 - 4;
    if (v38) {
      id v14 = (id)MEMORY[0x2533B78E0](v12 - 4, v10);
    }
    else {
      id v14 = *(id *)(v10 + 8 * v12);
    }
    uint64_t v15 = v14;
    uint64_t v16 = v12 - 3;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10A00]), sel_initWithPolygon_, v14);
    v42.latitude = a2;
    v42.longitude = a3;
    MKMapPoint v18 = MKMapPointForCoordinate(v42);
    objc_msgSend(v17, sel_pointForMapPoint_, v18.x, v18.y);
    id v19 = [v17 *(SEL *)(v13 + 2904)];

    if (!v19)
    {

      goto LABEL_6;
    }
    unint64_t v20 = v10;
    uint64_t result = (uint64_t)[v17 *(SEL *)(v13 + 2904)];
    if (!result) {
      break;
    }
    id v22 = (void *)result;
    uint64_t v23 = v37;
    (*v36)(v8, v35, v37);
    id v24 = v34;
    *uint64_t v34 = 0;
    v24[1] = 0;
    uint64_t v39 = 0x3FF0000000000000;
    v40[2] = 0x3FF0000000000000;
    uint64_t v25 = v33;
    uint64_t *v33 = 0;
    v25[1] = 0;
    char v26 = sub_252675E70();

    (*v32)(v8, v23);
    unint64_t v10 = v20;
    if (v26)
    {
      swift_bridgeObjectRelease_n();
      return 1;
    }
LABEL_6:
    ++v12;
    unint64_t v13 = 0x26537F000uLL;
    if (v16 == v11) {
      goto LABEL_22;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_252654E54(uint64_t a1, unint64_t a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a2 >> 60 == 15)
  {
    if (qword_26B22A9E0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_2526759F0();
    __swift_project_value_buffer(v2, (uint64_t)qword_26B22B6D8);
    id v3 = sub_2526759D0();
    os_log_type_t v4 = sub_252675E00();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_25262F000, v3, v4, "Unable to find grid in matching Polygon", v5, 2u);
      MEMORY[0x2533B8110](v5, -1, -1);
    }

    return 0;
  }
  id v8 = self;
  sub_2526468C8(a1, a2);
  unint64_t v9 = (void *)sub_2526754D0();
  *(void *)&long long v16 = 0;
  id v10 = objc_msgSend(v8, sel_JSONObjectWithData_options_error_, v9, 0, &v16);

  id v11 = (id)v16;
  if (v10)
  {
    sub_252675F10();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v12 = v11;
    unint64_t v13 = (void *)sub_2526753E0();

    swift_willThrow();
    memset(v18, 0, sizeof(v18));
  }
  sub_252655D5C(1684632167, 0xE400000000000000, &v16);
  sub_252646E38(a1, a2);
  sub_25265509C((uint64_t)v18);
  if (!v17)
  {
    sub_25265509C((uint64_t)&v16);
    return 0;
  }
  if (swift_dynamicCast()) {
    return v15;
  }
  else {
    return 0;
  }
}

uint64_t sub_25265509C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26B22AA80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2526550FC()
{
  unint64_t result = qword_26B22A700;
  if (!qword_26B22A700)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B22A700);
  }
  return result;
}

unint64_t sub_25265513C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AA28);
  uint64_t v2 = (void *)sub_252676080();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  os_log_type_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_25264C464(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v11 = (uint64_t *)(v2[6] + 16 * result);
    *id v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
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

unint64_t sub_252655260(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A720);
  uint64_t v2 = sub_252676080();
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
    sub_252659804(v6, (uint64_t)&v15, &qword_26B22A6D0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_25264C464(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v11 = (uint64_t *)(v3[6] + 16 * result);
    *id v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_2526348D4(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_252655398(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12840);
  uint64_t v2 = sub_252676080();
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
    sub_252659804(v6, (uint64_t)v15, &qword_269C12848);
    unint64_t result = sub_25264C490((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_2526348D4(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

uint64_t sub_2526554DC()
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  sub_252656298(0x68746150697061, 0xE700000000000000, &v23);
  if (!v24)
  {
    sub_252634810((uint64_t)&v23, qword_26B22AA80);
    goto LABEL_6;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AA08);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    if (qword_26B22AAC8 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_2526759F0();
    __swift_project_value_buffer(v7, (uint64_t)qword_26B22B740);
    char v8 = sub_2526759D0();
    os_log_type_t v9 = sub_252675E00();
    if (os_log_type_enabled(v8, v9))
    {
      long long v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v10 = 0;
      _os_log_impl(&dword_25262F000, v8, v9, "No API Paths found in config", v10, 2u);
      MEMORY[0x2533B8110](v10, -1, -1);
    }

    return 0;
  }
  id v0 = self;
  unint64_t v1 = (void *)sub_252675AC0();
  swift_bridgeObjectRelease();
  *(void *)&long long v23 = 0;
  id v2 = objc_msgSend(v0, sel_dataWithJSONObject_options_error_, v1, 0, &v23);

  id v3 = (id)v23;
  if (v2)
  {
    uint64_t v4 = sub_2526754F0();
    unint64_t v6 = v5;

    sub_2526750E0();
    swift_allocObject();
    sub_2526750D0();
    sub_252657728();
    sub_2526750C0();
    sub_252636330(v4, v6);
    swift_release();
    return v23;
  }
  long long v11 = v3;
  uint64_t v12 = (void *)sub_2526753E0();

  swift_willThrow();
  if (qword_26B22AAC8 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_2526759F0();
  __swift_project_value_buffer(v13, (uint64_t)qword_26B22B740);
  id v14 = v12;
  id v15 = v12;
  uint64_t v16 = sub_2526759D0();
  os_log_type_t v17 = sub_252675E00();
  if (!os_log_type_enabled(v16, v17))
  {

    return 0;
  }
  MKMapPoint v18 = (uint8_t *)swift_slowAlloc();
  uint64_t v19 = (void *)swift_slowAlloc();
  *(_DWORD *)MKMapPoint v18 = 138412290;
  id v20 = v12;
  uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
  *(void *)&long long v23 = v21;
  sub_252675EA0();
  void *v19 = v21;

  _os_log_impl(&dword_25262F000, v16, v17, "Unable to decode config's APIPath. %@", v18, 0xCu);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12820);
  swift_arrayDestroy();
  MEMORY[0x2533B8110](v19, -1, -1);
  MEMORY[0x2533B8110](v18, -1, -1);

  return 0;
}

uint64_t sub_252655930()
{
  sub_252656298(0x5255726576726573, 0xE90000000000004CLL, &v6);
  if (v7)
  {
    if (swift_dynamicCast()) {
      return v5;
    }
  }
  else
  {
    sub_252634810((uint64_t)&v6, qword_26B22AA80);
  }
  if (qword_26B22AAC8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2526759F0();
  __swift_project_value_buffer(v1, (uint64_t)qword_26B22B740);
  id v2 = sub_2526759D0();
  os_log_type_t v3 = sub_252675E00();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_25262F000, v2, v3, "No Server Base URL found in config", v4, 2u);
    MEMORY[0x2533B8110](v4, -1, -1);
  }

  return 0;
}

uint64_t sub_252655A80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_252659804(a1, (uint64_t)v11, qword_26B22AA80);
  if (v12)
  {
    sub_252659804((uint64_t)v11, (uint64_t)v10, qword_26B22AA80);
    sub_2526576EC(0, &qword_26B22AB60);
    if (swift_dynamicCast())
    {
      id v4 = v9;
      objc_msgSend(v4, sel_objCType);
      if (sub_252675C80() == 99 && v5 == 0xE100000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v6 = sub_252676130();
        swift_bridgeObjectRelease();
        if ((v6 & 1) == 0)
        {

          sub_252659804(a1, a2, qword_26B22AA80);
          goto LABEL_13;
        }
      }
      unsigned __int8 v7 = objc_msgSend(v4, sel_BOOLValue);
      *(void *)(a2 + 24) = MEMORY[0x263F8D4F8];

      *(unsigned char *)a2 = v7;
LABEL_13:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
      return sub_252634810((uint64_t)v11, qword_26B22AA80);
    }
    sub_2526576EC(0, &qword_26B22AB58);
    if (swift_dynamicCast())
    {

      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      goto LABEL_13;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  sub_252659804(a1, a2, qword_26B22AA80);
  return sub_252634810((uint64_t)v11, qword_26B22AA80);
}

uint64_t sub_252655C50@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  *(void *)&long long v9 = a3;
  if (a3
    && (uint64_t v6 = result,
        swift_unknownObjectRetain(),
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B22AA70),
        unint64_t result = swift_dynamicCast(),
        result))
  {
    if (*(void *)(v11 + 16))
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_25264C464(v6, a2);
      if (v8)
      {
        sub_252638088(*(void *)(v11 + 56) + 32 * v7, (uint64_t)&v9);
      }
      else
      {
        long long v9 = 0u;
        long long v10 = 0u;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_252655A80((uint64_t)&v9, (uint64_t)a4);
    return sub_252634810((uint64_t)&v9, qword_26B22AA80);
  }
  else
  {
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_252655D5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  sub_252659804(v3, (uint64_t)&v11, qword_26B22AA80);
  if (!*((void *)&v12 + 1))
  {
    uint64_t result = sub_252634810((uint64_t)&v11, qword_26B22AA80);
    goto LABEL_7;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B22AA70);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_7:
    *a3 = 0u;
    a3[1] = 0u;
    return result;
  }
  if (*(void *)(v10 + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_25264C464(a1, a2);
    if (v9)
    {
      sub_252638088(*(void *)(v10 + 56) + 32 * v8, (uint64_t)&v11);
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_252655A80((uint64_t)&v11, (uint64_t)a3);
  return sub_252634810((uint64_t)&v11, qword_26B22AA80);
}

unint64_t sub_252655E84()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A730);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_252676970;
  *(void *)(inited + 32) = 0xD00000000000001BLL;
  *(void *)(inited + 40) = 0x8000000252679BE0;
  *(void *)(inited + 48) = 3600;
  *(void *)(inited + 72) = MEMORY[0x263F8D6C8];
  *(void *)(inited + 80) = 0xD000000000000010;
  *(void *)(inited + 88) = 0x8000000252679BC0;
  *(void *)(inited + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB40);
  *(void *)(inited + 96) = &unk_2702B75C0;
  unint64_t result = sub_252655260(inited);
  qword_26B22B6B0 = result;
  return result;
}

uint64_t sub_252655F44()
{
  sub_252656298(0x72756769666E6F63, 0xED00006E6F697461, &v17);
  if (!*((void *)&v18 + 1)) {
    goto LABEL_14;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B22AA70);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_15;
  }
  if (*(void *)(v16 + 16) && (uint64_t v0 = sub_25264C464(0xD000000000000010, 0x8000000252679BC0), (v1 & 1) != 0))
  {
    sub_252638088(*(void *)(v16 + 56) + 32 * v0, (uint64_t)&v17);
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v18 + 1))
  {
LABEL_14:
    sub_252634810((uint64_t)&v17, qword_26B22AA80);
    goto LABEL_15;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB40);
  if (swift_dynamicCast())
  {
    uint64_t v2 = v16;
    if (qword_26B22AAC8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_2526759F0();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B22B740);
    id v4 = sub_2526759D0();
    os_log_type_t v5 = sub_252675E20();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_25262F000, v4, v5, "Returning regions from server config", v6, 2u);
      MEMORY[0x2533B8110](v6, -1, -1);
    }

    goto LABEL_26;
  }
LABEL_15:
  if (qword_26B22AAC8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_2526759F0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B22B740);
  uint64_t v8 = sub_2526759D0();
  os_log_type_t v9 = sub_252675E00();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_25262F000, v8, v9, "    Returning regions from default config.\n    Ensure this invocation is from a client that needs this value during installation.", v10, 2u);
    MEMORY[0x2533B8110](v10, -1, -1);
  }

  if (qword_26B22A598 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_26B22B6B0;
  if (*(void *)(qword_26B22B6B0 + 16)
    && (uint64_t v12 = sub_25264C464(0xD000000000000010, 0x8000000252679BC0), (v13 & 1) != 0)
    && (sub_252638088(*(void *)(v11 + 56) + 32 * v12, (uint64_t)&v17),
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB40),
        swift_dynamicCast()))
  {
    uint64_t v2 = v16;
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE78];
  }
LABEL_26:
  uint64_t v14 = sub_25265976C(v2);
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_252656298@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (sub_25263CB4C()) {
    sub_252676130();
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = (__CFString *)sub_252675B90();
  uint64_t v7 = (__CFString *)sub_252675B90();
  CFPropertyListRef v8 = CFPreferencesCopyAppValue(v6, v7);
  swift_bridgeObjectRelease();

  swift_unknownObjectRetain();
  sub_252655C50(0x6553796772656E65, 0xEE00736563697672, (uint64_t)v8, v10);
  swift_unknownObjectRelease();
  sub_252655D5C(a1, a2, a3);
  swift_unknownObjectRelease();
  return sub_252634810((uint64_t)v10, qword_26B22AA80);
}

uint64_t sub_25265641C(uint64_t a1)
{
  os_log_type_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_269C12838 + dword_269C12838);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 56) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2526564C4;
  return v5(a1);
}

uint64_t sub_2526564C4(char a1)
{
  *(unsigned char *)(*(void *)v1 + 64) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2526565C4, 0, 0);
}

uint64_t sub_2526565C4()
{
  if (*(unsigned char *)(v0 + 64) == 1)
  {
    sub_252656298(0x72756769666E6F63, 0xED00006E6F697461, (_OWORD *)(v0 + 16));
    if (*(void *)(v0 + 40))
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B22AA70);
      if (swift_dynamicCast())
      {
        uint64_t v1 = *(void *)(v0 + 48);
        goto LABEL_13;
      }
    }
    else
    {
      sub_252634810(v0 + 16, qword_26B22AA80);
    }
  }
  if (qword_26B22AAC8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2526759F0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B22B740);
  uint64_t v3 = sub_2526759D0();
  os_log_type_t v4 = sub_252675E00();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v5 = 0;
    _os_log_impl(&dword_25262F000, v3, v4, "Using default configuration values hardcoded in Framework.", v5, 2u);
    MEMORY[0x2533B8110](v5, -1, -1);
  }

  if (qword_26B22A598 != -1) {
    swift_once();
  }
  uint64_t v1 = swift_bridgeObjectRetain();
LABEL_13:
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v6(v1);
}

uint64_t sub_2526567A0()
{
  if (*v0) {
    return 0x6E49796772656E65;
  }
  else {
    return 0x656C695464697267;
  }
}

uint64_t sub_2526567F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252659A9C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25265681C()
{
  return 0;
}

void sub_252656828(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_252656834(uint64_t a1)
{
  unint64_t v2 = sub_252659DE0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252656870(uint64_t a1)
{
  unint64_t v2 = sub_252659DE0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2526568AC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v12[0] = a4;
  v12[1] = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12850);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_252659DE0();
  sub_2526761F0();
  char v14 = 0;
  sub_2526760E0();
  if (!v5)
  {
    char v13 = 1;
    sub_2526760E0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_252656A20@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_252659BD8(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_252656A50(void *a1)
{
  return sub_2526568AC(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_252656A70(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_252656AA8(uint64_t (*a1)(void))
{
  return a1();
}

void *sub_252656AD0(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_252676090();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

void sub_252656B74(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_252675EA0();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_252656C2C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_252656C5C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_2526761B0();
  swift_bridgeObjectRetain();
  sub_252675B20();
  uint64_t v8 = sub_2526761D0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_252676130() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      long long v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_252676130() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2526570EC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_252656E0C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12828);
  uint64_t v3 = sub_252675F70();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    id v30 = (void *)(v2 + 56);
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
                  *id v30 = -1 << v29;
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
      sub_2526761B0();
      sub_252675B20();
      uint64_t result = sub_2526761D0();
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

uint64_t sub_2526570EC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_252656E0C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_252657288();
      goto LABEL_22;
    }
    sub_25265743C();
  }
  uint64_t v11 = *v4;
  sub_2526761B0();
  sub_252675B20();
  uint64_t result = sub_2526761D0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_252676130(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_252676140();
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
          uint64_t result = sub_252676130();
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

void *sub_252657288()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12828);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_252675F60();
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
    void *v19 = *v17;
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

uint64_t sub_25265743C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12828);
  uint64_t v3 = sub_252675F70();
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
    sub_2526761B0();
    swift_bridgeObjectRetain();
    sub_252675B20();
    uint64_t result = sub_2526761D0();
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

uint64_t sub_2526576EC(uint64_t a1, unint64_t *a2)
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

unint64_t sub_252657728()
{
  unint64_t result = qword_26B22A988;
  if (!qword_26B22A988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22A988);
  }
  return result;
}

uint64_t sub_25265777C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_252675620();
  uint64_t v28 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v27 - v7;
  if (sub_25263CB4C()) {
    sub_252676130();
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = (__CFString *)sub_252675B90();
  uint64_t v10 = (__CFString *)sub_252675B90();
  CFPropertyListRef v11 = CFPreferencesCopyAppValue(v9, v10);
  swift_bridgeObjectRelease();

  if (!v11) {
    goto LABEL_17;
  }
  *(void *)&long long v32 = v11;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B22AA70);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_17;
  }
  uint64_t v12 = v31[0];
  if (*(void *)(v31[0] + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_25264C464(0x6553796772656E65, 0xEE00736563697672);
    if (v14)
    {
      sub_252638088(*(void *)(v12 + 56) + 32 * v13, (uint64_t)&v29);
    }
    else
    {
      long long v29 = 0u;
      long long v30 = 0u;
    }
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    swift_bridgeObjectRetain();
  }
  sub_252655A80((uint64_t)&v29, (uint64_t)v31);
  sub_252634810((uint64_t)&v29, qword_26B22AA80);
  swift_bridgeObjectRelease();
  sub_252655D5C(0x5255726576726573, 0xE90000000000004CLL, &v32);
  sub_252634810((uint64_t)v31, qword_26B22AA80);
  if (!v33)
  {
    sub_252634810((uint64_t)&v32, qword_26B22AA80);
    goto LABEL_16;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
  if (*(void *)(v12 + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_25264C464(0x6553796772656E65, 0xEE00736563697672);
    if (v16)
    {
      sub_252638088(*(void *)(v12 + 56) + 32 * v15, (uint64_t)&v29);
    }
    else
    {
      long long v29 = 0u;
      long long v30 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
  }
  sub_252655A80((uint64_t)&v29, (uint64_t)v31);
  sub_252634810((uint64_t)&v29, qword_26B22AA80);
  swift_bridgeObjectRelease();
  sub_252655D5C(0x68746150697061, 0xE700000000000000, &v32);
  sub_252634810((uint64_t)v31, qword_26B22AA80);
  if (!v33)
  {
    BOOL v19 = qword_26B22AA80;
    uint64_t v20 = (char *)&v32;
LABEL_34:
    sub_252634810((uint64_t)v20, v19);
    goto LABEL_17;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AA08);
  if (swift_dynamicCast())
  {
    uint64_t v17 = *(void *)(v29 + 16);
    swift_bridgeObjectRelease();
    if (!v17) {
      return v17 & 1;
    }
    if (sub_25263CB4C()) {
      sub_252676130();
    }
    swift_bridgeObjectRelease();
    uint64_t v21 = (__CFString *)sub_252675B90();
    uint64_t v22 = (__CFString *)sub_252675B90();
    CFPropertyListRef v23 = CFPreferencesCopyAppValue(v21, v22);
    swift_bridgeObjectRelease();

    if (v23)
    {
      *(void *)&long long v32 = v23;
      int v24 = swift_dynamicCast();
      uint64_t v25 = v28;
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v2, v24 ^ 1u, 1, v3);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v2, 1, v3) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v8, v2, v3);
        sub_252675600();
        LOBYTE(v17) = sub_2526755B0();
        unint64_t v26 = *(void (**)(char *, uint64_t))(v25 + 8);
        v26(v6, v3);
        v26(v8, v3);
        return v17 & 1;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56))(v2, 1, 1, v3);
    }
    BOOL v19 = &qword_26B22AAB0;
    uint64_t v20 = v2;
    goto LABEL_34;
  }
LABEL_17:
  LOBYTE(v17) = 0;
  return v17 & 1;
}

uint64_t sub_252657DB0()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v0 = self;
  uint64_t v1 = (void *)sub_2526754D0();
  *(void *)&long long v16 = 0;
  id v2 = objc_msgSend(v0, sel_JSONObjectWithData_options_error_, v1, 0, &v16);

  if (!v2)
  {
    id v7 = (id)v16;
    unint64_t v8 = (void *)sub_2526753E0();

    swift_willThrow();
    return 0;
  }
  id v3 = (id)v16;
  sub_252675F10();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B22AA70);
  if (swift_dynamicCast())
  {
    uint64_t v4 = v14;
    if (*(void *)(v14 + 16) && (uint64_t v5 = sub_25264C464(0x6553796772656E65, 0xEE00736563697672), (v6 & 1) != 0))
    {
      sub_252638088(*(void *)(v14 + 56) + 32 * v5, (uint64_t)&v14);
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
    }
    sub_252655D5C(0x5255726576726573, 0xE90000000000004CLL, &v16);
    sub_252634810((uint64_t)&v14, qword_26B22AA80);
    if (v17)
    {
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        if (*(void *)(v4 + 16) && (uint64_t v9 = sub_25264C464(0x6553796772656E65, 0xEE00736563697672), (v10 & 1) != 0))
        {
          sub_252638088(*(void *)(v4 + 56) + 32 * v9, (uint64_t)&v14);
        }
        else
        {
          long long v14 = 0u;
          long long v15 = 0u;
        }
        swift_bridgeObjectRelease();
        sub_252655D5C(0x68746150697061, 0xE700000000000000, &v16);
        sub_252634810((uint64_t)&v14, qword_26B22AA80);
        if (v17)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AA08);
          if (swift_dynamicCast())
          {
            uint64_t v12 = *(void *)(v13 + 16);
            swift_bridgeObjectRelease();
            if (v12) {
              return 1;
            }
          }
        }
        else
        {
          sub_252634810((uint64_t)&v16, qword_26B22AA80);
        }
        return 0;
      }
    }
    else
    {
      sub_252634810((uint64_t)&v16, qword_26B22AA80);
    }
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_252658094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v53[4] = *MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  MEMORY[0x270FA5388](v4 - 8);
  char v6 = (char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = (void *)sub_252675620();
  uint64_t v8 = *(v7 - 1);
  MEMORY[0x270FA5388](v7);
  char v10 = (char *)v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_252657DB0() & 1) == 0)
  {
    if (qword_26B22AAC8 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_2526759F0();
    __swift_project_value_buffer(v16, (uint64_t)qword_26B22B740);
    uint64_t v17 = sub_2526759D0();
    os_log_type_t v18 = sub_252675E00();
    if (os_log_type_enabled(v17, v18))
    {
      BOOL v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v19 = 0;
      _os_log_impl(&dword_25262F000, v17, v18, "Corrupt Config received from Server.", v19, 2u);
      MEMORY[0x2533B8110](v19, -1, -1);
    }

    uint64_t v20 = sub_2526759D0();
    os_log_type_t v21 = sub_252675E00();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_25262F000, v20, v21, "Unable to save config from server.", v22, 2u);
      MEMORY[0x2533B8110](v22, -1, -1);
    }

    CFPropertyListRef v23 = sub_2526759D0();
    os_log_type_t v24 = sub_252675E00();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_25262F000, v23, v24, "This will result in using old values fetched from server.", v25, 2u);
      MEMORY[0x2533B8110](v25, -1, -1);
    }

    return 0;
  }
  CFPropertyListRef v11 = self;
  uint64_t v12 = (void *)sub_2526754D0();
  v52[0] = 0;
  id v13 = objc_msgSend(v11, sel_JSONObjectWithData_options_error_, v12, 0, v52);

  id v14 = v52[0];
  if (!v13)
  {
    uint64_t v27 = v14;
    uint64_t v28 = (void *)sub_2526753E0();

    swift_willThrow();
    if (qword_26B22A6C0 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_2526759F0();
    __swift_project_value_buffer(v29, (uint64_t)qword_26B22B718);
    id v30 = v28;
    id v31 = v28;
    long long v32 = sub_2526759D0();
    os_log_type_t v33 = sub_252675E00();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      unsigned int v35 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 138412290;
      id v36 = v28;
      uint64_t v37 = _swift_stdlib_bridgeErrorToNSError();
      v53[0] = v37;
      sub_252675EA0();
      *unsigned int v35 = v37;

      _os_log_impl(&dword_25262F000, v32, v33, "Error while trying to save Config to file %@", v34, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C12820);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v35, -1, -1);
      MEMORY[0x2533B8110](v34, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  sub_252675F10();
  swift_unknownObjectRelease();
  BOOL v15 = sub_25263CB4C();
  uint64_t v51 = v8;
  if (v15) {
    sub_252676130();
  }
  swift_bridgeObjectRelease();
  sub_252638088((uint64_t)v53, (uint64_t)v52);
  unint64_t v38 = (__CFString *)sub_252675B90();
  v50[2] = __swift_instantiateConcreteTypeFromMangledName(qword_26B22AA80);
  uint64_t v39 = (const void *)sub_252675E80();
  v50[1] = "application/json";
  unint64_t v40 = (__CFString *)sub_252675B90();
  CFPreferencesSetAppValue(v38, v39, v40);

  swift_unknownObjectRelease();
  uint64_t v41 = (__CFString *)sub_252675B90();
  CFPreferencesAppSynchronize(v41);

  sub_252634810((uint64_t)v52, qword_26B22AA80);
  swift_bridgeObjectRelease();
  sub_252659804(a3, (uint64_t)v6, &qword_26B22AAB0);
  uint64_t v42 = v51;
  if ((*(unsigned int (**)(char *, uint64_t, void *))(v51 + 48))(v6, 1, v7) == 1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
    os_log_type_t v43 = &qword_26B22AAB0;
    uint64_t v44 = (id *)v6;
  }
  else
  {
    (*(void (**)(char *, char *, void *))(v42 + 32))(v10, v6, v7);
    if (sub_25263CB4C()) {
      sub_252676130();
    }
    swift_bridgeObjectRelease();
    v52[3] = v7;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)v52);
    (*(void (**)(uint64_t *, char *, void *))(v42 + 16))(boxed_opaque_existential_1, v10, v7);
    uint64_t v46 = (__CFString *)sub_252675B90();
    uint64_t v47 = (const void *)sub_252675E80();
    unint64_t v48 = (__CFString *)sub_252675B90();
    CFPreferencesSetAppValue(v46, v47, v48);

    swift_unknownObjectRelease();
    uint64_t v49 = (__CFString *)sub_252675B90();
    CFPreferencesAppSynchronize(v49);
    swift_bridgeObjectRelease();

    (*(void (**)(char *, void *))(v42 + 8))(v10, v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
    os_log_type_t v43 = qword_26B22AA80;
    uint64_t v44 = v52;
  }
  sub_252634810((uint64_t)v44, v43);
  return 1;
}

uint64_t sub_2526588B4(uint64_t a1)
{
  v1[5] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  v1[6] = swift_task_alloc();
  uint64_t v2 = sub_2526750B0();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAD0);
  v1[10] = swift_task_alloc();
  uint64_t v3 = sub_252675470();
  v1[11] = v3;
  v1[12] = *(void *)(v3 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_252658A40, 0, 0);
}

uint64_t sub_252658A40()
{
  sub_25263D0B8();
  char v1 = sub_25265777C();
  if (v1)
  {
    if (qword_26B22AAC8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_2526759F0();
    __swift_project_value_buffer(v2, (uint64_t)qword_26B22B740);
    uint64_t v3 = sub_2526759D0();
    os_log_type_t v4 = sub_252675E20();
    if (!os_log_type_enabled(v3, v4)) {
      goto LABEL_12;
    }
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    char v6 = "Config saved on disk is valid. Skipping reloading";
LABEL_11:
    _os_log_impl(&dword_25262F000, v3, v4, v6, v5, 2u);
    MEMORY[0x2533B8110](v5, -1, -1);
LABEL_12:

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    CFPropertyListRef v11 = (uint64_t (*)(void))v0[1];
    return v11(v1 & 1);
  }
  sub_25263CB4C();
  sub_252675450();
  uint64_t v7 = v0[11];
  uint64_t v8 = v0[12];
  uint64_t v9 = v0[10];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v9, 1, v7) == 1)
  {
    sub_252634810(v9, &qword_26B22AAD0);
    if (qword_26B22AAC8 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_2526759F0();
    __swift_project_value_buffer(v10, (uint64_t)qword_26B22B740);
    uint64_t v3 = sub_2526759D0();
    os_log_type_t v4 = sub_252675E00();
    if (!os_log_type_enabled(v3, v4)) {
      goto LABEL_12;
    }
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    char v6 = "Unable to generate request URL for fetching config";
    goto LABEL_11;
  }
  uint64_t v14 = v0[13];
  uint64_t v13 = v0[14];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v13, v9, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v14, v13, v7);
  sub_252675060();
  BOOL v15 = (void *)swift_task_alloc();
  v0[15] = v15;
  *BOOL v15 = v0;
  v15[1] = sub_252658D94;
  uint64_t v16 = v0[9];
  return MEMORY[0x270EF1EB0](v16, 0);
}

uint64_t sub_252658D94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  v5[16] = a1;
  v5[17] = a2;
  v5[18] = a3;
  v5[19] = v3;
  swift_task_dealloc();
  if (v3) {
    char v6 = sub_252659398;
  }
  else {
    char v6 = sub_252658EAC;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_252658EAC()
{
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  if (!v1)
  {
    if (qword_26B22AAC8 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_2526759F0();
    __swift_project_value_buffer(v16, (uint64_t)qword_26B22B740);
    uint64_t v17 = sub_2526759D0();
    os_log_type_t v18 = sub_252675E00();
    if (os_log_type_enabled(v17, v18))
    {
      BOOL v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v19 = 0;
      _os_log_impl(&dword_25262F000, v17, v18, "Unable to process Config Response.", v19, 2u);
      MEMORY[0x2533B8110](v19, -1, -1);
    }
    uint64_t v20 = *(void **)(v0 + 144);
    uint64_t v21 = *(void *)(v0 + 112);
    uint64_t v22 = *(void *)(v0 + 88);
    uint64_t v23 = *(void *)(v0 + 96);
    uint64_t v25 = *(void *)(v0 + 64);
    uint64_t v24 = *(void *)(v0 + 72);
    uint64_t v26 = *(void *)(v0 + 56);
    sub_252636330(*(void *)(v0 + 128), *(void *)(v0 + 136));

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v22);
    goto LABEL_18;
  }
  uint64_t v2 = (void *)v1;
  id v3 = *(id *)(v0 + 144);
  if (objc_msgSend(v2, sel_statusCode) != (id)200)
  {
    if (qword_26B22AAC8 != -1) {
      swift_once();
    }
    uint64_t v27 = *(void **)(v0 + 144);
    uint64_t v28 = sub_2526759F0();
    __swift_project_value_buffer(v28, (uint64_t)qword_26B22B740);
    id v29 = v27;
    id v30 = sub_2526759D0();
    os_log_type_t v31 = sub_252675E00();
    BOOL v32 = os_log_type_enabled(v30, v31);
    os_log_type_t v33 = *(void **)(v0 + 144);
    uint64_t v34 = *(void *)(v0 + 112);
    uint64_t v36 = *(void *)(v0 + 88);
    uint64_t v35 = *(void *)(v0 + 96);
    uint64_t v38 = *(void *)(v0 + 64);
    uint64_t v37 = *(void *)(v0 + 72);
    uint64_t v48 = *(void *)(v0 + 56);
    if (v32)
    {
      uint64_t v42 = *(void *)(v0 + 128);
      unint64_t v43 = *(void *)(v0 + 136);
      uint64_t v46 = *(void *)(v0 + 88);
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 134217984;
      *(void *)(v0 + 32) = objc_msgSend(v2, sel_statusCode);
      sub_252675EA0();

      _os_log_impl(&dword_25262F000, v30, v31, "Unhandled http response code %ld", v39, 0xCu);
      MEMORY[0x2533B8110](v39, -1, -1);
      sub_252636330(v42, v43);

      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v48);
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v46);
    }
    else
    {
      sub_252636330(*(void *)(v0 + 128), *(void *)(v0 + 136));

      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v48);
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
    }
LABEL_18:
    char v15 = 0;
    goto LABEL_19;
  }
  if (qword_26B22AAC8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2526759F0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B22B740);
  uint64_t v5 = sub_2526759D0();
  os_log_type_t v6 = sub_252675E20();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25262F000, v5, v6, "Saving fetched config to disk", v7, 2u);
    MEMORY[0x2533B8110](v7, -1, -1);
  }
  unint64_t v8 = *(void *)(v0 + 136);
  uint64_t v9 = *(void **)(v0 + 144);
  uint64_t v10 = *(void *)(v0 + 128);
  uint64_t v11 = *(void *)(v0 + 96);
  uint64_t v45 = *(void *)(v0 + 88);
  uint64_t v47 = *(void *)(v0 + 112);
  uint64_t v12 = *(void *)(v0 + 64);
  uint64_t v44 = *(void *)(v0 + 72);
  uint64_t v14 = *(void *)(v0 + 48);
  uint64_t v13 = *(void *)(v0 + 56);

  sub_252636F90(v14);
  char v15 = sub_252658094(v10, v8, v14);
  sub_252636330(v10, v8);

  sub_252634810(v14, &qword_26B22AAB0);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v44, v13);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v47, v45);
LABEL_19:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v40 = *(uint64_t (**)(void))(v0 + 8);
  return v40(v15 & 1);
}

uint64_t sub_252659398()
{
  uint64_t v35 = v0;
  if (qword_26B22AAC8 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = sub_2526759F0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B22B740);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2526759D0();
  os_log_type_t v6 = sub_252675E00();
  BOOL v7 = os_log_type_enabled(v5, v6);
  unint64_t v8 = (void *)v0[19];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v12;
    sub_252675EA0();
    void *v10 = v12;

    _os_log_impl(&dword_25262F000, v5, v6, "Error while trying to fetch Config from Server %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C12820);
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v10, -1, -1);
    MEMORY[0x2533B8110](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = sub_2526759D0();
  os_log_type_t v14 = sub_252675E00();
  BOOL v15 = os_log_type_enabled(v13, v14);
  uint64_t v16 = (void *)v0[19];
  uint64_t v17 = v0[14];
  uint64_t v18 = v0[11];
  uint64_t v19 = v0[12];
  uint64_t v20 = v0[8];
  uint64_t v21 = v0[9];
  uint64_t v22 = v0[7];
  if (v15)
  {
    uint64_t v32 = v0[9];
    uint64_t v33 = v0[11];
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = v17;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v34 = v24;
    *(_DWORD *)uint64_t v23 = 136315138;
    BOOL v25 = sub_25263CB4C();
    BOOL v26 = !v25;
    if (v25) {
      uint64_t v27 = 1685025392;
    }
    else {
      uint64_t v27 = 7759204;
    }
    if (v26) {
      unint64_t v28 = 0xE300000000000000;
    }
    else {
      unint64_t v28 = 0xE400000000000000;
    }
    v0[2] = sub_2526669DC(v27, v28, &v34);
    sub_252675EA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25262F000, v13, v14, "Current Environment %s", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v24, -1, -1);
    MEMORY[0x2533B8110](v23, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v32, v22);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v31, v33);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v29 = (uint64_t (*)(void))v0[1];
  return v29(0);
}

uint64_t sub_25265976C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_252675DB0();
  uint64_t v8 = result;
  if (v2)
  {
    id v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_252656C5C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_252659804(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for APIPathModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for APIPathModel()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for APIPathModel(void *a1, void *a2)
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

void *assignWithCopy for APIPathModel(void *a1, void *a2)
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

void *assignWithTake for APIPathModel(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for APIPathModel(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for APIPathModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for APIPathModel()
{
  return &type metadata for APIPathModel;
}

uint64_t sub_252659A9C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656C695464697267 && a2 == 0xEE0070756B6F6F4CLL;
  if (v2 || (sub_252676130() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E49796772656E65 && a2 == 0xEF736C6176726574)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_252676130();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_252659BD8(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AA30);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_252659DE0();
  sub_2526761E0();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    char v11 = 0;
    uint64_t v7 = sub_2526760B0();
    char v10 = 1;
    swift_bridgeObjectRetain();
    sub_2526760B0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_252659DE0()
{
  unint64_t result = qword_26B22A970;
  if (!qword_26B22A970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22A970);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for APIPathModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252659F00);
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

ValueMetadata *type metadata accessor for APIPathModel.CodingKeys()
{
  return &type metadata for APIPathModel.CodingKeys;
}

unint64_t sub_252659F3C()
{
  unint64_t result = qword_269C12858;
  if (!qword_269C12858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12858);
  }
  return result;
}

unint64_t sub_252659F94()
{
  unint64_t result = qword_26B22A980;
  if (!qword_26B22A980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22A980);
  }
  return result;
}

unint64_t sub_252659FEC()
{
  unint64_t result = qword_26B22A978;
  if (!qword_26B22A978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22A978);
  }
  return result;
}

uint64_t sub_25265A040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  v19[0] = a1;
  v19[1] = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A940);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v10 = *(void *)(a3 + 16);
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (v10)
  {
    uint64_t v21 = MEMORY[0x263F8EE78];
    sub_25265BAB0(0, v10, 0);
    uint64_t v11 = v21;
    uint64_t v12 = (uint64_t *)(a3 + 56);
    while (1)
    {
      uint64_t v13 = *(v12 - 2);
      uint64_t v14 = *(v12 - 1);
      uint64_t v15 = *v12;
      v20[0] = *(v12 - 3);
      v20[1] = v13;
      v20[2] = v14;
      v20[3] = v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      ((void (*)(void *))v19[0])(v20);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v21 = v11;
      unint64_t v17 = *(void *)(v11 + 16);
      unint64_t v16 = *(void *)(v11 + 24);
      if (v17 >= v16 >> 1)
      {
        sub_25265BAB0(v16 > 1, v17 + 1, 1);
        uint64_t v11 = v21;
      }
      v12 += 4;
      *(void *)(v11 + 16) = v17 + 1;
      sub_25265B9FC((uint64_t)v9, v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v17, &qword_26B22A940);
      if (!--v10) {
        return v11;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v11;
}

uint64_t sub_25265A218@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAD0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v18 - v6;
  if (sub_252675CF0())
  {
    sub_252675450();
    uint64_t v8 = sub_252675470();
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a1, v7, v8);
    }
    uint64_t v13 = (uint64_t)v7;
LABEL_8:
    sub_252634810(v13, &qword_26B22AAD0);
    if (qword_26B22A9E0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_2526759F0();
    __swift_project_value_buffer(v14, (uint64_t)qword_26B22B6D8);
    uint64_t v15 = sub_2526759D0();
    os_log_type_t v16 = sub_252675E10();
    if (os_log_type_enabled(v15, v16))
    {
      unint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v17 = 0;
      _os_log_impl(&dword_25262F000, v15, v16, "Unable to create valid URL", v17, 2u);
      MEMORY[0x2533B8110](v17, -1, -1);
    }

    abort();
  }
  v18[0] = 0x2F2F3A7370747468;
  v18[1] = 0xE800000000000000;
  sub_252675C70();
  sub_252675450();
  uint64_t v11 = sub_252675470();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v5, 1, v11) == 1)
  {
    uint64_t v13 = (uint64_t)v5;
    goto LABEL_8;
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(a1, v5, v11);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25265A510@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  LODWORD(v55) = a3;
  LODWORD(v56) = a2;
  uint64_t v57 = a1;
  uint64_t v50 = a4;
  uint64_t v6 = sub_2526751E0();
  uint64_t v54 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v45 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A940);
  uint64_t v49 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  unint64_t v17 = (char *)v45 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A948);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_252675280();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)v45 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252675240();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
  {
    sub_252634810((uint64_t)v20, &qword_26B22A948);
    uint64_t v25 = sub_252675470();
    uint64_t v26 = *(void *)(v25 - 8);
    uint64_t v27 = v50;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v50, v5, v25);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56))(v27, 0, 1, v25);
  }
  else
  {
    uint64_t v51 = v17;
    uint64_t v52 = v11;
    uint64_t v53 = v9;
    uint64_t v48 = v22;
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v24, v20, v21);
    uint64_t v47 = v24;
    unint64_t v29 = sub_252675230();
    if (v29)
    {
      unint64_t v30 = sub_25265AC58(v29, v57, v56 & 1, v55 & 1);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v46 = v21;
      MEMORY[0x270FA5388](0);
      LOBYTE(v45[-2]) = v56 & 1;
      v45[-1] = v5;
      uint64_t v31 = sub_25265A040((uint64_t)sub_25265B814, (uint64_t)&v45[-4], v57);
      uint64_t v32 = *(void *)(v31 + 16);
      if (v32)
      {
        unint64_t v33 = (*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
        v45[1] = v31;
        uint64_t v34 = v31 + v33;
        uint64_t v35 = *(void *)(v49 + 72);
        uint64_t v56 = v6;
        uint64_t v57 = v35;
        uint64_t v36 = v53;
        unint64_t v55 = (unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48);
        uint64_t v37 = (void (**)(char *, char *, uint64_t))(v54 + 32);
        unint64_t v30 = MEMORY[0x263F8EE78];
        uint64_t v38 = (uint64_t)v51;
        uint64_t v39 = v52;
        do
        {
          sub_25265B838(v34, v38);
          sub_25265B9FC(v38, (uint64_t)v15, &qword_26B22A940);
          if ((*v55)(v15, 1, v6) == 1)
          {
            sub_252634810((uint64_t)v15, &qword_26B22A940);
          }
          else
          {
            unint64_t v40 = *v37;
            (*v37)(v39, v15, v6);
            v40(v36, v39, v6);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              unint64_t v30 = sub_25264BF7C(0, *(void *)(v30 + 16) + 1, 1, v30);
            }
            unint64_t v42 = *(void *)(v30 + 16);
            unint64_t v41 = *(void *)(v30 + 24);
            if (v42 >= v41 >> 1) {
              unint64_t v30 = sub_25264BF7C(v41 > 1, v42 + 1, 1, v30);
            }
            *(void *)(v30 + 16) = v42 + 1;
            uint64_t v36 = v53;
            v40((char *)(v30+ ((*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80))+ *(void *)(v54 + 72) * v42), v53, v6);
            uint64_t v38 = (uint64_t)v51;
            uint64_t v39 = v52;
          }
          v34 += v57;
          --v32;
        }
        while (v32);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        unint64_t v30 = MEMORY[0x263F8EE78];
      }
      uint64_t v21 = v46;
    }
    unint64_t v43 = v47;
    if (!*(void *)(v30 + 16)) {
      swift_bridgeObjectRelease();
    }
    sub_252675200();
    sub_252675260();
    if (v44) {
      sub_252675220();
    }
    sub_252675250();
    return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v43, v21);
  }
}

void sub_25265AAD4()
{
  uint64_t v0 = sub_252675150();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_26B22B6C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B22B6C0);
  sub_252675120();
  uint64_t v5 = sub_252675130();
  unint64_t v7 = v6;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  uint64_t v8 = (void *)sub_2526754D0();
  id v9 = objc_msgSend(self, sel_characterSetWithBitmapRepresentation_, v8);
  sub_252636330(v5, v7);

  uint64_t v10 = (void *)sub_252675B90();
  objc_msgSend(v9, sel_removeCharactersInString_, v10);

  sub_252675140();
}

uint64_t sub_25265AC58(unint64_t a1, uint64_t a2, int a3, int a4)
{
  int v87 = a4;
  int v90 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12860);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v86 = (char *)v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12868);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v93 = (char *)v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12870);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v103 = (void *)((char *)v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (void *)((char *)v82 - v14);
  uint64_t v104 = sub_2526751E0();
  uint64_t v16 = *(void *)(v104 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v104);
  uint64_t v84 = (char *)v82 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v83 = (char *)v82 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v85 = (uint64_t)v82 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)v82 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)v82 - v26;
  unint64_t v107 = a1;
  uint64_t v89 = *(void *)(a2 + 16);
  if (!v89)
  {
    swift_bridgeObjectRetain();
    return a1;
  }
  uint64_t v88 = a2 + 32;
  uint64_t v95 = (void (**)(char *, char *, uint64_t))(v16 + 16);
  uint64_t v96 = (void (**)(char *, char *, uint64_t))(v16 + 32);
  uint64_t v99 = (unsigned int (**)(int64_t *, uint64_t, uint64_t))(v9 + 48);
  uint64_t v100 = (void (**)(unint64_t *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  uint64_t v101 = (uint64_t (**)(char *, uint64_t))(v16 + 8);
  swift_bridgeObjectRetain();
  v82[1] = a2;
  swift_bridgeObjectRetain();
  uint64_t v28 = 0;
  uint64_t v98 = v15;
  uint64_t v94 = v16;
  id v91 = v27;
  while (2)
  {
    unint64_t v29 = (uint64_t *)(v88 + 32 * v28);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = v29[3];
    if (v90)
    {
      uint64_t v102 = v29[2];
      uint64_t v105 = v31;
      uint64_t v106 = v30;
      uint64_t v33 = qword_26B22A5A0;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v33 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_252675150();
      uint64_t v35 = __swift_project_value_buffer(v34, (uint64_t)qword_26B22B6C0);
      sub_25263647C();
      uint64_t v97 = v35;
      uint64_t v31 = sub_252675ED0();
      uint64_t v37 = v36;
      swift_bridgeObjectRelease();
      if (!v37)
      {
        swift_bridgeObjectRelease();
        goto LABEL_4;
      }
      uint64_t v92 = v28;
      uint64_t v105 = v102;
      uint64_t v106 = v32;
      sub_252675ED0();
      swift_bridgeObjectRelease();
      uint64_t v38 = v37;
    }
    else
    {
      uint64_t v92 = v28;
      uint64_t v39 = v30;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v38 = v39;
    }
    uint64_t v102 = v38;
    sub_2526751B0();
    swift_bridgeObjectRelease();
    unint64_t v40 = *(void *)(v107 + 16);
    uint64_t v97 = v107;
    uint64_t result = swift_bridgeObjectRetain();
    unint64_t v42 = 0;
    unint64_t v43 = v96;
    if (!v40)
    {
LABEL_12:
      uint64_t v44 = 1;
      unint64_t v42 = v40;
      goto LABEL_15;
    }
    while (1)
    {
      if (v42 >= *(void *)(v97 + 16))
      {
        __break(1u);
        goto LABEL_44;
      }
      uint64_t v45 = v25;
      uint64_t v46 = v94;
      uint64_t v47 = &v93[*(int *)(v8 + 48)];
      uint64_t v48 = v104;
      (*(void (**)(char *, unint64_t, uint64_t))(v94 + 16))(v47, v97+ ((*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80))+ *(void *)(v46 + 72) * v42, v104);
      uint64_t v49 = (char *)v103 + *(int *)(v8 + 48);
      unint64_t *v103 = v42;
      uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v46 + 32);
      uint64_t v25 = v45;
      unint64_t v43 = v96;
      v50(v49, v47, v48);
      uint64_t v44 = 0;
      ++v42;
LABEL_15:
      uint64_t v51 = (uint64_t)v103;
      (*v100)(v103, v44, 1, v8);
      sub_25265B9FC(v51, (uint64_t)v15, &qword_269C12870);
      if ((*v99)(v15, 1, v8) == 1) {
        break;
      }
      int64_t v52 = *v15;
      uint64_t v53 = *v43;
      (*v43)(v25, (char *)v15 + *(int *)(v8 + 48), v104);
      if (sub_2526751C0() == v31 && v54 == v102)
      {
        swift_bridgeObjectRelease();
        uint64_t v60 = v94;
        uint64_t v61 = v91;
LABEL_25:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v62 = v85;
        sub_25265B8A0(v52, v85);
        long long v63 = *v101;
        uint64_t v64 = v62;
        uint64_t v65 = v104;
        (*v101)((char *)v64, v104);
        uint64_t result = v63(v25, v65);
        unint64_t v66 = v107;
        int64_t v67 = *(void *)(v107 + 16);
        if (v52 >= v67)
        {
          id v70 = *v95;
          if (v87)
          {
            uint64_t v71 = (uint64_t)v86;
            uint64_t v72 = v104;
            v70(v86, v61, v104);
            sub_25265BFF0(0, 0, v71);
            v63(v61, v72);
            uint64_t v28 = v92;
          }
          else
          {
            v70(v83, v61, v104);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              unint64_t v66 = sub_25264BF7C(0, v67 + 1, 1, v66);
            }
            unint64_t v80 = *(void *)(v66 + 16);
            unint64_t v79 = *(void *)(v66 + 24);
            if (v80 >= v79 >> 1) {
              unint64_t v66 = sub_25264BF7C(v79 > 1, v80 + 1, 1, v66);
            }
            *(void *)(v66 + 16) = v80 + 1;
            uint64_t v81 = v104;
            v53((char *)(v66+ ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80))+ *(void *)(v60 + 72) * v80), v83, v104);
            unint64_t v107 = v66;
            v63(v61, v81);
            uint64_t v15 = v98;
            uint64_t v28 = v92;
          }
          goto LABEL_4;
        }
        uint64_t v28 = v92;
        if ((v52 & 0x8000000000000000) == 0)
        {
          uint64_t v68 = (uint64_t)v86;
          uint64_t v69 = v104;
          (*v95)(v86, v61, v104);
          sub_25265BFF0(v52, v52, v68);
          v63(v61, v69);
          goto LABEL_4;
        }
LABEL_44:
        __break(1u);
        return result;
      }
      char v55 = sub_252676130();
      swift_bridgeObjectRelease();
      if (v55)
      {
        uint64_t v15 = v98;
        uint64_t v60 = v94;
        uint64_t v61 = v91;
        goto LABEL_25;
      }
      uint64_t result = (*v101)(v25, v104);
      uint64_t v15 = v98;
      if (v42 == v40) {
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v56 = *v95;
    if (v87)
    {
      uint64_t v57 = (uint64_t)v86;
      uint64_t v58 = v91;
      uint64_t v59 = v104;
      v56(v86, v91, v104);
      sub_25265BFF0(0, 0, v57);
      (*v101)(v58, v59);
      uint64_t v28 = v92;
    }
    else
    {
      os_log_type_t v73 = v91;
      v56(v84, v91, v104);
      unint64_t v74 = v107;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v74 = sub_25264BF7C(0, *(void *)(v74 + 16) + 1, 1, v74);
      }
      uint64_t v75 = v94;
      uint64_t v28 = v92;
      unint64_t v77 = *(void *)(v74 + 16);
      unint64_t v76 = *(void *)(v74 + 24);
      if (v77 >= v76 >> 1) {
        unint64_t v74 = sub_25264BF7C(v76 > 1, v77 + 1, 1, v74);
      }
      *(void *)(v74 + 16) = v77 + 1;
      uint64_t v78 = v104;
      (*(void (**)(unint64_t, char *, uint64_t))(v75 + 32))(v74+ ((*(unsigned __int8 *)(v75 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80))+ *(void *)(v75 + 72) * v77, v84, v104);
      unint64_t v107 = v74;
      (*(void (**)(char *, uint64_t))(v75 + 8))(v73, v78);
    }
LABEL_4:
    if (++v28 != v89) {
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
  return v107;
}

uint64_t sub_25265B620@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  if ((a1 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_7;
  }
  uint64_t v3 = qword_26B22A5A0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_252675150();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B22B6C0);
  sub_25263647C();
  sub_252675ED0();
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    sub_252675ED0();
    swift_bridgeObjectRelease();
LABEL_7:
    sub_2526751B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_2526751E0();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a2, 0, 1, v7);
  }
  uint64_t v9 = sub_2526751E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a2, 1, 1, v9);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25265B814@<X0>(uint64_t a1@<X8>)
{
  return sub_25265B620(*(unsigned char *)(v1 + 16), a1);
}

uint64_t sub_25265B838(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A940);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25265B8A0@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v5 = sub_25264C714(v5);
  }
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v7 = v6 - 1;
  uint64_t v8 = sub_2526751E0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 72);
  unint64_t v11 = v5 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)) + v10 * a1;
  uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v9 + 32))(a2, v11, v8);
  if ((uint64_t)(v7 - a1) < 0)
  {
LABEL_15:
    uint64_t result = sub_252676090();
    __break(1u);
    return result;
  }
  if (v10 > 0 || v11 >= v11 + v10 + v10 * (v7 - a1))
  {
    uint64_t result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (v10)
  {
    uint64_t result = swift_arrayInitWithTakeBackToFront();
  }
  *(void *)(v5 + 16) = v7;
  unint64_t *v2 = v5;
  return result;
}

uint64_t sub_25265B9FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25265BA60(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25265BAF0(a1, a2, a3, *v3, &qword_269C12878);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25265BA88(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25265BAF0(a1, a2, a3, *v3, &qword_26B22AB80);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25265BAB0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25265BC3C(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_25265BAD0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25265BE84(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25265BAF0(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  int64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    int64_t v10 = *((void *)a4 + 2);
  }
  else {
    int64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    unint64_t v11 = (char *)swift_allocObject();
    size_t v12 = _swift_stdlib_malloc_size(v11);
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    unint64_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v11 != a4 || v13 >= &v14[v9]) {
      memmove(v13, v14, v9);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v9] || v13 >= &v14[v9])
  {
    memcpy(v13, v14, v9);
LABEL_28:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_30:
  uint64_t result = sub_252676090();
  __break(1u);
  return result;
}

uint64_t sub_25265BC3C(char a1, int64_t a2, char a3, void *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AA50);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B22A940) - 8);
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
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26B22A940) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
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
  uint64_t result = sub_252676090();
  __break(1u);
  return result;
}

uint64_t sub_25265BE84(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB78);
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
  uint64_t result = sub_252676090();
  __break(1u);
  return result;
}

uint64_t sub_25265BFF0(uint64_t a1, int64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  unint64_t v5 = *v3;
  int64_t v6 = *(void *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  int64_t v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v3 = v5;
  if (!isUniquelyReferenced_nonNull_native || v10 > *(void *)(v5 + 24) >> 1)
  {
    if (v6 <= v10) {
      int64_t v13 = v6 + v9;
    }
    else {
      int64_t v13 = v6;
    }
    unint64_t v5 = sub_25264BF7C(isUniquelyReferenced_nonNull_native, v13, 1, v5);
    *uint64_t v3 = v5;
  }
  uint64_t v14 = sub_2526751E0();
  uint64_t v15 = *(void *)(v14 - 8);
  unint64_t v16 = v5 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  uint64_t v17 = *(void *)(v15 + 72);
  unint64_t v18 = v16 + v17 * a1;
  swift_arrayDestroy();
  if (!v9) {
    goto LABEL_25;
  }
  uint64_t v19 = *(void *)(v5 + 16);
  uint64_t v20 = v19 - a2;
  if (__OFSUB__(v19, a2)) {
    goto LABEL_33;
  }
  if (v20 < 0)
  {
LABEL_35:
    uint64_t result = sub_252676090();
    __break(1u);
    return result;
  }
  unint64_t v21 = v18 + v17;
  unint64_t v22 = v16 + v17 * a2;
  if (v18 + v17 < v22 || v21 >= v22 + v20 * v17)
  {
    swift_arrayInitWithTakeFrontToBack();
  }
  else if (v21 != v22)
  {
    swift_arrayInitWithTakeBackToFront();
  }
  uint64_t v24 = *(void *)(v5 + 16);
  BOOL v25 = __OFADD__(v24, v9);
  uint64_t v26 = v24 + v9;
  if (v25)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  *(void *)(v5 + 16) = v26;
LABEL_25:
  if (v17 >= 1) {
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v15 + 16))(v18, a3, v14);
  }
  return sub_252634810(a3, &qword_269C12860);
}

uint64_t sub_25265C20C(void *a1)
{
  uint64_t v2 = sub_2526757D0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  int64_t v6 = (char *)v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v64 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12880);
  MEMORY[0x270FA5388](v9 - 8);
  int64_t v11 = (char *)v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2526757F0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)v64 - v17;
  uint64_t v74 = (uint64_t)a1;
  id v19 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12690);
  int v20 = swift_dynamicCast();
  unint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  if (v20)
  {
    uint64_t v69 = v16;
    v21(v11, 0, 1, v12);
    uint64_t v72 = v13;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v11, v12);
    unint64_t v22 = v8;
    uint64_t v71 = sub_25265CC20(&qword_269C12590, MEMORY[0x263F07A20]);
    sub_2526753B0();
    sub_2526757A0();
    sub_25265CC20(&qword_269C12888, MEMORY[0x263F07A00]);
    sub_252675D40();
    sub_252675D40();
    uint64_t v23 = v18;
    BOOL v25 = v73;
    uint64_t v24 = (void *)v74;
    uint64_t v26 = *(void (**)(char *, uint64_t))(v3 + 8);
    v26(v6, v2);
    v26(v22, v2);
    if (v24 == v25)
    {
      if (qword_269C123F8 != -1) {
        swift_once();
      }
      uint64_t v27 = sub_2526759F0();
      __swift_project_value_buffer(v27, (uint64_t)qword_269C12BC8);
      uint64_t v28 = sub_2526759D0();
      os_log_type_t v29 = sub_252675E00();
      uint64_t v30 = v23;
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v31 = 0;
        _os_log_impl(&dword_25262F000, v28, v29, "No Internet connection detected. Check your network connection.", v31, 2u);
        MEMORY[0x2533B8110](v31, -1, -1);
      }

      type metadata accessor for NetworkError(0);
      sub_25265CC20((unint64_t *)&qword_269C12678, (void (*)(uint64_t))type metadata accessor for NetworkError);
      uint64_t v32 = swift_allocError();
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, uint64_t))(v72 + 8))(v30, v12);
    }
    else
    {
      uint64_t v70 = v12;
      sub_2526753B0();
      sub_252675780();
      sub_252675D40();
      sub_252675D40();
      uint64_t v38 = v73;
      uint64_t v37 = (void *)v74;
      v26(v6, v2);
      uint64_t v68 = v2;
      v26(v22, v2);
      BOOL v39 = v37 == v38;
      unint64_t v40 = v23;
      if (v39)
      {
        uint64_t v41 = v72;
        if (qword_269C123F8 != -1) {
          swift_once();
        }
        uint64_t v42 = sub_2526759F0();
        __swift_project_value_buffer(v42, (uint64_t)qword_269C12BC8);
        unint64_t v43 = sub_2526759D0();
        os_log_type_t v44 = sub_252675E00();
        BOOL v45 = os_log_type_enabled(v43, v44);
        uint64_t v46 = v70;
        if (v45)
        {
          uint64_t v47 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v47 = 0;
          _os_log_impl(&dword_25262F000, v43, v44, "Unable to find Host. if this DEV env, please check your VPN connection!", v47, 2u);
          MEMORY[0x2533B8110](v47, -1, -1);
        }

        type metadata accessor for NetworkError(0);
        sub_25265CC20((unint64_t *)&qword_269C12678, (void (*)(uint64_t))type metadata accessor for NetworkError);
        uint64_t v32 = swift_allocError();
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, uint64_t))(v41 + 8))(v40, v46);
      }
      else
      {
        uint64_t v48 = v22;
        uint64_t v49 = v72;
        if (qword_269C123F8 != -1) {
          swift_once();
        }
        uint64_t v50 = sub_2526759F0();
        __swift_project_value_buffer(v50, (uint64_t)qword_269C12BC8);
        uint64_t v51 = v69;
        uint64_t v52 = v70;
        (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v69, v40, v70);
        uint64_t v53 = sub_2526759D0();
        os_log_type_t v54 = sub_252675E00();
        int v55 = v54;
        BOOL v56 = os_log_type_enabled(v53, v54);
        uint64_t v57 = v68;
        if (v56)
        {
          unint64_t v66 = v53;
          uint64_t v58 = (uint8_t *)swift_slowAlloc();
          int64_t v67 = v40;
          uint64_t v59 = v58;
          *(_DWORD *)uint64_t v58 = 134217984;
          v64[1] = v58 + 4;
          int v65 = v55;
          sub_2526753B0();
          uint64_t v60 = sub_2526757C0();
          v26(v48, v57);
          uint64_t v61 = *(void (**)(char *, uint64_t))(v49 + 8);
          v61(v51, v70);
          uint64_t v74 = v60;
          uint64_t v53 = v66;
          sub_252675EA0();
          _os_log_impl(&dword_25262F000, v53, (os_log_type_t)v65, "URLError error : %ld", v59, 0xCu);
          uint64_t v62 = v59;
          unint64_t v40 = v67;
          uint64_t v52 = v70;
          MEMORY[0x2533B8110](v62, -1, -1);
        }
        else
        {
          uint64_t v61 = *(void (**)(char *, uint64_t))(v49 + 8);
          v61(v51, v52);
        }

        type metadata accessor for NetworkError(0);
        sub_25265CC20((unint64_t *)&qword_269C12678, (void (*)(uint64_t))type metadata accessor for NetworkError);
        uint64_t v32 = swift_allocError();
        sub_2526753B0();
        swift_storeEnumTagMultiPayload();
        v61(v40, v52);
      }
    }
  }
  else
  {
    v21(v11, 1, 1, v12);
    sub_25265CBC0((uint64_t)v11);
    if (qword_269C123F8 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_2526759F0();
    __swift_project_value_buffer(v33, (uint64_t)qword_269C12BC8);
    uint64_t v34 = sub_2526759D0();
    os_log_type_t v35 = sub_252675E00();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl(&dword_25262F000, v34, v35, "Unknown Error", v36, 2u);
      MEMORY[0x2533B8110](v36, -1, -1);
    }

    type metadata accessor for NetworkError(0);
    sub_25265CC20((unint64_t *)&qword_269C12678, (void (*)(uint64_t))type metadata accessor for NetworkError);
    uint64_t v32 = swift_allocError();
    swift_storeEnumTagMultiPayload();
  }
  return v32;
}

uint64_t sub_25265CBC0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12880);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25265CC20(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25265CC68()
{
  id v0 = objc_msgSend(self, sel_defaultManager);
  sub_252675440();
  uint64_t v1 = (void *)sub_252675B90();
  swift_bridgeObjectRelease();
  unsigned int v2 = objc_msgSend(v0, sel_fileExistsAtPath_, v1);

  if (v2) {
    return sub_252675490();
  }
  if (qword_269C123F0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2526759F0();
  __swift_project_value_buffer(v4, (uint64_t)qword_269C12BB0);
  uint64_t v5 = sub_2526759D0();
  os_log_type_t v6 = sub_252675E00();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25262F000, v5, v6, "File not found in provided location!", v7, 2u);
    MEMORY[0x2533B8110](v7, -1, -1);
  }

  return 0;
}

void sub_25265CF70()
{
  qword_269C12C68 = (uint64_t)&unk_2702B75F0;
}

uint64_t sub_25265CF84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_252675360();
  uint64_t v37 = *(void *)(v2 - 8);
  uint64_t v38 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252675680();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_252675720();
  uint64_t v35 = *(void *)(v9 - 8);
  uint64_t v36 = v9;
  MEMORY[0x270FA5388](v9);
  int64_t v11 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12598);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_252675770();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  id v19 = (char *)v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  BOOL v39 = (char *)v34 - v20;
  sub_252675730();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_252634810((uint64_t)v14, &qword_269C12598);
    uint64_t v21 = sub_252675620();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(a1, 1, 1, v21);
  }
  else
  {
    v34[1] = a1;
    uint64_t v23 = v39;
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v39, v14, v15);
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F07740], v5);
    sub_252675690();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v23, v15);
    sub_252675700();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C125C8);
    uint64_t v24 = sub_252675710();
    uint64_t v25 = *(void *)(v24 - 8);
    uint64_t v26 = *(void *)(v25 + 72);
    unint64_t v27 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_252676970;
    unint64_t v29 = v28 + v27;
    uint64_t v30 = *(void (**)(unint64_t, void, uint64_t))(v25 + 104);
    v30(v29, *MEMORY[0x263F078C0], v24);
    v30(v29 + v26, *MEMORY[0x263F078C8], v24);
    sub_252661A34(v28);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    sub_2526756A0();
    swift_bridgeObjectRelease();
    sub_252675310();
    sub_252675320();
    uint64_t v31 = sub_252675330();
    if (v32) {
      uint64_t v33 = 0;
    }
    else {
      uint64_t v33 = v31;
    }
    uint64_t result = -v33;
    if (__OFSUB__(0, v33))
    {
      __break(1u);
    }
    else
    {
      sub_252675340();
      sub_2526756E0();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v4, v38);
      (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v36);
      return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v39, v15);
    }
  }
  return result;
}

uint64_t sub_25265D52C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v37 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12908);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v34 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_252675360();
  uint64_t v35 = *(void *)(v3 - 8);
  uint64_t v36 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v33 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252675680();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_252675720();
  uint64_t v31 = *(void *)(v9 - 8);
  uint64_t v32 = v9;
  MEMORY[0x270FA5388](v9);
  int64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12598);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v30 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v29 - v15;
  uint64_t v17 = sub_252675770();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v29 - v22;
  sub_252675730();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    sub_252634810((uint64_t)v16, &qword_269C12598);
    uint64_t v24 = sub_252675620();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v37, 1, 1, v24);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v23, v16, v17);
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F07740], v5);
    sub_252675690();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v23, v17);
    sub_252675700();
    uint64_t v27 = v31;
    uint64_t v26 = v32;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56))(v34, 1, 1, v32);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v30, 1, 1, v17);
    uint64_t v28 = v33;
    sub_252675350();
    sub_2526756E0();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v28, v36);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v26);
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v23, v17);
  }
}

uint64_t _s12HomeServices06EnergyB0V19getForecastGuidance8withType0G6GridId0G7UtilityAA0F0VAA0fH0O_S2S07utilityJ0_SS06tariffJ0tSgtYaAA0F5ErrorOYKFZ(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v9 + 32) = a9;
  *(unsigned char *)(v9 + 48) = *a2;
  type metadata accessor for TimeService();
  swift_initStaticObject();
  int64_t v11 = (void *)swift_task_alloc();
  *(void *)(v9 + 40) = v11;
  *int64_t v11 = v9;
  v11[1] = sub_25265DB60;
  return _s12HomeServices06EnergyB0V19getForecastGuidance8withType0G6GridId0G7Utility0G11TimeServiceAA0F0VAA0fH0O_S2S07utilityJ0_SS06tariffJ0tSgAA0lM0CSgtYaAA0F5ErrorOYKFZ(a1, (unsigned char *)(v9 + 48));
}

uint64_t sub_25265DB60()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25265DC90, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25265DC90()
{
  *(_OWORD *)*(void *)(v0 + 32) = *(_OWORD *)(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for TimeService()
{
  return self;
}

uint64_t _s12HomeServices06EnergyB0V19getForecastGuidance8withType0G6GridId0G7Utility0G11TimeServiceAA0F0VAA0fH0O_S2S07utilityJ0_SS06tariffJ0tSgAA0lM0CSgtYaAA0F5ErrorOYKFZ(uint64_t a1, unsigned char *a2)
{
  *(void *)(v2 + 56) = v10;
  *(void *)(v2 + 64) = v11;
  *(void *)(v2 + 48) = a1;
  uint64_t v4 = sub_252675640();
  *(void *)(v2 + 72) = v4;
  *(void *)(v2 + 80) = *(void *)(v4 - 8);
  *(void *)(v2 + 88) = swift_task_alloc();
  uint64_t v5 = sub_2526751A0();
  *(void *)(v2 + 96) = v5;
  *(void *)(v2 + 104) = *(void *)(v5 - 8);
  *(void *)(v2 + 112) = swift_task_alloc();
  *(void *)(v2 + 120) = swift_task_alloc();
  uint64_t v6 = type metadata accessor for GuidanceValue(0);
  *(void *)(v2 + 128) = v6;
  *(void *)(v2 + 136) = *(void *)(v6 - 8);
  *(void *)(v2 + 144) = swift_task_alloc();
  *(void *)(v2 + 152) = __swift_instantiateConcreteTypeFromMangledName(&qword_269C128A0);
  *(void *)(v2 + 160) = swift_task_alloc();
  *(void *)(v2 + 168) = __swift_instantiateConcreteTypeFromMangledName(&qword_269C128A8);
  *(void *)(v2 + 176) = swift_task_alloc();
  *(void *)(v2 + 184) = __swift_instantiateConcreteTypeFromMangledName(&qword_269C128B0);
  *(void *)(v2 + 192) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  *(void *)(v2 + 200) = swift_task_alloc();
  *(void *)(v2 + 208) = swift_task_alloc();
  uint64_t v7 = sub_252675620();
  *(void *)(v2 + 216) = v7;
  *(void *)(v2 + 224) = *(void *)(v7 - 8);
  *(void *)(v2 + 232) = swift_task_alloc();
  *(void *)(v2 + 240) = swift_task_alloc();
  *(void *)(v2 + 248) = swift_task_alloc();
  *(void *)(v2 + 256) = swift_task_alloc();
  *(void *)(v2 + 264) = swift_task_alloc();
  *(void *)(v2 + 272) = swift_task_alloc();
  *(void *)(v2 + 280) = swift_task_alloc();
  *(unsigned char *)(v2 + 288) = *a2;
  return MEMORY[0x270FA2498](sub_25265DFFC, 0, 0);
}

uint64_t sub_25265DFFC()
{
  if (!*(void *)(v0 + 56))
  {
    type metadata accessor for TimeService();
    swift_initStaticObject();
  }
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 208);
  swift_retain();
  sub_252675610();
  swift_release();
  sub_252640E0C(v3);
  uint64_t v78 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v78(v3, 1, v1) == 1)
  {
    uint64_t v4 = *(void *)(v0 + 280);
    uint64_t v5 = *(void *)(v0 + 216);
    uint64_t v6 = *(void *)(v0 + 224);
    uint64_t v7 = *(void **)(v0 + 64);
    sub_252634810(*(void *)(v0 + 208), &qword_26B22AAB0);
    *uint64_t v7 = 0xD00000000000001ELL;
    v7[1] = 0x8000000252679DE0;
    *(void *)(v0 + 16) = 0xD00000000000001ELL;
    *(void *)(v0 + 24) = 0x8000000252679DE0;
    sub_252660868();
    swift_willThrowTypedImpl();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
LABEL_27:
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
    uint64_t v52 = *(uint64_t (**)(void))(v0 + 8);
LABEL_28:
    return v52();
  }
  uint64_t v8 = *(void *)(v0 + 272);
  uint64_t v9 = *(void *)(v0 + 216);
  uint64_t v10 = *(void *)(v0 + 224);
  uint64_t v11 = *(void *)(v0 + 176);
  uint64_t v83 = *(void *)(v0 + 184);
  uint64_t v85 = *(void *)(v0 + 192);
  uint64_t v12 = *(void *)(v0 + 152);
  uint64_t v69 = *(void *)(v0 + 160);
  uint64_t v74 = *(void *)(v0 + 128);
  uint64_t v75 = *(void *)(v0 + 136);
  uint64_t v76 = *(void *)(v0 + 104);
  uint64_t v13 = *(void (**)(void))(v10 + 32);
  ((void (*)(uint64_t, void, uint64_t))v13)(v8, *(void *)(v0 + 208), v9);
  sub_252675590();
  uint64_t v14 = *(void (**)(void))(v10 + 16);
  v10 += 16;
  uint64_t v80 = v11;
  ((void (*)(uint64_t, uint64_t, uint64_t))v14)(v11, v8, v9);
  v14();
  uint64_t v15 = v85 + *(int *)(v83 + 44);
  uint64_t v16 = v15 + *(int *)(v12 + 48);
  ((void (*)(uint64_t, uint64_t, uint64_t))v13)(v16, v80, v9);
  v13();
  unint64_t v79 = (double *)(v85 + *(int *)(v83 + 40));
  uint64_t v81 = v16;
  *unint64_t v79 = 1800.0;
  uint64_t v84 = v14;
  ((void (*)(uint64_t, uint64_t, uint64_t))v14)(v85, v16, v9);
  *(void *)uint64_t v15 = 0;
  uint64_t v66 = v15;
  *(unsigned char *)(v15 + 8) = 0;
  id v82 = (void (**)(char *, uint64_t))(v10 - 8);
  int v65 = (void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24);
  uint64_t v17 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 40);
  unint64_t v77 = (void (**)(uint64_t, uint64_t, uint64_t))(v76 + 32);
  unint64_t v18 = MEMORY[0x263F8EE78];
  long long v63 = v13;
  while (1)
  {
    ((void (*)(void, uint64_t, void))v84)(*(void *)(v0 + 256), v81, *(void *)(v0 + 216));
    double v19 = *v79;
    sub_252661D4C(&qword_269C125C0, MEMORY[0x263F07490]);
    if (v19 <= 0.0)
    {
      if ((sub_252675B70() & 1) == 0)
      {
LABEL_8:
        uint64_t v20 = *(void *)(v0 + 248);
        uint64_t v73 = *(void *)(v0 + 256);
        uint64_t v21 = *(void *)(v0 + 216);
        uint64_t v71 = *(void *)(v0 + 200);
        uint64_t v22 = *(void **)(v0 + 160);
        uint64_t v23 = (char *)v22 + *(int *)(v12 + 48);
        char v24 = *(unsigned char *)(v66 + 8);
        *uint64_t v22 = *(void *)v66;
        *(unsigned char *)(v69 + 8) = v24;
        ((void (*)(char *, uint64_t, uint64_t))v84)(v23, v81, v21);
        sub_252661D4C(&qword_269C128C0, MEMORY[0x263F07490]);
        uint64_t v25 = sub_252675EC0();
        char v27 = v26;
        uint64_t v28 = *v82;
        (*v82)(v23, v21);
        *(void *)uint64_t v66 = v25;
        char v29 = v27 & 1;
        uint64_t v13 = v63;
        *(unsigned char *)(v66 + 8) = v29;
        (*v65)(v81, v20, v21);
        ((void (*)(uint64_t, uint64_t, uint64_t))v63)(v71, v73, v21);
        uint64_t v30 = 0;
        goto LABEL_11;
      }
    }
    else if ((sub_252675B60() & 1) == 0)
    {
      goto LABEL_8;
    }
    uint64_t v28 = *v82;
    (*v82)(*(char **)(v0 + 256), *(void *)(v0 + 216));
    uint64_t v30 = 1;
LABEL_11:
    uint64_t v31 = *(void *)(v0 + 216);
    uint64_t v32 = *(void *)(v0 + 200);
    (*v17)(v32, v30, 1, v31);
    if (v78(v32, 1, v31) == 1)
    {
      char v72 = *(unsigned char *)(v0 + 288);
      uint64_t v46 = *(char **)(v0 + 272);
      uint64_t v68 = *(char **)(v0 + 280);
      uint64_t v47 = *(char **)(v0 + 264);
      uint64_t v48 = *(void *)(v0 + 248);
      uint64_t v49 = *(void *)(v0 + 232);
      uint64_t v50 = *(void *)(v0 + 216);
      uint64_t v70 = *(void *)(v0 + 96);
      uint64_t v60 = *(void *)(v0 + 112);
      uint64_t v61 = *(void *)(v0 + 88);
      uint64_t v67 = *(void *)(v0 + 72);
      uint64_t v62 = *(void *)(v0 + 80);
      uint64_t v64 = *(void *)(v0 + 48);
      sub_252634810(*(void *)(v0 + 192), &qword_269C128B0);
      sub_252675630();
      ((void (*)(uint64_t, char *, uint64_t))v84)(v48, v46, v50);
      ((void (*)(uint64_t, char *, uint64_t))v84)(v49, v47, v50);
      sub_252675170();
      v28(v47, v50);
      v28(v46, v50);
      v28(v68, v50);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 32))(v64, v61, v67);
      uint64_t v51 = (int *)type metadata accessor for Guidance(0);
      *(unsigned char *)(v64 + v51[5]) = v72;
      (*v77)(v64 + v51[6], v60, v70);
      *(void *)(v64 + v51[7]) = v18;
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
      uint64_t v52 = *(uint64_t (**)(void))(v0 + 8);
      goto LABEL_28;
    }
    uint64_t v33 = *(void *)(v0 + 240);
    ((void (*)(uint64_t, void, void))v13)(v33, *(void *)(v0 + 200), *(void *)(v0 + 216));
    uint64_t result = sub_25265EA84(v33);
    if (v35)
    {
      uint64_t v53 = *(char **)(v0 + 272);
      os_log_type_t v54 = *(char **)(v0 + 280);
      int v55 = *(char **)(v0 + 264);
      BOOL v56 = *(char **)(v0 + 240);
      uint64_t v57 = *(void *)(v0 + 216);
      uint64_t v58 = *(void *)(v0 + 192);
      uint64_t v59 = *(void **)(v0 + 64);
      swift_bridgeObjectRelease();
      *uint64_t v59 = 0xD00000000000001BLL;
      v59[1] = 0x8000000252679E00;
      *(void *)(v0 + 32) = 0xD00000000000001BLL;
      *(void *)(v0 + 40) = 0x8000000252679E00;
      sub_252660868();
      swift_willThrowTypedImpl();
      v28(v56, v57);
      sub_252634810(v58, &qword_269C128B0);
      v28(v55, v57);
      v28(v53, v57);
      v28(v54, v57);
      goto LABEL_27;
    }
    double v36 = (double)result / 30.0;
    if ((~*(void *)&v36 & 0x7FF0000000000000) == 0) {
      break;
    }
    if (v36 <= -9.22337204e18) {
      goto LABEL_32;
    }
    if (v36 >= 9.22337204e18) {
      goto LABEL_33;
    }
    ((void (*)(void, void, void))v84)(*(void *)(v0 + 248), *(void *)(v0 + 240), *(void *)(v0 + 216));
    uint64_t result = sub_252675180();
    if (qword_269C12448 != -1) {
      uint64_t result = swift_once();
    }
    uint64_t v37 = *(void *)(qword_269C12C68 + 16);
    if (!v37) {
      goto LABEL_34;
    }
    uint64_t v38 = (uint64_t)v36 % v37;
    if (v38 < 0) {
      goto LABEL_35;
    }
    uint64_t v39 = *(void *)(v0 + 144);
    uint64_t v40 = *(void *)(qword_269C12C68 + 8 * v38 + 32);
    (*v77)(v39, *(void *)(v0 + 120), *(void *)(v0 + 96));
    *(void *)(v39 + *(int *)(v74 + 20)) = v40;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v18 = sub_25264C1C0(0, *(void *)(v18 + 16) + 1, 1, v18);
    }
    unint64_t v42 = *(void *)(v18 + 16);
    unint64_t v41 = *(void *)(v18 + 24);
    if (v42 >= v41 >> 1) {
      unint64_t v18 = sub_25264C1C0(v41 > 1, v42 + 1, 1, v18);
    }
    unint64_t v43 = *(char **)(v0 + 240);
    uint64_t v44 = *(void *)(v0 + 216);
    uint64_t v45 = *(void *)(v0 + 144);
    *(void *)(v18 + 16) = v42 + 1;
    sub_25266092C(v45, v18+ ((*(unsigned __int8 *)(v75 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80))+ *(void *)(v75 + 72) * v42);
    v28(v43, v44);
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_25265EA84(uint64_t a1)
{
  uint64_t v39 = a1;
  uint64_t v1 = sub_252675360();
  uint64_t v41 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v40 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_252675680();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_252675720();
  uint64_t v37 = *(void *)(v7 - 8);
  uint64_t v38 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12598);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_252675770();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  double v19 = (char *)&v36 - v18;
  sub_252675730();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_252634810((uint64_t)v12, &qword_269C12598);
  }
  else
  {
    uint64_t v36 = v1;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F07740], v3);
    sub_252675690();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
    sub_252675700();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C125C8);
    uint64_t v20 = sub_252675710();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(void *)(v21 + 72);
    unint64_t v23 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_252676970;
    unint64_t v25 = v24 + v23;
    char v26 = *(void (**)(unint64_t, void, uint64_t))(v21 + 104);
    v26(v25, *MEMORY[0x263F07890], v20);
    v26(v25 + v22, *MEMORY[0x263F078C0], v20);
    sub_252661A34(v24);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    char v27 = v40;
    sub_2526756A0();
    swift_bridgeObjectRelease();
    uint64_t v28 = sub_252675300();
    if (v29)
    {
      (*(void (**)(char *, uint64_t))(v41 + 8))(v27, v36);
      (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v38);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
    }
    else
    {
      uint64_t v30 = v28;
      uint64_t v31 = sub_252675310();
      char v33 = v32;
      (*(void (**)(char *, uint64_t))(v41 + 8))(v27, v36);
      (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v38);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v13);
      if ((v33 & 1) == 0)
      {
        uint64_t v35 = 60 * v30;
        if ((unsigned __int128)(v30 * (__int128)60) >> 64 == (60 * v30) >> 63)
        {
          uint64_t result = v35 + v31;
          if (!__OFADD__(v35, v31)) {
            return result;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        return result;
      }
    }
  }
  return 0;
}

uint64_t GuidanceValue.init(interval:rating:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v6 = sub_2526751A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a2, a1, v6);
  uint64_t result = type metadata accessor for GuidanceValue(0);
  *(double *)(a2 + *(int *)(result + 20)) = a3;
  return result;
}

uint64_t Guidance.init(identifier:type:interval:values:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v9 = *a2;
  uint64_t v10 = sub_252675640();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(a5, a1, v10);
  uint64_t v11 = (int *)type metadata accessor for Guidance(0);
  *(unsigned char *)(a5 + v11[5]) = v9;
  uint64_t v12 = a5 + v11[6];
  uint64_t v13 = sub_2526751A0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v12, a3, v13);
  *(void *)(a5 + v11[7]) = a4;
  return result;
}

uint64_t _s12HomeServices06EnergyB0V21getHistoricalGuidance8withType0G6GridId11forIntervalAA0F0VAA0fH0O_SS10Foundation04DateL0VtYaAA0F5ErrorOYKFZ(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 32) = a6;
  *(unsigned char *)(v6 + 48) = *a2;
  type metadata accessor for TimeService();
  swift_initStaticObject();
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 40) = v12;
  *uint64_t v12 = v6;
  v12[1] = sub_25265F244;
  return _s12HomeServices06EnergyB0V21getHistoricalGuidance8withType0G6GridId11forInterval0G11TimeServiceAA0F0VAA0fH0O_SS10Foundation04DateL0VAA0mN0CtYaAA0F5ErrorOYKFZ(a1, (unsigned char *)(v6 + 48), v9, v10, a5, v11, v6 + 16);
}

uint64_t sub_25265F244()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_252661D94, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t _s12HomeServices06EnergyB0V21getHistoricalGuidance8withType0G6GridId11forInterval0G11TimeServiceAA0F0VAA0fH0O_SS10Foundation04DateL0VAA0mN0CtYaAA0F5ErrorOYKFZ(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 72) = a5;
  *(void *)(v7 + 80) = a7;
  *(void *)(v7 + 64) = a1;
  uint64_t v9 = sub_2526751A0();
  *(void *)(v7 + 88) = v9;
  *(void *)(v7 + 96) = *(void *)(v9 - 8);
  *(void *)(v7 + 104) = swift_task_alloc();
  uint64_t v10 = sub_252675640();
  *(void *)(v7 + 112) = v10;
  *(void *)(v7 + 120) = *(void *)(v10 - 8);
  *(void *)(v7 + 128) = swift_task_alloc();
  uint64_t v11 = type metadata accessor for GuidanceValue(0);
  *(void *)(v7 + 136) = v11;
  *(void *)(v7 + 144) = *(void *)(v11 - 8);
  *(void *)(v7 + 152) = swift_task_alloc();
  *(void *)(v7 + 160) = __swift_instantiateConcreteTypeFromMangledName(&qword_269C128A0);
  *(void *)(v7 + 168) = swift_task_alloc();
  *(void *)(v7 + 176) = __swift_instantiateConcreteTypeFromMangledName(&qword_269C128A8);
  *(void *)(v7 + 184) = swift_task_alloc();
  *(void *)(v7 + 192) = __swift_instantiateConcreteTypeFromMangledName(&qword_269C128B0);
  *(void *)(v7 + 200) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  *(void *)(v7 + 208) = swift_task_alloc();
  *(void *)(v7 + 216) = swift_task_alloc();
  *(void *)(v7 + 224) = swift_task_alloc();
  *(void *)(v7 + 232) = swift_task_alloc();
  uint64_t v12 = sub_252675620();
  *(void *)(v7 + 240) = v12;
  *(void *)(v7 + 248) = *(void *)(v12 - 8);
  *(void *)(v7 + 256) = swift_task_alloc();
  *(void *)(v7 + 264) = swift_task_alloc();
  *(void *)(v7 + 272) = swift_task_alloc();
  *(void *)(v7 + 280) = swift_task_alloc();
  *(void *)(v7 + 288) = swift_task_alloc();
  *(void *)(v7 + 296) = swift_task_alloc();
  *(void *)(v7 + 304) = swift_task_alloc();
  *(void *)(v7 + 312) = swift_task_alloc();
  *(void *)(v7 + 320) = swift_task_alloc();
  *(void *)(v7 + 328) = swift_task_alloc();
  *(void *)(v7 + 336) = swift_task_alloc();
  *(void *)(v7 + 344) = swift_task_alloc();
  *(void *)(v7 + 352) = swift_task_alloc();
  *(unsigned char *)(v7 + 360) = *a2;
  return MEMORY[0x270FA2498](sub_25265F6E0, 0, 0);
}

uint64_t sub_25265F6E0()
{
  uint64_t v1 = *(void *)(v0 + 344);
  uint64_t v2 = *(void *)(v0 + 352);
  uint64_t v3 = *(void *)(v0 + 336);
  uint64_t v4 = *(void *)(v0 + 320);
  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v6 = *(void **)(v0 + 248);
  uint64_t v113 = *(void *)(v0 + 328);
  uint64_t v115 = *(void *)(v0 + 232);
  sub_252675610();
  sub_252675160();
  sub_252661D4C(&qword_269C125C0, MEMORY[0x263F07490]);
  char v7 = sub_252675B50();
  uint64_t v8 = (void (*)(uint64_t, uint64_t, uint64_t))v6[2];
  if (v7) {
    uint64_t v9 = v2;
  }
  else {
    uint64_t v9 = v3;
  }
  v8(v1, v9, v5);
  uint64_t v10 = (void (*)(uint64_t, uint64_t))v6[1];
  v10(v3, v5);
  sub_252675190();
  if (sub_252675B50()) {
    uint64_t v11 = v1;
  }
  else {
    uint64_t v11 = v4;
  }
  unint64_t v109 = v8;
  v8(v113, v11, v5);
  v10(v4, v5);
  sub_25265CF84(v115);
  uint64_t v12 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v6[6];
  unsigned int v13 = v12(v115, 1, v5);
  uint64_t v14 = *(void *)(v0 + 240);
  if (v13 == 1)
  {
    uint64_t v15 = *(void *)(v0 + 344);
    uint64_t v16 = *(void *)(v0 + 352);
    uint64_t v17 = *(void *)(v0 + 328);
    uint64_t v18 = *(void **)(v0 + 80);
    sub_252634810(*(void *)(v0 + 232), &qword_26B22AAB0);
    *uint64_t v18 = 0xD00000000000001FLL;
    v18[1] = 0x8000000252679E20;
    *(void *)(v0 + 16) = 0xD00000000000001FLL;
    *(void *)(v0 + 24) = 0x8000000252679E20;
    sub_252660868();
    swift_willThrowTypedImpl();
    v10(v17, v14);
    v10(v15, v14);
    v10(v16, v14);
    goto LABEL_16;
  }
  uint64_t v102 = v10;
  uint64_t v20 = (uint64_t *)(v0 + 224);
  uint64_t v19 = *(void *)(v0 + 224);
  uint64_t v103 = *(void (**)(void))(*(void *)(v0 + 248) + 32);
  ((void (*)(void, void, uint64_t))v103)(*(void *)(v0 + 312), *(void *)(v0 + 232), v14);
  sub_25265D52C(v19);
  if (v12(v19, 1, v14) == 1)
  {
LABEL_15:
    uint64_t v26 = *v20;
    uint64_t v28 = *(void *)(v0 + 344);
    uint64_t v27 = *(void *)(v0 + 352);
    uint64_t v29 = *(void *)(v0 + 328);
    uint64_t v30 = *(void *)(v0 + 312);
    uint64_t v31 = *(void *)(v0 + 240);
    char v32 = *(void **)(v0 + 80);
    sub_252634810(v26, &qword_26B22AAB0);
    *char v32 = 0xD00000000000001CLL;
    v32[1] = 0x8000000252679E40;
    *(void *)(v0 + 32) = 0xD00000000000001CLL;
    *(void *)(v0 + 40) = 0x8000000252679E40;
    sub_252660868();
    swift_willThrowTypedImpl();
    v10(v30, v31);
    v10(v29, v31);
    v10(v28, v31);
    v10(v27, v31);
LABEL_16:
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
    char v33 = *(uint64_t (**)(void))(v0 + 8);
LABEL_17:
    return v33();
  }
  uint64_t v20 = (uint64_t *)(v0 + 216);
  uint64_t v116 = *(void *)(v0 + 216);
  uint64_t v21 = *(void *)(v0 + 352);
  uint64_t v22 = *(void *)(v0 + 304);
  uint64_t v23 = *(void *)(v0 + 288);
  uint64_t v24 = *(void *)(v0 + 240);
  ((void (*)(uint64_t, void, uint64_t))v103)(v22, *(void *)(v0 + 224), v24);
  if (sub_252675B50()) {
    uint64_t v25 = v21;
  }
  else {
    uint64_t v25 = v22;
  }
  v109(v23, v25, v24);
  sub_25265CF84(v116);
  v10(v23, v24);
  uint64_t v96 = v12;
  if (v12(v116, 1, v24) == 1)
  {
    v10(*(void *)(v0 + 304), *(void *)(v0 + 240));
    goto LABEL_15;
  }
  uint64_t v35 = *(void *)(v0 + 312);
  uint64_t v36 = *(void *)(v0 + 240);
  uint64_t v117 = *(void *)(v0 + 248);
  uint64_t v37 = *(void *)(v0 + 184);
  uint64_t v104 = *(void *)(v0 + 192);
  uint64_t v106 = *(void *)(v0 + 200);
  uint64_t v38 = *(void *)(v0 + 160);
  uint64_t v94 = *(void *)(v0 + 168);
  uint64_t v99 = *(void *)(v0 + 136);
  uint64_t v100 = *(void *)(v0 + 144);
  ((void (*)(void, void, uint64_t))v103)(*(void *)(v0 + 296), *(void *)(v0 + 216), v36);
  v109(v37, v35, v36);
  uint64_t v39 = v109;
  ((void (*)(void))v109)();
  uint64_t v40 = v106;
  uint64_t v95 = v106 + *(int *)(v104 + 44);
  uint64_t v92 = v38;
  uint64_t v41 = v95 + *(int *)(v38 + 48);
  ((void (*)(uint64_t, uint64_t, uint64_t))v103)(v41, v37, v36);
  v103();
  uint64_t v105 = (double *)(v106 + *(int *)(v104 + 40));
  double *v105 = 1800.0;
  unint64_t v42 = v102;
  uint64_t v107 = v41;
  v109(v40, v41, v36);
  id v91 = (void (**)(uint64_t, uint64_t, uint64_t))(v117 + 40);
  uint64_t v101 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v117 + 56);
  unint64_t v118 = MEMORY[0x263F8EE78];
  unint64_t v43 = v96;
  *(void *)uint64_t v95 = 0;
  *(unsigned char *)(v95 + 8) = 0;
  while (1)
  {
    v39(*(void *)(v0 + 280), v107, *(void *)(v0 + 240));
    if (*v105 <= 0.0)
    {
      if ((sub_252675B70() & 1) == 0)
      {
LABEL_23:
        uint64_t v44 = *(void *)(v0 + 272);
        uint64_t v45 = *(void *)(v0 + 240);
        uint64_t v97 = *(void *)(v0 + 208);
        uint64_t v98 = *(void *)(v0 + 280);
        uint64_t v46 = *(void **)(v0 + 168);
        uint64_t v47 = (char *)v46 + *(int *)(v92 + 48);
        char v48 = *(unsigned char *)(v95 + 8);
        *uint64_t v46 = *(void *)v95;
        *(unsigned char *)(v94 + 8) = v48;
        v39((uint64_t)v47, v107, v45);
        sub_252661D4C(&qword_269C128C0, MEMORY[0x263F07490]);
        unint64_t v42 = v102;
        uint64_t v49 = sub_252675EC0();
        char v51 = v50;
        v102((uint64_t)v47, v45);
        *(void *)uint64_t v95 = v49;
        char v52 = v51 & 1;
        unint64_t v43 = v96;
        *(unsigned char *)(v95 + 8) = v52;
        (*v91)(v107, v44, v45);
        uint64_t v53 = v103;
        ((void (*)(uint64_t, uint64_t, uint64_t))v103)(v97, v98, v45);
        uint64_t v54 = 0;
        goto LABEL_26;
      }
    }
    else if ((sub_252675B60() & 1) == 0)
    {
      goto LABEL_23;
    }
    v42(*(void *)(v0 + 280), *(void *)(v0 + 240));
    uint64_t v54 = 1;
    uint64_t v53 = v103;
LABEL_26:
    uint64_t v55 = *(void *)(v0 + 240);
    uint64_t v56 = *(void *)(v0 + 208);
    (*v101)(v56, v54, 1, v55);
    if (v43(v56, 1, v55) == 1)
    {
      char v93 = *(unsigned char *)(v0 + 360);
      uint64_t v89 = *(void *)(v0 + 352);
      uint64_t v86 = *(void *)(v0 + 328);
      uint64_t v87 = *(void *)(v0 + 344);
      uint64_t v69 = *(void *)(v0 + 312);
      uint64_t v111 = *(void *)(v0 + 304);
      uint64_t v108 = *(void *)(v0 + 296);
      uint64_t v70 = *(void *)(v0 + 272);
      uint64_t v71 = *(void *)(v0 + 256);
      uint64_t v72 = *(void *)(v0 + 240);
      uint64_t v85 = *(void *)(v0 + 112);
      uint64_t v81 = *(void *)(v0 + 104);
      uint64_t v82 = *(void *)(v0 + 128);
      uint64_t v88 = *(void *)(v0 + 96);
      uint64_t v90 = *(void *)(v0 + 88);
      uint64_t v83 = *(void *)(v0 + 64);
      uint64_t v84 = *(void *)(v0 + 120);
      sub_252634810(*(void *)(v0 + 200), &qword_269C128B0);
      sub_252675630();
      v109(v70, v69, v72);
      v109(v71, v108, v72);
      sub_252675170();
      v42(v108, v72);
      v42(v111, v72);
      v42(v69, v72);
      v42(v86, v72);
      v42(v87, v72);
      v42(v89, v72);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v84 + 32))(v83, v82, v85);
      uint64_t v73 = (int *)type metadata accessor for Guidance(0);
      *(unsigned char *)(v83 + v73[5]) = v93;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v88 + 32))(v83 + v73[6], v81, v90);
      *(void *)(v83 + v73[7]) = v118;
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
      char v33 = *(uint64_t (**)(void))(v0 + 8);
      goto LABEL_17;
    }
    uint64_t v57 = *(void *)(v0 + 264);
    ((void (*)(uint64_t, void, void))v53)(v57, *(void *)(v0 + 208), *(void *)(v0 + 240));
    uint64_t result = sub_25265EA84(v57);
    if (v58)
    {
      uint64_t v112 = *(void *)(v0 + 344);
      uint64_t v114 = *(void *)(v0 + 352);
      uint64_t v110 = *(void *)(v0 + 328);
      uint64_t v75 = *(void *)(v0 + 304);
      uint64_t v74 = *(void *)(v0 + 312);
      uint64_t v76 = *(void *)(v0 + 296);
      uint64_t v77 = *(void *)(v0 + 264);
      uint64_t v78 = *(void *)(v0 + 240);
      uint64_t v79 = *(void *)(v0 + 200);
      uint64_t v80 = *(void **)(v0 + 80);
      swift_bridgeObjectRelease();
      *uint64_t v80 = 0xD000000000000021;
      v80[1] = 0x8000000252679E60;
      *(void *)(v0 + 48) = 0xD000000000000021;
      *(void *)(v0 + 56) = 0x8000000252679E60;
      sub_252660868();
      swift_willThrowTypedImpl();
      v42(v77, v78);
      sub_252634810(v79, &qword_269C128B0);
      v42(v76, v78);
      v42(v75, v78);
      v42(v74, v78);
      v42(v110, v78);
      v42(v112, v78);
      v42(v114, v78);
      goto LABEL_16;
    }
    double v59 = (double)result / 30.0;
    if ((~*(void *)&v59 & 0x7FF0000000000000) == 0) {
      break;
    }
    if (v59 <= -9.22337204e18) {
      goto LABEL_43;
    }
    if (v59 >= 9.22337204e18) {
      goto LABEL_44;
    }
    if (qword_269C12448 != -1) {
      uint64_t result = swift_once();
    }
    uint64_t v60 = *(void *)(qword_269C12C68 + 16);
    uint64_t v39 = v109;
    if (!v60) {
      goto LABEL_45;
    }
    uint64_t v61 = (uint64_t)v59 % v60;
    if (v61 < 0) {
      goto LABEL_46;
    }
    uint64_t v62 = *(void *)(v0 + 152);
    uint64_t v63 = *(void *)(qword_269C12C68 + 8 * v61 + 32);
    v109(*(void *)(v0 + 272), *(void *)(v0 + 264), *(void *)(v0 + 240));
    sub_252675590();
    sub_252675170();
    *(void *)(v62 + *(int *)(v99 + 20)) = v63;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v118 = sub_25264C1C0(0, *(void *)(v118 + 16) + 1, 1, v118);
    }
    unint64_t v65 = *(void *)(v118 + 16);
    unint64_t v64 = *(void *)(v118 + 24);
    if (v65 >= v64 >> 1) {
      unint64_t v118 = sub_25264C1C0(v64 > 1, v65 + 1, 1, v118);
    }
    uint64_t v66 = *(void *)(v0 + 264);
    uint64_t v67 = *(void *)(v0 + 240);
    uint64_t v68 = *(void *)(v0 + 152);
    *(void *)(v118 + 16) = v65 + 1;
    sub_25266092C(v68, v118+ ((*(unsigned __int8 *)(v100 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v100 + 80))+ *(void *)(v100 + 72) * v65);
    v42(v66, v67);
  }
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
  return result;
}

uint64_t _s12HomeServices06EnergyB0V21getGuidanceStatistics8withType0G6GridId0G7UtilityAA0eF0VAA0eH0O_S2S07utilityJ0_SS06tariffJ0tSgtYaAA0E5ErrorOYKFZ(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_2526605B8, 0, 0);
}

uint64_t sub_2526605B8()
{
  uint64_t v1 = *(_OWORD **)(v0 + 16);
  *uint64_t v1 = xmmword_252677780;
  v1[1] = xmmword_252677790;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

HomeServices::GuidanceStatistics __swiftcall GuidanceStatistics.init(p50:p84:p97:p99:)(Swift::Double p50, Swift::Double p84, Swift::Double p97, Swift::Double p99)
{
  *uint64_t v4 = p50;
  v4[1] = p84;
  v4[2] = p97;
  v4[3] = p99;
  result.p99 = p99;
  result.p97 = p97;
  result.p84 = p84;
  result.p50 = p50;
  return result;
}

uint64_t Guidance.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_252660790(MEMORY[0x263F07508], a1);
}

uint64_t Guidance.type.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for Guidance(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t Guidance.interval.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for Guidance(0) + 24);
  uint64_t v4 = sub_2526751A0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t Guidance.values.getter()
{
  type metadata accessor for Guidance(0);

  return swift_bridgeObjectRetain();
}

BOOL static GuidanceType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t GuidanceType.hash(into:)()
{
  return sub_2526761C0();
}

uint64_t GuidanceType.hashValue.getter()
{
  return sub_2526761D0();
}

uint64_t GuidanceValue.interval.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_252660790(MEMORY[0x263F062D0], a1);
}

uint64_t sub_252660790@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a2, v2, v4);
}

double GuidanceValue.rating.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for GuidanceValue(0) + 20));
}

double GuidanceStatistics.p50.getter()
{
  return *(double *)v0;
}

double GuidanceStatistics.p84.getter()
{
  return *(double *)(v0 + 8);
}

double GuidanceStatistics.p97.getter()
{
  return *(double *)(v0 + 16);
}

double GuidanceStatistics.p99.getter()
{
  return *(double *)(v0 + 24);
}

uint64_t type metadata accessor for GuidanceValue(uint64_t a1)
{
  return sub_2526608DC(a1, (uint64_t *)&unk_269C128F8);
}

unint64_t sub_252660868()
{
  unint64_t result = qword_269C128B8;
  if (!qword_269C128B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C128B8);
  }
  return result;
}

uint64_t type metadata accessor for Guidance(uint64_t a1)
{
  return sub_2526608DC(a1, (uint64_t *)&unk_269C128E8);
}

uint64_t sub_2526608DC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t TimeService.deinit()
{
  return v0;
}

uint64_t TimeService.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_25266092C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GuidanceValue(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_252660994()
{
  unint64_t result = qword_269C128E0;
  if (!qword_269C128E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C128E0);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for Guidance(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_252675640();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2526751A0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for Guidance(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252675640();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_2526751A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Guidance(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_252675640();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2526751A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Guidance(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_252675640();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2526751A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for Guidance(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_252675640();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2526751A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for Guidance(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_252675640();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2526751A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Guidance(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252660F50);
}

uint64_t sub_252660F50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_252675640();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_2526751A0();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 28));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for Guidance(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252661078);
}

uint64_t sub_252661078(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_252675640();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_2526751A0();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 24);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t sub_252661188()
{
  uint64_t result = sub_252675640();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2526751A0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for GuidanceType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252661330);
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

ValueMetadata *type metadata accessor for GuidanceType()
{
  return &type metadata for GuidanceType;
}

uint64_t *initializeBufferWithCopyOfBuffer for GuidanceValue(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2526751A0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for GuidanceValue(uint64_t a1)
{
  uint64_t v2 = sub_2526751A0();
  int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for GuidanceValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2526751A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for GuidanceValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2526751A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for GuidanceValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2526751A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for GuidanceValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2526751A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for GuidanceValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25266169C);
}

uint64_t sub_25266169C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2526751A0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for GuidanceValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25266171C);
}

uint64_t sub_25266171C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2526751A0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_25266178C()
{
  uint64_t result = sub_2526751A0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for GuidanceStatistics(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for GuidanceStatistics(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for GuidanceStatistics()
{
  return &type metadata for GuidanceStatistics;
}

void *initializeBufferWithCopyOfBuffer for GuidanceError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for GuidanceError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for GuidanceError(void *a1, void *a2)
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

void *assignWithTake for GuidanceError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GuidanceError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for GuidanceError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GuidanceError()
{
  return &type metadata for GuidanceError;
}

uint64_t method lookup function for TimeService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TimeService);
}

uint64_t dispatch thunk of TimeService.getCurrentTime()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 80))();
}

uint64_t sub_252661A34(uint64_t a1)
{
  uint64_t v2 = sub_252675710();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C12910);
    uint64_t v9 = sub_252675F80();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_252661D4C(&qword_269C12918, MEMORY[0x263F07908]);
      uint64_t v16 = sub_252675B00();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_252661D4C(&qword_269C12920, MEMORY[0x263F07908]);
          char v23 = sub_252675B80();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_252661D4C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_252661D9C()
{
  sub_252675B20();

  return swift_bridgeObjectRelease();
}

void AutoBugCaptureIssue.init(type:subType:subTypeContext:payload:)(char *a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v7 = *a1;
  char v8 = *a2;
  char v9 = *a3;
  id v10 = objc_msgSend(self, sel_processInfo);
  id v11 = objc_msgSend(v10, sel_processName);

  uint64_t v12 = sub_252675BA0();
  uint64_t v14 = v13;

  *(unsigned char *)a5 = v7;
  *(unsigned char *)(a5 + 1) = v8;
  *(unsigned char *)(a5 + 2) = v9;
  *(void *)(a5 + 8) = v12;
  *(void *)(a5 + 16) = v14;
  *(void *)(a5 + 24) = a4;
}

uint64_t static AutoBugCaptureManager.sendIssue(_:)(char *a1)
{
  uint64_t v2 = sub_252675A00();
  uint64_t v19 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_252675A20();
  uint64_t v5 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  char v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = *a1;
  char v9 = a1[1];
  char v10 = a1[2];
  uint64_t v12 = *((void *)a1 + 1);
  uint64_t v11 = *((void *)a1 + 2);
  uint64_t v13 = *((void *)a1 + 3);
  if (qword_269C12450 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_269C12928;
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = v8;
  *(unsigned char *)(v14 + 17) = v9;
  *(unsigned char *)(v14 + 18) = v10;
  *(void *)(v14 + 24) = v12;
  *(void *)(v14 + 32) = v11;
  *(void *)(v14 + 40) = v13;
  aBlock[4] = sub_2526641BC;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2526641D4;
  aBlock[3] = &block_descriptor;
  uint64_t v15 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_252675A10();
  uint64_t v20 = MEMORY[0x263F8EE78];
  sub_25266555C(&qword_269C12938, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12940);
  sub_2526655A4(&qword_269C12948, &qword_269C12940);
  sub_252675F20();
  MEMORY[0x2533B7770](0, v7, v4, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v18);
  return swift_release();
}

uint64_t AutoBugCaptureDomain.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_2526760A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t AutoBugCaptureDomain.rawValue.getter()
{
  return 0x6553796772656E45;
}

uint64_t sub_25266235C()
{
  return sub_2526761D0();
}

uint64_t sub_2526623BC()
{
  return sub_252675B20();
}

uint64_t sub_2526623E0()
{
  return sub_2526761D0();
}

uint64_t sub_25266243C@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_2526760A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_252662490(char *a1@<X8>)
{
  a1[15] = -18;
}

HomeServices::AutoBugCaptureType_optional __swiftcall AutoBugCaptureType.init(rawValue:)(Swift::String rawValue)
{
  return (HomeServices::AutoBugCaptureType_optional)sub_252662818(v1);
}

uint64_t AutoBugCaptureType.rawValue.getter()
{
  uint64_t v1 = 0x5720796772656E45;
  if (*v0 != 1) {
    uint64_t v1 = 0x6F6F4C2064697247;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x65636E6164697547;
  }
}

uint64_t sub_252662540(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25264FB68(*a1, *a2);
}

uint64_t sub_25266254C()
{
  return sub_2526761D0();
}

uint64_t sub_252662610()
{
  sub_252675B20();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2526626C0()
{
  return sub_2526761D0();
}

HomeServices::AutoBugCaptureType_optional sub_252662780(Swift::String *a1)
{
  return AutoBugCaptureType.init(rawValue:)(*a1);
}

void sub_25266278C(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xEF6C616E67695320;
  unint64_t v4 = 0xEE0073776F646E69;
  uint64_t v5 = 0x5720796772656E45;
  if (v2 != 1)
  {
    uint64_t v5 = 0x6F6F4C2064697247;
    unint64_t v4 = 0xEB0000000070756BLL;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x65636E6164697547;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

HomeServices::AutoBugCaptureSubType_optional __swiftcall AutoBugCaptureSubType.init(rawValue:)(Swift::String rawValue)
{
  return (HomeServices::AutoBugCaptureSubType_optional)sub_252662818(v1);
}

uint64_t sub_252662818@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_2526760A0();
  uint64_t result = swift_bridgeObjectRelease();
  char v4 = 3;
  if (v2 < 3) {
    char v4 = v2;
  }
  *a1 = v4;
  return result;
}

uint64_t AutoBugCaptureSubType.rawValue.getter()
{
  uint64_t v1 = 0x726576726553;
  if (*v0 != 1) {
    uint64_t v1 = 0x73795320656C6946;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x72756769666E6F43;
  }
}

uint64_t sub_2526628DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25264F940(*a1, *a2);
}

uint64_t sub_2526628E8()
{
  return sub_2526761D0();
}

uint64_t sub_25266299C()
{
  sub_252675B20();

  return swift_bridgeObjectRelease();
}

uint64_t sub_252662A3C()
{
  return sub_2526761D0();
}

HomeServices::AutoBugCaptureSubType_optional sub_252662AEC(Swift::String *a1)
{
  return AutoBugCaptureSubType.init(rawValue:)(*a1);
}

void sub_252662AF8(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xED00006E6F697461;
  unint64_t v4 = 0xE600000000000000;
  uint64_t v5 = 0x726576726553;
  if (v2 != 1)
  {
    uint64_t v5 = 0x73795320656C6946;
    unint64_t v4 = 0xEB000000006D6574;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x72756769666E6F43;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

HomeServices::AutoBugCaptureSubTypeContext_optional __swiftcall AutoBugCaptureSubTypeContext.init(rawValue:)(Swift::String rawValue)
{
  int v2 = v1;
  unint64_t v3 = sub_2526760A0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 10;
  if (v3 < 0xA) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

unint64_t AutoBugCaptureSubTypeContext.rawValue.getter()
{
  unint64_t result = 0x20676E697373694DLL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 2:
    case 3:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000017;
      break;
    case 5:
      unint64_t result = 0x206E776F6E6B6E55;
      break;
    case 6:
      unint64_t result = 0xD000000000000035;
      break;
    case 7:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 8:
      unint64_t result = 0xD000000000000022;
      break;
    case 9:
      unint64_t result = 0xD000000000000022;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_252662D10(unsigned __int8 *a1, char *a2)
{
  return sub_25264F6A0(*a1, *a2);
}

uint64_t sub_252662D1C()
{
  return sub_2526761D0();
}

uint64_t sub_252662D64()
{
  return sub_252661D9C();
}

uint64_t sub_252662D6C()
{
  return sub_2526761D0();
}

HomeServices::AutoBugCaptureSubTypeContext_optional sub_252662DB0(Swift::String *a1)
{
  return AutoBugCaptureSubTypeContext.init(rawValue:)(*a1);
}

unint64_t sub_252662DBC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = AutoBugCaptureSubTypeContext.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_252662DE4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  unint64_t v4 = &v21[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v2);
  BOOL v6 = &v21[-v5];
  uint64_t v7 = sub_252675620();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = &v21[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = &v21[-v12];
  sub_252675600();
  uint64_t v14 = v0 + OBJC_IVAR____TtC12HomeServices22AutoBugCaptureReporter_lastReportedDate;
  swift_beginAccess();
  sub_2526654B4(v14, (uint64_t)v6);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_252634810((uint64_t)v6, &qword_26B22AAB0);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v4, v13, v7);
LABEL_6:
    uint64_t v19 = 1;
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
    swift_beginAccess();
    sub_2526407C4((uint64_t)v4, v14);
    swift_endAccess();
    return v19;
  }
  uint64_t v15 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32);
  v15(v11, v6, v7);
  sub_252675520();
  double v17 = v16;
  uint64_t v18 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
  v18(v11, v7);
  if (v17 >= 86400.0)
  {
    v15(v4, v13, v7);
    goto LABEL_6;
  }
  v18(v13, v7);
  return 0;
}

void sub_252663088(void *a1)
{
  uint64_t v2 = v1;
  unint64_t v4 = (void *)a1[1];
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))a1[2];
  uint64_t v5 = a1[3];
  if (sub_252662DE4())
  {
    BOOL v6 = *(void **)(v1 + 16);
    uint64_t v7 = (void *)sub_252675B90();
    uint64_t v8 = (void *)sub_252675B90();
    swift_bridgeObjectRelease();
    uint64_t v9 = (void *)sub_252675B90();
    swift_bridgeObjectRelease();
    double v17 = (void *)sub_252675B90();
    swift_bridgeObjectRelease();
    uint64_t v18 = (void *)sub_252675B90();
    id v31 = objc_msgSend(v6, sel_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_, v7, v8, v9, v17, v18, 0);

    if (qword_269C12408 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_2526759F0();
    __swift_project_value_buffer(v19, (uint64_t)qword_269C12BE0);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v20 = sub_2526759D0();
    os_log_type_t v21 = sub_252675E20();
    id v33 = v6;
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v40 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v35 = (uint64_t)v4;
      uint64_t v36 = v3;
      uint64_t v37 = (void *)v5;
      uint64_t v24 = AutoBugCaptureIssue.description.getter();
      uint64_t aBlock = sub_2526669DC(v24, v25, &v40);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25262F000, v20, v21, "Submitting snapshot request to ABC for signature: %s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v23, -1, -1);
      MEMORY[0x2533B8110](v22, -1, -1);

      uint64_t v26 = v31;
      if (!v31) {
        goto LABEL_15;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      uint64_t v26 = v31;
      if (!v31)
      {
LABEL_15:
        sub_252655398(MEMORY[0x263F8EE78]);
        BOOL v28 = (void *)sub_252675AC0();
        swift_bridgeObjectRelease();
        sub_2526638E8(v5);
        uint64_t v29 = (void *)sub_252675AC0();
        swift_bridgeObjectRelease();
        uint64_t v38 = sub_252664D3C;
        uint64_t v39 = v2;
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v35 = 1107296256;
        uint64_t v36 = sub_252663CB0;
        uint64_t v37 = &block_descriptor_30;
        uint64_t v30 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        objc_msgSend(v33, sel_snapshotWithSignature_duration_event_payload_reply_, 0, v28, v29, v30, 0.0);
        _Block_release(v30);

        return;
      }
    }
    uint64_t aBlock = 0;
    id v27 = v26;
    sub_252675AD0();

    goto LABEL_15;
  }
  id v32 = v4;
  if (qword_269C12408 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_2526759F0();
  __swift_project_value_buffer(v10, (uint64_t)qword_269C12BE0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_2526759D0();
  os_log_type_t v12 = sub_252675E20();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v40 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v35 = (uint64_t)v32;
    uint64_t v36 = v3;
    uint64_t v37 = (void *)v5;
    uint64_t v15 = AutoBugCaptureIssue.description.getter();
    uint64_t aBlock = sub_2526669DC(v15, v16, &v40);
    sub_252675EA0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25262F000, v11, v12, "Not reporting to AutoBugCapture because we are rate limited: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533B8110](v14, -1, -1);
    MEMORY[0x2533B8110](v13, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_2526638E8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C12840);
    uint64_t v2 = sub_252676080();
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
    double v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_252638088(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_2526348D4(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_2526348D4(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_2526348D4(v36, v37);
    sub_2526348D4(v37, &v33);
    uint64_t result = sub_252675F30();
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
    uint64_t result = (uint64_t)sub_2526348D4(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_252646E84();
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

uint64_t sub_252663CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void (**)(uint64_t))(a1 + 32);
  if (a2) {
    uint64_t v3 = sub_252675AE0();
  }
  else {
    uint64_t v3 = 0;
  }
  swift_retain();
  v2(v3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t AutoBugCaptureReporter.deinit()
{
  sub_252634810(v0 + OBJC_IVAR____TtC12HomeServices22AutoBugCaptureReporter_lastReportedDate, &qword_26B22AAB0);
  return v0;
}

uint64_t AutoBugCaptureReporter.__deallocating_deinit()
{
  sub_252634810(v0 + OBJC_IVAR____TtC12HomeServices22AutoBugCaptureReporter_lastReportedDate, &qword_26B22AAB0);

  return swift_deallocClassInstance();
}

uint64_t sub_252663DEC()
{
  uint64_t v0 = sub_252675E40();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_252675E30();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_252675A20();
  MEMORY[0x270FA5388](v5 - 8);
  sub_25266551C();
  sub_252675A10();
  v7[1] = MEMORY[0x263F8EE78];
  sub_25266555C(&qword_269C12990, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12998);
  sub_2526655A4(&qword_269C129A0, &qword_269C12998);
  sub_252675F20();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v0);
  uint64_t result = sub_252675E60();
  qword_269C12928 = result;
  return result;
}

uint64_t sub_25266402C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7C078]), sel_init);
  type metadata accessor for AutoBugCaptureReporter();
  uint64_t v1 = swift_allocObject();
  uint64_t v2 = v1 + OBJC_IVAR____TtC12HomeServices22AutoBugCaptureReporter_lastReportedDate;
  uint64_t v3 = sub_252675620();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  *(void *)(v1 + 16) = v0;
  qword_269C12930 = v1;
  return result;
}

void sub_2526640DC(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_269C12458 != -1) {
    swift_once();
  }
  LOWORD(v8[0]) = a1;
  BYTE2(v8[0]) = BYTE2(a1);
  v8[1] = a2;
  v8[2] = a3;
  v8[3] = a4;
  sub_252663088(v8);
}

uint64_t sub_25266417C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_2526641BC()
{
  sub_2526640DC(*(unsigned __int16 *)(v0 + 16) | (*(unsigned __int8 *)(v0 + 18) << 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_2526641D4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
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

void AutoBugCaptureIssue.type.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

void AutoBugCaptureIssue.subType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 1);
}

void AutoBugCaptureIssue.subTypeContext.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 2);
}

uint64_t AutoBugCaptureIssue.process.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AutoBugCaptureIssue.payload.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AutoBugCaptureIssue.description.getter()
{
  return 0;
}

unint64_t sub_252664458()
{
  unint64_t result = qword_269C12958;
  if (!qword_269C12958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12958);
  }
  return result;
}

unint64_t sub_2526644B0()
{
  unint64_t result = qword_269C12960;
  if (!qword_269C12960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12960);
  }
  return result;
}

unint64_t sub_252664508()
{
  unint64_t result = qword_269C12968;
  if (!qword_269C12968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12968);
  }
  return result;
}

unint64_t sub_252664560()
{
  unint64_t result = qword_269C12970;
  if (!qword_269C12970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12970);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AutoBugCaptureDomain(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x252664654);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AutoBugCaptureDomain()
{
  return &type metadata for AutoBugCaptureDomain;
}

ValueMetadata *type metadata accessor for AutoBugCaptureType()
{
  return &type metadata for AutoBugCaptureType;
}

uint64_t _s12HomeServices18AutoBugCaptureTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s12HomeServices18AutoBugCaptureTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x252664800);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AutoBugCaptureSubType()
{
  return &type metadata for AutoBugCaptureSubType;
}

uint64_t getEnumTagSinglePayload for AutoBugCaptureSubTypeContext(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AutoBugCaptureSubTypeContext(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *unint64_t result = a2 + 9;
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
        JUMPOUT(0x252664994);
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
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AutoBugCaptureSubTypeContext()
{
  return &type metadata for AutoBugCaptureSubTypeContext;
}

uint64_t sub_2526649CC()
{
  return type metadata accessor for AutoBugCaptureReporter();
}

uint64_t type metadata accessor for AutoBugCaptureReporter()
{
  uint64_t result = qword_269C12978;
  if (!qword_269C12978) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_252664A20()
{
  sub_252664AD8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AutoBugCaptureReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AutoBugCaptureReporter);
}

void sub_252664AD8()
{
  if (!qword_26B22ACA0)
  {
    sub_252675620();
    unint64_t v0 = sub_252675E90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B22ACA0);
    }
  }
}

ValueMetadata *type metadata accessor for AutoBugCaptureManager()
{
  return &type metadata for AutoBugCaptureManager;
}

uint64_t destroy for AutoBugCaptureIssue()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AutoBugCaptureIssue(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AutoBugCaptureIssue(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AutoBugCaptureIssue(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AutoBugCaptureIssue(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AutoBugCaptureIssue(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AutoBugCaptureIssue()
{
  return &type metadata for AutoBugCaptureIssue;
}

void sub_252664D40(uint64_t a1)
{
  if (a1)
  {
    char v34 = sub_252675BA0();
    sub_252675F50();
    if (*(void *)(a1 + 16) && (unint64_t v2 = sub_25264C490((uint64_t)v40), (v3 & 1) != 0))
    {
      sub_252638088(*(void *)(a1 + 56) + 32 * v2, (uint64_t)&v41);
    }
    else
    {
      long long v41 = 0u;
      long long v42 = 0u;
    }
    sub_252637ED0((uint64_t)v40);
    if (*((void *)&v42 + 1))
    {
      if ((swift_dynamicCast() & 1) != 0 && v34 == 1)
      {
        uint64_t v35 = sub_252675BA0();
        unint64_t v38 = v4;
        sub_252675F50();
        if (*(void *)(a1 + 16) && (unint64_t v5 = sub_25264C490((uint64_t)v40), (v6 & 1) != 0))
        {
          sub_252638088(*(void *)(a1 + 56) + 32 * v5, (uint64_t)&v41);
        }
        else
        {
          long long v41 = 0u;
          long long v42 = 0u;
        }
        sub_252637ED0((uint64_t)v40);
        if (*((void *)&v42 + 1))
        {
          if (swift_dynamicCast())
          {
            uint64_t v20 = v35;
            unint64_t v19 = v38;
LABEL_53:
            if (qword_269C12408 != -1) {
              swift_once();
            }
            uint64_t v30 = sub_2526759F0();
            __swift_project_value_buffer(v30, (uint64_t)qword_269C12BE0);
            swift_bridgeObjectRetain();
            BOOL v25 = sub_2526759D0();
            os_log_type_t v31 = sub_252675E20();
            if (os_log_type_enabled(v25, v31))
            {
              id v32 = (uint8_t *)swift_slowAlloc();
              uint64_t v33 = swift_slowAlloc();
              v40[0] = v33;
              *(_DWORD *)id v32 = 136315138;
              swift_bridgeObjectRetain();
              *(void *)&long long v41 = sub_2526669DC(v20, v19, v40);
              sub_252675EA0();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_25262F000, v25, v31, "Diagnostic reporter snapshot accepted with sessionID [%s]", v32, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x2533B8110](v33, -1, -1);
              uint64_t v29 = (uint64_t)v32;
              goto LABEL_57;
            }

LABEL_59:
            swift_bridgeObjectRelease_n();
            return;
          }
        }
        else
        {
          sub_252634810((uint64_t)&v41, qword_26B22AA80);
        }
        uint64_t v20 = 0x6E776F6E6B6E55;
        unint64_t v19 = 0xE700000000000000;
        goto LABEL_53;
      }
    }
    else
    {
      sub_252634810((uint64_t)&v41, qword_26B22AA80);
    }
    uint64_t v36 = sub_252675BA0();
    sub_252675F50();
    if (*(void *)(a1 + 16) && (unint64_t v7 = sub_25264C490((uint64_t)v40), (v8 & 1) != 0))
    {
      sub_252638088(*(void *)(a1 + 56) + 32 * v7, (uint64_t)&v41);
    }
    else
    {
      long long v41 = 0u;
      long long v42 = 0u;
    }
    sub_252637ED0((uint64_t)v40);
    if (*((void *)&v42 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v9 = v36;
        uint64_t v37 = sub_252675BA0();
        unint64_t v39 = v10;
        sub_252675F50();
        if (*(void *)(a1 + 16) && (unint64_t v11 = sub_25264C490((uint64_t)v40), (v12 & 1) != 0))
        {
          sub_252638088(*(void *)(a1 + 56) + 32 * v11, (uint64_t)&v41);
        }
        else
        {
          long long v41 = 0u;
          long long v42 = 0u;
        }
        sub_252637ED0((uint64_t)v40);
        if (*((void *)&v42 + 1))
        {
          if (swift_dynamicCast())
          {
            uint64_t v18 = v37;
            unint64_t v17 = v39;
            goto LABEL_38;
          }
        }
        else
        {
          sub_252634810((uint64_t)&v41, qword_26B22AA80);
        }
        uint64_t v18 = 0x6E776F6E6B6E55;
        unint64_t v17 = 0xE700000000000000;
LABEL_38:
        uint64_t v21 = 0x6465746365707865;
        unint64_t v22 = 0xE800000000000000;
        if (v9 != *MEMORY[0x263F7C0B8] && v9 != *MEMORY[0x263F7C0D0])
        {
          if (v9 == *MEMORY[0x263F7C0A8] || v9 == *MEMORY[0x263F7C0F8])
          {
            unint64_t v22 = 0xE800000000000000;
          }
          else
          {
            uint64_t v21 = 0x7463657078656E75;
            unint64_t v22 = 0xEA00000000006465;
          }
        }
        if (qword_269C12408 != -1) {
          swift_once();
        }
        uint64_t v24 = sub_2526759F0();
        __swift_project_value_buffer(v24, (uint64_t)qword_269C12BE0);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        BOOL v25 = sub_2526759D0();
        os_log_type_t v26 = sub_252675E20();
        if (os_log_type_enabled(v25, v26))
        {
          uint64_t v27 = swift_slowAlloc();
          uint64_t v28 = swift_slowAlloc();
          v40[0] = v28;
          *(_DWORD *)uint64_t v27 = 136315650;
          swift_bridgeObjectRetain();
          *(void *)&long long v41 = sub_2526669DC(v21, v22, v40);
          sub_252675EA0();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v27 + 12) = 2048;
          *(void *)&long long v41 = v9;
          sub_252675EA0();
          *(_WORD *)(v27 + 22) = 2080;
          swift_bridgeObjectRetain();
          *(void *)&long long v41 = sub_2526669DC(v18, v17, v40);
          sub_252675EA0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_25262F000, v25, v26, "Diagnostic reporter snapshot rejected with%s\nreason: %ld (%s)", (uint8_t *)v27, 0x20u);
          swift_arrayDestroy();
          MEMORY[0x2533B8110](v28, -1, -1);
          uint64_t v29 = v27;
LABEL_57:
          MEMORY[0x2533B8110](v29, -1, -1);

          return;
        }

        swift_bridgeObjectRelease_n();
        goto LABEL_59;
      }
    }
    else
    {
      sub_252634810((uint64_t)&v41, qword_26B22AA80);
    }
    if (qword_269C12408 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_2526759F0();
    __swift_project_value_buffer(v13, (uint64_t)qword_269C12BE0);
    unint64_t v14 = sub_2526759D0();
    os_log_type_t v15 = sub_252675E20();
    if (os_log_type_enabled(v14, v15))
    {
      int64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v16 = 0;
      _os_log_impl(&dword_25262F000, v14, v15, "Diagnostic reporter snapshot rejected with unknown reason", v16, 2u);
      MEMORY[0x2533B8110](v16, -1, -1);
    }
  }
}

uint64_t sub_2526654B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25266551C()
{
  unint64_t result = qword_269C12988;
  if (!qword_269C12988)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269C12988);
  }
  return result;
}

uint64_t sub_25266555C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2526655A4(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_252665604@<X0>(uint64_t a1@<X8>)
{
  sub_252655930();
  if (v2)
  {
    sub_25265A218(a1);
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_252675470();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
    uint64_t v5 = v3;
    uint64_t v6 = a1;
    uint64_t v7 = 0;
  }
  else
  {
    if (qword_26B22A9E0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_2526759F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_26B22B6D8);
    uint64_t v9 = sub_2526759D0();
    os_log_type_t v10 = sub_252675E00();
    if (os_log_type_enabled(v9, v10))
    {
      unint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v11 = 0;
      _os_log_impl(&dword_25262F000, v9, v10, "No Server Base URL Found!!", v11, 2u);
      MEMORY[0x2533B8110](v11, -1, -1);
    }

    uint64_t v12 = sub_252675470();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v5 = v12;
    uint64_t v6 = a1;
    uint64_t v7 = 1;
  }

  return v4(v6, v7, 1, v5);
}

uint64_t type metadata accessor for GridBaseRequest()
{
  return self;
}

uint64_t sub_2526657A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAD0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252675470();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2526554DC();
  if (v9 != 1)
  {
    uint64_t v10 = v9;
    swift_bridgeObjectRelease();
    if (v10)
    {
      sub_252665604((uint64_t)v4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
        sub_252675420();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        uint64_t v15 = 0;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a1, v15, 1, v5);
      }
      swift_bridgeObjectRelease();
      sub_252634810((uint64_t)v4, &qword_26B22AAD0);
    }
  }
  if (qword_26B22A9E0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_2526759F0();
  __swift_project_value_buffer(v11, (uint64_t)qword_26B22B6D8);
  uint64_t v12 = sub_2526759D0();
  os_log_type_t v13 = sub_252675E00();
  if (os_log_type_enabled(v12, v13))
  {
    unint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v14 = 0;
    _os_log_impl(&dword_25262F000, v12, v13, "Unable to compute API Path for grid tile lookup.", v14, 2u);
    MEMORY[0x2533B8110](v14, -1, -1);
  }

  uint64_t v15 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a1, v15, 1, v5);
}

uint64_t sub_252665A38@<X0>(unsigned int (*a1)(uint64_t, uint64_t, uint64_t)@<X0>, char *a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X8>)
{
  unint64_t v108 = a6;
  uint64_t v106 = a5;
  unint64_t v96 = a4;
  uint64_t v95 = a3;
  uint64_t v102 = a2;
  uint64_t v101 = a1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22A938);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v98 = (char *)&v92 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v99 = (char *)&v92 - v11;
  uint64_t v107 = sub_2526750B0();
  uint64_t v109 = *(void *)(v107 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v107);
  uint64_t v94 = (char *)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v100 = (char *)&v92 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAD0);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v92 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v103 = (uint64_t)&v92 - v20;
  MEMORY[0x270FA5388](v19);
  unint64_t v22 = (char *)&v92 - v21;
  uint64_t v23 = sub_252675470();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v97 = (char *)&v92 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v92 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v104 = (char *)&v92 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)&v92 - v32;
  sub_2526657A0((uint64_t)v22);
  uint64_t v34 = v24;
  uint64_t v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
  if (v35(v22, 1, v23) == 1)
  {
    sub_252634810((uint64_t)v22, &qword_26B22AAD0);
    if (qword_26B22A9E0 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_2526759F0();
    __swift_project_value_buffer(v36, (uint64_t)qword_26B22B6D8);
    unint64_t v37 = v108;
    swift_bridgeObjectRetain_n();
    unint64_t v38 = sub_2526759D0();
    os_log_type_t v39 = sub_252675E00();
    BOOL v40 = os_log_type_enabled(v38, v39);
    uint64_t v41 = v109;
    if (v40)
    {
      long long v42 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      v111[0] = v43;
      *(_DWORD *)long long v42 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v110 = sub_2526669DC(v106, v37, v111);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v38, v39, "Request URL for Grid Tile Lookup API not found | traceId: %s", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v43, -1, -1);
      MEMORY[0x2533B8110](v42, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 56))(a7, 1, 1, v107);
  }
  uint64_t v93 = a7;
  uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v34 + 32);
  v44(v33, v22, v23);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B22AA58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_252676980;
  *(void *)(inited + 32) = 104;
  *(void *)(inited + 40) = 0xE100000000000000;
  *(void *)(inited + 48) = v101;
  *(void *)(inited + 56) = v102;
  swift_bridgeObjectRetain();
  uint64_t v105 = v34;
  uint64_t v102 = v33;
  sub_252675400();
  sub_252675450();
  uint64_t v101 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v35;
  unsigned int v46 = v35(v18, 1, v23);
  uint64_t v92 = (void (*)(char *, uint64_t, uint64_t))v44;
  if (v46 == 1)
  {
    sub_252634810((uint64_t)v18, &qword_26B22AAD0);
    uint64_t v47 = v105;
    uint64_t v48 = v103;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v105 + 56))(v103, 1, 1, v23);
  }
  else
  {
    v44(v29, v18, v23);
    uint64_t v48 = v103;
    sub_25265A510(inited, 1, 0, v103);
    uint64_t v47 = v105;
    (*(void (**)(char *, uint64_t))(v105 + 8))(v29, v23);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v101(v48, 1, v23) == 1)
  {
    uint64_t v103 = v23;
    sub_252634810(v48, &qword_26B22AAD0);
    uint64_t v50 = v107;
    if (qword_26B22A9E0 != -1) {
      swift_once();
    }
    uint64_t v51 = sub_2526759F0();
    __swift_project_value_buffer(v51, (uint64_t)qword_26B22B6D8);
    unint64_t v52 = v108;
    swift_bridgeObjectRetain_n();
    uint64_t v53 = sub_2526759D0();
    os_log_type_t v54 = sub_252675E00();
    BOOL v55 = os_log_type_enabled(v53, v54);
    uint64_t v56 = v93;
    if (v55)
    {
      uint64_t v57 = (uint8_t *)swift_slowAlloc();
      uint64_t v58 = v50;
      uint64_t v59 = swift_slowAlloc();
      v111[0] = v59;
      *(_DWORD *)uint64_t v57 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v110 = sub_2526669DC(v106, v52, v111);
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v53, v54, "Unable to create Grid Tile Request URL with required query parameters | traceId: %s", v57, 0xCu);
      swift_arrayDestroy();
      uint64_t v60 = v59;
      uint64_t v50 = v58;
      MEMORY[0x2533B8110](v60, -1, -1);
      MEMORY[0x2533B8110](v57, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v105 + 8))(v102, v103);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v109 + 56))(v56, 1, 1, v50);
  }
  uint64_t v61 = v104;
  v92(v104, v48, v23);
  (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v97, v61, v23);
  uint64_t v62 = v100;
  sub_252675060();
  sub_252675020();
  uint64_t v63 = sub_25263CDD0();
  uint64_t v64 = v109;
  if (v63)
  {
    uint64_t v65 = v107;
    uint64_t v66 = (uint64_t)v98;
    if (qword_26B22A9A8 != -1) {
      uint64_t v63 = swift_once();
    }
    MEMORY[0x270FA5388](v63);
    *(&v92 - 2) = v70;
    uint64_t v68 = &unk_2702B7440;
    uint64_t v69 = sub_252639234;
  }
  else
  {
    uint64_t v65 = v107;
    uint64_t v66 = (uint64_t)v98;
    if (qword_26B22A9A8 != -1) {
      uint64_t v63 = swift_once();
    }
    MEMORY[0x270FA5388](v63);
    *(&v92 - 2) = v67;
    uint64_t v68 = &unk_2702B7480;
    uint64_t v69 = sub_25263922C;
  }
  sub_252667044((uint64_t)v68, (uint64_t (*)(uint64_t, void))v69);
  unint64_t v71 = sub_252675C20();
  unint64_t v73 = v72;
  swift_bridgeObjectRelease();
  sub_25263CDD0();
  sub_252642044(v71, v73, 49, 0xE100000000000000, v66);
  swift_bridgeObjectRelease();
  uint64_t v74 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v64 + 48);
  if (v74(v66, 1, v65) == 1)
  {
    sub_252634810(v66, &qword_26B22A938);
    uint64_t v75 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v64 + 56);
    uint64_t v76 = (uint64_t)v99;
    v75(v99, 1, 1, v65);
LABEL_29:
    uint64_t v103 = v23;
    sub_252634810(v76, &qword_26B22A938);
    if (qword_26B22A9E0 != -1) {
      swift_once();
    }
    uint64_t v78 = sub_2526759F0();
    __swift_project_value_buffer(v78, (uint64_t)qword_26B22B6D8);
    unint64_t v79 = v108;
    swift_bridgeObjectRetain_n();
    uint64_t v80 = sub_2526759D0();
    os_log_type_t v81 = sub_252675E00();
    if (os_log_type_enabled(v80, v81))
    {
      uint64_t v82 = (uint8_t *)swift_slowAlloc();
      uint64_t v83 = swift_slowAlloc();
      v111[0] = v83;
      *(_DWORD *)uint64_t v82 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v110 = sub_2526669DC(v106, v79, v111);
      uint64_t v84 = v109;
      sub_252675EA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25262F000, v80, v81, "Unable to create signed Grid Look up request | traceId: %s", v82, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533B8110](v83, -1, -1);
      MEMORY[0x2533B8110](v82, -1, -1);

      (*(void (**)(char *, uint64_t))(v84 + 8))(v100, v65);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v64 + 8))(v62, v65);
    }
    uint64_t v85 = *(void (**)(char *, uint64_t))(v105 + 8);
    uint64_t v86 = v103;
    v85(v104, v103);
    v85(v102, v86);
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v75)(v93, 1, 1, v65);
  }
  uint64_t v76 = (uint64_t)v99;
  (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v99, v66, v65);
  sub_252675080();
  sub_252675080();
  uint64_t v77 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
  v77(v66, v65);
  uint64_t v75 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v64 + 56);
  v75((char *)v76, 0, 1, v65);
  if (v74(v76, 1, v65) == 1)
  {
    uint64_t v62 = v100;
    goto LABEL_29;
  }
  uint64_t v87 = v94;
  uint64_t v109 = *(void *)(v64 + 32);
  ((void (*)(char *, uint64_t, uint64_t))v109)(v94, v76, v65);
  sub_2526750A0();
  uint64_t v88 = v102;
  if (v96)
  {
    uint64_t v89 = HIBYTE(v96) & 0xF;
    if ((v96 & 0x2000000000000000) == 0) {
      uint64_t v89 = v95 & 0xFFFFFFFFFFFFLL;
    }
    if (v89) {
      sub_252675080();
    }
  }
  v77((uint64_t)v100, v65);
  uint64_t v90 = *(void (**)(char *, uint64_t))(v105 + 8);
  v90(v104, v23);
  v90(v88, v23);
  uint64_t v91 = v93;
  ((void (*)(uint64_t, char *, uint64_t))v109)(v93, v87, v65);
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v75)(v91, 0, 1, v65);
}

uint64_t type metadata accessor for GridLookupRequest()
{
  return self;
}

uint64_t sub_252666900(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_25266693C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_252666964(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_2526669DC(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_252675EA0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2526669DC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_252666AB0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_252638088((uint64_t)v12, *a3);
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
      sub_252638088((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_252666AB0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_252675EB0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_252666C6C(a5, a6);
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
  uint64_t v8 = sub_252675FD0();
  if (!v8)
  {
    sub_252676040();
    __break(1u);
LABEL_17:
    uint64_t result = sub_252676090();
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

uint64_t sub_252666C6C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_252666D04(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_252666EE4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_252666EE4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_252666D04(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_252666E7C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_252675FB0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_252676040();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_252675CA0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_252676090();
    __break(1u);
LABEL_14:
    uint64_t result = sub_252676040();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_252666E7C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB80);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_252666EE4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB80);
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
  uint64_t result = sub_252676090();
  __break(1u);
  return result;
}

unsigned char **sub_252667034(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_252667044(uint64_t a1, uint64_t (*a2)(uint64_t, void))
{
  uint64_t v11 = MEMORY[0x263F8EE78];
  sub_25265BA88(0, 0, 0);
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = a1 + 32;
    do
    {
      char v7 = a2(v5, *(unsigned __int8 *)(v6 + v5));
      unint64_t v9 = *(void *)(v11 + 16);
      unint64_t v8 = *(void *)(v11 + 24);
      if (v9 >= v8 >> 1) {
        sub_25265BA88(v8 > 1, v9 + 1, 1);
      }
      ++v5;
      *(void *)(v11 + 16) = v9 + 1;
      *(unsigned char *)(v11 + v9 + 32) = v7;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  return v11;
}

void *static EnergyWindowRating.allCases.getter()
{
  return &unk_2702B73B8;
}

uint64_t EnergyWindowRating.rawValue.getter()
{
  uint64_t v1 = 1146048327;
  if (*v0 != 1) {
    uint64_t v1 = 0x5453524F57;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1414743362;
  }
}

uint64_t static EnergyServices.configuration()()
{
  return MEMORY[0x270FA2498](sub_2526671BC, 0, 0);
}

uint64_t sub_2526671BC()
{
  id v1 = objc_msgSend(self, sel_sharedSession);
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v2;
  void *v2 = v0;
  v2[1] = sub_252667274;
  return sub_25265641C((uint64_t)v1);
}

uint64_t sub_252667274(uint64_t a1)
{
  unint64_t v3 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  uint64_t v4 = *(uint64_t (**)(uint64_t))(v6 + 8);
  return v4(a1);
}

uint64_t static EnergyServices.configuration(_:)(uint64_t a1)
{
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unint64_t v3 = v1;
  v3[1] = sub_25266741C;
  return sub_25265641C(a1);
}

uint64_t sub_25266741C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  unint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t static EnergyServices.gridIDLookup(forCoordinate:withSession:)(uint64_t a1, double a2, double a3)
{
  unint64_t v9 = (uint64_t (*)(uint64_t, double, double))((char *)&dword_269C12670 + dword_269C12670);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_2526675D8;
  return v9(a1, a2, a3);
}

uint64_t sub_2526675D8(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  unint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

uint64_t static EnergyServices.energyWindows(forGridID:withSession:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *unint64_t v9 = v4;
  v9[1] = sub_2526677A0;
  return sub_25263D954(a1, a2, a3, a4);
}

uint64_t sub_2526677A0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t static EnergyServices.isSupportedInRegion(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252655F44();
  LOBYTE(a2) = sub_2526678E8(a1, a2, v4);
  swift_bridgeObjectRelease();
  return a2 & 1;
}

uint64_t sub_2526678E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_2526761B0();
    sub_252675B20();
    uint64_t v6 = sub_2526761D0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_252676130() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_252676130() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t EnergyWindows.windows.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t EnergyWindows.validUntil.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for EnergyWindows(0) + 20);

  return sub_2526654B4(v3, a1);
}

uint64_t EnergyWindows.validUntil.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for EnergyWindows(0) + 20);

  return sub_2526407C4(a1, v3);
}

uint64_t (*EnergyWindows.validUntil.modify())()
{
  return nullsub_2;
}

uint64_t EnergyWindows.validFrom.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for EnergyWindows(0) + 24);

  return sub_2526654B4(v3, a1);
}

uint64_t EnergyWindows.validFrom.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for EnergyWindows(0) + 24);

  return sub_2526407C4(a1, v3);
}

uint64_t (*EnergyWindows.validFrom.modify())()
{
  return nullsub_2;
}

uint64_t EnergyWindows.message.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for EnergyWindows(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EnergyWindows.description.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for EnergyWindows(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EnergyWindows.fieldErrors.getter()
{
  type metadata accessor for EnergyWindows(0);

  return swift_bridgeObjectRetain();
}

uint64_t sub_252667C88()
{
  uint64_t result = 0x73776F646E6977;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x746E5564696C6176;
      break;
    case 2:
      uint64_t result = 0x6F724664696C6176;
      break;
    case 3:
      uint64_t result = 0x6567617373656DLL;
      break;
    case 4:
      uint64_t result = 0x7470697263736564;
      break;
    case 5:
      uint64_t result = 0x727245646C656966;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_252667D64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25266C948(a1, a2);
  *a3 = result;
  return result;
}

void sub_252667D8C(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_252667D98(uint64_t a1)
{
  unint64_t v2 = sub_25266A7F0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252667DD4(uint64_t a1)
{
  unint64_t v2 = sub_25266A7F0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t EnergyWindows.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AA40);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25266A7F0();
  sub_2526761F0();
  uint64_t v13 = *v3;
  char v12 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB30);
  sub_25266A898(&qword_26B22AA10, (void (*)(void))sub_25266A844);
  sub_2526760F0();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for EnergyWindows(0);
    LOBYTE(v13) = 1;
    sub_252675620();
    sub_25266A95C(&qword_26B22A968, MEMORY[0x263F07490]);
    sub_2526760F0();
    LOBYTE(v13) = 2;
    sub_2526760F0();
    LOBYTE(v13) = 3;
    sub_2526760E0();
    LOBYTE(v13) = 4;
    sub_2526760E0();
    uint64_t v13 = *(uint64_t *)((char *)v3 + *(int *)(v9 + 36));
    char v12 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB40);
    sub_25266A9A4(&qword_26B22AA18);
    sub_2526760F0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t EnergyWindows.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v35 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v32 - v6;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB70);
  uint64_t v34 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for EnergyWindows(0);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (uint64_t *)((char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = (uint64_t)v13 + *(int *)(v11 + 20);
  uint64_t v15 = sub_252675620();
  uint64_t v16 = *(void (**)(void))(*(void *)(v15 - 8) + 56);
  uint64_t v41 = v14;
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v16)(v14, 1, 1, v15);
  BOOL v40 = (int *)v10;
  uint64_t v39 = (uint64_t)v13 + *(int *)(v10 + 24);
  v16();
  uint64_t v17 = a1[3];
  unint64_t v38 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  sub_25266A7F0();
  unint64_t v37 = v9;
  uint64_t v18 = v42;
  sub_2526761E0();
  if (v18)
  {
    uint64_t v22 = v41;
    uint64_t v23 = v39;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
    sub_252634810(v22, &qword_26B22AAB0);
    return sub_252634810(v23, &qword_26B22AAB0);
  }
  else
  {
    uint64_t v19 = (uint64_t)v7;
    uint64_t v20 = v34;
    uint64_t v21 = (uint64_t)v35;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB30);
    char v43 = 0;
    sub_25266A898(&qword_26B22AB38, (void (*)(void))sub_25266A908);
    sub_2526760C0();
    *uint64_t v13 = v44;
    LOBYTE(v44) = 1;
    sub_25266A95C(&qword_26B22AAD8, MEMORY[0x263F07490]);
    sub_2526760C0();
    sub_2526407C4(v19, v41);
    LOBYTE(v44) = 2;
    sub_2526760C0();
    uint64_t v24 = v40;
    sub_2526407C4(v21, v39);
    LOBYTE(v44) = 3;
    uint64_t v25 = sub_2526760B0();
    uint64_t v26 = (uint64_t *)v24[7];
    *uint64_t v26 = v25;
    v26[1] = v27;
    LOBYTE(v44) = 4;
    uint64_t v28 = sub_2526760B0();
    uint64_t v29 = (uint64_t *)v24[8];
    *uint64_t v29 = v28;
    v29[1] = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB40);
    char v43 = 5;
    sub_25266A9A4(&qword_26B22AB50);
    sub_2526760C0();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v37, v36);
    *(void *)((char *)v13 + v24[9]) = v44;
    sub_25266AA7C((uint64_t)v13, v33, type metadata accessor for EnergyWindows);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
    return sub_25266C1A0((uint64_t)v13, type metadata accessor for EnergyWindows);
  }
}

uint64_t sub_252668724@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return EnergyWindows.init(from:)(a1, a2);
}

uint64_t sub_25266873C(void *a1)
{
  return EnergyWindows.encode(to:)(a1);
}

uint64_t EnergyWindow.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F088C0]), sel_init);
  uint64_t v3 = (void *)sub_252675B90();
  id v4 = objc_msgSend(v2, sel_dateFromString_, v3);

  if (v4)
  {
    sub_2526755F0();

    uint64_t v5 = sub_252675620();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a1;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_252675620();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a1;
    uint64_t v9 = 1;
  }

  return v6(v8, v9, 1, v7);
}

uint64_t EnergyWindow.endDate.getter@<X0>(uint64_t a1@<X8>)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F088C0]), sel_init);
  uint64_t v3 = (void *)sub_252675B90();
  id v4 = objc_msgSend(v2, sel_dateFromString_, v3);

  if (v4)
  {
    sub_2526755F0();

    uint64_t v5 = sub_252675620();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a1;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_252675620();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a1;
    uint64_t v9 = 1;
  }

  return v6(v8, v9, 1, v7);
}

uint64_t EnergyWindow.rating.getter@<X0>(char *a1@<X8>)
{
  uint64_t v3 = 1414743362;
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  char v6 = byte_2702B7A00;
  unint64_t v7 = 0xE400000000000000;
  uint64_t v8 = 1146048327;
  if (byte_2702B7A00 != 1)
  {
    uint64_t v8 = 0x5453524F57;
    unint64_t v7 = 0xE500000000000000;
  }
  if (byte_2702B7A00) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 1414743362;
  }
  if (byte_2702B7A00) {
    unint64_t v10 = v7;
  }
  else {
    unint64_t v10 = 0xE400000000000000;
  }
  if (v9 == v5 && v10 == v4) {
    goto LABEL_22;
  }
  char v12 = sub_252676130();
  uint64_t result = swift_bridgeObjectRelease();
  if (v12) {
    goto LABEL_23;
  }
  char v6 = byte_2702B7A01;
  if (byte_2702B7A01)
  {
    if (byte_2702B7A01 == 1)
    {
      unint64_t v14 = 0xE400000000000000;
      if (v5 != 1146048327) {
        goto LABEL_24;
      }
    }
    else
    {
      unint64_t v14 = 0xE500000000000000;
      if (v5 != 0x5453524F57) {
        goto LABEL_24;
      }
    }
    goto LABEL_21;
  }
  unint64_t v14 = 0xE400000000000000;
  if (v5 == 1414743362)
  {
LABEL_21:
    if (v14 != v4) {
      goto LABEL_24;
    }
LABEL_22:
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_23;
  }
LABEL_24:
  char v15 = sub_252676130();
  uint64_t result = swift_bridgeObjectRelease();
  if (v15) {
    goto LABEL_23;
  }
  char v6 = byte_2702B7A02;
  if (byte_2702B7A02)
  {
    if (byte_2702B7A02 == 1)
    {
      unint64_t v16 = 0xE400000000000000;
      uint64_t v3 = 1146048327;
    }
    else
    {
      unint64_t v16 = 0xE500000000000000;
      uint64_t v3 = 0x5453524F57;
    }
  }
  else
  {
    unint64_t v16 = 0xE400000000000000;
  }
  if (v3 == v5 && v16 == v4) {
    goto LABEL_22;
  }
  char v17 = sub_252676130();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v17 & 1) == 0) {
    char v6 = 2;
  }
LABEL_23:
  *a1 = v6;
  return result;
}

uint64_t EnergyWindow.start.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EnergyWindow.end.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_252668BA8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25264FCBC(*a1, *a2);
}

uint64_t sub_252668BB4()
{
  return sub_2526761D0();
}

uint64_t sub_252668C48()
{
  sub_252675B20();

  return swift_bridgeObjectRelease();
}

uint64_t sub_252668CC8()
{
  return sub_2526761D0();
}

uint64_t sub_252668D58@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25266CC14();
  *a1 = result;
  return result;
}

void sub_252668D88(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE600000000000000;
  unint64_t v4 = 0xE500000000000000;
  uint64_t v5 = 0x7472617473;
  if (v2 != 1)
  {
    uint64_t v5 = 6581861;
    unint64_t v4 = 0xE300000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x676E69746172;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_252668DD8()
{
  uint64_t v1 = 0x7472617473;
  if (*v0 != 1) {
    uint64_t v1 = 6581861;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x676E69746172;
  }
}

uint64_t sub_252668E24@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25266CC14();
  *a1 = result;
  return result;
}

void sub_252668E4C(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_252668E58(uint64_t a1)
{
  unint64_t v2 = sub_25266AA08();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252668E94(uint64_t a1)
{
  unint64_t v2 = sub_25266AA08();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t EnergyWindow.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AB68);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25266AA08();
  sub_2526761E0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v27 = 1;
  uint64_t v9 = sub_2526760D0();
  uint64_t v11 = v10;
  uint64_t v24 = v9;
  char v26 = 2;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_2526760D0();
  uint64_t v14 = v13;
  uint64_t v22 = v12;
  char v25 = 0;
  swift_bridgeObjectRetain();
  uint64_t v23 = v14;
  uint64_t v15 = sub_2526760D0();
  uint64_t v17 = v16;
  uint64_t v18 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  *a2 = v18;
  a2[1] = v17;
  uint64_t v19 = v23;
  a2[2] = v24;
  a2[3] = v11;
  a2[4] = v22;
  a2[5] = v19;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t EnergyWindow.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AA38);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  v11[1] = v1[1];
  void v11[2] = v7;
  uint64_t v8 = v1[4];
  v11[3] = v1[5];
  v11[4] = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25266AA08();
  sub_2526761F0();
  char v14 = 1;
  uint64_t v9 = v11[5];
  sub_252676100();
  if (!v9)
  {
    char v13 = 2;
    sub_252676100();
    char v12 = 0;
    sub_252676100();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_252669310@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return EnergyWindow.init(from:)(a1, a2);
}

uint64_t sub_252669328(void *a1)
{
  return EnergyWindow.encode(to:)(a1);
}

HomeServices::EnergyWindowRating_optional __swiftcall EnergyWindowRating.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_2526760A0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t sub_2526693A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25264FA74(*a1, *a2);
}

uint64_t sub_2526693AC()
{
  return sub_2526761D0();
}

uint64_t sub_25266943C()
{
  sub_252675B20();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2526694B8()
{
  return sub_2526761D0();
}

HomeServices::EnergyWindowRating_optional sub_252669544(Swift::String *a1)
{
  return EnergyWindowRating.init(rawValue:)(*a1);
}

void sub_252669550(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE400000000000000;
  unint64_t v4 = 0xE400000000000000;
  uint64_t v5 = 1146048327;
  if (v2 != 1)
  {
    uint64_t v5 = 0x5453524F57;
    unint64_t v4 = 0xE500000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 1414743362;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_25266959C()
{
  return sub_252675D60();
}

uint64_t sub_2526695FC()
{
  return sub_252675D50();
}

void sub_25266964C(void *a1@<X8>)
{
  *a1 = &unk_2702B7AD8;
}

BOOL static NetworkInternalError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t NetworkError.errorDescription.getter()
{
  uint64_t v1 = sub_2526757D0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for NetworkError(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (unint64_t *)((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25266AA7C(v0, (uint64_t)v7, type metadata accessor for NetworkError);
  unint64_t v8 = 0xD00000000000002ELL;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      unint64_t v13 = 0xD00000000000003ELL;
      unint64_t v14 = 0x800000025267A240;
      unint64_t v11 = 0;
      unint64_t v12 = 0xE000000000000000;
      sub_252675FA0();
      swift_bridgeObjectRelease();
      unint64_t v11 = 0xD000000000000015;
      unint64_t v12 = 0x800000025267A2B0;
      sub_252675C70();
      swift_bridgeObjectRelease();
      sub_252675C70();
      swift_bridgeObjectRelease();
      goto LABEL_9;
    case 2u:
      unint64_t v9 = *v7;
      unint64_t v13 = 0;
      unint64_t v14 = 0xE000000000000000;
      sub_252675FA0();
      sub_252675C70();
      unint64_t v11 = v9;
      sub_252676120();
      sub_252675C70();
      swift_bridgeObjectRelease();
      sub_252675C70();
LABEL_9:
      unint64_t v8 = v13;
      break;
    case 3u:
      return v8;
    case 4u:
      unint64_t v8 = 0xD000000000000038;
      break;
    case 5u:
      unint64_t v8 = 0xD000000000000020;
      break;
    case 6u:
      unint64_t v8 = 0xD00000000000003ALL;
      break;
    default:
      (*(void (**)(char *, unint64_t *, uint64_t))(v2 + 32))(v4, v7, v1);
      unint64_t v13 = 0;
      unint64_t v14 = 0xE000000000000000;
      sub_252675FA0();
      sub_252675C70();
      sub_252676030();
      sub_252675C70();
      unint64_t v8 = v13;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      break;
  }
  return v8;
}

unint64_t NetworkInternalError.errorDescription.getter()
{
  unint64_t v1 = 0xD000000000000027;
  if (*v0 == 1) {
    unint64_t v1 = 0xD000000000000032;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD00000000000002BLL;
  }
}

uint64_t NetworkInternalError.hash(into:)()
{
  return sub_2526761C0();
}

uint64_t NetworkInternalError.hashValue.getter()
{
  return sub_2526761D0();
}

uint64_t _s12HomeServices12EnergyWindowV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a2[5];
  if (*a1 == *a2 && a1[1] == a2[1] || (v10 = sub_252676130(), uint64_t result = 0, (v10 & 1) != 0))
  {
    if (v2 == v6 && v4 == v7 || (v12 = sub_252676130(), uint64_t result = 0, (v12 & 1) != 0))
    {
      if (v3 == v8 && v5 == v9)
      {
        return 1;
      }
      else
      {
        return sub_252676130();
      }
    }
  }
  return result;
}

uint64_t _s12HomeServices12NetworkErrorO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2526757D0();
  uint64_t v28 = *(void *)(v4 - 8);
  uint64_t v29 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for NetworkError(0);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  char v10 = (uint64_t *)((char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  unint64_t v13 = (unsigned __int8 *)&v28 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v28 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A08);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = &v19[*(int *)(v17 + 56)];
  sub_25266AA7C(a1, (uint64_t)v19, type metadata accessor for NetworkError);
  sub_25266AA7C(a2, (uint64_t)v20, type metadata accessor for NetworkError);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_25266AA7C((uint64_t)v19, (uint64_t)v13, type metadata accessor for NetworkError);
      if (swift_getEnumCaseMultiPayload() != 1) {
        goto LABEL_18;
      }
      BOOL v21 = *v13 == *v20;
      goto LABEL_8;
    case 2u:
      sub_25266AA7C((uint64_t)v19, (uint64_t)v10, type metadata accessor for NetworkError);
      if (swift_getEnumCaseMultiPayload() != 2) {
        goto LABEL_18;
      }
      BOOL v21 = *v10 == *(void *)v20;
LABEL_8:
      BOOL v22 = v21;
      goto LABEL_20;
    case 3u:
      if (swift_getEnumCaseMultiPayload() == 3) {
        goto LABEL_12;
      }
      goto LABEL_18;
    case 4u:
      if (swift_getEnumCaseMultiPayload() != 4) {
        goto LABEL_18;
      }
      goto LABEL_12;
    case 5u:
      if (swift_getEnumCaseMultiPayload() != 5) {
        goto LABEL_18;
      }
      goto LABEL_12;
    case 6u:
      if (swift_getEnumCaseMultiPayload() != 6) {
        goto LABEL_18;
      }
LABEL_12:
      sub_25266C1A0((uint64_t)v19, type metadata accessor for NetworkError);
      return 1;
    default:
      sub_25266AA7C((uint64_t)v19, (uint64_t)v15, type metadata accessor for NetworkError);
      if (swift_getEnumCaseMultiPayload())
      {
        (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v29);
LABEL_18:
        sub_252634810((uint64_t)v19, &qword_269C12A08);
        return 0;
      }
      else
      {
        uint64_t v23 = v28;
        uint64_t v24 = v20;
        uint64_t v25 = v29;
        (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v6, v24, v29);
        sub_25266A95C(&qword_269C12888, MEMORY[0x263F07A00]);
        sub_252675D40();
        sub_252675D40();
        BOOL v22 = v31 == v30;
        char v26 = *(void (**)(char *, uint64_t))(v23 + 8);
        v26(v6, v25);
        v26(v15, v25);
LABEL_20:
        sub_25266C1A0((uint64_t)v19, type metadata accessor for NetworkError);
      }
      return v22;
  }
}

uint64_t _s12HomeServices13EnergyWindowsV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_252675620();
  uint64_t v77 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = &v67[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B22A6A0);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v76 = &v67[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v67[-v10];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = &v67[-v15];
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = &v67[-v19];
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = &v67[-v22];
  MEMORY[0x270FA5388](v21);
  char v27 = &v67[-v26];
  uint64_t v28 = *a1;
  uint64_t v29 = *a2;
  if (*a1)
  {
    if (!v29) {
      return 0;
    }
    uint64_t v74 = v24;
    uint64_t v75 = v25;
    if ((sub_2526702A4(v28, v29) & 1) == 0) {
      return 0;
    }
  }
  else
  {
    uint64_t v74 = v24;
    uint64_t v75 = v25;
    if (v29) {
      return 0;
    }
  }
  uint64_t v70 = v6;
  uint64_t v30 = type metadata accessor for EnergyWindows(0);
  uint64_t v31 = *(int *)(v30 + 20);
  unint64_t v73 = a1;
  sub_2526654B4((uint64_t)a1 + v31, (uint64_t)v27);
  unint64_t v71 = (int *)v30;
  unint64_t v72 = a2;
  sub_2526654B4((uint64_t)a2 + *(int *)(v30 + 20), (uint64_t)v23);
  uint64_t v32 = (uint64_t)&v11[*(int *)(v7 + 48)];
  sub_2526654B4((uint64_t)v27, (uint64_t)v11);
  sub_2526654B4((uint64_t)v23, v32);
  uint64_t v33 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v77 + 48);
  if (v33((uint64_t)v11, 1, v4) == 1)
  {
    sub_252634810((uint64_t)v23, &qword_26B22AAB0);
    sub_252634810((uint64_t)v27, &qword_26B22AAB0);
    if (v33(v32, 1, v4) == 1)
    {
      uint64_t v69 = v33;
      sub_252634810((uint64_t)v11, &qword_26B22AAB0);
      goto LABEL_13;
    }
LABEL_11:
    uint64_t v34 = (uint64_t)v11;
LABEL_19:
    sub_252634810(v34, (uint64_t *)&unk_26B22A6A0);
    return 0;
  }
  sub_2526654B4((uint64_t)v11, (uint64_t)v20);
  if (v33(v32, 1, v4) == 1)
  {
    sub_252634810((uint64_t)v23, &qword_26B22AAB0);
    sub_252634810((uint64_t)v27, &qword_26B22AAB0);
    (*(void (**)(unsigned char *, uint64_t))(v77 + 8))(v20, v4);
    goto LABEL_11;
  }
  uint64_t v69 = v33;
  uint64_t v35 = v70;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v77 + 32))(v70, v32, v4);
  sub_25266A95C(&qword_26B22A698, MEMORY[0x263F07490]);
  int v68 = sub_252675B80();
  uint64_t v36 = v35;
  unint64_t v37 = *(void (**)(unsigned char *, uint64_t))(v77 + 8);
  v37(v36, v4);
  sub_252634810((uint64_t)v23, &qword_26B22AAB0);
  sub_252634810((uint64_t)v27, &qword_26B22AAB0);
  v37(v20, v4);
  sub_252634810((uint64_t)v11, &qword_26B22AAB0);
  if ((v68 & 1) == 0) {
    return 0;
  }
LABEL_13:
  unint64_t v38 = v71;
  uint64_t v39 = v75;
  sub_2526654B4((uint64_t)v73 + v71[6], v75);
  BOOL v40 = v72;
  sub_2526654B4((uint64_t)v72 + v38[6], (uint64_t)v16);
  uint64_t v41 = v76;
  uint64_t v42 = (uint64_t)&v76[*(int *)(v7 + 48)];
  sub_2526654B4(v39, (uint64_t)v76);
  sub_2526654B4((uint64_t)v16, v42);
  char v43 = v69;
  if (v69((uint64_t)v41, 1, v4) == 1)
  {
    sub_252634810((uint64_t)v16, &qword_26B22AAB0);
    sub_252634810(v39, &qword_26B22AAB0);
    if (v43(v42, 1, v4) == 1)
    {
      sub_252634810((uint64_t)v41, &qword_26B22AAB0);
      uint64_t v44 = v40;
      goto LABEL_23;
    }
    goto LABEL_18;
  }
  uint64_t v45 = v74;
  sub_2526654B4((uint64_t)v41, v74);
  if (v43(v42, 1, v4) == 1)
  {
    sub_252634810((uint64_t)v16, &qword_26B22AAB0);
    sub_252634810(v75, &qword_26B22AAB0);
    (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v45, v4);
LABEL_18:
    uint64_t v34 = (uint64_t)v41;
    goto LABEL_19;
  }
  uint64_t v47 = v77;
  uint64_t v48 = v70;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v77 + 32))(v70, v42, v4);
  sub_25266A95C(&qword_26B22A698, MEMORY[0x263F07490]);
  char v49 = sub_252675B80();
  uint64_t v50 = *(void (**)(unsigned char *, uint64_t))(v47 + 8);
  v50(v48, v4);
  sub_252634810((uint64_t)v16, &qword_26B22AAB0);
  sub_252634810(v75, &qword_26B22AAB0);
  v50((unsigned char *)v45, v4);
  unint64_t v38 = v71;
  uint64_t v44 = v72;
  sub_252634810((uint64_t)v41, &qword_26B22AAB0);
  if ((v49 & 1) == 0) {
    return 0;
  }
LABEL_23:
  uint64_t v51 = v38[7];
  unint64_t v52 = v73;
  uint64_t v53 = (uint64_t *)((char *)v73 + v51);
  uint64_t v54 = *(uint64_t *)((char *)v73 + v51 + 8);
  BOOL v55 = (uint64_t *)((char *)v44 + v51);
  uint64_t v56 = v55[1];
  if (v54)
  {
    if (!v56) {
      return 0;
    }
    if (*v53 != *v55 || v54 != v56)
    {
      char v57 = sub_252676130();
      uint64_t result = 0;
      if ((v57 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v56)
  {
    return 0;
  }
  uint64_t v58 = v38[8];
  uint64_t v59 = (uint64_t *)((char *)v52 + v58);
  uint64_t v60 = *(uint64_t *)((char *)v52 + v58 + 8);
  uint64_t v61 = (uint64_t *)((char *)v44 + v58);
  uint64_t v62 = v61[1];
  if (!v60)
  {
    if (v62) {
      return 0;
    }
LABEL_37:
    uint64_t v64 = v38[9];
    uint64_t v65 = *(void **)((char *)v52 + v64);
    uint64_t v66 = *(void **)((char *)v44 + v64);
    if (v65)
    {
      if (v66 && (sub_2526703B8(v65, v66) & 1) != 0) {
        return 1;
      }
    }
    else if (!v66)
    {
      return 1;
    }
    return 0;
  }
  if (!v62) {
    return 0;
  }
  if (*v59 == *v61 && v60 == v62) {
    goto LABEL_37;
  }
  char v63 = sub_252676130();
  uint64_t result = 0;
  if (v63) {
    goto LABEL_37;
  }
  return result;
}

uint64_t type metadata accessor for EnergyWindows(uint64_t a1)
{
  return sub_2526608DC(a1, (uint64_t *)&unk_26B22AC38);
}

unint64_t sub_25266A7F0()
{
  unint64_t result = qword_26B22AB00;
  if (!qword_26B22AB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22AB00);
  }
  return result;
}

unint64_t sub_25266A844()
{
  unint64_t result = qword_26B22A990;
  if (!qword_26B22A990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22A990);
  }
  return result;
}

uint64_t sub_25266A898(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B22AB30);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25266A908()
{
  unint64_t result = qword_26B22AAF8;
  if (!qword_26B22AAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22AAF8);
  }
  return result;
}

uint64_t sub_25266A95C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25266A9A4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B22AB40);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25266AA08()
{
  unint64_t result = qword_26B22AAE0;
  if (!qword_26B22AAE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22AAE0);
  }
  return result;
}

uint64_t type metadata accessor for NetworkError(uint64_t a1)
{
  return sub_2526608DC(a1, (uint64_t *)&unk_26B22AAB8);
}

uint64_t sub_25266AA7C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_25266AAE8()
{
  unint64_t result = qword_269C129C8;
  if (!qword_269C129C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C129C8);
  }
  return result;
}

unint64_t sub_25266AB40()
{
  unint64_t result = qword_269C129D0;
  if (!qword_269C129D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C129D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C129D0);
  }
  return result;
}

uint64_t sub_25266AB9C()
{
  return sub_25266A95C((unint64_t *)&qword_269C12678, (void (*)(uint64_t))type metadata accessor for NetworkError);
}

unint64_t sub_25266ABE8()
{
  unint64_t result = qword_269C129E0;
  if (!qword_269C129E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C129E0);
  }
  return result;
}

unint64_t sub_25266AC40()
{
  unint64_t result = qword_269C129E8;
  if (!qword_269C129E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C129E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for EnergyServices()
{
  return &type metadata for EnergyServices;
}

uint64_t *initializeBufferWithCopyOfBuffer for EnergyWindows(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_252675620();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v15 = a3[6];
    uint64_t v16 = (char *)v7 + v15;
    uint64_t v17 = (char *)a2 + v15;
    if (v13((char *)a2 + v15, 1, v11))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v16, v17, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v16, 0, 1, v11);
    }
    uint64_t v19 = a3[7];
    uint64_t v20 = a3[8];
    uint64_t v21 = (uint64_t *)((char *)v7 + v19);
    uint64_t v22 = (uint64_t *)((char *)a2 + v19);
    uint64_t v23 = v22[1];
    *uint64_t v21 = *v22;
    v21[1] = v23;
    uint64_t v24 = (uint64_t *)((char *)v7 + v20);
    uint64_t v25 = (uint64_t *)((char *)a2 + v20);
    uint64_t v26 = v25[1];
    *uint64_t v24 = *v25;
    v24[1] = v26;
    *(uint64_t *)((char *)v7 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t destroy for EnergyWindows(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_252675620();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 24);
  if (!v7(v8, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for EnergyWindows(void *a1, char *a2, int *a3)
{
  *a1 = *(void *)a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_252675620();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v14, v15, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  uint64_t v17 = a3[7];
  uint64_t v18 = a3[8];
  uint64_t v19 = (void *)((char *)a1 + v17);
  uint64_t v20 = &a2[v17];
  uint64_t v21 = *((void *)v20 + 1);
  void *v19 = *(void *)v20;
  v19[1] = v21;
  uint64_t v22 = (void *)((char *)a1 + v18);
  uint64_t v23 = &a2[v18];
  uint64_t v24 = *((void *)v23 + 1);
  *uint64_t v22 = *(void *)v23;
  v22[1] = v24;
  *(void *)((char *)a1 + a3[9]) = *(void *)&a2[a3[9]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for EnergyWindows(char *a1, void *a2, int *a3)
{
  *(void *)a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_252675620();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = (char *)a2 + v15;
  int v18 = v11(&a1[v15], 1, v9);
  int v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v17, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  uint64_t v21 = a3[7];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = (void *)((char *)a2 + v21);
  *(void *)uint64_t v22 = *v23;
  *((void *)v22 + 1) = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[8];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = (void *)((char *)a2 + v24);
  *(void *)uint64_t v25 = *v26;
  *((void *)v25 + 1) = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[9]] = *(void *)((char *)a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *initializeWithTake for EnergyWindows(void *a1, char *a2, int *a3)
{
  *a1 = *(void *)a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_252675620();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = &a2[v13];
  if (v11(&a2[v13], 1, v9))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v14, v15, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  uint64_t v17 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)((char *)a1 + v17) = *(_OWORD *)&a2[v17];
  *(void *)((char *)a1 + a3[9]) = *(void *)&a2[a3[9]];
  return a1;
}

char *assignWithTake for EnergyWindows(char *a1, void *a2, int *a3)
{
  *(void *)a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_252675620();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = (char *)a2 + v15;
  int v18 = v11(&a1[v15], 1, v9);
  int v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v16, v17, v9);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v16, v17, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
LABEL_13:
  uint64_t v21 = a3[7];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = (void *)((char *)a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *(void *)uint64_t v22 = v25;
  *((void *)v22 + 1) = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[8];
  char v27 = &a1[v26];
  uint64_t v28 = (void *)((char *)a2 + v26);
  uint64_t v30 = *v28;
  uint64_t v29 = v28[1];
  *(void *)char v27 = v30;
  *((void *)v27 + 1) = v29;
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[9]] = *(void *)((char *)a2 + a3[9]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EnergyWindows(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25266BA40);
}

uint64_t sub_25266BA40(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    int v12 = (char *)a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for EnergyWindows(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25266BB14);
}

void *sub_25266BB14(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *unint64_t result = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22AAB0);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_25266BBC0()
{
  sub_252664AD8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t destroy for EnergyWindow()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for EnergyWindow(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for EnergyWindow(void *a1, void *a2)
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
  return a1;
}

void *assignWithTake for EnergyWindow(void *a1, void *a2)
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
  return a1;
}

uint64_t getEnumTagSinglePayload for EnergyWindow(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EnergyWindow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EnergyWindow()
{
  return &type metadata for EnergyWindow;
}

ValueMetadata *type metadata accessor for EnergyWindowRating()
{
  return &type metadata for EnergyWindowRating;
}

uint64_t *initializeBufferWithCopyOfBuffer for NetworkError(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = sub_2526757D0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for NetworkError(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (!result)
  {
    uint64_t v3 = sub_2526757D0();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *initializeWithCopy for NetworkError(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_2526757D0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithCopy for NetworkError(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25266C1A0((uint64_t)a1, type metadata accessor for NetworkError);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_2526757D0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_25266C1A0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *initializeWithTake for NetworkError(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_2526757D0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for NetworkError(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25266C1A0((uint64_t)a1, type metadata accessor for NetworkError);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_2526757D0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for NetworkError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25266C3E0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_25266C3F0()
{
  uint64_t result = sub_2526757D0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkInternalError()
{
  return &type metadata for NetworkInternalError;
}

unsigned char *_s12HomeServices18EnergyWindowRatingOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25266C56CLL);
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

ValueMetadata *type metadata accessor for EnergyWindow.CodingKeys()
{
  return &type metadata for EnergyWindow.CodingKeys;
}

uint64_t getEnumTagSinglePayload for EnergyWindows.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for EnergyWindows.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x25266C700);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EnergyWindows.CodingKeys()
{
  return &type metadata for EnergyWindows.CodingKeys;
}

unint64_t sub_25266C73C()
{
  unint64_t result = qword_269C129F0;
  if (!qword_269C129F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C129F0);
  }
  return result;
}

unint64_t sub_25266C794()
{
  unint64_t result = qword_269C129F8;
  if (!qword_269C129F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C129F8);
  }
  return result;
}

unint64_t sub_25266C7EC()
{
  unint64_t result = qword_26B22AAF0;
  if (!qword_26B22AAF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22AAF0);
  }
  return result;
}

unint64_t sub_25266C844()
{
  unint64_t result = qword_26B22AAE8;
  if (!qword_26B22AAE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22AAE8);
  }
  return result;
}

unint64_t sub_25266C89C()
{
  unint64_t result = qword_26B22AB10;
  if (!qword_26B22AB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22AB10);
  }
  return result;
}

unint64_t sub_25266C8F4()
{
  unint64_t result = qword_26B22AB08;
  if (!qword_26B22AB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22AB08);
  }
  return result;
}

uint64_t sub_25266C948(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x73776F646E6977 && a2 == 0xE700000000000000;
  if (v2 || (sub_252676130() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E5564696C6176 && a2 == 0xEA00000000006C69 || (sub_252676130() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F724664696C6176 && a2 == 0xE90000000000006DLL || (sub_252676130() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000 || (sub_252676130() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7470697263736564 && a2 == 0xEB000000006E6F69 || (sub_252676130() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x727245646C656966 && a2 == 0xEB0000000073726FLL)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_252676130();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_25266CC14()
{
  unint64_t v0 = sub_2526760A0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_25266CC60()
{
  unint64_t result = qword_269C12A00;
  if (!qword_269C12A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12A00);
  }
  return result;
}

uint64_t HSIntervalBlockPayload.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for HSIntervalBlockPayload(0) + 48);
  uint64_t v4 = sub_252675860();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for HSIntervalBlockPayload(uint64_t a1)
{
  return sub_2526608DC(a1, (uint64_t *)&unk_269C12A70);
}

uint64_t HSIntervalBlockPayload.unknownFields.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for HSIntervalBlockPayload(0) + 48);
  uint64_t v4 = sub_252675860();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*HSIntervalBlockPayload.unknownFields.modify())()
{
  return nullsub_2;
}

uint64_t sub_25266CE0C@<X0>(uint64_t a1@<X8>)
{
  return sub_25266CFE8((uint64_t (*)(void))sub_2526748E8, a1);
}

uint64_t sub_25266CE24@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25266D038(a1, (uint64_t (*)(void))sub_2526748E8, a2);
}

uint64_t sub_25266CE3C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25266E584();

  return MEMORY[0x270F44AF0](a1, a2, v4);
}

uint64_t sub_25266CE88(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25266E530();

  return MEMORY[0x270F44AF0](a1, a2, v4);
}

unint64_t sub_25266CED8@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = result < 2;
  *(unsigned char *)(a2 + 9) = 0;
  return result;
}

uint64_t sub_25266CEF0()
{
  if (v0[8]) {
    return *(void *)v0 != 0;
  }
  else {
    return *(void *)v0;
  }
}

void *sub_25266CF0C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result >= 2uLL;
  *(void *)a2 = *result;
  char v3 = !v2;
  *(unsigned char *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 9) = 0;
  return result;
}

void sub_25266CF28(void *a1@<X8>)
{
  uint64_t v2 = *v1;
  if (*((unsigned char *)v1 + 8)) {
    uint64_t v2 = *v1 != 0;
  }
  *a1 = v2;
}

uint64_t sub_25266CF48(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25266E4DC();

  return MEMORY[0x270F44AF0](a1, a2, v4);
}

BOOL sub_25266CF94(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  if (*((unsigned char *)a1 + 8)) {
    uint64_t v2 = *a1 != 0;
  }
  uint64_t v3 = *a2 != 0;
  if (!*((unsigned char *)a2 + 8)) {
    uint64_t v3 = *a2;
  }
  return v2 == v3;
}

uint64_t sub_25266CFD0@<X0>(uint64_t a1@<X8>)
{
  return sub_25266CFE8((uint64_t (*)(void))sub_252674B94, a1);
}

uint64_t sub_25266CFE8@<X0>(uint64_t (*a1)(void)@<X3>, uint64_t a2@<X8>)
{
  uint64_t result = a1();
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 9) = v5 & 1;
  return result;
}

uint64_t sub_25266D020@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25266D038(a1, (uint64_t (*)(void))sub_252674B94, a2);
}

uint64_t sub_25266D038@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X8>)
{
  uint64_t result = a2(*a1);
  *(void *)a3 = result;
  *(unsigned char *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 9) = v6 & 1;
  return result;
}

uint64_t sub_25266D074(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_2526748FC();

  return MEMORY[0x270F44AF0](a1, a2, v4);
}

uint64_t HSIntervalBlockPayload.init()@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0xE000000000000000;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0xE000000000000000;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0xE000000000000000;
  *(void *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 72) = 1;
  *(void *)(a1 + 80) = 0;
  *(unsigned char *)(a1 + 88) = 1;
  *(void *)(a1 + 96) = 0;
  *(unsigned char *)(a1 + 104) = 1;
  *(void *)(a1 + 112) = MEMORY[0x263F8EE78];
  uint64_t v2 = (int *)type metadata accessor for HSIntervalBlockPayload(0);
  sub_252675850();
  uint64_t v3 = a1 + v2[13];
  uint64_t v4 = sub_252675830();
  BOOL v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))v7)((void *)(v4 - 8), v3, 1, 1, v4);
  v7(a1 + v2[14], 1, 1, v4);
  uint64_t v5 = a1 + v2[15];

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v7)(v5, 1, 1, v4);
}

void sub_25266D1EC()
{
  qword_269C12C78 = (uint64_t)&unk_2702B7B00;
}

uint64_t sub_25266D200@<X0>(void *a1@<X8>)
{
  return sub_25264EBA4(&qword_269C12460, &qword_269C12C78, a1);
}

void sub_25266D224()
{
  qword_269C12C80 = (uint64_t)&unk_2702B7B60;
}

uint64_t sub_25266D238@<X0>(void *a1@<X8>)
{
  return sub_25264EBA4(&qword_269C12468, &qword_269C12C80, a1);
}

void sub_25266D25C()
{
  qword_269C12C88 = (uint64_t)&unk_2702B7BA0;
}

uint64_t sub_25266D270@<X0>(void *a1@<X8>)
{
  return sub_25264EBA4(&qword_269C12470, &qword_269C12C88, a1);
}

void sub_25266D294()
{
  qword_269C12C90 = (uint64_t)&unk_2702B7BE0;
}

uint64_t sub_25266D2A8@<X0>(void *a1@<X8>)
{
  return sub_25264EBA4(&qword_269C12478, &qword_269C12C90, a1);
}

unint64_t static HSIntervalBlockPayload.protoMessageName.getter()
{
  return 0xD000000000000014;
}

uint64_t sub_25266D2E8()
{
  uint64_t v0 = sub_2526759C0();
  __swift_allocate_value_buffer(v0, qword_269C12A10);
  __swift_project_value_buffer(v0, (uint64_t)qword_269C12A10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12718);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C12720) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_252678510;
  unint64_t v4 = v28 + v3;
  unint64_t v5 = v28 + v3 + v1[14];
  *(void *)(v28 + v3) = 1;
  *(void *)unint64_t v5 = "utilityID";
  *(void *)(v5 + 8) = 9;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_2526759A0();
  int v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v28 + v3 + v2 + v1[14];
  *(void *)(v4 + v2) = 2;
  *(void *)unint64_t v9 = "subscriptionID";
  *(void *)(v9 + 8) = 14;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  uint64_t v10 = (void *)(v28 + v3 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  void *v10 = 3;
  *(void *)uint64_t v11 = "usagePointID";
  *((void *)v11 + 1) = 12;
  v11[16] = 2;
  v8();
  int v12 = (void *)(v28 + v3 + 3 * v2);
  int v13 = (char *)v12 + v1[14];
  *int v12 = 4;
  *(void *)int v13 = "meterID";
  *((void *)v13 + 1) = 7;
  v13[16] = 2;
  v8();
  uint64_t v14 = (void *)(v28 + v3 + 4 * v2);
  uint64_t v15 = (char *)v14 + v1[14];
  void *v14 = 5;
  *(void *)uint64_t v15 = "sourceTime";
  *((void *)v15 + 1) = 10;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v28 + v3 + 5 * v2);
  uint64_t v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 6;
  *(void *)uint64_t v17 = "start";
  *((void *)v17 + 1) = 5;
  v17[16] = 2;
  v8();
  int v18 = (void *)(v28 + v3 + 6 * v2);
  int v19 = (char *)v18 + v1[14];
  *int v18 = 7;
  *(void *)int v19 = "end";
  *((void *)v19 + 1) = 3;
  v19[16] = 2;
  v8();
  uint64_t v20 = (void *)(v28 + v3 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  void *v20 = 8;
  *(void *)uint64_t v21 = "unit";
  *((void *)v21 + 1) = 4;
  v21[16] = 2;
  v8();
  uint64_t v22 = v28 + v3 + 8 * v2 + v1[14];
  *(void *)(v4 + 8 * v2) = 9;
  *(void *)uint64_t v22 = "commodity";
  *(void *)(v22 + 8) = 9;
  *(unsigned char *)(v22 + 16) = 2;
  v8();
  uint64_t v23 = (void *)(v28 + v3 + 9 * v2);
  uint64_t v24 = (char *)v23 + v1[14];
  void *v23 = 10;
  *(void *)uint64_t v24 = "flowDirection";
  *((void *)v24 + 1) = 13;
  v24[16] = 2;
  v8();
  uint64_t v25 = (void *)(v28 + v3 + 10 * v2);
  uint64_t v26 = (char *)v25 + v1[14];
  *uint64_t v25 = 11;
  *(void *)uint64_t v26 = "readings";
  *((void *)v26 + 1) = 8;
  v26[16] = 2;
  v8();
  return sub_2526759B0();
}

uint64_t static HSIntervalBlockPayload._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_269C12480 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2526759C0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269C12A10);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t HSIntervalBlockPayload.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_2526758A0();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 3:
        case 4:
          sub_2526758E0();
          break;
        case 5:
          sub_25266D9E4();
          break;
        case 6:
          sub_25266DA94();
          break;
        case 7:
          sub_25266DB44();
          break;
        case 8:
          sub_25266E4DC();
          goto LABEL_12;
        case 9:
          sub_25266E530();
          goto LABEL_12;
        case 10:
          sub_25266E584();
LABEL_12:
          sub_2526758C0();
          break;
        case 11:
          type metadata accessor for HSIntervalBlockPayload.IntervalReading(0);
          sub_25267111C(&qword_269C12A40, (void (*)(uint64_t))type metadata accessor for HSIntervalBlockPayload.IntervalReading);
          sub_2526758F0();
          break;
        default:
          break;
      }
      uint64_t result = sub_2526758A0();
    }
  }
  return result;
}

uint64_t sub_25266D9E4()
{
  return sub_252675900();
}

uint64_t sub_25266DA94()
{
  return sub_252675900();
}

uint64_t sub_25266DB44()
{
  return sub_252675900();
}

uint64_t HSIntervalBlockPayload.traverse<A>(visitor:)()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = sub_252675970(), !v1))
  {
    unint64_t v5 = v0[3];
    uint64_t v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    }
    if (!v6 || (uint64_t result = sub_252675970(), !v1))
    {
      unint64_t v7 = v0[5];
      uint64_t v8 = HIBYTE(v7) & 0xF;
      if ((v7 & 0x2000000000000000) == 0) {
        uint64_t v8 = v0[4] & 0xFFFFFFFFFFFFLL;
      }
      if (!v8 || (uint64_t result = sub_252675970(), !v1))
      {
        unint64_t v9 = v0[7];
        uint64_t v10 = HIBYTE(v9) & 0xF;
        if ((v9 & 0x2000000000000000) == 0) {
          uint64_t v10 = v0[6] & 0xFFFFFFFFFFFFLL;
        }
        if (!v10 || (uint64_t result = sub_252675970(), !v1))
        {
          uint64_t result = sub_25266DEE8((uint64_t)v0);
          if (!v1)
          {
            sub_25266E0E4((uint64_t)v0);
            sub_25266E2E0((uint64_t)v0);
            if (v0[8])
            {
              sub_25266E4DC();
              sub_252675950();
            }
            if (v0[10])
            {
              sub_25266E530();
              sub_252675950();
            }
            if (v0[12])
            {
              sub_25266E584();
              sub_252675950();
            }
            if (*(void *)(v0[14] + 16))
            {
              type metadata accessor for HSIntervalBlockPayload.IntervalReading(0);
              sub_25267111C(&qword_269C12A40, (void (*)(uint64_t))type metadata accessor for HSIntervalBlockPayload.IntervalReading);
              sub_252675980();
            }
            type metadata accessor for HSIntervalBlockPayload(0);
            return sub_252675840();
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_25266DEE8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252675830();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for HSIntervalBlockPayload(0);
  sub_252674950(a1 + *(int *)(v9 + 52), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_252634810((uint64_t)v4, &qword_269C12A68);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  sub_25267111C(&qword_269C12B48, MEMORY[0x263F502F0]);
  sub_252675990();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25266E0E4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252675830();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for HSIntervalBlockPayload(0);
  sub_252674950(a1 + *(int *)(v9 + 56), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_252634810((uint64_t)v4, &qword_269C12A68);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  sub_25267111C(&qword_269C12B48, MEMORY[0x263F502F0]);
  sub_252675990();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25266E2E0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252675830();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for HSIntervalBlockPayload(0);
  sub_252674950(a1 + *(int *)(v9 + 60), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_252634810((uint64_t)v4, &qword_269C12A68);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  sub_25267111C(&qword_269C12B48, MEMORY[0x263F502F0]);
  sub_252675990();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_25266E4DC()
{
  unint64_t result = qword_269C12A28;
  if (!qword_269C12A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12A28);
  }
  return result;
}

unint64_t sub_25266E530()
{
  unint64_t result = qword_269C12A30;
  if (!qword_269C12A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12A30);
  }
  return result;
}

unint64_t sub_25266E584()
{
  unint64_t result = qword_269C12A38;
  if (!qword_269C12A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12A38);
  }
  return result;
}

uint64_t type metadata accessor for HSIntervalBlockPayload.IntervalReading(uint64_t a1)
{
  return sub_2526608DC(a1, (uint64_t *)&unk_269C12A88);
}

uint64_t HSIntervalBlockPayload.hashValue.getter()
{
  return sub_2526761D0();
}

uint64_t sub_25266E684@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0xE000000000000000;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0xE000000000000000;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0xE000000000000000;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0xE000000000000000;
  *(void *)(a2 + 64) = 0;
  *(unsigned char *)(a2 + 72) = 1;
  *(void *)(a2 + 80) = 0;
  *(unsigned char *)(a2 + 88) = 1;
  *(unsigned char *)(a2 + 104) = 1;
  *(void *)(a2 + 112) = MEMORY[0x263F8EE78];
  *(void *)(a2 + 96) = 0;
  sub_252675850();
  uint64_t v4 = a2 + a1[13];
  uint64_t v5 = sub_252675830();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))v8)((void *)(v5 - 8), v4, 1, 1, v5);
  v8(a2 + a1[14], 1, 1, v5);
  uint64_t v6 = a2 + a1[15];

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v8)(v6, 1, 1, v5);
}

unint64_t sub_25266E7A8()
{
  return 0xD000000000000014;
}

uint64_t sub_25266E7C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 48);
  uint64_t v5 = sub_252675860();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_25266E834(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 48);
  uint64_t v5 = sub_252675860();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*sub_25266E8A4())()
{
  return nullsub_2;
}

uint64_t sub_25266E8C8()
{
  return HSIntervalBlockPayload.decodeMessage<A>(decoder:)();
}

uint64_t sub_25266E8E0()
{
  return HSIntervalBlockPayload.traverse<A>(visitor:)();
}

uint64_t sub_25266E8F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25267111C(&qword_269C12B60, (void (*)(uint64_t))type metadata accessor for HSIntervalBlockPayload);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25266E974@<X0>(uint64_t a1@<X8>)
{
  return sub_25264F1B0(&qword_269C12480, (uint64_t)qword_269C12A10, a1);
}

uint64_t sub_25266E998(uint64_t a1)
{
  uint64_t v2 = sub_25267111C(&qword_269C12A58, (void (*)(uint64_t))type metadata accessor for HSIntervalBlockPayload);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25266EA08()
{
  sub_25267111C(&qword_269C12A58, (void (*)(uint64_t))type metadata accessor for HSIntervalBlockPayload);

  return sub_252675930();
}

uint64_t sub_25266EA8C()
{
  uint64_t v0 = sub_2526759C0();
  __swift_allocate_value_buffer(v0, qword_269C12C98);
  __swift_project_value_buffer(v0, (uint64_t)qword_269C12C98);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12718);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C12720) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_252678520;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 0;
  *(void *)unint64_t v6 = "FLOW_DIRECTION_UNSPECIFIED";
  *(void *)(v6 + 8) = 26;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_2526759A0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 1;
  *(void *)unint64_t v10 = "DELIVERED";
  *(void *)(v10 + 8) = 9;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  int v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 2;
  *(void *)int v12 = "REVERSE";
  *((void *)v12 + 1) = 7;
  v12[16] = 2;
  v9();
  int v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *int v13 = 3;
  *(void *)uint64_t v14 = "NET";
  *((void *)v14 + 1) = 3;
  v14[16] = 2;
  v9();
  return sub_2526759B0();
}

uint64_t sub_25266ECBC@<X0>(uint64_t a1@<X8>)
{
  return sub_25264F1B0(&qword_269C12488, (uint64_t)qword_269C12C98, a1);
}

uint64_t sub_25266ECE0()
{
  uint64_t v0 = sub_2526759C0();
  __swift_allocate_value_buffer(v0, qword_269C12CB0);
  __swift_project_value_buffer(v0, (uint64_t)qword_269C12CB0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12718);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C12720) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_252676970;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *unint64_t v5 = 0;
  *(void *)unint64_t v6 = "COMMODITY_UNSPECIFIED";
  *(void *)(v6 + 8) = 21;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_2526759A0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 1;
  *(void *)unint64_t v10 = "ELECTRIC";
  *((void *)v10 + 1) = 8;
  v10[16] = 2;
  v9();
  return sub_2526759B0();
}

uint64_t sub_25266EE98@<X0>(uint64_t a1@<X8>)
{
  return sub_25264F1B0(&qword_269C12490, (uint64_t)qword_269C12CB0, a1);
}

uint64_t sub_25266EEBC()
{
  uint64_t v0 = sub_2526759C0();
  __swift_allocate_value_buffer(v0, qword_269C12CC8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269C12CC8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12718);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C12720) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_252676970;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *unint64_t v5 = 0;
  *(void *)unint64_t v6 = "UNIT_UNSPECIFIED";
  *(void *)(v6 + 8) = 16;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_2526759A0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 1;
  *(void *)unint64_t v10 = "KWH";
  *((void *)v10 + 1) = 3;
  v10[16] = 2;
  v9();
  return sub_2526759B0();
}

uint64_t sub_25266F074@<X0>(uint64_t a1@<X8>)
{
  return sub_25264F1B0(&qword_269C12498, (uint64_t)qword_269C12CC8, a1);
}

uint64_t sub_25266F098()
{
  uint64_t v0 = sub_2526759C0();
  __swift_allocate_value_buffer(v0, qword_269C12CE0);
  __swift_project_value_buffer(v0, (uint64_t)qword_269C12CE0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12718);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C12720) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_252678520;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "value";
  *(void *)(v6 + 8) = 5;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_2526759A0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "qualities";
  *(void *)(v10 + 8) = 9;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  int v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)int v12 = "start";
  *((void *)v12 + 1) = 5;
  v12[16] = 2;
  v9();
  int v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *int v13 = 4;
  *(void *)uint64_t v14 = "end";
  *((void *)v14 + 1) = 3;
  v14[16] = 2;
  v9();
  return sub_2526759B0();
}

uint64_t sub_25266F2D0()
{
  uint64_t result = sub_2526758A0();
  uint64_t v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          uint64_t v4 = v3;
          sub_2526758D0();
          goto LABEL_5;
        case 2:
          sub_2526748FC();
          uint64_t v4 = v3;
          sub_2526758B0();
          goto LABEL_5;
        case 3:
          uint64_t v4 = v3;
          sub_25266F40C();
          goto LABEL_5;
        case 4:
          uint64_t v4 = v3;
          sub_25266F4BC();
LABEL_5:
          uint64_t v3 = v4;
          break;
        default:
          break;
      }
      uint64_t result = sub_2526758A0();
    }
  }
  return result;
}

uint64_t sub_25266F40C()
{
  return sub_252675900();
}

uint64_t sub_25266F4BC()
{
  return sub_252675900();
}

uint64_t sub_25266F56C()
{
  if (*(double *)v0 == 0.0 || (uint64_t result = sub_252675960(), !v1))
  {
    if (!*(void *)(*(void *)(v0 + 8) + 16) || (sub_2526748FC(), uint64_t result = sub_252675940(), !v1))
    {
      uint64_t result = sub_25266F690(v0);
      if (!v1)
      {
        sub_25266F88C(v0);
        type metadata accessor for HSIntervalBlockPayload.IntervalReading(0);
        return sub_252675840();
      }
    }
  }
  return result;
}

uint64_t sub_25266F690(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252675830();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for HSIntervalBlockPayload.IntervalReading(0);
  sub_252674950(a1 + *(int *)(v9 + 28), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_252634810((uint64_t)v4, &qword_269C12A68);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  sub_25267111C(&qword_269C12B48, MEMORY[0x263F502F0]);
  sub_252675990();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25266F88C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252675830();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for HSIntervalBlockPayload.IntervalReading(0);
  sub_252674950(a1 + *(int *)(v9 + 32), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_252634810((uint64_t)v4, &qword_269C12A68);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  sub_25267111C(&qword_269C12B48, MEMORY[0x263F502F0]);
  sub_252675990();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25266FA8C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = MEMORY[0x263F8EE78];
  *a2 = 0;
  a2[1] = v4;
  sub_252675850();
  uint64_t v5 = (char *)a2 + *(int *)(a1 + 28);
  uint64_t v6 = sub_252675830();
  uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  ((void (*)(void *__return_ptr, char *, uint64_t, uint64_t, uint64_t))v9)((void *)(v6 - 8), v5, 1, 1, v6);
  uint64_t v7 = (char *)a2 + *(int *)(a1 + 32);

  return v9(v7, 1, 1, v6);
}

unint64_t sub_25266FB5C()
{
  return 0xD000000000000024;
}

uint64_t sub_25266FB78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 24);
  uint64_t v5 = sub_252675860();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_25266FBE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 24);
  uint64_t v5 = sub_252675860();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*sub_25266FC58())()
{
  return nullsub_2;
}

uint64_t sub_25266FC7C()
{
  return sub_25266F2D0();
}

uint64_t sub_25266FC94()
{
  return sub_25266F56C();
}

uint64_t sub_25266FCAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25267111C(&qword_269C12B38, (void (*)(uint64_t))type metadata accessor for HSIntervalBlockPayload.IntervalReading);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25266FD28@<X0>(uint64_t a1@<X8>)
{
  return sub_25264F1B0(&qword_269C124A0, (uint64_t)qword_269C12CE0, a1);
}

uint64_t sub_25266FD4C(uint64_t a1)
{
  uint64_t v2 = sub_25267111C(&qword_269C12A40, (void (*)(uint64_t))type metadata accessor for HSIntervalBlockPayload.IntervalReading);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25266FDB8()
{
  sub_25267111C(&qword_269C12A40, (void (*)(uint64_t))type metadata accessor for HSIntervalBlockPayload.IntervalReading);

  return sub_252675930();
}

uint64_t sub_25266FE34()
{
  uint64_t v0 = sub_2526759C0();
  __swift_allocate_value_buffer(v0, qword_269C12CF8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269C12CF8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C12718);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C12720) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_252678520;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 0;
  *(void *)unint64_t v6 = "QUALITY_UNSPECIFIED";
  *(void *)(v6 + 8) = 19;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_2526759A0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 1;
  *(void *)unint64_t v10 = "ESTIMATED";
  *(void *)(v10 + 8) = 9;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  int v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 2;
  *(void *)int v12 = "VALIDATED";
  *((void *)v12 + 1) = 9;
  v12[16] = 2;
  v9();
  int v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *int v13 = 3;
  *(void *)uint64_t v14 = "RAW";
  *((void *)v14 + 1) = 3;
  v14[16] = 2;
  v9();
  return sub_2526759B0();
}

uint64_t sub_252670068@<X0>(uint64_t a1@<X8>)
{
  return sub_25264F1B0(qword_269C124A8, (uint64_t)qword_269C12CF8, a1);
}

uint64_t sub_25267008C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HSIntervalBlockPayload.IntervalReading(0) - 8;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (double *)((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  unint64_t v10 = (char *)&v19 - v9;
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
        sub_2526749B8(a1 + v12, (uint64_t)v10);
        sub_2526749B8(a2 + v12, (uint64_t)v7);
        char v15 = sub_2526740C8((uint64_t)v10, v7);
        sub_252674A1C((uint64_t)v7);
        sub_252674A1C((uint64_t)v10);
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

uint64_t sub_2526701EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    unint64_t v3 = (uint64_t *)(a1 + 32);
    for (uint64_t i = (unsigned char *)(a2 + 40); ; i += 16)
    {
      uint64_t v6 = *v3;
      v3 += 2;
      uint64_t v5 = v6;
      uint64_t v7 = *((void *)i - 1);
      if (*i == 1)
      {
        switch(v7)
        {
          case 1:
            if (v5 != 1) {
              return 0;
            }
            goto LABEL_6;
          case 2:
            if (v5 != 2) {
              return 0;
            }
            goto LABEL_6;
          case 3:
            if (v5 != 3) {
              return 0;
            }
            goto LABEL_6;
          default:
            if (v5) {
              return 0;
            }
            goto LABEL_6;
        }
      }
      if (v5 != v7) {
        break;
      }
LABEL_6:
      if (!--v2) {
        return 1;
      }
    }
    return 0;
  }
  return 1;
}

uint64_t sub_2526702A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2)
  {
    uint64_t v3 = a2;
    if (a1 != a2)
    {
      uint64_t v4 = 0;
      uint64_t v17 = a1;
      while (1)
      {
        uint64_t v5 = *(void *)(a1 + v4 + 48);
        uint64_t v6 = *(void *)(a1 + v4 + 56);
        uint64_t v7 = *(void *)(a1 + v4 + 64);
        uint64_t v8 = *(void *)(a1 + v4 + 72);
        uint64_t v9 = *(void *)(v3 + v4 + 48);
        uint64_t v10 = *(void *)(v3 + v4 + 56);
        uint64_t v11 = *(void *)(v3 + v4 + 64);
        uint64_t v12 = *(void *)(v3 + v4 + 72);
        BOOL v13 = *(void *)(a1 + v4 + 32) == *(void *)(v3 + v4 + 32)
           && *(void *)(a1 + v4 + 40) == *(void *)(v3 + v4 + 40);
        if (!v13 && (sub_252676130() & 1) == 0) {
          break;
        }
        BOOL v14 = v5 == v9 && v6 == v10;
        if (!v14 && (sub_252676130() & 1) == 0) {
          break;
        }
        BOOL v15 = v7 == v11 && v8 == v12;
        if (!v15 && (sub_252676130() & 1) == 0) {
          break;
        }
        v4 += 48;
        --v2;
        a1 = v17;
        uint64_t v3 = a2;
        if (!v2) {
          return 1;
        }
      }
      return 0;
    }
  }
  return 1;
}

uint64_t sub_2526703B8(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_252676130(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    uint64_t v9 = a1 + 7;
    for (uint64_t i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_252676130() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t _s12HomeServices22HSIntervalBlockPayloadV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252675860();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v94 = &v85[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v93 = &v85[-v8];
  uint64_t v103 = sub_252675830();
  uint64_t v105 = *(void *)(v103 - 8);
  MEMORY[0x270FA5388](v103);
  uint64_t v100 = &v85[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12B50);
  uint64_t v10 = MEMORY[0x270FA5388](v104);
  uint64_t v98 = &v85[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v102 = &v85[-v13];
  MEMORY[0x270FA5388](v12);
  BOOL v15 = &v85[-v14];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v95 = &v85[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  unint64_t v96 = &v85[-v20];
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v97 = &v85[-v22];
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v99 = &v85[-v24];
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  char v27 = &v85[-v26];
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v101 = &v85[-v29];
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v32 = &v85[-v31];
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  uint64_t v35 = &v85[-v34];
  MEMORY[0x270FA5388](v33);
  unint64_t v37 = &v85[-v36];
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)
    || (char v38 = 0, (sub_252676130() & 1) != 0))
  {
    if (*(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24)
      || (char v38 = 0, (sub_252676130() & 1) != 0))
    {
      if (*(void *)(a1 + 32) == *(void *)(a2 + 32) && *(void *)(a1 + 40) == *(void *)(a2 + 40)
        || (char v38 = 0, (sub_252676130() & 1) != 0))
      {
        if (*(void *)(a1 + 48) == *(void *)(a2 + 48) && *(void *)(a1 + 56) == *(void *)(a2 + 56)
          || (char v38 = 0, (sub_252676130() & 1) != 0))
        {
          uint64_t v88 = v4;
          uint64_t v92 = v27;
          uint64_t v90 = v5;
          uint64_t v39 = type metadata accessor for HSIntervalBlockPayload(0);
          sub_252674950(a1 + *(int *)(v39 + 52), (uint64_t)v37);
          uint64_t v91 = v39;
          sub_252674950(a2 + *(int *)(v39 + 52), (uint64_t)v35);
          uint64_t v40 = (uint64_t)&v15[*(int *)(v104 + 48)];
          sub_252674950((uint64_t)v37, (uint64_t)v15);
          sub_252674950((uint64_t)v35, v40);
          uint64_t v42 = v105 + 48;
          uint64_t v41 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v105 + 48);
          uint64_t v43 = v103;
          if (v41((uint64_t)v15, 1, v103) == 1)
          {
            sub_252634810((uint64_t)v35, &qword_269C12A68);
            sub_252634810((uint64_t)v37, &qword_269C12A68);
            if (v41(v40, 1, v43) == 1)
            {
              uint64_t v44 = v43;
              sub_252634810((uint64_t)v15, &qword_269C12A68);
              goto LABEL_20;
            }
          }
          else
          {
            sub_252674950((uint64_t)v15, (uint64_t)v32);
            uint64_t v89 = v42;
            uint64_t v87 = v41;
            if (v41(v40, 1, v43) != 1)
            {
              uint64_t v46 = v105;
              uint64_t v47 = v100;
              (*(void (**)(unsigned char *, uint64_t, uint64_t))(v105 + 32))(v100, v40, v43);
              sub_25267111C(&qword_269C12B58, MEMORY[0x263F502F0]);
              int v86 = sub_252675B80();
              uint64_t v48 = *(void (**)(unsigned char *, uint64_t))(v46 + 8);
              v48(v47, v43);
              sub_252634810((uint64_t)v35, &qword_269C12A68);
              sub_252634810((uint64_t)v37, &qword_269C12A68);
              v48(v32, v43);
              sub_252634810((uint64_t)v15, &qword_269C12A68);
              uint64_t v44 = v43;
              uint64_t v42 = v89;
              uint64_t v41 = v87;
              if ((v86 & 1) == 0) {
                goto LABEL_34;
              }
LABEL_20:
              uint64_t v49 = v91;
              uint64_t v50 = v101;
              sub_252674950(a1 + *(int *)(v91 + 56), (uint64_t)v101);
              uint64_t v51 = (uint64_t)v92;
              sub_252674950(a2 + *(int *)(v49 + 56), (uint64_t)v92);
              unint64_t v52 = v102;
              uint64_t v53 = (uint64_t)&v102[*(int *)(v104 + 48)];
              sub_252674950((uint64_t)v50, (uint64_t)v102);
              sub_252674950(v51, v53);
              if (v41((uint64_t)v52, 1, v44) == 1)
              {
                sub_252634810(v51, &qword_269C12A68);
                sub_252634810((uint64_t)v50, &qword_269C12A68);
                if (v41(v53, 1, v44) == 1)
                {
                  sub_252634810((uint64_t)v52, &qword_269C12A68);
                  uint64_t v49 = v91;
LABEL_27:
                  uint64_t v61 = v97;
                  sub_252674950(a1 + *(int *)(v49 + 60), (uint64_t)v97);
                  uint64_t v62 = v96;
                  sub_252674950(a2 + *(int *)(v49 + 60), (uint64_t)v96);
                  char v63 = v98;
                  uint64_t v64 = (uint64_t)&v98[*(int *)(v104 + 48)];
                  sub_252674950((uint64_t)v61, (uint64_t)v98);
                  sub_252674950((uint64_t)v62, v64);
                  if (v41((uint64_t)v63, 1, v44) == 1)
                  {
                    sub_252634810((uint64_t)v62, &qword_269C12A68);
                    sub_252634810((uint64_t)v61, &qword_269C12A68);
                    if (v41(v64, 1, v44) == 1)
                    {
                      sub_252634810((uint64_t)v63, &qword_269C12A68);
                      uint64_t v65 = v91;
LABEL_37:
                      uint64_t v71 = *(void *)(a1 + 64);
                      uint64_t v72 = *(void *)(a2 + 64);
                      if (*(unsigned char *)(a1 + 72)) {
                        uint64_t v71 = v71 != 0;
                      }
                      if (*(unsigned char *)(a2 + 72) == 1)
                      {
                        uint64_t v73 = v90;
                        if (v72)
                        {
                          if (v71 != 1) {
                            goto LABEL_34;
                          }
                        }
                        else if (v71)
                        {
                          goto LABEL_34;
                        }
                      }
                      else
                      {
                        uint64_t v73 = v90;
                        if (v71 != v72) {
                          goto LABEL_34;
                        }
                      }
                      uint64_t v74 = *(void *)(a1 + 80);
                      uint64_t v75 = *(void *)(a2 + 80);
                      if (*(unsigned char *)(a1 + 88)) {
                        uint64_t v74 = v74 != 0;
                      }
                      if (*(unsigned char *)(a2 + 88) == 1)
                      {
                        if (v75)
                        {
                          if (v74 == 1) {
                            goto LABEL_55;
                          }
                        }
                        else if (!v74)
                        {
                          goto LABEL_55;
                        }
                      }
                      else if (v74 == v75)
                      {
LABEL_55:
                        uint64_t v76 = *(void *)(a1 + 96);
                        uint64_t v77 = *(void *)(a2 + 96);
                        if (*(unsigned char *)(a2 + 104) == 1)
                        {
                          switch(v77)
                          {
                            case 1:
                              if (v76 == 1) {
                                goto LABEL_66;
                              }
                              goto LABEL_34;
                            case 2:
                              if (v76 == 2) {
                                goto LABEL_66;
                              }
                              goto LABEL_34;
                            case 3:
                              if (v76 == 3) {
                                goto LABEL_66;
                              }
                              goto LABEL_34;
                            default:
                              if (!v76) {
                                goto LABEL_66;
                              }
                              goto LABEL_34;
                          }
                        }
                        if (v76 == v77)
                        {
LABEL_66:
                          if (sub_25267008C(*(void *)(a1 + 112), *(void *)(a2 + 112)))
                          {
                            uint64_t v78 = a1 + *(int *)(v65 + 48);
                            unint64_t v79 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v73 + 16);
                            uint64_t v80 = v93;
                            uint64_t v81 = v88;
                            v79(v93, v78, v88);
                            uint64_t v82 = a2 + *(int *)(v65 + 48);
                            uint64_t v83 = v94;
                            v79(v94, v82, v81);
                            sub_25267111C(&qword_269C12728, MEMORY[0x263F50560]);
                            char v38 = sub_252675B80();
                            uint64_t v84 = *(void (**)(unsigned char *, uint64_t))(v73 + 8);
                            v84(v83, v81);
                            v84(v80, v81);
                            return v38 & 1;
                          }
                        }
                      }
LABEL_34:
                      char v38 = 0;
                      return v38 & 1;
                    }
                  }
                  else
                  {
                    uint64_t v66 = v95;
                    sub_252674950((uint64_t)v63, (uint64_t)v95);
                    if (v41(v64, 1, v44) != 1)
                    {
                      uint64_t v68 = v105;
                      uint64_t v69 = v100;
                      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v105 + 32))(v100, v64, v44);
                      sub_25267111C(&qword_269C12B58, MEMORY[0x263F502F0]);
                      LODWORD(v104) = sub_252675B80();
                      uint64_t v70 = *(void (**)(unsigned char *, uint64_t))(v68 + 8);
                      v70(v69, v44);
                      sub_252634810((uint64_t)v62, &qword_269C12A68);
                      sub_252634810((uint64_t)v61, &qword_269C12A68);
                      v70(v66, v44);
                      sub_252634810((uint64_t)v63, &qword_269C12A68);
                      uint64_t v65 = v91;
                      if ((v104 & 1) == 0) {
                        goto LABEL_34;
                      }
                      goto LABEL_37;
                    }
                    sub_252634810((uint64_t)v62, &qword_269C12A68);
                    sub_252634810((uint64_t)v61, &qword_269C12A68);
                    (*(void (**)(unsigned char *, uint64_t))(v105 + 8))(v66, v44);
                  }
                  uint64_t v45 = (uint64_t)v63;
LABEL_33:
                  sub_252634810(v45, &qword_269C12B50);
                  goto LABEL_34;
                }
              }
              else
              {
                uint64_t v54 = v42;
                BOOL v55 = v99;
                sub_252674950((uint64_t)v52, (uint64_t)v99);
                uint64_t v89 = v54;
                if (v41(v53, 1, v44) != 1)
                {
                  uint64_t v56 = v41;
                  uint64_t v57 = v105;
                  uint64_t v58 = v100;
                  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v105 + 32))(v100, v53, v44);
                  sub_25267111C(&qword_269C12B58, MEMORY[0x263F502F0]);
                  LODWORD(v103) = sub_252675B80();
                  uint64_t v59 = v55;
                  uint64_t v60 = *(void (**)(unsigned char *, uint64_t))(v57 + 8);
                  v60(v58, v44);
                  sub_252634810((uint64_t)v92, &qword_269C12A68);
                  sub_252634810((uint64_t)v101, &qword_269C12A68);
                  v60(v59, v44);
                  uint64_t v41 = v56;
                  sub_252634810((uint64_t)v102, &qword_269C12A68);
                  if ((v103 & 1) == 0) {
                    goto LABEL_34;
                  }
                  goto LABEL_27;
                }
                sub_252634810((uint64_t)v92, &qword_269C12A68);
                sub_252634810((uint64_t)v50, &qword_269C12A68);
                (*(void (**)(unsigned char *, uint64_t))(v105 + 8))(v55, v44);
              }
              uint64_t v45 = (uint64_t)v52;
              goto LABEL_33;
            }
            sub_252634810((uint64_t)v35, &qword_269C12A68);
            sub_252634810((uint64_t)v37, &qword_269C12A68);
            (*(void (**)(unsigned char *, uint64_t))(v105 + 8))(v32, v43);
          }
          uint64_t v45 = (uint64_t)v15;
          goto LABEL_33;
        }
      }
    }
  }
  return v38 & 1;
}

uint64_t sub_25267111C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_252671164()
{
  return sub_25267111C(&qword_269C12A50, (void (*)(uint64_t))type metadata accessor for HSIntervalBlockPayload);
}

uint64_t sub_2526711AC()
{
  return sub_25267111C(&qword_269C12A58, (void (*)(uint64_t))type metadata accessor for HSIntervalBlockPayload);
}

uint64_t sub_2526711F4()
{
  return sub_25267111C(&qword_269C12A48, (void (*)(uint64_t))type metadata accessor for HSIntervalBlockPayload);
}

uint64_t sub_25267123C()
{
  return sub_25267111C(&qword_269C12A60, (void (*)(uint64_t))type metadata accessor for HSIntervalBlockPayload);
}

void *initializeBufferWithCopyOfBuffer for HSIntervalBlockPayload(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    uint64_t v9 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v9;
    uint64_t v10 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v10;
    uint64_t v11 = a2[8];
    *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
    *(void *)(a1 + 64) = v11;
    *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
    *(void *)(a1 + 80) = a2[10];
    *(unsigned char *)(a1 + 104) = *((unsigned char *)a2 + 104);
    *(void *)(a1 + 96) = a2[12];
    uint64_t v12 = a3[12];
    uint64_t v32 = (uint64_t)a2 + v12;
    uint64_t v33 = a1 + v12;
    *(void *)(a1 + 112) = a2[14];
    uint64_t v13 = sub_252675860();
    uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v31(v33, v32, v13);
    uint64_t v14 = a3[13];
    BOOL v15 = (char *)v4 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = sub_252675830();
    uint64_t v18 = *(void *)(v17 - 8);
    uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
    if (v19(v16, 1, v17))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
      memcpy(v15, v16, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
    uint64_t v22 = a3[14];
    uint64_t v23 = (char *)v4 + v22;
    uint64_t v24 = (char *)a2 + v22;
    if (v19((char *)a2 + v22, 1, v17))
    {
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
      memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v23, v24, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v23, 0, 1, v17);
    }
    uint64_t v26 = a3[15];
    char v27 = (char *)v4 + v26;
    uint64_t v28 = (char *)a2 + v26;
    if (v19(v28, 1, v17))
    {
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
      memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v27, v28, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v27, 0, 1, v17);
    }
  }
  return v4;
}

uint64_t destroy for HSIntervalBlockPayload(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[12];
  uint64_t v5 = sub_252675860();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + a2[13];
  uint64_t v7 = sub_252675830();
  uint64_t v13 = *(void *)(v7 - 8);
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  if (!v8(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v6, v7);
  }
  uint64_t v9 = a1 + a2[14];
  if (!v8(v9, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v9, v7);
  }
  uint64_t v10 = a1 + a2[15];
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v8)(v10, 1, v7);
  if (!result)
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8);
    return v12(v10, v7);
  }
  return result;
}

uint64_t initializeWithCopy for HSIntervalBlockPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  uint64_t v9 = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 64) = v9;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v10 = a3[12];
  uint64_t v29 = a2 + v10;
  uint64_t v30 = a1 + v10;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  uint64_t v11 = sub_252675860();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v30, v29, v11);
  uint64_t v13 = a3[13];
  uint64_t v14 = (void *)(a1 + v13);
  BOOL v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_252675830();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48);
  if (v18(v15, 1, v16))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v14, v15, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  uint64_t v20 = a3[14];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (const void *)(a2 + v20);
  if (v18((const void *)(a2 + v20), 1, v16))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v21, v22, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v21, 0, 1, v16);
  }
  uint64_t v24 = a3[15];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (const void *)(a2 + v24);
  if (v18(v26, 1, v16))
  {
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v25, v26, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v25, 0, 1, v16);
  }
  return a1;
}

uint64_t assignWithCopy for HSIntervalBlockPayload(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v6 = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 64) = v6;
  uint64_t v7 = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 80) = v7;
  uint64_t v8 = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 96) = v8;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[12];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_252675860();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = a3[13];
  uint64_t v14 = (void *)(a1 + v13);
  BOOL v15 = (void *)(a2 + v13);
  uint64_t v16 = sub_252675830();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  int v19 = v18(v14, 1, v16);
  int v20 = v18(v15, 1, v16);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
LABEL_6:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v14, v15, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 24))(v14, v15, v16);
LABEL_7:
  uint64_t v22 = a3[14];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  int v25 = v18((void *)(a1 + v22), 1, v16);
  int v26 = v18(v24, 1, v16);
  if (v25)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 16))(v23, v24, v16);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v23, 0, 1, v16);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v26)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v23, v16);
LABEL_12:
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 24))(v23, v24, v16);
LABEL_13:
  uint64_t v28 = a3[15];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (void *)(a2 + v28);
  int v31 = v18((void *)(a1 + v28), 1, v16);
  int v32 = v18(v30, 1, v16);
  if (!v31)
  {
    if (!v32)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 24))(v29, v30, v16);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v17 + 8))(v29, v16);
    goto LABEL_18;
  }
  if (v32)
  {
LABEL_18:
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 16))(v29, v30, v16);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v29, 0, 1, v16);
  return a1;
}

uint64_t initializeWithTake for HSIntervalBlockPayload(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  long long v7 = *(_OWORD *)(a2 + 32);
  long long v8 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  uint64_t v9 = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 96) = v9;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  uint64_t v10 = a3[12];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  *(_OWORD *)(a1 + 32) = v7;
  *(_OWORD *)(a1 + 48) = v8;
  uint64_t v13 = sub_252675860();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  uint64_t v14 = a3[13];
  BOOL v15 = (void *)(a1 + v14);
  uint64_t v16 = (const void *)(a2 + v14);
  uint64_t v17 = sub_252675830();
  uint64_t v18 = *(void *)(v17 - 8);
  int v19 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48);
  if (v19(v16, 1, v17))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v15, v16, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  uint64_t v21 = a3[14];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (const void *)(a2 + v21);
  if (v19((const void *)(a2 + v21), 1, v17))
  {
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v22, v23, v17);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v22, 0, 1, v17);
  }
  uint64_t v25 = a3[15];
  int v26 = (void *)(a1 + v25);
  uint64_t v27 = (const void *)(a2 + v25);
  if (v19(v27, 1, v17))
  {
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v26, v27, v17);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v26, 0, 1, v17);
  }
  return a1;
}

uint64_t assignWithTake for HSIntervalBlockPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[12];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_252675860();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = a3[13];
  BOOL v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = sub_252675830();
  uint64_t v18 = *(void *)(v17 - 8);
  int v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v18 + 48);
  int v20 = v19(v15, 1, v17);
  int v21 = v19(v16, 1, v17);
  if (v20)
  {
    if (!v21)
    {
      (*(void (**)(void *, void *, uint64_t))(v18 + 32))(v15, v16, v17);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v21)
  {
    (*(void (**)(void *, uint64_t))(v18 + 8))(v15, v17);
LABEL_6:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v15, v16, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v18 + 40))(v15, v16, v17);
LABEL_7:
  uint64_t v23 = a3[14];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (void *)(a2 + v23);
  int v26 = v19((void *)(a1 + v23), 1, v17);
  int v27 = v19(v25, 1, v17);
  if (v26)
  {
    if (!v27)
    {
      (*(void (**)(void *, void *, uint64_t))(v18 + 32))(v24, v25, v17);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v24, 0, 1, v17);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v27)
  {
    (*(void (**)(void *, uint64_t))(v18 + 8))(v24, v17);
LABEL_12:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v18 + 40))(v24, v25, v17);
LABEL_13:
  uint64_t v29 = a3[15];
  uint64_t v30 = (void *)(a1 + v29);
  int v31 = (void *)(a2 + v29);
  int v32 = v19((void *)(a1 + v29), 1, v17);
  int v33 = v19(v31, 1, v17);
  if (!v32)
  {
    if (!v33)
    {
      (*(void (**)(void *, void *, uint64_t))(v18 + 40))(v30, v31, v17);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v18 + 8))(v30, v17);
    goto LABEL_18;
  }
  if (v33)
  {
LABEL_18:
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v18 + 32))(v30, v31, v17);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v30, 0, 1, v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for HSIntervalBlockPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2526726D0);
}

uint64_t sub_2526726D0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_252675860();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 48);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 52);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for HSIntervalBlockPayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252672814);
}

uint64_t sub_252672814(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_252675860();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 48);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 52);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_252672944()
{
  sub_252675860();
  if (v0 <= 0x3F)
  {
    sub_252672A3C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_252672A3C()
{
  if (!qword_269C12A80)
  {
    sub_252675830();
    unint64_t v0 = sub_252675E90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269C12A80);
    }
  }
}

uint64_t *sub_252672A94(uint64_t *a1, uint64_t *a2, int *a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_252675860();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[7];
    uint64_t v14 = (char *)v4 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_252675830();
    uint64_t v17 = *(void *)(v16 - 8);
    uint64_t v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
    if (v18(v15, 1, v16))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
      memcpy(v14, v15, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    uint64_t v21 = a3[8];
    uint64_t v22 = (char *)v4 + v21;
    uint64_t v23 = (char *)a2 + v21;
    if (v18(v23, 1, v16))
    {
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
      memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v22, v23, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v22, 0, 1, v16);
    }
  }
  return v4;
}

uint64_t sub_252672D00(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_252675860();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + a2[7];
  uint64_t v7 = sub_252675830();
  uint64_t v12 = *(void *)(v7 - 8);
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  if (!v8(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v6, v7);
  }
  uint64_t v9 = a1 + a2[8];
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v8)(v9, 1, v7);
  if (!result)
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8);
    return v11(v9, v7);
  }
  return result;
}

void *sub_252672E68(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_252675860();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_252675830();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  if (v17(v14, 1, v15))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  uint64_t v19 = a3[8];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  if (v17(v21, 1, v15))
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v20, v21, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v20, 0, 1, v15);
  }
  return a1;
}

char *sub_252673084(char *a1, void *a2, int *a3)
{
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_252675860();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_252675830();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v11, v12, v13);
LABEL_7:
  uint64_t v19 = a3[8];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = (char *)a2 + v19;
  int v22 = v15(&a1[v19], 1, v13);
  int v23 = v15(v21, 1, v13);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v20, v21, v13);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v20, v13);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v20, v21, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v20, 0, 1, v13);
  return a1;
}

_OWORD *sub_252673368(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_252675860();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_252675830();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v15(v12, 1, v13))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v11, v12, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  uint64_t v17 = a3[8];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  if (v15(v19, 1, v13))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v18, v19, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v18, 0, 1, v13);
  }
  return a1;
}

char *sub_252673578(char *a1, void *a2, int *a3)
{
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = a2[1];
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_252675860();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_252675830();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v11, v12, v13);
LABEL_7:
  uint64_t v19 = a3[8];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = (char *)a2 + v19;
  int v22 = v15(&a1[v19], 1, v13);
  int v23 = v15(v21, 1, v13);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v20, v21, v13);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v20, v13);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v20, v21, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v20, 0, 1, v13);
  return a1;
}

uint64_t sub_252673854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252673868);
}

uint64_t sub_252673868(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_252675860();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 28);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_252673998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2526739AC);
}

uint64_t sub_2526739AC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_252675860();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 28);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_252673ADC()
{
  sub_252675860();
  if (v0 <= 0x3F)
  {
    sub_252672A3C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

ValueMetadata *type metadata accessor for HSIntervalBlockPayload.FlowDirection()
{
  return &type metadata for HSIntervalBlockPayload.FlowDirection;
}

ValueMetadata *type metadata accessor for HSIntervalBlockPayload.Commodity()
{
  return &type metadata for HSIntervalBlockPayload.Commodity;
}

ValueMetadata *type metadata accessor for HSIntervalBlockPayload.Unit()
{
  return &type metadata for HSIntervalBlockPayload.Unit;
}

unint64_t sub_252673BF4()
{
  unint64_t result = qword_269C12A98;
  if (!qword_269C12A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12A98);
  }
  return result;
}

unint64_t sub_252673C4C()
{
  unint64_t result = qword_269C12AA0;
  if (!qword_269C12AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12AA0);
  }
  return result;
}

unint64_t sub_252673CA4()
{
  unint64_t result = qword_269C12AA8;
  if (!qword_269C12AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12AA8);
  }
  return result;
}

uint64_t sub_252673CF8()
{
  return sub_25267111C(&qword_269C12AB0, (void (*)(uint64_t))type metadata accessor for HSIntervalBlockPayload.IntervalReading);
}

uint64_t sub_252673D40()
{
  return sub_25267111C(&qword_269C12A40, (void (*)(uint64_t))type metadata accessor for HSIntervalBlockPayload.IntervalReading);
}

uint64_t sub_252673D88()
{
  return sub_25267111C(&qword_269C12AB8, (void (*)(uint64_t))type metadata accessor for HSIntervalBlockPayload.IntervalReading);
}

uint64_t sub_252673DD0()
{
  return sub_25264F29C(&qword_269C12AC0, &qword_269C12AC8);
}

uint64_t sub_252673DF8()
{
  return sub_25264F29C(&qword_269C12AD0, &qword_269C12AD8);
}

uint64_t sub_252673E20()
{
  return sub_25264F29C(&qword_269C12AE0, &qword_269C12AE8);
}

uint64_t sub_252673E48()
{
  return sub_25264F29C(&qword_269C12AF0, &qword_269C12AF8);
}

uint64_t sub_252673E70()
{
  return sub_25267111C(&qword_269C12B00, (void (*)(uint64_t))type metadata accessor for HSIntervalBlockPayload.IntervalReading);
}

unint64_t sub_252673EBC()
{
  unint64_t result = qword_269C12B08;
  if (!qword_269C12B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12B08);
  }
  return result;
}

unint64_t sub_252673F14()
{
  unint64_t result = qword_269C12B10;
  if (!qword_269C12B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12B10);
  }
  return result;
}

unint64_t sub_252673F6C()
{
  unint64_t result = qword_269C12B18;
  if (!qword_269C12B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12B18);
  }
  return result;
}

unint64_t sub_252673FC4()
{
  unint64_t result = qword_269C12B20;
  if (!qword_269C12B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12B20);
  }
  return result;
}

unint64_t sub_25267401C()
{
  unint64_t result = qword_269C12B28;
  if (!qword_269C12B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12B28);
  }
  return result;
}

unint64_t sub_252674074()
{
  unint64_t result = qword_269C12B30;
  if (!qword_269C12B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12B30);
  }
  return result;
}

uint64_t sub_2526740C8(uint64_t a1, double *a2)
{
  uint64_t v4 = sub_252675860();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v77 = &v64[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v76 = &v64[-v8];
  uint64_t v80 = sub_252675830();
  uint64_t v9 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v78 = &v64[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12B50);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  unint64_t v79 = &v64[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = &v64[-v14];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = MEMORY[0x270FA5388](&v64[-v18]);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  int v22 = &v64[-v21];
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = &v64[-v24];
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  int v31 = &v64[-v30];
  if (*(double *)a1 != *a2) {
    goto LABEL_17;
  }
  uint64_t v74 = v26;
  uint64_t v75 = v29;
  uint64_t v73 = v28;
  uint64_t v32 = *(void *)(a1 + 8);
  uint64_t v33 = a1;
  uint64_t v34 = v27;
  if ((sub_2526701EC(v32, *(void *)(v27 + 8)) & 1) == 0) {
    goto LABEL_17;
  }
  uint64_t v68 = v5;
  uint64_t v69 = v4;
  uint64_t v35 = type metadata accessor for HSIntervalBlockPayload.IntervalReading(0);
  uint64_t v36 = *(int *)(v35 + 28);
  uint64_t v71 = v33;
  sub_252674950(v33 + v36, (uint64_t)v31);
  uint64_t v70 = v35;
  uint64_t v37 = *(int *)(v35 + 28);
  uint64_t v72 = v34;
  sub_252674950(v34 + v37, (uint64_t)v25);
  uint64_t v38 = (uint64_t)&v15[*(int *)(v11 + 48)];
  sub_252674950((uint64_t)v31, (uint64_t)v15);
  sub_252674950((uint64_t)v25, v38);
  uint64_t v39 = v9;
  uint64_t v40 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  uint64_t v41 = v80;
  if (v40((uint64_t)v15, 1, v80) != 1)
  {
    sub_252674950((uint64_t)v15, (uint64_t)v22);
    if (v40(v38, 1, v41) != 1)
    {
      uint64_t v67 = v40;
      uint64_t v43 = v78;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v39 + 32))(v78, v38, v41);
      sub_25267111C(&qword_269C12B58, MEMORY[0x263F502F0]);
      int v65 = sub_252675B80();
      uint64_t v66 = v39;
      uint64_t v44 = *(void (**)(unsigned char *, uint64_t))(v39 + 8);
      v44(v43, v41);
      sub_252634810((uint64_t)v25, &qword_269C12A68);
      sub_252634810((uint64_t)v31, &qword_269C12A68);
      v44(v22, v41);
      sub_252634810((uint64_t)v15, &qword_269C12A68);
      if ((v65 & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_10;
    }
    sub_252634810((uint64_t)v25, &qword_269C12A68);
    sub_252634810((uint64_t)v31, &qword_269C12A68);
    (*(void (**)(unsigned char *, uint64_t))(v39 + 8))(v22, v41);
LABEL_8:
    uint64_t v42 = (uint64_t)v15;
LABEL_16:
    sub_252634810(v42, &qword_269C12B50);
    goto LABEL_17;
  }
  sub_252634810((uint64_t)v25, &qword_269C12A68);
  sub_252634810((uint64_t)v31, &qword_269C12A68);
  if (v40(v38, 1, v41) != 1) {
    goto LABEL_8;
  }
  uint64_t v66 = v39;
  uint64_t v67 = v40;
  sub_252634810((uint64_t)v15, &qword_269C12A68);
LABEL_10:
  uint64_t v45 = v70;
  uint64_t v46 = v75;
  sub_252674950(v71 + *(int *)(v70 + 32), v75);
  uint64_t v47 = v74;
  sub_252674950(v72 + *(int *)(v45 + 32), v74);
  uint64_t v48 = v79;
  uint64_t v49 = (uint64_t)&v79[*(int *)(v11 + 48)];
  sub_252674950(v46, (uint64_t)v79);
  sub_252674950(v47, v49);
  uint64_t v50 = v67;
  if (v67((uint64_t)v48, 1, v41) == 1)
  {
    sub_252634810(v47, &qword_269C12A68);
    sub_252634810(v46, &qword_269C12A68);
    if (v50(v49, 1, v41) == 1)
    {
      sub_252634810((uint64_t)v48, &qword_269C12A68);
LABEL_20:
      uint64_t v59 = v68;
      uint64_t v58 = v69;
      uint64_t v60 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v68 + 16);
      uint64_t v61 = v76;
      v60(v76, v71 + *(int *)(v45 + 24), v69);
      uint64_t v62 = v77;
      v60(v77, v72 + *(int *)(v45 + 24), v58);
      sub_25267111C(&qword_269C12728, MEMORY[0x263F50560]);
      char v52 = sub_252675B80();
      char v63 = *(void (**)(unsigned char *, uint64_t))(v59 + 8);
      v63(v62, v58);
      v63(v61, v58);
      return v52 & 1;
    }
    goto LABEL_15;
  }
  uint64_t v51 = v73;
  sub_252674950((uint64_t)v48, v73);
  if (v50(v49, 1, v41) == 1)
  {
    sub_252634810(v74, &qword_269C12A68);
    sub_252634810(v75, &qword_269C12A68);
    (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v51, v41);
LABEL_15:
    uint64_t v42 = (uint64_t)v48;
    goto LABEL_16;
  }
  uint64_t v54 = v66;
  BOOL v55 = v78;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v66 + 32))(v78, v49, v41);
  sub_25267111C(&qword_269C12B58, MEMORY[0x263F502F0]);
  char v56 = sub_252675B80();
  uint64_t v57 = *(void (**)(unsigned char *, uint64_t))(v54 + 8);
  v57(v55, v41);
  sub_252634810(v74, &qword_269C12A68);
  sub_252634810(v75, &qword_269C12A68);
  v57((unsigned char *)v51, v41);
  sub_252634810((uint64_t)v48, &qword_269C12A68);
  if (v56) {
    goto LABEL_20;
  }
LABEL_17:
  char v52 = 0;
  return v52 & 1;
}

unint64_t sub_2526748FC()
{
  unint64_t result = qword_269C12B40;
  if (!qword_269C12B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12B40);
  }
  return result;
}

uint64_t sub_252674950(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C12A68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2526749B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HSIntervalBlockPayload.IntervalReading(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_252674A1C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HSIntervalBlockPayload.IntervalReading(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for HSIntervalBlockPayload.IntervalReading.Quality()
{
  return &type metadata for HSIntervalBlockPayload.IntervalReading.Quality;
}

unint64_t sub_252674A8C()
{
  unint64_t result = qword_269C12B68;
  if (!qword_269C12B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12B68);
  }
  return result;
}

unint64_t sub_252674AE4()
{
  unint64_t result = qword_269C12B70;
  if (!qword_269C12B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12B70);
  }
  return result;
}

unint64_t sub_252674B3C()
{
  unint64_t result = qword_269C12B78;
  if (!qword_269C12B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C12B78);
  }
  return result;
}

uint64_t sub_252674BA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = OBJC_IVAR____TtC12HomeServices12StreamReader_fileHandle;
  *(void *)(v6 + OBJC_IVAR____TtC12HomeServices12StreamReader_fileHandle) = 0;
  *(unsigned char *)(v6 + OBJC_IVAR____TtC12HomeServices12StreamReader_atEof) = 0;
  *(void *)(v6 + OBJC_IVAR____TtC12HomeServices12StreamReader_chunkSize) = a6;
  uint64_t v9 = v6 + OBJC_IVAR____TtC12HomeServices12StreamReader_encoding;
  uint64_t v10 = sub_252675BF0();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, a5, v10);
  uint64_t v12 = (void *)sub_252675B90();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(self, sel_fileHandleForReadingAtPath_, v12);

  if (!v13)
  {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a5, v10);
    swift_bridgeObjectRelease();
LABEL_9:
    uint64_t v20 = *(void **)(v6 + v8);
    *(void *)(v6 + v8) = 0;

    *(_OWORD *)(v6 + OBJC_IVAR____TtC12HomeServices12StreamReader_delimData) = xmmword_252678DD0;
    *(void *)(v6 + OBJC_IVAR____TtC12HomeServices12StreamReader_buffer) = 0;
    swift_release();
    return 0;
  }
  uint64_t v14 = sub_252675BB0();
  unint64_t v16 = v15;
  swift_bridgeObjectRelease();
  if (v16 >> 60 == 15)
  {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a5, v10);
LABEL_8:

    goto LABEL_9;
  }
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF990]), sel_initWithCapacity_, a6);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a5, v10);
  if (!v17)
  {
    sub_252646E38(v14, v16);
    goto LABEL_8;
  }
  uint64_t v18 = *(void **)(v6 + v8);
  *(void *)(v6 + v8) = v13;

  uint64_t v19 = (uint64_t *)(v6 + OBJC_IVAR____TtC12HomeServices12StreamReader_delimData);
  uint64_t *v19 = v14;
  v19[1] = v16;
  *(void *)(v6 + OBJC_IVAR____TtC12HomeServices12StreamReader_buffer) = v17;
  return v6;
}

uint64_t sub_252674DF8()
{
  uint64_t v1 = OBJC_IVAR____TtC12HomeServices12StreamReader_fileHandle;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12HomeServices12StreamReader_fileHandle), sel_closeFile);
  uint64_t v2 = *(void **)(v0 + v1);
  *(void *)(v0 + v1) = 0;

  uint64_t v3 = v0 + OBJC_IVAR____TtC12HomeServices12StreamReader_encoding;
  uint64_t v4 = sub_252675BF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  sub_252646E38(*(void *)(v0 + OBJC_IVAR____TtC12HomeServices12StreamReader_delimData), *(void *)(v0 + OBJC_IVAR____TtC12HomeServices12StreamReader_delimData + 8));

  return swift_deallocClassInstance();
}

uint64_t sub_252674EF0()
{
  return type metadata accessor for StreamReader();
}

uint64_t type metadata accessor for StreamReader()
{
  uint64_t result = qword_269C12B80;
  if (!qword_269C12B80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_252674F44()
{
  uint64_t result = sub_252675BF0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_252675000()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_252675010()
{
  return MEMORY[0x270EEDBA0]();
}

uint64_t sub_252675020()
{
  return MEMORY[0x270EEDBB0]();
}

uint64_t sub_252675030()
{
  return MEMORY[0x270EEDBF8]();
}

uint64_t sub_252675040()
{
  return MEMORY[0x270EEDC10]();
}

uint64_t sub_252675050()
{
  return MEMORY[0x270EEDC48]();
}

uint64_t sub_252675060()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_252675070()
{
  return MEMORY[0x270EEDC68]();
}

uint64_t sub_252675080()
{
  return MEMORY[0x270EEDC80]();
}

uint64_t sub_252675090()
{
  return MEMORY[0x270EEDC88]();
}

uint64_t sub_2526750A0()
{
  return MEMORY[0x270EEDCA0]();
}

uint64_t sub_2526750B0()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_2526750C0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_2526750D0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_2526750E0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_2526750F0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_252675100()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_252675110()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_252675120()
{
  return MEMORY[0x270EEE100]();
}

uint64_t sub_252675130()
{
  return MEMORY[0x270EEE168]();
}

uint64_t sub_252675140()
{
  return MEMORY[0x270EEE1A0]();
}

uint64_t sub_252675150()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_252675160()
{
  return MEMORY[0x270EEE2F0]();
}

uint64_t sub_252675170()
{
  return MEMORY[0x270EEE2F8]();
}

uint64_t sub_252675180()
{
  return MEMORY[0x270EEE300]();
}

uint64_t sub_252675190()
{
  return MEMORY[0x270EEE308]();
}

uint64_t sub_2526751A0()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_2526751B0()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_2526751C0()
{
  return MEMORY[0x270EEE3F0]();
}

uint64_t sub_2526751D0()
{
  return MEMORY[0x270EEE408]();
}

uint64_t sub_2526751E0()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_2526751F0()
{
  return MEMORY[0x270EEE4B0]();
}

uint64_t sub_252675200()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_252675210()
{
  return MEMORY[0x270EEE4D8]();
}

uint64_t sub_252675220()
{
  return MEMORY[0x270EEE4E0]();
}

uint64_t sub_252675230()
{
  return MEMORY[0x270EEE4F0]();
}

uint64_t sub_252675240()
{
  return MEMORY[0x270EEE518]();
}

uint64_t sub_252675250()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_252675260()
{
  return MEMORY[0x270EEE590]();
}

uint64_t sub_252675270()
{
  return MEMORY[0x270EEE5C0]();
}

uint64_t sub_252675280()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_252675290()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_2526752A0()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_2526752B0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2526752C0()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_2526752D0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2526752E0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2526752F0()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_252675300()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_252675310()
{
  return MEMORY[0x270EEE828]();
}

uint64_t sub_252675320()
{
  return MEMORY[0x270EEE838]();
}

uint64_t sub_252675330()
{
  return MEMORY[0x270EEE848]();
}

uint64_t sub_252675340()
{
  return MEMORY[0x270EEE850]();
}

uint64_t sub_252675350()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_252675360()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_252675370()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_252675380()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_252675390()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_2526753A0()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_2526753B0()
{
  return MEMORY[0x270EEF7C8]();
}

uint64_t sub_2526753C0()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_2526753D0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2526753E0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2526753F0()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_252675400()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_252675410()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_252675420()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_252675430()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_252675440()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_252675450()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_252675460()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_252675470()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_252675480()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_252675490()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_2526754A0()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_2526754B0()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_2526754C0()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_2526754D0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2526754E0()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_2526754F0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_252675500()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_252675510()
{
  return MEMORY[0x270EF0790]();
}

uint64_t sub_252675520()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_252675530()
{
  return MEMORY[0x270EF07E8]();
}

uint64_t sub_252675540()
{
  return MEMORY[0x270EF07F8]();
}

uint64_t sub_252675550()
{
  return MEMORY[0x270EF0808]();
}

uint64_t sub_252675560()
{
  return MEMORY[0x270EF0820]();
}

uint64_t sub_252675570()
{
  return MEMORY[0x270EF0840]();
}

uint64_t sub_252675580()
{
  return MEMORY[0x270EF0890]();
}

uint64_t sub_252675590()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_2526755A0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2526755B0()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_2526755C0()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_2526755D0()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_2526755E0()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_2526755F0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_252675600()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_252675610()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_252675620()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_252675630()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_252675640()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_252675650()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_252675660()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_252675670()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_252675680()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_252675690()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_2526756A0()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_2526756B0()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_2526756C0()
{
  return MEMORY[0x270EF1350]();
}

uint64_t sub_2526756D0()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_2526756E0()
{
  return MEMORY[0x270EF1378]();
}

uint64_t sub_2526756F0()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_252675700()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_252675710()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_252675720()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_252675730()
{
  return MEMORY[0x270EF1570]();
}

uint64_t sub_252675740()
{
  return MEMORY[0x270EF1590]();
}

uint64_t sub_252675750()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_252675760()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_252675770()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_252675780()
{
  return MEMORY[0x270EF1630]();
}

uint64_t sub_252675790()
{
  return MEMORY[0x270EF1648]();
}

uint64_t sub_2526757A0()
{
  return MEMORY[0x270EF1670]();
}

uint64_t sub_2526757B0()
{
  return MEMORY[0x270EF1678]();
}

uint64_t sub_2526757C0()
{
  return MEMORY[0x270EF1688]();
}

uint64_t sub_2526757D0()
{
  return MEMORY[0x270EF16A8]();
}

uint64_t sub_2526757E0()
{
  return MEMORY[0x270EF16B0]();
}

uint64_t sub_2526757F0()
{
  return MEMORY[0x270EF16C8]();
}

uint64_t sub_252675800()
{
  return MEMORY[0x270EE57F8]();
}

uint64_t sub_252675810()
{
  return MEMORY[0x270FA2A68]();
}

uint64_t sub_252675820()
{
  return MEMORY[0x270FA2AA0]();
}

uint64_t sub_252675830()
{
  return MEMORY[0x270F446A0]();
}

uint64_t sub_252675840()
{
  return MEMORY[0x270F44A18]();
}

uint64_t sub_252675850()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_252675860()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_252675870()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_2526758A0()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_2526758B0()
{
  return MEMORY[0x270F44B30]();
}

uint64_t sub_2526758C0()
{
  return MEMORY[0x270F44B50]();
}

uint64_t sub_2526758D0()
{
  return MEMORY[0x270F44BE0]();
}

uint64_t sub_2526758E0()
{
  return MEMORY[0x270F44BF8]();
}

uint64_t sub_2526758F0()
{
  return MEMORY[0x270F44C20]();
}

uint64_t sub_252675900()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_252675910()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_252675930()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_252675940()
{
  return MEMORY[0x270F44D20]();
}

uint64_t sub_252675950()
{
  return MEMORY[0x270F44D68]();
}

uint64_t sub_252675960()
{
  return MEMORY[0x270F44DC8]();
}

uint64_t sub_252675970()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_252675980()
{
  return MEMORY[0x270F44DF0]();
}

uint64_t sub_252675990()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_2526759A0()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_2526759B0()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_2526759C0()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_2526759D0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2526759E0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2526759F0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_252675A00()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_252675A10()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_252675A20()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_252675A30()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_252675A40()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_252675A50()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_252675A60()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_252675A70()
{
  return MEMORY[0x270EEAB00]();
}

uint64_t sub_252675A80()
{
  return MEMORY[0x270EEAB30]();
}

uint64_t sub_252675A90()
{
  return MEMORY[0x270EEAD48]();
}

uint64_t sub_252675AA0()
{
  return MEMORY[0x270EEB060]();
}

uint64_t sub_252675AB0()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_252675AC0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_252675AD0()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_252675AE0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_252675AF0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_252675B00()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_252675B10()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_252675B20()
{
  return MEMORY[0x270F9D3C0]();
}

uint64_t sub_252675B30()
{
  return MEMORY[0x270FA2B38]();
}

uint64_t sub_252675B40()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_252675B50()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_252675B60()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_252675B70()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_252675B80()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_252675B90()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_252675BA0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_252675BB0()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_252675BC0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_252675BD0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_252675BE0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_252675BF0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_252675C00()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_252675C10()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_252675C20()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_252675C30()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_252675C40()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_252675C50()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_252675C60()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_252675C70()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_252675C80()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_252675C90()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_252675CA0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_252675CB0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_252675CC0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_252675CD0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_252675CE0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_252675CF0()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_252675D00()
{
  return MEMORY[0x270F9D8A8]();
}

uint64_t sub_252675D10()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_252675D20()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_252675D40()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_252675D50()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_252675D60()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_252675D70()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_252675D80()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_252675D90()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_252675DA0()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_252675DB0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_252675DE0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_252675DF0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_252675E00()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_252675E10()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_252675E20()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_252675E30()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_252675E40()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_252675E50()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_252675E60()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_252675E70()
{
  return MEMORY[0x270EE5950]();
}

uint64_t sub_252675E80()
{
  return MEMORY[0x270F9E3B8]();
}

uint64_t sub_252675E90()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_252675EA0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_252675EB0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_252675EC0()
{
  return MEMORY[0x270F9E568]();
}

uint64_t sub_252675ED0()
{
  return MEMORY[0x270EF24B0]();
}

uint64_t sub_252675EE0()
{
  return MEMORY[0x270EF24C0]();
}

uint64_t sub_252675EF0()
{
  return MEMORY[0x270EF2570]();
}

uint64_t sub_252675F00()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_252675F10()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_252675F20()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_252675F30()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_252675F40()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_252675F50()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_252675F60()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_252675F70()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_252675F80()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_252675F90()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_252675FA0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_252675FB0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_252675FC0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_252675FD0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_252675FE0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_252675FF0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_252676000()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_252676010()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_252676020()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_252676030()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_252676040()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_252676050()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_252676060()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_252676070()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_252676080()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_252676090()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2526760A0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2526760B0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2526760C0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_2526760D0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2526760E0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2526760F0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_252676100()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_252676110()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_252676120()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_252676130()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_252676140()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_252676150()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_252676160()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_252676170()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_252676180()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_252676190()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2526761A0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2526761B0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2526761C0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2526761D0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2526761E0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2526761F0()
{
  return MEMORY[0x270F9FD98]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  MEMORY[0x270EF58C8]((__n128)coordinate, *(__n128 *)&coordinate.longitude);
  result.y = v2;
  result.x = v1;
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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