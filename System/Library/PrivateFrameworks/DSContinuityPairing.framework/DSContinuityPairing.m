uint64_t sub_24C888554()
{
  return 1;
}

uint64_t sub_24C88855C()
{
  return sub_24C88F3B0();
}

uint64_t sub_24C888584()
{
  return sub_24C88F3C0();
}

uint64_t sub_24C8885C8()
{
  return sub_24C88F3C0();
}

uint64_t variable initialization expression of DSContinuityPairing.manager()
{
  return sub_24C88F160();
}

uint64_t DSContinuityPairing.fetchContinuityDevices()()
{
  v1[5] = v0;
  uint64_t v2 = sub_24C88EFB0();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F84C8);
  v1[10] = swift_task_alloc();
  uint64_t v3 = sub_24C88F0A0();
  v1[11] = v3;
  v1[12] = *(void *)(v3 - 8);
  v1[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F84D0);
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  uint64_t v4 = sub_24C88EFF0();
  v1[16] = v4;
  v1[17] = *(void *)(v4 - 8);
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  uint64_t v5 = sub_24C88F0B0();
  v1[20] = v5;
  v1[21] = *(void *)(v5 - 8);
  v1[22] = swift_task_alloc();
  v1[23] = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F84D8);
  v1[24] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F84E0);
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  v1[27] = swift_task_alloc();
  uint64_t v6 = sub_24C88F110();
  v1[28] = v6;
  v1[29] = *(void *)(v6 - 8);
  v1[30] = swift_task_alloc();
  v1[31] = swift_task_alloc();
  v1[32] = swift_task_alloc();
  uint64_t v7 = sub_24C88F140();
  v1[33] = v7;
  v1[34] = *(void *)(v7 - 8);
  v1[35] = swift_task_alloc();
  v1[36] = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F84E8);
  v1[37] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F84F0);
  v1[38] = v8;
  v1[39] = *(void *)(v8 - 8);
  v1[40] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24C888A90, 0, 0);
}

uint64_t sub_24C888A90()
{
  v0[41] = *(void *)(v0[5] + OBJC_IVAR____TtC19DSContinuityPairing19DSContinuityPairing_manager);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8500);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_24C88FA30;
  swift_retain();
  sub_24C88F130();
  sub_24C88F120();
  v0[2] = v1;
  sub_24C88ED00(&qword_2697F8508, MEMORY[0x263F66FF0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8510);
  sub_24C889E3C();
  sub_24C88F2F0();
  sub_24C88F170();
  sub_24C88ED00(&qword_2697F8520, MEMORY[0x263F67008]);
  uint64_t v3 = sub_24C88F250();
  return MEMORY[0x270FA2498](sub_24C888C38, v3, v2);
}

uint64_t sub_24C888C38()
{
  uint64_t v2 = v0[34];
  uint64_t v1 = v0[35];
  uint64_t v3 = v0[33];
  sub_24C88F150();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return MEMORY[0x270FA2498](sub_24C888CD8, 0, 0);
}

uint64_t sub_24C888CD8()
{
  swift_getOpaqueTypeConformance2();
  sub_24C88F290();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 336) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24C888DF0;
  uint64_t v3 = *(void *)(v0 + 304);
  return MEMORY[0x270FA1E80](v0 + 24, v3, AssociatedConformanceWitness);
}

