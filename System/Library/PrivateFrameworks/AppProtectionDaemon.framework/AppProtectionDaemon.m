void APDServerEntry(int a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id i;
  uint64_t vars8;

  v4 = a1;
  for (i = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a1]; v4; --v4)
  {
    v5 = *a2++;
    v6 = [NSString stringWithUTF8String:v5];
    [i addObject:v6];
  }
  v7 = objc_opt_new();
  [v7 runWithArguments:i];
}

uint64_t sub_247DF5938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[14] = a5;
  v6[15] = a6;
  v6[13] = a4;
  uint64_t v7 = sub_247E00140();
  v6[16] = v7;
  v6[17] = *(void *)(v7 - 8);
  v6[18] = swift_task_alloc();
  uint64_t v8 = sub_247E00160();
  v6[19] = v8;
  v6[20] = *(void *)(v8 - 8);
  v6[21] = swift_task_alloc();
  uint64_t v9 = sub_247DFFFE0();
  v6[22] = v9;
  v6[23] = *(void *)(v9 - 8);
  v6[24] = swift_task_alloc();
  v6[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1394B8);
  v6[26] = swift_task_alloc();
  v6[27] = swift_task_alloc();
  uint64_t v10 = sub_247E000F0();
  v6[28] = v10;
  v6[29] = *(void *)(v10 - 8);
  v6[30] = swift_task_alloc();
  uint64_t v11 = sub_247E00130();
  v6[31] = v11;
  v6[32] = *(void *)(v11 - 8);
  v6[33] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247DF5BBC, 0, 0);
}

uint64_t sub_247DF5BBC()
{
  (*(void (**)(void, void, void))(v0[29] + 104))(v0[30], *MEMORY[0x263F389A8], v0[28]);
  sub_247E00120();
  v1 = (void *)swift_task_alloc();
  v0[34] = v1;
  void *v1 = v0;
  v1[1] = sub_247DF5C88;
  return MEMORY[0x270F24E98]();
}

uint64_t sub_247DF5C88(uint64_t a1)
{
  v4 = (void *)*v2;
  v4[35] = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_247DF6A74, 0, 0);
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    if (a1) {
      uint64_t v5 = a1;
    }
    v4[36] = v5;
    v6 = (void *)swift_task_alloc();
    v4[37] = v6;
    void *v6 = v4;
    v6[1] = sub_247DF5E1C;
    return MEMORY[0x270F24EA0]();
  }
}

uint64_t sub_247DF5E1C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 304) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_247DF6CB4;
  }
  else
  {
    *(void *)(v4 + 312) = a1;
    uint64_t v5 = sub_247DF5F44;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_247DF5F44()
{
  uint64_t v106 = v0;
  uint64_t isUniquelyReferenced_nonNull_native = v0;
  if (*(void *)(v0 + 312)) {
    unint64_t v2 = *(void *)(v0 + 312);
  }
  else {
    unint64_t v2 = MEMORY[0x263F8EE78];
  }
  if (qword_26B139368 != -1) {
    goto LABEL_76;
  }
  while (1)
  {
    uint64_t v3 = sub_247E000C0();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B139558);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v4 = sub_247E000A0();
    os_log_type_t v5 = sub_247E00250();
    unint64_t v92 = v2;
    v104 = (void *)isUniquelyReferenced_nonNull_native;
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      v105 = (void *)v7;
      *(_DWORD *)uint64_t v6 = 136315394;
      uint64_t v8 = swift_bridgeObjectRetain();
      uint64_t v9 = MEMORY[0x24C56C010](v8, MEMORY[0x263F8D310]);
      unint64_t v11 = v10;
      swift_bridgeObjectRelease();
      uint64_t v12 = v9;
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v104;
      v104[9] = sub_247DFC7F0(v12, v11, (uint64_t *)&v105);
      sub_247E002A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v6 + 12) = 2080;
      uint64_t v13 = swift_bridgeObjectRetain();
      uint64_t v14 = MEMORY[0x24C56C010](v13, MEMORY[0x263F8D310]);
      unint64_t v16 = v15;
      swift_bridgeObjectRelease();
      uint64_t v17 = v14;
      unint64_t v2 = v92;
      v104[10] = sub_247DFC7F0(v17, v16, (uint64_t *)&v105);
      sub_247E002A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_247DF4000, v4, v5, "Unlockable apps: %s, unhideable apps: %s", (uint8_t *)v6, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C56C620](v7, -1, -1);
      MEMORY[0x24C56C620](v6, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    uint64_t v18 = *(void *)(isUniquelyReferenced_nonNull_native + 288);
    uint64_t v19 = *(void *)(v18 + 16);
    uint64_t v101 = v19;
    if (!v19) {
      break;
    }
    uint64_t v102 = *(void *)(isUniquelyReferenced_nonNull_native + 184);
    swift_bridgeObjectRetain_n();
    v20 = (uint64_t *)(v18 + 40);
    v21 = (void *)MEMORY[0x263F8EE80];
    uint64_t v22 = v19;
    while (1)
    {
      uint64_t v29 = *(v20 - 1);
      uint64_t v28 = *v20;
      swift_bridgeObjectRetain();
      sub_247DFFFC0();
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v105 = v21;
      unint64_t v2 = sub_247DFC164(v29, v28);
      uint64_t v31 = v21[2];
      BOOL v32 = (v30 & 1) == 0;
      uint64_t v33 = v31 + v32;
      if (__OFADD__(v31, v32)) {
        break;
      }
      char v34 = v30;
      if (v21[3] >= v33)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v104;
          if ((v30 & 1) == 0) {
            goto LABEL_19;
          }
        }
        else
        {
          sub_247DFD2D8();
          v21 = v105;
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v104;
          if ((v34 & 1) == 0) {
            goto LABEL_19;
          }
        }
      }
      else
      {
        sub_247DFCEF8(v33, isUniquelyReferenced_nonNull_native);
        v21 = v105;
        unint64_t v35 = sub_247DFC164(v29, v28);
        if ((v34 & 1) != (v36 & 1))
        {
LABEL_63:
          uint64_t v79 = MEMORY[0x263F8D310];
          return MEMORY[0x270F9FB18](v79);
        }
        unint64_t v2 = v35;
        uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v104;
        if ((v34 & 1) == 0)
        {
LABEL_19:
          uint64_t v37 = *(void *)(isUniquelyReferenced_nonNull_native + 200);
          uint64_t v38 = *(void *)(isUniquelyReferenced_nonNull_native + 176);
          v21[(v2 >> 6) + 8] |= 1 << v2;
          v39 = (uint64_t *)(v21[6] + 16 * v2);
          uint64_t *v39 = v29;
          v39[1] = v28;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v102 + 32))(v21[7] + *(void *)(v102 + 72) * v2, v37, v38);
          uint64_t v40 = v21[2];
          BOOL v41 = __OFADD__(v40, 1);
          uint64_t v42 = v40 + 1;
          if (v41) {
            goto LABEL_73;
          }
          uint64_t v43 = *(void *)(isUniquelyReferenced_nonNull_native + 216);
          uint64_t v44 = *(void *)(isUniquelyReferenced_nonNull_native + 176);
          v21[2] = v42;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v102 + 56))(v43, 1, 1, v44);
          swift_bridgeObjectRetain();
          goto LABEL_11;
        }
      }
      uint64_t v23 = *(void *)(isUniquelyReferenced_nonNull_native + 216);
      unint64_t v97 = *(void *)(isUniquelyReferenced_nonNull_native + 200);
      uint64_t v24 = *(void *)(isUniquelyReferenced_nonNull_native + 176);
      unint64_t v25 = *(void *)(v102 + 72) * v2;
      v26 = *(void (**)(uint64_t, unint64_t, uint64_t))(v102 + 32);
      v26(v23, v21[7] + v25, v24);
      v26(v21[7] + v25, v97, v24);
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v104;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v102 + 56))(v23, 0, 1, v24);
LABEL_11:
      uint64_t v27 = *(void *)(isUniquelyReferenced_nonNull_native + 216);
      swift_bridgeObjectRelease();
      sub_247DFEFEC(v27, &qword_26B1394B8);
      swift_bridgeObjectRelease();
      v20 += 2;
      if (!--v22)
      {
        swift_bridgeObjectRelease_n();
        unint64_t v2 = v92;
        uint64_t v19 = v101;
        goto LABEL_25;
      }
    }
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    swift_once();
  }
  v21 = (void *)MEMORY[0x263F8EE80];
LABEL_25:
  v45 = *(void **)(isUniquelyReferenced_nonNull_native + 288);
  uint64_t v100 = *(void *)(v2 + 16);
  if (v100)
  {
    uint64_t v46 = *(void *)(isUniquelyReferenced_nonNull_native + 184);
    unint64_t v99 = v2 + 32;
    swift_bridgeObjectRetain();
    uint64_t v47 = 0;
    v94 = v45;
    v90 = v45 + 9;
    while (1)
    {
      v54 = (unint64_t *)(v99 + 16 * v47);
      unint64_t v2 = *v54;
      uint64_t v55 = v54[1];
      if (v19)
      {
        BOOL v56 = v94[4] == v2 && v94[5] == v55;
        if (!v56)
        {
          char v57 = sub_247E00380();
          if (v19 != 1 && (v57 & 1) == 0 && (v94[6] != v2 || v94[7] != v55))
          {
            char v59 = sub_247E00380();
            if (v19 != 2 && (v59 & 1) == 0)
            {
              v60 = v90;
              uint64_t v61 = 2;
              do
              {
                uint64_t isUniquelyReferenced_nonNull_native = v61 + 1;
                if (__OFADD__(v61, 1)) {
                  goto LABEL_75;
                }
                BOOL v62 = *(v60 - 1) == v2 && *v60 == v55;
                if (v62 || (sub_247E00380() & 1) != 0)
                {
                  uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v104;
                  break;
                }
                ++v61;
                v60 += 2;
                BOOL v56 = isUniquelyReferenced_nonNull_native == v101;
                uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v104;
              }
              while (!v56);
            }
          }
        }
      }
      swift_bridgeObjectRetain();
      sub_247DFFFC0();
      int v63 = swift_isUniquelyReferenced_nonNull_native();
      v105 = v21;
      unint64_t v65 = sub_247DFC164(v2, v55);
      uint64_t v66 = v21[2];
      BOOL v67 = (v64 & 1) == 0;
      uint64_t v68 = v66 + v67;
      if (__OFADD__(v66, v67)) {
        goto LABEL_72;
      }
      char v69 = v64;
      if (v21[3] >= v68)
      {
        if (v63)
        {
          uint64_t v103 = v47;
          if ((v64 & 1) == 0) {
            goto LABEL_58;
          }
        }
        else
        {
          sub_247DFD2D8();
          v21 = v105;
          uint64_t v103 = v47;
          if ((v69 & 1) == 0) {
            goto LABEL_58;
          }
        }
      }
      else
      {
        sub_247DFCEF8(v68, v63);
        v21 = v105;
        unint64_t v70 = sub_247DFC164(v2, v55);
        if ((v69 & 1) != (v71 & 1)) {
          goto LABEL_63;
        }
        unint64_t v65 = v70;
        uint64_t v103 = v47;
        if ((v69 & 1) == 0)
        {
LABEL_58:
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v104;
          uint64_t v72 = v104[24];
          uint64_t v73 = v104[22];
          v21[(v65 >> 6) + 8] |= 1 << v65;
          v74 = (unint64_t *)(v21[6] + 16 * v65);
          unint64_t *v74 = v2;
          v74[1] = v55;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v46 + 32))(v21[7] + *(void *)(v46 + 72) * v65, v72, v73);
          uint64_t v75 = v21[2];
          BOOL v41 = __OFADD__(v75, 1);
          uint64_t v76 = v75 + 1;
          if (v41) {
            goto LABEL_74;
          }
          uint64_t v77 = v104[26];
          uint64_t v78 = v104[22];
          v21[2] = v76;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 56))(v77, 1, 1, v78);
          swift_bridgeObjectRetain();
          goto LABEL_28;
        }
      }
      uint64_t v48 = v104[26];
      unint64_t v49 = v104[24];
      uint64_t v50 = v104[22];
      unint64_t v51 = *(void *)(v46 + 72) * v65;
      v52 = *(void (**)(uint64_t, unint64_t, uint64_t))(v46 + 32);
      v52(v48, v21[7] + v51, v50);
      v52(v21[7] + v51, v49, v50);
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v104;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v46 + 56))(v48, 0, 1, v50);
LABEL_28:
      uint64_t v47 = v103 + 1;
      uint64_t v53 = *(void *)(isUniquelyReferenced_nonNull_native + 208);
      swift_bridgeObjectRelease();
      sub_247DFEFEC(v53, &qword_26B1394B8);
      swift_bridgeObjectRelease();
      uint64_t v19 = v101;
      if (v103 + 1 == v100)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_68;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_68:
  swift_bridgeObjectRelease();
  uint64_t v96 = *(void *)(isUniquelyReferenced_nonNull_native + 248);
  uint64_t v98 = *(void *)(isUniquelyReferenced_nonNull_native + 264);
  uint64_t v80 = *(void *)(isUniquelyReferenced_nonNull_native + 168);
  uint64_t v93 = *(void *)(isUniquelyReferenced_nonNull_native + 152);
  uint64_t v95 = *(void *)(isUniquelyReferenced_nonNull_native + 256);
  uint64_t v81 = *(void *)(isUniquelyReferenced_nonNull_native + 136);
  uint64_t v89 = *(void *)(isUniquelyReferenced_nonNull_native + 144);
  uint64_t v82 = *(void *)(isUniquelyReferenced_nonNull_native + 120);
  uint64_t v83 = *(void *)(isUniquelyReferenced_nonNull_native + 128);
  uint64_t v84 = *(void *)(isUniquelyReferenced_nonNull_native + 112);
  uint64_t v91 = *(void *)(isUniquelyReferenced_nonNull_native + 160);
  v85 = (void *)swift_allocObject();
  v85[2] = v84;
  v85[3] = v82;
  v85[4] = v21;
  *(void *)(isUniquelyReferenced_nonNull_native + 48) = sub_247DFF178;
  *(void *)(isUniquelyReferenced_nonNull_native + 56) = v85;
  *(void *)(isUniquelyReferenced_nonNull_native + 16) = MEMORY[0x263EF8330];
  *(void *)(isUniquelyReferenced_nonNull_native + 24) = 1107296256;
  *(void *)(isUniquelyReferenced_nonNull_native + 32) = sub_247DF7974;
  *(void *)(isUniquelyReferenced_nonNull_native + 40) = &block_descriptor_29;
  v86 = _Block_copy((const void *)(isUniquelyReferenced_nonNull_native + 16));
  swift_bridgeObjectRetain();
  swift_retain();
  sub_247E00150();
  *(void *)(isUniquelyReferenced_nonNull_native + 64) = MEMORY[0x263F8EE78];
  sub_247DFF20C(&qword_26B1394E8, 255, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B139380);
  sub_247DFF1A8(&qword_26B139508, (uint64_t *)&unk_26B139380);
  sub_247E002C0();
  MEMORY[0x24C56C0A0](0, v80, v89, v86);
  _Block_release(v86);
  (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v89, v83);
  (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v80, v93);
  (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v98, v96);
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v87 = *(uint64_t (**)(void))(isUniquelyReferenced_nonNull_native + 8);
  return v87();
}

