uint64_t sub_233073430@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  unint64_t v31;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  unint64_t v40;
  void (**v41)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t *v42;
  void *v43;
  void (*v44)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t result;
  void v61[2];
  uint64_t v62;
  uint64_t v63;
  long long v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  unsigned int (**v68)(char *, uint64_t, uint64_t);
  uint64_t v69;
  void *v70;

  v62 = a2;
  sub_233080D4C(0, (unint64_t *)&unk_268758BB8, type metadata accessor for ModelsR4.HumanName, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)v61 - v4;
  v69 = type metadata accessor for ModelsR4.HumanName(0);
  v6 = MEMORY[0x270FA5388](v69);
  v8 = (char *)v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v11 = (void *)((char *)v61 - v10);
  v12 = (void *)MEMORY[0x263F8EE80];
  v70 = (void *)MEMORY[0x263F8EE80];
  v13 = *(void *)(a1 + 16);
  v63 = v9;
  if (!v13)
  {
LABEL_23:
    v40 = 0;
    v41 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v68 = (unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
    v42 = (uint64_t *)&unk_26E69D6C8;
    v43 = &unk_26E69D000;
    while (1)
    {
      if (v40 >= v43[214])
      {
        __break(1u);
        goto LABEL_39;
      }
      if (!v12[2]) {
        goto LABEL_25;
      }
      v46 = *(v42 - 1);
      v47 = *v42;
      swift_bridgeObjectRetain();
      v48 = sub_232F393E0(v46, v47);
      if ((v49 & 1) == 0) {
        break;
      }
      v50 = v43;
      v51 = *(void *)(v12[7] + 8 * v48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (*(void *)(v51 + 16))
      {
        v52 = v63;
        sub_2330815B0(v51 + ((*(unsigned __int8 *)(v63 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80)), (uint64_t)v5, type metadata accessor for ModelsR4.HumanName);
        v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v52 + 56);
        v53 = v5;
        v54 = 0;
      }
      else
      {
        v44 = *v41;
        v53 = v5;
        v54 = 1;
      }
      v55 = v69;
      v44(v53, v54, 1, v69);
      swift_bridgeObjectRelease();
      if ((*v68)(v5, 1, v55) != 1)
      {
        swift_release();
        swift_arrayDestroy();
        v59 = v62;
        sub_233081618((uint64_t)v5, v62, type metadata accessor for ModelsR4.HumanName);
        v56 = v59;
        v57 = 0;
        v58 = v69;
        return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v44)(v56, v57, 1, v58);
      }
      v45 = v69;
      v43 = v50;
LABEL_26:
      ++v40;
      sub_233081680((uint64_t)v5, (unint64_t *)&unk_268758BB8, type metadata accessor for ModelsR4.HumanName);
      v42 += 2;
      if (v40 == 7)
      {
        swift_arrayDestroy();
        swift_release();
        v56 = v62;
        v57 = 1;
        v58 = v45;
        return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v44)(v56, v57, 1, v58);
      }
    }
    swift_bridgeObjectRelease();
LABEL_25:
    v44 = *v41;
    v45 = v69;
    (*v41)(v5, 1, 1, v69);
    goto LABEL_26;
  }
  v61[0] = v5;
  v61[1] = a1;
  v14 = *(unsigned __int8 *)(v9 + 80);
  v15 = (v14 + 32) & ~v14;
  v16 = a1 + v15;
  v17 = *(void *)(v9 + 72);
  v68 = (unsigned int (**)(char *, uint64_t, uint64_t))v15;
  v65 = v14 | 7;
  v66 = v17 + v15;
  swift_bridgeObjectRetain();
  v64 = xmmword_2330A1880;
  v67 = v8;
  while (1)
  {
    sub_2330815B0(v16, (uint64_t)v11, type metadata accessor for ModelsR4.HumanName);
    v19 = v11[1];
    v20 = v19 ? *v11 : 0x7D656E6F6E7BLL;
    v21 = v19 ? v11[1] : 0xE600000000000000;
    swift_bridgeObjectRetain();
    v23 = sub_232F393E0(v20, v21);
    v24 = v12[2];
    v25 = (v22 & 1) == 0;
    v26 = v24 + v25;
    if (__OFADD__(v24, v25)) {
      break;
    }
    v27 = v22;
    if (v12[3] < v26)
    {
      sub_232F5C780(v26, 1);
      v12 = v70;
      v28 = sub_232F393E0(v20, v21);
      if ((v27 & 1) != (v29 & 1)) {
        goto LABEL_41;
      }
      v23 = v28;
    }
    if (v27)
    {
      swift_bridgeObjectRelease();
      v30 = v12[7];
      sub_233081618((uint64_t)v11, (uint64_t)v8, type metadata accessor for ModelsR4.HumanName);
      v31 = *(void *)(v30 + 8 * v23);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v30 + 8 * v23) = v31;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v31 = sub_232F3D0A0(0, *(void *)(v31 + 16) + 1, 1, v31);
        *(void *)(v30 + 8 * v23) = v31;
      }
      v34 = *(void *)(v31 + 16);
      v33 = *(void *)(v31 + 24);
      if (v34 >= v33 >> 1)
      {
        v31 = sub_232F3D0A0(v33 > 1, v34 + 1, 1, v31);
        *(void *)(v30 + 8 * v23) = v31;
      }
      *(void *)(v31 + 16) = v34 + 1;
      v18 = (uint64_t)v68 + v31 + v34 * v17;
      v8 = v67;
      sub_233081618((uint64_t)v67, v18, type metadata accessor for ModelsR4.HumanName);
    }
    else
    {
      sub_233080D4C(0, &qword_2687570D8, type metadata accessor for ModelsR4.HumanName, MEMORY[0x263F8E0F8]);
      v35 = swift_allocObject();
      *(_OWORD *)(v35 + 16) = v64;
      sub_233081618((uint64_t)v11, (uint64_t)v68 + v35, type metadata accessor for ModelsR4.HumanName);
      v12[(v23 >> 6) + 8] |= 1 << v23;
      v36 = (uint64_t *)(v12[6] + 16 * v23);
      *v36 = v20;
      v36[1] = v21;
      *(void *)(v12[7] + 8 * v23) = v35;
      v37 = v12[2];
      v38 = __OFADD__(v37, 1);
      v39 = v37 + 1;
      if (v38) {
        goto LABEL_40;
      }
      v12[2] = v39;
    }
    v16 += v17;
    if (!--v13)
    {
      swift_bridgeObjectRelease();
      v9 = v63;
      v5 = (char *)v61[0];
      goto LABEL_23;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  result = sub_23309C340();
  __break(1u);
  return result;
}

id sub_233073A58()
{
  uint64_t v2 = v1;
  v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_233080D4C(0, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v57 - v5;
  uint64_t v63 = type metadata accessor for ModelsDSTU2.ResourceProxy(0);
  uint64_t v7 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_233080D4C(0, &qword_268756558, type metadata accessor for ModelsDSTU2.ResourceProxy, v3);
  MEMORY[0x270FA5388](v10 - 8);
  v12 = (char *)&v57 - v11;
  uint64_t v89 = type metadata accessor for ModelsDSTU2.Bundle.BundleEntry(0);
  MEMORY[0x270FA5388](v89);
  v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(v0 + 16);
  if (v16 && (uint64_t v17 = *(void *)(v16 + 16)) != 0)
  {
    v58 = v6;
    uint64_t v59 = v16;
    uint64_t v60 = v2;
    uint64_t v18 = v16 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
    uint64_t v64 = *(void *)(v13 + 72);
    v65 = (unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
    swift_bridgeObjectRetain();
    uint64_t v19 = v17 - 1;
    v20 = (void *)MEMORY[0x263F8EE78];
    uint64_t v21 = v63;
    while (1)
    {
      sub_2330815B0(v18, (uint64_t)v15, type metadata accessor for ModelsDSTU2.Bundle.BundleEntry);
      sub_233081530((uint64_t)&v15[*(int *)(v89 + 20)], (uint64_t)v12, &qword_268756558, type metadata accessor for ModelsDSTU2.ResourceProxy);
      if ((*v65)(v12, 1, v21) == 1)
      {
        sub_233081680((uint64_t)v12, &qword_268756558, type metadata accessor for ModelsDSTU2.ResourceProxy);
        sub_2330812C0(v87);
        sub_2330812DC((uint64_t)v87, (uint64_t)v88);
      }
      else
      {
        sub_2330815B0((uint64_t)v12, (uint64_t)v9, type metadata accessor for ModelsDSTU2.ResourceProxy);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
            v85 = (ValueMetadata *)type metadata accessor for ModelsDSTU2.Condition(0);
            unint64_t v86 = sub_233080EDC(&qword_268757838, (void (*)(uint64_t))type metadata accessor for ModelsDSTU2.Condition);
            boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v84);
            v27 = type metadata accessor for ModelsDSTU2.Condition;
            goto LABEL_12;
          case 2u:
            v85 = (ValueMetadata *)type metadata accessor for ModelsDSTU2.DiagnosticReport(0);
            unint64_t v86 = sub_233080EDC(&qword_268757830, (void (*)(uint64_t))type metadata accessor for ModelsDSTU2.DiagnosticReport);
            boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v84);
            v27 = type metadata accessor for ModelsDSTU2.DiagnosticReport;
            goto LABEL_12;
          case 3u:
            v85 = (ValueMetadata *)type metadata accessor for ModelsDSTU2.Immunization(0);
            unint64_t v86 = sub_233080EDC(&qword_268757828, (void (*)(uint64_t))type metadata accessor for ModelsDSTU2.Immunization);
            boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v84);
            v27 = type metadata accessor for ModelsDSTU2.Immunization;
            goto LABEL_12;
          case 4u:
            v85 = (ValueMetadata *)type metadata accessor for ModelsDSTU2.Observation(0);
            unint64_t v86 = sub_233080EDC(&qword_268757820, (void (*)(uint64_t))type metadata accessor for ModelsDSTU2.Observation);
            boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v84);
            v27 = type metadata accessor for ModelsDSTU2.Observation;
LABEL_12:
            sub_233081618((uint64_t)v9, (uint64_t)boxed_opaque_existential_1, v27);
            break;
          case 5u:
            v85 = &type metadata for ModelsDSTU2.Patient;
            unint64_t v86 = sub_232F7C624();
            v37 = (_OWORD *)swift_allocObject();
            v84[0] = (uint64_t)v37;
            long long v38 = *((_OWORD *)v9 + 7);
            v37[7] = *((_OWORD *)v9 + 6);
            v37[8] = v38;
            v37[9] = *((_OWORD *)v9 + 8);
            long long v39 = *((_OWORD *)v9 + 3);
            v37[3] = *((_OWORD *)v9 + 2);
            v37[4] = v39;
            long long v40 = *((_OWORD *)v9 + 5);
            v37[5] = *((_OWORD *)v9 + 4);
            v37[6] = v40;
            long long v41 = *((_OWORD *)v9 + 1);
            v37[1] = *(_OWORD *)v9;
            v37[2] = v41;
            break;
          case 6u:
            long long v42 = *(_OWORD *)v9;
            long long v61 = *((_OWORD *)v9 + 1);
            long long v62 = v42;
            uint64_t v43 = *((void *)v9 + 4);
            uint64_t v44 = *((void *)v9 + 5);
            v85 = &type metadata for UnknownResource;
            unint64_t v86 = sub_232E9B608();
            uint64_t v45 = swift_allocObject();
            v84[0] = v45;
            long long v46 = v61;
            *(_OWORD *)(v45 + 16) = v62;
            *(_OWORD *)(v45 + 32) = v46;
            *(void *)(v45 + 48) = v43;
            *(void *)(v45 + 56) = v44;
            uint64_t v21 = v63;
            break;
          default:
            long long v22 = *(_OWORD *)v9;
            long long v61 = *((_OWORD *)v9 + 1);
            long long v62 = v22;
            uint64_t v23 = *((void *)v9 + 4);
            v85 = &type metadata for ModelsDSTU2.Bundle;
            unint64_t v86 = sub_232F7C7D0();
            uint64_t v24 = swift_allocObject();
            v84[0] = v24;
            long long v25 = v61;
            *(_OWORD *)(v24 + 16) = v62;
            *(_OWORD *)(v24 + 32) = v25;
            *(void *)(v24 + 48) = v23;
            break;
        }
        sub_232F3FD80(0, (unint64_t *)&qword_2687566D0);
        if (swift_dynamicCast())
        {
          nullsub_1(v88);
        }
        else
        {
          sub_2330812C0(v87);
          sub_2330812DC((uint64_t)v87, (uint64_t)v88);
        }
        sub_2330814D0((uint64_t)v12, type metadata accessor for ModelsDSTU2.ResourceProxy);
      }
      sub_2330814D0((uint64_t)v15, type metadata accessor for ModelsDSTU2.Bundle.BundleEntry);
      sub_2330812DC((uint64_t)v88, (uint64_t)v84);
      sub_2330812DC((uint64_t)v84, (uint64_t)v87);
      if (sub_233040554((uint64_t)v87) != 1)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v20 = sub_232F3CF54(0, v20[2] + 1, 1, v20);
        }
        unint64_t v29 = v20[2];
        unint64_t v28 = v20[3];
        if (v29 >= v28 >> 1) {
          v20 = sub_232F3CF54((void *)(v28 > 1), v29 + 1, 1, v20);
        }
        sub_2330812DC((uint64_t)v84, (uint64_t)&v75);
        v20[2] = v29 + 1;
        v30 = &v20[18 * v29];
        v30[2] = v75;
        long long v31 = v79;
        long long v33 = v76;
        long long v32 = v77;
        v30[5] = v78;
        v30[6] = v31;
        v30[3] = v33;
        v30[4] = v32;
        long long v34 = v83;
        long long v36 = v80;
        long long v35 = v81;
        v30[9] = v82;
        v30[10] = v34;
        v30[7] = v36;
        v30[8] = v35;
        uint64_t v21 = v63;
      }
      if (!v19) {
        break;
      }
      --v19;
      v18 += v64;
    }
    swift_bridgeObjectRelease();
    if (v20[2])
    {
      long long v50 = *((_OWORD *)v20 + 8);
      long long v80 = *((_OWORD *)v20 + 7);
      long long v81 = v50;
      long long v51 = *((_OWORD *)v20 + 10);
      long long v82 = *((_OWORD *)v20 + 9);
      long long v83 = v51;
      long long v52 = *((_OWORD *)v20 + 3);
      long long v53 = *((_OWORD *)v20 + 5);
      long long v54 = *((_OWORD *)v20 + 6);
      long long v77 = *((_OWORD *)v20 + 4);
      long long v78 = v53;
      long long v79 = v54;
      long long v75 = *((_OWORD *)v20 + 2);
      long long v76 = v52;
      sub_232F7CEE8((uint64_t)&v75);
      swift_bridgeObjectRelease();
      long long v72 = v81;
      long long v73 = v82;
      long long v74 = v83;
      long long v68 = v77;
      long long v69 = v78;
      long long v70 = v79;
      long long v71 = v80;
      long long v66 = v75;
      long long v67 = v76;
      uint64_t v55 = sub_23309B230();
      uint64_t v56 = (uint64_t)v58;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v58, 1, 1, v55);
      id v48 = sub_233074D58(v56);
      sub_233081680(v56, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690]);
      sub_232F7CFAC((uint64_t)&v75);
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_232F3A800(0, &qword_268758798);
      return static HKSignedClinicalDataSubject.unknown()();
    }
  }
  else
  {
    type metadata accessor for HDHRExtractionError(0);
    id v48 = v47;
    *(void *)&v87[0] = 200;
    sub_232F54C28(MEMORY[0x263F8EE78]);
    sub_233080EDC((unint64_t *)&qword_268756508, type metadata accessor for HDHRExtractionError);
    sub_23309AEA0();
    swift_willThrow();
  }
  return v48;
}

uint64_t sub_2330743A0(uint64_t a1)
{
  v2[9] = a1;
  sub_233080F24(0, &qword_268758C28, MEMORY[0x263F8F7E0]);
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  uint64_t v4 = *(void *)(type metadata accessor for RecordExtractionContext() - 8);
  v2[13] = v4;
  v2[14] = *(void *)(v4 + 64);
  v2[15] = swift_task_alloc();
  sub_233080F24(0, &qword_268758C40, MEMORY[0x263F8F7F0]);
  v2[16] = v5;
  v2[17] = *(void *)(v5 - 8);
  v2[18] = swift_task_alloc();
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = *(void *)(v1 + 16);
  v2[19] = v6;
  v2[20] = v7;
  return MEMORY[0x270FA2498](sub_233074568, 0, 0);
}

uint64_t sub_233074568()
{
  uint64_t v1 = v0[20];
  if (v1 && *(void *)(v1 + 16))
  {
    uint64_t v2 = v0[19];
    uint64_t v15 = v0[18];
    uint64_t v4 = v0[16];
    uint64_t v3 = v0[17];
    uint64_t v5 = v0[15];
    uint64_t v6 = v0[13];
    sub_2330815B0(v0[9], v5, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
    unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v8 = swift_allocObject();
    sub_233081618(v5, v8 + v7, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
    v0[6] = v1;
    sub_233080D4C(0, &qword_268757870, type metadata accessor for ModelsDSTU2.Bundle.BundleEntry, MEMORY[0x263F8D488]);
    sub_23304079C();
    sub_233080E0C();
    swift_bridgeObjectRetain();
    sub_23309C2F0();
    uint64_t v9 = MEMORY[0x263F8EE78];
    v0[7] = MEMORY[0x263F8EE78];
    v0[8] = v9;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v15, v2, v4);
    sub_23308127C(&qword_268758C58, &qword_268758C40, MEMORY[0x263F8F7F0]);
    sub_23309BAE0();
    uint64_t v10 = sub_23308127C(&qword_268758C60, &qword_268758C28, MEMORY[0x263F8F7E0]);
    uint64_t v11 = (void *)swift_task_alloc();
    v0[21] = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_2330748F8;
    uint64_t v12 = v0[10];
    return MEMORY[0x270FA1E80](v0 + 2, v12, v10);
  }
  else
  {
    type metadata accessor for HDHRExtractionError(0);
    v0[5] = 200;
    sub_232F54C28(MEMORY[0x263F8EE78]);
    sub_233080EDC((unint64_t *)&qword_268756508, type metadata accessor for HDHRExtractionError);
    sub_23309AEA0();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
}

uint64_t sub_2330748F8()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[11];
    uint64_t v3 = v2[12];
    uint64_t v5 = v2[10];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = sub_23303F8A4;
  }
  else
  {
    uint64_t v6 = sub_233074A44;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_233074A44()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    uint64_t v2 = *(void **)(v0 + 24);
    id v3 = v1;
    MEMORY[0x237DB59C0]();
    if (*(void *)((*(void *)(v0 + 56) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v0 + 56) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_23309B9D0();
    sub_23309B9E0();
    sub_23309B9C0();
    id v4 = v2;
    MEMORY[0x237DB59C0]();
    if (*(void *)(*(void *)(v0 + 64) + 16) >= *(void *)(*(void *)(v0 + 64) + 24) >> 1) {
      sub_23309B9D0();
    }
    sub_23309B9E0();
    sub_23309B9C0();

    uint64_t v5 = sub_23308127C(&qword_268758C60, &qword_268758C28, MEMORY[0x263F8F7E0]);
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 168) = v6;
    void *v6 = v0;
    v6[1] = sub_2330748F8;
    uint64_t v7 = *(void *)(v0 + 80);
    return MEMORY[0x270FA1E80](v0 + 16, v7, v5);
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 152);
    uint64_t v9 = *(void *)(v0 + 128);
    uint64_t v10 = *(void *)(v0 + 136);
    (*(void (**)(void, void))(*(void *)(v0 + 88) + 8))(*(void *)(v0 + 96), *(void *)(v0 + 80));
    sub_233040D58(*(void **)(v0 + 16), *(void **)(v0 + 24));
    uint64_t v11 = *(void *)(v0 + 56);
    uint64_t v12 = *(void *)(v0 + 64);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    uint64_t v13 = MEMORY[0x263F8EE78];
    uint64_t v20 = MEMORY[0x263F8EE78];
    uint64_t v14 = *(void *)(v12 + 16);
    if (v14)
    {
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v14; ++i)
      {
        uint64_t v16 = *(void **)(v12 + 8 * i + 32);
        if (v16)
        {
          id v17 = v16;
          MEMORY[0x237DB59C0]();
          if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_23309B9D0();
          }
          sub_23309B9E0();
          sub_23309B9C0();
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v13 = v20;
    }
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    return v18(v11, v13);
  }
}

id sub_233074D58(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Extension();
  uint64_t v159 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  v174 = (char *)&v148 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v173 = (char *)&v148 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v148 - v8;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_233080D4C(0, &qword_268756F50, (uint64_t (*)(uint64_t))type metadata accessor for Coding, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v168 = (uint64_t)&v148 - v12;
  uint64_t v13 = type metadata accessor for Coding();
  uint64_t v162 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  v167 = (char *)&v148 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v154 = (uint64_t)&v148 - v16;
  uint64_t v17 = type metadata accessor for Identifier();
  uint64_t v179 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (uint64_t *)((char *)&v148 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_233080D4C(0, &qword_268758C78, type metadata accessor for ModelsDSTU2.HumanName, v10);
  MEMORY[0x270FA5388](v20 - 8);
  long long v22 = (char *)&v148 - v21;
  uint64_t v151 = *(void *)(v1 + 32);
  int v152 = *(_DWORD *)(v1 + 40);
  int v157 = *(unsigned __int8 *)(v1 + 44);
  uint64_t v153 = *(void *)(v1 + 48);
  uint64_t v23 = *(void *)(v1 + 64);
  uint64_t v161 = *(void *)(v1 + 56);
  v181 = *(void **)(v1 + 72);
  uint64_t v163 = *(void *)(v1 + 80);
  v178 = *(void **)(v1 + 88);
  uint64_t v150 = *(void *)(v1 + 96);
  uint64_t v155 = *(void *)(v1 + 104);
  uint64_t v24 = *(void *)(v1 + 120);
  uint64_t v149 = *(void *)(v1 + 112);
  sub_233072E08(v23, (uint64_t)&v148 - v21);
  uint64_t v25 = type metadata accessor for ModelsDSTU2.HumanName(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 48))(v22, 1, v25) == 1)
  {
    sub_233081680((uint64_t)v22, &qword_268758C78, type metadata accessor for ModelsDSTU2.HumanName);
  }
  else
  {
    uint64_t v156 = sub_233080884(a1);
    uint64_t v27 = v26;
    sub_2330814D0((uint64_t)v22, type metadata accessor for ModelsDSTU2.HumanName);
    uint64_t v160 = v27;
    if (v27) {
      goto LABEL_5;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v156 = 0;
  uint64_t v160 = 0xE000000000000000;
LABEL_5:
  unint64_t v28 = v167;
  uint64_t v29 = v163;
  v30 = v181;
  uint64_t v171 = v24;
  v192 = v9;
  uint64_t v182 = v13;
  uint64_t v170 = v17;
  if (v181)
  {
    uint64_t v31 = v181[2];
    if (v31)
    {
      swift_bridgeObjectRetain_n();
      long long v32 = v30 + 7;
      long long v33 = (void *)MEMORY[0x263F8EE78];
      do
      {
        uint64_t v35 = *(v32 - 2);
        if (v35)
        {
          uint64_t v37 = *(v32 - 1);
          uint64_t v36 = *v32;
          BOOL v38 = *(v32 - 3) == 0x6C69616D65 && v35 == 0xE500000000000000;
          if (v38 || (sub_23309C220()) && v36)
          {
            swift_bridgeObjectRetain();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              long long v33 = sub_232F3CCE0(0, v33[2] + 1, 1, v33);
            }
            unint64_t v40 = v33[2];
            unint64_t v39 = v33[3];
            if (v40 >= v39 >> 1) {
              long long v33 = sub_232F3CCE0((void *)(v39 > 1), v40 + 1, 1, v33);
            }
            v33[2] = v40 + 1;
            long long v34 = &v33[2 * v40];
            v34[4] = v37;
            v34[5] = v36;
          }
          uint64_t v9 = v192;
        }
        v32 += 4;
        --v31;
      }
      while (v31);
      v169 = v33;
      long long v41 = v181;
      swift_bridgeObjectRelease_n();
      uint64_t v42 = v41[2];
      if (v42)
      {
        swift_bridgeObjectRetain_n();
        uint64_t v43 = v41 + 7;
        uint64_t v44 = (void *)MEMORY[0x263F8EE78];
        do
        {
          uint64_t v46 = *(v43 - 2);
          if (v46)
          {
            uint64_t v48 = *(v43 - 1);
            uint64_t v47 = *v43;
            BOOL v49 = *(v43 - 3) == 0x656E6F6870 && v46 == 0xE500000000000000;
            if (v49 || (sub_23309C220()) && v47)
            {
              swift_bridgeObjectRetain();
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v44 = sub_232F3CCE0(0, v44[2] + 1, 1, v44);
              }
              unint64_t v51 = v44[2];
              unint64_t v50 = v44[3];
              if (v51 >= v50 >> 1) {
                uint64_t v44 = sub_232F3CCE0((void *)(v50 > 1), v51 + 1, 1, v44);
              }
              v44[2] = v51 + 1;
              uint64_t v45 = &v44[2 * v51];
              v45[4] = v48;
              v45[5] = v47;
            }
            uint64_t v9 = v192;
          }
          v43 += 4;
          --v42;
        }
        while (v42);
        swift_bridgeObjectRelease_n();
      }
      else
      {
        uint64_t v44 = (void *)MEMORY[0x263F8EE78];
      }
      uint64_t v52 = (uint64_t)v169;
      uint64_t v24 = v171;
      unint64_t v28 = v167;
      uint64_t v17 = v170;
      uint64_t v29 = v163;
    }
    else
    {
      uint64_t v52 = MEMORY[0x263F8EE78];
      uint64_t v44 = (void *)MEMORY[0x263F8EE78];
    }
  }
  else
  {
    uint64_t v44 = 0;
    uint64_t v52 = 0;
  }
  v169 = (void *)v52;
  v166 = v44;
  if (v29)
  {
    uint64_t v177 = *(void *)(v29 + 16);
    if (v177)
    {
      uint64_t v176 = v29 + ((*(unsigned __int8 *)(v179 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v179 + 80));
      v180 = v28 + 8;
      v164 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v162 + 56);
      v158 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v162 + 48);
      uint64_t v175 = *(void *)(v179 + 72);
      swift_bridgeObjectRetain_n();
      uint64_t v53 = 0;
      long long v54 = (void *)MEMORY[0x263F8EE78];
      long long v172 = xmmword_2330A1EB0;
      while (1)
      {
        sub_2330815B0(v176 + v175 * v53, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for Identifier);
        uint64_t v55 = (void *)((char *)v19 + *(int *)(v17 + 28));
        uint64_t v56 = v55[1];
        if (v56) {
          break;
        }
        sub_2330814D0((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for Identifier);
LABEL_47:
        if (++v53 == v177)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v52 = (uint64_t)v169;
          uint64_t v44 = v166;
          goto LABEL_76;
        }
      }
      v181 = v54;
      uint64_t v58 = v19[2];
      unint64_t v57 = v19[3];
      uint64_t v179 = *v55;
      if (v57)
      {
        if (v57 != 1)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
LABEL_66:
          sub_233081484(0, &qword_268757058, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
          uint64_t v70 = swift_allocObject();
          *(_OWORD *)(v70 + 16) = v172;
          *(void *)(v70 + 32) = v58;
          *(void *)(v70 + 40) = v57;
          *(void *)(v70 + 48) = v179;
          *(void *)(v70 + 56) = v56;
          sub_2330814D0((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for Identifier);
          long long v54 = v181;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            long long v54 = sub_232F3CE10(0, v54[2] + 1, 1, v54);
          }
          unint64_t v72 = v54[2];
          unint64_t v71 = v54[3];
          if (v72 >= v71 >> 1) {
            long long v54 = sub_232F3CE10((void *)(v71 > 1), v72 + 1, 1, v54);
          }
          v54[2] = v72 + 1;
          v54[v72 + 4] = v70;
          goto LABEL_47;
        }
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v59 = v19[4];
        if (v59)
        {
          uint64_t v60 = *(void *)(v59 + 16);
          if (v60)
          {
            uint64_t v61 = v162;
            uint64_t v62 = v59 + ((*(unsigned __int8 *)(v162 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v162 + 80));
            swift_bridgeObjectRetain();
            sub_232E967F8(v58, 0);
            swift_bridgeObjectRetain();
            uint64_t v63 = *(void *)(v61 + 72);
            uint64_t v64 = (uint64_t)v167;
            while (1)
            {
              sub_2330815B0(v62, v64, (uint64_t (*)(void))type metadata accessor for Coding);
              if (*(void *)&v180[*(int *)(v182 + 24)]) {
                break;
              }
              sub_2330814D0(v64, (uint64_t (*)(void))type metadata accessor for Coding);
              v62 += v63;
              if (!--v60) {
                goto LABEL_61;
              }
            }
            uint64_t v65 = v168;
            sub_233081618(v64, v168, (uint64_t (*)(void))type metadata accessor for Coding);
            long long v66 = *v164;
            uint64_t v67 = v65;
            uint64_t v68 = 0;
          }
          else
          {
            swift_bridgeObjectRetain();
            sub_232E967F8(v58, 0);
            swift_bridgeObjectRetain();
LABEL_61:
            long long v66 = *v164;
            uint64_t v65 = v168;
            uint64_t v67 = v168;
            uint64_t v68 = 1;
          }
          uint64_t v69 = v182;
          v66(v67, v68, 1, v182);
          uint64_t v24 = v171;
          uint64_t v17 = v170;
          swift_bridgeObjectRelease();
          if ((*v158)(v65, 1, v69) != 1)
          {
            uint64_t v73 = v154;
            sub_233081618(v65, v154, (uint64_t (*)(void))type metadata accessor for Coding);
            long long v74 = (uint64_t *)(v73 + *(int *)(v182 + 24));
            uint64_t v75 = *v74;
            unint64_t v57 = v74[1];
            swift_bridgeObjectRetain();
            uint64_t v76 = v73;
            uint64_t v17 = v170;
            sub_2330814D0(v76, (uint64_t (*)(void))type metadata accessor for Coding);
            sub_232E96840(v58, 0);
            uint64_t v9 = v192;
            if (v57)
            {
              uint64_t v58 = v75;
              goto LABEL_66;
            }
            goto LABEL_65;
          }
        }
        else
        {
          uint64_t v65 = v168;
          (*v164)(v168, 1, 1, v182);
          swift_bridgeObjectRetain();
          sub_232E967F8(v58, 0);
        }
        sub_233081680(v65, &qword_268756F50, (uint64_t (*)(uint64_t))type metadata accessor for Coding);
        sub_232E96840(v58, 0);
        uint64_t v9 = v192;
      }
LABEL_65:
      uint64_t v58 = 0;
      unint64_t v57 = 0xE000000000000000;
      goto LABEL_66;
    }
    long long v54 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    long long v54 = 0;
  }
LABEL_76:
  if (v178)
  {
    uint64_t v77 = v178[2];
    if (v77)
    {
      uint64_t v78 = swift_bridgeObjectRetain();
      long long v79 = (void *)MEMORY[0x263F8EE78];
      uint64_t v80 = 32;
      do
      {
        long long v81 = *(_OWORD *)(v78 + v80 + 112);
        long long v189 = *(_OWORD *)(v78 + v80 + 96);
        long long v190 = v81;
        uint64_t v191 = *(void *)(v78 + v80 + 128);
        long long v82 = *(_OWORD *)(v78 + v80 + 48);
        long long v185 = *(_OWORD *)(v78 + v80 + 32);
        long long v186 = v82;
        long long v83 = *(_OWORD *)(v78 + v80 + 80);
        long long v187 = *(_OWORD *)(v78 + v80 + 64);
        long long v188 = v83;
        long long v84 = *(_OWORD *)(v78 + v80 + 16);
        long long v183 = *(_OWORD *)(v78 + v80);
        long long v184 = v84;
        Swift::String v85 = Address.formattedAddressString()();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          long long v79 = sub_232F3CCE0(0, v79[2] + 1, 1, v79);
        }
        unint64_t v87 = v79[2];
        unint64_t v86 = v79[3];
        v88 = v79;
        if (v87 >= v86 >> 1) {
          v88 = sub_232F3CCE0((void *)(v86 > 1), v87 + 1, 1, v79);
        }
        v88[2] = v87 + 1;
        long long v79 = v88;
        *(Swift::String *)&v88[2 * v87 + 4] = v85;
        v80 += 136;
        --v77;
        uint64_t v78 = (uint64_t)v178;
      }
      while (v77);
      swift_bridgeObjectRelease();
      uint64_t v52 = (uint64_t)v169;
      uint64_t v44 = v166;
    }
    else
    {
      long long v79 = (void *)MEMORY[0x263F8EE78];
    }
  }
  else
  {
    long long v79 = 0;
  }
  v178 = v79;
  if (v24)
  {
    uint64_t v89 = *(void *)(v24 + 16);
    v181 = v54;
    if (v89)
    {
      uint64_t v90 = v24 + ((*(unsigned __int8 *)(v159 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v159 + 80));
      uint64_t v182 = *(void *)(v159 + 72);
      swift_bridgeObjectRetain();
      v91 = (void *)MEMORY[0x263F8EE78];
      uint64_t v179 = 0x80000002330B6B80;
      v180 = (char *)0xD00000000000003CLL;
      do
      {
        sub_2330815B0(v90, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for Extension);
        v92._uint64_t countAndFlagsBits = 0xD00000000000003DLL;
        v92._object = (void *)0x80000002330B6B40;
        Swift::String_optional v95 = Extension.stringValueForExtension(with:)(v92);
        object = v95.value._object;
        uint64_t countAndFlagsBits = v95.value._countAndFlagsBits;
        if (v95.value._object
          || (v96._object = (void *)v179,
              v96._uint64_t countAndFlagsBits = (uint64_t)v180,
              Swift::String_optional v97 = Extension.stringValueForExtension(with:)(v96),
              object = v97.value._object,
              uint64_t countAndFlagsBits = v97.value._countAndFlagsBits,
              v97.value._object))
        {
          uint64_t v98 = countAndFlagsBits;
          v99 = object;
          sub_2330814D0((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for Extension);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v91 = sub_232F3CCE0(0, v91[2] + 1, 1, v91);
          }
          unint64_t v101 = v91[2];
          unint64_t v100 = v91[3];
          if (v101 >= v100 >> 1) {
            v91 = sub_232F3CCE0((void *)(v100 > 1), v101 + 1, 1, v91);
          }
          v91[2] = v101 + 1;
          v102 = &v91[2 * v101];
          v102[4] = v98;
          v102[5] = v99;
          uint64_t v9 = v192;
        }
        else
        {
          sub_2330814D0((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for Extension);
        }
        v90 += v182;
        --v89;
      }
      while (v89);
      uint64_t v24 = v171;
      swift_bridgeObjectRelease();
      long long v54 = v181;
    }
    else
    {
      v91 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v106 = (uint64_t)v173;
    if (v91[2])
    {
      uint64_t v107 = v91[5];
      uint64_t v177 = v91[4];
      uint64_t v175 = v107;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v177 = 0;
      uint64_t v175 = 0;
    }
    swift_bridgeObjectRelease();
    uint64_t v108 = *(void *)(v24 + 16);
    if (v108)
    {
      uint64_t v109 = v24 + ((*(unsigned __int8 *)(v159 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v159 + 80));
      v192 = *(char **)(v159 + 72);
      swift_bridgeObjectRetain();
      v110 = (void *)MEMORY[0x263F8EE78];
      uint64_t v182 = 0x80000002330B6BC0;
      v180 = (char *)0x80000002330B6C10;
      uint64_t v111 = v108;
      do
      {
        sub_2330815B0(v109, v106, (uint64_t (*)(void))type metadata accessor for Extension);
        v112._uint64_t countAndFlagsBits = 0xD000000000000042;
        v112._object = (void *)v182;
        Swift::String_optional v115 = Extension.stringValueForExtension(with:)(v112);
        v114 = v115.value._object;
        uint64_t v113 = v115.value._countAndFlagsBits;
        if (v115.value._object
          || (v116._uint64_t countAndFlagsBits = 0xD000000000000041,
              v116._object = v180,
              Swift::String_optional v117 = Extension.stringValueForExtension(with:)(v116),
              v114 = v117.value._object,
              uint64_t v113 = v117.value._countAndFlagsBits,
              v117.value._object))
        {
          uint64_t v118 = v113;
          v119 = v114;
          sub_2330814D0(v106, (uint64_t (*)(void))type metadata accessor for Extension);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v110 = sub_232F3CCE0(0, v110[2] + 1, 1, v110);
          }
          unint64_t v121 = v110[2];
          unint64_t v120 = v110[3];
          if (v121 >= v120 >> 1) {
            v110 = sub_232F3CCE0((void *)(v120 > 1), v121 + 1, 1, v110);
          }
          v110[2] = v121 + 1;
          v122 = &v110[2 * v121];
          v122[4] = v118;
          v122[5] = v119;
          uint64_t v106 = (uint64_t)v173;
        }
        else
        {
          sub_2330814D0(v106, (uint64_t (*)(void))type metadata accessor for Extension);
        }
        v109 += (uint64_t)v192;
        --v111;
      }
      while (v111);
      uint64_t v24 = v171;
      swift_bridgeObjectRelease();
      long long v54 = v181;
    }
    else
    {
      v110 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v123 = (uint64_t)v174;
    if (v110[2])
    {
      uint64_t v124 = v110[5];
      uint64_t v176 = v110[4];
      uint64_t v179 = v124;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v176 = 0;
      uint64_t v179 = 0;
    }
    swift_bridgeObjectRelease();
    if (v108)
    {
      uint64_t v125 = v24 + ((*(unsigned __int8 *)(v159 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v159 + 80));
      v192 = *(char **)(v159 + 72);
      swift_bridgeObjectRetain();
      v126 = (void *)MEMORY[0x263F8EE78];
      uint64_t v182 = 0xD000000000000040;
      v180 = (char *)0x80000002330B6CB0;
      do
      {
        sub_2330815B0(v125, v123, (uint64_t (*)(void))type metadata accessor for Extension);
        v127._uint64_t countAndFlagsBits = 0xD000000000000041;
        v127._object = (void *)0x80000002330B6C60;
        Swift::String_optional v130 = Extension.stringValueForExtension(with:)(v127);
        v129 = v130.value._object;
        uint64_t v128 = v130.value._countAndFlagsBits;
        if (v130.value._object
          || (v131._uint64_t countAndFlagsBits = v182,
              v131._object = v180,
              Swift::String_optional v132 = Extension.stringValueForExtension(with:)(v131),
              v129 = v132.value._object,
              uint64_t v128 = v132.value._countAndFlagsBits,
              v132.value._object))
        {
          uint64_t v133 = v128;
          v134 = v129;
          sub_2330814D0(v123, (uint64_t (*)(void))type metadata accessor for Extension);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v126 = sub_232F3CCE0(0, v126[2] + 1, 1, v126);
          }
          unint64_t v136 = v126[2];
          unint64_t v135 = v126[3];
          if (v136 >= v135 >> 1) {
            v126 = sub_232F3CCE0((void *)(v135 > 1), v136 + 1, 1, v126);
          }
          v126[2] = v136 + 1;
          v137 = &v126[2 * v136];
          v137[4] = v133;
          v137[5] = v134;
          uint64_t v123 = (uint64_t)v174;
        }
        else
        {
          sub_2330814D0(v123, (uint64_t (*)(void))type metadata accessor for Extension);
        }
        v125 += (uint64_t)v192;
        --v108;
      }
      while (v108);
      swift_bridgeObjectRelease();
      long long v54 = v181;
    }
    else
    {
      v126 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v105 = v175;
    if (v126[2])
    {
      uint64_t v103 = v126[4];
      uint64_t v104 = v126[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v103 = 0;
      uint64_t v104 = 0;
    }
    uint64_t v52 = (uint64_t)v169;
    uint64_t v44 = v166;
  }
  else
  {
    uint64_t v103 = 0;
    uint64_t v104 = 0;
    uint64_t v176 = 0;
    uint64_t v179 = 0;
    uint64_t v177 = 0;
    uint64_t v105 = 0;
  }
  if (v157)
  {
    v138 = 0;
    if (v52)
    {
LABEL_140:
      uint64_t v139 = v52;
      uint64_t v140 = *(void *)(v52 + 16);
      swift_bridgeObjectRetain();
      if (!v140)
      {
        swift_bridgeObjectRelease();
        uint64_t v139 = 0;
      }
      uint64_t v44 = v166;
      goto LABEL_147;
    }
  }
  else
  {
    *(void *)&long long v183 = v151;
    DWORD2(v183) = v152 & 0x1FF01FF;
    uint64_t v141 = v165;
    id v142 = FHIRDate.asMedicalDate()();
    uint64_t v165 = v141;
    if (v141)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (id)swift_bridgeObjectRelease();
    }
    v138 = v142;
    uint64_t v52 = (uint64_t)v169;
    uint64_t v44 = v166;
    if (v169) {
      goto LABEL_140;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v139 = 0;
LABEL_147:
  uint64_t v144 = v155;
  if (v44 && !v44[2])
  {
    swift_bridgeObjectRelease();
    uint64_t v144 = v155;
    uint64_t v44 = 0;
  }
  if (v144 == 1)
  {
    uint64_t v145 = 0;
    v146 = 0;
  }
  else
  {
    *(void *)&long long v183 = v150;
    *((void *)&v183 + 1) = v144;
    *(void *)&long long v184 = v149;
    Swift::String_optional v147 = CodeableConcept.preferredDisplayString()();
    uint64_t v145 = v147.value._countAndFlagsBits;
    v146 = v147.value._object;
  }
  sub_232F3A800(0, &qword_268758798);
  return sub_23301637C(v156, v160, v138, v153, v161, v139, (uint64_t)v44, (uint64_t)v54, (uint64_t)v178, v145, (uint64_t)v146, v177, v105, v176, v179, v103, v104);
}

uint64_t sub_233076234(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v5 = (void *)swift_task_alloc();
  v3[5] = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_2330762D8;
  return sub_23307645C(a3);
}

uint64_t sub_2330762D8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 48) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2330763D8, 0, 0);
}

uint64_t sub_2330763D8()
{
  uint64_t v1 = (void *)v0[6];
  if (v1)
  {
    id v2 = sub_23307720C(v0[4], v1);
    uint64_t v3 = v0[6];
  }
  else
  {
    uint64_t v3 = 0;
    id v2 = 0;
  }
  uint64_t v4 = (void *)v0[2];
  *uint64_t v4 = v3;
  v4[1] = v2;
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_23307645C(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  sub_233080D4C(0, &qword_268756558, type metadata accessor for ModelsDSTU2.ResourceProxy, MEMORY[0x263F8D8F0]);
  v2[4] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for ModelsDSTU2.ResourceProxy(0);
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_233076578, 0, 0);
}

uint64_t sub_233076578()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  uint64_t v4 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v5 = type metadata accessor for ModelsDSTU2.Bundle.BundleEntry(0);
  sub_233081530(v4 + *(int *)(v5 + 20), v3, &qword_268756558, type metadata accessor for ModelsDSTU2.ResourceProxy);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_233081680(v0[4], &qword_268756558, type metadata accessor for ModelsDSTU2.ResourceProxy);
    if (qword_2687563A0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_23309B4B0();
    __swift_project_value_buffer(v6, (uint64_t)qword_268770F68);
    uint64_t v7 = sub_23309B4A0();
    os_log_type_t v8 = sub_23309BB80();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_232E63000, v7, v8, "ModelsDSTU2.Bundle.BundleEntry.extractMedicalRecord: no “resource” entry, skipping", v9, 2u);
      MEMORY[0x237DB6EC0](v9, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10(0);
  }
  else
  {
    sub_233081618(v0[4], v0[7], type metadata accessor for ModelsDSTU2.ResourceProxy);
    uint64_t v12 = (void *)swift_task_alloc();
    v0[8] = v12;
    void *v12 = v0;
    v12[1] = sub_2330767BC;
    uint64_t v13 = v0[2];
    return sub_23307694C(v13);
  }
}

uint64_t sub_2330767BC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 72) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2330768BC, 0, 0);
}

uint64_t sub_2330768BC()
{
  sub_2330814D0(v0[7], type metadata accessor for ModelsDSTU2.ResourceProxy);
  uint64_t v1 = v0[9];
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_23307694C(uint64_t a1)
{
  v2[15] = a1;
  v2[16] = v1;
  v2[17] = type metadata accessor for ModelsDSTU2.ResourceProxy(0);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  uint64_t v4 = (void *)swift_task_alloc();
  v2[20] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_233076A2C;
  return sub_233077BD8(a1);
}

uint64_t sub_233076A2C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 168) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_233076B84, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_233076B84()
{
  uint64_t v39 = v0;
  uint64_t v1 = *(void **)(v0 + 168);
  *(void *)(v0 + 88) = v1;
  id v2 = v1;
  sub_232F3FD80(0, (unint64_t *)&qword_268757070);
  if (!swift_dynamicCast()) {
    goto LABEL_5;
  }
  unint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v6 = *(void *)(v0 + 40);
  int v7 = *(unsigned __int8 *)(v0 + 48);
  if (v7 != 7 || v4 | v3 | v5 | v6)
  {
    sub_23304B118((void *)v3, v4, v5, v6, v7);
LABEL_5:

    if (qword_2687563A0 != -1) {
      swift_once();
    }
    os_log_type_t v8 = *(void **)(v0 + 168);
    uint64_t v9 = *(void *)(v0 + 152);
    uint64_t v10 = *(void *)(v0 + 128);
    uint64_t v11 = sub_23309B4B0();
    __swift_project_value_buffer(v11, (uint64_t)qword_268770F68);
    sub_2330815B0(v10, v9, type metadata accessor for ModelsDSTU2.ResourceProxy);
    id v12 = v8;
    id v13 = v8;
    uint64_t v14 = sub_23309B4A0();
    os_log_type_t v15 = sub_23309BB80();
    BOOL v16 = os_log_type_enabled(v14, v15);
    uint64_t v17 = *(void **)(v0 + 168);
    uint64_t v18 = *(void *)(v0 + 152);
    if (v16)
    {
      uint64_t v19 = *(void *)(v0 + 144);
      uint64_t v20 = swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = v37;
      *(_DWORD *)uint64_t v20 = 136315394;
      sub_2330815B0(v18, v19, type metadata accessor for ModelsDSTU2.ResourceProxy);
      uint64_t v21 = sub_23309B770();
      *(void *)(v0 + 96) = sub_232F62B64(v21, v22, &v38);
      sub_23309BD10();
      swift_bridgeObjectRelease();
      sub_2330814D0(v18, type metadata accessor for ModelsDSTU2.ResourceProxy);
      *(_WORD *)(v20 + 12) = 2080;
      *(void *)(v0 + 104) = v17;
      id v23 = v17;
      id v24 = v17;
      sub_23309C320();
      id v25 = (id)HKSensitiveLogItem();
      swift_unknownObjectRelease();
      sub_23309BDB0();
      swift_unknownObjectRelease();
      uint64_t v26 = sub_23309B770();
      unint64_t v28 = v27;

      *(void *)(v0 + 112) = sub_232F62B64(v26, v28, &v38);
      sub_23309BD10();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_232E63000, v14, v15, "ModelsDSTU2.ResourceProxy.extractMedicalRecord: failed to convert %s to HKMedicalRecord, returning HKUnknownRecord. Error: %s", (uint8_t *)v20, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x237DB6EC0](v37, -1, -1);
      MEMORY[0x237DB6EC0](v20, -1, -1);
    }
    else
    {
      sub_2330814D0(*(void *)(v0 + 152), type metadata accessor for ModelsDSTU2.ResourceProxy);
    }
    uint64_t v29 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v29;
    *uint64_t v29 = v0;
    v29[1] = sub_233077094;
    uint64_t v30 = *(void *)(v0 + 120);
    return sub_23307E9A0(v30);
  }

  if (qword_2687563A0 != -1) {
    swift_once();
  }
  uint64_t v32 = sub_23309B4B0();
  __swift_project_value_buffer(v32, (uint64_t)qword_268770F68);
  long long v33 = sub_23309B4A0();
  os_log_type_t v34 = sub_23309BB60();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v35 = 0;
    _os_log_impl(&dword_232E63000, v33, v34, "ModelsDSTU2.ResourceProxy.extractMedicalRecord: found entered-in-error record, skipping", v35, 2u);
    MEMORY[0x237DB6EC0](v35, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v36 = *(uint64_t (**)(void))(v0 + 8);
  return v36(0);
}

uint64_t sub_233077094(uint64_t a1)
{
  *(void *)(*(void *)v1 + 184) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_233077194, 0, 0);
}

uint64_t sub_233077194()
{
  uint64_t v1 = *(void *)(v0 + 184);
  swift_task_dealloc();
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

id sub_23307720C(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  uint64_t v4 = (int *)type metadata accessor for FHIRExtractionContext();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_233080D4C(0, &qword_268756558, type metadata accessor for ModelsDSTU2.ResourceProxy, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v36 - v8;
  uint64_t v10 = type metadata accessor for ModelsDSTU2.ResourceProxy(0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for ModelsDSTU2.Bundle.BundleEntry(0);
  sub_233081530((uint64_t)v3 + *(int *)(v14 + 20), (uint64_t)v9, &qword_268756558, type metadata accessor for ModelsDSTU2.ResourceProxy);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_233081680((uint64_t)v9, &qword_268756558, type metadata accessor for ModelsDSTU2.ResourceProxy);
    if (qword_2687563A0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_23309B4B0();
    __swift_project_value_buffer(v15, (uint64_t)qword_268770F68);
    BOOL v16 = sub_23309B4A0();
    os_log_type_t v17 = sub_23309BB80();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_232E63000, v16, v17, "ModelsDSTU2.Bundle.BundleEntry.asClinicalRecord: no “resource” entry, skipping", v18, 2u);
      MEMORY[0x237DB6EC0](v18, -1, -1);
    }

    return 0;
  }
  else
  {
    sub_233081618((uint64_t)v9, (uint64_t)v13, type metadata accessor for ModelsDSTU2.ResourceProxy);
    ModelsDSTU2.ResourceProxy.get()(v39);
    uint64_t v20 = v40;
    uint64_t v21 = v41;
    __swift_project_boxed_opaque_existential_1(v39, v40);
    uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 24))(v20, v21);
    uint64_t v24 = v23;
    uint64_t v25 = *v3;
    uint64_t v26 = v3[1];
    unint64_t v27 = self;
    swift_bridgeObjectRetain();
    id v28 = objc_msgSend(v27, sel_primaryDSTU2Version);
    uint64_t v29 = (uint64_t *)((char *)v3 + *(int *)(v14 + 24));
    uint64_t v30 = *v29;
    unint64_t v31 = v29[1];
    sub_2330815B0(v37, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
    uint64_t v32 = (uint64_t *)&v6[v4[5]];
    *uint64_t v32 = v22;
    v32[1] = v24;
    long long v33 = &v6[v4[6]];
    *(void *)long long v33 = v25;
    *((void *)v33 + 1) = v26;
    *(void *)&v6[v4[7]] = v28;
    os_log_type_t v34 = (uint64_t *)&v6[v4[8]];
    *os_log_type_t v34 = v30;
    v34[1] = v31;
    sub_232E9A9F4(v30, v31);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
    id v19 = sub_233077614((uint64_t)v6, v38);
    sub_2330814D0((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for FHIRExtractionContext);
    sub_2330814D0((uint64_t)v13, type metadata accessor for ModelsDSTU2.ResourceProxy);
  }
  return v19;
}

id sub_233077614(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for ModelsDSTU2.ResourceProxy(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = (void *)sub_232FE782C(a2);
  unint64_t v7 = sub_233020734(v6);
  swift_bridgeObjectRelease();
  id v8 = v5;
  uint64_t v9 = sub_233086410();
  id v11 = sub_23307F9FC(a1, v8, v7, v9, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v11;
}

uint64_t sub_233077BD8(uint64_t a1)
{
  v2[8] = a1;
  v2[9] = v1;
  type metadata accessor for ModelsDSTU2.Observation(0);
  v2[10] = swift_task_alloc();
  type metadata accessor for ModelsDSTU2.Immunization(0);
  v2[11] = swift_task_alloc();
  type metadata accessor for ModelsDSTU2.DiagnosticReport(0);
  v2[12] = swift_task_alloc();
  type metadata accessor for ModelsDSTU2.Condition(0);
  v2[13] = swift_task_alloc();
  v2[14] = type metadata accessor for ModelsDSTU2.ResourceProxy(0);
  v2[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_233077D1C, 0, 0);
}

uint64_t sub_233077D1C()
{
  sub_2330815B0(v0[9], v0[15], type metadata accessor for ModelsDSTU2.ResourceProxy);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_233081618(v0[15], v0[13], type metadata accessor for ModelsDSTU2.Condition);
      uint64_t v3 = (void *)swift_task_alloc();
      v0[16] = v3;
      *uint64_t v3 = v0;
      v3[1] = sub_233078130;
      uint64_t v4 = v0[8];
      uint64_t result = sub_233078E4C(v4);
      break;
    case 2u:
      sub_233081618(v0[15], v0[12], type metadata accessor for ModelsDSTU2.DiagnosticReport);
      uint64_t v5 = (void *)swift_task_alloc();
      v0[19] = v5;
      *uint64_t v5 = v0;
      v5[1] = sub_233078318;
      uint64_t v6 = v0[8];
      uint64_t result = sub_23307A910(v6);
      break;
    case 3u:
      sub_233081618(v0[15], v0[11], type metadata accessor for ModelsDSTU2.Immunization);
      uint64_t v18 = (void *)swift_task_alloc();
      v0[22] = v18;
      *uint64_t v18 = v0;
      v18[1] = sub_233078500;
      uint64_t v19 = v0[8];
      uint64_t result = sub_23307BBEC(v19);
      break;
    case 4u:
      sub_233081618(v0[15], v0[10], type metadata accessor for ModelsDSTU2.Observation);
      unint64_t v7 = (void *)swift_task_alloc();
      v0[25] = v7;
      *unint64_t v7 = v0;
      v7[1] = sub_2330786E8;
      uint64_t v8 = v0[8];
      uint64_t result = sub_23307CC08(v8);
      break;
    case 6u:
      uint64_t v9 = (uint64_t *)v0[15];
      uint64_t v10 = *v9;
      uint64_t v11 = v9[1];
      v0[28] = v11;
      uint64_t v12 = v9[2];
      uint64_t v13 = v9[3];
      v0[29] = v13;
      uint64_t v15 = v9[4];
      uint64_t v14 = v9[5];
      v0[30] = v14;
      v0[2] = v10;
      v0[3] = v11;
      v0[4] = v12;
      v0[5] = v13;
      v0[6] = v15;
      v0[7] = v14;
      BOOL v16 = (void *)swift_task_alloc();
      v0[31] = v16;
      *BOOL v16 = v0;
      v16[1] = sub_2330788D0;
      uint64_t v17 = v0[8];
      uint64_t result = sub_232F68640(v17);
      break;
    default:
      sub_2330814D0(v0[15], type metadata accessor for ModelsDSTU2.ResourceProxy);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v1 = (uint64_t (*)(void))v0[1];
      uint64_t result = v1(0);
      break;
  }
  return result;
}

uint64_t sub_233078130(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 136) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_233078AB4;
  }
  else
  {
    *(void *)(v4 + 144) = a1;
    uint64_t v5 = sub_233078258;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_233078258()
{
  uint64_t v1 = v0[18];
  sub_2330814D0(v0[13], type metadata accessor for ModelsDSTU2.Condition);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_233078318(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 160) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_233078B6C;
  }
  else
  {
    *(void *)(v4 + 168) = a1;
    uint64_t v5 = sub_233078440;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_233078440()
{
  uint64_t v1 = v0[21];
  sub_2330814D0(v0[12], type metadata accessor for ModelsDSTU2.DiagnosticReport);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_233078500(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 184) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_233078C24;
  }
  else
  {
    *(void *)(v4 + 192) = a1;
    uint64_t v5 = sub_233078628;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_233078628()
{
  uint64_t v1 = v0[24];
  sub_2330814D0(v0[11], type metadata accessor for ModelsDSTU2.Immunization);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_2330786E8(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 208) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_233078CDC;
  }
  else
  {
    *(void *)(v4 + 216) = a1;
    uint64_t v5 = sub_233078810;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_233078810()
{
  uint64_t v1 = v0[27];
  sub_2330814D0(v0[10], type metadata accessor for ModelsDSTU2.Observation);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_2330788D0(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 256) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_233078D94;
  }
  else
  {
    swift_bridgeObjectRelease();
    *(void *)(v4 + 264) = a1;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_233078A10;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_233078A10()
{
  uint64_t v1 = *(void *)(v0 + 264);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_233078AB4()
{
  sub_2330814D0(*(void *)(v0 + 104), type metadata accessor for ModelsDSTU2.Condition);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_233078B6C()
{
  sub_2330814D0(*(void *)(v0 + 96), type metadata accessor for ModelsDSTU2.DiagnosticReport);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_233078C24()
{
  sub_2330814D0(*(void *)(v0 + 88), type metadata accessor for ModelsDSTU2.Immunization);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_233078CDC()
{
  sub_2330814D0(*(void *)(v0 + 80), type metadata accessor for ModelsDSTU2.Observation);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_233078D94()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_233078E4C(uint64_t a1)
{
  v2[13] = a1;
  v2[14] = v1;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_233080D4C(0, &qword_268756580, (uint64_t (*)(uint64_t))type metadata accessor for Reference, MEMORY[0x263F8D8F0]);
  v2[15] = swift_task_alloc();
  sub_233080D4C(0, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690], v3);
  v2[16] = swift_task_alloc();
  type metadata accessor for RecordExtractionContext();
  v2[17] = swift_task_alloc();
  sub_23309AD60();
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  sub_233080D4C(0, &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period, v3);
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  v2[25] = type metadata accessor for ModelsDSTU2.Condition(0);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  sub_233080D4C(0, &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime, v3);
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for FHIRDateTime();
  v2[37] = v4;
  v2[38] = *(void *)(v4 - 8);
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2330791A0, 0, 0);
}

uint64_t sub_2330791A0()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[14];
  uint64_t v3 = &off_264BDA000;
  if (*(void *)(v2 + *(int *)(v1 + 64) + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_23309B6E0();
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(self, sel_inspectableValueWithString_, v4);

    goto LABEL_3;
  }
  uint64_t v16 = v0[37];
  uint64_t v17 = v0[38];
  uint64_t v18 = v0[35];
  uint64_t v19 = v0[29];
  sub_233081530(v2 + *(int *)(v1 + 56), v18, &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
  sub_2330815B0(v2, v19, type metadata accessor for ModelsDSTU2.Condition);
  uint64_t v20 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48);
  if (v20(v18, 1, v16) == 1)
  {
    uint64_t v21 = v0[24];
    uint64_t v22 = v0[25];
    sub_233081530(v0[29] + *(int *)(v22 + 60), v21, &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period);
    uint64_t v23 = type metadata accessor for Period();
    uint64_t v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 48);
    if (v24(v21, 1, v23) == 1)
    {
      uint64_t v25 = v0[37];
      uint64_t v26 = v0[38];
      uint64_t v27 = v0[34];
      sub_233081680(v0[24], &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56))(v27, 1, 1, v25);
    }
    else
    {
      uint64_t v49 = v0[24];
      sub_233081530(v49, v0[34], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
      sub_2330814D0(v49, (uint64_t (*)(void))type metadata accessor for Period);
    }
    uint64_t v50 = v0[37];
    uint64_t v51 = v0[34];
    sub_233081618(v0[29], v0[28], type metadata accessor for ModelsDSTU2.Condition);
    if (v20(v51, 1, v50) == 1)
    {
      uint64_t v52 = v0[28];
      uint64_t v53 = v0[23];
      sub_233081530(v52 + *(int *)(v22 + 60), v53, &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period);
      sub_2330814D0(v52, type metadata accessor for ModelsDSTU2.Condition);
      if (v24(v53, 1, v23) == 1)
      {
        uint64_t v54 = v0[37];
        uint64_t v55 = v0[38];
        uint64_t v56 = v0[36];
        sub_233081680(v0[23], &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v55 + 56))(v56, 1, 1, v54);
      }
      else
      {
        uint64_t v104 = v0[23];
        sub_233081530(v104 + *(int *)(v23 + 20), v0[36], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
        sub_2330814D0(v104, (uint64_t (*)(void))type metadata accessor for Period);
      }
      uint64_t v3 = &off_264BDA000;
      sub_233081680(v0[34], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
    }
    else
    {
      uint64_t v57 = v0[37];
      uint64_t v58 = v0[38];
      uint64_t v59 = v0[36];
      uint64_t v60 = v0[34];
      sub_2330814D0(v0[28], type metadata accessor for ModelsDSTU2.Condition);
      sub_233081618(v60, v59, (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v58 + 56))(v59, 0, 1, v57);
      uint64_t v3 = &off_264BDA000;
    }
    uint64_t v105 = v0[36];
    uint64_t v106 = v0[37];
    sub_233081680(v0[35], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
    if (v20(v105, 1, v106) == 1)
    {
      sub_233081680(v0[36], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
      id v5 = 0;
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v41 = v0[37];
    uint64_t v42 = v0[38];
    uint64_t v44 = v0[35];
    uint64_t v43 = v0[36];
    sub_2330814D0(v0[29], type metadata accessor for ModelsDSTU2.Condition);
    sub_233081618(v44, v43, (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v42 + 56))(v43, 0, 1, v41);
  }
  uint64_t v107 = v0[40];
  sub_233081618(v0[36], v107, (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
  uint64_t v108 = *(void *)(v107 + 56);
  uint64_t v109 = v0[40];
  if (v108 == 1)
  {
    if (*(unsigned char *)(v109 + 19))
    {
      if (*(unsigned char *)(v109 + 17)) {
        uint64_t v110 = 3;
      }
      else {
        uint64_t v110 = 2;
      }
    }
    else
    {
      uint64_t v110 = 1;
    }
  }
  else
  {
    uint64_t v110 = 0;
  }
  uint64_t v111 = v0[37];
  uint64_t v112 = v0[20];
  sub_232F3A800(0, (unint64_t *)&qword_2687576C8);
  FHIRDateTime.asDateComponents()();
  uint64_t v113 = (uint64_t *)(v109 + *(int *)(v111 + 32));
  uint64_t v114 = *v113;
  uint64_t v115 = v113[1];
  swift_bridgeObjectRetain();
  id v116 = sub_233017340(v112, v114, v115, v110);
  uint64_t v117 = v0[40];
  uint64_t v118 = v116;
  id v5 = objc_msgSend(self, sel_inspectableValueWithMedicalDate_, v116);

  sub_2330814D0(v117, (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
LABEL_3:
  v0[41] = v5;
  uint64_t v6 = v0[25];
  uint64_t v7 = v0[14];
  if (*(void *)(v7 + *(int *)(v6 + 76) + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = (void *)sub_23309B6E0();
    swift_bridgeObjectRelease();
    id v9 = objc_msgSend(self, (SEL)v3[333], v8);

    goto LABEL_5;
  }
  uint64_t v29 = v0[37];
  uint64_t v30 = v0[38];
  uint64_t v31 = v0[32];
  uint64_t v32 = v0[27];
  sub_233081530(v7 + *(int *)(v6 + 68), v31, &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
  sub_2330815B0(v7, v32, type metadata accessor for ModelsDSTU2.Condition);
  long long v33 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48);
  if (v33(v31, 1, v29) != 1)
  {
    uint64_t v45 = v0[37];
    uint64_t v46 = v0[38];
    uint64_t v48 = v0[32];
    uint64_t v47 = v0[33];
    sub_2330814D0(v0[27], type metadata accessor for ModelsDSTU2.Condition);
    sub_233081618(v48, v47, (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v46 + 56))(v47, 0, 1, v45);
LABEL_66:
    uint64_t v122 = v0[39];
    sub_233081618(v0[33], v122, (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
    uint64_t v123 = *(void *)(v122 + 56);
    uint64_t v124 = v0[39];
    if (v123 == 1)
    {
      if (*(unsigned char *)(v124 + 19))
      {
        if (*(unsigned char *)(v124 + 17)) {
          uint64_t v125 = 3;
        }
        else {
          uint64_t v125 = 2;
        }
      }
      else
      {
        uint64_t v125 = 1;
      }
    }
    else
    {
      uint64_t v125 = 0;
    }
    uint64_t v126 = v0[37];
    uint64_t v127 = v0[19];
    sub_232F3A800(0, (unint64_t *)&qword_2687576C8);
    FHIRDateTime.asDateComponents()();
    uint64_t v128 = (uint64_t *)(v124 + *(int *)(v126 + 32));
    uint64_t v129 = *v128;
    uint64_t v130 = v128[1];
    swift_bridgeObjectRetain();
    id v131 = sub_233017340(v127, v129, v130, v125);
    uint64_t v132 = v0[39];
    uint64_t v133 = v131;
    id v9 = objc_msgSend(self, sel_inspectableValueWithMedicalDate_, v131);

    sub_2330814D0(v132, (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
    goto LABEL_5;
  }
  uint64_t v34 = v0[25];
  uint64_t v35 = v0[22];
  sub_233081530(v0[27] + *(int *)(v34 + 72), v35, &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period);
  uint64_t v36 = type metadata accessor for Period();
  uint64_t v37 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 48);
  uint64_t v135 = v34;
  if (v37(v35, 1, v36) == 1)
  {
    uint64_t v38 = v0[37];
    uint64_t v39 = v0[38];
    uint64_t v40 = v0[31];
    sub_233081680(v0[22], &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 56))(v40, 1, 1, v38);
  }
  else
  {
    uint64_t v92 = v0[22];
    sub_233081530(v92, v0[31], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
    sub_2330814D0(v92, (uint64_t (*)(void))type metadata accessor for Period);
  }
  uint64_t v93 = v0[37];
  uint64_t v94 = v0[31];
  sub_233081618(v0[27], v0[26], type metadata accessor for ModelsDSTU2.Condition);
  if (v33(v94, 1, v93) == 1)
  {
    uint64_t v95 = v0[26];
    uint64_t v96 = v0[21];
    sub_233081530(v95 + *(int *)(v135 + 72), v96, &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period);
    sub_2330814D0(v95, type metadata accessor for ModelsDSTU2.Condition);
    if (v37(v96, 1, v36) == 1)
    {
      uint64_t v97 = v0[37];
      uint64_t v98 = v0[38];
      uint64_t v99 = v0[33];
      sub_233081680(v0[21], &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v98 + 56))(v99, 1, 1, v97);
    }
    else
    {
      uint64_t v119 = v0[21];
      sub_233081530(v119 + *(int *)(v36 + 20), v0[33], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
      sub_2330814D0(v119, (uint64_t (*)(void))type metadata accessor for Period);
    }
    sub_233081680(v0[31], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
  }
  else
  {
    uint64_t v100 = v0[37];
    uint64_t v101 = v0[38];
    uint64_t v102 = v0[33];
    uint64_t v103 = v0[31];
    sub_2330814D0(v0[26], type metadata accessor for ModelsDSTU2.Condition);
    sub_233081618(v103, v102, (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v101 + 56))(v102, 0, 1, v100);
  }
  uint64_t v120 = v0[37];
  uint64_t v121 = v0[33];
  sub_233081680(v0[32], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
  if (v33(v121, 1, v120) != 1) {
    goto LABEL_66;
  }
  sub_233081680(v0[33], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
  id v9 = 0;
LABEL_5:
  v0[42] = v9;
  uint64_t v10 = v0[37];
  uint64_t v11 = v0[38];
  uint64_t v12 = v0[30];
  sub_233081530(v0[14] + *(int *)(v0[25] + 28), v12, &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
  int v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v12, 1, v10);
  uint64_t v14 = v0[30];
  if (v13 == 1)
  {
    sub_233081680(v0[30], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
    id v15 = 0;
  }
  else
  {
    if (*(void *)(v14 + 56) == 1)
    {
      if (*(unsigned char *)(v14 + 19))
      {
        if (*(unsigned char *)(v14 + 17)) {
          uint64_t v28 = 3;
        }
        else {
          uint64_t v28 = 2;
        }
      }
      else
      {
        uint64_t v28 = 1;
      }
    }
    else
    {
      uint64_t v28 = 0;
    }
    uint64_t v61 = v0[37];
    uint64_t v62 = v0[18];
    sub_232F3A800(0, (unint64_t *)&qword_2687576C8);
    FHIRDateTime.asDateComponents()();
    uint64_t v63 = (uint64_t *)(v14 + *(int *)(v61 + 32));
    uint64_t v64 = *v63;
    uint64_t v65 = v63[1];
    swift_bridgeObjectRetain();
    id v15 = sub_233017340(v62, v64, v65, v28);
    sub_2330814D0(v0[30], (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
  }
  v0[43] = v15;
  uint64_t v66 = v0[25];
  uint64_t v67 = v0[14];
  uint64_t v68 = self;
  id v69 = objc_msgSend(v68, sel_FHIRConditionClinicalStatus);
  sub_23309B710();
  uint64_t v70 = *(void *)(v67 + *(int *)(v66 + 40) + 8);
  swift_bridgeObjectRetain();
  unint64_t v71 = (void *)sub_23309B6E0();
  swift_bridgeObjectRelease();
  if (v70)
  {
    unint64_t v72 = (void *)sub_23309B6E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v72 = 0;
  }
  uint64_t v73 = v0[25];
  uint64_t v74 = v0[14];
  v0[44] = objc_msgSend(self, sel_medicalCodingWithSystem_codingVersion_code_displayString_, v69, v71, v72, 0);

  v0[45] = objc_msgSend(v68, sel_FHIRConditionVerificationStatus);
  uint64_t v75 = (void *)(v74 + *(int *)(v73 + 44));
  v0[46] = *v75;
  v0[47] = v75[1];
  v0[9] = sub_23309B710();
  v0[10] = v76;
  uint64_t v77 = (uint64_t *)(v74 + *(int *)(v73 + 36));
  uint64_t v78 = v77[1];
  if (v78 == 1)
  {
    swift_bridgeObjectRetain();
    uint64_t v79 = 0;
  }
  else
  {
    uint64_t v80 = *v77;
    sub_233081484(0, (unint64_t *)&qword_268757D40, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
    uint64_t v81 = swift_allocObject();
    *(_OWORD *)(v81 + 16) = xmmword_2330A4FB0;
    swift_bridgeObjectRetain();
    sub_232E967F8(v80, v78);
    *(void *)(v81 + 32) = sub_233001A34();
    sub_23309B9C0();
    uint64_t v79 = v81;
    sub_232E96840(v80, v78);
  }
  v0[48] = v79;
  long long v82 = (int *)v0[25];
  uint64_t v83 = v0[14];
  if (*(void *)(v83 + v82[12] + 8) == 1)
  {
    uint64_t v84 = 0;
  }
  else
  {
    uint64_t v84 = sub_233001A34();
    long long v82 = (int *)v0[25];
    uint64_t v83 = v0[14];
  }
  v0[49] = v84;
  uint64_t v85 = *(void *)(v83 + v82[13]);
  if (v85)
  {
    uint64_t v85 = Array<A>.asCodingCollectionArray()(v85);
    long long v82 = (int *)v0[25];
    uint64_t v83 = v0[14];
  }
  v0[50] = v85;
  sub_2330815B0(v0[13], v0[17], (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
  uint64_t v86 = *(void *)(v83 + v82[21] + 8);
  uint64_t v87 = v0[16];
  if (v86)
  {
    swift_bridgeObjectRetain();
    sub_23309B200();
    uint64_t v88 = sub_23309B230();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v88 - 8) + 56))(v87, 0, 1, v88);
  }
  else
  {
    uint64_t v89 = sub_23309B230();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v89 - 8) + 56))(v87, 1, 1, v89);
  }
  uint64_t v90 = (void *)(v0[14] + *(int *)(v0[25] + 80));
  v0[51] = *v90;
  v0[52] = v90[1];
  swift_bridgeObjectRetain();
  uint64_t v91 = swift_task_alloc();
  v0[53] = v91;
  *(void *)uint64_t v91 = v0;
  *(void *)(v91 + 8) = sub_23307A478;
  *(_OWORD *)(v91 + 16) = *(_OWORD *)(v0 + 13);
  return MEMORY[0x270FA2498](sub_2330801B4, 0, 0);
}

uint64_t sub_23307A478(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 88) = v1;
  *(void *)(v2 + 96) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23307A578, 0, 0);
}

uint64_t sub_23307A578()
{
  uint64_t v1 = *(void *)(v0 + 120);
  sub_233081530(*(void *)(v0 + 112) + *(int *)(*(void *)(v0 + 200) + 24), v1, &qword_268756580, (uint64_t (*)(uint64_t))type metadata accessor for Reference);
  uint64_t v2 = type metadata accessor for Reference();
  int v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2);
  uint64_t v4 = *(uint64_t **)(v0 + 120);
  if (v3 == 1)
  {
    sub_233081680(*(void *)(v0 + 120), &qword_268756580, (uint64_t (*)(uint64_t))type metadata accessor for Reference);
    uint64_t v27 = 0;
    uint64_t v28 = 0;
  }
  else
  {
    uint64_t v27 = v4[1];
    uint64_t v28 = *v4;
    swift_bridgeObjectRetain();
    sub_2330814D0((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for Reference);
  }
  uint64_t v25 = *(void *)(v0 + 416);
  uint64_t v26 = *(void **)(v0 + 96);
  id v5 = *(void **)(v0 + 392);
  uint64_t v23 = *(void *)(v0 + 400);
  uint64_t v24 = *(void *)(v0 + 408);
  uint64_t v6 = *(void *)(v0 + 80);
  uint64_t v8 = *(void *)(v0 + 376);
  uint64_t v7 = *(void *)(v0 + 384);
  id v9 = *(void **)(v0 + 360);
  uint64_t v19 = *(void *)(v0 + 368);
  uint64_t v10 = *(void **)(v0 + 344);
  uint64_t v21 = *(void *)(v0 + 72);
  uint64_t v22 = *(void **)(v0 + 352);
  uint64_t v11 = *(void *)(v0 + 328);
  uint64_t v12 = *(void **)(v0 + 336);
  uint64_t v20 = (void *)v11;
  if (!v7) {
    uint64_t v7 = MEMORY[0x263F8EE78];
  }
  uint64_t v18 = v7;
  int v13 = *(uint64_t **)(v0 + 136);
  uint64_t v14 = *(void *)(v0 + 128);
  sub_232F3A800(0, &qword_268757D88);
  *(void *)(v0 + 16) = v9;
  *(void *)(v0 + 24) = v19;
  *(void *)(v0 + 32) = v8;
  *(void *)(v0 + 40) = v21;
  *(void *)(v0 + 48) = v6;
  *(void *)(v0 + 56) = 0;
  *(void *)(v0 + 64) = 0;
  id v15 = sub_23305122C(v13, v14, v24, v25, v26, v18, v28, v27, (uint64_t)v12, v11, (uint64_t)v10, (uint64_t)v22, (void **)(v0 + 16), (uint64_t)v5, v23);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

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
  uint64_t v16 = *(uint64_t (**)(id))(v0 + 8);
  return v16(v15);
}

uint64_t sub_23307A910(uint64_t a1)
{
  v2[9] = a1;
  v2[10] = v1;
  int v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_233080D4C(0, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  v2[11] = swift_task_alloc();
  type metadata accessor for RecordExtractionContext();
  v2[12] = swift_task_alloc();
  sub_23309AD60();
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  sub_233080D4C(0, &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period, v3);
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  v2[18] = type metadata accessor for ModelsDSTU2.DiagnosticReport(0);
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  sub_233080D4C(0, &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime, v3);
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for FHIRDateTime();
  v2[26] = v4;
  v2[27] = *(void *)(v4 - 8);
  v2[28] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23307ABC0, 0, 0);
}

uint64_t sub_23307ABC0()
{
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[25];
  sub_233081530(v0[10] + *(int *)(v0[18] + 44), v3, &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
  uint64_t v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v4(v3, 1, v1) == 1)
  {
    sub_233081680(v0[25], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
    sub_232F6210C();
    swift_allocError();
    *(_OWORD *)uint64_t v5 = xmmword_2330A31D0;
    *(void *)(v5 + 16) = 0;
    *(void *)(v5 + 24) = 0;
    *(unsigned char *)(v5 + 32) = 1;
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v58 = (uint64_t (*)(void))v0[1];
    return v58();
  }
  uint64_t v6 = v0[26];
  uint64_t v7 = v0[23];
  uint64_t v8 = v0[20];
  uint64_t v9 = v0[18];
  uint64_t v10 = v0[10];
  sub_233081618(v0[25], v0[28], (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
  uint64_t v11 = v10 + *(int *)(v9 + 36);
  sub_233081530(v11, v7, &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
  sub_2330815B0(v10, v8, type metadata accessor for ModelsDSTU2.DiagnosticReport);
  if (v4(v7, 1, v6) == 1)
  {
    uint64_t v12 = v0[20];
    uint64_t v13 = v0[17];
    sub_233081530(v12 + *(int *)(v0[18] + 40), v13, &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period);
    sub_2330814D0(v12, type metadata accessor for ModelsDSTU2.DiagnosticReport);
    uint64_t v14 = type metadata accessor for Period();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v13, 1, v14) == 1)
    {
      uint64_t v15 = v0[26];
      uint64_t v16 = v0[27];
      uint64_t v17 = v0[24];
      sub_233081680(v0[17], &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(v17, 1, 1, v15);
    }
    else
    {
      uint64_t v22 = v0[17];
      sub_233081530(v22, v0[24], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
      sub_2330814D0(v22, (uint64_t (*)(void))type metadata accessor for Period);
    }
    uint64_t v23 = v0[26];
    uint64_t v24 = v0[24];
    sub_233081680(v0[23], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
    if (v4(v24, 1, v23) == 1)
    {
      sub_233081680(v0[24], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
      id v25 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v18 = v0[26];
    uint64_t v19 = v0[27];
    uint64_t v21 = v0[23];
    uint64_t v20 = v0[24];
    sub_2330814D0(v0[20], type metadata accessor for ModelsDSTU2.DiagnosticReport);
    sub_233081618(v21, v20, (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v20, 0, 1, v18);
  }
  uint64_t v26 = v0[24];
  if (*(void *)(v26 + 56) == 1)
  {
    if (*(unsigned char *)(v26 + 19))
    {
      if (*(unsigned char *)(v26 + 17)) {
        uint64_t v27 = 3;
      }
      else {
        uint64_t v27 = 2;
      }
    }
    else
    {
      uint64_t v27 = 1;
    }
  }
  else
  {
    uint64_t v27 = 0;
  }
  uint64_t v28 = v0[26];
  uint64_t v29 = v0[15];
  sub_232F3A800(0, (unint64_t *)&qword_2687576C8);
  FHIRDateTime.asDateComponents()();
  uint64_t v30 = (uint64_t *)(v26 + *(int *)(v28 + 32));
  uint64_t v31 = *v30;
  uint64_t v32 = v30[1];
  swift_bridgeObjectRetain();
  id v25 = sub_233017340(v29, v31, v32, v27);
  sub_2330814D0(v0[24], (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
LABEL_18:
  v0[29] = v25;
  uint64_t v33 = v0[26];
  uint64_t v34 = v0[21];
  uint64_t v35 = v0[19];
  uint64_t v36 = v0[10];
  sub_233081530(v11, v34, &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
  sub_2330815B0(v36, v35, type metadata accessor for ModelsDSTU2.DiagnosticReport);
  if (v4(v34, 1, v33) != 1)
  {
    uint64_t v43 = v0[26];
    uint64_t v44 = v0[27];
    uint64_t v46 = v0[21];
    uint64_t v45 = v0[22];
    sub_2330814D0(v0[19], type metadata accessor for ModelsDSTU2.DiagnosticReport);
    sub_233081618(v46, v45, (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v44 + 56))(v45, 0, 1, v43);
LABEL_25:
    uint64_t v51 = v0[22];
    if (*(void *)(v51 + 56) == 1)
    {
      if (*(unsigned char *)(v51 + 19))
      {
        if (*(unsigned char *)(v51 + 17)) {
          uint64_t v52 = 3;
        }
        else {
          uint64_t v52 = 2;
        }
      }
      else
      {
        uint64_t v52 = 1;
      }
    }
    else
    {
      uint64_t v52 = 0;
    }
    uint64_t v53 = v0[26];
    uint64_t v54 = v0[14];
    sub_232F3A800(0, (unint64_t *)&qword_2687576C8);
    FHIRDateTime.asDateComponents()();
    uint64_t v55 = (uint64_t *)(v51 + *(int *)(v53 + 32));
    uint64_t v56 = *v55;
    uint64_t v57 = v55[1];
    swift_bridgeObjectRetain();
    id v50 = sub_233017340(v54, v56, v57, v52);
    sub_2330814D0(v0[22], (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
    goto LABEL_36;
  }
  uint64_t v37 = v0[19];
  uint64_t v38 = v0[16];
  sub_233081530(v37 + *(int *)(v0[18] + 40), v38, &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period);
  sub_2330814D0(v37, type metadata accessor for ModelsDSTU2.DiagnosticReport);
  uint64_t v39 = type metadata accessor for Period();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 48))(v38, 1, v39) == 1)
  {
    uint64_t v40 = v0[26];
    uint64_t v41 = v0[27];
    uint64_t v42 = v0[22];
    sub_233081680(v0[16], &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 56))(v42, 1, 1, v40);
  }
  else
  {
    uint64_t v47 = v0[16];
    sub_233081530(v47 + *(int *)(v39 + 20), v0[22], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
    sub_2330814D0(v47, (uint64_t (*)(void))type metadata accessor for Period);
  }
  uint64_t v48 = v0[26];
  uint64_t v49 = v0[22];
  sub_233081680(v0[21], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
  if (v4(v49, 1, v48) != 1) {
    goto LABEL_25;
  }
  sub_233081680(v0[22], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
  id v50 = 0;
LABEL_36:
  v0[30] = 0;
  v0[31] = v50;
  uint64_t v60 = v0[18];
  uint64_t v61 = v0[12];
  uint64_t v62 = v0[9];
  uint64_t v63 = v0[10];
  id v64 = objc_msgSend(self, sel_FHIRDiagnosticReportStatus);
  v0[32] = v64;
  uint64_t v66 = *(void *)(v63 + 32);
  uint64_t v65 = *(void *)(v63 + 40);
  v0[33] = v65;
  uint64_t v67 = sub_23309B710();
  v0[34] = v68;
  v0[2] = v64;
  v0[3] = v66;
  v0[4] = v65;
  v0[5] = v67;
  v0[7] = 0;
  v0[8] = 0;
  v0[6] = v68;
  sub_2330815B0(v62, v61, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
  uint64_t v69 = v0[11];
  if (*(void *)(v63 + *(int *)(v60 + 48) + 8))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23309B200();
    uint64_t v70 = sub_23309B230();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v70 - 8) + 56))(v69, 0, 1, v70);
  }
  else
  {
    uint64_t v71 = sub_23309B230();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v71 - 8) + 56))(v69, 1, 1, v71);
    swift_bridgeObjectRetain();
  }
  uint64_t v72 = v0[10];
  v0[35] = *(void *)(v72 + 72);
  v0[36] = *(void *)(v72 + 80);
  swift_bridgeObjectRetain();
  uint64_t v73 = swift_task_alloc();
  v0[37] = v73;
  *(void *)uint64_t v73 = v0;
  *(void *)(v73 + 8) = sub_23307B6B8;
  *(_OWORD *)(v73 + 16) = *(_OWORD *)(v0 + 9);
  return MEMORY[0x270FA2498](sub_233080378, 0, 0);
}

uint64_t sub_23307B6B8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 304) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23307B7B8, 0, 0);
}

uint64_t sub_23307B7B8()
{
  uint64_t v1 = *(void *)(v0 + 224);
  if (*(void *)(v1 + 56) == 1)
  {
    if (*(unsigned char *)(v1 + 19))
    {
      if (*(unsigned char *)(v1 + 17)) {
        uint64_t v2 = 3;
      }
      else {
        uint64_t v2 = 2;
      }
    }
    else
    {
      uint64_t v2 = 1;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  uint64_t v3 = *(void *)(v0 + 240);
  uint64_t v4 = *(void *)(v0 + 208);
  uint64_t v5 = *(void *)(v0 + 104);
  sub_232F3A800(0, (unint64_t *)&qword_2687576C8);
  FHIRDateTime.asDateComponents()();
  uint64_t v6 = (uint64_t *)(v1 + *(int *)(v4 + 32));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  swift_bridgeObjectRetain();
  id v9 = sub_233017340(v5, v7, v8, v2);
  uint64_t v10 = *(void **)(v0 + 304);
  uint64_t v11 = *(void *)(v0 + 288);
  if (v3)
  {
    uint64_t v12 = *(void **)(v0 + 248);
    uint64_t v13 = *(void *)(v0 + 224);
    uint64_t v14 = *(void **)(v0 + 232);
    uint64_t v16 = *(void *)(v0 + 88);
    uint64_t v15 = *(void *)(v0 + 96);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    sub_233081680(v16, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690]);
    sub_2330814D0(v15, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
    sub_2330814D0(v13, (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
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
    uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
    return v17();
  }
  else
  {
    uint64_t v19 = v9;
    uint64_t v20 = *(void *)(v0 + 280);
    uint64_t v21 = *(void **)(v0 + 248);
    uint64_t v27 = *(void **)(v0 + 256);
    uint64_t v22 = *(void **)(v0 + 232);
    uint64_t v28 = *(void *)(v0 + 224);
    uint64_t v23 = *(void **)(v0 + 96);
    uint64_t v24 = *(void *)(v0 + 88);
    sub_232F3A800(0, &qword_2687576E8);
    id v25 = sub_233034240(v23, v24, v20, v11, (uint64_t)v10, (uint64_t)v22, (uint64_t)v21, v0 + 16, (uint64_t)v19);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    sub_2330814D0(v28, (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
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
    uint64_t v26 = *(uint64_t (**)(id))(v0 + 8);
    return v26(v25);
  }
}

uint64_t sub_23307BBEC(uint64_t a1)
{
  v2[12] = a1;
  v2[13] = v1;
  sub_23309AD60();
  v2[14] = swift_task_alloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_233080D4C(0, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  v2[15] = swift_task_alloc();
  type metadata accessor for RecordExtractionContext();
  v2[16] = swift_task_alloc();
  sub_233080D4C(0, &qword_268756580, (uint64_t (*)(uint64_t))type metadata accessor for Reference, v3);
  v2[17] = swift_task_alloc();
  v2[18] = *(void *)(type metadata accessor for Annotation() - 8);
  v2[19] = swift_task_alloc();
  sub_233080D4C(0, &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime, v3);
  v2[20] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for FHIRDateTime();
  v2[21] = v4;
  v2[22] = *(void *)(v4 - 8);
  v2[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23307BE54, 0, 0);
}

uint64_t sub_23307BE54()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[20];
  uint64_t v4 = v0[13];
  uint64_t v5 = (int *)type metadata accessor for ModelsDSTU2.Immunization(0);
  v0[24] = v5;
  sub_233081530(v4 + v5[8], v3, &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_233081680(v0[20], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
    sub_232F6210C();
    swift_allocError();
    *(_OWORD *)uint64_t v6 = xmmword_2330A9D70;
    *(void *)(v6 + 16) = 0;
    *(void *)(v6 + 24) = 0;
    *(unsigned char *)(v6 + 32) = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
  uint64_t v9 = v0[13];
  sub_233081618(v0[20], v0[23], (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
  id v10 = objc_msgSend(self, sel_FHIRImmunizationStatus);
  v0[25] = v10;
  uint64_t v11 = *(void *)(v9 + 40);
  uint64_t v12 = *(void *)(v9 + 48);
  v0[26] = v12;
  uint64_t v13 = sub_23309B710();
  v0[27] = v14;
  v0[2] = v10;
  v0[3] = v11;
  v0[4] = v12;
  v0[5] = v13;
  v0[7] = 0;
  v0[8] = 0;
  v0[6] = v14;
  uint64_t v15 = *(void *)(v9 + v5[10]);
  if (v15)
  {
    uint64_t v16 = v0 + 11;
    int64_t v17 = *(void *)(v15 + 16);
    if (v17)
    {
      uint64_t v53 = v5;
      uint64_t v18 = v0[18];
      uint64_t v54 = v0[19];
      uint64_t v55 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_232F39748(0, v17, 0);
      uint64_t v19 = v15 + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80));
      uint64_t v20 = *(void *)(v18 + 72);
      uint64_t v21 = v55;
      do
      {
        uint64_t v22 = (uint64_t *)v0[19];
        sub_2330815B0(v19, (uint64_t)v22, (uint64_t (*)(void))type metadata accessor for Annotation);
        uint64_t v23 = *v22;
        uint64_t v24 = *(void *)(v54 + 8);
        swift_bridgeObjectRetain();
        sub_2330814D0((uint64_t)v22, (uint64_t (*)(void))type metadata accessor for Annotation);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_232F39748(0, *(void *)(v21 + 16) + 1, 1);
          uint64_t v21 = v55;
        }
        unint64_t v26 = *(void *)(v21 + 16);
        unint64_t v25 = *(void *)(v21 + 24);
        if (v26 >= v25 >> 1)
        {
          sub_232F39748(v25 > 1, v26 + 1, 1);
          uint64_t v21 = v55;
        }
        *(void *)(v21 + 16) = v26 + 1;
        uint64_t v27 = v21 + 16 * v26;
        *(void *)(v27 + 32) = v23;
        *(void *)(v27 + 40) = v24;
        v19 += v20;
        --v17;
      }
      while (v17);
      swift_bridgeObjectRelease();
      uint64_t v16 = v0 + 11;
      uint64_t v5 = v53;
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v21 = MEMORY[0x263F8EE78];
    }
    *uint64_t v16 = v21;
    sub_233081484(0, (unint64_t *)&qword_268756B00, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
    sub_232F65EE4();
    uint64_t v28 = sub_23309B6C0();
    uint64_t v15 = v29;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v28 = 0;
  }
  v0[28] = v28;
  v0[29] = v15;
  uint64_t v30 = *(void *)(v0[13] + v5[12]);
  if (!v30) {
    goto LABEL_25;
  }
  unint64_t v31 = *(void *)(v30 + 16);
  if (v31 >= 2)
  {
    uint64_t v32 = v30 + 32;
    while (*(unsigned char *)(v32 + 16) == 1)
    {
      v32 += 24;
      if (!--v31) {
        goto LABEL_25;
      }
    }
    int v34 = 0;
    uint64_t v33 = (uint64_t *)(v32 + 8);
    goto LABEL_27;
  }
  if (!v31)
  {
LABEL_25:
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    goto LABEL_30;
  }
  uint64_t v32 = v30 + 32;
  uint64_t v33 = (uint64_t *)(v30 + 40);
  int v34 = *(unsigned __int8 *)(v30 + 48);
LABEL_27:
  uint64_t v39 = *v33;
  v0[9] = *(void *)v32;
  sub_233000A78();
  uint64_t v37 = sub_23309BDA0();
  uint64_t v38 = v40;
  if (v34)
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
  }
  else
  {
    v0[10] = v39;
    uint64_t v35 = sub_23309BDA0();
  }
LABEL_30:
  v0[32] = v37;
  v0[33] = v38;
  v0[30] = v35;
  v0[31] = v36;
  uint64_t v41 = v0[17];
  sub_233081530(v0[13] + v5[17], v41, &qword_268756580, (uint64_t (*)(uint64_t))type metadata accessor for Reference);
  uint64_t v42 = type metadata accessor for Reference();
  int v43 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 48))(v41, 1, v42);
  uint64_t v44 = (uint64_t *)v0[17];
  if (v43 == 1)
  {
    sub_233081680(v0[17], &qword_268756580, (uint64_t (*)(uint64_t))type metadata accessor for Reference);
    uint64_t v45 = 0;
    uint64_t v46 = 0;
  }
  else
  {
    uint64_t v45 = *v44;
    uint64_t v46 = v44[1];
    swift_bridgeObjectRetain();
    sub_2330814D0((uint64_t)v44, (uint64_t (*)(void))type metadata accessor for Reference);
  }
  v0[34] = v45;
  v0[35] = v46;
  uint64_t v47 = v0[13];
  sub_2330815B0(v0[12], v0[16], (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
  uint64_t v48 = *(void *)(v47 + v5[18] + 8);
  uint64_t v49 = v0[15];
  if (v48)
  {
    swift_bridgeObjectRetain();
    sub_23309B200();
    uint64_t v50 = sub_23309B230();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v49, 0, 1, v50);
  }
  else
  {
    uint64_t v51 = sub_23309B230();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v49, 1, 1, v51);
  }
  uint64_t v52 = swift_task_alloc();
  v0[36] = v52;
  *(void *)uint64_t v52 = v0;
  *(void *)(v52 + 8) = sub_23307C51C;
  *(_OWORD *)(v52 + 16) = *((_OWORD *)v0 + 6);
  return MEMORY[0x270FA2498](sub_23308052C, 0, 0);
}

uint64_t sub_23307C51C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 296) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23307C61C, 0, 0);
}

uint64_t sub_23307C61C()
{
  uint64_t v1 = (void *)v0[37];
  uint64_t v2 = v0[23];
  id v3 = objc_msgSend(v1, sel_codings);

  sub_232F3A800(0, (unint64_t *)&qword_268757138);
  uint64_t v4 = sub_23309B9A0();

  uint64_t v5 = 0;
  uint64_t v6 = v0[23];
  if (*(void *)(v2 + 56) == 1)
  {
    if (*(unsigned char *)(v6 + 19))
    {
      if (*(unsigned char *)(v6 + 17)) {
        uint64_t v5 = 3;
      }
      else {
        uint64_t v5 = 2;
      }
    }
    else
    {
      uint64_t v5 = 1;
    }
  }
  uint64_t v7 = v0[21];
  uint64_t v8 = v0[14];
  sub_232F3A800(0, (unint64_t *)&qword_2687576C8);
  FHIRDateTime.asDateComponents()();
  uint64_t v9 = (uint64_t *)(v6 + *(int *)(v7 + 32));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  swift_bridgeObjectRetain();
  id v12 = sub_233017340(v8, v10, v11, v5);
  if (*(unsigned char *)(v0[13] + *(int *)(v0[24] + 36) + 12)) {
    id v13 = 0;
  }
  else {
    id v13 = FHIRDate.asMedicalDate()();
  }
  unint64_t v14 = v0[33];
  uint64_t v38 = v13;
  if (v14)
  {
    uint64_t v15 = v0[32];
    uint64_t v16 = HIBYTE(v14) & 0xF;
    if ((v14 & 0x2000000000000000) == 0) {
      uint64_t v16 = v15 & 0xFFFFFFFFFFFFLL;
    }
    if (!v16)
    {
      swift_bridgeObjectRelease();
      uint64_t v15 = 0;
      unint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  unint64_t v17 = v0[31];
  uint64_t v37 = v4;
  uint64_t v39 = v12;
  uint64_t v36 = v15;
  if (v17)
  {
    uint64_t v18 = HIBYTE(v17) & 0xF;
    if ((v17 & 0x2000000000000000) == 0) {
      uint64_t v18 = v0[30] & 0xFFFFFFFFFFFFLL;
    }
    if (v18)
    {
      uint64_t v29 = v0[30];
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v29 = 0;
      unint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v29 = 0;
  }
  uint64_t v30 = v0[34];
  uint64_t v31 = v0[35];
  uint64_t v32 = v0[28];
  uint64_t v33 = v0[29];
  uint64_t v19 = (int *)v0[24];
  int v34 = (void *)v0[25];
  uint64_t v35 = v0[23];
  uint64_t v20 = (uint64_t *)v0[16];
  uint64_t v21 = v0[15];
  uint64_t v22 = v0[13];
  sub_232F3A800(0, &qword_2687582B0);
  uint64_t v23 = *(void *)(v22 + v19[16]);
  char v24 = *(unsigned char *)(v22 + v19[14]);
  LOBYTE(v19) = *(unsigned char *)(v22 + v19[11]);
  uint64_t v25 = swift_bridgeObjectRetain();
  id v26 = sub_232F691A0(v20, v21, v32, v33, v37, (uint64_t)v39, v38, v0 + 2, v36, v14, v29, v17, v23, v25, v30, v31, 0, 0, 0,
          v24,
          (char)v19,
          0,
          0,
          0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_2330814D0(v35, (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v27 = (uint64_t (*)(id))v0[1];
  return v27(v26);
}

uint64_t sub_23307CC08(uint64_t a1)
{
  v2[12] = a1;
  v2[13] = v1;
  id v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_233080D4C(0, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  v2[14] = swift_task_alloc();
  type metadata accessor for RecordExtractionContext();
  v2[15] = swift_task_alloc();
  v2[16] = *(void *)(type metadata accessor for ReferenceRange() - 8);
  v2[17] = swift_task_alloc();
  sub_233080D4C(0, &qword_268756578, (uint64_t (*)(uint64_t))type metadata accessor for Quantity, v3);
  v2[18] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Quantity();
  v2[19] = v4;
  v2[20] = *(void *)(v4 - 8);
  v2[21] = swift_task_alloc();
  sub_23309AD60();
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  sub_233080D4C(0, &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period, v3);
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  v2[27] = type metadata accessor for ModelsDSTU2.Observation(0);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  sub_233080D4C(0, &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime, v3);
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23307CF5C, 0, 0);
}

uint64_t sub_23307CF5C()
{
  uint64_t v1 = v0[33];
  uint64_t v2 = v0[29];
  uint64_t v3 = v0[13];
  uint64_t v4 = v3 + *(int *)(v0[27] + 44);
  sub_233081530(v4, v1, &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
  sub_2330815B0(v3, v2, type metadata accessor for ModelsDSTU2.Observation);
  uint64_t v5 = type metadata accessor for FHIRDateTime();
  v0[35] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  v0[36] = v7;
  v0[37] = (v6 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  if (v7(v1, 1, v5) == 1)
  {
    uint64_t v8 = v0[29];
    uint64_t v9 = v0[26];
    sub_233081530(v8 + *(int *)(v0[27] + 48), v9, &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period);
    sub_2330814D0(v8, type metadata accessor for ModelsDSTU2.Observation);
    uint64_t v10 = type metadata accessor for Period();
    int v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 1, v10);
    uint64_t v12 = v0[34];
    uint64_t v13 = v0[26];
    if (v11 == 1)
    {
      sub_233081680(v0[26], &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(v12, 1, 1, v5);
    }
    else
    {
      sub_233081530(v0[26], v0[34], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
      sub_2330814D0(v13, (uint64_t (*)(void))type metadata accessor for Period);
    }
    uint64_t v16 = v0[34];
    sub_233081680(v0[33], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
    if (v7(v16, 1, v5) == 1)
    {
      sub_233081680(v0[34], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
      id v17 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v15 = v0[33];
    uint64_t v14 = v0[34];
    sub_2330814D0(v0[29], type metadata accessor for ModelsDSTU2.Observation);
    sub_233081618(v15, v14, (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v14, 0, 1, v5);
  }
  uint64_t v91 = v7;
  uint64_t v18 = v0[34];
  uint64_t v19 = v4;
  if (*(void *)(v18 + 56) == 1)
  {
    if (*(unsigned char *)(v18 + 19))
    {
      uint64_t v20 = v6;
      if (*(unsigned char *)(v18 + 17)) {
        uint64_t v21 = 3;
      }
      else {
        uint64_t v21 = 2;
      }
    }
    else
    {
      uint64_t v20 = v6;
      uint64_t v21 = 1;
    }
  }
  else
  {
    uint64_t v20 = v6;
    uint64_t v21 = 0;
  }
  uint64_t v22 = v0[24];
  sub_232F3A800(0, (unint64_t *)&qword_2687576C8);
  FHIRDateTime.asDateComponents()();
  uint64_t v23 = (uint64_t *)(v18 + *(int *)(v5 + 32));
  uint64_t v24 = *v23;
  uint64_t v25 = v23[1];
  swift_bridgeObjectRetain();
  id v17 = sub_233017340(v22, v24, v25, v21);
  sub_2330814D0(v0[34], (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
  uint64_t v6 = v20;
  uint64_t v4 = v19;
  uint64_t v7 = v91;
LABEL_16:
  v0[38] = v17;
  uint64_t v26 = v0[31];
  uint64_t v27 = v0[28];
  uint64_t v28 = v0[13];
  sub_233081530(v4, v26, &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
  sub_2330815B0(v28, v27, type metadata accessor for ModelsDSTU2.Observation);
  if (v7(v26, 1, v5) == 1)
  {
    uint64_t v29 = v0[28];
    uint64_t v30 = v0[25];
    sub_233081530(v29 + *(int *)(v0[27] + 48), v30, &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period);
    sub_2330814D0(v29, type metadata accessor for ModelsDSTU2.Observation);
    uint64_t v31 = type metadata accessor for Period();
    int v32 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 48))(v30, 1, v31);
    uint64_t v33 = v0[32];
    uint64_t v34 = v0[25];
    if (v32 == 1)
    {
      sub_233081680(v0[25], &qword_268756730, (uint64_t (*)(uint64_t))type metadata accessor for Period);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(v33, 1, 1, v5);
    }
    else
    {
      sub_233081530(v34 + *(int *)(v31 + 20), v0[32], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
      sub_2330814D0(v34, (uint64_t (*)(void))type metadata accessor for Period);
    }
    uint64_t v37 = v0[32];
    sub_233081680(v0[31], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
    if (v7(v37, 1, v5) == 1)
    {
      sub_233081680(v0[32], &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
      id v38 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v36 = v0[31];
    uint64_t v35 = v0[32];
    sub_2330814D0(v0[28], type metadata accessor for ModelsDSTU2.Observation);
    sub_233081618(v36, v35, (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v35, 0, 1, v5);
  }
  uint64_t v39 = v0[32];
  if (*(void *)(v39 + 56) == 1)
  {
    if (*(unsigned char *)(v39 + 19))
    {
      if (*(unsigned char *)(v39 + 17)) {
        uint64_t v40 = 3;
      }
      else {
        uint64_t v40 = 2;
      }
    }
    else
    {
      uint64_t v40 = 1;
    }
  }
  else
  {
    uint64_t v40 = 0;
  }
  uint64_t v41 = v0[23];
  sub_232F3A800(0, (unint64_t *)&qword_2687576C8);
  FHIRDateTime.asDateComponents()();
  uint64_t v42 = (uint64_t *)(v39 + *(int *)(v5 + 32));
  uint64_t v44 = *v42;
  uint64_t v43 = v42[1];
  swift_bridgeObjectRetain();
  id v38 = sub_233017340(v41, v44, v43, v40);
  sub_2330814D0(v0[32], (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
LABEL_31:
  v0[39] = 0;
  v0[40] = v38;
  uint64_t v45 = (int *)v0[27];
  uint64_t v46 = v0[13];
  if (*(void *)(v46 + v45[15] + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v47 = (void *)sub_23309B6E0();
    swift_bridgeObjectRelease();
    id v48 = objc_msgSend(self, sel_inspectableValueWithString_, v47);

    if (v48) {
      goto LABEL_33;
    }
    goto LABEL_42;
  }
  uint64_t v50 = (void *)(v46 + v45[16]);
  uint64_t v51 = v50[1];
  if (v51 == 1)
  {
    uint64_t v52 = v0[19];
    uint64_t v53 = v0[20];
    uint64_t v54 = v0[18];
    sub_233081530(v46 + v45[17], v54, &qword_268756578, (uint64_t (*)(uint64_t))type metadata accessor for Quantity);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v54, 1, v52) == 1)
    {
      sub_233081680(v0[18], &qword_268756578, (uint64_t (*)(uint64_t))type metadata accessor for Quantity);
      id v49 = 0;
      id v48 = 0;
      goto LABEL_43;
    }
    sub_233081618(v0[18], v0[21], (uint64_t (*)(void))type metadata accessor for Quantity);
    uint64_t v63 = Quantity.asCodedQuantity()();
    uint64_t v64 = v0[21];
    uint64_t v65 = v63;
    id v48 = objc_msgSend(self, sel_inspectableValueWithCodedQuantity_, v63);

    sub_2330814D0(v64, (uint64_t (*)(void))type metadata accessor for Quantity);
    if (v48)
    {
LABEL_33:
      id v49 = objc_msgSend(self, sel_inspectableValueCollectionSingleWithValue_, v48);
LABEL_43:
      v0[45] = v49;
      v0[46] = v48;
      v0[44] = 0;
      uint64_t v66 = (void *)v0[13];
      uint64_t v67 = *(void *)((char *)v66 + *(int *)(v0[27] + 72));
      if (v67)
      {
        uint64_t v68 = MEMORY[0x263F8EE78];
        uint64_t v92 = MEMORY[0x263F8EE78];
        uint64_t v69 = *(void *)(v67 + 16);
        if (v69)
        {
          uint64_t v70 = v0[16];
          uint64_t v71 = v67 + ((*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80));
          uint64_t v72 = *(void *)(v70 + 72);
          swift_bridgeObjectRetain();
          do
          {
            uint64_t v73 = v0[17];
            sub_2330815B0(v71, v73, (uint64_t (*)(void))type metadata accessor for ReferenceRange);
            id v74 = ReferenceRange.asReferenceRange()();
            uint64_t v75 = sub_2330814D0(v73, (uint64_t (*)(void))type metadata accessor for ReferenceRange);
            if (v74)
            {
              MEMORY[0x237DB59C0](v75);
              if (*(void *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_23309B9D0();
              }
              sub_23309B9E0();
              sub_23309B9C0();
            }
            v71 += v72;
            --v69;
          }
          while (v69);
          swift_bridgeObjectRelease();
          uint64_t v68 = v92;
          uint64_t v66 = (void *)v0[13];
        }
      }
      else
      {
        uint64_t v68 = 0;
      }
      v0[47] = v68;
      id v76 = objc_msgSend(self, sel_FHIRObservationStatus);
      v0[48] = v76;
      uint64_t v78 = v66[5];
      uint64_t v77 = v66[6];
      v0[49] = v77;
      uint64_t v79 = sub_23309B710();
      v0[50] = v80;
      v0[2] = v76;
      v0[3] = v78;
      v0[4] = v77;
      v0[5] = v79;
      v0[7] = 0;
      v0[8] = 0;
      v0[6] = v80;
      if (v66[8] == 1)
      {
        swift_bridgeObjectRetain();
        uint64_t v81 = MEMORY[0x263F8EE78];
      }
      else
      {
        sub_233081484(0, (unint64_t *)&qword_268757D40, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
        uint64_t v82 = swift_allocObject();
        *(_OWORD *)(v82 + 16) = xmmword_2330A4FB0;
        swift_bridgeObjectRetain();
        *(void *)(v82 + 32) = sub_233001A34();
        sub_23309B9C0();
        uint64_t v81 = v82;
      }
      v0[51] = v81;
      uint64_t v83 = v0[27];
      uint64_t v84 = v0[13];
      sub_2330815B0(v0[12], v0[15], (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
      uint64_t v85 = *(void *)(v84 + *(int *)(v83 + 76) + 8);
      uint64_t v86 = v0[14];
      if (v85)
      {
        swift_bridgeObjectRetain();
        sub_23309B200();
        uint64_t v87 = sub_23309B230();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v87 - 8) + 56))(v86, 0, 1, v87);
      }
      else
      {
        uint64_t v88 = sub_23309B230();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v88 - 8) + 56))(v86, 1, 1, v88);
      }
      uint64_t v89 = v0[13];
      v0[52] = *(void *)(v89 + 104);
      v0[53] = *(void *)(v89 + 112);
      swift_bridgeObjectRetain();
      uint64_t v90 = swift_task_alloc();
      v0[54] = v90;
      *(void *)uint64_t v90 = v0;
      *(void *)(v90 + 8) = sub_23307E2F8;
      *(_OWORD *)(v90 + 16) = *((_OWORD *)v0 + 6);
      uint64_t v56 = sub_2330806F0;
      uint64_t v57 = 0;
      uint64_t v58 = 0;
      return MEMORY[0x270FA2498](v56, v57, v58);
    }
LABEL_42:
    id v49 = 0;
    goto LABEL_43;
  }
  uint64_t v55 = v50[2];
  v0[9] = *v50;
  v0[10] = v51;
  v0[11] = v55;
  sub_232F3A800(0, &qword_268757D38);
  uint64_t v56 = (id (*)())objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_diagnosticTestResultTypeForIdentifier_, *MEMORY[0x263F09518]);
  v0[41] = v56;
  if (!v56)
  {
    __break(1u);
    return MEMORY[0x270FA2498](v56, v57, v58);
  }
  uint64_t v59 = (uint64_t)v56;
  uint64_t v60 = (void *)swift_task_alloc();
  v0[42] = v60;
  *uint64_t v60 = v0;
  v60[1] = sub_23307DDF4;
  uint64_t v61 = v0[12];
  return sub_23300252C(v61, v59);
}

uint64_t sub_23307DDF4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)v1 + 328);
  *(void *)(*(void *)v1 + 344) = a1;
  swift_task_dealloc();

  return MEMORY[0x270FA2498](sub_23307DF10, 0, 0);
}

uint64_t sub_23307DF10()
{
  uint64_t v1 = v0[43];
  uint64_t v2 = v0[39];
  v0[45] = objc_msgSend(self, sel_inspectableValueCollectionSingleWithValue_, v1);
  v0[46] = v1;
  v0[44] = v2;
  uint64_t v3 = (void *)v0[13];
  uint64_t v4 = *(void *)((char *)v3 + *(int *)(v0[27] + 72));
  if (v4)
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    uint64_t v29 = MEMORY[0x263F8EE78];
    uint64_t v6 = *(void *)(v4 + 16);
    if (v6)
    {
      uint64_t v7 = v0[16];
      uint64_t v8 = v4 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
      uint64_t v9 = *(void *)(v7 + 72);
      swift_bridgeObjectRetain();
      do
      {
        uint64_t v10 = v0[17];
        sub_2330815B0(v8, v10, (uint64_t (*)(void))type metadata accessor for ReferenceRange);
        id v11 = ReferenceRange.asReferenceRange()();
        uint64_t v12 = sub_2330814D0(v10, (uint64_t (*)(void))type metadata accessor for ReferenceRange);
        if (v11)
        {
          MEMORY[0x237DB59C0](v12);
          if (*(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_23309B9D0();
          }
          sub_23309B9E0();
          sub_23309B9C0();
        }
        v8 += v9;
        --v6;
      }
      while (v6);
      swift_bridgeObjectRelease();
      uint64_t v5 = v29;
      uint64_t v3 = (void *)v0[13];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  v0[47] = v5;
  id v13 = objc_msgSend(self, sel_FHIRObservationStatus);
  v0[48] = v13;
  uint64_t v15 = v3[5];
  uint64_t v14 = v3[6];
  v0[49] = v14;
  uint64_t v16 = sub_23309B710();
  v0[50] = v17;
  v0[2] = v13;
  v0[3] = v15;
  v0[4] = v14;
  v0[5] = v16;
  v0[7] = 0;
  v0[8] = 0;
  v0[6] = v17;
  if (v3[8] == 1)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = MEMORY[0x263F8EE78];
  }
  else
  {
    sub_233081484(0, (unint64_t *)&qword_268757D40, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_2330A4FB0;
    swift_bridgeObjectRetain();
    *(void *)(v19 + 32) = sub_233001A34();
    sub_23309B9C0();
    uint64_t v18 = v19;
  }
  v0[51] = v18;
  uint64_t v20 = v0[27];
  uint64_t v21 = v0[13];
  sub_2330815B0(v0[12], v0[15], (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
  uint64_t v22 = *(void *)(v21 + *(int *)(v20 + 76) + 8);
  uint64_t v23 = v0[14];
  if (v22)
  {
    swift_bridgeObjectRetain();
    sub_23309B200();
    uint64_t v24 = sub_23309B230();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 0, 1, v24);
  }
  else
  {
    uint64_t v25 = sub_23309B230();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v23, 1, 1, v25);
  }
  uint64_t v26 = v0[13];
  v0[52] = *(void *)(v26 + 104);
  v0[53] = *(void *)(v26 + 112);
  swift_bridgeObjectRetain();
  uint64_t v27 = swift_task_alloc();
  v0[54] = v27;
  *(void *)uint64_t v27 = v0;
  *(void *)(v27 + 8) = sub_23307E2F8;
  *(_OWORD *)(v27 + 16) = *((_OWORD *)v0 + 6);
  return MEMORY[0x270FA2498](sub_2330806F0, 0, 0);
}

uint64_t sub_23307E2F8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 440) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23307E3F8, 0, 0);
}

uint64_t sub_23307E3F8()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 288);
  uint64_t v2 = *(void *)(v0 + 280);
  uint64_t v3 = *(void *)(v0 + 240);
  uint64_t v4 = (void *)*MEMORY[0x263F09508];
  sub_233081530(*(void *)(v0 + 104) + *(int *)(*(void *)(v0 + 216) + 52), v3, &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
  int v5 = v1(v3, 1, v2);
  uint64_t v6 = *(void *)(v0 + 240);
  if (v5 == 1)
  {
    id v7 = v4;
    sub_233081680(v6, &qword_268756548, (uint64_t (*)(uint64_t))type metadata accessor for FHIRDateTime);
    uint64_t v34 = 0;
LABEL_15:
    uint64_t v33 = v4;
    uint64_t v23 = *(void **)(v0 + 440);
    uint64_t v24 = *(void *)(v0 + 408);
    uint64_t v38 = *(void *)(v0 + 416);
    uint64_t v39 = *(void *)(v0 + 424);
    uint64_t v40 = *(void **)(v0 + 384);
    uint64_t v36 = *(void **)(v0 + 360);
    uint64_t v37 = *(void *)(v0 + 376);
    uint64_t v25 = *(void **)(v0 + 320);
    uint64_t v35 = *(void **)(v0 + 304);
    uint64_t v41 = *(void **)(v0 + 368);
    uint64_t v26 = *(void *)(v0 + 112);
    uint64_t v27 = *(uint64_t **)(v0 + 120);
    uint64_t v28 = *(void *)(v0 + 104);
    sub_232F3A800(0, &qword_268758320);
    uint64_t v29 = *(void *)(v28 + 104);
    uint64_t v30 = swift_bridgeObjectRetain();
    id v31 = sub_23303673C(v27, v26, v38, v39, v23, (uint64_t)v36, v37, (uint64_t)v35, (uint64_t)v25, (uint64_t)v33, v24, v0 + 16, (uint64_t)v34, 0, v29, v30, 0, 0, 0,
            0);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

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
    int v32 = *(uint64_t (**)(id))(v0 + 8);
    return v32(v31);
  }
  if (*(void *)(v6 + 56) == 1)
  {
    if (*(unsigned char *)(v6 + 19))
    {
      if (*(unsigned char *)(v6 + 17)) {
        uint64_t v8 = 3;
      }
      else {
        uint64_t v8 = 2;
      }
    }
    else
    {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void *)(v0 + 352);
  uint64_t v10 = *(void *)(v0 + 280);
  uint64_t v11 = *(void *)(v0 + 176);
  sub_232F3A800(0, (unint64_t *)&qword_2687576C8);
  id v12 = v4;
  FHIRDateTime.asDateComponents()();
  id v13 = (uint64_t *)(v6 + *(int *)(v10 + 32));
  uint64_t v14 = *v13;
  uint64_t v15 = v13[1];
  swift_bridgeObjectRetain();
  id v16 = sub_233017340(v11, v14, v15, v8);
  if (!v9)
  {
    uint64_t v34 = v16;
    sub_2330814D0(*(void *)(v0 + 240), (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
    goto LABEL_15;
  }
  uint64_t v17 = *(void **)(v0 + 440);
  uint64_t v18 = *(void **)(v0 + 368);
  uint64_t v19 = *(void **)(v0 + 320);
  uint64_t v20 = *(void **)(v0 + 304);
  uint64_t v45 = *(void *)(v0 + 240);
  uint64_t v44 = *(void *)(v0 + 120);
  uint64_t v42 = *(void **)(v0 + 360);
  uint64_t v43 = *(void *)(v0 + 112);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_233081680(v43, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690]);
  sub_2330814D0(v44, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
  sub_2330814D0(v45, (uint64_t (*)(void))type metadata accessor for FHIRDateTime);
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
  uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

uint64_t sub_23307E9A0(uint64_t a1)
{
  v2[26] = a1;
  v2[27] = v1;
  type metadata accessor for ModelsDSTU2.Observation(0);
  v2[28] = swift_task_alloc();
  type metadata accessor for ModelsDSTU2.Immunization(0);
  v2[29] = swift_task_alloc();
  type metadata accessor for ModelsDSTU2.DiagnosticReport(0);
  v2[30] = swift_task_alloc();
  type metadata accessor for RecordExtractionContext();
  v2[31] = swift_task_alloc();
  type metadata accessor for ModelsDSTU2.Condition(0);
  v2[32] = swift_task_alloc();
  v2[33] = type metadata accessor for ModelsDSTU2.ResourceProxy(0);
  v2[34] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23307EB10, 0, 0);
}

uint64_t sub_23307EB10()
{
  sub_2330815B0(*(void *)(v0 + 216), *(void *)(v0 + 272), type metadata accessor for ModelsDSTU2.ResourceProxy);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v1 = *(void *)(v0 + 248);
      uint64_t v2 = *(void *)(v0 + 208);
      sub_233081618(*(void *)(v0 + 272), *(void *)(v0 + 256), type metadata accessor for ModelsDSTU2.Condition);
      *(void *)(v0 + 280) = sub_232F3A800(0, (unint64_t *)&qword_268757800);
      sub_2330815B0(v2, v1, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
      uint64_t v3 = (void *)swift_task_alloc();
      *(void *)(v0 + 288) = v3;
      *uint64_t v3 = v0;
      v3[1] = sub_23307F094;
      uint64_t v4 = *(void *)(v0 + 256);
      v3[2] = *(void *)(v0 + 208);
      v3[3] = v4;
      int v5 = sub_2330801B4;
      goto LABEL_7;
    case 2u:
      uint64_t v6 = *(void *)(v0 + 248);
      uint64_t v7 = *(void *)(v0 + 208);
      sub_233081618(*(void *)(v0 + 272), *(void *)(v0 + 240), type metadata accessor for ModelsDSTU2.DiagnosticReport);
      *(void *)(v0 + 304) = sub_232F3A800(0, (unint64_t *)&qword_268757800);
      sub_2330815B0(v7, v6, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
      uint64_t v8 = (void *)swift_task_alloc();
      *(void *)(v0 + 312) = v8;
      *uint64_t v8 = v0;
      v8[1] = sub_23307F274;
      uint64_t v9 = *(void *)(v0 + 240);
      v8[2] = *(void *)(v0 + 208);
      v8[3] = v9;
      int v5 = sub_233080378;
      goto LABEL_7;
    case 3u:
      uint64_t v10 = *(void *)(v0 + 248);
      uint64_t v11 = *(void *)(v0 + 208);
      sub_233081618(*(void *)(v0 + 272), *(void *)(v0 + 232), type metadata accessor for ModelsDSTU2.Immunization);
      *(void *)(v0 + 328) = sub_232F3A800(0, (unint64_t *)&qword_268757800);
      sub_2330815B0(v11, v10, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
      id v12 = (void *)swift_task_alloc();
      *(void *)(v0 + 336) = v12;
      void *v12 = v0;
      v12[1] = sub_23307F454;
      uint64_t v13 = *(void *)(v0 + 232);
      v12[2] = *(void *)(v0 + 208);
      v12[3] = v13;
      int v5 = sub_23308052C;
      goto LABEL_7;
    case 4u:
      uint64_t v14 = *(void *)(v0 + 248);
      uint64_t v15 = *(void *)(v0 + 208);
      sub_233081618(*(void *)(v0 + 272), *(void *)(v0 + 224), type metadata accessor for ModelsDSTU2.Observation);
      *(void *)(v0 + 352) = sub_232F3A800(0, (unint64_t *)&qword_268757800);
      sub_2330815B0(v15, v14, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
      id v16 = (void *)swift_task_alloc();
      *(void *)(v0 + 360) = v16;
      *id v16 = v0;
      v16[1] = sub_23307F638;
      uint64_t v17 = *(void *)(v0 + 224);
      v16[2] = *(void *)(v0 + 208);
      v16[3] = v17;
      int v5 = sub_2330806F0;
LABEL_7:
      return MEMORY[0x270FA2498](v5, 0, 0);
    case 5u:
      uint64_t v18 = *(_OWORD **)(v0 + 272);
      *(_OWORD *)(v0 + 16) = *v18;
      long long v19 = v18[4];
      long long v21 = v18[1];
      long long v20 = v18[2];
      *(_OWORD *)(v0 + 64) = v18[3];
      *(_OWORD *)(v0 + 80) = v19;
      *(_OWORD *)(v0 + 32) = v21;
      *(_OWORD *)(v0 + 48) = v20;
      long long v22 = v18[8];
      long long v24 = v18[5];
      long long v23 = v18[6];
      *(_OWORD *)(v0 + 128) = v18[7];
      *(_OWORD *)(v0 + 144) = v22;
      *(_OWORD *)(v0 + 96) = v24;
      *(_OWORD *)(v0 + 112) = v23;
      sub_232F7CFAC(v0 + 16);
      goto LABEL_11;
    case 6u:
      uint64_t v26 = *(uint64_t **)(v0 + 272);
      uint64_t v27 = *(void *)(v0 + 248);
      uint64_t v28 = *(void *)(v0 + 208);
      uint64_t v29 = *v26;
      uint64_t v30 = v26[1];
      *(void *)(v0 + 376) = v30;
      uint64_t v31 = v26[2];
      uint64_t v32 = v26[3];
      *(void *)(v0 + 384) = v32;
      uint64_t v34 = v26[4];
      uint64_t v33 = v26[5];
      *(void *)(v0 + 160) = v29;
      *(void *)(v0 + 392) = v33;
      *(void *)(v0 + 168) = v30;
      *(void *)(v0 + 176) = v31;
      *(void *)(v0 + 184) = v32;
      *(void *)(v0 + 192) = v34;
      *(void *)(v0 + 200) = v33;
      *(void *)(v0 + 400) = sub_232F3A800(0, (unint64_t *)&qword_268757800);
      sub_2330815B0(v28, v27, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
      uint64_t v35 = (void *)swift_task_alloc();
      *(void *)(v0 + 408) = v35;
      *uint64_t v35 = v0;
      v35[1] = sub_23307F81C;
      return sub_232F68454();
    default:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_11:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
      return v25(0);
  }
}

uint64_t sub_23307F094(uint64_t a1)
{
  *(void *)(*(void *)v1 + 296) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23307F194, 0, 0);
}

uint64_t sub_23307F194()
{
  uint64_t v1 = (void *)v0[37];
  uint64_t v2 = v0[32];
  id v3 = sub_233041068(v0[31], (uint64_t)v1);

  sub_2330814D0(v2, type metadata accessor for ModelsDSTU2.Condition);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(id))v0[1];
  return v4(v3);
}

uint64_t sub_23307F274(uint64_t a1)
{
  *(void *)(*(void *)v1 + 320) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23307F374, 0, 0);
}

uint64_t sub_23307F374()
{
  uint64_t v1 = (void *)v0[40];
  uint64_t v2 = v0[30];
  id v3 = sub_233041068(v0[31], (uint64_t)v1);

  sub_2330814D0(v2, type metadata accessor for ModelsDSTU2.DiagnosticReport);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(id))v0[1];
  return v4(v3);
}

uint64_t sub_23307F454(uint64_t a1)
{
  *(void *)(*(void *)v1 + 344) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23307F554, 0, 0);
}

uint64_t sub_23307F554()
{
  uint64_t v1 = (void *)v0[43];
  uint64_t v2 = v0[29];
  id v3 = sub_233041068(v0[31], (uint64_t)v1);

  sub_2330814D0(v2, type metadata accessor for ModelsDSTU2.Immunization);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(id))v0[1];
  return v4(v3);
}

uint64_t sub_23307F638(uint64_t a1)
{
  *(void *)(*(void *)v1 + 368) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23307F738, 0, 0);
}

uint64_t sub_23307F738()
{
  uint64_t v1 = (void *)v0[46];
  uint64_t v2 = v0[28];
  id v3 = sub_233041068(v0[31], (uint64_t)v1);

  sub_2330814D0(v2, type metadata accessor for ModelsDSTU2.Observation);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(id))v0[1];
  return v4(v3);
}

uint64_t sub_23307F81C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 416) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23307F91C, 0, 0);
}

uint64_t sub_23307F91C()
{
  uint64_t v1 = (void *)v0[52];
  id v2 = sub_233041068(v0[31], (uint64_t)v1);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(id))v0[1];
  return v3(v2);
}

id sub_23307F9FC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v29 = a5;
  uint64_t v27 = a3;
  uint64_t v28 = a4;
  uint64_t v26 = a2;
  uint64_t v8 = type metadata accessor for ModelsDSTU2.Observation(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ModelsDSTU2.Immunization(0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for ModelsDSTU2.DiagnosticReport(0);
  MEMORY[0x270FA5388](v14 - 8);
  id v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for ModelsDSTU2.Condition(0);
  MEMORY[0x270FA5388](v17 - 8);
  long long v19 = (char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for ModelsDSTU2.ResourceProxy(0);
  MEMORY[0x270FA5388](v20);
  long long v22 = (char *)&v25 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2330815B0(v6, (uint64_t)v22, type metadata accessor for ModelsDSTU2.ResourceProxy);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_233081618((uint64_t)v22, (uint64_t)v19, type metadata accessor for ModelsDSTU2.Condition);
      id v23 = sub_23300549C(a1, v26, v27, v28, v29);
      sub_2330814D0((uint64_t)v19, type metadata accessor for ModelsDSTU2.Condition);
      break;
    case 2u:
      sub_233081618((uint64_t)v22, (uint64_t)v16, type metadata accessor for ModelsDSTU2.DiagnosticReport);
      id v23 = sub_23300549C(a1, v26, v27, v28, v29);
      sub_2330814D0((uint64_t)v16, type metadata accessor for ModelsDSTU2.DiagnosticReport);
      break;
    case 3u:
      sub_233081618((uint64_t)v22, (uint64_t)v13, type metadata accessor for ModelsDSTU2.Immunization);
      id v23 = sub_23300549C(a1, v26, v27, v28, v29);
      sub_2330814D0((uint64_t)v13, type metadata accessor for ModelsDSTU2.Immunization);
      break;
    case 4u:
      sub_233081618((uint64_t)v22, (uint64_t)v10, type metadata accessor for ModelsDSTU2.Observation);
      id v23 = sub_23300549C(a1, v26, v27, v28, v29);
      sub_2330814D0((uint64_t)v10, type metadata accessor for ModelsDSTU2.Observation);
      break;
    default:
      sub_2330814D0((uint64_t)v22, type metadata accessor for ModelsDSTU2.ResourceProxy);
      id v23 = 0;
      break;
  }
  return v23;
}

uint64_t sub_23307FDE4()
{
  uint64_t v1 = type metadata accessor for ModelsDSTU2.ResourceProxy(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2330815B0(v0, (uint64_t)v3, type metadata accessor for ModelsDSTU2.ResourceProxy);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
      sub_2330814D0((uint64_t)v3, type metadata accessor for ModelsDSTU2.ResourceProxy);
      type metadata accessor for DownloadableAttachmentExtractionResult();
      long long v6 = 0u;
      long long v7 = 0u;
      uint64_t v8 = 0;
      uint64_t v4 = swift_allocObject();
      *(void *)(v4 + 16) = 0;
      sub_233080104((uint64_t)&v6, v4 + 24);
      break;
    default:
      type metadata accessor for DownloadableAttachmentExtractionResult();
      long long v6 = 0u;
      long long v7 = 0u;
      uint64_t v8 = 0;
      uint64_t v4 = swift_allocObject();
      *(void *)(v4 + 16) = 0;
      sub_233080104((uint64_t)&v6, v4 + 24);
      sub_2330814D0((uint64_t)v3, type metadata accessor for ModelsDSTU2.ResourceProxy);
      break;
  }
  return v4;
}

uint64_t sub_23307FF6C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_233080000;
  return sub_23307694C(a1);
}

uint64_t sub_233080000(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_233080104(uint64_t a1, uint64_t a2)
{
  sub_233080DB0(0, (unint64_t *)&qword_268757690, (uint64_t)&qword_268757698, (uint64_t)&protocol descriptor for DomainResource, (void (*)(uint64_t, uint64_t, uint64_t))sub_232F3FD80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_233080194(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_2330801B4, 0, 0);
}

id sub_2330801B4()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = (long long *)(v1 + *(int *)(type metadata accessor for ModelsDSTU2.Condition(0) + 32));
  long long v10 = *v2;
  uint64_t v11 = *((void *)v2 + 2);
  uint64_t v3 = sub_233001A34();
  v0[4] = v3;
  sub_232F3A800(0, &qword_268757D30);
  id result = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_conditionRecordTypeForIdentifier_, *MEMORY[0x263F094B0], v10, v11);
  v0[5] = result;
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = v0[2];
    uint64_t v7 = v6 + *(int *)(type metadata accessor for RecordExtractionContext() + 20);
    if ((*(unsigned char *)(v7 + 16) & 4) != 0)
    {

      uint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
      return (id)v9(v3);
    }
    else
    {
      v0[6] = *(void *)(v7 + *(int *)(type metadata accessor for ExtractionContext() + 44));
      swift_retain();
      uint64_t v8 = (void *)swift_task_alloc();
      v0[7] = v8;
      *uint64_t v8 = v0;
      v8[1] = sub_2330816F0;
      return (id)sub_232FDDCD0(v3, (uint64_t)v5);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_233080358(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_233080378, 0, 0);
}

id sub_233080378()
{
  uint64_t v1 = v0[3];
  long long v9 = *(_OWORD *)(v1 + 48);
  uint64_t v10 = *(void *)(v1 + 64);
  uint64_t v2 = sub_233001A34();
  v0[4] = v2;
  sub_232F3A800(0, (unint64_t *)&qword_2687576B0);
  id result = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_diagnosticTestReportTypeForIdentifier_, *MEMORY[0x263F09500], v9, v10);
  v0[5] = result;
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v0[2];
    uint64_t v6 = v5 + *(int *)(type metadata accessor for RecordExtractionContext() + 20);
    if ((*(unsigned char *)(v6 + 16) & 4) != 0)
    {

      uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
      return (id)v8(v2);
    }
    else
    {
      v0[6] = *(void *)(v6 + *(int *)(type metadata accessor for ExtractionContext() + 44));
      swift_retain();
      uint64_t v7 = (void *)swift_task_alloc();
      v0[7] = v7;
      *uint64_t v7 = v0;
      v7[1] = sub_2330816F0;
      return (id)sub_232FDDCD0(v2, (uint64_t)v4);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23308050C(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_23308052C, 0, 0);
}

id sub_23308052C()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = (long long *)(v1 + *(int *)(type metadata accessor for ModelsDSTU2.Immunization(0) + 52));
  long long v10 = *v2;
  uint64_t v11 = *((void *)v2 + 2);
  uint64_t v3 = sub_233001A34();
  v0[4] = v3;
  sub_232F3A800(0, &qword_268757808);
  id result = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_vaccinationRecordTypeForIdentifier_, *MEMORY[0x263F0A028], v10, v11);
  v0[5] = result;
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = v0[2];
    uint64_t v7 = v6 + *(int *)(type metadata accessor for RecordExtractionContext() + 20);
    if ((*(unsigned char *)(v7 + 16) & 4) != 0)
    {

      long long v9 = (uint64_t (*)(uint64_t))v0[1];
      return (id)v9(v3);
    }
    else
    {
      v0[6] = *(void *)(v7 + *(int *)(type metadata accessor for ExtractionContext() + 44));
      swift_retain();
      uint64_t v8 = (void *)swift_task_alloc();
      v0[7] = v8;
      *uint64_t v8 = v0;
      v8[1] = sub_2330816F0;
      return (id)sub_232FDDCD0(v3, (uint64_t)v5);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2330806D0(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_2330806F0, 0, 0);
}

id sub_2330806F0()
{
  uint64_t v1 = v0[3];
  long long v9 = *(_OWORD *)(v1 + 80);
  uint64_t v10 = *(void *)(v1 + 96);
  uint64_t v2 = sub_233001A34();
  v0[4] = v2;
  sub_232F3A800(0, &qword_268757D38);
  id result = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_diagnosticTestResultTypeForIdentifier_, *MEMORY[0x263F09518], v9, v10);
  v0[5] = result;
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v0[2];
    uint64_t v6 = v5 + *(int *)(type metadata accessor for RecordExtractionContext() + 20);
    if ((*(unsigned char *)(v6 + 16) & 4) != 0)
    {

      uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
      return (id)v8(v2);
    }
    else
    {
      v0[6] = *(void *)(v6 + *(int *)(type metadata accessor for ExtractionContext() + 44));
      swift_retain();
      uint64_t v7 = (void *)swift_task_alloc();
      v0[7] = v7;
      *uint64_t v7 = v0;
      v7[1] = sub_232F5E978;
      return (id)sub_232FDDCD0(v2, (uint64_t)v4);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_233080884(uint64_t a1)
{
  sub_233080D4C(0, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v21 - v4;
  uint64_t v6 = sub_23309B230();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  long long v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23309AE30();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v1[7])
  {
    uint64_t v15 = v1[6];
  }
  else
  {
    uint64_t v22 = v11;
    uint64_t v23 = v12;
    sub_23309AE20();
    if (v1[2])
    {
      uint64_t v24 = v1[2];
      sub_233081484(0, (unint64_t *)&qword_268756B00, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
      sub_232F65EE4();
      sub_23309B6C0();
      sub_23309ADF0();
    }
    if (v1[4])
    {
      uint64_t v24 = v1[4];
      sub_233081484(0, (unint64_t *)&qword_268756B00, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
      sub_232F65EE4();
      sub_23309B6C0();
      sub_23309ADD0();
    }
    if (v1[3])
    {
      uint64_t v24 = v1[3];
      sub_233081484(0, (unint64_t *)&qword_268756B00, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
      sub_232F65EE4();
      sub_23309B6C0();
      sub_23309ADE0();
    }
    if (v1[5])
    {
      uint64_t v24 = v1[5];
      sub_233081484(0, (unint64_t *)&qword_268756B00, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
      sub_232F65EE4();
      sub_23309B6C0();
      sub_23309AE00();
    }
    id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A78]), sel_init);
    objc_msgSend(v16, sel_setStyle_, 3);
    sub_233081530(a1, (uint64_t)v5, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690]);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
    {
      sub_233081680((uint64_t)v5, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690]);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
      uint64_t v17 = (void *)sub_23309B210();
      objc_msgSend(v16, sel_setLocale_, v17);

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    uint64_t v18 = (void *)sub_23309AE10();
    id v19 = objc_msgSend(v16, sel_stringFromPersonNameComponents_, v18);

    uint64_t v15 = sub_23309B710();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v22);
  }
  swift_bridgeObjectRetain();
  return v15;
}

void sub_233080D4C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_233080DB0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    a5(255, a3, a4);
    unint64_t v6 = sub_23309BD00();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

unint64_t sub_233080E0C()
{
  unint64_t result = qword_268758C30;
  if (!qword_268758C30)
  {
    sub_233080D4C(255, &qword_268757870, type metadata accessor for ModelsDSTU2.Bundle.BundleEntry, MEMORY[0x263F8D488]);
    sub_233080EDC(&qword_268758C38, (void (*)(uint64_t))type metadata accessor for ModelsDSTU2.Bundle.BundleEntry);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268758C30);
  }
  return result;
}

uint64_t sub_233080EDC(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_233080F24(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, unint64_t))
{
  if (!*a2)
  {
    sub_233080D4C(255, &qword_268757870, type metadata accessor for ModelsDSTU2.Bundle.BundleEntry, MEMORY[0x263F8D488]);
    uint64_t v7 = v6;
    sub_23304079C();
    uint64_t v9 = v8;
    unint64_t v10 = sub_233080E0C();
    unint64_t v11 = a3(a1, v7, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

uint64_t sub_233080FD8()
{
  uint64_t v1 = (int *)(type metadata accessor for RecordExtractionContext() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);

  uint64_t v5 = v0 + v3 + v1[7];
  uint64_t v6 = type metadata accessor for ExtractionContext();
  uint64_t v7 = v5 + *(int *)(v6 + 28);
  uint64_t v8 = sub_23309B190();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v5 + *(int *)(v6 + 32);
  uint64_t v10 = sub_23309AF80();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_233081194(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(type metadata accessor for RecordExtractionContext() - 8);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_23300BE68;
  return sub_233076234(a1, a2, v7);
}

uint64_t sub_23308127C(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, unint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_233080F24(255, a2, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

double sub_2330812C0(_OWORD *a1)
{
  double result = 0.0;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_2330812DC(uint64_t a1, uint64_t a2)
{
  sub_233081484(0, &qword_268758C70, (uint64_t)&type metadata for ModelsDSTU2.Patient, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_233081364()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2330813AC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 120) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 160, 7);
}

uint64_t sub_23308143C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_233081484(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_2330814D0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_233081530(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  sub_233080D4C(0, a3, a4, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t sub_2330815B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_233081618(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_233081680(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_233080D4C(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> VCJWK.calculateThumbprint()()
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  uint64_t v1 = sub_23309AC20();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v51 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_23309B5B0();
  uint64_t v50 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_23309B500();
  uint64_t v7 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  uint64_t v57 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23309AB60();
  MEMORY[0x270FA5388](v9 - 8);
  int v10 = *v0;
  uint64_t v53 = v1;
  uint64_t v54 = v7;
  uint64_t v52 = v2;
  uint64_t v55 = v6;
  unint64_t v56 = v4;
  if (!v10)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = *((void *)v0 + 7);
    unint64_t v60 = *((void *)v0 + 6);
    unint64_t v61 = 0;
    uint64_t v20 = *((void *)v0 + 5);
    uint64_t v59 = *((void *)v0 + 4);
    uint64_t v15 = 0;
    uint64_t v11 = 3;
    uint64_t v13 = v20;
    uint64_t v14 = v19;
    goto LABEL_5;
  }
  uint64_t v11 = v0[1];
  uint64_t v12 = *((void *)v0 + 9);
  unint64_t v61 = *((void *)v0 + 8);
  if (v10 == 1)
  {
    uint64_t v59 = 0;
    unint64_t v60 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    id v16 = v0 + 80;
    uint64_t v15 = *((void *)v0 + 10);
    uint64_t v17 = v12;
    uint64_t v18 = *((void *)v16 + 1);
LABEL_5:
    swift_bridgeObjectRetain();
    goto LABEL_7;
  }
  uint64_t v59 = 0;
  unint64_t v60 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v18 = 0;
  uint64_t v17 = v12;
LABEL_7:
  swift_bridgeObjectRetain();
  LOBYTE(v76) = v10;
  BYTE1(v76) = v11;
  *((void *)&v76 + 1) = 0;
  *(void *)&long long v77 = 0;
  BYTE8(v77) = 2;
  *(void *)&long long v78 = v59;
  *((void *)&v78 + 1) = v13;
  *(void *)&long long v79 = v60;
  *((void *)&v79 + 1) = v14;
  *(void *)&long long v80 = v61;
  *((void *)&v80 + 1) = v17;
  *(void *)&long long v81 = v15;
  *((void *)&v81 + 1) = v18;
  sub_23309ABA0();
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v84 = 0;
  swift_allocObject();
  uint64_t v21 = sub_23309AB90();
  sub_23309AB40();
  uint64_t v22 = v21;
  sub_23309AB70();
  long long v73 = v82;
  long long v74 = v83;
  uint64_t v75 = v84;
  long long v69 = v78;
  long long v70 = v79;
  long long v71 = v80;
  long long v72 = v81;
  long long v67 = v76;
  long long v68 = v77;
  sub_23303D64C();
  uint64_t v23 = v62;
  uint64_t v24 = sub_23309AB80();
  if (v23)
  {
    swift_release();
    sub_232F63238((uint64_t)&v76);
  }
  else
  {
    uint64_t v26 = v24;
    unint64_t v27 = v25;
    sub_232F63238((uint64_t)&v76);
    uint64_t v28 = sub_233081FC4(&qword_268758C80, MEMORY[0x263F047F8]);
    uint64_t v30 = v55;
    unint64_t v29 = v56;
    sub_23309B4F0();
    unint64_t v61 = v27;
    uint64_t v62 = v26;
    switch(v27 >> 62)
    {
      case 1uLL:
        uint64_t v59 = v28;
        if (v26 >> 32 < (int)v26) {
          __break(1u);
        }
        unint64_t v60 = v27 & 0x3FFFFFFFFFFFFFFFLL;
        sub_232E9A9F4(v26, v27);
        sub_233081EE4((int)v26, v26 >> 32);
        unint64_t v60 = 0;
        goto LABEL_16;
      case 2uLL:
        uint64_t v59 = v28;
        uint64_t v31 = *(void *)(v26 + 16);
        unint64_t v60 = *(void *)(v26 + 24);
        sub_232E9A9F4(v26, v27);
        swift_retain();
        swift_retain();
        sub_233081EE4(v31, v60);
        unint64_t v60 = 0;
        swift_release();
        swift_release();
LABEL_16:
        sub_232E9AA4C(v26, v27);
        uint64_t v32 = v50;
        goto LABEL_17;
      case 3uLL:
        unint64_t v60 = 0;
        *(void *)((char *)&v67 + 6) = 0;
        *(void *)&long long v67 = 0;
        goto LABEL_13;
      default:
        unint64_t v60 = 0;
        *(void *)&long long v67 = v26;
        WORD4(v67) = v27;
        BYTE10(v67) = BYTE2(v27);
        BYTE11(v67) = BYTE3(v27);
        BYTE12(v67) = BYTE4(v27);
        BYTE13(v67) = BYTE5(v27);
LABEL_13:
        sub_23309B4D0();
        sub_232E9AA4C(v26, v27);
        uint64_t v32 = v50;
LABEL_17:
        sub_23309B4E0();
        (*(void (**)(char *, unint64_t))(v32 + 8))(v30, v29);
        sub_233081FC4(&qword_268758C88, MEMORY[0x263F045C0]);
        uint64_t v33 = sub_23309B5A0();
        sub_23308200C(v33, v34);
        swift_bridgeObjectRelease();
        uint64_t v35 = swift_retain();
        uint64_t v59 = sub_233082194(v35);
        unint64_t v56 = v36;
        swift_release();
        *(void *)&long long v67 = sub_23309B020();
        *((void *)&v67 + 1) = v37;
        uint64_t v38 = v51;
        sub_23309ABB0();
        sub_232F379FC();
        uint64_t v39 = sub_23309BD40();
        uint64_t v41 = v40;
        (*(void (**)(char *, uint64_t))(v52 + 8))(v38, v53);
        swift_bridgeObjectRelease();
        *(void *)&long long v67 = v39;
        *((void *)&v67 + 1) = v41;
        uint64_t v65 = 43;
        unint64_t v66 = 0xE100000000000000;
        uint64_t v63 = 45;
        unint64_t v64 = 0xE100000000000000;
        uint64_t v42 = sub_23309BD50();
        uint64_t v44 = v43;
        swift_bridgeObjectRelease();
        *(void *)&long long v67 = v42;
        *((void *)&v67 + 1) = v44;
        uint64_t v65 = 47;
        unint64_t v66 = 0xE100000000000000;
        uint64_t v63 = 95;
        unint64_t v64 = 0xE100000000000000;
        uint64_t v22 = sub_23309BD50();
        uint64_t v11 = v45;
        swift_bridgeObjectRelease();
        sub_232E9AA4C(v59, v56);
        swift_release();
        sub_232E9AA4C(v62, v61);
        swift_release();
        (*(void (**)(char *, uint64_t))(v54 + 8))(v57, v58);
        break;
    }
  }
  uint64_t v46 = v22;
  uint64_t v47 = (void *)v11;
  result._object = v47;
  result._uint64_t countAndFlagsBits = v46;
  return result;
}

uint64_t sub_233081EE4(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_23309ACB0();
  if (!result || (uint64_t result = sub_23309ACD0(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_23309ACC0();
      sub_23309B5B0();
      sub_233081FC4(&qword_268758C80, MEMORY[0x263F047F8]);
      return sub_23309B4D0();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_233081FC4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23308200C(uint64_t result, uint64_t a2)
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
          sub_2330822BC(0, (unint64_t *)&qword_2687570E0, MEMORY[0x263F8E0F8]);
          uint64_t v12 = (void *)swift_allocObject();
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

uint64_t sub_233082194(uint64_t a1)
{
  sub_2330822BC(0, &qword_268758C90, MEMORY[0x263F8D488]);
  uint64_t v3 = v2;
  v10[3] = v2;
  v10[4] = sub_233082248();
  v10[0] = a1;
  size_t v4 = __swift_project_boxed_opaque_existential_1(v10, v3);
  uint64_t v5 = (unsigned char *)(*v4 + 32);
  uint64_t v6 = &v5[*(void *)(*v4 + 16)];
  swift_bridgeObjectRetain();
  sub_23306E334(v5, v6, &v9);
  uint64_t v7 = v9;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v7;
}

unint64_t sub_233082248()
{
  unint64_t result = qword_268758C98;
  if (!qword_268758C98)
  {
    sub_2330822BC(255, &qword_268758C90, MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268758C98);
  }
  return result;
}

void sub_2330822BC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, void))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, MEMORY[0x263F8E778]);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_23308230C(uint64_t a1)
{
  v2[15] = a1;
  v2[16] = v1;
  v2[17] = type metadata accessor for ModelsR4.ResourceProxy(0);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  unint64_t v4 = (void *)swift_task_alloc();
  v2[20] = v4;
  *unint64_t v4 = v2;
  v4[1] = sub_2330823EC;
  return sub_233083018(a1);
}

uint64_t sub_2330823EC(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 168) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_233082544, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_233082544()
{
  uint64_t v39 = v0;
  uint64_t v1 = *(void **)(v0 + 168);
  *(void *)(v0 + 88) = v1;
  id v2 = v1;
  sub_232F3FD80(0, (unint64_t *)&qword_268757070);
  if (!swift_dynamicCast()) {
    goto LABEL_5;
  }
  unint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v6 = *(void *)(v0 + 40);
  int v7 = *(unsigned __int8 *)(v0 + 48);
  if (v7 != 7 || v4 | v3 | v5 | v6)
  {
    sub_23304B118((void *)v3, v4, v5, v6, v7);
LABEL_5:

    if (qword_2687563A0 != -1) {
      swift_once();
    }
    char v8 = *(void **)(v0 + 168);
    uint64_t v9 = *(void *)(v0 + 152);
    uint64_t v10 = *(void *)(v0 + 128);
    uint64_t v11 = sub_23309B4B0();
    __swift_project_value_buffer(v11, (uint64_t)qword_268770F68);
    sub_2330863A8(v10, v9, type metadata accessor for ModelsR4.ResourceProxy);
    id v12 = v8;
    id v13 = v8;
    unint64_t v14 = sub_23309B4A0();
    os_log_type_t v15 = sub_23309BB80();
    BOOL v16 = os_log_type_enabled(v14, v15);
    BOOL v17 = *(void **)(v0 + 168);
    uint64_t v18 = *(void *)(v0 + 152);
    if (v16)
    {
      uint64_t v19 = *(void *)(v0 + 144);
      uint64_t v20 = swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = v37;
      *(_DWORD *)uint64_t v20 = 136315394;
      sub_2330863A8(v18, v19, type metadata accessor for ModelsR4.ResourceProxy);
      uint64_t v21 = sub_23309B770();
      *(void *)(v0 + 96) = sub_232F62B64(v21, v22, &v38);
      sub_23309BD10();
      swift_bridgeObjectRelease();
      sub_233086348(v18, type metadata accessor for ModelsR4.ResourceProxy);
      *(_WORD *)(v20 + 12) = 2080;
      *(void *)(v0 + 104) = v17;
      id v23 = v17;
      id v24 = v17;
      sub_23309C320();
      id v25 = (id)HKSensitiveLogItem();
      swift_unknownObjectRelease();
      sub_23309BDB0();
      swift_unknownObjectRelease();
      uint64_t v26 = sub_23309B770();
      unint64_t v28 = v27;

      *(void *)(v0 + 112) = sub_232F62B64(v26, v28, &v38);
      sub_23309BD10();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_232E63000, v14, v15, "ModelsR4.ResourceProxy.extractMedicalRecord: failed to extract %s to HKMedicalRecord, returning HKUnknownRecord. Error: %s", (uint8_t *)v20, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x237DB6EC0](v37, -1, -1);
      MEMORY[0x237DB6EC0](v20, -1, -1);
    }
    else
    {
      sub_233086348(*(void *)(v0 + 152), type metadata accessor for ModelsR4.ResourceProxy);
    }
    unint64_t v29 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v29;
    *unint64_t v29 = v0;
    v29[1] = sub_233077094;
    uint64_t v30 = *(void *)(v0 + 120);
    return sub_2330847B4(v30);
  }

  if (qword_2687563A0 != -1) {
    swift_once();
  }
  uint64_t v32 = sub_23309B4B0();
  __swift_project_value_buffer(v32, (uint64_t)qword_268770F68);
  uint64_t v33 = sub_23309B4A0();
  os_log_type_t v34 = sub_23309BB60();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v35 = 0;
    _os_log_impl(&dword_232E63000, v33, v34, "ModelsR4.ResourceProxy.extractMedicalRecord: found entered-in-error record, skipping", v35, 2u);
    MEMORY[0x237DB6EC0](v35, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v36 = *(uint64_t (**)(void))(v0 + 8);
  return v36(0);
}

id sub_233082A54(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for ModelsR4.ResourceProxy(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = (void *)sub_232FE782C(a2);
  unint64_t v7 = sub_233020734(v6);
  swift_bridgeObjectRelease();
  id v8 = v5;
  uint64_t v9 = sub_233086410();
  id v11 = sub_233085B80(a1, v8, v7, v9, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v11;
}

uint64_t sub_233083018(uint64_t a1)
{
  v2[27] = a1;
  v2[28] = v1;
  type metadata accessor for ModelsR4.Observation(0);
  v2[29] = swift_task_alloc();
  type metadata accessor for ModelsR4.Immunization(0);
  v2[30] = swift_task_alloc();
  type metadata accessor for ModelsR4.DocumentReference(0);
  v2[31] = swift_task_alloc();
  v2[32] = type metadata accessor for ModelsR4.DiagnosticReport(0);
  v2[33] = swift_task_alloc();
  type metadata accessor for ModelsR4.Condition(0);
  v2[34] = swift_task_alloc();
  v2[35] = type metadata accessor for ModelsR4.ResourceProxy(0);
  v2[36] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23308318C, 0, 0);
}

uint64_t sub_23308318C()
{
  sub_2330863A8(*(void *)(v0 + 224), *(void *)(v0 + 288), type metadata accessor for ModelsR4.ResourceProxy);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_4;
    case 2u:
      sub_2330862E0(*(void *)(v0 + 288), *(void *)(v0 + 272), type metadata accessor for ModelsR4.Condition);
      uint64_t v1 = (void *)swift_task_alloc();
      *(void *)(v0 + 296) = v1;
      *uint64_t v1 = v0;
      v1[1] = sub_233083768;
      uint64_t v2 = *(void *)(v0 + 216);
      return sub_232FE89A0(v2);
    case 3u:
      sub_2330862E0(*(void *)(v0 + 288), *(void *)(v0 + 264), type metadata accessor for ModelsR4.DiagnosticReport);
      if ((sub_232F5E0B8() & 1) == 0
        && (uint64_t v4 = *(void *)(*(void *)(v0 + 264) + *(int *)(*(void *)(v0 + 256) + 60))) != 0
        && *(void *)(v4 + 16))
      {
        *(void *)(v0 + 328) = sub_232F5EAC8(*(void *)(v0 + 216));
        return MEMORY[0x270FA2498](sub_233083A84, 0, 0);
      }
      else
      {
        unint64_t v29 = (void *)swift_task_alloc();
        *(void *)(v0 + 320) = v29;
        *unint64_t v29 = v0;
        v29[1] = sub_23308395C;
        uint64_t v30 = *(void *)(v0 + 216);
        return sub_232F609AC(v30);
      }
    case 4u:
      sub_2330862E0(*(void *)(v0 + 288), *(void *)(v0 + 248), type metadata accessor for ModelsR4.DocumentReference);
      uint64_t v5 = (void *)swift_task_alloc();
      *(void *)(v0 + 344) = v5;
      *uint64_t v5 = v0;
      v5[1] = sub_233083C14;
      uint64_t v6 = *(void *)(v0 + 216);
      return sub_23306F638(v6);
    case 5u:
      sub_2330862E0(*(void *)(v0 + 288), *(void *)(v0 + 240), type metadata accessor for ModelsR4.Immunization);
      unint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 368) = v7;
      *unint64_t v7 = v0;
      v7[1] = sub_233083E08;
      uint64_t v8 = *(void *)(v0 + 216);
      return sub_232FFF394(v8);
    case 6u:
      sub_2330862E0(*(void *)(v0 + 288), *(void *)(v0 + 232), type metadata accessor for ModelsR4.Observation);
      uint64_t v9 = (void *)swift_task_alloc();
      *(void *)(v0 + 392) = v9;
      void *v9 = v0;
      v9[1] = sub_233083FFC;
      uint64_t v10 = *(void *)(v0 + 216);
      return sub_23300C64C(v10);
    case 7u:
      uint64_t v11 = *(void *)(v0 + 288);
      long long v12 = *(_OWORD *)(v11 + 16);
      *(_OWORD *)(v0 + 16) = *(_OWORD *)v11;
      *(_OWORD *)(v0 + 32) = v12;
      long long v13 = *(_OWORD *)(v11 + 80);
      long long v15 = *(_OWORD *)(v11 + 32);
      long long v14 = *(_OWORD *)(v11 + 48);
      *(_OWORD *)(v0 + 80) = *(_OWORD *)(v11 + 64);
      *(_OWORD *)(v0 + 96) = v13;
      *(_OWORD *)(v0 + 48) = v15;
      *(_OWORD *)(v0 + 64) = v14;
      long long v17 = *(_OWORD *)(v11 + 112);
      long long v16 = *(_OWORD *)(v11 + 128);
      long long v18 = *(_OWORD *)(v11 + 96);
      *(void *)(v0 + 160) = *(void *)(v11 + 144);
      *(_OWORD *)(v0 + 128) = v17;
      *(_OWORD *)(v0 + 144) = v16;
      *(_OWORD *)(v0 + 112) = v18;
      sub_232EA49DC(v0 + 16);
      goto LABEL_22;
    case 8u:
      uint64_t v20 = *(uint64_t **)(v0 + 288);
      uint64_t v21 = *v20;
      uint64_t v22 = v20[1];
      *(void *)(v0 + 416) = v22;
      uint64_t v23 = v20[2];
      uint64_t v24 = v20[3];
      *(void *)(v0 + 424) = v24;
      uint64_t v26 = v20[4];
      uint64_t v25 = v20[5];
      *(void *)(v0 + 432) = v25;
      *(void *)(v0 + 168) = v21;
      *(void *)(v0 + 176) = v22;
      *(void *)(v0 + 184) = v23;
      *(void *)(v0 + 192) = v24;
      *(void *)(v0 + 200) = v26;
      *(void *)(v0 + 208) = v25;
      unint64_t v27 = (void *)swift_task_alloc();
      *(void *)(v0 + 440) = v27;
      *unint64_t v27 = v0;
      v27[1] = sub_2330841F0;
      uint64_t v28 = *(void *)(v0 + 216);
      return sub_232F68640(v28);
    default:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_4:
      swift_bridgeObjectRelease();
LABEL_22:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
      return v19(0);
  }
}

uint64_t sub_233083768(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 304) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_2330843E0;
  }
  else
  {
    *(void *)(v4 + 312) = a1;
    uint64_t v5 = sub_233083890;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_233083890()
{
  uint64_t v1 = v0[39];
  sub_233086348(v0[34], type metadata accessor for ModelsR4.Condition);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_23308395C(uint64_t a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    *(void *)(v4 + 336) = v1;
    uint64_t v5 = sub_233083B50;
  }
  else
  {
    *(void *)(v4 + 328) = a1;
    uint64_t v5 = sub_233083A84;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_233083A84()
{
  uint64_t v1 = v0[41];
  sub_233086348(v0[33], type metadata accessor for ModelsR4.DiagnosticReport);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_233083B50()
{
  sub_233086348(*(void *)(v0 + 264), type metadata accessor for ModelsR4.DiagnosticReport);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_233083C14(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 352) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_2330844A4;
  }
  else
  {
    *(void *)(v4 + 360) = a1;
    uint64_t v5 = sub_233083D3C;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_233083D3C()
{
  uint64_t v1 = v0[45];
  sub_233086348(v0[31], type metadata accessor for ModelsR4.DocumentReference);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_233083E08(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 376) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_233084568;
  }
  else
  {
    *(void *)(v4 + 384) = a1;
    uint64_t v5 = sub_233083F30;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_233083F30()
{
  uint64_t v1 = v0[48];
  sub_233086348(v0[30], type metadata accessor for ModelsR4.Immunization);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_233083FFC(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 400) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_23308462C;
  }
  else
  {
    *(void *)(v4 + 408) = a1;
    uint64_t v5 = sub_233084124;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_233084124()
{
  uint64_t v1 = v0[51];
  sub_233086348(v0[29], type metadata accessor for ModelsR4.Observation);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t sub_2330841F0(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 448) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_2330846F0;
  }
  else
  {
    swift_bridgeObjectRelease();
    *(void *)(v4 + 456) = a1;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_233084330;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_233084330()
{
  uint64_t v1 = *(void *)(v0 + 456);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2330843E0()
{
  sub_233086348(*(void *)(v0 + 272), type metadata accessor for ModelsR4.Condition);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2330844A4()
{
  sub_233086348(*(void *)(v0 + 248), type metadata accessor for ModelsR4.DocumentReference);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_233084568()
{
  sub_233086348(*(void *)(v0 + 240), type metadata accessor for ModelsR4.Immunization);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23308462C()
{
  sub_233086348(*(void *)(v0 + 232), type metadata accessor for ModelsR4.Observation);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2330846F0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2330847B4(uint64_t a1)
{
  v2[27] = a1;
  v2[28] = v1;
  type metadata accessor for ModelsR4.Observation(0);
  v2[29] = swift_task_alloc();
  type metadata accessor for ModelsR4.Immunization(0);
  v2[30] = swift_task_alloc();
  type metadata accessor for ModelsR4.DocumentReference(0);
  v2[31] = swift_task_alloc();
  type metadata accessor for ModelsR4.DiagnosticReport(0);
  v2[32] = swift_task_alloc();
  type metadata accessor for RecordExtractionContext();
  v2[33] = swift_task_alloc();
  type metadata accessor for ModelsR4.Condition(0);
  v2[34] = swift_task_alloc();
  v2[35] = type metadata accessor for ModelsR4.ResourceProxy(0);
  v2[36] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_233084950, 0, 0);
}

uint64_t sub_233084950()
{
  sub_2330863A8(*(void *)(v0 + 224), *(void *)(v0 + 288), type metadata accessor for ModelsR4.ResourceProxy);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_4;
    case 2u:
      uint64_t v1 = *(void *)(v0 + 264);
      uint64_t v2 = *(void *)(v0 + 216);
      sub_2330862E0(*(void *)(v0 + 288), *(void *)(v0 + 272), type metadata accessor for ModelsR4.Condition);
      *(void *)(v0 + 296) = sub_232F690FC();
      sub_2330863A8(v2, v1, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
      uint64_t v3 = (void *)swift_task_alloc();
      *(void *)(v0 + 304) = v3;
      *uint64_t v3 = v0;
      v3[1] = sub_233084FD4;
      uint64_t v4 = *(void *)(v0 + 216);
      return sub_232FE8030(v4);
    case 3u:
      uint64_t v6 = *(void *)(v0 + 264);
      uint64_t v7 = *(void *)(v0 + 216);
      sub_2330862E0(*(void *)(v0 + 288), *(void *)(v0 + 256), type metadata accessor for ModelsR4.DiagnosticReport);
      *(void *)(v0 + 320) = sub_232F690FC();
      sub_2330863A8(v7, v6, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
      uint64_t v8 = (void *)swift_task_alloc();
      *(void *)(v0 + 328) = v8;
      *uint64_t v8 = v0;
      v8[1] = sub_2330851C4;
      uint64_t v9 = *(void *)(v0 + 216);
      return sub_232F5E7C4(v9);
    case 4u:
      uint64_t v10 = *(void *)(v0 + 264);
      uint64_t v11 = *(void *)(v0 + 216);
      sub_2330862E0(*(void *)(v0 + 288), *(void *)(v0 + 248), type metadata accessor for ModelsR4.DocumentReference);
      *(void *)(v0 + 344) = sub_232F690FC();
      sub_2330863A8(v11, v10, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
      long long v12 = (void *)swift_task_alloc();
      *(void *)(v0 + 352) = v12;
      void *v12 = v0;
      v12[1] = sub_2330853B4;
      uint64_t v13 = *(void *)(v0 + 216);
      return sub_23306ED3C(v13);
    case 5u:
      uint64_t v14 = *(void *)(v0 + 264);
      uint64_t v15 = *(void *)(v0 + 216);
      sub_2330862E0(*(void *)(v0 + 288), *(void *)(v0 + 240), type metadata accessor for ModelsR4.Immunization);
      *(void *)(v0 + 368) = sub_232F690FC();
      sub_2330863A8(v15, v14, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
      long long v16 = (void *)swift_task_alloc();
      *(void *)(v0 + 376) = v16;
      *long long v16 = v0;
      v16[1] = sub_2330855A8;
      uint64_t v17 = *(void *)(v0 + 216);
      return sub_232FFF1D0(v17);
    case 6u:
      uint64_t v18 = *(void *)(v0 + 264);
      uint64_t v19 = *(void *)(v0 + 216);
      sub_2330862E0(*(void *)(v0 + 288), *(void *)(v0 + 232), type metadata accessor for ModelsR4.Observation);
      *(void *)(v0 + 392) = sub_232F690FC();
      sub_2330863A8(v19, v18, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
      uint64_t v20 = (void *)swift_task_alloc();
      *(void *)(v0 + 400) = v20;
      void *v20 = v0;
      v20[1] = sub_23308579C;
      uint64_t v21 = *(void *)(v0 + 216);
      return sub_23300C498(v21);
    case 7u:
      uint64_t v22 = *(void *)(v0 + 288);
      long long v23 = *(_OWORD *)(v22 + 16);
      *(_OWORD *)(v0 + 16) = *(_OWORD *)v22;
      *(_OWORD *)(v0 + 32) = v23;
      long long v24 = *(_OWORD *)(v22 + 80);
      long long v26 = *(_OWORD *)(v22 + 32);
      long long v25 = *(_OWORD *)(v22 + 48);
      *(_OWORD *)(v0 + 80) = *(_OWORD *)(v22 + 64);
      *(_OWORD *)(v0 + 96) = v24;
      *(_OWORD *)(v0 + 48) = v26;
      *(_OWORD *)(v0 + 64) = v25;
      long long v28 = *(_OWORD *)(v22 + 112);
      long long v27 = *(_OWORD *)(v22 + 128);
      long long v29 = *(_OWORD *)(v22 + 96);
      *(void *)(v0 + 160) = *(void *)(v22 + 144);
      *(_OWORD *)(v0 + 128) = v28;
      *(_OWORD *)(v0 + 144) = v27;
      *(_OWORD *)(v0 + 112) = v29;
      sub_232EA49DC(v0 + 16);
      goto LABEL_21;
    case 8u:
      uint64_t v31 = *(uint64_t **)(v0 + 288);
      uint64_t v32 = *(void *)(v0 + 264);
      uint64_t v33 = *(void *)(v0 + 216);
      uint64_t v34 = *v31;
      uint64_t v35 = v31[1];
      *(void *)(v0 + 416) = v35;
      uint64_t v36 = v31[2];
      uint64_t v37 = v31[3];
      *(void *)(v0 + 424) = v37;
      uint64_t v39 = v31[4];
      uint64_t v38 = v31[5];
      *(void *)(v0 + 168) = v34;
      *(void *)(v0 + 432) = v38;
      *(void *)(v0 + 176) = v35;
      *(void *)(v0 + 184) = v36;
      *(void *)(v0 + 192) = v37;
      *(void *)(v0 + 200) = v39;
      *(void *)(v0 + 208) = v38;
      *(void *)(v0 + 440) = sub_232F690FC();
      sub_2330863A8(v33, v32, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
      uint64_t v40 = (void *)swift_task_alloc();
      *(void *)(v0 + 448) = v40;
      *uint64_t v40 = v0;
      v40[1] = sub_233085990;
      return sub_232F68454();
    default:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_4:
      swift_bridgeObjectRelease();
LABEL_21:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v30 = *(uint64_t (**)(void))(v0 + 8);
      return v30(0);
  }
}

uint64_t sub_233084FD4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 312) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2330850D4, 0, 0);
}

uint64_t sub_2330850D4()
{
  uint64_t v1 = (void *)v0[39];
  uint64_t v2 = v0[34];
  id v3 = sub_233041068(v0[33], (uint64_t)v1);

  sub_233086348(v2, type metadata accessor for ModelsR4.Condition);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(id))v0[1];
  return v4(v3);
}

uint64_t sub_2330851C4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 336) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2330852C4, 0, 0);
}

uint64_t sub_2330852C4()
{
  uint64_t v1 = (void *)v0[42];
  uint64_t v2 = v0[32];
  id v3 = sub_233041068(v0[33], (uint64_t)v1);

  sub_233086348(v2, type metadata accessor for ModelsR4.DiagnosticReport);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(id))v0[1];
  return v4(v3);
}

uint64_t sub_2330853B4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 360) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2330854B4, 0, 0);
}

uint64_t sub_2330854B4()
{
  uint64_t v1 = (void *)v0[45];
  uint64_t v2 = v0[31];
  id v3 = sub_233041068(v0[33], (uint64_t)v1);

  sub_233086348(v2, type metadata accessor for ModelsR4.DocumentReference);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(id))v0[1];
  return v4(v3);
}

uint64_t sub_2330855A8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 384) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2330856A8, 0, 0);
}

uint64_t sub_2330856A8()
{
  uint64_t v1 = (void *)v0[48];
  uint64_t v2 = v0[30];
  id v3 = sub_233041068(v0[33], (uint64_t)v1);

  sub_233086348(v2, type metadata accessor for ModelsR4.Immunization);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(id))v0[1];
  return v4(v3);
}

uint64_t sub_23308579C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 408) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23308589C, 0, 0);
}

uint64_t sub_23308589C()
{
  uint64_t v1 = (void *)v0[51];
  uint64_t v2 = v0[29];
  id v3 = sub_233041068(v0[33], (uint64_t)v1);

  sub_233086348(v2, type metadata accessor for ModelsR4.Observation);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(id))v0[1];
  return v4(v3);
}

uint64_t sub_233085990(uint64_t a1)
{
  *(void *)(*(void *)v1 + 456) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_233085A90, 0, 0);
}

uint64_t sub_233085A90()
{
  uint64_t v1 = (void *)v0[57];
  id v2 = sub_233041068(v0[33], (uint64_t)v1);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(id))v0[1];
  return v3(v2);
}

id sub_233085B80(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v31 = a5;
  uint64_t v29 = a3;
  uint64_t v30 = a4;
  uint64_t v27 = a1;
  long long v28 = a2;
  uint64_t v7 = type metadata accessor for ModelsR4.Observation(0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ModelsR4.Immunization(0);
  MEMORY[0x270FA5388](v10 - 8);
  long long v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for ModelsR4.DocumentReference(0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for ModelsR4.DiagnosticReport(0);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for ModelsR4.Condition(0);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for ModelsR4.ResourceProxy(0);
  MEMORY[0x270FA5388](v22);
  long long v24 = (char *)&v27 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2330863A8(v6, (uint64_t)v24, type metadata accessor for ModelsR4.ResourceProxy);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
      sub_2330862E0((uint64_t)v24, (uint64_t)v21, type metadata accessor for ModelsR4.Condition);
      id v25 = sub_23300549C(v27, v28, v29, v30, v31);
      sub_233086348((uint64_t)v21, type metadata accessor for ModelsR4.Condition);
      break;
    case 3u:
      sub_2330862E0((uint64_t)v24, (uint64_t)v18, type metadata accessor for ModelsR4.DiagnosticReport);
      id v25 = sub_23300549C(v27, v28, v29, v30, v31);
      sub_233086348((uint64_t)v18, type metadata accessor for ModelsR4.DiagnosticReport);
      break;
    case 4u:
      sub_2330862E0((uint64_t)v24, (uint64_t)v15, type metadata accessor for ModelsR4.DocumentReference);
      id v25 = sub_23300549C(v27, v28, v29, v30, v31);
      sub_233086348((uint64_t)v15, type metadata accessor for ModelsR4.DocumentReference);
      break;
    case 5u:
      sub_2330862E0((uint64_t)v24, (uint64_t)v12, type metadata accessor for ModelsR4.Immunization);
      id v25 = sub_23300549C(v27, v28, v29, v30, v31);
      sub_233086348((uint64_t)v12, type metadata accessor for ModelsR4.Immunization);
      break;
    case 6u:
      sub_2330862E0((uint64_t)v24, (uint64_t)v9, type metadata accessor for ModelsR4.Observation);
      id v25 = sub_23300549C(v27, v28, v29, v30, v31);
      sub_233086348((uint64_t)v9, type metadata accessor for ModelsR4.Observation);
      break;
    default:
      sub_233086348((uint64_t)v24, type metadata accessor for ModelsR4.ResourceProxy);
      id v25 = 0;
      break;
  }
  return v25;
}

uint64_t sub_233085FFC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for ModelsR4.DocumentReference(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ModelsR4.DiagnosticReport(0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ModelsR4.ResourceProxy(0);
  MEMORY[0x270FA5388](v10);
  long long v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2330863A8(v2, (uint64_t)v12, type metadata accessor for ModelsR4.ResourceProxy);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    sub_2330862E0((uint64_t)v12, (uint64_t)v6, type metadata accessor for ModelsR4.DocumentReference);
    uint64_t v14 = sub_233071078(a1);
    uint64_t v15 = type metadata accessor for ModelsR4.DocumentReference;
    uint64_t v16 = (uint64_t)v6;
  }
  else if (EnumCaseMultiPayload == 3)
  {
    sub_2330862E0((uint64_t)v12, (uint64_t)v9, type metadata accessor for ModelsR4.DiagnosticReport);
    uint64_t v14 = sub_232F61C68(a1);
    uint64_t v15 = type metadata accessor for ModelsR4.DiagnosticReport;
    uint64_t v16 = (uint64_t)v9;
  }
  else
  {
    type metadata accessor for DownloadableAttachmentExtractionResult();
    memset(v18, 0, sizeof(v18));
    uint64_t v19 = 0;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = 0;
    sub_2330862E0((uint64_t)v18, v14 + 24, (uint64_t (*)(void))sub_232F61E60);
    uint64_t v15 = type metadata accessor for ModelsR4.ResourceProxy;
    uint64_t v16 = (uint64_t)v12;
  }
  sub_233086348(v16, v15);
  return v14;
}

uint64_t sub_233086244(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_233080000;
  return sub_23308230C(a1);
}

uint64_t sub_2330862E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_233086348(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2330863A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_233086410()
{
  id v1 = objc_msgSend(v0, sel_primaryConcept);
  id v2 = objc_msgSend(v1, sel_localizedPreferredName);

  if (v2)
  {
    uint64_t v3 = sub_23309B710();
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
  uint64_t v7 = sub_23308652C();
  uint64_t v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v9 = v7 & 0xFFFFFFFFFFFFLL;
  }
  if (v9) {
    return v7;
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_233086744();
  uint64_t v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0) {
    uint64_t v11 = v7 & 0xFFFFFFFFFFFFLL;
  }
  if (v11) {
    return v7;
  }
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v0, sel_fallbackDisplayString);
  uint64_t v14 = sub_23309B710();

  return v14;
}

uint64_t sub_23308652C()
{
  id v1 = objc_msgSend(v0, sel_medicalRecordCodings);
  sub_232F3A800(0, (unint64_t *)&qword_268757138);
  unint64_t v2 = sub_23309B9A0();

  if (v2 >> 62)
  {
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_23309BF80();
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
          id v5 = (id)MEMORY[0x237DB5EA0](v4 - 4, v2);
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
          sub_232F3A800(0, &qword_268757C68);
          id v10 = v8;
          char v11 = sub_23309BBF0();

          if (v11)
          {
            swift_bridgeObjectRelease_n();
            id v12 = objc_msgSend(v6, sel_displayString);

            if (!v12) {
              return 0;
            }
            uint64_t v13 = sub_23309B710();

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

uint64_t sub_233086744()
{
  id v1 = objc_msgSend(v0, sel_medicalRecordCodings);
  sub_232F3A800(0, (unint64_t *)&qword_268757138);
  unint64_t v2 = sub_23309B9A0();

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
  uint64_t v3 = sub_23309BF80();
  if (!v3) {
    goto LABEL_17;
  }
LABEL_3:
  uint64_t v4 = 4;
  while (1)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)MEMORY[0x237DB5EA0](v4 - 4, v2);
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
      uint64_t v10 = sub_23309B710();
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
  uint64_t v15 = sub_23309B710();

  return v15;
}

uint64_t sub_233086900(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  sub_233092890(0, &qword_268757D68, MEMORY[0x263F07508], MEMORY[0x263F8D8F0]);
  v2[4] = swift_task_alloc();
  uint64_t v3 = sub_23309B1F0();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_233086A2C, 0, 0);
}

uint64_t sub_233086A2C()
{
  uint64_t v1 = (void *)v0[2];
  id v2 = objc_msgSend(v1, sel_medicalRecord);
  v0[9] = v2;
  id v3 = objc_msgSend(v1, sel_attachmentIdentifiers);
  uint64_t v4 = sub_23309B9A0();
  v0[10] = v4;

  uint64_t v5 = (void *)swift_task_alloc();
  v0[11] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_233086B24;
  return sub_233088D44((uint64_t)v2, v4);
}

uint64_t sub_233086B24(uint64_t a1)
{
  id v3 = (void *)*v2;
  v3[12] = a1;
  v3[13] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_233087568;
  }
  else
  {
    uint64_t v5 = (void *)v3[9];
    swift_bridgeObjectRelease();

    uint64_t v4 = sub_233086C44;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_233086C44()
{
  unint64_t v1 = v0[12];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_23309BF80();
    swift_bridgeObjectRelease();
    unint64_t v2 = v0[12];
    if (v6)
    {
LABEL_3:
      uint64_t v3 = swift_allocObject();
      v0[14] = v3;
      swift_weakInit();
      uint64_t v4 = swift_task_alloc();
      v0[15] = v4;
      *(void *)(v4 + 16) = v3;
      *(void *)(v4 + 24) = v2;
      uint64_t v5 = (void *)swift_task_alloc();
      v0[16] = v5;
      *uint64_t v5 = v0;
      v5[1] = sub_23308709C;
      return MEMORY[0x270FA2360]();
    }
  }
  else
  {
    unint64_t v2 = v0[12];
    if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
  }
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_23309BF80();
    if (!v7) {
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v7) {
      goto LABEL_23;
    }
  }
  if (v7 < 1)
  {
    __break(1u);
    return MEMORY[0x270FA2360]();
  }
  uint64_t v8 = 0;
  uint64_t v9 = v0[12];
  uint64_t v30 = v9 + 32;
  uint64_t v31 = v0[6];
  unint64_t v32 = v9 & 0xC000000000000001;
  uint64_t v10 = (void (**)(unint64_t, unint64_t, uint64_t))(v31 + 32);
  unint64_t v11 = MEMORY[0x263F8EE78];
  uint64_t v33 = v7;
  do
  {
    if (v32) {
      id v12 = (id)MEMORY[0x237DB5EA0](v8, v0[12]);
    }
    else {
      id v12 = *(id *)(v30 + 8 * v8);
    }
    uint64_t v13 = v12;
    uint64_t v15 = v0[4];
    uint64_t v14 = v0[5];
    id v16 = objc_msgSend(v12, sel_uniqueIdentifier, v30);
    sub_23309B710();

    sub_23309B1A0();
    swift_bridgeObjectRelease();

    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v15, 1, v14) == 1)
    {
      sub_2330930F0(v0[4], &qword_268757D68, MEMORY[0x263F07508]);
    }
    else
    {
      unint64_t v18 = v0[7];
      unint64_t v17 = v0[8];
      uint64_t v19 = v0[5];
      uint64_t v20 = *v10;
      (*v10)(v17, v0[4], v19);
      v20(v18, v17, v19);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v11 = sub_232F3D638(0, *(void *)(v11 + 16) + 1, 1, v11);
      }
      unint64_t v22 = *(void *)(v11 + 16);
      unint64_t v21 = *(void *)(v11 + 24);
      if (v22 >= v21 >> 1) {
        unint64_t v11 = sub_232F3D638(v21 > 1, v22 + 1, 1, v11);
      }
      unint64_t v23 = v0[7];
      uint64_t v24 = v0[5];
      *(void *)(v11 + 16) = v22 + 1;
      v20(v11+ ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(void *)(v31 + 72) * v22, v23, v24);
    }
    ++v8;
  }
  while (v33 != v8);
LABEL_23:
  swift_bridgeObjectRelease_n();
  id v25 = objc_allocWithZone(MEMORY[0x263F45C80]);
  long long v26 = (void *)sub_23309B990();
  swift_bridgeObjectRelease();
  id v27 = objc_msgSend(v25, sel_initWithAttachmentIdentifiers_, v26);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v28 = (uint64_t (*)(id))v0[1];
  return v28(v27);
}

uint64_t sub_23308709C()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    unint64_t v2 = sub_2330874CC;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    unint64_t v2 = sub_2330871C0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2330871C0()
{
  unint64_t v1 = v0[12];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_23309BF80();
    uint64_t v2 = result;
    if (!result) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v2) {
      goto LABEL_17;
    }
  }
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v4 = 0;
  uint64_t v5 = v0[12];
  uint64_t v25 = v5 + 32;
  uint64_t v26 = v0[6];
  unint64_t v27 = v5 & 0xC000000000000001;
  uint64_t v6 = (void (**)(unint64_t, unint64_t, uint64_t))(v26 + 32);
  unint64_t v7 = MEMORY[0x263F8EE78];
  uint64_t v28 = v2;
  do
  {
    if (v27) {
      id v8 = (id)MEMORY[0x237DB5EA0](v4, v0[12]);
    }
    else {
      id v8 = *(id *)(v25 + 8 * v4);
    }
    uint64_t v9 = v8;
    uint64_t v11 = v0[4];
    uint64_t v10 = v0[5];
    id v12 = objc_msgSend(v8, sel_uniqueIdentifier, v25);
    sub_23309B710();

    sub_23309B1A0();
    swift_bridgeObjectRelease();

    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v11, 1, v10) == 1)
    {
      sub_2330930F0(v0[4], &qword_268757D68, MEMORY[0x263F07508]);
    }
    else
    {
      unint64_t v14 = v0[7];
      unint64_t v13 = v0[8];
      uint64_t v15 = v0[5];
      id v16 = *v6;
      (*v6)(v13, v0[4], v15);
      v16(v14, v13, v15);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v7 = sub_232F3D638(0, *(void *)(v7 + 16) + 1, 1, v7);
      }
      unint64_t v18 = *(void *)(v7 + 16);
      unint64_t v17 = *(void *)(v7 + 24);
      if (v18 >= v17 >> 1) {
        unint64_t v7 = sub_232F3D638(v17 > 1, v18 + 1, 1, v7);
      }
      unint64_t v19 = v0[7];
      uint64_t v20 = v0[5];
      *(void *)(v7 + 16) = v18 + 1;
      v16(v7+ ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))+ *(void *)(v26 + 72) * v18, v19, v20);
    }
    ++v4;
  }
  while (v28 != v4);
LABEL_17:
  swift_bridgeObjectRelease_n();
  id v21 = objc_allocWithZone(MEMORY[0x263F45C80]);
  unint64_t v22 = (void *)sub_23309B990();
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(v21, sel_initWithAttachmentIdentifiers_, v22);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v24 = (uint64_t (*)(id))v0[1];
  return v24(v23);
}

uint64_t sub_2330874CC()
{
  swift_release();
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_233087568()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2330875FC(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  uint64_t v4 = sub_23309B1F0();
  v3[6] = v4;
  v3[7] = *(void *)(v4 - 8);
  v3[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2330876C0, 0, 0);
}

uint64_t sub_2330876C0()
{
  uint64_t v1 = v0[5];
  v0[2] = sub_233090F94();
  sub_233092CD4(0, (unint64_t *)&qword_268756B00, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
  sub_232F65EE4();
  uint64_t v2 = sub_23309B6C0();
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  v0[9] = v2;
  v0[10] = v4;
  uint64_t v5 = *(void *)(v1 + 64);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[11] = v6;
  void *v6 = v0;
  v6[1] = sub_2330877E4;
  return sub_23308ACE8(v2, v4, v5);
}

uint64_t sub_2330877E4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 96) = a1;
  *(void *)(v3 + 104) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_233087E08;
  }
  else {
    uint64_t v4 = sub_2330878F8;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_2330878F8()
{
  uint64_t v1 = sub_2330924B8(v0[12]);
  v0[14] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[15] = (unint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_23308799C;
  return sub_23308B1CC(v1);
}

uint64_t sub_23308799C(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 128) = a1;
  *(void *)(v3 + 136) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_233087E78;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_233087AB8;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_233087AB8()
{
  unint64_t v32 = v0;
  unint64_t v1 = v0[16];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_23309BF80();
    swift_bridgeObjectRelease();
    if (v2)
    {
LABEL_3:
      uint64_t v31 = MEMORY[0x263F8EE78];
      uint64_t result = sub_232F39A1C(0, v2 & ~(v2 >> 63), 0);
      if (v2 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v4 = 0;
      uint64_t v27 = v0[16] + 32;
      uint64_t v28 = (void (**)(uint64_t, uint64_t))(v0[7] + 8);
      unint64_t v29 = v1 & 0xC000000000000001;
      uint64_t v30 = v2;
      do
      {
        if (v29) {
          id v5 = (id)MEMORY[0x237DB5EA0](v4, v0[16]);
        }
        else {
          id v5 = *(id *)(v27 + 8 * v4);
        }
        id v6 = v5;
        uint64_t v7 = v0[8];
        uint64_t v8 = v0[6];
        id v9 = objc_msgSend(v5, sel_UUID);
        sub_23309B1D0();

        uint64_t v10 = sub_23309B1B0();
        uint64_t v12 = v11;
        (*v28)(v7, v8);
        uint64_t v13 = v31;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_232F39A1C(0, *(void *)(v31 + 16) + 1, 1);
          uint64_t v13 = v31;
        }
        unint64_t v15 = *(void *)(v13 + 16);
        unint64_t v14 = *(void *)(v13 + 24);
        if (v15 >= v14 >> 1)
        {
          sub_232F39A1C(v14 > 1, v15 + 1, 1);
          uint64_t v13 = v31;
        }
        ++v4;
        *(void *)(v13 + 16) = v15 + 1;
        id v16 = (void *)(v13 + 24 * v15);
        v16[4] = v10;
        v16[5] = v12;
        v16[6] = v6;
      }
      while (v30 != v4);
      swift_bridgeObjectRelease();
      if (*(void *)(v13 + 16)) {
        goto LABEL_14;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v2) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  if (*(void *)(MEMORY[0x263F8EE78] + 16))
  {
LABEL_14:
    sub_232F5DCCC();
    uint64_t v17 = sub_23309BFB0();
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v17 = MEMORY[0x263F8EE80];
LABEL_18:
  uint64_t v18 = v0[17];
  uint64_t v31 = v17;
  unint64_t v19 = (void *)swift_bridgeObjectRetain();
  sub_233090634(v19, 1, &v31);
  if (v18)
  {
    return swift_unexpectedError();
  }
  else
  {
    unint64_t v20 = v0[12];
    uint64_t v22 = v0[9];
    uint64_t v21 = v0[10];
    uint64_t v23 = v0[5];
    swift_bridgeObjectRelease();
    uint64_t v24 = v31;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_2330918AC(v20, v24, v23, v22, v21);
    swift_bridgeObjectRelease_n();
    swift_release();
    swift_release_n();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v26 = (uint64_t (*)(uint64_t))v0[1];
    return v26(v25);
  }
}

uint64_t sub_233087E08()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_233087E78()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_233087EFC(void *a1)
{
  sub_2330936E4(0, &qword_268758E00, MEMORY[0x263F8E0C0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = &v9[-v6];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23309362C();
  sub_23309C480();
  v9[15] = 0;
  sub_23309C1C0();
  if (!v1)
  {
    type metadata accessor for IndexedAnchor(0);
    v9[14] = 1;
    sub_23309B190();
    sub_233092954(&qword_268758E08, MEMORY[0x263F07490]);
    sub_23309C1B0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_2330880C8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v19 = sub_23309B190();
  uint64_t v16 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2330936E4(0, &qword_268758DE8, MEMORY[0x263F8E040]);
  uint64_t v20 = v6;
  uint64_t v18 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v15 - v7;
  uint64_t v9 = type metadata accessor for IndexedAnchor(0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (uint64_t *)((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23309362C();
  sub_23309C460();
  if (!v2)
  {
    uint64_t v15 = v9;
    uint64_t v13 = v18;
    uint64_t v12 = v19;
    char v22 = 0;
    *uint64_t v11 = sub_23309C0F0();
    char v21 = 1;
    sub_233092954(&qword_268758DF8, MEMORY[0x263F07490]);
    sub_23309C0E0();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v20);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))((char *)v11 + *(int *)(v15 + 20), v5, v12);
    sub_233093680((uint64_t)v11, v17);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2330883B4()
{
  if (*v0) {
    return 0x61647055656D6974;
  }
  else {
    return 0x6F52726F68636E61;
  }
}

uint64_t sub_233088400@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_233093954(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_233088428(uint64_t a1)
{
  unint64_t v2 = sub_23309362C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_233088464(uint64_t a1)
{
  unint64_t v2 = sub_23309362C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2330884A0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2330880C8(a1, a2);
}

uint64_t sub_2330884B8(void *a1)
{
  return sub_233087EFC(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for IndexerError(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = sub_23309B1F0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  return a1;
}

uint64_t destroy for IndexerError(uint64_t a1)
{
  uint64_t v2 = sub_23309B1F0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for IndexerError(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23309B1F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for IndexerError(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23309B1F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for IndexerError(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23309B1F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for IndexerError(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23309B1F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for IndexerError(uint64_t a1, uint64_t a2)
{
  sub_2330887E0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

void sub_2330887E0()
{
  if (!qword_268758CC0)
  {
    unint64_t v0 = sub_23309B1F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268758CC0);
    }
  }
}

uint64_t storeEnumTagSinglePayload for IndexerError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2330887E0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, a2, a3, v6);
}

uint64_t type metadata accessor for IndexerError(uint64_t a1)
{
  return sub_232EA4800(a1, (uint64_t *)&unk_268758CC8);
}

uint64_t sub_2330888CC(uint64_t a1)
{
  uint64_t result = sub_23309B1F0();
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8);
    swift_initEnumMetadataSingleCase();
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t sub_233088970()
{
  sub_233092890(0, &qword_268758D60, MEMORY[0x263F8F3A0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v7 - v1;
  uint64_t v3 = sub_23309B480();
  __swift_allocate_value_buffer(v3, qword_268770FB8);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_268770FB8);
  sub_23309B490();
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v3);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v4, v2, v3);
  }
  __break(1u);
  return result;
}

uint64_t sub_233088AC8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HealthRecordSpotlightSearchResult()
{
  return self;
}

void sub_233088B44()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A410]), sel_init);
  type metadata accessor for HealthRecordAttachmentsIndexer();
  swift_allocObject();
  uint64_t v1 = sub_233091C58(v0);

  qword_268770FD0 = (uint64_t)v1;
}

uint64_t sub_233088BA8()
{
  uint64_t v1 = *(void *)(v0 + 48);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  sub_23308EF84((void **)(v1 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));

  uint64_t v2 = *(void **)(v0 + 40);
  swift_release();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_233088C40()
{
  sub_233088BA8();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HealthRecordAttachmentsIndexer()
{
  return self;
}

void **initializeBufferWithCopyOfBuffer for HealthRecordAttachmentsIndexer.State(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void **assignWithCopy for HealthRecordAttachmentsIndexer.State(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  *a1 = *a2;
  id v5 = v4;

  return a1;
}

void **assignWithTake for HealthRecordAttachmentsIndexer.State(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;

  return a1;
}

ValueMetadata *type metadata accessor for HealthRecordAttachmentsIndexer.State()
{
  return &type metadata for HealthRecordAttachmentsIndexer.State;
}

uint64_t sub_233088D44(uint64_t a1, uint64_t a2)
{
  v3[22] = a2;
  v3[23] = v2;
  v3[21] = a1;
  v3[24] = *v2;
  uint64_t v4 = sub_23309B480();
  v3[25] = v4;
  v3[26] = *(void *)(v4 - 8);
  v3[27] = swift_task_alloc();
  v3[28] = swift_task_alloc();
  sub_233092890(0, &qword_268757D68, MEMORY[0x263F07508], MEMORY[0x263F8D8F0]);
  v3[29] = swift_task_alloc();
  uint64_t v5 = sub_23309B1F0();
  v3[30] = v5;
  v3[31] = *(void *)(v5 - 8);
  v3[32] = swift_task_alloc();
  v3[33] = swift_task_alloc();
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_233088F20, 0, 0);
}

uint64_t sub_233088F20()
{
  uint64_t v35 = v0;
  v0[16] = MEMORY[0x263F8EE78];
  if (qword_2687563A0 != -1) {
    swift_once();
  }
  uint64_t v2 = (id *)(v0 + 21);
  uint64_t v1 = (void *)v0[21];
  uint64_t v3 = sub_23309B4B0();
  __swift_project_value_buffer(v3, (uint64_t)qword_268770F68);
  id v4 = v1;
  uint64_t v5 = sub_23309B4A0();
  os_log_type_t v6 = sub_23309BB60();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t type = v6;
    uint64_t v7 = v0[35];
    log = v5;
    uint64_t v8 = v0[31];
    uint64_t v30 = v0[30];
    uint64_t v9 = (void *)v0[21];
    uint64_t v10 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v34 = v31;
    *(_DWORD *)uint64_t v10 = 136315906;
    uint64_t v11 = sub_23309C4D0();
    v0[17] = sub_232F62B64(v11, v12, &v34);
    sub_23309BD10();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    id v13 = objc_msgSend(v9, sel_UUID);
    sub_23309B1D0();

    uint64_t v14 = sub_23309B1B0();
    unint64_t v16 = v15;
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v30);
    v0[18] = sub_232F62B64(v14, v16, &v34);
    sub_23309BD10();
    swift_bridgeObjectRelease();

    *(_WORD *)(v10 + 22) = 2080;
    id v17 = objc_msgSend(v9, sel_attachmentObjectIdentifier);
    uint64_t v18 = sub_23309B710();
    unint64_t v20 = v19;

    v0[19] = sub_232F62B64(v18, v20, &v34);
    sub_23309BD10();
    swift_bridgeObjectRelease();

    *(_WORD *)(v10 + 32) = 2080;
    id v21 = objc_msgSend(v9, sel_attachmentSchemaIdentifier);
    uint64_t v22 = sub_23309B710();
    unint64_t v24 = v23;

    v0[20] = sub_232F62B64(v22, v24, &v34);
    sub_23309BD10();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_232E63000, log, type, "[%s] Get attachments for : %s and %s and %s", (uint8_t *)v10, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x237DB6EC0](v31, -1, -1);
    MEMORY[0x237DB6EC0](v10, -1, -1);
  }
  else
  {
    id v25 = *v2;
  }
  uint64_t v26 = v0[21];
  uint64_t v27 = *(void **)(v0[23] + 32);
  v0[36] = v27;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_233089374;
  uint64_t v28 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_23308EFD8;
  v0[13] = &block_descriptor_33;
  v0[14] = v28;
  objc_msgSend(v27, sel_getAttachmentsForObject_completion_, v26, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_233089374()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 296) = v1;
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_23308A438;
  }
  else
  {
    uint64_t v2 = sub_23308948C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_23308948C()
{
  unint64_t v1 = v0[15];
  v0[38] = v1;
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v0[39] = v2;
    if (v2) {
      goto LABEL_3;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    uint64_t v24 = v0[16];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v25 = (void (*)(uint64_t))v0[1];
    v25(v24);
    return;
  }
LABEL_27:
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_23309BF80();
  swift_bridgeObjectRelease();
  v0[39] = v29;
  if (!v29) {
    goto LABEL_19;
  }
LABEL_3:
  unint64_t v3 = 0;
  v0[40] = *MEMORY[0x263F08080];
  while (1)
  {
    uint64_t v4 = v0[38];
    if ((v4 & 0xC000000000000001) != 0)
    {
      id v5 = (id)MEMORY[0x237DB5EA0](v3);
    }
    else
    {
      if (v3 >= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return;
      }
      id v5 = *(id *)(v4 + 8 * v3 + 32);
    }
    v0[41] = v5;
    v0[42] = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    uint64_t v6 = v0[22];
    if (!v6) {
      break;
    }
    uint64_t v30 = v5;
    id v7 = objc_msgSend(v5, sel_identifier);
    sub_23309B1D0();

    uint64_t v8 = *(void *)(v6 + 16);
    uint64_t v9 = v0[31];
    if (v8)
    {
      unint64_t v10 = v0[22] + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
      swift_bridgeObjectRetain();
      uint64_t v31 = *(void *)(v9 + 72);
      uint64_t v11 = *(void (**)(uint64_t, unint64_t, uint64_t))(v9 + 16);
      while (1)
      {
        uint64_t v12 = v0[30];
        uint64_t v13 = v0[31];
        uint64_t v14 = v0[29];
        v11(v14, v10, v12);
        unint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56);
        v15(v14, 0, 1, v12);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v14, 1, v12) == 1) {
          break;
        }
        uint64_t v16 = v0[33];
        uint64_t v17 = v0[30];
        uint64_t v18 = v0[31];
        (*(void (**)(uint64_t, void, uint64_t))(v18 + 32))(v16, v0[29], v17);
        sub_233092954(&qword_2687586F8, MEMORY[0x263F07508]);
        char v19 = sub_23309B6D0();
        unint64_t v20 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
        v20(v16, v17);
        if (v19)
        {
          uint64_t v26 = v0[34];
          uint64_t v27 = v0[30];
          swift_bridgeObjectRelease();
          v20(v26, v27);
          goto LABEL_23;
        }
        v10 += v31;
        if (!--v8) {
          goto LABEL_17;
        }
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      unint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
LABEL_17:
      v15(v0[29], 1, 1, v0[30]);
    }
    uint64_t v21 = v0[34];
    uint64_t v23 = v0[30];
    uint64_t v22 = v0[31];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);

    unint64_t v3 = v0[42];
    if (v3 == v0[39]) {
      goto LABEL_19;
    }
  }
LABEL_23:
  v0[43] = sub_23309BBE0();
  unint64_t v32 = (void (*)(void))((int)*MEMORY[0x263F09000] + MEMORY[0x263F09000]);
  uint64_t v28 = (void *)swift_task_alloc();
  v0[44] = v28;
  *uint64_t v28 = v0;
  v28[1] = sub_2330898B4;
  v32();
}

uint64_t sub_2330898B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[45] = a1;
  v4[46] = a2;
  v4[47] = v2;
  swift_task_dealloc();
  swift_release();
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v5 = sub_23308A4F8;
  }
  else
  {
    id v5 = sub_2330899F0;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

void sub_2330899F0()
{
  unint64_t v2 = *(void *)(v0 + 368);
  uint64_t v1 = *(void *)(v0 + 376);
  uint64_t v3 = *(void *)(v0 + 360);
  uint64_t v4 = *(void *)(v0 + 224);
  id v5 = objc_msgSend(*(id *)(v0 + 328), sel_contentType);
  sub_23309B400();

  id v6 = sub_23308F0C0(v3, v2, v4);
  if (v1)
  {
    uint64_t v9 = *(void *)(v0 + 360);
    unint64_t v8 = *(void *)(v0 + 368);
    uint64_t v10 = *(void *)(v0 + 224);
    uint64_t v11 = *(void *)(v0 + 200);
    uint64_t v12 = *(void *)(v0 + 208);

    sub_232E9AA4C(v9, v8);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_14:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v38 = *(void (**)(void))(v0 + 8);
    v38();
    return;
  }
  unint64_t v13 = (unint64_t)v6;
  unint64_t v14 = v7;
  unint64_t v15 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 208) + 8);
  v15(*(void *)(v0 + 224), *(void *)(v0 + 200));
  if (!v14)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v30 = *(void *)(v0 + 360);
    unint64_t v29 = *(void *)(v0 + 368);
    uint64_t v31 = *(void **)(v0 + 328);
    uint64_t v32 = *(void *)(v0 + 280);
    uint64_t v33 = *(void *)(v0 + 240);
    uint64_t v34 = *(void *)(v0 + 248);
    swift_bridgeObjectRelease();
    type metadata accessor for IndexerError(0);
    sub_233092954(&qword_268758D30, (void (*)(uint64_t))type metadata accessor for IndexerError);
    swift_allocError();
    uint64_t v36 = v35;
    id v37 = objc_msgSend(v31, sel_identifier);
    sub_23309B1D0();

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32))(v36, v32, v33);
    swift_willThrow();

    sub_232E9AA4C(v30, v29);
    goto LABEL_14;
  }
  uint64_t v16 = HIBYTE(v14) & 0xF;
  if ((v14 & 0x2000000000000000) == 0) {
    uint64_t v16 = v13 & 0xFFFFFFFFFFFFLL;
  }
  if (!v16)
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  uint64_t v17 = *(void **)(v0 + 328);
  uint64_t v18 = *(void *)(v0 + 216);
  uint64_t v19 = *(void *)(v0 + 200);
  sub_23309B450();
  sub_23309B3F0();
  v15(v18, v19);
  id v20 = objc_allocWithZone(MEMORY[0x263F02AE8]);
  uint64_t v21 = (void *)sub_23309B6E0();
  swift_bridgeObjectRelease();
  id v22 = objc_msgSend(v20, sel_initWithItemContentType_, v21);

  id v23 = objc_msgSend(v17, sel_name);
  uint64_t v24 = sub_23309B710();
  unint64_t v26 = v25;

  swift_bridgeObjectRelease();
  uint64_t v27 = HIBYTE(v26) & 0xF;
  if ((v26 & 0x2000000000000000) == 0) {
    uint64_t v27 = v24 & 0xFFFFFFFFFFFFLL;
  }
  if (v27)
  {
    id v28 = objc_msgSend(*(id *)(v0 + 328), sel_name);
    sub_23309B710();
  }
  else
  {
    sub_233086410();
  }
  uint64_t v89 = *(void *)(v0 + 320);
  id v90 = *(id *)(v0 + 328);
  uint64_t v39 = *(void *)(v0 + 280);
  uint64_t v40 = *(void *)(v0 + 248);
  uint64_t v91 = *(void *)(v0 + 256);
  uint64_t v41 = *(void *)(v0 + 240);
  uint64_t v42 = *(void **)(v0 + 168);
  uint64_t v43 = (void *)sub_23309B6E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_setTitle_, v43);

  uint64_t v44 = (void *)sub_23309B6E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_setDisplayName_, v44);

  id v45 = objc_msgSend(v42, sel_UUID);
  sub_23309B1D0();

  sub_23309B1B0();
  uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
  v46(v39, v41);
  uint64_t v47 = (void *)sub_23309B6E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_setRelatedUniqueIdentifier_, v47);

  id v48 = objc_msgSend(v42, (SEL)&selRef_stringByAppendingFormat_);
  sub_23309B1D0();

  sub_23309B1B0();
  v46(v39, v41);
  uint64_t v49 = (void *)sub_23309B6E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_setDomainIdentifier_, v49);

  uint64_t v50 = (void *)sub_23309B6E0();
  objc_msgSend(v22, sel_setBundleID_, v50);

  objc_msgSend(v22, sel_setProtectionClass_, v89);
  id v51 = objc_msgSend(v90, sel_identifier);
  sub_23309B1D0();

  sub_23309B1B0();
  v46(v39, v41);
  id v52 = objc_msgSend(v42, sel_UUID);
  sub_23309B1D0();

  sub_23309B1B0();
  v46(v91, v41);
  id v53 = objc_allocWithZone(MEMORY[0x263F02AE0]);
  id v54 = v22;
  uint64_t v55 = (void *)sub_23309B6E0();
  swift_bridgeObjectRelease();
  unint64_t v56 = (void *)sub_23309B6E0();
  swift_bridgeObjectRelease();
  id v57 = objc_msgSend(v53, sel_initWithUniqueIdentifier_domainIdentifier_attributeSet_, v55, v56, v54);

  id v58 = v57;
  MEMORY[0x237DB59C0]();
  if (*(void *)((*(void *)(v0 + 128) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v0 + 128) & 0xFFFFFFFFFFFFFF8)
                                                                                      + 0x18) >> 1)
LABEL_44:
    sub_23309B9D0();
  uint64_t v60 = *(void *)(v0 + 360);
  unint64_t v59 = *(void *)(v0 + 368);
  unint64_t v61 = *(void **)(v0 + 328);
  sub_23309B9E0();
  sub_23309B9C0();

  sub_232E9AA4C(v60, v59);
  while (1)
  {
    unint64_t v62 = *(void *)(v0 + 336);
    if (v62 == *(void *)(v0 + 312)) {
      break;
    }
    uint64_t v63 = *(void *)(v0 + 304);
    if ((v63 & 0xC000000000000001) != 0)
    {
      id v64 = (id)MEMORY[0x237DB5EA0](*(void *)(v0 + 336));
    }
    else
    {
      if (v62 >= *(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return;
      }
      id v64 = *(id *)(v63 + 8 * v62 + 32);
    }
    *(void *)(v0 + 328) = v64;
    *(void *)(v0 + 336) = v62 + 1;
    if (__OFADD__(v62, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    uint64_t v65 = *(void *)(v0 + 176);
    if (!v65)
    {
LABEL_40:
      *(void *)(v0 + 344) = sub_23309BBE0();
      uint64_t v94 = (void (*)(void))((int)*MEMORY[0x263F09000] + MEMORY[0x263F09000]);
      uint64_t v88 = (void *)swift_task_alloc();
      *(void *)(v0 + 352) = v88;
      void *v88 = v0;
      v88[1] = sub_2330898B4;
      v94();
      return;
    }
    uint64_t v92 = v64;
    id v66 = objc_msgSend(v64, sel_identifier);
    sub_23309B1D0();

    uint64_t v67 = *(void *)(v65 + 16);
    uint64_t v68 = *(void *)(v0 + 248);
    if (v67)
    {
      unint64_t v69 = *(void *)(v0 + 176)
          + ((*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80));
      swift_bridgeObjectRetain();
      uint64_t v93 = *(void *)(v68 + 72);
      long long v70 = *(void (**)(uint64_t, unint64_t, uint64_t))(v68 + 16);
      while (1)
      {
        uint64_t v71 = *(void *)(v0 + 240);
        uint64_t v72 = *(void *)(v0 + 248);
        uint64_t v73 = *(void *)(v0 + 232);
        v70(v73, v69, v71);
        long long v74 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v72 + 56);
        v74(v73, 0, 1, v71);
        uint64_t v75 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v72 + 48);
        id v58 = (id)(v72 + 48);
        if (v75(v73, 1, v71) == 1) {
          break;
        }
        uint64_t v76 = *(void *)(v0 + 264);
        uint64_t v77 = *(void *)(v0 + 240);
        uint64_t v78 = *(void *)(v0 + 248);
        (*(void (**)(uint64_t, void, uint64_t))(v78 + 32))(v76, *(void *)(v0 + 232), v77);
        sub_233092954(&qword_2687586F8, MEMORY[0x263F07508]);
        char v79 = sub_23309B6D0();
        id v58 = *(id *)(v78 + 8);
        ((void (*)(uint64_t, uint64_t))v58)(v76, v77);
        if (v79)
        {
          uint64_t v86 = *(void *)(v0 + 272);
          uint64_t v87 = *(void *)(v0 + 240);
          swift_bridgeObjectRelease();
          ((void (*)(uint64_t, uint64_t))v58)(v86, v87);
          goto LABEL_40;
        }
        v69 += v93;
        if (!--v67) {
          goto LABEL_34;
        }
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      long long v74 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v68 + 56);
LABEL_34:
      v74(*(void *)(v0 + 232), 1, 1, *(void *)(v0 + 240));
    }
    uint64_t v80 = *(void *)(v0 + 272);
    uint64_t v82 = *(void *)(v0 + 240);
    uint64_t v81 = *(void *)(v0 + 248);
    swift_bridgeObjectRelease();
    long long v83 = *(void (**)(uint64_t, uint64_t))(v81 + 8);
    id v54 = (id)(v81 + 8);
    v83(v80, v82);
  }
  swift_bridgeObjectRelease();
  uint64_t v84 = *(void *)(v0 + 128);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v85 = *(void (**)(uint64_t))(v0 + 8);
  v85(v84);
}

uint64_t sub_23308A438()
{
  swift_willThrow();
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

uint64_t sub_23308A4F8()
{
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

uint64_t sub_23308A5B8()
{
  *(void *)(v1 + 184) = v0;
  return MEMORY[0x270FA2498](sub_23308A5D8, 0, 0);
}

uint64_t sub_23308A5D8()
{
  uint64_t v1 = *(void **)(v0[23] + 40);
  v0[2] = v0;
  v0[3] = sub_23308A6D0;
  uint64_t v2 = swift_continuation_init();
  v0[18] = MEMORY[0x263EF8330];
  v0[19] = 0x40000000;
  v0[20] = sub_23308AB98;
  v0[21] = &block_descriptor_50;
  v0[22] = v2;
  objc_msgSend(v1, sel_deleteAllSearchableItemsWithCompletionHandler_, v0 + 18);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_23308A6D0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 192) = v1;
  if (v1) {
    uint64_t v2 = sub_23308AABC;
  }
  else {
    uint64_t v2 = sub_23308A7E0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_23308A7E0()
{
  uint64_t v1 = *(void **)(v0[23] + 24);
  v0[25] = v1;
  uint64_t v2 = sub_23309B6E0();
  v0[26] = v2;
  v0[10] = v0;
  v0[11] = sub_23308A90C;
  uint64_t v3 = swift_continuation_init();
  v0[18] = MEMORY[0x263EF8330];
  v0[19] = 0x40000000;
  v0[20] = sub_23308AC3C;
  v0[21] = &block_descriptor_51;
  v0[22] = v3;
  objc_msgSend(v1, sel_setData_forKey_completion_, 0, v2, v0 + 18);
  return MEMORY[0x270FA23F0](v0 + 10);
}

uint64_t sub_23308A90C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 216) = v1;
  if (v1) {
    uint64_t v2 = sub_23308AB28;
  }
  else {
    uint64_t v2 = sub_23308AA1C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_23308AA1C()
{
  sub_23309BBB0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23308AABC()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23308AB28()
{
  uint64_t v1 = *(void **)(v0 + 208);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_23308AB98(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_232F3FD80(0, (unint64_t *)&qword_268757070);
    uint64_t v4 = swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_23308AC3C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    return swift_continuation_throwingResume();
  }
  else
  {
    if (a3)
    {
      sub_232F3FD80(0, (unint64_t *)&qword_268757070);
      uint64_t v6 = swift_allocError();
      *unint64_t v7 = a3;
      id v8 = a3;
      a1 = v3;
      a2 = v6;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA2410](a1, a2);
  }
}

uint64_t sub_23308ACE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[16] = a3;
  v4[17] = v3;
  v4[14] = a1;
  v4[15] = a2;
  uint64_t v5 = sub_23309AC20();
  v4[18] = v5;
  v4[19] = *(void *)(v5 - 8);
  v4[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23308ADAC, 0, 0);
}

uint64_t sub_23308ADAC()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = *(void **)(v1 + 72);
  if (v2)
  {
    id v3 = v2;
    if ((objc_msgSend(v3, sel_isCancelled) & 1) == 0)
    {
      uint64_t v4 = *(void **)(v1 + 72);
      if (v4)
      {
        id v5 = v4;
        objc_msgSend(v5, sel_cancel);
      }
      id v3 = *(id *)(v1 + 72);
      *(void *)(v1 + 72) = 0;
    }
  }
  uint64_t v7 = v0[19];
  uint64_t v6 = v0[20];
  uint64_t v8 = v0[18];
  uint64_t v9 = v0[15];
  v0[10] = v0[14];
  v0[11] = v9;
  sub_23309ABE0();
  sub_232F379FC();
  uint64_t v10 = sub_23309BD40();
  unint64_t v12 = v11;
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  swift_bridgeObjectRelease();
  uint64_t v13 = HIBYTE(v12) & 0xF;
  if ((v12 & 0x2000000000000000) == 0) {
    uint64_t v13 = v10 & 0xFFFFFFFFFFFFLL;
  }
  if (v13)
  {
    swift_weakInit();
    return MEMORY[0x270FA2498](sub_23308AF38, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    unint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v15 = MEMORY[0x263F8EE78];
    return v14(v15);
  }
}

uint64_t sub_23308AF38()
{
  v0[2] = v0;
  v0[7] = v0 + 13;
  v0[3] = sub_23308AFFC;
  uint64_t v1 = swift_continuation_init();
  sub_233091F78(v1);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_23308AFFC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  uint64_t v3 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 168) = v3;
  if (v3)
  {
    swift_willThrow();
    return MEMORY[0x270FA2498](sub_23308B15C, 0, 0);
  }
  else
  {
    uint64_t v4 = *(void *)(v1 + 104);
    swift_weakDestroy();
    swift_task_dealloc();
    id v5 = *(uint64_t (**)(uint64_t))(v2 + 8);
    return v5(v4);
  }
}

uint64_t sub_23308B15C()
{
  swift_weakDestroy();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23308B1CC(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  sub_23309299C(0, &qword_268758D08, MEMORY[0x263F09010]);
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23308B2A8, 0, 0);
}

uint64_t sub_23308B2A8()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = self;
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_23303BE54(v3);
  swift_bridgeObjectRelease();
  sub_23309B1F0();
  sub_233092954(&qword_2687586F0, MEMORY[0x263F07508]);
  uint64_t v4 = (void *)sub_23309BB10();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_predicateForObjectsWithUUIDs_, v4);
  v0[8] = v5;

  id v6 = v5;
  sub_233090DA4((uint64_t)&unk_26E6A5F18, (uint64_t)v6);

  sub_232F3A800(0, &qword_268757020);
  sub_23309B620();
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[9] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_23308B478;
  uint64_t v9 = v0[5];
  return MEMORY[0x270EF3200](v7, v9);
}

uint64_t sub_23308B478(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 80) = a1;
  *(void *)(v3 + 88) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_23308B7DC;
  }
  else {
    uint64_t v4 = sub_23308B58C;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_23308B58C()
{
  unint64_t v1 = *(void *)(v0 + 80);
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_23309BF80();
    uint64_t v2 = result;
    if (!result) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v2) {
      goto LABEL_19;
    }
  }
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  if ((v1 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      MEMORY[0x237DB5EA0](i, *(void *)(v0 + 80));
      self;
      if (swift_dynamicCastObjCClass())
      {
        MEMORY[0x237DB59C0]();
        if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_23309B9D0();
        }
        sub_23309B9E0();
        sub_23309B9C0();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    id v5 = (void **)(*(void *)(v0 + 80) + 32);
    do
    {
      uint64_t v6 = *v5;
      self;
      if (swift_dynamicCastObjCClass())
      {
        MEMORY[0x237DB59C0](v6);
        if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_23309B9D0();
        }
        sub_23309B9E0();
        sub_23309B9C0();
      }
      ++v5;
      --v2;
    }
    while (v2);
  }
LABEL_19:
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v0 + 56);
  uint64_t v8 = *(void *)(v0 + 40);
  uint64_t v9 = *(void *)(v0 + 48);

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v10(v11);
}

uint64_t sub_23308B7DC()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

void sub_23308B86C(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, void *a5@<X8>)
{
  uint64_t v57 = a3;
  uint64_t v58 = a4;
  sub_233092890(0, &qword_268757D68, MEMORY[0x263F07508], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v53 - v10;
  uint64_t v12 = sub_23309B1F0();
  uint64_t v59 = *(void *)(v12 - 8);
  uint64_t v60 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v53 - v16;
  uint64_t v18 = *a1;
  id v19 = objc_msgSend(v18, sel_attributeSet);
  id v20 = objc_msgSend(v19, sel_title);
  if (v20)
  {
    uint64_t v21 = v20;
    id v54 = v17;
    unint64_t v61 = a5;
    uint64_t v53 = sub_23309B710();
    uint64_t v23 = v22;

    id v24 = objc_msgSend(v19, sel_domainIdentifier);
    if (!v24)
    {
      swift_bridgeObjectRelease();

      id v35 = 0;
      a5 = v61;
      goto LABEL_27;
    }
    unint64_t v25 = v24;
    uint64_t v55 = v23;
    uint64_t v56 = v5;
    uint64_t v26 = sub_23309B710();
    uint64_t v28 = v27;

    if (!*(void *)(a2 + 16) || (unint64_t v29 = sub_232F393E0(v26, v28), (v30 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      goto LABEL_9;
    }
    id v31 = *(id *)(*(void *)(a2 + 56) + 8 * v29);
    swift_bridgeObjectRelease();
    id v32 = objc_msgSend(v18, sel_uniqueIdentifier);
    sub_23309B710();

    sub_23309B1A0();
    swift_bridgeObjectRelease();
    uint64_t v34 = v59;
    uint64_t v33 = v60;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v59 + 48))(v11, 1, v60) == 1)
    {
      swift_bridgeObjectRelease();

      sub_2330930F0((uint64_t)v11, &qword_268757D68, MEMORY[0x263F07508]);
LABEL_9:
      id v35 = 0;
      a5 = v61;
      goto LABEL_27;
    }
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v54, v11, v33);
    id v36 = objc_msgSend(v19, sel_displayName);
    a5 = v61;
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = sub_23309B710();
      uint64_t v40 = v39;
    }
    else
    {
      uint64_t v38 = 0;
      uint64_t v40 = 0;
    }
    uint64_t v41 = sub_233091394(v38, v40);
    uint64_t v43 = v42;
    uint64_t v45 = v44;
    swift_bridgeObjectRelease();
    if (v43) {
      BOOL v46 = v45 == 0;
    }
    else {
      BOOL v46 = 1;
    }
    if (v46) {
      uint64_t v47 = MEMORY[0x263F8EE78];
    }
    else {
      uint64_t v47 = v45;
    }
    if (v46) {
      uint64_t v48 = 0;
    }
    else {
      uint64_t v48 = v41;
    }
    uint64_t v57 = v48;
    uint64_t v58 = v47;
    if (v46) {
      uint64_t v49 = 0;
    }
    else {
      uint64_t v49 = v43;
    }
    sub_232F3A800(0, (unint64_t *)&qword_268758390);
    uint64_t v50 = v59;
    uint64_t v51 = v60;
    id v52 = v54;
    (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v15, v54, v60);
    id v35 = sub_23309176C(v53, v55, (uint64_t)v31, (uint64_t)v15, v57, v49);

    (*(void (**)(char *, uint64_t))(v50 + 8))(v52, v51);
  }
  else
  {

    id v35 = 0;
  }
LABEL_27:
  *a5 = v35;
}

uint64_t sub_23308BCA4()
{
  swift_beginAccess();
  unint64_t v0 = swift_bridgeObjectRetain();
  sub_2330371B4(v0);
  return swift_endAccess();
}

uint64_t sub_23308BCF8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_232F3A800(0, &qword_268758710);
  uint64_t v2 = sub_23309B9A0();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23308BD7C(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    sub_232F3FD80(0, (unint64_t *)&qword_268757070);
    uint64_t v5 = swift_allocError();
    void *v6 = a1;
    id v7 = a1;
    return MEMORY[0x270FA2410](a2, v5);
  }
  else
  {
    swift_beginAccess();
    **(void **)(*(void *)(a2 + 64) + 40) = *(void *)(a3 + 16);
    swift_bridgeObjectRetain();
    return swift_continuation_throwingResume();
  }
}

void sub_23308BE60(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_23308BECC()
{
  v1[2] = v0;
  v1[3] = type metadata accessor for IndexedAnchor(0);
  v1[4] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23308BF60, 0, 0);
}

uint64_t sub_23308BF60()
{
  uint64_t v1 = sub_23309BBC0();
  unint64_t v3 = v2;
  if (v2 >> 60 == 15)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = v1;
    sub_23309AB30();
    swift_allocObject();
    sub_23309AB20();
    sub_233092954(&qword_268758DA8, (void (*)(uint64_t))type metadata accessor for IndexedAnchor);
    sub_23309AB10();
    uint64_t v6 = *(void **)(v0 + 32);
    swift_release();
    id v4 = objc_msgSend(self, sel_anchorFromValue_, *v6);
    sub_232F3F15C(v5, v3);
    sub_233092F84((uint64_t)v6, type metadata accessor for IndexedAnchor);
  }
  swift_task_dealloc();
  id v7 = *(uint64_t (**)(id))(v0 + 8);
  return v7(v4);
}

void sub_23308C160(uint64_t a1, void *a2, void *a3)
{
  sub_233092890(0, &qword_268758370, MEMORY[0x263F8F520], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v29 - v7;
  if (a3)
  {
    id v9 = a3;
    if (qword_2687563A0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_23309B4B0();
    __swift_project_value_buffer(v10, (uint64_t)qword_268770F68);
    id v11 = a3;
    id v12 = a3;
    unint64_t v29 = sub_23309B4A0();
    os_log_type_t v13 = sub_23309BB80();
    if (os_log_type_enabled(v29, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v31 = v15;
      *(_DWORD *)uint64_t v14 = 136315394;
      uint64_t v16 = sub_23309C4D0();
      uint64_t v30 = sub_232F62B64(v16, v17, &v31);
      sub_23309BD10();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      uint64_t v30 = (uint64_t)a3;
      id v18 = a3;
      id v19 = a3;
      sub_232F3FD80(0, (unint64_t *)&qword_268757070);
      sub_23309C320();
      id v20 = (id)HKSensitiveLogItem();
      swift_unknownObjectRelease();
      sub_23309BDB0();
      swift_unknownObjectRelease();
      uint64_t v21 = sub_23309B770();
      unint64_t v23 = v22;

      uint64_t v30 = sub_232F62B64(v21, v23, &v31);
      sub_23309BD10();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_232E63000, v29, v13, "[%s] Failed to update or insert searchable items: %s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x237DB6EC0](v15, -1, -1);
      MEMORY[0x237DB6EC0](v14, -1, -1);
    }
    else
    {

      uint64_t v28 = v29;
    }
  }
  else
  {
    uint64_t v24 = sub_23309BA90();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v8, 1, 1, v24);
    uint64_t v25 = swift_allocObject();
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    swift_release();
    uint64_t v26 = (void *)swift_allocObject();
    v26[2] = 0;
    v26[3] = 0;
    v26[4] = v25;
    v26[5] = a1;
    v26[6] = a2;
    id v27 = a2;
    swift_bridgeObjectRetain();
    sub_23308D6DC((uint64_t)v8, (uint64_t)&unk_268758DB8, (uint64_t)v26);
    swift_release();
  }
}

uint64_t sub_23308C598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[9] = a5;
  v6[10] = a6;
  v6[8] = a4;
  return MEMORY[0x270FA2498](sub_23308C5BC, 0, 0);
}

uint64_t sub_23308C5BC()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[11] = Strong;
  if (Strong)
  {
    unint64_t v2 = (void *)swift_task_alloc();
    v0[12] = v2;
    *unint64_t v2 = v0;
    v2[1] = sub_23308C74C;
    uint64_t v3 = v0[9];
    return sub_23308CB60(v3);
  }
  else
  {
    swift_beginAccess();
    uint64_t v5 = swift_weakLoadStrong();
    v0[14] = v5;
    if (v5)
    {
      uint64_t v6 = (void *)swift_task_alloc();
      v0[15] = v6;
      void *v6 = v0;
      v6[1] = sub_23308C95C;
      uint64_t v7 = v0[10];
      return sub_23308D144(v7);
    }
    else
    {
      uint64_t v8 = (uint64_t (*)(void))v0[1];
      return v8();
    }
  }
}

uint64_t sub_23308C74C()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    unint64_t v2 = sub_23308CA98;
  }
  else
  {
    swift_release();
    unint64_t v2 = sub_23308C868;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_23308C868()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[14] = Strong;
  if (Strong)
  {
    unint64_t v2 = (void *)swift_task_alloc();
    v0[15] = v2;
    *unint64_t v2 = v0;
    v2[1] = sub_23308C95C;
    uint64_t v3 = v0[10];
    return sub_23308D144(v3);
  }
  else
  {
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_23308C95C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_23308CAFC, 0, 0);
  }
  else
  {
    swift_release();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_23308CA98()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23308CAFC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23308CB60(uint64_t a1)
{
  v2[15] = a1;
  v2[16] = v1;
  uint64_t v3 = sub_23309B1F0();
  v2[17] = v3;
  v2[18] = *(void *)(v3 - 8);
  v2[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23308CC20, 0, 0);
}

uint64_t sub_23308CC20()
{
  unint64_t v24 = v0[15];
  if (v24)
  {
    if (v24 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_23309BF80();
      swift_bridgeObjectRelease();
      if (v18)
      {
        swift_bridgeObjectRetain();
        uint64_t v1 = sub_23309BF80();
        swift_bridgeObjectRelease();
        if (!v1) {
          goto LABEL_17;
        }
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v1 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v1)
      {
LABEL_4:
        uint64_t v25 = MEMORY[0x263F8EE78];
        uint64_t v2 = sub_232F39748(0, v1 & ~(v1 >> 63), 0);
        if (v1 < 0)
        {
          __break(1u);
          return MEMORY[0x270FA23F0](v2);
        }
        uint64_t v3 = 0;
        unint64_t v4 = v0[15] & 0xC000000000000001;
        uint64_t v5 = (void (**)(uint64_t, uint64_t))(v0[18] + 8);
        do
        {
          if (v4) {
            id v6 = (id)MEMORY[0x237DB5EA0](v3, v24);
          }
          else {
            id v6 = *(id *)(v24 + 8 * v3 + 32);
          }
          uint64_t v7 = v6;
          uint64_t v8 = v0[19];
          uint64_t v9 = v0[17];
          id v10 = objc_msgSend(v6, sel_UUID);
          sub_23309B1D0();

          uint64_t v11 = sub_23309B1B0();
          uint64_t v13 = v12;
          (*v5)(v8, v9);

          uint64_t v14 = v25;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_232F39748(0, *(void *)(v25 + 16) + 1, 1);
            uint64_t v14 = v25;
          }
          unint64_t v16 = *(void *)(v14 + 16);
          unint64_t v15 = *(void *)(v14 + 24);
          if (v16 >= v15 >> 1)
          {
            sub_232F39748(v15 > 1, v16 + 1, 1);
            uint64_t v14 = v25;
          }
          ++v3;
          *(void *)(v14 + 16) = v16 + 1;
          uint64_t v17 = v14 + 16 * v16;
          *(void *)(v17 + 32) = v11;
          *(void *)(v17 + 40) = v13;
        }
        while (v1 != v3);
LABEL_17:
        id v19 = *(void **)(v0[16] + 40);
        uint64_t v20 = sub_23309B990();
        v0[20] = v20;
        swift_bridgeObjectRelease();
        v0[2] = v0;
        v0[3] = sub_23308CF4C;
        uint64_t v21 = swift_continuation_init();
        v0[10] = MEMORY[0x263EF8330];
        v0[11] = 0x40000000;
        v0[12] = sub_23308AB98;
        v0[13] = &block_descriptor_76;
        v0[14] = v21;
        objc_msgSend(v19, sel_deleteSearchableItemsWithDomainIdentifiers_completionHandler_, v20, v0 + 10);
        uint64_t v2 = (uint64_t)(v0 + 2);
        return MEMORY[0x270FA23F0](v2);
      }
    }
  }
  swift_task_dealloc();
  unint64_t v22 = (uint64_t (*)(void))v0[1];
  return v22();
}

uint64_t sub_23308CF4C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 168) = v1;
  if (v1) {
    uint64_t v2 = sub_23308D0C8;
  }
  else {
    uint64_t v2 = sub_23308D05C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_23308D05C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23308D0C8()
{
  uint64_t v1 = *(void **)(v0 + 160);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_23308D144(uint64_t a1)
{
  v2[15] = a1;
  v2[16] = v1;
  v2[17] = type metadata accessor for IndexedAnchor(0);
  v2[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23308D1D8, 0, 0);
}

uint64_t sub_23308D1D8()
{
  uint64_t v1 = (void *)v0[15];
  if (v1)
  {
    uint64_t v2 = (void *)v0[18];
    *uint64_t v2 = objc_msgSend(v1, sel__rowid);
    sub_23309B180();
    sub_23309ABA0();
    swift_allocObject();
    sub_23309AB90();
    sub_233092954(&qword_268758DD0, (void (*)(uint64_t))type metadata accessor for IndexedAnchor);
    v0[19] = sub_23309AB80();
    v0[20] = v3;
    uint64_t v6 = v0[16];
    swift_release();
    uint64_t v7 = *(void **)(v6 + 24);
    uint64_t v8 = sub_23309B010();
    v0[21] = v8;
    uint64_t v9 = sub_23309B6E0();
    v0[22] = v9;
    v0[2] = v0;
    v0[3] = sub_23308D460;
    uint64_t v10 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_23308AC3C;
    v0[13] = &block_descriptor_75;
    v0[14] = v10;
    objc_msgSend(v7, sel_setData_forKey_completion_, v8, v9, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
}

uint64_t sub_23308D460()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 184) = v1;
  if (v1) {
    uint64_t v2 = sub_23308D618;
  }
  else {
    uint64_t v2 = sub_23308D570;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_23308D570()
{
  uint64_t v2 = (void *)v0[21];
  uint64_t v1 = (void *)v0[22];
  uint64_t v3 = v0[18];
  uint64_t v4 = (void *)v0[15];
  sub_232E9AA4C(v0[19], v0[20]);

  sub_233092F84(v3, type metadata accessor for IndexedAnchor);
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_23308D618()
{
  uint64_t v1 = (void *)v0[22];
  unint64_t v2 = v0[20];
  uint64_t v3 = (void *)v0[21];
  uint64_t v5 = v0[18];
  uint64_t v4 = v0[19];
  uint64_t v6 = (void *)v0[15];
  swift_willThrow();
  sub_232E9AA4C(v4, v2);

  sub_233092F84(v5, type metadata accessor for IndexedAnchor);
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_23308D6DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_23309BA90();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_23309BA80();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_2330930F0(a1, &qword_268758370, MEMORY[0x263F8F520]);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23309BA20();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_23308D878(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[23] = a6;
  v7[24] = a7;
  v7[21] = a4;
  v7[22] = a5;
  sub_23309299C(0, (unint64_t *)&qword_268757018, MEMORY[0x263F08FD0]);
  v7[25] = v8;
  v7[26] = *(void *)(v8 - 8);
  v7[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23308D958, 0, 0);
}

uint64_t sub_23308D958()
{
  uint64_t v24 = v0;
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v23 = MEMORY[0x263F8EE78];
  sub_23309BF20();
  id v4 = objc_msgSend(self, sel_clinicalNoteRecordType);
  sub_232F3A800(0, &qword_268757020);
  sub_23309B600();

  uint64_t v5 = (void *)sub_23309B5F0();
  uint64_t v6 = (void *)sub_23309B5E0();
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A678]), sel_initWithSampleType_predicate_, v5, v6);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_23309BF00();
  sub_23309BF30();
  sub_23309BF40();
  sub_23309BF10();
  *(void *)(v0 + 224) = v23;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 232) = Strong;
  if (Strong)
  {
    uint64_t v8 = Strong;
    *(void *)(v0 + 240) = *(void *)(Strong + 24);
    uint64_t v9 = sub_23309BBD0();
    if ((v10 & 1) == 0 && v9 != 1)
    {
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 248) = v11;
      *uint64_t v11 = v0;
      v11[1] = sub_23308DE40;
      v11[23] = v8;
      return MEMORY[0x270FA2498](sub_23308A5D8, 0, 0);
    }
    sub_23309BBB0();
    swift_release();
  }
  swift_beginAccess();
  uint64_t v12 = swift_weakLoadStrong();
  *(void *)(v0 + 272) = v12;
  if (v12)
  {
    uint64_t v13 = (void *)swift_task_alloc();
    *(void *)(v0 + 280) = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_23308E55C;
    return sub_23308BECC();
  }
  else
  {
    swift_beginAccess();
    uint64_t v14 = swift_weakLoadStrong();
    uint64_t v15 = *(void *)(v0 + 224);
    if (v14)
    {
      unint64_t v16 = *(os_unfair_lock_s **)(v14 + 48);
      swift_retain();
      long long v22 = *(_OWORD *)(v0 + 176);
      swift_release();
      uint64_t v17 = swift_allocObject();
      swift_beginAccess();
      swift_weakLoadStrong();
      swift_weakInit();
      swift_release();
      uint64_t v18 = swift_task_alloc();
      *(void *)(v18 + 16) = v17;
      *(void *)(v18 + 24) = v15;
      *(void *)(v18 + 32) = 0;
      *(_OWORD *)(v18 + 40) = v22;
      uint64_t v19 = swift_task_alloc();
      *(void *)(v19 + 16) = sub_233092EDC;
      *(void *)(v19 + 24) = v18;
      os_unfair_lock_lock(v16 + 6);
      sub_233092EEC(&v23);
      os_unfair_lock_unlock(v16 + 6);
      swift_release();
      swift_release();
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
    }
    else
    {
      swift_release();
    }
    swift_task_dealloc();
    uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
    return v20();
  }
}

uint64_t sub_23308DE40()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 256) = v0;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 264) = v0;
    swift_release();
    swift_release();
    uint64_t v3 = sub_23308DF68;
  }
  else
  {
    uint64_t v3 = sub_23308E24C;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_23308DF68()
{
  uint64_t v20 = v0;
  uint64_t v1 = (void *)v0[33];
  if (qword_2687563A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_23309B4B0();
  __swift_project_value_buffer(v2, (uint64_t)qword_268770F68);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_23309B4A0();
  os_log_type_t v6 = sub_23309BB80();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v19 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v9 = sub_23309C4D0();
    v0[19] = sub_232F62B64(v9, v10, &v19);
    sub_23309BD10();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    v0[18] = v1;
    id v11 = v1;
    id v12 = v1;
    sub_232F3FD80(0, (unint64_t *)&qword_268757070);
    sub_23309C320();
    id v13 = (id)HKSensitiveLogItem();
    swift_unknownObjectRelease();
    sub_23309BDB0();
    swift_unknownObjectRelease();
    uint64_t v14 = sub_23309B770();
    unint64_t v16 = v15;

    v0[20] = sub_232F62B64(v14, v16, &v19);
    sub_23309BD10();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_232E63000, v5, v6, "[%s] Failed to observe for new records for indexing: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x237DB6EC0](v8, -1, -1);
    MEMORY[0x237DB6EC0](v7, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_23308E24C()
{
  uint64_t v14 = v0;
  uint64_t v1 = *(void *)(v0 + 256);
  sub_23309BBB0();
  if (v1)
  {
    *(void *)(v0 + 264) = v1;
    swift_release();
    swift_release();
    return MEMORY[0x270FA2498](sub_23308DF68, 0, 0);
  }
  else
  {
    swift_release();
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    *(void *)(v0 + 272) = Strong;
    if (Strong)
    {
      id v3 = (void *)swift_task_alloc();
      *(void *)(v0 + 280) = v3;
      *id v3 = v0;
      v3[1] = sub_23308E55C;
      return sub_23308BECC();
    }
    else
    {
      swift_beginAccess();
      uint64_t v4 = swift_weakLoadStrong();
      uint64_t v5 = *(void *)(v0 + 224);
      if (v4)
      {
        os_log_type_t v6 = *(os_unfair_lock_s **)(v4 + 48);
        swift_retain();
        long long v12 = *(_OWORD *)(v0 + 176);
        swift_release();
        uint64_t v7 = swift_allocObject();
        swift_beginAccess();
        swift_weakLoadStrong();
        swift_weakInit();
        swift_release();
        uint64_t v8 = swift_task_alloc();
        *(void *)(v8 + 16) = v7;
        *(void *)(v8 + 24) = v5;
        *(void *)(v8 + 32) = 0;
        *(_OWORD *)(v8 + 40) = v12;
        uint64_t v9 = swift_task_alloc();
        *(void *)(v9 + 16) = sub_233092EDC;
        *(void *)(v9 + 24) = v8;
        os_unfair_lock_lock(v6 + 6);
        sub_233092EEC(v13);
        os_unfair_lock_unlock(v6 + 6);
        swift_release();
        swift_release();
        swift_release();
        swift_task_dealloc();
        swift_task_dealloc();
      }
      else
      {
        swift_release();
      }
      swift_task_dealloc();
      unint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
      return v10();
    }
  }
}

uint64_t sub_23308E55C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 288) = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    swift_release();
    uint64_t v5 = sub_23308E8A0;
  }
  else
  {
    *(void *)(v4 + 296) = a1;
    uint64_t v5 = sub_23308E6B0;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

void sub_23308E6B0()
{
  uint64_t v12 = v0;
  uint64_t v1 = *(void *)(v0 + 288);
  uint64_t v2 = *(void **)(v0 + 296);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = *(void *)(v0 + 224);
    uint64_t v5 = *(os_unfair_lock_s **)(Strong + 48);
    swift_retain();
    long long v10 = *(_OWORD *)(v0 + 176);
    swift_release();
    uint64_t v6 = swift_allocObject();
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    swift_release();
    uint64_t v7 = swift_task_alloc();
    *(void *)(v7 + 16) = v6;
    *(void *)(v7 + 24) = v4;
    *(void *)(v7 + 32) = v2;
    *(_OWORD *)(v7 + 40) = v10;
    uint64_t v8 = swift_task_alloc();
    *(void *)(v8 + 16) = sub_233092EDC;
    *(void *)(v8 + 24) = v7;
    os_unfair_lock_lock(v5 + 6);
    sub_233092EEC(v11);
    os_unfair_lock_unlock(v5 + 6);
    if (v1) {
      return;
    }
    swift_release();
    swift_release();
    swift_release();

    swift_task_dealloc();
    swift_task_dealloc();
  }
  else
  {
    swift_release();
  }
  swift_task_dealloc();
  uint64_t v9 = *(void (**)(void))(v0 + 8);
  v9();
}

uint64_t sub_23308E8A0()
{
  uint64_t v20 = v0;
  uint64_t v1 = (void *)v0[36];
  if (qword_2687563A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_23309B4B0();
  __swift_project_value_buffer(v2, (uint64_t)qword_268770F68);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_23309B4A0();
  os_log_type_t v6 = sub_23309BB80();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v19 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v9 = sub_23309C4D0();
    v0[19] = sub_232F62B64(v9, v10, &v19);
    sub_23309BD10();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    v0[18] = v1;
    id v11 = v1;
    id v12 = v1;
    sub_232F3FD80(0, (unint64_t *)&qword_268757070);
    sub_23309C320();
    id v13 = (id)HKSensitiveLogItem();
    swift_unknownObjectRelease();
    sub_23309BDB0();
    swift_unknownObjectRelease();
    uint64_t v14 = sub_23309B770();
    unint64_t v16 = v15;

    v0[20] = sub_232F62B64(v14, v16, &v19);
    sub_23309BD10();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_232E63000, v5, v6, "[%s] Failed to observe for new records for indexing: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x237DB6EC0](v8, -1, -1);
    MEMORY[0x237DB6EC0](v7, -1, -1);
  }
  else
  {
  }
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

void sub_23308EB84(id *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v10 = *a1;
  if (*a1)
  {
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      id v12 = *(void **)(Strong + 16);
      id v13 = v10;
      id v14 = v12;
      swift_release();
      objc_msgSend(v14, sel_stopQuery_, v13);
    }
    *a1 = 0;
  }
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a5;
  *(void *)(v15 + 24) = a6;
  id v16 = objc_allocWithZone(MEMORY[0x263F0A0C8]);
  sub_232F3A800(0, &qword_268758D98);
  swift_bridgeObjectRetain();
  swift_retain();
  id v17 = a4;
  uint64_t v18 = (void *)sub_23309B990();
  swift_bridgeObjectRelease();
  unint64_t v29 = sub_233092F2C;
  uint64_t v30 = v15;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v26 = 1107296256;
  id v27 = sub_23308EE6C;
  uint64_t v28 = &block_descriptor_58;
  uint64_t v19 = _Block_copy(&aBlock);
  id v20 = objc_msgSend(v16, sel_initWithQueryDescriptors_anchor_limit_resultsHandler_, v18, v17, 0, v19);

  _Block_release(v19);
  swift_release();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a5;
  *(void *)(v21 + 24) = a6;
  unint64_t v29 = sub_233092F2C;
  uint64_t v30 = v21;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v26 = 1107296256;
  id v27 = sub_23308EE6C;
  uint64_t v28 = &block_descriptor_64;
  long long v22 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v20, sel_setUpdateHandler_, v22);
  _Block_release(v22);
  swift_beginAccess();
  uint64_t v23 = swift_weakLoadStrong();
  if (v23)
  {
    id v24 = *(id *)(v23 + 16);
    swift_release();
    objc_msgSend(v24, sel_executeQuery_, v20);
  }
  *a1 = v20;
}

uint64_t sub_23308EE6C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v9 = a3;
  id v11 = *(void (**)(id, uint64_t, uint64_t, void *, void *))(a1 + 32);
  if (a3)
  {
    sub_232F3A800(0, &qword_268757020);
    uint64_t v9 = sub_23309B9A0();
  }
  if (a4)
  {
    sub_232F3A800(0, &qword_268758DA0);
    a4 = sub_23309B9A0();
  }
  swift_retain();
  id v12 = a2;
  id v13 = a5;
  id v14 = a6;
  v11(v12, v9, a4, a5, a6);
  swift_release();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_23308EF84(void **a1)
{
  id v3 = *a1;
  if (*a1)
  {
    objc_msgSend(*(id *)(v1 + 16), sel_stopQuery_, v3);
  }
  *a1 = 0;
}

uint64_t sub_23308EFD8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_232F3FD80(0, (unint64_t *)&qword_268757070);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    sub_232F3A800(0, &qword_268758D68);
    **(void **)(*(void *)(v3 + 64) + 40) = sub_23309B9A0();
    return swift_continuation_throwingResume();
  }
}

id sub_23308F0C0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v102 = a1;
  uint64_t v114 = *MEMORY[0x263EF8340];
  v99[2] = *v3;
  uint64_t v6 = sub_23309B760();
  MEMORY[0x270FA5388](v6 - 8);
  v99[1] = (unint64_t)v99 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = sub_23309B480();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  id v12 = (char *)v99 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  id v14 = (char *)v99 - v13;
  uint64_t v100 = *(void (**)(char *, uint64_t, unint64_t))(v9 + 16);
  v100((char *)v99 - v13, a3, v8);
  sub_23309B470();
  sub_233092954(&qword_268758D38, MEMORY[0x263F8F3A0]);
  char v15 = sub_23309B6D0();
  id v16 = *(void (**)(char *, unint64_t))(v9 + 8);
  v16(v12, v8);
  if ((v15 & 1) == 0)
  {
    v99[0] = a2;
    sub_23309B410();
    char v20 = sub_23309B6D0();
    v16(v12, v8);
    if (v20)
    {
      v16(v14, v8);
      id v21 = objc_allocWithZone(MEMORY[0x263F14740]);
      uint64_t v22 = v102;
      unint64_t v23 = v99[0];
      sub_232E9A9F4(v102, v99[0]);
      id v24 = (void *)sub_23309B010();
      id v25 = objc_msgSend(v21, sel_initWithData_, v24);
      sub_232E9AA4C(v22, v23);

      if (v25)
      {
        id v26 = objc_msgSend(v25, sel_string);
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = sub_23309B710();

          return (id)v28;
        }

        return 0;
      }
      return 0;
    }
    sub_23309B420();
    char v29 = sub_23309B6D0();
    v16(v12, v8);
    if ((v29 & 1) == 0)
    {
      sub_23309B460();
      char v30 = sub_23309B6D0();
      v16(v12, v8);
      if ((v30 & 1) == 0)
      {
        sub_23309B440();
        char v53 = sub_23309B6D0();
        v16(v12, v8);
        if (v53)
        {
          v16(v14, v8);
          id v54 = self;
          uint64_t v55 = (void *)sub_23309B010();
          id v107 = 0;
          id v56 = objc_msgSend(v54, sel_contentStringFromHTMLData_error_, v55, &v107);

          id v57 = v107;
          if (v56) {
            goto LABEL_42;
          }
          id v58 = v107;
          uint64_t v59 = (void *)sub_23309AEC0();

          swift_willThrow();
          if (qword_2687563A0 != -1) {
            swift_once();
          }
          uint64_t v60 = sub_23309B4B0();
          __swift_project_value_buffer(v60, (uint64_t)qword_268770F68);
          id v61 = v59;
          id v62 = v59;
          uint64_t v63 = sub_23309B4A0();
          os_log_type_t v64 = sub_23309BB80();
          if (os_log_type_enabled(v63, v64))
          {
            uint64_t v65 = swift_slowAlloc();
            uint64_t v66 = swift_slowAlloc();
            *(void *)&v103[0] = v66;
            *(_DWORD *)uint64_t v65 = 136315394;
            uint64_t v67 = sub_23309C4D0();
            id v107 = (id)sub_232F62B64(v67, v68, (uint64_t *)v103);
            sub_23309BD10();
            swift_bridgeObjectRelease();
            *(_WORD *)(v65 + 12) = 2080;
            id v107 = v59;
            id v69 = v59;
            id v70 = v59;
            sub_232F3FD80(0, (unint64_t *)&qword_268757070);
            sub_23309C320();
            id v71 = (id)HKSensitiveLogItem();
            swift_unknownObjectRelease();
            sub_23309BDB0();
            swift_unknownObjectRelease();
            uint64_t v72 = sub_23309B770();
            unint64_t v74 = v73;

            id v107 = (id)sub_232F62B64(v72, v74, (uint64_t *)v103);
            sub_23309BD10();
            swift_bridgeObjectRelease();

            uint64_t v75 = "[%s] Failed to generate index string for html data: %s";
LABEL_55:
            _os_log_impl(&dword_232E63000, v63, v64, v75, (uint8_t *)v65, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x237DB6EC0](v66, -1, -1);
            MEMORY[0x237DB6EC0](v65, -1, -1);

            return 0;
          }
LABEL_56:

          return 0;
        }
        if (qword_268756438 == -1)
        {
LABEL_40:
          uint64_t v76 = __swift_project_value_buffer(v8, (uint64_t)qword_268770FB8);
          v100(v12, v76, v8);
          char v77 = sub_23309B6D0();
          v16(v12, v8);
          if ((v77 & 1) == 0)
          {
            sub_23309B430();
            char v81 = sub_23309B6D0();
            v16(v12, v8);
            v16(v14, v8);
            if (v81)
            {
              sub_23309B750();
              uint64_t v28 = sub_23309B730();
              if (v82)
              {
                unint64_t v83 = v82;
                type metadata accessor for RTFDocument();
                inited = (void *)swift_initStackObject();
                inited[3] = v83;
                inited[4] = 0;
                inited[6] = 0;
                inited[5] = 0;
                inited[2] = v28;
                inited[4] = sub_23303C364(v28, v83);
                swift_release();
                sub_2330375D8();
                swift_beginAccess();
                uint64_t v28 = inited[5];
                swift_bridgeObjectRelease();
                swift_release();
              }
              return (id)v28;
            }
            return 0;
          }
          v16(v14, v8);
          uint64_t v78 = self;
          char v79 = (void *)sub_23309B010();
          id v107 = 0;
          id v56 = objc_msgSend(v78, sel_contentStringFromDOCXData_error_, v79, &v107);

          id v57 = v107;
          if (v56)
          {
LABEL_42:
            uint64_t v28 = sub_23309B710();
            id v80 = v57;

            return (id)v28;
          }
          id v85 = v107;
          uint64_t v59 = (void *)sub_23309AEC0();

          swift_willThrow();
          if (qword_2687563A0 != -1) {
            swift_once();
          }
          uint64_t v86 = sub_23309B4B0();
          __swift_project_value_buffer(v86, (uint64_t)qword_268770F68);
          id v87 = v59;
          id v88 = v59;
          uint64_t v63 = sub_23309B4A0();
          os_log_type_t v64 = sub_23309BB80();
          if (os_log_type_enabled(v63, v64))
          {
            uint64_t v65 = swift_slowAlloc();
            uint64_t v66 = swift_slowAlloc();
            *(void *)&v103[0] = v66;
            *(_DWORD *)uint64_t v65 = 136315394;
            uint64_t v89 = sub_23309C4D0();
            id v107 = (id)sub_232F62B64(v89, v90, (uint64_t *)v103);
            sub_23309BD10();
            swift_bridgeObjectRelease();
            *(_WORD *)(v65 + 12) = 2080;
            id v107 = v59;
            id v91 = v59;
            id v92 = v59;
            sub_232F3FD80(0, (unint64_t *)&qword_268757070);
            sub_23309C320();
            id v93 = (id)HKSensitiveLogItem();
            swift_unknownObjectRelease();
            sub_23309BDB0();
            swift_unknownObjectRelease();
            uint64_t v94 = sub_23309B770();
            unint64_t v96 = v95;

            id v107 = (id)sub_232F62B64(v94, v96, (uint64_t *)v103);
            sub_23309BD10();
            swift_bridgeObjectRelease();

            uint64_t v75 = "[%s] Failed to generate index string for docx data: %s";
            goto LABEL_55;
          }
          goto LABEL_56;
        }
LABEL_65:
        swift_once();
        goto LABEL_40;
      }
    }
    v16(v14, v8);
    uint64_t v31 = v102;
    unint64_t v32 = v99[0];
    sub_232E9A9F4(v102, v99[0]);
    sub_232F37F4C(MEMORY[0x263F8EE78]);
    id v33 = objc_allocWithZone(MEMORY[0x263F1EF40]);
    uint64_t v34 = (void *)sub_23309B010();
    type metadata accessor for VNImageOption(0);
    sub_233092954(&qword_268756668, type metadata accessor for VNImageOption);
    id v14 = (char *)sub_23309B640();
    swift_bridgeObjectRelease();
    uint64_t v35 = (uint64_t)objc_msgSend(v33, sel_initWithData_options_, v34, v14);
    sub_232E9AA4C(v31, v32);

    id v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F1EF90]), sel_init);
    objc_msgSend(v36, sel_setUsesLanguageCorrection_, 1);
    id v37 = (void *)sub_23309B990();
    objc_msgSend(v36, sel_setRecognitionLanguages_, v37);

    objc_msgSend(v36, sel_setRecognitionLevel_, 0);
    sub_233092CD4(0, (unint64_t *)&qword_268757D40, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
    uint64_t v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_2330A4FB0;
    *(void *)(v38 + 32) = v36;
    id v107 = (id)v38;
    sub_23309B9C0();
    sub_232F3A800(0, &qword_268758D40);
    a2 = (unint64_t)v36;
    uint64_t v39 = (void *)sub_23309B990();
    swift_bridgeObjectRelease();
    id v107 = 0;
    id v16 = (void (*)(char *, unint64_t))objc_msgSend((id)v35, sel_performRequests_error_, v39, &v107);

    uint64_t v28 = (uint64_t)v107;
    if (!v16)
    {
      id v52 = v107;
      sub_23309AEC0();

      swift_willThrow();
      return (id)v28;
    }
    id v40 = v107;
    id v41 = objc_msgSend((id)a2, sel_results);
    if (!v41)
    {

      return 0;
    }
    uint64_t v42 = v41;
    sub_232F3A800(0, &qword_268758D48);
    unint64_t v8 = sub_23309B9A0();

    if (v8 >> 62)
    {
LABEL_59:
      swift_bridgeObjectRetain();
      uint64_t v97 = sub_23309BF80();
      swift_bridgeObjectRelease();
      if (v97) {
        goto LABEL_14;
      }
    }
    else if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_14:
      if ((v8 & 0xC000000000000001) != 0)
      {
        id v43 = (id)MEMORY[0x237DB5EA0](0, v8);
        goto LABEL_17;
      }
      if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v43 = *(id *)(v8 + 32);
LABEL_17:
        uint64_t v44 = v43;
        swift_bridgeObjectRelease();
        id v45 = objc_msgSend(v44, sel_getTranscript);

        if (v45)
        {
          uint64_t v28 = sub_23309B710();

          return (id)v28;
        }

        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }

    swift_bridgeObjectRelease();
    return 0;
  }
  v16(v14, v8);
  uint64_t v17 = v101;
  uint64_t v18 = v102;
  switch(a2 >> 62)
  {
    case 1uLL:
      unint64_t v8 = (int)v102;
      uint64_t v35 = v102 >> 32;
      if (v102 >> 32 < (int)v102)
      {
        __break(1u);
        goto LABEL_59;
      }
      sub_232E9A9F4(v102, a2);
      uint64_t v28 = sub_2330909D8((int)v18, v18 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_233090D6C);
      if (v51) {
        goto LABEL_46;
      }
      goto LABEL_25;
    case 2uLL:
      uint64_t v46 = *(void *)(v102 + 16);
      uint64_t v47 = *(void *)(v102 + 24);
      sub_232E9A9F4(v102, a2);
      swift_retain();
      swift_retain();
      uint64_t v48 = sub_2330909D8(v46, v47, a2 & 0x3FFFFFFFFFFFFFFFLL, (void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_233090D6C);
      if (v17)
      {
        swift_release();
        swift_release();
        __break(1u);
        JUMPOUT(0x233090288);
      }
      uint64_t v28 = v48;
      uint64_t v50 = v49;
      swift_release();
      swift_release();
      if (v50) {
        goto LABEL_46;
      }
LABEL_25:
      uint64_t v105 = v18;
      unint64_t v106 = a2;
      sub_232E9A9F4(v18, a2);
      sub_232F3FD80(0, &qword_268758D50);
      if (swift_dynamicCast())
      {
        sub_232F3FDD0(v103, (uint64_t)&v107);
        __swift_project_boxed_opaque_existential_1(&v107, v113);
        if (sub_23309BFF0())
        {
          __swift_project_boxed_opaque_existential_1(&v107, v113);
          sub_23309BFE0();
          sub_232E9AA4C(v18, a2);
          uint64_t v28 = *(void *)&v103[0];
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v107);
          return (id)v28;
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v107);
      }
      else
      {
        uint64_t v104 = 0;
        memset(v103, 0, sizeof(v103));
        sub_233092F84((uint64_t)v103, (uint64_t (*)(void))sub_233092C6C);
      }
      uint64_t v19 = sub_233090A88(v18, a2);
LABEL_45:
      uint64_t v28 = v19;
LABEL_46:
      sub_232E9AA4C(v18, a2);
      break;
    case 3uLL:
      *(void *)((char *)v103 + 6) = 0;
      *(void *)&v103[0] = 0;
      sub_233090D6C((uint64_t *)&v107);
      sub_232E9AA4C(v18, a2);
      return v107;
    default:
      id v107 = (id)v102;
      __int16 v108 = a2;
      char v109 = BYTE2(a2);
      char v110 = BYTE3(a2);
      char v111 = BYTE4(a2);
      char v112 = BYTE5(a2);
      uint64_t v19 = sub_23309B7E0();
      goto LABEL_45;
  }
  return (id)v28;
}

void sub_233090298(uint64_t a1)
{
  sub_233092AF0();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v2);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    id v7 = *(id *)(Strong + 40);
    swift_release();
    sub_232F3A800(0, &qword_268758710);
    unint64_t v8 = (void *)sub_23309B990();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
    unint64_t v9 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v10 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v10 + v9, (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
    aBlock[4] = sub_233092BFC;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23308BE60;
    aBlock[3] = &block_descriptor_32;
    uint64_t v11 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v7, sel_indexSearchableItems_completionHandler_, v8, v11);
    _Block_release(v11);
  }
}

uint64_t sub_2330904B0(void *a1)
{
  if (a1
    && (id v1 = a1,
        sub_232F3FD80(0, (unint64_t *)&qword_268757070),
        sub_232F3A800(0, &qword_268757078),
        (swift_dynamicCast() & 1) != 0))
  {
    sub_233092AF0();
    return sub_23309BA30();
  }
  else
  {
    sub_233092AF0();
    return sub_23309BA40();
  }
}

uint64_t sub_233090564(uint64_t a1, uint64_t a2, uint64_t a3, void **a4)
{
  uint64_t v5 = sub_23309B950();
  uint64_t v6 = MEMORY[0x237DB57D0](v5);
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  unint64_t v9 = *a4;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a4 = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v9 = sub_232F3CCE0(0, v9[2] + 1, 1, v9);
    *a4 = v9;
  }
  unint64_t v12 = v9[2];
  unint64_t v11 = v9[3];
  if (v12 >= v11 >> 1)
  {
    unint64_t v9 = sub_232F3CCE0((void *)(v11 > 1), v12 + 1, 1, v9);
    *a4 = v9;
  }
  v9[2] = v12 + 1;
  uint64_t v13 = &v9[2 * v12];
  v13[4] = v6;
  v13[5] = v8;
  return 1;
}

void sub_233090634(void *a1, char a2, void *a3)
{
  if (!a1[2])
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v43 = a1[2];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = (void *)a1[6];
  swift_bridgeObjectRetain();
  unint64_t v9 = (void *)*a3;
  swift_bridgeObjectRetain();
  id v10 = v8;
  unint64_t v12 = sub_232F393E0(v6, v7);
  uint64_t v13 = v9[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14)) {
    goto LABEL_23;
  }
  char v16 = v11;
  if (v9[3] >= v15)
  {
    if (a2)
    {
      if (v11) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_232F5DD44();
      if (v16) {
        goto LABEL_10;
      }
    }
LABEL_13:
    id v21 = (void *)*a3;
    *(void *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    uint64_t v22 = (uint64_t *)(v21[6] + 16 * v12);
    *uint64_t v22 = v6;
    v22[1] = v7;
    *(void *)(v21[7] + 8 * v12) = v10;
    uint64_t v23 = v21[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v21[2] = v25;
    uint64_t v26 = v43 - 1;
    if (v43 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    id v27 = (void **)(a1 + 9);
    while (1)
    {
      uint64_t v28 = (uint64_t)*(v27 - 2);
      uint64_t v29 = (uint64_t)*(v27 - 1);
      char v30 = *v27;
      uint64_t v31 = (void *)*a3;
      swift_bridgeObjectRetain();
      id v10 = v30;
      unint64_t v32 = sub_232F393E0(v28, v29);
      uint64_t v34 = v31[2];
      BOOL v35 = (v33 & 1) == 0;
      BOOL v24 = __OFADD__(v34, v35);
      uint64_t v36 = v34 + v35;
      if (v24) {
        break;
      }
      char v37 = v33;
      if (v31[3] < v36)
      {
        sub_232F5CE14(v36, 1);
        unint64_t v32 = sub_232F393E0(v28, v29);
        if ((v37 & 1) != (v38 & 1)) {
          goto LABEL_25;
        }
      }
      if (v37) {
        goto LABEL_10;
      }
      uint64_t v39 = (void *)*a3;
      *(void *)(*a3 + 8 * (v32 >> 6) + 64) |= 1 << v32;
      id v40 = (uint64_t *)(v39[6] + 16 * v32);
      *id v40 = v28;
      v40[1] = v29;
      *(void *)(v39[7] + 8 * v32) = v10;
      uint64_t v41 = v39[2];
      BOOL v24 = __OFADD__(v41, 1);
      uint64_t v42 = v41 + 1;
      if (v24) {
        goto LABEL_24;
      }
      v39[2] = v42;
      v27 += 3;
      if (!--v26) {
        goto LABEL_22;
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_232F5CE14(v15, a2 & 1);
  unint64_t v17 = sub_232F393E0(v6, v7);
  if ((v16 & 1) == (v18 & 1))
  {
    unint64_t v12 = v17;
    if ((v16 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    uint64_t v19 = (void *)swift_allocError();
    swift_willThrow();
    id v20 = v19;
    sub_232F3FD80(0, (unint64_t *)&qword_268757070);
    if ((swift_dynamicCast() & 1) == 0)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_23309C340();
  __break(1u);
LABEL_26:
  sub_23309BE40();
  sub_23309B880();
  sub_23309BF50();
  sub_23309B880();
  sub_23309BF70();
  __break(1u);
}

uint64_t sub_2330909D8(uint64_t a1, uint64_t a2, uint64_t a3, void *(*a4)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t result = sub_23309ACB0();
  uint64_t v9 = result;
  if (result)
  {
    uint64_t result = sub_23309ACD0();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v9 += a1 - result;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v12 = sub_23309ACC0();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t v14 = v9 + v13;
  if (v9) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t result = (uint64_t)sub_233090B3C(v9, v15, a4);
  if (v4) {
    return v16;
  }
  return result;
}

uint64_t sub_233090A88(uint64_t a1, unint64_t a2)
{
  sub_232E9A9F4(a1, a2);
  sub_233090B90(a1, a2);
  sub_232E9AA4C(a1, a2);
  uint64_t v4 = sub_23309B7E0();
  swift_release();
  return v4;
}

uint64_t sub_233090B00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23309B7E0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void *sub_233090B3C(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  if (a1) {
    uint64_t v4 = a2 - a1;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t result = a3(&v6, a1, v4);
  if (!v3) {
    return (void *)v6;
  }
  return result;
}

void *sub_233090B90(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_23309B070();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)MEMORY[0x263F8EE78];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_12;
      }
      uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (v9)
      {
        if (v9 >= 1)
        {
          sub_233092CD4(0, (unint64_t *)&qword_2687570E0, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
          uint64_t v8 = (void *)swift_allocObject();
          size_t v12 = _swift_stdlib_malloc_size(v8);
          v8[2] = v9;
          v8[3] = 2 * v12 - 64;
        }
        sub_232E9A9F4(a1, a2);
        uint64_t v13 = sub_23309AFB0();
        sub_232E9AA4C(a1, a2);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        if (v13 != v9)
        {
          __break(1u);
LABEL_12:
          __break(1u);
LABEL_13:
          __break(1u);
          JUMPOUT(0x233090D5CLL);
        }
      }
      return v8;
    case 2uLL:
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v10 = *(void *)(a1 + 24);
      uint64_t v9 = v10 - v11;
      if (!__OFSUB__(v10, v11)) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      return v8;
    default:
      uint64_t v9 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_233090D6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23309B7E0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_233090DA4(uint64_t a1, uint64_t a2)
{
  v16[1] = a2;
  sub_23309299C(0, (unint64_t *)&qword_268757018, MEMORY[0x263F08FD0]);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v16 - v7;
  int64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (v9)
  {
    v16[0] = v2;
    uint64_t v17 = MEMORY[0x263F8EE78];
    sub_232F399CC(0, v9, 0);
    uint64_t v10 = v17;
    uint64_t v11 = self;
    do
    {
      id v12 = objc_msgSend(v11, sel_clinicalNoteRecordType);
      sub_232F3A800(0, &qword_268757020);
      sub_23309B600();

      uint64_t v17 = v10;
      unint64_t v14 = *(void *)(v10 + 16);
      unint64_t v13 = *(void *)(v10 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_232F399CC(v13 > 1, v14 + 1, 1);
        uint64_t v10 = v17;
      }
      *(void *)(v10 + 16) = v14 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v14, v8, v5);
      --v9;
    }
    while (v9);
  }
  return v10;
}

uint64_t sub_233090F94()
{
  uint64_t v3 = MEMORY[0x263F8EE78];
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F14040]), sel_initWithUnit_, 0);
  id v1 = (void *)sub_23309B6E0();
  objc_msgSend(v0, sel_setString_, v1);

  sub_23309BB40();
  return v3;
}

uint64_t sub_233091084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_233092890(0, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v31 = (char *)v28 - v8;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v37 = MEMORY[0x263F8EE78];
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    v28[2] = v3;
    uint64_t v30 = sub_23309B230();
    uint64_t v11 = *(void *)(v30 - 8);
    id v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v28[3] = v11 + 56;
    uint64_t v29 = v12;
    swift_bridgeObjectRetain();
    v28[1] = a1;
    unint64_t v13 = (uint64_t *)(a1 + 40);
    uint64_t v14 = (uint64_t)v31;
    do
    {
      uint64_t v16 = *(v13 - 1);
      uint64_t v17 = *v13;
      uint64_t v35 = a2;
      uint64_t v36 = a3;
      uint64_t v32 = v10;
      uint64_t v33 = v16;
      uint64_t v34 = v17;
      v29(v14, 1, 1, v30);
      sub_232F379FC();
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_23309BD70();
      uint64_t v20 = v19;
      uint64_t v21 = a2;
      char v23 = v22;
      sub_2330930F0(v14, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690]);
      if (v23)
      {
        swift_bridgeObjectRelease();
        a2 = v21;
        uint64_t v15 = v32;
      }
      else
      {
        uint64_t v35 = v18;
        uint64_t v36 = v20;
        uint64_t v33 = v21;
        uint64_t v34 = a3;
        sub_2330928F4();
        sub_233092954(&qword_268758D00, (void (*)(uint64_t))sub_2330928F4);
        swift_bridgeObjectRetain();
        uint64_t v24 = sub_23309BC20();
        id v26 = objc_msgSend(self, sel_valueWithRange_, v24, v25);
        uint64_t v27 = swift_bridgeObjectRelease();
        a2 = v21;
        uint64_t v15 = v32;
        if (v26)
        {
          MEMORY[0x237DB59C0](v27);
          if (*(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_23309B9D0();
          }
          sub_23309B9E0();
          sub_23309B9C0();
        }
      }
      v13 += 2;
      uint64_t v10 = v15 - 1;
    }
    while (v10);
    swift_bridgeObjectRelease();
    return v37;
  }
  return result;
}

uint64_t sub_233091394(uint64_t a1, uint64_t a2)
{
  sub_233092890(0, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v41 - v5;
  if (!a2) {
    return 0;
  }
  uint64_t v7 = sub_23305B134(a1, a2);
  unint64_t v9 = v8;
  uint64_t v10 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  if (!v10)
  {
LABEL_20:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v11 = v7;
  id v12 = (void *)sub_233090F94();
  uint64_t v13 = (uint64_t)v12;
  if (!v12[2]) {
    goto LABEL_19;
  }
  uint64_t v14 = v12[4];
  uint64_t v15 = v12[5];
  uint64_t v42 = v11;
  unint64_t v43 = v9;
  v41[2] = v14;
  v41[3] = v15;
  uint64_t v16 = sub_23309B230();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
  sub_232F379FC();
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_23309BD70();
  uint64_t v19 = v18;
  char v21 = v20;
  sub_2330930F0((uint64_t)v6, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690]);
  swift_bridgeObjectRelease();
  if (v21)
  {
LABEL_19:
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  uint64_t v22 = sub_23309B810();
  uint64_t v23 = 70 - v22;
  if (__OFSUB__(70, v22))
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v23 < 0) {
    uint64_t v23 = 71 - v22;
  }
  uint64_t v24 = v23 >> 1;
  sub_23305B078(v17, v19, v23 >> 1, v11, v9);
  v41[0] = v25;
  uint64_t v26 = sub_23309B8F0();
  uint64_t v27 = sub_23309B8F0();
  uint64_t v19 = v27 + v24;
  if (__OFADD__(v27, v24)) {
    goto LABEL_24;
  }
  if (v24 >= v26) {
    unint64_t v28 = 0xE000000000000000;
  }
  else {
    unint64_t v28 = 0xA300000000000000;
  }
  if (v24 >= v26) {
    uint64_t v29 = 0;
  }
  else {
    uint64_t v29 = 10911970;
  }
  sub_23309B810();
  uint64_t v30 = sub_23309B950();
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  swift_bridgeObjectRelease();
  MEMORY[0x237DB57D0](v30, v32, v34, v36);
  swift_bridgeObjectRelease();
  uint64_t v42 = v29;
  unint64_t v43 = v28;
  swift_bridgeObjectRetain();
  sub_23309B880();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23309B880();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v19 = v42;
  uint64_t v37 = v43;
  swift_bridgeObjectRetain();
  unint64_t v38 = sub_233091084(v13, v19, v37);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v38 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_23309BF80();
    swift_bridgeObjectRelease();
    if (v40) {
      return v19;
    }
    goto LABEL_19;
  }
  if (!*(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_19;
  }
  return v19;
}

id sub_23309176C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v9 = (void *)sub_23309B6E0();
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)sub_23309B1C0();
  if (a6)
  {
    uint64_t v11 = (void *)sub_23309B6E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_232F3A800(0, &qword_268758CF0);
  uint64_t v13 = (void *)sub_23309B990();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v12, sel_initWithTitle_medicalRecord_attachmentUUID_previewString_previewStringMatchRanges_, v9, a3, v10, v11, v13);

  uint64_t v15 = sub_23309B1F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(a4, v15);
  return v14;
}

uint64_t sub_2330918AC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v18 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v7; uint64_t v7 = sub_23309BF80())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v9 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x237DB5EA0](i - 4, a1) : *(id *)(a1 + 8 * i);
      uint64_t v10 = v9;
      uint64_t v11 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      uint64_t v17 = v9;
      sub_23308B86C(&v17, a2, a4, a5, &v16);
      if (v5)
      {
        swift_bridgeObjectRelease();

        return swift_bridgeObjectRelease();
      }

      if (v16)
      {
        MEMORY[0x237DB59C0]();
        if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_23309B9D0();
        }
        sub_23309B9E0();
        sub_23309B9C0();
      }
      if (v11 == v7)
      {
        swift_bridgeObjectRelease();
        return v18;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_233091A50()
{
  v17[1] = *(id *)MEMORY[0x263EF8340];
  id v0 = (id)HKSharedResourcesDirectory();
  if (!v0) {
    __break(1u);
  }
  id v1 = v0;
  uint64_t v2 = (void *)sub_23309B6E0();
  id v3 = objc_msgSend(v1, sel_stringByAppendingPathComponent_, v2);

  uint64_t v4 = v3;
  uint64_t v5 = v3;
  if (!v3)
  {
    sub_23309B710();
    uint64_t v5 = (void *)sub_23309B6E0();
    swift_bridgeObjectRelease();
    sub_23309B710();
    uint64_t v4 = (void *)sub_23309B6E0();
    swift_bridgeObjectRelease();
  }
  uint64_t v6 = sub_23309B710();
  uint64_t v7 = self;
  id v8 = v3;
  id v9 = objc_msgSend(v7, sel_defaultManager);
  unsigned __int8 v10 = objc_msgSend(v9, sel_fileExistsAtPath_, v5);

  if (v10)
  {
  }
  else
  {
    id v11 = objc_msgSend(v7, sel_defaultManager);
    v17[0] = 0;
    unsigned int v12 = objc_msgSend(v11, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v4, 1, 0, v17);

    if (v12)
    {
      id v13 = v17[0];
    }
    else
    {
      id v14 = v17[0];
      uint64_t v15 = (void *)sub_23309AEC0();

      swift_willThrow();
    }
  }
  return v6;
}

uint64_t *sub_233091C58(void *a1)
{
  uint64_t v3 = *v1;
  sub_233092890(0, &qword_268758370, MEMORY[0x263F8F520], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v25 - v5;
  v1[7] = 0;
  v1[8] = (uint64_t)&unk_26E6A4BF8;
  v1[9] = 0;
  v1[2] = (uint64_t)a1;
  uint64_t v7 = (void *)*MEMORY[0x263F08080];
  id v8 = a1;
  id v9 = v7;
  sub_233091A50();
  id v10 = objc_allocWithZone(MEMORY[0x263F02AA8]);
  id v11 = (void *)sub_23309B6E0();
  unsigned int v12 = (void *)sub_23309B6E0();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v10, sel_initWithName_protectionClass_path_, v11, v9, v12);

  v1[5] = (uint64_t)v13;
  id v14 = objc_allocWithZone(MEMORY[0x263F0A470]);
  id v15 = v8;
  uint64_t v16 = (void *)sub_23309B6E0();
  id v17 = objc_msgSend(v14, sel_initWithCategory_domainName_healthStore_, 3, v16, v15);

  v1[3] = (uint64_t)v17;
  v1[4] = (uint64_t)objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A0D8]), sel_initWithHealthStore_, v15);
  sub_233092D20();
  uint64_t v18 = swift_allocObject();
  *(_DWORD *)(v18 + 24) = 0;
  *(void *)(v18 + 16) = 0;
  v1[6] = v18;
  uint64_t v19 = swift_allocObject();
  swift_weakInit();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v19;
  *(void *)(v20 + 24) = v3;
  uint64_t v21 = sub_23309BA90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v6, 1, 1, v21);
  uint64_t v22 = swift_allocObject();
  swift_weakInit();
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = v22;
  v23[5] = sub_233092DB8;
  v23[6] = v20;
  v23[7] = v3;
  sub_23300B72C((uint64_t)v6, (uint64_t)&unk_268758D80, (uint64_t)v23);
  swift_release();
  return v1;
}

void sub_233091F78(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F02AD0]), sel_init);
  uint64_t v3 = MEMORY[0x263F8D310];
  uint64_t v4 = (void *)sub_23309B990();
  objc_msgSend(v2, sel_setFetchAttributes_, v4);

  uint64_t v5 = (void *)sub_23309B990();
  objc_msgSend(v2, sel_setBundleIDs_, v5);

  swift_beginAccess();
  if (!swift_weakLoadStrong()) {
    goto LABEL_5;
  }
  unint64_t v6 = sub_232F379FC();
  sub_23309BD50();
  uint64_t v36 = 34;
  unint64_t v37 = 0xE100000000000000;
  uint64_t v34 = 8796;
  unint64_t v35 = 0xE200000000000000;
  unint64_t v26 = v6;
  unint64_t v27 = v6;
  unint64_t v25 = v6;
  sub_23309BD50();
  swift_bridgeObjectRelease();
  sub_23309B880();
  swift_bridgeObjectRelease();
  sub_23309B880();
  swift_release();
  sub_233091A50();
  id v7 = objc_allocWithZone(MEMORY[0x263F02AA0]);
  id v8 = v2;
  id v9 = (void *)sub_23309B6E0();
  swift_bridgeObjectRelease();
  id v10 = (void *)sub_23309B6E0();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v7, sel_initWithPath_queryString_context_, v9, v10, v8, v3, v25, v26, v27, 574433834, 0xE400000000000000);

  if (v11)
  {
    sub_233092890(0, &qword_268758D10, (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType, MEMORY[0x263F8E0F8]);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_2330A1880;
    id v13 = (void *)*MEMORY[0x263F08080];
    *(void *)(v12 + 32) = *MEMORY[0x263F08080];
    type metadata accessor for FileProtectionType(0);
    id v14 = v13;
    id v15 = v11;
    uint64_t v16 = (void *)sub_23309B990();
    swift_bridgeObjectRelease();
    objc_msgSend(v15, sel_setProtectionClasses_, v16);

    objc_msgSend(v15, sel_setPrivateIndex_, 1);
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = MEMORY[0x263F8EE78];
    uint64_t v32 = sub_233092A44;
    uint64_t v33 = v17;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v29 = 1107296256;
    uint64_t v30 = sub_23308BCF8;
    uint64_t v31 = &block_descriptor_0;
    uint64_t v18 = _Block_copy(&aBlock);
    id v19 = v15;
    swift_retain();
    swift_release();
    objc_msgSend(v19, sel_setFoundItemsHandler_, v18);
    _Block_release(v18);

    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = a1;
    *(void *)(v20 + 24) = v17;
    uint64_t v32 = sub_233092A9C;
    uint64_t v33 = v20;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v29 = 1107296256;
    uint64_t v30 = sub_23308BE60;
    uint64_t v31 = &block_descriptor_20;
    uint64_t v21 = _Block_copy(&aBlock);
    id v22 = v19;
    swift_retain();
    swift_release();
    objc_msgSend(v22, sel_setCompletionHandler_, v21);
    _Block_release(v21);

    objc_msgSend(v22, sel_start);
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      uint64_t v24 = Strong;

      id v2 = *(id *)(v24 + 72);
      *(void *)(v24 + 72) = v11;
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();

      id v2 = v8;
    }
  }
  else
  {
LABEL_5:
    **(void **)(*(void *)(a1 + 64) + 40) = MEMORY[0x263F8EE78];
    swift_continuation_throwingResume();
  }
}

uint64_t sub_2330924B8(unint64_t a1)
{
  sub_233092890(0, &qword_268757D68, MEMORY[0x263F07508], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v24 - v3;
  uint64_t v5 = sub_23309B1F0();
  uint64_t v27 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v31 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v26 = (char *)&v24 - v8;
  if (!(a1 >> 62))
  {
    uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_3;
    }
LABEL_21:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_23309BF80();
  uint64_t v9 = result;
  if (!result) {
    goto LABEL_21;
  }
LABEL_3:
  if (v9 >= 1)
  {
    uint64_t v11 = 0;
    unint64_t v28 = a1 & 0xC000000000000001;
    unint64_t v25 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
    uint64_t v12 = (unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
    id v13 = (void (**)(char *, char *, uint64_t))(v27 + 32);
    unint64_t v14 = MEMORY[0x263F8EE78];
    uint64_t v29 = v9;
    unint64_t v30 = a1;
    do
    {
      if (v28) {
        id v15 = (id)MEMORY[0x237DB5EA0](v11, a1);
      }
      else {
        id v15 = *(id *)(a1 + 8 * v11 + 32);
      }
      uint64_t v16 = v15;
      id v17 = objc_msgSend(v15, sel_attributeSet);
      id v18 = objc_msgSend(v17, sel_domainIdentifier);

      if (v18)
      {
        sub_23309B710();

        sub_23309B1A0();
        swift_bridgeObjectRelease();
      }
      else
      {
        (*v25)(v4, 1, 1, v5);
      }
      uint64_t v19 = v29;
      if ((*v12)(v4, 1, v5) == 1)
      {
        sub_2330930F0((uint64_t)v4, &qword_268757D68, MEMORY[0x263F07508]);
      }
      else
      {
        uint64_t v20 = *v13;
        uint64_t v21 = v26;
        (*v13)(v26, v4, v5);
        v20(v31, v21, v5);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v14 = sub_232F3D638(0, *(void *)(v14 + 16) + 1, 1, v14);
        }
        unint64_t v23 = *(void *)(v14 + 16);
        unint64_t v22 = *(void *)(v14 + 24);
        if (v23 >= v22 >> 1) {
          unint64_t v14 = sub_232F3D638(v22 > 1, v23 + 1, 1, v14);
        }
        *(void *)(v14 + 16) = v23 + 1;
        v20((char *)(v14+ ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80))+ *(void *)(v27 + 72) * v23), v31, v5);
      }
      a1 = v30;
      ++v11;
    }
    while (v19 != v11);
    swift_bridgeObjectRelease();
    return v14;
  }
  __break(1u);
  return result;
}

void sub_233092890(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_2330928F4()
{
  if (!qword_268758CF8)
  {
    unint64_t v0 = sub_23309BB30();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268758CF8);
    }
  }
}

uint64_t sub_233092954(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_23309299C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_232F3A800(255, &qword_268757020);
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_233092A0C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_233092A44()
{
  return sub_23308BCA4();
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

uint64_t sub_233092A64()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_233092A9C(void *a1)
{
  return sub_23308BD7C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_233092AA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_233090564(a1, a2, a3, *(void ***)(v3 + 16));
}

uint64_t sub_233092AB0()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_233092AE8(uint64_t a1)
{
}

void sub_233092AF0()
{
  if (!qword_268758D28)
  {
    sub_232F3FD80(255, (unint64_t *)&qword_268757070);
    unint64_t v0 = sub_23309BA50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268758D28);
    }
  }
}

uint64_t sub_233092B6C()
{
  sub_233092AF0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_233092BFC(void *a1)
{
  sub_233092AF0();
  return sub_2330904B0(a1);
}

void sub_233092C6C()
{
  if (!qword_268758D58)
  {
    sub_232F3FD80(255, &qword_268758D50);
    unint64_t v0 = sub_23309BD00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268758D58);
    }
  }
}

void sub_233092CD4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_233092D20()
{
  if (!qword_268758D70)
  {
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_23309BED0();
    if (!v1) {
      atomic_store(v0, &qword_268758D70);
    }
  }
}

uint64_t sub_233092D80()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_233092DB8(uint64_t a1, void *a2, void *a3)
{
}

uint64_t sub_233092DC0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_233092E08(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  id v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *id v10 = v2;
  v10[1] = sub_23300BE68;
  return sub_23308D878(a1, v4, v5, v6, v7, v9, v8);
}

void sub_233092EDC(id *a1)
{
  sub_23308EB84(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_233092EEC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = 0;
  return result;
}

uint64_t sub_233092F30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a3, a4, a5);
}

uint64_t type metadata accessor for IndexedAnchor(uint64_t a1)
{
  return sub_232EA4800(a1, (uint64_t *)&unk_268758DD8);
}

uint64_t sub_233092F84(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_233092FE4()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_233093034()
{
  long long v5 = *(_OWORD *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_23300BE68;
  *(void *)(v3 + 80) = v2;
  *(_OWORD *)(v3 + 64) = v5;
  return MEMORY[0x270FA2498](sub_23308C5BC, 0, 0);
}

uint64_t sub_2330930F0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_233092890(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t *sub_233093160(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_23309B190();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_23309322C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_23309B190();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

void *sub_233093294(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_23309B190();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

void *sub_233093310(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_23309B190();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

void *sub_23309338C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_23309B190();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_233093408(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_23309B190();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_233093484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_233093498);
}

uint64_t sub_233093498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 20);
  uint64_t v5 = sub_23309B190();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);
  return v6(v4, a2, v5);
}

uint64_t sub_233093508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23309351C);
}

uint64_t sub_23309351C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 20);
  uint64_t v6 = sub_23309B190();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(v5, a2, a2, v6);
}

uint64_t sub_233093590()
{
  uint64_t result = sub_23309B190();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_23309362C()
{
  unint64_t result = qword_268758DF0;
  if (!qword_268758DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268758DF0);
  }
  return result;
}

uint64_t sub_233093680(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IndexedAnchor(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_2330936E4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_23309362C();
    unint64_t v7 = a3(a1, &type metadata for IndexedAnchor.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for IndexedAnchor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x233093814);
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

ValueMetadata *type metadata accessor for IndexedAnchor.CodingKeys()
{
  return &type metadata for IndexedAnchor.CodingKeys;
}

unint64_t sub_233093850()
{
  unint64_t result = qword_268758E10;
  if (!qword_268758E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268758E10);
  }
  return result;
}

unint64_t sub_2330938A8()
{
  unint64_t result = qword_268758E18;
  if (!qword_268758E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268758E18);
  }
  return result;
}

unint64_t sub_233093900()
{
  unint64_t result = qword_268758E20;
  if (!qword_268758E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268758E20);
  }
  return result;
}

uint64_t sub_233093954(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6F52726F68636E61 && a2 == 0xEB00000000444977;
  if (v2 || (sub_23309C220() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x61647055656D6974 && a2 == 0xEB00000000646574)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_23309C220();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t CompressionAlgorithm.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_23309C010();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t CompressionAlgorithm.rawValue.getter()
{
  return 4605252;
}

unint64_t sub_233093B10()
{
  unint64_t result = qword_268758E28;
  if (!qword_268758E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268758E28);
  }
  return result;
}

uint64_t sub_233093B64()
{
  return sub_23309C420();
}

uint64_t sub_233093BB0()
{
  return sub_23309B800();
}

uint64_t sub_233093BC0()
{
  return sub_23309C420();
}

uint64_t sub_233093C08@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_23309C010();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_233093C5C(void *a1@<X8>)
{
  *a1 = 4605252;
  a1[1] = 0xE300000000000000;
}

uint64_t sub_233093C70()
{
  return sub_23309B970();
}

uint64_t sub_233093CD0()
{
  return sub_23309B960();
}

unsigned char *storeEnumTagSinglePayload for CompressionAlgorithm(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x233093DBCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CompressionAlgorithm()
{
  return &type metadata for CompressionAlgorithm;
}

unint64_t sub_233093DF4()
{
  unint64_t result = qword_268758E30;
  if (!qword_268758E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268758E30);
  }
  return result;
}

uint64_t sub_233093E48()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[23];
  sub_2330999C8(0, &qword_268757058, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2330A1880;
  *(void *)(v4 + 32) = 0xD000000000000021;
  *(void *)(v4 + 40) = 0x80000002330B74A0;
  if (v2)
  {
    unint64_t v5 = 0xD000000000000024;
    char v6 = "https://smarthealth.cards#laboratory";
LABEL_7:
    unint64_t v7 = (unint64_t)(v6 - 32) | 0x8000000000000000;
    uint64_t v4 = (uint64_t)sub_232F3CCE0((void *)1, 2, 1, (void *)v4);
    *(void *)(v4 + 16) = 2;
    *(void *)(v4 + 48) = v5;
    *(void *)(v4 + 56) = v7;
    return v4;
  }
  if (v3)
  {
    unint64_t v5 = 0xD000000000000026;
    char v6 = "https://smarthealth.cards#immunization";
    goto LABEL_7;
  }
  if (v1)
  {
    unint64_t v5 = 0xD000000000000022;
    char v6 = "https://smarthealth.cards#recovery";
    goto LABEL_7;
  }
  return v4;
}

id sub_233093F3C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v50 = a2;
  unint64_t v51 = a3;
  uint64_t v45 = a1;
  uint64_t v5 = sub_23309B300();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v55 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23309B190();
  uint64_t v53 = *(void *)(v7 - 8);
  uint64_t v54 = v7;
  MEMORY[0x270FA5388](v7);
  id v52 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23309B1F0();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v48 = (void (*)(uint64_t))MEMORY[0x263F06EA8];
  uint64_t v49 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_233098A0C(0, (unint64_t *)&qword_268756520, MEMORY[0x263F06EA8]);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v47 = (uint64_t)&v44 - v12;
  long long v13 = v3[1];
  long long v85 = *v3;
  long long v86 = v13;
  long long v87 = v3[2];
  uint64_t v14 = *((void *)v3 + 7);
  uint64_t v88 = *((void *)v3 + 6);
  unint64_t v15 = *((void *)v3 + 8);
  long long v16 = *(long long *)((char *)v3 + 184);
  long long v81 = *(long long *)((char *)v3 + 168);
  long long v82 = v16;
  long long v83 = *(long long *)((char *)v3 + 200);
  uint64_t v84 = *((void *)v3 + 27);
  long long v17 = *(long long *)((char *)v3 + 120);
  long long v77 = *(long long *)((char *)v3 + 104);
  long long v78 = v17;
  long long v18 = *(long long *)((char *)v3 + 152);
  long long v79 = *(long long *)((char *)v3 + 136);
  long long v80 = v18;
  long long v19 = *(long long *)((char *)v3 + 88);
  long long v75 = *(long long *)((char *)v3 + 72);
  long long v76 = v19;
  uint64_t v20 = type metadata accessor for ExtractionContext();
  uint64_t v21 = v20;
  if (*(void *)(a1 + *(int *)(v20 + 40))) {
    uint64_t v22 = *(void *)(a1 + *(int *)(v20 + 40));
  }
  else {
    uint64_t v22 = MEMORY[0x263F8EE80];
  }
  uint64_t v23 = sub_23309B710();
  uint64_t v25 = v24;
  *((void *)&v57 + 1) = MEMORY[0x263F8D310];
  *(void *)&long long v56 = v14;
  *((void *)&v56 + 1) = v15;
  sub_232F3A680(&v56, &v73);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v72 = v22;
  uint64_t v27 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v73, v74);
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (uint64_t *)((char *)&v44 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v30 + 16))(v29);
  sub_23301B4D0(*v29, v29[1], v23, v25, isUniquelyReferenced_nonNull_native, &v72);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v73);
  uint64_t v46 = v72;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v31 = v45;
  uint64_t v32 = v47;
  sub_23309995C(v45 + *(int *)(v21 + 32), v47, (unint64_t *)&qword_268756520, v48);
  uint64_t v34 = v50;
  unint64_t v33 = v51;
  sub_232E9A9F4(v50, v51);
  uint64_t v48 = (void (*)(uint64_t))sub_233098AC8(v14, v15);
  uint64_t v36 = v35;
  long long v56 = v85;
  long long v57 = v86;
  long long v58 = v87;
  long long v68 = v81;
  long long v69 = v82;
  long long v70 = v83;
  long long v64 = v77;
  long long v65 = v78;
  long long v66 = v79;
  long long v67 = v80;
  long long v62 = v75;
  uint64_t v59 = v88;
  uint64_t v60 = v14;
  unint64_t v61 = v15;
  uint64_t v71 = v84;
  long long v63 = v76;
  uint64_t v37 = sub_233093E48();
  uint64_t v38 = (uint64_t)v49;
  sub_23309B1E0();
  uint64_t v39 = (uint64_t)v52;
  (*(void (**)(char *, uint64_t, uint64_t))(v53 + 16))(v52, v31 + *(int *)(v21 + 28), v54);
  uint64_t v40 = (uint64_t)v55;
  sub_23309B2F0();
  id v41 = objc_allocWithZone(MEMORY[0x263F45C28]);
  id v42 = sub_233098B78(v34, v33, 2, v32, (uint64_t)v48, v36, v37, v38, v46, v39, v40, 0);
  sub_232E9AA4C(v34, v33);
  return v42;
}

uint64_t sub_2330943F8(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 432) = a1;
  *(void *)(v3 + 440) = a2;
  sub_233098A0C(0, &qword_268757C70, MEMORY[0x263F07490]);
  *(void *)(v3 + 448) = swift_task_alloc();
  sub_233098A0C(0, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690]);
  *(void *)(v3 + 456) = swift_task_alloc();
  uint64_t v4 = sub_23309B190();
  *(void *)(v3 + 464) = v4;
  *(void *)(v3 + 472) = *(void *)(v4 - 8);
  *(void *)(v3 + 480) = swift_task_alloc();
  *(void *)(v3 + 488) = swift_task_alloc();
  *(void *)(v3 + 496) = swift_task_alloc();
  *(void *)(v3 + 504) = swift_task_alloc();
  *(void *)(v3 + 512) = swift_task_alloc();
  *(void *)(v3 + 520) = type metadata accessor for RecordExtractionContext();
  *(void *)(v3 + 528) = swift_task_alloc();
  *(void *)(v3 + 536) = swift_task_alloc();
  uint64_t v5 = sub_23309B1F0();
  *(void *)(v3 + 544) = v5;
  *(void *)(v3 + 552) = *(void *)(v5 - 8);
  *(void *)(v3 + 560) = swift_task_alloc();
  long long v6 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v3 + 376) = *(_OWORD *)v2;
  *(_OWORD *)(v3 + 392) = v6;
  *(_OWORD *)(v3 + 408) = *(_OWORD *)(v2 + 32);
  uint64_t v7 = *(void *)(v2 + 56);
  *(void *)(v3 + 424) = *(void *)(v2 + 48);
  *(void *)(v3 + 568) = v7;
  *(void *)(v3 + 576) = *(void *)(v2 + 64);
  *(_OWORD *)(v3 + 584) = *(_OWORD *)(v2 + 72);
  long long v8 = *(_OWORD *)(v2 + 88);
  long long v9 = *(_OWORD *)(v2 + 104);
  long long v10 = *(_OWORD *)(v2 + 136);
  long long v11 = *(_OWORD *)(v2 + 152);
  *(_OWORD *)(v3 + 272) = *(_OWORD *)(v2 + 120);
  *(_OWORD *)(v3 + 288) = v10;
  *(_OWORD *)(v3 + 240) = v8;
  *(_OWORD *)(v3 + 256) = v9;
  long long v12 = *(_OWORD *)(v2 + 168);
  long long v13 = *(_OWORD *)(v2 + 184);
  long long v14 = *(_OWORD *)(v2 + 200);
  *(void *)(v3 + 368) = *(void *)(v2 + 216);
  *(_OWORD *)(v3 + 336) = v13;
  *(_OWORD *)(v3 + 352) = v14;
  *(_OWORD *)(v3 + 304) = v11;
  *(_OWORD *)(v3 + 320) = v12;
  return MEMORY[0x270FA2498](sub_23309468C, 0, 0);
}

uint64_t sub_23309468C()
{
  id v1 = objc_msgSend(*(id *)(v0 + 432), sel_credentialTypes);
  uint64_t v2 = sub_23309B9A0();

  uint64_t v3 = *(void *)(v2 + 16);
  swift_bridgeObjectRelease();
  if (v3)
  {
    uint64_t v4 = *(void *)(v0 + 592);
    uint64_t v5 = *(void *)(v0 + 584);
    uint64_t v28 = *(void *)(v0 + 576);
    uint64_t v6 = *(void *)(v0 + 560);
    uint64_t v7 = *(void *)(v0 + 552);
    uint64_t v8 = *(void *)(v0 + 544);
    long long v9 = *(void **)(v0 + 536);
    uint64_t v25 = *(void *)(v0 + 520);
    uint64_t v26 = *(void *)(v0 + 440);
    uint64_t v27 = *(void *)(v0 + 568);
    id v10 = objc_msgSend(*(id *)(v0 + 432), sel_syncIdentifier);
    sub_23309B1D0();

    id v11 = objc_allocWithZone(MEMORY[0x263F0A4D8]);
    long long v12 = (void *)sub_23309B1C0();
    id v13 = objc_msgSend(v11, sel_initWithSignedClinicalDataRecordIdentifier_, v12);
    *(void *)(v0 + 600) = v13;

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    sub_233098A60(v26, (uint64_t)v9 + *(int *)(v25 + 20), (uint64_t (*)(void))type metadata accessor for ExtractionContext);
    void *v9 = v13;
    long long v14 = *(_OWORD *)(v0 + 392);
    *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 376);
    *(_OWORD *)(v0 + 32) = v14;
    *(_OWORD *)(v0 + 48) = *(_OWORD *)(v0 + 408);
    *(void *)(v0 + 64) = *(void *)(v0 + 424);
    *(void *)(v0 + 72) = v27;
    *(void *)(v0 + 80) = v28;
    *(void *)(v0 + 88) = v5;
    *(void *)(v0 + 96) = v4;
    *(void *)(v0 + 232) = *(void *)(v0 + 368);
    long long v15 = *(_OWORD *)(v0 + 336);
    *(_OWORD *)(v0 + 216) = *(_OWORD *)(v0 + 352);
    *(_OWORD *)(v0 + 200) = v15;
    long long v16 = *(_OWORD *)(v0 + 304);
    *(_OWORD *)(v0 + 184) = *(_OWORD *)(v0 + 320);
    *(_OWORD *)(v0 + 168) = v16;
    long long v17 = *(_OWORD *)(v0 + 272);
    *(_OWORD *)(v0 + 152) = *(_OWORD *)(v0 + 288);
    *(_OWORD *)(v0 + 136) = v17;
    long long v18 = *(_OWORD *)(v0 + 240);
    *(_OWORD *)(v0 + 120) = *(_OWORD *)(v0 + 256);
    *(_OWORD *)(v0 + 104) = v18;
    id v19 = v13;
    uint64_t v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 608) = v20;
    void *v20 = v0;
    v20[1] = sub_2330949B0;
    uint64_t v21 = *(void *)(v0 + 536);
    return sub_23309598C(v21);
  }
  else
  {
    sub_232FDB618();
    swift_allocError();
    *uint64_t v23 = 0;
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
    uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
    return v24();
  }
}

uint64_t sub_2330949B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[77] = a1;
  v4[78] = a2;
  v4[79] = v2;
  swift_task_dealloc();
  if (v2) {
    uint64_t v5 = sub_23309588C;
  }
  else {
    uint64_t v5 = sub_233094ACC;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_233094ACC()
{
  id v1 = v0;
  unint64_t v2 = v0[77];
  if (v2 >> 62)
  {
    while (1)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_23309BF80();
      swift_bridgeObjectRelease();
      if (!v3) {
        goto LABEL_74;
      }
      swift_bridgeObjectRetain();
      int64_t v4 = sub_23309BF80();
      swift_bridgeObjectRelease();
      if (v4) {
        break;
      }
      uint64_t v118 = (void *)v3;
      unint64_t v6 = v2 & 0xC000000000000001;
      uint64_t v115 = MEMORY[0x263F8EE78];
      uint64_t v111 = MEMORY[0x263F8EE78];
LABEL_52:
      uint64_t v40 = v1[77];
      uint64_t v41 = v1[59];
      sub_23309B090();
      uint64_t v117 = v40 + 32;
      uint64_t v125 = (void (**)(uint64_t, uint64_t))(v41 + 8);
      swift_bridgeObjectRetain();
      id v42 = 0;
      unint64_t v43 = &selRef_setMedicalRecordMetadata_;
      uint64_t v44 = &off_264BDA000;
      uint64_t v120 = (void (**)(unint64_t, unint64_t, uint64_t))(v41 + 32);
      unint64_t v122 = v6;
      if (!v6)
      {
LABEL_56:
        id v45 = *(id *)(v117 + 8 * (void)v42);
        goto LABEL_57;
      }
      while (1)
      {
        id v45 = (id)MEMORY[0x237DB5EA0](v42, v1[77]);
LABEL_57:
        uint64_t v46 = v45;
        id v1 = v42 + 1;
        if (__OFADD__(v42, 1)) {
          break;
        }
        uint64_t v129 = v42;
        uint64_t v47 = v126[61];
        uint64_t v48 = v126[58];
        id v49 = [v45 v43[114]];
        id v50 = [v49 (SEL)v44[170]];

        sub_23309B160();
        char v51 = sub_23309B140();
        id v52 = v43;
        uint64_t v53 = *v125;
        (*v125)(v47, v48);
        unint64_t v54 = v126[62];
        unint64_t v2 = v126[63];
        uint64_t v55 = v126[58];
        long long v56 = v53;
        if (v51)
        {
          long long v57 = *v120;
          (*v120)(v54, v2, v55);
          v57(v2, v54, v55);
        }
        else
        {
          v53(v126[63], v126[58]);
          id v58 = [v46 (SEL)v52 + 2687];
          id v59 = objc_msgSend(v58, sel_date);

          sub_23309B160();
          long long v57 = *v120;
          (*v120)(v2, v54, v55);
        }

        unint64_t v43 = v52;
        if (v1 == v118)
        {
          id v1 = v126;
          uint64_t v60 = v126[79];
          unint64_t v62 = v126[63];
          unint64_t v61 = v126[64];
          uint64_t v63 = v126[58];
          swift_bridgeObjectRelease();
          v57(v61, v62, v63);
          uint64_t v64 = sub_233097634();
          long long v65 = (void *)v126[75];
          if (v60)
          {
            uint64_t v66 = v126[67];
            uint64_t v67 = v126[64];
            uint64_t v68 = v126[58];
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            v56(v67, v68);
            uint64_t v69 = v66;
            goto LABEL_75;
          }
          uint64_t v113 = (void *)v126[75];
          uint64_t v102 = v126[71];
          unint64_t v104 = v126[72];
          __int16 v108 = (void *)v64;
          uint64_t v70 = v126[67];
          uint64_t v107 = v70;
          uint64_t v71 = (id *)v126[66];
          unint64_t v106 = v71;
          uint64_t v72 = v126[64];
          uint64_t v110 = v72;
          uint64_t v73 = v126[61];
          uint64_t v74 = v126[59];
          uint64_t v75 = v126[57];
          uint64_t v123 = v126[58];
          uint64_t v127 = v126[60];
          id v130 = (id)v1[56];
          long long v76 = (void *)v1[54];
          sub_232F3A800(0, &qword_268757C78);
          sub_233098A60(v70, (uint64_t)v71, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
          uint64_t v77 = sub_23309B230();
          uint64_t v78 = v75;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v75, 1, 1, v77);
          id v79 = objc_msgSend(v76, sel_credentialTypes);
          uint64_t v101 = sub_23309B9A0();

          uint64_t v80 = sub_233098AC8(v102, v104);
          uint64_t v103 = v81;
          uint64_t v105 = v80;
          sub_23309B150();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v74 + 16))(v127, v72, v123);
          sub_23309B150();
          (*(void (**)(id, void, uint64_t, uint64_t))(v74 + 56))(v130, 0, 1, v123);
          id v82 = objc_msgSend(v76, sel_signatureStatus);
          id v109 = v108;
          id v83 = sub_23301FB04(v71, v78, 0, 0, v101, v105, v103, v73, v127, (uint64_t)v130, (uint64_t)v82, (uint64_t)v109, v111, 0, 0xF000000000000000, (uint64_t)objc_msgSend(v76, sel_sourceType));

          sub_232F3A800(0, &qword_268757C58);
          sub_233098A60(v107, (uint64_t)v106, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
          id v84 = v83;
          id v85 = objc_msgSend(v76, sel_rawContent);
          long long v86 = (void *)sub_23309B030();
          uint64_t v88 = v87;

          uint64_t v89 = (void *)sub_233021124(v106, v84, v115, v86, v88);
          sub_232E9AA4C((uint64_t)v86, (unint64_t)v88);

          id v90 = objc_allocWithZone(MEMORY[0x263F45D10]);
          sub_232F3A800(0, &qword_268757008);
          id v91 = v76;
          id v92 = (void *)sub_23309B990();
          swift_bridgeObjectRelease();
          sub_232F3A800(0, &qword_268757C60);
          id v93 = (void *)sub_23309B990();
          swift_bridgeObjectRelease();
          id v94 = objc_msgSend(v90, sel_initWithOriginalRecord_mainRecord_verifiableClinicalRecord_medicalRecords_clinicalRecords_, v91, v84, v89, v92, v93);

          v56(v110, v123);
          sub_2330202A4(v107);
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
          unint64_t v95 = (uint64_t (*)(id))v1[1];
          return v95(v94);
        }
        id v1 = v126;
        id v42 = v129 + 1;
        uint64_t v44 = &off_264BDA000;
        if (!v122) {
          goto LABEL_56;
        }
      }
LABEL_69:
      __break(1u);
    }
    uint64_t v131 = MEMORY[0x263F8EE78];
    sub_23309BF20();
    if (v4 < 0)
    {
      __break(1u);
      goto LABEL_74;
    }
LABEL_4:
    uint64_t v5 = 0;
    unint64_t v6 = v2 & 0xC000000000000001;
    uint64_t v116 = v1[77] + 32;
    uint64_t v118 = (void *)v3;
    do
    {
      if (v6) {
        id v7 = (id)MEMORY[0x237DB5EA0](v5, v1[77]);
      }
      else {
        id v7 = *(id *)(v116 + 8 * v5);
      }
      uint64_t v8 = v7;
      ++v5;
      unint64_t v2 = (unint64_t)objc_msgSend(v7, sel_asSignedClinicalDataItem);

      sub_23309BF00();
      sub_23309BF30();
      sub_23309BF40();
      sub_23309BF10();
    }
    while (v4 != v5);
    uint64_t v111 = v131;
    uint64_t v132 = MEMORY[0x263F8EE78];
    sub_232F39748(0, v4, 0);
    uint64_t v9 = 0;
    uint64_t v10 = v132;
    unint64_t v121 = v6;
    int64_t v112 = v4;
    while (1)
    {
      if (v9 == v4)
      {
LABEL_68:
        __break(1u);
        goto LABEL_69;
      }
      uint64_t v124 = v9;
      if (v6) {
        id v11 = (id)MEMORY[0x237DB5EA0]();
      }
      else {
        id v11 = *(id *)(v116 + 8 * v9);
      }
      long long v12 = v11;
      unint64_t v2 = (unint64_t)objc_msgSend(v11, sel_primaryConcept);
      id v13 = objc_msgSend((id)v2, sel_localizedPreferredName);

      if (v13)
      {
        uint64_t v14 = sub_23309B710();
        unint64_t v16 = v15;

        uint64_t v17 = HIBYTE(v16) & 0xF;
        if ((v16 & 0x2000000000000000) == 0) {
          uint64_t v17 = v14 & 0xFFFFFFFFFFFFLL;
        }
        if (v17)
        {

          goto LABEL_48;
        }
        swift_bridgeObjectRelease();
      }
      uint64_t v119 = v12;
      id v18 = objc_msgSend(v12, sel_medicalRecordCodings);
      sub_232F3A800(0, (unint64_t *)&qword_268757138);
      unint64_t v19 = sub_23309B9A0();

      if (v19 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v20 = sub_23309BF80();
        if (v20)
        {
LABEL_22:
          uint64_t v114 = v10;
          id v128 = self;
          uint64_t v21 = 0;
          while (1)
          {
            id v22 = (v19 & 0xC000000000000001) != 0
                ? (id)MEMORY[0x237DB5EA0](v21, v19)
                : *(id *)(v19 + 8 * v21 + 32);
            uint64_t v23 = v22;
            uint64_t v24 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              break;
            }
            id v25 = objc_msgSend(v22, sel_codingSystem);
            unint64_t v2 = (unint64_t)objc_msgSend(v128, sel_textSystem);
            if (v25)
            {
              id v1 = (void *)v20;
              sub_232F3A800(0, &qword_268757C68);
              id v26 = v25;
              char v27 = sub_23309BBF0();

              if (v27)
              {
                swift_bridgeObjectRelease_n();
                id v28 = objc_msgSend(v23, sel_displayString);

                if (v28)
                {
                  uint64_t v14 = sub_23309B710();
                  unint64_t v16 = v29;

                  goto LABEL_36;
                }
LABEL_33:
                uint64_t v14 = 0;
                unint64_t v16 = 0xE000000000000000;
LABEL_36:
                id v1 = v126;
                int64_t v4 = v112;
                uint64_t v10 = v114;
                unint64_t v6 = v121;
                goto LABEL_39;
              }
              unint64_t v2 = (unint64_t)v23;
              uint64_t v20 = (uint64_t)v1;
            }
            else
            {
            }
            ++v21;
            if (v24 == v20)
            {
              swift_bridgeObjectRelease_n();
              goto LABEL_33;
            }
          }
          __break(1u);
          goto LABEL_68;
        }
      }
      else
      {
        uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v20) {
          goto LABEL_22;
        }
      }
      swift_bridgeObjectRelease_n();
      uint64_t v14 = 0;
      unint64_t v16 = 0xE000000000000000;
LABEL_39:
      uint64_t v30 = HIBYTE(v16) & 0xF;
      if ((v16 & 0x2000000000000000) == 0) {
        uint64_t v30 = v14 & 0xFFFFFFFFFFFFLL;
      }
      if (!v30)
      {
        swift_bridgeObjectRelease();
        uint64_t v31 = sub_233086744();
        unint64_t v16 = v32;
        uint64_t v33 = HIBYTE(v32) & 0xF;
        if ((v32 & 0x2000000000000000) == 0) {
          uint64_t v33 = v31 & 0xFFFFFFFFFFFFLL;
        }
        if (v33)
        {
          uint64_t v14 = v31;
        }
        else
        {
          swift_bridgeObjectRelease();
          id v34 = objc_msgSend(v119, sel_fallbackDisplayString);
          uint64_t v14 = sub_23309B710();
          unint64_t v16 = v35;
        }
      }

LABEL_48:
      unint64_t v37 = *(void *)(v10 + 16);
      unint64_t v36 = *(void *)(v10 + 24);
      unint64_t v2 = v37 + 1;
      uint64_t v38 = v124;
      if (v37 >= v36 >> 1)
      {
        sub_232F39748(v36 > 1, v37 + 1, 1);
        uint64_t v38 = v124;
      }
      uint64_t v9 = v38 + 1;
      *(void *)(v10 + 16) = v2;
      unint64_t v39 = v10 + 16 * v37;
      *(void *)(v39 + 32) = v14;
      *(void *)(v39 + 40) = v16;
      if (v9 == v4)
      {
        uint64_t v115 = v10;
        goto LABEL_52;
      }
    }
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    uint64_t v131 = MEMORY[0x263F8EE78];
    sub_23309BF20();
    int64_t v4 = v3;
    goto LABEL_4;
  }
LABEL_74:
  uint64_t v97 = (void *)v1[75];
  uint64_t v98 = v1[67];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_232FDB618();
  swift_allocError();
  unsigned char *v99 = 1;
  swift_willThrow();

  uint64_t v69 = v98;
LABEL_75:
  sub_2330202A4(v69);
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
  uint64_t v100 = (uint64_t (*)(void))v1[1];
  return v100();
}

uint64_t sub_23309588C()
{
  uint64_t v1 = *(void *)(v0 + 536);

  sub_2330202A4(v1);
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
  unint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_23309598C(uint64_t a1)
{
  *(void *)(v2 + 136) = a1;
  sub_233098E14();
  *(void *)(v2 + 144) = v3;
  *(void *)(v2 + 152) = *(void *)(v3 - 8);
  *(void *)(v2 + 160) = swift_task_alloc();
  sub_233098F3C();
  *(void *)(v2 + 168) = v4;
  *(void *)(v2 + 176) = *(void *)(v4 - 8);
  *(void *)(v2 + 184) = swift_task_alloc();
  *(void *)(v2 + 192) = swift_task_alloc();
  sub_233099010();
  *(void *)(v2 + 200) = v5;
  *(void *)(v2 + 208) = *(void *)(v5 - 8);
  *(void *)(v2 + 216) = swift_task_alloc();
  sub_2330991C4();
  *(void *)(v2 + 224) = v6;
  *(void *)(v2 + 232) = *(void *)(v6 - 8);
  *(void *)(v2 + 240) = swift_task_alloc();
  *(void *)(v2 + 248) = swift_task_alloc();
  sub_233099298();
  *(void *)(v2 + 256) = v7;
  *(void *)(v2 + 264) = *(void *)(v7 - 8);
  *(void *)(v2 + 272) = swift_task_alloc();
  uint64_t v8 = *(void *)(type metadata accessor for RecordExtractionContext() - 8);
  *(void *)(v2 + 280) = v8;
  *(void *)(v2 + 288) = *(void *)(v8 + 64);
  *(void *)(v2 + 296) = swift_task_alloc();
  sub_2330993C0();
  *(void *)(v2 + 304) = v9;
  *(void *)(v2 + 312) = *(void *)(v9 - 8);
  *(void *)(v2 + 320) = swift_task_alloc();
  *(void *)(v2 + 328) = swift_task_alloc();
  *(_OWORD *)(v2 + 336) = *(_OWORD *)(v1 + 168);
  *(void *)(v2 + 352) = *(void *)(v1 + 184);
  return MEMORY[0x270FA2498](sub_233095CB8, 0, 0);
}

uint64_t sub_233095CB8()
{
  uint64_t v1 = v0[43];
  if (v1)
  {
    uint64_t v2 = v0[41];
    uint64_t v3 = v0[39];
    uint64_t v37 = v0[38];
    uint64_t v40 = v0[40];
    uint64_t v4 = v0[37];
    uint64_t v5 = v0[35];
    unint64_t v43 = v0 + 2;
    sub_233098A60(v0[17], v4, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
    unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v7 = swift_allocObject();
    sub_23306DA38(v4, v7 + v6);
    v0[13] = v1;
    sub_2330999C8(0, &qword_268757E90, (uint64_t)&type metadata for SignedClinicalDataEUDCCEntry.Laboratory, MEMORY[0x263F8D488]);
    sub_23304079C();
    sub_2330990E4(&qword_268758E98, &qword_268757E90, (uint64_t)&type metadata for SignedClinicalDataEUDCCEntry.Laboratory, (void (*)(void))sub_23309936C);
    swift_bridgeObjectRetain();
    sub_23309C2F0();
    uint64_t v8 = MEMORY[0x263F8EE78];
    v0[14] = MEMORY[0x263F8EE78];
    v0[15] = v8;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v40, v2, v37);
    sub_233099914(&qword_268758F00, (void (*)(uint64_t))sub_2330993C0);
    sub_23309BAE0();
    uint64_t v9 = sub_233099914(&qword_268758F08, (void (*)(uint64_t))sub_233099298);
    uint64_t v10 = (void *)swift_task_alloc();
    v0[45] = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_233096528;
    uint64_t v11 = v0[32];
LABEL_7:
    return MEMORY[0x270FA1E80](v43, v11, v9);
  }
  uint64_t v12 = v0[44];
  if (v12)
  {
    uint64_t v13 = v0[37];
    uint64_t v14 = v0[35];
    uint64_t v15 = v0[31];
    uint64_t v16 = v0[29];
    uint64_t v38 = v0[28];
    uint64_t v41 = v0[30];
    unint64_t v43 = v0 + 4;
    sub_233098A60(v0[17], v13, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
    unint64_t v17 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    uint64_t v18 = swift_allocObject();
    sub_23306DA38(v13, v18 + v17);
    v0[9] = v12;
    sub_2330999C8(0, &qword_268757EA8, (uint64_t)&type metadata for SignedClinicalDataEUDCCEntry.Vaccination, MEMORY[0x263F8D488]);
    sub_23304079C();
    sub_2330990E4(&qword_268758E78, &qword_268757EA8, (uint64_t)&type metadata for SignedClinicalDataEUDCCEntry.Vaccination, (void (*)(void))sub_233099170);
    swift_bridgeObjectRetain();
    sub_23309C2F0();
    uint64_t v19 = MEMORY[0x263F8EE78];
    v0[10] = MEMORY[0x263F8EE78];
    v0[16] = v19;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v41, v15, v38);
    sub_233099914(&qword_268758EE0, (void (*)(uint64_t))sub_2330991C4);
    sub_23309BAE0();
    uint64_t v9 = sub_233099914(&qword_268758EE8, (void (*)(uint64_t))sub_233099010);
    uint64_t v20 = (void *)swift_task_alloc();
    v0[47] = v20;
    void *v20 = v0;
    v20[1] = sub_233096AD4;
    uint64_t v11 = v0[25];
    goto LABEL_7;
  }
  uint64_t v21 = v0[42];
  if (v21)
  {
    uint64_t v22 = v0[37];
    uint64_t v23 = v0[35];
    uint64_t v24 = v0[24];
    uint64_t v25 = v0[22];
    uint64_t v39 = v0[21];
    uint64_t v42 = v0[23];
    unint64_t v43 = v0 + 6;
    sub_233098A60(v0[17], v22, (uint64_t (*)(void))type metadata accessor for RecordExtractionContext);
    unint64_t v26 = (*(unsigned __int8 *)(v23 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
    uint64_t v27 = swift_allocObject();
    sub_23306DA38(v22, v27 + v26);
    v0[11] = v21;
    sub_2330999C8(0, &qword_268757E78, (uint64_t)&type metadata for SignedClinicalDataEUDCCEntry.Recovery, MEMORY[0x263F8D488]);
    sub_23304079C();
    sub_2330990E4(&qword_268758E58, &qword_268757E78, (uint64_t)&type metadata for SignedClinicalDataEUDCCEntry.Recovery, (void (*)(void))sub_233098EE8);
    swift_bridgeObjectRetain();
    sub_23309C2F0();
    uint64_t v28 = MEMORY[0x263F8EE78];
    v0[12] = MEMORY[0x263F8EE78];
    v0[8] = v28;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v42, v24, v39);
    sub_233099914(&qword_268758EC0, (void (*)(uint64_t))sub_233098F3C);
    sub_23309BAE0();
    uint64_t v9 = sub_233099914(&qword_268758EC8, (void (*)(uint64_t))sub_233098E14);
    unint64_t v29 = (void *)swift_task_alloc();
    v0[49] = v29;
    *unint64_t v29 = v0;
    v29[1] = sub_233097084;
    uint64_t v11 = v0[18];
    goto LABEL_7;
  }
  if (qword_2687563A0 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_23309B4B0();
  __swift_project_value_buffer(v30, (uint64_t)qword_268770F68);
  uint64_t v31 = sub_23309B4A0();
  os_log_type_t v32 = sub_23309BB80();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl(&dword_232E63000, v31, v32, "SignedClinicalDataEUDCC.extractMedicalAndClinicalRecords: no certificates found in EU-DCC hcert", v33, 2u);
    MEMORY[0x237DB6EC0](v33, -1, -1);
  }

  sub_232FDB618();
  swift_allocError();
  *id v34 = 3;
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
  unint64_t v35 = (uint64_t (*)(void))v0[1];
  return v35();
}

uint64_t sub_233096528()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 368) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[33];
    uint64_t v3 = v2[34];
    uint64_t v5 = v2[32];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    unint64_t v6 = sub_2330969D0;
  }
  else
  {
    unint64_t v6 = sub_233096674;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_233096674()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    uint64_t v2 = *(void **)(v0 + 24);
    id v3 = v1;
    MEMORY[0x237DB59C0]();
    if (*(void *)((*(void *)(v0 + 112) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v0 + 112) & 0xFFFFFFFFFFFFFF8)
                                                                                        + 0x18) >> 1)
      sub_23309B9D0();
    sub_23309B9E0();
    sub_23309B9C0();
    id v4 = v2;
    MEMORY[0x237DB59C0]();
    if (*(void *)(*(void *)(v0 + 120) + 16) >= *(void *)(*(void *)(v0 + 120) + 24) >> 1) {
      sub_23309B9D0();
    }
    sub_23309B9E0();
    sub_23309B9C0();

    uint64_t v5 = sub_233099914(&qword_268758F08, (void (*)(uint64_t))sub_233099298);
    unint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 360) = v6;
    void *v6 = v0;
    v6[1] = sub_233096528;
    uint64_t v7 = *(void *)(v0 + 256);
    return MEMORY[0x270FA1E80](v0 + 16, v7, v5);
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 328);
    uint64_t v10 = *(void *)(v0 + 304);
    uint64_t v9 = *(void *)(v0 + 312);
    (*(void (**)(void, void))(*(void *)(v0 + 264) + 8))(*(void *)(v0 + 272), *(void *)(v0 + 256));
    sub_233040D58(*(void **)(v0 + 16), *(void **)(v0 + 24));
    uint64_t v11 = *(void *)(v0 + 120);
    uint64_t v19 = *(void *)(v0 + 112);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    uint64_t v12 = MEMORY[0x263F8EE78];
    uint64_t v20 = MEMORY[0x263F8EE78];
    uint64_t v13 = *(void *)(v11 + 16);
    if (v13)
    {
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v13; ++i)
      {
        uint64_t v15 = *(void **)(v11 + 8 * i + 32);
        if (v15)
        {
          id v16 = v15;
          MEMORY[0x237DB59C0]();
          if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_23309B9D0();
          }
          sub_23309B9E0();
          sub_23309B9C0();
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v12 = v20;
    }
    swift_bridgeObjectRelease();
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
    unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    return v17(v19, v12);
  }
}

uint64_t sub_2330969D0()
{
  (*(void (**)(void, void))(v0[39] + 8))(v0[41], v0[38]);
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
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_233096AD4()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 384) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[26];
    uint64_t v3 = v2[27];
    uint64_t v5 = v2[25];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    unint64_t v6 = sub_233096F80;
  }
  else
  {
    unint64_t v6 = sub_233096C20;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_233096C20()
{
  uint64_t v1 = *(void **)(v0 + 32);
  if (v1)
  {
    uint64_t v2 = *(void **)(v0 + 40);
    id v3 = v1;
    MEMORY[0x237DB59C0]();
    if (*(void *)((*(void *)(v0 + 80) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v0 + 80) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_23309B9D0();
    sub_23309B9E0();
    sub_23309B9C0();
    id v4 = v2;
    MEMORY[0x237DB59C0]();
    if (*(void *)(*(void *)(v0 + 128) + 16) >= *(void *)(*(void *)(v0 + 128) + 24) >> 1) {
      sub_23309B9D0();
    }
    sub_23309B9E0();
    sub_23309B9C0();

    uint64_t v5 = sub_233099914(&qword_268758EE8, (void (*)(uint64_t))sub_233099010);
    unint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 376) = v6;
    void *v6 = v0;
    v6[1] = sub_233096AD4;
    uint64_t v7 = *(void *)(v0 + 200);
    return MEMORY[0x270FA1E80](v0 + 32, v7, v5);
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 248);
    uint64_t v10 = *(void *)(v0 + 224);
    uint64_t v9 = *(void *)(v0 + 232);
    (*(void (**)(void, void))(*(void *)(v0 + 208) + 8))(*(void *)(v0 + 216), *(void *)(v0 + 200));
    sub_233040D58(*(void **)(v0 + 32), *(void **)(v0 + 40));
    uint64_t v19 = *(void *)(v0 + 80);
    uint64_t v11 = *(void *)(v0 + 128);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    uint64_t v12 = MEMORY[0x263F8EE78];
    uint64_t v20 = MEMORY[0x263F8EE78];
    uint64_t v13 = *(void *)(v11 + 16);
    if (v13)
    {
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v13; ++i)
      {
        uint64_t v15 = *(void **)(v11 + 8 * i + 32);
        if (v15)
        {
          id v16 = v15;
          MEMORY[0x237DB59C0]();
          if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_23309B9D0();
          }
          sub_23309B9E0();
          sub_23309B9C0();
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v12 = v20;
    }
    swift_bridgeObjectRelease();
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
    unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    return v17(v19, v12);
  }
}

uint64_t sub_233096F80()
{
  (*(void (**)(void, void))(v0[29] + 8))(v0[31], v0[28]);
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
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_233097084()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 400) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[19];
    uint64_t v3 = v2[20];
    uint64_t v5 = v2[18];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    unint64_t v6 = sub_233097530;
  }
  else
  {
    unint64_t v6 = sub_2330971D0;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_2330971D0()
{
  uint64_t v1 = *(void **)(v0 + 48);
  if (v1)
  {
    uint64_t v2 = *(void **)(v0 + 56);
    id v3 = v1;
    MEMORY[0x237DB59C0]();
    if (*(void *)((*(void *)(v0 + 96) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v0 + 96) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_23309B9D0();
    sub_23309B9E0();
    sub_23309B9C0();
    id v4 = v2;
    MEMORY[0x237DB59C0]();
    if (*(void *)(*(void *)(v0 + 64) + 16) >= *(void *)(*(void *)(v0 + 64) + 24) >> 1) {
      sub_23309B9D0();
    }
    sub_23309B9E0();
    sub_23309B9C0();

    uint64_t v5 = sub_233099914(&qword_268758EC8, (void (*)(uint64_t))sub_233098E14);
    unint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 392) = v6;
    void *v6 = v0;
    v6[1] = sub_233097084;
    uint64_t v7 = *(void *)(v0 + 144);
    return MEMORY[0x270FA1E80](v0 + 48, v7, v5);
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 192);
    uint64_t v10 = *(void *)(v0 + 168);
    uint64_t v9 = *(void *)(v0 + 176);
    (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 160), *(void *)(v0 + 144));
    sub_233040D58(*(void **)(v0 + 48), *(void **)(v0 + 56));
    uint64_t v19 = *(void *)(v0 + 96);
    uint64_t v11 = *(void *)(v0 + 64);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    uint64_t v12 = MEMORY[0x263F8EE78];
    uint64_t v20 = MEMORY[0x263F8EE78];
    uint64_t v13 = *(void *)(v11 + 16);
    if (v13)
    {
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v13; ++i)
      {
        uint64_t v15 = *(void **)(v11 + 8 * i + 32);
        if (v15)
        {
          id v16 = v15;
          MEMORY[0x237DB59C0]();
          if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_23309B9D0();
          }
          sub_23309B9E0();
          sub_23309B9C0();
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v12 = v20;
    }
    swift_bridgeObjectRelease();
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
    unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    return v17(v19, v12);
  }
}

uint64_t sub_233097530()
{
  (*(void (**)(void, void))(v0[22] + 8))(v0[24], v0[21]);
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
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_233097634()
{
  sub_233098A0C(0, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690]);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v18 - v2;
  uint64_t v4 = *(void *)(v0 + 88);
  char v5 = *(unsigned char *)(v0 + 96);
  char v6 = *(unsigned char *)(v0 + 97);
  char v7 = *(unsigned char *)(v0 + 98);
  int v20 = *(unsigned __int8 *)(v0 + 99);
  uint64_t v9 = *(void *)(v0 + 128);
  uint64_t v8 = *(void *)(v0 + 136);
  uint64_t v10 = *(void *)(v0 + 160);
  uint64_t v21 = *(void *)(v0 + 104);
  long long v19 = *(_OWORD *)(v0 + 112);
  long long v22 = v19;
  uint64_t v23 = v9;
  uint64_t v24 = v8;
  long long v18 = *(_OWORD *)(v0 + 144);
  long long v25 = v18;
  uint64_t v26 = v10;
  uint64_t v11 = sub_23309B230();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v3, 1, 1, v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_233097874((uint64_t)v3);
  sub_232FE68D4((uint64_t)v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v21 = v4;
  LOBYTE(v22) = v5;
  BYTE1(v22) = v6;
  BYTE2(v22) = v7;
  BYTE3(v22) = v20;
  uint64_t v12 = v27;
  id v13 = FHIRDate.asMedicalDate()();
  if (v12) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v15 = v13;
  id v16 = (void *)sub_23309B6E0();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(self, sel_subjectWithFullName_birthDate_gender_emailAddresses_phoneNumbers_, v16, v15, 0, 0, 0);

  return (uint64_t)v17;
}

uint64_t sub_233097874(uint64_t a1)
{
  uint64_t v26 = a1;
  sub_233098A0C(0, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v23 - v3;
  uint64_t v5 = sub_23309B230();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  long long v25 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_23309AE30();
  uint64_t v27 = *(void *)(v8 - 8);
  uint64_t v28 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = v1[1];
  uint64_t v12 = v1[2];
  uint64_t v23 = v1[3];
  uint64_t v24 = v12;
  uint64_t v14 = v1[5];
  uint64_t v13 = v1[6];
  uint64_t v15 = v1[7];
  sub_23309AE20();
  if (!v14 && v15)
  {
    uint64_t v33 = v13;
    uint64_t v34 = v15;
    uint64_t v31 = 60;
    unint64_t v32 = 0xE100000000000000;
    uint64_t v29 = 32;
    unint64_t v30 = 0xE100000000000000;
    sub_232F379FC();
    sub_23309BD50();
  }
  swift_bridgeObjectRetain();
  sub_23309ADD0();
  if (!v11)
  {
    uint64_t v33 = v24;
    uint64_t v34 = v23;
    uint64_t v31 = 60;
    unint64_t v32 = 0xE100000000000000;
    uint64_t v29 = 32;
    unint64_t v30 = 0xE100000000000000;
    sub_232F379FC();
    sub_23309BD50();
  }
  swift_bridgeObjectRetain();
  sub_23309ADE0();
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A78]), sel_init);
  objc_msgSend(v16, sel_setStyle_, 0);
  sub_23309995C(v26, (uint64_t)v4, (unint64_t *)&qword_2687576B8, MEMORY[0x263F07690]);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_232FE68D4((uint64_t)v4);
  }
  else
  {
    id v17 = v25;
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v25, v4, v5);
    long long v18 = (void *)sub_23309B210();
    objc_msgSend(v16, sel_setLocale_, v18);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v17, v5);
  }
  long long v19 = (void *)sub_23309AE10();
  id v20 = objc_msgSend(v16, sel_stringFromPersonNameComponents_, v19);

  uint64_t v21 = sub_23309B710();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v28);
  return v21;
}

uint64_t sub_233097C8C(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  *(void *)(v3 + 344) = a2;
  *(void *)(v3 + 352) = a3;
  *(void *)(v3 + 336) = a1;
  long long v5 = a2[7];
  *(_OWORD *)(v3 + 112) = a2[6];
  *(_OWORD *)(v3 + 128) = v5;
  long long v6 = a2[9];
  *(_OWORD *)(v3 + 144) = a2[8];
  *(_OWORD *)(v3 + 160) = v6;
  long long v7 = a2[3];
  *(_OWORD *)(v3 + 48) = a2[2];
  *(_OWORD *)(v3 + 64) = v7;
  long long v8 = a2[5];
  *(_OWORD *)(v3 + 80) = a2[4];
  *(_OWORD *)(v3 + 96) = v8;
  long long v9 = a2[1];
  *(_OWORD *)(v3 + 16) = *a2;
  *(_OWORD *)(v3 + 32) = v9;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 360) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_233097D54;
  return sub_233005898(a3);
}

uint64_t sub_233097D54(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(*v2 + 368) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_233098038, 0, 0);
  }
  else
  {
    long long v6 = *(_OWORD **)(v4 + 344);
    *(void *)(v4 + 376) = a1;
    long long v7 = v6[1];
    *(_OWORD *)(v4 + 176) = *v6;
    *(_OWORD *)(v4 + 192) = v7;
    long long v8 = v6[6];
    long long v9 = v6[7];
    long long v10 = v6[9];
    *(_OWORD *)(v4 + 304) = v6[8];
    *(_OWORD *)(v4 + 320) = v10;
    *(_OWORD *)(v4 + 272) = v8;
    *(_OWORD *)(v4 + 288) = v9;
    long long v11 = v6[2];
    long long v12 = v6[3];
    long long v13 = v6[5];
    *(_OWORD *)(v4 + 240) = v6[4];
    *(_OWORD *)(v4 + 256) = v13;
    *(_OWORD *)(v4 + 208) = v11;
    *(_OWORD *)(v4 + 224) = v12;
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v4 + 384) = v14;
    *uint64_t v14 = v5;
    v14[1] = sub_233097F10;
    uint64_t v15 = *(void *)(v4 + 352);
    return sub_2330064C8(v15, a1);
  }
}

uint64_t sub_233097F10(uint64_t a1)
{
  *(void *)(*(void *)v1 + 392) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_233098010, 0, 0);
}

uint64_t sub_233098010()
{
  uint64_t v1 = *(void *)(v0 + 392);
  uint64_t v2 = *(void **)(v0 + 336);
  *uint64_t v2 = *(void *)(v0 + 376);
  v2[1] = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233098038()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233098050(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  *(void *)(v3 + 312) = a2;
  *(void *)(v3 + 320) = a3;
  *(void *)(v3 + 304) = a1;
  long long v5 = a2[7];
  *(_OWORD *)(v3 + 112) = a2[6];
  *(_OWORD *)(v3 + 128) = v5;
  *(_OWORD *)(v3 + 144) = a2[8];
  long long v6 = a2[3];
  *(_OWORD *)(v3 + 48) = a2[2];
  *(_OWORD *)(v3 + 64) = v6;
  long long v7 = a2[5];
  *(_OWORD *)(v3 + 80) = a2[4];
  *(_OWORD *)(v3 + 96) = v7;
  long long v8 = a2[1];
  *(_OWORD *)(v3 + 16) = *a2;
  *(_OWORD *)(v3 + 32) = v8;
  long long v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 328) = v9;
  void *v9 = v3;
  v9[1] = sub_233098118;
  return sub_233013AF8(a3);
}

uint64_t sub_233098118(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(*v2 + 336) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_2330983FC, 0, 0);
  }
  else
  {
    long long v6 = *(_OWORD **)(v4 + 312);
    *(void *)(v4 + 344) = a1;
    *(_OWORD *)(v4 + 160) = *v6;
    long long v7 = v6[5];
    long long v8 = v6[6];
    long long v9 = v6[8];
    *(_OWORD *)(v4 + 272) = v6[7];
    *(_OWORD *)(v4 + 288) = v9;
    *(_OWORD *)(v4 + 240) = v7;
    *(_OWORD *)(v4 + 256) = v8;
    long long v10 = v6[1];
    long long v11 = v6[2];
    long long v12 = v6[4];
    *(_OWORD *)(v4 + 208) = v6[3];
    *(_OWORD *)(v4 + 224) = v12;
    *(_OWORD *)(v4 + 176) = v10;
    *(_OWORD *)(v4 + 192) = v11;
    long long v13 = (void *)swift_task_alloc();
    *(void *)(v4 + 352) = v13;
    *long long v13 = v5;
    v13[1] = sub_2330982D4;
    uint64_t v14 = *(void *)(v4 + 320);
    return sub_2330142A0(v14, a1);
  }
}

uint64_t sub_2330982D4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 360) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2330983D4, 0, 0);
}

uint64_t sub_2330983D4()
{
  uint64_t v1 = *(void *)(v0 + 360);
  uint64_t v2 = *(void **)(v0 + 304);
  *uint64_t v2 = *(void *)(v0 + 344);
  v2[1] = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330983FC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233098414(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  v3[30] = a1;
  v3[31] = a3;
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  v3[32] = *a2;
  v3[33] = v6;
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3];
  v3[34] = v7;
  v3[35] = v8;
  uint64_t v9 = a2[4];
  uint64_t v10 = a2[5];
  v3[36] = v9;
  v3[37] = v10;
  uint64_t v11 = a2[6];
  uint64_t v12 = a2[7];
  v3[38] = v11;
  v3[39] = v12;
  uint64_t v13 = a2[8];
  uint64_t v14 = a2[9];
  v3[40] = v13;
  v3[41] = v14;
  uint64_t v15 = a2[10];
  uint64_t v16 = a2[11];
  v3[42] = v15;
  v3[43] = v16;
  uint64_t v18 = a2[12];
  uint64_t v17 = a2[13];
  v3[44] = v18;
  v3[45] = v17;
  v3[2] = v5;
  v3[3] = v6;
  v3[4] = v7;
  v3[5] = v8;
  v3[6] = v9;
  v3[7] = v10;
  v3[8] = v11;
  v3[9] = v12;
  v3[10] = v13;
  v3[11] = v14;
  v3[12] = v15;
  v3[13] = v16;
  v3[14] = v18;
  v3[15] = v17;
  long long v19 = (void *)swift_task_alloc();
  v3[46] = v19;
  *long long v19 = v3;
  v19[1] = sub_233098508;
  return sub_233002A30(a3);
}

uint64_t sub_233098508(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 376) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_2330987E4, 0, 0);
  }
  else
  {
    *(_OWORD *)(v4 + 128) = *(_OWORD *)(v4 + 256);
    uint64_t v6 = *(void *)(v4 + 352);
    uint64_t v5 = *(void *)(v4 + 360);
    long long v8 = *(_OWORD *)(v4 + 320);
    long long v7 = *(_OWORD *)(v4 + 336);
    long long v10 = *(_OWORD *)(v4 + 288);
    long long v9 = *(_OWORD *)(v4 + 304);
    long long v11 = *(_OWORD *)(v4 + 272);
    *(void *)(v4 + 384) = a1;
    *(_OWORD *)(v4 + 144) = v11;
    *(_OWORD *)(v4 + 160) = v10;
    *(_OWORD *)(v4 + 176) = v9;
    *(_OWORD *)(v4 + 192) = v8;
    *(_OWORD *)(v4 + 208) = v7;
    *(void *)(v4 + 224) = v6;
    *(void *)(v4 + 232) = v5;
    uint64_t v12 = (void *)swift_task_alloc();
    *(void *)(v4 + 392) = v12;
    void *v12 = v4;
    v12[1] = sub_2330986BC;
    uint64_t v13 = *(void *)(v4 + 248);
    return sub_233003518(v13, a1);
  }
}

uint64_t sub_2330986BC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 400) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2330987BC, 0, 0);
}

uint64_t sub_2330987BC()
{
  uint64_t v1 = *(void *)(v0 + 400);
  uint64_t v2 = *(void **)(v0 + 240);
  *uint64_t v2 = *(void *)(v0 + 384);
  v2[1] = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2330987E4()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_2330987FC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  v22[1] = a4;
  long long v8 = (void (*)(uint64_t))MEMORY[0x263F06EA8];
  sub_233098A0C(0, (unint64_t *)&qword_268756520, MEMORY[0x263F06EA8]);
  MEMORY[0x270FA5388](v9 - 8);
  long long v11 = (char *)v22 - v10;
  uint64_t v13 = *(void *)(v4 + 56);
  unint64_t v12 = *(void *)(v4 + 64);
  sub_23309995C(a3, (uint64_t)v22 - v10, (unint64_t *)&qword_268756520, v8);
  sub_232E9A9F4(a1, a2);
  uint64_t v14 = sub_233098AC8(v13, v12);
  uint64_t v16 = v15;
  uint64_t v17 = sub_23309B020();
  uint64_t v19 = v18;
  objc_allocWithZone(MEMORY[0x263F45C30]);
  uint64_t v20 = swift_bridgeObjectRetain();
  return sub_232F412FC(a1, a2, 2, (uint64_t)v11, v14, v16, v17, v19, 0, 0xF000000000000000, 0, v20);
}

uint64_t sub_233098968(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_232FDB518;
  return sub_2330943F8(a1, a2);
}

void sub_233098A0C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_23309BD00();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_233098A60(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_233098AC8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2) {
    swift_bridgeObjectRetain();
  }
  else {
    sub_23309B710();
  }
  uint64_t v4 = sub_23309B710();
  swift_bridgeObjectRetain();
  sub_23309B880();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

id sub_233098B78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v27 = (void *)sub_23309B010();
  uint64_t v14 = sub_23309AF80();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(a4, 1, v14) != 1)
  {
    uint64_t v16 = (void *)sub_23309AF10();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a4, v14);
  }
  uint64_t v17 = (void *)sub_23309B6E0();
  swift_bridgeObjectRelease();
  uint64_t v18 = (void *)sub_23309B990();
  swift_bridgeObjectRelease();
  uint64_t v19 = (void *)sub_23309B1C0();
  if (a9)
  {
    sub_232F3A564();
    uint64_t v20 = (void *)sub_23309B640();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = 0;
  }
  uint64_t v21 = (void *)sub_23309B130();
  long long v22 = (void *)sub_23309B2D0();
  id v30 = objc_msgSend(v29, sel_initWithRawContent_sourceType_sourceURL_issuerIdentifier_credentialTypes_syncIdentifier_metadata_receivedDate_receivedDateTimeZone_signatureStatus_, v27, a3, v16, v17, v18, v19, v20, v21, v22, a12);

  uint64_t v23 = sub_23309B300();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(a11, v23);
  uint64_t v24 = sub_23309B190();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(a10, v24);
  uint64_t v25 = sub_23309B1F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v25 - 8) + 8))(a8, v25);
  return v30;
}

void sub_233098E14()
{
  if (!qword_268758E50)
  {
    sub_2330999C8(255, &qword_268757E78, (uint64_t)&type metadata for SignedClinicalDataEUDCCEntry.Recovery, MEMORY[0x263F8D488]);
    sub_23304079C();
    sub_2330990E4(&qword_268758E58, &qword_268757E78, (uint64_t)&type metadata for SignedClinicalDataEUDCCEntry.Recovery, (void (*)(void))sub_233098EE8);
    unint64_t v0 = sub_23309C2D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268758E50);
    }
  }
}

unint64_t sub_233098EE8()
{
  unint64_t result = qword_268758E60;
  if (!qword_268758E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268758E60);
  }
  return result;
}

void sub_233098F3C()
{
  if (!qword_268758E68)
  {
    sub_2330999C8(255, &qword_268757E78, (uint64_t)&type metadata for SignedClinicalDataEUDCCEntry.Recovery, MEMORY[0x263F8D488]);
    sub_23304079C();
    sub_2330990E4(&qword_268758E58, &qword_268757E78, (uint64_t)&type metadata for SignedClinicalDataEUDCCEntry.Recovery, (void (*)(void))sub_233098EE8);
    unint64_t v0 = sub_23309C2E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268758E68);
    }
  }
}

void sub_233099010()
{
  if (!qword_268758E70)
  {
    sub_2330999C8(255, &qword_268757EA8, (uint64_t)&type metadata for SignedClinicalDataEUDCCEntry.Vaccination, MEMORY[0x263F8D488]);
    sub_23304079C();
    sub_2330990E4(&qword_268758E78, &qword_268757EA8, (uint64_t)&type metadata for SignedClinicalDataEUDCCEntry.Vaccination, (void (*)(void))sub_233099170);
    unint64_t v0 = sub_23309C2D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268758E70);
    }
  }
}

uint64_t sub_2330990E4(unint64_t *a1, unint64_t *a2, uint64_t a3, void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2330999C8(255, a2, a3, MEMORY[0x263F8D488]);
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_233099170()
{
  unint64_t result = qword_268758E80;
  if (!qword_268758E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268758E80);
  }
  return result;
}

void sub_2330991C4()
{
  if (!qword_268758E88)
  {
    sub_2330999C8(255, &qword_268757EA8, (uint64_t)&type metadata for SignedClinicalDataEUDCCEntry.Vaccination, MEMORY[0x263F8D488]);
    sub_23304079C();
    sub_2330990E4(&qword_268758E78, &qword_268757EA8, (uint64_t)&type metadata for SignedClinicalDataEUDCCEntry.Vaccination, (void (*)(void))sub_233099170);
    unint64_t v0 = sub_23309C2E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268758E88);
    }
  }
}

void sub_233099298()
{
  if (!qword_268758E90)
  {
    sub_2330999C8(255, &qword_268757E90, (uint64_t)&type metadata for SignedClinicalDataEUDCCEntry.Laboratory, MEMORY[0x263F8D488]);
    sub_23304079C();
    sub_2330990E4(&qword_268758E98, &qword_268757E90, (uint64_t)&type metadata for SignedClinicalDataEUDCCEntry.Laboratory, (void (*)(void))sub_23309936C);
    unint64_t v0 = sub_23309C2D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268758E90);
    }
  }
}

unint64_t sub_23309936C()
{
  unint64_t result = qword_268758EA0;
  if (!qword_268758EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268758EA0);
  }
  return result;
}

void sub_2330993C0()
{
  if (!qword_268758EA8)
  {
    sub_2330999C8(255, &qword_268757E90, (uint64_t)&type metadata for SignedClinicalDataEUDCCEntry.Laboratory, MEMORY[0x263F8D488]);
    sub_23304079C();
    sub_2330990E4(&qword_268758E98, &qword_268757E90, (uint64_t)&type metadata for SignedClinicalDataEUDCCEntry.Laboratory, (void (*)(void))sub_23309936C);
    unint64_t v0 = sub_23309C2E0();
    if (!v1) {
      atomic_store(v0, &qword_268758EA8);
    }
  }
}

uint64_t sub_233099498(uint64_t a1, uint64_t *a2)
{
  uint64_t v6 = *(void *)(type metadata accessor for RecordExtractionContext() - 8);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  long long v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *long long v8 = v3;
  v8[1] = sub_23300C494;
  return sub_233098414(a1, a2, v7);
}

uint64_t sub_233099584(uint64_t a1, _OWORD *a2)
{
  uint64_t v6 = *(void *)(type metadata accessor for RecordExtractionContext() - 8);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  long long v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *long long v8 = v3;
  v8[1] = sub_23300C494;
  return sub_233098050(a1, a2, v7);
}

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = (int *)(type metadata accessor for RecordExtractionContext() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);

  uint64_t v5 = v0 + v3 + v1[7];
  uint64_t v6 = type metadata accessor for ExtractionContext();
  uint64_t v7 = v5 + *(int *)(v6 + 28);
  uint64_t v8 = sub_23309B190();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v5 + *(int *)(v6 + 32);
  uint64_t v10 = sub_23309AF80();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_23309982C(uint64_t a1, _OWORD *a2)
{
  uint64_t v6 = *(void *)(type metadata accessor for RecordExtractionContext() - 8);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_23300BE68;
  return sub_233097C8C(a1, a2, v7);
}

uint64_t sub_233099914(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23309995C(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_233098A0C(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

void sub_2330999C8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void _RegularExpressionFromPattern_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = 0;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_232E63000, a2, OS_LOG_TYPE_ERROR, "Error instantiating FHIR dateTime regex %@, error: %@", (uint8_t *)&v2, 0x16u);
}

void UIFoundationLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *UIFoundationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"HDHealthRecordsExtractionUtilities.m", 24, @"%s", *a1);

  __break(1u);
}

uint64_t sub_23309AB10()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_23309AB20()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_23309AB30()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_23309AB40()
{
  return MEMORY[0x270EEDE28]();
}

uint64_t sub_23309AB50()
{
  return MEMORY[0x270EEDE48]();
}

uint64_t sub_23309AB60()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_23309AB70()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_23309AB80()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_23309AB90()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_23309ABA0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_23309ABB0()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t sub_23309ABC0()
{
  return MEMORY[0x270EEE0D0]();
}

uint64_t sub_23309ABD0()
{
  return MEMORY[0x270EEE158]();
}

uint64_t sub_23309ABE0()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_23309ABF0()
{
  return MEMORY[0x270EEE1A0]();
}

uint64_t sub_23309AC00()
{
  return MEMORY[0x270EEE200]();
}

uint64_t sub_23309AC10()
{
  return MEMORY[0x270EEE218]();
}

uint64_t sub_23309AC20()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_23309AC30()
{
  return MEMORY[0x270EEE518]();
}

uint64_t sub_23309AC40()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_23309AC50()
{
  return MEMORY[0x270EEE558]();
}

uint64_t sub_23309AC60()
{
  return MEMORY[0x270EEE568]();
}

uint64_t sub_23309AC70()
{
  return MEMORY[0x270EEE5B8]();
}

uint64_t sub_23309AC80()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_23309AC90()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_23309ACA0()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_23309ACB0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_23309ACC0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_23309ACD0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_23309ACE0()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_23309ACF0()
{
  return MEMORY[0x270EEE738]();
}

uint64_t sub_23309AD00()
{
  return MEMORY[0x270EEE780]();
}

uint64_t sub_23309AD10()
{
  return MEMORY[0x270EEE7B0]();
}

uint64_t sub_23309AD20()
{
  return MEMORY[0x270EEE7C8]();
}

uint64_t sub_23309AD30()
{
  return MEMORY[0x270EEE810]();
}

uint64_t sub_23309AD40()
{
  return MEMORY[0x270EEE838]();
}

uint64_t sub_23309AD50()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_23309AD60()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_23309AD70()
{
  return MEMORY[0x270EEE908]();
}

uint64_t sub_23309AD80()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_23309AD90()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_23309ADA0()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_23309ADB0()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_23309ADC0()
{
  return MEMORY[0x270EEF128]();
}

uint64_t sub_23309ADD0()
{
  return MEMORY[0x270EEF330]();
}

uint64_t sub_23309ADE0()
{
  return MEMORY[0x270EEF358]();
}

uint64_t sub_23309ADF0()
{
  return MEMORY[0x270EEF3A8]();
}

uint64_t sub_23309AE00()
{
  return MEMORY[0x270EEF3C0]();
}

uint64_t sub_23309AE10()
{
  return MEMORY[0x270EEF3F0]();
}

uint64_t sub_23309AE20()
{
  return MEMORY[0x270EEF450]();
}

uint64_t sub_23309AE30()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_23309AEA0()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_23309AEB0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_23309AEC0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_23309AED0()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_23309AEE0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_23309AEF0()
{
  return MEMORY[0x270EEFC70]();
}

uint64_t sub_23309AF00()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_23309AF10()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_23309AF20()
{
  return MEMORY[0x270EEFD38]();
}

uint64_t sub_23309AF30()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_23309AF40()
{
  return MEMORY[0x270EEFEE0]();
}

uint64_t sub_23309AF50()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_23309AF60()
{
  return MEMORY[0x270EEFF30]();
}

uint64_t sub_23309AF70()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_23309AF80()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_23309AF90()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_23309AFA0()
{
  return MEMORY[0x270F12B30]();
}

uint64_t sub_23309AFB0()
{
  return MEMORY[0x270EF0048]();
}

uint64_t sub_23309AFC0()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_23309AFD0()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_23309AFE0()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_23309AFF0()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_23309B000()
{
  return MEMORY[0x270EF00D0]();
}

uint64_t sub_23309B010()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_23309B020()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_23309B030()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_23309B040()
{
  return MEMORY[0x270EF0190]();
}

uint64_t sub_23309B050()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t sub_23309B060()
{
  return MEMORY[0x270EF0218]();
}

uint64_t sub_23309B070()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_23309B080()
{
  return MEMORY[0x270EF02A8]();
}

uint64_t sub_23309B090()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_23309B0A0()
{
  return MEMORY[0x270EF0790]();
}

uint64_t sub_23309B0B0()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t sub_23309B0C0()
{
  return MEMORY[0x270EF07C0]();
}

uint64_t sub_23309B0D0()
{
  return MEMORY[0x270EF07E8]();
}

uint64_t sub_23309B0E0()
{
  return MEMORY[0x270EF07F8]();
}

uint64_t sub_23309B0F0()
{
  return MEMORY[0x270EF0808]();
}

uint64_t sub_23309B100()
{
  return MEMORY[0x270EF0820]();
}

uint64_t sub_23309B110()
{
  return MEMORY[0x270EF0840]();
}

uint64_t sub_23309B120()
{
  return MEMORY[0x270EF0890]();
}

uint64_t sub_23309B130()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_23309B140()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_23309B150()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_23309B160()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_23309B170()
{
  return MEMORY[0x270EF0BD0]();
}

uint64_t sub_23309B180()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_23309B190()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_23309B1A0()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_23309B1B0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_23309B1C0()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_23309B1D0()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_23309B1E0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_23309B1F0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_23309B200()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_23309B210()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_23309B220()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_23309B230()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_23309B240()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_23309B250()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_23309B260()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_23309B270()
{
  return MEMORY[0x270EF1350]();
}

uint64_t sub_23309B280()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_23309B290()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_23309B2A0()
{
  return MEMORY[0x270EF1590]();
}

uint64_t sub_23309B2B0()
{
  return MEMORY[0x270EF15A0]();
}

uint64_t sub_23309B2C0()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_23309B2D0()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_23309B2E0()
{
  return MEMORY[0x270EF15E8]();
}

uint64_t sub_23309B2F0()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_23309B300()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_23309B310()
{
  return MEMORY[0x270F12B38]();
}

uint64_t sub_23309B320()
{
  return MEMORY[0x270F12B40]();
}

uint64_t sub_23309B330()
{
  return MEMORY[0x270F12B48]();
}

uint64_t sub_23309B340()
{
  return MEMORY[0x270F12B50]();
}

uint64_t sub_23309B350()
{
  return MEMORY[0x270F12B58]();
}

uint64_t sub_23309B360()
{
  return MEMORY[0x270F12B60]();
}

uint64_t sub_23309B370()
{
  return MEMORY[0x270F12B68]();
}

uint64_t sub_23309B380()
{
  return MEMORY[0x270F12B78]();
}

uint64_t sub_23309B390()
{
  return MEMORY[0x270F12B80]();
}

uint64_t sub_23309B3A0()
{
  return MEMORY[0x270F9CF80]();
}

uint64_t sub_23309B3B0()
{
  return MEMORY[0x270F9CF88]();
}

uint64_t sub_23309B3C0()
{
  return MEMORY[0x270F9CF90]();
}

uint64_t sub_23309B3D0()
{
  return MEMORY[0x270F9CF98]();
}

uint64_t sub_23309B3E0()
{
  return MEMORY[0x270F9CFA8]();
}

uint64_t sub_23309B3F0()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_23309B400()
{
  return MEMORY[0x270FA17A0]();
}

uint64_t sub_23309B410()
{
  return MEMORY[0x270FA17B8]();
}

uint64_t sub_23309B420()
{
  return MEMORY[0x270FA17C0]();
}

uint64_t sub_23309B430()
{
  return MEMORY[0x270FA17C8]();
}

uint64_t sub_23309B440()
{
  return MEMORY[0x270FA1818]();
}

uint64_t sub_23309B450()
{
  return MEMORY[0x270FA1820]();
}

uint64_t sub_23309B460()
{
  return MEMORY[0x270FA1828]();
}

uint64_t sub_23309B470()
{
  return MEMORY[0x270FA1930]();
}

uint64_t sub_23309B480()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_23309B490()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_23309B4A0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23309B4B0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23309B4C0()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_23309B4D0()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_23309B4E0()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_23309B4F0()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_23309B500()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_23309B510()
{
  return MEMORY[0x270EEAF70]();
}

uint64_t sub_23309B520()
{
  return MEMORY[0x270EEAF98]();
}

uint64_t sub_23309B530()
{
  return MEMORY[0x270EEAFA8]();
}

uint64_t sub_23309B540()
{
  return MEMORY[0x270EEAFC0]();
}

uint64_t sub_23309B550()
{
  return MEMORY[0x270EEAFC8]();
}

uint64_t sub_23309B560()
{
  return MEMORY[0x270EEAFD0]();
}

uint64_t sub_23309B570()
{
  return MEMORY[0x270EEAFD8]();
}

uint64_t sub_23309B580()
{
  return MEMORY[0x270EEAFE8]();
}

uint64_t sub_23309B590()
{
  return MEMORY[0x270EEB028]();
}

uint64_t sub_23309B5A0()
{
  return MEMORY[0x270EEB060]();
}

uint64_t sub_23309B5B0()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_23309B5C0()
{
  return MEMORY[0x270EEB0B8]();
}

uint64_t sub_23309B5D0()
{
  return MEMORY[0x270EEB0E0]();
}

uint64_t sub_23309B5E0()
{
  return MEMORY[0x270EF3120]();
}

uint64_t sub_23309B5F0()
{
  return MEMORY[0x270EF3128]();
}

uint64_t sub_23309B600()
{
  return MEMORY[0x270EF3150]();
}

uint64_t sub_23309B610()
{
  return MEMORY[0x270EF3168]();
}

uint64_t sub_23309B620()
{
  return MEMORY[0x270EF31F8]();
}

uint64_t sub_23309B640()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_23309B650()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_23309B660()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_23309B670()
{
  return MEMORY[0x270F9D220]();
}

uint64_t sub_23309B680()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_23309B690()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_23309B6A0()
{
  return MEMORY[0x270F9D3C8]();
}

uint64_t sub_23309B6B0()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_23309B6C0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_23309B6D0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23309B6E0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23309B6F0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_23309B700()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_23309B710()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23309B720()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_23309B730()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_23309B740()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_23309B750()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_23309B760()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_23309B770()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_23309B780()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_23309B790()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_23309B7A0()
{
  return MEMORY[0x270F9D650]();
}

uint64_t sub_23309B7B0()
{
  return MEMORY[0x270F9D678]();
}

uint64_t sub_23309B7C0()
{
  return MEMORY[0x270F9D680]();
}

uint64_t sub_23309B7D0()
{
  return MEMORY[0x270F9D698]();
}

uint64_t sub_23309B7E0()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_23309B7F0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_23309B800()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23309B810()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_23309B820()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_23309B830()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_23309B840()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_23309B850()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_23309B860()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_23309B870()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_23309B880()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23309B890()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_23309B8A0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23309B8B0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_23309B8C0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_23309B8E0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_23309B8F0()
{
  return MEMORY[0x270F9D820]();
}

uint64_t sub_23309B900()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_23309B910()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_23309B920()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_23309B930()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_23309B940()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_23309B950()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_23309B960()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_23309B970()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_23309B980()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_23309B990()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_23309B9A0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23309B9B0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_23309B9C0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23309B9D0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_23309B9E0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_23309B9F0()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_23309BA00()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_23309BA10()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_23309BA20()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_23309BA30()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_23309BA40()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_23309BA50()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_23309BA80()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_23309BA90()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_23309BAA0()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_23309BAB0()
{
  return MEMORY[0x270FA2040]();
}

uint64_t sub_23309BAD0()
{
  return MEMORY[0x270FA2060]();
}

uint64_t sub_23309BAE0()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_23309BAF0()
{
  return MEMORY[0x270EF1C00]();
}

uint64_t sub_23309BB00()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_23309BB10()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_23309BB20()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_23309BB30()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_23309BB40()
{
  return MEMORY[0x270FA10D8]();
}

uint64_t sub_23309BB50()
{
  return MEMORY[0x270EF1E50]();
}

uint64_t sub_23309BB60()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_23309BB70()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_23309BB80()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_23309BB90()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_23309BBA0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_23309BBB0()
{
  return MEMORY[0x270EF3450]();
}

uint64_t sub_23309BBC0()
{
  return MEMORY[0x270EF3460]();
}

uint64_t sub_23309BBD0()
{
  return MEMORY[0x270EF3480]();
}

uint64_t sub_23309BBE0()
{
  return MEMORY[0x270EF34A8]();
}

uint64_t sub_23309BBF0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_23309BC00()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_23309BC10()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_23309BC20()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_23309BC30()
{
  return MEMORY[0x270EF2238]();
}

uint64_t sub_23309BC40()
{
  return MEMORY[0x270EF2248]();
}

uint64_t sub_23309BC50()
{
  return MEMORY[0x270EF2250]();
}

uint64_t sub_23309BC60()
{
  return MEMORY[0x270EF2258]();
}

uint64_t sub_23309BC70()
{
  return MEMORY[0x270EF2268]();
}

uint64_t sub_23309BC80()
{
  return MEMORY[0x270EF2288]();
}

uint64_t sub_23309BC90()
{
  return MEMORY[0x270EF22A0]();
}

uint64_t sub_23309BCA0()
{
  return MEMORY[0x270EF22C0]();
}

uint64_t sub_23309BCB0()
{
  return MEMORY[0x270EF2350]();
}

uint64_t sub_23309BCC0()
{
  return MEMORY[0x270EF2360]();
}

uint64_t sub_23309BCD0()
{
  return MEMORY[0x270EF2378]();
}

uint64_t sub_23309BCE0()
{
  return MEMORY[0x270EF2380]();
}

uint64_t sub_23309BCF0()
{
  return MEMORY[0x270EF2388]();
}

uint64_t sub_23309BD00()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23309BD10()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23309BD20()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23309BD30()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_23309BD40()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_23309BD50()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_23309BD60()
{
  return MEMORY[0x270EF24C0]();
}

uint64_t sub_23309BD70()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_23309BD80()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_23309BD90()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_23309BDA0()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_23309BDB0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_23309BDD0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_23309BDE0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_23309BDF0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_23309BE00()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_23309BE10()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_23309BE30()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_23309BE40()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23309BE50()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23309BE60()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_23309BE70()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_23309BE80()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_23309BE90()
{
  return MEMORY[0x270F9EA80]();
}

uint64_t sub_23309BEA0()
{
  return MEMORY[0x270F9EA88]();
}

uint64_t sub_23309BEB0()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_23309BEC0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_23309BED0()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t sub_23309BEE0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23309BEF0()
{
  return MEMORY[0x270F9EB88]();
}

uint64_t sub_23309BF00()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_23309BF10()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_23309BF20()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_23309BF30()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_23309BF40()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_23309BF50()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_23309BF60()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23309BF70()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_23309BF80()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23309BF90()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_23309BFA0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_23309BFB0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_23309BFC0()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_23309BFD0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_23309BFE0()
{
  return MEMORY[0x270F9F0D8]();
}

uint64_t sub_23309BFF0()
{
  return MEMORY[0x270F9F0E0]();
}

uint64_t sub_23309C010()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_23309C030()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_23309C040()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_23309C050()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_23309C060()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_23309C070()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_23309C080()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_23309C090()
{
  return MEMORY[0x270F9F2D8]();
}

uint64_t sub_23309C0A0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_23309C0B0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_23309C0C0()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_23309C0D0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_23309C0E0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_23309C0F0()
{
  return MEMORY[0x270F9F338]();
}

uint64_t sub_23309C100()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_23309C110()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_23309C120()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_23309C130()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_23309C140()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_23309C150()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_23309C160()
{
  return MEMORY[0x270F9F410]();
}

uint64_t sub_23309C170()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_23309C180()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_23309C190()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_23309C1A0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_23309C1B0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_23309C1C0()
{
  return MEMORY[0x270F9F478]();
}

uint64_t sub_23309C1D0()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_23309C1E0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_23309C1F0()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_23309C210()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_23309C220()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23309C230()
{
  return MEMORY[0x270F9F7E8]();
}

uint64_t sub_23309C240()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_23309C250()
{
  return MEMORY[0x270F9F858]();
}

uint64_t sub_23309C260()
{
  return MEMORY[0x270F9F878]();
}

uint64_t sub_23309C270()
{
  return MEMORY[0x270F9F880]();
}

uint64_t sub_23309C280()
{
  return MEMORY[0x270F9F888]();
}

uint64_t sub_23309C290()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_23309C2A0()
{
  return MEMORY[0x270F9F8C8]();
}

uint64_t sub_23309C2B0()
{
  return MEMORY[0x270F9F8E8]();
}

uint64_t sub_23309C2C0()
{
  return MEMORY[0x270F9F8F0]();
}

uint64_t sub_23309C2D0()
{
  return MEMORY[0x270FA2348]();
}

uint64_t sub_23309C2E0()
{
  return MEMORY[0x270FA2350]();
}

uint64_t sub_23309C2F0()
{
  return MEMORY[0x270FA2358]();
}

uint64_t sub_23309C310()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_23309C320()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_23309C330()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_23309C340()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_23309C370()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_23309C380()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_23309C390()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_23309C3A0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_23309C3B0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_23309C3C0()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_23309C3D0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23309C3E0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23309C3F0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_23309C400()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_23309C410()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_23309C420()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_23309C430()
{
  return MEMORY[0x270EF2760]();
}

uint64_t sub_23309C440()
{
  return MEMORY[0x270F9FD50]();
}

uint64_t sub_23309C450()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_23309C460()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_23309C470()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_23309C480()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_23309C4A0()
{
  return MEMORY[0x270FA00A0]();
}

uint64_t sub_23309C4D0()
{
  return MEMORY[0x270FA0128]();
}

uint64_t HKClinicalTypeForDiagnosticTestResultCategory()
{
  return MEMORY[0x270EF3630]();
}

uint64_t HKDiagnosticTestResultCategoryFromNSString()
{
  return MEMORY[0x270EF36B8]();
}

uint64_t HKFHIRReleaseFromNSString()
{
  return MEMORY[0x270EF36C8]();
}

uint64_t HKSafeObject()
{
  return MEMORY[0x270EF3800]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x270EF3808]();
}

uint64_t HKSharedResourcesDirectory()
{
  return MEMORY[0x270EF3810]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t SecKeyCreateRSAPublicKey()
{
  return MEMORY[0x270EFDA38]();
}

Boolean SecKeyIsAlgorithmSupported(SecKeyRef key, SecKeyOperationType operation, SecKeyAlgorithm algorithm)
{
  return MEMORY[0x270EFDAA8](key, operation, algorithm);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x270EFDAC8](key, algorithm, signedData, signature, error);
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

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x270EF3978]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uLong adler32(uLong adler, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C668](adler, buf, *(void *)&len);
}

void bzero(void *a1, size_t a2)
{
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

htmlDocPtr htmlParseDoc(const xmlChar *cur, const char *encoding)
{
  return (htmlDocPtr)MEMORY[0x270F9BAB0](cur, encoding);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
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

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
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

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x270FA0350]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
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

xmlNodePtr xmlDocGetRootElement(const xmlDoc *doc)
{
  return (xmlNodePtr)MEMORY[0x270F9BC50](doc);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

void xmlFreeNode(xmlNodePtr cur)
{
}

xmlChar *__cdecl xmlNodeGetContent(const xmlNode *cur)
{
  return (xmlChar *)MEMORY[0x270F9BF30](cur);
}

xmlDocPtr xmlParseDoc(const xmlChar *cur)
{
  return (xmlDocPtr)MEMORY[0x270F9BF98](cur);
}

void xmlUnlinkNode(xmlNodePtr cur)
{
}

xmlXPathObjectPtr xmlXPathEvalExpression(const xmlChar *str, xmlXPathContextPtr ctxt)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9C3D8](str, ctxt);
}

void xmlXPathFreeContext(xmlXPathContextPtr ctxt)
{
}

void xmlXPathFreeObject(xmlXPathObjectPtr obj)
{
}

xmlXPathContextPtr xmlXPathNewContext(xmlDocPtr doc)
{
  return (xmlXPathContextPtr)MEMORY[0x270F9C458](doc);
}