uint64_t sub_24C888DF0()
{
  *(void *)(*(void *)v1 + 344) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24C889AEC;
  }
  else {
    uint64_t v2 = sub_24C888F04;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24C888F04()
{
  uint64_t v1 = v0[3];
  if (v1)
  {
    uint64_t v104 = *(void *)(v1 + 16);
    if (v104)
    {
      unint64_t v2 = 0;
      uint64_t v3 = v0[29];
      uint64_t v99 = v0[23];
      uint64_t v4 = v0[21];
      uint64_t v5 = MEMORY[0x263F8EE78];
      uint64_t v113 = MEMORY[0x263F8EE78];
      v97 = (void (**)(uint64_t, void, uint64_t))(v4 + 104);
      v95 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56);
      uint64_t v6 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
      v81 = (void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
      v87 = (void (**)(uint64_t, uint64_t))(v4 + 8);
      uint64_t v89 = v0[3];
      v106 = (void (**)(uint64_t, uint64_t))(v3 + 8);
      unsigned int v93 = *MEMORY[0x263F66FB8];
      v102 = (void *)v3;
      v91 = (void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32);
      while (1)
      {
        if (v2 >= *(void *)(v1 + 16))
        {
          __break(1u);
          goto LABEL_50;
        }
        uint64_t v111 = v5;
        uint64_t v9 = v0[27];
        uint64_t v10 = v0[26];
        uint64_t v11 = v0[24];
        uint64_t v12 = v0[20];
        unint64_t v107 = (*((unsigned __int8 *)v102 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v102 + 80);
        uint64_t v110 = v102[9];
        v109 = (void (*)(void))v102[2];
        ((void (*)(void, unint64_t, void))v109)(v0[32], v1 + v107 + v110 * v2, v0[28]);
        sub_24C88F070();
        (*v97)(v10, v93, v12);
        (*v95)(v10, 0, 1, v12);
        uint64_t v13 = v11 + *(int *)(v99 + 48);
        sub_24C88C818(v9, v11);
        sub_24C88C818(v10, v13);
        v14 = *v6;
        if ((*v6)(v11, 1, v12) == 1) {
          break;
        }
        uint64_t v17 = v0[20];
        sub_24C88C818(v0[24], v0[25]);
        if (v14(v13, 1, v17) == 1)
        {
          (*v87)(v0[25], v0[20]);
LABEL_5:
          uint64_t v7 = v0[26];
          uint64_t v8 = v0[27];
          sub_24C88E990(v0[24], &qword_2697F84D8);
          sub_24C88E990(v7, &qword_2697F84E0);
          sub_24C88E990(v8, &qword_2697F84E0);
          goto LABEL_6;
        }
        uint64_t v18 = v0[25];
        uint64_t v83 = v0[26];
        uint64_t v85 = v0[27];
        uint64_t v19 = v0[24];
        uint64_t v20 = v0[22];
        uint64_t v21 = v0[20];
        (*v81)(v20, v13, v21);
        sub_24C88ED00(&qword_2697F8530, MEMORY[0x263F66FC0]);
        char v22 = sub_24C88F1C0();
        v23 = *v87;
        (*v87)(v18, v21);
        uint64_t v24 = v20;
        uint64_t v1 = v89;
        v23(v24, v21);
        sub_24C88E990(v19, &qword_2697F84E0);
        sub_24C88E990(v83, &qword_2697F84E0);
        sub_24C88E990(v85, &qword_2697F84E0);
        if (v22) {
          goto LABEL_14;
        }
LABEL_6:
        (*v106)(v0[32], v0[28]);
        uint64_t v5 = v111;
LABEL_7:
        if (v104 == ++v2)
        {
          swift_bridgeObjectRelease();
          uint64_t v30 = *(void *)(v5 + 16);
          if (v30)
          {
            uint64_t v31 = v0[7];
            uint64_t v32 = v5 + v107;
            v94 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 56);
            v98 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48);
            v88 = (void (**)(uint64_t, uint64_t))(v31 + 8);
            v92 = (void (**)(uint64_t, uint64_t))(v0[17] + 8);
            uint64_t v33 = v0[12];
            v90 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48);
            v86 = (void (**)(void, void, void))(v33 + 32);
            v82 = (void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32);
            uint64_t v114 = MEMORY[0x263F8EE78];
            v84 = (void (**)(uint64_t, uint64_t))(v33 + 8);
            while (1)
            {
              uint64_t v108 = v30;
              uint64_t v34 = v0[15];
              uint64_t v35 = v0[6];
              uint64_t v105 = v32;
              v109(v0[30]);
              sub_24C88F100();
              sub_24C88F060();
              sub_24C88F0D0();
              (*v94)(v34, 1, 1, v35);
              v36 = (void *)sub_24C88F1D0();
              swift_bridgeObjectRelease();
              v37 = (void *)sub_24C88EFC0();
              v38 = (void *)sub_24C88EFC0();
              v96 = *v98;
              if ((*v98)(v34, 1, v35) == 1)
              {
                v39 = 0;
              }
              else
              {
                uint64_t v40 = v0[15];
                uint64_t v41 = v0[6];
                v39 = (void *)sub_24C88EF80();
                (*v88)(v40, v41);
              }
              uint64_t v43 = v0[18];
              uint64_t v42 = v0[19];
              uint64_t v44 = v0[16];
              uint64_t v45 = v0[10];
              uint64_t v100 = v0[11];
              id v103 = objc_msgSend(objc_allocWithZone((Class)DSContinuityDevice), sel_initWithName_deviceID_relationshipID_initialDiscoveryDate_, v36, v37, v38, v39);

              v46 = *v92;
              (*v92)(v43, v44);
              v46(v42, v44);
              sub_24C88F0E0();
              if ((*v90)(v45, 1, v100) == 1)
              {
                uint64_t v47 = v0[10];
                v48 = (uint64_t *)&unk_2697F84C8;
              }
              else
              {
                uint64_t v49 = v0[14];
                uint64_t v50 = v0[6];
                (*v86)(v0[13], v0[10], v0[11]);
                sub_24C88F080();
                unsigned int v51 = v96(v49, 1, v50);
                uint64_t v52 = v0[13];
                uint64_t v53 = v0[14];
                if (v51 != 1)
                {
                  uint64_t v55 = v0[8];
                  uint64_t v56 = v0[9];
                  uint64_t v57 = v0[6];
                  uint64_t v101 = v0[11];
                  (*v82)(v56, v53, v57);
                  sub_24C88F090();
                  sub_24C88CDF8(v55);
                  v58 = *v88;
                  (*v88)(v55, v57);
                  v59 = (void *)sub_24C88F1D0();
                  swift_bridgeObjectRelease();
                  v54 = v103;
                  objc_msgSend(v103, sel_setFormattedSessionStart_, v59);

                  sub_24C88F090();
                  sub_24C88DFC0(v55, v56);
                  v58(v55, v57);
                  v60 = (void *)sub_24C88F1D0();
                  swift_bridgeObjectRelease();
                  objc_msgSend(v103, sel_setFormattedSessionDuration_, v60);

                  v58(v56, v57);
                  (*v84)(v52, v101);
                  goto LABEL_30;
                }
                (*v84)(v0[13], v0[11]);
                uint64_t v47 = v53;
                v48 = (uint64_t *)&unk_2697F84D0;
              }
              sub_24C88E990(v47, v48);
              v54 = v103;
LABEL_30:
              sub_24C88F0C0();
              if (v61)
              {
                v62 = (void *)sub_24C88F1D0();
                swift_bridgeObjectRelease();
                objc_msgSend(v54, sel_setMarketingName_, v62);
              }
              id v63 = v54;
              MEMORY[0x2532FDFE0]();
              if (*(void *)((v114 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v114 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_24C88F230();
              }
              uint64_t v64 = v0[30];
              uint64_t v65 = v0[28];
              sub_24C88F240();
              sub_24C88F220();

              (*v106)(v64, v65);
              uint64_t v32 = v105 + v110;
              uint64_t v30 = v108 - 1;
              if (v108 == 1)
              {
                uint64_t v67 = v0[39];
                uint64_t v66 = v0[40];
                uint64_t v68 = v0[38];
                swift_release();
                (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v66, v68);
                uint64_t v69 = v114;
                goto LABEL_42;
              }
            }
          }
          swift_release();
          if (qword_2697F8620 != -1) {
            swift_once();
          }
          uint64_t v80 = sub_24C88F1A0();
          __swift_project_value_buffer(v80, (uint64_t)qword_2697F8628);
          v71 = sub_24C88F180();
          os_log_type_t v72 = sub_24C88F2A0();
          if (os_log_type_enabled(v71, v72))
          {
            v73 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v73 = 0;
            v74 = "No actively paired devices";
            goto LABEL_40;
          }
          goto LABEL_41;
        }
      }
      if (v14(v13, 1, v0[20]) == 1)
      {
        uint64_t v15 = v0[26];
        uint64_t v16 = v0[27];
        sub_24C88E990(v0[24], &qword_2697F84E0);
        sub_24C88E990(v15, &qword_2697F84E0);
        sub_24C88E990(v16, &qword_2697F84E0);
LABEL_14:
        v25 = *v91;
        (*v91)(v0[31], v0[32], v0[28]);
        uint64_t v5 = v111;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24C88C880(0, *(void *)(v111 + 16) + 1, 1);
          uint64_t v5 = v113;
        }
        unint64_t v27 = *(void *)(v5 + 16);
        unint64_t v26 = *(void *)(v5 + 24);
        if (v27 >= v26 >> 1)
        {
          sub_24C88C880(v26 > 1, v27 + 1, 1);
          uint64_t v5 = v113;
        }
        uint64_t v28 = v0[31];
        uint64_t v29 = v0[28];
        *(void *)(v5 + 16) = v27 + 1;
        v25(v5 + v107 + v27 * v110, v28, v29);
        uint64_t v113 = v5;
        uint64_t v1 = v89;
        goto LABEL_7;
      }
      goto LABEL_5;
    }
    swift_bridgeObjectRelease();
  }
  if (qword_2697F8620 != -1) {
LABEL_50:
  }
    swift_once();
  uint64_t v70 = sub_24C88F1A0();
  __swift_project_value_buffer(v70, (uint64_t)qword_2697F8628);
  v71 = sub_24C88F180();
  os_log_type_t v72 = sub_24C88F2A0();
  if (os_log_type_enabled(v71, v72))
  {
    v73 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v73 = 0;
    v74 = "No eligible devices found";
LABEL_40:
    _os_log_impl(&dword_24C886000, v71, v72, v74, v73, 2u);
    MEMORY[0x2532FE580](v73, -1, -1);
  }
LABEL_41:
  uint64_t v76 = v0[39];
  uint64_t v75 = v0[40];
  uint64_t v77 = v0[38];

  (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v75, v77);
  uint64_t v69 = MEMORY[0x263F8EE78];
LABEL_42:
  uint64_t v112 = v69;
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
  v78 = (uint64_t (*)(uint64_t))v0[1];
  return v78(v112);
}