uint64_t sub_247DF6A74()
{
  if (qword_26B139368 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 280);
  uint64_t v2 = sub_247E000C0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B139558);
  id v3 = v1;
  id v4 = v1;
  os_log_type_t v5 = sub_247E000A0();
  os_log_type_t v6 = sub_247E00240();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void **)(v0 + 280);
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    unint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 96) = v12;
    sub_247E002A0();
    *unint64_t v10 = v12;

    _os_log_impl(&dword_247DF4000, v5, v6, "couldn't get unhideable apps: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B139540);
    swift_arrayDestroy();
    MEMORY[0x24C56C620](v10, -1, -1);
    MEMORY[0x24C56C620](v9, -1, -1);
  }
  else
  {
  }
  *(void *)(v0 + 288) = MEMORY[0x263F8EE78];
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_247DF5E1C;
  return MEMORY[0x270F24EA0]();
}

uint64_t sub_247DF6CB4()
{
  unint64_t v118 = v0;
  unint64_t isUniquelyReferenced_nonNull_native = v0;
  unint64_t v2 = 0x26B139000uLL;
  if (qword_26B139368 != -1) {
    goto LABEL_77;
  }
  while (1)
  {
    id v3 = *(void **)(isUniquelyReferenced_nonNull_native + 304);
    uint64_t v4 = sub_247E000C0();
    __swift_project_value_buffer(v4, (uint64_t)qword_26B139558);
    id v5 = v3;
    id v6 = v3;
    BOOL v7 = sub_247E000A0();
    os_log_type_t v8 = sub_247E00240();
    BOOL v9 = os_log_type_enabled(v7, v8);
    unint64_t v10 = *(void **)(isUniquelyReferenced_nonNull_native + 304);
    v116 = (void *)isUniquelyReferenced_nonNull_native;
    if (v9)
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = (void *)swift_slowAlloc();
      *(_DWORD *)id v11 = 138412290;
      id v13 = v10;
      uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(isUniquelyReferenced_nonNull_native + 88) = v14;
      sub_247E002A0();
      *uint64_t v12 = v14;

      _os_log_impl(&dword_247DF4000, v7, v8, "couldn't get unlockable apps: %@", v11, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B139540);
      swift_arrayDestroy();
      MEMORY[0x24C56C620](v12, -1, -1);
      MEMORY[0x24C56C620](v11, -1, -1);
    }
    else
    {
    }
    uint64_t v15 = *(void **)(isUniquelyReferenced_nonNull_native + 304);

    if (*(void *)(v2 + 872) != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v4, (uint64_t)qword_26B139558);
    uint64_t v16 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v17 = sub_247E000A0();
    os_log_type_t v18 = sub_247E00250();
    unint64_t v2 = v18;
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v112 = swift_slowAlloc();
      v117 = (void *)v112;
      *(_DWORD *)uint64_t v19 = 136315394;
      uint64_t v20 = swift_bridgeObjectRetain();
      uint64_t v21 = MEMORY[0x24C56C010](v20, MEMORY[0x263F8D310]);
      unint64_t v23 = v22;
      swift_bridgeObjectRelease();
      *(void *)(isUniquelyReferenced_nonNull_native + 72) = sub_247DFC7F0(v21, v23, (uint64_t *)&v117);
      sub_247E002A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v19 + 12) = 2080;
      uint64_t v24 = swift_bridgeObjectRetain();
      uint64_t v25 = MEMORY[0x24C56C010](v24, MEMORY[0x263F8D310]);
      unint64_t v27 = v26;
      swift_bridgeObjectRelease();
      *(void *)(isUniquelyReferenced_nonNull_native + 80) = sub_247DFC7F0(v25, v27, (uint64_t *)&v117);
      uint64_t v16 = MEMORY[0x263F8EE78];
      sub_247E002A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_247DF4000, v17, (os_log_type_t)v2, "Unlockable apps: %s, unhideable apps: %s", (uint8_t *)v19, 0x16u);
      unint64_t v2 = v112;
      swift_arrayDestroy();
      MEMORY[0x24C56C620](v112, -1, -1);
      MEMORY[0x24C56C620](v19, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    uint64_t v28 = *(void *)(isUniquelyReferenced_nonNull_native + 288);
    uint64_t v29 = *(void *)(v28 + 16);
    uint64_t v113 = v29;
    if (!v29) {
      break;
    }
    uint64_t v30 = *(void *)(isUniquelyReferenced_nonNull_native + 184);
    uint64_t v114 = v30;
    v109 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56);
    unint64_t v110 = v30 + 32;
    swift_bridgeObjectRetain_n();
    uint64_t v31 = (uint64_t *)(v28 + 40);
    BOOL v32 = (void *)MEMORY[0x263F8EE80];
    uint64_t v33 = v29;
    unint64_t v2 = v110;
    while (1)
    {
      uint64_t v40 = *(v31 - 1);
      uint64_t v39 = *v31;
      swift_bridgeObjectRetain();
      sub_247DFFFC0();
      unint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v117 = v32;
      unint64_t v42 = sub_247DFC164(v40, v39);
      uint64_t v43 = v32[2];
      BOOL v44 = (v41 & 1) == 0;
      uint64_t v45 = v43 + v44;
      if (__OFADD__(v43, v44)) {
        break;
      }
      char v46 = v41;
      if (v32[3] >= v45)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          unint64_t isUniquelyReferenced_nonNull_native = (unint64_t)v116;
          if ((v41 & 1) == 0) {
            goto LABEL_21;
          }
        }
        else
        {
          sub_247DFD2D8();
          BOOL v32 = v117;
          unint64_t isUniquelyReferenced_nonNull_native = (unint64_t)v116;
          if ((v46 & 1) == 0) {
            goto LABEL_21;
          }
        }
      }
      else
      {
        sub_247DFCEF8(v45, isUniquelyReferenced_nonNull_native);
        BOOL v32 = v117;
        unint64_t v47 = sub_247DFC164(v40, v39);
        if ((v46 & 1) != (v48 & 1))
        {
LABEL_64:
          uint64_t v90 = MEMORY[0x263F8D310];
          return MEMORY[0x270F9FB18](v90);
        }
        unint64_t v42 = v47;
        unint64_t isUniquelyReferenced_nonNull_native = (unint64_t)v116;
        if ((v46 & 1) == 0)
        {
LABEL_21:
          uint64_t v49 = *(void *)(isUniquelyReferenced_nonNull_native + 200);
          uint64_t v50 = *(void *)(isUniquelyReferenced_nonNull_native + 176);
          v32[(v42 >> 6) + 8] |= 1 << v42;
          unint64_t v51 = (uint64_t *)(v32[6] + 16 * v42);
          *unint64_t v51 = v40;
          v51[1] = v39;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v114 + 32))(v32[7] + *(void *)(v114 + 72) * v42, v49, v50);
          uint64_t v52 = v32[2];
          BOOL v53 = __OFADD__(v52, 1);
          uint64_t v54 = v52 + 1;
          if (v53) {
            goto LABEL_74;
          }
          uint64_t v55 = *(void *)(isUniquelyReferenced_nonNull_native + 216);
          uint64_t v56 = *(void *)(isUniquelyReferenced_nonNull_native + 176);
          v32[2] = v54;
          (*v109)(v55, 1, 1, v56);
          swift_bridgeObjectRetain();
          goto LABEL_13;
        }
      }
      uint64_t v34 = *(void *)(isUniquelyReferenced_nonNull_native + 216);
      unint64_t v107 = *(void *)(isUniquelyReferenced_nonNull_native + 200);
      uint64_t v35 = *(void *)(isUniquelyReferenced_nonNull_native + 176);
      unint64_t v36 = *(void *)(v114 + 72) * v42;
      uint64_t v37 = *(void (**)(uint64_t, unint64_t, uint64_t))(v114 + 32);
      v37(v34, v32[7] + v36, v35);
      v37(v32[7] + v36, v107, v35);
      unint64_t isUniquelyReferenced_nonNull_native = (unint64_t)v116;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v114 + 56))(v34, 0, 1, v35);
LABEL_13:
      uint64_t v38 = *(void *)(isUniquelyReferenced_nonNull_native + 216);
      swift_bridgeObjectRelease();
      sub_247DFEFEC(v38, &qword_26B1394B8);
      swift_bridgeObjectRelease();
      v31 += 2;
      if (!--v33)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v16 = MEMORY[0x263F8EE78];
        uint64_t v29 = v113;
        goto LABEL_27;
      }
    }
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    swift_once();
  }
  BOOL v32 = (void *)MEMORY[0x263F8EE80];