uint64_t sub_24C889AEC()
{
  (*(void (**)(void, void))(v0[39] + 8))(v0[40], v0[38]);
  if (qword_2697F8620 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[43];
  uint64_t v2 = sub_24C88F1A0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2697F8628);
  MEMORY[0x2532FE4A0](v1);
  MEMORY[0x2532FE4A0](v1);
  uint64_t v3 = sub_24C88F180();
  os_log_type_t v4 = sub_24C88F2B0();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = (void *)v0[43];
  if (v5)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138543362;
    MEMORY[0x2532FE4A0](v6);
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v9;
    sub_24C88F2D0();
    *uint64_t v8 = v9;

    _os_log_impl(&dword_24C886000, v3, v4, "Device stream failed; %{public}@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8528);
    swift_arrayDestroy();
    MEMORY[0x2532FE580](v8, -1, -1);
    MEMORY[0x2532FE580](v7, -1, -1);
  }
  else
  {
  }
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
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

unint64_t sub_24C889E3C()
{
  unint64_t result = qword_2697F8518;
  if (!qword_2697F8518)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697F8510);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F8518);
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

uint64_t sub_24C88A050(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  os_log_type_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *os_log_type_t v4 = v2;
  v4[1] = sub_24C88A0F8;
  return DSContinuityPairing.fetchContinuityDevices()();
}

uint64_t sub_24C88A0F8()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  os_log_type_t v4 = *(void **)(*v1 + 16);
  uint64_t v5 = *v1;
  swift_task_dealloc();

  if (v2)
  {
    uint64_t v6 = sub_24C88EDF0();

    uint64_t v7 = 0;
    uint64_t v8 = (void *)v6;
  }
  else
  {
    sub_24C88EC10();
    uint64_t v7 = sub_24C88F210();
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

uint64_t DSContinuityPairing.unpairDevice(with:)(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  uint64_t v3 = sub_24C88EFF0();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8540);
  v2[12] = swift_task_alloc();
  uint64_t v4 = sub_24C88F110();
  v2[13] = v4;
  v2[14] = *(void *)(v4 - 8);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F84F0);
  v2[17] = v5;
  v2[18] = *(void *)(v5 - 8);
  v2[19] = swift_task_alloc();
  uint64_t v6 = sub_24C88F140();
  v2[20] = v6;
  v2[21] = *(void *)(v6 - 8);
  v2[22] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F84E8);
  v2[23] = v7;
  v2[24] = *(void *)(v7 - 8);
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24C88A52C, 0, 0);
}

uint64_t sub_24C88A52C()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = OBJC_IVAR____TtC19DSContinuityPairing19DSContinuityPairing_manager;
  v0[27] = OBJC_IVAR____TtC19DSContinuityPairing19DSContinuityPairing_manager;
  v0[28] = *(void *)(v1 + v2);
  v0[2] = MEMORY[0x263F8EE78];
  sub_24C88ED00(&qword_2697F8508, MEMORY[0x263F66FF0]);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8510);
  sub_24C889E3C();
  sub_24C88F2F0();
  sub_24C88F170();
  sub_24C88ED00(&qword_2697F8520, MEMORY[0x263F67008]);
  uint64_t v4 = sub_24C88F250();
  return MEMORY[0x270FA2498](sub_24C88A698, v4, v3);
}

uint64_t sub_24C88A698()
{
  uint64_t v2 = v0[21];
  uint64_t v1 = v0[22];
  uint64_t v3 = v0[20];
  sub_24C88F150();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return MEMORY[0x270FA2498](sub_24C88A738, 0, 0);
}

uint64_t sub_24C88A738()
{
  (*(void (**)(void, void, void))(v0[24] + 16))(v0[25], v0[26], v0[23]);
  swift_getOpaqueTypeConformance2();
  sub_24C88F290();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[29] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24C88A870;
  uint64_t v3 = v0[17];
  return MEMORY[0x270FA1E80](v0 + 3, v3, AssociatedConformanceWitness);
}

uint64_t sub_24C88A870()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 240) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2[18] + 8))(v2[19], v2[17]);
    uint64_t v3 = sub_24C88AF54;
  }
  else
  {
    uint64_t v3 = sub_24C88A99C;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24C88A99C()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[26];
  uint64_t v4 = v0[23];
  uint64_t v3 = v0[24];
  uint64_t v6 = v0[18];
  uint64_t v5 = v0[19];
  uint64_t v7 = v0[17];
  if (!v1)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
LABEL_9:
    if (qword_2697F8620 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_24C88F1A0();
    __swift_project_value_buffer(v19, (uint64_t)qword_2697F8628);
    uint64_t v20 = sub_24C88F180();
    os_log_type_t v21 = sub_24C88F2B0();
    if (os_log_type_enabled(v20, v21))
    {
      char v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v22 = 0;
      _os_log_impl(&dword_24C886000, v20, v21, "Fetch error: no known devices.", v22, 2u);
      MEMORY[0x2532FE580](v22, -1, -1);
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
    v23 = (uint64_t (*)(void))v0[1];
    goto LABEL_21;
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v8 = *(void *)(v1 + 16);
  if (!v8)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  uint64_t v9 = v0[14];
  uint64_t v40 = *(void (**)(void, uint64_t, void))(v9 + 16);
  uint64_t v10 = v1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  uint64_t v11 = v0[8] + 8;
  uint64_t v12 = (void (**)(void, void))(v9 + 8);
  uint64_t v39 = *(void *)(v9 + 72);
  swift_bridgeObjectRetain();
  while (1)
  {
    uint64_t v13 = v0[11];
    uint64_t v14 = v0[7];
    v40(v0[15], v10, v0[13]);
    sub_24C88F060();
    char v15 = sub_24C88EFD0();
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))v11;
    v0[31] = *(void *)v11;
    v0[32] = v11 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v16(v13, v14);
    uint64_t v17 = v0[15];
    if (v15) {
      break;
    }
    (*v12)(v0[15], v0[13]);
    v10 += v39;
    if (!--v8)
    {
      swift_bridgeObjectRelease();
      uint64_t v18 = 1;
      goto LABEL_15;
    }
  }
  uint64_t v25 = v0[13];
  uint64_t v24 = v0[14];
  uint64_t v26 = v0[12];
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(v26, v17, v25);
  uint64_t v18 = 0;
LABEL_15:
  uint64_t v28 = v0[13];
  uint64_t v27 = v0[14];
  uint64_t v29 = v0[12];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56))(v29, v18, 1, v28);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v29, 1, v28) == 1)
  {
    sub_24C88E990(v0[12], &qword_2697F8540);
    if (qword_2697F8620 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_24C88F1A0();
    __swift_project_value_buffer(v30, (uint64_t)qword_2697F8628);
    uint64_t v31 = sub_24C88F180();
    os_log_type_t v32 = sub_24C88F2B0();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_24C886000, v31, v32, "Device to unpair is not in devices list.", v33, 2u);
      MEMORY[0x2532FE580](v33, -1, -1);
    }

    sub_24C88E404();
    swift_allocError();
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
    v23 = (uint64_t (*)(void))v0[1];
LABEL_21:
    return v23();
  }
  uint64_t v35 = v0[27];
  uint64_t v36 = v0[6];
  (*(void (**)(void, void, void))(v0[14] + 32))(v0[16], v0[12], v0[13]);
  v0[33] = *(void *)(v36 + v35);
  swift_retain();
  sub_24C88F0F0();
  uint64_t v41 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F66FD8] + MEMORY[0x263F66FD8]);
  v37 = (void *)swift_task_alloc();
  v0[34] = v37;
  void *v37 = v0;
  v37[1] = sub_24C88B054;
  uint64_t v38 = v0[10];
  return v41(v38);
}