LABEL_27:
  char v57 = *(void **)(isUniquelyReferenced_nonNull_native + 288);
  uint64_t v111 = *(void *)(v16 + 16);
  if (v111)
  {
    uint64_t v58 = *(void *)(isUniquelyReferenced_nonNull_native + 184);
    swift_bridgeObjectRetain();
    uint64_t v59 = 0;
    uint64_t v103 = v57 + 9;
    v105 = v57;
    while (1)
    {
      uint64_t v65 = v16 + 16 * v59;
      uint64_t v67 = *(void *)(v65 + 32);
      uint64_t v66 = *(void *)(v65 + 40);
      if (v29)
      {
        if (v105[4] != v67 || v105[5] != v66)
        {
          char v69 = sub_247E00380();
          if (v29 != 1 && (v69 & 1) == 0 && (v105[6] != v67 || v105[7] != v66))
          {
            char v71 = sub_247E00380();
            if (v29 != 2 && (v71 & 1) == 0)
            {
              uint64_t v72 = v103;
              uint64_t v73 = 2;
              while (1)
              {
                unint64_t isUniquelyReferenced_nonNull_native = v73 + 1;
                if (__OFADD__(v73, 1)) {
                  goto LABEL_76;
                }
                if ((*(v72 - 1) != v67 || *v72 != v66) && (sub_247E00380() & 1) == 0)
                {
                  ++v73;
                  v72 += 2;
                  if (isUniquelyReferenced_nonNull_native != v113) {
                    continue;
                  }
                }
                break;
              }
            }
          }
        }
      }
      swift_bridgeObjectRetain();
      sub_247DFFFC0();
      int v75 = swift_isUniquelyReferenced_nonNull_native();
      v117 = v32;
      unint64_t isUniquelyReferenced_nonNull_native = sub_247DFC164(v67, v66);
      uint64_t v77 = v32[2];
      BOOL v78 = (v76 & 1) == 0;
      uint64_t v79 = v77 + v78;
      if (__OFADD__(v77, v78)) {
        goto LABEL_73;
      }
      char v80 = v76;
      if (v32[3] >= v79)
      {
        if (v75)
        {
          uint64_t v115 = v59;
          if ((v76 & 1) == 0) {
            goto LABEL_59;
          }
        }
        else
        {
          sub_247DFD2D8();
          BOOL v32 = v117;
          uint64_t v115 = v59;
          if ((v80 & 1) == 0) {
            goto LABEL_59;
          }
        }
      }
      else
      {
        sub_247DFCEF8(v79, v75);
        BOOL v32 = v117;
        unint64_t v81 = sub_247DFC164(v67, v66);
        if ((v80 & 1) != (v82 & 1)) {
          goto LABEL_64;
        }
        unint64_t isUniquelyReferenced_nonNull_native = v81;
        uint64_t v115 = v59;
        if ((v80 & 1) == 0)
        {
LABEL_59:
          unint64_t v2 = (unint64_t)v116;
          uint64_t v83 = v116[24];
          uint64_t v84 = v116[22];
          v32[(isUniquelyReferenced_nonNull_native >> 6) + 8] |= 1 << isUniquelyReferenced_nonNull_native;
          v85 = (uint64_t *)(v32[6] + 16 * isUniquelyReferenced_nonNull_native);
          uint64_t *v85 = v67;
          v85[1] = v66;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v58 + 32))(v32[7] + *(void *)(v58 + 72) * isUniquelyReferenced_nonNull_native, v83, v84);
          uint64_t v86 = v32[2];
          BOOL v53 = __OFADD__(v86, 1);
          uint64_t v87 = v86 + 1;
          if (v53) {
            goto LABEL_75;
          }
          uint64_t v88 = v116[26];
          uint64_t v89 = v116[22];
          v32[2] = v87;
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 56))(v88, 1, 1, v89);
          swift_bridgeObjectRetain();
          unint64_t isUniquelyReferenced_nonNull_native = (unint64_t)v116;
          goto LABEL_30;
        }
      }
      uint64_t v60 = v116[26];
      unint64_t v61 = v116[24];
      uint64_t v62 = v116[22];
      unint64_t v2 = *(void *)(v58 + 72) * isUniquelyReferenced_nonNull_native;
      int v63 = *(void (**)(uint64_t, unint64_t, uint64_t))(v58 + 32);
      v63(v60, v32[7] + v2, v62);
      v63(v32[7] + v2, v61, v62);
      unint64_t isUniquelyReferenced_nonNull_native = (unint64_t)v116;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v58 + 56))(v60, 0, 1, v62);
LABEL_30:
      uint64_t v59 = v115 + 1;
      uint64_t v64 = *(void *)(isUniquelyReferenced_nonNull_native + 208);
      swift_bridgeObjectRelease();
      sub_247DFEFEC(v64, &qword_26B1394B8);
      swift_bridgeObjectRelease();
      uint64_t v29 = v113;
      uint64_t v16 = MEMORY[0x263F8EE78];
      if (v115 + 1 == v111)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_69;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_69:
  swift_bridgeObjectRelease();
  uint64_t v106 = *(void *)(isUniquelyReferenced_nonNull_native + 248);
  uint64_t v108 = *(void *)(isUniquelyReferenced_nonNull_native + 264);
  uint64_t v91 = *(void *)(isUniquelyReferenced_nonNull_native + 168);
  uint64_t v102 = *(void *)(isUniquelyReferenced_nonNull_native + 152);
  uint64_t v104 = *(void *)(isUniquelyReferenced_nonNull_native + 256);
  uint64_t v92 = *(void *)(isUniquelyReferenced_nonNull_native + 136);
  uint64_t v100 = *(void *)(isUniquelyReferenced_nonNull_native + 144);
  uint64_t v94 = *(void *)(isUniquelyReferenced_nonNull_native + 120);
  uint64_t v93 = *(void *)(isUniquelyReferenced_nonNull_native + 128);
  uint64_t v95 = *(void *)(isUniquelyReferenced_nonNull_native + 112);
  uint64_t v101 = *(void *)(isUniquelyReferenced_nonNull_native + 160);
  uint64_t v96 = (void *)swift_allocObject();
  v96[2] = v95;
  v96[3] = v94;
  v96[4] = v32;
  *(void *)(isUniquelyReferenced_nonNull_native + 48) = sub_247DFF178;
  *(void *)(isUniquelyReferenced_nonNull_native + 56) = v96;
  *(void *)(isUniquelyReferenced_nonNull_native + 16) = MEMORY[0x263EF8330];
  *(void *)(isUniquelyReferenced_nonNull_native + 24) = 1107296256;
  *(void *)(isUniquelyReferenced_nonNull_native + 32) = sub_247DF7974;
  *(void *)(isUniquelyReferenced_nonNull_native + 40) = &block_descriptor_29;
  unint64_t v97 = _Block_copy((const void *)(isUniquelyReferenced_nonNull_native + 16));
  swift_bridgeObjectRetain();
  swift_retain();
  sub_247E00150();
  *(void *)(isUniquelyReferenced_nonNull_native + 64) = v16;
  sub_247DFF20C(&qword_26B1394E8, 255, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B139380);
  sub_247DFF1A8(&qword_26B139508, (uint64_t *)&unk_26B139380);
  sub_247E002C0();
  MEMORY[0x24C56C0A0](0, v91, v100, v97);
  _Block_release(v97);
  (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v100, v93);
  (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v91, v102);
  (*(void (**)(uint64_t, uint64_t))(v104 + 8))(v108, v106);
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v98 = *(uint64_t (**)(void))(isUniquelyReferenced_nonNull_native + 8);
  return v98();
}

uint64_t sub_247DF7974(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_247DF79B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247E00220();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_247E00210();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_247DFEFEC(a1, &qword_26B139520);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_247E00200();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_247DF7B64()
{
  uint64_t v0 = sub_247E00270();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  id v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247E00260();
  MEMORY[0x270FA5388]();
  sub_247E00160();
  MEMORY[0x270FA5388]();
  sub_247DFED40();
  sub_247E00150();
  v5[1] = MEMORY[0x263F8EE78];
  sub_247DFF20C(&qword_26B139538, 255, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B139510);
  sub_247DFF1A8((unint64_t *)&qword_26B139518, &qword_26B139510);
  sub_247E002C0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v0);
  uint64_t result = sub_247E00290();
  qword_26B139570 = result;
  return result;
}

void sub_247DF7DBC(uint64_t a1)
{
  swift_allocObject();
  swift_weakInit();
  id v2 = objc_allocWithZone((Class)sub_247E00020());
  uint64_t v3 = sub_247E00000();

  *(void *)a1 = v3;
  sub_247E00010();
  sub_247E00010();
  uint64_t v4 = self;
  id v5 = objc_msgSend(v4, sel_sharedConnection);
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned int v7 = objc_msgSend(v5, sel_isLockingAppsAllowed);

    *(unsigned char *)(a1 + 8) = v7;
    if (!v7)
    {
      unsigned __int8 v10 = 0;
      goto LABEL_6;
    }
    id v8 = objc_msgSend(v4, sel_sharedConnection);
    if (v8)
    {
      BOOL v9 = v8;
      unsigned __int8 v10 = objc_msgSend(v8, sel_isHidingAppsAllowed);

LABEL_6:
      *(unsigned char *)(a1 + 9) = v10;
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_247DF7F14(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_247DF81DC(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_247DF7F74(uint64_t a1)
{
  uint64_t v3 = *(NSObject **)(v1 + 24);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = v1;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_247DFEA24;
  *(void *)(v5 + 24) = v4;
  v8[4] = sub_247DFEA3C;
  v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_247DF81B4;
  v8[3] = &block_descriptor;
  uint64_t v6 = _Block_copy(v8);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v3) {
    __break(1u);
  }
  return result;
}

uint64_t sub_247DF80DC(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void *)(sub_247DFFFF0() - 8);
    unint64_t v4 = v2 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v5 = *(void *)(v3 + 72);
    swift_bridgeObjectRetain();
    do
    {
      sub_247E000D0();
      v4 += v5;
      --v1;
    }
    while (v1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_247DF81B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_247DF81DC(uint64_t a1)
{
  uint64_t v2 = sub_247DFFFA0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (void *)sub_247DFFF90();
  uint64_t v7 = sub_247E001B0();
  uint64_t v9 = v8;
  if (v7 == sub_247E001B0() && v9 == v10)
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_16;
  }
  char v12 = sub_247E00380();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v12)
  {
LABEL_16:
    sub_247DF8C14();
    return;
  }
  id v13 = (void *)sub_247DFFF90();
  uint64_t v14 = sub_247E001B0();
  uint64_t v16 = v15;
  if (v14 == sub_247E001B0() && v16 == v17)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v19 = sub_247E00380();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
    {
      if (qword_26B139368 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_247E000C0();
      __swift_project_value_buffer(v20, (uint64_t)qword_26B139558);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
      uint64_t v21 = sub_247E000A0();
      os_log_type_t v22 = sub_247E00250();
      if (os_log_type_enabled(v21, v22))
      {
        unint64_t v23 = (uint8_t *)swift_slowAlloc();
        uint64_t v24 = swift_slowAlloc();
        uint64_t v28 = v24;
        *(_DWORD *)unint64_t v23 = 136315138;
        sub_247DFF20C(&qword_2692CF2F8, 255, MEMORY[0x263F06320]);
        uint64_t v25 = sub_247E00370();
        uint64_t v27 = sub_247DFC7F0(v25, v26, &v28);
        sub_247E002A0();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        _os_log_impl(&dword_247DF4000, v21, v22, "iOSManagementExpert: unknown notification: %s", v23, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C56C620](v24, -1, -1);
        MEMORY[0x24C56C620](v23, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }

      return;
    }
  }

  sub_247DF85CC();
}

id sub_247DF85CC()
{
  uint64_t v0 = self;
  id result = objc_msgSend(v0, sel_sharedConnection);
  if (!result)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v2 = result;
  unsigned int v3 = objc_msgSend(result, sel_isLockingAppsAllowed);

  if (!v3)
  {
    unsigned int v5 = 0;
    goto LABEL_6;
  }
  id result = objc_msgSend(v0, sel_sharedConnection);
  if (!result)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v4 = result;
  unsigned int v5 = objc_msgSend(result, sel_isHidingAppsAllowed);

LABEL_6:
  if (qword_26B139368 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_247E000C0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B139558);
  uint64_t v7 = sub_247E000A0();
  os_log_type_t v8 = sub_247E00250();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 67109376;
    sub_247E002A0();
    *(_WORD *)(v9 + 8) = 1024;
    LODWORD(v14) = v5;
    sub_247E002A0();
    _os_log_impl(&dword_247DF4000, v7, v8, "Effective settings changed. Locking allowed: %{BOOL}d, hiding allowed: %{BOOL}d", (uint8_t *)v9, 0xEu);
    MEMORY[0x24C56C620](v9, -1, -1);
  }

  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (uint64_t)&v11[4];
  id v13 = v11 + 12;
  os_unfair_lock_lock(v11 + 12);
  sub_247DFF1EC(v12, (unint64_t *)&v14);
  os_unfair_lock_unlock(v13);
  sub_247DF7F74(v14);
  return (id)swift_bridgeObjectRelease();
}

uint64_t sub_247DF8800@<X0>(uint64_t a1@<X0>, char a2@<W1>, int a3@<W2>, unint64_t *a4@<X8>)
{
  LODWORD(v4) = a3;
  uint64_t v31 = a4;
  int v6 = a2 & 1;
  uint64_t v7 = sub_247DFFFF0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  id v11 = &v29[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v14 = &v29[-v13];
  unint64_t v15 = 0x26B139000uLL;
  if (*(unsigned __int8 *)(a1 + 8) == v6)
  {
    unint64_t v20 = MEMORY[0x263F8EE78];
  }
  else
  {
    int v30 = v4;
    *(unsigned char *)(a1 + 8) = v6;
    if (qword_26B139368 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_247E000C0();
    __swift_project_value_buffer(v16, (uint64_t)qword_26B139558);
    uint64_t v17 = sub_247E000A0();
    os_log_type_t v18 = sub_247E00250();
    if (os_log_type_enabled(v17, v18))
    {
      char v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v19 = 0;
      _os_log_impl(&dword_247DF4000, v17, v18, "locking apps capability changed", v19, 2u);
      MEMORY[0x24C56C620](v19, -1, -1);
    }

    *uint64_t v14 = v6;
    (*(void (**)(unsigned char *, void, uint64_t))(v8 + 104))(v14, *MEMORY[0x263F251B8], v7);
    unint64_t v20 = sub_247DFC588(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v4 = *(void *)(v20 + 16);
    unint64_t v21 = *(void *)(v20 + 24);
    if (v4 >= v21 >> 1) {
      unint64_t v20 = sub_247DFC588(v21 > 1, v4 + 1, 1, v20);
    }
    *(void *)(v20 + 16) = v4 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, unsigned char *, uint64_t))(v8 + 32))(v20+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v4, v14, v7);
    LOBYTE(v4) = v30;
    unint64_t v15 = 0x26B139000;
  }
  if (*(unsigned char *)(a1 + 9) != (v4 & 1))
  {
    if (*(void *)(v15 + 872) != -1) {
      swift_once();
    }
    uint64_t v22 = sub_247E000C0();
    __swift_project_value_buffer(v22, (uint64_t)qword_26B139558);
    unint64_t v23 = sub_247E000A0();
    os_log_type_t v24 = sub_247E00250();
    if (os_log_type_enabled(v23, v24))
    {
      char v25 = v4;
      unint64_t v4 = swift_slowAlloc();
      *(_WORD *)unint64_t v4 = 0;
      _os_log_impl(&dword_247DF4000, v23, v24, "hiding apps capability changed", (uint8_t *)v4, 2u);
      unint64_t v26 = v4;
      LOBYTE(v4) = v25;
      MEMORY[0x24C56C620](v26, -1, -1);
    }

    *(unsigned char *)(a1 + 9) = v4 & 1;
    *id v11 = v4 & 1;
    (*(void (**)(unsigned char *, void, uint64_t))(v8 + 104))(v11, *MEMORY[0x263F251B0], v7);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v20 = sub_247DFC588(0, *(void *)(v20 + 16) + 1, 1, v20);
    }
    unint64_t v28 = *(void *)(v20 + 16);
    unint64_t v27 = *(void *)(v20 + 24);
    if (v28 >= v27 >> 1) {
      unint64_t v20 = sub_247DFC588(v27 > 1, v28 + 1, 1, v20);
    }
    *(void *)(v20 + 16) = v28 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, unsigned char *, uint64_t))(v8 + 32))(v20+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v28, v11, v7);
  }
  *uint64_t v31 = v20;
  return result;
}