uint64_t sub_24C88AF54()
{
  (*(void (**)(void, void))(v0[24] + 8))(v0[26], v0[23]);
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

uint64_t sub_24C88B054()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 280) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2 + 248))(*(void *)(v2 + 80), *(void *)(v2 + 56));
  swift_release();
  if (v0) {
    uint64_t v3 = sub_24C88B4E4;
  }
  else {
    uint64_t v3 = sub_24C88B1E0;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24C88B1E0()
{
  v23 = v0;
  if (qword_2697F8620 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v4 = v0[7];
  uint64_t v5 = sub_24C88F1A0();
  __swift_project_value_buffer(v5, (uint64_t)qword_2697F8628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
  uint64_t v6 = sub_24C88F180();
  os_log_type_t v7 = sub_24C88F2C0();
  BOOL v8 = os_log_type_enabled(v6, v7);
  os_log_type_t v21 = (void (*)(uint64_t, uint64_t))v0[31];
  uint64_t v9 = v0[16];
  uint64_t v10 = v0[13];
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[9];
  uint64_t v13 = v0[7];
  if (v8)
  {
    uint64_t v20 = v0[13];
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v22 = v19;
    *(_DWORD *)uint64_t v14 = 136380675;
    sub_24C88ED00(&qword_2697F8550, MEMORY[0x263F07508]);
    uint64_t v15 = sub_24C88F350();
    v0[4] = sub_24C88C1C0(v15, v16, &v22);
    sub_24C88F2D0();
    swift_bridgeObjectRelease();
    v21(v12, v13);
    _os_log_impl(&dword_24C886000, v6, v7, "Finished unpairing device with ID: %{private}s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2532FE580](v19, -1, -1);
    MEMORY[0x2532FE580](v14, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v20);
  }
  else
  {

    v21(v12, v13);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
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
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_24C88B4E4()
{
  (*(void (**)(void, void))(v0[14] + 8))(v0[16], v0[13]);
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

uint64_t sub_24C88B760(uint64_t a1, const void *a2, void *a3)
{
  v3[2] = a3;
  uint64_t v6 = sub_24C88EFF0();
  v3[3] = v6;
  v3[4] = *(void *)(v6 - 8);
  uint64_t v7 = swift_task_alloc();
  v3[5] = v7;
  v3[6] = _Block_copy(a2);
  sub_24C88EFE0();
  a3;
  BOOL v8 = (void *)swift_task_alloc();
  v3[7] = v8;
  *BOOL v8 = v3;
  v8[1] = sub_24C88B88C;
  return DSContinuityPairing.unpairDevice(with:)(v7);
}

uint64_t sub_24C88B88C()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void *)(*v1 + 40);
  uint64_t v6 = *(void *)(*v1 + 32);
  uint64_t v7 = *(void *)(*v1 + 24);
  BOOL v8 = *(void **)(*v1 + 16);
  uint64_t v9 = *v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);

  uint64_t v10 = *(void *)(v3 + 48);
  if (v2)
  {
    uint64_t v11 = (void *)sub_24C88EDF0();

    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
  else
  {
    (*(void (**)(void, void))(v10 + 16))(*(void *)(v3 + 48), 0);
  }
  _Block_release(*(const void **)(v4 + 48));
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(void))(v9 + 8);
  return v12();
}

id DSContinuityPairing.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id DSContinuityPairing.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____TtC19DSContinuityPairing19DSContinuityPairing_manager;
  sub_24C88F170();
  uint64_t v3 = v0;
  *(void *)&v0[v2] = sub_24C88F160();

  v5.receiver = v3;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

id DSContinuityPairing.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24C88BBEC()
{
  uint64_t v0 = sub_24C88F1A0();
  __swift_allocate_value_buffer(v0, qword_2697F8628);
  __swift_project_value_buffer(v0, (uint64_t)qword_2697F8628);
  return sub_24C88F190();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24C88BCA8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_24C88EDAC;
  return v6();
}

uint64_t sub_24C88BD74(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  objc_super v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *objc_super v5 = v4;
  v5[1] = sub_24C88EDAC;
  return v7();
}

uint64_t sub_24C88BE40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C88F280();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24C88F270();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24C88E990(a1, &qword_2697F8560);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24C88F250();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24C88BFEC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24C88C0C8;
  return v6(a1);
}

uint64_t sub_24C88C0C8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24C88C1C0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24C88C294(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24C88ECA0((uint64_t)v12, *a3);
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
      sub_24C88ECA0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24C88C294(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24C88F2E0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24C88C450(a5, a6);
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
  uint64_t v8 = sub_24C88F320();
  if (!v8)
  {
    sub_24C88F330();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24C88F340();
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

uint64_t sub_24C88C450(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24C88C4E8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24C88C6C8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24C88C6C8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24C88C4E8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24C88C660(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24C88F310();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24C88F330();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24C88F1F0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24C88F340();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24C88F330();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24C88C660(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F85D0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24C88C6C8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F85D0);
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
  uint64_t result = sub_24C88F340();
  __break(1u);
  return result;
}

uint64_t sub_24C88C818(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F84E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C88C880(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24C88C8A0(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_24C88C8A0(char a1, int64_t a2, char a3, void *a4)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697F8610);
  uint64_t v10 = *(void *)(sub_24C88F110() - 8);
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
  uint64_t v16 = *(void *)(sub_24C88F110() - 8);
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
  os_log_type_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_24C88F340();
  __break(1u);
  return result;
}

uint64_t sub_24C88CAE0(uint64_t a1)
{
  uint64_t v2 = sub_24C88F030();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F85F8);
    uint64_t v9 = sub_24C88F300();
    uint64_t v10 = 0;
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
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
      sub_24C88ED00(&qword_2697F8600, MEMORY[0x263F07908]);
      uint64_t v16 = sub_24C88F1B0();
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
          sub_24C88ED00(&qword_2697F8608, MEMORY[0x263F07908]);
          char v23 = sub_24C88F1C0();
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

uint64_t sub_24C88CDF8(uint64_t a1)
{
  uint64_t v151 = a1;
  uint64_t v104 = sub_24C88EEB0();
  uint64_t v103 = *(void *)(v104 - 8);
  MEMORY[0x270FA5388](v104);
  v102 = (char *)&v100 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_24C88EEF0();
  uint64_t v138 = *(void *)(v2 - 8);
  uint64_t v139 = v2;
  MEMORY[0x270FA5388](v2);
  v137 = (char *)&v100 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = sub_24C88EE80();
  uint64_t v132 = *(void *)(v133 - 8);
  MEMORY[0x270FA5388](v133);
  v129 = (char *)&v100 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24C88EE90();
  uint64_t v134 = *(void *)(v5 - 8);
  uint64_t v135 = v5;
  MEMORY[0x270FA5388](v5);
  v130 = (char *)&v100 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_24C88EE50();
  uint64_t v125 = *(void *)(v127 - 8);
  MEMORY[0x270FA5388](v127);
  v124 = (char *)&v100 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = sub_24C88EED0();
  uint64_t v121 = *(void *)(v122 - 8);
  MEMORY[0x270FA5388](v122);
  v120 = (char *)&v100 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = sub_24C88EF10();
  uint64_t v118 = *(void *)(v136 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v136);
  uint64_t v101 = (char *)&v100 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v119 = (char *)&v100 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v123 = (char *)&v100 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v126 = (char *)&v100 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v128 = (char *)&v100 - v18;
  MEMORY[0x270FA5388](v17);
  v131 = (char *)&v100 - v19;
  uint64_t v20 = sub_24C88F030();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v115 = (char *)&v100 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_24C88EF40();
  uint64_t v113 = *(void *)(v114 - 8);
  MEMORY[0x270FA5388](v114);
  v109 = (char *)&v100 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_24C88EF60();
  uint64_t v108 = *(void *)(v110 - 8);
  MEMORY[0x270FA5388](v110);
  v106 = (char *)&v100 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = sub_24C88EF70();
  uint64_t v111 = *(void *)(v112 - 8);
  MEMORY[0x270FA5388](v112);
  unint64_t v107 = (char *)&v100 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v145 = sub_24C88EDE0();
  uint64_t v26 = *(void *)(v145 - 8);
  MEMORY[0x270FA5388](v145);
  BOOL v28 = (char *)&v100 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = sub_24C88EFB0();
  uint64_t v142 = *(void *)(v150 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v150);
  v141 = (char *)&v100 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  v140 = (char *)&v100 - v32;
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)&v100 - v34;
  uint64_t v36 = MEMORY[0x270FA5388](v33);
  uint64_t v38 = (char *)&v100 - v37;
  MEMORY[0x270FA5388](v36);
  uint64_t v40 = (char *)&v100 - v39;
  uint64_t v41 = sub_24C88F050();
  uint64_t v143 = *(void *)(v41 - 8);
  uint64_t v144 = v41;
  MEMORY[0x270FA5388](v41);
  uint64_t v43 = (char *)&v100 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C88F020();
  sub_24C88EF90();
  v147 = v40;
  sub_24C88F000();
  sub_24C88F000();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F85E0);
  unint64_t v44 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  uint64_t v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = xmmword_24C88FA40;
  uint64_t v46 = *MEMORY[0x263F07870];
  uint64_t v116 = v21;
  uint64_t v105 = *(void (**)(unint64_t, uint64_t, uint64_t))(v21 + 104);
  v105(v45 + v44, v46, v20);
  sub_24C88CAE0(v45);
  swift_setDeallocating();
  uint64_t v117 = v20;
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v148 = v35;
  v149 = v38;
  v146 = v43;
  sub_24C88F010();
  swift_bridgeObjectRelease();
  uint64_t v47 = sub_24C88EDD0();
  LOBYTE(v44) = v48;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v28, v145);
  if (v44)
  {
    if (qword_2697F8620 != -1) {
      swift_once();
    }
    uint64_t v66 = sub_24C88F1A0();
    __swift_project_value_buffer(v66, (uint64_t)qword_2697F8628);
    uint64_t v67 = v142;
    uint64_t v68 = *(void (**)(char *, char *, uint64_t))(v142 + 16);
    uint64_t v69 = v140;
    uint64_t v70 = v150;
    v68(v140, v148, v150);
    v71 = v141;
    v68(v141, v149, v70);
    os_log_type_t v72 = sub_24C88F180();
    os_log_type_t v73 = sub_24C88F2B0();
    int v74 = v73;
    if (os_log_type_enabled(v72, v73))
    {
      uint64_t v75 = swift_slowAlloc();
      uint64_t v151 = swift_slowAlloc();
      uint64_t v152 = v151;
      *(_DWORD *)uint64_t v75 = 136315394;
      sub_24C88ED00(&qword_2697F85D8, MEMORY[0x263F07490]);
      LODWORD(v145) = v74;
      uint64_t v76 = sub_24C88F350();
      uint64_t v153 = sub_24C88C1C0(v76, v77, &v152);
      sub_24C88F2D0();
      swift_bridgeObjectRelease();
      v78 = *(void (**)(char *, uint64_t))(v67 + 8);
      v78(v69, v70);
      *(_WORD *)(v75 + 12) = 2080;
      v79 = v141;
      uint64_t v80 = sub_24C88F350();
      uint64_t v153 = sub_24C88C1C0(v80, v81, &v152);
      uint64_t v70 = v150;
      sub_24C88F2D0();
      swift_bridgeObjectRelease();
      v78(v79, v70);
      _os_log_impl(&dword_24C886000, v72, (os_log_type_t)v145, "Dates are invalid. Start: %s Today: %s", (uint8_t *)v75, 0x16u);
      uint64_t v82 = v151;
      swift_arrayDestroy();
      MEMORY[0x2532FE580](v82, -1, -1);
      MEMORY[0x2532FE580](v75, -1, -1);
    }
    else
    {
      v78 = *(void (**)(char *, uint64_t))(v67 + 8);
      v78(v69, v70);
      v78(v71, v70);
    }

    v78(v148, v70);
    v78(v149, v70);
    v78(v147, v70);
    (*(void (**)(char *, uint64_t))(v143 + 8))(v146, v144);
    return 0;
  }
  else
  {
    uint64_t v50 = v146;
    if (v47 < 0 && (v51 = __OFSUB__(0, v47), uint64_t v47 = -v47, v51))
    {
      __break(1u);
    }
    else
    {
      if (v47 <= 1)
      {
        uint64_t v83 = v106;
        sub_24C88EF50();
        v84 = v109;
        sub_24C88EF30();
        uint64_t v85 = v107;
        sub_24C88EDB0();
        (*(void (**)(char *, uint64_t))(v113 + 8))(v84, v114);
        (*(void (**)(char *, uint64_t))(v108 + 8))(v83, v110);
        sub_24C88ED00(&qword_2697F85E8, MEMORY[0x263F07338]);
        uint64_t v86 = v112;
        sub_24C88EFA0();
        (*(void (**)(char *, uint64_t))(v111 + 8))(v85, v86);
      }
      else
      {
        uint64_t v52 = *MEMORY[0x263F078A0];
        uint64_t v53 = v115;
        uint64_t v54 = v117;
        uint64_t v55 = (void (*)(char *, uint64_t, uint64_t))v105;
        v105((unint64_t)v115, v52, v117);
        uint64_t v56 = sub_24C88F040();
        uint64_t v57 = *(void (**)(char *, uint64_t))(v116 + 8);
        v57(v53, v54);
        v55(v53, v52, v54);
        uint64_t v58 = sub_24C88F040();
        uint64_t v59 = ((uint64_t (*)(char *, uint64_t))v57)(v53, v54);
        v60 = (void (**)(char *, uint64_t))(v118 + 8);
        if (v56 == v58)
        {
          uint64_t v61 = v119;
          MEMORY[0x2532FDBA0](v59);
          v62 = v120;
          sub_24C88EEC0();
          id v63 = v123;
          sub_24C88EE30();
          (*(void (**)(char *, uint64_t))(v121 + 8))(v62, v122);
          uint64_t v64 = *v60;
          uint64_t v65 = v136;
          (*v60)(v61, v136);
        }
        else
        {
          v87 = v101;
          MEMORY[0x2532FDBA0](v59);
          v88 = v102;
          sub_24C88EEA0();
          uint64_t v89 = v119;
          sub_24C88EE20();
          (*(void (**)(char *, uint64_t))(v103 + 8))(v88, v104);
          uint64_t v64 = *v60;
          uint64_t v65 = v136;
          (*v60)(v87, v136);
          v90 = v120;
          sub_24C88EEC0();
          id v63 = v123;
          sub_24C88EE30();
          (*(void (**)(char *, uint64_t))(v121 + 8))(v90, v122);
          v64(v89, v65);
        }
        v91 = v124;
        sub_24C88EE40();
        v92 = v126;
        sub_24C88EE00();
        (*(void (**)(char *, uint64_t))(v125 + 8))(v91, v127);
        v64(v63, v65);
        unsigned int v93 = v129;
        sub_24C88EE70();
        v94 = v130;
        sub_24C88EE60();
        (*(void (**)(char *, uint64_t))(v132 + 8))(v93, v133);
        v95 = v128;
        sub_24C88EE10();
        (*(void (**)(char *, uint64_t))(v134 + 8))(v94, v135);
        v64(v92, v65);
        v96 = v137;
        sub_24C88EEE0();
        v97 = v131;
        sub_24C88EF00();
        (*(void (**)(char *, uint64_t))(v138 + 8))(v96, v139);
        v64(v95, v65);
        sub_24C88ED00(&qword_2697F85F0, MEMORY[0x263F07258]);
        sub_24C88EFA0();
        v64(v97, v65);
      }
      v98 = *(void (**)(char *, uint64_t))(v142 + 8);
      uint64_t v99 = v150;
      v98(v148, v150);
      v98(v149, v99);
      v98(v147, v99);
      (*(void (**)(char *, uint64_t))(v143 + 8))(v50, v144);
      return v152;
    }
  }
  return result;
}

uint64_t sub_24C88DFC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24C88EFB0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v32 - v9;
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08780]), sel_init);
  objc_msgSend(v11, sel_setAllowedUnits_, 112);
  sub_24C88EF20();
  if (v12 < 60.0) {
    objc_msgSend(v11, sel_setAllowedUnits_, (unint64_t)objc_msgSend(v11, sel_allowedUnits) | 0x80);
  }
  objc_msgSend(v11, sel_setUnitsStyle_, 3);
  uint64_t v13 = (void *)sub_24C88EF80();
  uint64_t v14 = (void *)sub_24C88EF80();
  id v15 = objc_msgSend(v11, sel_stringFromDate_toDate_, v13, v14);

  if (v15)
  {
    uint64_t v16 = sub_24C88F1E0();
  }
  else
  {
    if (qword_2697F8620 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_24C88F1A0();
    __swift_project_value_buffer(v17, (uint64_t)qword_2697F8628);
    uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v18(v10, a1, v4);
    v18(v8, a2, v4);
    uint64_t v19 = sub_24C88F180();
    os_log_type_t v20 = sub_24C88F2B0();
    int v21 = v20;
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v37 = v35;
      *(_DWORD *)uint64_t v22 = 136315394;
      os_log_t v33 = (os_log_t)(v22 + 4);
      sub_24C88ED00(&qword_2697F85D8, MEMORY[0x263F07490]);
      int v34 = v21;
      uint64_t v23 = sub_24C88F350();
      uint64_t v36 = sub_24C88C1C0(v23, v24, &v37);
      sub_24C88F2D0();
      swift_bridgeObjectRelease();
      os_log_t v33 = v19;
      uint64_t v25 = *(void (**)(char *, uint64_t))(v5 + 8);
      v25(v10, v4);
      *(_WORD *)(v22 + 12) = 2080;
      uint64_t v26 = sub_24C88F350();
      uint64_t v36 = sub_24C88C1C0(v26, v27, &v37);
      sub_24C88F2D0();
      swift_bridgeObjectRelease();
      v25(v8, v4);
      os_log_t v28 = v33;
      _os_log_impl(&dword_24C886000, v33, (os_log_type_t)v34, "Dates are invalid. Start: %s End: %s", (uint8_t *)v22, 0x16u);
      uint64_t v29 = v35;
      swift_arrayDestroy();
      MEMORY[0x2532FE580](v29, -1, -1);
      MEMORY[0x2532FE580](v22, -1, -1);
    }
    else
    {
      uint64_t v30 = *(void (**)(char *, uint64_t))(v5 + 8);
      v30(v10, v4);
      v30(v8, v4);
    }
    return 0;
  }
  return v16;
}

unint64_t sub_24C88E404()
{
  unint64_t result = qword_2697F8548;
  if (!qword_2697F8548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F8548);
  }
  return result;
}

unint64_t sub_24C88E45C()
{
  unint64_t result = qword_2697F8558;
  if (!qword_2697F8558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F8558);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DSContinuityError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for DSContinuityError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24C88E5A4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24C88E5CC()
{
  return 0;
}

ValueMetadata *type metadata accessor for DSContinuityError()
{
  return &type metadata for DSContinuityError;
}

uint64_t type metadata accessor for DSContinuityPairing()
{
  return self;
}

uint64_t sub_24C88E60C()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24C88E654()
{
  uint64_t v2 = v0[2];
  int v3 = (const void *)v0[3];
  unsigned int v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24C88E708;
  uint64_t v6 = (uint64_t (*)(uint64_t, const void *, void *))((char *)&dword_2697F8568 + dword_2697F8568);
  return v6(v2, v3, v4);
}

uint64_t sub_24C88E708()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24C88E800()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24C88EDAC;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2697F8578 + dword_2697F8578);
  return v6(v2, v3, v4);
}

uint64_t sub_24C88E8C4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24C88EDAC;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2697F8588 + dword_2697F8588);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_24C88E990(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24C88E9EC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24C88EA24(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24C88E708;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2697F8598 + dword_2697F8598);
  return v6(a1, v4);
}

uint64_t sub_24C88EADC()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24C88EB1C()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24C88EDAC;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_2697F85A8 + dword_2697F85A8);
  return v5(v2, v3);
}