uint64_t sub_247DF8C14()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B139520);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B139368 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_247E000C0();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B139558);
  int v6 = sub_247E000A0();
  os_log_type_t v7 = sub_247E00250();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_247DF4000, v6, v7, "Fetching protectability.", v8, 2u);
    MEMORY[0x24C56C620](v8, -1, -1);
  }

  uint64_t v9 = os_transaction_create();
  if (qword_26B139370 != -1) {
    swift_once();
  }
  uint64_t v10 = (void *)qword_26B139570;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  *(void *)(v11 + 24) = v1;
  uint64_t v12 = sub_247E00220();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v10;
  v13[5] = sub_247DFEDE0;
  v13[6] = v11;
  swift_unknownObjectRetain();
  swift_retain();
  id v14 = v10;
  swift_retain();
  sub_247DF79B8((uint64_t)v4, (uint64_t)&unk_2692CF2E0, (uint64_t)v13);
  swift_unknownObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_247DF8E74(uint64_t a1)
{
  if (qword_26B139368 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_247E000C0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B139558);
  uint64_t v3 = sub_247E000A0();
  os_log_type_t v4 = sub_247E00250();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_247DF4000, v3, v4, "Done fetching protectability.", v5, 2u);
    MEMORY[0x24C56C620](v5, -1, -1);
  }

  return sub_247DF8F68(a1);
}

uint64_t sub_247DF8F68(uint64_t a1)
{
  uint64_t v2 = sub_247E00170();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (void *)((char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_26B139370 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_26B139570;
  *uint64_t v5 = qword_26B139570;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F0E0], v2);
  id v7 = (id)v6;
  LOBYTE(v6) = sub_247E00180();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if (v6)
  {
    if (qword_26B139368 == -1) {
      goto LABEL_5;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_5:
  uint64_t v8 = sub_247E000C0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26B139558);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_247E000A0();
  os_log_type_t v10 = sub_247E00250();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    v29[0] = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    sub_247DFFFE0();
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_247E00190();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    v28[1] = sub_247DFC7F0(v13, v15, v29);
    sub_247E002A0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247DF4000, v9, v10, "Apps changed. New protectability: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C56C620](v12, -1, -1);
    MEMORY[0x24C56C620](v11, -1, -1);
  }
  else
  {

    uint64_t v16 = swift_bridgeObjectRelease_n();
  }
  MEMORY[0x270FA5388](v16);
  v28[-2] = a1;
  uint64_t v18 = (uint64_t)&v17[4];
  char v19 = v17 + 12;
  os_unfair_lock_lock(v17 + 12);
  sub_247DFC56C(v18, v29);
  os_unfair_lock_unlock(v19);
  uint64_t v20 = v29[1];
  int v21 = v30;
  sub_247DF7F74(v29[0]);
  swift_bridgeObjectRelease();
  if (v21 == 1)
  {
    sub_247E00060();
    uint64_t v22 = sub_247E001C0();
    swift_bridgeObjectRelease();
    notify_post((const char *)(v22 + 32));
    swift_release();
  }
  uint64_t v23 = *(void *)(v20 + 16);
  if (v23)
  {
    uint64_t v24 = v20 + 40;
    do
    {
      char v25 = *(void (**)(uint64_t))(v24 - 8);
      uint64_t v26 = swift_retain();
      v25(v26);
      swift_release();
      v24 += 16;
      --v23;
    }
    while (v23);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_247DF9340@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v228 = a1;
  v194 = a3;
  uint64_t v4 = sub_247DFFFF0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v217 = (uint64_t *)((char *)&v192 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v216 = (uint64_t *)((char *)&v192 - v9);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v207 = (uint64_t *)((char *)&v192 - v11);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v208 = (uint64_t *)((char *)&v192 - v13);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v199 = (uint64_t *)((char *)&v192 - v15);
  MEMORY[0x270FA5388](v14);
  v198 = (uint64_t *)((char *)&v192 - v16);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1394B8);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  v206 = (char *)&v192 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  int v21 = (char *)&v192 - v20;
  uint64_t v22 = sub_247DFFFE0();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v223 = (char *)&v192 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v212 = (char *)&v192 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  unsigned __int8 v30 = (char *)&v192 - v29;
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  v197 = (char *)&v192 - v32;
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  v196 = (char *)&v192 - v34;
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  v201 = (char *)&v192 - v36;
  MEMORY[0x270FA5388](v35);
  uint64_t v38 = (char *)&v192 - v37;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B139378);
  uint64_t v40 = MEMORY[0x270FA5388](v39 - 8);
  v230 = (char *)&v192 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v40);
  v211 = (uint64_t *)((char *)&v192 - v42);
  uint64_t v43 = *(void *)(a2 + 64);
  uint64_t v200 = a2 + 64;
  uint64_t v44 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v45 = -1;
  if (v44 < 64) {
    uint64_t v45 = ~(-1 << v44);
  }
  unint64_t v46 = v45 & v43;
  v231 = (void (**)(char *, char *, uint64_t))(v23 + 32);
  v232 = (void (**)(char *, char *, uint64_t))(v23 + 16);
  v222 = (uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  uint64_t v218 = v23;
  v219 = (unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
  v233 = (void (**)(char *, uint64_t))(v23 + 8);
  unsigned int v214 = *MEMORY[0x263F251A8];
  v226 = (void (**)(void))(v5 + 104);
  uint64_t v227 = v5;
  uint64_t v225 = v5 + 32;
  unsigned int v213 = *MEMORY[0x263F251A0];
  int64_t v204 = (unint64_t)(v44 + 63) >> 6;
  int64_t v193 = v204 - 1;
  uint64_t v209 = a2;
  swift_bridgeObjectRetain();
  int64_t v215 = 0;
  unint64_t v47 = &qword_26B1394F0;
  *(void *)&long long v48 = 136315650;
  long long v203 = v48;
  uint64_t v202 = MEMORY[0x263F8EE58] + 8;
  *(void *)&long long v48 = 136315394;
  long long v195 = v48;
  unint64_t v235 = MEMORY[0x263F8EE78];
  uint64_t v224 = v4;
  v205 = v21;
  v210 = v30;
  v229 = v38;
  while (1)
  {
    if (v46)
    {
      *(void *)&long long v221 = (v46 - 1) & v46;
      unint64_t v49 = __clz(__rbit64(v46)) | (v215 << 6);
      uint64_t v50 = v209;
      unint64_t v51 = v230;
LABEL_8:
      uint64_t v52 = *(void *)(v50 + 48);
      uint64_t v53 = *(void *)(v50 + 56);
      uint64_t v54 = (void *)(v52 + 16 * v49);
      uint64_t v55 = v54[1];
      *unint64_t v51 = *v54;
      v51[1] = v55;
      uint64_t v56 = v218;
      uint64_t v57 = v53 + *(void *)(v218 + 72) * v49;
      uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1394F0);
      uint64_t v59 = v57;
      unint64_t v51 = v230;
      (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(&v230[*(int *)(v58 + 48)], v59, v22);
      (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v51, 0, 1, v58);
      swift_bridgeObjectRetain();
      uint64_t v60 = v212;
      uint64_t v38 = v229;
      unint64_t v61 = v211;
      goto LABEL_27;
    }
    int64_t v62 = v215 + 1;
    unint64_t v51 = v230;
    if (__OFADD__(v215, 1)) {
      goto LABEL_129;
    }
    uint64_t v60 = v212;
    unint64_t v61 = v211;
    if (v62 < v204)
    {
      unint64_t v63 = *(void *)(v200 + 8 * v62);
      if (v63) {
        goto LABEL_12;
      }
      int64_t v64 = v215 + 2;
      ++v215;
      if (v62 + 1 < v204)
      {
        unint64_t v63 = *(void *)(v200 + 8 * v64);
        if (v63) {
          goto LABEL_15;
        }
        int64_t v215 = v62 + 1;
        if (v62 + 2 < v204)
        {
          unint64_t v63 = *(void *)(v200 + 8 * (v62 + 2));
          if (v63)
          {
            v62 += 2;
LABEL_12:
            *(void *)&long long v221 = (v63 - 1) & v63;
            unint64_t v49 = __clz(__rbit64(v63)) + (v62 << 6);
            int64_t v215 = v62;
            uint64_t v50 = v209;
            goto LABEL_8;
          }
          int64_t v64 = v62 + 3;
          int64_t v215 = v62 + 2;
          if (v62 + 3 < v204)
          {
            unint64_t v63 = *(void *)(v200 + 8 * v64);
            if (!v63)
            {
              while (1)
              {
                int64_t v62 = v64 + 1;
                if (__OFADD__(v64, 1)) {
                  goto LABEL_131;
                }
                if (v62 >= v204)
                {
                  int64_t v215 = v193;
                  goto LABEL_26;
                }
                unint64_t v63 = *(void *)(v200 + 8 * v62);
                ++v64;
                if (v63) {
                  goto LABEL_12;
                }
              }
            }
LABEL_15:
            int64_t v62 = v64;
            goto LABEL_12;
          }
        }
      }
    }
LABEL_26:
    uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1394F0);
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56))(v51, 1, 1, v65);
    *(void *)&long long v221 = 0;