uint64_t objectdestroy_14Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

unint64_t sub_24C88EC10()
{
  unint64_t result = qword_2697F85C8;
  if (!qword_2697F85C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2697F85C8);
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

uint64_t sub_24C88ECA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24C88ED00(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24C88EDB0()
{
  return MEMORY[0x270EEDD00]();
}

uint64_t sub_24C88EDC0()
{
  return MEMORY[0x270EEDD10]();
}

uint64_t sub_24C88EDD0()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_24C88EDE0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_24C88EDF0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24C88EE00()
{
  return MEMORY[0x270EF0420]();
}

uint64_t sub_24C88EE10()
{
  return MEMORY[0x270EF0430]();
}

uint64_t sub_24C88EE20()
{
  return MEMORY[0x270EF0440]();
}

uint64_t sub_24C88EE30()
{
  return MEMORY[0x270EF0448]();
}

uint64_t sub_24C88EE40()
{
  return MEMORY[0x270EF0498]();
}

uint64_t sub_24C88EE50()
{
  return MEMORY[0x270EF04B0]();
}

uint64_t sub_24C88EE60()
{
  return MEMORY[0x270EF04D8]();
}

uint64_t sub_24C88EE70()
{
  return MEMORY[0x270EF04F0]();
}

uint64_t sub_24C88EE80()
{
  return MEMORY[0x270EF0508]();
}

uint64_t sub_24C88EE90()
{
  return MEMORY[0x270EF0518]();
}

uint64_t sub_24C88EEA0()
{
  return MEMORY[0x270EF0548]();
}

uint64_t sub_24C88EEB0()
{
  return MEMORY[0x270EF0568]();
}

uint64_t sub_24C88EEC0()
{
  return MEMORY[0x270EF0580]();
}

uint64_t sub_24C88EED0()
{
  return MEMORY[0x270EF0598]();
}

uint64_t sub_24C88EEE0()
{
  return MEMORY[0x270EF05A0]();
}

uint64_t sub_24C88EEF0()
{
  return MEMORY[0x270EF05B8]();
}

uint64_t sub_24C88EF00()
{
  return MEMORY[0x270EF0690]();
}

uint64_t sub_24C88EF10()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_24C88EF20()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_24C88EF30()
{
  return MEMORY[0x270EF08F0]();
}

uint64_t sub_24C88EF40()
{
  return MEMORY[0x270EF0908]();
}

uint64_t sub_24C88EF50()
{
  return MEMORY[0x270EF0918]();
}

uint64_t sub_24C88EF60()
{
  return MEMORY[0x270EF0920]();
}

uint64_t sub_24C88EF70()
{
  return MEMORY[0x270EF0938]();
}

uint64_t sub_24C88EF80()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_24C88EF90()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_24C88EFA0()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_24C88EFB0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24C88EFC0()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_24C88EFD0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_24C88EFE0()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_24C88EFF0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24C88F000()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_24C88F010()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_24C88F020()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_24C88F030()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_24C88F040()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_24C88F050()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_24C88F060()
{
  return MEMORY[0x270F5CBB0]();
}

uint64_t sub_24C88F070()
{
  return MEMORY[0x270F5CBC0]();
}

uint64_t sub_24C88F080()
{
  return MEMORY[0x270F5CBF0]();
}

uint64_t sub_24C88F090()
{
  return MEMORY[0x270F5CBF8]();
}

uint64_t sub_24C88F0A0()
{
  return MEMORY[0x270F5CC00]();
}

uint64_t sub_24C88F0B0()
{
  return MEMORY[0x270F5CC08]();
}

uint64_t sub_24C88F0C0()
{
  return MEMORY[0x270F5CC10]();
}

uint64_t sub_24C88F0D0()
{
  return MEMORY[0x270F5CC18]();
}

uint64_t sub_24C88F0E0()
{
  return MEMORY[0x270F5CC20]();
}

uint64_t sub_24C88F0F0()
{
  return MEMORY[0x270F5CC30]();
}

uint64_t sub_24C88F100()
{
  return MEMORY[0x270F5CC38]();
}

uint64_t sub_24C88F110()
{
  return MEMORY[0x270F5CC50]();
}

uint64_t sub_24C88F120()
{
  return MEMORY[0x270F5CC58]();
}

uint64_t sub_24C88F130()
{
  return MEMORY[0x270F5CC60]();
}

uint64_t sub_24C88F140()
{
  return MEMORY[0x270F5CC68]();
}

uint64_t sub_24C88F150()
{
  return MEMORY[0x270F5CC70]();
}

uint64_t sub_24C88F160()
{
  return MEMORY[0x270F5CC78]();
}

uint64_t sub_24C88F170()
{
  return MEMORY[0x270F5CC80]();
}

uint64_t sub_24C88F180()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24C88F190()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24C88F1A0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24C88F1B0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24C88F1C0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24C88F1D0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24C88F1E0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24C88F1F0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24C88F200()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24C88F210()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24C88F220()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24C88F230()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24C88F240()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24C88F250()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24C88F270()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24C88F280()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24C88F290()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_24C88F2A0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24C88F2B0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24C88F2C0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24C88F2D0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24C88F2E0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24C88F2F0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24C88F300()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24C88F310()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24C88F320()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24C88F330()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24C88F340()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24C88F350()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24C88F360()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24C88F370()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24C88F380()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24C88F390()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24C88F3A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24C88F3B0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24C88F3C0()
{
  return MEMORY[0x270F9FC90]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
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