LABEL_27:
    sub_247DFEA7C((uint64_t)v51, (uint64_t)v61);
    uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1394F0);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v66 - 8) + 48))(v61, 1, v66) == 1) {
      break;
    }
    uint64_t v67 = v60;
    uint64_t v68 = *v61;
    uint64_t v234 = v61[1];
    char v69 = (char *)v61 + *(int *)(v66 + 48);
    unint64_t v70 = *v231;
    (*v231)(v38, v69, v22);
    uint64_t v71 = *(void *)(v228 + 16);
    uint64_t v220 = v68;
    if (!v71) {
      goto LABEL_36;
    }
    if (!*(void *)(v71 + 16))
    {
      (*v222)(v21, 1, 1, v22);
LABEL_35:
      sub_247DFEFEC((uint64_t)v21, &qword_26B1394B8);
LABEL_36:
      if (qword_26B139368 != -1) {
        swift_once();
      }
      uint64_t v76 = sub_247E000C0();
      __swift_project_value_buffer(v76, (uint64_t)qword_26B139558);
      uint64_t v77 = *v232;
      BOOL v78 = v229;
      (*v232)(v30, v229, v22);
      v77(v67, v78, v22);
      swift_bridgeObjectRetain_n();
      uint64_t v79 = sub_247E000A0();
      os_log_type_t v80 = sub_247E00250();
      if (os_log_type_enabled(v79, v80))
      {
        uint64_t v81 = swift_slowAlloc();
        uint64_t v82 = swift_slowAlloc();
        uint64_t v236 = v82;
        *(_DWORD *)uint64_t v81 = v203;
        unint64_t v83 = v234;
        swift_bridgeObjectRetain();
        *(void *)(v81 + 4) = sub_247DFC7F0(v68, v83, &v236);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v81 + 12) = 1024;
        int v84 = sub_247DFFFD0() & 1;
        v85 = *v233;
        (*v233)(v210, v22);
        *(_DWORD *)(v81 + 14) = v84;
        *(_WORD *)(v81 + 18) = 1024;
        int v86 = sub_247DFFFB0() & 1;
        v85(v67, v22);
        uint64_t v87 = v85;
        *(_DWORD *)(v81 + 20) = v86;
        unsigned __int8 v30 = v210;
        _os_log_impl(&dword_247DF4000, v79, v80, "%s now has protectability info, lockable: %{BOOL}d, hideable: %{BOOL}d", (uint8_t *)v81, 0x18u);
        swift_arrayDestroy();
        uint64_t v88 = v82;
        int v21 = v205;
        MEMORY[0x24C56C620](v88, -1, -1);
        MEMORY[0x24C56C620](v81, -1, -1);
      }
      else
      {
        uint64_t v89 = v67;
        uint64_t v87 = *v233;
        (*v233)(v89, v22);
        v87(v30, v22);

        swift_bridgeObjectRelease_n();
      }
      uint64_t v4 = v224;
      uint64_t v38 = v229;
      if (sub_247DFFFD0())
      {
        uint64_t v90 = v220;
      }
      else
      {
        uint64_t v91 = v234;
        swift_bridgeObjectRetain();
        char v92 = sub_247DFFFD0();
        uint64_t v93 = v208;
        uint64_t v90 = v220;
        void *v208 = v220;
        v93[1] = v91;
        *((unsigned char *)v93 + 16) = v92 & 1;
        ((void (*)(void *, void, uint64_t))*v226)(v93, v214, v4);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v235 = sub_247DFC588(0, *(void *)(v235 + 16) + 1, 1, v235);
        }
        unint64_t v95 = *(void *)(v235 + 16);
        unint64_t v94 = *(void *)(v235 + 24);
        if (v95 >= v94 >> 1) {
          unint64_t v235 = sub_247DFC588(v94 > 1, v95 + 1, 1, v235);
        }
        unint64_t v96 = v235;
        *(void *)(v235 + 16) = v95 + 1;
        (*(void (**)(unint64_t, void *, uint64_t))(v227 + 32))(v96+ ((*(unsigned __int8 *)(v227 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v227 + 80))+ *(void *)(v227 + 72) * v95, v208, v4);
      }
      if (sub_247DFFFB0())
      {
        v87(v38, v22);
        swift_bridgeObjectRelease();
      }
      else
      {
        char v97 = sub_247DFFFB0();
        uint64_t v98 = v207;
        uint64_t v99 = v234;
        uint64_t *v207 = v90;
        v98[1] = v99;
        *((unsigned char *)v98 + 16) = v97 & 1;
        ((void (*)(uint64_t *, void, uint64_t))*v226)(v98, v213, v4);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v235 = sub_247DFC588(0, *(void *)(v235 + 16) + 1, 1, v235);
        }
        unint64_t v101 = *(void *)(v235 + 16);
        unint64_t v100 = *(void *)(v235 + 24);
        if (v101 >= v100 >> 1) {
          unint64_t v235 = sub_247DFC588(v100 > 1, v101 + 1, 1, v235);
        }
        unint64_t v102 = v235;
        *(void *)(v235 + 16) = v101 + 1;
        (*(void (**)(unint64_t, uint64_t *, uint64_t))(v227 + 32))(v102+ ((*(unsigned __int8 *)(v227 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v227 + 80))+ *(void *)(v227 + 72) * v101, v207, v4);
        v87(v38, v22);
      }
      goto LABEL_5;
    }
    swift_bridgeObjectRetain();
    uint64_t v72 = v234;
    swift_bridgeObjectRetain();
    unint64_t v73 = sub_247DFC164(v68, v72);
    if (v74)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v218 + 16))(v21, *(void *)(v71 + 56) + *(void *)(v218 + 72) * v73, v22);
      uint64_t v75 = 0;
    }
    else
    {
      uint64_t v75 = 1;
    }
    (*v222)(v21, v75, 1, v22);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*v219)(v21, 1, v22) == 1) {
      goto LABEL_35;
    }
    uint64_t v103 = v201;
    v70(v201, v21, v22);
    int v104 = sub_247DFFFD0() & 1;
    if (v104 != (sub_247DFFFD0() & 1))
    {
      v105 = v196;
      if (qword_26B139368 != -1) {
        swift_once();
      }
      uint64_t v106 = sub_247E000C0();
      __swift_project_value_buffer(v106, (uint64_t)qword_26B139558);
      (*v232)(v105, v38, v22);
      swift_bridgeObjectRetain_n();
      unint64_t v107 = sub_247E000A0();
      os_log_type_t v108 = sub_247E00250();
      if (os_log_type_enabled(v107, v108))
      {
        uint64_t v109 = swift_slowAlloc();
        uint64_t v110 = swift_slowAlloc();
        uint64_t v236 = v110;
        *(_DWORD *)uint64_t v109 = v195;
        unint64_t v111 = v234;
        swift_bridgeObjectRetain();
        uint64_t v112 = v220;
        *(void *)(v109 + 4) = sub_247DFC7F0(v220, v111, &v236);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v109 + 12) = 1024;
        LODWORD(v111) = sub_247DFFFD0() & 1;
        (*v233)(v105, v22);
        *(_DWORD *)(v109 + 14) = v111;
        _os_log_impl(&dword_247DF4000, v107, v108, "%s lockability changed to %{BOOL}d", (uint8_t *)v109, 0x12u);
        swift_arrayDestroy();
        uint64_t v113 = v110;
        uint64_t v4 = v224;
        MEMORY[0x24C56C620](v113, -1, -1);
        MEMORY[0x24C56C620](v109, -1, -1);
      }
      else
      {
        (*v233)(v105, v22);

        swift_bridgeObjectRelease_n();
        uint64_t v112 = v220;
      }
      uint64_t v114 = v234;
      swift_bridgeObjectRetain();
      uint64_t v38 = v229;
      char v115 = sub_247DFFFD0();
      v116 = v198;
      uint64_t *v198 = v112;
      v116[1] = v114;
      *((unsigned char *)v116 + 16) = v115 & 1;
      ((void (*)(uint64_t *, void, uint64_t))*v226)(v116, v214, v4);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      int v21 = v205;
      uint64_t v103 = v201;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        unint64_t v235 = sub_247DFC588(0, *(void *)(v235 + 16) + 1, 1, v235);
      }
      unsigned __int8 v30 = v210;
      unint64_t v119 = *(void *)(v235 + 16);
      unint64_t v118 = *(void *)(v235 + 24);
      if (v119 >= v118 >> 1) {
        unint64_t v235 = sub_247DFC588(v118 > 1, v119 + 1, 1, v235);
      }
      unint64_t v120 = v235;
      *(void *)(v235 + 16) = v119 + 1;
      (*(void (**)(unint64_t, uint64_t *, uint64_t))(v227 + 32))(v120+ ((*(unsigned __int8 *)(v227 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v227 + 80))+ *(void *)(v227 + 72) * v119, v198, v4);
    }
    int v121 = sub_247DFFFB0() & 1;
    if (v121 == (sub_247DFFFB0() & 1))
    {
      swift_bridgeObjectRelease();
      v132 = v103;
      v133 = *v233;
      (*v233)(v132, v22);
      v133(v38, v22);
    }
    else
    {
      if (qword_26B139368 != -1) {
        swift_once();
      }
      uint64_t v122 = sub_247E000C0();
      __swift_project_value_buffer(v122, (uint64_t)qword_26B139558);
      v123 = v197;
      (*v232)(v197, v38, v22);
      swift_bridgeObjectRetain_n();
      v124 = sub_247E000A0();
      os_log_type_t v125 = sub_247E00250();
      if (os_log_type_enabled(v124, v125))
      {
        uint64_t v126 = swift_slowAlloc();
        uint64_t v127 = swift_slowAlloc();
        uint64_t v236 = v127;
        *(_DWORD *)uint64_t v126 = v195;
        unint64_t v128 = v234;
        swift_bridgeObjectRetain();
        uint64_t v129 = v220;
        *(void *)(v126 + 4) = sub_247DFC7F0(v220, v128, &v236);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v126 + 12) = 1024;
        LODWORD(v128) = sub_247DFFFB0() & 1;
        v130 = *v233;
        (*v233)(v123, v22);
        *(_DWORD *)(v126 + 14) = v128;
        _os_log_impl(&dword_247DF4000, v124, v125, "%s hideability changed to %{BOOL}d", (uint8_t *)v126, 0x12u);
        swift_arrayDestroy();
        uint64_t v131 = v127;
        uint64_t v4 = v224;
        MEMORY[0x24C56C620](v131, -1, -1);
        MEMORY[0x24C56C620](v126, -1, -1);
      }
      else
      {
        v130 = *v233;
        (*v233)(v123, v22);

        swift_bridgeObjectRelease_n();
        uint64_t v129 = v220;
      }
      uint64_t v38 = v229;
      char v134 = sub_247DFFFB0();
      v135 = v199;
      uint64_t v136 = v234;
      uint64_t *v199 = v129;
      v135[1] = v136;
      *((unsigned char *)v135 + 16) = v134 & 1;
      ((void (*)(uint64_t *, void, uint64_t))*v226)(v135, v213, v4);
      char v137 = swift_isUniquelyReferenced_nonNull_native();
      int v21 = v205;
      if ((v137 & 1) == 0) {
        unint64_t v235 = sub_247DFC588(0, *(void *)(v235 + 16) + 1, 1, v235);
      }
      unint64_t v139 = *(void *)(v235 + 16);
      unint64_t v138 = *(void *)(v235 + 24);
      if (v139 >= v138 >> 1) {
        unint64_t v235 = sub_247DFC588(v138 > 1, v139 + 1, 1, v235);
      }
      unint64_t v140 = v235;
      *(void *)(v235 + 16) = v139 + 1;
      (*(void (**)(unint64_t, uint64_t *, uint64_t))(v227 + 32))(v140+ ((*(unsigned __int8 *)(v227 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v227 + 80))+ *(void *)(v227 + 72) * v139, v199, v4);
      v130(v201, v22);
      v130(v38, v22);
      unsigned __int8 v30 = v210;
    }
LABEL_5:
    unint64_t v47 = &qword_26B1394F0;
    unint64_t v46 = v221;
  }
  swift_release();
  if (*(void *)(v228 + 16)) {
    unint64_t v141 = *(void *)(v228 + 16);
  }
  else {
    unint64_t v141 = sub_247DFADF0(MEMORY[0x263F8EE78]);
  }
  unint64_t v47 = (uint64_t *)v206;
  v142 = v223;
  swift_bridgeObjectRetain();
  uint64_t v143 = sub_247DFAFE8(v141);
  uint64_t v144 = swift_bridgeObjectRetain();
  uint64_t v145 = sub_247DFD744(v144, v143);
  swift_bridgeObjectRelease();
  uint64_t v147 = 0;
  uint64_t v148 = *(void *)(v145 + 56);
  v229 = (char *)(v145 + 56);
  uint64_t v234 = v145;
  uint64_t v149 = 1 << *(unsigned char *)(v145 + 32);
  uint64_t v150 = -1;
  if (v149 < 64) {
    uint64_t v150 = ~(-1 << v149);
  }
  unint64_t v151 = v150 & v148;
  v230 = (char *)((unint64_t)(v149 + 63) >> 6);
  *(void *)&long long v146 = 136315138;
  long long v221 = v146;
  uint64_t v220 = MEMORY[0x263F8EE58] + 8;
  if ((v150 & v148) != 0) {
    goto LABEL_85;
  }
LABEL_86:
  uint64_t v154 = v147 + 1;
  if (__OFADD__(v147, 1))
  {
    __break(1u);
LABEL_129:
    __break(1u);
    goto LABEL_130;
  }
  if (v154 >= (uint64_t)v230) {
    goto LABEL_124;
  }
  unint64_t v155 = *(void *)&v229[8 * v154];
  ++v147;
  if (v155) {
    goto LABEL_99;
  }
  uint64_t v147 = v154 + 1;
  if (v154 + 1 >= (uint64_t)v230) {
    goto LABEL_124;
  }
  unint64_t v155 = *(void *)&v229[8 * v147];
  if (v155) {
    goto LABEL_99;
  }
  uint64_t v147 = v154 + 2;
  if (v154 + 2 >= (uint64_t)v230)
  {
LABEL_124:
    swift_release();
    if (*(void *)(v228 + 16))
    {
      uint64_t v182 = v209;
      swift_bridgeObjectRetain();
      uint64_t v183 = swift_bridgeObjectRetain();
      char v184 = sub_247DFBBD4(v183, v182);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v185 = v182;
      char v186 = v184 ^ 1;
    }
    else
    {
      char v186 = 1;
      uint64_t v185 = v209;
    }
    uint64_t v187 = MEMORY[0x263F8EE78];
    uint64_t v188 = v185;
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v189 = v228;
    uint64_t v190 = *(void *)(v228 + 24);
    *(void *)(v228 + 16) = v188;
    *(void *)(v189 + 24) = v187;
    v191 = v194;
    void *v194 = v235;
    v191[1] = v190;
    *((unsigned char *)v191 + 16) = v186 & 1;
    return result;
  }
  unint64_t v155 = *(void *)&v229[8 * v147];
  if (v155)
  {
LABEL_99:
    unint64_t v151 = (v155 - 1) & v155;
    for (unint64_t i = __clz(__rbit64(v155)) + (v147 << 6); ; unint64_t i = v152 | (v147 << 6))
    {
      v157 = (uint64_t *)(*(void *)(v234 + 48) + 16 * i);
      uint64_t v159 = *v157;
      unint64_t v158 = v157[1];
      uint64_t v160 = qword_26B139368;
      swift_bridgeObjectRetain();
      if (v160 != -1) {
        swift_once();
      }
      uint64_t v161 = sub_247E000C0();
      __swift_project_value_buffer(v161, (uint64_t)qword_26B139558);
      swift_bridgeObjectRetain_n();
      v162 = sub_247E000A0();
      os_log_type_t v163 = sub_247E00250();
      if (os_log_type_enabled(v162, v163))
      {
        uint64_t v164 = swift_slowAlloc();
        uint64_t v165 = swift_slowAlloc();
        uint64_t v236 = v165;
        *(_DWORD *)uint64_t v164 = v221;
        swift_bridgeObjectRetain();
        *(void *)(v164 + 4) = sub_247DFC7F0(v159, v158, &v236);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_247DF4000, v162, v163, "%s lost protectability management", (uint8_t *)v164, 0xCu);
        swift_arrayDestroy();
        uint64_t v166 = v165;
        unint64_t v47 = (uint64_t *)v206;
        MEMORY[0x24C56C620](v166, -1, -1);
        uint64_t v167 = v164;
        v142 = v223;
        MEMORY[0x24C56C620](v167, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v168 = *(void *)(v228 + 16);
      uint64_t v169 = v224;
      if (!v168) {
        break;
      }
      if (!*(void *)(v168 + 16)) {
        goto LABEL_133;
      }
      swift_bridgeObjectRetain();
      unint64_t v170 = sub_247DFC164(v159, v158);
      if (v171)
      {
        (*(void (**)(uint64_t *, unint64_t, uint64_t))(v218 + 16))(v47, *(void *)(v168 + 56) + *(void *)(v218 + 72) * v170, v22);
        uint64_t v172 = 0;
      }
      else
      {
        uint64_t v172 = 1;
      }
      (*v222)(v47, v172, 1, v22);
      swift_bridgeObjectRelease();
      uint64_t result = ((uint64_t (*)(uint64_t *, uint64_t, uint64_t))*v219)(v47, 1, v22);
      if (result == 1) {
        goto LABEL_134;
      }
      (*v231)(v142, (char *)v47, v22);
      if ((sub_247DFFFD0() & 1) == 0)
      {
        v174 = v216;
        uint64_t *v216 = v159;
        v174[1] = v158;
        *((unsigned char *)v174 + 16) = 1;
        (*v226)();
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v235 = sub_247DFC588(0, *(void *)(v235 + 16) + 1, 1, v235);
        }
        unint64_t v176 = *(void *)(v235 + 16);
        unint64_t v175 = *(void *)(v235 + 24);
        if (v176 >= v175 >> 1) {
          unint64_t v235 = sub_247DFC588(v175 > 1, v176 + 1, 1, v235);
        }
        unint64_t v177 = v235;
        *(void *)(v235 + 16) = v176 + 1;
        (*(void (**)(unint64_t, uint64_t *, uint64_t))(v227 + 32))(v177+ ((*(unsigned __int8 *)(v227 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v227 + 80))+ *(void *)(v227 + 72) * v176, v216, v169);
        v142 = v223;
      }
      if (sub_247DFFFB0())
      {
        (*v233)(v142, v22);
        swift_bridgeObjectRelease();
        if (!v151) {
          goto LABEL_86;
        }
      }
      else
      {
        v178 = v217;
        uint64_t *v217 = v159;
        v178[1] = v158;
        *((unsigned char *)v178 + 16) = 1;
        (*v226)();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v235 = sub_247DFC588(0, *(void *)(v235 + 16) + 1, 1, v235);
        }
        unint64_t v180 = *(void *)(v235 + 16);
        unint64_t v179 = *(void *)(v235 + 24);
        if (v180 >= v179 >> 1) {
          unint64_t v235 = sub_247DFC588(v179 > 1, v180 + 1, 1, v235);
        }
        unint64_t v181 = v235;
        *(void *)(v235 + 16) = v180 + 1;
        (*(void (**)(unint64_t, uint64_t *, uint64_t))(v227 + 32))(v181+ ((*(unsigned __int8 *)(v227 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v227 + 80))+ *(void *)(v227 + 72) * v180, v217, v169);
        v142 = v223;
        (*v233)(v223, v22);
        if (!v151) {
          goto LABEL_86;
        }
      }
LABEL_85:
      unint64_t v152 = __clz(__rbit64(v151));
      v151 &= v151 - 1;
    }
    goto LABEL_132;
  }
  uint64_t v156 = v154 + 3;
  if (v156 >= (uint64_t)v230) {
    goto LABEL_124;
  }
  unint64_t v155 = *(void *)&v229[8 * v156];
  if (v155)
  {
    uint64_t v147 = v156;
    goto LABEL_99;
  }
  while (1)
  {
    uint64_t v147 = v156 + 1;
    if (__OFADD__(v156, 1)) {
      break;
    }
    if (v147 >= (uint64_t)v230) {
      goto LABEL_124;
    }
    unint64_t v155 = *(void *)&v229[8 * v147];
    ++v156;
    if (v155) {
      goto LABEL_99;
    }
  }
LABEL_130:
  __break(1u);
LABEL_131:
  __break(1u);
LABEL_132:
  __break(1u);
LABEL_133:
  uint64_t result = (*v222)(v47, 1, 1, v22);
LABEL_134:
  __break(1u);
  return result;
}

unint64_t sub_247DFADF0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1394F8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692CF250);
  uint64_t v6 = sub_247E00350();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (char *)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_247DFC1DC(v12, (uint64_t)v5);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_247DFC164(*v5, v15);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v19 = (uint64_t *)(v7[6] + 16 * result);
    *uint64_t v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = sub_247DFFFE0();
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

uint64_t sub_247DFAFE8(uint64_t a1)
{
  uint64_t result = sub_247E00230();
  int64_t v3 = 0;
  uint64_t v18 = result;
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      int64_t v3 = v14 + 1;
      if (v14 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v4 + 8 * v3);
      if (!v15)
      {
        int64_t v3 = v14 + 2;
        if (v14 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v4 + 8 * v3);
        if (!v15)
        {
          int64_t v3 = v14 + 3;
          if (v14 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v4 + 8 * v3);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    unint64_t v11 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_247DFD594(&v17, v12, v13);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v3);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_247DFB180@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1394B8);
  MEMORY[0x270FA5388]();
  unint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_247DFFFE0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t result = MEMORY[0x270FA5388]();
  unint64_t v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(a1 + 8) == 1)
  {
    v21[1] = v4;
    uint64_t v16 = *(void *)(a1 + 16);
    if (v16 && *(void *)(v16 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v17 = sub_247DFC164(a2, a3);
      if (v18)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v10, *(void *)(v16 + 56) + *(void *)(v12 + 72) * v17, v11);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
      }
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v15, v10, v11);
        char v20 = sub_247DFFFD0();
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
        char v19 = v20 & 1;
        goto LABEL_12;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
    }
    uint64_t result = sub_247DFEFEC((uint64_t)v10, &qword_26B1394B8);
    char v19 = 1;
  }
  else
  {
    char v19 = 0;
  }
LABEL_12:
  *a4 = v19;
  return result;
}

uint64_t sub_247DFB3F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1394B8);
  MEMORY[0x270FA5388]();
  unint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_247DFFFE0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t result = MEMORY[0x270FA5388]();
  unint64_t v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(a1 + 9) == 1)
  {
    v21[1] = v4;
    uint64_t v16 = *(void *)(a1 + 16);
    if (v16 && *(void *)(v16 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v17 = sub_247DFC164(a2, a3);
      if (v18)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v10, *(void *)(v16 + 56) + *(void *)(v12 + 72) * v17, v11);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
      }
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v15, v10, v11);
        char v20 = sub_247DFFFB0();
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
        char v19 = v20 & 1;
        goto LABEL_12;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
    }
    uint64_t result = sub_247DFEFEC((uint64_t)v10, &qword_26B1394B8);
    char v19 = 1;
  }
  else
  {
    char v19 = 0;
  }
LABEL_12:
  *a4 = v19;
  return result;
}

uint64_t sub_247DFB668@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = sub_247DFADF0(MEMORY[0x263F8EE78]);
  }
  *a2 = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_247DFB6BC()
{
  swift_release();

  swift_release();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for iOSManagementExpert()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for iOSManagementExpert.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for iOSManagementExpert.State(id *a1)
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for iOSManagementExpert.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  id v5 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for iOSManagementExpert.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
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

uint64_t assignWithTake for iOSManagementExpert.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for iOSManagementExpert.State(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for iOSManagementExpert.State(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for iOSManagementExpert.State()
{
  return &type metadata for iOSManagementExpert.State;
}

uint64_t sub_247DFB980@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(*(void *)v1 + 16);
  return swift_retain();
}

unint64_t sub_247DFB990()
{
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)v0 + 32);
  uint64_t v2 = (uint64_t)&v1[4];
  long long v3 = v1 + 12;
  os_unfair_lock_lock(v1 + 12);
  sub_247DFB668(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

uint64_t sub_247DFB9F4()
{
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)v0 + 32);
  uint64_t v2 = (uint64_t)&v1[4];
  long long v3 = v1 + 12;
  os_unfair_lock_lock(v1 + 12);
  sub_247DFC518(v2, (char *)&v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

uint64_t sub_247DFBA5C()
{
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)v0 + 32);
  uint64_t v2 = (uint64_t)&v1[4];
  long long v3 = v1 + 12;
  os_unfair_lock_lock(v1 + 12);
  sub_247DFC4FC(v2, (char *)&v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

uint64_t sub_247DFBAC4(uint64_t a1, uint64_t a2)
{
  return sub_247DFF20C(&qword_26B1394D0, a2, (void (*)(uint64_t))type metadata accessor for iOSManagementExpert);
}

uint64_t sub_247DFBB0C()
{
  return sub_247DFF1A8(&qword_26B1394D8, &qword_26B1394E0);
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

uint64_t sub_247DFBBD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247DFFFE0();
  uint64_t v68 = *(void *)(v4 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  int64_t v64 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  int64_t v8 = (char *)&v57 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B139378);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  unint64_t v15 = (int64_t *)((char *)&v57 - v14);
  if (a1 == a2) {
    return 1;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v65 = 0;
  uint64_t v60 = a1;
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v17 = a1 + 64;
  uint64_t v16 = v18;
  uint64_t v19 = 1 << *(unsigned char *)(v17 - 32);
  uint64_t v20 = -1;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  unint64_t v21 = v20 & v16;
  uint64_t v67 = v68 + 16;
  unint64_t v61 = (void (**)(char *, uint64_t))(v68 + 8);
  int64_t v62 = (void (**)(char *, char *, uint64_t))(v68 + 32);
  uint64_t v58 = v17;
  int64_t v59 = (unint64_t)(v19 + 63) >> 6;
  int64_t v57 = v59 - 1;
  uint64_t v22 = (uint64_t *)&unk_26B1394F0;
  uint64_t v63 = a2;
  while (1)
  {
    if (v21)
    {
      unint64_t v23 = __clz(__rbit64(v21));
      uint64_t v24 = (v21 - 1) & v21;
      unint64_t v25 = v23 | (v65 << 6);
LABEL_8:
      uint64_t v26 = *(void *)(v60 + 56);
      uint64_t v27 = (void *)(*(void *)(v60 + 48) + 16 * v25);
      uint64_t v28 = v27[1];
      *(void *)uint64_t v12 = *v27;
      *((void *)v12 + 1) = v28;
      uint64_t v29 = v68;
      uint64_t v30 = v26 + *(void *)(v68 + 72) * v25;
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(v22);
      (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(&v12[*(int *)(v31 + 48)], v30, v4);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v12, 0, 1, v31);
      swift_bridgeObjectRetain();
      goto LABEL_30;
    }
    int64_t v32 = v65 + 1;
    if (__OFADD__(v65, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v32 < v59)
    {
      unint64_t v33 = *(void *)(v58 + 8 * v32);
      if (v33) {
        goto LABEL_12;
      }
      int64_t v34 = v65 + 2;
      ++v65;
      if (v32 + 1 < v59)
      {
        unint64_t v33 = *(void *)(v58 + 8 * v34);
        if (v33) {
          goto LABEL_15;
        }
        int64_t v65 = v32 + 1;
        if (v32 + 2 < v59)
        {
          unint64_t v33 = *(void *)(v58 + 8 * (v32 + 2));
          if (v33)
          {
            v32 += 2;
            goto LABEL_12;
          }
          int64_t v65 = v32 + 2;
          if (v32 + 3 < v59)
          {
            unint64_t v33 = *(void *)(v58 + 8 * (v32 + 3));
            if (v33)
            {
              v32 += 3;
              goto LABEL_12;
            }
            int64_t v34 = v32 + 4;
            int64_t v65 = v32 + 3;
            if (v32 + 4 < v59) {
              break;
            }
          }
        }
      }
    }
LABEL_29:
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(v22);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v12, 1, 1, v35);
    uint64_t v24 = 0;
LABEL_30:
    sub_247DFEA7C((uint64_t)v12, (uint64_t)v15);
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(v22);
    int v37 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 48))(v15, 1, v36);
    BOOL v66 = v37 == 1;
    if (v37 == 1) {
      return v66;
    }
    unint64_t v38 = v24;
    uint64_t v39 = v22;
    uint64_t v40 = (char *)v15 + *(int *)(v36 + 48);
    uint64_t v41 = *v15;
    uint64_t v42 = v15[1];
    uint64_t v43 = v15;
    (*v62)(v8, v40, v4);
    uint64_t v44 = v41;
    uint64_t v45 = v63;
    unint64_t v46 = v8;
    unint64_t v47 = sub_247DFC164(v44, v42);
    char v49 = v48;
    swift_bridgeObjectRelease();
    if ((v49 & 1) == 0)
    {
      (*v61)(v46, v4);
      return 0;
    }
    uint64_t v50 = *(void *)(v45 + 56);
    uint64_t v51 = v4;
    uint64_t v52 = v12;
    uint64_t v53 = v68;
    uint64_t v54 = v64;
    (*(void (**)(char *, unint64_t, uint64_t))(v68 + 16))(v64, v50 + *(void *)(v68 + 72) * v47, v51);
    sub_247DFF20C(&qword_2692CF258, 255, MEMORY[0x263F25188]);
    char v55 = sub_247E001A0();
    uint64_t v56 = *(void (**)(char *, uint64_t))(v53 + 8);
    uint64_t v12 = v52;
    uint64_t v4 = v51;
    v56(v54, v51);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v56)(v46, v51);
    int64_t v8 = v46;
    unint64_t v15 = v43;
    uint64_t v22 = v39;
    unint64_t v21 = v38;
    if ((v55 & 1) == 0) {
      return v66;
    }
  }
  unint64_t v33 = *(void *)(v58 + 8 * v34);
  if (v33)
  {
LABEL_15:
    int64_t v32 = v34;
LABEL_12:
    uint64_t v24 = (v33 - 1) & v33;
    unint64_t v25 = __clz(__rbit64(v33)) + (v32 << 6);
    int64_t v65 = v32;
    goto LABEL_8;
  }
  while (1)
  {
    int64_t v32 = v34 + 1;
    if (__OFADD__(v34, 1)) {
      break;
    }
    if (v32 >= v59)
    {
      int64_t v65 = v57;
      goto LABEL_29;
    }
    unint64_t v33 = *(void *)(v58 + 8 * v32);
    ++v34;
    if (v33) {
      goto LABEL_12;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

unint64_t sub_247DFC164(uint64_t a1, uint64_t a2)
{
  sub_247E003B0();
  sub_247E001D0();
  uint64_t v4 = sub_247E003C0();

  return sub_247DFC244(a1, a2, v4);
}

uint64_t sub_247DFC1DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1394F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_247DFC244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_247E00380() & 1) == 0)
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
      while (!v14 && (sub_247E00380() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_247DFC328(uint64_t a1, int *a2)
{
  unint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_247DFC404;
  return v6(a1);
}

uint64_t sub_247DFC404()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_247DFC4FC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_247DFB3F4(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_247DFC518@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_247DFB180(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_247DFC56C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_247DF9340(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_247DFC588(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692CF260);
  uint64_t v10 = *(void *)(sub_247DFFFF0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_247E00320();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_247DFFFF0() - 8);
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
    sub_247DFEBE0(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_247DFC7F0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_247DFC8C4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_247DFCE98((uint64_t)v12, *a3);
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
      sub_247DFCE98((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_247DFC8C4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_247E002B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_247DFCA80(a5, a6);
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
  uint64_t v8 = sub_247E00310();
  if (!v8)
  {
    sub_247E00320();
    __break(1u);
LABEL_17:
    uint64_t result = sub_247E00360();
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

uint64_t sub_247DFCA80(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_247DFCB18(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_247DFCCF8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_247DFCCF8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_247DFCB18(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_247DFCC90(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_247E00300();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_247E00320();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_247E001E0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_247E00360();
    __break(1u);
LABEL_14:
    uint64_t result = sub_247E00320();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_247DFCC90(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1393A0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_247DFCCF8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1393A0);
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
  uint64_t result = sub_247E00360();
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

uint64_t sub_247DFCE98(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_247DFCEF8(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = sub_247DFFFE0();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388]();
  char v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692CF250);
  int v46 = a2;
  uint64_t v8 = sub_247E00340();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_39;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  unint64_t v47 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v14 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v19 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v20 = v19 | (v16 << 6);
      goto LABEL_20;
    }
    if (__OFADD__(v16++, 1)) {
      goto LABEL_41;
    }
    if (v16 >= v43) {
      break;
    }
    uint64_t v22 = v44;
    unint64_t v23 = v44[v16];
    if (!v23)
    {
      int64_t v24 = v16 + 1;
      if (v16 + 1 >= v43)
      {
LABEL_32:
        swift_release();
        uint64_t v3 = v42;
        if ((v46 & 1) == 0) {
          goto LABEL_39;
        }
        goto LABEL_35;
      }
      unint64_t v23 = v44[v24];
      if (!v23)
      {
        while (1)
        {
          int64_t v16 = v24 + 1;
          if (__OFADD__(v24, 1)) {
            break;
          }
          if (v16 >= v43) {
            goto LABEL_32;
          }
          unint64_t v23 = v44[v16];
          ++v24;
          if (v23) {
            goto LABEL_19;
          }
        }
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      ++v16;
    }
LABEL_19:
    unint64_t v13 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v16 << 6);
LABEL_20:
    uint64_t v25 = *(void *)(v7 + 56);
    uint64_t v26 = v7;
    uint64_t v27 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v20);
    uint64_t v28 = *v27;
    uint64_t v29 = v27[1];
    uint64_t v30 = v5;
    uint64_t v31 = *(void *)(v5 + 72);
    uint64_t v32 = v25 + v31 * v20;
    if (v46)
    {
      (*v47)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    sub_247E003B0();
    sub_247E001D0();
    uint64_t result = sub_247E003C0();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v14 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v34) & ~*(void *)(v14 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_40;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v14 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v17 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v9 + 48) + 16 * v17);
    *unint64_t v18 = v28;
    v18[1] = v29;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v47)(*(void *)(v9 + 56) + v31 * v17, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v5 = v30;
    uint64_t v7 = v26;
  }
  swift_release();
  uint64_t v3 = v42;
  uint64_t v22 = v44;
  if ((v46 & 1) == 0) {
    goto LABEL_39;
  }
LABEL_35:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v22, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

void *sub_247DFD2D8()
{
  uint64_t v1 = v0;
  uint64_t v34 = sub_247DFFFE0();
  uint64_t v2 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v33 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692CF250);
  uint64_t v4 = *v0;
  uint64_t v5 = sub_247E00330();
  uint64_t v6 = v5;
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v6;
    return result;
  }
  uint64_t v28 = v1;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v4 || (unint64_t)result >= v4 + 64 + 8 * v8) {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v8);
  }
  uint64_t v29 = v4 + 64;
  int64_t v9 = 0;
  uint64_t v10 = *(void *)(v4 + 16);
  uint64_t v35 = v6;
  *(void *)(v6 + 16) = v10;
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v32 = v2 + 16;
  int64_t v30 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v31 = v2 + 32;
  uint64_t v14 = v34;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v9 << 6);
      goto LABEL_9;
    }
    if (__OFADD__(v9++, 1)) {
      goto LABEL_27;
    }
    if (v9 >= v30)
    {
LABEL_24:
      uint64_t result = (void *)swift_release();
      uint64_t v1 = v28;
      uint64_t v6 = v35;
      goto LABEL_25;
    }
    unint64_t v26 = *(void *)(v29 + 8 * v9);
    if (!v26) {
      break;
    }
LABEL_21:
    unint64_t v13 = (v26 - 1) & v26;
    unint64_t v16 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    unint64_t v21 = *(void *)(v2 + 72) * v16;
    uint64_t v22 = v33;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v33, *(void *)(v4 + 56) + v21, v14);
    uint64_t v23 = v35;
    int64_t v24 = (void *)(*(void *)(v35 + 48) + v17);
    *int64_t v24 = v20;
    v24[1] = v19;
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v23 + 56) + v21, v22, v14);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v9 + 1;
  if (v9 + 1 >= v30) {
    goto LABEL_24;
  }
  unint64_t v26 = *(void *)(v29 + 8 * v27);
  if (v26)
  {
    ++v9;
    goto LABEL_21;
  }
  uint64_t v6 = v35;
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v30)
    {
      uint64_t result = (void *)swift_release();
      uint64_t v1 = v28;
      goto LABEL_25;
    }
    unint64_t v26 = *(void *)(v29 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_21;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_247DFD594(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_247E003B0();
  swift_bridgeObjectRetain();
  sub_247E001D0();
  uint64_t v8 = sub_247E003C0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_247E00380() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      unint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_247E00380() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_247DFE40C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_247DFD744(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (*(void *)(a2 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v37 = a1 + 64;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v35 = ~v5;
    if (-v5 < 64) {
      uint64_t v6 = ~(-1 << -(char)v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & v4;
    int64_t v36 = (unint64_t)(63 - v5) >> 6;
    uint64_t v8 = a2 + 56;
    swift_bridgeObjectRetain();
    int64_t v9 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v11 = v10 | (v9 << 6);
      }
      else
      {
        int64_t v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36) {
          goto LABEL_47;
        }
        unint64_t v13 = *(void *)(v37 + 8 * v12);
        int64_t v14 = v9 + 1;
        if (!v13)
        {
          int64_t v14 = v9 + 2;
          if (v9 + 2 >= v36) {
            goto LABEL_47;
          }
          unint64_t v13 = *(void *)(v37 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v9 + 3;
            if (v9 + 3 >= v36) {
              goto LABEL_47;
            }
            unint64_t v13 = *(void *)(v37 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v9 + 4;
              if (v9 + 4 >= v36) {
                goto LABEL_47;
              }
              unint64_t v13 = *(void *)(v37 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  sub_247DFED38();
                  return v2;
                }
                unint64_t v13 = *(void *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      break;
                    }
                    if (v14 >= v36) {
                      goto LABEL_47;
                    }
                    unint64_t v13 = *(void *)(v37 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_24;
                    }
                  }
LABEL_49:
                  __break(1u);
                }
                int64_t v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        unint64_t v7 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        int64_t v9 = v14;
      }
      unint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      sub_247E003B0();
      swift_bridgeObjectRetain();
      sub_247E001D0();
      uint64_t v19 = sub_247E003C0();
      uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v21 = v19 & ~v20;
      if ((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21)) {
        break;
      }
LABEL_6:
      swift_bridgeObjectRelease();
    }
    uint64_t v22 = *(void *)(v2 + 48);
    uint64_t v23 = (void *)(v22 + 16 * v21);
    BOOL v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_247E00380() & 1) != 0)
    {
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
    }
    else
    {
      uint64_t v25 = ~v20;
      do
      {
        unint64_t v21 = (v21 + 1) & v25;
        if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
          goto LABEL_6;
        }
        unint64_t v26 = (void *)(v22 + 16 * v21);
        BOOL v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_247E00380() & 1) == 0);
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    char v29 = *(unsigned char *)(v2 + 32);
    unint64_t v30 = (unint64_t)((1 << v29) + 63) >> 6;
    size_t v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      MEMORY[0x270FA5388](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_247DFDE94((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      sub_247DFED38();
    }
    else
    {
      uint64_t v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      uint64_t v32 = sub_247DFDE94((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      sub_247DFED38();
      MEMORY[0x24C56C620](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
}

uint64_t sub_247DFDBB4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692CF268);
  uint64_t v3 = sub_247E002E0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v30 = (void *)(v2 + 56);
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
                  *unint64_t v30 = -1 << v29;
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
      sub_247E003B0();
      sub_247E001D0();
      uint64_t result = sub_247E003C0();
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
      *unint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_247DFDE94(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v38 = (unint64_t *)result;
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v39 = a3 + 56;
  while (2)
  {
    uint64_t v37 = v8;
    do
    {
      while (1)
      {
        int64_t v9 = a5[3];
        unint64_t v10 = a5[4];
        if (v10)
        {
          uint64_t v11 = (v10 - 1) & v10;
          unint64_t v12 = __clz(__rbit64(v10)) | (v9 << 6);
        }
        else
        {
          int64_t v13 = v9 + 1;
          if (__OFADD__(v9, 1))
          {
            __break(1u);
            goto LABEL_45;
          }
          int64_t v14 = (unint64_t)(a5[2] + 64) >> 6;
          int64_t v15 = a5[3];
          if (v13 >= v14) {
            goto LABEL_43;
          }
          uint64_t v16 = a5[1];
          unint64_t v17 = *(void *)(v16 + 8 * v13);
          if (!v17)
          {
            int64_t v15 = v9 + 1;
            if (v9 + 2 >= v14) {
              goto LABEL_43;
            }
            unint64_t v17 = *(void *)(v16 + 8 * (v9 + 2));
            if (v17)
            {
              int64_t v13 = v9 + 2;
            }
            else
            {
              int64_t v15 = v9 + 2;
              if (v9 + 3 >= v14) {
                goto LABEL_43;
              }
              unint64_t v17 = *(void *)(v16 + 8 * (v9 + 3));
              if (v17)
              {
                int64_t v13 = v9 + 3;
              }
              else
              {
                int64_t v13 = v9 + 4;
                int64_t v15 = v9 + 3;
                if (v9 + 4 >= v14) {
                  goto LABEL_43;
                }
                unint64_t v17 = *(void *)(v16 + 8 * v13);
                if (!v17)
                {
                  int64_t v15 = v14 - 1;
                  int64_t v18 = v9 + 5;
                  while (v14 != v18)
                  {
                    unint64_t v17 = *(void *)(v16 + 8 * v18++);
                    if (v17)
                    {
                      int64_t v13 = v18 - 1;
                      goto LABEL_21;
                    }
                  }
LABEL_43:
                  a5[3] = v15;
                  a5[4] = 0;
                  swift_retain();
                  return sub_247DFE174(v38, a2, v37, a3);
                }
              }
            }
          }
LABEL_21:
          uint64_t v11 = (v17 - 1) & v17;
          unint64_t v12 = __clz(__rbit64(v17)) + (v13 << 6);
          int64_t v9 = v13;
        }
        uint64_t v19 = (uint64_t *)(*(void *)(*a5 + 48) + 16 * v12);
        uint64_t v21 = *v19;
        uint64_t v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_247E003B0();
        swift_bridgeObjectRetain();
        sub_247E001D0();
        uint64_t v22 = sub_247E003C0();
        uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v24 = v22 & ~v23;
        unint64_t v25 = v24 >> 6;
        uint64_t v26 = 1 << v24;
        if (((1 << v24) & *(void *)(v39 + 8 * (v24 >> 6))) != 0) {
          break;
        }
LABEL_3:
        uint64_t result = swift_bridgeObjectRelease();
      }
      uint64_t v27 = *(void *)(a3 + 48);
      uint64_t v28 = (void *)(v27 + 16 * v24);
      BOOL v29 = *v28 == v21 && v28[1] == v20;
      if (!v29 && (sub_247E00380() & 1) == 0)
      {
        uint64_t v31 = ~v23;
        for (unint64_t i = v24 + 1; ; unint64_t i = v33 + 1)
        {
          unint64_t v33 = i & v31;
          if (((*(void *)(v39 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0) {
            break;
          }
          uint64_t v34 = (void *)(v27 + 16 * v33);
          BOOL v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_247E00380() & 1) != 0)
          {
            uint64_t result = swift_bridgeObjectRelease();
            unint64_t v25 = v33 >> 6;
            uint64_t v26 = 1 << v33;
            goto LABEL_29;
          }
        }
        goto LABEL_3;
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_29:
      unint64_t v30 = v38[v25];
      v38[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    uint64_t v8 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_45:
      __break(1u);
      return result;
    }
    if (v37 != 1) {
      continue;
    }
    return MEMORY[0x263F8EE88];
  }
}

uint64_t sub_247DFE174(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692CF268);
  uint64_t result = sub_247E002F0();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_247E003B0();
    swift_bridgeObjectRetain();
    sub_247E001D0();
    uint64_t result = sub_247E003C0();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
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
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_247DFE40C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_247DFDBB4();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_247DFE5A8();
      goto LABEL_22;
    }
    sub_247DFE75C();
  }
  uint64_t v11 = *v4;
  sub_247E003B0();
  sub_247E001D0();
  uint64_t result = sub_247E003C0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_247E00380(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_247E00390();
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
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_247E00380();
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
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  uint64_t *v21 = v8;
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

void *sub_247DFE5A8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692CF268);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_247E002D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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

uint64_t sub_247DFE75C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2692CF268);
  uint64_t v3 = sub_247E002E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_247E003B0();
    swift_bridgeObjectRetain();
    sub_247E001D0();
    uint64_t result = sub_247E003C0();
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

uint64_t sub_247DFEA0C()
{
  return objectdestroyTm(MEMORY[0x263F8EEA0]);
}

uint64_t sub_247DFEA24()
{
  return sub_247DF80DC(*(void *)(v0 + 16));
}

uint64_t sub_247DFEA2C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247DFEA3C()
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

uint64_t sub_247DFEA7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B139378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_247DFEAE4(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1394E0);
  swift_allocObject();
  v1[2] = sub_247E000E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B139550);
  uint64_t v3 = swift_allocObject();
  *(_DWORD *)(v3 + 48) = 0;
  uint64_t v4 = (os_unfair_lock_s *)(v3 + 48);
  *(void *)(v3 + 16) = 0;
  uint64_t v5 = v3 + 16;
  *(_WORD *)(v3 + 24) = 257;
  uint64_t v6 = MEMORY[0x263F8EE78];
  *(void *)(v3 + 32) = 0;
  *(void *)(v3 + 40) = v6;
  v1[3] = a1;
  v1[4] = v3;
  id v7 = a1;
  swift_retain();
  os_unfair_lock_lock(v4);
  sub_247DFF254(v5);
  os_unfair_lock_unlock(v4);
  swift_release();
  sub_247DF8C14();
  return v1;
}

uint64_t sub_247DFEBE0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_247DFFFF0() - 8);
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
  uint64_t result = sub_247E00360();
  __break(1u);
  return result;
}

uint64_t sub_247DFED38()
{
  return swift_release();
}

unint64_t sub_247DFED40()
{
  unint64_t result = qword_26B139390;
  if (!qword_26B139390)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B139390);
  }
  return result;
}

uint64_t sub_247DFED80()
{
  return objectdestroyTm(MEMORY[0x263F8EEE8]);
}

uint64_t objectdestroyTm(void (*a1)(void))
{
  a1(*(void *)(v1 + 16));
  swift_release();

  return MEMORY[0x270FA0238](v1, 32, 7);
}

uint64_t sub_247DFEDE0(uint64_t a1)
{
  return sub_247DF8E74(a1);
}

uint64_t sub_247DFEDE8()
{
  swift_unknownObjectRelease();

  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_247DFEE30(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_247DFEEF8;
  return sub_247DF5938(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_247DFEEF8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_247DFEFEC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_247DFF048()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247DFF080(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_247DFEEF8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2692CF2E8 + dword_2692CF2E8);
  return v6(a1, v4);
}

uint64_t sub_247DFF138()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_247DFF178()
{
  return (*(uint64_t (**)(void))(v0 + 16))(*(void *)(v0 + 32));
}

uint64_t sub_247DFF1A8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_247DFF1EC@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  return sub_247DF8800(a1, *(unsigned char *)(v2 + 16), *(unsigned __int8 *)(v2 + 17), a2);
}

uint64_t sub_247DFF20C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_247DFF254(uint64_t a1)
{
}

uint64_t sub_247DFF274()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_247DFF2AC(uint64_t a1)
{
  return sub_247DF7F14(a1);
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_26B139528)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26B139528);
    }
  }
}

uint64_t sub_247DFF314@<X0>(uint64_t a1@<X8>)
{
  return sub_247DFFE1C(v1, a1);
}

id APDServer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id APDServer.init()()
{
  uint64_t v1 = sub_247E00270();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_247E00260();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = sub_247E00160();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v20 = OBJC_IVAR____TtC19AppProtectionDaemon9APDServer_serviceQueue;
  sub_247DFED40();
  uint64_t v21 = v0;
  sub_247E00150();
  *(void *)&long long v23 = MEMORY[0x263F8EE78];
  sub_247DFF8D4(&qword_26B139538, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B139510);
  sub_247DFF6B0();
  sub_247E002C0();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F130], v1);
  uint64_t v7 = (void *)sub_247E00290();
  *(void *)(v19[1] + v20) = v7;
  uint64_t v8 = self;
  id v9 = v7;
  id v10 = objc_msgSend(v8, sel_defaultCenter);
  sub_247E00050();
  sub_247E00030();
  uint64_t v11 = (void *)sub_247E00040();
  swift_release();
  uint64_t v12 = type metadata accessor for iOSManagementExpert();
  swift_allocObject();
  int64_t v13 = sub_247DFEAE4(v9);

  uint64_t v14 = sub_247DFF8D4(&qword_26B1394C8, (void (*)(uint64_t))type metadata accessor for iOSManagementExpert);
  unint64_t v15 = v21;
  int64_t v16 = &v21[OBJC_IVAR____TtC19AppProtectionDaemon9APDServer_platformExpert];
  *(void *)int64_t v16 = v13;
  *(_OWORD *)(v16 + 8) = v23;
  *((void *)v16 + 3) = v12;
  *((void *)v16 + 4) = v14;

  unint64_t v17 = (objc_class *)type metadata accessor for APDServer();
  v22.receiver = v15;
  v22.super_class = v17;
  return objc_msgSendSuper2(&v22, sel_init);
}

unint64_t sub_247DFF6B0()
{
  unint64_t result = qword_26B139518;
  if (!qword_26B139518)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B139510);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B139518);
  }
  return result;
}

void sub_247DFF730()
{
  sub_247E00090();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC19AppProtectionDaemon9APDServer_serviceQueue);
  uint64_t v2 = v0 + OBJC_IVAR____TtC19AppProtectionDaemon9APDServer_platformExpert;
  sub_247DFF940();
  uint64_t v4 = swift_allocObject();
  sub_247DFF9CC(v2, v4 + 16);
  id v3 = v1;
  sub_247E00080();
  sub_247E00070();
  __break(1u);
}

id APDServer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for APDServer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_247DFF8D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for APDServer()
{
  return self;
}

unint64_t sub_247DFF940()
{
  unint64_t result = qword_26B1394C0;
  if (!qword_26B1394C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1394C0);
  }
  return result;
}

uint64_t sub_247DFF994()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_247DFF9CC(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t method lookup function for APDServer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for APDServer);
}

uint64_t dispatch thunk of APDServer.run(arguments:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t initializeWithCopy for iOSPlatformExpert(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for iOSPlatformExpert(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *long long v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for iOSPlatformExpert(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for iOSPlatformExpert(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for iOSPlatformExpert(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for iOSPlatformExpert()
{
  return &type metadata for iOSPlatformExpert;
}

uint64_t sub_247DFFE1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_247DFFE80(uint64_t a1)
{
  return a1;
}

uint64_t sub_247DFFEA8()
{
  uint64_t v0 = sub_247E000C0();
  __swift_allocate_value_buffer(v0, qword_26B139558);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B139558);
  return sub_247E000B0();
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

uint64_t sub_247DFFF90()
{
  return MEMORY[0x270EEE390]();
}

uint64_t sub_247DFFFA0()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_247DFFFB0()
{
  return MEMORY[0x270F0CC18]();
}

uint64_t sub_247DFFFC0()
{
  return MEMORY[0x270F0CC20]();
}

uint64_t sub_247DFFFD0()
{
  return MEMORY[0x270F0CC28]();
}

uint64_t sub_247DFFFE0()
{
  return MEMORY[0x270F0CC30]();
}

uint64_t sub_247DFFFF0()
{
  return MEMORY[0x270F0CC48]();
}

uint64_t sub_247E00000()
{
  return MEMORY[0x270F0CC50]();
}

uint64_t sub_247E00010()
{
  return MEMORY[0x270F0CC58]();
}

uint64_t sub_247E00020()
{
  return MEMORY[0x270F0CC60]();
}

uint64_t sub_247E00030()
{
  return MEMORY[0x270F0CC68]();
}

uint64_t sub_247E00040()
{
  return MEMORY[0x270F0CC70]();
}

uint64_t sub_247E00050()
{
  return MEMORY[0x270F0CC78]();
}

uint64_t sub_247E00060()
{
  return MEMORY[0x270F0CC80]();
}

uint64_t sub_247E00070()
{
  return MEMORY[0x270F0CC88]();
}

uint64_t sub_247E00080()
{
  return MEMORY[0x270F0CC90]();
}

uint64_t sub_247E00090()
{
  return MEMORY[0x270F0CC98]();
}

uint64_t sub_247E000A0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_247E000B0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_247E000C0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_247E000D0()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_247E000E0()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_247E000F0()
{
  return MEMORY[0x270F24E90]();
}

uint64_t sub_247E00120()
{
  return MEMORY[0x270F24EA8]();
}

uint64_t sub_247E00130()
{
  return MEMORY[0x270F24EB0]();
}

uint64_t sub_247E00140()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_247E00150()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_247E00160()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_247E00170()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_247E00180()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_247E00190()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_247E001A0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_247E001B0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_247E001C0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_247E001D0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_247E001E0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_247E001F0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_247E00200()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_247E00210()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_247E00220()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_247E00230()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_247E00240()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_247E00250()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_247E00260()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_247E00270()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_247E00280()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_247E00290()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_247E002A0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_247E002B0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_247E002C0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_247E002D0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_247E002E0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_247E002F0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_247E00300()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_247E00310()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_247E00320()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_247E00330()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_247E00340()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_247E00350()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_247E00360()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_247E00370()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_247E00380()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_247E00390()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_247E003B0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_247E003C0()
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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