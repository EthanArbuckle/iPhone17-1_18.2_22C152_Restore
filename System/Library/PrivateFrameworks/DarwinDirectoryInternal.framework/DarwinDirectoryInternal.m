uint64_t DDIInitializeLocalUsersAndGroups(uint64_t a1)
{
  return +[DDObjcCompatibility swiftInitializeLocalUsersAndGroupsAndPerform:a1];
}

BOOL DDIUpdateLocalUsersAndGroups(void *a1, uint64_t a2)
{
  if (a1) {
    *a1 = 0;
  }
  id v6 = 0;
  +[DDObjcCompatibility swiftUpdateLocalUsersAndGroupsAndReturnError:&v6 perform:a2];
  id v3 = v6;
  v4 = v3;
  if (a1 && v3) {
    *a1 = v3;
  }

  return v4 == 0;
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270ED80B0](a1, v6, v5, 80, a5, v7, 16);
}

uint64_t DarwinDirectory_xpc_make_serialization()
{
  return MEMORY[0x270EDC288]();
}

uint64_t sub_24C8AB78C(char a1)
{
  uint64_t v3 = 0;
  uint64_t v4 = sub_24C8F7900();
  uint64_t v61 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v60 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_24C8F7AE0();
  uint64_t v70 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  v71 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v7 = a1 & 1;
  if (a1) {
    uint64_t v8 = 0x6C61636F6CLL;
  }
  else {
    uint64_t v8 = 0x6D6574737973;
  }
  if (a1) {
    unint64_t v9 = 0xE500000000000000;
  }
  else {
    unint64_t v9 = 0xE600000000000000;
  }
  unint64_t v10 = sub_24C8AC3D4(a1 & 1);
  int64_t v12 = v11;
  unint64_t v13 = v10 >> 62;
  unint64_t v14 = v11 >> 62;
  if (v7)
  {
    char v15 = sub_24C8F8380();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
LABEL_14:
      unint64_t v63 = v9;
      uint64_t v64 = v1;
      uint64_t v62 = v8;
      uint64_t v59 = v4;
      if (v13) {
        goto LABEL_47;
      }
      uint64_t v16 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      while (1)
      {
        uint64_t v17 = MEMORY[0x263F8EE78];
        if (v16) {
          break;
        }
        swift_bridgeObjectRelease();
        uint64_t v3 = MEMORY[0x263F8EE78];
        uint64_t v21 = v12 & 0xFFFFFFFFFFFFFF8;
        if (!v14) {
          goto LABEL_26;
        }
LABEL_39:
        if (v12 < 0) {
          unint64_t v10 = v12;
        }
        else {
          unint64_t v10 = v21;
        }
        swift_bridgeObjectRetain();
        uint64_t v22 = sub_24C8F8020();
        swift_bridgeObjectRelease();
        if (!v22)
        {
LABEL_43:
          swift_bridgeObjectRelease();
          return v3;
        }
LABEL_27:
        uint64_t v74 = v17;
        sub_24C8F7FB0();
        if (v22 < 0) {
          goto LABEL_61;
        }
        uint64_t v65 = v3;
        uint64_t v3 = 0;
        v68 = (void (**)(char *, uint64_t, uint64_t))(v70 + 16);
        unint64_t v69 = v12 & 0xC000000000000001;
        v66 = (void (**)(uint64_t, char *, uint64_t))(v70 + 32);
        int64_t v67 = v12;
        while (v22 != v3)
        {
          if (v69)
          {
            uint64_t v23 = MEMORY[0x2532FF870](v3, v12);
          }
          else
          {
            uint64_t v23 = *(void *)(v12 + 8 * v3 + 32);
            swift_retain();
          }
          if (*(void *)(v23 + 16) != 3) {
            goto LABEL_65;
          }
          unint64_t v10 = *(unsigned int *)(v23 + 24);
          uint64_t v25 = *(void *)(v23 + 32);
          uint64_t v24 = *(void *)(v23 + 40);
          (*v68)(v71, v23 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_uuid, v72);
          uint64_t v26 = *(void *)(v23 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups);
          if (!v26) {
            goto LABEL_64;
          }
          uint64_t v27 = *(void *)(v23 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases);
          if (!v27)
          {
            __break(1u);
LABEL_64:
            __break(1u);
LABEL_65:
            LODWORD(v73) = 22;
            swift_retain();
            sub_24C8E0F2C(MEMORY[0x263F8EE78]);
            sub_24C8AFA98((unint64_t *)&qword_2697F8F10, MEMORY[0x263F06080]);
            uint64_t v45 = v59;
            v46 = v60;
            sub_24C8F79E0();
            v47 = (void *)sub_24C8F78F0();
            (*(void (**)(char *, uint64_t))(v61 + 8))(v46, v45);
            swift_willThrow();
            swift_release_n();

            swift_bridgeObjectRelease();
            swift_release();
            goto LABEL_66;
          }
          ++v3;
          uint64_t v28 = *(void *)(v23 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_fullName + 8);
          uint64_t v70 = *(void *)(v23 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_fullName);
          type metadata accessor for GroupRecord(0);
          unint64_t v14 = swift_allocObject();
          *(_DWORD *)(v14 + 32) = v10;
          *(void *)(v14 + 40) = v25;
          *(void *)(v14 + 48) = v24;
          (*v66)(v14 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v71, v72);
          *(void *)(v14 + 16) = v70;
          *(void *)(v14 + 24) = v28;
          *(void *)(v14 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups) = v26;
          *(void *)(v14 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases) = v27;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_release();
          sub_24C8F7F90();
          sub_24C8F7FC0();
          sub_24C8F7FD0();
          sub_24C8F7FA0();
          int64_t v12 = v67;
          if (v22 == v3)
          {
            swift_bridgeObjectRelease();
            return v65;
          }
        }
LABEL_46:
        __break(1u);
LABEL_47:
        swift_bridgeObjectRetain();
        uint64_t v16 = sub_24C8F8020();
        swift_bridgeObjectRelease();
      }
      uint64_t v74 = MEMORY[0x263F8EE78];
      sub_24C8F7FB0();
      if (v16 < 0)
      {
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        swift_release_n();
        swift_release();
        MEMORY[0x2533003E0](v3);
LABEL_66:
        uint64_t v74 = 0;
        unint64_t v75 = 0xE000000000000000;
        sub_24C8F7F00();
        sub_24C8F7CF0();
        sub_24C8F7CF0();
        swift_bridgeObjectRelease();
        sub_24C8F7CF0();
        uint64_t v48 = v74;
        unint64_t v49 = v75;
        swift_bridgeObjectRetain_n();
        v50 = sub_24C8F7AF0();
        os_log_type_t v51 = sub_24C8F7E30();
        if (os_log_type_enabled(v50, v51))
        {
          v52 = (uint8_t *)swift_slowAlloc();
          uint64_t v53 = swift_slowAlloc();
          uint64_t v74 = v53;
          *(_DWORD *)v52 = 136446210;
          swift_bridgeObjectRetain();
          uint64_t v73 = sub_24C8E22EC(v48, v49, &v74);
          sub_24C8F7E60();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_24C8A9000, v50, v51, "%{public}s", v52, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x253300580](v53, -1, -1);
          MEMORY[0x253300580](v52, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }

        uint64_t v74 = 0xD000000000000011;
        unint64_t v75 = 0x800000024C8FBC60;
        uint64_t v54 = sub_24C8F7CF0();
        if ((v75 & 0x1000000000000000) == 0 && v75 & 0x2000000000000000 | v74 & 0x1000000000000000)
        {
          MEMORY[0x270FA5388](v54);
          *(&v59 - 2) = (uint64_t)sub_24C8B3F18;
          *(&v59 - 1) = 0;
          if ((v56 & 0x2000000000000000) == 0) {
            goto LABEL_74;
          }
          uint64_t v37 = v56 & 0xFFFFFFFFFFFFFFLL;
          uint64_t v74 = v55;
LABEL_73:
          unint64_t v75 = v37;
          abort_with_reason();
LABEL_74:
          if ((v55 & 0x1000000000000000) != 0)
          {
            uint64_t v57 = (v56 & 0xFFFFFFFFFFFFFFFLL) + 32;
            uint64_t v58 = v55 & 0xFFFFFFFFFFFFLL;
          }
          else
          {
            uint64_t v57 = sub_24C8F7F80();
          }
          sub_24C8AF8EC(v57, v58, sub_24C8AF944);
          __break(1u);
LABEL_78:
          sub_24C8F7EF0();
          __break(1u);
          goto LABEL_79;
        }
LABEL_81:
        sub_24C8F7EF0();
        __break(1u);
        goto LABEL_82;
      }
      int64_t v18 = v12;
      uint64_t v19 = 0;
      int64_t v12 = v10 & 0xC000000000000001;
      do
      {
        if (v16 == v19)
        {
          __break(1u);
          goto LABEL_46;
        }
        if (v12) {
          MEMORY[0x2532FF870](v19, v10);
        }
        else {
          swift_retain();
        }
        uint64_t v20 = swift_retain();
        sub_24C8C493C(v20);
        if (v3) {
          goto LABEL_62;
        }
        ++v19;
        swift_release_n();
        sub_24C8F7F90();
        sub_24C8F7FC0();
        sub_24C8F7FD0();
        sub_24C8F7FA0();
      }
      while (v16 != v19);
      uint64_t v3 = v74;
      swift_bridgeObjectRelease();
      int64_t v12 = v18;
      uint64_t v17 = MEMORY[0x263F8EE78];
      uint64_t v21 = v18 & 0xFFFFFFFFFFFFFF8;
      if (v14) {
        goto LABEL_39;
      }
LABEL_26:
      uint64_t v22 = *(void *)(v21 + 16);
      if (!v22) {
        goto LABEL_43;
      }
      goto LABEL_27;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if (!v13)
  {
    if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_12;
    }
LABEL_49:
    v31 = sub_24C8F7AF0();
    os_log_type_t v32 = sub_24C8F7E30();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      uint64_t v74 = v34;
      *(_DWORD *)v33 = 136446210;
      uint64_t v73 = sub_24C8E22EC(0xD00000000000001ALL, 0x800000024C8FBCD0, &v74);
      sub_24C8F7E60();
      _os_log_impl(&dword_24C8A9000, v31, v32, "%{public}s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253300580](v34, -1, -1);
      MEMORY[0x253300580](v33, -1, -1);
    }

    if (((unint64_t)"No system user files found" & 0x1000000000000000) != 0) {
      goto LABEL_78;
    }
    MEMORY[0x270FA5388](v35);
    *(&v59 - 2) = (uint64_t)sub_24C8B3F18;
    *(&v59 - 1) = 0;
    if ((v36 & 0x2000000000000000) != 0)
    {
      uint64_t v37 = v36 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v74 = 0xD00000000000002BLL;
      goto LABEL_73;
    }
LABEL_79:
    if ((v36 & 0xFFFFFFFFFFFFFFFLL) == 0xFFFFFFFFFFFFFFE0)
    {
      sub_24C8AFB34();
      __break(1u);
      goto LABEL_81;
    }
    goto LABEL_84;
  }
  swift_bridgeObjectRetain();
  uint64_t v30 = sub_24C8F8020();
  swift_bridgeObjectRelease();
  if (!v30) {
    goto LABEL_49;
  }
LABEL_12:
  if (v14)
  {
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_24C8F8020();
    swift_bridgeObjectRelease();
    if (v38) {
      goto LABEL_14;
    }
  }
  else if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_14;
  }
  v39 = sub_24C8F7AF0();
  os_log_type_t v40 = sub_24C8F7E30();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = (uint8_t *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    uint64_t v74 = v42;
    *(_DWORD *)v41 = 136446210;
    uint64_t v73 = sub_24C8E22EC(0xD00000000000001BLL, 0x800000024C8FBC80, &v74);
    sub_24C8F7E60();
    _os_log_impl(&dword_24C8A9000, v39, v40, "%{public}s", v41, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253300580](v42, -1, -1);
    MEMORY[0x253300580](v41, -1, -1);
  }

  if (((unint64_t)"No system group files found" & 0x1000000000000000) != 0) {
    goto LABEL_81;
  }
  MEMORY[0x270FA5388](v43);
  *(&v59 - 2) = (uint64_t)sub_24C8B3F18;
  *(&v59 - 1) = 0;
  if ((v44 & 0x2000000000000000) != 0)
  {
    uint64_t v37 = v44 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v74 = 0xD00000000000002CLL;
    goto LABEL_73;
  }
LABEL_82:
  if ((v44 & 0xFFFFFFFFFFFFFFFLL) == 0xFFFFFFFFFFFFFFE0)
  {
    sub_24C8AFB34();
    __break(1u);
LABEL_84:
    sub_24C8AFB34();
    __break(1u);
  }
  uint64_t result = sub_24C8AFB34();
  __break(1u);
  return result;
}

uint64_t sub_24C8AC3D4(int a1)
{
  uint64_t v2 = sub_24C8F7C20();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v17 - v7;
  int v18 = a1;
  uint64_t v17 = v3;
  if (a1)
  {
    if (qword_2697F8ED8 != -1) {
      swift_once();
    }
    unint64_t v9 = qword_2697FC1C0;
  }
  else
  {
    if (qword_2697F8EC8 != -1) {
      swift_once();
    }
    unint64_t v9 = qword_2697FC190;
  }
  uint64_t v10 = __swift_project_value_buffer(v2, (uint64_t)v9);
  unint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v11(v8, v10, v2);
  uint64_t v12 = sub_24C8ACC4C((uint64_t)v8, (void (*)(void))type metadata accessor for UserRecordFile, &qword_2697F8F30, (void (*)(uint64_t))type metadata accessor for UserRecordFile, (uint64_t)"i%m$\bR");
  unint64_t v13 = *(void (**)(char *, uint64_t))(v3 + 8);
  v13(v8, v2);
  if (v18)
  {
    if (qword_2697F8EE0 != -1) {
      swift_once();
    }
    unint64_t v14 = qword_2697FC1D8;
  }
  else
  {
    if (qword_2697F8ED0 != -1) {
      swift_once();
    }
    unint64_t v14 = qword_2697FC1A8;
  }
  uint64_t v15 = __swift_project_value_buffer(v2, (uint64_t)v14);
  v11(v6, v15, v2);
  sub_24C8ACC4C((uint64_t)v6, (void (*)(void))type metadata accessor for GroupRecordFile, &qword_2697F8F28, (void (*)(uint64_t))type metadata accessor for GroupRecordFile, (uint64_t)&unk_24C8F9E70);
  v13(v6, v2);
  return v12;
}

uint64_t sub_24C8ACC4C(uint64_t a1, void (*a2)(void), unint64_t *a3, void (*a4)(uint64_t), uint64_t a5)
{
  os_log_type_t v40 = a4;
  uint64_t v41 = a5;
  uint64_t v38 = a2;
  v39 = a3;
  uint64_t v7 = sub_24C8F7C20();
  uint64_t v35 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v33 - v11;
  uint64_t v13 = sub_24C8F7B10();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v33 - v18;
  uint64_t v20 = v37;
  uint64_t v21 = sub_24C8B9334(a1);
  if (v20)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v19, v5, v13);
    uint64_t v22 = sub_24C8F7AF0();
    os_log_type_t v23 = sub_24C8F7E30();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_24C8A9000, v22, v23, "Failed to load record files: failed to get contents of directory", v24, 2u);
      MEMORY[0x253300580](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
    return swift_willThrow();
  }
  else
  {
    uint64_t v36 = v7;
    uint64_t v37 = v5;
    v33[4] = v10;
    v33[5] = v14;
    uint64_t v42 = MEMORY[0x263F8EE78];
    uint64_t v26 = *(void *)(v21 + 16);
    if (v26)
    {
      v33[2] = v21;
      v33[3] = v17;
      v33[1] = v13;
      uint64_t v28 = *(void *)(v35 + 16);
      uint64_t v27 = v35 + 16;
      unint64_t v29 = v21 + ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80));
      uint64_t v34 = (void (**)(char *, uint64_t))(v35 + 8);
      uint64_t v35 = v28;
      uint64_t v30 = *(void *)(v27 + 56);
      uint64_t v31 = v36;
      do
      {
        uint64_t v32 = v27;
        ((void (*)(char *, unint64_t, uint64_t))v35)(v12, v29, v31);
        sub_24C8ADC54((unint64_t)v12, v38, v39, v40, v41);
        MEMORY[0x2532FF670]();
        if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_24C8F7D70();
        }
        sub_24C8F7DA0();
        sub_24C8F7D60();
        uint64_t v31 = v36;
        (*v34)(v12, v36);
        v29 += v30;
        --v26;
        uint64_t v27 = v32;
      }
      while (v26);
      swift_bridgeObjectRelease();
      return v42;
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x263F8EE78];
    }
  }
}

uint64_t sub_24C8AD208(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6E6F6973726576;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6E6F6973726576;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE200000000000000;
      uint64_t v5 = 17481;
      break;
    case 2:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1701667182;
      break;
    case 3:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1145656661;
      break;
    case 4:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x656D614E6C6C7566;
      break;
    case 5:
      uint64_t v5 = 0x724764657473656ELL;
      unint64_t v3 = 0xEC0000007370756FLL;
      break;
    case 6:
      uint64_t v5 = 0x73657361696C61;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE200000000000000;
      if (v5 == 17481) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 2:
      unint64_t v6 = 0xE400000000000000;
      if (v5 != 1701667182) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 3:
      unint64_t v6 = 0xE400000000000000;
      if (v5 != 1145656661) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 4:
      unint64_t v6 = 0xE800000000000000;
      if (v5 != 0x656D614E6C6C7566) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 5:
      uint64_t v2 = 0x724764657473656ELL;
      unint64_t v6 = 0xEC0000007370756FLL;
      goto LABEL_18;
    case 6:
      if (v5 != 0x73657361696C61) {
        goto LABEL_22;
      }
      goto LABEL_19;
    default:
LABEL_18:
      if (v5 != v2) {
        goto LABEL_22;
      }
LABEL_19:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_22:
      }
        char v7 = sub_24C8F8380();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_24C8AD424(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEE00734449555565;
  unint64_t v3 = 0x7A696D796E6F6E61;
  uint64_t v4 = a1;
  unint64_t v5 = 0x7A696D796E6F6E61;
  unint64_t v6 = 0xEE00734449555565;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0x800000024C8FBBA0;
      unint64_t v5 = 0xD000000000000013;
      break;
    case 2:
      unint64_t v5 = 0xD000000000000024;
      char v7 = "defaultGroupMembershipsForLocalUsers";
      goto LABEL_5;
    case 3:
      unint64_t v5 = 0xD000000000000022;
      char v7 = "defaultGroupMembershipsForAllUsers";
LABEL_5:
      unint64_t v6 = (unint64_t)(v7 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x800000024C8FBBA0;
      unint64_t v3 = 0xD000000000000013;
      break;
    case 2:
      unint64_t v3 = 0xD000000000000024;
      uint64_t v8 = "defaultGroupMembershipsForLocalUsers";
      goto LABEL_10;
    case 3:
      unint64_t v3 = 0xD000000000000022;
      uint64_t v8 = "defaultGroupMembershipsForAllUsers";
LABEL_10:
      unint64_t v2 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v3 && v6 == v2) {
    char v9 = 1;
  }
  else {
    char v9 = sub_24C8F8380();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_24C8AD5BC(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000015;
  unint64_t v4 = 0x800000024C8FBA40;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0xD000000000000016;
      unint64_t v5 = "ddrsKeyGroupRecordList";
      goto LABEL_11;
    case 2:
      unint64_t v3 = 0x4279654B73726464;
      unint64_t v4 = 0xEF44495555746F6FLL;
      break;
    case 3:
      unint64_t v3 = 0xD000000000000010;
      unint64_t v5 = "ddrsKeyUserIDMap";
      goto LABEL_11;
    case 4:
      unint64_t v6 = "ddrsKeyUserNameMap";
      goto LABEL_7;
    case 5:
      unint64_t v6 = "ddrsKeyUserUUIDMap";
LABEL_7:
      unint64_t v4 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      unint64_t v3 = 0xD000000000000012;
      break;
    case 6:
      unint64_t v3 = 0xD000000000000011;
      unint64_t v5 = "ddrsKeyGroupIDMap";
      goto LABEL_11;
    case 7:
      unint64_t v3 = 0xD000000000000013;
      unint64_t v5 = "ddrsKeyGroupNameMap";
      goto LABEL_11;
    case 8:
      unint64_t v3 = 0xD000000000000013;
      unint64_t v5 = "ddrsKeyGroupUUIDMap";
LABEL_11:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xD000000000000015;
  unint64_t v8 = 0x800000024C8FBA40;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xD000000000000016;
      char v9 = "ddrsKeyGroupRecordList";
      goto LABEL_22;
    case 2:
      unint64_t v7 = 0x4279654B73726464;
      unint64_t v8 = 0xEF44495555746F6FLL;
      break;
    case 3:
      unint64_t v7 = 0xD000000000000010;
      char v9 = "ddrsKeyUserIDMap";
      goto LABEL_22;
    case 4:
      uint64_t v10 = "ddrsKeyUserNameMap";
      goto LABEL_18;
    case 5:
      uint64_t v10 = "ddrsKeyUserUUIDMap";
LABEL_18:
      unint64_t v8 = (unint64_t)(v10 - 32) | 0x8000000000000000;
      unint64_t v7 = 0xD000000000000012;
      break;
    case 6:
      unint64_t v7 = 0xD000000000000011;
      char v9 = "ddrsKeyGroupIDMap";
      goto LABEL_22;
    case 7:
      unint64_t v7 = 0xD000000000000013;
      char v9 = "ddrsKeyGroupNameMap";
      goto LABEL_22;
    case 8:
      unint64_t v7 = 0xD000000000000013;
      char v9 = "ddrsKeyGroupUUIDMap";
LABEL_22:
      unint64_t v8 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v3 == v7 && v4 == v8) {
    char v11 = 1;
  }
  else {
    char v11 = sub_24C8F8380();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_24C8AD81C(char a1, char a2)
{
  unint64_t v3 = 0xE200000000000000;
  uint64_t v4 = 17481;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v4 = 1701667182;
      break;
    case 2:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v4 = 1145656661;
      break;
    case 3:
      uint64_t v4 = 0x614E7265626D656DLL;
      unint64_t v3 = 0xEB0000000073656DLL;
      break;
    case 4:
      uint64_t v4 = 0x6C626174754D7369;
      unint64_t v3 = 0xE900000000000065;
      break;
    default:
      break;
  }
  unint64_t v5 = 0xE200000000000000;
  uint64_t v6 = 17481;
  switch(a2)
  {
    case 1:
      unint64_t v5 = 0xE400000000000000;
      if (v4 == 1701667182) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v5 = 0xE400000000000000;
      if (v4 != 1145656661) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      uint64_t v6 = 0x614E7265626D656DLL;
      unint64_t v5 = 0xEB0000000073656DLL;
      goto LABEL_12;
    case 4:
      unint64_t v5 = 0xE900000000000065;
      if (v4 != 0x6C626174754D7369) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v4 != v6) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v5) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_24C8F8380();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_24C8AD9CC(char a1, char a2)
{
  unint64_t v3 = 0xE200000000000000;
  uint64_t v4 = 17481;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v4 = 1701667182;
      break;
    case 2:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v4 = 1145656661;
      break;
    case 3:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v4 = 0x656D614E6C6C7566;
      break;
    case 4:
      uint64_t v4 = 0x65726944656D6F68;
      unint64_t v3 = 0xED000079726F7463;
      break;
    case 5:
      uint64_t v4 = 0x477972616D697270;
      unint64_t v3 = 0xEE00444970756F72;
      break;
    case 6:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v4 = 0x6C6C656873;
      break;
    case 7:
      uint64_t v4 = 0x6C626174754D7369;
      unint64_t v3 = 0xE900000000000065;
      break;
    default:
      break;
  }
  unint64_t v5 = 0xE200000000000000;
  uint64_t v6 = 17481;
  switch(a2)
  {
    case 1:
      unint64_t v5 = 0xE400000000000000;
      if (v4 == 1701667182) {
        goto LABEL_22;
      }
      goto LABEL_25;
    case 2:
      unint64_t v5 = 0xE400000000000000;
      if (v4 != 1145656661) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 3:
      unint64_t v5 = 0xE800000000000000;
      if (v4 != 0x656D614E6C6C7566) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 4:
      unint64_t v5 = 0xED000079726F7463;
      if (v4 != 0x65726944656D6F68) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 5:
      unint64_t v5 = 0xEE00444970756F72;
      if (v4 != 0x477972616D697270) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 6:
      unint64_t v5 = 0xE500000000000000;
      uint64_t v6 = 0x6C6C656873;
      goto LABEL_21;
    case 7:
      unint64_t v5 = 0xE900000000000065;
      if (v4 != 0x6C626174754D7369) {
        goto LABEL_25;
      }
      goto LABEL_22;
    default:
LABEL_21:
      if (v4 != v6) {
        goto LABEL_25;
      }
LABEL_22:
      if (v3 == v5) {
        char v7 = 1;
      }
      else {
LABEL_25:
      }
        char v7 = sub_24C8F8380();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t *sub_24C8ADC54(unint64_t a1, void (*a2)(void), unint64_t *a3, void (*a4)(uint64_t), uint64_t a5)
{
  v104 = a4;
  uint64_t v105 = a5;
  v102 = a2;
  v103 = a3;
  uint64_t v7 = sub_24C8F7C20();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v112 = v7;
  uint64_t v113 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v100 = (char *)&v95 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v101 = (char *)&v95 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v95 - v14;
  uint64_t v16 = sub_24C8F7B10();
  uint64_t v114 = *(void *)(v16 - 8);
  uint64_t v115 = v16;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  os_log_t v108 = (os_log_t)((char *)&v95 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v109 = (char *)&v95 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  os_log_type_t v23 = (char *)&v95 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v95 - v24;
  uint64_t v26 = sub_24C8F7900();
  uint64_t v99 = *(void *)(v26 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  v106 = (char *)&v95 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  v107 = (char *)&v95 - v30;
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)&v95 - v31;
  unint64_t v111 = a1;
  uint64_t v33 = sub_24C8E1A48();
  if (v5)
  {
    uint64_t v36 = v113;
    uint64_t v35 = v114;
    v118 = v5;
    uint64_t v37 = v5;
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8F20);
    uint64_t v39 = v26;
    if (swift_dynamicCast())
    {
      MEMORY[0x2533003E0](v5);
      uint64_t v40 = v99;
      uint64_t v41 = v107;
      (*(void (**)(char *, char *, uint64_t))(v99 + 32))(v107, v32, v26);
      (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v109, v110, v115);
      uint64_t v42 = v36;
      uint64_t v43 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 16);
      uint64_t v44 = v101;
      uint64_t v45 = v112;
      v43(v101, v111, v112);
      v46 = v106;
      (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v106, v41, v39);
      v47 = sub_24C8F7AF0();
      os_log_type_t v48 = sub_24C8F7E30();
      LODWORD(v111) = v48;
      if (os_log_type_enabled(v47, v48))
      {
        uint64_t v49 = v40;
        uint64_t v50 = swift_slowAlloc();
        uint64_t v110 = swift_slowAlloc();
        v117[0] = v110;
        *(_DWORD *)uint64_t v50 = 136446466;
        sub_24C8AFA98(&qword_2697F8F18, MEMORY[0x263F8F328]);
        os_log_t v108 = v47;
        uint64_t v51 = sub_24C8F8180();
        uint64_t v116 = sub_24C8E22EC(v51, v52, v117);
        sub_24C8F7E60();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v45);
        *(_WORD *)(v50 + 12) = 1024;
        sub_24C8AFA98((unint64_t *)&qword_2697F8F10, MEMORY[0x263F06080]);
        uint64_t v53 = v106;
        sub_24C8F79C0();
        int v54 = sub_24C8F7BC0();
        uint64_t v55 = *(void (**)(char *, uint64_t))(v49 + 8);
        v55(v53, v39);
        LODWORD(v116) = v54;
        sub_24C8F7E60();
        os_log_t v56 = v108;
        _os_log_impl(&dword_24C8A9000, v108, (os_log_type_t)v111, "Failed to load file %{public}s: %{darwin.errno}d", (uint8_t *)v50, 0x12u);
        uint64_t v57 = (uint64_t *)v110;
        swift_arrayDestroy();
        MEMORY[0x253300580](v57, -1, -1);
        MEMORY[0x253300580](v50, -1, -1);

        (*(void (**)(char *, uint64_t))(v114 + 8))(v109, v115);
      }
      else
      {
        v80 = v46;
        uint64_t v55 = *(void (**)(char *, uint64_t))(v40 + 8);
        v55(v80, v39);
        (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v45);

        uint64_t v41 = v107;
        v81 = *(void (**)(char *, uint64_t))(v35 + 8);
        uint64_t v57 = (uint64_t *)(v35 + 8);
        v81(v109, v115);
      }
      sub_24C8F78F0();
      swift_willThrow();
      v55(v41, v39);
      MEMORY[0x2533003E0](v118);
    }
    else
    {
      v109 = (char *)v38;
      MEMORY[0x2533003E0](v118);
      uint64_t v63 = v115;
      (*(void (**)(os_log_t, uint64_t, uint64_t))(v35 + 16))(v108, v110, v115);
      uint64_t v64 = v36;
      uint64_t v65 = v100;
      uint64_t v66 = v112;
      (*(void (**)(char *, unint64_t, uint64_t))(v36 + 16))(v100, v111, v112);
      int64_t v67 = v5;
      v68 = v5;
      unint64_t v69 = sub_24C8F7AF0();
      os_log_type_t v70 = sub_24C8F7E30();
      int v71 = v70;
      if (os_log_type_enabled(v69, v70))
      {
        uint64_t v72 = swift_slowAlloc();
        uint64_t v73 = v64;
        uint64_t v74 = swift_slowAlloc();
        v118 = (uint64_t *)v74;
        *(_DWORD *)uint64_t v72 = 136446466;
        sub_24C8AFA98(&qword_2697F8F18, MEMORY[0x263F8F328]);
        LODWORD(v111) = v71;
        uint64_t v75 = sub_24C8F8180();
        v117[0] = sub_24C8E22EC(v75, v76, (uint64_t *)&v118);
        sub_24C8F7E60();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v73 + 8))(v65, v66);
        *(_WORD *)(v72 + 12) = 2082;
        v117[0] = (uint64_t)v5;
        v77 = v5;
        uint64_t v57 = v117;
        uint64_t v78 = sub_24C8F7CB0();
        v117[0] = sub_24C8E22EC(v78, v79, (uint64_t *)&v118);
        sub_24C8F7E60();
        swift_bridgeObjectRelease();
        MEMORY[0x2533003E0](v5);
        MEMORY[0x2533003E0](v5);
        _os_log_impl(&dword_24C8A9000, v69, (os_log_type_t)v111, "Failed to load file %{public}s: %{public}s", (uint8_t *)v72, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x253300580](v74, -1, -1);
        MEMORY[0x253300580](v72, -1, -1);

        (*(void (**)(os_log_t, uint64_t))(v114 + 8))(v108, v115);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v36 + 8))(v65, v66);
        MEMORY[0x2533003E0](v5);
        MEMORY[0x2533003E0](v5);

        v82 = *(void (**)(os_log_t, uint64_t))(v35 + 8);
        uint64_t v57 = (uint64_t *)(v35 + 8);
        v82(v108, v63);
      }
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v58 = v33;
    unint64_t v59 = v34;
    v95 = v15;
    v96 = v25;
    v97 = v23;
    sub_24C8F7980();
    swift_allocObject();
    sub_24C8AF9E8(v58, v59);
    sub_24C8F7970();
    v102(0);
    sub_24C8AFA98(v103, v104);
    sub_24C8F7960();
    uint64_t v60 = v114;
    uint64_t v61 = (void (**)(char *, uint64_t, uint64_t))(v114 + 16);
    uint64_t v62 = (void (**)(char *, unint64_t, uint64_t))(v113 + 16);
    uint64_t v98 = v58;
    swift_release();
    sub_24C8AFA40(v58, v59);
    uint64_t v57 = v118;
    v83 = v96;
    uint64_t v84 = v115;
    (*v61)(v96, v110, v115);
    v85 = v95;
    uint64_t v86 = v112;
    (*v62)(v95, v111, v112);
    v87 = sub_24C8F7AF0();
    os_log_type_t v88 = sub_24C8F7E20();
    unint64_t v111 = v59;
    os_log_type_t v89 = v88;
    if (os_log_type_enabled(v87, v88))
    {
      v90 = (uint8_t *)swift_slowAlloc();
      uint64_t v91 = swift_slowAlloc();
      v118 = (uint64_t *)v91;
      *(_DWORD *)v90 = 136446210;
      uint64_t v110 = (uint64_t)(v90 + 4);
      sub_24C8AFA98(&qword_2697F8F18, MEMORY[0x263F8F328]);
      uint64_t v92 = sub_24C8F8180();
      v117[0] = sub_24C8E22EC(v92, v93, (uint64_t *)&v118);
      sub_24C8F7E60();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v113 + 8))(v95, v86);
      _os_log_impl(&dword_24C8A9000, v87, v89, "Loaded file %{public}s", v90, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253300580](v91, -1, -1);
      MEMORY[0x253300580](v90, -1, -1);
      sub_24C8AFA40(v98, v111);

      (*(void (**)(char *, uint64_t))(v114 + 8))(v96, v115);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v113 + 8))(v85, v86);
      sub_24C8AFA40(v98, v111);

      (*(void (**)(char *, uint64_t))(v60 + 8))(v83, v84);
    }
  }
  return v57;
}

unint64_t sub_24C8AEAB0(char *a1)
{
  uint64_t v3 = sub_24C8F7C20();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v96 = v3;
  uint64_t v97 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  os_log_type_t v89 = (uint8_t *)&v85 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v90 = (char *)&v85 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v85 - v10;
  uint64_t v12 = sub_24C8F7B10();
  unint64_t v98 = *(void *)(v12 - 8);
  uint64_t v99 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  os_log_t v91 = (os_log_t)((char *)&v85 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v92 = (char *)&v85 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v85 - v18;
  uint64_t v20 = sub_24C8F7900();
  os_log_type_t v88 = *(uint8_t **)(v20 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  v87 = (char *)&v85 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  unint64_t v93 = (unint64_t)&v85 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v85 - v25;
  v95 = a1;
  uint64_t v27 = sub_24C8E1A48();
  if (v1)
  {
    v100 = v1;
    uint64_t v29 = v1;
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8F20);
    uint64_t v31 = v20;
    if (swift_dynamicCast())
    {
      MEMORY[0x2533003E0](v1);
      uint64_t v32 = v88;
      unint64_t v33 = v93;
      (*((void (**)(unint64_t, char *, uint64_t))v88 + 4))(v93, v26, v31);
      unint64_t v34 = v98;
      (*(void (**)(char *, uint64_t, uint64_t))(v98 + 16))(v92, v94, v99);
      unint64_t v36 = v96;
      uint64_t v35 = v97;
      uint64_t v37 = v90;
      (*(void (**)(char *, char *, uint64_t))(v97 + 16))(v90, v95, v96);
      uint64_t v38 = v87;
      (*((void (**)(char *, unint64_t, uint64_t))v32 + 2))(v87, v33, v31);
      uint64_t v39 = sub_24C8F7AF0();
      os_log_type_t v40 = sub_24C8F7E30();
      LODWORD(v95) = v40;
      if (os_log_type_enabled(v39, v40))
      {
        unint64_t v34 = v36;
        uint64_t v41 = swift_slowAlloc();
        uint64_t v94 = swift_slowAlloc();
        uint64_t v102 = v94;
        *(_DWORD *)uint64_t v41 = 136446466;
        sub_24C8AFA98(&qword_2697F8F18, MEMORY[0x263F8F328]);
        os_log_t v91 = v39;
        uint64_t v42 = sub_24C8F8180();
        uint64_t v101 = sub_24C8E22EC(v42, v43, &v102);
        sub_24C8F7E60();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, unint64_t))(v35 + 8))(v37, v34);
        *(_WORD *)(v41 + 12) = 1024;
        sub_24C8AFA98((unint64_t *)&qword_2697F8F10, MEMORY[0x263F06080]);
        sub_24C8F79C0();
        int v44 = sub_24C8F7BC0();
        uint64_t v45 = (void (*)(char *, uint64_t))*((void *)v32 + 1);
        LOBYTE(v34) = (_BYTE)v32 + 8;
        v45(v38, v31);
        LODWORD(v101) = v44;
        sub_24C8F7E60();
        os_log_t v46 = v91;
        _os_log_impl(&dword_24C8A9000, v91, (os_log_type_t)v95, "Failed to load file %{public}s: %{darwin.errno}d", (uint8_t *)v41, 0x12u);
        uint64_t v47 = v94;
        swift_arrayDestroy();
        MEMORY[0x253300580](v47, -1, -1);
        MEMORY[0x253300580](v41, -1, -1);

        (*(void (**)(char *, uint64_t))(v98 + 8))(v92, v99);
      }
      else
      {
        uint64_t v45 = (void (*)(char *, uint64_t))*((void *)v32 + 1);
        uint64_t v66 = v38;
        int64_t v67 = v39;
        unint64_t v68 = v34;
        LOBYTE(v34) = (_BYTE)v32 + 8;
        v45(v66, v31);
        (*(void (**)(char *, unint64_t))(v35 + 8))(v37, v36);

        (*(void (**)(char *, uint64_t))(v68 + 8))(v92, v99);
      }
      unint64_t v69 = v93;
      sub_24C8F78F0();
      swift_willThrow();
      v45((char *)v69, v31);
      MEMORY[0x2533003E0](v100);
    }
    else
    {
      MEMORY[0x2533003E0](v100);
      unint64_t v51 = v98;
      uint64_t v50 = v99;
      os_log_t v52 = v91;
      (*(void (**)(os_log_t, uint64_t, uint64_t))(v98 + 16))(v91, v94, v99);
      uint64_t v53 = v96;
      uint64_t v54 = v97;
      unint64_t v34 = (unint64_t)v89;
      (*(void (**)(uint8_t *, char *, uint64_t))(v97 + 16))(v89, v95, v96);
      uint64_t v55 = v1;
      os_log_t v56 = v1;
      uint64_t v57 = sub_24C8F7AF0();
      os_log_type_t v58 = sub_24C8F7E30();
      LODWORD(v95) = v58;
      if (os_log_type_enabled(v57, v58))
      {
        uint64_t v59 = swift_slowAlloc();
        uint64_t v94 = swift_slowAlloc();
        v100 = (char *)v94;
        *(_DWORD *)uint64_t v59 = 136446466;
        unint64_t v93 = v30;
        sub_24C8AFA98(&qword_2697F8F18, MEMORY[0x263F8F328]);
        uint64_t v60 = sub_24C8F8180();
        uint64_t v102 = sub_24C8E22EC(v60, v61, (uint64_t *)&v100);
        sub_24C8F7E60();
        swift_bridgeObjectRelease();
        (*(void (**)(unint64_t, uint64_t))(v54 + 8))(v34, v53);
        *(_WORD *)(v59 + 12) = 2082;
        uint64_t v102 = (uint64_t)v1;
        uint64_t v62 = v1;
        uint64_t v63 = sub_24C8F7CB0();
        uint64_t v102 = sub_24C8E22EC(v63, v64, (uint64_t *)&v100);
        sub_24C8F7E60();
        swift_bridgeObjectRelease();
        MEMORY[0x2533003E0](v1);
        MEMORY[0x2533003E0](v1);
        _os_log_impl(&dword_24C8A9000, v57, (os_log_type_t)v95, "Failed to load file %{public}s: %{public}s", (uint8_t *)v59, 0x16u);
        uint64_t v65 = v94;
        swift_arrayDestroy();
        MEMORY[0x253300580](v65, -1, -1);
        MEMORY[0x253300580](v59, -1, -1);

        LOBYTE(v34) = v51 + 8;
        (*(void (**)(os_log_t, uint64_t))(v51 + 8))(v91, v99);
      }
      else
      {
        (*(void (**)(unint64_t, uint64_t))(v54 + 8))(v34, v53);
        MEMORY[0x2533003E0](v1);
        MEMORY[0x2533003E0](v1);

        (*(void (**)(os_log_t, uint64_t))(v51 + 8))(v52, v50);
      }
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v48 = v27;
    unint64_t v34 = v28;
    uint64_t v49 = v11;
    sub_24C8F7980();
    swift_allocObject();
    sub_24C8AF9E8(v48, v34);
    sub_24C8F7970();
    sub_24C8AFAE0();
    sub_24C8F7960();
    uint64_t v86 = v48;
    swift_release();
    sub_24C8AFA40(v48, v34);
    unint64_t v93 = v34;
    LOBYTE(v34) = (_BYTE)v100;
    unint64_t v70 = v98;
    int v71 = v19;
    (*(void (**)(char *, uint64_t, uint64_t))(v98 + 16))(v19, v94, v99);
    uint64_t v72 = v97;
    uint64_t v73 = *(void (**)(char *, char *, uint64_t))(v97 + 16);
    uint64_t v94 = (uint64_t)v49;
    uint64_t v74 = v49;
    uint64_t v75 = v96;
    v73(v74, v95, v96);
    v95 = v71;
    unint64_t v76 = sub_24C8F7AF0();
    os_log_type_t v77 = sub_24C8F7E20();
    LODWORD(v92) = v77;
    if (os_log_type_enabled(v76, v77))
    {
      os_log_t v91 = v76;
      uint64_t v78 = (uint8_t *)swift_slowAlloc();
      v90 = (char *)swift_slowAlloc();
      v100 = v90;
      *(_DWORD *)uint64_t v78 = 136446210;
      os_log_type_t v88 = v78 + 4;
      os_log_type_t v89 = v78;
      sub_24C8AFA98(&qword_2697F8F18, MEMORY[0x263F8F328]);
      uint64_t v79 = sub_24C8F8180();
      uint64_t v102 = sub_24C8E22EC(v79, v80, (uint64_t *)&v100);
      sub_24C8F7E60();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v94, v75);
      os_log_t v81 = v91;
      v82 = v89;
      _os_log_impl(&dword_24C8A9000, v91, (os_log_type_t)v92, "Loaded file %{public}s", v89, 0xCu);
      v83 = v90;
      swift_arrayDestroy();
      MEMORY[0x253300580](v83, -1, -1);
      MEMORY[0x253300580](v82, -1, -1);
      sub_24C8AFA40(v86, v93);

      (*(void (**)(char *, uint64_t))(v98 + 8))(v95, v99);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v94, v75);
      sub_24C8AFA40(v86, v93);

      (*(void (**)(char *, uint64_t))(v70 + 8))(v95, v99);
    }
  }
  return v34 & 1;
}

uint64_t sub_24C8AF8EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_24C8AF91C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_24C8AF944()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

uint64_t sub_24C8AF9E8(uint64_t a1, unint64_t a2)
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

uint64_t sub_24C8AFA40(uint64_t a1, unint64_t a2)
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

uint64_t sub_24C8AFA98(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24C8AFAE0()
{
  unint64_t result = qword_2697F8F38;
  if (!qword_2697F8F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F8F38);
  }
  return result;
}

uint64_t sub_24C8AFB34()
{
  return sub_24C8AF944();
}

uint64_t *sub_24C8AFB4C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24C8F7B10();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    long long v9 = *(_OWORD *)((char *)a2 + v8 + 24);
    *(_OWORD *)((char *)a1 + v8 + 24) = v9;
    (**(void (***)(void))(v9 - 8))();
  }
  return a1;
}

uint64_t sub_24C8AFC60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24C8F7B10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);

  return __swift_destroy_boxed_opaque_existential_1(v5);
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

uint64_t sub_24C8AFD24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C8F7B10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  long long v8 = *(_OWORD *)(a2 + v7 + 24);
  *(_OWORD *)(a1 + v7 + 24) = v8;
  (**(void (***)(void))(v8 - 8))();
  return a1;
}

uint64_t sub_24C8AFDE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C8F7B10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + *(int *)(a3 + 20)), (uint64_t *)(a2 + *(int *)(a3 + 20)));
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
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
        *uint64_t v3 = v12;
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
          *uint64_t v3 = *a2;
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

uint64_t sub_24C8B0098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C8F7B10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  return a1;
}

uint64_t sub_24C8B0124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C8F7B10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  __swift_destroy_boxed_opaque_existential_1(a1 + v7);
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  return a1;
}

uint64_t sub_24C8B01B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24C8B01CC);
}

uint64_t sub_24C8B01CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C8F7B10();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 24);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_24C8B0290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24C8B02A4);
}

uint64_t sub_24C8B02A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24C8F7B10();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for RecordManager()
{
  uint64_t result = qword_2697F8F40;
  if (!qword_2697F8F40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C8B03B0()
{
  uint64_t result = sub_24C8F7B10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ProviderSideEffects(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ProviderSideEffects(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);

  return __swift_destroy_boxed_opaque_existential_1(a1 + 80);
}

_OWORD *initializeWithCopy for ProviderSideEffects(_OWORD *a1, _OWORD *a2)
{
  long long v4 = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = a2[4];
  a1[4] = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)a1 + 40, (uint64_t)a2 + 40);
  long long v6 = *(_OWORD *)((char *)a2 + 104);
  *(_OWORD *)((char *)a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 5), (uint64_t)(a2 + 5));
  return a1;
}

uint64_t *assignWithCopy for ProviderSideEffects(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for ProviderSideEffects(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProviderSideEffects(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ProviderSideEffects(uint64_t result, int a2, int a3)
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
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
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
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProviderSideEffects()
{
  return &type metadata for ProviderSideEffects;
}

uint64_t sub_24C8B074C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for FilesystemProvider();
  uint64_t v3 = swift_allocObject();
  sub_24C8F7B00();
  a1[3] = v2;
  a1[4] = (uint64_t)&off_26FEFB9F8;
  *a1 = v3;
  uint64_t v4 = type metadata accessor for NotificationProvider();
  uint64_t v5 = swift_allocObject();
  sub_24C8F7B00();
  a1[8] = v4;
  a1[9] = (uint64_t)&off_26FEFBA30;
  a1[5] = v5;
  uint64_t v6 = type metadata accessor for SysctlProvider();
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_24C8F7B00();
  a1[13] = v6;
  a1[14] = (uint64_t)&off_26FEFB7C0;
  a1[10] = v7;
  return result;
}

uint64_t User.init(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24C8F7AE0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v39 - v9;
  id v11 = objc_msgSend(a1, sel_uuid);
  sub_24C8F7AC0();

  unsigned int v47 = [a1 uid];
  id v12 = objc_msgSend(a1, sel_name);
  uint64_t v13 = sub_24C8F7C90();
  uint64_t v45 = v14;
  uint64_t v46 = v13;

  id v15 = objc_msgSend(a1, sel_primaryGroupUUID);
  sub_24C8F7AC0();

  id v16 = objc_msgSend(a1, sel_fullName);
  uint64_t v17 = sub_24C8F7C90();
  uint64_t v43 = v18;
  uint64_t v44 = v17;

  id v19 = objc_msgSend(a1, sel_homeDirectory);
  uint64_t v20 = sub_24C8F7C90();
  uint64_t v41 = v21;
  uint64_t v42 = v20;

  id v22 = objc_msgSend(a1, sel_shell);
  uint64_t v40 = sub_24C8F7C90();
  uint64_t v24 = v23;

  id v25 = objc_msgSend(a1, sel_memberships);
  uint64_t v48 = 0;
  sub_24C8B0BE8();
  uint64_t result = sub_24C8F7DF0();
  uint64_t v27 = v48;
  if (v48)
  {

    id v28 = objc_msgSend(a1, sel_aliases);
    uint64_t v48 = 0;
    uint64_t result = sub_24C8F7DF0();
    uint64_t v29 = v48;
    if (v48)
    {

      uint64_t v30 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
      v30(a2, v10, v4);
      uint64_t v31 = (int *)type metadata accessor for User(0);
      *(_DWORD *)(a2 + v31[5]) = v47;
      uint64_t v32 = (uint64_t *)(a2 + v31[6]);
      uint64_t v33 = v45;
      *uint64_t v32 = v46;
      v32[1] = v33;
      uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2 + v31[7], v8, v4);
      unint64_t v34 = (uint64_t *)(a2 + v31[8]);
      uint64_t v35 = v43;
      *unint64_t v34 = v44;
      v34[1] = v35;
      unint64_t v36 = (uint64_t *)(a2 + v31[9]);
      uint64_t v37 = v41;
      *unint64_t v36 = v42;
      v36[1] = v37;
      uint64_t v38 = (uint64_t *)(a2 + v31[10]);
      *uint64_t v38 = v40;
      v38[1] = v24;
      *(void *)(a2 + v31[11]) = v27;
      *(void *)(a2 + v31[12]) = v29;
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

unint64_t sub_24C8B0BE8()
{
  unint64_t result = qword_2697F8F50;
  if (!qword_2697F8F50)
  {
    sub_24C8F7AE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F8F50);
  }
  return result;
}

id DDIUser.init(_:)(uint64_t a1)
{
  id ObjCClassFromMetadata = (id)swift_getObjCClassFromMetadata();
  uint64_t v2 = (void *)sub_24C8F7AA0();
  uint64_t v3 = type metadata accessor for User(0);
  unsigned int v17 = *(_DWORD *)(a1 + *(int *)(v3 + 20));
  uint64_t v4 = (void *)sub_24C8F7C80();
  uint64_t v5 = (void *)sub_24C8F7AA0();
  uint64_t v6 = (void *)sub_24C8F7C80();
  uint64_t v7 = (void *)sub_24C8F7C80();
  uint64_t v8 = (void *)sub_24C8F7C80();
  sub_24C8F7AE0();
  sub_24C8B0BE8();
  uint64_t v9 = (void *)sub_24C8F7DE0();
  id v10 = objc_msgSend(ObjCClassFromMetadata, sel_userWithUUID_uid_name_primaryGroupUUID_fullName_homeDirectory_shell_memberships_, v2, v17, v4, v5, v6, v7, v8, v9);

  uint64_t v11 = *(void *)(a1 + *(int *)(v3 + 48));
  id v12 = v10;
  sub_24C8B0E3C(v11);
  id v13 = objc_allocWithZone(MEMORY[0x263EFF9C0]);
  uint64_t v14 = (void *)sub_24C8F7DE0();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v13, sel_initWithSet_, v14);

  objc_msgSend(v12, sel_setAliases_, v15);
  sub_24C8B3A1C(a1, type metadata accessor for User);
  return v12;
}

uint64_t sub_24C8B0E3C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8F70);
    uint64_t v2 = sub_24C8F7EE0();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE88];
  }
  uint64_t v3 = a1 + 56;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v5 = -1;
  }
  uint64_t v6 = v5 & *(void *)(a1 + 56);
  int64_t v7 = (unint64_t)(63 - v4) >> 6;
  uint64_t v8 = v2 + 56;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_28;
    }
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v7) {
      goto LABEL_37;
    }
    uint64_t v14 = *(void *)(v3 + 8 * v13);
    int64_t v15 = v10 + 1;
    if (!v14)
    {
      int64_t v15 = v10 + 2;
      if (v10 + 2 >= v7) {
        goto LABEL_37;
      }
      uint64_t v14 = *(void *)(v3 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v10 + 3;
        if (v10 + 3 >= v7) {
          goto LABEL_37;
        }
        uint64_t v14 = *(void *)(v3 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v10 + 4;
          if (v10 + 4 >= v7) {
            goto LABEL_37;
          }
          uint64_t v14 = *(void *)(v3 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    uint64_t v6 = (v14 - 1) & v14;
    int64_t v10 = v15;
LABEL_28:
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    uint64_t result = sub_24C8F7EB0();
    uint64_t v17 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)(v8 + 8 * (v18 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v18) & ~*(void *)(v8 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v20 = 0;
      unint64_t v21 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v21 && (v20 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v22 = v19 == v21;
        if (v19 == v21) {
          unint64_t v19 = 0;
        }
        v20 |= v22;
        uint64_t v23 = *(void *)(v8 + 8 * v19);
      }
      while (v23 == -1);
      unint64_t v11 = __clz(__rbit64(~v23)) + (v19 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    uint64_t v12 = *(void *)(v2 + 48) + 40 * v11;
    *(_OWORD *)uint64_t v12 = v24;
    *(_OWORD *)(v12 + 16) = v25;
    *(void *)(v12 + 32) = v26;
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v10 + 5;
  if (v10 + 5 >= v7)
  {
LABEL_37:
    swift_release();
    sub_24C8B3A7C();
    return v2;
  }
  uint64_t v14 = *(void *)(v3 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v10 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v7) {
      goto LABEL_37;
    }
    uint64_t v14 = *(void *)(v3 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_24C8B1130(uint64_t a1)
{
  uint64_t v2 = sub_24C8F7AE0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v33 - v7;
  uint64_t v37 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8F70);
    uint64_t v9 = sub_24C8F7EE0();
  }
  else
  {
    uint64_t v9 = MEMORY[0x263F8EE88];
  }
  uint64_t v10 = *(void *)(v37 + 56);
  uint64_t v35 = v37 + 56;
  uint64_t v11 = -1 << *(unsigned char *)(v37 + 32);
  if (-v11 < 64) {
    uint64_t v12 = ~(-1 << -(char)v11);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v10;
  v33[1] = -1 << *(unsigned char *)(v37 + 32);
  int64_t v34 = (unint64_t)(63 - v11) >> 6;
  uint64_t v36 = v3 + 16;
  uint64_t v14 = v9 + 56;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v16 << 6);
      goto LABEL_28;
    }
    int64_t v22 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v22 >= v34) {
      goto LABEL_37;
    }
    unint64_t v23 = *(void *)(v35 + 8 * v22);
    int64_t v24 = v16 + 1;
    if (!v23)
    {
      int64_t v24 = v16 + 2;
      if (v16 + 2 >= v34) {
        goto LABEL_37;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v24);
      if (!v23)
      {
        int64_t v24 = v16 + 3;
        if (v16 + 3 >= v34) {
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          int64_t v24 = v16 + 4;
          if (v16 + 4 >= v34) {
            goto LABEL_37;
          }
          unint64_t v23 = *(void *)(v35 + 8 * v24);
          if (!v23) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v13 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v24 << 6);
    int64_t v16 = v24;
LABEL_28:
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v8, *(void *)(v37 + 48) + *(void *)(v3 + 72) * v21, v2);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v2);
    swift_dynamicCast();
    long long v38 = v41;
    long long v39 = v42;
    uint64_t v40 = v43;
    uint64_t result = sub_24C8F7EB0();
    uint64_t v26 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v14 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v14 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v14 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = *(void *)(v9 + 48) + 40 * v17;
    long long v19 = v39;
    *(_OWORD *)uint64_t v18 = v38;
    *(_OWORD *)(v18 + 16) = v19;
    *(void *)(v18 + 32) = v40;
    ++*(void *)(v9 + 16);
  }
  int64_t v25 = v16 + 5;
  if (v16 + 5 >= v34)
  {
LABEL_37:
    swift_release();
    sub_24C8B3A7C();
    return v9;
  }
  unint64_t v23 = *(void *)(v35 + 8 * v25);
  if (v23)
  {
    int64_t v24 = v16 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v24 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v24 >= v34) {
      goto LABEL_37;
    }
    unint64_t v23 = *(void *)(v35 + 8 * v24);
    ++v25;
    if (v23) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

int *Group.init(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24C8F7AE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(a1, sel_uuid);
  sub_24C8F7AC0();

  unsigned int v26 = [a1 gid];
  id v9 = objc_msgSend(a1, sel_name);
  uint64_t v10 = sub_24C8F7C90();
  uint64_t v24 = v11;
  uint64_t v25 = v10;

  id v12 = objc_msgSend(a1, sel_fullName);
  uint64_t v13 = sub_24C8F7C90();
  uint64_t v15 = v14;

  id v16 = objc_msgSend(a1, sel_nestedGroups);
  uint64_t v27 = 0;
  sub_24C8B0BE8();
  uint64_t result = (int *)sub_24C8F7DF0();
  uint64_t v18 = v27;
  if (v27)
  {

    id v19 = objc_msgSend(a1, sel_aliases);
    uint64_t v27 = 0;
    uint64_t result = (int *)sub_24C8F7DF0();
    uint64_t v20 = v27;
    if (v27)
    {

      (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
      uint64_t result = (int *)type metadata accessor for Group(0);
      *(_DWORD *)(a2 + result[5]) = v26;
      unint64_t v21 = (uint64_t *)(a2 + result[6]);
      uint64_t v22 = v24;
      *unint64_t v21 = v25;
      v21[1] = v22;
      unint64_t v23 = (uint64_t *)(a2 + result[7]);
      *unint64_t v23 = v13;
      v23[1] = v15;
      *(void *)(a2 + result[8]) = v18;
      *(void *)(a2 + result[9]) = v20;
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

id DDIGroup.init(_:)(uint64_t a1)
{
  id ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v3 = (void *)sub_24C8F7AA0();
  uint64_t v4 = (int *)type metadata accessor for Group(0);
  uint64_t v5 = *(unsigned int *)(a1 + v4[5]);
  uint64_t v6 = (void *)sub_24C8F7C80();
  uint64_t v7 = (void *)sub_24C8F7C80();
  id v8 = objc_msgSend(ObjCClassFromMetadata, sel_groupWithUUID_gid_name_fullName_, v3, v5, v6, v7);

  uint64_t v9 = *(void *)(a1 + v4[8]);
  id v10 = v8;
  sub_24C8B1130(v9);
  id v11 = objc_allocWithZone(MEMORY[0x263EFF9C0]);
  id v12 = (void *)sub_24C8F7DE0();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v11, sel_initWithSet_, v12);

  objc_msgSend(v10, sel_setNestedGroups_, v13);
  sub_24C8B0E3C(*(void *)(a1 + v4[9]));
  id v14 = objc_allocWithZone(MEMORY[0x263EFF9C0]);
  uint64_t v15 = (void *)sub_24C8F7DE0();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v14, sel_initWithSet_, v15);

  objc_msgSend(v10, sel_setAliases_, v16);
  sub_24C8B3A1C(a1, type metadata accessor for Group);
  return v10;
}

void static ObjcCompatibility.swiftInitializeLocalUsersAndGroupsAndPerform(_:)(const void *a1)
{
  unint64_t v1 = _Block_copy(a1);
  v2[2] = v1;
  if (qword_2697F8F00 != -1) {
    swift_once();
  }
  sub_24C8B2DF4((void (*)(unint64_t *, unint64_t *))sub_24C8B21FC, (unint64_t)v2, (uint64_t)qword_2697F9228);
  _Block_release(v1);
}

uint64_t sub_24C8B19E0(unint64_t *a1, unint64_t *a2, void (**a3)(void, void, void))
{
  unint64_t v69 = a3;
  int v71 = a2;
  uint64_t v4 = type metadata accessor for Group(0);
  uint64_t v70 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v65 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v61 - v8;
  MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v61 - v10;
  uint64_t v12 = type metadata accessor for User(0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12 - 8);
  int64_t v67 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v61 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v61 - v19;
  uint64_t v66 = a1;
  uint64_t v21 = *a1;
  uint64_t v22 = *(void *)(*a1 + 16);
  uint64_t v64 = v13;
  if (v22)
  {
    uint64_t v68 = (uint64_t)v9;
    unint64_t v73 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_24C8F7FB0();
    sub_24C8B384C(0, &qword_2697F8F58);
    uint64_t v23 = *(unsigned __int8 *)(v13 + 80);
    uint64_t v63 = v21;
    uint64_t v24 = v21 + ((v23 + 32) & ~v23);
    uint64_t v25 = *(void *)(v13 + 72);
    do
    {
      sub_24C8B3888(v24, (uint64_t)v20, type metadata accessor for User);
      sub_24C8B3888((uint64_t)v20, (uint64_t)v18, type metadata accessor for User);
      DDIUser.init(_:)((uint64_t)v18);
      sub_24C8B3A1C((uint64_t)v20, type metadata accessor for User);
      sub_24C8F7F90();
      sub_24C8F7FC0();
      sub_24C8F7FD0();
      sub_24C8F7FA0();
      v24 += v25;
      --v22;
    }
    while (v22);
    swift_bridgeObjectRelease();
    uint64_t v9 = (char *)v68;
  }
  uint64_t v26 = sub_24C8B384C(0, &qword_2697F8F58);
  uint64_t v27 = (void *)sub_24C8F7D30();
  swift_bridgeObjectRelease();
  objc_msgSend(v27, sel_mutableCopy);

  sub_24C8F7E90();
  swift_unknownObjectRelease();
  uint64_t v28 = sub_24C8B384C(0, &qword_2697F8F60);
  uint64_t v68 = MEMORY[0x263F8EE58] + 8;
  swift_dynamicCast();
  char v29 = v72;
  unint64_t v30 = *v71;
  uint64_t v31 = *(void *)(*v71 + 16);
  if (v31)
  {
    uint64_t v61 = v28;
    uint64_t v62 = v72;
    uint64_t v63 = v26;
    unint64_t v73 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_24C8F7FB0();
    sub_24C8B384C(0, &qword_2697F8F68);
    uint64_t v32 = v30 + ((*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80));
    uint64_t v33 = *(void *)(v70 + 72);
    do
    {
      sub_24C8B3888(v32, (uint64_t)v11, type metadata accessor for Group);
      sub_24C8B3888((uint64_t)v11, (uint64_t)v9, type metadata accessor for Group);
      DDIGroup.init(_:)((uint64_t)v9);
      sub_24C8B3A1C((uint64_t)v11, type metadata accessor for Group);
      sub_24C8F7F90();
      sub_24C8F7FC0();
      sub_24C8F7FD0();
      sub_24C8F7FA0();
      v32 += v33;
      --v31;
    }
    while (v31);
    swift_bridgeObjectRelease();
    char v29 = v62;
  }
  uint64_t v34 = sub_24C8B384C(0, &qword_2697F8F68);
  uint64_t v35 = (void *)sub_24C8F7D30();
  swift_bridgeObjectRelease();
  objc_msgSend(v35, sel_mutableCopy);

  sub_24C8F7E90();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  uint64_t v36 = v72;
  ((void (**)(void, void *, void *))v69)[2](v69, v29, v72);
  unint64_t v73 = 0;
  id v37 = v29;
  uint64_t result = sub_24C8F7D40();
  unint64_t v39 = v73;
  if (!v73) {
    goto LABEL_41;
  }

  if (v39 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_24C8F8020();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v40 = *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v41 = (uint64_t)v67;
  unint64_t v42 = MEMORY[0x263F8EE78];
  unint64_t v69 = (void (**)(void, void, void))v37;
  if (v40)
  {
    unint64_t v73 = MEMORY[0x263F8EE78];
    uint64_t result = sub_24C8CBDD0(0, v40 & ~(v40 >> 63), 0);
    if (v40 < 0)
    {
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    uint64_t v68 = v34;
    uint64_t v43 = 0;
    unint64_t v44 = v73;
    uint64_t v45 = v64;
    do
    {
      if ((v39 & 0xC000000000000001) != 0) {
        id v46 = (id)MEMORY[0x2532FF870](v43, v39);
      }
      else {
        id v46 = *(id *)(v39 + 8 * v43 + 32);
      }
      User.init(_:)(v46, v41);
      unint64_t v73 = v44;
      unint64_t v48 = *(void *)(v44 + 16);
      unint64_t v47 = *(void *)(v44 + 24);
      if (v48 >= v47 >> 1)
      {
        sub_24C8CBDD0(v47 > 1, v48 + 1, 1);
        unint64_t v44 = v73;
      }
      ++v43;
      *(void *)(v44 + 16) = v48 + 1;
      sub_24C8B38F0(v41, v44+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v48, type metadata accessor for User);
    }
    while (v40 != v43);
    unint64_t v42 = MEMORY[0x263F8EE78];
  }
  else
  {
    unint64_t v44 = MEMORY[0x263F8EE78];
  }
  uint64_t v49 = v66;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *uint64_t v49 = v44;
  unint64_t v73 = 0;
  id v50 = v36;
  uint64_t result = sub_24C8F7D40();
  unint64_t v51 = v73;
  if (v73)
  {

    uint64_t v52 = (uint64_t)v65;
    if (v51 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_24C8F8020();
      swift_bridgeObjectRelease();
      if (v53)
      {
LABEL_26:
        unint64_t v73 = v42;
        uint64_t result = sub_24C8CBD94(0, v53 & ~(v53 >> 63), 0);
        if ((v53 & 0x8000000000000000) == 0)
        {
          uint64_t v54 = 0;
          unint64_t v55 = v73;
          uint64_t v56 = v70;
          do
          {
            if ((v51 & 0xC000000000000001) != 0) {
              id v57 = (id)MEMORY[0x2532FF870](v54, v51);
            }
            else {
              id v57 = *(id *)(v51 + 8 * v54 + 32);
            }
            Group.init(_:)(v57, v52);
            unint64_t v73 = v55;
            unint64_t v59 = *(void *)(v55 + 16);
            unint64_t v58 = *(void *)(v55 + 24);
            if (v59 >= v58 >> 1)
            {
              sub_24C8CBD94(v58 > 1, v59 + 1, 1);
              uint64_t v56 = v70;
              unint64_t v55 = v73;
            }
            ++v54;
            *(void *)(v55 + 16) = v59 + 1;
            sub_24C8B38F0(v52, v55+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(void *)(v56 + 72) * v59, type metadata accessor for Group);
          }
          while (v53 != v54);

          goto LABEL_38;
        }
        goto LABEL_40;
      }
    }
    else
    {
      uint64_t v53 = *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v53) {
        goto LABEL_26;
      }
    }

    unint64_t v55 = MEMORY[0x263F8EE78];
LABEL_38:
    uint64_t v60 = v71;
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t *v60 = v55;
    return result;
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_24C8B21FC(unint64_t *a1, unint64_t *a2)
{
  return sub_24C8B19E0(a1, a2, *(void (***)(void, void, void))(v2 + 16));
}

void static ObjcCompatibility.swiftUpdateLocalUsersAndGroups(perform:)(const void *a1)
{
  unint64_t v1 = _Block_copy(a1);
  _Block_copy(v1);
  if (qword_2697F8F00 != -1) {
    swift_once();
  }
  v2[3] = &type metadata for ProviderSideEffects;
  void v2[4] = &off_26FEFB548;
  v2[0] = swift_allocObject();
  sub_24C8B37CC((uint64_t)qword_2697F9228, v2[0] + 16);
  sub_24C8DA2D0(v2, v1);
  _Block_release(v1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  _Block_release(v1);
}

void sub_24C8B2374(unint64_t *a1, unint64_t *a2, id *a3)
{
  int v71 = a3;
  unint64_t v73 = a2;
  uint64_t v4 = type metadata accessor for Group(0);
  uint64_t v69 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v74 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v62 - v8;
  MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v62 - v10;
  uint64_t v12 = type metadata accessor for User(0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v72 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v62 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v62 - v19;
  uint64_t v68 = a1;
  uint64_t v21 = (void *)*a1;
  uint64_t v22 = v21[2];
  uint64_t v63 = v13;
  if (v22)
  {
    int64_t v67 = v11;
    uint64_t v70 = v9;
    unint64_t v75 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_24C8F7FB0();
    sub_24C8B384C(0, &qword_2697F8F58);
    uint64_t v23 = *(unsigned __int8 *)(v13 + 80);
    uint64_t v66 = v21;
    uint64_t v24 = (uint64_t)v21 + ((v23 + 32) & ~v23);
    uint64_t v25 = *(void *)(v13 + 72);
    do
    {
      sub_24C8B3888(v24, (uint64_t)v20, type metadata accessor for User);
      sub_24C8B3888((uint64_t)v20, (uint64_t)v18, type metadata accessor for User);
      DDIUser.init(_:)((uint64_t)v18);
      sub_24C8B3A1C((uint64_t)v20, type metadata accessor for User);
      sub_24C8F7F90();
      sub_24C8F7FC0();
      sub_24C8F7FD0();
      sub_24C8F7FA0();
      v24 += v25;
      --v22;
    }
    while (v22);
    swift_bridgeObjectRelease();
    uint64_t v9 = v70;
    id v11 = v67;
  }
  uint64_t v26 = sub_24C8B384C(0, &qword_2697F8F58);
  uint64_t v27 = (void *)sub_24C8F7D30();
  swift_bridgeObjectRelease();
  objc_msgSend(v27, sel_mutableCopy);

  sub_24C8F7E90();
  swift_unknownObjectRelease();
  uint64_t v28 = sub_24C8B384C(0, &qword_2697F8F60);
  uint64_t v70 = (char *)(MEMORY[0x263F8EE58] + 8);
  swift_dynamicCast();
  char v29 = v76;
  unint64_t v30 = *v73;
  uint64_t v31 = *(void *)(*v73 + 16);
  if (v31)
  {
    uint64_t v65 = v28;
    uint64_t v66 = v76;
    int64_t v67 = (char *)v26;
    unint64_t v75 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_24C8F7FB0();
    sub_24C8B384C(0, &qword_2697F8F68);
    uint64_t v32 = *(unsigned __int8 *)(v69 + 80);
    unint64_t v64 = v30;
    uint64_t v33 = v30 + ((v32 + 32) & ~v32);
    uint64_t v34 = *(void *)(v69 + 72);
    do
    {
      sub_24C8B3888(v33, (uint64_t)v11, type metadata accessor for Group);
      sub_24C8B3888((uint64_t)v11, (uint64_t)v9, type metadata accessor for Group);
      DDIGroup.init(_:)((uint64_t)v9);
      sub_24C8B3A1C((uint64_t)v11, type metadata accessor for Group);
      sub_24C8F7F90();
      sub_24C8F7FC0();
      sub_24C8F7FD0();
      sub_24C8F7FA0();
      v33 += v34;
      --v31;
    }
    while (v31);
    swift_bridgeObjectRelease();
    char v29 = v66;
  }
  uint64_t v35 = sub_24C8B384C(0, &qword_2697F8F68);
  uint64_t v36 = (void *)sub_24C8F7D30();
  swift_bridgeObjectRelease();
  objc_msgSend(v36, sel_mutableCopy);

  sub_24C8F7E90();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  id v37 = v76;
  long long v38 = (id *)swift_slowAlloc();
  ((void (*)(id *, void *, void *, id *))v71[2])(v71, v29, v37, v38);
  uint64_t v39 = (uint64_t)v72;
  if (*v38)
  {
    *v38;
    swift_willThrow();
    MEMORY[0x253300580](v38, -1, -1);

    return;
  }
  unint64_t v75 = 0;
  uint64_t v40 = v29;
  sub_24C8F7D40();
  unint64_t v41 = v75;
  if (!v75) {
    goto LABEL_42;
  }
  uint64_t v70 = v40;
  int v71 = v38;

  uint64_t v42 = (uint64_t)v74;
  if (v41 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_24C8F8020();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v43 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v44 = MEMORY[0x263F8EE78];
  if (v43)
  {
    uint64_t v66 = v37;
    int64_t v67 = (char *)v35;
    unint64_t v75 = MEMORY[0x263F8EE78];
    sub_24C8CBDD0(0, v43 & ~(v43 >> 63), 0);
    if (v43 < 0)
    {
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    uint64_t v45 = 0;
    unint64_t v44 = v75;
    uint64_t v46 = v63;
    do
    {
      if ((v41 & 0xC000000000000001) != 0) {
        id v47 = (id)MEMORY[0x2532FF870](v45, v41);
      }
      else {
        id v47 = *(id *)(v41 + 8 * v45 + 32);
      }
      User.init(_:)(v47, v39);
      unint64_t v75 = v44;
      unint64_t v49 = *(void *)(v44 + 16);
      unint64_t v48 = *(void *)(v44 + 24);
      if (v49 >= v48 >> 1)
      {
        sub_24C8CBDD0(v48 > 1, v49 + 1, 1);
        unint64_t v44 = v75;
      }
      ++v45;
      *(void *)(v44 + 16) = v49 + 1;
      sub_24C8B38F0(v39, v44+ ((*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80))+ *(void *)(v46 + 72) * v49, type metadata accessor for User);
      uint64_t v42 = (uint64_t)v74;
    }
    while (v43 != v45);
    id v37 = v66;
  }
  id v50 = v68;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t *v50 = v44;
  unint64_t v75 = 0;
  unint64_t v51 = v37;
  sub_24C8F7D40();
  unint64_t v52 = v75;
  if (v75)
  {

    if (v52 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_24C8F8020();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v53 = *(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    unint64_t v54 = MEMORY[0x263F8EE78];
    if (!v53)
    {
LABEL_37:
      uint64_t v61 = v73;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *uint64_t v61 = v54;
      MEMORY[0x253300580](v71, -1, -1);

      return;
    }
    uint64_t v74 = v51;
    unint64_t v75 = MEMORY[0x263F8EE78];
    sub_24C8CBD94(0, v53 & ~(v53 >> 63), 0);
    if ((v53 & 0x8000000000000000) == 0)
    {
      uint64_t v55 = 0;
      unint64_t v54 = v75;
      uint64_t v56 = v69;
      do
      {
        if ((v52 & 0xC000000000000001) != 0) {
          id v57 = (id)MEMORY[0x2532FF870](v55, v52);
        }
        else {
          id v57 = *(id *)(v52 + 8 * v55 + 32);
        }
        Group.init(_:)(v57, v42);
        unint64_t v75 = v54;
        uint64_t v58 = v42;
        unint64_t v60 = *(void *)(v54 + 16);
        unint64_t v59 = *(void *)(v54 + 24);
        if (v60 >= v59 >> 1)
        {
          sub_24C8CBD94(v59 > 1, v60 + 1, 1);
          uint64_t v56 = v69;
          unint64_t v54 = v75;
        }
        ++v55;
        *(void *)(v54 + 16) = v60 + 1;
        sub_24C8B38F0(v58, v54+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(void *)(v56 + 72) * v60, type metadata accessor for Group);
        uint64_t v42 = v58;
      }
      while (v53 != v55);
      unint64_t v51 = v74;
      goto LABEL_37;
    }
    goto LABEL_41;
  }
LABEL_43:
  __break(1u);
}

id ObjcCompatibility.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id ObjcCompatibility.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ObjcCompatibility.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24C8B2DF4(void (*a1)(unint64_t *, unint64_t *), unint64_t a2, uint64_t a3)
{
  long long v38 = a1;
  unint64_t v39 = a2;
  uint64_t v4 = sub_24C8F7B10();
  v37[5] = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  v37[3] = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v37[1] = (char *)v37 - v8;
  MEMORY[0x270FA5388](v7);
  v37[2] = (char *)v37 - v9;
  uint64_t v10 = type metadata accessor for RecordManager();
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40[3] = &type metadata for ProviderSideEffects;
  v40[4] = &off_26FEFB548;
  v40[0] = swift_allocObject();
  sub_24C8B37CC(a3, v40[0] + 16);
  uint64_t v14 = __swift_project_boxed_opaque_existential_1(v40, (uint64_t)&type metadata for ProviderSideEffects);
  uint64_t v15 = (uint64_t *)&v13[*(int *)(v11 + 28)];
  uint64_t v16 = off_26FEFB550;
  v15[3] = (uint64_t)&type metadata for ProviderSideEffects;
  v15[4] = (uint64_t)v16;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
  ((void (*)(uint64_t *, void *, ValueMetadata *))off_26FEFB500->initializeWithCopy)(boxed_opaque_existential_1, v14, &type metadata for ProviderSideEffects);
  sub_24C8F7B00();
  if (qword_2697F8F08 != -1) {
    swift_once();
  }
  v37[6] = v4;
  v37[4] = __swift_project_value_buffer(v4, (uint64_t)qword_2697F92A0);
  uint64_t v18 = sub_24C8F7AF0();
  os_log_type_t v19 = sub_24C8F7E40();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_24C8A9000, v18, v19, "Initializing DarwinDirectory local domain...", v20, 2u);
    MEMORY[0x253300580](v20, -1, -1);
  }

  char v21 = sub_24C8C3648();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  unint64_t v28 = sub_24C8AC3D4(1);
  unint64_t v30 = sub_24C8D42D0(v28, v29);
  unint64_t v32 = v31;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v33 = sub_24C8D7840(v30, v32, v38, v39, v25);
  unint64_t v35 = v34;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24C8BA0D0((unint64_t)v33, v35, v21 & 1, v23, (void (*)(char *, uint64_t, uint64_t))v25, v27);
  sub_24C8B3A1C((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for RecordManager);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
}

uint64_t sub_24C8B3784()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);

  return MEMORY[0x270FA0238](v0, 136, 7);
}

uint64_t sub_24C8B37CC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t type metadata accessor for ObjcCompatibility()
{
  return self;
}

uint64_t sub_24C8B384C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24C8B3888(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24C8B38F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  id v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_24C8B3A00(uint64_t a1, uint64_t a2)
{
  return sub_24C8AF91C(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_24C8B3A1C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24C8B3A7C()
{
  return swift_release();
}

uint64_t sub_24C8B3A88(uint64_t a1, uint64_t a2)
{
  return sub_24C8B3A00(a1, a2);
}

unint64_t sub_24C8B3AA0(uint64_t a1)
{
  unint64_t result = sub_24C8B3AC8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24C8B3AC8()
{
  unint64_t result = qword_2697F8F78;
  if (!qword_2697F8F78)
  {
    type metadata accessor for RecordStore(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F8F78);
  }
  return result;
}

uint64_t sub_24C8B3B20()
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_24C8F7A50();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = 0;
  uint64_t v6 = type metadata accessor for RecordStore(0);
  unint64_t v7 = sub_24C8B3AC8();
  sub_24C8E43F4(v0, v6, v7);
  if (v1)
  {
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    uint64_t serialization = DarwinDirectory_xpc_make_serialization();
    swift_unknownObjectRelease();
    if (!serialization) {
      __break(1u);
    }
    uint64_t v9 = v14[0];
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F06EF0], v2);
    sub_24C8F7A40();
    if (v9)
    {
      sub_24C8F7950();
      swift_allocObject();
      swift_retain();
      uint64_t v10 = sub_24C8F7910();
      uint64_t v11 = sub_24C8B3E30(v10, v9);
      swift_release();
    }
    else
    {
      uint64_t v12 = (void (*)(uint64_t, void))sub_24C8F7A40();
      v12(serialization, 0);
      swift_release();
      swift_release();
      uint64_t v11 = 0;
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return v11;
  }
  return result;
}

uint64_t sub_24C8B3D6C(unsigned char *__src, unsigned char *a2)
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

uint64_t sub_24C8B3E30(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    swift_release();
    return 0;
  }
  if (a2 > 14)
  {
    if ((unint64_t)a2 < 0x7FFFFFFF) {
      return a2 << 32;
    }
    sub_24C8F7A60();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = 0;
    *(void *)(v3 + 24) = a2;
    return v3;
  }
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = (unsigned char *)sub_24C8F7920();
    if (!v4)
    {
LABEL_10:
      uint64_t v5 = sub_24C8F7930();
      if (v5 >= a2) {
        uint64_t v6 = a2;
      }
      else {
        uint64_t v6 = v5;
      }
      unint64_t v7 = &v4[v6];
      if (v4) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v3 = sub_24C8B3D6C(v4, v8);
      swift_release();
      return v3;
    }
    uint64_t result = sub_24C8F7940();
    if (!__OFSUB__(0, result))
    {
      v4 -= result;
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24C8B3F18()
{
  uint64_t v0 = abort_with_reason();
  return sub_24C8B3F38(v0);
}

uint64_t sub_24C8B3F38(char *a1, char *a2)
{
  return sub_24C8AD9CC(*a1, *a2);
}

uint64_t sub_24C8B3F44()
{
  return sub_24C8E2E8C();
}

uint64_t sub_24C8B3F50()
{
  return sub_24C8E2D58();
}

uint64_t sub_24C8B3F58()
{
  return sub_24C8E2E8C();
}

uint64_t sub_24C8B3F60@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24C8B8DF4();
  *a1 = result;
  return result;
}

void sub_24C8B3F90(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE200000000000000;
  uint64_t v3 = 17481;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 1701667182;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 1145656661;
      *(void *)(a1 + 8) = 0xE400000000000000;
      break;
    case 3:
      *(void *)a1 = 0x656D614E6C6C7566;
      *(void *)(a1 + 8) = 0xE800000000000000;
      break;
    case 4:
      strcpy((char *)a1, "homeDirectory");
      *(_WORD *)(a1 + 14) = -4864;
      break;
    case 5:
      strcpy((char *)a1, "primaryGroupID");
      *(unsigned char *)(a1 + 15) = -18;
      break;
    case 6:
      *(void *)a1 = 0x6C6C656873;
      *(void *)(a1 + 8) = 0xE500000000000000;
      break;
    case 7:
      *(void *)a1 = 0x6C626174754D7369;
      *(void *)(a1 + 8) = 0xE900000000000065;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

uint64_t sub_24C8B40A8()
{
  uint64_t result = 17481;
  switch(*v0)
  {
    case 1:
      uint64_t result = 1701667182;
      break;
    case 2:
      uint64_t result = 1145656661;
      break;
    case 3:
      uint64_t result = 0x656D614E6C6C7566;
      break;
    case 4:
      uint64_t result = 0x65726944656D6F68;
      break;
    case 5:
      uint64_t result = 0x477972616D697270;
      break;
    case 6:
      uint64_t result = 0x6C6C656873;
      break;
    case 7:
      uint64_t result = 0x6C626174754D7369;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24C8B41A4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24C8B8DF4();
  *a1 = result;
  return result;
}

uint64_t sub_24C8B41CC()
{
  return 0;
}

void sub_24C8B41D8(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_24C8B41E4(uint64_t a1)
{
  unint64_t v2 = sub_24C8B7BAC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C8B4220(uint64_t a1)
{
  unint64_t v2 = sub_24C8B7BAC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24C8B425C()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_uuid;
  uint64_t v2 = sub_24C8F7AE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24C8B4340()
{
  return type metadata accessor for RecordStore.UserStoreRecord(0);
}

uint64_t type metadata accessor for RecordStore.UserStoreRecord(uint64_t a1)
{
  return sub_24C8B7B74(a1, (uint64_t *)&unk_2697F8F80);
}

uint64_t sub_24C8B4368()
{
  uint64_t result = sub_24C8F7AE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24C8B4428(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24C8F7AE0();
  uint64_t v17 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9010);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C8B7BAC();
  sub_24C8F85F0();
  char v20 = 0;
  uint64_t v19 = v7;
  uint64_t v11 = v18;
  sub_24C8F8150();
  if (v11) {
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v19);
  }
  uint64_t v13 = v17;
  uint64_t v18 = v8;
  char v20 = 1;
  swift_bridgeObjectRetain();
  sub_24C8F8110();
  swift_bridgeObjectRelease();
  uint64_t v14 = v2 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_uuid;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v6, v14, v4);
  char v21 = 2;
  sub_24C8B7B0C(&qword_2697F8FE0, MEMORY[0x263F07508]);
  sub_24C8F8140();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v6, v4);
  char v21 = 3;
  swift_bridgeObjectRetain();
  sub_24C8F8110();
  swift_bridgeObjectRelease();
  char v21 = 4;
  swift_bridgeObjectRetain();
  sub_24C8F8110();
  swift_bridgeObjectRelease();
  char v21 = 5;
  sub_24C8F8150();
  char v21 = 6;
  swift_bridgeObjectRetain();
  sub_24C8F8110();
  uint64_t v15 = v18;
  swift_bridgeObjectRelease();
  char v21 = 7;
  uint64_t v16 = v19;
  sub_24C8F8120();
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v10, v16);
}

void *sub_24C8B48FC(void *a1)
{
  uint64_t v33 = *v1;
  uint64_t v3 = sub_24C8F7AE0();
  uint64_t v31 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8FF8);
  uint64_t v30 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_isMutable;
  uint64_t v9 = v1;
  *((unsigned char *)v1 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_isMutable) = 0;
  uint64_t v10 = a1[3];
  unint64_t v34 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v10);
  sub_24C8B7BAC();
  uint64_t v11 = v35;
  sub_24C8F85E0();
  if (v11)
  {
    uint64_t v25 = (uint64_t)v34;
    uint64_t v16 = v1;
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v35 = v8;
    uint64_t v12 = v30;
    uint64_t v13 = v31;
    char v43 = 0;
    uint64_t v14 = v7;
    uint64_t v16 = v9;
    *((_DWORD *)v9 + 4) = sub_24C8F80D0();
    char v42 = 1;
    v9[3] = sub_24C8F8090();
    v9[4] = v17;
    char v41 = 2;
    sub_24C8B7B0C(&qword_2697F9008, MEMORY[0x263F07508]);
    sub_24C8F80C0();
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))((uint64_t)v9 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_uuid, v5, v3);
    char v40 = 3;
    uint64_t v18 = sub_24C8F8090();
    uint64_t v19 = (void *)((char *)v9 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_fullName);
    *uint64_t v19 = v18;
    v19[1] = v20;
    char v39 = 4;
    uint64_t v21 = sub_24C8F8090();
    uint64_t v22 = (void *)((char *)v9 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_homeDirectory);
    *uint64_t v22 = v21;
    v22[1] = v23;
    char v38 = 5;
    int v24 = sub_24C8F80D0();
    uint64_t v25 = (uint64_t)v34;
    *(_DWORD *)((char *)v9 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_primaryGroupID) = v24;
    char v37 = 6;
    uint64_t v26 = sub_24C8F8090();
    uint64_t v27 = (void *)((char *)v9 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_shell);
    *uint64_t v27 = v26;
    v27[1] = v28;
    char v36 = 7;
    char v29 = sub_24C8F80A0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v32);
    *((unsigned char *)v9 + v35) = v29 & 1;
  }
  __swift_destroy_boxed_opaque_existential_1(v25);
  return v16;
}

uint64_t sub_24C8B4E48@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24C8B5D98(a1, (uint64_t (*)(uint64_t))sub_24C8B48FC, a2);
}

uint64_t sub_24C8B4E74(void *a1)
{
  return sub_24C8B4428(a1);
}

uint64_t sub_24C8B4E98(char *a1, char *a2)
{
  return sub_24C8AD81C(*a1, *a2);
}

uint64_t sub_24C8B4EA4()
{
  return sub_24C8F85D0();
}

uint64_t sub_24C8B4F8C()
{
  sub_24C8F7CE0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24C8B505C()
{
  return sub_24C8F85D0();
}

uint64_t sub_24C8B5140@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24C8B8E40();
  *a1 = result;
  return result;
}

void sub_24C8B5170(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE200000000000000;
  uint64_t v3 = 17481;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 1701667182;
      goto LABEL_3;
    case 2:
      *a1 = 1145656661;
      a1[1] = 0xE400000000000000;
      break;
    case 3:
      *a1 = 0x614E7265626D656DLL;
      a1[1] = 0xEB0000000073656DLL;
      break;
    case 4:
      *a1 = 0x6C626174754D7369;
      a1[1] = 0xE900000000000065;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_24C8B521C()
{
  uint64_t result = 17481;
  switch(*v0)
  {
    case 1:
      uint64_t result = 1701667182;
      break;
    case 2:
      uint64_t result = 1145656661;
      break;
    case 3:
      uint64_t result = 0x614E7265626D656DLL;
      break;
    case 4:
      uint64_t result = 0x6C626174754D7369;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24C8B52B8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24C8B8E40();
  *a1 = result;
  return result;
}

void sub_24C8B52E0(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_24C8B52EC(uint64_t a1)
{
  unint64_t v2 = sub_24C8B7C00();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C8B5328(uint64_t a1)
{
  unint64_t v2 = sub_24C8B7C00();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24C8B5364()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid;
  uint64_t v2 = sub_24C8F7AE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24C8B541C()
{
  return type metadata accessor for RecordStore.GroupStoreRecord(0);
}

uint64_t type metadata accessor for RecordStore.GroupStoreRecord(uint64_t a1)
{
  return sub_24C8B7B74(a1, (uint64_t *)&unk_2697F8F90);
}

uint64_t sub_24C8B5444()
{
  uint64_t result = sub_24C8F7AE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24C8B5504(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24C8F7AE0();
  uint64_t v18 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9038);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C8B7C00();
  sub_24C8F85F0();
  char v23 = 0;
  uint64_t v20 = v7;
  uint64_t v11 = v19;
  sub_24C8F8150();
  if (v11) {
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v20);
  }
  uint64_t v19 = v8;
  uint64_t v13 = v18;
  char v23 = 1;
  swift_bridgeObjectRetain();
  sub_24C8F8110();
  swift_bridgeObjectRelease();
  uint64_t v14 = v2 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v6, v14, v4);
  char v22 = 2;
  sub_24C8B7B0C(&qword_2697F8FE0, MEMORY[0x263F07508]);
  sub_24C8F8140();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v6, v4);
  uint64_t v15 = (uint64_t *)(v2 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_memberNames);
  swift_beginAccess();
  uint64_t v24 = *v15;
  char v21 = 3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9028);
  sub_24C8B7C54(&qword_2697F9040);
  sub_24C8F8140();
  uint64_t v16 = v19;
  LOBYTE(v24) = 4;
  uint64_t v17 = v20;
  sub_24C8F8120();
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v10, v17);
}

uint64_t *sub_24C8B5904(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v26 = *v2;
  uint64_t v4 = sub_24C8F7AE0();
  uint64_t v24 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9018);
  uint64_t v23 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_isMutable;
  *((unsigned char *)v2 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_isMutable) = 0;
  uint64_t v10 = a1[3];
  uint64_t v27 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v10);
  sub_24C8B7C00();
  uint64_t v11 = v8;
  uint64_t v12 = v28;
  sub_24C8F85E0();
  if (v12)
  {
    uint64_t v17 = (uint64_t)v27;
    swift_deallocPartialClassInstance();
    uint64_t v21 = v17;
  }
  else
  {
    uint64_t v13 = v6;
    uint64_t v28 = v9;
    uint64_t v15 = v23;
    uint64_t v14 = v24;
    char v34 = 0;
    uint64_t v16 = v25;
    *((_DWORD *)v2 + 4) = sub_24C8F80D0();
    char v33 = 1;
    v2[3] = sub_24C8F8090();
    void v2[4] = v19;
    char v32 = 2;
    sub_24C8B7B0C(&qword_2697F9008, MEMORY[0x263F07508]);
    sub_24C8F80C0();
    (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))((uint64_t)v2 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid, v13, v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9028);
    char v31 = 3;
    sub_24C8B7C54(&qword_2697F9030);
    sub_24C8F80C0();
    *(uint64_t *)((char *)v2 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_memberNames) = v29;
    char v30 = 4;
    char v20 = sub_24C8F80A0();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v16);
    uint64_t v21 = (uint64_t)v27;
    *((unsigned char *)v2 + v28) = v20 & 1;
  }
  __swift_destroy_boxed_opaque_existential_1(v21);
  return v2;
}

uint64_t sub_24C8B5D6C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24C8B5D98(a1, (uint64_t (*)(uint64_t))sub_24C8B5904, a2);
}

uint64_t sub_24C8B5D98@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t)@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v7 = swift_allocObject();
  uint64_t result = a2(a1);
  if (!v3) {
    *a3 = v7;
  }
  return result;
}

uint64_t sub_24C8B5E00(void *a1)
{
  return sub_24C8B5504(a1);
}

uint64_t sub_24C8B5E24@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, char *a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v8 = sub_24C8F7AE0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v59 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a4 = a1;
  a4[1] = a2;
  uint64_t v11 = (char *)a4 + *(int *)(type metadata accessor for RecordStore(0) + 48);
  uint64_t v53 = a3;
  uint64_t v54 = v9;
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v61 = v9 + 16;
  uint64_t v62 = v8;
  unint64_t v60 = v12;
  v12(v11, (uint64_t)a3, v8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v13 = MEMORY[0x263F8EE78];
  a4[2] = sub_24C8B9DBC(MEMORY[0x263F8EE78]);
  a4[3] = sub_24C8B9DBC(v13);
  uint64_t result = sub_24C8B9DBC(v13);
  a4[4] = result;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_24C8F8020();
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v58 = a2;
    if (v15) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  uint64_t v15 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  unint64_t v58 = a2;
  if (!v15) {
    goto LABEL_11;
  }
LABEL_3:
  if (v15 < 1)
  {
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v16 = 0;
  uint64_t v55 = (void (**)(char *, uint64_t))(v54 + 8);
  unint64_t v56 = a1 & 0xC000000000000001;
  uint64_t v57 = a1;
  do
  {
    if (v56)
    {
      uint64_t v17 = MEMORY[0x2532FF870](v16, a1);
    }
    else
    {
      uint64_t v17 = *(void *)(a1 + 8 * v16 + 32);
      swift_retain();
    }
    LODWORD(v63) = *(_DWORD *)(v17 + 16);
    uint64_t v18 = sub_24C8F8180();
    uint64_t v20 = v19;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v63 = a4[2];
    a4[2] = 0x8000000000000000;
    sub_24C8B7CB8(v16, v18, v20, isUniquelyReferenced_nonNull_native);
    a4[2] = v63;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v22 = *(void *)(v17 + 24);
    uint64_t v23 = *(void *)(v17 + 32);
    swift_bridgeObjectRetain();
    char v24 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v63 = a4[3];
    a4[3] = 0x8000000000000000;
    sub_24C8B7CB8(v16, v22, v23, v24);
    a4[3] = v63;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v25 = v17 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_uuid;
    swift_beginAccess();
    uint64_t v26 = v59;
    uint64_t v27 = v25;
    uint64_t v28 = v62;
    v60(v59, v27, v62);
    uint64_t v29 = sub_24C8F7A90();
    uint64_t v31 = v30;
    (*v55)(v26, v28);
    char v32 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v63 = a4[4];
    a4[4] = 0x8000000000000000;
    sub_24C8B7CB8(v16, v29, v31, v32);
    a4[4] = v63;
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    ++v16;
    a1 = v57;
  }
  while (v15 != v16);
  swift_bridgeObjectRelease();
  a2 = v58;
LABEL_12:
  uint64_t v33 = MEMORY[0x263F8EE78];
  a4[5] = sub_24C8B9DBC(MEMORY[0x263F8EE78]);
  a4[6] = sub_24C8B9DBC(v33);
  uint64_t result = sub_24C8B9DBC(v33);
  a4[7] = result;
  if (!(a2 >> 62))
  {
    uint64_t v34 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v34) {
      goto LABEL_14;
    }
LABEL_22:
    id v50 = *(void (**)(char *, uint64_t))(v54 + 8);
LABEL_23:
    v50(v53, v62);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v34 = sub_24C8F8020();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v34) {
    goto LABEL_22;
  }
LABEL_14:
  if (v34 >= 1)
  {
    uint64_t v35 = 0;
    uint64_t v55 = (void (**)(char *, uint64_t))(v54 + 8);
    unint64_t v56 = a2 & 0xC000000000000001;
    uint64_t v54 = (v54 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    uint64_t v57 = v34;
    uint64_t v36 = v62;
    do
    {
      if (v56)
      {
        uint64_t v37 = MEMORY[0x2532FF870](v35, a2);
      }
      else
      {
        uint64_t v37 = *(void *)(a2 + 8 * v35 + 32);
        swift_retain();
      }
      LODWORD(v64) = *(_DWORD *)(v37 + 16);
      uint64_t v38 = sub_24C8F8180();
      uint64_t v40 = v39;
      char v41 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v64 = a4[5];
      a4[5] = 0x8000000000000000;
      sub_24C8B7CB8(v35, v38, v40, v41);
      a4[5] = v64;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v42 = *(void *)(v37 + 24);
      uint64_t v43 = *(void *)(v37 + 32);
      swift_bridgeObjectRetain();
      char v44 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v64 = a4[6];
      a4[6] = 0x8000000000000000;
      sub_24C8B7CB8(v35, v42, v43, v44);
      a4[6] = v64;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v45 = v37 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid;
      swift_beginAccess();
      uint64_t v46 = v59;
      v60(v59, v45, v36);
      uint64_t v47 = sub_24C8F7A90();
      uint64_t v49 = v48;
      id v50 = *v55;
      (*v55)(v46, v36);
      char v51 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v64 = a4[7];
      a4[7] = 0x8000000000000000;
      sub_24C8B7CB8(v35, v47, v49, v51);
      a4[7] = v64;
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      ++v35;
      a2 = v58;
    }
    while (v57 != v35);
    goto LABEL_23;
  }
LABEL_25:
  __break(1u);
  return result;
}

unint64_t sub_24C8B6430(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000016;
      break;
    case 2:
      unint64_t result = 0x4279654B73726464;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    case 7:
      unint64_t result = 0xD000000000000013;
      break;
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24C8B653C(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000016;
      break;
    case 2:
      unint64_t result = 0x4279654B73726464;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    case 7:
      unint64_t result = 0xD000000000000013;
      break;
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24C8B6648(char *a1, char *a2)
{
  return sub_24C8AD5BC(*a1, *a2);
}

uint64_t sub_24C8B6654()
{
  return sub_24C8F85D0();
}

uint64_t sub_24C8B669C()
{
  return sub_24C8E2C18();
}

uint64_t sub_24C8B66A4()
{
  return sub_24C8F85D0();
}

uint64_t sub_24C8B66E8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24C8B8E8C();
  *a1 = result;
  return result;
}

unint64_t sub_24C8B6718@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_24C8B6430(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_24C8B6744()
{
  return sub_24C8B653C(*v0);
}

uint64_t sub_24C8B674C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24C8B8E8C();
  *a1 = result;
  return result;
}

void sub_24C8B6774(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_24C8B6780(uint64_t a1)
{
  unint64_t v2 = sub_24C8B79DC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C8B67BC(uint64_t a1)
{
  unint64_t v2 = sub_24C8B79DC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24C8B67F8()
{
  uint64_t v1 = v0;
  uint64_t v64 = sub_24C8F7AE0();
  uint64_t v2 = *(void *)(v64 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v64);
  unint64_t v56 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v61 = (char *)&v54 - v5;
  v0[4] = sub_24C8B9DBC(MEMORY[0x263F8EE78]);
  swift_bridgeObjectRelease();
  uint64_t isUniquelyReferenced_nonNull_native = *v0;
  if (*v0 >> 62) {
    goto LABEL_26;
  }
  uint64_t v7 = *(void *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  unint64_t v63 = v1;
  if (!v7)
  {
LABEL_27:
    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
LABEL_3:
  unint64_t v59 = (void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  unint64_t v60 = (void (**)(char *, uint64_t, uint64_t))(isUniquelyReferenced_nonNull_native & 0xC000000000000001);
  uint64_t v55 = v2;
  uint64_t v57 = isUniquelyReferenced_nonNull_native;
  unint64_t v58 = (void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v8 = 4;
  while (1)
  {
    uint64_t v2 = v8 - 4;
    if (v60)
    {
      uint64_t v9 = MEMORY[0x2532FF870](v8 - 4, isUniquelyReferenced_nonNull_native);
      uint64_t v10 = v8 - 3;
      if (__OFADD__(v2, 1)) {
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v9 = swift_retain();
      uint64_t v10 = v8 - 3;
      if (__OFADD__(v2, 1))
      {
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        swift_bridgeObjectRetain_n();
        uint64_t v7 = sub_24C8F8020();
        swift_bridgeObjectRelease();
        unint64_t v63 = v1;
        if (!v7) {
          goto LABEL_27;
        }
        goto LABEL_3;
      }
    }
    uint64_t v62 = v10;
    uint64_t v11 = v7;
    uint64_t v12 = v9 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_uuid;
    swift_beginAccess();
    uint64_t v13 = v61;
    uint64_t v14 = v64;
    (*v59)(v61, v12, v64);
    uint64_t v15 = sub_24C8F7A90();
    uint64_t v17 = v16;
    (*v58)(v13, v14);
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v66 = v1[4];
    uint64_t v18 = v66;
    v1[4] = 0x8000000000000000;
    unint64_t v20 = sub_24C8C0BD0(v15, v17);
    uint64_t v21 = *(void *)(v18 + 16);
    BOOL v22 = (v19 & 1) == 0;
    uint64_t v23 = v21 + v22;
    if (__OFADD__(v21, v22)) {
      goto LABEL_24;
    }
    uint64_t v1 = v19;
    if (*(void *)(v18 + 24) < v23) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      uint64_t isUniquelyReferenced_nonNull_native = v66;
      if ((v19 & 1) == 0) {
        goto LABEL_18;
      }
    }
    else
    {
      sub_24C8C1D74();
      uint64_t isUniquelyReferenced_nonNull_native = v66;
      if ((v1 & 1) == 0)
      {
LABEL_18:
        *(void *)(isUniquelyReferenced_nonNull_native + 8 * (v20 >> 6) + 64) |= 1 << v20;
        uint64_t v26 = (uint64_t *)(*(void *)(isUniquelyReferenced_nonNull_native + 48) + 16 * v20);
        *uint64_t v26 = v15;
        v26[1] = v17;
        *(void *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 8 * v20) = v2;
        uint64_t v27 = *(void *)(isUniquelyReferenced_nonNull_native + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28) {
          goto LABEL_25;
        }
        *(void *)(isUniquelyReferenced_nonNull_native + 16) = v29;
        swift_bridgeObjectRetain();
        goto LABEL_5;
      }
    }
LABEL_4:
    *(void *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 8 * v20) = v2;
LABEL_5:
    uint64_t v1 = v63;
    v63[4] = isUniquelyReferenced_nonNull_native;
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    ++v8;
    uint64_t v7 = v11;
    uint64_t isUniquelyReferenced_nonNull_native = v57;
    if (v62 == v11)
    {
      swift_bridgeObjectRelease();
      uint64_t v2 = v55;
LABEL_28:
      v1[7] = sub_24C8B9DBC(MEMORY[0x263F8EE78]);
      swift_bridgeObjectRelease();
      unint64_t v30 = v1[1];
      if (v30 >> 62) {
        goto LABEL_52;
      }
      uint64_t v31 = *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v31) {
        return swift_bridgeObjectRelease();
      }
LABEL_30:
      unint64_t v60 = (void (**)(char *, uint64_t, uint64_t))(v2 + 16);
      uint64_t v61 = (char *)(v30 & 0xC000000000000001);
      unint64_t v58 = (void (**)(char *, uint64_t))v30;
      unint64_t v59 = (void (**)(char *, uint64_t, uint64_t))(v2 + 8);
      uint64_t v32 = 4;
      while (1)
      {
        uint64_t v2 = v32 - 4;
        if (v61)
        {
          uint64_t v33 = MEMORY[0x2532FF870](v32 - 4, v30);
          uint64_t v34 = v32 - 3;
          if (__OFADD__(v2, 1)) {
            goto LABEL_49;
          }
        }
        else
        {
          uint64_t v33 = swift_retain();
          uint64_t v34 = v32 - 3;
          if (__OFADD__(v2, 1))
          {
LABEL_49:
            __break(1u);
LABEL_50:
            __break(1u);
LABEL_51:
            __break(1u);
LABEL_52:
            swift_bridgeObjectRetain_n();
            uint64_t v31 = sub_24C8F8020();
            swift_bridgeObjectRelease();
            if (!v31) {
              return swift_bridgeObjectRelease();
            }
            goto LABEL_30;
          }
        }
        uint64_t v62 = v34;
        uint64_t v35 = v31;
        uint64_t v36 = v33 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid;
        swift_beginAccess();
        uint64_t v37 = v56;
        uint64_t v38 = v64;
        (*v60)(v56, v36, v64);
        uint64_t v39 = sub_24C8F7A90();
        uint64_t v41 = v40;
        ((void (*)(char *, uint64_t))*v59)(v37, v38);
        unint64_t v30 = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v65 = v1[7];
        unint64_t v42 = v65;
        v1[7] = 0x8000000000000000;
        unint64_t v44 = sub_24C8C0BD0(v39, v41);
        uint64_t v45 = *(void *)(v42 + 16);
        BOOL v46 = (v43 & 1) == 0;
        uint64_t v47 = v45 + v46;
        if (__OFADD__(v45, v46)) {
          goto LABEL_50;
        }
        uint64_t v1 = v43;
        if (*(void *)(v42 + 24) >= v47)
        {
          if (v30)
          {
            unint64_t v30 = v65;
            if (v43) {
              goto LABEL_31;
            }
          }
          else
          {
            sub_24C8C1D74();
            unint64_t v30 = v65;
            if (v1) {
              goto LABEL_31;
            }
          }
        }
        else
        {
          sub_24C8C1128(v47, v30);
          unint64_t v48 = sub_24C8C0BD0(v39, v41);
          if ((v1 & 1) != (v49 & 1)) {
            goto LABEL_54;
          }
          unint64_t v44 = v48;
          unint64_t v30 = v65;
          if (v1)
          {
LABEL_31:
            *(void *)(*(void *)(v30 + 56) + 8 * v44) = v2;
            goto LABEL_32;
          }
        }
        *(void *)(v30 + 8 * (v44 >> 6) + 64) |= 1 << v44;
        id v50 = (uint64_t *)(*(void *)(v30 + 48) + 16 * v44);
        uint64_t *v50 = v39;
        v50[1] = v41;
        *(void *)(*(void *)(v30 + 56) + 8 * v44) = v2;
        uint64_t v51 = *(void *)(v30 + 16);
        BOOL v28 = __OFADD__(v51, 1);
        uint64_t v52 = v51 + 1;
        if (v28) {
          goto LABEL_51;
        }
        *(void *)(v30 + 16) = v52;
        swift_bridgeObjectRetain();
LABEL_32:
        uint64_t v1 = v63;
        v63[7] = v30;
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        ++v32;
        uint64_t v31 = v35;
        unint64_t v30 = (unint64_t)v58;
        if (v62 == v35) {
          return swift_bridgeObjectRelease();
        }
      }
    }
  }
  sub_24C8C1128(v23, isUniquelyReferenced_nonNull_native);
  unint64_t v24 = sub_24C8C0BD0(v15, v17);
  if ((v1 & 1) == (v25 & 1))
  {
    unint64_t v20 = v24;
    uint64_t isUniquelyReferenced_nonNull_native = v66;
    if ((v1 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_4;
  }
LABEL_54:
  uint64_t result = sub_24C8F8550();
  __break(1u);
  return result;
}

uint64_t sub_24C8B6E24(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8FA0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C8B79DC();
  sub_24C8F85F0();
  uint64_t v11 = *v3;
  HIBYTE(v10) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8FB0);
  sub_24C8B8ED8(&qword_2697F8FB8, &qword_2697F8FC0);
  sub_24C8F8140();
  if (!v2)
  {
    uint64_t v11 = v3[1];
    HIBYTE(v10) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8FC8);
    sub_24C8B7A78(&qword_2697F8FD0, &qword_2697F8FD8);
    sub_24C8F8140();
    type metadata accessor for RecordStore(0);
    LOBYTE(v11) = 2;
    sub_24C8F7AE0();
    sub_24C8B7B0C(&qword_2697F8FE0, MEMORY[0x263F07508]);
    sub_24C8F8140();
    uint64_t v11 = v3[2];
    HIBYTE(v10) = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8FE8);
    sub_24C8B8F6C(&qword_2697F8FF0);
    sub_24C8F8140();
    uint64_t v11 = v3[3];
    HIBYTE(v10) = 4;
    sub_24C8F8140();
    uint64_t v11 = v3[4];
    HIBYTE(v10) = 5;
    sub_24C8F8140();
    uint64_t v11 = v3[5];
    HIBYTE(v10) = 6;
    sub_24C8F8140();
    uint64_t v11 = v3[6];
    HIBYTE(v10) = 7;
    sub_24C8F8140();
    uint64_t v11 = v3[7];
    HIBYTE(v10) = 8;
    sub_24C8F8140();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_24C8B7250@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v4 = sub_24C8F7AE0();
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F90A0);
  uint64_t v7 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for RecordStore(0);
  MEMORY[0x270FA5388](v23);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1[3];
  uint64_t v26 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_24C8B79DC();
  uint64_t v13 = v9;
  sub_24C8F85E0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  }
  uint64_t v14 = v6;
  uint64_t v15 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8FB0);
  char v27 = 0;
  sub_24C8B8ED8(&qword_2697F90A8, &qword_2697F90B0);
  uint64_t v16 = v22;
  sub_24C8F80C0();
  *(void *)uint64_t v11 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8FC8);
  char v27 = 1;
  sub_24C8B7A78(&qword_2697F90B8, &qword_2697F90C0);
  sub_24C8F80C0();
  uint64_t v17 = (uint64_t)v26;
  *((void *)v11 + 1) = v28;
  LOBYTE(v28) = 2;
  sub_24C8B7B0C(&qword_2697F9008, MEMORY[0x263F07508]);
  uint64_t v18 = v25;
  sub_24C8F80C0();
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(&v11[*(int *)(v23 + 48)], v14, v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8FE8);
  char v27 = 3;
  sub_24C8B8F6C(&qword_2697F90C8);
  sub_24C8F80C0();
  *((void *)v11 + 2) = v28;
  char v27 = 4;
  sub_24C8F80C0();
  *((void *)v11 + 3) = v28;
  char v27 = 5;
  sub_24C8F80C0();
  *((void *)v11 + 4) = v28;
  char v27 = 6;
  sub_24C8F80C0();
  *((void *)v11 + 5) = v28;
  char v27 = 7;
  sub_24C8F80C0();
  *((void *)v11 + 6) = v28;
  char v27 = 8;
  sub_24C8F80C0();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v13, v16);
  *((void *)v11 + 7) = v28;
  sub_24C8B8FD4((uint64_t)v11, v21);
  __swift_destroy_boxed_opaque_existential_1(v17);
  return sub_24C8B9038((uint64_t)v11);
}

uint64_t sub_24C8B79AC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24C8B7250(a1, a2);
}

uint64_t sub_24C8B79C4(void *a1)
{
  return sub_24C8B6E24(a1);
}

unint64_t sub_24C8B79DC()
{
  unint64_t result = qword_2697F8FA8;
  if (!qword_2697F8FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F8FA8);
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

uint64_t sub_24C8B7A78(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697F8FC8);
    sub_24C8B7B0C(a2, (void (*)(uint64_t))type metadata accessor for RecordStore.GroupStoreRecord);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24C8B7B0C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for RecordStore(uint64_t a1)
{
  return sub_24C8B7B74(a1, (uint64_t *)&unk_2697F9048);
}

uint64_t sub_24C8B7B74(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24C8B7BAC()
{
  unint64_t result = qword_2697F9000;
  if (!qword_2697F9000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9000);
  }
  return result;
}

unint64_t sub_24C8B7C00()
{
  unint64_t result = qword_2697F9020;
  if (!qword_2697F9020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9020);
  }
  return result;
}

uint64_t sub_24C8B7C54(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697F9028);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24C8B7CB8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_24C8C0BD0(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_24C8C1D74();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(void *)(v18[7] + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_24C8C1128(result, a4 & 1);
  uint64_t result = sub_24C8C0BD0(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_24C8F8550();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v20 = a2;
  v20[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;

  return swift_bridgeObjectRetain();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RecordStore.GroupStoreRecord.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RecordStore.GroupStoreRecord.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24C8B7F88);
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

ValueMetadata *type metadata accessor for RecordStore.GroupStoreRecord.CodingKeys()
{
  return &type metadata for RecordStore.GroupStoreRecord.CodingKeys;
}

uint64_t getEnumTagSinglePayload for RecordStore.UserStoreRecord.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RecordStore.UserStoreRecord.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x24C8B8120);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

uint64_t sub_24C8B8148(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24C8B8150(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RecordStore.UserStoreRecord.CodingKeys()
{
  return &type metadata for RecordStore.UserStoreRecord.CodingKeys;
}

uint64_t getEnumTagSinglePayload for RecordStore.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RecordStore.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24C8B82C4);
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

ValueMetadata *type metadata accessor for RecordStore.CodingKeys()
{
  return &type metadata for RecordStore.CodingKeys;
}

uint64_t *sub_24C8B82FC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = a2[2];
    a1[1] = a2[1];
    a1[2] = v6;
    uint64_t v7 = a2[4];
    a1[3] = a2[3];
    a1[4] = v7;
    uint64_t v8 = a2[6];
    a1[5] = a2[5];
    a1[6] = v8;
    uint64_t v9 = *(int *)(a3 + 48);
    uint64_t v13 = (char *)a2 + v9;
    BOOL v14 = (char *)a1 + v9;
    a1[7] = a2[7];
    uint64_t v10 = sub_24C8F7AE0();
    unint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v14, v13, v10);
  }
  return v5;
}

uint64_t sub_24C8B844C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 48);
  uint64_t v5 = sub_24C8F7AE0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_24C8B84FC(void *a1, void *a2, uint64_t a3)
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
  uint64_t v8 = *(int *)(a3 + 48);
  unint64_t v12 = (char *)a2 + v8;
  uint64_t v13 = (char *)a1 + v8;
  a1[6] = a2[6];
  a1[7] = v7;
  uint64_t v9 = sub_24C8F7AE0();
  char v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v13, v12, v9);
  return a1;
}

void *sub_24C8B85F8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 48);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24C8F7AE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_24C8B8734(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  long long v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 48);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24C8F7AE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

void *sub_24C8B87B8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 48);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24C8F7AE0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_24C8B88B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24C8B88C8);
}

uint64_t sub_24C8B88C8(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_24C8F7AE0();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    char v11 = (char *)a1 + *(int *)(a3 + 48);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_24C8B8978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24C8B898C);
}

void *sub_24C8B898C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  long long v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24C8F7AE0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 48);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24C8B8A34()
{
  uint64_t result = sub_24C8F7AE0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_24C8B8AE0()
{
  unint64_t result = qword_2697F9058;
  if (!qword_2697F9058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9058);
  }
  return result;
}

unint64_t sub_24C8B8B38()
{
  unint64_t result = qword_2697F9060;
  if (!qword_2697F9060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9060);
  }
  return result;
}

unint64_t sub_24C8B8B90()
{
  unint64_t result = qword_2697F9068;
  if (!qword_2697F9068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9068);
  }
  return result;
}

unint64_t sub_24C8B8BE8()
{
  unint64_t result = qword_2697F9070;
  if (!qword_2697F9070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9070);
  }
  return result;
}

unint64_t sub_24C8B8C40()
{
  unint64_t result = qword_2697F9078;
  if (!qword_2697F9078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9078);
  }
  return result;
}

unint64_t sub_24C8B8C98()
{
  unint64_t result = qword_2697F9080;
  if (!qword_2697F9080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9080);
  }
  return result;
}

unint64_t sub_24C8B8CF0()
{
  unint64_t result = qword_2697F9088;
  if (!qword_2697F9088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9088);
  }
  return result;
}

unint64_t sub_24C8B8D48()
{
  unint64_t result = qword_2697F9090;
  if (!qword_2697F9090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9090);
  }
  return result;
}

unint64_t sub_24C8B8DA0()
{
  unint64_t result = qword_2697F9098;
  if (!qword_2697F9098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9098);
  }
  return result;
}

uint64_t sub_24C8B8DF4()
{
  unint64_t v0 = sub_24C8F8070();
  swift_bridgeObjectRelease();
  if (v0 >= 8) {
    return 8;
  }
  else {
    return v0;
  }
}

uint64_t sub_24C8B8E40()
{
  unint64_t v0 = sub_24C8F8070();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_24C8B8E8C()
{
  unint64_t v0 = sub_24C8F8070();
  swift_bridgeObjectRelease();
  if (v0 >= 9) {
    return 9;
  }
  else {
    return v0;
  }
}

uint64_t sub_24C8B8ED8(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697F8FB0);
    sub_24C8B7B0C(a2, (void (*)(uint64_t))type metadata accessor for RecordStore.UserStoreRecord);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24C8B8F6C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697F8FE8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24C8B8FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RecordStore(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C8B9038(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RecordStore(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for NotificationError()
{
  return &type metadata for NotificationError;
}

unint64_t sub_24C8B90AC()
{
  return 0xD000000000000012;
}

unint64_t sub_24C8B9160()
{
  return sub_24C8B90AC();
}

uint64_t sub_24C8B9168(void (*a1)(void *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v18 = a1;
  uint64_t v19 = a2;
  uint64_t v17 = sub_24C8F7C20();
  uint64_t v6 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v9 = *(void *)(a3 + 16);
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (v9)
  {
    uint64_t v21 = MEMORY[0x263F8EE78];
    sub_24C8CBD58(0, v9, 0);
    uint64_t v10 = v21;
    uint64_t v16 = v6 + 32;
    char v11 = (uint64_t *)(a3 + 40);
    while (1)
    {
      uint64_t v12 = *v11;
      v20[0] = *(v11 - 1);
      v20[1] = v12;
      swift_bridgeObjectRetain();
      v18(v20);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      swift_bridgeObjectRelease();
      uint64_t v21 = v10;
      unint64_t v14 = *(void *)(v10 + 16);
      unint64_t v13 = *(void *)(v10 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_24C8CBD58(v13 > 1, v14 + 1, 1);
        uint64_t v10 = v21;
      }
      v11 += 2;
      *(void *)(v10 + 16) = v14 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v14, v8, v17);
      if (!--v9) {
        return v10;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v10;
}

uint64_t sub_24C8B9334(uint64_t a1)
{
  uint64_t v66 = sub_24C8F7C20();
  uint64_t v64 = *(void *)(v66 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v66);
  long long v5 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  unint64_t v60 = (char *)&v57 - v6;
  uint64_t v67 = sub_24C8F7B10();
  uint64_t v65 = *(void *)(v67 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v67);
  int64_t v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v61 = (char *)&v57 - v10;
  uint64_t v11 = sub_24C8F7900();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = ((char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v62 = (char *)&v57 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v57 - v18;
  uint64_t v20 = sub_24C8E1370();
  if (!v1)
  {
    uint64_t v39 = v20;
    MEMORY[0x270FA5388](v20);
    *(&v57 - 2) = a1;
    uint64_t v15 = sub_24C8B9168((void (*)(void *))sub_24C8B9D60, (uint64_t)(&v57 - 4), v39);
    swift_bridgeObjectRelease();
    return (uint64_t)v15;
  }
  uint64_t v70 = (uint64_t)v1;
  id v21 = v1;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8F20);
  if (!swift_dynamicCast())
  {
    uint64_t v62 = (char *)v22;
    MEMORY[0x2533003E0](v70);
    uint64_t v40 = v65;
    uint64_t v41 = v67;
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v9, v63, v67);
    uint64_t v42 = v64;
    uint64_t v43 = v66;
    (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v5, a1, v66);
    id v44 = v1;
    id v45 = v1;
    uint64_t v15 = sub_24C8F7AF0();
    os_log_type_t v46 = sub_24C8F7E30();
    int v47 = v46;
    if (os_log_type_enabled(v15, v46))
    {
      uint64_t v48 = v43;
      uint64_t v49 = swift_slowAlloc();
      uint64_t v63 = swift_slowAlloc();
      uint64_t v70 = v63;
      *(_DWORD *)uint64_t v49 = 136446466;
      sub_24C8B9D18(&qword_2697F8F18, MEMORY[0x263F8F328]);
      LODWORD(v61) = v47;
      uint64_t v50 = sub_24C8F8180();
      uint64_t v69 = sub_24C8E22EC(v50, v51, &v70);
      sub_24C8F7E60();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v5, v48);
      *(_WORD *)(v49 + 12) = 2082;
      uint64_t v69 = (uint64_t)v1;
      id v52 = v1;
      uint64_t v53 = sub_24C8F7CB0();
      uint64_t v69 = sub_24C8E22EC(v53, v54, &v70);
      sub_24C8F7E60();
      swift_bridgeObjectRelease();
      MEMORY[0x2533003E0](v1);
      MEMORY[0x2533003E0](v1);
      _os_log_impl(&dword_24C8A9000, v15, (os_log_type_t)v61, "Failed to get contents of directory %{public}s: %{public}s", (uint8_t *)v49, 0x16u);
      uint64_t v55 = v63;
      swift_arrayDestroy();
      MEMORY[0x253300580](v55, -1, -1);
      MEMORY[0x253300580](v49, -1, -1);

      (*(void (**)(char *, uint64_t))(v65 + 8))(v9, v67);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v42 + 8))(v5, v43);
      MEMORY[0x2533003E0](v1);
      MEMORY[0x2533003E0](v1);

      (*(void (**)(char *, uint64_t))(v40 + 8))(v9, v41);
    }
    swift_willThrow();
    return (uint64_t)v15;
  }
  MEMORY[0x2533003E0](v1);
  uint64_t v23 = v62;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v62, v19, v11);
  uint64_t v24 = v65;
  uint64_t v25 = v61;
  (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v61, v63, v67);
  uint64_t v26 = v64;
  char v27 = v60;
  (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v60, a1, v66);
  (*(void (**)(NSObject *, char *, uint64_t))(v12 + 16))(v15, v23, v11);
  uint64_t v28 = sub_24C8F7AF0();
  int v29 = sub_24C8F7E30();
  if (!os_log_type_enabled(v28, (os_log_type_t)v29))
  {
    uint64_t v37 = *(void (**)(NSObject *, uint64_t))(v12 + 8);
    v37(v15, v11);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v66);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v67);
    goto LABEL_11;
  }
  int v59 = v29;
  uint64_t v30 = swift_slowAlloc();
  uint64_t v58 = swift_slowAlloc();
  uint64_t v69 = v58;
  *(_DWORD *)uint64_t v30 = 136446466;
  uint64_t v63 = v30 + 4;
  sub_24C8B9D18(&qword_2697F8F18, MEMORY[0x263F8F328]);
  uint64_t v31 = v66;
  uint64_t v32 = sub_24C8F8180();
  uint64_t v68 = sub_24C8E22EC(v32, v33, &v69);
  sub_24C8F7E60();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v31);
  *(_WORD *)(v30 + 12) = 1024;
  sub_24C8B9D18((unint64_t *)&qword_2697F8F10, MEMORY[0x263F06080]);
  uint64_t result = sub_24C8F79D0();
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else
  {
    int v35 = result;
    uint64_t v36 = v61;
    if (result <= 0x7FFFFFFF)
    {
      uint64_t v37 = *(void (**)(NSObject *, uint64_t))(v12 + 8);
      v37(v15, v11);
      LODWORD(v68) = v35;
      sub_24C8F7E60();
      uint64_t v15 = v28;
      _os_log_impl(&dword_24C8A9000, v28, (os_log_type_t)v59, "Failed to get contents of directory %{public}s: %{darwin.errno}d", (uint8_t *)v30, 0x12u);
      uint64_t v38 = v58;
      swift_arrayDestroy();
      MEMORY[0x253300580](v38, -1, -1);
      MEMORY[0x253300580](v30, -1, -1);

      (*(void (**)(char *, uint64_t))(v65 + 8))(v36, v67);
LABEL_11:
      unint64_t v56 = v62;
      sub_24C8F78F0();
      swift_willThrow();
      v37(v56, v11);
      MEMORY[0x2533003E0](v70);
      return (uint64_t)v15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24C8B9C24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_24C8F7C20();
  MEMORY[0x270FA5388](v3);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  swift_bridgeObjectRetain();
  return sub_24C8F7C10();
}

uint64_t sub_24C8B9D18(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24C8B9D60(uint64_t a1)
{
  return sub_24C8B9C24(a1, *(void *)(v1 + 16));
}

unint64_t sub_24C8B9D80(uint64_t a1)
{
  return sub_24C8B9ED0(a1, &qword_2697F9138, &qword_2697F9128, (uint64_t (*)(char *))sub_24C8C0AFC, MEMORY[0x263F07508]);
}

unint64_t sub_24C8B9DBC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9120);
  uint64_t v2 = (void *)sub_24C8F8050();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_24C8C0BD0(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
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

unint64_t sub_24C8B9ED0(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(char *), uint64_t (*a5)(void))
{
  int v29 = a5;
  uint64_t v30 = a4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v12 = sub_24C8F8050();
  uint64_t v13 = (void *)v12;
  uint64_t v14 = *(void *)(a1 + 16);
  if (!v14)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v13;
  }
  uint64_t v15 = *(int *)(v8 + 48);
  uint64_t v16 = v12 + 64;
  unint64_t v17 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v28[1] = a1;
  uint64_t v18 = a1 + v17;
  uint64_t v19 = *(void *)(v9 + 72);
  swift_retain();
  while (1)
  {
    sub_24C8C278C(v18, (uint64_t)v11, a2);
    unint64_t result = v30(v11);
    if (v21) {
      break;
    }
    unint64_t v22 = result;
    *(void *)(v16 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v23 = v13[6];
    uint64_t v24 = v29(0);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v23 + *(void *)(*(void *)(v24 - 8) + 72) * v22, v11, v24);
    *(void *)(v13[7] + 8 * v22) = *(void *)&v11[v15];
    uint64_t v25 = v13[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26) {
      goto LABEL_11;
    }
    v13[2] = v27;
    v18 += v19;
    if (!--v14)
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

uint64_t sub_24C8BA0D0(unint64_t a1, unint64_t a2, char a3, uint64_t a4, void (*a5)(char *, uint64_t, uint64_t), uint64_t a6)
{
  v143 = (uint64_t *)a6;
  uint64_t v7 = v6;
  uint64_t v141 = a4;
  v142 = a5;
  unint64_t v132 = a1;
  unint64_t v133 = a2;
  uint64_t v146 = sub_24C8F7AE0();
  uint64_t v129 = *(void *)(v146 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v146);
  v134 = (char *)&v118 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v145 = (char *)&v118 - v11;
  uint64_t v12 = type metadata accessor for RecordStore(0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (unint64_t *)((char *)&v118 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = sub_24C8F7B10();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v125 = (char *)&v118 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v124 = (char *)&v118 - v20;
  MEMORY[0x270FA5388](v19);
  unint64_t v22 = (char *)&v118 - v21;
  uint64_t v23 = *(void (**)(void, void, void))(v16 + 16);
  uint64_t v128 = v7;
  uint64_t v127 = v16 + 16;
  v126 = (void (*)(char *, uint64_t, uint64_t))v23;
  v23((char *)&v118 - v21, v7, v15);
  uint64_t v24 = sub_24C8F7AF0();
  os_log_type_t v25 = sub_24C8F7E10();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = v16;
    uint64_t v27 = v15;
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v28 = 0;
    _os_log_impl(&dword_24C8A9000, v24, v25, "Updating local domain...", v28, 2u);
    int v29 = v28;
    uint64_t v15 = v27;
    uint64_t v16 = v26;
    MEMORY[0x253300580](v29, -1, -1);
  }

  uint64_t v32 = *(void (**)(void, void))(v16 + 8);
  uint64_t v31 = v16 + 8;
  uint64_t v30 = v32;
  v32(v22, v15);
  int v33 = a3 & 1;
  uint64_t v34 = (uint64_t)v14;
  int v35 = v14;
  unint64_t v37 = v132;
  unint64_t v36 = v133;
  uint64_t v38 = v144;
  uint64_t v39 = v128;
  uint64_t result = sub_24C8BB14C(v132, v133, v33, v141, v142, (uint64_t)v143, v35);
  uint64_t v41 = v38;
  if (!v38)
  {
    if (v37 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v116 = sub_24C8F8020();
      swift_bridgeObjectRelease();
      uint64_t v42 = v116;
    }
    else
    {
      uint64_t v42 = *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    unint64_t v43 = MEMORY[0x263F8EE78];
    uint64_t v123 = v34;
    uint64_t v122 = v15;
    uint64_t v121 = v31;
    v119 = (void (*)(char *, uint64_t))v30;
    uint64_t v120 = 0;
    if (v42)
    {
      unint64_t v147 = MEMORY[0x263F8EE78];
      uint64_t v144 = v42;
      uint64_t result = sub_24C8F7FB0();
      uint64_t v44 = v144;
      if (v144 < 0)
      {
        __break(1u);
        goto LABEL_35;
      }
      if ((v37 & 0xC000000000000001) != 0)
      {
        uint64_t v45 = 0;
        v130 = (void (**)(uint64_t, char *, uint64_t))(v129 + 32);
        v131 = (void (**)(char *, uint64_t, uint64_t))(v129 + 16);
        do
        {
          v143 = (uint64_t *)(v45 + 1);
          uint64_t v46 = MEMORY[0x2532FF870]();
          int v47 = *(_DWORD *)(v46 + 16);
          uint64_t v48 = *(void *)(v46 + 32);
          v142 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 24);
          uint64_t v49 = *v131;
          unint64_t v51 = v145;
          uint64_t v50 = v146;
          (*v131)(v145, v46 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v146);
          id v52 = *(void (***)(uint64_t, char *, uint64_t))(v46
                                                                 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName
                                                                 + 8);
          uint64_t v141 = *(void *)(v46 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
          v138 = v52;
          uint64_t v53 = *(void *)(v46 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory + 8);
          v140 = *(void (**)(char *, uint64_t, uint64_t))(v46
                                                                 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
          unint64_t v54 = v134;
          v49(v134, v46 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v50);
          unint64_t v55 = *(void *)(v46 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell + 8);
          v139 = *(void (***)(void, void, void))(v46
                                                                + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
          unint64_t v137 = v55;
          unint64_t v56 = (uint64_t *)(v46 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships);
          swift_beginAccess();
          uint64_t v135 = *v56;
          uint64_t v136 = *(void *)(v46 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
          type metadata accessor for UserRecordFile(0);
          uint64_t v57 = swift_allocObject();
          *(void *)(v57 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases) = 0;
          *(void *)(v57 + 16) = 3;
          *(_DWORD *)(v57 + 24) = v47;
          *(void *)(v57 + 32) = v142;
          *(void *)(v57 + 40) = v48;
          uint64_t v58 = *v130;
          (*v130)(v57 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_uuid, v51, v50);
          int v59 = (void *)(v57 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_fullName);
          unint64_t v60 = v138;
          *int v59 = v141;
          v59[1] = v60;
          uint64_t v61 = (void *)(v57 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_homeDirectory);
          *uint64_t v61 = v140;
          v61[1] = v53;
          v58(v57 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_primaryGroupUUID, v54, v50);
          uint64_t v62 = (void *)(v57 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_shell);
          uint64_t v64 = v136;
          unint64_t v63 = v137;
          *uint64_t v62 = v139;
          v62[1] = v63;
          *(void *)(v57 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_memberships) = v135;
          *(void *)(v57 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases) = v64;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          sub_24C8F7F90();
          sub_24C8F7FC0();
          sub_24C8F7FD0();
          sub_24C8F7FA0();
          uint64_t v45 = (uint64_t)v143;
        }
        while ((uint64_t *)v144 != v143);
      }
      else
      {
        v131 = *(void (***)(char *, uint64_t, uint64_t))(v129 + 16);
        unint64_t v132 = v129 + 16;
        uint64_t v65 = (uint64_t *)(v37 + 32);
        v130 = (void (**)(uint64_t, char *, uint64_t))(v129 + 32);
        uint64_t v66 = v134;
        do
        {
          uint64_t v67 = *v65;
          v143 = v65 + 1;
          uint64_t v144 = v44;
          int v68 = *(_DWORD *)(v67 + 16);
          uint64_t v69 = *(void *)(v67 + 32);
          uint64_t v136 = *(void *)(v67 + 24);
          int v71 = v145;
          uint64_t v70 = v146;
          uint64_t v72 = v131;
          ((void (*)(char *, uint64_t, uint64_t))v131)(v145, v67 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v146);
          unint64_t v73 = *(void (***)(void, void, void))(v67
                                                               + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName
                                                               + 8);
          v142 = *(void (**)(char *, uint64_t, uint64_t))(v67
                                                                 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
          v139 = v73;
          uint64_t v74 = *(void (***)(uint64_t, char *, uint64_t))(v67
                                                                 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory
                                                                 + 8);
          uint64_t v141 = *(void *)(v67 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
          v138 = v74;
          ((void (*)(char *, uint64_t, uint64_t))v72)(v66, v67 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v70);
          unint64_t v75 = *(void *)(v67 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell + 8);
          v140 = *(void (**)(char *, uint64_t, uint64_t))(v67
                                                                 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
          unint64_t v137 = v75;
          unint64_t v76 = (uint64_t *)(v67 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships);
          swift_beginAccess();
          uint64_t v77 = *v76;
          uint64_t v135 = *(void *)(v67 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
          type metadata accessor for UserRecordFile(0);
          uint64_t v78 = swift_allocObject();
          *(void *)(v78 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases) = 0;
          *(void *)(v78 + 16) = 3;
          *(_DWORD *)(v78 + 24) = v68;
          *(void *)(v78 + 32) = v136;
          *(void *)(v78 + 40) = v69;
          uint64_t v79 = *v130;
          (*v130)(v78 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_uuid, v71, v70);
          unint64_t v80 = (void *)(v78 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_fullName);
          v82 = v138;
          os_log_t v81 = v139;
          void *v80 = v142;
          v80[1] = v81;
          v83 = (void *)(v78 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_homeDirectory);
          void *v83 = v141;
          v83[1] = v82;
          v79(v78 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_primaryGroupUUID, v66, v70);
          uint64_t v84 = (void *)(v78 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_shell);
          unint64_t v85 = v137;
          *uint64_t v84 = v140;
          v84[1] = v85;
          *(void *)(v78 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_memberships) = v77;
          *(void *)(v78 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases) = v135;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          sub_24C8F7F90();
          sub_24C8F7FC0();
          sub_24C8F7FD0();
          sub_24C8F7FA0();
          uint64_t v65 = v143;
          uint64_t v44 = v144 - 1;
        }
        while (v144 != 1);
      }
      unint64_t v43 = v147;
      uint64_t v34 = v123;
      uint64_t v15 = v122;
      uint64_t v41 = v120;
      uint64_t v39 = v128;
      unint64_t v36 = v133;
    }
    if (v36 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v117 = sub_24C8F8020();
      swift_bridgeObjectRelease();
      uint64_t v86 = v117;
    }
    else
    {
      uint64_t v86 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    unint64_t v87 = MEMORY[0x263F8EE78];
    if (!v86) {
      goto LABEL_26;
    }
    unint64_t v137 = v43;
    unint64_t v147 = MEMORY[0x263F8EE78];
    uint64_t v144 = v86;
    uint64_t result = sub_24C8F7FB0();
    uint64_t v88 = v144;
    if ((v144 & 0x8000000000000000) == 0)
    {
      if ((v36 & 0xC000000000000001) != 0)
      {
        uint64_t v89 = 0;
        v138 = (void (**)(uint64_t, char *, uint64_t))(v129 + 32);
        v139 = (void (**)(void, void, void))(v129 + 16);
        uint64_t v90 = v146;
        do
        {
          v143 = (uint64_t *)(v89 + 1);
          uint64_t v91 = MEMORY[0x2532FF870]();
          LODWORD(v141) = *(_DWORD *)(v91 + 32);
          uint64_t v92 = *(void *)(v91 + 48);
          v140 = *(void (**)(char *, uint64_t, uint64_t))(v91 + 40);
          unint64_t v93 = v145;
          (*v139)(v145, v91 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v90);
          uint64_t v94 = *(void *)(v91 + 24);
          v142 = *(void (**)(char *, uint64_t, uint64_t))(v91 + 16);
          uint64_t v95 = *(void *)(v91 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups);
          uint64_t v96 = *(void *)(v91 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases);
          type metadata accessor for GroupRecordFile(0);
          uint64_t v97 = swift_allocObject();
          *(void *)(v97 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups) = 0;
          *(void *)(v97 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases) = 0;
          *(void *)(v97 + 16) = 3;
          *(_DWORD *)(v97 + 24) = v141;
          *(void *)(v97 + 32) = v140;
          *(void *)(v97 + 40) = v92;
          (*v138)(v97 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_uuid, v93, v90);
          unint64_t v98 = (void *)(v97 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_fullName);
          *unint64_t v98 = v142;
          v98[1] = v94;
          *(void *)(v97 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups) = v95;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          *(void *)(v97 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases) = v96;
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          sub_24C8F7F90();
          sub_24C8F7FC0();
          sub_24C8F7FD0();
          sub_24C8F7FA0();
          uint64_t v89 = (uint64_t)v143;
        }
        while ((uint64_t *)v144 != v143);
      }
      else
      {
        uint64_t v99 = (uint64_t *)(v36 + 32);
        v100 = *(void (**)(void, void, void))(v129 + 16);
        v139 = (void (**)(void, void, void))(v129 + 32);
        v140 = (void (*)(char *, uint64_t, uint64_t))v100;
        v129 += 16;
        uint64_t v101 = v145;
        uint64_t v102 = v146;
        do
        {
          uint64_t v144 = v88;
          uint64_t v103 = *v99++;
          LODWORD(v142) = *(_DWORD *)(v103 + 32);
          uint64_t v104 = *(void *)(v103 + 48);
          uint64_t v141 = *(void *)(v103 + 40);
          v140(v101, v103 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v102);
          uint64_t v105 = *(uint64_t **)(v103 + 24);
          v143 = *(uint64_t **)(v103 + 16);
          uint64_t v106 = *(void *)(v103 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups);
          uint64_t v107 = *(void *)(v103 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases);
          type metadata accessor for GroupRecordFile(0);
          uint64_t v108 = swift_allocObject();
          *(void *)(v108 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups) = 0;
          *(void *)(v108 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases) = 0;
          *(void *)(v108 + 16) = 3;
          *(_DWORD *)(v108 + 24) = v142;
          *(void *)(v108 + 32) = v141;
          *(void *)(v108 + 40) = v104;
          (*v139)(v108 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_uuid, v101, v102);
          v109 = (uint64_t **)(v108 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_fullName);
          char *v109 = v143;
          v109[1] = v105;
          *(void *)(v108 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups) = v106;
          swift_retain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          *(void *)(v108 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases) = v107;
          swift_release();
          swift_bridgeObjectRelease();
          sub_24C8F7F90();
          sub_24C8F7FC0();
          sub_24C8F7FD0();
          sub_24C8F7FA0();
          uint64_t v88 = v144 - 1;
        }
        while (v144 != 1);
      }
      unint64_t v87 = v147;
      uint64_t v34 = v123;
      uint64_t v15 = v122;
      uint64_t v41 = v120;
      uint64_t v39 = v128;
      unint64_t v43 = v137;
LABEL_26:
      sub_24C8BBD40(v43, v87, v34);
      if (v41)
      {
        sub_24C8B9038(v34);
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v110 = v124;
        v126(v124, v39, v15);
        unint64_t v111 = sub_24C8F7AF0();
        os_log_type_t v112 = sub_24C8F7E40();
        if (os_log_type_enabled(v111, v112))
        {
          uint64_t v113 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v113 = 0;
          _os_log_impl(&dword_24C8A9000, v111, v112, "Updated local domain", v113, 2u);
          uint64_t v34 = v123;
          MEMORY[0x253300580](v113, -1, -1);
        }

        v119(v110, v15);
        uint64_t v114 = type metadata accessor for RecordManager();
        uint64_t v115 = __swift_project_boxed_opaque_existential_1((void *)(v39 + *(int *)(v114 + 20)), *(void *)(v39 + *(int *)(v114 + 20) + 24));
        __swift_project_boxed_opaque_existential_1(v115 + 5, v115[8]);
        sub_24C8E1EB8(0xD00000000000001FLL, 0x800000024C8FC110);
        return sub_24C8B9038(v34);
      }
    }
LABEL_35:
    __break(1u);
  }
  return result;
}

uint64_t sub_24C8BB14C@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, void (*a5)(char *, uint64_t, uint64_t)@<X4>, uint64_t a6@<X5>, unint64_t *a7@<X8>)
{
  uint64_t v8 = v7;
  uint64_t v80 = a6;
  unint64_t v81 = a1;
  uint64_t v83 = a4;
  uint64_t v84 = a5;
  int v79 = a3;
  unint64_t v82 = a2;
  uint64_t v78 = a7;
  uint64_t v9 = sub_24C8F7AE0();
  uint64_t v92 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v91 = (char *)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v77 - v12;
  uint64_t v14 = sub_24C8F7B10();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v77 = (char *)&v77 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  unint64_t v87 = (char *)&v77 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v77 - v20;
  unint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  uint64_t v93 = v8;
  uint64_t v88 = v22;
  v22((char *)&v77 - v20, v8, v14);
  uint64_t v23 = sub_24C8F7AF0();
  os_log_type_t v24 = sub_24C8F7E10();
  unint64_t v25 = v24;
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl(&dword_24C8A9000, v23, (os_log_type_t)v25, "Building updated record store...", v26, 2u);
    MEMORY[0x253300580](v26, -1, -1);
  }

  uint64_t v89 = *(void (**)(char *, uint64_t))(v15 + 8);
  v89(v21, v14);
  unint64_t v27 = sub_24C8AB78C(0);
  unint64_t v28 = v27;
  unint64_t v95 = v27;
  unint64_t v94 = v29;
  unint64_t v85 = v13;
  uint64_t v86 = v9;
  if (v27 >> 62) {
    goto LABEL_128;
  }
  uint64_t v30 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v30; uint64_t v30 = sub_24C8F8020())
  {
    uint64_t v31 = 0;
    unint64_t v25 = v28 & 0xC000000000000001;
    while (1)
    {
      if (v25) {
        uint64_t v32 = MEMORY[0x2532FF870](v31, v28);
      }
      else {
        uint64_t v32 = swift_retain();
      }
      int v33 = *(_DWORD *)(v32 + 16);
      swift_release();
      if (v33 == 501)
      {
        swift_bridgeObjectRelease();
        unint64_t v25 = v31 + 1;
        if (__OFADD__(v31, 1))
        {
          __break(1u);
        }
        else
        {
          unint64_t v28 = v95;
          if (!(v95 >> 62))
          {
            if (v25 == *(void *)((v95 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_14;
            }
LABEL_37:
            uint64_t v55 = v31 + 5;
            while (1)
            {
              unint64_t v56 = v55 - 4;
              unint64_t v25 = v28 & 0xC000000000000001;
              if ((v28 & 0xC000000000000001) != 0)
              {
                uint64_t v57 = MEMORY[0x2532FF870](v55 - 4, v28);
              }
              else
              {
                if ((v56 & 0x8000000000000000) != 0) {
                  goto LABEL_108;
                }
                if (v56 >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                  goto LABEL_109;
                }
                uint64_t v57 = swift_retain();
              }
              int v58 = *(_DWORD *)(v57 + 16);
              swift_release();
              if (v58 != 501)
              {
                if (v56 != v31)
                {
                  if (v25)
                  {
                    uint64_t v60 = MEMORY[0x2532FF870](v31, v28);
                    unint64_t v25 = MEMORY[0x2532FF870](v55 - 4, v28);
                  }
                  else
                  {
                    if (v31 < 0) {
                      goto LABEL_116;
                    }
                    unint64_t v59 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
                    if (v31 >= v59) {
                      goto LABEL_117;
                    }
                    uint64_t v60 = *(void *)(v28 + 8 * v31 + 32);
                    swift_retain();
                    if ((v56 & 0x8000000000000000) != 0) {
                      goto LABEL_118;
                    }
                    if (v56 >= v59) {
                      goto LABEL_119;
                    }
                    unint64_t v25 = *(void *)(v28 + 8 * v55);
                    swift_retain();
                  }
                  if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
                    || (v28 & 0x8000000000000000) != 0
                    || (v28 & 0x4000000000000000) != 0)
                  {
                    sub_24C8C2248(v28);
                    unint64_t v28 = v61;
                    unint64_t v95 = v61;
                  }
                  *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 8 * v31 + 0x20) = v25;
                  swift_release();
                  sub_24C8F7D60();
                  unint64_t v28 = v95;
                  if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
                    || (v28 & 0x8000000000000000) != 0
                    || (v28 & 0x4000000000000000) != 0)
                  {
                    sub_24C8C2248(v28);
                    unint64_t v28 = v62;
                    unint64_t v95 = v62;
                  }
                  if ((v56 & 0x8000000000000000) != 0) {
                    goto LABEL_120;
                  }
                  if (v56 >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                    goto LABEL_121;
                  }
                  *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 8 * v55) = v60;
                  swift_release();
                  unint64_t v28 = (unint64_t)&v95;
                  sub_24C8F7D60();
                }
                BOOL v63 = __OFADD__(v31++, 1);
                if (v63) {
                  goto LABEL_114;
                }
              }
              unint64_t v25 = v55 - 3;
              if (__OFADD__(v56, 1)) {
                goto LABEL_110;
              }
              unint64_t v28 = v95;
              if (v95 >> 62)
              {
                swift_bridgeObjectRetain();
                uint64_t v64 = sub_24C8F8020();
                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v64 = *(void *)((v95 & 0xFFFFFFFFFFFFFF8) + 0x10);
              }
              ++v55;
              if (v25 == v64) {
                goto LABEL_14;
              }
            }
          }
        }
        swift_bridgeObjectRetain();
        uint64_t v75 = sub_24C8F8020();
        swift_bridgeObjectRelease();
        if (v25 == v75) {
          goto LABEL_14;
        }
        goto LABEL_37;
      }
      uint64_t v34 = v31 + 1;
      if (__OFADD__(v31, 1)) {
        break;
      }
      ++v31;
      if (v34 == v30) {
        goto LABEL_12;
      }
    }
    __break(1u);
LABEL_107:
    __break(1u);
LABEL_108:
    __break(1u);
LABEL_109:
    __break(1u);
LABEL_110:
    __break(1u);
LABEL_111:
    __break(1u);
LABEL_112:
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
    swift_bridgeObjectRetain();
  }
LABEL_12:
  swift_bridgeObjectRelease();
  unint64_t v28 = v95;
  if (v95 >> 62) {
    goto LABEL_136;
  }
  uint64_t v31 = *(void *)((v95 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
LABEL_14:
    if (v28 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_24C8F8020();
      swift_bridgeObjectRelease();
      if (v35 < v31)
      {
LABEL_131:
        __break(1u);
        goto LABEL_132;
      }
    }
    else
    {
      uint64_t v35 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v35 < v31) {
        goto LABEL_131;
      }
    }
    sub_24C8C2430(v31, v35, (void (*)(void))type metadata accessor for UserRecord);
    unint64_t v28 = v94;
    unint64_t v25 = v94 >> 62;
    if (!(v94 >> 62))
    {
      uint64_t v36 = *(void *)((v94 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v36) {
        goto LABEL_25;
      }
      goto LABEL_18;
    }
LABEL_132:
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_24C8F8020();
    if (!v36)
    {
LABEL_25:
      swift_bridgeObjectRelease();
      if (v25)
      {
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_24C8F8020();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v37 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      goto LABEL_27;
    }
LABEL_18:
    uint64_t v37 = 0;
    while (1)
    {
      uint64_t v38 = (v28 & 0xC000000000000001) != 0 ? MEMORY[0x2532FF870](v37, v28) : swift_retain();
      int v39 = *(_DWORD *)(v38 + 32);
      swift_release();
      if (v39 == 501) {
        break;
      }
      uint64_t v40 = v37 + 1;
      if (__OFADD__(v37, 1)) {
        goto LABEL_107;
      }
      ++v37;
      if (v40 == v36) {
        goto LABEL_25;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v65 = v37 + 1;
    if (__OFADD__(v37, 1))
    {
      __break(1u);
    }
    else if (!v25)
    {
      if (v65 != *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_73;
      }
      goto LABEL_27;
    }
    swift_bridgeObjectRetain();
    uint64_t v76 = sub_24C8F8020();
    swift_bridgeObjectRelease();
    if (v65 != v76)
    {
LABEL_73:
      uint64_t v66 = v37 + 5;
      do
      {
        unint64_t v67 = v66 - 4;
        unint64_t v25 = v28 & 0xC000000000000001;
        if ((v28 & 0xC000000000000001) != 0)
        {
          uint64_t v68 = MEMORY[0x2532FF870](v66 - 4, v28);
        }
        else
        {
          if ((v67 & 0x8000000000000000) != 0) {
            goto LABEL_111;
          }
          if (v67 >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_112;
          }
          uint64_t v68 = swift_retain();
        }
        int v69 = *(_DWORD *)(v68 + 32);
        swift_release();
        if (v69 != 501)
        {
          if (v67 != v37)
          {
            if (v25)
            {
              uint64_t v71 = MEMORY[0x2532FF870](v37, v28);
              unint64_t v25 = MEMORY[0x2532FF870](v66 - 4, v28);
            }
            else
            {
              if (v37 < 0) {
                goto LABEL_122;
              }
              unint64_t v70 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
              if (v37 >= v70) {
                goto LABEL_123;
              }
              uint64_t v71 = *(void *)(v28 + 8 * v37 + 32);
              swift_retain();
              if ((v67 & 0x8000000000000000) != 0) {
                goto LABEL_124;
              }
              if (v67 >= v70) {
                goto LABEL_125;
              }
              unint64_t v25 = *(void *)(v28 + 8 * v66);
              swift_retain();
            }
            if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
              || (v28 & 0x8000000000000000) != 0
              || (v28 & 0x4000000000000000) != 0)
            {
              sub_24C8C2248(v28);
              unint64_t v28 = v72;
              unint64_t v94 = v72;
            }
            *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 8 * v37 + 0x20) = v25;
            swift_release();
            sub_24C8F7D60();
            unint64_t v28 = v94;
            if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
              || (v28 & 0x8000000000000000) != 0
              || (v28 & 0x4000000000000000) != 0)
            {
              sub_24C8C2248(v28);
              unint64_t v28 = v73;
              unint64_t v94 = v73;
            }
            if ((v67 & 0x8000000000000000) != 0) {
              goto LABEL_126;
            }
            if (v67 >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_127;
            }
            *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 8 * v66) = v71;
            swift_release();
            unint64_t v28 = (unint64_t)&v94;
            sub_24C8F7D60();
          }
          BOOL v63 = __OFADD__(v37++, 1);
          if (v63) {
            goto LABEL_115;
          }
        }
        unint64_t v25 = v66 - 3;
        if (__OFADD__(v67, 1)) {
          goto LABEL_113;
        }
        unint64_t v28 = v94;
        if (v94 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v74 = sub_24C8F8020();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v74 = *(void *)((v94 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        ++v66;
      }
      while (v25 != v74);
    }
LABEL_27:
    unint64_t v25 = (unint64_t)v91;
    uint64_t v41 = v92;
    if (v28 >> 62) {
      break;
    }
    uint64_t v42 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v42 >= v37) {
      goto LABEL_29;
    }
LABEL_135:
    __break(1u);
LABEL_136:
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_24C8F8020();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v42 = sub_24C8F8020();
  swift_bridgeObjectRelease();
  if (v42 < v37) {
    goto LABEL_135;
  }
LABEL_29:
  sub_24C8C2430(v37, v42, (void (*)(void))type metadata accessor for GroupRecord);
  uint64_t v43 = type metadata accessor for RecordManager();
  uint64_t v44 = v93;
  uint64_t v45 = __swift_project_boxed_opaque_existential_1((void *)(v93 + *(int *)(v43 + 20)), *(void *)(v93 + *(int *)(v43 + 20) + 24));
  __swift_project_boxed_opaque_existential_1(v45 + 10, v45[13]);
  uint64_t v46 = v90;
  sub_24C8C3990(v25);
  if (v46)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v47 = v87;
    v88(v87, v44, v14);
    uint64_t v48 = sub_24C8F7AF0();
    os_log_type_t v49 = sub_24C8F7E30();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v50 = 0;
      _os_log_impl(&dword_24C8A9000, v48, v49, "Failed to update local domain: failed to get current boot UUID", v50, 2u);
      MEMORY[0x253300580](v50, -1, -1);
    }

    v89(v47, v14);
    return swift_willThrow();
  }
  else
  {
    uint64_t v52 = (uint64_t)v85;
    unint64_t v53 = v25;
    uint64_t v54 = v86;
    (*(void (**)(char *, unint64_t, uint64_t))(v41 + 32))(v85, v53, v86);
    sub_24C8C5D0C(v95, v94, v81, v82, v52, v79 & 1, v83, v84, v78);
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v52, v54);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24C8BBD40(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  unint64_t v54 = a2;
  uint64_t v55 = a3;
  unint64_t v53 = a1;
  uint64_t v48 = sub_24C8F7900();
  v47[2] = *(void *)(v48 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v48);
  v47[1] = (char *)v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v47[4] = (char *)v47 - v9;
  MEMORY[0x270FA5388](v8);
  unint64_t v51 = (char *)v47 - v10;
  uint64_t v50 = sub_24C8F7C20();
  uint64_t v52 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  os_log_type_t v49 = (char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24C8F7B10();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v47[3] = (char *)v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v47 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)v47 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)v47 - v22;
  os_log_type_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v57 = v5;
  uint64_t v58 = v25;
  unint64_t v56 = v24;
  ((void (*)(char *, uint64_t))v24)((char *)v47 - v22, v5);
  uint64_t v26 = sub_24C8F7AF0();
  os_log_type_t v27 = sub_24C8F7E10();
  if (os_log_type_enabled(v26, v27))
  {
    unint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v28 = 0;
    _os_log_impl(&dword_24C8A9000, v26, v27, "Preparing staging directory...", v28, 2u);
    MEMORY[0x253300580](v28, -1, -1);
  }

  unint64_t v29 = *(void (**)(char *, uint64_t))(v13 + 8);
  uint64_t v30 = v58;
  v29(v23, v58);
  uint64_t v31 = v57;
  sub_24C8BC6E8();
  if (!v4)
  {
    v56(v21, v31, v30);
    uint64_t v32 = sub_24C8F7AF0();
    os_log_type_t v33 = sub_24C8F7E10();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_24C8A9000, v32, v33, "Staging files...", v34, 2u);
      uint64_t v35 = v34;
      uint64_t v31 = v57;
      MEMORY[0x253300580](v35, -1, -1);
    }

    uint64_t v36 = v58;
    v29(v21, v58);
    sub_24C8BC958(v53, v54, v55);
    v56(v18, v31, v36);
    uint64_t v38 = sub_24C8F7AF0();
    os_log_type_t v39 = sub_24C8F7E10();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl(&dword_24C8A9000, v38, v39, "Swapping in staged files...", v40, 2u);
      MEMORY[0x253300580](v40, -1, -1);
    }

    v29(v18, v58);
    uint64_t v41 = type metadata accessor for RecordManager();
    uint64_t v42 = __swift_project_boxed_opaque_existential_1((void *)(v31 + *(int *)(v41 + 20)), *(void *)(v31 + *(int *)(v41 + 20) + 24));
    sub_24C8C0A98((uint64_t)v42, (uint64_t)v59);
    __swift_project_boxed_opaque_existential_1(v59, v59[3]);
    if (qword_2697F8EB0 != -1) {
      swift_once();
    }
    uint64_t v43 = v50;
    uint64_t v44 = __swift_project_value_buffer(v50, (uint64_t)qword_2697FC148);
    uint64_t v45 = (uint64_t)v49;
    (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v49, v44, v43);
    if (qword_2697F8EA8 != -1) {
      swift_once();
    }
    uint64_t v46 = __swift_project_value_buffer(v43, (uint64_t)qword_2697FC130);
    sub_24C8E069C(v45, v46);
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v45, v43);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
  }
  return sub_24C8BC574(v31);
}

uint64_t sub_24C8BC574(uint64_t a1)
{
  uint64_t v2 = sub_24C8F7B10();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t v6 = sub_24C8F7AF0();
  os_log_type_t v7 = sub_24C8F7E10();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_24C8A9000, v6, v7, "Cleaning up staging directory...", v8, 2u);
    MEMORY[0x253300580](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_24C8BCC4C();
}

uint64_t sub_24C8BC6E8()
{
  uint64_t v2 = sub_24C8F7B10();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C8BCC4C();
  if (!v1) {
    return sub_24C8BD26C();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v0, v2);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_24C8F7AF0();
  os_log_type_t v9 = sub_24C8F7E30();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = (uint64_t)v1;
    uint64_t v19 = v17;
    *(_DWORD *)uint64_t v10 = 136446210;
    v16[1] = v10 + 4;
    id v11 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8F20);
    uint64_t v12 = sub_24C8F7CB0();
    uint64_t v18 = sub_24C8E22EC(v12, v13, &v19);
    sub_24C8F7E60();
    swift_bridgeObjectRelease();
    MEMORY[0x2533003E0](v1);
    MEMORY[0x2533003E0](v1);
    _os_log_impl(&dword_24C8A9000, v8, v9, "Failed to update local domain: failed to remove staging directory: %{public}s", v10, 0xCu);
    uint64_t v14 = v17;
    swift_arrayDestroy();
    MEMORY[0x253300580](v14, -1, -1);
    MEMORY[0x253300580](v10, -1, -1);
  }
  else
  {
    MEMORY[0x2533003E0](v1);
    MEMORY[0x2533003E0](v1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return swift_willThrow();
}

uint64_t sub_24C8BC958(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v8 = sub_24C8F7B10();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2697F8EE8 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_24C8F7C20();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_2697FC1F0);
  sub_24C8BDD98(a1, v13, &qword_2697F9100, &qword_2697F9118, &qword_2697F9110, &qword_2697F9108, (uint64_t (*)(uint64_t))sub_24C8DE90C);
  if (v4)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v3, v8);
    uint64_t v17 = sub_24C8F7AF0();
    os_log_type_t v18 = sub_24C8F7E30();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_24C8A9000, v17, v18, "Failed to update local domain: failed to save files", v19, 2u);
      MEMORY[0x253300580](v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return swift_willThrow();
  }
  else
  {
    if (qword_2697F8EF0 != -1) {
      swift_once();
    }
    uint64_t v14 = __swift_project_value_buffer(v12, (uint64_t)qword_2697FC208);
    sub_24C8BDD98(a2, v14, &qword_2697F90D0, &qword_2697F90F8, &qword_2697F90E0, &qword_2697F90D8, (uint64_t (*)(uint64_t))sub_24C8DEB20);
    if (qword_2697F8EC0 != -1) {
      swift_once();
    }
    uint64_t v15 = __swift_project_value_buffer(v12, (uint64_t)qword_2697FC178);
    return sub_24C8BE588(a3, v15);
  }
}

uint64_t sub_24C8BCC4C()
{
  uint64_t v2 = sub_24C8F7B10();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  os_log_t v43 = (os_log_t)((char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v4);
  uint64_t v46 = (char *)&v42 - v6;
  uint64_t v7 = sub_24C8F7900();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v45 = (char *)&v42 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v42 - v14;
  uint64_t v16 = type metadata accessor for RecordManager();
  uint64_t v17 = __swift_project_boxed_opaque_existential_1((void *)(v0 + *(int *)(v16 + 20)), *(void *)(v0 + *(int *)(v16 + 20) + 24));
  sub_24C8C0A98((uint64_t)v17, (uint64_t)v47);
  __swift_project_boxed_opaque_existential_1(v47, v47[3]);
  if (qword_2697F8EB0 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_24C8F7C20();
  uint64_t v19 = __swift_project_value_buffer(v18, (uint64_t)qword_2697FC148);
  sub_24C8DF938(v19);
  if (!v1) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  }
  uint64_t v44 = v3;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  v47[0] = (uint64_t)v1;
  id v20 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8F20);
  if (swift_dynamicCast())
  {
    MEMORY[0x2533003E0](v1);
    uint64_t v21 = v45;
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v45, v15, v7);
    (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v46, v0, v2);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v21, v7);
    uint64_t v22 = sub_24C8F7AF0();
    os_log_type_t v23 = sub_24C8F7E30();
    BOOL v24 = os_log_type_enabled(v22, v23);
    uint64_t v42 = v2;
    if (!v24)
    {
      unint64_t v28 = *(void (**)(char *, uint64_t))(v8 + 8);
      v28(v11, v7);
      goto LABEL_13;
    }
    os_log_t v43 = v22;
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 67109120;
    sub_24C8C2744((unint64_t *)&qword_2697F8F10, MEMORY[0x263F06080]);
    uint64_t result = sub_24C8F79D0();
    if (result < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
    }
    else
    {
      int v27 = result;
      if (result <= 0x7FFFFFFF)
      {
        unint64_t v28 = *(void (**)(char *, uint64_t))(v8 + 8);
        v28(v11, v7);
        LODWORD(v48) = v27;
        sub_24C8F7E60();
        uint64_t v22 = v43;
        _os_log_impl(&dword_24C8A9000, v43, v23, "Failed to remove staging directory: %{darwin.errno}d", v25, 8u);
        MEMORY[0x253300580](v25, -1, -1);
LABEL_13:

        (*(void (**)(char *, uint64_t))(v44 + 8))(v46, v42);
        uint64_t v41 = v45;
        sub_24C8F78F0();
        swift_willThrow();
        v28(v41, v7);
        return MEMORY[0x2533003E0](v47[0]);
      }
    }
    __break(1u);
  }
  else
  {
    MEMORY[0x2533003E0](v47[0]);
    os_log_t v29 = v43;
    uint64_t v30 = v44;
    (*(void (**)(os_log_t, uint64_t, uint64_t))(v44 + 16))(v43, v0, v2);
    id v31 = v1;
    id v32 = v1;
    os_log_type_t v33 = sub_24C8F7AF0();
    os_log_type_t v34 = sub_24C8F7E30();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v42 = v2;
      uint64_t v37 = v36;
      v47[0] = v36;
      *(_DWORD *)uint64_t v35 = 136446210;
      uint64_t v48 = (uint64_t)v1;
      id v38 = v1;
      uint64_t v39 = sub_24C8F7CB0();
      uint64_t v48 = sub_24C8E22EC(v39, v40, v47);
      sub_24C8F7E60();
      swift_bridgeObjectRelease();
      MEMORY[0x2533003E0](v1);
      MEMORY[0x2533003E0](v1);
      _os_log_impl(&dword_24C8A9000, v33, v34, "Failed to remove staging directory: %{public}s", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253300580](v37, -1, -1);
      MEMORY[0x253300580](v35, -1, -1);

      (*(void (**)(os_log_t, uint64_t))(v30 + 8))(v43, v42);
    }
    else
    {
      MEMORY[0x2533003E0](v1);
      MEMORY[0x2533003E0](v1);

      (*(void (**)(os_log_t, uint64_t))(v30 + 8))(v29, v2);
    }
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24C8BD26C()
{
  uint64_t v2 = sub_24C8F7B10();
  uint64_t v58 = *(void *)(v2 - 8);
  uint64_t v59 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  v53[2] = (char *)v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v53[4] = (char *)v53 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  unint64_t v54 = (char *)v53 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v53 - v9;
  uint64_t v57 = sub_24C8F7900();
  uint64_t v55 = *(void *)(v57 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v57);
  v53[1] = (char *)v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v53[3] = (char *)v53 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v53 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  id v20 = (char *)v53 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  MEMORY[0x270FA5388](v21);
  os_log_type_t v23 = (char *)v53 - v22;
  uint64_t v24 = *(int *)(type metadata accessor for RecordManager() + 20);
  os_log_t v56 = v0;
  uint64_t v25 = (Class *)((char *)&v0->isa + v24);
  uint64_t v26 = __swift_project_boxed_opaque_existential_1((Class *)((char *)&v0->isa + v24), *(uint64_t *)((char *)&v0[3].isa + v24));
  sub_24C8C0A98((uint64_t)v26, (uint64_t)v60);
  __swift_project_boxed_opaque_existential_1(v60, v61);
  if (qword_2697F8EE8 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_24C8F7C20();
  uint64_t v28 = __swift_project_value_buffer(v27, (uint64_t)qword_2697FC1F0);
  sub_24C8DF304(v28);
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
    v60[0] = (uint64_t)v1;
    id v29 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8F20);
    uint64_t v30 = v57;
    if (swift_dynamicCast())
    {
      MEMORY[0x2533003E0](v1);
      uint64_t v31 = v55;
      (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v20, v23, v30);
      uint64_t v32 = v58;
      (*(void (**)(char *, os_log_t, uint64_t))(v58 + 16))(v10, v56, v59);
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v17, v20, v30);
      os_log_type_t v33 = sub_24C8F7AF0();
      int v34 = sub_24C8F7E30();
      if (!os_log_type_enabled(v33, (os_log_type_t)v34))
      {
        id v38 = *(void (**)(char *, uint64_t))(v31 + 8);
        v38(v17, v30);
        goto LABEL_15;
      }
      os_log_t v56 = v33;
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 67109120;
      sub_24C8C2744((unint64_t *)&qword_2697F8F10, MEMORY[0x263F06080]);
      uint64_t result = sub_24C8F79D0();
      if (result < (uint64_t)0xFFFFFFFF80000000)
      {
        __break(1u);
      }
      else
      {
        int v37 = result;
        LODWORD(v54) = v34;
        if (result <= 0x7FFFFFFF)
        {
          id v38 = *(void (**)(char *, uint64_t))(v31 + 8);
          uint64_t v30 = v57;
          v38(v17, v57);
          LODWORD(v62) = v37;
          sub_24C8F7E60();
          os_log_type_t v33 = v56;
          _os_log_impl(&dword_24C8A9000, v56, (os_log_type_t)v54, "Failed to update local domain: failed to create user staging directory: %{darwin.errno}d", v35, 8u);
          MEMORY[0x253300580](v35, -1, -1);
          uint64_t v32 = v58;
LABEL_15:

          (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v59);
          sub_24C8F78F0();
          swift_willThrow();
          v38(v20, v30);
          return MEMORY[0x2533003E0](v60[0]);
        }
      }
      __break(1u);
      __break(1u);
      __break(1u);
    }
    else
    {
      MEMORY[0x2533003E0](v60[0]);
      uint64_t v42 = v58;
      uint64_t v41 = v59;
      os_log_t v43 = v54;
      (*(void (**)(char *, os_log_t, uint64_t))(v58 + 16))(v54, v56, v59);
      id v44 = v1;
      id v45 = v1;
      uint64_t v46 = sub_24C8F7AF0();
      os_log_type_t v47 = sub_24C8F7E30();
      if (os_log_type_enabled(v46, v47))
      {
        uint64_t v48 = (uint8_t *)swift_slowAlloc();
        uint64_t v49 = swift_slowAlloc();
        v60[0] = v49;
        *(_DWORD *)uint64_t v48 = 136446210;
        uint64_t v62 = (uint64_t)v1;
        id v50 = v1;
        uint64_t v51 = sub_24C8F7CB0();
        uint64_t v62 = sub_24C8E22EC(v51, v52, v60);
        sub_24C8F7E60();
        swift_bridgeObjectRelease();
        MEMORY[0x2533003E0](v1);
        MEMORY[0x2533003E0](v1);
        _os_log_impl(&dword_24C8A9000, v46, v47, "Failed to update local domain: failed to create user staging directory: %{public}s", v48, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x253300580](v49, -1, -1);
        MEMORY[0x253300580](v48, -1, -1);

        (*(void (**)(char *, uint64_t))(v42 + 8))(v54, v59);
      }
      else
      {
        MEMORY[0x2533003E0](v1);
        MEMORY[0x2533003E0](v1);

        (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v41);
      }
      return swift_willThrow();
    }
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
    uint64_t v39 = __swift_project_boxed_opaque_existential_1(v25, v25[3]);
    sub_24C8C0A98((uint64_t)v39, (uint64_t)v60);
    __swift_project_boxed_opaque_existential_1(v60, v61);
    if (qword_2697F8EF0 != -1) {
      swift_once();
    }
    uint64_t v40 = __swift_project_value_buffer(v27, (uint64_t)qword_2697FC208);
    sub_24C8DF304(v40);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
  }
  return result;
}

uint64_t sub_24C8BDD98(unint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t *a6, uint64_t (*a7)(uint64_t))
{
  unint64_t v82 = a4;
  uint64_t v83 = a7;
  unint64_t v85 = a6;
  uint64_t v86 = a5;
  uint64_t v80 = (char *)a2;
  uint64_t v9 = sub_24C8F7B10();
  uint64_t v72 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24C8F7C20();
  uint64_t v84 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v67 - v16;
  uint64_t v18 = a3;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v22 = (char *)&v67 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v67 - v23;
  unint64_t v25 = a1;
  uint64_t v26 = v74;
  uint64_t v27 = v81;
  uint64_t result = sub_24C8C027C(v25, (uint64_t)v80, v82, v86);
  if (v27) {
    return result;
  }
  uint64_t v86 = 0;
  unint64_t v82 = v18;
  int v69 = v15;
  uint64_t v70 = v9;
  uint64_t v80 = v17;
  uint64_t v71 = v11;
  int64_t v29 = 0;
  uint64_t v77 = result;
  uint64_t v31 = *(void *)(result + 64);
  result += 64;
  uint64_t v30 = v31;
  uint64_t v73 = result;
  uint64_t v32 = 1 << *(unsigned char *)(result - 32);
  uint64_t v33 = -1;
  if (v32 < 64) {
    uint64_t v33 = ~(-1 << v32);
  }
  unint64_t v34 = v33 & v30;
  uint64_t v35 = v84;
  int64_t v75 = (unint64_t)(v32 + 63) >> 6;
  uint64_t v76 = (void (**)(char *, uint64_t, uint64_t))(v84 + 16);
  uint64_t v78 = (uint64_t (**)(uint64_t, uint64_t))(v84 + 8);
  int v79 = (void (**)(char *, char *, uint64_t))(v84 + 32);
  int64_t v68 = v75 - 1;
  uint64_t v81 = v12;
  uint64_t v36 = v85;
  if ((v33 & v30) == 0) {
    goto LABEL_7;
  }
LABEL_5:
  unint64_t v37 = __clz(__rbit64(v34));
  v34 &= v34 - 1;
  int64_t v38 = v29;
  unint64_t v39 = v37 | (v29 << 6);
LABEL_6:
  uint64_t v40 = v77;
  (*(void (**)(char *, unint64_t, uint64_t))(v35 + 16))(v22, *(void *)(v77 + 48) + *(void *)(v35 + 72) * v39, v12);
  uint64_t v41 = *(void *)(v40 + 56);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(v36);
  *(void *)&v22[*(int *)(v42 + 48)] = *(void *)(v41 + 8 * v39);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v22, 0, 1, v42);
  swift_retain();
  while (1)
  {
    sub_24C8C1F24((uint64_t)v22, (uint64_t)v24, v82);
    uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(v36);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v46 - 8) + 48))(v24, 1, v46) == 1) {
      return swift_release();
    }
    uint64_t v47 = *(int *)(v46 + 48);
    uint64_t v48 = (uint64_t)v80;
    uint64_t v12 = v81;
    (*v79)(v80, v24, v81);
    uint64_t v49 = v86;
    sub_24C8BF410(*(void *)&v24[v47], v48, v83);
    if (v49)
    {
      uint64_t v51 = v70;
      (*(void (**)(char *, uint64_t, uint64_t))(v72 + 16))(v71, v26, v70);
      unint64_t v52 = v69;
      (*v76)(v69, v48, v12);
      unint64_t v53 = v49;
      unint64_t v54 = v49;
      uint64_t v55 = sub_24C8F7AF0();
      os_log_type_t v56 = sub_24C8F7E30();
      int v57 = v56;
      if (os_log_type_enabled(v55, v56))
      {
        uint64_t v58 = swift_slowAlloc();
        uint64_t v86 = (uint64_t *)swift_slowAlloc();
        uint64_t v88 = v86;
        *(_DWORD *)uint64_t v58 = 136446466;
        LODWORD(v85) = v57;
        sub_24C8C2744(&qword_2697F8F18, MEMORY[0x263F8F328]);
        uint64_t v59 = sub_24C8F8180();
        uint64_t v87 = sub_24C8E22EC(v59, v60, (uint64_t *)&v88);
        sub_24C8F7E60();
        swift_bridgeObjectRelease();
        uint64_t v61 = *v78;
        (*v78)((uint64_t)v52, v12);
        *(_WORD *)(v58 + 12) = 2082;
        uint64_t v87 = (uint64_t)v49;
        uint64_t v62 = v49;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8F20);
        uint64_t v63 = sub_24C8F7CB0();
        uint64_t v87 = sub_24C8E22EC(v63, v64, (uint64_t *)&v88);
        uint64_t v12 = v81;
        sub_24C8F7E60();
        swift_bridgeObjectRelease();
        MEMORY[0x2533003E0](v49);
        MEMORY[0x2533003E0](v49);
        _os_log_impl(&dword_24C8A9000, v55, (os_log_type_t)v85, "Failed to save files: failed to save file %{public}s: %{public}s", (uint8_t *)v58, 0x16u);
        uint64_t v65 = v86;
        swift_arrayDestroy();
        MEMORY[0x253300580](v65, -1, -1);
        uint64_t v66 = (uint64_t)v80;
        MEMORY[0x253300580](v58, -1, -1);

        (*(void (**)(char *, uint64_t))(v72 + 8))(v71, v70);
      }
      else
      {
        uint64_t v66 = v48;
        uint64_t v61 = *v78;
        (*v78)((uint64_t)v52, v12);
        MEMORY[0x2533003E0](v49);
        MEMORY[0x2533003E0](v49);

        (*(void (**)(char *, uint64_t))(v72 + 8))(v71, v51);
      }
      swift_willThrow();
      swift_release();
      v61(v66, v12);
      return swift_release();
    }
    uint64_t v86 = 0;
    swift_release();
    uint64_t result = (*v78)(v48, v12);
    uint64_t v35 = v84;
    int64_t v29 = v38;
    uint64_t v36 = v85;
    if (v34) {
      goto LABEL_5;
    }
LABEL_7:
    int64_t v43 = v29 + 1;
    if (__OFADD__(v29, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v43 >= v75)
    {
      int64_t v38 = v29;
      goto LABEL_12;
    }
    unint64_t v44 = *(void *)(v73 + 8 * v43);
    if (v44) {
      goto LABEL_10;
    }
    int64_t v38 = v29 + 2;
    if (v29 + 2 >= v75)
    {
      int64_t v38 = v29 + 1;
      goto LABEL_12;
    }
    unint64_t v44 = *(void *)(v73 + 8 * v38);
    if (v44)
    {
      int64_t v43 = v29 + 2;
LABEL_10:
      unint64_t v34 = (v44 - 1) & v44;
      unint64_t v39 = __clz(__rbit64(v44)) + (v43 << 6);
      int64_t v38 = v43;
      goto LABEL_6;
    }
    if (v29 + 3 < v75) {
      break;
    }
LABEL_12:
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(v36);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v22, 1, 1, v45);
    unint64_t v34 = 0;
  }
  unint64_t v44 = *(void *)(v73 + 8 * (v29 + 3));
  if (v44)
  {
    int64_t v43 = v29 + 3;
    goto LABEL_10;
  }
  uint64_t v50 = v29 + 4;
  if (v29 + 4 >= v75)
  {
    int64_t v38 = v29 + 3;
    goto LABEL_12;
  }
  unint64_t v44 = *(void *)(v73 + 8 * v50);
  if (v44)
  {
    int64_t v43 = v29 + 4;
    goto LABEL_10;
  }
  while (1)
  {
    int64_t v43 = v50 + 1;
    if (__OFADD__(v50, 1)) {
      break;
    }
    if (v43 >= v75)
    {
      int64_t v38 = v68;
      goto LABEL_12;
    }
    unint64_t v44 = *(void *)(v73 + 8 * v43);
    ++v50;
    if (v44) {
      goto LABEL_10;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_24C8BE588(uint64_t a1, uint64_t a2)
{
  uint64_t v92 = a2;
  uint64_t v86 = sub_24C8F7900();
  uint64_t v82 = *(void *)(v86 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v86);
  uint64_t v81 = (char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v84 = (char *)&v75 - v6;
  MEMORY[0x270FA5388](v5);
  unint64_t v85 = (char *)&v75 - v7;
  uint64_t v8 = sub_24C8F7C20();
  uint64_t v89 = *(void *)(v8 - 8);
  uint64_t v90 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v80 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v83 = (char *)&v75 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v75 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v87 = (uint64_t)&v75 - v16;
  uint64_t v17 = sub_24C8F7B10();
  uint64_t v93 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v75 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v75 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v75 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v75 - v27;
  uint64_t v29 = sub_24C8B3B20();
  if (v2)
  {
    uint64_t v31 = v93;
    uint64_t v32 = v28;
    (*(void (**)(char *, uint8_t *, uint64_t))(v93 + 16))(v28, v91, v17);
    uint64_t v34 = v89;
    uint64_t v33 = v90;
    uint64_t v35 = v87;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v89 + 16))(v87, v92, v90);
    id v36 = v2;
    id v37 = v2;
    int64_t v38 = sub_24C8F7AF0();
    os_log_type_t v39 = sub_24C8F7E30();
    int v40 = v39;
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v41 = swift_slowAlloc();
      uint64_t v88 = v17;
      uint64_t v42 = v41;
      uint64_t v92 = swift_slowAlloc();
      uint64_t v95 = v92;
      *(_DWORD *)uint64_t v42 = 136446466;
      sub_24C8C2744(&qword_2697F8F18, MEMORY[0x263F8F328]);
      LODWORD(v91) = v40;
      uint64_t v43 = sub_24C8F8180();
      uint64_t v94 = sub_24C8E22EC(v43, v44, &v95);
      sub_24C8F7E60();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v33);
      *(_WORD *)(v42 + 12) = 2082;
      uint64_t v94 = (uint64_t)v2;
      id v45 = v2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8F20);
      uint64_t v46 = sub_24C8F7CB0();
      uint64_t v94 = sub_24C8E22EC(v46, v47, &v95);
      sub_24C8F7E60();
      swift_bridgeObjectRelease();
      MEMORY[0x2533003E0](v2);
      MEMORY[0x2533003E0](v2);
      _os_log_impl(&dword_24C8A9000, v38, (os_log_type_t)v91, "Failed to save file %{public}s: failed to serialize data: %{public}s", (uint8_t *)v42, 0x16u);
      uint64_t v48 = v92;
      swift_arrayDestroy();
      MEMORY[0x253300580](v48, -1, -1);
      MEMORY[0x253300580](v42, -1, -1);

      (*(void (**)(char *, uint64_t))(v93 + 8))(v32, v88);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v33);
      MEMORY[0x2533003E0](v2);
      MEMORY[0x2533003E0](v2);

      (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v17);
    }
    return swift_willThrow();
  }
  else
  {
    uint64_t v49 = v29;
    uint64_t v50 = v30;
    uint64_t v76 = v15;
    uint64_t v77 = v20;
    uint64_t v78 = v23;
    uint64_t v88 = v17;
    uint64_t v51 = v93;
    uint64_t v52 = type metadata accessor for RecordManager();
    unint64_t v53 = v91;
    unint64_t v54 = __swift_project_boxed_opaque_existential_1(&v91[*(int *)(v52 + 20)], *(void *)&v91[*(int *)(v52 + 20) + 24]);
    __swift_project_boxed_opaque_existential_1(v54, v54[3]);
    sub_24C8AF9E8(v49, (unint64_t)v50);
    uint64_t v55 = v92;
    sub_24C8E0034(v49, v50, v92);
    uint64_t v56 = v49;
    uint64_t v57 = v55;
    uint64_t v58 = v53;
    int v79 = v50;
    uint64_t v86 = 0;
    sub_24C8AFA40(v56, (unint64_t)v50);
    uint64_t v60 = v57;
    uint64_t v61 = v51;
    uint64_t v62 = (uint64_t)v26;
    uint64_t v63 = v88;
    (*(void (**)(char *, uint8_t *, uint64_t))(v51 + 16))(v26, v58, v88);
    uint64_t v64 = v89;
    uint64_t v65 = v90;
    uint64_t v66 = v76;
    (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v76, v60, v90);
    uint64_t v67 = v56;
    int64_t v68 = sub_24C8F7AF0();
    os_log_type_t v69 = sub_24C8F7E20();
    if (os_log_type_enabled(v68, v69))
    {
      uint64_t v87 = v67;
      uint64_t v70 = swift_slowAlloc();
      uint64_t v92 = v62;
      uint64_t v71 = (uint8_t *)v70;
      uint64_t v72 = swift_slowAlloc();
      uint64_t v95 = v72;
      *(_DWORD *)uint64_t v71 = 136446210;
      uint64_t v91 = v71 + 4;
      sub_24C8C2744(&qword_2697F8F18, MEMORY[0x263F8F328]);
      uint64_t v73 = sub_24C8F8180();
      uint64_t v94 = sub_24C8E22EC(v73, v74, &v95);
      sub_24C8F7E60();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v64 + 8))(v66, v65);
      _os_log_impl(&dword_24C8A9000, v68, v69, "Saved file %{public}s", v71, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253300580](v72, -1, -1);
      MEMORY[0x253300580](v71, -1, -1);
      sub_24C8AFA40(v87, (unint64_t)v79);

      return (*(uint64_t (**)(uint64_t, uint64_t))(v93 + 8))(v92, v88);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v64 + 8))(v66, v65);
      sub_24C8AFA40(v67, (unint64_t)v79);

      return (*(uint64_t (**)(uint64_t, uint64_t))(v61 + 8))(v62, v63);
    }
  }
}

uint64_t sub_24C8BF410(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v84 = (char *)a2;
  uint64_t v78 = sub_24C8F7900();
  uint64_t v74 = *(void *)(v78 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v78);
  uint64_t v73 = (char *)v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v75 = (char *)v69 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v77 = (char *)v69 - v9;
  uint64_t v10 = sub_24C8F7C20();
  uint64_t v81 = *(void *)(v10 - 8);
  uint64_t v82 = v10;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v72 = (char *)v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v76 = (char *)v69 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v69 - v16;
  MEMORY[0x270FA5388](v15);
  int v79 = (char *)v69 - v18;
  uint64_t v19 = sub_24C8F7B10();
  uint64_t v85 = *(void *)(v19 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)v69 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)v69 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)v69 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  uint64_t v31 = (char *)v69 - v30;
  uint64_t v32 = a3(v29);
  if (v3)
  {
    uint64_t v34 = v85;
    uint64_t v35 = v31;
    (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v31, v83, v19);
    uint64_t v37 = v81;
    uint64_t v36 = v82;
    int64_t v38 = v79;
    (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v79, v84, v82);
    id v39 = v3;
    id v40 = v3;
    uint64_t v41 = sub_24C8F7AF0();
    os_log_type_t v42 = sub_24C8F7E30();
    int v43 = v42;
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v44 = swift_slowAlloc();
      uint64_t v80 = v19;
      uint64_t v45 = v44;
      uint64_t v84 = (char *)swift_slowAlloc();
      uint64_t v87 = v84;
      *(_DWORD *)uint64_t v45 = 136446466;
      sub_24C8C2744(&qword_2697F8F18, MEMORY[0x263F8F328]);
      LODWORD(v83) = v43;
      uint64_t v46 = sub_24C8F8180();
      uint64_t v86 = sub_24C8E22EC(v46, v47, (uint64_t *)&v87);
      sub_24C8F7E60();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v36);
      *(_WORD *)(v45 + 12) = 2082;
      uint64_t v86 = (uint64_t)v3;
      id v48 = v3;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8F20);
      uint64_t v49 = sub_24C8F7CB0();
      uint64_t v86 = sub_24C8E22EC(v49, v50, (uint64_t *)&v87);
      sub_24C8F7E60();
      swift_bridgeObjectRelease();
      MEMORY[0x2533003E0](v3);
      MEMORY[0x2533003E0](v3);
      _os_log_impl(&dword_24C8A9000, v41, (os_log_type_t)v83, "Failed to save file %{public}s: failed to serialize data: %{public}s", (uint8_t *)v45, 0x16u);
      uint64_t v51 = (uint64_t)v84;
      swift_arrayDestroy();
      MEMORY[0x253300580](v51, -1, -1);
      MEMORY[0x253300580](v45, -1, -1);

      (*(void (**)(char *, uint64_t))(v85 + 8))(v35, v80);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v36);
      MEMORY[0x2533003E0](v3);
      MEMORY[0x2533003E0](v3);

      (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v19);
    }
    return swift_willThrow();
  }
  else
  {
    uint64_t v52 = v32;
    unint64_t v53 = v33;
    v69[1] = v22;
    uint64_t v71 = v25;
    uint64_t v80 = v19;
    uint64_t v54 = type metadata accessor for RecordManager();
    uint64_t v55 = __swift_project_boxed_opaque_existential_1((void *)(v83 + *(int *)(v54 + 20)), *(void *)(v83 + *(int *)(v54 + 20) + 24));
    __swift_project_boxed_opaque_existential_1(v55, v55[3]);
    sub_24C8AF9E8(v52, (unint64_t)v53);
    sub_24C8E0034(v52, v53, (uint64_t)v84);
    unint64_t v56 = (unint64_t)v53;
    int v79 = 0;
    sub_24C8AFA40(v52, (unint64_t)v53);
    uint64_t v58 = v85;
    (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v28, v83, v80);
    uint64_t v60 = v81;
    uint64_t v59 = v82;
    (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v17, v84, v82);
    uint64_t v61 = sub_24C8F7AF0();
    uint64_t v62 = v52;
    os_log_type_t v63 = sub_24C8F7E20();
    if (os_log_type_enabled(v61, v63))
    {
      uint64_t v70 = v62;
      uint64_t v64 = swift_slowAlloc();
      uint64_t v84 = v28;
      uint64_t v65 = (uint8_t *)v64;
      uint64_t v83 = swift_slowAlloc();
      uint64_t v87 = (char *)v83;
      *(_DWORD *)uint64_t v65 = 136446210;
      uint64_t v78 = (uint64_t)(v65 + 4);
      sub_24C8C2744(&qword_2697F8F18, MEMORY[0x263F8F328]);
      uint64_t v66 = sub_24C8F8180();
      uint64_t v86 = sub_24C8E22EC(v66, v67, (uint64_t *)&v87);
      sub_24C8F7E60();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v17, v59);
      _os_log_impl(&dword_24C8A9000, v61, v63, "Saved file %{public}s", v65, 0xCu);
      uint64_t v68 = v83;
      swift_arrayDestroy();
      MEMORY[0x253300580](v68, -1, -1);
      MEMORY[0x253300580](v65, -1, -1);
      sub_24C8AFA40(v70, v56);

      return (*(uint64_t (**)(char *, uint64_t))(v85 + 8))(v84, v80);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v60 + 8))(v17, v59);
      sub_24C8AFA40(v62, v56);

      return (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v28, v80);
    }
  }
}

uint64_t sub_24C8C027C(unint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v75 = a2;
  uint64_t v7 = (uint64_t *)sub_24C8F7900();
  uint64_t v66 = *(v7 - 1);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24C8F7B10();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = (uint8_t *)sub_24C8F7C20();
  uint64_t v68 = *((void *)v76 - 1);
  uint64_t v14 = MEMORY[0x270FA5388](v76);
  os_log_t v78 = (os_log_t)((char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v65 = (char *)&v59 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v74 = (char *)&v59 - v19;
  MEMORY[0x270FA5388](v18);
  unint64_t v21 = (unint64_t)&v59 - v20;
  unint64_t v67 = a4;
  unint64_t v22 = a1;
  uint64_t v23 = (uint64_t *)sub_24C8B9ED0(MEMORY[0x263F8EE78], a3, a4, (uint64_t (*)(char *))sub_24C8C0C48, MEMORY[0x263F8F328]);
  unint64_t v73 = v22;
  if (!(v22 >> 62))
  {
    uint64_t v24 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v24) {
      goto LABEL_3;
    }
LABEL_30:
    swift_bridgeObjectRelease();
    return (uint64_t)v23;
  }
LABEL_29:
  swift_bridgeObjectRetain();
  uint64_t v57 = sub_24C8F8020();
  unint64_t v22 = v73;
  uint64_t v24 = v57;
  if (!v57) {
    goto LABEL_30;
  }
LABEL_3:
  uint64_t v62 = v13;
  uint64_t v59 = v11;
  uint64_t v63 = v10;
  uint64_t v60 = v9;
  uint64_t v61 = v7;
  unint64_t v71 = v21;
  unint64_t v72 = v22 & 0xC000000000000001;
  uint64_t v77 = (char **)(v68 + 16);
  uint64_t v69 = v24;
  uint64_t v70 = (uint64_t *)(v68 + 8);
  uint64_t v10 = 4;
  uint64_t v25 = v76;
  while (1)
  {
    uint64_t v28 = v10 - 4;
    if (v72)
    {
      uint64_t v13 = (char *)MEMORY[0x2532FF870](v10 - 4, v22);
      uint64_t v11 = v10 - 3;
      if (__OFADD__(v28, 1)) {
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v13 = *(char **)(v22 + 8 * v10);
      swift_retain();
      uint64_t v11 = v10 - 3;
      if (__OFADD__(v28, 1))
      {
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
    }
    uint64_t v9 = *v77;
    ((void (*)(char *, uint64_t, uint8_t *))*v77)(v74, v75, v25);
    uint64_t v29 = *((void *)v13 + 5);
    v79[0] = *((void *)v13 + 4);
    v79[1] = v29;
    swift_bridgeObjectRetain();
    sub_24C8F7CF0();
    sub_24C8F7C10();
    if (v23[2])
    {
      sub_24C8C0C48(v21);
      if (v30) {
        break;
      }
    }
    os_log_t v31 = v78;
    ((void (*)(os_log_t, unint64_t, uint8_t *))v9)(v78, v21, v25);
    swift_retain();
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v79[0] = (uint64_t)v23;
    uint64_t v7 = v23;
    unint64_t v21 = sub_24C8C0C48((uint64_t)v31);
    uint64_t v34 = v23[2];
    BOOL v35 = (v33 & 1) == 0;
    uint64_t v36 = v34 + v35;
    if (__OFADD__(v34, v35)) {
      goto LABEL_27;
    }
    char v37 = v33;
    if (v23[3] >= v36)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v7 = v79;
        sub_24C8C1F88(v67);
      }
    }
    else
    {
      sub_24C8C1434(v36, isUniquelyReferenced_nonNull_native, v67);
      uint64_t v7 = (uint64_t *)v79[0];
      unint64_t v38 = sub_24C8C0C48((uint64_t)v78);
      if ((v37 & 1) != (v39 & 1))
      {
        uint64_t result = sub_24C8F8550();
        __break(1u);
        return result;
      }
      unint64_t v21 = v38;
    }
    uint64_t v25 = v76;
    uint64_t v23 = (uint64_t *)v79[0];
    if (v37)
    {
      uint64_t v26 = *(void *)(v79[0] + 56);
      swift_release();
      *(void *)(v26 + 8 * v21) = v13;
    }
    else
    {
      *(void *)(v79[0] + 8 * (v21 >> 6) + 64) |= 1 << v21;
      ((void (*)(unint64_t, os_log_t, uint8_t *))v9)(v23[6] + *(void *)(v68 + 72) * v21, v78, v25);
      *(void *)(v23[7] + 8 * v21) = v13;
      uint64_t v40 = v23[2];
      BOOL v41 = __OFADD__(v40, 1);
      uint64_t v42 = v40 + 1;
      if (v41) {
        goto LABEL_28;
      }
      v23[2] = v42;
    }
    swift_bridgeObjectRelease();
    uint64_t v7 = v70;
    uint64_t v27 = (void (*)(unint64_t, uint8_t *))*v70;
    ((void (*)(os_log_t, uint8_t *))*v70)(v78, v25);
    unint64_t v21 = v71;
    v27(v71, v25);
    swift_release();
    ++v10;
    unint64_t v22 = v73;
    if (v11 == v69) {
      goto LABEL_30;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v43 = v59;
  (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v62, v64, v63);
  uint64_t v44 = v65;
  ((void (*)(char *, unint64_t, uint8_t *))v9)(v65, v21, v25);
  uint64_t v45 = sub_24C8F7AF0();
  os_log_type_t v46 = sub_24C8F7E30();
  unint64_t v47 = v25;
  if (os_log_type_enabled(v45, v46))
  {
    os_log_t v78 = v45;
    id v48 = (uint8_t *)swift_slowAlloc();
    uint64_t v77 = (char **)swift_slowAlloc();
    v79[0] = (uint64_t)v77;
    uint64_t v76 = v48;
    *(_DWORD *)id v48 = 136315138;
    sub_24C8C2744(&qword_2697F8F18, MEMORY[0x263F8F328]);
    uint64_t v49 = sub_24C8F8180();
    v79[4] = sub_24C8E22EC(v49, v50, v79);
    sub_24C8F7E60();
    swift_bridgeObjectRelease();
    uint64_t v51 = (void (*)(unint64_t, uint8_t *))*v70;
    ((void (*)(char *, uint8_t *))*v70)(v44, v47);
    os_log_t v52 = v78;
    unint64_t v53 = v76;
    _os_log_impl(&dword_24C8A9000, v78, v46, "Failed to save files: multiple files collided at %s", v76, 0xCu);
    uint64_t v54 = v77;
    swift_arrayDestroy();
    MEMORY[0x253300580](v54, -1, -1);
    MEMORY[0x253300580](v53, -1, -1);
  }
  else
  {
    uint64_t v51 = (void (*)(unint64_t, uint8_t *))*v70;
    ((void (*)(char *, uint8_t *))*v70)(v44, v47);
  }
  (*(void (**)(char *, uint64_t))(v43 + 8))(v62, v63);
  uint64_t v55 = v61;
  LODWORD(v79[0]) = 17;
  sub_24C8E0F2C(MEMORY[0x263F8EE78]);
  sub_24C8C2744((unint64_t *)&qword_2697F8F10, MEMORY[0x263F06080]);
  unint64_t v56 = v60;
  sub_24C8F79E0();
  sub_24C8F78F0();
  (*(void (**)(char *, uint64_t *))(v66 + 8))(v56, v55);
  swift_willThrow();
  v51(v71, v47);
  swift_bridgeObjectRelease();
  swift_release();
  return (uint64_t)v23;
}

uint64_t sub_24C8C0A98(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_24C8C0AFC(uint64_t a1)
{
  sub_24C8F7AE0();
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x263F07508];
  sub_24C8C2744((unint64_t *)&qword_2697F8F50, MEMORY[0x263F07508]);
  uint64_t v3 = sub_24C8F7C40();
  return sub_24C8C1940(a1, v3, MEMORY[0x263F07508], &qword_2697F9130, v2, MEMORY[0x263F07528]);
}

unint64_t sub_24C8C0BD0(uint64_t a1, uint64_t a2)
{
  sub_24C8F85A0();
  sub_24C8F7CE0();
  uint64_t v4 = sub_24C8F85D0();

  return sub_24C8C185C(a1, a2, v4);
}

unint64_t sub_24C8C0C48(uint64_t a1)
{
  sub_24C8F7C20();
  uint64_t v2 = (void (*)(uint64_t))MEMORY[0x263F8F328];
  sub_24C8C2744(&qword_2697F90E8, MEMORY[0x263F8F328]);
  uint64_t v3 = sub_24C8F7C40();
  return sub_24C8C1940(a1, v3, MEMORY[0x263F8F328], &qword_2697F90F0, v2, MEMORY[0x263F8F338]);
}

uint64_t sub_24C8C0D1C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_24C8F7AE0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9128);
  int v46 = a2;
  uint64_t v10 = sub_24C8F8040();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_39;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  uint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_20;
    }
    if (__OFADD__(v20++, 1)) {
      goto LABEL_41;
    }
    if (v20 >= v41) {
      break;
    }
    uint64_t v25 = v42;
    unint64_t v26 = v42[v20];
    if (!v26)
    {
      int64_t v27 = v20 + 1;
      if (v20 + 1 >= v41)
      {
LABEL_32:
        swift_release();
        uint64_t v3 = v40;
        if ((v46 & 1) == 0) {
          goto LABEL_39;
        }
        goto LABEL_35;
      }
      unint64_t v26 = v42[v27];
      if (!v26)
      {
        while (1)
        {
          int64_t v20 = v27 + 1;
          if (__OFADD__(v27, 1)) {
            break;
          }
          if (v20 >= v41) {
            goto LABEL_32;
          }
          unint64_t v26 = v42[v20];
          ++v27;
          if (v26) {
            goto LABEL_19;
          }
        }
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      ++v20;
    }
LABEL_19:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_20:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
      swift_retain();
    }
    sub_24C8C2744((unint64_t *)&qword_2697F8F50, MEMORY[0x263F07508]);
    uint64_t result = sub_24C8F7C40();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_40;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  uint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_39;
  }
LABEL_35:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v12;
  return result;
}

uint64_t sub_24C8C1128(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9120);
  char v37 = a2;
  uint64_t v6 = sub_24C8F8040();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  char v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_24C8F85A0();
    sub_24C8F7CE0();
    uint64_t result = sub_24C8F85D0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24C8C1434(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v5 = v3;
  uint64_t v7 = sub_24C8F7C20();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  int v48 = a2;
  uint64_t v12 = sub_24C8F8040();
  uint64_t v13 = v11;
  uint64_t v14 = v12;
  if (!*(void *)(v13 + 16)) {
    goto LABEL_41;
  }
  uint64_t v15 = 1 << *(unsigned char *)(v13 + 32);
  uint64_t v16 = *(void *)(v13 + 64);
  uint64_t v44 = (void *)(v13 + 64);
  if (v15 < 64) {
    uint64_t v17 = ~(-1 << v15);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v16;
  uint64_t v42 = v5;
  int64_t v43 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v47 = v8;
  unint64_t v19 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v20 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v22 = 0;
  for (i = v13; ; uint64_t v13 = i)
  {
    if (v18)
    {
      unint64_t v24 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v25 = v24 | (v22 << 6);
      goto LABEL_22;
    }
    int64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v26 >= v43) {
      break;
    }
    BOOL v27 = v44;
    unint64_t v28 = v44[v26];
    ++v22;
    if (!v28)
    {
      int64_t v22 = v26 + 1;
      if (v26 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v28 = v44[v22];
      if (!v28)
      {
        int64_t v29 = v26 + 2;
        if (v29 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v5 = v42;
          if ((v48 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v28 = v44[v29];
        if (!v28)
        {
          while (1)
          {
            int64_t v22 = v29 + 1;
            if (__OFADD__(v29, 1)) {
              goto LABEL_43;
            }
            if (v22 >= v43) {
              goto LABEL_34;
            }
            unint64_t v28 = v44[v22];
            ++v29;
            if (v28) {
              goto LABEL_21;
            }
          }
        }
        int64_t v22 = v29;
      }
    }
LABEL_21:
    unint64_t v18 = (v28 - 1) & v28;
    unint64_t v25 = __clz(__rbit64(v28)) + (v22 << 6);
LABEL_22:
    uint64_t v30 = *(void *)(v47 + 72);
    unint64_t v31 = *(void *)(v13 + 48) + v30 * v25;
    if (v48)
    {
      (*v19)(v10, v31, v7);
      uint64_t v32 = *(void *)(*(void *)(v13 + 56) + 8 * v25);
    }
    else
    {
      (*v45)(v10, v31, v7);
      uint64_t v32 = *(void *)(*(void *)(v13 + 56) + 8 * v25);
      swift_retain();
    }
    sub_24C8C2744(&qword_2697F90E8, MEMORY[0x263F8F328]);
    uint64_t result = sub_24C8F7C40();
    uint64_t v33 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v20 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v34) & ~*(void *)(v20 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v20 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v23 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v20 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v19)(*(void *)(v14 + 48) + v30 * v23, v10, v7);
    *(void *)(*(void *)(v14 + 56) + 8 * v23) = v32;
    ++*(void *)(v14 + 16);
  }
  swift_release();
  uint64_t v5 = v42;
  BOOL v27 = v44;
  if ((v48 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v13 + 32);
  if (v40 >= 64) {
    bzero(v27, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *BOOL v27 = -1 << v40;
  }
  *(void *)(v13 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v5 = v14;
  return result;
}

unint64_t sub_24C8C185C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24C8F8380() & 1) == 0)
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
      while (!v14 && (sub_24C8F8380() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24C8C1940(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4, void (*a5)(uint64_t), uint64_t a6)
{
  unint64_t v24 = a5;
  uint64_t v25 = a6;
  unint64_t v23 = a4;
  v21[1] = a1;
  uint64_t v8 = a3(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  BOOL v11 = (char *)v21 - v10;
  uint64_t v22 = v6;
  uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v13 = a2 & ~v12;
  v21[0] = v6 + 64;
  if ((*(void *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v14 = ~v12;
    uint64_t v17 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    uint64_t v16 = v9 + 16;
    uint64_t v15 = v17;
    uint64_t v18 = *(void *)(v16 + 56);
    do
    {
      v15(v11, *(void *)(v22 + 48) + v18 * v13, v8);
      sub_24C8C2744(v23, v24);
      char v19 = sub_24C8F7C70();
      (*(void (**)(char *, uint64_t))(v16 - 8))(v11, v8);
      if (v19) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v14;
    }
    while (((*(void *)(v21[0] + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

void *sub_24C8C1AE0()
{
  uint64_t v1 = v0;
  uint64_t v28 = sub_24C8F7AE0();
  uint64_t v2 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9128);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_24C8F8030();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_23:
    *uint64_t v1 = v7;
    return result;
  }
  unint64_t v23 = v1;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  uint64_t v14 = v28;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    if (__OFADD__(v10++, 1)) {
      goto LABEL_25;
    }
    if (v10 >= v25)
    {
LABEL_21:
      uint64_t result = (void *)swift_release();
      uint64_t v1 = v23;
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v24 + 8 * v10);
    if (!v21) {
      break;
    }
LABEL_20:
    unint64_t v13 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v10 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v17, v14);
    uint64_t v18 = 8 * v16;
    uint64_t v19 = *(void *)(*(void *)(v5 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v17, v4, v14);
    *(void *)(*(void *)(v7 + 56) + v18) = v19;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v22 = v10 + 1;
  if (v10 + 1 >= v25) {
    goto LABEL_21;
  }
  unint64_t v21 = *(void *)(v24 + 8 * v22);
  if (v21)
  {
    ++v10;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v10 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_21;
    }
    unint64_t v21 = *(void *)(v24 + 8 * v10);
    ++v22;
    if (v21) {
      goto LABEL_20;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

void *sub_24C8C1D74()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9120);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24C8F8030();
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24C8C1F24(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void *sub_24C8C1F88(uint64_t *a1)
{
  uint64_t v3 = sub_24C8F7C20();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v26 = v1;
  uint64_t v7 = *v1;
  uint64_t v8 = sub_24C8F8030();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v26 = v9;
    return result;
  }
  uint64_t result = (void *)(v8 + 64);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11) {
    uint64_t result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  }
  int64_t v13 = 0;
  *(void *)(v9 + 16) = *(void *)(v7 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v7 + 64);
  uint64_t v27 = v7 + 64;
  int64_t v28 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v29 = v4 + 32;
  uint64_t v30 = v4 + 16;
  while (1)
  {
    if (v16)
    {
      unint64_t v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v18 = v17 | (v13 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v28) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v27 + 8 * v22);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v28) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v27 + 8 * v13);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v16 = (v23 - 1) & v23;
    unint64_t v18 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_12:
    unint64_t v19 = *(void *)(v4 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(void *)(v7 + 48) + v19, v3);
    uint64_t v20 = 8 * v18;
    uint64_t v21 = *(void *)(*(void *)(v7 + 56) + 8 * v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(void *)(v9 + 48) + v19, v6, v3);
    *(void *)(*(void *)(v9 + 56) + v20) = v21;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v28) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v27 + 8 * v24);
  if (v23)
  {
    int64_t v13 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v13 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v13 >= v28) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v27 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24C8C221C(void *a1)
{
  return sub_24C8C3EDC(0, a1[2], 0, a1);
}

uint64_t sub_24C8C2230(unint64_t a1)
{
  return sub_24C8C3FEC(0, *(void *)(a1 + 16), 0, a1);
}

void sub_24C8C2248(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24C8F8020();
    swift_bridgeObjectRelease();
  }

  JUMPOUT(0x2532FF880);
}

uint64_t sub_24C8C22C4(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_24C8C3EDC(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v13 = v4[2];
  BOOL v14 = __OFSUB__(v13, a2);
  uint64_t v15 = v13 - a2;
  if (v14) {
    goto LABEL_26;
  }
  if ((v15 & 0x8000000000000000) == 0)
  {
    unint64_t v16 = (char *)&v4[2 * a2 + 4];
    if (a1 != a2 || &v4[2 * a1 + 4] >= (void *)&v16[16 * v15]) {
      uint64_t result = (uint64_t)memmove(&v4[2 * a1 + 4], v16, 16 * v15);
    }
    uint64_t v17 = v4[2];
    BOOL v14 = __OFADD__(v17, v8);
    uint64_t v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(void *)uint64_t v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = sub_24C8F8060();
  __break(1u);
  return result;
}

uint64_t sub_24C8C2430(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = a3;
    uint64_t v3 = a2;
    uint64_t v5 = a1;
    if (!(*v4 >> 62))
    {
      if (*(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_24C8F8020();
  swift_bridgeObjectRelease();
  if (v23 < v3) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v8 = v3 - v5;
  if (__OFSUB__(v3, v5))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v7 = v5 - v3;
  if (__OFSUB__(0, v8))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24C8F8020();
    swift_bridgeObjectRelease();
    uint64_t v10 = v9 + v7;
    if (!__OFADD__(v9, v7)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_24C8F8020();
    swift_bridgeObjectRelease();
    unint64_t v11 = *v4;
    goto LABEL_15;
  }
  if (*v4 >> 62) {
    goto LABEL_36;
  }
  uint64_t v9 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v10 = v9 - v8;
  if (__OFADD__(v9, v7)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v11 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v4 = v11;
  uint64_t v9 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject
    && (v11 & 0x8000000000000000) == 0
    && (v11 & 0x4000000000000000) == 0)
  {
    uint64_t v13 = v11 & 0xFFFFFFFFFFFFFF8;
    if (v10 <= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v9 = 1;
  }
  if (v11 >> 62) {
    goto LABEL_39;
  }
  uint64_t v14 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v14 <= v10) {
    uint64_t v14 = v10;
  }
  swift_bridgeObjectRetain();
  unint64_t *v4 = MEMORY[0x2532FF880](v9, v14, 1, v11);
  swift_bridgeObjectRelease();
  uint64_t v13 = *v4 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  uint64_t v15 = v13 + 32;
  unint64_t v16 = (char *)(v13 + 32 + 8 * v5);
  v6(0);
  swift_arrayDestroy();
  if (v7)
  {
    if (*v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_24C8F8020();
      swift_bridgeObjectRelease();
      uint64_t v18 = v24 - v3;
      if (!__OFSUB__(v24, v3))
      {
LABEL_21:
        if (v18 < 0)
        {
LABEL_46:
          uint64_t result = sub_24C8F8060();
          __break(1u);
          return result;
        }
        unint64_t v19 = (char *)(v15 + 8 * v3);
        if (v5 != v3 || v16 >= &v19[8 * v18]) {
          memmove(v16, v19, 8 * v18);
        }
        if (!(*v4 >> 62))
        {
          uint64_t v20 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v21 = v20 + v7;
          if (!__OFADD__(v20, v7))
          {
LABEL_27:
            *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) = v21;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_24C8F8020();
        swift_bridgeObjectRelease();
        uint64_t v21 = v25 + v7;
        if (!__OFADD__(v25, v7)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v17 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v18 = v17 - v3;
      if (!__OFSUB__(v17, v3)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:

  return sub_24C8F7D60();
}

uint64_t sub_24C8C2744(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24C8C278C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24C8C27F0(uint64_t a1)
{
  return sub_24C8C295C(a1, qword_2697FC0E8);
}

uint64_t sub_24C8C280C()
{
  uint64_t v0 = sub_24C8F7C20();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_2697FC100);
  __swift_project_value_buffer(v0, (uint64_t)qword_2697FC100);
  if (qword_2697F8E90 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2697FC0E8);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_24C8F7C10();
}

uint64_t sub_24C8C2940(uint64_t a1)
{
  return sub_24C8C295C(a1, qword_2697FC118);
}

uint64_t sub_24C8C295C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24C8F7C20();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_24C8F7BF0();
}

uint64_t sub_24C8C29BC()
{
  uint64_t v0 = sub_24C8F7C20();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_2697FC130);
  __swift_project_value_buffer(v0, (uint64_t)qword_2697FC130);
  if (qword_2697F8EA0 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2697FC118);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_24C8F7C10();
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

uint64_t sub_24C8C2B54()
{
  uint64_t v0 = sub_24C8F7C20();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_2697FC148);
  __swift_project_value_buffer(v0, (uint64_t)qword_2697FC148);
  if (qword_2697F8EA0 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2697FC118);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_24C8F7C10();
}

uint64_t sub_24C8C2C98()
{
  uint64_t v0 = sub_24C8F7C20();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_2697FC160);
  __swift_project_value_buffer(v0, (uint64_t)qword_2697FC160);
  if (qword_2697F8E90 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2697FC0E8);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_24C8F7C10();
}

uint64_t sub_24C8C2DD4()
{
  uint64_t v0 = sub_24C8F7C20();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_2697FC178);
  __swift_project_value_buffer(v0, (uint64_t)qword_2697FC178);
  if (qword_2697F8EB0 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2697FC148);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_24C8F7C10();
}

uint64_t sub_24C8C2F10()
{
  uint64_t v0 = sub_24C8F7C20();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_2697FC190);
  __swift_project_value_buffer(v0, (uint64_t)qword_2697FC190);
  if (qword_2697F8E98 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2697FC100);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_24C8F7C10();
}

uint64_t sub_24C8C3044()
{
  uint64_t v0 = sub_24C8F7C20();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_2697FC1A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2697FC1A8);
  if (qword_2697F8E98 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2697FC100);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_24C8F7C10();
}

uint64_t sub_24C8C3178()
{
  uint64_t v0 = sub_24C8F7C20();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_2697FC1C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2697FC1C0);
  if (qword_2697F8EA8 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2697FC130);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_24C8F7C10();
}

uint64_t sub_24C8C32AC()
{
  uint64_t v0 = sub_24C8F7C20();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_2697FC1D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2697FC1D8);
  if (qword_2697F8EA8 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2697FC130);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_24C8F7C10();
}

uint64_t sub_24C8C33E0()
{
  uint64_t v0 = sub_24C8F7C20();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_2697FC1F0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2697FC1F0);
  if (qword_2697F8EB0 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2697FC148);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_24C8F7C10();
}

uint64_t sub_24C8C3514()
{
  uint64_t v0 = sub_24C8F7C20();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_2697FC208);
  __swift_project_value_buffer(v0, (uint64_t)qword_2697FC208);
  if (qword_2697F8EB0 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2697FC148);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_24C8F7C10();
}

uint64_t sub_24C8C3648()
{
  uint64_t v0 = sub_24C8F7C20();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2697F8EB8 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_2697FC160);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  char v5 = sub_24C8AEAB0(v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5 & 1;
}

uint64_t sub_24C8C3990@<X0>(uint64_t a1@<X8>)
{
  v22[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_24C8F7900();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9650);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = &v20[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v22[0] = 37;
  uint64_t v9 = sub_24C8F7D90();
  *(void *)(v9 + 16) = 37;
  *(_OWORD *)(v9 + 48) = 0u;
  *(void *)(v9 + 61) = 0;
  *(_OWORD *)(v9 + 32) = 0u;
  if (sysctlbyname("kern.bootsessionuuid", (void *)(v9 + 32), v22, 0, 0))
  {
    int v10 = MEMORY[0x2532FF520]();
    unint64_t v11 = sub_24C8F7AF0();
    os_log_type_t v12 = sub_24C8F7E30();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 67109120;
      int v21 = v10;
      sub_24C8F7E60();
      _os_log_impl(&dword_24C8A9000, v11, v12, "sysctlbyname(\"kern.bootsessionuuid\") failed: %{darwin.errno}d", v13, 8u);
      MEMORY[0x253300580](v13, -1, -1);
    }

    uint64_t result = sub_24C8F7BB0();
    if ((result & 0x100000000) == 0)
    {
      int v15 = result;
      swift_bridgeObjectRelease();
      int v21 = v15;
      sub_24C8E0F2C(MEMORY[0x263F8EE78]);
      sub_24C8C3E84();
      sub_24C8F79E0();
      sub_24C8F78F0();
      (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
      return swift_willThrow();
    }
    __break(1u);
  }
  else
  {
    uint64_t v16 = swift_bridgeObjectRetain();
    sub_24C8C43A8(v16, v17);
    swift_bridgeObjectRelease();
    sub_24C8F7A80();
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_24C8F7AE0();
    uint64_t v19 = *(void *)(v18 - 8);
    uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v19 + 48))(v8, 1, v18);
    if (result != 1)
    {
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v19 + 32))(a1, v8, v18);
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24C8C3D00()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14SysctlProvider_logger;
  uint64_t v2 = sub_24C8F7B10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24C8C3DA0()
{
  return type metadata accessor for SysctlProvider();
}

uint64_t type metadata accessor for SysctlProvider()
{
  uint64_t result = qword_2697F9140;
  if (!qword_2697F9140) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C8C3DF4()
{
  uint64_t result = sub_24C8F7B10();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_24C8C3E84()
{
  unint64_t result = qword_2697F8F10;
  if (!qword_2697F8F10)
  {
    sub_24C8F7900();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F8F10);
  }
  return result;
}

void *sub_24C8C3EDC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9150);
      int v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      int v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_24C8C42B4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24C8C3FEC(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24C8C4034(a1, a2, a3, a4, &qword_2697F9160, type metadata accessor for User, type metadata accessor for User);
}

uint64_t sub_24C8C4010(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24C8C4034(a1, a2, a3, a4, &qword_2697F9158, MEMORY[0x263F07508], MEMORY[0x263F07508]);
}

uint64_t sub_24C8C4034(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
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
    uint64_t result = sub_24C8F8000();
    __break(1u);
    return result;
  }
  v18[2] = v13;
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
    sub_24C8C43F4(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_24C8C42B4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_24C8F8060();
  __break(1u);
  return result;
}

uint64_t sub_24C8C43A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
LABEL_9:
    __break(1u);
    return MEMORY[0x270F9D6B0](a1, a2);
  }
  uint64_t v3 = a1;
  int v4 = *(unsigned __int8 *)(a1 + 32);
  a1 += 32;
  if (v4)
  {
    a2 = 0;
    uint64_t v5 = v2 - 1;
    uint64_t v6 = v3 + 33;
    while (v5 != a2)
    {
      if (!*(unsigned __int8 *)(v6 + a2++)) {
        return MEMORY[0x270F9D6B0](a1, a2);
      }
    }
    __break(1u);
    goto LABEL_9;
  }
  a2 = 0;
  return MEMORY[0x270F9D6B0](a1, a2);
}

uint64_t sub_24C8C43F4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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
  uint64_t result = sub_24C8F8060();
  __break(1u);
  return result;
}

uint64_t sub_24C8C4550()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid;
  uint64_t v2 = sub_24C8F7AE0();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24C8C4648()
{
  sub_24C8C4550();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24C8C46A0()
{
  return type metadata accessor for UserRecord(0);
}

uint64_t type metadata accessor for UserRecord(uint64_t a1)
{
  return sub_24C8B7B74(a1, (uint64_t *)&unk_2697F9168);
}

uint64_t sub_24C8C46C8()
{
  uint64_t result = sub_24C8F7AE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24C8C4788()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid;
  uint64_t v2 = sub_24C8F7AE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24C8C4858()
{
  return type metadata accessor for GroupRecord(0);
}

uint64_t type metadata accessor for GroupRecord(uint64_t a1)
{
  return sub_24C8B7B74(a1, (uint64_t *)&unk_2697F9178);
}

uint64_t sub_24C8C4880()
{
  uint64_t result = sub_24C8F7AE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24C8C493C(uint64_t a1)
{
  uint64_t v3 = sub_24C8F7AE0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v28 - v8;
  uint64_t v10 = sub_24C8F7900();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + 16) != 3)
  {
    int v39 = 22;
    sub_24C8E0F2C(MEMORY[0x263F8EE78]);
    sub_24C8C3E84();
    sub_24C8F79E0();
    sub_24C8F78F0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    swift_willThrow();
    return a1;
  }
  uint64_t v37 = v1;
  int v38 = *(_DWORD *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v32 = *(void *)(a1 + 32);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v15(v9, a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_uuid, v3);
  uint64_t v16 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_fullName + 8);
  uint64_t v34 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_fullName);
  uint64_t v36 = v16;
  uint64_t v17 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_homeDirectory + 8);
  uint64_t v33 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_homeDirectory);
  uint64_t v35 = v17;
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v15)(v7, a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_primaryGroupUUID, v3);
  uint64_t v19 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases);
  if (v19)
  {
    uint64_t v31 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_memberships);
    uint64_t v20 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_shell + 8);
    uint64_t v29 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_shell);
    uint64_t v30 = v20;
    type metadata accessor for UserRecord(0);
    a1 = swift_allocObject();
    *(_DWORD *)(a1 + 16) = v38;
    *(void *)(a1 + 24) = v32;
    *(void *)(a1 + 32) = v14;
    uint64_t v21 = *(void (**)(uint64_t, char *, uint64_t))(v4 + 32);
    v21(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v9, v3);
    unint64_t v22 = (void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
    uint64_t v23 = v35;
    uint64_t v24 = v36;
    *unint64_t v22 = v34;
    v22[1] = v24;
    uint64_t v25 = (void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
    *uint64_t v25 = v33;
    v25[1] = v23;
    v21(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v7, v3);
    uint64_t v26 = (void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
    uint64_t v27 = v30;
    *uint64_t v26 = v29;
    v26[1] = v27;
    *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships) = v31;
    *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases) = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return a1;
  }
  __break(1u);
  return result;
}

uint64_t sub_24C8C4CF4(uint64_t a1)
{
  uint64_t v2 = sub_24C8F7AE0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v27 - v7;
  int v9 = *(_DWORD *)(a1 + 16);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v33 = *(void *)(a1 + 24);
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v11((char *)&v27 - v7, a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v2);
  uint64_t v12 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
  uint64_t v31 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName + 8);
  uint64_t v32 = v12;
  uint64_t v13 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
  uint64_t v29 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory + 8);
  uint64_t v30 = v13;
  v11(v6, a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v2);
  uint64_t v14 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
  uint64_t v27 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell + 8);
  uint64_t v28 = v14;
  uint64_t v15 = (uint64_t *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships);
  swift_beginAccess();
  uint64_t v16 = *v15;
  uint64_t v17 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
  type metadata accessor for UserRecord(0);
  uint64_t v18 = swift_allocObject();
  *(_DWORD *)(v18 + 16) = v9;
  *(void *)(v18 + 24) = v33;
  *(void *)(v18 + 32) = v10;
  uint64_t v19 = *(void (**)(uint64_t, char *, uint64_t))(v3 + 32);
  v19(v18 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v8, v2);
  uint64_t v20 = (void *)(v18 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
  uint64_t v21 = v31;
  *uint64_t v20 = v32;
  v20[1] = v21;
  unint64_t v22 = (void *)(v18 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
  uint64_t v23 = v29;
  *unint64_t v22 = v30;
  v22[1] = v23;
  v19(v18 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v6, v2);
  uint64_t v24 = (void *)(v18 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
  uint64_t v25 = v27;
  *uint64_t v24 = v28;
  v24[1] = v25;
  *(void *)(v18 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships) = v16;
  *(void *)(v18 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases) = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v18;
}

uint64_t sub_24C8C4F84(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9650);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v45 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v42 - v7;
  uint64_t v9 = sub_24C8F7AE0();
  uint64_t v48 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v54 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  int v46 = (char *)&v42 - v13;
  uint64_t result = MEMORY[0x270FA5388](v12);
  uint64_t v62 = (char *)&v42 - v15;
  os_log_t v52 = a1;
  if ((unint64_t)*a1 >> 62) {
    goto LABEL_36;
  }
  uint64_t v16 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v16)
  {
    unint64_t v17 = 0;
    uint64_t v61 = (void (**)(char *, uint64_t, uint64_t))(v48 + 16);
    uint64_t v18 = *(void *)(a2 + 16);
    uint64_t v57 = (unsigned int (**)(char *, uint64_t, uint64_t))(v48 + 48);
    uint64_t v55 = (void (**)(char *, char *, uint64_t))(v48 + 32);
    uint64_t v59 = (char **)(v48 + 8);
    uint64_t v42 = (void (**)(uint64_t, char *, uint64_t))(v48 + 40);
    uint64_t v58 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v48 + 56);
    unint64_t v47 = (v48 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    long long v44 = xmmword_24C8F98F0;
    unint64_t v43 = 0x800000024C8FC460;
    uint64_t v50 = v18;
    uint64_t v51 = a2;
    uint64_t v49 = v16;
    uint64_t v19 = v54;
    while (v17 != v16)
    {
      uint64_t v22 = *v52;
      BOOL v23 = (*v52 & 0xC000000000000001) == 0;
      unint64_t v53 = v17;
      if (v23)
      {
        if (v17 >= *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_33;
        }
        uint64_t v41 = *(void *)(v22 + 8 * v17 + 32);
        swift_retain();
      }
      else
      {
        uint64_t v41 = MEMORY[0x2532FF870](v17);
      }
      uint64_t v24 = v41 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_uuid;
      swift_beginAccess();
      uint64_t v60 = *v61;
      v60(v62, v24, v9);
      swift_release();
      if (v18)
      {
        uint64_t v25 = v48;
        uint64_t v26 = a2 + ((*(unsigned __int8 *)(v48 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80));
        swift_bridgeObjectRetain();
        uint64_t v56 = *(void *)(v25 + 72);
        uint64_t v27 = v18;
        while (1)
        {
          v60(v8, v26, v9);
          uint64_t v20 = *v58;
          (*v58)(v8, 0, 1, v9);
          uint64_t v28 = *v57;
          if ((*v57)(v8, 1, v9) == 1) {
            break;
          }
          uint64_t v29 = *v55;
          uint64_t v30 = v8;
          (*v55)(v19, v8, v9);
          sub_24C8D2388(&qword_2697F9130, MEMORY[0x263F07508]);
          char v31 = sub_24C8F7C70();
          uint64_t v8 = *v59;
          ((void (*)(char *, uint64_t))*v59)(v19, v9);
          if (v31)
          {
            a2 = v51;
            swift_bridgeObjectRelease();
            ((void (*)(char *, uint64_t))v8)(v62, v9);
            uint64_t v32 = *v52;
            if ((*v52 & 0xC000000000000001) != 0)
            {
              uint64_t v33 = MEMORY[0x2532FF870](v53);
              uint64_t v8 = v30;
            }
            else
            {
              if (v53 >= *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                goto LABEL_34;
              }
              uint64_t v8 = v30;
              uint64_t v33 = *(void *)(v32 + 8 * v53 + 32);
              swift_retain();
            }
            int v34 = *(_DWORD *)(v33 + 16);
            __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91A0);
            uint64_t v35 = swift_allocObject();
            *(_OWORD *)(v35 + 16) = v44;
            *(void *)(v35 + 56) = MEMORY[0x263F8D310];
            *(void *)(v35 + 64) = sub_24C8D0D60();
            *(void *)(v35 + 32) = 0xD00000000000001CLL;
            *(void *)(v35 + 40) = v43;
            *(void *)(v35 + 96) = MEMORY[0x263F8E8F8];
            *(void *)(v35 + 104) = MEMORY[0x263F8E960];
            *(_DWORD *)(v35 + 72) = v34;
            sub_24C8F7CA0();
            uint64_t v36 = v45;
            sub_24C8F7A80();
            swift_bridgeObjectRelease();
            uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v28)(v36, 1, v9);
            if (result == 1) {
              goto LABEL_38;
            }
            v29(v46, v36, v9);
            swift_release();
            uint64_t v37 = v52;
            uint64_t v38 = *v52;
            int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
            *uint64_t v37 = v38;
            unint64_t v21 = v53;
            uint64_t v18 = v50;
            if (!isUniquelyReferenced_nonNull_bridgeObject || v38 < 0 || (v38 & 0x4000000000000000) != 0)
            {
              uint64_t v38 = sub_24C8C2244(v38);
              uint64_t *v52 = v38;
            }
            if (v21 < *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              uint64_t v40 = *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 8 * v21 + 0x20)
                  + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_uuid;
              swift_beginAccess();
              (*v42)(v40, v46, v9);
              swift_endAccess();
              uint64_t result = sub_24C8F7D60();
              goto LABEL_8;
            }
            goto LABEL_35;
          }
          v26 += v56;
          --v27;
          uint64_t v8 = v30;
          if (!v27) {
            goto LABEL_6;
          }
        }
      }
      else
      {
        uint64_t v20 = *v58;
        swift_bridgeObjectRetain();
LABEL_6:
        v20(v8, 1, 1, v9);
      }
      a2 = v51;
      swift_bridgeObjectRelease();
      uint64_t result = ((uint64_t (*)(char *, uint64_t))*v59)(v62, v9);
      unint64_t v21 = v53;
      uint64_t v18 = v50;
LABEL_8:
      unint64_t v17 = v21 + 1;
      uint64_t v16 = v49;
      if (v17 == v49) {
        return result;
      }
    }
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_24C8F8020();
    uint64_t result = swift_bridgeObjectRelease();
    if (v16 < 0)
    {
      __break(1u);
LABEL_38:
      __break(1u);
      return result;
    }
  }
  return result;
}

uint64_t sub_24C8C5648(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9650);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v45 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v42 - v7;
  uint64_t v9 = sub_24C8F7AE0();
  uint64_t v48 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v54 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  int v46 = (char *)&v42 - v13;
  uint64_t result = MEMORY[0x270FA5388](v12);
  uint64_t v62 = (char *)&v42 - v15;
  os_log_t v52 = a1;
  if ((unint64_t)*a1 >> 62) {
    goto LABEL_36;
  }
  uint64_t v16 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v16)
  {
    unint64_t v17 = 0;
    uint64_t v61 = (void (**)(char *, uint64_t, uint64_t))(v48 + 16);
    uint64_t v18 = *(void *)(a2 + 16);
    uint64_t v57 = (unsigned int (**)(char *, uint64_t, uint64_t))(v48 + 48);
    uint64_t v55 = (void (**)(char *, char *, uint64_t))(v48 + 32);
    uint64_t v59 = (char **)(v48 + 8);
    uint64_t v42 = (void (**)(uint64_t, char *, uint64_t))(v48 + 40);
    uint64_t v58 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v48 + 56);
    unint64_t v47 = (v48 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    long long v44 = xmmword_24C8F98F0;
    unint64_t v43 = 0x800000024C8FC440;
    uint64_t v50 = v18;
    uint64_t v51 = a2;
    uint64_t v49 = v16;
    uint64_t v19 = v54;
    while (v17 != v16)
    {
      uint64_t v22 = *v52;
      BOOL v23 = (*v52 & 0xC000000000000001) == 0;
      unint64_t v53 = v17;
      if (v23)
      {
        if (v17 >= *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_33;
        }
        uint64_t v41 = *(void *)(v22 + 8 * v17 + 32);
        swift_retain();
      }
      else
      {
        uint64_t v41 = MEMORY[0x2532FF870](v17);
      }
      uint64_t v24 = v41 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid;
      swift_beginAccess();
      uint64_t v60 = *v61;
      v60(v62, v24, v9);
      swift_release();
      if (v18)
      {
        uint64_t v25 = v48;
        uint64_t v26 = a2 + ((*(unsigned __int8 *)(v48 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80));
        swift_bridgeObjectRetain();
        uint64_t v56 = *(void *)(v25 + 72);
        uint64_t v27 = v18;
        while (1)
        {
          v60(v8, v26, v9);
          uint64_t v20 = *v58;
          (*v58)(v8, 0, 1, v9);
          uint64_t v28 = *v57;
          if ((*v57)(v8, 1, v9) == 1) {
            break;
          }
          uint64_t v29 = *v55;
          uint64_t v30 = v8;
          (*v55)(v19, v8, v9);
          sub_24C8D2388(&qword_2697F9130, MEMORY[0x263F07508]);
          char v31 = sub_24C8F7C70();
          uint64_t v8 = *v59;
          ((void (*)(char *, uint64_t))*v59)(v19, v9);
          if (v31)
          {
            a2 = v51;
            swift_bridgeObjectRelease();
            ((void (*)(char *, uint64_t))v8)(v62, v9);
            uint64_t v32 = *v52;
            if ((*v52 & 0xC000000000000001) != 0)
            {
              uint64_t v33 = MEMORY[0x2532FF870](v53);
              uint64_t v8 = v30;
            }
            else
            {
              if (v53 >= *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                goto LABEL_34;
              }
              uint64_t v8 = v30;
              uint64_t v33 = *(void *)(v32 + 8 * v53 + 32);
              swift_retain();
            }
            int v34 = *(_DWORD *)(v33 + 16);
            __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91A0);
            uint64_t v35 = swift_allocObject();
            *(_OWORD *)(v35 + 16) = v44;
            *(void *)(v35 + 56) = MEMORY[0x263F8D310];
            *(void *)(v35 + 64) = sub_24C8D0D60();
            *(void *)(v35 + 32) = 0xD00000000000001CLL;
            *(void *)(v35 + 40) = v43;
            *(void *)(v35 + 96) = MEMORY[0x263F8E8F8];
            *(void *)(v35 + 104) = MEMORY[0x263F8E960];
            *(_DWORD *)(v35 + 72) = v34;
            sub_24C8F7CA0();
            uint64_t v36 = v45;
            sub_24C8F7A80();
            swift_bridgeObjectRelease();
            uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v28)(v36, 1, v9);
            if (result == 1) {
              goto LABEL_38;
            }
            v29(v46, v36, v9);
            swift_release();
            uint64_t v37 = v52;
            uint64_t v38 = *v52;
            int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
            *uint64_t v37 = v38;
            unint64_t v21 = v53;
            uint64_t v18 = v50;
            if (!isUniquelyReferenced_nonNull_bridgeObject || v38 < 0 || (v38 & 0x4000000000000000) != 0)
            {
              uint64_t v38 = sub_24C8C2244(v38);
              uint64_t *v52 = v38;
            }
            if (v21 < *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              uint64_t v40 = *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 8 * v21 + 0x20)
                  + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid;
              swift_beginAccess();
              (*v42)(v40, v46, v9);
              swift_endAccess();
              uint64_t result = sub_24C8F7D60();
              goto LABEL_8;
            }
            goto LABEL_35;
          }
          v26 += v56;
          --v27;
          uint64_t v8 = v30;
          if (!v27) {
            goto LABEL_6;
          }
        }
      }
      else
      {
        uint64_t v20 = *v58;
        swift_bridgeObjectRetain();
LABEL_6:
        v20(v8, 1, 1, v9);
      }
      a2 = v51;
      swift_bridgeObjectRelease();
      uint64_t result = ((uint64_t (*)(char *, uint64_t))*v59)(v62, v9);
      unint64_t v21 = v53;
      uint64_t v18 = v50;
LABEL_8:
      unint64_t v17 = v21 + 1;
      uint64_t v16 = v49;
      if (v17 == v49) {
        return result;
      }
    }
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_24C8F8020();
    uint64_t result = swift_bridgeObjectRelease();
    if (v16 < 0)
    {
      __break(1u);
LABEL_38:
      __break(1u);
      return result;
    }
  }
  return result;
}

uint64_t sub_24C8C5D0C@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, void (*a8)(char *, uint64_t, uint64_t)@<X7>, unint64_t *a9@<X8>)
{
  uint64_t v81 = a8;
  uint64_t v82 = a7;
  LODWORD(v80) = a6;
  uint64_t v79 = a5;
  unint64_t v86 = a4;
  unint64_t v83 = a2;
  uint64_t v84 = a9;
  uint64_t v12 = type metadata accessor for RecordStore(0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24C8F7AE0();
  uint64_t v85 = *(void *)(v15 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v71 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  unint64_t v21 = (char *)&v71 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v24 = (char *)&v71 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v71 - v25;
  uint64_t v27 = sub_24C8C8544(a1, a3, (void (*)(uint64_t, uint64_t *))sub_24C8C9574);
  if (!v9)
  {
    unint64_t v38 = v27;
    uint64_t v74 = v26;
    uint64_t v75 = v14;
    uint64_t v39 = v82;
    unint64_t v72 = v18;
    unint64_t v73 = v24;
    unint64_t v77 = a3;
    os_log_t v78 = v21;
    uint64_t v76 = v15;
    unint64_t v40 = sub_24C8C8544(v83, v86, (void (*)(uint64_t, uint64_t *))sub_24C8C9180);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_24C8D0410(v38);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24C8C8744(v41, v40);
    unint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v85 + 16);
    uint64_t v44 = (uint64_t)v74;
    unint64_t v83 = v85 + 16;
    uint64_t v81 = v43;
    v43(v74, v79, v76);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v45 = (uint64_t *)v84;
    sub_24C8C71D0(v41, v40, v44, v84);
    uint64_t v46 = (uint64_t)v75;
    sub_24C8D2320((uint64_t)v45, (uint64_t)v75, type metadata accessor for RecordStore);
    sub_24C8CB1F8(v45 + 3, v41);
    sub_24C8D1BC8(v46, type metadata accessor for RecordStore);
    sub_24C8D2320((uint64_t)v45, v46, type metadata accessor for RecordStore);
    sub_24C8CB4BC(v45 + 6, v40);
    sub_24C8D1BC8(v46, type metadata accessor for RecordStore);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v47 = v77;
    unint64_t v48 = v86;
    uint64_t result = sub_24C8D059C(v77, v86, v39);
    if ((v80 & 1) == 0) {
      return result;
    }
    if (v47 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v49 = sub_24C8F8020();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v49 = *(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v50 = v78;
    uint64_t v51 = MEMORY[0x263F8EE78];
    if (v49)
    {
      uint64_t v88 = MEMORY[0x263F8EE78];
      uint64_t result = sub_24C8CBE2C(0, v49 & ~(v49 >> 63), 0);
      if (v49 < 0)
      {
        __break(1u);
        goto LABEL_41;
      }
      uint64_t v51 = v88;
      uint64_t v52 = v76;
      uint64_t v53 = v85;
      uint64_t v54 = v73;
      if ((v47 & 0xC000000000000001) != 0)
      {
        uint64_t v55 = 0;
        uint64_t v82 = v85 + 32;
        do
        {
          uint64_t v56 = MEMORY[0x2532FF870](v55, v77);
          v81(v54, v56 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v52);
          swift_unknownObjectRelease();
          uint64_t v88 = v51;
          unint64_t v58 = *(void *)(v51 + 16);
          unint64_t v57 = *(void *)(v51 + 24);
          if (v58 >= v57 >> 1)
          {
            sub_24C8CBE2C(v57 > 1, v58 + 1, 1);
            uint64_t v51 = v88;
          }
          ++v55;
          *(void *)(v51 + 16) = v58 + 1;
          (*(void (**)(unint64_t, char *, uint64_t))(v85 + 32))(v51+ ((*(unsigned __int8 *)(v85 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80))+ *(void *)(v85 + 72) * v58, v54, v52);
        }
        while (v49 != v55);
      }
      else
      {
        uint64_t v59 = (void *)(v47 + 32);
        uint64_t v82 = v85 + 32;
        uint64_t v60 = v72;
        do
        {
          v81(v60, *v59 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v52);
          uint64_t v88 = v51;
          unint64_t v62 = *(void *)(v51 + 16);
          unint64_t v61 = *(void *)(v51 + 24);
          if (v62 >= v61 >> 1)
          {
            sub_24C8CBE2C(v61 > 1, v62 + 1, 1);
            uint64_t v53 = v85;
            uint64_t v51 = v88;
          }
          *(void *)(v51 + 16) = v62 + 1;
          (*(void (**)(unint64_t, char *, uint64_t))(v53 + 32))(v51+ ((*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80))+ *(void *)(v53 + 72) * v62, v60, v52);
          ++v59;
          --v49;
        }
        while (v49);
      }
      uint64_t v45 = (uint64_t *)v84;
      unint64_t v48 = v86;
      uint64_t v50 = v78;
    }
    if (v48 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v63 = sub_24C8F8020();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v63 = *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v64 = MEMORY[0x263F8EE78];
    uint64_t v65 = v76;
    if (!v63)
    {
LABEL_37:
      sub_24C8C4F84(v45, v51);
      sub_24C8C5648(v45 + 1, v64);
      sub_24C8B67F8();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    uint64_t v88 = MEMORY[0x263F8EE78];
    uint64_t result = sub_24C8CBE2C(0, v63 & ~(v63 >> 63), 0);
    uint64_t v82 = v63;
    if ((v63 & 0x8000000000000000) == 0)
    {
      uint64_t v66 = 0;
      uint64_t v64 = v88;
      uint64_t v67 = v85;
      unint64_t v80 = v86 & 0xC000000000000001;
      do
      {
        if (v80)
        {
          uint64_t v68 = MEMORY[0x2532FF870](v66, v86);
          v81(v50, v68 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v65);
          uint64_t v67 = v85;
          swift_unknownObjectRelease();
        }
        else
        {
          v81(v50, *(void *)(v86 + 8 * v66 + 32) + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v65);
        }
        uint64_t v88 = v64;
        unint64_t v70 = *(void *)(v64 + 16);
        unint64_t v69 = *(void *)(v64 + 24);
        if (v70 >= v69 >> 1)
        {
          sub_24C8CBE2C(v69 > 1, v70 + 1, 1);
          uint64_t v67 = v85;
          uint64_t v64 = v88;
        }
        ++v66;
        *(void *)(v64 + 16) = v70 + 1;
        uint64_t v50 = v78;
        (*(void (**)(unint64_t, char *, uint64_t))(v67 + 32))(v64+ ((*(unsigned __int8 *)(v67 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80))+ *(void *)(v67 + 72) * v70, v78, v65);
        uint64_t v45 = (uint64_t *)v84;
      }
      while (v82 != v66);
      goto LABEL_37;
    }
LABEL_41:
    __break(1u);
    return result;
  }
  if (qword_2697F8EF8 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_24C8F7B10();
  __swift_project_value_buffer(v28, (uint64_t)qword_2697F9188);
  id v29 = v9;
  id v30 = v9;
  char v31 = sub_24C8F7AF0();
  os_log_type_t v32 = sub_24C8F7E30();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v88 = v34;
    *(_DWORD *)uint64_t v33 = 136446210;
    uint64_t v87 = (uint64_t)v9;
    id v35 = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8F20);
    uint64_t v36 = sub_24C8F7CB0();
    uint64_t v87 = sub_24C8E22EC(v36, v37, &v88);
    sub_24C8F7E60();
    swift_bridgeObjectRelease();
    MEMORY[0x2533003E0](v9);
    MEMORY[0x2533003E0](v9);
    _os_log_impl(&dword_24C8A9000, v31, v32, "Failed to build record store: failed to merge system and local users: %{public}s", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253300580](v34, -1, -1);
    MEMORY[0x253300580](v33, -1, -1);
  }
  else
  {
    MEMORY[0x2533003E0](v9);
    MEMORY[0x2533003E0](v9);
  }

  return swift_willThrow();
}

uint64_t sub_24C8C6854()
{
  uint64_t v0 = sub_24C8F7B10();
  __swift_allocate_value_buffer(v0, qword_2697F9188);
  __swift_project_value_buffer(v0, (uint64_t)qword_2697F9188);
  return sub_24C8F7B00();
}

unint64_t sub_24C8C68D8()
{
  uint64_t v1 = v0;
  uint64_t v45 = sub_24C8F7AE0();
  uint64_t v2 = *(void *)(v45 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v45);
  uint64_t v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)&v39 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v44 = (char *)&v39 - v9;
  uint64_t v10 = type metadata accessor for RecordStoreBuilderError();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C8D2320(v1, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for RecordStoreBuilderError);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      unint64_t v47 = 0;
      unint64_t v48 = 0xE000000000000000;
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      unint64_t v47 = 0xD00000000000001CLL;
      unint64_t v48 = 0x800000024C8FC5D0;
      sub_24C8F7CF0();
      goto LABEL_4;
    case 2u:
      uint64_t v16 = v44;
      uint64_t v15 = v45;
      (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v44, v12, v45);
      unint64_t v47 = 0;
      unint64_t v48 = 0xE000000000000000;
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      unint64_t v47 = 0xD00000000000001CLL;
      unint64_t v48 = 0x800000024C8FC5B0;
      sub_24C8D2388(&qword_2697F9210, MEMORY[0x263F07508]);
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    case 3u:
    case 4u:
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91C8);
      uint64_t v16 = v44;
      uint64_t v15 = v45;
      (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v44, &v12[*(int *)(v17 + 48)], v45);
      unint64_t v47 = 0;
      unint64_t v48 = 0xE000000000000000;
      sub_24C8F7F00();
      sub_24C8F7CF0();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      sub_24C8F7CF0();
      sub_24C8D2388(&qword_2697F9210, MEMORY[0x263F07508]);
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      sub_24C8F7CF0();
LABEL_7:
      unint64_t v14 = v47;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v16, v15);
      break;
    case 5u:
      uint64_t v18 = &v12[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F91D0) + 48)];
      uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v2 + 32);
      unint64_t v21 = v44;
      uint64_t v20 = v45;
      v19(v44, v12, v45);
      v19(v8, v18, v20);
      unint64_t v47 = 0;
      unint64_t v48 = 0xE000000000000000;
      sub_24C8F7F00();
      sub_24C8F7CF0();
      sub_24C8D2388(&qword_2697F9210, MEMORY[0x263F07508]);
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      sub_24C8F7CF0();
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      sub_24C8F7CF0();
      unint64_t v14 = v47;
      uint64_t v22 = *(void (**)(char *, uint64_t))(v2 + 8);
      v22(v8, v20);
      v22(v21, v20);
      break;
    case 6u:
      uint64_t v23 = *(void *)&v12[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F91D8) + 48)];
      (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v5, v12, v45);
      unint64_t v47 = 0;
      unint64_t v48 = 0xE000000000000000;
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      unint64_t v47 = 0xD000000000000017;
      unint64_t v48 = 0x800000024C8FC4F0;
      sub_24C8D2388(&qword_2697F9210, MEMORY[0x263F07508]);
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      sub_24C8F7CF0();
      int64_t v24 = *(void *)(v23 + 16);
      if (v24)
      {
        unint64_t v40 = v5;
        uint64_t v46 = MEMORY[0x263F8EE78];
        sub_24C8CBE0C(0, v24, 0);
        unint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
        uint64_t v25 = *(unsigned __int8 *)(v2 + 80);
        uint64_t v39 = v23;
        uint64_t v26 = v23 + ((v25 + 32) & ~v25);
        uint64_t v27 = *(void *)(v2 + 72);
        uint64_t v41 = v2;
        uint64_t v42 = v27;
        uint64_t v28 = (void (**)(char *, uint64_t))(v2 + 8);
        do
        {
          id v29 = v44;
          uint64_t v30 = v45;
          v43(v44, v26, v45);
          uint64_t v31 = sub_24C8F7A90();
          uint64_t v33 = v32;
          (*v28)(v29, v30);
          uint64_t v34 = v46;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_24C8CBE0C(0, *(void *)(v34 + 16) + 1, 1);
            uint64_t v34 = v46;
          }
          unint64_t v36 = *(void *)(v34 + 16);
          unint64_t v35 = *(void *)(v34 + 24);
          if (v36 >= v35 >> 1)
          {
            sub_24C8CBE0C(v35 > 1, v36 + 1, 1);
            uint64_t v34 = v46;
          }
          *(void *)(v34 + 16) = v36 + 1;
          uint64_t v37 = v34 + 16 * v36;
          *(void *)(v37 + 32) = v31;
          *(void *)(v37 + 40) = v33;
          v26 += v42;
          --v24;
        }
        while (v24);
        swift_bridgeObjectRelease();
        uint64_t v5 = v40;
        uint64_t v2 = v41;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v34 = MEMORY[0x263F8EE78];
      }
      uint64_t v46 = v34;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9028);
      sub_24C8D23D0();
      sub_24C8F7C60();
      swift_bridgeObjectRelease();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      unint64_t v14 = v47;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v45);
      break;
    default:
      int v13 = *(_DWORD *)v12;
      unint64_t v47 = 0;
      unint64_t v48 = 0xE000000000000000;
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      unint64_t v47 = 0xD00000000000001ALL;
      unint64_t v48 = 0x800000024C8FC5F0;
      LODWORD(v46) = v13;
      sub_24C8F8180();
      sub_24C8F7CF0();
LABEL_4:
      swift_bridgeObjectRelease();
      unint64_t v14 = v47;
      break;
  }
  return v14;
}

uint64_t sub_24C8C71D0@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v44 = a4;
  uint64_t isUniquelyReferenced_nonNull_native = sub_24C8F7AE0();
  uint64_t v45 = *(void *)(isUniquelyReferenced_nonNull_native - 8);
  uint64_t v8 = MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native);
  unint64_t v43 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v50 = (uint64_t)&v39 - v10;
  uint64_t v11 = (void *)sub_24C8B9D80(MEMORY[0x263F8EE78]);
  if (a2 >> 62) {
    goto LABEL_24;
  }
  uint64_t v12 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v12)
  {
    unint64_t v40 = a1;
    uint64_t v41 = a3;
    unint64_t v48 = a2 & 0xC000000000000001;
    uint64_t v49 = (void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16);
    unint64_t v46 = a2;
    unint64_t v47 = (void (**)(uint64_t, uint64_t))(v45 + 8);
    uint64_t v13 = 4;
    while (1)
    {
      uint64_t v14 = v13 - 4;
      if (!v48) {
        break;
      }
      uint64_t v15 = MEMORY[0x2532FF870](v13 - 4, a2);
      uint64_t v16 = v13 - 3;
      if (__OFADD__(v14, 1)) {
        goto LABEL_21;
      }
LABEL_11:
      a1 = v15;
      uint64_t v17 = v50;
      uint64_t v18 = *v49;
      a3 = isUniquelyReferenced_nonNull_native;
      (*v49)(v50, v15 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, isUniquelyReferenced_nonNull_native);
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v51 = v11;
      a2 = sub_24C8C0AFC(v17);
      uint64_t v20 = v11[2];
      BOOL v21 = (v19 & 1) == 0;
      uint64_t v22 = v20 + v21;
      if (__OFADD__(v20, v21)) {
        goto LABEL_22;
      }
      char v23 = v19;
      if (v11[3] >= v22)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_24C8C1AE0();
        }
      }
      else
      {
        sub_24C8C0D1C(v22, isUniquelyReferenced_nonNull_native);
        unint64_t v24 = sub_24C8C0AFC(v50);
        if ((v23 & 1) != (v25 & 1)) {
          goto LABEL_37;
        }
        a2 = v24;
      }
      uint64_t isUniquelyReferenced_nonNull_native = a3;
      uint64_t v11 = v51;
      if (v23)
      {
        *(void *)(v51[7] + 8 * a2) = a1;
        swift_release();
      }
      else
      {
        v51[(a2 >> 6) + 8] |= 1 << a2;
        v18(v11[6] + *(void *)(v45 + 72) * a2, v50, a3);
        *(void *)(v11[7] + 8 * a2) = a1;
        uint64_t v26 = v11[2];
        BOOL v27 = __OFADD__(v26, 1);
        uint64_t v28 = v26 + 1;
        if (v27) {
          goto LABEL_23;
        }
        v11[2] = v28;
      }
      swift_bridgeObjectRelease();
      (*v47)(v50, a3);
      ++v13;
      a2 = v46;
      if (v16 == v12)
      {
        swift_bridgeObjectRelease();
        a1 = v40;
        a3 = v41;
        goto LABEL_26;
      }
    }
    uint64_t v15 = swift_retain();
    uint64_t v16 = v13 - 3;
    if (!__OFADD__(v14, 1)) {
      goto LABEL_11;
    }
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    swift_bridgeObjectRetain_n();
    uint64_t v12 = sub_24C8F8020();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
LABEL_26:
  uint64_t v42 = isUniquelyReferenced_nonNull_native;
  swift_bridgeObjectRetain();
  unint64_t v29 = sub_24C8CFB1C(a1, (uint64_t)v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v30 = sub_24C8D00B4(a2, (uint64_t)v11, a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  if (!(v30 >> 62))
  {
    uint64_t v31 = *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v31) {
      goto LABEL_28;
    }
LABEL_35:
    swift_bridgeObjectRelease();
    uint64_t v35 = v45;
    uint64_t v36 = v42;
    uint64_t v37 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v43, a3, v42);
    sub_24C8B5E24(v29, v30, v37, v44);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v35 + 8))(a3, v36);
  }
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_24C8F8020();
  if (!v31) {
    goto LABEL_35;
  }
LABEL_28:
  if (v31 >= 1)
  {
    uint64_t v32 = 0;
    do
    {
      if ((v30 & 0xC000000000000001) != 0)
      {
        uint64_t v33 = MEMORY[0x2532FF870](v32, v30);
      }
      else
      {
        uint64_t v33 = *(void *)(v30 + 8 * v32 + 32);
        swift_retain();
      }
      ++v32;
      uint64_t v34 = (void **)(v33 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_memberNames);
      swift_beginAccess();
      sub_24C8CC3F4(v34);
      swift_endAccess();
      swift_release();
    }
    while (v31 != v32);
    goto LABEL_35;
  }
  __break(1u);
LABEL_37:
  uint64_t result = sub_24C8F8550();
  __break(1u);
  return result;
}

unint64_t sub_24C8C76A0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v33 = a3;
  uint64_t v5 = sub_24C8F7AE0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = *a1;
  int v29 = *(_DWORD *)(*a1 + 16);
  uint64_t v28 = *(void *)(v10 + 24);
  uint64_t v34 = *(void *)(v10 + 32);
  uint64_t v11 = *(void (**)(void))(v6 + 16);
  unint64_t v30 = (char *)&v27 - v12;
  v11();
  uint64_t v13 = *(void *)(v10 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName + 8);
  uint64_t v32 = *(void *)(v10 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
  uint64_t v14 = *(void *)(v10 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory + 8);
  uint64_t v31 = *(void *)(v10 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
  unint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v11)(v9, v10 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v5);
  if (*(void *)(a2 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_24C8C0AFC((uint64_t)v9);
    if (v16)
    {
      uint64_t v17 = *(void *)(*(void *)(a2 + 56) + 8 * result);
      uint64_t v18 = *(void (**)(char *, uint64_t))(v6 + 8);
      swift_retain();
      v18(v9, v5);
      LODWORD(v18) = *(_DWORD *)(v17 + 32);
      swift_release();
      uint64_t v19 = v10 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell;
      uint64_t v21 = *(void *)(v10 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
      uint64_t v20 = *(void *)(v19 + 8);
      type metadata accessor for RecordStore.UserStoreRecord(0);
      uint64_t v22 = swift_allocObject();
      *(unsigned char *)(v22 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_isMutable) = 0;
      *(_DWORD *)(v22 + 16) = v29;
      uint64_t v23 = v34;
      *(void *)(v22 + 24) = v28;
      *(void *)(v22 + 32) = v23;
      (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v22 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_uuid, v30, v5);
      unint64_t v24 = (void *)(v22 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_fullName);
      *unint64_t v24 = v32;
      v24[1] = v13;
      char v25 = (void *)(v22 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_homeDirectory);
      *char v25 = v31;
      v25[1] = v14;
      *(_DWORD *)(v22 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_primaryGroupID) = v18;
      uint64_t v26 = (void *)(v22 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_shell);
      *uint64_t v26 = v21;
      v26[1] = v20;
      uint64_t *v33 = v22;
      return swift_bridgeObjectRetain();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24C8C7970(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C8F7AE0();
  uint64_t v59 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9650);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  unint64_t v12 = swift_bridgeObjectRetain();
  unint64_t v13 = sub_24C8CFC8C(v12, a1);
  uint64_t v52 = a3;
  swift_bridgeObjectRelease();
  swift_release();
  if (v13 >> 62)
  {
    uint64_t v14 = sub_24C8F8020();
    unint64_t v57 = v11;
    uint64_t v58 = a2;
    if (v14) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v17 = MEMORY[0x263F8EE78];
    goto LABEL_14;
  }
  uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  unint64_t v57 = v11;
  uint64_t v58 = a2;
  if (!v14) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v60 = MEMORY[0x263F8EE78];
  uint64_t result = sub_24C8CBE0C(0, v14 & ~(v14 >> 63), 0);
  if (v14 < 0) {
    goto LABEL_46;
  }
  uint64_t v55 = a1;
  uint64_t v56 = (void (**)(char *, uint64_t, uint64_t, uint64_t))v8;
  uint64_t v16 = 0;
  uint64_t v17 = v60;
  unint64_t v18 = v13 & 0xC000000000000001;
  unint64_t v19 = v13;
  uint64_t v20 = v14;
  do
  {
    if (v18)
    {
      uint64_t v21 = MEMORY[0x2532FF870](v16, v13);
    }
    else
    {
      uint64_t v21 = *(void *)(v13 + 8 * v16 + 32);
      swift_retain();
    }
    uint64_t v23 = *(void *)(v21 + 24);
    uint64_t v22 = *(void *)(v21 + 32);
    swift_bridgeObjectRetain();
    swift_release();
    uint64_t v60 = v17;
    unint64_t v25 = *(void *)(v17 + 16);
    unint64_t v24 = *(void *)(v17 + 24);
    if (v25 >= v24 >> 1)
    {
      sub_24C8CBE0C(v24 > 1, v25 + 1, 1);
      uint64_t v17 = v60;
    }
    ++v16;
    *(void *)(v17 + 16) = v25 + 1;
    uint64_t v26 = v17 + 16 * v25;
    *(void *)(v26 + 32) = v23;
    *(void *)(v26 + 40) = v22;
    unint64_t v13 = v19;
  }
  while (v20 != v16);
  swift_bridgeObjectRelease();
  a1 = v55;
  uint64_t v8 = (char *)v56;
LABEL_14:
  uint64_t v49 = sub_24C8D001C(v17);
  swift_bridgeObjectRelease();
  uint64_t v27 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups);
  uint64_t v28 = *(void *)(v27 + 56);
  uint64_t v50 = v27 + 56;
  uint64_t v29 = 1 << *(unsigned char *)(v27 + 32);
  uint64_t v30 = -1;
  if (v29 < 64) {
    uint64_t v30 = ~(-1 << v29);
  }
  unint64_t v31 = v30 & v28;
  int64_t v51 = (unint64_t)(v29 + 63) >> 6;
  uint64_t v60 = MEMORY[0x263F8EE88];
  uint64_t v55 = v59 + 16;
  uint64_t v56 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v59 + 56);
  uint64_t v53 = (uint64_t (**)(char *, char *, uint64_t))(v59 + 32);
  uint64_t v54 = v59 + 48;
  uint64_t v32 = (uint64_t (**)(char *, uint64_t))(v59 + 8);
  uint64_t v33 = v27;
  uint64_t result = swift_bridgeObjectRetain_n();
  int64_t v34 = 0;
  if (!v31) {
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v35 = __clz(__rbit64(v31));
  v31 &= v31 - 1;
  unint64_t v36 = v35 | (v34 << 6);
  unint64_t v38 = v57;
  uint64_t v37 = v58;
  while (1)
  {
    uint64_t v42 = v59;
    (*(void (**)(char *, unint64_t, uint64_t))(v59 + 16))(v38, *(void *)(v33 + 48) + *(void *)(v59 + 72) * v36, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v38, 0, 1, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v38, 1, v6) == 1) {
      goto LABEL_42;
    }
    uint64_t result = (*v53)(v8, v38, v6);
    if (!*(void *)(v37 + 16)) {
      break;
    }
    uint64_t result = sub_24C8C0AFC((uint64_t)v8);
    if ((v43 & 1) == 0) {
      goto LABEL_44;
    }
    uint64_t v44 = swift_retain();
    uint64_t v45 = v8;
    uint64_t v46 = sub_24C8C7970(v44, v37, v52);
    swift_release();
    uint64_t v47 = v46;
    uint64_t v8 = v45;
    sub_24C8C8244(v47);
    uint64_t result = (*v32)(v45, v6);
    if (v31) {
      goto LABEL_17;
    }
LABEL_18:
    int64_t v39 = v34 + 1;
    uint64_t v37 = v58;
    if (__OFADD__(v34, 1)) {
      goto LABEL_45;
    }
    unint64_t v38 = v57;
    if (v39 >= v51) {
      goto LABEL_41;
    }
    unint64_t v40 = *(void *)(v50 + 8 * v39);
    ++v34;
    if (!v40)
    {
      int64_t v34 = v39 + 1;
      if (v39 + 1 >= v51) {
        goto LABEL_41;
      }
      unint64_t v40 = *(void *)(v50 + 8 * v34);
      if (!v40)
      {
        int64_t v34 = v39 + 2;
        if (v39 + 2 >= v51) {
          goto LABEL_41;
        }
        unint64_t v40 = *(void *)(v50 + 8 * v34);
        if (!v40)
        {
          int64_t v34 = v39 + 3;
          if (v39 + 3 >= v51) {
            goto LABEL_41;
          }
          unint64_t v40 = *(void *)(v50 + 8 * v34);
          if (!v40)
          {
            int64_t v34 = v39 + 4;
            if (v39 + 4 >= v51) {
              goto LABEL_41;
            }
            unint64_t v40 = *(void *)(v50 + 8 * v34);
            if (!v40)
            {
              int64_t v41 = v39 + 5;
              if (v41 >= v51)
              {
LABEL_41:
                (*v56)(v57, 1, 1, v6);
LABEL_42:
                swift_release();
                swift_bridgeObjectRelease();
                return sub_24C8C83C4(v60, v49);
              }
              unint64_t v40 = *(void *)(v50 + 8 * v41);
              if (!v40)
              {
                while (1)
                {
                  int64_t v34 = v41 + 1;
                  if (__OFADD__(v41, 1)) {
                    goto LABEL_47;
                  }
                  if (v34 >= v51) {
                    goto LABEL_41;
                  }
                  unint64_t v40 = *(void *)(v50 + 8 * v34);
                  ++v41;
                  if (v40) {
                    goto LABEL_35;
                  }
                }
              }
              int64_t v34 = v41;
            }
          }
        }
      }
    }
LABEL_35:
    unint64_t v31 = (v40 - 1) & v40;
    unint64_t v36 = __clz(__rbit64(v40)) + (v34 << 6);
  }
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
  return result;
}

uint64_t sub_24C8C7EE4(uint64_t a1)
{
  uint64_t v2 = sub_24C8F7AE0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v25 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9650);
  uint64_t result = MEMORY[0x270FA5388](v9 - 8);
  unint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v13 = 0;
  uint64_t v30 = a1;
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v15 = a1 + 56;
  uint64_t v14 = v16;
  uint64_t v17 = 1 << *(unsigned char *)(v15 - 24);
  uint64_t v18 = -1;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  unint64_t v19 = v18 & v14;
  uint64_t v25 = v15;
  int64_t v26 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v28 = v3 + 16;
  uint64_t v29 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
  uint64_t v27 = v3 + 48;
  if ((v18 & v14) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v20 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  for (unint64_t i = v20 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v23)) + (v13 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v12, *(void *)(v30 + 48) + *(void *)(v3 + 72) * i, v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v12, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v12, 1, v2) == 1) {
      return swift_release();
    }
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v12, v2);
    sub_24C8CD088((uint64_t)v8, v6);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    if (v19) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v22 >= v26) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v25 + 8 * v22);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v26) {
        goto LABEL_24;
      }
      unint64_t v23 = *(void *)(v25 + 8 * v13);
      if (!v23)
      {
        int64_t v13 = v22 + 2;
        if (v22 + 2 >= v26) {
          goto LABEL_24;
        }
        unint64_t v23 = *(void *)(v25 + 8 * v13);
        if (!v23)
        {
          int64_t v13 = v22 + 3;
          if (v22 + 3 >= v26) {
            goto LABEL_24;
          }
          unint64_t v23 = *(void *)(v25 + 8 * v13);
          if (!v23) {
            break;
          }
        }
      }
    }
LABEL_20:
    unint64_t v19 = (v23 - 1) & v23;
  }
  int64_t v24 = v22 + 4;
  if (v24 >= v26)
  {
LABEL_24:
    (*v29)(v12, 1, 1, v2);
    return swift_release();
  }
  unint64_t v23 = *(void *)(v25 + 8 * v24);
  if (v23)
  {
    int64_t v13 = v24;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v13 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v13 >= v26) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v25 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_20;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24C8C8244(uint64_t result)
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
    sub_24C8CD3AC(&v16, v11, v12);
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

uint64_t sub_24C8C83C4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v18 = a2;
  uint64_t v4 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 56);
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
    uint64_t v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_24C8CD3AC(&v17, v12, v13);
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

uint64_t sub_24C8C8544(unint64_t a1, unint64_t a2, void (*a3)(uint64_t, uint64_t *))
{
  uint64_t v6 = a1;
  uint64_t v18 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_25;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v7; uint64_t v7 = sub_24C8F8020())
  {
    uint64_t v8 = 4;
    while (1)
    {
      uint64_t v9 = v8 - 4;
      if ((v6 & 0xC000000000000001) == 0) {
        break;
      }
      uint64_t v10 = MEMORY[0x2532FF870](v8 - 4, v6);
      BOOL v11 = __OFADD__(v9, 1);
      uint64_t v12 = v8 - 3;
      if (v11) {
        goto LABEL_23;
      }
LABEL_9:
      a3(v10, &v18);
      if (v3) {
        goto LABEL_22;
      }
      swift_release();
      ++v8;
      if (v12 == v7) {
        goto LABEL_11;
      }
    }
    uint64_t v10 = *(void *)(v6 + 8 * v8);
    swift_retain();
    BOOL v11 = __OFADD__(v9, 1);
    uint64_t v12 = v8 - 3;
    if (!v11) {
      goto LABEL_9;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_24C8F8020();
    if (v6) {
      goto LABEL_13;
    }
LABEL_21:
    swift_bridgeObjectRelease();
    return v18;
  }
  uint64_t v6 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_21;
  }
LABEL_13:
  uint64_t v13 = 4;
  while (1)
  {
    uint64_t v14 = v13 - 4;
    if ((a2 & 0xC000000000000001) != 0)
    {
      uint64_t v15 = MEMORY[0x2532FF870](v13 - 4, a2);
      BOOL v11 = __OFADD__(v14, 1);
      uint64_t v16 = v13 - 3;
      if (v11) {
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v15 = *(void *)(a2 + 8 * v13);
      swift_retain();
      BOOL v11 = __OFADD__(v14, 1);
      uint64_t v16 = v13 - 3;
      if (v11) {
        goto LABEL_24;
      }
    }
    a3(v15, &v18);
    if (v3) {
      break;
    }
    swift_release();
    ++v13;
    if (v16 == v6) {
      goto LABEL_21;
    }
  }
LABEL_22:
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24C8C8744(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9650);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t isUniquelyReferenced_nonNull_native = sub_24C8F7AE0();
  uint64_t v81 = *(void *)(isUniquelyReferenced_nonNull_native - 8);
  uint64_t v8 = MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native);
  unint64_t v77 = (char *)v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (uint64_t)v64 - v11;
  MEMORY[0x270FA5388](v10);
  unint64_t v86 = (void (**)(uint64_t, uint64_t, unint64_t))((char *)v64 - v13);
  uint64_t v14 = (void *)sub_24C8B9D80(MEMORY[0x263F8EE78]);
  if (a2 >> 62) {
    goto LABEL_86;
  }
  uint64_t v15 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    unint64_t v84 = isUniquelyReferenced_nonNull_native;
    uint64_t v82 = v15;
    os_log_t v78 = v6;
    uint64_t v70 = v12;
    uint64_t v71 = a1;
    if (!v15) {
      break;
    }
    unint64_t v83 = (void (*)(uint64_t, uint64_t, unint64_t))(v81 + 16);
    uint64_t v79 = (void (*)(uint64_t, unint64_t))(v81 + 8);
    unint64_t v80 = (void (**)(char *, uint64_t, uint64_t, unint64_t))(a2 & 0xC000000000000001);
    a1 = 4;
    while (1)
    {
      uint64_t v12 = a1 - 4;
      if (!v80) {
        break;
      }
      uint64_t v16 = MEMORY[0x2532FF870](a1 - 4, a2);
      uint64_t v17 = a1 - 3;
      if (__OFADD__(v12, 1)) {
        goto LABEL_80;
      }
LABEL_12:
      uint64_t v6 = (char *)a2;
      uint64_t v18 = *(void (**)(void *, uint64_t, unint64_t))v83;
      uint64_t v12 = (uint64_t)v86;
      (*(void (**)(void *, uint64_t, unint64_t))v83)(v86, v16 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, isUniquelyReferenced_nonNull_native);
      unint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v85 = v14;
      a2 = sub_24C8C0AFC(v12);
      uint64_t v20 = v14[2];
      BOOL v21 = (v19 & 1) == 0;
      uint64_t v22 = v20 + v21;
      if (__OFADD__(v20, v21)) {
        goto LABEL_81;
      }
      uint64_t v12 = v19;
      if (v14[3] >= v22)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          unint64_t isUniquelyReferenced_nonNull_native = v84;
          uint64_t v14 = v85;
          if (v19) {
            goto LABEL_5;
          }
        }
        else
        {
          sub_24C8C1AE0();
          unint64_t isUniquelyReferenced_nonNull_native = v84;
          uint64_t v14 = v85;
          if (v12) {
            goto LABEL_5;
          }
        }
      }
      else
      {
        sub_24C8C0D1C(v22, isUniquelyReferenced_nonNull_native);
        unint64_t v23 = sub_24C8C0AFC((uint64_t)v86);
        if ((v12 & 1) != (v24 & 1)) {
          goto LABEL_91;
        }
        a2 = v23;
        unint64_t isUniquelyReferenced_nonNull_native = v84;
        uint64_t v14 = v85;
        if (v12)
        {
LABEL_5:
          *(void *)(v14[7] + 8 * a2) = v16;
          swift_release();
          goto LABEL_6;
        }
      }
      v14[(a2 >> 6) + 8] |= 1 << a2;
      v18((void *)(v14[6] + *(void *)(v81 + 72) * a2), (uint64_t)v86, isUniquelyReferenced_nonNull_native);
      *(void *)(v14[7] + 8 * a2) = v16;
      uint64_t v25 = v14[2];
      BOOL v26 = __OFADD__(v25, 1);
      uint64_t v27 = v25 + 1;
      if (v26) {
        goto LABEL_82;
      }
      void v14[2] = v27;
LABEL_6:
      swift_bridgeObjectRelease();
      (*(void (**)(void (**)(uint64_t, uint64_t, unint64_t), unint64_t))v79)(v86, isUniquelyReferenced_nonNull_native);
      ++a1;
      a2 = (unint64_t)v6;
      if (v17 == v82)
      {
        uint64_t v15 = v82;
        swift_bridgeObjectRelease();
        uint64_t v12 = v70;
        a1 = v71;
        goto LABEL_25;
      }
    }
    uint64_t v16 = *(void *)(a2 + 8 * a1);
    swift_retain();
    uint64_t v17 = a1 - 3;
    if (!__OFADD__(v12, 1)) {
      goto LABEL_12;
    }
LABEL_80:
    __break(1u);
LABEL_81:
    __break(1u);
LABEL_82:
    __break(1u);
LABEL_83:
    __break(1u);
LABEL_84:
    __break(1u);
LABEL_85:
    __break(1u);
LABEL_86:
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_24C8F8020();
  }
  swift_bridgeObjectRelease();
LABEL_25:
  unint64_t v68 = a2;
  if ((unint64_t)a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = (char *)sub_24C8F8020();
    if (v6) {
      goto LABEL_27;
    }
    goto LABEL_63;
  }
  uint64_t v6 = *(char **)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6)
  {
LABEL_63:
    swift_bridgeObjectRelease();
    if (v15)
    {
      a2 = v68;
      unint64_t isUniquelyReferenced_nonNull_native = v68 & 0xC000000000000001;
      swift_bridgeObjectRetain();
      uint64_t v50 = 4;
      uint64_t v6 = (char *)MEMORY[0x263F8EE78];
      while (1)
      {
        uint64_t v51 = v50 - 4;
        if (isUniquelyReferenced_nonNull_native)
        {
          a1 = MEMORY[0x2532FF870](v50 - 4, a2);
          BOOL v26 = __OFADD__(v51, 1);
          uint64_t v12 = v50 - 3;
          if (v26) {
            goto LABEL_83;
          }
        }
        else
        {
          a1 = *(void *)(a2 + 8 * v50);
          swift_retain();
          BOOL v26 = __OFADD__(v51, 1);
          uint64_t v12 = v50 - 3;
          if (v26) {
            goto LABEL_83;
          }
        }
        uint64_t v52 = v74;
        sub_24C8CA8A0(a1, (uint64_t)v14, (uint64_t)v6);
        uint64_t v74 = v52;
        if (v52) {
          break;
        }
        swift_release();
        ++v50;
        if (v12 == v15)
        {
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
      }
      swift_bridgeObjectRelease();
      swift_release();
    }
    return swift_bridgeObjectRelease();
  }
LABEL_27:
  uint64_t v28 = 0;
  unint64_t v29 = a1 & 0xC000000000000001;
  uint64_t v65 = a1 & 0xFFFFFFFFFFFFFF8;
  v64[1] = a1 + 32;
  unint64_t v86 = (void (**)(uint64_t, uint64_t, unint64_t))(v81 + 16);
  unint64_t isUniquelyReferenced_nonNull_native = v81 + 8;
  unint64_t v80 = (void (**)(char *, uint64_t, uint64_t, unint64_t))(v81 + 56);
  uint64_t v75 = v81 + 48;
  unint64_t v76 = v81 + 8;
  a2 = v81 + 32;
  uint64_t v67 = v6;
  unint64_t v66 = a1 & 0xC000000000000001;
LABEL_28:
  if (v29)
  {
    uint64_t v30 = v28;
    uint64_t v31 = MEMORY[0x2532FF870](v28, a1);
    uint64_t v32 = v28 + 1;
    if (__OFADD__(v30, 1)) {
      goto LABEL_85;
    }
    goto LABEL_34;
  }
  if ((unint64_t)v28 >= *(void *)(v65 + 16))
  {
LABEL_90:
    __break(1u);
LABEL_91:
    uint64_t result = sub_24C8F8550();
    __break(1u);
  }
  else
  {
    uint64_t v31 = swift_retain();
    BOOL v26 = __OFADD__(v28, 1);
    uint64_t v32 = v28 + 1;
    if (v26) {
      goto LABEL_85;
    }
LABEL_34:
    unint64_t v69 = v32;
    uint64_t v72 = v31;
    uint64_t v33 = v31 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID;
    unint64_t v83 = *v86;
    v83(v12, v31 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v84);
    if (v14[2])
    {
      sub_24C8C0AFC(v12);
      int64_t v34 = *(void (**)(uint64_t, unint64_t))isUniquelyReferenced_nonNull_native;
      if (v35)
      {
        v34(v12, v84);
        unint64_t v36 = (char **)(v72 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships);
        swift_beginAccess();
        uint64_t v6 = *v36;
        uint64_t v12 = (uint64_t)(v6 + 56);
        uint64_t v37 = 1 << v6[32];
        if (v37 < 64) {
          uint64_t v38 = ~(-1 << v37);
        }
        else {
          uint64_t v38 = -1;
        }
        unint64_t v39 = v38 & *((void *)v6 + 7);
        int64_t v73 = (unint64_t)(v37 + 63) >> 6;
        swift_bridgeObjectRetain();
        a1 = 0;
        uint64_t v79 = v34;
        if (v39)
        {
LABEL_40:
          unint64_t v40 = __clz(__rbit64(v39));
          v39 &= v39 - 1;
          unint64_t v41 = v40 | (a1 << 6);
          goto LABEL_55;
        }
        while (1)
        {
          int64_t v42 = a1 + 1;
          if (__OFADD__(a1, 1)) {
            goto LABEL_84;
          }
          if (v42 >= v73) {
            goto LABEL_61;
          }
          unint64_t v43 = *(void *)(v12 + 8 * v42);
          ++a1;
          if (!v43)
          {
            a1 = v42 + 1;
            if (v42 + 1 >= v73) {
              goto LABEL_61;
            }
            unint64_t v43 = *(void *)(v12 + 8 * a1);
            if (!v43)
            {
              a1 = v42 + 2;
              if (v42 + 2 >= v73) {
                goto LABEL_61;
              }
              unint64_t v43 = *(void *)(v12 + 8 * a1);
              if (!v43)
              {
                int64_t v44 = v42 + 3;
                if (v44 >= v73)
                {
LABEL_61:
                  (*v80)(v78, 1, 1, v84);
                  swift_release();
                  swift_release();
LABEL_62:
                  uint64_t v6 = v67;
                  uint64_t v28 = v69;
                  uint64_t v12 = v70;
                  a1 = v71;
                  uint64_t v15 = v82;
                  unint64_t v29 = v66;
                  if (v69 != v67) {
                    goto LABEL_28;
                  }
                  goto LABEL_63;
                }
                unint64_t v43 = *(void *)(v12 + 8 * v44);
                if (!v43)
                {
                  while (1)
                  {
                    a1 = v44 + 1;
                    if (__OFADD__(v44, 1)) {
                      break;
                    }
                    if (a1 >= v73) {
                      goto LABEL_61;
                    }
                    unint64_t v43 = *(void *)(v12 + 8 * a1);
                    ++v44;
                    if (v43) {
                      goto LABEL_54;
                    }
                  }
                  __break(1u);
                  goto LABEL_90;
                }
                a1 = v44;
              }
            }
          }
LABEL_54:
          unint64_t v39 = (v43 - 1) & v43;
          unint64_t v41 = __clz(__rbit64(v43)) + (a1 << 6);
LABEL_55:
          uint64_t v45 = v81;
          uint64_t v46 = v78;
          unint64_t v47 = v84;
          v83((uint64_t)v78, *((void *)v6 + 6) + *(void *)(v81 + 72) * v41, v84);
          (*(void (**)(char *, void, uint64_t, unint64_t))(v45 + 56))(v46, 0, 1, v47);
          if ((*(unsigned int (**)(char *, uint64_t, unint64_t))(v45 + 48))(v46, 1, v47) == 1)
          {
            swift_release();
            swift_release();
            unint64_t isUniquelyReferenced_nonNull_native = v76;
            goto LABEL_62;
          }
          uint64_t v48 = (uint64_t)v77;
          (*(void (**)(void))a2)();
          if (!v14[2] || (sub_24C8C0AFC(v48), (v49 & 1) == 0))
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            type metadata accessor for RecordStoreBuilderError();
            sub_24C8D2388(&qword_2697F91C0, (void (*)(uint64_t))type metadata accessor for RecordStoreBuilderError);
            swift_allocError();
            uint64_t v54 = v53;
            uint64_t v55 = (char *)v53 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F91C8) + 48);
            uint64_t v56 = *(void *)(v72 + 32);
            *uint64_t v54 = *(void *)(v72 + 24);
            v54[1] = v56;
            unint64_t v57 = v84;
            v83((uint64_t)v55, v48, v84);
            swift_storeEnumTagMultiPayload();
            swift_bridgeObjectRetain();
            swift_willThrow();
            swift_release();
            v79(v48, v57);
            return swift_release();
          }
          unint64_t isUniquelyReferenced_nonNull_native = v76;
          v79(v48, v84);
          if (v39) {
            goto LABEL_40;
          }
        }
      }
    }
    else
    {
      int64_t v34 = *(void (**)(uint64_t, unint64_t))isUniquelyReferenced_nonNull_native;
    }
    unint64_t v59 = v84;
    v34(v12, v84);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for RecordStoreBuilderError();
    sub_24C8D2388(&qword_2697F91C0, (void (*)(uint64_t))type metadata accessor for RecordStoreBuilderError);
    swift_allocError();
    unint64_t v61 = v60;
    unint64_t v62 = (char *)v60 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F91C8) + 48);
    uint64_t v63 = *(void *)(v72 + 32);
    *unint64_t v61 = *(void *)(v72 + 24);
    v61[1] = v63;
    v83((uint64_t)v62, v33, v59);
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    swift_willThrow();
    return swift_release();
  }
  return result;
}

uint64_t sub_24C8C9180(uint64_t a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  BOOL v26 = &v27;
  uint64_t v27 = a1;
  swift_bridgeObjectRetain();
  char v4 = sub_24C8C9E34((uint64_t (*)(uint64_t *))sub_24C8D0EB0, (uint64_t)v25, v3);
  uint64_t v5 = swift_bridgeObjectRelease();
  if (v4)
  {
    type metadata accessor for RecordStoreBuilderError();
    sub_24C8D2388(&qword_2697F91C0, (void (*)(uint64_t))type metadata accessor for RecordStoreBuilderError);
    swift_allocError();
    *uint64_t v6 = *(_DWORD *)(v27 + 32);
LABEL_3:
    swift_storeEnumTagMultiPayload();
    return swift_willThrow();
  }
  uint64_t v7 = *(void *)(v27 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases);
  MEMORY[0x270FA5388](v5);
  char v24 = &v27;
  swift_bridgeObjectRetain();
  char v8 = sub_24C8C9968((uint64_t (*)(void *))sub_24C8D0ED0, (uint64_t)v23, v7);
  uint64_t v9 = swift_bridgeObjectRelease();
  if ((v8 & 1) != 0
    || (unint64_t v10 = *a2,
        MEMORY[0x270FA5388](v9),
        char v24 = &v27,
        swift_bridgeObjectRetain(),
        char v11 = sub_24C8C9E34((uint64_t (*)(uint64_t *))sub_24C8D0EF0, (uint64_t)v23, v10),
        uint64_t v12 = swift_bridgeObjectRelease(),
        (v11 & 1) != 0))
  {
    type metadata accessor for RecordStoreBuilderError();
    sub_24C8D2388(&qword_2697F91C0, (void (*)(uint64_t))type metadata accessor for RecordStoreBuilderError);
    swift_allocError();
    uint64_t v13 = *(void *)(v27 + 48);
    *uint64_t v14 = *(void *)(v27 + 40);
    v14[1] = v13;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  unint64_t v16 = *a2;
  MEMORY[0x270FA5388](v12);
  char v24 = &v27;
  swift_bridgeObjectRetain();
  char v17 = sub_24C8C9E34((uint64_t (*)(uint64_t *))sub_24C8D0F18, (uint64_t)v23, v16);
  swift_bridgeObjectRelease();
  if (v17)
  {
    type metadata accessor for RecordStoreBuilderError();
    sub_24C8D2388(&qword_2697F91C0, (void (*)(uint64_t))type metadata accessor for RecordStoreBuilderError);
    swift_allocError();
    uint64_t v19 = v18;
    uint64_t v20 = v27 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid;
    uint64_t v21 = sub_24C8F7AE0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    goto LABEL_3;
  }
  uint64_t v22 = swift_retain();
  MEMORY[0x2532FF670](v22);
  if (*(void *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24C8F7D70();
  }
  sub_24C8F7DA0();
  return sub_24C8F7D60();
}

uint64_t sub_24C8C9574(uint64_t a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  BOOL v26 = &v27;
  uint64_t v27 = a1;
  swift_bridgeObjectRetain();
  char v4 = sub_24C8C9E34((uint64_t (*)(uint64_t *))sub_24C8D1010, (uint64_t)v25, v3);
  uint64_t v5 = swift_bridgeObjectRelease();
  if (v4)
  {
    type metadata accessor for RecordStoreBuilderError();
    sub_24C8D2388(&qword_2697F91C0, (void (*)(uint64_t))type metadata accessor for RecordStoreBuilderError);
    swift_allocError();
    *uint64_t v6 = *(_DWORD *)(v27 + 16);
LABEL_3:
    swift_storeEnumTagMultiPayload();
    return swift_willThrow();
  }
  uint64_t v7 = *(void *)(v27 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
  MEMORY[0x270FA5388](v5);
  char v24 = &v27;
  swift_bridgeObjectRetain();
  char v8 = sub_24C8C9968((uint64_t (*)(void *))sub_24C8D1030, (uint64_t)v23, v7);
  uint64_t v9 = swift_bridgeObjectRelease();
  if ((v8 & 1) != 0
    || (unint64_t v10 = *a2,
        MEMORY[0x270FA5388](v9),
        char v24 = &v27,
        swift_bridgeObjectRetain(),
        char v11 = sub_24C8C9E34((uint64_t (*)(uint64_t *))sub_24C8D1050, (uint64_t)v23, v10),
        uint64_t v12 = swift_bridgeObjectRelease(),
        (v11 & 1) != 0))
  {
    type metadata accessor for RecordStoreBuilderError();
    sub_24C8D2388(&qword_2697F91C0, (void (*)(uint64_t))type metadata accessor for RecordStoreBuilderError);
    swift_allocError();
    uint64_t v13 = *(void *)(v27 + 32);
    *uint64_t v14 = *(void *)(v27 + 24);
    v14[1] = v13;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  unint64_t v16 = *a2;
  MEMORY[0x270FA5388](v12);
  char v24 = &v27;
  swift_bridgeObjectRetain();
  char v17 = sub_24C8C9E34((uint64_t (*)(uint64_t *))sub_24C8D1078, (uint64_t)v23, v16);
  swift_bridgeObjectRelease();
  if (v17)
  {
    type metadata accessor for RecordStoreBuilderError();
    sub_24C8D2388(&qword_2697F91C0, (void (*)(uint64_t))type metadata accessor for RecordStoreBuilderError);
    swift_allocError();
    uint64_t v19 = v18;
    uint64_t v20 = v27 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid;
    uint64_t v21 = sub_24C8F7AE0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    goto LABEL_3;
  }
  uint64_t v22 = swift_retain();
  MEMORY[0x2532FF670](v22);
  if (*(void *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24C8F7D70();
  }
  sub_24C8F7DA0();
  return sub_24C8F7D60();
}

uint64_t sub_24C8C9968(uint64_t (*a1)(void *), uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a3 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a3 + 56);
  int64_t v23 = (unint64_t)(v7 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v11 << 6);
      goto LABEL_19;
    }
    if (__OFADD__(v11++, 1)) {
      break;
    }
    if (v11 >= v23) {
      goto LABEL_27;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    if (!v15)
    {
      int64_t v16 = v11 + 1;
      if (v11 + 1 >= v23) {
        goto LABEL_27;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v16);
      if (!v15)
      {
        int64_t v16 = v11 + 2;
        if (v11 + 2 >= v23) {
          goto LABEL_27;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v16);
        if (!v15)
        {
          int64_t v16 = v11 + 3;
          if (v11 + 3 >= v23) {
            goto LABEL_27;
          }
          unint64_t v15 = *(void *)(v6 + 8 * v16);
          if (!v15)
          {
            int64_t v16 = v11 + 4;
            if (v11 + 4 >= v23)
            {
LABEL_27:
              swift_release();
              char v21 = 0;
              return v21 & 1;
            }
            unint64_t v15 = *(void *)(v6 + 8 * v16);
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_30;
                }
                if (v11 >= v23) {
                  goto LABEL_27;
                }
                unint64_t v15 = *(void *)(v6 + 8 * v11);
                ++v16;
                if (v15) {
                  goto LABEL_18;
                }
              }
            }
          }
        }
      }
      int64_t v11 = v16;
    }
LABEL_18:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v11 << 6);
LABEL_19:
    char v17 = (void *)(*(void *)(a3 + 48) + 16 * v13);
    uint64_t v18 = v17[1];
    v22[0] = *v17;
    v22[1] = v18;
    swift_bridgeObjectRetain();
    char v19 = a1(v22);
    if (v3)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return v21 & 1;
    }
    char v20 = v19;
    uint64_t result = swift_bridgeObjectRelease();
    if (v20)
    {
      swift_release();
      char v21 = 1;
      return v21 & 1;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

BOOL sub_24C8C9B54(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v38 = a1;
  uint64_t v39 = sub_24C8F7AE0();
  uint64_t v6 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9650);
  MEMORY[0x270FA5388](v9 - 8);
  int64_t v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a3 + 16);
  if (v12)
  {
    uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v13 = v6 + 16;
    uint64_t v37 = v14;
    uint64_t v15 = a3 + ((*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64));
    uint64_t v16 = *(void *)(v13 + 56);
    int64_t v34 = v8;
    char v35 = (uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 32);
    uint64_t v31 = v16;
    uint64_t v32 = (void (**)(char *))(v13 + 16);
    uint64_t v33 = (void (**)(char *, uint64_t))(v13 - 8);
    v29[2] = a3;
    swift_bridgeObjectRetain();
    unint64_t v36 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 40);
    v29[1] = (v13 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    while (1)
    {
      uint64_t v17 = v39;
      uint64_t v18 = v13;
      v37(v11, v15, v39);
      char v19 = *v36;
      (*v36)(v11, 0, 1, v17);
      int v20 = (*v35)(v11, 1, v17);
      BOOL v21 = v20 != 1;
      if (v20 == 1) {
        break;
      }
      uint64_t v30 = v19;
      uint64_t v22 = v11;
      int64_t v23 = v34;
      char v24 = v22;
      (*v32)(v34);
      char v25 = v38(v23);
      if (v4)
      {
        (*v33)(v23, v17);
        swift_bridgeObjectRelease();
        return v21;
      }
      char v26 = v25;
      (*v33)(v23, v17);
      if (v26) {
        break;
      }
      v15 += v31;
      --v12;
      uint64_t v4 = 0;
      uint64_t v13 = v18;
      int64_t v11 = v24;
      if (!v12)
      {
        v30(v24, 1, 1, v39);
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    swift_bridgeObjectRetain();
    v27(v11, 1, 1, v39);
LABEL_9:
    BOOL v21 = 0;
  }
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_24C8C9E34(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62)
  {
LABEL_17:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24C8F8020();
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
    {
LABEL_3:
      uint64_t v6 = 4;
      do
      {
        uint64_t v7 = v6 - 4;
        if ((a3 & 0xC000000000000001) != 0)
        {
          uint64_t v8 = MEMORY[0x2532FF870](v6 - 4, a3);
          uint64_t v9 = v6 - 3;
          if (__OFADD__(v7, 1)) {
            goto LABEL_16;
          }
        }
        else
        {
          uint64_t v8 = *(void *)(a3 + 8 * v6);
          swift_retain();
          uint64_t v9 = v6 - 3;
          if (__OFADD__(v7, 1))
          {
LABEL_16:
            __break(1u);
            goto LABEL_17;
          }
        }
        uint64_t v15 = v8;
        char v10 = a1(&v15);
        if (v3)
        {
          swift_bridgeObjectRelease();
          swift_release();
          return v12 & 1;
        }
        char v11 = v10;
        swift_release();
        if (v11)
        {
          swift_bridgeObjectRelease();
          char v12 = 1;
          return v12 & 1;
        }
        ++v6;
      }
      while (v9 != v5);
    }
  }
  swift_bridgeObjectRelease();
  char v12 = 0;
  return v12 & 1;
}

uint64_t sub_24C8C9F80(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v30 = a1;
  uint64_t v5 = sub_24C8F7AE0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9650);
  MEMORY[0x270FA5388](v9 - 8);
  char v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a3 + 56);
  uint64_t v26 = a3 + 56;
  uint64_t v13 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & v12;
  uint64_t v32 = v6 + 16;
  uint64_t v33 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  uint64_t v31 = v6 + 48;
  unint64_t v29 = (void (**)(char *, char *, uint64_t))(v6 + 32);
  int64_t v27 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v28 = (void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v34 = a3;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v17 = 0;
  while (v15)
  {
    unint64_t v18 = __clz(__rbit64(v15));
    v15 &= v15 - 1;
    unint64_t v19 = v18 | (v17 << 6);
LABEL_19:
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v11, *(void *)(v34 + 48) + *(void *)(v6 + 72) * v19, v5);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v11, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5) == 1) {
      goto LABEL_29;
    }
    (*v29)(v8, v11, v5);
    char v23 = v30(v8);
    if (v3)
    {
      (*v28)(v8, v5);
      swift_release();
      return v25 & 1;
    }
    char v24 = v23;
    uint64_t result = ((uint64_t (*)(char *, uint64_t))*v28)(v8, v5);
    if (v24)
    {
      swift_release();
      char v25 = 1;
      return v25 & 1;
    }
  }
  if (__OFADD__(v17++, 1))
  {
    __break(1u);
    goto LABEL_32;
  }
  if (v17 >= v27) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v26 + 8 * v17);
  if (v21)
  {
LABEL_18:
    unint64_t v15 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v17 << 6);
    goto LABEL_19;
  }
  int64_t v22 = v17 + 1;
  if (v17 + 1 >= v27) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v26 + 8 * v22);
  if (v21) {
    goto LABEL_17;
  }
  int64_t v22 = v17 + 2;
  if (v17 + 2 >= v27) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v26 + 8 * v22);
  if (v21) {
    goto LABEL_17;
  }
  int64_t v22 = v17 + 3;
  if (v17 + 3 >= v27) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v26 + 8 * v22);
  if (v21) {
    goto LABEL_17;
  }
  int64_t v22 = v17 + 4;
  if (v17 + 4 >= v27)
  {
LABEL_28:
    (*v33)(v11, 1, 1, v5);
LABEL_29:
    swift_release();
    char v25 = 0;
    return v25 & 1;
  }
  unint64_t v21 = *(void *)(v26 + 8 * v22);
  if (v21)
  {
LABEL_17:
    int64_t v17 = v22;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v17 >= v27) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v26 + 8 * v17);
    ++v22;
    if (v21) {
      goto LABEL_18;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

BOOL sub_24C8CA33C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9150);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24C8F9900;
  uint64_t v6 = *(void *)(a1 + 48);
  *(void *)(inited + 32) = *(void *)(a1 + 40);
  *(void *)(inited + 40) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_24C8D0F3C(inited, v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t v8 = *(void *)(a2 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases);
  uint64_t v9 = swift_initStackObject();
  *(_OWORD *)(v9 + 16) = xmmword_24C8F9900;
  uint64_t v10 = *(void *)(a2 + 48);
  *(void *)(v9 + 32) = *(void *)(a2 + 40);
  *(void *)(v9 + 40) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_24C8D0F3C(v9, v8);
  swift_setDeallocating();
  swift_arrayDestroy();
  LOBYTE(a2) = sub_24C8CA61C(v11, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (a2 & 1) == 0;
}

BOOL sub_24C8CA4AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9150);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24C8F9900;
  uint64_t v6 = *(void *)(a1 + 32);
  *(void *)(inited + 32) = *(void *)(a1 + 24);
  *(void *)(inited + 40) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_24C8D0F3C(inited, v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t v8 = *(void *)(a2 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
  uint64_t v9 = swift_initStackObject();
  *(_OWORD *)(v9 + 16) = xmmword_24C8F9900;
  uint64_t v10 = *(void *)(a2 + 32);
  *(void *)(v9 + 32) = *(void *)(a2 + 24);
  *(void *)(v9 + 40) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_24C8D0F3C(v9, v8);
  swift_setDeallocating();
  swift_arrayDestroy();
  LOBYTE(a2) = sub_24C8CA61C(v11, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (a2 & 1) == 0;
}

uint64_t sub_24C8CA61C(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 1;
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return 1;
  }
  if (v2 >= v3) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = a2;
  }
  uint64_t v31 = v4 + 56;
  if (v2 >= v3) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = a1;
  }
  uint64_t v6 = 1 << *(unsigned char *)(v4 + 32);
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v4 + 56);
  int64_t v32 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v33 = v4;
  uint64_t v9 = v5 + 56;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (1)
  {
    while (v8)
    {
      unint64_t v12 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v13 = v12 | (v11 << 6);
      if (*(void *)(v5 + 16)) {
        goto LABEL_29;
      }
    }
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_48;
    }
    if (v14 >= v32) {
      goto LABEL_44;
    }
    unint64_t v15 = *(void *)(v31 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v32) {
        goto LABEL_44;
      }
      unint64_t v15 = *(void *)(v31 + 8 * v11);
      if (!v15) {
        break;
      }
    }
LABEL_28:
    unint64_t v8 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v11 << 6);
    if (*(void *)(v5 + 16))
    {
LABEL_29:
      int64_t v17 = (uint64_t *)(*(void *)(v33 + 48) + 16 * v13);
      uint64_t v19 = *v17;
      uint64_t v18 = v17[1];
      sub_24C8F85A0();
      swift_bridgeObjectRetain();
      sub_24C8F7CE0();
      uint64_t v20 = sub_24C8F85D0();
      uint64_t v21 = -1 << *(unsigned char *)(v5 + 32);
      unint64_t v22 = v20 & ~v21;
      if ((*(void *)(v9 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22))
      {
        uint64_t v23 = *(void *)(v5 + 48);
        char v24 = (void *)(v23 + 16 * v22);
        BOOL v25 = *v24 == v19 && v24[1] == v18;
        if (v25 || (sub_24C8F8380() & 1) != 0)
        {
LABEL_43:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          return 0;
        }
        uint64_t v26 = ~v21;
        for (unint64_t i = v22 + 1; ; unint64_t i = v28 + 1)
        {
          uint64_t v28 = i & v26;
          if (((*(void *)(v9 + (((i & v26) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v26)) & 1) == 0) {
            break;
          }
          unint64_t v29 = (void *)(v23 + 16 * v28);
          BOOL v30 = *v29 == v19 && v29[1] == v18;
          if (v30 || (sub_24C8F8380() & 1) != 0) {
            goto LABEL_43;
          }
        }
      }
      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  int64_t v16 = v14 + 2;
  if (v16 >= v32)
  {
LABEL_44:
    swift_release();
    swift_bridgeObjectRelease();
    return 1;
  }
  unint64_t v15 = *(void *)(v31 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_28;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v32) {
      goto LABEL_44;
    }
    unint64_t v15 = *(void *)(v31 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_28;
    }
  }
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_24C8CA8A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v62 = a2;
  uint64_t v66 = *MEMORY[0x263EF8340];
  uint64_t v6 = sub_24C8F7AE0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9650);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  unint64_t v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)&v48 - v14;
  unint64_t v57 = a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid;
  uint64_t v65 = a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid;
  if (!sub_24C8C9B54((uint64_t (*)(char *))sub_24C8D0E20, (uint64_t)v64, a3))
  {
    uint64_t v23 = v3;
    uint64_t v60 = (uint64_t)v9;
    uint64_t v51 = a3;
    uint64_t v24 = *(void *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups);
    uint64_t v25 = *(void *)(v24 + 56);
    uint64_t v48 = v24 + 56;
    uint64_t v26 = 1 << *(unsigned char *)(v24 + 32);
    uint64_t v27 = -1;
    if (v26 < 64) {
      uint64_t v27 = ~(-1 << v26);
    }
    unint64_t v28 = v27 & v25;
    int64_t v49 = (unint64_t)(v26 + 63) >> 6;
    uint64_t v54 = v7 + 48;
    uint64_t v55 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
    uint64_t v52 = (void (**)(uint64_t, uint64_t))(v7 + 8);
    uint64_t v53 = (void (**)(uint64_t, char *, uint64_t))(v7 + 32);
    uint64_t v56 = v24;
    swift_bridgeObjectRetain();
    int64_t v29 = 0;
    long long v50 = xmmword_24C8F9900;
    if (!v28) {
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v61 = v23;
    unint64_t v30 = __clz(__rbit64(v28));
    uint64_t v31 = (v28 - 1) & v28;
    unint64_t v32 = v30 | (v29 << 6);
    uint64_t v33 = v60;
    while (1)
    {
      uint64_t v37 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
      v37(v15, *(void *)(v56 + 48) + *(void *)(v7 + 72) * v32, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v15, 0, 1, v6);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v15, 1, v6) == 1) {
        return swift_release();
      }
      unint64_t v58 = v31;
      int64_t v59 = v29;
      (*v53)(v33, v15, v6);
      if (!*(void *)(v62 + 16) || (unint64_t v38 = sub_24C8C0AFC(v33), (v39 & 1) == 0))
      {
        type metadata accessor for RecordStoreBuilderError();
        sub_24C8D2388(&qword_2697F91C0, (void (*)(uint64_t))type metadata accessor for RecordStoreBuilderError);
        swift_allocError();
        uint64_t v45 = v44;
        uint64_t v46 = v33;
        unint64_t v47 = &v44[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F91D0) + 48)];
        v37(v45, v57, v6);
        v37(v47, v46, v6);
        swift_storeEnumTagMultiPayload();
        swift_willThrow();
        (*v52)(v46, v6);
        return swift_release();
      }
      uint64_t v40 = *(void *)(*(void *)(v62 + 56) + 8 * v38);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9158);
      unint64_t v41 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      uint64_t v42 = swift_allocObject();
      *(_OWORD *)(v42 + 16) = v50;
      v37((char *)(v42 + v41), v57, v6);
      uint64_t v63 = v51;
      swift_retain();
      swift_bridgeObjectRetain();
      sub_24C8CEB2C(v42);
      uint64_t v43 = v61;
      sub_24C8CA8A0(v40, v62, v63);
      uint64_t v23 = v43;
      if (v43)
      {
        swift_release();
        swift_bridgeObjectRelease();
        (*v52)(v60, v6);
        return swift_release();
      }
      (*v52)(v60, v6);
      swift_release();
      swift_bridgeObjectRelease();
      unint64_t v28 = v58;
      int64_t v29 = v59;
      if (v58) {
        goto LABEL_8;
      }
LABEL_9:
      BOOL v34 = __OFADD__(v29++, 1);
      uint64_t v33 = v60;
      if (v34)
      {
        __break(1u);
        goto LABEL_36;
      }
      if (v29 >= v49) {
        goto LABEL_34;
      }
      unint64_t v35 = *(void *)(v48 + 8 * v29);
      if (!v35)
      {
        int64_t v36 = v29 + 1;
        if (v29 + 1 >= v49) {
          goto LABEL_34;
        }
        unint64_t v35 = *(void *)(v48 + 8 * v36);
        if (!v35)
        {
          int64_t v36 = v29 + 2;
          if (v29 + 2 >= v49) {
            goto LABEL_34;
          }
          unint64_t v35 = *(void *)(v48 + 8 * v36);
          if (!v35)
          {
            int64_t v36 = v29 + 3;
            if (v29 + 3 >= v49)
            {
LABEL_34:
              (*v55)(v15, 1, 1, v6);
              return swift_release();
            }
            unint64_t v35 = *(void *)(v48 + 8 * v36);
            if (!v35)
            {
              while (1)
              {
                int64_t v29 = v36 + 1;
                if (__OFADD__(v36, 1)) {
                  break;
                }
                if (v29 >= v49) {
                  goto LABEL_34;
                }
                unint64_t v35 = *(void *)(v48 + 8 * v29);
                ++v36;
                if (v35) {
                  goto LABEL_19;
                }
              }
LABEL_36:
              __break(1u);
            }
          }
        }
        int64_t v29 = v36;
      }
LABEL_19:
      uint64_t v61 = v23;
      uint64_t v31 = (v35 - 1) & v35;
      unint64_t v32 = __clz(__rbit64(v35)) + (v29 << 6);
    }
  }
  uint64_t v16 = type metadata accessor for RecordStoreBuilderError();
  sub_24C8D2388(&qword_2697F91C0, (void (*)(uint64_t))type metadata accessor for RecordStoreBuilderError);
  uint64_t v62 = v16;
  uint64_t v61 = swift_allocError();
  if (*(void *)(a3 + 16))
  {
    uint64_t v18 = v17;
    unint64_t v19 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v20 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    v20(v13, a3 + v19, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v13, 1, v6) != 1)
    {
      uint64_t v60 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F91D8) + 48);
      (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v18, v13, v6);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9158);
      uint64_t v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_24C8F9900;
      v20((char *)(v21 + v19), v57, v6);
      uint64_t v63 = a3;
      swift_bridgeObjectRetain();
      sub_24C8CEB2C(v21);
      *(void *)(v18 + v60) = v63;
      swift_storeEnumTagMultiPayload();
      return swift_willThrow();
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v13, 1, 1, v6);
  }
  uint64_t result = MEMORY[0x2533003E0](v61);
  __break(1u);
  return result;
}

uint64_t sub_24C8CB070(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = sub_24C8F7AE0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a2 + 8);
  if ((v10 & 0xC000000000000001) != 0)
  {
    uint64_t v11 = MEMORY[0x2532FF870](a3);
    goto LABEL_5;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) > a3)
  {
    uint64_t v11 = *(void *)(v10 + 8 * a3 + 32);
    swift_retain();
LABEL_5:
    uint64_t v12 = v11 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v12, v5);
    swift_release();
    char v13 = sub_24C8F7AB0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    return v13 & 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_24C8CB1F8(uint64_t *a1, unint64_t a2)
{
  uint64_t v20 = MEMORY[0x263F8EE78];
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_24C8F8020();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_15;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    goto LABEL_33;
  }
  if ((a2 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)(*(void *)(MEMORY[0x2532FF870](i, a2)
                                 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases)
                     + 16))
      {
        sub_24C8F7F90();
        sub_24C8F7FC0();
        sub_24C8F7FD0();
        sub_24C8F7FA0();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases;
    do
    {
      if (*(void *)(*(void *)(*(void *)(a2 + 8 * v7 + 32) + v8) + 16))
      {
        swift_retain();
        sub_24C8F7F90();
        sub_24C8F7FC0();
        sub_24C8F7FD0();
        sub_24C8F7FA0();
        uint64_t v8 = OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases;
      }
      ++v7;
    }
    while (v4 != v7);
  }
LABEL_15:
  swift_bridgeObjectRelease();
  if ((v20 & 0x8000000000000000) == 0 && (v20 & 0x4000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(v20 + 16);
    uint64_t result = swift_retain();
    if (v9) {
      goto LABEL_18;
    }
    return swift_release_n();
  }
  swift_retain();
  uint64_t result = sub_24C8F8020();
  uint64_t v9 = result;
  if (!result) {
    return swift_release_n();
  }
LABEL_18:
  if (v9 >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      if ((v20 & 0xC000000000000001) != 0)
      {
        uint64_t v14 = MEMORY[0x2532FF870](v10, v20);
      }
      else
      {
        uint64_t v14 = *(void *)(v20 + 8 * v10 + 32);
        swift_retain();
      }
      uint64_t v15 = *a1;
      if (*(void *)(*a1 + 16))
      {
        uint64_t v17 = *(void *)(v14 + 24);
        uint64_t v16 = *(void *)(v14 + 32);
        swift_bridgeObjectRetain();
        unint64_t v18 = sub_24C8C0BD0(v17, v16);
        if (v19) {
          uint64_t v11 = *(void *)(*(void *)(v15 + 56) + 8 * v18);
        }
        else {
          uint64_t v11 = 0;
        }
        char v12 = v19 ^ 1;
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v11 = 0;
        char v12 = 1;
      }
      ++v10;
      uint64_t v13 = swift_bridgeObjectRetain();
      sub_24C8CB780(v13, a1, v11, v12 & 1);
      swift_release();
      swift_bridgeObjectRelease();
    }
    while (v9 != v10);
    return swift_release_n();
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_24C8CB4BC(uint64_t *a1, unint64_t a2)
{
  uint64_t v20 = MEMORY[0x263F8EE78];
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_24C8F8020();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_15;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    goto LABEL_33;
  }
  if ((a2 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)(*(void *)(MEMORY[0x2532FF870](i, a2)
                                 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases)
                     + 16))
      {
        sub_24C8F7F90();
        sub_24C8F7FC0();
        sub_24C8F7FD0();
        sub_24C8F7FA0();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases;
    do
    {
      if (*(void *)(*(void *)(*(void *)(a2 + 8 * v7 + 32) + v8) + 16))
      {
        swift_retain();
        sub_24C8F7F90();
        sub_24C8F7FC0();
        sub_24C8F7FD0();
        sub_24C8F7FA0();
        uint64_t v8 = OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases;
      }
      ++v7;
    }
    while (v4 != v7);
  }
LABEL_15:
  swift_bridgeObjectRelease();
  if ((v20 & 0x8000000000000000) == 0 && (v20 & 0x4000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(v20 + 16);
    uint64_t result = swift_retain();
    if (v9) {
      goto LABEL_18;
    }
    return swift_release_n();
  }
  swift_retain();
  uint64_t result = sub_24C8F8020();
  uint64_t v9 = result;
  if (!result) {
    return swift_release_n();
  }
LABEL_18:
  if (v9 >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      if ((v20 & 0xC000000000000001) != 0)
      {
        uint64_t v14 = MEMORY[0x2532FF870](v10, v20);
      }
      else
      {
        uint64_t v14 = *(void *)(v20 + 8 * v10 + 32);
        swift_retain();
      }
      uint64_t v15 = *a1;
      if (*(void *)(*a1 + 16))
      {
        uint64_t v17 = *(void *)(v14 + 40);
        uint64_t v16 = *(void *)(v14 + 48);
        swift_bridgeObjectRetain();
        unint64_t v18 = sub_24C8C0BD0(v17, v16);
        if (v19) {
          uint64_t v11 = *(void *)(*(void *)(v15 + 56) + 8 * v18);
        }
        else {
          uint64_t v11 = 0;
        }
        char v12 = v19 ^ 1;
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v11 = 0;
        char v12 = 1;
      }
      ++v10;
      uint64_t v13 = swift_bridgeObjectRetain();
      sub_24C8CB780(v13, a1, v11, v12 & 1);
      swift_release();
      swift_bridgeObjectRelease();
    }
    while (v9 != v10);
    return swift_release_n();
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_24C8CB780(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a1;
  uint64_t v45 = a1 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a1 + 56);
  int64_t v46 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v10 = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  uint64_t v43 = v10;
  if (v9) {
    goto LABEL_6;
  }
LABEL_7:
  while (2)
  {
    int64_t v14 = v11 + 1;
    if (!__OFADD__(v11, 1))
    {
      if (v14 < v46)
      {
        unint64_t v15 = *(void *)(v45 + 8 * v14);
        int64_t v16 = v11 + 1;
        if (v15) {
          goto LABEL_22;
        }
        int64_t v16 = v11 + 2;
        if (v11 + 2 >= v46) {
          return swift_release();
        }
        unint64_t v15 = *(void *)(v45 + 8 * v16);
        if (v15) {
          goto LABEL_22;
        }
        int64_t v16 = v11 + 3;
        if (v11 + 3 >= v46) {
          return swift_release();
        }
        unint64_t v15 = *(void *)(v45 + 8 * v16);
        if (v15) {
          goto LABEL_22;
        }
        int64_t v16 = v11 + 4;
        if (v11 + 4 >= v46) {
          return swift_release();
        }
        unint64_t v15 = *(void *)(v45 + 8 * v16);
        if (v15)
        {
LABEL_22:
          unint64_t v9 = (v15 - 1) & v15;
          int64_t v47 = v16;
          for (unint64_t i = __clz(__rbit64(v15)) + (v16 << 6); ; unint64_t i = v12 | (v11 << 6))
          {
            unint64_t v18 = (uint64_t *)(*(void *)(v6 + 48) + 16 * i);
            uint64_t v20 = *v18;
            uint64_t v19 = v18[1];
            if ((a4 & 1) == 0) {
              break;
            }
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            unint64_t v33 = sub_24C8C0BD0(v20, v19);
            char v35 = v34;
            swift_bridgeObjectRelease();
            if (v35)
            {
              char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              uint64_t v37 = *a2;
              uint64_t v49 = *a2;
              *a2 = 0x8000000000000000;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                sub_24C8C1D74();
                uint64_t v37 = v49;
              }
              swift_bridgeObjectRelease();
              sub_24C8CC21C(v33, v37);
              *a2 = v37;
              swift_bridgeObjectRelease();
            }
            swift_bridgeObjectRelease();
            int64_t v11 = v47;
            if (!v9) {
              goto LABEL_7;
            }
LABEL_6:
            unint64_t v12 = __clz(__rbit64(v9));
            v9 &= v9 - 1;
            int64_t v47 = v11;
          }
          uint64_t v21 = a4;
          swift_bridgeObjectRetain_n();
          char v22 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v23 = *a2;
          uint64_t v48 = (void *)*a2;
          *a2 = 0x8000000000000000;
          unint64_t v25 = sub_24C8C0BD0(v20, v19);
          uint64_t v26 = *(void *)(v23 + 16);
          BOOL v27 = (v24 & 1) == 0;
          uint64_t v28 = v26 + v27;
          if (__OFADD__(v26, v27))
          {
            __break(1u);
            break;
          }
          char v29 = v24;
          if (*(void *)(v23 + 24) < v28)
          {
            sub_24C8C1128(v28, v22);
            unint64_t v30 = sub_24C8C0BD0(v20, v19);
            if ((v29 & 1) != (v31 & 1)) {
              goto LABEL_46;
            }
            unint64_t v25 = v30;
            unint64_t v32 = v48;
            if ((v29 & 1) == 0) {
              goto LABEL_37;
            }
LABEL_35:
            *(void *)(v32[7] + 8 * v25) = a3;
            goto LABEL_39;
          }
          if (v22)
          {
            unint64_t v32 = v48;
            if (v24) {
              goto LABEL_35;
            }
          }
          else
          {
            sub_24C8C1D74();
            unint64_t v32 = v48;
            if (v29) {
              goto LABEL_35;
            }
          }
LABEL_37:
          v32[(v25 >> 6) + 8] |= 1 << v25;
          unint64_t v38 = (uint64_t *)(v32[6] + 16 * v25);
          *unint64_t v38 = v20;
          v38[1] = v19;
          *(void *)(v32[7] + 8 * v25) = a3;
          uint64_t v39 = v32[2];
          BOOL v40 = __OFADD__(v39, 1);
          uint64_t v41 = v39 + 1;
          if (v40) {
            goto LABEL_44;
          }
          v32[2] = v41;
          swift_bridgeObjectRetain();
LABEL_39:
          *a2 = (uint64_t)v32;
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          a4 = v21;
          uint64_t v6 = v43;
          int64_t v11 = v47;
          if (!v9) {
            continue;
          }
          goto LABEL_6;
        }
        uint64_t v17 = v11 + 5;
        if (v11 + 5 < v46)
        {
          unint64_t v15 = *(void *)(v45 + 8 * v17);
          if (v15)
          {
            int64_t v16 = v11 + 5;
            goto LABEL_22;
          }
          while (1)
          {
            int64_t v16 = v17 + 1;
            if (__OFADD__(v17, 1)) {
              goto LABEL_45;
            }
            if (v16 >= v46) {
              return swift_release();
            }
            unint64_t v15 = *(void *)(v45 + 8 * v16);
            ++v17;
            if (v15) {
              goto LABEL_22;
            }
          }
        }
      }
      return swift_release();
    }
    break;
  }
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  uint64_t result = sub_24C8F8550();
  __break(1u);
  return result;
}

uint64_t sub_24C8CBB38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24C8F7AE0();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)&v28 - v8;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10 == *(void *)(a2 + 16))
  {
    if (!v10 || a1 == a2)
    {
      char v23 = 1;
    }
    else
    {
      uint64_t v11 = *(unsigned __int8 *)(v6 + 80);
      uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
      uint64_t v12 = v6 + 16;
      char v31 = v7;
      unint64_t v32 = v13;
      uint64_t v14 = (v11 + 32) & ~v11;
      uint64_t v15 = *(void *)(v12 + 56);
      uint64_t v33 = v12;
      uint64_t v29 = v15;
      unint64_t v30 = (void (**)(char *, uint64_t))(v12 - 8);
      uint64_t v16 = v10 - 1;
      uint64_t v17 = v7;
      do
      {
        uint64_t v18 = a1;
        uint64_t v19 = v9;
        uint64_t v20 = v9;
        uint64_t v21 = v32;
        v32(v19, a1 + v14, v4);
        uint64_t v22 = a2;
        v21(v17, a2 + v14, v4);
        unint64_t v9 = v20;
        sub_24C8D2388(&qword_2697F9130, MEMORY[0x263F07508]);
        char v23 = sub_24C8F7C70();
        char v24 = *v30;
        (*v30)(v17, v4);
        v24(v20, v4);
        BOOL v26 = v16-- != 0;
        if ((v23 & 1) == 0) {
          break;
        }
        v14 += v29;
        a2 = v22;
        a1 = v18;
      }
      while (v26);
    }
  }
  else
  {
    char v23 = 0;
  }
  return v23 & 1;
}

uint64_t sub_24C8CBD58(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24C8CBFD4(a1, a2, a3, (void *)*v3, &qword_2697F91F8, MEMORY[0x263F8F328]);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_24C8CBD94(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24C8CBFD4(a1, a2, a3, (void *)*v3, &qword_2697F91F0, type metadata accessor for Group);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_24C8CBDD0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24C8CBFD4(a1, a2, a3, (void *)*v3, &qword_2697F9160, type metadata accessor for User);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_24C8CBE0C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24C8CBE68(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24C8CBE2C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24C8CBFD4(a1, a2, a3, (void *)*v3, &qword_2697F9158, MEMORY[0x263F07508]);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_24C8CBE68(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9150);
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
  uint64_t result = sub_24C8F8060();
  __break(1u);
  return result;
}

uint64_t sub_24C8CBFD4(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  void v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  char v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_24C8F8060();
  __break(1u);
  return result;
}

unint64_t sub_24C8CC21C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24C8F7EA0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24C8F85A0();
        swift_bridgeObjectRetain();
        sub_24C8F7CE0();
        uint64_t v9 = sub_24C8F85D0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    size_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    size_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *size_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_24C8CC3F4(void **a1)
{
  unint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = sub_24C8C221C(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  uint64_t result = sub_24C8CC464(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_24C8CC464(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_24C8F8170();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_24C8CCB50(0, v3, 1, a1);
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
      uint64_t v94 = v11;
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
          uint64_t v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_24C8CCC20((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v97 = sub_24C8CD074((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          v100 = &v97[16 * v96 + 32];
          *(void *)v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          uint64_t v94 = v97;
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
    uint64_t v7 = sub_24C8F7D90();
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
    size_t v17 = (void *)(v10 + 16 * v13);
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
      int v19 = sub_24C8F8380();
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    BOOL v21 = (void *)(v103 + 16 * v20);
    do
    {
      uint64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_24C8F8380()))
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
      uint64_t v11 = sub_24C8CCEBC(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      uint64_t v11 = sub_24C8CCEBC((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    uint64_t v42 = v11 + 32;
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
          unint64_t v57 = &v42[16 * v12 - 32];
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
        uint64_t v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        unint64_t v68 = &v42[16 * v44];
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
        uint64_t v85 = v11;
        unint64_t v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        uint64_t v88 = v42;
        unint64_t v89 = v44;
        uint64_t v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_24C8CCC20((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)unint64_t v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        uint64_t v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        uint64_t v42 = v88;
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
        char v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        uint64_t v37 = v13;
        unint64_t v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_24C8F8380() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)unint64_t v38 = *((_OWORD *)v38 - 1);
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
  uint64_t result = sub_24C8F8000();
  __break(1u);
  return result;
}

uint64_t sub_24C8CCB50(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
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
      if (v13 || (uint64_t result = sub_24C8F8380(), (result & 1) == 0))
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

uint64_t sub_24C8CCC20(char *__src, char *a2, unint64_t a3, char *__dst)
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
      size_t v17 = &v4[16 * v13];
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
          if (v23 || (sub_24C8F8380() & 1) == 0)
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
    uint64_t v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_24C8F8380() & 1) == 0)
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
    sub_24C8CCFB8((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_24C8F8060();
  __break(1u);
  return result;
}

char *sub_24C8CCEBC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91B0);
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

char *sub_24C8CCFB8(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_24C8F8060();
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

char *sub_24C8CD074(uint64_t a1)
{
  return sub_24C8CCEBC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24C8CD088(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24C8F7AE0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_24C8D2388((unint64_t *)&qword_2697F8F50, MEMORY[0x263F07508]);
  swift_bridgeObjectRetain();
  uint64_t v33 = a2;
  uint64_t v11 = sub_24C8F7C40();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    size_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      uint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_24C8D2388(&qword_2697F9130, MEMORY[0x263F07508]);
      char v21 = sub_24C8F7C70();
      uint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      uint64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    char v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_24C8CDC38((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_24C8CD3AC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24C8F85A0();
  swift_bridgeObjectRetain();
  sub_24C8F7CE0();
  uint64_t v8 = sub_24C8F85D0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24C8F8380() & 1) != 0)
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
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_24C8F8380() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24C8CDED8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24C8CD55C()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_24C8F7AE0();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  unint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91E0);
  uint64_t v5 = sub_24C8F7ED0();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_24C8D2388((unint64_t *)&qword_2697F8F50, MEMORY[0x263F07508]);
      uint64_t result = sub_24C8F7C40();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v6;
  return result;
}

uint64_t sub_24C8CD958()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91B8);
  uint64_t v3 = sub_24C8F7ED0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    char v30 = (void *)(v2 + 56);
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
                  *char v30 = -1 << v29;
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
      int64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_24C8F85A0();
      sub_24C8F7CE0();
      uint64_t result = sub_24C8F85D0();
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
      int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *int64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_24C8CDC38(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_24C8F7AE0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  uint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_24C8CD55C();
  }
  else
  {
    if (v11 > v10)
    {
      sub_24C8CE074();
      goto LABEL_12;
    }
    sub_24C8CE4CC();
  }
  uint64_t v12 = *v3;
  sub_24C8D2388((unint64_t *)&qword_2697F8F50, MEMORY[0x263F07508]);
  uint64_t v13 = sub_24C8F7C40();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    unint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_24C8D2388(&qword_2697F9130, MEMORY[0x263F07508]);
      char v21 = sub_24C8F7C70();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_24C8F8540();
  __break(1u);
  return result;
}

uint64_t sub_24C8CDED8(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_24C8CD958();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24C8CE318();
      goto LABEL_22;
    }
    sub_24C8CE87C();
  }
  uint64_t v11 = *v4;
  sub_24C8F85A0();
  sub_24C8F7CE0();
  uint64_t result = sub_24C8F85D0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24C8F8380(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24C8F8540();
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
          uint64_t result = sub_24C8F8380();
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
  char v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *char v21 = v8;
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

void *sub_24C8CE074()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24C8F7AE0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91E0);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_24C8F7EC0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

void *sub_24C8CE318()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24C8F7EC0();
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v19 = *v17;
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

uint64_t sub_24C8CE4CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24C8F7AE0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91E0);
  uint64_t v7 = sub_24C8F7ED0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_24C8D2388((unint64_t *)&qword_2697F8F50, MEMORY[0x263F07508]);
    uint64_t result = sub_24C8F7C40();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24C8CE87C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91B8);
  uint64_t v3 = sub_24C8F7ED0();
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
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_24C8F85A0();
    swift_bridgeObjectRetain();
    sub_24C8F7CE0();
    uint64_t result = sub_24C8F85D0();
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
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *uint64_t v13 = v20;
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

uint64_t sub_24C8CEB2C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v22 = v4 + v2;
  }
  else {
    int64_t v22 = v4;
  }
  unint64_t v3 = sub_24C8C4010(isUniquelyReferenced_nonNull_native, v22, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = *(void *)(sub_24C8F7AE0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = v3 + v12 + v11 * v8;
  unint64_t v14 = a1 + v12;
  uint64_t v15 = v11 * v2;
  unint64_t v16 = v13 + v15;
  unint64_t v17 = v14 + v15;
  if (v14 < v16 && v13 < v17) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFADD__(v19, v2);
  uint64_t v21 = v19 + v2;
  if (!v20)
  {
    *(void *)(v3 + 16) = v21;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_24C8F8060();
  __break(1u);
  return result;
}

uint64_t sub_24C8CECD0(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  int64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *int64_t v5 = a4;
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
    BOOL v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
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

BOOL sub_24C8CEED0()
{
  return sub_24C8F7E80() == 0;
}

BOOL sub_24C8CEF3C()
{
  return sub_24C8F7E80() == 0;
}

uint64_t sub_24C8CEFA8(uint64_t a1, uint64_t a2)
{
  uint64_t v118 = a1;
  uint64_t v119 = a2;
  uint64_t v2 = sub_24C8F7AE0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v116 = v2;
  uint64_t v117 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v108 = (char *)&v106 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v106 = (char *)&v106 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v110 = (char *)&v106 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v107 = (char *)&v106 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v114 = (char *)&v106 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v115 = (char *)&v106 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  os_log_type_t v112 = (char *)&v106 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v113 = (char *)&v106 - v19;
  MEMORY[0x270FA5388](v18);
  v109 = (char *)&v106 - v20;
  uint64_t v21 = type metadata accessor for RecordStoreBuilderError();
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  unint64_t v24 = (char *)&v106 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v111 = (uint64_t)&v106 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  int64_t v29 = (char *)&v106 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v32 = (char *)&v106 - v31;
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  uint64_t v35 = (char *)&v106 - v34;
  uint64_t v36 = MEMORY[0x270FA5388](v33);
  uint64_t v38 = (uint64_t *)((char *)&v106 - v37);
  MEMORY[0x270FA5388](v36);
  int64_t v40 = (_DWORD *)((char *)&v106 - v39);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9220);
  uint64_t v42 = MEMORY[0x270FA5388](v41 - 8);
  unint64_t v44 = (char *)&v106 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = &v44[*(int *)(v42 + 56)];
  sub_24C8D2320(v118, (uint64_t)v44, (uint64_t (*)(void))type metadata accessor for RecordStoreBuilderError);
  sub_24C8D2320(v119, (uint64_t)v45, (uint64_t (*)(void))type metadata accessor for RecordStoreBuilderError);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_24C8D2320((uint64_t)v44, (uint64_t)v38, (uint64_t (*)(void))type metadata accessor for RecordStoreBuilderError);
      uint64_t v64 = *v38;
      uint64_t v63 = v38[1];
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_35;
      }
      if (v64 == *(void *)v45 && v63 == *((void *)v45 + 1))
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v66 = sub_24C8F8380();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v66 & 1) == 0) {
          goto LABEL_47;
        }
      }
      sub_24C8D1BC8((uint64_t)v44, (uint64_t (*)(void))type metadata accessor for RecordStoreBuilderError);
      char v46 = 1;
      return v46 & 1;
    case 2u:
      sub_24C8D2320((uint64_t)v44, (uint64_t)v35, (uint64_t (*)(void))type metadata accessor for RecordStoreBuilderError);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v48 = v116;
        uint64_t v47 = v117;
        uint64_t v49 = v109;
        (*(void (**)(char *, char *, uint64_t))(v117 + 32))(v109, v45, v116);
        char v46 = sub_24C8F7AB0();
        uint64_t v50 = *(void (**)(char *, uint64_t))(v47 + 8);
        v50(v49, v48);
        v50(v35, v48);
        goto LABEL_27;
      }
      (*(void (**)(char *, uint64_t))(v117 + 8))(v35, v116);
      goto LABEL_35;
    case 3u:
      uint64_t v51 = v44;
      sub_24C8D2320((uint64_t)v44, (uint64_t)v32, (uint64_t (*)(void))type metadata accessor for RecordStoreBuilderError);
      uint64_t v67 = *(void *)v32;
      uint64_t v68 = *((void *)v32 + 1);
      uint64_t v69 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F91C8) + 48);
      uint64_t v70 = &v32[v69];
      if (swift_getEnumCaseMultiPayload() != 3)
      {
        (*(void (**)(char *, uint64_t))(v117 + 8))(&v32[v69], v116);
        goto LABEL_32;
      }
      uint64_t v72 = *(void *)v45;
      uint64_t v71 = *((void *)v45 + 1);
      uint64_t v58 = v117;
      uint64_t v73 = *(void (**)(char *, char *, uint64_t))(v117 + 32);
      uint64_t v74 = v70;
      uint64_t v61 = v116;
      v73(v113, v74, v116);
      v73(v112, &v45[v69], v61);
      if (v67 == v72 && v68 == v71)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v62 = (uint64_t)v51;
LABEL_43:
        unint64_t v101 = v112;
        v100 = v113;
        goto LABEL_44;
      }
      char v102 = sub_24C8F8380();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v62 = (uint64_t)v51;
      if (v102) {
        goto LABEL_43;
      }
      uint64_t v104 = *(void (**)(char *, uint64_t))(v58 + 8);
      v104(v112, v61);
      uint64_t v105 = v113;
LABEL_50:
      v104(v105, v61);
      sub_24C8D1BC8(v62, (uint64_t (*)(void))type metadata accessor for RecordStoreBuilderError);
LABEL_36:
      char v46 = 0;
      return v46 & 1;
    case 4u:
      uint64_t v51 = v44;
      sub_24C8D2320((uint64_t)v44, (uint64_t)v29, (uint64_t (*)(void))type metadata accessor for RecordStoreBuilderError);
      uint64_t v52 = *(void *)v29;
      uint64_t v53 = *((void *)v29 + 1);
      uint64_t v54 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F91C8) + 48);
      BOOL v55 = &v29[v54];
      if (swift_getEnumCaseMultiPayload() != 4)
      {
        (*(void (**)(char *, uint64_t))(v117 + 8))(&v29[v54], v116);
LABEL_32:
        swift_bridgeObjectRelease();
        unint64_t v44 = v51;
        goto LABEL_35;
      }
      uint64_t v57 = *(void *)v45;
      uint64_t v56 = *((void *)v45 + 1);
      uint64_t v58 = v117;
      uint64_t v59 = *(void (**)(char *, char *, uint64_t))(v117 + 32);
      uint64_t v60 = v55;
      uint64_t v61 = v116;
      v59(v115, v60, v116);
      v59(v114, &v45[v54], v61);
      if (v52 == v57 && v53 == v56)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v62 = (uint64_t)v51;
      }
      else
      {
        char v99 = sub_24C8F8380();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v62 = (uint64_t)v51;
        if ((v99 & 1) == 0)
        {
          uint64_t v104 = *(void (**)(char *, uint64_t))(v58 + 8);
          v104(v114, v61);
          uint64_t v105 = v115;
          goto LABEL_50;
        }
      }
      unint64_t v101 = v114;
      v100 = v115;
LABEL_44:
      char v46 = sub_24C8F7AB0();
      uint64_t v103 = *(void (**)(char *, uint64_t))(v58 + 8);
      v103(v101, v61);
      v103(v100, v61);
      sub_24C8D1BC8(v62, (uint64_t (*)(void))type metadata accessor for RecordStoreBuilderError);
      return v46 & 1;
    case 5u:
      uint64_t v75 = v111;
      sub_24C8D2320((uint64_t)v44, v111, (uint64_t (*)(void))type metadata accessor for RecordStoreBuilderError);
      uint64_t v76 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F91D0) + 48);
      if (swift_getEnumCaseMultiPayload() != 5)
      {
        unint64_t v96 = *(void (**)(uint64_t, uint64_t))(v117 + 8);
        uint64_t v97 = v116;
        v96(v75 + v76, v116);
        v96(v75, v97);
        goto LABEL_35;
      }
      uint64_t v77 = &v45[v76];
      uint64_t v78 = v117;
      uint64_t v79 = *(void (**)(char *, char *, uint64_t))(v117 + 32);
      uint64_t v80 = v107;
      uint64_t v81 = v45;
      uint64_t v82 = v116;
      v79(v107, v81, v116);
      v79(v110, (char *)(v75 + v76), v82);
      unint64_t v83 = v106;
      v79(v106, v77, v82);
      char v84 = sub_24C8F7AB0();
      uint64_t v85 = *(void (**)(uint64_t, uint64_t))(v78 + 8);
      v85(v75, v82);
      if (v84)
      {
        unint64_t v86 = v110;
        char v46 = sub_24C8F7AB0();
        v85((uint64_t)v83, v82);
        v85((uint64_t)v86, v82);
        v85((uint64_t)v80, v82);
        goto LABEL_27;
      }
      v85((uint64_t)v83, v82);
      v85((uint64_t)v110, v82);
      v85((uint64_t)v80, v82);
      goto LABEL_47;
    case 6u:
      sub_24C8D2320((uint64_t)v44, (uint64_t)v24, (uint64_t (*)(void))type metadata accessor for RecordStoreBuilderError);
      uint64_t v87 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F91D8) + 48);
      uint64_t v88 = *(void *)&v24[v87];
      if (swift_getEnumCaseMultiPayload() == 6)
      {
        uint64_t v89 = *(void *)&v45[v87];
        uint64_t v90 = v117;
        uint64_t v91 = v108;
        uint64_t v92 = v45;
        uint64_t v93 = v116;
        (*(void (**)(char *, char *, uint64_t))(v117 + 32))(v108, v92, v116);
        char v94 = sub_24C8F7AB0();
        uint64_t v95 = *(void (**)(char *, uint64_t))(v90 + 8);
        v95(v24, v93);
        if (v94)
        {
          char v46 = sub_24C8CBB38(v88, v89);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v95(v91, v93);
LABEL_27:
          sub_24C8D1BC8((uint64_t)v44, (uint64_t (*)(void))type metadata accessor for RecordStoreBuilderError);
          return v46 & 1;
        }
        v95(v91, v93);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_47:
        sub_24C8D1BC8((uint64_t)v44, (uint64_t (*)(void))type metadata accessor for RecordStoreBuilderError);
      }
      else
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v117 + 8))(v24, v116);
LABEL_35:
        sub_24C8D242C((uint64_t)v44);
      }
      goto LABEL_36;
    default:
      sub_24C8D2320((uint64_t)v44, (uint64_t)v40, (uint64_t (*)(void))type metadata accessor for RecordStoreBuilderError);
      if (swift_getEnumCaseMultiPayload()) {
        goto LABEL_35;
      }
      char v46 = *v40 == *(_DWORD *)v45;
      goto LABEL_27;
  }
}

uint64_t sub_24C8CFB1C(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x263F8EE78];
    if (!v5) {
      break;
    }
    uint64_t v11 = MEMORY[0x263F8EE78];
    uint64_t result = sub_24C8F7FB0();
    if (v5 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v7 = 0;
    while (v5 != v7)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = MEMORY[0x2532FF870](v7, a1);
      }
      else
      {
        uint64_t v8 = *(void *)(a1 + 8 * v7 + 32);
        swift_retain();
      }
      uint64_t v9 = v8;
      sub_24C8C76A0(&v9, a2, &v10);
      swift_release();
      if (v2) {
        return swift_release();
      }
      ++v7;
      sub_24C8F7F90();
      sub_24C8F7FC0();
      sub_24C8F7FD0();
      sub_24C8F7FA0();
      if (v5 == v7) {
        return v11;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24C8F8020();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24C8CFC8C(unint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24C8F7AE0();
  uint64_t v23 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
LABEL_23:
    uint64_t v7 = sub_24C8F8020();
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v7)
    {
LABEL_3:
      unint64_t v8 = 0;
      uint64_t v31 = a2 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid;
      uint64_t v26 = a1 & 0xFFFFFFFFFFFFFF8;
      unint64_t v27 = a1 & 0xC000000000000001;
      unint64_t v25 = a1 + 32;
      int64_t v29 = (void (**)(char *, uint64_t))(v23 + 8);
      uint64_t v30 = v23 + 16;
      uint64_t v21 = v7;
      unint64_t v22 = a1;
      while (1)
      {
        if (v27)
        {
          a2 = MEMORY[0x2532FF870](v8, a1);
          BOOL v9 = __OFADD__(v8++, 1);
          if (v9)
          {
LABEL_20:
            __break(1u);
            return v32;
          }
        }
        else
        {
          if (v8 >= *(void *)(v26 + 16))
          {
            __break(1u);
            goto LABEL_23;
          }
          a2 = *(void *)(v25 + 8 * v8);
          swift_retain();
          BOOL v9 = __OFADD__(v8++, 1);
          if (v9) {
            goto LABEL_20;
          }
        }
        uint64_t v10 = a2 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships;
        swift_beginAccess();
        uint64_t v11 = *(void *)v10;
        if (*(void *)(*(void *)v10 + 16))
        {
          uint64_t v28 = a2;
          sub_24C8D2388((unint64_t *)&qword_2697F8F50, MEMORY[0x263F07508]);
          swift_bridgeObjectRetain();
          uint64_t v12 = sub_24C8F7C40();
          uint64_t v13 = -1 << *(unsigned char *)(v11 + 32);
          unint64_t v14 = v12 & ~v13;
          a2 = v11 + 56;
          if ((*(void *)(v11 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
          {
            unint64_t v24 = v8;
            uint64_t v15 = ~v13;
            uint64_t v16 = *(void *)(v23 + 72);
            uint64_t v17 = *(void (**)(char *, unint64_t, uint64_t))(v23 + 16);
            while (1)
            {
              v17(v6, *(void *)(v11 + 48) + v16 * v14, v4);
              sub_24C8D2388(&qword_2697F9130, MEMORY[0x263F07508]);
              char v18 = sub_24C8F7C70();
              (*v29)(v6, v4);
              if (v18) {
                break;
              }
              unint64_t v14 = (v14 + 1) & v15;
              if (((*(void *)(a2 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
              {
                swift_release();
                swift_bridgeObjectRelease();
                goto LABEL_17;
              }
            }
            swift_bridgeObjectRelease();
            sub_24C8F7F90();
            sub_24C8F7FC0();
            sub_24C8F7FD0();
            sub_24C8F7FA0();
LABEL_17:
            uint64_t v7 = v21;
            a1 = v22;
            unint64_t v8 = v24;
          }
          else
          {
            swift_release();
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          swift_release();
        }
        if (v8 == v7) {
          return v32;
        }
      }
    }
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_24C8D001C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_24C8F7E00();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_24C8CD3AC(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_24C8D00B4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v30 = a2;
  uint64_t v31 = a3;
  uint64_t v6 = sub_24C8F7AE0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  BOOL v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x263F8EE78];
    if (!v10) {
      return result;
    }
    uint64_t v37 = MEMORY[0x263F8EE78];
    uint64_t result = sub_24C8F7FB0();
    if (v10 < 0)
    {
      __break(1u);
      return result;
    }
    v22[1] = v4;
    uint64_t v23 = v9;
    uint64_t v12 = 0;
    uint64_t v28 = (void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    unint64_t v29 = a1 & 0xC000000000000001;
    uint64_t v26 = (void (**)(uint64_t, char *, uint64_t))(v7 + 32);
    uint64_t v27 = v10;
    uint64_t v24 = v6;
    unint64_t v25 = a1;
    while (v10 != v12)
    {
      if (v29)
      {
        uint64_t v15 = MEMORY[0x2532FF870](v12, a1);
      }
      else
      {
        uint64_t v15 = *(void *)(a1 + 8 * v12 + 32);
        swift_retain();
      }
      int v16 = *(_DWORD *)(v15 + 32);
      uint64_t v17 = *(void *)(v15 + 48);
      uint64_t v35 = *(void *)(v15 + 40);
      (*v28)(v9, v15 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v6);
      uint64_t v34 = v17;
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_24C8C7970(v15, v30, v31);
      uint64_t v19 = *(void *)(v18 + 16);
      if (v19)
      {
        int v32 = v16;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9150);
        uint64_t v4 = (void *)swift_allocObject();
        int64_t v20 = _swift_stdlib_malloc_size(v4);
        uint64_t v21 = v20 - 32;
        if (v20 < 32) {
          uint64_t v21 = v20 - 17;
        }
        v4[2] = v19;
        v4[3] = 2 * (v21 >> 4);
        uint64_t v33 = sub_24C8CECD0((uint64_t)v36, v4 + 4, v19, v18);
        uint64_t v6 = v36[1];
        BOOL v9 = (char *)v36[2];
        uint64_t v7 = v36[3];
        a1 = v36[4];
        swift_bridgeObjectRetain();
        sub_24C8B3A7C();
        if (v33 != v19) {
          goto LABEL_20;
        }
        swift_bridgeObjectRelease();
        uint64_t v6 = v24;
        a1 = v25;
        BOOL v9 = v23;
        int v16 = v32;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v4 = (void *)MEMORY[0x263F8EE78];
      }
      ++v12;
      type metadata accessor for RecordStore.GroupStoreRecord(0);
      uint64_t v13 = swift_allocObject();
      *(unsigned char *)(v13 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_isMutable) = 0;
      *(_DWORD *)(v13 + 16) = v16;
      uint64_t v14 = v34;
      *(void *)(v13 + 24) = v35;
      *(void *)(v13 + 32) = v14;
      (*v26)(v13 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid, v9, v6);
      *(void *)(v13 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_memberNames) = v4;
      swift_release();
      sub_24C8F7F90();
      uint64_t v7 = *(void *)(v37 + 16);
      sub_24C8F7FC0();
      sub_24C8F7FD0();
      sub_24C8F7FA0();
      uint64_t v10 = v27;
      if (v27 == v12) {
        return v37;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_24C8F8020();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_24C8D0410(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x263F8EE78];
    if (!v2) {
      break;
    }
    uint64_t v7 = MEMORY[0x263F8EE78];
    uint64_t result = sub_24C8F7FB0();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v5 = MEMORY[0x2532FF870](v4, a1);
      }
      else
      {
        uint64_t v5 = *(void *)(a1 + 8 * v4 + 32);
        swift_retain();
      }
      ++v4;
      sub_24C8C4CF4(v5);
      swift_beginAccess();
      uint64_t v6 = swift_bridgeObjectRetain();
      sub_24C8C7EE4(v6);
      swift_endAccess();
      swift_release();
      sub_24C8F7F90();
      sub_24C8F7FC0();
      sub_24C8F7FD0();
      sub_24C8F7FA0();
      if (v2 == v4) {
        return v7;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_24C8F8020();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24C8D059C(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v58 = a3;
  uint64_t v6 = type metadata accessor for RecordStore(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v59 = (uint64_t)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_24C8F7AE0();
  uint64_t v56 = *(void *)(v71 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v71);
  uint64_t v63 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v68 = (char *)&v56 - v11;
  uint64_t result = MEMORY[0x270FA5388](v10);
  uint64_t v69 = v3;
  uint64_t v70 = (char *)&v56 - v13;
  uint64_t v14 = *v3;
  unint64_t v15 = (unint64_t)*v3 >> 62;
  uint64_t v60 = 0;
  if (v15) {
    goto LABEL_64;
  }
  uint64_t v16 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  unint64_t v62 = a2;
  if (v16)
  {
    if (!(a1 >> 62))
    {
      unint64_t v66 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_6;
    }
    goto LABEL_68;
  }
LABEL_27:
  a1 = v69[1];
  if (a1 >> 62)
  {
    while (1)
    {
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_24C8F8020();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v33 & 0x8000000000000000) == 0) {
        break;
      }
      __break(1u);
LABEL_68:
      swift_bridgeObjectRetain();
      unint64_t v66 = sub_24C8F8020();
      swift_bridgeObjectRelease();
LABEL_6:
      unint64_t v17 = 0;
      unint64_t v65 = a1 & 0xC000000000000001;
      uint64_t v18 = (void (**)(char *, uint64_t, uint64_t))(v56 + 16);
      uint64_t v19 = (void (**)(char *, uint64_t))(v56 + 8);
      uint64_t v64 = a1;
      uint64_t v57 = v16;
      int64_t v20 = v70;
      while (v17 != v16)
      {
        uint64_t v21 = *v69;
        if ((*v69 & 0xC000000000000001) != 0)
        {
          uint64_t v61 = MEMORY[0x2532FF870](v17);
          if (v66) {
            goto LABEL_13;
          }
        }
        else
        {
          if (v17 >= *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_61;
          }
          uint64_t v61 = *(void *)(v21 + 8 * v17 + 32);
          swift_retain();
          if (v66)
          {
LABEL_13:
            uint64_t v67 = v17;
            swift_bridgeObjectRetain();
            uint64_t v22 = 4;
            while (1)
            {
              if (v65)
              {
                uint64_t v23 = MEMORY[0x2532FF870](v22 - 4, a1);
              }
              else
              {
                uint64_t v23 = *(void *)(a1 + 8 * v22);
                swift_retain();
              }
              a1 = v67;
              a2 = v22 - 3;
              if (__OFADD__(v22 - 4, 1)) {
                break;
              }
              uint64_t v24 = *v18;
              (*v18)(v70, v23 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v71);
              uint64_t v25 = *v69;
              if ((*v69 & 0xC000000000000001) != 0)
              {
                uint64_t v26 = MEMORY[0x2532FF870](a1);
              }
              else
              {
                if (a1 >= *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                  goto LABEL_57;
                }
                uint64_t v26 = *(void *)(v25 + 8 * a1 + 32);
                swift_retain();
              }
              uint64_t v27 = v26 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_uuid;
              swift_beginAccess();
              uint64_t v28 = v68;
              uint64_t v29 = v27;
              uint64_t v30 = v71;
              v24(v68, v29, v71);
              swift_release();
              char v31 = sub_24C8F7AB0();
              int v32 = *v19;
              (*v19)(v28, v30);
              v32(v20, v30);
              swift_release();
              a1 = v64;
              if ((v31 & 1) == 0)
              {
                ++v22;
                if (a2 != v66) {
                  continue;
                }
              }
              swift_bridgeObjectRelease();
              a2 = v62;
              uint64_t v16 = v57;
              unint64_t v17 = v67;
              goto LABEL_8;
            }
            __break(1u);
LABEL_57:
            __break(1u);
LABEL_58:
            __break(1u);
LABEL_59:
            __break(1u);
            break;
          }
        }
        char v31 = 0;
LABEL_8:
        ++v17;
        *(unsigned char *)(v61 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_isMutable) = v31 & 1;
        uint64_t result = swift_release();
        if (v17 == v16) {
          goto LABEL_27;
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
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_24C8F8020();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v16 & 0x8000000000000000) == 0) {
        goto LABEL_3;
      }
      __break(1u);
    }
  }
  else
  {
    uint64_t v33 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v33)
  {
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v67 = sub_24C8F8020();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v67 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    a1 = 0;
    unint64_t v66 = a2 & 0xC000000000000001;
    uint64_t v70 = (char *)(v56 + 16);
    uint64_t v34 = (void (**)(char *, uint64_t))(v56 + 8);
    uint64_t v64 = v33;
    do
    {
      if (a1 == v33) {
        goto LABEL_62;
      }
      uint64_t v40 = v69[1];
      if ((v40 & 0xC000000000000001) != 0)
      {
        uint64_t v41 = MEMORY[0x2532FF870](a1);
        if (v67) {
          goto LABEL_39;
        }
      }
      else
      {
        if (a1 >= *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_63;
        }
        uint64_t v41 = *(void *)(v40 + 8 * a1 + 32);
        swift_retain();
        if (v67)
        {
LABEL_39:
          unint64_t v65 = v41;
          swift_bridgeObjectRetain();
          uint64_t v42 = 4;
          while (1)
          {
            uint64_t v43 = v42 - 4;
            if (v66)
            {
              uint64_t v44 = MEMORY[0x2532FF870](v42 - 4, a2);
              uint64_t v45 = v42 - 3;
              if (__OFADD__(v43, 1)) {
                goto LABEL_58;
              }
            }
            else
            {
              uint64_t v44 = *(void *)(a2 + 8 * v42);
              swift_retain();
              uint64_t v45 = v42 - 3;
              if (__OFADD__(v43, 1)) {
                goto LABEL_58;
              }
            }
            char v46 = *(void (**)(char *, uint64_t, uint64_t))v70;
            (*(void (**)(char *, uint64_t, uint64_t))v70)(v63, v44 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v71);
            uint64_t v47 = v69[1];
            if ((v47 & 0xC000000000000001) != 0)
            {
              uint64_t v48 = MEMORY[0x2532FF870](a1);
            }
            else
            {
              if (a1 >= *(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                goto LABEL_59;
              }
              uint64_t v48 = *(void *)(v47 + 8 * a1 + 32);
              swift_retain();
            }
            uint64_t v49 = v48 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid;
            swift_beginAccess();
            uint64_t v50 = v68;
            uint64_t v51 = v49;
            uint64_t v52 = v71;
            v46(v68, v51, v71);
            swift_release();
            uint64_t v53 = v63;
            char v54 = sub_24C8F7AB0();
            BOOL v55 = *v34;
            (*v34)(v50, v52);
            v55(v53, v52);
            swift_release();
            if (v54) {
              break;
            }
            ++v42;
            a2 = v62;
            if (v45 == v67)
            {
              swift_bridgeObjectRelease();
              uint64_t v33 = v64;
              uint64_t v41 = v65;
              goto LABEL_33;
            }
          }
          a2 = v62;
          swift_bridgeObjectRelease();
          uint64_t v35 = v59;
          sub_24C8D2320((uint64_t)v69, v59, type metadata accessor for RecordStore);
          char v39 = 1;
          uint64_t v33 = v64;
          uint64_t v41 = v65;
          goto LABEL_34;
        }
      }
LABEL_33:
      uint64_t v35 = v59;
      uint64_t v36 = sub_24C8D2320((uint64_t)v69, v59, type metadata accessor for RecordStore);
      MEMORY[0x270FA5388](v36);
      *(&v56 - 2) = v35;
      *(&v56 - 1) = a1;
      uint64_t v37 = v58;
      swift_bridgeObjectRetain();
      uint64_t v38 = v60;
      char v39 = sub_24C8C9F80((uint64_t (*)(char *))sub_24C8D0DB4, (uint64_t)(&v56 - 4), v37);
      uint64_t v60 = v38;
      swift_bridgeObjectRelease();
LABEL_34:
      ++a1;
      sub_24C8D1BC8(v35, type metadata accessor for RecordStore);
      *(unsigned char *)(v41 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_isMutable) = v39 & 1;
      uint64_t result = swift_release();
    }
    while (a1 != v33);
  }
  return result;
}

unint64_t sub_24C8D0D60()
{
  unint64_t result = qword_2697F91A8;
  if (!qword_2697F91A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F91A8);
  }
  return result;
}

uint64_t sub_24C8D0DB4(uint64_t a1)
{
  return sub_24C8CB070(a1, *(void *)(v1 + 16), *(void *)(v1 + 24)) & 1;
}

uint64_t type metadata accessor for RecordStoreBuilderError()
{
  uint64_t result = qword_2697F9200;
  if (!qword_2697F9200) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C8D0E20()
{
  return sub_24C8F7C70() & 1;
}

BOOL sub_24C8D0EB0(uint64_t a1)
{
  return *(_DWORD *)(*(void *)a1 + 32) == *(_DWORD *)(**(void **)(v1 + 16) + 32);
}

BOOL sub_24C8D0ED0()
{
  return sub_24C8CEED0();
}

BOOL sub_24C8D0EF0(uint64_t *a1)
{
  return sub_24C8CA33C(*a1, **(void **)(v1 + 16));
}

uint64_t sub_24C8D0F18()
{
  return sub_24C8D109C() & 1;
}

uint64_t sub_24C8D0F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = a2;
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v3 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v4 = *(v3 - 1);
      uint64_t v5 = *v3;
      swift_bridgeObjectRetain();
      sub_24C8CD3AC(&v7, v4, v5);
      swift_bridgeObjectRelease();
      v3 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return a2;
}

unint64_t sub_24C8D0FBC()
{
  unint64_t result = qword_2697F91E8;
  if (!qword_2697F91E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F91E8);
  }
  return result;
}

BOOL sub_24C8D1010(uint64_t a1)
{
  return *(_DWORD *)(*(void *)a1 + 16) == *(_DWORD *)(**(void **)(v1 + 16) + 16);
}

BOOL sub_24C8D1030()
{
  return sub_24C8CEF3C();
}

BOOL sub_24C8D1050(uint64_t *a1)
{
  return sub_24C8CA4AC(*a1, **(void **)(v1 + 16));
}

uint64_t sub_24C8D1078()
{
  return sub_24C8D109C() & 1;
}

uint64_t sub_24C8D109C()
{
  return sub_24C8F7AB0() & 1;
}

uint64_t *sub_24C8D10E0(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v7 = a2[1];
        *a1 = *a2;
        a1[1] = v7;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        uint64_t v10 = sub_24C8F7AE0();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
      case 4u:
        uint64_t v11 = a2[1];
        *a1 = *a2;
        a1[1] = v11;
        swift_bridgeObjectRetain();
        uint64_t v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F91C8) + 48);
        uint64_t v13 = (char *)a1 + v12;
        uint64_t v14 = (char *)a2 + v12;
        uint64_t v15 = sub_24C8F7AE0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
        swift_storeEnumTagMultiPayload();
        break;
      case 5u:
        uint64_t v16 = sub_24C8F7AE0();
        unint64_t v17 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v16 - 8) + 16);
        v17(a1, a2, v16);
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91D0);
        v17((uint64_t *)((char *)a1 + *(int *)(v18 + 48)), (uint64_t *)((char *)a2 + *(int *)(v18 + 48)), v16);
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        uint64_t v19 = sub_24C8F7AE0();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v19 - 8) + 16))(a1, a2, v19);
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91D8);
        *(uint64_t *)((char *)a1 + *(int *)(v20 + 48)) = *(uint64_t *)((char *)a2 + *(int *)(v20 + 48));
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_24C8D1410(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 1:
      goto LABEL_9;
    case 2:
      goto LABEL_3;
    case 3:
    case 4:
      swift_bridgeObjectRelease();
      a1 += *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F91C8) + 48);
LABEL_3:
      uint64_t v3 = sub_24C8F7AE0();
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t v5 = v3;
      uint64_t v6 = a1;
      goto LABEL_5;
    case 5:
      uint64_t v7 = sub_24C8F7AE0();
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
      ((void (*)(void *__return_ptr, uint64_t, uint64_t))v9)((void *)(v7 - 8), a1, v7);
      uint64_t v6 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F91D0) + 48);
      uint64_t v5 = v7;
      uint64_t v4 = v9;
LABEL_5:
      uint64_t result = v4(v6, v5);
      break;
    case 6:
      uint64_t v8 = sub_24C8F7AE0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91D8);
LABEL_9:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void *sub_24C8D15C8(void *a1, void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
      goto LABEL_8;
    case 2u:
      uint64_t v7 = sub_24C8F7AE0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      goto LABEL_8;
    case 3u:
    case 4u:
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      uint64_t v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F91C8) + 48);
      uint64_t v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = sub_24C8F7AE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
      goto LABEL_8;
    case 5u:
      uint64_t v13 = sub_24C8F7AE0();
      uint64_t v14 = *(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16);
      v14(a1, a2, v13);
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91D0);
      v14((void *)((char *)a1 + *(int *)(v15 + 48)), (void *)((char *)a2 + *(int *)(v15 + 48)), v13);
      goto LABEL_8;
    case 6u:
      uint64_t v16 = sub_24C8F7AE0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(a1, a2, v16);
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91D8);
      *(void *)((char *)a1 + *(int *)(v17 + 48)) = *(void *)((char *)a2 + *(int *)(v17 + 48));
      swift_bridgeObjectRetain();
LABEL_8:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *sub_24C8D18A0(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24C8D1BC8((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for RecordStoreBuilderError);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        uint64_t v6 = sub_24C8F7AE0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
      case 4u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F91C8) + 48);
        uint64_t v8 = (char *)a1 + v7;
        uint64_t v9 = (char *)a2 + v7;
        uint64_t v10 = sub_24C8F7AE0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
        swift_storeEnumTagMultiPayload();
        break;
      case 5u:
        uint64_t v11 = sub_24C8F7AE0();
        uint64_t v12 = *(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16);
        v12(a1, a2, v11);
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91D0);
        v12((void *)((char *)a1 + *(int *)(v13 + 48)), (void *)((char *)a2 + *(int *)(v13 + 48)), v11);
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        uint64_t v14 = sub_24C8F7AE0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(a1, a2, v14);
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91D8);
        *(void *)((char *)a1 + *(int *)(v15 + 48)) = *(void *)((char *)a2 + *(int *)(v15 + 48));
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_24C8D1BC8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *sub_24C8D1C28(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
      uint64_t v6 = sub_24C8F7AE0();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      goto LABEL_7;
    case 3u:
    case 4u:
      *a1 = *a2;
      uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F91C8) + 48);
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_24C8F7AE0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      goto LABEL_7;
    case 5u:
      uint64_t v11 = sub_24C8F7AE0();
      uint64_t v12 = *(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v11 - 8) + 32);
      v12(a1, a2, v11);
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91D0);
      v12((_OWORD *)((char *)a1 + *(int *)(v13 + 48)), (_OWORD *)((char *)a2 + *(int *)(v13 + 48)), v11);
      goto LABEL_7;
    case 6u:
      uint64_t v14 = sub_24C8F7AE0();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v14 - 8) + 32))(a1, a2, v14);
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91D8);
      *(void *)((char *)a1 + *(int *)(v15 + 48)) = *(void *)((char *)a2 + *(int *)(v15 + 48));
LABEL_7:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_OWORD *sub_24C8D1ED4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24C8D1BC8((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for RecordStoreBuilderError);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 2u:
        uint64_t v6 = sub_24C8F7AE0();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
        goto LABEL_8;
      case 3u:
      case 4u:
        *a1 = *a2;
        uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F91C8) + 48);
        uint64_t v8 = (char *)a1 + v7;
        uint64_t v9 = (char *)a2 + v7;
        uint64_t v10 = sub_24C8F7AE0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
        goto LABEL_8;
      case 5u:
        uint64_t v11 = sub_24C8F7AE0();
        uint64_t v12 = *(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v11 - 8) + 32);
        v12(a1, a2, v11);
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91D0);
        v12((_OWORD *)((char *)a1 + *(int *)(v13 + 48)), (_OWORD *)((char *)a2 + *(int *)(v13 + 48)), v11);
        goto LABEL_8;
      case 6u:
        uint64_t v14 = sub_24C8F7AE0();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v14 - 8) + 32))(a1, a2, v14);
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F91D8);
        *(void *)((char *)a1 + *(int *)(v15 + 48)) = *(void *)((char *)a2 + *(int *)(v15 + 48));
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

uint64_t sub_24C8D21A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_24C8D21CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24C8D21F8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24C8D2208()
{
  uint64_t v6 = MEMORY[0x263F8CF68] + 64;
  uint64_t v7 = &unk_24C8F9968;
  uint64_t result = sub_24C8F7AE0();
  if (v1 <= 0x3F)
  {
    uint64_t v8 = *(void *)(result - 8) + 64;
    swift_getTupleTypeLayout2();
    uint64_t v9 = &v5;
    swift_getTupleTypeLayout2();
    uint64_t v10 = &v4;
    swift_getTupleTypeLayout2();
    uint64_t v11 = &v3;
    swift_getTupleTypeLayout2();
    uint64_t v12 = &v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_24C8D2320(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24C8D2388(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24C8D23D0()
{
  unint64_t result = qword_2697F9218;
  if (!qword_2697F9218)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697F9028);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9218);
  }
  return result;
}

uint64_t sub_24C8D242C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9220);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeLocalUsersAndGroups(andPerform:)(void (*a1)(unint64_t *, unint64_t *), unint64_t a2)
{
  if (qword_2697F8F00 != -1) {
    swift_once();
  }

  return sub_24C8B2DF4(a1, a2, (uint64_t)qword_2697F9228);
}

uint64_t updateLocalUsersAndGroups(perform:)(void (*a1)(unint64_t *, unint64_t *), unint64_t a2)
{
  if (qword_2697F8F00 != -1) {
    swift_once();
  }
  v5[3] = &type metadata for ProviderSideEffects;
  v5[4] = &off_26FEFB548;
  v5[0] = swift_allocObject();
  sub_24C8B37CC((uint64_t)qword_2697F9228, v5[0] + 16);
  sub_24C8D261C(a1, a2, v5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

uint64_t sub_24C8D25C8()
{
  return sub_24C8B074C(qword_2697F9228);
}

uint64_t sub_24C8D25D4()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);

  return MEMORY[0x270FA0238](v0, 136, 7);
}

uint64_t sub_24C8D261C(void (*a1)(unint64_t *, unint64_t *), unint64_t a2, void *a3)
{
  uint64_t v6 = type metadata accessor for RecordManager();
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a3[3];
  uint64_t v11 = a3[4];
  uint64_t v12 = __swift_project_boxed_opaque_existential_1(a3, v10);
  uint64_t v13 = (uint64_t *)&v9[*(int *)(v7 + 28)];
  v13[3] = v10;
  v13[4] = *(void *)(v11 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(boxed_opaque_existential_1, v12, v10);
  sub_24C8F7B00();
  if (qword_2697F8F08 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_24C8F7B10();
  uint64_t v37 = __swift_project_value_buffer(v15, (uint64_t)qword_2697F92A0);
  uint64_t v16 = sub_24C8F7AF0();
  os_log_type_t v17 = sub_24C8F7E40();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_24C8A9000, v16, v17, "Updating local domain...", v18, 2u);
    MEMORY[0x253300580](v18, -1, -1);
  }

  HIDWORD(v36) = sub_24C8C3648();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  unint64_t v25 = sub_24C8AB78C(1);
  uint64_t v26 = v38;
  uint64_t v28 = sub_24C8D7840(v25, v27, a1, a2, v22);
  if (v26)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v32 = sub_24C8F7AF0();
    os_log_type_t v33 = sub_24C8F7E30();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_24C8A9000, v32, v33, "Failed to update local domain.", v34, 2u);
      MEMORY[0x253300580](v34, -1, -1);
    }

    swift_willThrow();
    return sub_24C8D8D40((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for RecordManager);
  }
  else
  {
    unint64_t v30 = (unint64_t)v28;
    unint64_t v31 = v29;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_24C8BA0D0(v30, v31, BYTE4(v36) & 1, v20, (void (*)(char *, uint64_t, uint64_t))v22, v24);
    sub_24C8D8D40((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for RecordManager);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24C8D29A8()
{
  uint64_t v0 = sub_24C8F7B10();
  __swift_allocate_value_buffer(v0, qword_2697F92A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2697F92A0);
  return sub_24C8F7B00();
}

uint64_t User.uid.getter()
{
  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for User(0) + 20));
}

uint64_t type metadata accessor for User(uint64_t a1)
{
  return sub_24C8B7B74(a1, (uint64_t *)&unk_2697F92C8);
}

uint64_t User.uid.setter(int a1)
{
  uint64_t result = type metadata accessor for User(0);
  *(_DWORD *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*User.uid.modify())()
{
  return nullsub_1;
}

uint64_t User.name.getter()
{
  return sub_24C8D3BA4(type metadata accessor for User);
}

uint64_t User.name.setter(uint64_t a1, uint64_t a2)
{
  return sub_24C8D3C04(a1, a2, type metadata accessor for User);
}

uint64_t (*User.name.modify())()
{
  return nullsub_1;
}

uint64_t User.primaryGroupUUID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for User(0) + 28);
  uint64_t v4 = sub_24C8F7AE0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t User.primaryGroupUUID.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for User(0) + 28);
  uint64_t v4 = sub_24C8F7AE0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*User.primaryGroupUUID.modify())()
{
  return nullsub_1;
}

uint64_t User.fullName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for User(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.fullName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for User(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*User.fullName.modify())()
{
  return nullsub_1;
}

uint64_t User.homeDirectory.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for User(0) + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.homeDirectory.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for User(0) + 36));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*User.homeDirectory.modify())()
{
  return nullsub_1;
}

uint64_t User.shell.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for User(0) + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.shell.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for User(0) + 40));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*User.shell.modify())()
{
  return nullsub_1;
}

uint64_t User.memberships.getter()
{
  type metadata accessor for User(0);

  return swift_bridgeObjectRetain();
}

uint64_t User.memberships.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for User(0) + 44);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*User.memberships.modify())()
{
  return nullsub_1;
}

uint64_t User.aliases.getter()
{
  type metadata accessor for User(0);

  return swift_bridgeObjectRetain();
}

uint64_t User.aliases.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for User(0) + 48);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*User.aliases.modify())()
{
  return nullsub_1;
}

uint64_t User.hash(into:)(long long *a1)
{
  uint64_t v2 = v1;
  sub_24C8F7AE0();
  sub_24C8D61EC((unint64_t *)&qword_2697F8F50, MEMORY[0x263F07508]);
  sub_24C8F7C50();
  uint64_t v4 = type metadata accessor for User(0);
  sub_24C8F85C0();
  swift_bridgeObjectRetain();
  sub_24C8F7CE0();
  swift_bridgeObjectRelease();
  sub_24C8F7C50();
  swift_bridgeObjectRetain();
  sub_24C8F7CE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C8F7CE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C8F7CE0();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v1 + *(int *)(v4 + 44));
  swift_bridgeObjectRetain();
  sub_24C8D57C4(a1, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v2 + *(int *)(v4 + 48));
  swift_bridgeObjectRetain();
  sub_24C8D562C((uint64_t)a1, v6);

  return swift_bridgeObjectRelease();
}

uint64_t sub_24C8D3250(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24C8F7AE0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v48 = (char *)&v35 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9650);
  uint64_t result = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 == a2) {
    return 1;
  }
  if (*(void *)(a1 + 16) == *(void *)(a2 + 16))
  {
    int64_t v14 = 0;
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v38 = a1 + 56;
    uint64_t v16 = 1 << *(unsigned char *)(a1 + 32);
    if (v16 < 64) {
      uint64_t v17 = ~(-1 << v16);
    }
    else {
      uint64_t v17 = -1;
    }
    unint64_t v18 = v17 & v15;
    int64_t v39 = (unint64_t)(v16 + 63) >> 6;
    uint64_t v44 = v5 + 48;
    uint64_t v45 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    uint64_t v43 = (void (**)(char *, char *, uint64_t))(v5 + 32);
    uint64_t v46 = a2 + 56;
    uint64_t v47 = v5 + 16;
    uint64_t v19 = (void (**)(char *, uint64_t))(v5 + 8);
    uint64_t v36 = v5;
    uint64_t v37 = a1;
    uint64_t v35 = v13;
    if (!v18) {
      goto LABEL_8;
    }
LABEL_7:
    uint64_t v41 = (v18 - 1) & v18;
    int64_t v42 = v14;
    for (unint64_t i = __clz(__rbit64(v18)) | (v14 << 6); ; unint64_t i = __clz(__rbit64(v22)) + (v23 << 6))
    {
      uint64_t v25 = *(void *)(v5 + 72);
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      v26(v13, *(void *)(a1 + 48) + v25 * i, v4);
      uint64_t v27 = 1;
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v13, 0, 1, v4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4) == 1) {
        return v27;
      }
      (*v43)(v48, v13, v4);
      sub_24C8D61EC((unint64_t *)&qword_2697F8F50, MEMORY[0x263F07508]);
      uint64_t v28 = sub_24C8F7C40();
      uint64_t v29 = -1 << *(unsigned char *)(a2 + 32);
      unint64_t v30 = v28 & ~v29;
      if (((*(void *)(v46 + ((v30 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v30) & 1) == 0)
      {
        (*v19)(v48, v4);
        return 0;
      }
      uint64_t v40 = (unint64_t)v19 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      uint64_t v31 = a2;
      uint64_t v32 = ~v29;
      while (1)
      {
        v26(v8, *(void *)(v31 + 48) + v30 * v25, v4);
        sub_24C8D61EC(&qword_2697F9130, MEMORY[0x263F07508]);
        char v33 = sub_24C8F7C70();
        uint64_t v34 = *v19;
        (*v19)(v8, v4);
        if (v33) {
          break;
        }
        unint64_t v30 = (v30 + 1) & v32;
        if (((*(void *)(v46 + ((v30 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v30) & 1) == 0)
        {
          v34(v48, v4);
          return 0;
        }
      }
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v34)(v48, v4);
      a2 = v31;
      uint64_t v5 = v36;
      a1 = v37;
      uint64_t v13 = v35;
      unint64_t v18 = v41;
      int64_t v14 = v42;
      if (v41) {
        goto LABEL_7;
      }
LABEL_8:
      int64_t v21 = v14 + 1;
      if (__OFADD__(v14, 1)) {
        break;
      }
      if (v21 >= v39) {
        goto LABEL_34;
      }
      unint64_t v22 = *(void *)(v38 + 8 * v21);
      int64_t v23 = v14 + 1;
      if (!v22)
      {
        int64_t v23 = v14 + 2;
        if (v14 + 2 >= v39) {
          goto LABEL_34;
        }
        unint64_t v22 = *(void *)(v38 + 8 * v23);
        if (!v22)
        {
          int64_t v23 = v14 + 3;
          if (v14 + 3 >= v39) {
            goto LABEL_34;
          }
          unint64_t v22 = *(void *)(v38 + 8 * v23);
          if (!v22)
          {
            uint64_t v24 = v14 + 4;
            if (v14 + 4 >= v39)
            {
LABEL_34:
              uint64_t v27 = 1;
              (*v45)(v13, 1, 1, v4);
              return v27;
            }
            unint64_t v22 = *(void *)(v38 + 8 * v24);
            if (!v22)
            {
              while (1)
              {
                int64_t v23 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_36;
                }
                if (v23 >= v39) {
                  goto LABEL_34;
                }
                unint64_t v22 = *(void *)(v38 + 8 * v23);
                ++v24;
                if (v22) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v23 = v14 + 4;
          }
        }
      }
LABEL_21:
      uint64_t v41 = (v22 - 1) & v22;
      int64_t v42 = v23;
    }
    __break(1u);
LABEL_36:
    __break(1u);
    return result;
  }
  return 0;
}

uint64_t sub_24C8D3738(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v29 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v30 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      int64_t v31 = v3;
      unint64_t v9 = v8 | (v3 << 6);
      goto LABEL_24;
    }
    int64_t v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_43;
    }
    if (v10 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v10);
    int64_t v12 = v3 + 1;
    if (!v11)
    {
      int64_t v12 = v3 + 2;
      if (v3 + 2 >= v30) {
        return 1;
      }
      unint64_t v11 = *(void *)(v29 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v3 + 3;
        if (v3 + 3 >= v30) {
          return 1;
        }
        unint64_t v11 = *(void *)(v29 + 8 * v12);
        if (!v11) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v11 - 1) & v11;
    int64_t v31 = v12;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_24:
    uint64_t v14 = result;
    uint64_t v15 = (uint64_t *)(*(void *)(result + 48) + 16 * v9);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_24C8F85A0();
    swift_bridgeObjectRetain();
    sub_24C8F7CE0();
    uint64_t v18 = sub_24C8F85D0();
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
      goto LABEL_39;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    unint64_t v22 = (void *)(v21 + 16 * v20);
    BOOL v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_24C8F8380() & 1) == 0)
    {
      uint64_t v24 = ~v19;
      for (unint64_t i = v20 + 1; ; unint64_t i = v26 + 1)
      {
        uint64_t v26 = i & v24;
        if (((*(void *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        uint64_t v27 = (void *)(v21 + 16 * v26);
        BOOL v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_24C8F8380() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_39:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    uint64_t result = v14;
    int64_t v3 = v31;
  }
  uint64_t v13 = v3 + 4;
  if (v3 + 4 >= v30) {
    return 1;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v13);
  if (v11)
  {
    int64_t v12 = v3 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v12 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v12);
    ++v13;
    if (v11) {
      goto LABEL_23;
    }
  }
LABEL_43:
  __break(1u);
  return result;
}

uint64_t User.hashValue.getter()
{
  sub_24C8F85A0();
  User.hash(into:)(v1);
  return sub_24C8F85D0();
}

uint64_t sub_24C8D3A00()
{
  sub_24C8F85A0();
  User.hash(into:)(v1);
  return sub_24C8F85D0();
}

uint64_t sub_24C8D3A44()
{
  sub_24C8F85A0();
  User.hash(into:)(v1);
  return sub_24C8F85D0();
}

uint64_t _s23DarwinDirectoryInternal4UserV4uuid10Foundation4UUIDVvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24C8F7AE0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t Group.gid.getter()
{
  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for Group(0) + 20));
}

uint64_t Group.gid.setter(int a1)
{
  uint64_t result = type metadata accessor for Group(0);
  *(_DWORD *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*Group.gid.modify())()
{
  return nullsub_1;
}

uint64_t Group.name.getter()
{
  return sub_24C8D3BA4(type metadata accessor for Group);
}

uint64_t sub_24C8D3BA4(uint64_t (*a1)(void))
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1(0) + 24));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t Group.name.setter(uint64_t a1, uint64_t a2)
{
  return sub_24C8D3C04(a1, a2, type metadata accessor for Group);
}

uint64_t sub_24C8D3C04(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  unint64_t v6 = (void *)(v3 + *(int *)(a3(0) + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*Group.name.modify())()
{
  return nullsub_1;
}

uint64_t Group.fullName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for Group(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Group.fullName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for Group(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*Group.fullName.modify())()
{
  return nullsub_1;
}

uint64_t Group.nestedGroups.getter()
{
  type metadata accessor for Group(0);

  return swift_bridgeObjectRetain();
}

uint64_t Group.nestedGroups.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for Group(0) + 32);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*Group.nestedGroups.modify())()
{
  return nullsub_1;
}

uint64_t Group.aliases.getter()
{
  type metadata accessor for Group(0);

  return swift_bridgeObjectRetain();
}

uint64_t Group.aliases.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for Group(0) + 36);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*Group.aliases.modify())()
{
  return nullsub_1;
}

uint64_t Group.hash(into:)(long long *a1)
{
  uint64_t v2 = v1;
  sub_24C8F7AE0();
  sub_24C8D61EC((unint64_t *)&qword_2697F8F50, MEMORY[0x263F07508]);
  sub_24C8F7C50();
  uint64_t v4 = type metadata accessor for Group(0);
  sub_24C8F85C0();
  swift_bridgeObjectRetain();
  sub_24C8F7CE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C8F7CE0();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v1 + *(int *)(v4 + 32));
  swift_bridgeObjectRetain();
  sub_24C8D57C4(a1, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v2 + *(int *)(v4 + 36));
  swift_bridgeObjectRetain();
  sub_24C8D562C((uint64_t)a1, v6);

  return swift_bridgeObjectRelease();
}

uint64_t Group.hashValue.getter()
{
  uint64_t v1 = v0;
  sub_24C8F85A0();
  sub_24C8F7AE0();
  sub_24C8D61EC((unint64_t *)&qword_2697F8F50, MEMORY[0x263F07508]);
  sub_24C8F7C50();
  uint64_t v2 = type metadata accessor for Group(0);
  sub_24C8F85C0();
  swift_bridgeObjectRetain();
  sub_24C8F7CE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C8F7CE0();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)(v0 + *(int *)(v2 + 32));
  swift_bridgeObjectRetain();
  sub_24C8D57C4(v6, v3);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v1 + *(int *)(v2 + 36));
  swift_bridgeObjectRetain();
  sub_24C8D562C((uint64_t)v6, v4);
  swift_bridgeObjectRelease();
  return sub_24C8F85D0();
}

uint64_t sub_24C8D4188(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  sub_24C8F85A0();
  sub_24C8F7AE0();
  sub_24C8D61EC((unint64_t *)&qword_2697F8F50, MEMORY[0x263F07508]);
  sub_24C8F7C50();
  sub_24C8F85C0();
  swift_bridgeObjectRetain();
  sub_24C8F7CE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C8F7CE0();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v2 + *(int *)(a2 + 32));
  swift_bridgeObjectRetain();
  sub_24C8D57C4(v8, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v4 + *(int *)(a2 + 36));
  swift_bridgeObjectRetain();
  sub_24C8D562C((uint64_t)v8, v6);
  swift_bridgeObjectRelease();
  return sub_24C8F85D0();
}

uint64_t sub_24C8D42D0(unint64_t a1, unint64_t a2)
{
  uint64_t v49 = sub_24C8F7AE0();
  uint64_t v5 = *(void *)(v49 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v49);
  uint64_t v46 = (void (**)(char *, uint64_t, uint64_t))((char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v6);
  uint64_t v48 = (char *)&v42 - v8;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24C8F8020();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (v9)
  {
    uint64_t v56 = MEMORY[0x263F8EE78];
    uint64_t result = sub_24C8F7FB0();
    if (v9 < 0)
    {
      __break(1u);
      goto LABEL_39;
    }
    uint64_t v50 = v5;
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v12 = 0;
      do
      {
        uint64_t v13 = v12 + 1;
        MEMORY[0x2532FF870]();
        sub_24C8DBE20();
        swift_unknownObjectRelease();
        sub_24C8F7F90();
        sub_24C8F7FC0();
        sub_24C8F7FD0();
        sub_24C8F7FA0();
        uint64_t v12 = v13;
      }
      while (v9 != v13);
    }
    else
    {
      unint64_t v14 = a1 + 32;
      do
      {
        v14 += 8;
        sub_24C8DBE20();
        sub_24C8F7F90();
        sub_24C8F7FC0();
        sub_24C8F7FD0();
        sub_24C8F7FA0();
        --v9;
      }
      while (v9);
    }
    uint64_t v10 = v56;
    uint64_t v5 = v50;
  }
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_24C8F8020();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v15) {
    return v10;
  }
  uint64_t v56 = MEMORY[0x263F8EE78];
  uint64_t result = sub_24C8F7FB0();
  if ((v15 & 0x8000000000000000) == 0)
  {
    uint64_t v43 = v10;
    uint64_t v44 = v2;
    if ((a2 & 0xC000000000000001) != 0)
    {
      uint64_t v16 = 0;
      uint64_t v45 = (void (**)(uint64_t, char *, uint64_t))(v5 + 32);
      uint64_t v46 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
      uint64_t v47 = (void (**)(uint64_t, char *, uint64_t))a2;
      uint64_t v55 = v15;
      uint64_t v17 = v48;
      uint64_t v18 = v49;
      do
      {
        uint64_t v19 = MEMORY[0x2532FF870](v16, a2);
        int v54 = *(_DWORD *)(v19 + 24);
        uint64_t v20 = *(void *)(v19 + 40);
        uint64_t v53 = *(void *)(v19 + 32);
        (*v46)(v17, v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_uuid, v18);
        uint64_t v21 = *(void *)(v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_fullName + 8);
        uint64_t v52 = *(void *)(v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_fullName);
        if (*(void *)(v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups)) {
          uint64_t v22 = *(void *)(v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups);
        }
        else {
          uint64_t v22 = MEMORY[0x263F8EE88];
        }
        uint64_t v51 = v22;
        if (*(void *)(v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases)) {
          uint64_t v23 = *(void *)(v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases);
        }
        else {
          uint64_t v23 = MEMORY[0x263F8EE88];
        }
        uint64_t v50 = v23;
        ++v16;
        type metadata accessor for GroupRecord(0);
        uint64_t v24 = swift_allocObject();
        *(_DWORD *)(v24 + 32) = v54;
        *(void *)(v24 + 40) = v53;
        *(void *)(v24 + 48) = v20;
        (*v45)(v24 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v17, v18);
        uint64_t v25 = v51;
        *(void *)(v24 + 16) = v52;
        *(void *)(v24 + 24) = v21;
        *(void *)(v24 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups) = v25;
        *(void *)(v24 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases) = v50;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_unknownObjectRelease();
        sub_24C8F7F90();
        sub_24C8F7FC0();
        a2 = (unint64_t)v47;
        uint64_t v26 = v55;
        sub_24C8F7FD0();
        sub_24C8F7FA0();
      }
      while (v26 != v16);
    }
    else
    {
      BOOL v28 = *(char **)(v5 + 16);
      uint64_t v27 = v5 + 16;
      uint64_t v29 = (uint64_t *)(a2 + 32);
      uint64_t v47 = (void (**)(uint64_t, char *, uint64_t))(v27 + 16);
      uint64_t v48 = v28;
      uint64_t v50 = v27;
      uint64_t v30 = v49;
      do
      {
        uint64_t v55 = v15;
        uint64_t v32 = *v29++;
        uint64_t v31 = v32;
        int v54 = *(_DWORD *)(v32 + 24);
        uint64_t v33 = *(void *)(v32 + 40);
        uint64_t v53 = *(void *)(v32 + 32);
        uint64_t v34 = (char *)v46;
        ((void (*)(void, uint64_t, uint64_t))v48)(v46, v32 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_uuid, v30);
        uint64_t v35 = *(void *)(v32 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_fullName + 8);
        uint64_t v52 = *(void *)(v32 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_fullName);
        if (*(void *)(v32 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups)) {
          uint64_t v36 = *(void *)(v31 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups);
        }
        else {
          uint64_t v36 = MEMORY[0x263F8EE88];
        }
        uint64_t v51 = v36;
        uint64_t v37 = *(void *)(v31 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases);
        if (v37) {
          uint64_t v38 = v37;
        }
        else {
          uint64_t v38 = MEMORY[0x263F8EE88];
        }
        type metadata accessor for GroupRecord(0);
        uint64_t v39 = swift_allocObject();
        *(_DWORD *)(v39 + 32) = v54;
        *(void *)(v39 + 40) = v53;
        *(void *)(v39 + 48) = v33;
        (*v47)(v39 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v34, v30);
        uint64_t v40 = v51;
        *(void *)(v39 + 16) = v52;
        *(void *)(v39 + 24) = v35;
        *(void *)(v39 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups) = v40;
        *(void *)(v39 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases) = v38;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v41 = v55;
        swift_bridgeObjectRetain();
        sub_24C8F7F90();
        sub_24C8F7FC0();
        sub_24C8F7FD0();
        sub_24C8F7FA0();
        uint64_t v15 = v41 - 1;
      }
      while (v15);
    }
    return v43;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_24C8D4884(uint64_t a1)
{
  uint64_t v2 = (int *)type metadata accessor for User(0);
  uint64_t result = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 16);
  if (v7)
  {
    uint64_t v8 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v9 = *(void *)(v4 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_24C8D8DA0(v8, (uint64_t)v6, type metadata accessor for User);
      uint64_t v10 = &v6[v2[6]];
      uint64_t v12 = *(void *)v10;
      unint64_t v11 = *((void *)v10 + 1);
      uint64_t v13 = v12 & 0xFFFFFFFFFFFFLL;
      if (!((v11 & 0x2000000000000000) != 0 ? HIBYTE(v11) & 0xF : v13)) {
        break;
      }
      uint64_t v15 = &v6[v2[8]];
      uint64_t v17 = *(void *)v15;
      unint64_t v16 = *((void *)v15 + 1);
      uint64_t v18 = v17 & 0xFFFFFFFFFFFFLL;
      if (!((v16 & 0x2000000000000000) != 0 ? HIBYTE(v16) & 0xF : v18)) {
        break;
      }
      uint64_t v20 = &v6[v2[9]];
      uint64_t v22 = *(void *)v20;
      unint64_t v21 = *((void *)v20 + 1);
      uint64_t v23 = v22 & 0xFFFFFFFFFFFFLL;
      if (!((v21 & 0x2000000000000000) != 0 ? HIBYTE(v21) & 0xF : v23)) {
        break;
      }
      uint64_t v25 = &v6[v2[10]];
      uint64_t v27 = *(void *)v25;
      unint64_t v26 = *((void *)v25 + 1);
      uint64_t v28 = v27 & 0xFFFFFFFFFFFFLL;
      uint64_t v29 = (v26 & 0x2000000000000000) != 0 ? HIBYTE(v26) & 0xF : v28;
      if (!v29 || *(_DWORD *)&v6[v2[5]] < 0x1F4u) {
        break;
      }
      sub_24C8D8D40((uint64_t)v6, type metadata accessor for User);
      v8 += v9;
      if (!--v7) {
        return swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    type metadata accessor for UserValidationError(0);
    sub_24C8D61EC(&qword_2697F92F8, (void (*)(uint64_t))type metadata accessor for UserValidationError);
    swift_allocError();
    sub_24C8D8DA0((uint64_t)v6, v30, type metadata accessor for User);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    return sub_24C8D8D40((uint64_t)v6, type metadata accessor for User);
  }
  return result;
}

uint64_t sub_24C8D4D3C(uint64_t a1)
{
  uint64_t v2 = (int *)type metadata accessor for Group(0);
  uint64_t result = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 16);
  if (v7)
  {
    uint64_t v8 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v9 = *(void *)(v4 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_24C8D8DA0(v8, (uint64_t)v6, type metadata accessor for Group);
      uint64_t v10 = &v6[v2[6]];
      uint64_t v12 = *(void *)v10;
      unint64_t v11 = *((void *)v10 + 1);
      uint64_t v13 = v12 & 0xFFFFFFFFFFFFLL;
      if (!((v11 & 0x2000000000000000) != 0 ? HIBYTE(v11) & 0xF : v13)) {
        break;
      }
      uint64_t v15 = &v6[v2[7]];
      uint64_t v17 = *(void *)v15;
      unint64_t v16 = *((void *)v15 + 1);
      uint64_t v18 = v17 & 0xFFFFFFFFFFFFLL;
      uint64_t v19 = (v16 & 0x2000000000000000) != 0 ? HIBYTE(v16) & 0xF : v18;
      if (!v19 || *(_DWORD *)&v6[v2[5]] < 0x1F4u) {
        break;
      }
      sub_24C8D8D40((uint64_t)v6, type metadata accessor for Group);
      v8 += v9;
      if (!--v7) {
        return swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    type metadata accessor for GroupValidationError(0);
    sub_24C8D61EC(&qword_2697F92F0, (void (*)(uint64_t))type metadata accessor for GroupValidationError);
    swift_allocError();
    sub_24C8D8DA0((uint64_t)v6, v20, type metadata accessor for Group);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    return sub_24C8D8D40((uint64_t)v6, type metadata accessor for Group);
  }
  return result;
}

uint64_t sub_24C8D5094()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for User(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for UserValidationError(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C8D8DA0(v1, (uint64_t)v7, type metadata accessor for UserValidationError);
  swift_getEnumCaseMultiPayload();
  sub_24C8B38F0((uint64_t)v7, (uint64_t)v4, type metadata accessor for User);
  v10[0] = 0;
  v10[1] = 0xE000000000000000;
  sub_24C8F7F00();
  sub_24C8F7CF0();
  sub_24C8F7FE0();
  uint64_t v8 = v10[0];
  sub_24C8D8D40((uint64_t)v4, type metadata accessor for User);
  return v8;
}

uint64_t sub_24C8D53CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Group(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for GroupValidationError(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C8D8DA0(v1, (uint64_t)v7, type metadata accessor for GroupValidationError);
  swift_getEnumCaseMultiPayload();
  sub_24C8B38F0((uint64_t)v7, (uint64_t)v4, type metadata accessor for Group);
  v10[0] = 0;
  v10[1] = 0xE000000000000000;
  sub_24C8F7F00();
  sub_24C8F7CF0();
  sub_24C8F7FE0();
  uint64_t v8 = v10[0];
  sub_24C8D8D40((uint64_t)v4, type metadata accessor for Group);
  return v8;
}

uint64_t sub_24C8D562C(uint64_t a1, uint64_t a2)
{
  sub_24C8F85D0();
  uint64_t v3 = a2 + 56;
  uint64_t v4 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  uint64_t v6 = v5 & *(void *)(a2 + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v9 = 0;
  int64_t v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_5;
    }
    if (__OFADD__(v10++, 1)) {
      goto LABEL_19;
    }
    if (v10 >= v7)
    {
LABEL_17:
      swift_release();
      return sub_24C8F85B0();
    }
    uint64_t v13 = *(void *)(v3 + 8 * v10);
    if (!v13) {
      break;
    }
LABEL_16:
    uint64_t v6 = (v13 - 1) & v13;
LABEL_5:
    sub_24C8F85A0();
    swift_bridgeObjectRetain();
    sub_24C8F7CE0();
    uint64_t v11 = sub_24C8F85D0();
    uint64_t result = swift_bridgeObjectRelease();
    v9 ^= v11;
  }
  int64_t v14 = v10 + 1;
  if (v10 + 1 >= v7) {
    goto LABEL_17;
  }
  uint64_t v13 = *(void *)(v3 + 8 * v14);
  if (v13)
  {
    ++v10;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v10 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v10 >= v7) {
      goto LABEL_17;
    }
    uint64_t v13 = *(void *)(v3 + 8 * v10);
    ++v14;
    if (v13) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_24C8D57C4(long long *a1, uint64_t a2)
{
  uint64_t v4 = sub_24C8F7AE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  int64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9650);
  MEMORY[0x270FA5388](v8 - 8);
  int64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *((void *)a1 + 8);
  long long v12 = a1[1];
  long long v37 = *a1;
  long long v38 = v12;
  long long v13 = a1[2];
  long long v14 = a1[3];
  uint64_t v29 = a1;
  long long v39 = v13;
  long long v40 = v14;
  uint64_t v41 = v11;
  uint64_t v15 = sub_24C8F85D0();
  uint64_t v16 = *(void *)(a2 + 56);
  uint64_t v31 = a2 + 56;
  uint64_t v32 = v15;
  uint64_t v17 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v18 = -1;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  unint64_t v19 = v18 & v16;
  int64_t v30 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v34 = v5 + 16;
  uint64_t v35 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  uint64_t v33 = v5 + 48;
  uint64_t v36 = a2;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v21 = 0;
  int64_t v22 = 0;
  if (!v19) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v23 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  for (unint64_t i = v23 | (v22 << 6); ; unint64_t i = __clz(__rbit64(v26)) + (v22 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v10, *(void *)(v36 + 48) + *(void *)(v5 + 72) * i, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1) {
      goto LABEL_19;
    }
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
    sub_24C8D61EC((unint64_t *)&qword_2697F8F50, MEMORY[0x263F07508]);
    uint64_t v28 = sub_24C8F7C40();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v21 ^= v28;
    if (v19) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v22++, 1)) {
      goto LABEL_21;
    }
    if (v22 >= v30) {
      goto LABEL_18;
    }
    unint64_t v26 = *(void *)(v31 + 8 * v22);
    if (!v26) {
      break;
    }
LABEL_14:
    unint64_t v19 = (v26 - 1) & v26;
  }
  int64_t v27 = v22 + 1;
  if (v22 + 1 >= v30)
  {
LABEL_18:
    (*v35)(v10, 1, 1, v4);
LABEL_19:
    swift_release();
    return sub_24C8F85B0();
  }
  unint64_t v26 = *(void *)(v31 + 8 * v27);
  if (v26)
  {
    ++v22;
    goto LABEL_14;
  }
  while (1)
  {
    int64_t v22 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v22 >= v30) {
      goto LABEL_18;
    }
    unint64_t v26 = *(void *)(v31 + 8 * v22);
    ++v27;
    if (v26) {
      goto LABEL_14;
    }
  }
  __break(1u);
LABEL_21:
  __break(1u);
  return result;
}

uint64_t _s23DarwinDirectoryInternal5GroupV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((sub_24C8F7AB0() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for Group(0);
  if (*(_DWORD *)(a1 + *(int *)(v4 + 20)) != *(_DWORD *)(a2 + *(int *)(v4 + 20))) {
    return 0;
  }
  uint64_t v5 = (int *)v4;
  uint64_t v6 = *(int *)(v4 + 24);
  uint64_t v7 = *(void *)(a1 + v6);
  uint64_t v8 = *(void *)(a1 + v6 + 8);
  uint64_t v9 = (void *)(a2 + v6);
  BOOL v10 = v7 == *v9 && v8 == v9[1];
  if (!v10 && (sub_24C8F8380() & 1) == 0) {
    return 0;
  }
  uint64_t v11 = v5[7];
  uint64_t v12 = *(void *)(a1 + v11);
  uint64_t v13 = *(void *)(a1 + v11 + 8);
  long long v14 = (void *)(a2 + v11);
  BOOL v15 = v12 == *v14 && v13 == v14[1];
  if (!v15 && (sub_24C8F8380() & 1) == 0 || (sub_24C8D3250(*(void *)(a1 + v5[8]), *(void *)(a2 + v5[8])) & 1) == 0) {
    return 0;
  }
  uint64_t v16 = v5[9];
  uint64_t v17 = *(void *)(a1 + v16);
  uint64_t v18 = *(void *)(a2 + v16);

  return sub_24C8D3738(v17, v18);
}

uint64_t sub_24C8D5C14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Group(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v32 = (uint64_t)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v31 = (uint64_t)&v31 - v8;
  MEMORY[0x270FA5388](v7);
  BOOL v10 = (char *)&v31 - v9;
  uint64_t v11 = type metadata accessor for GroupValidationError(0);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  long long v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v31 - v16;
  MEMORY[0x270FA5388](v15);
  unint64_t v19 = (char *)&v31 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9328);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  unint64_t v23 = (char *)&v31 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = (uint64_t)&v23[*(int *)(v21 + 56)];
  sub_24C8D8DA0(a1, (uint64_t)v23, type metadata accessor for GroupValidationError);
  sub_24C8D8DA0(a2, v24, type metadata accessor for GroupValidationError);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_24C8D8DA0((uint64_t)v23, (uint64_t)v17, type metadata accessor for GroupValidationError);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v26 = v31;
        sub_24C8B38F0(v24, v31, type metadata accessor for Group);
        char v27 = _s23DarwinDirectoryInternal5GroupV2eeoiySbAC_ACtFZ_0((uint64_t)v17, v26);
        sub_24C8D8D40(v26, type metadata accessor for Group);
        uint64_t v28 = (uint64_t)v17;
LABEL_12:
        sub_24C8D8D40(v28, type metadata accessor for Group);
        sub_24C8D8D40((uint64_t)v23, type metadata accessor for GroupValidationError);
        return v27 & 1;
      }
      long long v14 = v17;
    }
    else
    {
      sub_24C8D8DA0((uint64_t)v23, (uint64_t)v14, type metadata accessor for GroupValidationError);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v29 = v32;
        sub_24C8B38F0(v24, v32, type metadata accessor for Group);
        char v27 = _s23DarwinDirectoryInternal5GroupV2eeoiySbAC_ACtFZ_0((uint64_t)v14, v29);
        sub_24C8D8D40(v29, type metadata accessor for Group);
        uint64_t v28 = (uint64_t)v14;
        goto LABEL_12;
      }
    }
  }
  else
  {
    sub_24C8D8DA0((uint64_t)v23, (uint64_t)v19, type metadata accessor for GroupValidationError);
    if (!swift_getEnumCaseMultiPayload())
    {
      sub_24C8B38F0(v24, (uint64_t)v10, type metadata accessor for Group);
      char v27 = _s23DarwinDirectoryInternal5GroupV2eeoiySbAC_ACtFZ_0((uint64_t)v19, (uint64_t)v10);
      sub_24C8D8D40((uint64_t)v10, type metadata accessor for Group);
      uint64_t v28 = (uint64_t)v19;
      goto LABEL_12;
    }
    long long v14 = v19;
  }
  sub_24C8D8D40((uint64_t)v14, type metadata accessor for Group);
  sub_24C8DBDC4((uint64_t)v23, &qword_2697F9328);
  char v27 = 0;
  return v27 & 1;
}

uint64_t _s23DarwinDirectoryInternal4UserV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((sub_24C8F7AB0() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for User(0);
  if (*(_DWORD *)(a1 + *(int *)(v4 + 20)) != *(_DWORD *)(a2 + *(int *)(v4 + 20))) {
    return 0;
  }
  uint64_t v5 = (int *)v4;
  uint64_t v6 = *(int *)(v4 + 24);
  uint64_t v7 = *(void *)(a1 + v6);
  uint64_t v8 = *(void *)(a1 + v6 + 8);
  uint64_t v9 = (void *)(a2 + v6);
  BOOL v10 = v7 == *v9 && v8 == v9[1];
  if (!v10 && (sub_24C8F8380() & 1) == 0) {
    return 0;
  }
  if ((sub_24C8F7AB0() & 1) == 0) {
    return 0;
  }
  uint64_t v11 = v5[8];
  uint64_t v12 = *(void *)(a1 + v11);
  uint64_t v13 = *(void *)(a1 + v11 + 8);
  long long v14 = (void *)(a2 + v11);
  BOOL v15 = v12 == *v14 && v13 == v14[1];
  if (!v15 && (sub_24C8F8380() & 1) == 0) {
    return 0;
  }
  uint64_t v16 = v5[9];
  uint64_t v17 = *(void *)(a1 + v16);
  uint64_t v18 = *(void *)(a1 + v16 + 8);
  unint64_t v19 = (void *)(a2 + v16);
  BOOL v20 = v17 == *v19 && v18 == v19[1];
  if (!v20 && (sub_24C8F8380() & 1) == 0) {
    return 0;
  }
  uint64_t v21 = v5[10];
  uint64_t v22 = *(void *)(a1 + v21);
  uint64_t v23 = *(void *)(a1 + v21 + 8);
  uint64_t v24 = (void *)(a2 + v21);
  if ((v22 != *v24 || v23 != v24[1]) && (sub_24C8F8380() & 1) == 0) {
    return 0;
  }
  if ((sub_24C8D3250(*(void *)(a1 + v5[11]), *(void *)(a2 + v5[11])) & 1) == 0) {
    return 0;
  }
  uint64_t v25 = v5[12];
  uint64_t v26 = *(void *)(a1 + v25);
  uint64_t v27 = *(void *)(a2 + v25);

  return sub_24C8D3738(v26, v27);
}

uint64_t type metadata accessor for Group(uint64_t a1)
{
  return sub_24C8B7B74(a1, (uint64_t *)&unk_2697F92D8);
}

uint64_t sub_24C8D61A4()
{
  return sub_24C8D61EC(&qword_2697F92B8, (void (*)(uint64_t))type metadata accessor for User);
}

uint64_t sub_24C8D61EC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24C8D6234()
{
  return sub_24C8D61EC(&qword_2697F92C0, (void (*)(uint64_t))type metadata accessor for Group);
}

char *initializeBufferWithCopyOfBuffer for User(char *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24C8F7AE0();
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, (char *)a2, v7);
    uint64_t v9 = a3[6];
    *(_DWORD *)&a1[a3[5]] = *(_DWORD *)((char *)a2 + a3[5]);
    BOOL v10 = &a1[v9];
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    *(void *)BOOL v10 = *v11;
    *((void *)v10 + 1) = v12;
    uint64_t v13 = a3[7];
    long long v14 = &a1[v13];
    BOOL v15 = (char *)a2 + v13;
    swift_bridgeObjectRetain();
    v8(v14, v15, v7);
    uint64_t v16 = a3[8];
    uint64_t v17 = a3[9];
    uint64_t v18 = &a1[v16];
    unint64_t v19 = (uint64_t *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    *(void *)uint64_t v18 = *v19;
    *((void *)v18 + 1) = v20;
    uint64_t v21 = &a1[v17];
    uint64_t v22 = (uint64_t *)((char *)a2 + v17);
    uint64_t v23 = v22[1];
    *(void *)uint64_t v21 = *v22;
    *((void *)v21 + 1) = v23;
    uint64_t v24 = a3[10];
    uint64_t v25 = a3[11];
    uint64_t v26 = &a1[v24];
    uint64_t v27 = (uint64_t *)((char *)a2 + v24);
    uint64_t v28 = v27[1];
    *(void *)uint64_t v26 = *v27;
    *((void *)v26 + 1) = v28;
    *(void *)&a1[v25] = *(uint64_t *)((char *)a2 + v25);
    *(void *)&a1[a3[12]] = *(uint64_t *)((char *)a2 + a3[12]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for User(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24C8F7AE0();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  swift_bridgeObjectRelease();
  v5(a1 + *(int *)(a2 + 28), v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C8F7AE0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  uint64_t v9 = (void *)(a1 + v8);
  BOOL v10 = (void *)(a2 + v8);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  swift_bridgeObjectRetain();
  v7(v13, v14, v6);
  uint64_t v15 = a3[8];
  uint64_t v16 = a3[9];
  uint64_t v17 = (void *)(a1 + v15);
  uint64_t v18 = (void *)(a2 + v15);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = (void *)(a1 + v16);
  uint64_t v21 = (void *)(a2 + v16);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = a3[10];
  uint64_t v24 = a3[11];
  uint64_t v25 = (void *)(a1 + v23);
  uint64_t v26 = (void *)(a2 + v23);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  *(void *)(a1 + v24) = *(void *)(a2 + v24);
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C8F7AE0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v8);
  BOOL v10 = (void *)(a2 + v8);
  *uint64_t v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7(a1 + a3[7], a2 + a3[7], v6);
  uint64_t v11 = a3[8];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[9];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[10];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C8F7AE0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  v7(a1 + a3[7], a2 + a3[7], v6);
  uint64_t v9 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  uint64_t v10 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  return a1;
}

uint64_t assignWithTake for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C8F7AE0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  *uint64_t v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  v7(a1 + a3[7], a2 + a3[7], v6);
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[9];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *uint64_t v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[10];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  *uint64_t v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for User(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t storeEnumTagSinglePayload for User(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t sub_24C8D6A04()
{
  uint64_t result = sub_24C8F7AE0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Group(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24C8F7AE0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(_DWORD *)((char *)a1 + a3[5]) = *(_DWORD *)((char *)a2 + a3[5]);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    uint64_t v12 = a3[7];
    uint64_t v13 = a3[8];
    uint64_t v14 = (uint64_t *)((char *)a1 + v12);
    uint64_t v15 = (uint64_t *)((char *)a2 + v12);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    *(uint64_t *)((char *)a1 + v13) = *(uint64_t *)((char *)a2 + v13);
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for Group(uint64_t a1)
{
  uint64_t v2 = sub_24C8F7AE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C8F7AE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = a3[7];
  uint64_t v12 = a3[8];
  uint64_t v13 = (void *)(a1 + v11);
  uint64_t v14 = (void *)(a2 + v11);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C8F7AE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C8F7AE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithTake for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C8F7AE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Group(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24C8D6FFC);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C8F7AE0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for Group(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24C8D70D8);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24C8F7AE0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_24C8D719C()
{
  uint64_t result = sub_24C8F7AE0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24C8D7250(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  uint64_t v2 = type metadata accessor for User(0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v43 = (uint64_t)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v42 = (uint64_t)&v40 - v6;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v41 = (uint64_t)&v40 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v40 = (uint64_t)&v40 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v40 - v11;
  uint64_t v13 = type metadata accessor for UserValidationError(0);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v40 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v40 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)&v40 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v40 - v26;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9320);
  uint64_t v29 = MEMORY[0x270FA5388](v28 - 8);
  uint64_t v31 = (char *)&v40 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = (uint64_t)&v31[*(int *)(v29 + 56)];
  sub_24C8D8DA0(v44, (uint64_t)v31, type metadata accessor for UserValidationError);
  sub_24C8D8DA0(v45, v32, type metadata accessor for UserValidationError);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_24C8D8DA0((uint64_t)v31, (uint64_t)v25, type metadata accessor for UserValidationError);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v33 = v40;
        sub_24C8B38F0(v32, v40, type metadata accessor for User);
        char v34 = _s23DarwinDirectoryInternal4UserV2eeoiySbAC_ACtFZ_0((uint64_t)v25, v33);
        sub_24C8D8D40(v33, type metadata accessor for User);
        uint64_t v35 = (uint64_t)v25;
        goto LABEL_17;
      }
      uint64_t v16 = v25;
      goto LABEL_15;
    case 2u:
      sub_24C8D8DA0((uint64_t)v31, (uint64_t)v22, type metadata accessor for UserValidationError);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v36 = v41;
        sub_24C8B38F0(v32, v41, type metadata accessor for User);
        char v34 = _s23DarwinDirectoryInternal4UserV2eeoiySbAC_ACtFZ_0((uint64_t)v22, v36);
        sub_24C8D8D40(v36, type metadata accessor for User);
        uint64_t v35 = (uint64_t)v22;
        goto LABEL_17;
      }
      uint64_t v16 = v22;
      goto LABEL_15;
    case 3u:
      sub_24C8D8DA0((uint64_t)v31, (uint64_t)v19, type metadata accessor for UserValidationError);
      if (swift_getEnumCaseMultiPayload() == 3)
      {
        uint64_t v37 = v42;
        sub_24C8B38F0(v32, v42, type metadata accessor for User);
        char v34 = _s23DarwinDirectoryInternal4UserV2eeoiySbAC_ACtFZ_0((uint64_t)v19, v37);
        sub_24C8D8D40(v37, type metadata accessor for User);
        uint64_t v35 = (uint64_t)v19;
        goto LABEL_17;
      }
      uint64_t v16 = v19;
      goto LABEL_15;
    case 4u:
      sub_24C8D8DA0((uint64_t)v31, (uint64_t)v16, type metadata accessor for UserValidationError);
      if (swift_getEnumCaseMultiPayload() != 4) {
        goto LABEL_15;
      }
      uint64_t v38 = v43;
      sub_24C8B38F0(v32, v43, type metadata accessor for User);
      char v34 = _s23DarwinDirectoryInternal4UserV2eeoiySbAC_ACtFZ_0((uint64_t)v16, v38);
      sub_24C8D8D40(v38, type metadata accessor for User);
      uint64_t v35 = (uint64_t)v16;
      goto LABEL_17;
    default:
      sub_24C8D8DA0((uint64_t)v31, (uint64_t)v27, type metadata accessor for UserValidationError);
      if (swift_getEnumCaseMultiPayload())
      {
        uint64_t v16 = v27;
LABEL_15:
        sub_24C8D8D40((uint64_t)v16, type metadata accessor for User);
        sub_24C8DBDC4((uint64_t)v31, &qword_2697F9320);
        char v34 = 0;
      }
      else
      {
        sub_24C8B38F0(v32, (uint64_t)v12, type metadata accessor for User);
        char v34 = _s23DarwinDirectoryInternal4UserV2eeoiySbAC_ACtFZ_0((uint64_t)v27, (uint64_t)v12);
        sub_24C8D8D40((uint64_t)v12, type metadata accessor for User);
        uint64_t v35 = (uint64_t)v27;
LABEL_17:
        sub_24C8D8D40(v35, type metadata accessor for User);
        sub_24C8D8D40((uint64_t)v31, type metadata accessor for UserValidationError);
      }
      return v34 & 1;
  }
}

uint8_t *sub_24C8D7840(unint64_t a1, unint64_t a2, void (*a3)(unint64_t *, unint64_t *), unint64_t a4, char *a5)
{
  v165 = a5;
  unint64_t v169 = a4;
  v170 = a3;
  uint64_t v190 = sub_24C8F7AE0();
  uint64_t v173 = *(void *)(v190 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v190);
  int64_t v9 = (int64_t)&v164 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v164 - v10;
  unint64_t v12 = type metadata accessor for Group(0);
  uint64_t v180 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  v166 = (char *)&v164 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v164 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v164 - v19;
  MEMORY[0x270FA5388](v18);
  v191 = (char *)&v164 - v21;
  v193 = (int *)type metadata accessor for User(0);
  uint64_t v181 = *((void *)v193 - 1);
  uint64_t v22 = MEMORY[0x270FA5388](v193);
  uint64_t v24 = (char *)&v164 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  v168 = (char *)&v164 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v172 = (uint64_t)&v164 - v28;
  MEMORY[0x270FA5388](v27);
  v192 = (char *)&v164 - v29;
  unint64_t v179 = a1;
  if (a1 >> 62)
  {
LABEL_57:
    swift_bridgeObjectRetain();
    uint64_t v163 = sub_24C8F8020();
    swift_bridgeObjectRelease();
    uint64_t v30 = v163;
  }
  else
  {
    uint64_t v30 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v31 = MEMORY[0x263F8EE78];
  v182 = (int *)v12;
  v176 = v17;
  v175 = v20;
  v174 = v11;
  int64_t v167 = v9;
  unint64_t v178 = a2;
  if (v30)
  {
    unint64_t v195 = MEMORY[0x263F8EE78];
    uint64_t v189 = v30;
    sub_24C8CBDD0(0, v30 & ~(v30 >> 63), 0);
    uint64_t v32 = v189;
    if (v189 < 0)
    {
      __break(1u);
      goto LABEL_60;
    }
    unint64_t v31 = v195;
    if ((v179 & 0xC000000000000001) != 0)
    {
      uint64_t v33 = 0;
      v177 = (void (**)(uint64_t, uint64_t, uint64_t))(v173 + 16);
      uint64_t v35 = (uint64_t)v192;
      char v34 = v193;
      do
      {
        uint64_t v36 = MEMORY[0x2532FF870](v33);
        uint64_t v37 = *v177;
        uint64_t v38 = v35;
        uint64_t v39 = v190;
        (*v177)(v38, v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v190);
        LODWORD(v187) = *(_DWORD *)(v36 + 16);
        v188 = *(void (***)(uint64_t, uint64_t, char *))(v36 + 24);
        uint64_t v183 = *(void *)(v36 + 32);
        v37((uint64_t)&v192[v34[7]], v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v39);
        uint64_t v40 = *(void *)(v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName + 8);
        v186 = *(uint8_t **)(v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
        uint64_t v41 = *(void *)(v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory + 8);
        unint64_t v185 = *(void *)(v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
        uint64_t v42 = *(void *)(v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell + 8);
        uint64_t v184 = *(void *)(v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
        uint64_t v43 = (uint64_t *)(v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships);
        swift_beginAccess();
        uint64_t v44 = *v43;
        uint64_t v45 = *(void *)(v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
        uint64_t v46 = v183;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_unknownObjectRelease();
        *(_DWORD *)&v192[v193[5]] = v187;
        uint64_t v47 = &v192[v193[6]];
        *(void *)uint64_t v47 = v188;
        *((void *)v47 + 1) = v46;
        uint64_t v48 = &v192[v193[8]];
        *(void *)uint64_t v48 = v186;
        *((void *)v48 + 1) = v40;
        uint64_t v49 = &v192[v193[9]];
        *(void *)uint64_t v49 = v185;
        *((void *)v49 + 1) = v41;
        uint64_t v35 = (uint64_t)v192;
        uint64_t v50 = &v192[v193[10]];
        *(void *)uint64_t v50 = v184;
        *((void *)v50 + 1) = v42;
        char v34 = v193;
        *(void *)(v35 + v193[11]) = v44;
        *(void *)(v35 + v34[12]) = v45;
        unint64_t v195 = v31;
        int64_t v9 = *(void *)(v31 + 16);
        unint64_t v51 = *(void *)(v31 + 24);
        if (v9 >= v51 >> 1)
        {
          sub_24C8CBDD0(v51 > 1, v9 + 1, 1);
          unint64_t v31 = v195;
        }
        ++v33;
        *(void *)(v31 + 16) = v9 + 1;
        sub_24C8B38F0(v35, v31+ ((*(unsigned __int8 *)(v181 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v181 + 80))+ *(void *)(v181 + 72) * v9, type metadata accessor for User);
      }
      while (v189 != v33);
    }
    else
    {
      uint64_t v52 = (char *)(v179 + 32);
      unint64_t v179 = *(void *)(v173 + 16);
      uint64_t v183 = v173 + 16;
      uint64_t v53 = v193;
      do
      {
        v192 = v52;
        uint64_t v189 = v32;
        uint64_t v54 = *(void *)v52;
        uint64_t v55 = v190;
        uint64_t v56 = (void (*)(char *, uint64_t, uint64_t))v179;
        ((void (*)(char *, uint64_t, uint64_t))v179)(v24, *(void *)v52 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v190);
        LODWORD(v186) = *(_DWORD *)(v54 + 16);
        uint64_t v57 = *(void (***)(uint64_t, uint64_t, char *))(v54 + 24);
        v187 = *(void (***)(uint64_t, char *, uint64_t))(v54 + 32);
        v188 = v57;
        v56(&v24[v53[7]], v54 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v55);
        uint64_t v58 = *(void *)(v54 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
        uint64_t v59 = *(void *)(v54 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName + 8);
        int64_t v9 = *(void *)(v54 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory + 8);
        unint64_t v185 = *(void *)(v54 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
        uint64_t v60 = *(void *)(v54 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell + 8);
        uint64_t v184 = *(void *)(v54 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
        uint64_t v61 = (uint64_t *)(v54 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships);
        swift_beginAccess();
        uint64_t v62 = *(void *)(v54 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
        uint64_t v63 = *v61;
        *(_DWORD *)&v24[v53[5]] = v186;
        uint64_t v64 = &v24[v53[6]];
        unint64_t v65 = v187;
        *(void *)uint64_t v64 = v188;
        *((void *)v64 + 1) = v65;
        unint64_t v66 = &v24[v53[8]];
        *(void *)unint64_t v66 = v58;
        *((void *)v66 + 1) = v59;
        uint64_t v67 = &v24[v53[9]];
        *(void *)uint64_t v67 = v185;
        *((void *)v67 + 1) = v9;
        uint64_t v68 = &v24[v53[10]];
        *(void *)uint64_t v68 = v184;
        *((void *)v68 + 1) = v60;
        *(void *)&v24[v53[11]] = v63;
        *(void *)&v24[v53[12]] = v62;
        unint64_t v195 = v31;
        unint64_t v70 = *(void *)(v31 + 16);
        unint64_t v69 = *(void *)(v31 + 24);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v70 >= v69 >> 1)
        {
          sub_24C8CBDD0(v69 > 1, v70 + 1, 1);
          unint64_t v31 = v195;
        }
        *(void *)(v31 + 16) = v70 + 1;
        sub_24C8B38F0((uint64_t)v24, v31+ ((*(unsigned __int8 *)(v181 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v181 + 80))+ *(void *)(v181 + 72) * v70, type metadata accessor for User);
        uint64_t v53 = v193;
        uint64_t v52 = v192 + 8;
        uint64_t v32 = v189 - 1;
      }
      while (v189 != 1);
    }
    unint64_t v12 = (unint64_t)v182;
    uint64_t v17 = v176;
    uint64_t v20 = v175;
    a2 = v178;
  }
  unint64_t v196 = v31;
  uint64_t v24 = (char *)v190;
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v71 = sub_24C8F8020();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v71 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v72 = MEMORY[0x263F8EE78];
  if (!v71) {
    goto LABEL_31;
  }
  v194 = (uint8_t *)MEMORY[0x263F8EE78];
  sub_24C8CBD94(0, v71 & ~(v71 >> 63), 0);
  if (v71 < 0)
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  uint64_t v73 = (uint64_t)v194;
  if ((a2 & 0xC000000000000001) != 0)
  {
    uint64_t v74 = 0;
    v188 = (void (**)(uint64_t, uint64_t, char *))(v173 + 16);
    uint64_t v75 = (uint64_t)v191;
    v192 = (char *)v71;
    do
    {
      uint64_t v189 = v73;
      uint64_t v76 = MEMORY[0x2532FF870](v74, a2);
      (*v188)(v75, v76 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v24);
      int v77 = *(_DWORD *)(v76 + 32);
      uint64_t v79 = *(void *)(v76 + 40);
      uint64_t v78 = *(void *)(v76 + 48);
      uint64_t v81 = *(void *)(v76 + 16);
      uint64_t v80 = *(void *)(v76 + 24);
      uint64_t v82 = *(void *)(v76 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups);
      uint64_t v83 = *(void *)(v76 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_unknownObjectRelease();
      char v84 = v182;
      *(_DWORD *)&v191[v182[5]] = v77;
      uint64_t v85 = &v191[v84[6]];
      *(void *)uint64_t v85 = v79;
      *((void *)v85 + 1) = v78;
      uint64_t v75 = (uint64_t)v191;
      unint64_t v86 = &v191[v84[7]];
      *(void *)unint64_t v86 = v81;
      *((void *)v86 + 1) = v80;
      *(void *)(v75 + v84[8]) = v82;
      *(void *)(v75 + v84[9]) = v83;
      uint64_t v73 = v189;
      v194 = (uint8_t *)v189;
      int64_t v9 = *(void *)(v189 + 16);
      unint64_t v87 = *(void *)(v189 + 24);
      if (v9 >= v87 >> 1)
      {
        sub_24C8CBD94(v87 > 1, v9 + 1, 1);
        uint64_t v73 = (uint64_t)v194;
      }
      ++v74;
      *(void *)(v73 + 16) = v9 + 1;
      sub_24C8B38F0(v75, v73+ ((*(unsigned __int8 *)(v180 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v180 + 80))+ *(void *)(v180 + 72) * v9, type metadata accessor for Group);
      uint64_t v24 = (char *)v190;
      a2 = v178;
    }
    while (v192 != v74);
  }
  else
  {
    int64_t v9 = a2 + 32;
    uint64_t v189 = *(void *)(v173 + 16);
    v191 = (char *)(v173 + 16);
    uint64_t v88 = (uint64_t)v166;
    do
    {
      v192 = (char *)v71;
      uint64_t v89 = *(void *)v9;
      uint64_t v90 = v24;
      ((void (*)(uint64_t, uint64_t, char *))v189)(v88, *(void *)v9 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v24);
      uint64_t v92 = *(void *)(v89 + 40);
      uint64_t v91 = *(void *)(v89 + 48);
      uint64_t v93 = *(void *)(v89 + 16);
      uint64_t v94 = *(void *)(v89 + 24);
      uint64_t v95 = *(void *)(v89 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups);
      uint64_t v96 = *(void *)(v89 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases);
      uint64_t v97 = v182;
      *(_DWORD *)(v88 + v182[5]) = *(_DWORD *)(v89 + 32);
      uint64_t v98 = (void *)(v88 + v97[6]);
      *uint64_t v98 = v92;
      v98[1] = v91;
      char v99 = (void *)(v88 + v97[7]);
      *char v99 = v93;
      v99[1] = v94;
      *(void *)(v88 + v97[8]) = v95;
      *(void *)(v88 + v97[9]) = v96;
      v194 = (uint8_t *)v73;
      unint64_t v101 = *(void *)(v73 + 16);
      unint64_t v100 = *(void *)(v73 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v101 >= v100 >> 1)
      {
        sub_24C8CBD94(v100 > 1, v101 + 1, 1);
        uint64_t v73 = (uint64_t)v194;
      }
      *(void *)(v73 + 16) = v101 + 1;
      sub_24C8B38F0(v88, v73+ ((*(unsigned __int8 *)(v180 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v180 + 80))+ *(void *)(v180 + 72) * v101, type metadata accessor for Group);
      v9 += 8;
      uint64_t v71 = (uint64_t)(v192 - 1);
      uint64_t v24 = v90;
    }
    while (v192 != (char *)1);
  }
  uint64_t v72 = v73;
  unint64_t v12 = (unint64_t)v182;
  uint64_t v17 = v176;
  uint64_t v20 = v175;
LABEL_31:
  unint64_t v195 = v72;
  unint64_t v102 = (unint64_t)v171;
  v170(&v196, &v195);
  a2 = v102;
  if (v102)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_2697F8F08 == -1)
    {
LABEL_33:
      uint64_t v103 = sub_24C8F7B10();
      uint64_t v104 = (uint8_t *)__swift_project_value_buffer(v103, (uint64_t)qword_2697F92A0);
      id v105 = (id)a2;
      id v106 = (id)a2;
      uint64_t v107 = sub_24C8F7AF0();
      os_log_type_t v108 = sub_24C8F7E30();
      if (os_log_type_enabled(v107, v108))
      {
        uint64_t v104 = (uint8_t *)swift_slowAlloc();
        v109 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v104 = 138543362;
        id v110 = (id)a2;
        uint64_t v111 = _swift_stdlib_bridgeErrorToNSError();
        v194 = (uint8_t *)v111;
        sub_24C8F7E60();
        void *v109 = v111;
        MEMORY[0x2533003E0](a2);
        MEMORY[0x2533003E0](a2);
        _os_log_impl(&dword_24C8A9000, v107, v108, "Failed to update local users and groups: Performer failed: %{public}@", v104, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2697F92E8);
        swift_arrayDestroy();
        MEMORY[0x253300580](v109, -1, -1);
        MEMORY[0x253300580](v104, -1, -1);
      }
      else
      {
        MEMORY[0x2533003E0](a2);
        MEMORY[0x2533003E0](a2);
      }

      swift_willThrow();
      return v104;
    }
LABEL_61:
    swift_once();
    goto LABEL_33;
  }
  unint64_t v112 = v196;
  uint64_t v113 = swift_bridgeObjectRetain();
  sub_24C8D4884(v113);
  swift_bridgeObjectRelease();
  uint64_t v114 = swift_bridgeObjectRetain();
  sub_24C8D4D3C(v114);
  swift_bridgeObjectRelease();
  uint64_t v116 = *(char **)(v112 + 16);
  v170 = 0;
  v192 = v116;
  if (v116)
  {
    unint64_t v169 = v112;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v169 = sub_24C8C2230(v169);
    }
    uint64_t v117 = 0;
    uint64_t v11 = v165;
    unint64_t v118 = v169;
    do
    {
      unint64_t v119 = *(void *)(v118 + 16);
      swift_bridgeObjectRetain();
      if ((unint64_t)v117 >= v119)
      {
        __break(1u);
        goto LABEL_57;
      }
      unint64_t v12 = (*(unsigned __int8 *)(v181 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v181 + 80);
      int64_t v9 = *(void *)(v181 + 72);
      sub_24C8C7EE4((uint64_t)v11);
      a2 = (unint64_t)++v117;
    }
    while (v192 != v117);
    unint64_t v196 = v118;
    uint64_t v120 = *(char **)(v118 + 16);
    uint64_t v104 = (uint8_t *)MEMORY[0x263F8EE78];
    if (v120)
    {
      v194 = (uint8_t *)MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_24C8F7FB0();
      v177 = (void (**)(uint64_t, uint64_t, uint64_t))(v173 + 16);
      v171 = (void (**)(uint64_t, char *, uint64_t))(v173 + 32);
      uint64_t v121 = v118 + v12;
      uint64_t v122 = v193;
      uint64_t v123 = (uint64_t)v168;
      do
      {
        v191 = v120;
        v192 = (char *)v121;
        uint64_t v124 = v172;
        sub_24C8D8DA0(v121, v172, type metadata accessor for User);
        sub_24C8D8DA0(v124, v123, type metadata accessor for User);
        uint64_t v125 = v122[6];
        LODWORD(v188) = *(_DWORD *)(v123 + v122[5]);
        unint64_t v126 = *(void *)(v123 + v125 + 8);
        v186 = *(uint8_t **)(v123 + v125);
        unint64_t v178 = v126;
        uint64_t v127 = *v177;
        uint64_t v128 = v174;
        (*v177)((uint64_t)v174, v123, (uint64_t)v24);
        uint64_t v129 = v122[7];
        v130 = (uint64_t *)(v123 + v122[8]);
        uint64_t v132 = *v130;
        v131 = (void (*)(void, void, void))v130[1];
        uint64_t v181 = v132;
        unint64_t v179 = (unint64_t)v131;
        unint64_t v133 = (uint64_t *)(v123 + v122[9]);
        uint64_t v134 = *v133;
        uint64_t v183 = v133[1];
        uint64_t v184 = v134;
        int64_t v135 = v167;
        v127(v167, v123 + v129, v190);
        uint64_t v136 = v122[11];
        unint64_t v137 = (uint64_t *)(v123 + v122[10]);
        uint64_t v138 = v137[1];
        unint64_t v185 = *v137;
        v187 = *(void (***)(uint64_t, char *, uint64_t))(v123 + v136);
        uint64_t v189 = *(void *)(v123 + v122[12]);
        type metadata accessor for UserRecord(0);
        uint64_t v139 = swift_allocObject();
        *(_DWORD *)(v139 + 16) = v188;
        *(void *)(v139 + 24) = v186;
        *(void *)(v139 + 32) = v126;
        v140 = *v171;
        (*v171)(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v128, v190);
        uint64_t v141 = (void *)(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
        unint64_t v142 = v179;
        *uint64_t v141 = v181;
        v141[1] = v142;
        v143 = (void *)(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
        uint64_t v144 = v183;
        void *v143 = v184;
        v143[1] = v144;
        v140(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, (char *)v135, v190);
        uint64_t v123 = (uint64_t)v168;
        v145 = (unint64_t *)(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
        unint64_t *v145 = v185;
        v145[1] = v138;
        *(void *)(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships) = v187;
        *(void *)(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases) = v189;
        swift_bridgeObjectRetain();
        uint64_t v24 = (char *)v190;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_24C8D8D40(v123, type metadata accessor for User);
        sub_24C8D8D40(v172, type metadata accessor for User);
        sub_24C8F7F90();
        sub_24C8F7FC0();
        uint64_t v146 = v191;
        sub_24C8F7FD0();
        sub_24C8F7FA0();
        uint64_t v121 = (uint64_t)&v192[v9];
        uint64_t v120 = v146 - 1;
      }
      while (v120);
      uint64_t v104 = v194;
      swift_bridgeObjectRelease();
      unint64_t v12 = (unint64_t)v182;
      uint64_t v17 = v176;
      uint64_t v20 = v175;
    }
    else
    {
      unint64_t v12 = (unint64_t)v182;
    }
  }
  else
  {
    uint64_t v104 = (uint8_t *)MEMORY[0x263F8EE78];
  }
  unint64_t v147 = v195;
  v148 = *(int **)(v195 + 16);
  if (v148)
  {
    v186 = v104;
    v194 = (uint8_t *)MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_24C8F7FB0();
    unint64_t v149 = (*(unsigned __int8 *)(v180 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v180 + 80);
    unint64_t v185 = v147;
    uint64_t v150 = v147 + v149;
    uint64_t v189 = *(void *)(v180 + 72);
    v187 = (void (**)(uint64_t, char *, uint64_t))(v173 + 32);
    v188 = (void (**)(uint64_t, uint64_t, char *))(v173 + 16);
    v151 = v174;
    do
    {
      v193 = v148;
      sub_24C8D8DA0(v150, (uint64_t)v20, type metadata accessor for Group);
      sub_24C8D8DA0((uint64_t)v20, (uint64_t)v17, type metadata accessor for Group);
      uint64_t v152 = *(int *)(v12 + 24);
      unint64_t v153 = v12;
      LODWORD(v192) = *(_DWORD *)&v17[*(int *)(v12 + 20)];
      uint64_t v154 = *(void *)&v17[v152 + 8];
      v191 = *(char **)&v17[v152];
      uint64_t v155 = v190;
      (*v188)((uint64_t)v151, (uint64_t)v17, (char *)v190);
      v156 = &v17[*(int *)(v153 + 28)];
      uint64_t v158 = *(void *)v156;
      uint64_t v157 = *((void *)v156 + 1);
      uint64_t v159 = *(void *)&v17[*(int *)(v153 + 32)];
      uint64_t v160 = *(void *)&v176[v182[9]];
      type metadata accessor for GroupRecord(0);
      uint64_t v161 = swift_allocObject();
      *(_DWORD *)(v161 + 32) = v192;
      *(void *)(v161 + 40) = v191;
      *(void *)(v161 + 48) = v154;
      (*v187)(v161 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v151, v155);
      *(void *)(v161 + 16) = v158;
      *(void *)(v161 + 24) = v157;
      unint64_t v12 = (unint64_t)v182;
      *(void *)(v161 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups) = v159;
      *(void *)(v161 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases) = v160;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v162 = v193;
      uint64_t v20 = v175;
      uint64_t v17 = v176;
      swift_bridgeObjectRetain();
      sub_24C8D8D40((uint64_t)v17, type metadata accessor for Group);
      sub_24C8D8D40((uint64_t)v20, type metadata accessor for Group);
      sub_24C8F7F90();
      sub_24C8F7FC0();
      sub_24C8F7FD0();
      sub_24C8F7FA0();
      v150 += v189;
      v148 = (int *)((char *)v162 - 1);
    }
    while (v148);
    swift_bridgeObjectRelease();
    uint64_t v104 = v186;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v104;
}

uint64_t sub_24C8D8D40(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24C8D8DA0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for GroupValidationError(uint64_t a1)
{
  return sub_24C8B7B74(a1, (uint64_t *)&unk_2697F9310);
}

uint64_t type metadata accessor for UserValidationError(uint64_t a1)
{
  return sub_24C8B7B74(a1, (uint64_t *)&unk_2697F9300);
}

uint8_t *sub_24C8D8E48(uint64_t a1, unint64_t a2, char *a3, id *a4)
{
  uint64_t v164 = a4;
  v170 = a3;
  unint64_t v175 = a2;
  uint64_t v4 = (int *)type metadata accessor for User(0);
  uint64_t v178 = *((void *)v4 - 1);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  v187 = (char *)&v161 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v184 = (char *)&v161 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  unint64_t v169 = (char *)&v161 - v10;
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v161 - v11;
  uint64_t v13 = (id *)sub_24C8F7AE0();
  uint64_t v168 = (uint64_t)*(v13 - 1);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v161 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v161 - v17;
  uint64_t v19 = type metadata accessor for Group(0);
  uint64_t v176 = *(void *)(v19 - 8);
  v177 = (int *)v19;
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  v186 = (char *)&v161 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v166 = (char *)&v161 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v161 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v29 = (uint64_t)&v161 - v28;
  unint64_t v174 = v27;
  if (v27 >> 62)
  {
LABEL_55:
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_24C8F8020();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v30 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v31 = (id *)MEMORY[0x263F8EE78];
  unint64_t v185 = v13;
  v171 = v18;
  v188 = v4;
  v162 = v26;
  uint64_t v172 = v29;
  int64_t v167 = v12;
  uint64_t v163 = v16;
  if (v30)
  {
    uint64_t v190 = (id *)MEMORY[0x263F8EE78];
    sub_24C8CBDD0(0, v30 & ~(v30 >> 63), 0);
    if (v30 < 0)
    {
      __break(1u);
      goto LABEL_58;
    }
    unint64_t v31 = v190;
    if ((v174 & 0xC000000000000001) != 0)
    {
      uint64_t v32 = 0;
      uint64_t v173 = (void (**)(uint64_t, uint64_t, id *))(v168 + 16);
      uint64_t v33 = (uint64_t)v187;
      uint64_t v183 = v30;
      do
      {
        uint64_t v34 = MEMORY[0x2532FF870](v32);
        uint64_t v35 = *v173;
        uint64_t v36 = v33;
        uint64_t v37 = v185;
        (*v173)(v36, v34 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v185);
        LODWORD(v182) = *(_DWORD *)(v34 + 16);
        uint64_t v38 = *(void *)(v34 + 32);
        uint64_t v184 = *(char **)(v34 + 24);
        v35((uint64_t)&v187[v4[7]], v34 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v37);
        uint64_t v39 = *(void *)(v34 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName + 8);
        uint64_t v181 = *(void (***)(uint64_t, char *, id *))(v34
                                                             + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
        unint64_t v12 = *(char **)(v34 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory + 8);
        uint64_t v180 = *(uint8_t **)(v34 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
        unint64_t v40 = *(void *)(v34 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell + 8);
        unint64_t v179 = *(void *)(v34 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
        uint64_t v41 = (uint64_t *)(v34 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships);
        swift_beginAccess();
        uint64_t v42 = *v41;
        uint64_t v43 = *(void *)(v34 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_unknownObjectRelease();
        *(_DWORD *)&v187[v188[5]] = v182;
        uint64_t v44 = &v187[v188[6]];
        *(void *)uint64_t v44 = v184;
        *((void *)v44 + 1) = v38;
        uint64_t v45 = &v187[v188[8]];
        *(void *)uint64_t v45 = v181;
        *((void *)v45 + 1) = v39;
        uint64_t v33 = (uint64_t)v187;
        uint64_t v46 = &v187[v188[9]];
        *(void *)uint64_t v46 = v180;
        *((void *)v46 + 1) = v12;
        uint64_t v47 = (unint64_t *)(v33 + v188[10]);
        unint64_t *v47 = v179;
        v47[1] = v40;
        uint64_t v4 = v188;
        *(void *)(v33 + v188[11]) = v42;
        *(void *)(v33 + v4[12]) = v43;
        uint64_t v190 = v31;
        unint64_t v49 = (unint64_t)v31[2];
        unint64_t v48 = (unint64_t)v31[3];
        if (v49 >= v48 >> 1)
        {
          sub_24C8CBDD0(v48 > 1, v49 + 1, 1);
          unint64_t v31 = v190;
        }
        ++v32;
        v31[2] = (id)(v49 + 1);
        sub_24C8B38F0(v33, (uint64_t)v31+ ((*(unsigned __int8 *)(v178 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v178 + 80))+ *(void *)(v178 + 72) * v49, type metadata accessor for User);
      }
      while (v183 != v32);
    }
    else
    {
      uint64_t v50 = (char *)(v174 + 32);
      uint64_t v173 = *(void (***)(uint64_t, uint64_t, id *))(v168 + 16);
      unint64_t v174 = v168 + 16;
      uint64_t v51 = (uint64_t)v184;
      do
      {
        v187 = v50;
        uint64_t v183 = v30;
        uint64_t v52 = *(void *)v50;
        uint64_t v53 = v185;
        uint64_t v54 = v173;
        ((void (*)(uint64_t, uint64_t, id *))v173)(v51, *(void *)v50 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v185);
        LODWORD(v180) = *(_DWORD *)(v52 + 16);
        uint64_t v55 = *(void (***)(char *, uint64_t, id *))(v52 + 24);
        uint64_t v181 = *(void (***)(uint64_t, char *, id *))(v52 + 32);
        v182 = v55;
        ((void (*)(uint64_t, uint64_t, id *))v54)(v51 + v4[7], v52 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v53);
        uint64_t v57 = *(void *)(v52 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
        uint64_t v56 = *(void *)(v52 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName + 8);
        uint64_t v58 = *(void *)(v52 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
        unint64_t v12 = *(char **)(v52 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory + 8);
        unint64_t v59 = *(void *)(v52 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell + 8);
        unint64_t v179 = *(void *)(v52 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
        uint64_t v60 = (uint64_t *)(v52 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships);
        swift_beginAccess();
        uint64_t v61 = *(void *)(v52 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
        uint64_t v62 = v4;
        uint64_t v63 = *v60;
        *(_DWORD *)&v184[v62[5]] = v180;
        uint64_t v64 = &v184[v62[6]];
        unint64_t v65 = v181;
        *(void *)uint64_t v64 = v182;
        *((void *)v64 + 1) = v65;
        unint64_t v66 = &v184[v62[8]];
        *(void *)unint64_t v66 = v57;
        *((void *)v66 + 1) = v56;
        uint64_t v51 = (uint64_t)v184;
        uint64_t v67 = &v184[v62[9]];
        *(void *)uint64_t v67 = v58;
        *((void *)v67 + 1) = v12;
        uint64_t v68 = (unint64_t *)(v51 + v62[10]);
        unint64_t *v68 = v179;
        v68[1] = v59;
        *(void *)(v51 + v62[11]) = v63;
        *(void *)(v51 + v62[12]) = v61;
        uint64_t v190 = v31;
        unint64_t v70 = (unint64_t)v31[2];
        unint64_t v69 = (unint64_t)v31[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v70 >= v69 >> 1)
        {
          sub_24C8CBDD0(v69 > 1, v70 + 1, 1);
          unint64_t v31 = v190;
        }
        v31[2] = (id)(v70 + 1);
        sub_24C8B38F0(v51, (uint64_t)v31+ ((*(unsigned __int8 *)(v178 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v178 + 80))+ *(void *)(v178 + 72) * v70, type metadata accessor for User);
        uint64_t v4 = v188;
        uint64_t v50 = v187 + 8;
        uint64_t v30 = v183 - 1;
      }
      while (v183 != 1);
    }
  }
  unint64_t v71 = v175;
  v191 = v31;
  if (v175 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_24C8F8020();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v29 = *(void *)((v175 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v31 = (id *)MEMORY[0x263F8EE78];
  uint64_t v72 = v185;
  uint64_t v16 = v170;
  uint64_t v26 = v166;
  if (!v29) {
    goto LABEL_30;
  }
  uint64_t v189 = (id *)MEMORY[0x263F8EE78];
  sub_24C8CBD94(0, v29 & ~(v29 >> 63), 0);
  if (v29 < 0)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  unint64_t v31 = v189;
  if ((v71 & 0xC000000000000001) != 0)
  {
    unint64_t v12 = 0;
    uint64_t v183 = v168 + 16;
    uint64_t v26 = v186;
    v187 = (char *)v29;
    do
    {
      uint64_t v184 = (char *)v31;
      uint64_t v73 = MEMORY[0x2532FF870](v12, v71);
      (*(void (**)(char *, uint64_t, id *))v183)(v26, v73 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v72);
      int v74 = *(_DWORD *)(v73 + 32);
      uint64_t v76 = *(void *)(v73 + 40);
      uint64_t v75 = *(void *)(v73 + 48);
      uint64_t v78 = *(void *)(v73 + 16);
      uint64_t v77 = *(void *)(v73 + 24);
      uint64_t v79 = *(void *)(v73 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups);
      uint64_t v80 = *(void *)(v73 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_unknownObjectRelease();
      uint64_t v81 = v177;
      *(_DWORD *)&v186[v177[5]] = v74;
      uint64_t v82 = &v186[v81[6]];
      *(void *)uint64_t v82 = v76;
      *((void *)v82 + 1) = v75;
      uint64_t v83 = &v186[v81[7]];
      *(void *)uint64_t v83 = v78;
      *((void *)v83 + 1) = v77;
      *(void *)&v186[v81[8]] = v79;
      uint64_t v26 = v186;
      *(void *)&v186[v81[9]] = v80;
      unint64_t v31 = (id *)v184;
      uint64_t v189 = (id *)v184;
      unint64_t v85 = *((void *)v184 + 2);
      unint64_t v84 = *((void *)v184 + 3);
      if (v85 >= v84 >> 1)
      {
        sub_24C8CBD94(v84 > 1, v85 + 1, 1);
        unint64_t v31 = v189;
      }
      ++v12;
      v31[2] = (id)(v85 + 1);
      sub_24C8B38F0((uint64_t)v26, (uint64_t)v31+ ((*(unsigned __int8 *)(v176 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v176 + 80))+ *(void *)(v176 + 72) * v85, type metadata accessor for Group);
      uint64_t v29 = (uint64_t)v187;
      uint64_t v72 = v185;
      unint64_t v71 = v175;
    }
    while (v187 != v12);
  }
  else
  {
    unint64_t v12 = (char *)(v71 + 32);
    uint64_t v184 = *(char **)(v168 + 16);
    v186 = (char *)(v168 + 16);
    do
    {
      v187 = (char *)v29;
      uint64_t v86 = *(void *)v12;
      unint64_t v87 = v72;
      ((void (*)(char *, uint64_t, id *))v184)(v26, *(void *)v12 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v72);
      uint64_t v89 = *(void *)(v86 + 40);
      uint64_t v88 = *(void *)(v86 + 48);
      uint64_t v90 = *(void *)(v86 + 16);
      uint64_t v91 = *(void *)(v86 + 24);
      uint64_t v92 = *(void *)(v86 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups);
      uint64_t v93 = *(void *)(v86 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases);
      uint64_t v94 = v177;
      *(_DWORD *)&v26[v177[5]] = *(_DWORD *)(v86 + 32);
      uint64_t v95 = &v26[v94[6]];
      *(void *)uint64_t v95 = v89;
      *((void *)v95 + 1) = v88;
      uint64_t v96 = &v26[v94[7]];
      *(void *)uint64_t v96 = v90;
      *((void *)v96 + 1) = v91;
      *(void *)&v26[v94[8]] = v92;
      *(void *)&v26[v94[9]] = v93;
      uint64_t v189 = v31;
      unint64_t v98 = (unint64_t)v31[2];
      unint64_t v97 = (unint64_t)v31[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v98 >= v97 >> 1)
      {
        sub_24C8CBD94(v97 > 1, v98 + 1, 1);
        unint64_t v31 = v189;
      }
      v31[2] = (id)(v98 + 1);
      sub_24C8B38F0((uint64_t)v26, (uint64_t)v31+ ((*(unsigned __int8 *)(v176 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v176 + 80))+ *(void *)(v176 + 72) * v98, type metadata accessor for Group);
      v12 += 8;
      uint64_t v29 = (uint64_t)(v187 - 1);
      uint64_t v72 = v87;
    }
    while (v187 != (char *)1);
  }
  uint64_t v4 = v188;
  uint64_t v16 = v170;
LABEL_30:
  uint64_t v190 = v31;
  char v99 = v165;
  sub_24C8B2374((unint64_t *)&v191, (unint64_t *)&v190, v164);
  unint64_t v31 = v99;
  if (v99)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_2697F8F08 == -1)
    {
LABEL_32:
      uint64_t v100 = sub_24C8F7B10();
      unint64_t v101 = (uint8_t *)__swift_project_value_buffer(v100, (uint64_t)qword_2697F92A0);
      unint64_t v102 = v31;
      uint64_t v103 = v31;
      uint64_t v104 = sub_24C8F7AF0();
      os_log_type_t v105 = sub_24C8F7E30();
      if (os_log_type_enabled(v104, v105))
      {
        unint64_t v101 = (uint8_t *)swift_slowAlloc();
        id v106 = (void *)swift_slowAlloc();
        *(_DWORD *)unint64_t v101 = 138543362;
        uint64_t v107 = v31;
        os_log_type_t v108 = v31;
        uint64_t v109 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v189 = (id *)v109;
        sub_24C8F7E60();
        void *v106 = v109;
        MEMORY[0x2533003E0](v108);
        MEMORY[0x2533003E0](v108);
        _os_log_impl(&dword_24C8A9000, v104, v105, "Failed to update local users and groups: Performer failed: %{public}@", v101, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2697F92E8);
        swift_arrayDestroy();
        MEMORY[0x253300580](v106, -1, -1);
        MEMORY[0x253300580](v101, -1, -1);
      }
      else
      {
        MEMORY[0x2533003E0](v31);
        MEMORY[0x2533003E0](v31);
      }

      swift_willThrow();
      return v101;
    }
LABEL_59:
    swift_once();
    goto LABEL_32;
  }
  unint64_t v110 = (unint64_t)v191;
  uint64_t v111 = swift_bridgeObjectRetain();
  sub_24C8D4884(v111);
  swift_bridgeObjectRelease();
  uint64_t v112 = swift_bridgeObjectRetain();
  sub_24C8D4D3C(v112);
  swift_bridgeObjectRelease();
  v187 = *(char **)(v110 + 16);
  v165 = 0;
  if (v187)
  {
    if (swift_isUniquelyReferenced_nonNull_native()) {
      uint64_t v164 = (id *)v110;
    }
    else {
      uint64_t v164 = (id *)sub_24C8C2230(v110);
    }
    uint64_t v114 = 0;
    uint64_t v13 = v164;
    do
    {
      uint64_t v18 = (char *)v13[2];
      swift_bridgeObjectRetain();
      if (v114 >= v18)
      {
        __break(1u);
        goto LABEL_55;
      }
      uint64_t v26 = (char *)((*(unsigned __int8 *)(v178 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v178 + 80));
      uint64_t v29 = *(void *)(v178 + 72);
      sub_24C8C7EE4((uint64_t)v16);
      unint64_t v12 = ++v114;
    }
    while (v187 != v114);
    v191 = v13;
    uint64_t v115 = (char *)v13[2];
    unint64_t v101 = (uint8_t *)MEMORY[0x263F8EE78];
    if (v115)
    {
      uint64_t v189 = (id *)MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_24C8F7FB0();
      v170 = (char *)(v168 + 16);
      v166 = (char *)(v168 + 32);
      uint64_t v116 = (uint64_t)&v26[(void)v13];
      uint64_t v117 = (uint64_t)v169;
      do
      {
        v186 = v115;
        v187 = (char *)v116;
        uint64_t v184 = (char *)v29;
        uint64_t v118 = (uint64_t)v167;
        sub_24C8D8DA0(v116, (uint64_t)v167, type metadata accessor for User);
        sub_24C8D8DA0(v118, v117, type metadata accessor for User);
        uint64_t v119 = v4[6];
        LODWORD(v183) = *(_DWORD *)(v117 + v4[5]);
        uint64_t v120 = *(void *)(v117 + v119 + 8);
        uint64_t v180 = *(uint8_t **)(v117 + v119);
        uint64_t v121 = *(void (**)(char *, uint64_t, id *))v170;
        uint64_t v122 = v171;
        (*(void (**)(char *, uint64_t, id *))v170)(v171, v117, v72);
        uint64_t v123 = v4[7];
        uint64_t v124 = (uint64_t *)(v117 + v4[8]);
        unint64_t v125 = *v124;
        uint64_t v173 = (void (**)(uint64_t, uint64_t, id *))v124[1];
        unint64_t v174 = v125;
        unint64_t v126 = (uint64_t *)(v117 + v4[9]);
        uint64_t v128 = *v126;
        unint64_t v127 = v126[1];
        uint64_t v178 = v128;
        unint64_t v175 = v127;
        uint64_t v129 = v163;
        v121(v163, v117 + v123, v72);
        uint64_t v130 = v4[11];
        v131 = (unint64_t *)(v117 + v4[10]);
        unint64_t v132 = v131[1];
        unint64_t v179 = *v131;
        uint64_t v181 = *(void (***)(uint64_t, char *, id *))(v117 + v130);
        v182 = *(void (***)(char *, uint64_t, id *))&v169[v4[12]];
        type metadata accessor for UserRecord(0);
        uint64_t v133 = swift_allocObject();
        *(_DWORD *)(v133 + 16) = v183;
        *(void *)(v133 + 24) = v180;
        *(void *)(v133 + 32) = v120;
        uint64_t v134 = *(void (**)(uint64_t, char *, id *))v166;
        int64_t v135 = v122;
        uint64_t v29 = (uint64_t)v184;
        (*(void (**)(uint64_t, char *, id *))v166)(v133 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v135, v185);
        uint64_t v136 = (unint64_t *)(v133 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
        unint64_t v137 = v173;
        *uint64_t v136 = v174;
        v136[1] = (unint64_t)v137;
        uint64_t v138 = (void *)(v133 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
        unint64_t v139 = v175;
        *uint64_t v138 = v178;
        v138[1] = v139;
        v134(v133 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v129, v185);
        uint64_t v72 = v185;
        v140 = (unint64_t *)(v133 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
        unint64_t *v140 = v179;
        v140[1] = v132;
        uint64_t v141 = v182;
        *(void *)(v133 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships) = v181;
        *(void *)(v133 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases) = v141;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v142 = v186;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v117 = (uint64_t)v169;
        swift_bridgeObjectRetain();
        sub_24C8D8D40(v117, type metadata accessor for User);
        sub_24C8D8D40((uint64_t)v167, type metadata accessor for User);
        sub_24C8F7F90();
        sub_24C8F7FC0();
        uint64_t v4 = v188;
        sub_24C8F7FD0();
        sub_24C8F7FA0();
        uint64_t v116 = (uint64_t)&v187[v29];
        uint64_t v115 = v142 - 1;
      }
      while (v115);
      unint64_t v101 = (uint8_t *)v189;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    unint64_t v101 = (uint8_t *)MEMORY[0x263F8EE78];
  }
  unint64_t v143 = (unint64_t)v190;
  uint64_t v144 = (int *)v190[2];
  if (v144)
  {
    uint64_t v180 = v101;
    uint64_t v189 = (id *)MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_24C8F7FB0();
    unint64_t v145 = (*(unsigned __int8 *)(v176 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v176 + 80);
    unint64_t v179 = v143;
    uint64_t v146 = v143 + v145;
    uint64_t v183 = *(void *)(v176 + 72);
    uint64_t v181 = (void (**)(uint64_t, char *, id *))(v168 + 32);
    v182 = (void (**)(char *, uint64_t, id *))(v168 + 16);
    uint64_t v147 = (uint64_t)v162;
    v148 = v171;
    unint64_t v149 = v185;
    do
    {
      v188 = v144;
      uint64_t v150 = v172;
      sub_24C8D8DA0(v146, v172, type metadata accessor for Group);
      sub_24C8D8DA0(v150, v147, type metadata accessor for Group);
      v151 = v177;
      uint64_t v152 = v177[6];
      LODWORD(v187) = *(_DWORD *)(v147 + v177[5]);
      uint64_t v153 = *(void *)(v147 + v152 + 8);
      v186 = *(char **)(v147 + v152);
      (*v182)(v148, v147, v149);
      uint64_t v154 = v151[8];
      uint64_t v155 = (char **)(v147 + v151[7]);
      v156 = v155[1];
      uint64_t v184 = *v155;
      uint64_t v157 = *(void *)(v147 + v154);
      uint64_t v158 = *(void *)(v147 + v151[9]);
      type metadata accessor for GroupRecord(0);
      uint64_t v159 = swift_allocObject();
      *(_DWORD *)(v159 + 32) = v187;
      *(void *)(v159 + 40) = v186;
      *(void *)(v159 + 48) = v153;
      (*v181)(v159 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v148, v149);
      *(void *)(v159 + 16) = v184;
      *(void *)(v159 + 24) = v156;
      *(void *)(v159 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups) = v157;
      *(void *)(v159 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases) = v158;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v160 = v188;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24C8D8D40(v147, type metadata accessor for Group);
      sub_24C8D8D40(v172, type metadata accessor for Group);
      sub_24C8F7F90();
      sub_24C8F7FC0();
      sub_24C8F7FD0();
      sub_24C8F7FA0();
      v146 += v183;
      uint64_t v144 = (int *)((char *)v160 - 1);
    }
    while (v144);
    swift_bridgeObjectRelease();
    unint64_t v101 = v180;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v101;
}

void sub_24C8DA2D0(void *a1, void *a2)
{
  uint64_t v5 = type metadata accessor for RecordManager();
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  uint64_t v11 = __swift_project_boxed_opaque_existential_1(a1, v9);
  unint64_t v12 = (uint64_t *)&v8[*(int *)(v6 + 28)];
  v12[3] = v9;
  v12[4] = *(void *)(v10 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(boxed_opaque_existential_1, v11, v9);
  _Block_copy(a2);
  sub_24C8F7B00();
  if (qword_2697F8F08 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_24C8F7B10();
  uint64_t v37 = __swift_project_value_buffer(v14, (uint64_t)qword_2697F92A0);
  uint64_t v15 = sub_24C8F7AF0();
  os_log_type_t v16 = sub_24C8F7E40();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_24C8A9000, v15, v16, "Updating local domain...", v17, 2u);
    MEMORY[0x253300580](v17, -1, -1);
  }

  LODWORD(v36) = sub_24C8C3648();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v24 = sub_24C8AB78C(1);
  unint64_t v26 = v25;
  _Block_copy(a2);
  unint64_t v27 = sub_24C8D8E48(v24, v26, v21, (id *)a2);
  if (v2)
  {
    _Block_release(a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v32 = sub_24C8F7AF0();
    os_log_type_t v33 = sub_24C8F7E30();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_24C8A9000, v32, v33, "Failed to update local domain.", v34, 2u);
      MEMORY[0x253300580](v34, -1, -1);
    }

    swift_willThrow();
    sub_24C8D8D40((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for RecordManager);
  }
  else
  {
    unint64_t v29 = (unint64_t)v27;
    uint64_t v35 = v19;
    unint64_t v30 = v28;
    _Block_release(a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v31 = v36 & 1;
    unint64_t v36 = v30;
    sub_24C8BA0D0(v29, v30, v31, v35, (void (*)(char *, uint64_t, uint64_t))v21, v23);
    sub_24C8D8D40((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for RecordManager);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  _Block_release(a2);
}

char *sub_24C8DA698(char *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v6 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v6 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    uint64_t v7 = sub_24C8F7AE0();
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, (char *)a2, v7);
    uint64_t v9 = (int *)type metadata accessor for User(0);
    *(_DWORD *)&a1[v9[5]] = *(_DWORD *)((char *)a2 + v9[5]);
    uint64_t v10 = v9[6];
    uint64_t v11 = &a1[v10];
    unint64_t v12 = (uint64_t *)((char *)a2 + v10);
    uint64_t v13 = v12[1];
    *(void *)uint64_t v11 = *v12;
    *((void *)v11 + 1) = v13;
    uint64_t v14 = v9[7];
    uint64_t v15 = &a1[v14];
    os_log_type_t v16 = (char *)a2 + v14;
    swift_bridgeObjectRetain();
    v8(v15, v16, v7);
    uint64_t v17 = v9[8];
    uint64_t v18 = &a1[v17];
    uint64_t v19 = (uint64_t *)((char *)a2 + v17);
    uint64_t v20 = v19[1];
    *(void *)uint64_t v18 = *v19;
    *((void *)v18 + 1) = v20;
    uint64_t v21 = v9[9];
    uint64_t v22 = &a1[v21];
    uint64_t v23 = (uint64_t *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    *(void *)uint64_t v22 = *v23;
    *((void *)v22 + 1) = v24;
    uint64_t v25 = v9[10];
    unint64_t v26 = &a1[v25];
    unint64_t v27 = (uint64_t *)((char *)a2 + v25);
    uint64_t v28 = v27[1];
    *(void *)unint64_t v26 = *v27;
    *((void *)v26 + 1) = v28;
    *(void *)&a1[v9[11]] = *(uint64_t *)((char *)a2 + v9[11]);
    *(void *)&a1[v9[12]] = *(uint64_t *)((char *)a2 + v9[12]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24C8DAD04(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      uint64_t v3 = sub_24C8F7AE0();
      uint64_t v4 = *(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      v4(a1, v3);
      uint64_t v5 = type metadata accessor for User(0);
      swift_bridgeObjectRelease();
      v4(a1 + *(int *)(v5 + 28), v3);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24C8DAE50(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = sub_24C8F7AE0();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  v5(a1, a2, v4);
  uint64_t v6 = (int *)type metadata accessor for User(0);
  *(_DWORD *)(a1 + v6[5]) = *(_DWORD *)(a2 + v6[5]);
  uint64_t v7 = v6[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = v6[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  swift_bridgeObjectRetain();
  v5(v12, v13, v4);
  uint64_t v14 = v6[8];
  uint64_t v15 = (void *)(a1 + v14);
  os_log_type_t v16 = (void *)(a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = v6[9];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = v6[10];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  uint64_t v25 = v24[1];
  *uint64_t v23 = *v24;
  v23[1] = v25;
  *(void *)(a1 + v6[11]) = *(void *)(a2 + v6[11]);
  *(void *)(a1 + v6[12]) = *(void *)(a2 + v6[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_24C8DB000(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_24C8D8D40(a1, type metadata accessor for UserValidationError);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = sub_24C8F7AE0();
    uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
    v5(a1, a2, v4);
    uint64_t v6 = (int *)type metadata accessor for User(0);
    *(_DWORD *)(a1 + v6[5]) = *(_DWORD *)(a2 + v6[5]);
    uint64_t v7 = v6[6];
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (void *)(a2 + v7);
    *uint64_t v8 = *v9;
    v8[1] = v9[1];
    uint64_t v10 = v6[7];
    uint64_t v11 = a1 + v10;
    uint64_t v12 = a2 + v10;
    swift_bridgeObjectRetain();
    v5(v11, v12, v4);
    uint64_t v13 = v6[8];
    uint64_t v14 = (void *)(a1 + v13);
    uint64_t v15 = (void *)(a2 + v13);
    *uint64_t v14 = *v15;
    v14[1] = v15[1];
    uint64_t v16 = v6[9];
    uint64_t v17 = (void *)(a1 + v16);
    uint64_t v18 = (void *)(a2 + v16);
    *uint64_t v17 = *v18;
    v17[1] = v18[1];
    uint64_t v19 = v6[10];
    uint64_t v20 = (void *)(a1 + v19);
    uint64_t v21 = (void *)(a2 + v19);
    *uint64_t v20 = *v21;
    v20[1] = v21[1];
    *(void *)(a1 + v6[11]) = *(void *)(a2 + v6[11]);
    *(void *)(a1 + v6[12]) = *(void *)(a2 + v6[12]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24C8DB1F4(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = sub_24C8F7AE0();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  v5(a1, a2, v4);
  uint64_t v6 = (int *)type metadata accessor for User(0);
  *(_DWORD *)(a1 + v6[5]) = *(_DWORD *)(a2 + v6[5]);
  *(_OWORD *)(a1 + v6[6]) = *(_OWORD *)(a2 + v6[6]);
  v5(a1 + v6[7], a2 + v6[7], v4);
  *(_OWORD *)(a1 + v6[8]) = *(_OWORD *)(a2 + v6[8]);
  *(_OWORD *)(a1 + v6[9]) = *(_OWORD *)(a2 + v6[9]);
  *(_OWORD *)(a1 + v6[10]) = *(_OWORD *)(a2 + v6[10]);
  *(void *)(a1 + v6[11]) = *(void *)(a2 + v6[11]);
  *(void *)(a1 + v6[12]) = *(void *)(a2 + v6[12]);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_24C8DB34C(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_24C8D8D40(a1, type metadata accessor for UserValidationError);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = sub_24C8F7AE0();
    uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
    v5(a1, a2, v4);
    uint64_t v6 = (int *)type metadata accessor for User(0);
    *(_DWORD *)(a1 + v6[5]) = *(_DWORD *)(a2 + v6[5]);
    *(_OWORD *)(a1 + v6[6]) = *(_OWORD *)(a2 + v6[6]);
    v5(a1 + v6[7], a2 + v6[7], v4);
    *(_OWORD *)(a1 + v6[8]) = *(_OWORD *)(a2 + v6[8]);
    *(_OWORD *)(a1 + v6[9]) = *(_OWORD *)(a2 + v6[9]);
    *(_OWORD *)(a1 + v6[10]) = *(_OWORD *)(a2 + v6[10]);
    *(void *)(a1 + v6[11]) = *(void *)(a2 + v6[11]);
    *(void *)(a1 + v6[12]) = *(void *)(a2 + v6[12]);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24C8DB4D0()
{
  uint64_t result = type metadata accessor for User(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_24C8DB560(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    uint64_t v6 = sub_24C8F7AE0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    uint64_t v7 = (int *)type metadata accessor for Group(0);
    *(_DWORD *)((char *)a1 + v7[5]) = *(_DWORD *)((char *)a2 + v7[5]);
    uint64_t v8 = v7[6];
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = *v10;
    uint64_t v11 = v10[1];
    *uint64_t v9 = v12;
    v9[1] = v11;
    uint64_t v13 = v7[7];
    uint64_t v14 = (uint64_t *)((char *)a1 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    *(uint64_t *)((char *)a1 + v7[8]) = *(uint64_t *)((char *)a2 + v7[8]);
    *(uint64_t *)((char *)a1 + v7[9]) = *(uint64_t *)((char *)a2 + v7[9]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24C8DB848(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result <= 2)
  {
    uint64_t v3 = sub_24C8F7AE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
    type metadata accessor for Group(0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24C8DB908(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = sub_24C8F7AE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  int v5 = (int *)type metadata accessor for Group(0);
  *(_DWORD *)(a1 + v5[5]) = *(_DWORD *)(a2 + v5[5]);
  uint64_t v6 = v5[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = v8[1];
  *uint64_t v7 = *v8;
  v7[1] = v9;
  uint64_t v10 = v5[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  *(void *)(a1 + v5[8]) = *(void *)(a2 + v5[8]);
  *(void *)(a1 + v5[9]) = *(void *)(a2 + v5[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_24C8DBA20(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_24C8D8D40(a1, type metadata accessor for GroupValidationError);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = sub_24C8F7AE0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    int v5 = (int *)type metadata accessor for Group(0);
    *(_DWORD *)(a1 + v5[5]) = *(_DWORD *)(a2 + v5[5]);
    uint64_t v6 = v5[6];
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    *uint64_t v7 = *v8;
    v7[1] = v8[1];
    uint64_t v9 = v5[7];
    uint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (void *)(a2 + v9);
    *uint64_t v10 = *v11;
    v10[1] = v11[1];
    *(void *)(a1 + v5[8]) = *(void *)(a2 + v5[8]);
    *(void *)(a1 + v5[9]) = *(void *)(a2 + v5[9]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24C8DBB6C(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = sub_24C8F7AE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  int v5 = (int *)type metadata accessor for Group(0);
  *(_DWORD *)(a1 + v5[5]) = *(_DWORD *)(a2 + v5[5]);
  *(_OWORD *)(a1 + v5[6]) = *(_OWORD *)(a2 + v5[6]);
  *(_OWORD *)(a1 + v5[7]) = *(_OWORD *)(a2 + v5[7]);
  *(void *)(a1 + v5[8]) = *(void *)(a2 + v5[8]);
  *(void *)(a1 + v5[9]) = *(void *)(a2 + v5[9]);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_24C8DBC40(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_24C8D8D40(a1, type metadata accessor for GroupValidationError);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = sub_24C8F7AE0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
    int v5 = (int *)type metadata accessor for Group(0);
    *(_DWORD *)(a1 + v5[5]) = *(_DWORD *)(a2 + v5[5]);
    *(_OWORD *)(a1 + v5[6]) = *(_OWORD *)(a2 + v5[6]);
    *(_OWORD *)(a1 + v5[7]) = *(_OWORD *)(a2 + v5[7]);
    *(void *)(a1 + v5[8]) = *(void *)(a2 + v5[8]);
    *(void *)(a1 + v5[9]) = *(void *)(a2 + v5[9]);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24C8DBD38()
{
  uint64_t result = type metadata accessor for Group(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_24C8DBDC4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24C8DBE20()
{
  uint64_t v1 = sub_24C8F7AE0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  int v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v25 - v6;
  int v8 = *(_DWORD *)(v0 + 24);
  uint64_t v9 = *(void *)(v0 + 40);
  uint64_t v32 = *(void *)(v0 + 32);
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v10((char *)&v25 - v6, v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_uuid, v1);
  uint64_t v11 = *(void *)(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_fullName);
  uint64_t v12 = *(void *)(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_fullName + 8);
  uint64_t v13 = *(void *)(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_homeDirectory + 8);
  uint64_t v30 = *(void *)(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_homeDirectory);
  uint64_t v31 = v11;
  uint64_t v27 = v13;
  uint64_t v28 = v12;
  v10(v5, v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_primaryGroupUUID, v1);
  uint64_t v14 = *(void *)(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_shell + 8);
  uint64_t v29 = *(void *)(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_shell);
  uint64_t v26 = *(void *)(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_memberships);
  uint64_t v15 = MEMORY[0x263F8EE88];
  if (*(void *)(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases)) {
    uint64_t v15 = *(void *)(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases);
  }
  uint64_t v25 = v15;
  type metadata accessor for UserRecord(0);
  uint64_t v16 = swift_allocObject();
  *(_DWORD *)(v16 + 16) = v8;
  *(void *)(v16 + 24) = v32;
  *(void *)(v16 + 32) = v9;
  uint64_t v17 = *(void (**)(uint64_t, char *, uint64_t))(v2 + 32);
  v17(v16 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v7, v1);
  uint64_t v18 = (void *)(v16 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
  uint64_t v19 = v27;
  uint64_t v20 = v28;
  *uint64_t v18 = v31;
  v18[1] = v20;
  uint64_t v21 = (void *)(v16 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
  *uint64_t v21 = v30;
  v21[1] = v19;
  v17(v16 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v5, v1);
  uint64_t v22 = (void *)(v16 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
  *uint64_t v22 = v29;
  v22[1] = v14;
  uint64_t v23 = v25;
  *(void *)(v16 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships) = v26;
  *(void *)(v16 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases) = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v16;
}

unint64_t sub_24C8DC0D0(char a1)
{
  unint64_t result = 0x6E6F6973726576;
  switch(a1)
  {
    case 1:
      unint64_t result = 17481;
      break;
    case 2:
      unint64_t result = 1701667182;
      break;
    case 3:
      unint64_t result = 1145656661;
      break;
    case 4:
      unint64_t result = 0x656D614E6C6C7566;
      break;
    case 5:
      unint64_t result = 0x65726944656D6F68;
      break;
    case 6:
      unint64_t result = 0xD000000000000010;
      break;
    case 7:
      unint64_t result = 0x6C6C656873;
      break;
    case 8:
      unint64_t result = 0x68737265626D656DLL;
      break;
    case 9:
      unint64_t result = 0x73657361696C61;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24C8DC200(char a1)
{
  unint64_t result = 0x6E6F6973726576;
  switch(a1)
  {
    case 1:
      unint64_t result = 17481;
      break;
    case 2:
      unint64_t result = 1701667182;
      break;
    case 3:
      unint64_t result = 1145656661;
      break;
    case 4:
      unint64_t result = 0x656D614E6C6C7566;
      break;
    case 5:
      unint64_t result = 0x65726944656D6F68;
      break;
    case 6:
      unint64_t result = 0xD000000000000010;
      break;
    case 7:
      unint64_t result = 0x6C6C656873;
      break;
    case 8:
      unint64_t result = 0x68737265626D656DLL;
      break;
    case 9:
      unint64_t result = 0x73657361696C61;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24C8DC330(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_24C8DC0D0(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_24C8DC0D0(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_24C8F8380();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24C8DC3BC()
{
  char v1 = *v0;
  sub_24C8F85A0();
  sub_24C8DC0D0(v1);
  sub_24C8F7CE0();
  swift_bridgeObjectRelease();
  return sub_24C8F85D0();
}

uint64_t sub_24C8DC420()
{
  sub_24C8DC0D0(*v0);
  sub_24C8F7CE0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24C8DC474()
{
  char v1 = *v0;
  sub_24C8F85A0();
  sub_24C8DC0D0(v1);
  sub_24C8F7CE0();
  swift_bridgeObjectRelease();
  return sub_24C8F85D0();
}

uint64_t sub_24C8DC4D4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24C8DF26C();
  *a1 = result;
  return result;
}

unint64_t sub_24C8DC504@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_24C8DC0D0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_24C8DC530()
{
  return sub_24C8DC200(*v0);
}

uint64_t sub_24C8DC538@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24C8DF26C();
  *a1 = result;
  return result;
}

void sub_24C8DC560(unsigned char *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_24C8DC56C(uint64_t a1)
{
  unint64_t v2 = sub_24C8DE76C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C8DC5A8(uint64_t a1)
{
  unint64_t v2 = sub_24C8DE76C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24C8DC5E4()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_uuid;
  uint64_t v2 = sub_24C8F7AE0();
  unint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_primaryGroupUUID, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24C8DC6DC()
{
  sub_24C8DC5E4();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24C8DC734()
{
  return type metadata accessor for UserRecordFile(0);
}

uint64_t type metadata accessor for UserRecordFile(uint64_t a1)
{
  return sub_24C8B7B74(a1, (uint64_t *)&unk_2697F9330);
}

uint64_t sub_24C8DC75C()
{
  uint64_t result = sub_24C8F7AE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24C8DC834(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24C8F7AE0();
  uint64_t v19 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93A0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C8DE76C();
  sub_24C8F85F0();
  LOBYTE(v22) = 0;
  uint64_t v11 = v20;
  sub_24C8F8130();
  if (!v11)
  {
    uint64_t v20 = v6;
    uint64_t v13 = v19;
    LOBYTE(v22) = 1;
    sub_24C8F8150();
    uint64_t v18 = v2;
    LOBYTE(v22) = 2;
    swift_bridgeObjectRetain();
    sub_24C8F8110();
    swift_bridgeObjectRelease();
    LOBYTE(v22) = 3;
    uint64_t v14 = sub_24C8DDC00(&qword_2697F8FE0, MEMORY[0x263F07508]);
    sub_24C8F8140();
    v17[1] = v14;
    LOBYTE(v22) = 4;
    swift_bridgeObjectRetain();
    sub_24C8F8110();
    swift_bridgeObjectRelease();
    uint64_t v15 = v18;
    LOBYTE(v22) = 5;
    swift_bridgeObjectRetain();
    sub_24C8F8110();
    swift_bridgeObjectRelease();
    uint64_t v16 = v20;
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v20, v15 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_primaryGroupUUID, v4);
    LOBYTE(v22) = 6;
    sub_24C8F8140();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v4);
    LOBYTE(v22) = 7;
    swift_bridgeObjectRetain();
    sub_24C8F8110();
    swift_bridgeObjectRelease();
    uint64_t v22 = *(void *)(v15 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_memberships);
    char v21 = 8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9380);
    sub_24C8DE7C0(&qword_2697F93A8, &qword_2697F8FE0);
    sub_24C8F8140();
    uint64_t v22 = *(void *)(v15 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases);
    char v21 = 9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9390);
    sub_24C8DE854(&qword_2697F93B0);
    sub_24C8F8100();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void *sub_24C8DCDE4(void *a1)
{
  uint64_t v44 = *v1;
  uint64_t v3 = sub_24C8F7AE0();
  uint64_t v40 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v38 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9370);
  uint64_t v41 = *(void *)(v9 - 8);
  uint64_t v42 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases;
  uint64_t v47 = v1;
  *(void *)((char *)v1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases) = 0;
  uint64_t v13 = a1[3];
  uint64_t v45 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_24C8DE76C();
  uint64_t v43 = v11;
  uint64_t v14 = v46;
  sub_24C8F85E0();
  if (v14)
  {
    uint64_t v17 = (uint64_t)v45;
    unint64_t v36 = v47;
    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
    uint64_t v37 = v17;
  }
  else
  {
    uint64_t v39 = v12;
    uint64_t v15 = v41;
    uint64_t v46 = v3;
    LOBYTE(v49) = 0;
    uint64_t v16 = sub_24C8F80B0();
    uint64_t v19 = v47;
    v47[2] = v16;
    LOBYTE(v49) = 1;
    *((_DWORD *)v19 + 6) = sub_24C8F80D0();
    LOBYTE(v49) = 2;
    v19[4] = sub_24C8F8090();
    v19[5] = v20;
    LOBYTE(v49) = 3;
    uint64_t v21 = sub_24C8DDC00(&qword_2697F9008, MEMORY[0x263F07508]);
    uint64_t v22 = v46;
    v38[3] = v21;
    sub_24C8F80C0();
    uint64_t v23 = v22;
    uint64_t v24 = v40 + 32;
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v40 + 32);
    v25((char *)v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_uuid, v8, v23);
    LOBYTE(v49) = 4;
    uint64_t v26 = sub_24C8F8090();
    v38[1] = v24;
    v38[2] = 0;
    uint64_t v27 = (void *)((char *)v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_fullName);
    *uint64_t v27 = v26;
    v27[1] = v28;
    LOBYTE(v49) = 5;
    uint64_t v29 = sub_24C8F8090();
    uint64_t v30 = (void *)((char *)v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_homeDirectory);
    *uint64_t v30 = v29;
    v30[1] = v31;
    LOBYTE(v49) = 6;
    uint64_t v32 = v46;
    sub_24C8F80C0();
    v25((char *)v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_primaryGroupUUID, v6, v32);
    LOBYTE(v49) = 7;
    uint64_t v33 = sub_24C8F8090();
    uint64_t v34 = (void *)((char *)v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_shell);
    *uint64_t v34 = v33;
    v34[1] = v35;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9380);
    char v48 = 8;
    sub_24C8DE7C0(&qword_2697F9388, &qword_2697F9008);
    sub_24C8F80C0();
    *(void *)((char *)v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_memberships) = v49;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9390);
    char v48 = 9;
    sub_24C8DE854(&qword_2697F9398);
    sub_24C8F8080();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v43, v42);
    unint64_t v36 = v47;
    *(void *)((char *)v47 + v39) = v49;
    swift_bridgeObjectRelease();
    uint64_t v37 = (uint64_t)v45;
  }
  __swift_destroy_boxed_opaque_existential_1(v37);
  return v36;
}

uint64_t sub_24C8DD58C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24C8DE6E0(a1, (uint64_t (*)(uint64_t))sub_24C8DCDE4, a2);
}

uint64_t sub_24C8DD5B8(void *a1)
{
  return sub_24C8DC834(a1);
}

uint64_t sub_24C8DD5DC(unsigned __int8 *a1, char *a2)
{
  return sub_24C8AD208(*a1, *a2);
}

uint64_t sub_24C8DD5E8()
{
  return sub_24C8E30C0();
}

uint64_t sub_24C8DD5F4()
{
  sub_24C8F7CE0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24C8DD6F4()
{
  return sub_24C8E30C0();
}

uint64_t sub_24C8DD6FC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24C8DF2B8();
  *a1 = result;
  return result;
}

void sub_24C8DD72C(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE700000000000000;
  uint64_t v3 = 0x6E6F6973726576;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE200000000000000;
      uint64_t v3 = 17481;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 1701667182;
      *(void *)(a1 + 8) = 0xE400000000000000;
      break;
    case 3:
      *(void *)a1 = 1145656661;
      *(void *)(a1 + 8) = 0xE400000000000000;
      break;
    case 4:
      *(void *)a1 = 0x656D614E6C6C7566;
      *(void *)(a1 + 8) = 0xE800000000000000;
      break;
    case 5:
      strcpy((char *)a1, "nestedGroups");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      break;
    case 6:
      *(void *)a1 = 0x73657361696C61;
      *(void *)(a1 + 8) = 0xE700000000000000;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

uint64_t sub_24C8DD810()
{
  uint64_t result = 0x6E6F6973726576;
  switch(*v0)
  {
    case 1:
      uint64_t result = 17481;
      break;
    case 2:
      uint64_t result = 1701667182;
      break;
    case 3:
      uint64_t result = 1145656661;
      break;
    case 4:
      uint64_t result = 0x656D614E6C6C7566;
      break;
    case 5:
      uint64_t result = 0x724764657473656ELL;
      break;
    case 6:
      uint64_t result = 0x73657361696C61;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24C8DD8DC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24C8DF2B8();
  *a1 = result;
  return result;
}

void sub_24C8DD904(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_24C8DD910(uint64_t a1)
{
  unint64_t v2 = sub_24C8DE8B8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C8DD94C(uint64_t a1)
{
  unint64_t v2 = sub_24C8DE8B8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24C8DD988()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_uuid;
  uint64_t v2 = sub_24C8F7AE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24C8DDA64()
{
  return type metadata accessor for GroupRecordFile(0);
}

uint64_t type metadata accessor for GroupRecordFile(uint64_t a1)
{
  return sub_24C8B7B74(a1, (uint64_t *)&unk_2697F9340);
}

uint64_t sub_24C8DDA8C()
{
  uint64_t result = sub_24C8F7AE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24C8DDB50(uint64_t a1)
{
  uint64_t result = sub_24C8DDC00(&qword_2697F8F28, (void (*)(uint64_t))type metadata accessor for GroupRecordFile);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24C8DDBA8(uint64_t a1)
{
  uint64_t result = sub_24C8DDC00(&qword_2697F8F30, (void (*)(uint64_t))type metadata accessor for UserRecordFile);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24C8DDC00(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24C8DDC48(uint64_t a1)
{
  uint64_t result = sub_24C8DDC00(&qword_2697F9350, (void (*)(uint64_t))type metadata accessor for GroupRecordFile);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24C8DDCA0(uint64_t a1)
{
  uint64_t result = sub_24C8DDC00(&qword_2697F9358, (void (*)(uint64_t))type metadata accessor for GroupRecordFile);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24C8DDCF8(uint64_t a1)
{
  uint64_t result = sub_24C8DDC00(&qword_2697F9360, (void (*)(uint64_t))type metadata accessor for UserRecordFile);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24C8DDD50(uint64_t a1)
{
  uint64_t result = sub_24C8DDC00(&qword_2697F9368, (void (*)(uint64_t))type metadata accessor for UserRecordFile);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24C8DDDA8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93C8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C8DE8B8();
  sub_24C8F85F0();
  LOBYTE(v11) = 0;
  sub_24C8F8130();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_24C8F8150();
    LOBYTE(v11) = 2;
    swift_bridgeObjectRetain();
    sub_24C8F8110();
    swift_bridgeObjectRelease();
    LOBYTE(v11) = 3;
    sub_24C8F7AE0();
    sub_24C8DDC00(&qword_2697F8FE0, MEMORY[0x263F07508]);
    sub_24C8F8140();
    LOBYTE(v11) = 4;
    swift_bridgeObjectRetain();
    sub_24C8F8110();
    swift_bridgeObjectRelease();
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups);
    HIBYTE(v10) = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9380);
    sub_24C8DE7C0(&qword_2697F93A8, &qword_2697F8FE0);
    sub_24C8F8100();
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases);
    HIBYTE(v10) = 6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9390);
    sub_24C8DE854(&qword_2697F93B0);
    sub_24C8F8100();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void *sub_24C8DE13C(void *a1)
{
  uint64_t v30 = *v1;
  uint64_t v3 = sub_24C8F7AE0();
  uint64_t v28 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93B8);
  uint64_t v27 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups;
  *(void *)((char *)v1 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups) = 0;
  uint64_t v9 = OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases;
  uint64_t v31 = a1;
  uint64_t v32 = v1;
  *(void *)((char *)v1 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases) = 0;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C8DE8B8();
  uint64_t v10 = v7;
  uint64_t v11 = v33;
  sub_24C8F85E0();
  if (v11)
  {
    uint64_t v17 = (uint64_t)v31;
    uint64_t v19 = v32;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
    uint64_t v24 = v17;
  }
  else
  {
    uint64_t v12 = v5;
    uint64_t v33 = v8;
    uint64_t v14 = v27;
    uint64_t v13 = v28;
    uint64_t v26 = v9;
    LOBYTE(v35) = 0;
    uint64_t v15 = v29;
    uint64_t v16 = sub_24C8F80B0();
    uint64_t v19 = v32;
    v32[2] = v16;
    LOBYTE(v35) = 1;
    *((_DWORD *)v19 + 6) = sub_24C8F80D0();
    LOBYTE(v35) = 2;
    v19[4] = sub_24C8F8090();
    v19[5] = v20;
    LOBYTE(v35) = 3;
    sub_24C8DDC00(&qword_2697F9008, MEMORY[0x263F07508]);
    sub_24C8F80C0();
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))((uint64_t)v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_uuid, v12, v3);
    LOBYTE(v35) = 4;
    uint64_t v21 = sub_24C8F8090();
    uint64_t v22 = (void *)((char *)v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_fullName);
    *uint64_t v22 = v21;
    v22[1] = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9380);
    char v34 = 5;
    sub_24C8DE7C0(&qword_2697F9388, &qword_2697F9008);
    sub_24C8F8080();
    *(void *)((char *)v19 + v33) = v35;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9390);
    char v34 = 6;
    sub_24C8DE854(&qword_2697F9398);
    sub_24C8F8080();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v10, v15);
    *(void *)((char *)v19 + v26) = v35;
    swift_bridgeObjectRelease();
    uint64_t v24 = (uint64_t)v31;
  }
  __swift_destroy_boxed_opaque_existential_1(v24);
  return v19;
}

uint64_t sub_24C8DE6B4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_24C8DE6E0(a1, (uint64_t (*)(uint64_t))sub_24C8DE13C, a2);
}

uint64_t sub_24C8DE6E0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t)@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v7 = swift_allocObject();
  uint64_t result = a2(a1);
  if (!v3) {
    *a3 = v7;
  }
  return result;
}

uint64_t sub_24C8DE748(void *a1)
{
  return sub_24C8DDDA8(a1);
}

unint64_t sub_24C8DE76C()
{
  unint64_t result = qword_2697F9378;
  if (!qword_2697F9378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9378);
  }
  return result;
}

uint64_t sub_24C8DE7C0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697F9380);
    sub_24C8DDC00(a2, MEMORY[0x263F07508]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24C8DE854(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697F9390);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24C8DE8B8()
{
  unint64_t result = qword_2697F93C0;
  if (!qword_2697F93C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F93C0);
  }
  return result;
}

uint64_t sub_24C8DE90C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  if (v2 != 3)
  {
    uint64_t v5 = sub_24C8F7F70();
    swift_allocError();
    uint64_t v4 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D0);
    v4[3] = MEMORY[0x263F8D9D0];
    void *v4 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_24C8F9900;
    *(void *)(v7 + 56) = &type metadata for UserRecordFile.CodingKeys;
    *(void *)(v7 + 64) = sub_24C8DE76C();
    *(unsigned char *)(v7 + 32) = 0;
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v5 - 8) + 104))(v4, *MEMORY[0x263F8DCE0], v5);
    swift_willThrow();
    return (uint64_t)v4;
  }
  sub_24C8F79B0();
  swift_allocObject();
  sub_24C8F79A0();
  sub_24C8DDC00(&qword_2697F9360, (void (*)(uint64_t))type metadata accessor for UserRecordFile);
  uint64_t v3 = sub_24C8F7990();
  if (!v1)
  {
    uint64_t v4 = (void *)v3;
    swift_release();
    return (uint64_t)v4;
  }
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_24C8DEB20()
{
  uint64_t v2 = *(void *)(v0 + 16);
  if (v2 != 3)
  {
    uint64_t v5 = sub_24C8F7F70();
    swift_allocError();
    uint64_t v4 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D0);
    v4[3] = MEMORY[0x263F8D9D0];
    void *v4 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_24C8F9900;
    *(void *)(v7 + 56) = &type metadata for GroupRecordFile.CodingKeys;
    *(void *)(v7 + 64) = sub_24C8DE8B8();
    *(unsigned char *)(v7 + 32) = 0;
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v5 - 8) + 104))(v4, *MEMORY[0x263F8DCE0], v5);
    swift_willThrow();
    return (uint64_t)v4;
  }
  sub_24C8F79B0();
  swift_allocObject();
  sub_24C8F79A0();
  sub_24C8DDC00(&qword_2697F9350, (void (*)(uint64_t))type metadata accessor for GroupRecordFile);
  uint64_t v3 = sub_24C8F7990();
  if (!v1)
  {
    uint64_t v4 = (void *)v3;
    swift_release();
    return (uint64_t)v4;
  }
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t getEnumTagSinglePayload for GroupRecordFile.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GroupRecordFile.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x24C8DEE90);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GroupRecordFile.CodingKeys()
{
  return &type metadata for GroupRecordFile.CodingKeys;
}

uint64_t getEnumTagSinglePayload for UserRecordFile.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for UserRecordFile.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 9;
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
        JUMPOUT(0x24C8DF024);
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
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserRecordFile.CodingKeys()
{
  return &type metadata for UserRecordFile.CodingKeys;
}

unint64_t sub_24C8DF060()
{
  unint64_t result = qword_2697F93E0;
  if (!qword_2697F93E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F93E0);
  }
  return result;
}

unint64_t sub_24C8DF0B8()
{
  unint64_t result = qword_2697F93E8;
  if (!qword_2697F93E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F93E8);
  }
  return result;
}

unint64_t sub_24C8DF110()
{
  unint64_t result = qword_2697F93F0;
  if (!qword_2697F93F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F93F0);
  }
  return result;
}

unint64_t sub_24C8DF168()
{
  unint64_t result = qword_2697F93F8;
  if (!qword_2697F93F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F93F8);
  }
  return result;
}

unint64_t sub_24C8DF1C0()
{
  unint64_t result = qword_2697F9400;
  if (!qword_2697F9400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9400);
  }
  return result;
}

unint64_t sub_24C8DF218()
{
  unint64_t result = qword_2697F9408;
  if (!qword_2697F9408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9408);
  }
  return result;
}

uint64_t sub_24C8DF26C()
{
  unint64_t v0 = sub_24C8F8070();
  swift_bridgeObjectRelease();
  if (v0 >= 0xA) {
    return 10;
  }
  else {
    return v0;
  }
}

uint64_t sub_24C8DF2B8()
{
  unint64_t v0 = sub_24C8F8070();
  swift_bridgeObjectRelease();
  if (v0 >= 7) {
    return 7;
  }
  else {
    return v0;
  }
}

void sub_24C8DF304(uint64_t a1)
{
  v46[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_24C8F7900();
  uint64_t v42 = *(void *)(v2 - 8);
  uint64_t v43 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v38 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9430);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v39 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24C8F78E0();
  uint64_t v41 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v40 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v38 - v9;
  uint64_t v11 = sub_24C8F7C20();
  uint64_t v44 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = objc_msgSend(self, sel_defaultManager);
  sub_24C8F7C00();
  uint64_t v15 = (void *)sub_24C8F7C80();
  swift_bridgeObjectRelease();
  v46[0] = 0;
  unsigned int v16 = objc_msgSend(v14, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v15, 1, 0, v46);

  id v17 = v46[0];
  if (!v16)
  {
    id v25 = v46[0];
    uint64_t v26 = (void *)sub_24C8F7A00();

    swift_willThrow();
    v46[0] = v26;
    id v27 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8F20);
    if (swift_dynamicCast())
    {
      uint64_t v29 = v40;
      uint64_t v28 = v41;
      (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v40, v10, v6);
      uint64_t v30 = sub_24C8F78D0();
      if (v30)
      {
        uint64_t v45 = v30;
        uint64_t v31 = (uint64_t)v39;
        uint64_t v32 = v43;
        int v33 = swift_dynamicCast();
        uint64_t v34 = v42;
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v42 + 56))(v31, v33 ^ 1u, 1, v32);
      }
      else
      {
        uint64_t v34 = v42;
        uint64_t v32 = v43;
        uint64_t v31 = (uint64_t)v39;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v42 + 56))(v39, 1, 1, v43);
      }
      int v35 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v31, 1, v32);
      sub_24C8E1310(v31);
      if (v35)
      {
        (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v6);
      }
      else
      {
        MEMORY[0x2533003E0](v26);
        uint64_t v36 = sub_24C8F78D0();
        if (!v36)
        {
          __break(1u);
          return;
        }
        uint64_t v45 = v36;
        uint64_t v37 = v38;
        swift_dynamicCast();
        sub_24C8F78F0();
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v6);
        (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v32);
      }
    }
    MEMORY[0x2533003E0](v46[0]);
    return;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v13, a1, v11);
  id v18 = v17;
  uint64_t v19 = sub_24C8F7AF0();
  os_log_type_t v20 = sub_24C8F7E20();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = (void *)swift_slowAlloc();
    v46[0] = v22;
    *(_DWORD *)uint64_t v21 = 136446210;
    sub_24C8E1218(&qword_2697F8F18, MEMORY[0x263F8F328]);
    uint64_t v23 = sub_24C8F8180();
    uint64_t v45 = sub_24C8E22EC(v23, v24, (uint64_t *)v46);
    sub_24C8F7E60();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v13, v11);
    _os_log_impl(&dword_24C8A9000, v19, v20, "Created directory %{public}s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253300580](v22, -1, -1);
    MEMORY[0x253300580](v21, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v44 + 8))(v13, v11);
  }
}

void sub_24C8DF938(uint64_t a1)
{
  v52[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_24C8F7900();
  uint64_t v46 = *(void *)(v2 - 8);
  uint64_t v47 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v43 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9430);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v44 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24C8F78E0();
  uint64_t v45 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  char v48 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = sub_24C8F7C20();
  uint64_t v50 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_msgSend(self, sel_defaultManager);
  sub_24C8F7C00();
  uint64_t v13 = (void *)sub_24C8F7C80();
  swift_bridgeObjectRelease();
  v52[0] = 0;
  unsigned int v14 = objc_msgSend(v12, sel_removeItemAtPath_error_, v13, v52);

  id v15 = v52[0];
  if (!v14)
  {
    id v24 = v52[0];
    id v25 = (void *)sub_24C8F7A00();

    swift_willThrow();
    v52[0] = v25;
    id v26 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8F20);
    if (swift_dynamicCast())
    {
      uint64_t v27 = v45;
      uint64_t v28 = v48;
      (*(void (**)(void))(v45 + 32))();
      uint64_t v29 = sub_24C8F78D0();
      if (v29)
      {
        uint64_t v51 = v29;
        uint64_t v30 = (uint64_t)v44;
        uint64_t v31 = v47;
        int v32 = swift_dynamicCast();
        uint64_t v33 = v46;
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v46 + 56))(v30, v32 ^ 1u, 1, v31);
      }
      else
      {
        uint64_t v33 = v46;
        uint64_t v31 = v47;
        uint64_t v30 = (uint64_t)v44;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56))(v44, 1, 1, v47);
      }
      int v34 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v30, 1, v31);
      sub_24C8E1310(v30);
      if (!v34)
      {
        MEMORY[0x2533003E0](v25);
        uint64_t v35 = sub_24C8F78D0();
        if (v35)
        {
          uint64_t v51 = v35;
          uint64_t v36 = v43;
          swift_dynamicCast();
          sub_24C8E1218((unint64_t *)&qword_2697F8F10, MEMORY[0x263F06080]);
          sub_24C8F79C0();
          uint64_t v37 = *(void (**)(char *, uint64_t))(v33 + 8);
          v37(v36, v31);
          int v38 = sub_24C8F7BC0();
          if (v38 == sub_24C8F7BC0())
          {
            (*(void (**)(char *, uint64_t))(v27 + 8))(v48, v6);
            MEMORY[0x2533003E0](v52[0]);
            return;
          }
          uint64_t v39 = v48;
          uint64_t v40 = sub_24C8F78D0();
          if (v40)
          {
            uint64_t v51 = v40;
            uint64_t v41 = v43;
            swift_dynamicCast();
            sub_24C8F78F0();
            swift_willThrow();
            (*(void (**)(char *, uint64_t))(v27 + 8))(v39, v6);
            v37(v41, v31);
            goto LABEL_16;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        return;
      }
      (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v6);
    }
LABEL_16:
    MEMORY[0x2533003E0](v52[0]);
    return;
  }
  uint64_t v16 = v50;
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v11, a1, v9);
  id v17 = v15;
  id v18 = sub_24C8F7AF0();
  os_log_type_t v19 = sub_24C8F7E20();
  if (os_log_type_enabled(v18, v19))
  {
    os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = (void *)swift_slowAlloc();
    v52[0] = v21;
    *(_DWORD *)os_log_type_t v20 = 136446210;
    uint64_t v49 = v20 + 4;
    sub_24C8E1218(&qword_2697F8F18, MEMORY[0x263F8F328]);
    uint64_t v22 = sub_24C8F8180();
    uint64_t v51 = sub_24C8E22EC(v22, v23, (uint64_t *)v52);
    sub_24C8F7E60();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v9);
    _os_log_impl(&dword_24C8A9000, v18, v19, "Deleted %{public}s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253300580](v21, -1, -1);
    MEMORY[0x253300580](v20, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v9);
  }
}

uint64_t sub_24C8E0034(uint64_t a1, uint8_t *a2, uint64_t a3)
{
  uint64_t v44 = a2;
  uint64_t v43 = a1;
  uint64_t v4 = sub_24C8F7900();
  uint64_t v37 = *(void *)(v4 - 8);
  uint64_t v38 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v35 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9430);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24C8F78E0();
  uint64_t v39 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v36 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = sub_24C8F7C20();
  uint64_t v40 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unsigned int v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24C8F7A20();
  uint64_t v41 = *(void *)(v15 - 8);
  uint64_t v42 = v15;
  MEMORY[0x270FA5388](v15);
  id v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C8F7C00();
  sub_24C8F7A10();
  swift_bridgeObjectRelease();
  id v18 = (void *)v45;
  sub_24C8F7A70();
  if (v18)
  {
    uint64_t v47 = (uint64_t)v18;
    id v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8F20);
    if (swift_dynamicCast())
    {
      os_log_type_t v20 = v36;
      (*(void (**)(void))(v39 + 32))();
      uint64_t v21 = sub_24C8F78D0();
      if (v21)
      {
        uint64_t v46 = v21;
        uint64_t v22 = v38;
        int v23 = swift_dynamicCast();
        uint64_t v24 = v37;
        (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v8, v23 ^ 1u, 1, v22);
      }
      else
      {
        uint64_t v24 = v37;
        uint64_t v22 = v38;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v37 + 56))(v8, 1, 1, v38);
      }
      int v32 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48))(v8, 1, v22);
      sub_24C8E1310((uint64_t)v8);
      if (!v32)
      {
        MEMORY[0x2533003E0](v18);
        uint64_t result = sub_24C8F78D0();
        if (!result)
        {
          __break(1u);
          return result;
        }
        uint64_t v46 = result;
        uint64_t v33 = v35;
        swift_dynamicCast();
        sub_24C8F78F0();
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v39 + 8))(v20, v9);
        (*(void (**)(char *, uint64_t))(v41 + 8))(v17, v42);
        (*(void (**)(char *, uint64_t))(v24 + 8))(v33, v22);
        return MEMORY[0x2533003E0](v47);
      }
      (*(void (**)(char *, uint64_t))(v39 + 8))(v20, v9);
    }
    (*(void (**)(char *, uint64_t))(v41 + 8))(v17, v42);
    return MEMORY[0x2533003E0](v47);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v14, a3, v12);
  id v25 = sub_24C8F7AF0();
  os_log_type_t v26 = sub_24C8F7E20();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    uint64_t v47 = v45;
    *(_DWORD *)uint64_t v27 = 136446210;
    uint64_t v44 = v27 + 4;
    sub_24C8E1218(&qword_2697F8F18, MEMORY[0x263F8F328]);
    uint64_t v28 = sub_24C8F8180();
    uint64_t v46 = sub_24C8E22EC(v28, v29, &v47);
    sub_24C8F7E60();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v14, v12);
    _os_log_impl(&dword_24C8A9000, v25, v26, "Wrote file %{public}s", v27, 0xCu);
    uint64_t v30 = v45;
    swift_arrayDestroy();
    MEMORY[0x253300580](v30, -1, -1);
    MEMORY[0x253300580](v27, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v40 + 8))(v14, v12);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v17, v42);
}

void sub_24C8E069C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24C8F7900();
  os_log_t v54 = *(os_log_t *)(v4 - 8);
  uint64_t v55 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v53 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24C8F7C20();
  uint64_t v57 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v50 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v56 = (char *)&v50 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v50 - v15;
  int v63 = 0;
  uint64_t v58 = a2;
  unint64_t v59 = &v63;
  uint64_t v17 = sub_24C8F7BE0();
  if (v63)
  {
    int v18 = MEMORY[0x2532FF520](v17);
    id v19 = *(void (**)(char *, uint64_t, uint64_t))(v57 + 16);
    v19(v12, a1, v6);
    v19(v9, a2, v6);
    os_log_type_t v20 = sub_24C8F7AF0();
    os_log_type_t v21 = sub_24C8F7E30();
    int v22 = v21;
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v23 = swift_slowAlloc();
      LODWORD(v52) = v18;
      uint64_t v24 = v23;
      uint64_t v56 = (char *)swift_slowAlloc();
      uint64_t v61 = v56;
      *(_DWORD *)uint64_t v24 = 136446722;
      int v62 = v22;
      uint64_t v50 = sub_24C8E1218(&qword_2697F8F18, MEMORY[0x263F8F328]);
      os_log_t v51 = v20;
      uint64_t v25 = sub_24C8F8180();
      uint64_t v60 = sub_24C8E22EC(v25, v26, (uint64_t *)&v61);
      sub_24C8F7E60();
      swift_bridgeObjectRelease();
      uint64_t v27 = *(void (**)(char *, uint64_t))(v57 + 8);
      v27(v12, v6);
      *(_WORD *)(v24 + 12) = 2082;
      uint64_t v28 = sub_24C8F8180();
      uint64_t v60 = sub_24C8E22EC(v28, v29, (uint64_t *)&v61);
      sub_24C8F7E60();
      swift_bridgeObjectRelease();
      v27(v9, v6);
      *(_WORD *)(v24 + 22) = 1024;
      LODWORD(v60) = v52;
      sub_24C8F7E60();
      os_log_t v30 = v51;
      _os_log_impl(&dword_24C8A9000, v51, (os_log_type_t)v62, "renamex_np(%{public}s, %{public}s) failed: %{darwin.errno}d", (uint8_t *)v24, 0x1Cu);
      uint64_t v31 = v56;
      swift_arrayDestroy();
      MEMORY[0x253300580](v31, -1, -1);
      MEMORY[0x253300580](v24, -1, -1);
    }
    else
    {

      uint64_t v45 = *(void (**)(char *, uint64_t))(v57 + 8);
      v45(v12, v6);
      v45(v9, v6);
    }
    uint64_t v46 = sub_24C8F7BB0();
    if ((v46 & 0x100000000) != 0)
    {
      __break(1u);
    }
    else
    {
      LODWORD(v61) = v46;
      sub_24C8E0F2C(MEMORY[0x263F8EE78]);
      sub_24C8E1218((unint64_t *)&qword_2697F8F10, MEMORY[0x263F06080]);
      uint64_t v47 = v53;
      uint64_t v48 = v55;
      sub_24C8F79E0();
      sub_24C8F78F0();
      ((void (*)(char *, uint64_t))v54[1].isa)(v47, v48);
      swift_willThrow();
    }
  }
  else
  {
    int v32 = *(void (**)(char *, uint64_t, uint64_t))(v57 + 16);
    v32(v16, a1, v6);
    v32(v56, a2, v6);
    uint64_t v33 = sub_24C8F7AF0();
    os_log_type_t v34 = sub_24C8F7E20();
    int v35 = v34;
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v36 = swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      uint64_t v61 = (char *)v55;
      *(_DWORD *)uint64_t v36 = 136446466;
      uint64_t v52 = sub_24C8E1218(&qword_2697F8F18, MEMORY[0x263F8F328]);
      os_log_t v54 = v33;
      uint64_t v37 = sub_24C8F8180();
      uint64_t v60 = sub_24C8E22EC(v37, v38, (uint64_t *)&v61);
      sub_24C8F7E60();
      swift_bridgeObjectRelease();
      LODWORD(v53) = v35;
      uint64_t v39 = *(void (**)(char *, uint64_t))(v57 + 8);
      v39(v16, v6);
      *(_WORD *)(v36 + 12) = 2082;
      uint64_t v40 = v56;
      uint64_t v41 = sub_24C8F8180();
      uint64_t v60 = sub_24C8E22EC(v41, v42, (uint64_t *)&v61);
      sub_24C8F7E60();
      swift_bridgeObjectRelease();
      v39(v40, v6);
      os_log_t v43 = v54;
      _os_log_impl(&dword_24C8A9000, v54, (os_log_type_t)v53, "Atomically swapped %{public}s <-> %{public}s", (uint8_t *)v36, 0x16u);
      uint64_t v44 = v55;
      swift_arrayDestroy();
      MEMORY[0x253300580](v44, -1, -1);
      MEMORY[0x253300580](v36, -1, -1);
    }
    else
    {

      uint64_t v49 = *(void (**)(char *, uint64_t))(v57 + 8);
      v49(v16, v6);
      v49(v56, v6);
    }
  }
}

uint64_t sub_24C8E0DE0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal18FilesystemProvider_logger;
  uint64_t v2 = sub_24C8F7B10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24C8E0E80()
{
  return type metadata accessor for FilesystemProvider();
}

uint64_t type metadata accessor for FilesystemProvider()
{
  uint64_t result = qword_2697F9410;
  if (!qword_2697F9410) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C8E0ED4()
{
  return sub_24C8F7BE0();
}

unint64_t sub_24C8E0F2C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9420);
  uint64_t v2 = sub_24C8F8050();
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
    sub_24C8E1260(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24C8E1058(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_24C8E12C8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_24C8E1058(uint64_t a1, uint64_t a2)
{
  sub_24C8F85A0();
  sub_24C8F7CE0();
  uint64_t v4 = sub_24C8F85D0();

  return sub_24C8E10D0(a1, a2, v4);
}

unint64_t sub_24C8E10D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_24C8F8380() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_24C8F8380() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_24C8F8380()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_24C8E1218(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24C8E1260(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9428);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_24C8E12C8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24C8E12D8(char *a1)
{
  long long v2 = *(_DWORD **)(v1 + 16);
  uint64_t result = renamex_np(*(const char **)(v1 + 24), a1, 2u);
  *long long v2 = result;
  return result;
}

uint64_t sub_24C8E1310(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9430);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24C8E1370()
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v0 = sub_24C8F7900();
  uint64_t v51 = *(void *)(v0 - 8);
  uint64_t v52 = v0;
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (uint64_t)&v51 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9430);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (char **)sub_24C8F78E0();
  uint64_t v53 = (uint64_t)*(v6 - 1);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (uint64_t)&v51 - v10;
  id v12 = objc_msgSend(self, sel_defaultManager);
  sub_24C8F7C00();
  BOOL v13 = (void *)sub_24C8F7C80();
  swift_bridgeObjectRelease();
  uint64_t v56 = 0;
  id v14 = objc_msgSend(v12, sel_contentsOfDirectoryAtPath_error_, v13, &v56);

  uint64_t v15 = v56;
  if (v14)
  {
    uint64_t v16 = (void *)sub_24C8F7D50();
    long long v17 = v15;

    uint64_t v57 = v16;
    uint64_t v15 = (char *)v16[2];
    if (!v15)
    {
      int64_t v21 = 0;
      uint64_t v2 = 0;
      goto LABEL_18;
    }
    uint64_t v18 = v16[4];
    uint64_t v19 = v16[5];
    if (v18 == 46 && v19 == 0xE100000000000000
      || (sub_24C8F8380() & 1) != 0
      || v18 == 11822 && v19 == 0xE200000000000000
      || (sub_24C8F8380() & 1) != 0)
    {
      uint64_t v2 = 0;
LABEL_10:
      uint64_t v20 = v2 + 1;
      if (!__OFADD__(v2, 1))
      {
        if ((char *)v20 == v15) {
          goto LABEL_12;
        }
        uint64_t v6 = (char **)(16 * v2);
        uint64_t v15 = (char *)(v2 + 1);
        while ((v20 & 0x8000000000000000) == 0)
        {
          uint64_t v9 = (char *)v16[2];
          if (v15 >= v9) {
            goto LABEL_63;
          }
          uint64_t v11 = (uint64_t)v6 + (void)v16;
          uint64_t v34 = *(uint64_t *)((char *)v6 + (void)v16 + 48);
          uint64_t v5 = *(char **)((char *)v6 + (void)v16 + 56);
          BOOL v35 = v34 == 46 && v5 == (char *)0xE100000000000000;
          if (!v35
            && (sub_24C8F8380() & 1) == 0
            && (v34 != 11822 || v5 != (char *)0xE200000000000000)
            && (sub_24C8F8380() & 1) == 0)
          {
            if (v15 != (char *)v2)
            {
              if (v2 >= (unint64_t)v9) {
                goto LABEL_66;
              }
              uint64_t v36 = &v16[2 * v2 + 4];
              uint64_t v37 = v36[1];
              uint64_t v53 = *v36;
              uint64_t v9 = *(char **)(v11 + 48);
              uint64_t v5 = *(char **)(v11 + 56);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v16 = sub_24C8C221C(v16);
              }
              unint64_t v38 = &v16[2 * v2];
              void v38[4] = v9;
              v38[5] = v5;
              swift_bridgeObjectRelease();
              if ((unint64_t)v15 >= v16[2]) {
                goto LABEL_67;
              }
              uint64_t v39 = (char *)v6 + (void)v16;
              *((void *)v39 + 6) = v53;
              *((void *)v39 + 7) = v37;
              swift_bridgeObjectRelease();
              uint64_t v57 = v16;
            }
            if (__OFADD__(v2++, 1)) {
              goto LABEL_65;
            }
          }
          ++v15;
          v6 += 2;
          if (v15 == (char *)v16[2]) {
            goto LABEL_12;
          }
        }
        __break(1u);
LABEL_63:
        __break(1u);
      }
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
    }
    if (v15 == (char *)1)
    {
      uint64_t v2 = 1;
    }
    else
    {
      uint64_t v6 = (char **)(v16 + 7);
      uint64_t v2 = 1;
      uint64_t v9 = (char *)0xE100000000000000;
      uint64_t v11 = 11822;
      do
      {
        uint64_t v47 = (uint64_t)*(v6 - 1);
        uint64_t v5 = *v6;
        BOOL v48 = v47 == 46 && v5 == (char *)0xE100000000000000;
        if (v48 || (sub_24C8F8380() & 1) != 0) {
          goto LABEL_10;
        }
        BOOL v49 = v47 == 11822 && v5 == (char *)0xE200000000000000;
        if (v49 || (sub_24C8F8380() & 1) != 0) {
          goto LABEL_10;
        }
        uint64_t v50 = (char *)(v2 + 1);
        if (__OFADD__(v2, 1)) {
          goto LABEL_68;
        }
        v6 += 2;
        ++v2;
      }
      while (v50 != v15);
      uint64_t v2 = (uint64_t)v15;
    }
LABEL_12:
    int64_t v21 = v16[2];
    if (v21 < v2)
    {
      __break(1u);
      goto LABEL_14;
    }
LABEL_18:
    sub_24C8C22C4(v2, v21);
    return (uint64_t)v57;
  }
LABEL_14:
  int v22 = v5;
  uint64_t v54 = v2;
  uint64_t v24 = v51;
  uint64_t v23 = v52;
  uint64_t v25 = v15;
  unint64_t v26 = (char *)sub_24C8F7A00();

  swift_willThrow();
  uint64_t v56 = v26;
  uint64_t v27 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8F20);
  if (!swift_dynamicCast()) {
    return MEMORY[0x2533003E0](v56);
  }
  (*(void (**)(char *, uint64_t, char **))(v53 + 32))(v9, v11, v6);
  uint64_t v28 = sub_24C8F78D0();
  unint64_t v29 = v26;
  if (v28)
  {
    uint64_t v55 = v28;
    uint64_t v30 = (uint64_t)v22;
    uint64_t v31 = v23;
    int v32 = swift_dynamicCast();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v24 + 56))(v30, v32 ^ 1u, 1, v23);
  }
  else
  {
    uint64_t v30 = (uint64_t)v22;
    uint64_t v41 = v22;
    uint64_t v31 = v23;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v41, 1, 1, v23);
  }
  uint64_t v42 = v54;
  int v43 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v30, 1, v31);
  uint64_t v44 = v30;
  int v45 = v43;
  sub_24C8E1310(v44);
  if (v45)
  {
    (*(void (**)(char *, char **))(v53 + 8))(v9, v6);
    return MEMORY[0x2533003E0](v56);
  }
  MEMORY[0x2533003E0](v29);
  uint64_t result = sub_24C8F78D0();
  uint64_t v46 = v53;
  if (result)
  {
    uint64_t v55 = result;
    swift_dynamicCast();
    sub_24C8F78F0();
    swift_willThrow();
    (*(void (**)(char *, char **))(v46 + 8))(v9, v6);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v42, v31);
    return MEMORY[0x2533003E0](v56);
  }
  __break(1u);
  return result;
}

uint64_t sub_24C8E1A48()
{
  uint64_t v1 = sub_24C8F7900();
  uint64_t v29 = *(void *)(v1 - 8);
  uint64_t v30 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v28 = (char *)v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9430);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24C8F78E0();
  uint64_t v31 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v27 - v10;
  uint64_t v12 = sub_24C8F7A20();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C8F7C00();
  sub_24C8F7A10();
  swift_bridgeObjectRelease();
  uint64_t v16 = sub_24C8F7A30();
  uint64_t v32 = v17;
  if (!v0)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    return v16;
  }
  uint64_t v34 = v0;
  id v18 = v0;
  v27[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8F20);
  if (!swift_dynamicCast())
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
LABEL_13:
    MEMORY[0x2533003E0](v34);
    return v16;
  }
  v27[0] = v16;
  (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v9, v11, v6);
  uint64_t v19 = sub_24C8F78D0();
  if (v19)
  {
    uint64_t v33 = v19;
    uint64_t v20 = v30;
    int v21 = swift_dynamicCast();
    uint64_t v22 = v29;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v5, v21 ^ 1u, 1, v20);
  }
  else
  {
    uint64_t v22 = v29;
    uint64_t v20 = v30;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56))(v5, 1, 1, v30);
  }
  int v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48))(v5, 1, v20);
  sub_24C8E1310((uint64_t)v5);
  if (v23)
  {
    (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
LABEL_12:
    uint64_t v16 = v27[0];
    goto LABEL_13;
  }
  MEMORY[0x2533003E0](v0);
  uint64_t result = sub_24C8F78D0();
  if (result)
  {
    uint64_t v33 = result;
    uint64_t v25 = v28;
    uint64_t v26 = v30;
    swift_dynamicCast();
    sub_24C8F78F0();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v25, v26);
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

void sub_24C8E1EB8(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_24C8F7CC0();
  uint32_t v5 = notify_post((const char *)(v4 + 32));
  swift_release();
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_24C8F7AF0();
  if (v5)
  {
    os_log_type_t v7 = sub_24C8F7E30();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v14 = v9;
      *(_DWORD *)uint64_t v8 = 136446466;
      swift_bridgeObjectRetain();
      sub_24C8E22EC(a1, a2, &v14);
      sub_24C8F7E60();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 1024;
      sub_24C8F7E60();
      _os_log_impl(&dword_24C8A9000, v6, v7, "notify_post(%{public}s) Failed: %u", (uint8_t *)v8, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x253300580](v9, -1, -1);
      MEMORY[0x253300580](v8, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    if ((v5 & 0x80000000) != 0)
    {
      __break(1u);
    }
    else
    {
      sub_24C8E2298();
      swift_allocError();
      *uint64_t v13 = v5;
      swift_willThrow();
    }
  }
  else
  {
    int v10 = sub_24C8F7E20();
    if (os_log_type_enabled(v6, (os_log_type_t)v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v14 = v12;
      *(_DWORD *)uint64_t v11 = 136446210;
      swift_bridgeObjectRetain();
      sub_24C8E22EC(a1, a2, &v14);
      sub_24C8F7E60();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24C8A9000, v6, (os_log_type_t)v10, "Posted notification %{public}s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253300580](v12, -1, -1);
      MEMORY[0x253300580](v11, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_24C8E21A4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal20NotificationProvider_logger;
  uint64_t v2 = sub_24C8F7B10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24C8E2244()
{
  return type metadata accessor for NotificationProvider();
}

uint64_t type metadata accessor for NotificationProvider()
{
  uint64_t result = qword_2697F9438;
  if (!qword_2697F9438) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24C8E2298()
{
  unint64_t result = qword_2697F9448;
  if (!qword_2697F9448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9448);
  }
  return result;
}

uint64_t sub_24C8E22EC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24C8E23C0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24C8E2944((uint64_t)v12, *a3);
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
      sub_24C8E2944((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24C8E23C0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24C8F7E70();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24C8E257C(a5, a6);
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
  uint64_t v8 = sub_24C8F7F80();
  if (!v8)
  {
    sub_24C8F8000();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24C8F8060();
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

uint64_t sub_24C8E257C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24C8E2614(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24C8E27F4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24C8E27F4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24C8E2614(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24C8E278C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24C8F7F10();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24C8F8000();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24C8F7D10();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24C8F8060();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24C8F8000();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24C8E278C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9450);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24C8E27F4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9450);
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
  uint64_t result = sub_24C8F8060();
  __break(1u);
  return result;
}

uint64_t sub_24C8E2944(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_24C8E29A0(uint64_t a1)
{
  unint64_t result = sub_24C8E29C8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24C8E29C8()
{
  unint64_t result = qword_2697F9458;
  if (!qword_2697F9458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9458);
  }
  return result;
}

unint64_t sub_24C8E2A1C(uint64_t a1)
{
  unint64_t result = sub_24C8AFAE0();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24C8E2A44()
{
  return sub_24C8F85D0();
}

uint64_t sub_24C8E2B38()
{
  sub_24C8F7CE0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24C8E2C18()
{
  sub_24C8F7CE0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24C8E2D58()
{
  sub_24C8F7CE0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24C8E2E8C()
{
  return sub_24C8F85D0();
}

uint64_t sub_24C8E2FD0()
{
  return sub_24C8F85D0();
}

uint64_t sub_24C8E30C0()
{
  return sub_24C8F85D0();
}

unint64_t sub_24C8E31D4(char a1)
{
  unint64_t result = 0x7A696D796E6F6E61;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000013;
      break;
    case 2:
      unint64_t result = 0xD000000000000024;
      break;
    case 3:
      unint64_t result = 0xD000000000000022;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24C8E3280(char a1)
{
  unint64_t result = 0x7A696D796E6F6E61;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000013;
      break;
    case 2:
      unint64_t result = 0xD000000000000024;
      break;
    case 3:
      unint64_t result = 0xD000000000000022;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24C8E332C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = a3;
  uint64_t v16 = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9470);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  size_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C8E3A60();
  sub_24C8F85F0();
  LOBYTE(v18) = 0;
  sub_24C8F8120();
  if (!v5)
  {
    uint64_t v12 = v16;
    uint64_t v18 = v15;
    char v17 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9380);
    sub_24C8E3AB4(&qword_2697F93A8, &qword_2697F8FE0);
    sub_24C8F8140();
    uint64_t v18 = a4;
    char v17 = 2;
    sub_24C8F8140();
    uint64_t v18 = v12;
    char v17 = 3;
    sub_24C8F8140();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_24C8E3568(unsigned __int8 *a1, char *a2)
{
  return sub_24C8AD424(*a1, *a2);
}

uint64_t sub_24C8E3574()
{
  return sub_24C8E2A44();
}

uint64_t sub_24C8E357C()
{
  return sub_24C8E2B38();
}

uint64_t sub_24C8E3584()
{
  return sub_24C8E2FD0();
}

uint64_t sub_24C8E358C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24C8E36F8();
  *a1 = result;
  return result;
}

unint64_t sub_24C8E35BC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_24C8E31D4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_24C8E35E8()
{
  return sub_24C8E3280(*v0);
}

uint64_t sub_24C8E35F0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24C8E36F8();
  *a1 = result;
  return result;
}

void sub_24C8E3618(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_24C8E3624(uint64_t a1)
{
  unint64_t v2 = sub_24C8E3A60();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C8E3660(uint64_t a1)
{
  unint64_t v2 = sub_24C8E3A60();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24C8E369C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_24C8E3744(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = result & 1;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
    *(void *)(a2 + 24) = v7;
  }
  return result;
}

uint64_t sub_24C8E36D4(void *a1)
{
  return sub_24C8E332C(a1, *(unsigned __int8 *)v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_24C8E36F8()
{
  unint64_t v0 = sub_24C8F8070();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_24C8E3744(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9460);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_24C8E3A60();
  sub_24C8F85E0();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    LOBYTE(v12) = 0;
    LOBYTE(v7) = sub_24C8F80A0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9380);
    char v11 = 1;
    uint64_t v8 = sub_24C8E3AB4(&qword_2697F9388, &qword_2697F9008);
    sub_24C8F80C0();
    char v11 = 2;
    swift_bridgeObjectRetain();
    uint64_t v10 = v8;
    sub_24C8F80C0();
    char v11 = 3;
    swift_bridgeObjectRetain();
    uint64_t v10 = 0;
    sub_24C8F80C0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7 & 1;
}

unint64_t sub_24C8E3A60()
{
  unint64_t result = qword_2697F9468;
  if (!qword_2697F9468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9468);
  }
  return result;
}

uint64_t sub_24C8E3AB4(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697F9380);
    sub_24C8E3B34(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24C8E3B34(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24C8F7AE0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Configuration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Configuration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24C8E3CD4);
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

ValueMetadata *type metadata accessor for Configuration.CodingKeys()
{
  return &type metadata for Configuration.CodingKeys;
}

uint64_t destroy for Configuration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Configuration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Configuration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for Configuration(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Configuration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Configuration(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Configuration()
{
  return &type metadata for Configuration;
}

unint64_t sub_24C8E3F28()
{
  unint64_t result = qword_2697F9478;
  if (!qword_2697F9478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9478);
  }
  return result;
}

unint64_t sub_24C8E3F80()
{
  unint64_t result = qword_2697F9480;
  if (!qword_2697F9480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9480);
  }
  return result;
}

unint64_t sub_24C8E3FD8()
{
  unint64_t result = qword_2697F9488;
  if (!qword_2697F9488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9488);
  }
  return result;
}

uint64_t destroy for XPCCodingKey()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for XPCCodingKey(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for XPCCodingKey(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for XPCCodingKey(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCCodingKey(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 25)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCCodingKey(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
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
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCCodingKey()
{
  return &type metadata for XPCCodingKey;
}

uint64_t sub_24C8E41CC()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24C8E41FC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = result;
  *(void *)(a3 + 8) = a2;
  *(void *)(a3 + 16) = 0;
  *(unsigned char *)(a3 + 24) = 1;
  return result;
}

uint64_t sub_24C8E4210()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_24C8E421C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_24C8F8180();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = a1;
  *(unsigned char *)(a2 + 24) = 0;
  return result;
}

uint64_t sub_24C8E4278(uint64_t a1)
{
  unint64_t v2 = sub_24C8E43A0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C8E42B4(uint64_t a1)
{
  unint64_t v2 = sub_24C8E43A0();

  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_24C8E42F4()
{
  unint64_t result = qword_2697F94F0;
  if (!qword_2697F94F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F94F0);
  }
  return result;
}

unint64_t sub_24C8E434C()
{
  unint64_t result = qword_2697F94F8;
  if (!qword_2697F94F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F94F8);
  }
  return result;
}

unint64_t sub_24C8E43A0()
{
  unint64_t result = qword_2697F9500;
  if (!qword_2697F9500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9500);
  }
  return result;
}

uint64_t sub_24C8E43F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for _XPCEncoder();
  int v8 = (void *)swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8EE78];
  v8[2] = MEMORY[0x263F8EE78];
  v8[3] = sub_24C8E4678(v9);
  long long v8[4] = 0;
  uint64_t v16 = v7;
  uint64_t v17 = sub_24C8E8118(&qword_2697F9570, (void (*)(void))type metadata accessor for _XPCEncoder);
  uint64_t v14 = (uint64_t)v8;
  swift_retain();
  sub_24C8F7C30();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  if (!v3)
  {
    a3 = v8[4];
    if (a3)
    {
      swift_unknownObjectRetain();
      swift_release();
      return a3;
    }
    a3 = sub_24C8F7F70();
    swift_allocError();
    uint64_t v12 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D0);
    uint64_t v12[3] = a2;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(boxed_opaque_existential_1, a1, a2);
    uint64_t v14 = 0;
    unint64_t v15 = 0xE000000000000000;
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    uint64_t v14 = 0x6576656C2D706F54;
    unint64_t v15 = 0xEA0000000000206CLL;
    sub_24C8F8640();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    sub_24C8F7CF0();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(a3 - 8) + 104))(v12, *MEMORY[0x263F8DCE0], a3);
    swift_willThrow();
  }
  swift_release();
  return a3;
}

uint64_t type metadata accessor for _XPCEncoder()
{
  return self;
}

unint64_t sub_24C8E4678(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9590);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_2697F9598);
  uint64_t v6 = sub_24C8F8050();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_24C8E7E30(v12, (uint64_t)v5);
    unint64_t result = sub_24C8E7908((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_24C8F7FF0();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    unint64_t result = (unint64_t)sub_24C8E12C8(v9, (_OWORD *)(v7[7] + 32 * v16));
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
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

ValueMetadata *type metadata accessor for SimpleXPCEncoder()
{
  return &type metadata for SimpleXPCEncoder;
}

uint64_t sub_24C8E487C()
{
  xpc_object_t v1 = *(xpc_object_t *)(v0 + 32);
  if (!v1) {
    goto LABEL_4;
  }
  uint64_t v2 = swift_unknownObjectRetain();
  uint64_t v3 = MEMORY[0x2533006D0](v2);
  if (v3 != sub_24C8F7BA0())
  {
    __break(1u);
LABEL_4:
    xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
    *(void *)(v0 + 32) = v1;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  uint64_t v4 = *(void *)(v0 + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  sub_24C8E49D8(v0, v4, (uint64_t)v1);
  type metadata accessor for _XPCKeyedEncodingContainer();
  swift_retain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_24C8F8160();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E49D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = MEMORY[0x2533006D0](a3);
  if (v4 == sub_24C8F7BA0()) {
    return a1;
  }
  uint64_t result = sub_24C8F8010();
  __break(1u);
  return result;
}

uint64_t sub_24C8E4A80@<X0>(void *a1@<X8>)
{
  xpc_object_t v3 = *(xpc_object_t *)(v1 + 32);
  if (v3)
  {
    uint64_t v4 = swift_unknownObjectRetain();
    uint64_t v5 = MEMORY[0x2533006D0](v4);
    if (v5 == sub_24C8F7B50()) {
      goto LABEL_5;
    }
    __break(1u);
  }
  xpc_object_t v3 = xpc_array_create(0, 0);
  *(void *)(v1 + 32) = v3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
LABEL_5:
  uint64_t v6 = *(void *)(v1 + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v7 = swift_unknownObjectRetain();
  uint64_t v8 = MEMORY[0x2533006D0](v7);
  if (v8 == sub_24C8F7B50())
  {
    a1[3] = &type metadata for _XPCUnkeyedEncodingContainer;
    a1[4] = sub_24C8E7DC4();
    uint64_t result = swift_unknownObjectRelease();
    *a1 = v1;
    a1[1] = v3;
    a1[2] = v6;
  }
  else
  {
    uint64_t result = sub_24C8F8010();
    __break(1u);
  }
  return result;
}

uint64_t sub_24C8E4BA4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_24C8E4BEC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24C8E4BF8()
{
  return sub_24C8E487C();
}

uint64_t sub_24C8E4C1C@<X0>(void *a1@<X8>)
{
  return sub_24C8E4A80(a1);
}

void sub_24C8E4C40(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 32))
  {
    __break(1u);
  }
  else
  {
    a1[3] = type metadata accessor for _XPCEncoder();
    a1[4] = sub_24C8E8118(&qword_2697F9578, (void (*)(void))type metadata accessor for _XPCEncoder);
    *a1 = v3;
    swift_retain();
  }
}

uint64_t sub_24C8E4CD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[4] = a3;
  v10[3] = a2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v10);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(boxed_opaque_existential_1, a1, a2);
  uint64_t v8 = sub_24C8E7B04(v10);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  if (!v4)
  {
    *(void *)(v3 + 32) = v8;
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_24C8E4D74()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24C8E4D80()
{
  uint64_t v1 = *v0;
  *(void *)(v1 + 32) = xpc_null_create();
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E4DBC(char a1)
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 32) = xpc_BOOL_create(a1 & 1);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E4DFC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_24C8F7CC0();
  xpc_object_t v3 = xpc_string_create((const char *)(v2 + 32));
  swift_release();
  *(void *)(v1 + 32) = v3;
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E4E54(double a1)
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 32) = xpc_double_create(a1);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E4E90(float a1)
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 32) = xpc_double_create(a1);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E4ED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8E50C0(a1, a2, a3, MEMORY[0x263EF8B18]);
}

uint64_t sub_24C8E4EFC(char a1)
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 32) = xpc_int64_create(a1);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E4F3C(__int16 a1)
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 32) = xpc_int64_create(a1);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E4F7C(int a1)
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 32) = xpc_int64_create(a1);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E4FBC()
{
  return sub_24C8F83B0();
}

uint64_t sub_24C8E4FD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8E50C0(a1, a2, a3, MEMORY[0x263EF8B20]);
}

uint64_t sub_24C8E5000(unsigned __int8 a1)
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 32) = xpc_uint64_create(a1);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E5040(unsigned __int16 a1)
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 32) = xpc_uint64_create(a1);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E5080(uint64_t value)
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 32) = xpc_uint64_create(value);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E50C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v5 = *v4;
  *(void *)(v5 + 32) = a4();
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E5100()
{
  return sub_24C8F83C0();
}

uint64_t sub_24C8E5118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8E4CD0(a1, a2, a3);
}

uint64_t sub_24C8E513C(uint64_t a1, ValueMetadata *a2, unint64_t a3)
{
  uint64_t v4 = v3;
  xpc_object_t xarray = *(xpc_object_t *)(v3 + 8);
  size_t count = xpc_array_get_count(xarray);
  *(void *)&long long v19 = 0x207865646E49;
  *((void *)&v19 + 1) = 0xE600000000000000;
  size_t v22 = count;
  sub_24C8F8180();
  sub_24C8F7CF0();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void **)(v3 + 16);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v8 = sub_24C8F2368(0, v8[2] + 1, 1, v8);
  }
  unint64_t v10 = v8[2];
  unint64_t v9 = v8[3];
  if (v10 >= v9 >> 1) {
    uint64_t v8 = sub_24C8F2368((void *)(v9 > 1), v10 + 1, 1, v8);
  }
  BOOL v20 = &type metadata for XPCCodingKey;
  unint64_t v21 = sub_24C8E43A0();
  uint64_t v11 = swift_allocObject();
  *(void *)&long long v19 = v11;
  *(void *)(v11 + 16) = 0x207865646E49;
  *(void *)(v11 + 24) = 0xE600000000000000;
  *(void *)(v11 + 32) = count;
  *(unsigned char *)(v11 + 40) = 0;
  v8[2] = v10 + 1;
  sub_24C8E8100(&v19, (uint64_t)&v8[5 * v10 + 4]);
  *(void *)(v4 + 16) = v8;
  BOOL v20 = a2;
  unint64_t v21 = a3;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v19);
  (*((void (**)(uint64_t *, uint64_t, ValueMetadata *))a2[-1].Description + 2))(boxed_opaque_existential_1, a1, a2);
  uint64_t v13 = sub_24C8E7B04(&v19);
  if (v18)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v19);
  }
  else
  {
    uint64_t v14 = v13;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v19);
    xpc_array_append_value(xarray, v14);
    swift_unknownObjectRelease();
  }
  return sub_24C8E5788(v4);
}

uint64_t sub_24C8E5324()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)v0[1];
  size_t count = xpc_array_get_count(v2);
  *(void *)&long long v13 = 0x207865646E49;
  *((void *)&v13 + 1) = 0xE600000000000000;
  size_t v17 = count;
  sub_24C8F8180();
  sub_24C8F7CF0();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)v0[2];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = sub_24C8F2368(0, v4[2] + 1, 1, v4);
  }
  unint64_t v6 = v4[2];
  unint64_t v5 = v4[3];
  if (v6 >= v5 >> 1) {
    uint64_t v4 = sub_24C8F2368((void *)(v5 > 1), v6 + 1, 1, v4);
  }
  char v15 = &type metadata for XPCCodingKey;
  unint64_t v16 = sub_24C8E43A0();
  uint64_t v7 = swift_allocObject();
  *(void *)&long long v13 = v7;
  *(void *)(v7 + 16) = 0x207865646E49;
  *(void *)(v7 + 24) = 0xE600000000000000;
  *(void *)(v7 + 32) = count;
  *(unsigned char *)(v7 + 40) = 0;
  v4[2] = v6 + 1;
  sub_24C8E8100(&v13, (uint64_t)&v4[5 * v6 + 4]);
  v1[2] = (uint64_t)v4;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_array_append_value(v2, v8);
  uint64_t v9 = *v1;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  *(void *)&long long v13 = sub_24C8E49D8(v9, (uint64_t)v4, (uint64_t)v8);
  *((void *)&v13 + 1) = v10;
  uint64_t v14 = v11;
  type metadata accessor for _XPCKeyedEncodingContainer();
  swift_retain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_24C8F8160();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return sub_24C8E5788((uint64_t)v1);
}

uint64_t sub_24C8E556C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void *)v1[1];
  size_t count = xpc_array_get_count(v4);
  *(void *)&long long v15 = 0x207865646E49;
  *((void *)&v15 + 1) = 0xE600000000000000;
  size_t v18 = count;
  sub_24C8F8180();
  sub_24C8F7CF0();
  swift_bridgeObjectRelease();
  unint64_t v6 = (void *)v1[2];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v6 = sub_24C8F2368(0, v6[2] + 1, 1, v6);
  }
  unint64_t v8 = v6[2];
  unint64_t v7 = v6[3];
  if (v8 >= v7 >> 1) {
    unint64_t v6 = sub_24C8F2368((void *)(v7 > 1), v8 + 1, 1, v6);
  }
  unint64_t v16 = &type metadata for XPCCodingKey;
  unint64_t v17 = sub_24C8E43A0();
  uint64_t v9 = swift_allocObject();
  *(void *)&long long v15 = v9;
  *(void *)(v9 + 16) = 0x207865646E49;
  *(void *)(v9 + 24) = 0xE600000000000000;
  *(void *)(v9 + 32) = count;
  *(unsigned char *)(v9 + 40) = 0;
  v6[2] = v8 + 1;
  sub_24C8E8100(&v15, (uint64_t)&v6[5 * v8 + 4]);
  v2[2] = (uint64_t)v6;
  xpc_object_t v10 = xpc_array_create(0, 0);
  xpc_array_append_value(v4, v10);
  uint64_t v11 = *v2;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v12 = swift_unknownObjectRetain();
  uint64_t v13 = MEMORY[0x2533006D0](v12);
  if (v13 == sub_24C8F7B50())
  {
    a1[3] = &type metadata for _XPCUnkeyedEncodingContainer;
    a1[4] = sub_24C8E7DC4();
    swift_unknownObjectRelease();
    *a1 = v11;
    a1[1] = v10;
    a1[2] = v6;
    return sub_24C8E5788((uint64_t)v2);
  }
  else
  {
    uint64_t result = sub_24C8F8010();
    __break(1u);
  }
  return result;
}

uint64_t sub_24C8E5788(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (!v2[2])
  {
    __break(1u);
LABEL_6:
    uint64_t result = (uint64_t)sub_24C8F25A0(v2);
    uint64_t v2 = (void *)result;
    uint64_t v4 = *(void *)(result + 16);
    if (v4) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v1 = a1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v4 = v2[2];
  if (v4)
  {
LABEL_4:
    uint64_t v5 = v4 - 1;
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v2[5 * v4 - 1]);
    v2[2] = v5;
    *(void *)(v1 + 16) = v2;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_24C8E5808@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void **)(v1 + 8);
  swift_retain();
  xpc_array_get_count(v3);
  uint64_t v4 = type metadata accessor for _XPCSuperUnkeyedEncoder();
  uint64_t v5 = (void *)swift_allocObject();
  uint64_t v6 = swift_unknownObjectRetain();
  uint64_t v7 = MEMORY[0x2533006D0](v6);
  uint64_t result = sub_24C8F7B50();
  if (v7 == result)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    uint64_t v5[2] = MEMORY[0x263F8EE78];
    v5[3] = sub_24C8E4678(v9);
    v5[4] = 0;
    swift_release();
    swift_unknownObjectRelease();
    a1[3] = v4;
    uint64_t result = sub_24C8E8118((unint64_t *)&unk_2697F9620, (void (*)(void))type metadata accessor for _XPCSuperUnkeyedEncoder);
    a1[4] = result;
    *a1 = v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

size_t sub_24C8E58E8()
{
  return xpc_array_get_count(*(xpc_object_t *)(v0 + 8));
}

uint64_t sub_24C8E58F0()
{
  uint64_t v1 = *(void **)(v0 + 8);
  xpc_object_t v2 = xpc_null_create();
  xpc_array_append_value(v1, v2);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E593C(char a1)
{
  xpc_object_t v2 = *(void **)(v1 + 8);
  xpc_object_t v3 = xpc_BOOL_create(a1 & 1);
  xpc_array_append_value(v2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E598C()
{
  uint64_t v1 = *(void **)(v0 + 8);
  uint64_t v2 = sub_24C8F7CC0();
  xpc_object_t v3 = xpc_string_create((const char *)(v2 + 32));
  swift_release();
  xpc_array_append_value(v1, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E59EC(double a1)
{
  uint64_t v2 = *(void **)(v1 + 8);
  xpc_object_t v3 = xpc_double_create(a1);
  xpc_array_append_value(v2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E5A38(float a1)
{
  uint64_t v2 = *(void **)(v1 + 8);
  xpc_object_t v3 = xpc_double_create(a1);
  xpc_array_append_value(v2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E5A88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8E5CD8(a1, a2, a3, MEMORY[0x263EF8B18]);
}

uint64_t sub_24C8E5AB4(char a1)
{
  uint64_t v2 = *(void **)(v1 + 8);
  xpc_object_t v3 = xpc_int64_create(a1);
  xpc_array_append_value(v2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E5B04(__int16 a1)
{
  uint64_t v2 = *(void **)(v1 + 8);
  xpc_object_t v3 = xpc_int64_create(a1);
  xpc_array_append_value(v2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E5B54(int a1)
{
  uint64_t v2 = *(void **)(v1 + 8);
  xpc_object_t v3 = xpc_int64_create(a1);
  xpc_array_append_value(v2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E5BA4()
{
  return sub_24C8F8350();
}

uint64_t sub_24C8E5BBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8E5CD8(a1, a2, a3, MEMORY[0x263EF8B20]);
}

uint64_t sub_24C8E5BE8(unsigned __int8 a1)
{
  uint64_t v2 = *(void **)(v1 + 8);
  xpc_object_t v3 = xpc_uint64_create(a1);
  xpc_array_append_value(v2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E5C38(unsigned __int16 a1)
{
  uint64_t v2 = *(void **)(v1 + 8);
  xpc_object_t v3 = xpc_uint64_create(a1);
  xpc_array_append_value(v2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E5C88(uint64_t value)
{
  uint64_t v2 = *(void **)(v1 + 8);
  xpc_object_t v3 = xpc_uint64_create(value);
  xpc_array_append_value(v2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E5CD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v5 = *(void **)(v4 + 8);
  uint64_t v6 = (void *)a4();
  xpc_array_append_value(v5, v6);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E5D28()
{
  return sub_24C8F8360();
}

uint64_t sub_24C8E5D40(uint64_t a1, ValueMetadata *a2, unint64_t a3)
{
  return sub_24C8E513C(a1, a2, a3);
}

uint64_t sub_24C8E5D58()
{
  return sub_24C8F8230();
}

uint64_t sub_24C8E5D84()
{
  return sub_24C8F8260();
}

uint64_t sub_24C8E5DB0()
{
  return sub_24C8F8250();
}

uint64_t sub_24C8E5DDC()
{
  return sub_24C8F8270();
}

uint64_t sub_24C8E5E08()
{
  return sub_24C8F8280();
}

uint64_t sub_24C8E5E34()
{
  return sub_24C8F8290();
}

uint64_t sub_24C8E5E60()
{
  return sub_24C8F82B0();
}

uint64_t sub_24C8E5E8C()
{
  return sub_24C8F82C0();
}

uint64_t sub_24C8E5EB8()
{
  return sub_24C8F82D0();
}

uint64_t sub_24C8E5EE4()
{
  return sub_24C8F82E0();
}

uint64_t sub_24C8E5F10()
{
  return sub_24C8F8300();
}

uint64_t sub_24C8E5F3C()
{
  return sub_24C8F82A0();
}

uint64_t sub_24C8E5F68()
{
  return sub_24C8F82F0();
}

uint64_t sub_24C8E5F94()
{
  return sub_24C8F8310();
}

uint64_t sub_24C8E5FC0()
{
  return sub_24C8F8320();
}

uint64_t sub_24C8E5FEC()
{
  return sub_24C8F8330();
}

uint64_t sub_24C8E6018()
{
  return sub_24C8F8340();
}

uint64_t sub_24C8E6044()
{
  return sub_24C8F8240();
}

uint64_t sub_24C8E6084(void *a1, void *a2, uint64_t a3, void *a4)
{
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_24C8F8600();
  uint64_t v6 = sub_24C8F7CC0();
  swift_bridgeObjectRelease();
  xpc_dictionary_set_value(a4, (const char *)(v6 + 32), a1);

  return swift_release();
}

uint64_t sub_24C8E6110(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void **)(v2 + 8);
  xpc_object_t v6 = xpc_null_create();
  long long v12 = *(_OWORD *)(a2 + 16);
  uint64_t v10 = v12;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(boxed_opaque_existential_1, a1);
  sub_24C8E6084(v6, v11, v8, v5);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

uint64_t sub_24C8E61C8(char a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v6 = *(void **)(v3 + 8);
  xpc_object_t v7 = xpc_BOOL_create(a1 & 1);
  long long v13 = *(_OWORD *)(a3 + 16);
  uint64_t v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(boxed_opaque_existential_1, a2);
  sub_24C8E6084(v7, v12, v9, v6);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_24C8E6284(char a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v6 = *(void **)(v3 + 8);
  xpc_object_t v7 = xpc_int64_create(a1);
  long long v13 = *(_OWORD *)(a3 + 16);
  uint64_t v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(boxed_opaque_existential_1, a2);
  sub_24C8E6084(v7, v12, v9, v6);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_24C8E6340(__int16 a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v6 = *(void **)(v3 + 8);
  xpc_object_t v7 = xpc_int64_create(a1);
  long long v13 = *(_OWORD *)(a3 + 16);
  uint64_t v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(boxed_opaque_existential_1, a2);
  sub_24C8E6084(v7, v12, v9, v6);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_24C8E63FC(int a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v6 = *(void **)(v3 + 8);
  xpc_object_t v7 = xpc_int64_create(a1);
  long long v13 = *(_OWORD *)(a3 + 16);
  uint64_t v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(boxed_opaque_existential_1, a2);
  sub_24C8E6084(v7, v12, v9, v6);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_24C8E64B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  xpc_object_t v7 = *(void **)(v4 + 8);
  uint64_t v8 = (void *)a4();
  long long v14 = *(_OWORD *)(a3 + 16);
  uint64_t v12 = v14;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16))(boxed_opaque_existential_1, a2);
  sub_24C8E6084(v8, v13, v10, v7);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

uint64_t sub_24C8E6574(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v6 = *(void **)(v3 + 8);
  xpc_object_t v7 = xpc_uint64_create(a1);
  long long v13 = *(_OWORD *)(a3 + 16);
  uint64_t v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(boxed_opaque_existential_1, a2);
  sub_24C8E6084(v7, v12, v9, v6);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_24C8E6630(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v6 = *(void **)(v3 + 8);
  xpc_object_t v7 = xpc_uint64_create(a1);
  long long v13 = *(_OWORD *)(a3 + 16);
  uint64_t v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(boxed_opaque_existential_1, a2);
  sub_24C8E6084(v7, v12, v9, v6);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_24C8E66EC(uint64_t value, uint64_t a2, uint64_t a3)
{
  xpc_object_t v6 = *(void **)(v3 + 8);
  xpc_object_t v7 = xpc_uint64_create(value);
  long long v13 = *(_OWORD *)(a3 + 16);
  uint64_t v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(boxed_opaque_existential_1, a2);
  sub_24C8E6084(v7, v12, v9, v6);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_24C8E67A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  xpc_object_t v7 = *(void **)(v4 + 8);
  uint64_t v8 = sub_24C8F7CC0();
  xpc_object_t v9 = xpc_string_create((const char *)(v8 + 32));
  swift_release();
  long long v15 = *(_OWORD *)(a4 + 16);
  uint64_t v13 = v15;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v13 - 8) + 16))(boxed_opaque_existential_1, a3);
  sub_24C8E6084(v9, v14, v11, v7);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
}

uint64_t sub_24C8E6874(uint64_t a1, uint64_t a2, double a3)
{
  xpc_object_t v6 = *(void **)(v3 + 8);
  xpc_object_t v7 = xpc_double_create(a3);
  long long v13 = *(_OWORD *)(a2 + 16);
  uint64_t v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(boxed_opaque_existential_1, a1);
  sub_24C8E6084(v7, v12, v9, v6);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_24C8E692C(uint64_t a1, uint64_t a2, float a3)
{
  xpc_object_t v6 = *(void **)(v3 + 8);
  xpc_object_t v7 = xpc_double_create(a3);
  long long v13 = *(_OWORD *)(a2 + 16);
  uint64_t v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(boxed_opaque_existential_1, a1);
  sub_24C8E6084(v7, v12, v9, v6);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_24C8E69E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v38 = a1;
  uint64_t v41 = a4;
  uint64_t v37 = a3;
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  long long v13 = (char *)&v35 - v12;
  long long v14 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v36 = v15;
  unint64_t v16 = v14;
  ((void (*)(char *))v14)((char *)&v35 - v12);
  uint64_t v40 = v5;
  unint64_t v17 = (uint64_t *)(v5 + 16);
  size_t v18 = *(void **)(v5 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v5 + 16) = v18;
  uint64_t v45 = a5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    size_t v18 = sub_24C8F2368(0, v18[2] + 1, 1, v18);
    *unint64_t v17 = (uint64_t)v18;
  }
  unint64_t v21 = v18[2];
  unint64_t v20 = v18[3];
  size_t v22 = v16;
  if (v21 >= v20 >> 1)
  {
    uint64_t v34 = sub_24C8F2368((void *)(v20 > 1), v21 + 1, 1, v18);
    size_t v22 = v16;
    *unint64_t v17 = (uint64_t)v34;
  }
  BOOL v35 = v22;
  v22((uint64_t *)v11, (uint64_t)v13, v7);
  uint64_t v23 = *(void *)(v37 + 24);
  sub_24C8F25B4(v21, (uint64_t)v11, v17, v7, v23);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  uint64_t v25 = v40;
  uint64_t v24 = v41;
  uint64_t v26 = *(void **)(v40 + 8);
  uint64_t v43 = v41;
  uint64_t v44 = v45;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v42);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(boxed_opaque_existential_1, v38, v24);
  uint64_t v28 = v39;
  uint64_t v29 = sub_24C8E7B04(v42);
  if (!v28)
  {
    uint64_t v30 = v29;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
    uint64_t v43 = v7;
    uint64_t v44 = v23;
    uint64_t v31 = __swift_allocate_boxed_opaque_existential_1(v42);
    v35(v31, v36, v7);
    sub_24C8E6084(v30, v42, v32, v26);
    swift_unknownObjectRelease();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  return sub_24C8E5788(v25);
}

uint64_t sub_24C8E6C80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v38 = a4;
  uint64_t v39 = a5;
  uint64_t v37 = a6;
  uint64_t v9 = *(void *)(a3 + 16);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v34 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  long long v14 = (char *)&v33 - v13;
  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  unint64_t v16 = (void *)v6[1];
  uint64_t v17 = *(void *)(a3 + 24);
  v40[3] = v9;
  v40[4] = v17;
  uint64_t v35 = v17;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v40);
  long long v19 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v10 + 16);
  v19(boxed_opaque_existential_1, a2, v9);
  uint64_t v36 = (uint64_t)v15;
  sub_24C8E6084(v15, v40, v20, v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  v19((uint64_t *)v14, a2, v9);
  size_t v22 = v6 + 2;
  unint64_t v21 = (void *)v6[2];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v6[2] = (uint64_t)v21;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v21 = sub_24C8F2368(0, v21[2] + 1, 1, v21);
    *size_t v22 = (uint64_t)v21;
  }
  unint64_t v25 = v21[2];
  unint64_t v24 = v21[3];
  if (v25 >= v24 >> 1) {
    *size_t v22 = (uint64_t)sub_24C8F2368((void *)(v24 > 1), v25 + 1, 1, v21);
  }
  uint64_t v26 = (uint64_t)v34;
  v19((uint64_t *)v34, (uint64_t)v14, v9);
  sub_24C8F25B4(v25, v26, v22, v9, v35);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
  uint64_t v27 = v6[2];
  uint64_t v28 = *v6;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v29 = v36;
  swift_unknownObjectRetain();
  v40[0] = sub_24C8E49D8(v28, v27, v29);
  v40[1] = v30;
  v40[2] = v31;
  type metadata accessor for _XPCKeyedEncodingContainer();
  swift_getWitnessTable();
  sub_24C8F8160();
  sub_24C8E5788((uint64_t)v6);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8E6F4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v34 = a3;
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  uint64_t v32 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v31 - v10;
  xpc_object_t v12 = xpc_array_create(0, 0);
  uint64_t v13 = (void *)v3[1];
  uint64_t v14 = *(void *)(a2 + 24);
  v36[3] = v6;
  v36[4] = v14;
  uint64_t v33 = v14;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v36);
  unint64_t v16 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v7 + 16);
  v16(boxed_opaque_existential_1, a1, v6);
  sub_24C8E6084(v12, v36, v17, v13);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  v16((uint64_t *)v11, a1, v6);
  uint64_t v35 = v3;
  size_t v18 = v3 + 2;
  long long v19 = (void *)v3[2];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v3[2] = (uint64_t)v19;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    long long v19 = sub_24C8F2368(0, v19[2] + 1, 1, v19);
    *size_t v18 = (uint64_t)v19;
  }
  unint64_t v22 = v19[2];
  unint64_t v21 = v19[3];
  if (v22 >= v21 >> 1) {
    *size_t v18 = (uint64_t)sub_24C8F2368((void *)(v21 > 1), v22 + 1, 1, v19);
  }
  uint64_t v23 = (uint64_t)v32;
  v16((uint64_t *)v32, (uint64_t)v11, v6);
  sub_24C8F25B4(v22, v23, v18, v6, v33);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  uint64_t v24 = (uint64_t)v35;
  uint64_t v25 = v35[2];
  uint64_t v26 = *v35;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v27 = swift_unknownObjectRetain();
  uint64_t v28 = MEMORY[0x2533006D0](v27);
  if (v28 == sub_24C8F7B50())
  {
    uint64_t v29 = v34;
    v34[3] = &type metadata for _XPCUnkeyedEncodingContainer;
    v29[4] = sub_24C8E7DC4();
    *uint64_t v29 = v26;
    v29[1] = v12;
    v29[2] = v25;
    sub_24C8E5788(v24);
    return swift_unknownObjectRelease();
  }
  else
  {
    uint64_t result = sub_24C8F8010();
    __break(1u);
  }
  return result;
}

uint64_t sub_24C8E7224@<X0>(void *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for _XPCSuperKeyedEncoder();
  uint64_t v3 = (void *)swift_allocObject();
  swift_retain();
  uint64_t v4 = swift_unknownObjectRetain();
  uint64_t v5 = MEMORY[0x2533006D0](v4);
  uint64_t result = sub_24C8F7BA0();
  if (v5 == result)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    v3[2] = MEMORY[0x263F8EE78];
    unint64_t v8 = sub_24C8E4678(v7);
    swift_release();
    swift_unknownObjectRelease();
    v3[3] = v8;
    v3[4] = 0;
    a1[3] = v2;
    uint64_t result = sub_24C8E8118((unint64_t *)&unk_2697F9630, (void (*)(void))type metadata accessor for _XPCSuperKeyedEncoder);
    a1[4] = result;
    *a1 = v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24C8E7300@<X0>(void *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for _XPCSuperKeyedEncoder();
  uint64_t v3 = (void *)swift_allocObject();
  swift_retain();
  uint64_t v4 = swift_unknownObjectRetain();
  uint64_t v5 = MEMORY[0x2533006D0](v4);
  uint64_t result = sub_24C8F7BA0();
  if (v5 == result)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    v3[2] = MEMORY[0x263F8EE78];
    unint64_t v8 = sub_24C8E4678(v7);
    swift_unknownObjectRelease();
    v3[3] = v8;
    v3[4] = 0;
    swift_release();
    a1[3] = v2;
    uint64_t result = sub_24C8E8118((unint64_t *)&unk_2697F9630, (void (*)(void))type metadata accessor for _XPCSuperKeyedEncoder);
    a1[4] = result;
    *a1 = v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24C8E73DC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24C8E73E4(uint64_t a1, uint64_t a2)
{
  return sub_24C8E6110(a1, a2);
}

uint64_t sub_24C8E73FC(char a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8E61C8(a1, a2, a3);
}

uint64_t sub_24C8E7414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24C8E67A8(a1, a2, a3, a4);
}

uint64_t sub_24C8E742C(uint64_t a1, uint64_t a2, double a3)
{
  return sub_24C8E6874(a1, a2, a3);
}

uint64_t sub_24C8E7444(uint64_t a1, uint64_t a2, float a3)
{
  return sub_24C8E692C(a1, a2, a3);
}

uint64_t sub_24C8E745C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8E64B8(a1, a2, a3, MEMORY[0x263EF8B18]);
}

uint64_t sub_24C8E7488(char a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8E6284(a1, a2, a3);
}

uint64_t sub_24C8E74A0(__int16 a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8E6340(a1, a2, a3);
}

uint64_t sub_24C8E74B8(int a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8E63FC(a1, a2, a3);
}

uint64_t sub_24C8E74D0()
{
  return sub_24C8F8520();
}

uint64_t sub_24C8E74E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8E64B8(a1, a2, a3, MEMORY[0x263EF8B20]);
}

uint64_t sub_24C8E7514(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8E6574(a1, a2, a3);
}

uint64_t sub_24C8E752C(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8E6630(a1, a2, a3);
}

uint64_t sub_24C8E7544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8E66EC(a1, a2, a3);
}

uint64_t sub_24C8E755C()
{
  return sub_24C8F8530();
}

uint64_t sub_24C8E7574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_24C8E69E8(a1, a2, a5, a3, a4);
}

uint64_t sub_24C8E759C()
{
  return sub_24C8F8510();
}

uint64_t sub_24C8E75C8()
{
  return sub_24C8F8480();
}

uint64_t sub_24C8E75E0()
{
  return sub_24C8F8470();
}

uint64_t sub_24C8E75F8()
{
  return sub_24C8F8490();
}

uint64_t sub_24C8E7614(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24C8E7808(a1, a2, a3, a4, MEMORY[0x263F8E3C0]);
}

uint64_t sub_24C8E7640()
{
  return sub_24C8F84A0();
}

uint64_t sub_24C8E765C(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24C8E7760(a1, a2, a3, a4, MEMORY[0x263F8E3D8]);
}

uint64_t sub_24C8E7688(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24C8E77B4(a1, a2, a3, a4, MEMORY[0x263F8E3E0]);
}

uint64_t sub_24C8E76B4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24C8E7808(a1, a2, a3, a4, MEMORY[0x263F8E3E8]);
}

uint64_t sub_24C8E76E0()
{
  return sub_24C8F84D0();
}

uint64_t sub_24C8E76FC()
{
  return sub_24C8F84E0();
}

uint64_t sub_24C8E7718()
{
  return sub_24C8F84B0();
}

uint64_t sub_24C8E7734(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24C8E7760(a1, a2, a3, a4, MEMORY[0x263F8E3F8]);
}

uint64_t sub_24C8E7760(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5(a1 & 0x1FF);
}

uint64_t sub_24C8E7788(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24C8E77B4(a1, a2, a3, a4, MEMORY[0x263F8E408]);
}

uint64_t sub_24C8E77B4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5(a1 & 0x1FFFF);
}

uint64_t sub_24C8E77DC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24C8E7808(a1, a2, a3, a4, MEMORY[0x263F8E410]);
}

uint64_t sub_24C8E7808(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  return a5(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_24C8E7838()
{
  return sub_24C8F84F0();
}

uint64_t sub_24C8E7854()
{
  return sub_24C8F8500();
}

uint64_t sub_24C8E7870()
{
  return sub_24C8F84C0();
}

uint64_t sub_24C8E789C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return sub_24C8E6C80(a1, a2, a5, a3, a4, a6);
}

uint64_t type metadata accessor for _XPCSuperKeyedEncoder()
{
  return self;
}

uint64_t type metadata accessor for _XPCSuperUnkeyedEncoder()
{
  return self;
}

unint64_t sub_24C8E7908(uint64_t a1)
{
  sub_24C8F7FF0();
  uint64_t v2 = sub_24C8F7C40();

  return sub_24C8E796C(a1, v2);
}

unint64_t sub_24C8E796C(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a1;
  uint64_t v4 = sub_24C8F7FF0();
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v20 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v11 = v5 + 16;
    xpc_object_t v12 = v13;
    uint64_t v14 = *(void *)(v11 + 56);
    xpc_object_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      uint64_t v16 = v11;
      v12(v7, *(void *)(v22 + 48) + v14 * v9, v4);
      char v17 = sub_24C8F7C70();
      (*v15)(v7, v4);
      if (v17) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
      uint64_t v11 = v16;
    }
    while (((*(void *)(v20 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

void *sub_24C8E7B04(void *a1)
{
  v29[5] = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_24C8F7AE0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&uuid - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if (swift_getDynamicType() == v3)
  {
    sub_24C8C0A98((uint64_t)a1, (uint64_t)v29);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9580);
    swift_dynamicCast();
    uint64_t uuid = sub_24C8F7AD0();
    char v21 = v11;
    char v22 = v12;
    char v23 = v13;
    char v24 = v14;
    char v25 = v15;
    char v26 = v16;
    char v27 = v17;
    char v28 = v18;
    uint64_t v10 = xpc_uuid_create((const unsigned __int8 *)&uuid);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    uint64_t v7 = type metadata accessor for _XPCEncoder();
    uint64_t v8 = (void *)swift_allocObject();
    uint64_t v9 = MEMORY[0x263F8EE78];
    v8[2] = MEMORY[0x263F8EE78];
    v8[3] = sub_24C8E4678(v9);
    long long v8[4] = 0;
    uint64_t v10 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    void v29[3] = v7;
    v29[4] = sub_24C8E8118(&qword_2697F9570, (void (*)(void))type metadata accessor for _XPCEncoder);
    v29[0] = v8;
    swift_retain();
    sub_24C8F7C30();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    if (!v1)
    {
      uint64_t v10 = (void *)v8[4];
      if (v10) {
        swift_unknownObjectRetain();
      }
      else {
        uint64_t v10 = xpc_null_create();
      }
    }
    swift_release();
  }
  return v10;
}

unint64_t sub_24C8E7DC4()
{
  unint64_t result = qword_2697F9588;
  if (!qword_2697F9588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9588);
  }
  return result;
}

uint64_t type metadata accessor for _XPCKeyedEncodingContainer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24C8E7E30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9590);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C8E7E98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t _s18XPCCoderDependency28_XPCUnkeyedEncodingContainerVwxx_0()
{
  swift_release();
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s18XPCCoderDependency28_XPCUnkeyedEncodingContainerVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s18XPCCoderDependency28_XPCUnkeyedEncodingContainerVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s18XPCCoderDependency28_XPCUnkeyedEncodingContainerVwta_0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_unknownObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s18XPCCoderDependency28_XPCUnkeyedEncodingContainerVwet_0(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24C8E8070(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _XPCUnkeyedEncodingContainer()
{
  return &type metadata for _XPCUnkeyedEncodingContainer;
}

uint64_t sub_24C8E80C0(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24);
}

uint64_t sub_24C8E80C8()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 41, 7);
}

uint64_t sub_24C8E8100(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_24C8E8118(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24C8E8194()
{
  return swift_allocObject();
}

uint64_t sub_24C8E81A4()
{
  return v0;
}

uint64_t sub_24C8E81AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v24 = a4;
  uint64_t v8 = sub_24C8F7E50();
  uint64_t v23 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v22 - v9;
  type metadata accessor for _XPCDecoder();
  char v11 = (void *)swift_allocObject();
  swift_unknownObjectRetain();
  uint64_t v12 = MEMORY[0x263F8EE78];
  unint64_t v13 = sub_24C8E4678(MEMORY[0x263F8EE78]);
  uint64_t v11[3] = a2;
  v11[4] = v13;
  uint64_t v14 = a1;
  v11[2] = v12;
  sub_24C8E8B78(a3, (uint64_t)v10);
  if (v4) {
    return swift_release();
  }
  uint64_t v15 = v23;
  uint64_t v16 = v24;
  uint64_t v17 = *(void *)(a3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v8);
    uint64_t v18 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v20 = v14;
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCC0], v18);
    swift_willThrow();
    return swift_release();
  }
  swift_release();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v16, v10, a3);
}

uint64_t type metadata accessor for _XPCDecoder()
{
  return self;
}

uint64_t sub_24C8E8464()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_24C8E8474()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = MEMORY[0x2533006D0](v1);
  if (v2 == sub_24C8F7B30())
  {
    uint64_t v7 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v9 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v9 = sub_24C8F80E0();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v7 - 8) + 104))(v9, *MEMORY[0x263F8DCC0], v7);
    return swift_willThrow();
  }
  uint64_t v3 = MEMORY[0x2533006D0](v1);
  if (v3 != sub_24C8F7BA0())
  {
    swift_beginAccess();
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9670);
    sub_24C8F7F50();
    swift_allocError();
    uint64_t v6 = v5;
    swift_bridgeObjectRetain();
    sub_24C8E86AC(v4, v1, v6);
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  swift_retain();
  swift_unknownObjectRetain();
  sub_24C8E8834(v0, v1);
  type metadata accessor for _XPCKeyedDecodingContainer();
  swift_getWitnessTable();
  return sub_24C8F80F0();
}

uint64_t sub_24C8E86AC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, void *a3@<X8>)
{
  sub_24C8F7F00();
  swift_bridgeObjectRelease();
  sub_24C8F8640();
  sub_24C8F7CF0();
  swift_bridgeObjectRelease();
  sub_24C8F7CF0();
  sub_24C8F264C(a2);
  sub_24C8F7CF0();
  swift_bridgeObjectRelease();
  sub_24C8F7CF0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
  *a3 = a1;
  swift_bridgeObjectRetain();
  sub_24C8F7F40();
  uint64_t v6 = *MEMORY[0x263F8DCB0];
  uint64_t v7 = sub_24C8F7F50();
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104);

  return v8(a3, v6, v7);
}

uint64_t sub_24C8E8834(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x2533006D0](a2);
  if (v3 == sub_24C8F7BA0())
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    return a1;
  }
  else
  {
    uint64_t result = sub_24C8F8010();
    __break(1u);
  }
  return result;
}

uint64_t sub_24C8E88F8@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = MEMORY[0x2533006D0](v3);
  if (v4 == sub_24C8F7B30())
  {
    uint64_t v9 = sub_24C8F7F50();
    swift_allocError();
    char v11 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *char v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9668);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v9 - 8) + 104))(v11, *MEMORY[0x263F8DCC0], v9);
    return swift_willThrow();
  }
  uint64_t v5 = MEMORY[0x2533006D0](v3);
  if (v5 != sub_24C8F7B50())
  {
    swift_beginAccess();
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9658);
    sub_24C8F7F50();
    swift_allocError();
    uint64_t v8 = v7;
    swift_bridgeObjectRetain();
    sub_24C8E86AC(v6, v3, v8);
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  swift_retain();
  uint64_t v13 = swift_unknownObjectRetain();
  uint64_t v14 = MEMORY[0x2533006D0](v13);
  if (v14 == sub_24C8F7B50())
  {
    swift_beginAccess();
    uint64_t v15 = *(void *)(v1 + 16);
    a1[3] = &type metadata for _XPCUnkeyedDecodingContainer;
    a1[4] = sub_24C8F3E7C();
    uint64_t v16 = (void *)swift_allocObject();
    *a1 = v16;
    void v16[2] = v1;
    v16[3] = v3;
    v16[4] = v15;
    v16[5] = 0;
    return swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t result = sub_24C8F8010();
    __break(1u);
  }
  return result;
}

uint64_t sub_24C8E8B78@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  type metadata accessor for _XPCDecoder();
  sub_24C8F3F30(qword_2697F9678);
  swift_retain();
  uint64_t result = sub_24C8F7DD0();
  if (!v2) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, 0, 1, a1);
  }
  return result;
}

uint64_t type metadata accessor for SimpleXPCDecoder()
{
  return self;
}

uint64_t sub_24C8E8C7C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  v31[0] = a4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9650);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24C8F7AE0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)v31 - v19;
  if (v18 != a2)
  {
    swift_beginAccess();
    uint64_t v21 = *(void *)(v5 + 16);
    type metadata accessor for _XPCDecoder();
    uint64_t v22 = (void *)swift_allocObject();
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v23 = sub_24C8E4678(MEMORY[0x263F8EE78]);
    v22[3] = a1;
    v22[4] = v23;
    void v22[2] = v21;
    sub_24C8E8B78(a3, a5);
    return swift_release();
  }
  uint64_t v25 = v31[5];
  uint64_t result = sub_24C8E8F38(a1, (uint64_t)v12);
  if (!v25)
  {
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, a2) == 1)
    {
      sub_24C8F3E1C((uint64_t)v12);
      char v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56);
    }
    else
    {
      char v27 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
      v27(v20, v12, a2);
      v27(v17, v20, a2);
      int v28 = swift_dynamicCast();
      char v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56);
      if (v28)
      {
        uint64_t v29 = a5;
        uint64_t v30 = 0;
        return v26(v29, v30, 1, a3);
      }
    }
    uint64_t v29 = a5;
    uint64_t v30 = 1;
    return v26(v29, v30, 1, a3);
  }
  return result;
}

uint64_t sub_24C8E8F38@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = MEMORY[0x2533006D0]();
  if (v4 == sub_24C8F7B30()) {
    goto LABEL_4;
  }
  uint64_t v5 = MEMORY[0x2533006D0](a1);
  if (v5 != sub_24C8F7B40())
  {
    swift_beginAccess();
    uint64_t v6 = sub_24C8F7AE0();
    sub_24C8F7F50();
    swift_allocError();
    uint64_t v8 = v7;
    swift_bridgeObjectRetain();
    sub_24C8E86AC(v6, (uint64_t)a1, v8);
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  bytes = xpc_uuid_get_bytes(a1);
  if (!bytes)
  {
LABEL_4:
    uint64_t v10 = sub_24C8F7AE0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a2, 1, 1, v10);
  }
  else
  {
    id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_initWithUUIDBytes_, bytes);
    sub_24C8F7AC0();

    uint64_t v13 = sub_24C8F7AE0();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(a2, 0, 1, v13);
  }
}

uint64_t sub_24C8E90D0()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_24C8E911C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24C8E9128()
{
  return sub_24C8E8474();
}

uint64_t sub_24C8E914C@<X0>(void *a1@<X8>)
{
  return sub_24C8E88F8(a1);
}

uint64_t sub_24C8E9170@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  a1[3] = type metadata accessor for _XPCDecoder();
  a1[4] = sub_24C8F3F30(&qword_2697F9648);
  *a1 = v3;
  return swift_retain();
}

uint64_t sub_24C8E91DC()
{
  uint64_t v1 = MEMORY[0x2533006D0](*(void *)(v0 + 24));
  uint64_t result = sub_24C8F7B30();
  if (v1 == result)
  {
    uint64_t v3 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v5 = MEMORY[0x263F8D4F8];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v5, *MEMORY[0x263F8DCC0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24C8E9320()
{
  uint64_t v1 = MEMORY[0x2533006D0](*(void *)(v0 + 24));
  uint64_t result = sub_24C8F7B30();
  if (v1 == result)
  {
    uint64_t v3 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v5 = MEMORY[0x263F8D6C8];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v5, *MEMORY[0x263F8DCC0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24C8E9464()
{
  uint64_t v1 = MEMORY[0x2533006D0](*(void *)(v0 + 24));
  uint64_t result = sub_24C8F7B30();
  if (v1 == result)
  {
    uint64_t v3 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v5 = MEMORY[0x263F8E498];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v5, *MEMORY[0x263F8DCC0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24C8E95A8()
{
  uint64_t v1 = MEMORY[0x2533006D0](*(void *)(v0 + 24));
  uint64_t result = sub_24C8F7B30();
  if (v1 == result)
  {
    uint64_t v3 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v5 = MEMORY[0x263F8E4F0];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v5, *MEMORY[0x263F8DCC0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24C8E96EC()
{
  uint64_t v1 = MEMORY[0x2533006D0](*(void *)(v0 + 24));
  uint64_t result = sub_24C8F7B30();
  if (v1 == result)
  {
    uint64_t v3 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v5 = MEMORY[0x263F8E548];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v5, *MEMORY[0x263F8DCC0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24C8E9830()
{
  uint64_t v1 = MEMORY[0x2533006D0](*(void *)(v0 + 24));
  uint64_t result = sub_24C8F7B30();
  if (v1 == result)
  {
    uint64_t v3 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v5 = MEMORY[0x263F8E5C0];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v5, *MEMORY[0x263F8DCC0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24C8E9974()
{
  uint64_t v1 = MEMORY[0x2533006D0](*(void *)(v0 + 24));
  uint64_t result = sub_24C8F7B30();
  if (v1 == result)
  {
    uint64_t v3 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v5 = MEMORY[0x263F8D9D0];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v5, *MEMORY[0x263F8DCC0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24C8E9AB8()
{
  uint64_t v1 = MEMORY[0x2533006D0](*(void *)(v0 + 24));
  uint64_t result = sub_24C8F7B30();
  if (v1 == result)
  {
    uint64_t v3 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v5 = MEMORY[0x263F8E778];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v5, *MEMORY[0x263F8DCC0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24C8E9BFC()
{
  uint64_t v1 = MEMORY[0x2533006D0](*(void *)(v0 + 24));
  uint64_t result = sub_24C8F7B30();
  if (v1 == result)
  {
    uint64_t v3 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v5 = MEMORY[0x263F8E888];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v5, *MEMORY[0x263F8DCC0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24C8E9D40()
{
  uint64_t v1 = MEMORY[0x2533006D0](*(void *)(v0 + 24));
  uint64_t result = sub_24C8F7B30();
  if (v1 == result)
  {
    uint64_t v3 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v5 = MEMORY[0x263F8E8F8];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v5, *MEMORY[0x263F8DCC0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24C8E9E84()
{
  uint64_t v1 = MEMORY[0x2533006D0](*(void *)(v0 + 24));
  uint64_t result = sub_24C8F7B30();
  if (v1 == result)
  {
    uint64_t v3 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v5 = MEMORY[0x263F8E970];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v5, *MEMORY[0x263F8DCC0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24C8E9FC8()
{
  uint64_t v1 = MEMORY[0x2533006D0](*(void *)(v0 + 24));
  uint64_t result = sub_24C8F7B30();
  if (v1 == result)
  {
    uint64_t v3 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v5 = MEMORY[0x263F8D5C8];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v5, *MEMORY[0x263F8DCC0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24C8EA10C()
{
  uint64_t v1 = MEMORY[0x2533006D0](*(void *)(v0 + 24));
  uint64_t result = sub_24C8F7B30();
  if (v1 == result)
  {
    uint64_t v3 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v5 = MEMORY[0x263F8D538];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v5, *MEMORY[0x263F8DCC0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24C8EA250()
{
  uint64_t v1 = MEMORY[0x2533006D0](*(void *)(v0 + 24));
  uint64_t result = sub_24C8F7B30();
  if (v1 == result)
  {
    uint64_t v3 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v5 = MEMORY[0x263F8D310];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v5, *MEMORY[0x263F8DCC0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24C8EA394(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x2533006D0](*(void *)(v1 + 24));
  uint64_t result = sub_24C8F7B30();
  if (v3 == result)
  {
    uint64_t v5 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v7 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v7 = a1;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F8640();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    sub_24C8F7CF0();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v5 - 8) + 104))(v7, *MEMORY[0x263F8DCC0], v5);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_24C8EA524()
{
  uint64_t result = sub_24C8EA250();
  if (!v1)
  {
    uint64_t v3 = *(void **)(v0 + 24);
    uint64_t v4 = MEMORY[0x2533006D0](v3);
    uint64_t result = sub_24C8F7B30();
    if (v4 == result)
    {
      __break(1u);
    }
    else
    {
      uint64_t v5 = MEMORY[0x2533006D0](v3);
      if (v5 != sub_24C8F7B80())
      {
        swift_beginAccess();
        sub_24C8F7F50();
        swift_allocError();
        uint64_t v7 = v6;
        swift_bridgeObjectRetain();
        sub_24C8E86AC(MEMORY[0x263F8D310], (uint64_t)v3, v7);
        swift_bridgeObjectRelease();
        return swift_willThrow();
      }
      uint64_t result = (uint64_t)xpc_string_get_string_ptr(v3);
      if (result) {
        return sub_24C8F7D00();
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_24C8EA618@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v10 = sub_24C8F7E50();
  MEMORY[0x270FA5388](v10 - 8);
  id v12 = (char *)&v15 - v11;
  uint64_t result = sub_24C8EA394(a1);
  if (!v5)
  {
    sub_24C8E8C7C(*(void **)(v4 + 24), a1, a2, a3, (uint64_t)v12);
    uint64_t v14 = *(void *)(a2 - 8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, a2);
    if (result == 1) {
      __break(1u);
    }
    else {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a4, v12, a2);
    }
  }
  return result;
}

uint64_t sub_24C8EA768()
{
  return swift_bridgeObjectRetain();
}

BOOL sub_24C8EA7AC()
{
  uint64_t v1 = MEMORY[0x2533006D0](*(void *)(*(void *)v0 + 24));
  return v1 == sub_24C8F7B30();
}

uint64_t sub_24C8EA7E4()
{
  return sub_24C8F3B5C() & 1;
}

uint64_t sub_24C8EA80C()
{
  return sub_24C8EA524();
}

void sub_24C8EA830()
{
}

void sub_24C8EA854()
{
}

uint64_t sub_24C8EA878()
{
  uint64_t v2 = *v0;
  uint64_t result = sub_24C8E9320();
  if (!v1)
  {
    uint64_t result = sub_24C8F2F20(*(void **)(v2 + 24), 7630409, 0xE300000000000000, MEMORY[0x263F8D6C8]);
    if (v4) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_24C8EA8C8(uint64_t a1, uint64_t a2)
{
  return sub_24C8EAA84(a1, a2, sub_24C8E9464, (uint64_t (*)(void))sub_24C8F27D8);
}

uint64_t sub_24C8EA908(uint64_t a1, uint64_t a2)
{
  return sub_24C8EAB0C(a1, a2, sub_24C8E95A8, (uint64_t (*)(void))sub_24C8F2A40);
}

uint64_t sub_24C8EA948(uint64_t a1, uint64_t a2)
{
  return sub_24C8EAB94(a1, a2, sub_24C8E96EC, (uint64_t (*)(void))sub_24C8F2CAC);
}

uint64_t sub_24C8EA988()
{
  uint64_t v2 = *v0;
  uint64_t result = sub_24C8E9830();
  if (!v1)
  {
    uint64_t result = sub_24C8F2F20(*(void **)(v2 + 24), 0x3436746E49, 0xE500000000000000, MEMORY[0x263F8E5C0]);
    if (v4) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_24C8EA9DC()
{
  return sub_24C8F8390();
}

uint64_t sub_24C8EA9F4()
{
  uint64_t v2 = *v0;
  uint64_t result = sub_24C8E9974();
  if (!v1)
  {
    uint64_t result = sub_24C8F3198(*(void **)(v2 + 24), 1953384789, 0xE400000000000000, MEMORY[0x263F8D9D0]);
    if (v4) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_24C8EAA44(uint64_t a1, uint64_t a2)
{
  return sub_24C8EAA84(a1, a2, sub_24C8E9AB8, (uint64_t (*)(void))sub_24C8F3410);
}

uint64_t sub_24C8EAA84(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t v7 = *v4;
  uint64_t result = a3();
  if (!v5)
  {
    uint64_t result = a4(*(void *)(v7 + 24));
    if ((result & 0x100) != 0) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_24C8EAACC(uint64_t a1, uint64_t a2)
{
  return sub_24C8EAB0C(a1, a2, sub_24C8E9BFC, (uint64_t (*)(void))sub_24C8F367C);
}

uint64_t sub_24C8EAB0C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t v7 = *v4;
  uint64_t result = a3();
  if (!v5)
  {
    uint64_t result = a4(*(void *)(v7 + 24));
    if ((result & 0x10000) != 0) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_24C8EAB54(uint64_t a1, uint64_t a2)
{
  return sub_24C8EAB94(a1, a2, sub_24C8E9D40, (uint64_t (*)(void))sub_24C8F38E8);
}

uint64_t sub_24C8EAB94(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t v7 = *v4;
  uint64_t result = a3();
  if (!v5)
  {
    uint64_t result = a4(*(void *)(v7 + 24));
    if ((result & 0x100000000) != 0) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_24C8EABDC()
{
  uint64_t v2 = *v0;
  uint64_t result = sub_24C8E9E84();
  if (!v1)
  {
    uint64_t result = sub_24C8F3198(*(void **)(v2 + 24), 0x3436746E4955, 0xE600000000000000, MEMORY[0x263F8E970]);
    if (v4) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_24C8EAC30()
{
  return sub_24C8F83A0();
}

uint64_t sub_24C8EAC48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_24C8EA618(a1, a2, a3, a4);
}

uint64_t sub_24C8EAC6C()
{
  uint64_t v1 = *(void **)(v0 + 8);
  int64_t v2 = *(void *)(v0 + 24);
  if (v2 >= (uint64_t)xpc_array_get_count(v1))
  {
    uint64_t v6 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v8 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9708);
    swift_beginAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24C8F9900;
    uint64_t v10 = *(void *)(v0 + 24);
    swift_bridgeObjectRetain();
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    *(void *)(inited + 56) = &type metadata for XPCCodingKey;
    *(void *)(inited + 64) = sub_24C8E43A0();
    uint64_t v11 = swift_allocObject();
    *(void *)(inited + 32) = v11;
    *(void *)(v11 + 16) = 0x207865646E49;
    *(void *)(v11 + 24) = 0xE600000000000000;
    *(void *)(v11 + 32) = v10;
    *(unsigned char *)(v11 + 40) = 0;
    sub_24C8F24A0((void *)inited);
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCC0], v6);
    swift_willThrow();
  }
  else
  {
    id v3 = xpc_array_get_value(v1, v2);
    uint64_t v4 = MEMORY[0x2533006D0]();
    swift_unknownObjectRelease();
    if (v4 == sub_24C8F7B30())
    {
      *(void *)(v0 + 24) = v2 + 1;
      char v5 = 1;
    }
    else
    {
      char v5 = 0;
    }
  }
  return v5 & 1;
}

void *sub_24C8EAEB4()
{
  uint64_t v1 = v0;
  int64_t v2 = (void *)v0[1];
  int64_t v3 = v0[3];
  if (v3 >= (uint64_t)xpc_array_get_count(v2))
  {
    uint64_t v17 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v19 = MEMORY[0x263F8D310];
    uint64_t v20 = *v0;
    swift_beginAccess();
    uint64_t v21 = *(void *)(v20 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24C8F9900;
    uint64_t v23 = v0[3];
    v37[1] = 0xE600000000000000;
    v33[0] = v23;
    swift_bridgeObjectRetain();
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    *(void *)(inited + 56) = &type metadata for XPCCodingKey;
    *(void *)(inited + 64) = sub_24C8E43A0();
    uint64_t v24 = swift_allocObject();
    *(void *)(inited + 32) = v24;
    *(void *)(v24 + 16) = 0x207865646E49;
    *(void *)(v24 + 24) = 0xE600000000000000;
    *(void *)(v24 + 32) = v23;
    *(unsigned char *)(v24 + 40) = 0;
    v37[0] = v21;
    uint64_t v14 = v37;
    sub_24C8F24A0((void *)inited);
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x263F8DCC0], v17);
    swift_willThrow();
  }
  else
  {
    uint64_t v4 = *v0;
    *(void *)&long long v34 = 0x207865646E49;
    *((void *)&v34 + 1) = 0xE600000000000000;
    v37[0] = v3;
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    char v5 = (void *)(v4 + 16);
    swift_beginAccess();
    uint64_t v6 = *(void **)(v4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v4 + 16) = v6;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v6 = sub_24C8F2368(0, v6[2] + 1, 1, v6);
      *char v5 = v6;
    }
    unint64_t v9 = v6[2];
    unint64_t v8 = v6[3];
    if (v9 >= v8 >> 1)
    {
      uint64_t v6 = sub_24C8F2368((void *)(v8 > 1), v9 + 1, 1, v6);
      *char v5 = v6;
    }
    uint64_t v35 = &type metadata for XPCCodingKey;
    unint64_t v32 = sub_24C8E43A0();
    unint64_t v36 = v32;
    uint64_t v10 = swift_allocObject();
    *(void *)&long long v34 = v10;
    *(void *)(v10 + 16) = 0x207865646E49;
    *(void *)(v10 + 24) = 0xE600000000000000;
    *(void *)(v10 + 32) = v3;
    *(unsigned char *)(v10 + 40) = 0;
    v6[2] = v9 + 1;
    sub_24C8E8100(&v34, (uint64_t)&v6[5 * v9 + 4]);
    xpc_object_t v11 = xpc_array_get_value(v2, v3);
    uint64_t v12 = MEMORY[0x2533006D0]();
    if (v12 == sub_24C8F7B30()) {
      goto LABEL_12;
    }
    uint64_t v13 = MEMORY[0x2533006D0](v11);
    if (v13 != sub_24C8F7B80())
    {
      uint64_t v14 = (void *)*v5;
      sub_24C8F7F50();
      swift_allocError();
      uint64_t v16 = v15;
      swift_bridgeObjectRetain();
      sub_24C8E86AC(MEMORY[0x263F8D310], (uint64_t)v11, v16);
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
LABEL_13:
      sub_24C8EC4FC(v1);
      return v14;
    }
    if (!xpc_string_get_string_ptr(v11))
    {
LABEL_12:
      swift_unknownObjectRelease();
      uint64_t v25 = sub_24C8F7F50();
      swift_allocError();
      char v27 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
      *char v27 = MEMORY[0x263F8D310];
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
      uint64_t v28 = swift_initStackObject();
      *(_OWORD *)(v28 + 16) = xmmword_24C8F9900;
      uint64_t v38 = v1[3];
      uint64_t v29 = v38;
      swift_bridgeObjectRetain();
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      *(void *)(v28 + 56) = &type metadata for XPCCodingKey;
      *(void *)(v28 + 64) = v32;
      uint64_t v30 = swift_allocObject();
      *(void *)(v28 + 32) = v30;
      *(void *)(v30 + 16) = 0x207865646E49;
      *(void *)(v30 + 24) = 0xE600000000000000;
      *(void *)(v30 + 32) = v29;
      *(unsigned char *)(v30 + 40) = 0;
      sub_24C8F24A0((void *)v28);
      v33[0] = 0;
      v33[1] = 0xE000000000000000;
      uint64_t v14 = v33;
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      sub_24C8F7F40();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, *MEMORY[0x263F8DCC0], v25);
      swift_willThrow();
      goto LABEL_13;
    }
    uint64_t v14 = (void *)sub_24C8F7D00();
    swift_unknownObjectRelease();
    v1[3] = v3 + 1;
    sub_24C8EC4FC(v1);
  }
  return v14;
}

uint64_t sub_24C8EB478@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v59 = a3;
  uint64_t v58 = a2;
  uint64_t v7 = sub_24C8F7E50();
  uint64_t v56 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v9 = (char *)&v50 - v8;
  uint64_t v10 = (void *)v4[1];
  int64_t v11 = v4[3];
  if (v11 >= (uint64_t)xpc_array_get_count(v10))
  {
    uint64_t v26 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v28 = v27;
    uint64_t v60 = (uint64_t)v27 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640) + 48);
    *uint64_t v28 = a1;
    uint64_t v29 = *v4;
    swift_beginAccess();
    uint64_t v30 = *(void *)(v29 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24C8F9900;
    uint64_t v32 = v4[3];
    uint64_t v66 = 0x207865646E49;
    unint64_t v67 = 0xE600000000000000;
    uint64_t v61 = v32;
    swift_bridgeObjectRetain();
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    uint64_t v33 = v66;
    unint64_t v34 = v67;
    *(void *)(inited + 56) = &type metadata for XPCCodingKey;
    *(void *)(inited + 64) = sub_24C8E43A0();
    uint64_t v35 = swift_allocObject();
    *(void *)(inited + 32) = v35;
    *(void *)(v35 + 16) = v33;
    *(void *)(v35 + 24) = v34;
    *(void *)(v35 + 32) = v32;
    *(unsigned char *)(v35 + 40) = 0;
    uint64_t v66 = v30;
    sub_24C8F24A0((void *)inited);
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCC0], v26);
    return swift_willThrow();
  }
  else
  {
    uint64_t v52 = a4;
    uint64_t v55 = v4;
    uint64_t v12 = *v4;
    *(void *)&long long v63 = 0x207865646E49;
    *((void *)&v63 + 1) = 0xE600000000000000;
    uint64_t v66 = v11;
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    uint64_t v53 = *((void *)&v63 + 1);
    uint64_t v54 = v63;
    uint64_t v13 = (void *)(v12 + 16);
    swift_beginAccess();
    uint64_t v14 = *(void **)(v12 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v12 + 16) = v14;
    uint64_t v57 = a1;
    uint64_t v51 = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v14 = sub_24C8F2368(0, v14[2] + 1, 1, v14);
      *uint64_t v13 = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      uint64_t v14 = sub_24C8F2368((void *)(v16 > 1), v17 + 1, 1, v14);
      *uint64_t v13 = v14;
    }
    uint64_t v64 = &type metadata for XPCCodingKey;
    unint64_t v18 = sub_24C8E43A0();
    unint64_t v65 = v18;
    uint64_t v19 = swift_allocObject();
    *(void *)&long long v63 = v19;
    uint64_t v20 = v53;
    *(void *)(v19 + 16) = v54;
    *(void *)(v19 + 24) = v20;
    *(void *)(v19 + 32) = v11;
    *(unsigned char *)(v19 + 40) = 0;
    void v14[2] = v17 + 1;
    sub_24C8E8100(&v63, (uint64_t)&v14[5 * v17 + 4]);
    xpc_object_t v21 = xpc_array_get_value(v10, v11);
    uint64_t v22 = v57;
    uint64_t v23 = v58;
    uint64_t v24 = v60;
    sub_24C8E8C7C(v21, v57, v58, v59, (uint64_t)v9);
    if (v24)
    {
      swift_unknownObjectRelease();
      uint64_t v25 = v55;
    }
    else
    {
      swift_unknownObjectRelease();
      uint64_t v37 = v23;
      uint64_t v38 = *(void *)(v23 - 8);
      int v39 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v38 + 48))(v9, 1, v37);
      uint64_t v40 = v55;
      if (v39 == 1)
      {
        (*(void (**)(char *, uint64_t))(v56 + 8))(v9, v51);
        uint64_t v60 = sub_24C8F7F50();
        swift_allocError();
        uint64_t v42 = v41;
        uint64_t v59 = (uint64_t)v41 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640) + 48);
        *uint64_t v42 = v22;
        uint64_t v43 = *v40;
        swift_beginAccess();
        uint64_t v44 = *(void *)(v43 + 16);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
        uint64_t v45 = swift_initStackObject();
        *(_OWORD *)(v45 + 16) = xmmword_24C8F9900;
        uint64_t v46 = v40[3];
        uint64_t v61 = 0x207865646E49;
        unint64_t v62 = 0xE600000000000000;
        uint64_t v68 = v46;
        swift_bridgeObjectRetain();
        sub_24C8F8180();
        sub_24C8F7CF0();
        swift_bridgeObjectRelease();
        uint64_t v47 = v61;
        unint64_t v48 = v62;
        *(void *)(v45 + 56) = &type metadata for XPCCodingKey;
        *(void *)(v45 + 64) = v18;
        uint64_t v49 = swift_allocObject();
        *(void *)(v45 + 32) = v49;
        *(void *)(v49 + 16) = v47;
        *(void *)(v49 + 24) = v48;
        *(void *)(v49 + 32) = v46;
        *(unsigned char *)(v49 + 40) = 0;
        uint64_t v61 = v44;
        sub_24C8F24A0((void *)v45);
        uint64_t v61 = 0;
        unint64_t v62 = 0xE000000000000000;
        sub_24C8F7F00();
        swift_bridgeObjectRelease();
        uint64_t v61 = 0x6465746365707845;
        unint64_t v62 = 0xE900000000000020;
        sub_24C8F8640();
        sub_24C8F7CF0();
        swift_bridgeObjectRelease();
        sub_24C8F7CF0();
        sub_24C8F7F40();
        (*(void (**)(uint64_t *, void))(*(void *)(v60 - 8) + 104))(v42, *MEMORY[0x263F8DCC0]);
        swift_willThrow();
      }
      else
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v52, v9, v37);
        v40[3] = v11 + 1;
      }
      uint64_t v25 = v40;
    }
    return sub_24C8EC4FC(v25);
  }
}

uint64_t sub_24C8EBBE0(uint64_t a1, uint64_t a2)
{
  int64_t v3 = v2;
  uint64_t v32 = a2;
  uint64_t v4 = *v2;
  int64_t v5 = v2[3];
  *(void *)&long long v27 = 0x207865646E49;
  *((void *)&v27 + 1) = 0xE600000000000000;
  int64_t v31 = v5;
  sub_24C8F8180();
  sub_24C8F7CF0();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)(v4 + 16);
  swift_beginAccess();
  uint64_t v7 = *(void **)(v4 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v4 + 16) = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v7 = sub_24C8F2368(0, v7[2] + 1, 1, v7);
    *uint64_t v6 = v7;
  }
  unint64_t v10 = v7[2];
  unint64_t v9 = v7[3];
  if (v10 >= v9 >> 1)
  {
    uint64_t v7 = sub_24C8F2368((void *)(v9 > 1), v10 + 1, 1, v7);
    *uint64_t v6 = v7;
  }
  uint64_t v29 = &type metadata for XPCCodingKey;
  unint64_t v30 = sub_24C8E43A0();
  uint64_t v11 = swift_allocObject();
  *(void *)&long long v27 = v11;
  *(void *)(v11 + 16) = 0x207865646E49;
  *(void *)(v11 + 24) = 0xE600000000000000;
  *(void *)(v11 + 32) = v5;
  *(unsigned char *)(v11 + 40) = 0;
  v7[2] = v10 + 1;
  sub_24C8E8100(&v27, (uint64_t)&v7[5 * v10 + 4]);
  uint64_t v12 = (void *)v3[1];
  if (v5 >= (uint64_t)xpc_array_get_count(v12))
  {
    uint64_t v18 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v20 = sub_24C8F80E0();
    swift_bridgeObjectRetain();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCC0], v18);
    swift_willThrow();
    return sub_24C8EC4FC(v3);
  }
  xpc_object_t v13 = xpc_array_get_value(v12, v5);
  uint64_t v14 = MEMORY[0x2533006D0]();
  if (v14 == sub_24C8F7B30())
  {
    uint64_t v21 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v23 = sub_24C8F80E0();
    swift_bridgeObjectRetain();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCC0], v21);
    goto LABEL_11;
  }
  uint64_t v15 = MEMORY[0x2533006D0](v13);
  if (v15 != sub_24C8F7BA0())
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9670);
    sub_24C8F7F50();
    swift_allocError();
    sub_24C8E86AC(v16, (uint64_t)v13, v17);
LABEL_11:
    swift_willThrow();
    swift_unknownObjectRelease();
    return sub_24C8EC4FC(v3);
  }
  v3[3] = v5 + 1;
  swift_retain();
  swift_unknownObjectRetain();
  *(void *)&long long v27 = sub_24C8E8834(v4, (uint64_t)v13);
  *((void *)&v27 + 1) = v25;
  uint64_t v28 = v26;
  type metadata accessor for _XPCKeyedDecodingContainer();
  swift_retain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_24C8F80F0();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return sub_24C8EC4FC(v3);
}

uint64_t sub_24C8EC06C@<X0>(void *a1@<X8>)
{
  int64_t v3 = v1;
  uint64_t v5 = *v1;
  int64_t v6 = v1[3];
  *(void *)&long long v30 = 0x207865646E49;
  *((void *)&v30 + 1) = 0xE600000000000000;
  int64_t v33 = v6;
  sub_24C8F8180();
  sub_24C8F7CF0();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)(v5 + 16);
  swift_beginAccess();
  uint64_t v8 = *(void **)(v5 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v5 + 16) = v8;
  uint64_t v34 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v8 = sub_24C8F2368(0, v8[2] + 1, 1, v8);
    *uint64_t v7 = v8;
  }
  unint64_t v11 = v8[2];
  unint64_t v10 = v8[3];
  if (v11 >= v10 >> 1)
  {
    uint64_t v8 = sub_24C8F2368((void *)(v10 > 1), v11 + 1, 1, v8);
    *uint64_t v7 = v8;
  }
  int64_t v31 = &type metadata for XPCCodingKey;
  unint64_t v32 = sub_24C8E43A0();
  uint64_t v12 = swift_allocObject();
  *(void *)&long long v30 = v12;
  *(void *)(v12 + 16) = 0x207865646E49;
  *(void *)(v12 + 24) = 0xE600000000000000;
  *(void *)(v12 + 32) = v6;
  *(unsigned char *)(v12 + 40) = 0;
  v8[2] = v11 + 1;
  sub_24C8E8100(&v30, (uint64_t)&v8[5 * v11 + 4]);
  xpc_object_t v13 = (void *)v3[1];
  if (v6 >= (uint64_t)xpc_array_get_count(v13))
  {
    uint64_t v19 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9668);
    swift_bridgeObjectRetain();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, *MEMORY[0x263F8DCC0], v19);
    swift_willThrow();
    return sub_24C8EC4FC(v3);
  }
  xpc_object_t v14 = xpc_array_get_value(v13, v6);
  uint64_t v15 = MEMORY[0x2533006D0]();
  if (v15 == sub_24C8F7B30())
  {
    uint64_t v22 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9668);
    swift_bridgeObjectRetain();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, *MEMORY[0x263F8DCC0], v22);
    goto LABEL_11;
  }
  uint64_t v16 = MEMORY[0x2533006D0](v14);
  if (v16 != sub_24C8F7B50())
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9658);
    sub_24C8F7F50();
    swift_allocError();
    sub_24C8E86AC(v17, (uint64_t)v14, v18);
LABEL_11:
    swift_willThrow();
    swift_unknownObjectRelease();
    return sub_24C8EC4FC(v3);
  }
  v3[3] = v6 + 1;
  swift_retain();
  uint64_t v26 = swift_unknownObjectRetain();
  uint64_t v27 = MEMORY[0x2533006D0](v26);
  if (v27 == sub_24C8F7B50())
  {
    uint64_t v28 = *(void *)(v5 + 16);
    a1[3] = &type metadata for _XPCUnkeyedDecodingContainer;
    a1[4] = sub_24C8F3E7C();
    uint64_t v29 = (void *)swift_allocObject();
    *a1 = v29;
    swift_bridgeObjectRetain();
    swift_unknownObjectRelease();
    v29[2] = v5;
    void v29[3] = v14;
    v29[4] = v28;
    v29[5] = 0;
    return sub_24C8EC4FC(v3);
  }
  else
  {
    uint64_t result = sub_24C8F8010();
    __break(1u);
  }
  return result;
}

uint64_t sub_24C8EC4FC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t v2 = *(void **)(v1 + 16);
  if (!v2[2])
  {
    __break(1u);
LABEL_6:
    uint64_t result = (uint64_t)sub_24C8F25A0(v2);
    uint64_t v2 = (void *)result;
    uint64_t v4 = *(void *)(result + 16);
    if (v4) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  swift_retain();
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v4 = v2[2];
  if (v4)
  {
LABEL_4:
    uint64_t v5 = v4 - 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v2[5 * v4 - 1]);
    v2[2] = v5;
    *(void *)(v1 + 16) = v2;
    swift_endAccess();
    return swift_release();
  }
LABEL_7:
  __break(1u);
  return result;
}

size_t sub_24C8EC5B0()
{
  return xpc_array_get_count(*(xpc_object_t *)(v0 + 8));
}

BOOL sub_24C8EC5D0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  return v1 >= (uint64_t)xpc_array_get_count(*(xpc_object_t *)(v0 + 8));
}

uint64_t sub_24C8EC600()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_24C8EC608()
{
  return sub_24C8EAC6C() & 1;
}

uint64_t sub_24C8EC624()
{
  return sub_24C8F4168() & 1;
}

void *sub_24C8EC640()
{
  return sub_24C8EAEB4();
}

double sub_24C8EC658()
{
  return sub_24C8F720C();
}

float sub_24C8EC670()
{
  return sub_24C8F6C4C();
}

void *sub_24C8EC688()
{
  return sub_24C8F471C();
}

void *sub_24C8EC6A0()
{
  return sub_24C8F572C((uint64_t (*)(void))sub_24C8F27D8, MEMORY[0x263F8E498]);
}

void *sub_24C8EC6EC()
{
  return sub_24C8F5C6C((uint64_t (*)(void))sub_24C8F2A40, MEMORY[0x263F8E4F0]);
}

uint64_t sub_24C8EC738()
{
  return sub_24C8F61AC((uint64_t (*)(void))sub_24C8F2CAC, MEMORY[0x263F8E548]);
}

void *sub_24C8EC784()
{
  return sub_24C8F4C70();
}

uint64_t sub_24C8EC79C()
{
  return sub_24C8F8210();
}

void *sub_24C8EC7B4()
{
  return sub_24C8F51D0();
}

void *sub_24C8EC7CC()
{
  return sub_24C8F572C((uint64_t (*)(void))sub_24C8F3410, MEMORY[0x263F8E778]);
}

void *sub_24C8EC818()
{
  return sub_24C8F5C6C((uint64_t (*)(void))sub_24C8F367C, MEMORY[0x263F8E888]);
}

uint64_t sub_24C8EC864()
{
  return sub_24C8F61AC((uint64_t (*)(void))sub_24C8F38E8, MEMORY[0x263F8E8F8]);
}

void *sub_24C8EC8B0()
{
  return sub_24C8F66EC();
}

uint64_t sub_24C8EC8C8()
{
  return sub_24C8F8220();
}

uint64_t sub_24C8EC8E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_24C8EB478(a1, a2, a3, a4);
}

uint64_t sub_24C8EC8F8()
{
  return sub_24C8F81A0();
}

uint64_t sub_24C8EC910()
{
  return sub_24C8F8190();
}

uint64_t sub_24C8EC928()
{
  uint64_t result = sub_24C8F81B0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_24C8EC94C(uint64_t a1, uint64_t a2)
{
  return sub_24C8ECB78(a1, a2, MEMORY[0x263F8E110]);
}

uint64_t sub_24C8EC978()
{
  uint64_t result = sub_24C8F81C0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_24C8EC99C(uint64_t a1, uint64_t a2)
{
  return sub_24C8ECAC0(a1, a2, MEMORY[0x263F8E118]);
}

uint64_t sub_24C8EC9C8(uint64_t a1, uint64_t a2)
{
  return sub_24C8ECB1C(a1, a2, MEMORY[0x263F8E120]);
}

uint64_t sub_24C8EC9F4(uint64_t a1, uint64_t a2)
{
  return sub_24C8ECB78(a1, a2, MEMORY[0x263F8E128]);
}

uint64_t sub_24C8ECA20()
{
  uint64_t result = sub_24C8F81F0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_24C8ECA44(uint64_t a1, uint64_t a2)
{
  return sub_24C8ECC00(a1, a2, MEMORY[0x263F8E138]);
}

uint64_t sub_24C8ECA70()
{
  uint64_t result = sub_24C8F81D0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_24C8ECA94(uint64_t a1, uint64_t a2)
{
  return sub_24C8ECAC0(a1, a2, MEMORY[0x263F8E130]);
}

uint64_t sub_24C8ECAC0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FF;
}

uint64_t sub_24C8ECAF0(uint64_t a1, uint64_t a2)
{
  return sub_24C8ECB1C(a1, a2, MEMORY[0x263F8E140]);
}

uint64_t sub_24C8ECB1C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FFFF;
}

uint64_t sub_24C8ECB4C(uint64_t a1, uint64_t a2)
{
  return sub_24C8ECB78(a1, a2, MEMORY[0x263F8E148]);
}

uint64_t sub_24C8ECB78(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  unint64_t v3 = a3();
  return v3 | ((HIDWORD(v3) & 1) << 32);
}

uint64_t sub_24C8ECBB0()
{
  uint64_t result = sub_24C8F8200();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_24C8ECBD4(uint64_t a1, uint64_t a2)
{
  return sub_24C8ECC00(a1, a2, MEMORY[0x263F8E150]);
}

uint64_t sub_24C8ECC00(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (v3) {
    return v5;
  }
  return result;
}

uint64_t sub_24C8ECC2C()
{
  return sub_24C8F81E0();
}

uint64_t sub_24C8ECC58(uint64_t a1, uint64_t a2)
{
  return sub_24C8EBBE0(a1, a2);
}

uint64_t sub_24C8ECC70@<X0>(void *a1@<X8>)
{
  return sub_24C8EC06C(a1);
}

void sub_24C8ECC88()
{
}

uint64_t sub_24C8ECCD4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v14 = sub_24C8F7D80();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = a4;
  v8[3] = a5;
  long long v8[4] = &v14;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_24C8F77D8;
  *(void *)(v9 + 24) = v8;
  aBlock[4] = sub_24C8F77F4;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24C8ECF40;
  aBlock[3] = &block_descriptor;
  unint64_t v10 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  xpc_dictionary_apply(a2, v10);
  _Block_release(v10);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (a2)
  {
    __break(1u);
  }
  else
  {
    uint64_t v12 = v14;
    swift_release();
    return v12;
  }
  return result;
}

uint64_t sub_24C8ECE44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = sub_24C8F7E50();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v9 - v6;
  sub_24C8F7D00();
  sub_24C8F8610();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 48))(v7, 1, a4);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_24C8F7DC0();
    sub_24C8F7DB0();
    return 1;
  }
  return result;
}

uint64_t sub_24C8ECF40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  char v6 = v5(a2, a3);
  swift_unknownObjectRelease();
  return v6 & 1;
}

BOOL sub_24C8ECF98(uint64_t a1, uint64_t a2, void *a3)
{
  sub_24C8F8600();
  uint64_t v4 = sub_24C8F7CC0();
  swift_bridgeObjectRelease();
  xpc_object_t v5 = xpc_dictionary_get_value(a3, (const char *)(v4 + 32));
  swift_release();
  if (v5) {
    swift_unknownObjectRelease();
  }
  return v5 != 0;
}

BOOL sub_24C8ED018(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_24C8F8600();
  uint64_t v10 = sub_24C8F7CC0();
  swift_bridgeObjectRelease();
  xpc_object_t v11 = xpc_dictionary_get_value(a3, (const char *)(v10 + 32));
  swift_release();
  if (v11)
  {
    uint64_t v12 = MEMORY[0x2533006D0](v11);
    uint64_t v13 = sub_24C8F7B30();
    swift_unknownObjectRelease();
    return v12 == v13;
  }
  else
  {
    uint64_t v15 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v17 = v16;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697F9710);
    v17[3] = a5;
    v17[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v17);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))(boxed_opaque_existential_1, a1, a5);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    sub_24C8F7CF0();
    sub_24C8F8370();
    sub_24C8F7CF0();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v15 - 8) + 104))(v17, *MEMORY[0x263F8DCA8], v15);
    swift_willThrow();
  }
  return v14;
}

uint64_t sub_24C8ED23C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v46 = a4;
  uint64_t v10 = *(void *)(a5 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v42 - v15;
  uint64_t v51 = v14;
  sub_24C8F8600();
  uint64_t v17 = sub_24C8F7CC0();
  swift_bridgeObjectRelease();
  uint64_t v45 = a3;
  uint64_t v18 = xpc_dictionary_get_value(a3, (const char *)(v17 + 32));
  swift_release();
  uint64_t v47 = v18;
  if (v18)
  {
    uint64_t v43 = a5;
    uint64_t v44 = a6;
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    v19(v16, v51, a5);
    uint64_t v20 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    uint64_t v21 = *(void **)(a2 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v51 = a2;
    *(void *)(a2 + 16) = v21;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v21 = sub_24C8F2368(0, v21[2] + 1, 1, v21);
      *uint64_t v20 = (uint64_t)v21;
    }
    unint64_t v24 = v21[2];
    unint64_t v23 = v21[3];
    if (v24 >= v23 >> 1) {
      *uint64_t v20 = (uint64_t)sub_24C8F2368((void *)(v23 > 1), v24 + 1, 1, v21);
    }
    uint64_t v25 = v43;
    v19(v13, (uint64_t)v16, v43);
    sub_24C8F25B4(v24, (uint64_t)v13, (uint64_t *)(a2 + 16), v25, v44);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v25);
    uint64_t v26 = v47;
    uint64_t v27 = MEMORY[0x2533006D0](v47);
    if (v27 == sub_24C8F7B30())
    {
      uint64_t v37 = sub_24C8F7F50();
      swift_allocError();
      int v39 = v38;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
      void *v39 = MEMORY[0x263F8D4F8];
      uint64_t v40 = v51;
      uint64_t v49 = 0;
      unint64_t v50 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      uint64_t v20 = &v49;
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      sub_24C8F7F40();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v37 - 8) + 104))(v39, *MEMORY[0x263F8DCC0], v37);
      swift_willThrow();
      sub_24C8F14A4(v40);
    }
    else
    {
      uint64_t v28 = MEMORY[0x2533006D0](v26);
      uint64_t v29 = sub_24C8F7B20();
      uint64_t v30 = v51;
      if (v28 == v29)
      {
        LOBYTE(v20) = xpc_BOOL_get_value(v26);
        sub_24C8F14A4(v30);
        swift_unknownObjectRelease();
        return v20 & 1;
      }
      sub_24C8F7F50();
      swift_allocError();
      unint64_t v32 = v31;
      swift_bridgeObjectRetain();
      sub_24C8E86AC(MEMORY[0x263F8D4F8], (uint64_t)v26, v32);
      swift_bridgeObjectRelease();
      swift_willThrow();
      sub_24C8F14A4(v30);
    }
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v33 = sub_24C8F7F50();
    uint64_t v48 = swift_allocError();
    uint64_t v35 = v34;
    uint64_t v47 = (char *)v34 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697F9710) + 48);
    v35[3] = a5;
    v35[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v35);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v10 + 16))(boxed_opaque_existential_1, v51, a5);
    swift_beginAccess();
    uint64_t v49 = 0;
    unint64_t v50 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    uint64_t v20 = &v49;
    sub_24C8F7F00();
    sub_24C8F7CF0();
    sub_24C8F8370();
    sub_24C8F7CF0();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v33 - 8) + 104))(v35, *MEMORY[0x263F8DCA8], v33);
    swift_willThrow();
  }
  return v20 & 1;
}

uint64_t *sub_24C8ED78C(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v44 = a4;
  uint64_t v10 = *(void *)(a5 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v40 - v15;
  uint64_t v49 = (uint64_t *)v14;
  sub_24C8F8600();
  uint64_t v17 = sub_24C8F7CC0();
  swift_bridgeObjectRelease();
  uint64_t v43 = a3;
  uint64_t v18 = xpc_dictionary_get_value(a3, (const char *)(v17 + 32));
  swift_release();
  uint64_t v46 = v18;
  if (!v18)
  {
    uint64_t v32 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v34 = v33;
    uint64_t v46 = (char *)v33 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697F9710) + 48);
    v34[3] = a5;
    v34[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v34);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v10 + 16))(boxed_opaque_existential_1, v49, a5);
    swift_beginAccess();
    uint64_t v47 = 0;
    unint64_t v48 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    uint64_t v29 = &v47;
    sub_24C8F7F00();
    sub_24C8F7CF0();
    sub_24C8F8370();
    sub_24C8F7CF0();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v32 - 8) + 104))(v34, *MEMORY[0x263F8DCA8], v32);
    swift_willThrow();
    return v29;
  }
  uint64_t v41 = a5;
  uint64_t v42 = a6;
  uint64_t v19 = *(void (**)(char *, uint64_t *, uint64_t))(v10 + 16);
  v19(v16, v49, a5);
  uint64_t v20 = a2 + 2;
  swift_beginAccess();
  uint64_t v21 = (void *)a2[2];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v49 = a2;
  a2[2] = (uint64_t)v21;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v21 = sub_24C8F2368(0, v21[2] + 1, 1, v21);
    *uint64_t v20 = (uint64_t)v21;
  }
  unint64_t v24 = v21[2];
  unint64_t v23 = v21[3];
  if (v24 >= v23 >> 1) {
    *uint64_t v20 = (uint64_t)sub_24C8F2368((void *)(v23 > 1), v24 + 1, 1, v21);
  }
  uint64_t v25 = v41;
  v19(v13, (uint64_t *)v16, v41);
  sub_24C8F25B4(v24, (uint64_t)v13, v20, v25, v42);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v25);
  uint64_t v26 = MEMORY[0x263F8D6C8];
  uint64_t v27 = v45;
  uint64_t v28 = (uint64_t)v49;
  uint64_t v29 = v49;
  int64_t v30 = sub_24C8F2F20(v46, 7630409, 0xE300000000000000, MEMORY[0x263F8D6C8]);
  if (v27)
  {
LABEL_11:
    sub_24C8F14A4(v28);
    swift_unknownObjectRelease();
    return v29;
  }
  if (v31)
  {
    uint64_t v36 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v38 = v37;
    uint64_t v45 = (char *)v37 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640) + 48);
    *uint64_t v38 = v26;
    uint64_t v47 = 0;
    unint64_t v48 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    uint64_t v29 = &v47;
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v36 - 8) + 104))(v38, *MEMORY[0x263F8DCC0], v36);
    swift_willThrow();
    goto LABEL_11;
  }
  uint64_t v29 = (uint64_t *)v30;
  sub_24C8F14A4(v28);
  swift_unknownObjectRelease();
  return v29;
}

uint64_t *sub_24C8EDC54(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v44 = a4;
  uint64_t v10 = *(void *)(a5 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v40 - v15;
  uint64_t v49 = (uint64_t *)v14;
  sub_24C8F8600();
  uint64_t v17 = sub_24C8F7CC0();
  swift_bridgeObjectRelease();
  uint64_t v43 = a3;
  uint64_t v18 = xpc_dictionary_get_value(a3, (const char *)(v17 + 32));
  swift_release();
  uint64_t v46 = v18;
  if (!v18)
  {
    uint64_t v32 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v34 = v33;
    uint64_t v46 = (char *)v33 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697F9710) + 48);
    v34[3] = a5;
    v34[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v34);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v10 + 16))(boxed_opaque_existential_1, v49, a5);
    swift_beginAccess();
    uint64_t v47 = 0;
    unint64_t v48 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    uint64_t v29 = &v47;
    sub_24C8F7F00();
    sub_24C8F7CF0();
    sub_24C8F8370();
    sub_24C8F7CF0();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v32 - 8) + 104))(v34, *MEMORY[0x263F8DCA8], v32);
    swift_willThrow();
    return v29;
  }
  uint64_t v41 = a5;
  uint64_t v42 = a6;
  uint64_t v19 = *(void (**)(char *, uint64_t *, uint64_t))(v10 + 16);
  v19(v16, v49, a5);
  uint64_t v20 = a2 + 2;
  swift_beginAccess();
  uint64_t v21 = (void *)a2[2];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v49 = a2;
  a2[2] = (uint64_t)v21;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v21 = sub_24C8F2368(0, v21[2] + 1, 1, v21);
    *uint64_t v20 = (uint64_t)v21;
  }
  unint64_t v24 = v21[2];
  unint64_t v23 = v21[3];
  if (v24 >= v23 >> 1) {
    *uint64_t v20 = (uint64_t)sub_24C8F2368((void *)(v23 > 1), v24 + 1, 1, v21);
  }
  uint64_t v25 = v41;
  v19(v13, (uint64_t *)v16, v41);
  sub_24C8F25B4(v24, (uint64_t)v13, v20, v25, v42);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v25);
  uint64_t v26 = MEMORY[0x263F8E5C0];
  uint64_t v27 = v45;
  uint64_t v28 = (uint64_t)v49;
  uint64_t v29 = v49;
  int64_t v30 = sub_24C8F2F20(v46, 0x3436746E49, 0xE500000000000000, MEMORY[0x263F8E5C0]);
  if (v27)
  {
LABEL_11:
    sub_24C8F14A4(v28);
    swift_unknownObjectRelease();
    return v29;
  }
  if (v31)
  {
    uint64_t v36 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v38 = v37;
    uint64_t v45 = (char *)v37 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640) + 48);
    *uint64_t v38 = v26;
    uint64_t v47 = 0;
    unint64_t v48 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    uint64_t v29 = &v47;
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v36 - 8) + 104))(v38, *MEMORY[0x263F8DCC0], v36);
    swift_willThrow();
    goto LABEL_11;
  }
  uint64_t v29 = (uint64_t *)v30;
  sub_24C8F14A4(v28);
  swift_unknownObjectRelease();
  return v29;
}

uint64_t *sub_24C8EE120(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v44 = a4;
  uint64_t v10 = *(void *)(a5 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v40 - v15;
  uint64_t v49 = (uint64_t *)v14;
  sub_24C8F8600();
  uint64_t v17 = sub_24C8F7CC0();
  swift_bridgeObjectRelease();
  uint64_t v43 = a3;
  uint64_t v18 = xpc_dictionary_get_value(a3, (const char *)(v17 + 32));
  swift_release();
  uint64_t v46 = v18;
  if (!v18)
  {
    uint64_t v32 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v34 = v33;
    uint64_t v46 = (char *)v33 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697F9710) + 48);
    v34[3] = a5;
    v34[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v34);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v10 + 16))(boxed_opaque_existential_1, v49, a5);
    swift_beginAccess();
    uint64_t v47 = 0;
    unint64_t v48 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    uint64_t v29 = &v47;
    sub_24C8F7F00();
    sub_24C8F7CF0();
    sub_24C8F8370();
    sub_24C8F7CF0();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v32 - 8) + 104))(v34, *MEMORY[0x263F8DCA8], v32);
    swift_willThrow();
    return v29;
  }
  uint64_t v41 = a5;
  uint64_t v42 = a6;
  uint64_t v19 = *(void (**)(char *, uint64_t *, uint64_t))(v10 + 16);
  v19(v16, v49, a5);
  uint64_t v20 = a2 + 2;
  swift_beginAccess();
  uint64_t v21 = (void *)a2[2];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v49 = a2;
  a2[2] = (uint64_t)v21;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v21 = sub_24C8F2368(0, v21[2] + 1, 1, v21);
    *uint64_t v20 = (uint64_t)v21;
  }
  unint64_t v24 = v21[2];
  unint64_t v23 = v21[3];
  if (v24 >= v23 >> 1) {
    *uint64_t v20 = (uint64_t)sub_24C8F2368((void *)(v23 > 1), v24 + 1, 1, v21);
  }
  uint64_t v25 = v41;
  v19(v13, (uint64_t *)v16, v41);
  sub_24C8F25B4(v24, (uint64_t)v13, v20, v25, v42);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v25);
  uint64_t v26 = MEMORY[0x263F8D9D0];
  uint64_t v27 = v45;
  uint64_t v28 = (uint64_t)v49;
  uint64_t v29 = v49;
  uint64_t v30 = sub_24C8F3198(v46, 1953384789, 0xE400000000000000, MEMORY[0x263F8D9D0]);
  if (v27)
  {
LABEL_11:
    sub_24C8F14A4(v28);
    swift_unknownObjectRelease();
    return v29;
  }
  if (v31)
  {
    uint64_t v36 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v38 = v37;
    uint64_t v45 = (char *)v37 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640) + 48);
    *uint64_t v38 = v26;
    uint64_t v47 = 0;
    unint64_t v48 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    uint64_t v29 = &v47;
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v36 - 8) + 104))(v38, *MEMORY[0x263F8DCC0], v36);
    swift_willThrow();
    goto LABEL_11;
  }
  uint64_t v29 = (uint64_t *)v30;
  sub_24C8F14A4(v28);
  swift_unknownObjectRelease();
  return v29;
}

uint64_t *sub_24C8EE5E8(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(xpc_object_t), uint64_t a8, uint64_t a9, uint64_t (*a10)(xpc_object_t))
{
  uint64_t v41 = a8;
  uint64_t v51 = a7;
  uint64_t v46 = a4;
  uint64_t v15 = *(void *)(a5 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](a1);
  uint64_t v47 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v40 - v18;
  sub_24C8F8600();
  uint64_t v20 = sub_24C8F7CC0();
  swift_bridgeObjectRelease();
  uint64_t v45 = a3;
  xpc_object_t v21 = xpc_dictionary_get_value(a3, (const char *)(v20 + 32));
  swift_release();
  if (v21)
  {
    uint64_t v44 = a6;
    uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    v42(v19, a1, a5);
    uint64_t v22 = a2 + 2;
    swift_beginAccess();
    unint64_t v23 = (void *)a2[2];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v43 = a2;
    a2[2] = (uint64_t)v23;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v23 = sub_24C8F2368(0, v23[2] + 1, 1, v23);
      *uint64_t v22 = (uint64_t)v23;
    }
    unint64_t v26 = v23[2];
    unint64_t v25 = v23[3];
    if (v26 >= v25 >> 1) {
      *uint64_t v22 = (uint64_t)sub_24C8F2368((void *)(v25 > 1), v26 + 1, 1, v23);
    }
    uint64_t v27 = (uint64_t)v47;
    v42(v47, (uint64_t)v19, a5);
    sub_24C8F25B4(v26, v27, v22, a5, v44);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v19, a5);
    uint64_t v28 = (uint64_t)v43;
    uint64_t v29 = v43;
    uint64_t v30 = v48;
    uint64_t v31 = v51(v21);
    if (!v30)
    {
      uint64_t v29 = (uint64_t *)v31;
      if ((v31 & 0x100) != 0)
      {
        uint64_t v51 = a10;
        uint64_t v48 = a9;
        uint64_t v36 = sub_24C8F7F50();
        swift_allocError();
        uint64_t v38 = v37;
        uint64_t v47 = (char *)v37 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640) + 48);
        *uint64_t v38 = v41;
        uint64_t v49 = 0;
        unint64_t v50 = 0xE000000000000000;
        swift_bridgeObjectRetain();
        uint64_t v29 = &v49;
        sub_24C8F7F00();
        swift_bridgeObjectRelease();
        sub_24C8F7F40();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v36 - 8) + 104))(v38, *MEMORY[0x263F8DCC0], v36);
        swift_willThrow();
      }
    }
    sub_24C8F14A4(v28);
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v32 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v34 = v33;
    uint64_t v51 = (uint64_t (*)(xpc_object_t))((char *)v33
                                               + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697F9710)
                                                        + 48));
    v34[3] = a5;
    v34[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v34);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v15 + 16))(boxed_opaque_existential_1, a1, a5);
    swift_beginAccess();
    uint64_t v49 = 0;
    unint64_t v50 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    uint64_t v29 = &v49;
    sub_24C8F7F00();
    sub_24C8F7CF0();
    sub_24C8F8370();
    sub_24C8F7CF0();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v32 - 8) + 104))(v34, *MEMORY[0x263F8DCA8], v32);
    swift_willThrow();
  }
  return v29;
}

uint64_t *sub_24C8EEAB0(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(xpc_object_t), uint64_t a8, uint64_t a9, uint64_t (*a10)(xpc_object_t))
{
  uint64_t v41 = a8;
  uint64_t v51 = a7;
  uint64_t v46 = a4;
  uint64_t v15 = *(void *)(a5 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](a1);
  uint64_t v47 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v40 - v18;
  sub_24C8F8600();
  uint64_t v20 = sub_24C8F7CC0();
  swift_bridgeObjectRelease();
  uint64_t v45 = a3;
  xpc_object_t v21 = xpc_dictionary_get_value(a3, (const char *)(v20 + 32));
  swift_release();
  if (v21)
  {
    uint64_t v44 = a6;
    uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    v42(v19, a1, a5);
    uint64_t v22 = a2 + 2;
    swift_beginAccess();
    unint64_t v23 = (void *)a2[2];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v43 = a2;
    a2[2] = (uint64_t)v23;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v23 = sub_24C8F2368(0, v23[2] + 1, 1, v23);
      *uint64_t v22 = (uint64_t)v23;
    }
    unint64_t v26 = v23[2];
    unint64_t v25 = v23[3];
    if (v26 >= v25 >> 1) {
      *uint64_t v22 = (uint64_t)sub_24C8F2368((void *)(v25 > 1), v26 + 1, 1, v23);
    }
    uint64_t v27 = (uint64_t)v47;
    v42(v47, (uint64_t)v19, a5);
    sub_24C8F25B4(v26, v27, v22, a5, v44);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v19, a5);
    uint64_t v28 = (uint64_t)v43;
    uint64_t v29 = v43;
    uint64_t v30 = v48;
    uint64_t v31 = v51(v21);
    if (!v30)
    {
      uint64_t v29 = (uint64_t *)v31;
      if ((v31 & 0x10000) != 0)
      {
        uint64_t v51 = a10;
        uint64_t v48 = a9;
        uint64_t v36 = sub_24C8F7F50();
        swift_allocError();
        uint64_t v38 = v37;
        uint64_t v47 = (char *)v37 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640) + 48);
        *uint64_t v38 = v41;
        uint64_t v49 = 0;
        unint64_t v50 = 0xE000000000000000;
        swift_bridgeObjectRetain();
        uint64_t v29 = &v49;
        sub_24C8F7F00();
        swift_bridgeObjectRelease();
        sub_24C8F7F40();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v36 - 8) + 104))(v38, *MEMORY[0x263F8DCC0], v36);
        swift_willThrow();
      }
    }
    sub_24C8F14A4(v28);
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v32 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v34 = v33;
    uint64_t v51 = (uint64_t (*)(xpc_object_t))((char *)v33
                                               + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697F9710)
                                                        + 48));
    v34[3] = a5;
    v34[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v34);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v15 + 16))(boxed_opaque_existential_1, a1, a5);
    swift_beginAccess();
    uint64_t v49 = 0;
    unint64_t v50 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    uint64_t v29 = &v49;
    sub_24C8F7F00();
    sub_24C8F7CF0();
    sub_24C8F8370();
    sub_24C8F7CF0();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v32 - 8) + 104))(v34, *MEMORY[0x263F8DCA8], v32);
    swift_willThrow();
  }
  return v29;
}

uint64_t *sub_24C8EEF78(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(xpc_object_t), uint64_t a8, uint64_t a9, uint64_t (*a10)(xpc_object_t))
{
  uint64_t v41 = a8;
  uint64_t v51 = a7;
  uint64_t v46 = a4;
  uint64_t v15 = *(void *)(a5 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](a1);
  uint64_t v47 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v40 - v18;
  sub_24C8F8600();
  uint64_t v20 = sub_24C8F7CC0();
  swift_bridgeObjectRelease();
  uint64_t v45 = a3;
  xpc_object_t v21 = xpc_dictionary_get_value(a3, (const char *)(v20 + 32));
  swift_release();
  if (v21)
  {
    uint64_t v44 = a6;
    uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    v42(v19, a1, a5);
    uint64_t v22 = a2 + 2;
    swift_beginAccess();
    unint64_t v23 = (void *)a2[2];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v43 = a2;
    a2[2] = (uint64_t)v23;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v23 = sub_24C8F2368(0, v23[2] + 1, 1, v23);
      *uint64_t v22 = (uint64_t)v23;
    }
    unint64_t v26 = v23[2];
    unint64_t v25 = v23[3];
    if (v26 >= v25 >> 1) {
      *uint64_t v22 = (uint64_t)sub_24C8F2368((void *)(v25 > 1), v26 + 1, 1, v23);
    }
    uint64_t v27 = (uint64_t)v47;
    v42(v47, (uint64_t)v19, a5);
    sub_24C8F25B4(v26, v27, v22, a5, v44);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v19, a5);
    uint64_t v28 = (uint64_t)v43;
    uint64_t v29 = v43;
    uint64_t v30 = v48;
    uint64_t v31 = v51(v21);
    if (!v30)
    {
      uint64_t v29 = (uint64_t *)v31;
      if ((v31 & 0x100000000) != 0)
      {
        uint64_t v51 = a10;
        uint64_t v48 = a9;
        uint64_t v36 = sub_24C8F7F50();
        swift_allocError();
        uint64_t v38 = v37;
        uint64_t v47 = (char *)v37 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640) + 48);
        *uint64_t v38 = v41;
        uint64_t v49 = 0;
        unint64_t v50 = 0xE000000000000000;
        swift_bridgeObjectRetain();
        uint64_t v29 = &v49;
        sub_24C8F7F00();
        swift_bridgeObjectRelease();
        sub_24C8F7F40();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v36 - 8) + 104))(v38, *MEMORY[0x263F8DCC0], v36);
        swift_willThrow();
      }
    }
    sub_24C8F14A4(v28);
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v32 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v34 = v33;
    uint64_t v51 = (uint64_t (*)(xpc_object_t))((char *)v33
                                               + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697F9710)
                                                        + 48));
    v34[3] = a5;
    v34[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v34);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v15 + 16))(boxed_opaque_existential_1, a1, a5);
    swift_beginAccess();
    uint64_t v49 = 0;
    unint64_t v50 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    uint64_t v29 = &v49;
    sub_24C8F7F00();
    sub_24C8F7CF0();
    sub_24C8F8370();
    sub_24C8F7CF0();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v32 - 8) + 104))(v34, *MEMORY[0x263F8DCA8], v32);
    swift_willThrow();
  }
  return v29;
}

uint64_t *sub_24C8EF440(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v44 = a4;
  uint64_t v10 = *(void *)(a5 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v40 - v15;
  uint64_t v49 = (uint64_t *)v14;
  sub_24C8F8600();
  uint64_t v17 = sub_24C8F7CC0();
  swift_bridgeObjectRelease();
  uint64_t v43 = a3;
  uint64_t v18 = xpc_dictionary_get_value(a3, (const char *)(v17 + 32));
  swift_release();
  uint64_t v46 = v18;
  if (!v18)
  {
    uint64_t v32 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v34 = v33;
    uint64_t v46 = (char *)v33 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697F9710) + 48);
    v34[3] = a5;
    v34[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v34);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v10 + 16))(boxed_opaque_existential_1, v49, a5);
    swift_beginAccess();
    uint64_t v47 = 0;
    unint64_t v48 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    uint64_t v29 = &v47;
    sub_24C8F7F00();
    sub_24C8F7CF0();
    sub_24C8F8370();
    sub_24C8F7CF0();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v32 - 8) + 104))(v34, *MEMORY[0x263F8DCA8], v32);
    swift_willThrow();
    return v29;
  }
  uint64_t v41 = a5;
  uint64_t v42 = a6;
  uint64_t v19 = *(void (**)(char *, uint64_t *, uint64_t))(v10 + 16);
  v19(v16, v49, a5);
  uint64_t v20 = a2 + 2;
  swift_beginAccess();
  xpc_object_t v21 = (void *)a2[2];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v49 = a2;
  a2[2] = (uint64_t)v21;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    xpc_object_t v21 = sub_24C8F2368(0, v21[2] + 1, 1, v21);
    *uint64_t v20 = (uint64_t)v21;
  }
  unint64_t v24 = v21[2];
  unint64_t v23 = v21[3];
  if (v24 >= v23 >> 1) {
    *uint64_t v20 = (uint64_t)sub_24C8F2368((void *)(v23 > 1), v24 + 1, 1, v21);
  }
  uint64_t v25 = v41;
  v19(v13, (uint64_t *)v16, v41);
  sub_24C8F25B4(v24, (uint64_t)v13, v20, v25, v42);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v25);
  uint64_t v26 = MEMORY[0x263F8E970];
  uint64_t v27 = v45;
  uint64_t v28 = (uint64_t)v49;
  uint64_t v29 = v49;
  uint64_t v30 = sub_24C8F3198(v46, 0x3436746E4955, 0xE600000000000000, MEMORY[0x263F8E970]);
  if (v27)
  {
LABEL_11:
    sub_24C8F14A4(v28);
    swift_unknownObjectRelease();
    return v29;
  }
  if (v31)
  {
    uint64_t v36 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v38 = v37;
    uint64_t v45 = (char *)v37 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640) + 48);
    *uint64_t v38 = v26;
    uint64_t v47 = 0;
    unint64_t v48 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    uint64_t v29 = &v47;
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v36 - 8) + 104))(v38, *MEMORY[0x263F8DCC0], v36);
    swift_willThrow();
    goto LABEL_11;
  }
  uint64_t v29 = (uint64_t *)v30;
  sub_24C8F14A4(v28);
  swift_unknownObjectRelease();
  return v29;
}

float sub_24C8EF90C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v46 = a4;
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v43 - v16;
  uint64_t v49 = v15;
  sub_24C8F8600();
  uint64_t v18 = sub_24C8F7CC0();
  swift_bridgeObjectRelease();
  uint64_t v45 = a3;
  uint64_t v19 = xpc_dictionary_get_value(a3, (const char *)(v18 + 32));
  swift_release();
  uint64_t v47 = v19;
  if (v19)
  {
    uint64_t v43 = a5;
    uint64_t v44 = a6;
    uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    v20(v17, v49, a5);
    xpc_object_t v21 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    uint64_t v22 = *(void **)(a2 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v49 = a2;
    *(void *)(a2 + 16) = v22;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v22 = sub_24C8F2368(0, v22[2] + 1, 1, v22);
      *xpc_object_t v21 = (uint64_t)v22;
    }
    unint64_t v25 = v22[2];
    unint64_t v24 = v22[3];
    uint64_t v26 = v43;
    if (v25 >= v24 >> 1) {
      *xpc_object_t v21 = (uint64_t)sub_24C8F2368((void *)(v24 > 1), v25 + 1, 1, v22);
    }
    v20(v14, (uint64_t)v17, v26);
    sub_24C8F25B4(v25, (uint64_t)v14, v21, v26, v44);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v17, v26);
    uint64_t v27 = v47;
    uint64_t v28 = MEMORY[0x2533006D0](v47);
    if (v28 == sub_24C8F7B30())
    {
      uint64_t v38 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v40 = v39;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
      *uint64_t v40 = MEMORY[0x263F8D5C8];
      uint64_t v41 = v49;
      uint64_t v50 = 0;
      unint64_t v51 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      sub_24C8F7F40();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v38 - 8) + 104))(v40, *MEMORY[0x263F8DCC0], v38);
      swift_willThrow();
      sub_24C8F14A4(v41);
    }
    else
    {
      uint64_t v29 = MEMORY[0x2533006D0](v27);
      uint64_t v30 = sub_24C8F7B70();
      uint64_t v31 = v49;
      if (v29 == v30)
      {
        float value = xpc_double_get_value(v27);
        sub_24C8F14A4(v31);
        swift_unknownObjectRelease();
        return value;
      }
      sub_24C8F7F50();
      swift_allocError();
      uint64_t v33 = v32;
      swift_bridgeObjectRetain();
      sub_24C8E86AC(MEMORY[0x263F8D5C8], (uint64_t)v27, v33);
      swift_bridgeObjectRelease();
      swift_willThrow();
      sub_24C8F14A4(v31);
    }
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v34 = sub_24C8F7F50();
    uint64_t v48 = swift_allocError();
    uint64_t v36 = v35;
    uint64_t v47 = (char *)v35 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697F9710) + 48);
    v36[3] = a5;
    v36[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v36);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v11 + 16))(boxed_opaque_existential_1, v49, a5);
    swift_beginAccess();
    uint64_t v50 = 0;
    unint64_t v51 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    sub_24C8F7CF0();
    sub_24C8F8370();
    sub_24C8F7CF0();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v34 - 8) + 104))(v36, *MEMORY[0x263F8DCA8], v34);
    swift_willThrow();
  }
  return value;
}

double sub_24C8EFE64(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v46 = a4;
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v43 - v16;
  uint64_t v49 = v15;
  sub_24C8F8600();
  uint64_t v18 = sub_24C8F7CC0();
  swift_bridgeObjectRelease();
  uint64_t v45 = a3;
  uint64_t v19 = xpc_dictionary_get_value(a3, (const char *)(v18 + 32));
  swift_release();
  uint64_t v47 = v19;
  if (v19)
  {
    uint64_t v43 = a5;
    uint64_t v44 = a6;
    uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    v20(v17, v49, a5);
    xpc_object_t v21 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    uint64_t v22 = *(void **)(a2 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v49 = a2;
    *(void *)(a2 + 16) = v22;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v22 = sub_24C8F2368(0, v22[2] + 1, 1, v22);
      *xpc_object_t v21 = (uint64_t)v22;
    }
    unint64_t v25 = v22[2];
    unint64_t v24 = v22[3];
    uint64_t v26 = v43;
    if (v25 >= v24 >> 1) {
      *xpc_object_t v21 = (uint64_t)sub_24C8F2368((void *)(v24 > 1), v25 + 1, 1, v22);
    }
    v20(v14, (uint64_t)v17, v26);
    sub_24C8F25B4(v25, (uint64_t)v14, v21, v26, v44);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v17, v26);
    uint64_t v27 = v47;
    uint64_t v28 = MEMORY[0x2533006D0](v47);
    if (v28 == sub_24C8F7B30())
    {
      uint64_t v38 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v40 = v39;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
      *uint64_t v40 = MEMORY[0x263F8D538];
      uint64_t v41 = v49;
      uint64_t v50 = 0;
      unint64_t v51 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      sub_24C8F7F40();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v38 - 8) + 104))(v40, *MEMORY[0x263F8DCC0], v38);
      swift_willThrow();
      sub_24C8F14A4(v41);
    }
    else
    {
      uint64_t v29 = MEMORY[0x2533006D0](v27);
      uint64_t v30 = sub_24C8F7B70();
      uint64_t v31 = v49;
      if (v29 == v30)
      {
        double value = xpc_double_get_value(v27);
        sub_24C8F14A4(v31);
        swift_unknownObjectRelease();
        return value;
      }
      sub_24C8F7F50();
      swift_allocError();
      uint64_t v33 = v32;
      swift_bridgeObjectRetain();
      sub_24C8E86AC(MEMORY[0x263F8D538], (uint64_t)v27, v33);
      swift_bridgeObjectRelease();
      swift_willThrow();
      sub_24C8F14A4(v31);
    }
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v34 = sub_24C8F7F50();
    uint64_t v48 = swift_allocError();
    uint64_t v36 = v35;
    uint64_t v47 = (char *)v35 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697F9710) + 48);
    v36[3] = a5;
    v36[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v36);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v11 + 16))(boxed_opaque_existential_1, v49, a5);
    swift_beginAccess();
    uint64_t v50 = 0;
    unint64_t v51 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    sub_24C8F7CF0();
    sub_24C8F8370();
    sub_24C8F7CF0();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v34 - 8) + 104))(v36, *MEMORY[0x263F8DCA8], v34);
    swift_willThrow();
  }
  return value;
}

uint64_t *sub_24C8F03BC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v44 = a4;
  uint64_t v10 = *(void *)(a5 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v40 - v15;
  uint64_t v49 = v14;
  sub_24C8F8600();
  uint64_t v17 = sub_24C8F7CC0();
  swift_bridgeObjectRelease();
  uint64_t v43 = a3;
  xpc_object_t v18 = xpc_dictionary_get_value(a3, (const char *)(v17 + 32));
  swift_release();
  uint64_t v46 = (uint64_t)v18;
  if (v18)
  {
    uint64_t v41 = a5;
    uint64_t v42 = a6;
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    v19(v16, v49, a5);
    uint64_t v20 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    xpc_object_t v21 = *(void **)(a2 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v49 = a2;
    *(void *)(a2 + 16) = v21;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      xpc_object_t v21 = sub_24C8F2368(0, v21[2] + 1, 1, v21);
      *uint64_t v20 = (uint64_t)v21;
    }
    unint64_t v24 = v21[2];
    unint64_t v23 = v21[3];
    uint64_t v25 = v41;
    if (v24 >= v23 >> 1) {
      *uint64_t v20 = (uint64_t)sub_24C8F2368((void *)(v23 > 1), v24 + 1, 1, v21);
    }
    v19(v13, (uint64_t)v16, v25);
    sub_24C8F25B4(v24, (uint64_t)v13, v20, v25, v42);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v25);
    uint64_t v26 = (void *)v46;
    uint64_t v27 = MEMORY[0x2533006D0](v46);
    uint64_t v28 = sub_24C8F7B30();
    uint64_t v29 = v49;
    if (v27 == v28) {
      goto LABEL_12;
    }
    uint64_t v30 = MEMORY[0x2533006D0](v26);
    if (v30 != sub_24C8F7B80())
    {
      sub_24C8F7F50();
      swift_allocError();
      uint64_t v32 = v31;
      swift_bridgeObjectRetain();
      sub_24C8E86AC(MEMORY[0x263F8D310], (uint64_t)v26, v32);
      swift_bridgeObjectRelease();
      swift_willThrow();
      sub_24C8F14A4(v29);
LABEL_13:
      swift_unknownObjectRelease();
      return v20;
    }
    if (!xpc_string_get_string_ptr(v26))
    {
LABEL_12:
      uint64_t v36 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v38 = v37;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
      *uint64_t v38 = MEMORY[0x263F8D310];
      uint64_t v47 = 0;
      unint64_t v48 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      uint64_t v20 = &v47;
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      sub_24C8F7F40();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v36 - 8) + 104))(v38, *MEMORY[0x263F8DCC0], v36);
      swift_willThrow();
      sub_24C8F14A4(v29);
      goto LABEL_13;
    }
    uint64_t v20 = (uint64_t *)sub_24C8F7D00();
    sub_24C8F14A4(v29);
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v46 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v34 = v33;
    uint64_t v45 = (char *)v33 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697F9710) + 48);
    v34[3] = a5;
    v34[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v34);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v10 + 16))(boxed_opaque_existential_1, v49, a5);
    swift_beginAccess();
    uint64_t v47 = 0;
    unint64_t v48 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    uint64_t v20 = &v47;
    sub_24C8F7F00();
    sub_24C8F7CF0();
    sub_24C8F8370();
    sub_24C8F7CF0();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void))(*(void *)(v46 - 8) + 104))(v34, *MEMORY[0x263F8DCA8]);
    swift_willThrow();
  }
  return v20;
}

uint64_t sub_24C8F090C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v57 = a5;
  uint64_t v51 = a9;
  uint64_t v52 = a1;
  uint64_t v16 = sub_24C8F7E50();
  uint64_t v49 = *(void *)(v16 - 8);
  uint64_t v50 = v16;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v60 = (uint64_t)&v49 - v18;
  uint64_t v19 = *(void *)(a6 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v58 = (char *)&v49 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  unint64_t v23 = (char *)&v49 - v22;
  uint64_t v64 = a2;
  uint64_t v24 = a8;
  sub_24C8F8600();
  uint64_t v25 = sub_24C8F7CC0();
  swift_bridgeObjectRelease();
  uint64_t v56 = a4;
  uint64_t v26 = xpc_dictionary_get_value(a4, (const char *)(v25 + 32));
  swift_release();
  uint64_t v61 = v26;
  if (!v26)
  {
    uint64_t v40 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v42 = v41;
    uint64_t v61 = (char *)v41 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697F9710) + 48);
    uint64_t v42[3] = a6;
    v42[4] = v24;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v42);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v19 + 16))(boxed_opaque_existential_1, v64, a6);
    swift_beginAccess();
    uint64_t v62 = 0;
    unint64_t v63 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    sub_24C8F7CF0();
    sub_24C8F8370();
    sub_24C8F7CF0();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v40 - 8) + 104))(v42, *MEMORY[0x263F8DCA8], v40);
    return swift_willThrow();
  }
  uint64_t v53 = a7;
  uint64_t v54 = a6;
  uint64_t v55 = v24;
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v27(v23, v64, a6);
  uint64_t v28 = (uint64_t *)(a3 + 16);
  swift_beginAccess();
  uint64_t v29 = *(void **)(a3 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v64 = a3;
  *(void *)(a3 + 16) = v29;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v29 = sub_24C8F2368(0, v29[2] + 1, 1, v29);
    *uint64_t v28 = (uint64_t)v29;
  }
  unint64_t v32 = v29[2];
  unint64_t v31 = v29[3];
  if (v32 >= v31 >> 1) {
    *uint64_t v28 = (uint64_t)sub_24C8F2368((void *)(v31 > 1), v32 + 1, 1, v29);
  }
  uint64_t v33 = (uint64_t)v58;
  uint64_t v34 = v54;
  v27(v58, (uint64_t)v23, v54);
  sub_24C8F25B4(v32, v33, v28, v34, v55);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v23, v34);
  uint64_t v35 = v60;
  uint64_t v36 = v53;
  uint64_t v37 = v64;
  uint64_t v38 = v59;
  sub_24C8E8C7C(v61, v53, v53, a10, v60);
  if (v38)
  {
    uint64_t v39 = v37;
LABEL_12:
    sub_24C8F14A4(v39);
    return swift_unknownObjectRelease();
  }
  uint64_t v45 = *(void *)(v36 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v35, 1, v36) != 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 32))(v51, v35, v36);
    uint64_t v39 = v37;
    goto LABEL_12;
  }
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v35, v50);
  uint64_t v46 = sub_24C8F7F50();
  swift_allocError();
  unint64_t v48 = v47;
  uint64_t v59 = (char *)v47 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640) + 48);
  uint64_t v60 = a10;
  *unint64_t v48 = v52;
  uint64_t v62 = 0;
  unint64_t v63 = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_24C8F7F00();
  swift_bridgeObjectRelease();
  uint64_t v62 = 0x6465746365707845;
  unint64_t v63 = 0xE900000000000020;
  sub_24C8F8640();
  sub_24C8F7CF0();
  swift_bridgeObjectRelease();
  sub_24C8F7CF0();
  sub_24C8F7F40();
  (*(void (**)(void *, void, uint64_t))(*(void *)(v46 - 8) + 104))(v48, *MEMORY[0x263F8DCC0], v46);
  swift_willThrow();
  sub_24C8F14A4(v37);
  return swift_unknownObjectRelease();
}

uint64_t sub_24C8F0F6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, void *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  uint64_t v47 = a8;
  uint64_t v51 = a6;
  uint64_t v53 = a4;
  xpc_object_t v58 = a3;
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v46 - v15;
  uint64_t v17 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v52 = v18;
  uint64_t v54 = v19;
  uint64_t v20 = v17;
  ((void (*)(char *))v17)((char *)v46 - v15);
  uint64_t v21 = (uint64_t *)(a2 + 16);
  swift_beginAccess();
  uint64_t v22 = *(void **)(a2 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v50 = a2;
  *(void *)(a2 + 16) = v22;
  uint64_t v24 = a7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v22 = sub_24C8F2368(0, v22[2] + 1, 1, v22);
    *uint64_t v21 = (uint64_t)v22;
  }
  uint64_t v49 = a9;
  unint64_t v26 = v22[2];
  unint64_t v25 = v22[3];
  uint64_t v27 = v20;
  if (v26 >= v25 >> 1)
  {
    uint64_t v45 = sub_24C8F2368((void *)(v25 > 1), v26 + 1, 1, v22);
    uint64_t v27 = v20;
    *uint64_t v21 = (uint64_t)v45;
  }
  uint64_t v28 = v54;
  uint64_t v29 = v27;
  v27((uint64_t *)v14, (uint64_t)v16, v54);
  uint64_t v30 = (uint64_t)v14;
  uint64_t v31 = v28;
  sub_24C8F25B4(v26, v30, v21, v28, v24);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v28);
  uint64_t v32 = v52;
  sub_24C8F8600();
  uint64_t v33 = sub_24C8F7CC0();
  swift_bridgeObjectRelease();
  xpc_object_t v34 = xpc_dictionary_get_value(v58, (const char *)(v33 + 32));
  swift_release();
  if (!v34)
  {
    uint64_t v47 = sub_24C8F7F50();
    uint64_t v48 = swift_allocError();
    uint64_t v39 = v38;
    v46[1] = (char *)v38 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697F9710) + 48);
    v39[3] = v31;
    v39[4] = v24;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v39);
    v29(boxed_opaque_existential_1, v32, v31);
    uint64_t v55 = 0;
    unint64_t v56 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    sub_24C8F7CF0();
    sub_24C8F80E0();
    sub_24C8F8640();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    sub_24C8F7CF0();
    sub_24C8F8370();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void))(*(void *)(v47 - 8) + 104))(v39, *MEMORY[0x263F8DCA8]);
    swift_willThrow();
    return sub_24C8F14A4(v50);
  }
  uint64_t v35 = MEMORY[0x2533006D0](v34);
  if (v35 != sub_24C8F7BA0())
  {
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9670);
    sub_24C8F7F50();
    swift_allocError();
    sub_24C8E86AC(v36, (uint64_t)v34, v37);
    swift_willThrow();
    swift_unknownObjectRelease();
    return sub_24C8F14A4(v50);
  }
  uint64_t v42 = v50;
  swift_retain();
  swift_unknownObjectRetain();
  uint64_t v55 = sub_24C8E8834(v42, (uint64_t)v34);
  unint64_t v56 = v43;
  uint64_t v57 = v44;
  type metadata accessor for _XPCKeyedDecodingContainer();
  uint64_t v52 = v24;
  swift_retain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_24C8F80F0();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return sub_24C8F14A4(v42);
}

uint64_t sub_24C8F14A4(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 16);
  swift_beginAccess();
  uint64_t v3 = *(void **)(a1 + 16);
  if (!v3[2])
  {
    __break(1u);
LABEL_6:
    uint64_t result = (uint64_t)sub_24C8F25A0(v3);
    uint64_t v3 = (void *)result;
    uint64_t v5 = *(void *)(result + 16);
    if (v5) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v5 = v3[2];
  if (v5)
  {
LABEL_4:
    uint64_t v6 = v5 - 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v3[5 * v5 - 1]);
    v3[2] = v6;
    *uint64_t v2 = v3;
    return swift_endAccess();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_24C8F154C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  uint64_t v54 = a4;
  xpc_object_t v51 = a3;
  uint64_t v45 = a7;
  uint64_t v9 = *(void *)(a5 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v45 - v13;
  uint64_t v15 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v48 = v17;
  uint64_t v49 = v16;
  uint64_t v18 = v15;
  ((void (*)(char *))v15)((char *)&v45 - v13);
  uint64_t v19 = (uint64_t *)(a2 + 16);
  swift_beginAccess();
  uint64_t v20 = *(void **)(a2 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v50 = a2;
  *(void *)(a2 + 16) = v20;
  uint64_t v22 = a6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v20 = sub_24C8F2368(0, v20[2] + 1, 1, v20);
    *uint64_t v19 = (uint64_t)v20;
  }
  unint64_t v24 = v20[2];
  unint64_t v23 = v20[3];
  unint64_t v25 = v18;
  if (v24 >= v23 >> 1)
  {
    uint64_t v44 = sub_24C8F2368((void *)(v23 > 1), v24 + 1, 1, v20);
    unint64_t v25 = v18;
    *uint64_t v19 = (uint64_t)v44;
  }
  uint64_t v26 = v48;
  uint64_t v46 = v25;
  v25((uint64_t *)v12, (uint64_t)v14, v48);
  sub_24C8F25B4(v24, (uint64_t)v12, v19, v26, v22);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v26);
  uint64_t v27 = v49;
  sub_24C8F8600();
  uint64_t v28 = sub_24C8F7CC0();
  swift_bridgeObjectRelease();
  xpc_object_t v29 = xpc_dictionary_get_value(v51, (const char *)(v28 + 32));
  swift_release();
  if (!v29)
  {
    uint64_t v33 = sub_24C8F7F50();
    uint64_t v47 = swift_allocError();
    uint64_t v35 = v34;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697F9710);
    v35[3] = v26;
    v35[4] = v22;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v35);
    v46(boxed_opaque_existential_1, v27, v26);
    uint64_t v52 = 0;
    unint64_t v53 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    sub_24C8F7CF0();
    sub_24C8F8370();
    sub_24C8F7CF0();
    sub_24C8F7F40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v33 - 8) + 104))(v35, *MEMORY[0x263F8DCA8], v33);
    swift_willThrow();
    return sub_24C8F14A4(v50);
  }
  uint64_t v30 = MEMORY[0x2533006D0](v29);
  if (v30 != sub_24C8F7B50())
  {
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9658);
    sub_24C8F7F50();
    swift_allocError();
    sub_24C8E86AC(v31, (uint64_t)v29, v32);
    swift_willThrow();
    swift_unknownObjectRelease();
    return sub_24C8F14A4(v50);
  }
  uint64_t v38 = v50;
  swift_retain();
  uint64_t v39 = swift_unknownObjectRetain();
  uint64_t v40 = MEMORY[0x2533006D0](v39);
  if (v40 == sub_24C8F7B50())
  {
    uint64_t v41 = *(void *)(v38 + 16);
    uint64_t v42 = v45;
    v45[3] = &type metadata for _XPCUnkeyedDecodingContainer;
    v42[4] = sub_24C8F3E7C();
    unint64_t v43 = (void *)swift_allocObject();
    *uint64_t v42 = v43;
    swift_bridgeObjectRetain();
    swift_unknownObjectRelease();
    v43[2] = v38;
    v43[3] = v29;
    v43[4] = v41;
    v43[5] = 0;
    return sub_24C8F14A4(v38);
  }
  else
  {
    uint64_t result = sub_24C8F8010();
    __break(1u);
  }
  return result;
}

void sub_24C8F1A28()
{
}

void sub_24C8F1A74()
{
}

uint64_t sub_24C8F1AC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8ECCD4(a1, *(void **)(v3 + 8), a3, *(void *)(a1 + 16), *(void *)(a1 + 24));
}

BOOL sub_24C8F1ACC(uint64_t a1, uint64_t a2)
{
  return sub_24C8ECF98(a1, a2, *(void **)(v2 + 8));
}

BOOL sub_24C8F1AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24C8ED018(a1, *(void *)v4, *(void **)(v4 + 8), a4, *(void *)(a2 + 16), *(void *)(a2 + 24));
}

uint64_t sub_24C8F1B00(uint64_t a1, uint64_t a2)
{
  return sub_24C8ED23C(a1, *(void *)v2, *(void **)(v2 + 8), *(void *)(v2 + 16), *(void *)(a2 + 16), *(void *)(a2 + 24)) & 1;
}

uint64_t *sub_24C8F1B2C(uint64_t a1, uint64_t a2)
{
  return sub_24C8F03BC(a1, *(void *)v2, *(void **)(v2 + 8), *(void *)(v2 + 16), *(void *)(a2 + 16), *(void *)(a2 + 24));
}

double sub_24C8F1B54(uint64_t a1, uint64_t a2)
{
  return sub_24C8EFE64(a1, *(void *)v2, *(void **)(v2 + 8), *(void *)(v2 + 16), *(void *)(a2 + 16), *(void *)(a2 + 24));
}

float sub_24C8F1B7C(uint64_t a1, uint64_t a2)
{
  return sub_24C8EF90C(a1, *(void *)v2, *(void **)(v2 + 8), *(void *)(v2 + 16), *(void *)(a2 + 16), *(void *)(a2 + 24));
}

uint64_t sub_24C8F1BA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F1CE0(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24C8ED78C);
}

uint64_t *sub_24C8F1BD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F1DA0(a1, a2, a3, sub_24C8F27D8, MEMORY[0x263F8E498], 0xD00000000000002BLL, (uint64_t (*)(xpc_object_t))0x800000024C8FD660);
}

uint64_t *sub_24C8F1C1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F1E30(a1, a2, a3, sub_24C8F2A40, MEMORY[0x263F8E4F0], 0xD00000000000002CLL, (uint64_t (*)(xpc_object_t))0x800000024C8FD630);
}

uint64_t *sub_24C8F1C68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F1EC0(a1, a2, a3, (uint64_t (*)(xpc_object_t))sub_24C8F2CAC, MEMORY[0x263F8E548], 0xD00000000000002CLL, (uint64_t (*)(xpc_object_t))0x800000024C8FD600);
}

uint64_t sub_24C8F1CB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F1CE0(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24C8EDC54);
}

uint64_t sub_24C8F1CE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void, void, void, void, void))
{
  return a4(a1, *v4, v4[1], v4[2], *(void *)(a2 + 16), *(void *)(a2 + 24));
}

uint64_t sub_24C8F1D10()
{
  return sub_24C8F8450();
}

uint64_t sub_24C8F1D28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F1CE0(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24C8EE120);
}

uint64_t *sub_24C8F1D54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F1DA0(a1, a2, a3, sub_24C8F3410, MEMORY[0x263F8E778], 0xD00000000000002CLL, (uint64_t (*)(xpc_object_t))0x800000024C8FD570);
}

uint64_t *sub_24C8F1DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(xpc_object_t), uint64_t a5, uint64_t a6, uint64_t (*a7)(xpc_object_t))
{
  return sub_24C8EE5E8(a1, *(uint64_t **)v7, *(void **)(v7 + 8), *(void *)(v7 + 16), *(void *)(a2 + 16), *(void *)(a2 + 24), a4, a5, a6, a7);
}

uint64_t *sub_24C8F1DE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F1E30(a1, a2, a3, sub_24C8F367C, MEMORY[0x263F8E888], 0xD00000000000002DLL, (uint64_t (*)(xpc_object_t))0x800000024C8FD540);
}

uint64_t *sub_24C8F1E30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(xpc_object_t), uint64_t a5, uint64_t a6, uint64_t (*a7)(xpc_object_t))
{
  return sub_24C8EEAB0(a1, *(uint64_t **)v7, *(void **)(v7 + 8), *(void *)(v7 + 16), *(void *)(a2 + 16), *(void *)(a2 + 24), a4, a5, a6, a7);
}

uint64_t *sub_24C8F1E74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F1EC0(a1, a2, a3, (uint64_t (*)(xpc_object_t))sub_24C8F38E8, MEMORY[0x263F8E8F8], 0xD00000000000002DLL, (uint64_t (*)(xpc_object_t))0x800000024C8FD510);
}

uint64_t *sub_24C8F1EC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(xpc_object_t), uint64_t a5, uint64_t a6, uint64_t (*a7)(xpc_object_t))
{
  return sub_24C8EEF78(a1, *(uint64_t **)v7, *(void **)(v7 + 8), *(void *)(v7 + 16), *(void *)(a2 + 16), *(void *)(a2 + 24), a4, a5, a6, a7);
}

uint64_t sub_24C8F1F04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F1CE0(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24C8EF440);
}

uint64_t sub_24C8F1F30()
{
  return sub_24C8F8460();
}

uint64_t sub_24C8F1F48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return sub_24C8F090C(a1, a2, *(void *)v6, *(void **)(v6 + 8), *(void *)(v6 + 16), *(void *)(a5 + 16), a3, *(void *)(a5 + 24), a6, a4);
}

uint64_t sub_24C8F1F84()
{
  return sub_24C8F83E0();
}

uint64_t sub_24C8F1F9C()
{
  return sub_24C8F83D0();
}

uint64_t sub_24C8F1FB4()
{
  uint64_t result = sub_24C8F83F0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_24C8F1FD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F2204(a1, a2, a3, MEMORY[0x263F8E340]);
}

uint64_t sub_24C8F2004()
{
  uint64_t result = sub_24C8F8400();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_24C8F2028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F214C(a1, a2, a3, MEMORY[0x263F8E358]);
}

uint64_t sub_24C8F2054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F21A8(a1, a2, a3, MEMORY[0x263F8E360]);
}

uint64_t sub_24C8F2080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F2204(a1, a2, a3, MEMORY[0x263F8E368]);
}

uint64_t sub_24C8F20AC()
{
  uint64_t result = sub_24C8F8430();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_24C8F20D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F228C(a1, a2, a3, MEMORY[0x263F8E380]);
}

uint64_t sub_24C8F20FC()
{
  uint64_t result = sub_24C8F8410();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_24C8F2120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F214C(a1, a2, a3, MEMORY[0x263F8E378]);
}

uint64_t sub_24C8F214C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FF;
}

uint64_t sub_24C8F217C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F21A8(a1, a2, a3, MEMORY[0x263F8E388]);
}

uint64_t sub_24C8F21A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FFFF;
}

uint64_t sub_24C8F21D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F2204(a1, a2, a3, MEMORY[0x263F8E390]);
}

uint64_t sub_24C8F2204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v4 = a4();
  return v4 | ((HIDWORD(v4) & 1) << 32);
}

uint64_t sub_24C8F223C()
{
  uint64_t result = sub_24C8F8440();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_24C8F2260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C8F228C(a1, a2, a3, MEMORY[0x263F8E3A0]);
}

uint64_t sub_24C8F228C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t result = a4();
  if (v4) {
    return v6;
  }
  return result;
}

uint64_t sub_24C8F22B8()
{
  return sub_24C8F8420();
}

uint64_t sub_24C8F22E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_24C8F0F6C(a1, *(void *)v5, *(void **)(v5 + 8), *(void *)(v5 + 16), *(void *)(a4 + 16), a2, *(void *)(a4 + 24), a5, a3);
}

uint64_t sub_24C8F2320@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_24C8F154C(a1, *(void *)v3, *(void **)(v3 + 8), *(void *)(v3 + 16), *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

void sub_24C8F2348()
{
}

void sub_24C8F2358()
{
}

void *sub_24C8F2368(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    void v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9700);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_24C8F24A0(void *result)
{
  uint64_t v2 = result[2];
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  unint64_t v6 = result;
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= v3[3] >> 1)
  {
    if (v6[2]) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  uint64_t result = sub_24C8F2368(result, v10, 1, v3);
  uint64_t v3 = result;
  if (!v6[2])
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9700);
  uint64_t result = (void *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = (void *)swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v7 = v3[2];
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    v3[2] = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

void *sub_24C8F25A0(void *a1)
{
  return sub_24C8F2368(0, a1[2], 0, a1);
}

uint64_t sub_24C8F25B4(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_24C8E8100(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_24C8F264C(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x2533006D0]();
  if (v2 == sub_24C8F7B30()) {
    return 0x76206C6C756E2061;
  }
  uint64_t v3 = 0x7265626D756E2061;
  uint64_t v4 = MEMORY[0x2533006D0](a1);
  if (v4 != sub_24C8F7B60())
  {
    uint64_t v5 = MEMORY[0x2533006D0](a1);
    if (v5 != sub_24C8F7B90())
    {
      uint64_t v6 = MEMORY[0x2533006D0](a1);
      if (v6 == sub_24C8F7B80())
      {
        return 0x676E697274732061;
      }
      else
      {
        uint64_t v7 = MEMORY[0x2533006D0](a1);
        if (v7 == sub_24C8F7B50())
        {
          return 0x7961727261206E61;
        }
        else
        {
          uint64_t v8 = MEMORY[0x2533006D0](a1);
          if (v8 == sub_24C8F7BA0())
          {
            return 0x6F69746369642061;
          }
          else
          {
            uint64_t v9 = MEMORY[0x2533006D0](a1);
            if (v9 == sub_24C8F7B40())
            {
              return 0x646975752061;
            }
            else
            {
              uint64_t v10 = (const _xpc_type_s *)MEMORY[0x2533006D0](a1);
              xpc_type_get_name(v10);
              return sub_24C8F7D00();
            }
          }
        }
      }
    }
  }
  return v3;
}

uint64_t sub_24C8F27D8(void *a1)
{
  uint64_t v2 = MEMORY[0x2533006D0]();
  uint64_t v3 = sub_24C8F7B30();
  if (v2 == v3)
  {
    unsigned __int8 value = 0;
    return value | ((v2 == v3) << 8);
  }
  uint64_t v4 = MEMORY[0x2533006D0](a1);
  if (v4 == sub_24C8F7B60())
  {
    unsigned __int8 value = xpc_int64_get_value(a1);
    if (xpc_int64_get_value(a1) != (char)value)
    {
      uint64_t v9 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v11 = v10;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      xpc_int64_get_value(a1);
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      sub_24C8F7CF0();
      sub_24C8F7CF0();
      sub_24C8F7CF0();
      sub_24C8F7F40();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v9 - 8) + 104))(v11, *MEMORY[0x263F8DCB8], v9);
      return swift_willThrow();
    }
    return value | ((v2 == v3) << 8);
  }
  swift_beginAccess();
  sub_24C8F7F50();
  swift_allocError();
  uint64_t v6 = v5;
  swift_bridgeObjectRetain();
  sub_24C8E86AC(MEMORY[0x263F8E498], (uint64_t)a1, v6);
  swift_bridgeObjectRelease();
  return swift_willThrow();
}

uint64_t sub_24C8F2A40(void *a1)
{
  uint64_t v2 = MEMORY[0x2533006D0]();
  uint64_t v3 = sub_24C8F7B30();
  if (v2 == v3)
  {
    unsigned __int16 value = 0;
    return value | ((v2 == v3) << 16);
  }
  uint64_t v4 = MEMORY[0x2533006D0](a1);
  if (v4 == sub_24C8F7B60())
  {
    unsigned __int16 value = xpc_int64_get_value(a1);
    if (xpc_int64_get_value(a1) != (__int16)value)
    {
      uint64_t v9 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v11 = v10;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      xpc_int64_get_value(a1);
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      sub_24C8F7CF0();
      sub_24C8F7CF0();
      sub_24C8F7CF0();
      sub_24C8F7F40();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v9 - 8) + 104))(v11, *MEMORY[0x263F8DCB8], v9);
      return swift_willThrow();
    }
    return value | ((v2 == v3) << 16);
  }
  swift_beginAccess();
  sub_24C8F7F50();
  swift_allocError();
  uint64_t v6 = v5;
  swift_bridgeObjectRetain();
  sub_24C8E86AC(MEMORY[0x263F8E4F0], (uint64_t)a1, v6);
  swift_bridgeObjectRelease();
  return swift_willThrow();
}

unint64_t sub_24C8F2CAC(void *a1)
{
  uint64_t v2 = MEMORY[0x2533006D0]();
  uint64_t v3 = sub_24C8F7B30();
  if (v2 == v3)
  {
    unsigned int value = 0;
    return value | ((unint64_t)(v2 == v3) << 32);
  }
  uint64_t v4 = MEMORY[0x2533006D0](a1);
  if (v4 == sub_24C8F7B60())
  {
    unsigned int value = xpc_int64_get_value(a1);
    if (xpc_int64_get_value(a1) != value)
    {
      uint64_t v9 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v11 = v10;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      xpc_int64_get_value(a1);
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      sub_24C8F7CF0();
      sub_24C8F7CF0();
      sub_24C8F7CF0();
      sub_24C8F7F40();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v9 - 8) + 104))(v11, *MEMORY[0x263F8DCB8], v9);
      return swift_willThrow();
    }
    return value | ((unint64_t)(v2 == v3) << 32);
  }
  swift_beginAccess();
  sub_24C8F7F50();
  swift_allocError();
  uint64_t v6 = v5;
  swift_bridgeObjectRetain();
  sub_24C8E86AC(MEMORY[0x263F8E548], (uint64_t)a1, v6);
  swift_bridgeObjectRelease();
  return swift_willThrow();
}

int64_t sub_24C8F2F20(void *a1, uint64_t a2, uint64_t a3, int64_t value)
{
  uint64_t v6 = MEMORY[0x2533006D0]();
  if (v6 == sub_24C8F7B30()) {
    return 0;
  }
  uint64_t v7 = MEMORY[0x2533006D0](a1);
  if (v7 != sub_24C8F7B60())
  {
    swift_beginAccess();
    sub_24C8F7F50();
    swift_allocError();
    uint64_t v9 = v8;
    swift_bridgeObjectRetain();
    sub_24C8E86AC(value, (uint64_t)a1, v9);
    swift_bridgeObjectRelease();
LABEL_7:
    swift_willThrow();
    return value;
  }
  unsigned int value = xpc_int64_get_value(a1);
  if (value != xpc_int64_get_value(a1))
  {
    unsigned int value = sub_24C8F7F50();
    swift_allocError();
    uint64_t v11 = v10;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    xpc_int64_get_value(a1);
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    sub_24C8F7CF0();
    sub_24C8F7CF0();
    sub_24C8F7CF0();
    sub_24C8F7F40();
    (*(void (**)(uint64_t, void, int64_t))(*(void *)(value - 8) + 104))(v11, *MEMORY[0x263F8DCB8], value);
    goto LABEL_7;
  }
  return value;
}

uint64_t sub_24C8F3198(void *a1, uint64_t a2, uint64_t a3, uint64_t value)
{
  uint64_t v6 = MEMORY[0x2533006D0]();
  if (v6 == sub_24C8F7B30()) {
    return 0;
  }
  uint64_t v7 = MEMORY[0x2533006D0](a1);
  if (v7 != sub_24C8F7B90())
  {
    swift_beginAccess();
    sub_24C8F7F50();
    swift_allocError();
    uint64_t v9 = v8;
    swift_bridgeObjectRetain();
    sub_24C8E86AC(value, (uint64_t)a1, v9);
    swift_bridgeObjectRelease();
LABEL_7:
    swift_willThrow();
    return value;
  }
  unsigned int value = xpc_uint64_get_value(a1);
  if (value != xpc_uint64_get_value(a1))
  {
    unsigned int value = sub_24C8F7F50();
    swift_allocError();
    uint64_t v11 = v10;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_24C8F7F00();
    swift_bridgeObjectRelease();
    xpc_uint64_get_value(a1);
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    sub_24C8F7CF0();
    sub_24C8F7CF0();
    sub_24C8F7CF0();
    sub_24C8F7F40();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(value - 8) + 104))(v11, *MEMORY[0x263F8DCB8], value);
    goto LABEL_7;
  }
  return value;
}

uint64_t sub_24C8F3410(void *a1)
{
  uint64_t v2 = MEMORY[0x2533006D0]();
  uint64_t v3 = sub_24C8F7B30();
  if (v2 == v3)
  {
    unsigned __int8 value = 0;
    return value | ((v2 == v3) << 8);
  }
  uint64_t v4 = MEMORY[0x2533006D0](a1);
  if (v4 == sub_24C8F7B90())
  {
    unsigned __int8 value = xpc_uint64_get_value(a1);
    if (xpc_uint64_get_value(a1) != value)
    {
      uint64_t v9 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v11 = v10;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      xpc_uint64_get_value(a1);
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      sub_24C8F7CF0();
      sub_24C8F7CF0();
      sub_24C8F7CF0();
      sub_24C8F7F40();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v9 - 8) + 104))(v11, *MEMORY[0x263F8DCB8], v9);
      return swift_willThrow();
    }
    return value | ((v2 == v3) << 8);
  }
  swift_beginAccess();
  sub_24C8F7F50();
  swift_allocError();
  uint64_t v6 = v5;
  swift_bridgeObjectRetain();
  sub_24C8E86AC(MEMORY[0x263F8E778], (uint64_t)a1, v6);
  swift_bridgeObjectRelease();
  return swift_willThrow();
}

uint64_t sub_24C8F367C(void *a1)
{
  uint64_t v2 = MEMORY[0x2533006D0]();
  uint64_t v3 = sub_24C8F7B30();
  if (v2 == v3)
  {
    unsigned __int16 value = 0;
    return value | ((v2 == v3) << 16);
  }
  uint64_t v4 = MEMORY[0x2533006D0](a1);
  if (v4 == sub_24C8F7B90())
  {
    unsigned __int16 value = xpc_uint64_get_value(a1);
    if (xpc_uint64_get_value(a1) != value)
    {
      uint64_t v9 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v11 = v10;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      xpc_uint64_get_value(a1);
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      sub_24C8F7CF0();
      sub_24C8F7CF0();
      sub_24C8F7CF0();
      sub_24C8F7F40();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v9 - 8) + 104))(v11, *MEMORY[0x263F8DCB8], v9);
      return swift_willThrow();
    }
    return value | ((v2 == v3) << 16);
  }
  swift_beginAccess();
  sub_24C8F7F50();
  swift_allocError();
  uint64_t v6 = v5;
  swift_bridgeObjectRetain();
  sub_24C8E86AC(MEMORY[0x263F8E888], (uint64_t)a1, v6);
  swift_bridgeObjectRelease();
  return swift_willThrow();
}

unint64_t sub_24C8F38E8(void *a1)
{
  uint64_t v2 = MEMORY[0x2533006D0]();
  uint64_t v3 = sub_24C8F7B30();
  if (v2 == v3)
  {
    unsigned int value = 0;
    return value | ((unint64_t)(v2 == v3) << 32);
  }
  uint64_t v4 = MEMORY[0x2533006D0](a1);
  if (v4 == sub_24C8F7B90())
  {
    unsigned int value = xpc_uint64_get_value(a1);
    if (xpc_uint64_get_value(a1) != value)
    {
      uint64_t v9 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v11 = v10;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      xpc_uint64_get_value(a1);
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      sub_24C8F7CF0();
      sub_24C8F7CF0();
      sub_24C8F7CF0();
      sub_24C8F7F40();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v9 - 8) + 104))(v11, *MEMORY[0x263F8DCB8], v9);
      return swift_willThrow();
    }
    return value | ((unint64_t)(v2 == v3) << 32);
  }
  swift_beginAccess();
  sub_24C8F7F50();
  swift_allocError();
  uint64_t v6 = v5;
  swift_bridgeObjectRetain();
  sub_24C8E86AC(MEMORY[0x263F8E8F8], (uint64_t)a1, v6);
  swift_bridgeObjectRelease();
  return swift_willThrow();
}

uint64_t sub_24C8F3B5C()
{
  char value = sub_24C8E91DC();
  if (v1) {
    return value & 1;
  }
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = MEMORY[0x2533006D0](v3);
  uint64_t result = sub_24C8F7B30();
  if (v4 != result)
  {
    uint64_t v6 = MEMORY[0x2533006D0](v3);
    if (v6 == sub_24C8F7B20())
    {
      char value = xpc_BOOL_get_value(v3);
    }
    else
    {
      swift_beginAccess();
      sub_24C8F7F50();
      swift_allocError();
      uint64_t v8 = v7;
      swift_bridgeObjectRetain();
      sub_24C8E86AC(MEMORY[0x263F8D4F8], (uint64_t)v3, v8);
      swift_bridgeObjectRelease();
      char value = swift_willThrow();
    }
    return value & 1;
  }
  __break(1u);
  return result;
}

void sub_24C8F3C48()
{
  sub_24C8E9FC8();
  if (!v1)
  {
    uint64_t v2 = *(void **)(v0 + 24);
    uint64_t v3 = MEMORY[0x2533006D0](v2);
    if (v3 == sub_24C8F7B30())
    {
      __break(1u);
    }
    else
    {
      uint64_t v4 = MEMORY[0x2533006D0](v2);
      if (v4 == sub_24C8F7B70())
      {
        xpc_double_get_value(v2);
      }
      else
      {
        swift_beginAccess();
        sub_24C8F7F50();
        swift_allocError();
        uint64_t v6 = v5;
        swift_bridgeObjectRetain();
        sub_24C8E86AC(MEMORY[0x263F8D5C8], (uint64_t)v2, v6);
        swift_bridgeObjectRelease();
        swift_willThrow();
      }
    }
  }
}

void sub_24C8F3D34()
{
  sub_24C8EA10C();
  if (!v1)
  {
    uint64_t v2 = *(void **)(v0 + 24);
    uint64_t v3 = MEMORY[0x2533006D0](v2);
    if (v3 == sub_24C8F7B30())
    {
      __break(1u);
    }
    else
    {
      uint64_t v4 = MEMORY[0x2533006D0](v2);
      if (v4 == sub_24C8F7B70())
      {
        xpc_double_get_value(v2);
      }
      else
      {
        swift_beginAccess();
        sub_24C8F7F50();
        swift_allocError();
        uint64_t v6 = v5;
        swift_bridgeObjectRetain();
        sub_24C8E86AC(MEMORY[0x263F8D538], (uint64_t)v2, v6);
        swift_bridgeObjectRelease();
        swift_willThrow();
      }
    }
  }
}

uint64_t sub_24C8F3E1C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9650);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24C8F3E7C()
{
  unint64_t result = qword_2697F9660;
  if (!qword_2697F9660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F9660);
  }
  return result;
}

uint64_t sub_24C8F3ED0()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t type metadata accessor for _XPCKeyedDecodingContainer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24C8F3F30(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for _XPCDecoder();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *initializeWithCopy for _XPCUnkeyedDecodingContainer(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for _XPCUnkeyedDecodingContainer(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for _XPCUnkeyedDecodingContainer(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_unknownObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for _XPCUnkeyedDecodingContainer(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _XPCUnkeyedDecodingContainer(uint64_t result, int a2, int a3)
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _XPCUnkeyedDecodingContainer()
{
  return &type metadata for _XPCUnkeyedDecodingContainer;
}

uint64_t sub_24C8F4130()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 41, 7);
}

uint64_t sub_24C8F4168()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)v0[1];
  int64_t v3 = v0[3];
  if (v3 >= (uint64_t)xpc_array_get_count(v2))
  {
    uint64_t v17 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v19 = MEMORY[0x263F8D4F8];
    uint64_t v20 = *v0;
    swift_beginAccess();
    uint64_t v21 = *(void *)(v20 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24C8F9900;
    uint64_t v23 = v0[3];
    v37[1] = 0xE600000000000000;
    v33[0] = v23;
    swift_bridgeObjectRetain();
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    *(void *)(inited + 56) = &type metadata for XPCCodingKey;
    *(void *)(inited + 64) = sub_24C8E43A0();
    uint64_t v24 = swift_allocObject();
    *(void *)(inited + 32) = v24;
    *(void *)(v24 + 16) = 0x207865646E49;
    *(void *)(v24 + 24) = 0xE600000000000000;
    *(void *)(v24 + 32) = v23;
    *(unsigned char *)(v24 + 40) = 0;
    v37[0] = v21;
    uint64_t v14 = v37;
    sub_24C8F24A0((void *)inited);
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x263F8DCC0], v17);
    swift_willThrow();
  }
  else
  {
    uint64_t v4 = *v0;
    *(void *)&long long v34 = 0x207865646E49;
    *((void *)&v34 + 1) = 0xE600000000000000;
    v37[0] = v3;
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    uint64_t v5 = (void *)(v4 + 16);
    swift_beginAccess();
    uint64_t v6 = *(void **)(v4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v4 + 16) = v6;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v6 = sub_24C8F2368(0, v6[2] + 1, 1, v6);
      *uint64_t v5 = v6;
    }
    unint64_t v9 = v6[2];
    unint64_t v8 = v6[3];
    if (v9 >= v8 >> 1)
    {
      uint64_t v6 = sub_24C8F2368((void *)(v8 > 1), v9 + 1, 1, v6);
      *uint64_t v5 = v6;
    }
    uint64_t v35 = &type metadata for XPCCodingKey;
    unint64_t v32 = sub_24C8E43A0();
    unint64_t v36 = v32;
    uint64_t v10 = swift_allocObject();
    *(void *)&long long v34 = v10;
    *(void *)(v10 + 16) = 0x207865646E49;
    *(void *)(v10 + 24) = 0xE600000000000000;
    *(void *)(v10 + 32) = v3;
    *(unsigned char *)(v10 + 40) = 0;
    v6[2] = v9 + 1;
    sub_24C8E8100(&v34, (uint64_t)&v6[5 * v9 + 4]);
    xpc_object_t v11 = xpc_array_get_value(v2, v3);
    uint64_t v12 = MEMORY[0x2533006D0]();
    if (v12 == sub_24C8F7B30())
    {
      swift_unknownObjectRelease();
      uint64_t v25 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v27 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
      *uint64_t v27 = MEMORY[0x263F8D4F8];
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
      uint64_t v28 = swift_initStackObject();
      *(_OWORD *)(v28 + 16) = xmmword_24C8F9900;
      uint64_t v38 = v1[3];
      uint64_t v29 = v38;
      swift_bridgeObjectRetain();
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      *(void *)(v28 + 56) = &type metadata for XPCCodingKey;
      *(void *)(v28 + 64) = v32;
      uint64_t v30 = swift_allocObject();
      *(void *)(v28 + 32) = v30;
      *(void *)(v30 + 16) = 0x207865646E49;
      *(void *)(v30 + 24) = 0xE600000000000000;
      *(void *)(v30 + 32) = v29;
      *(unsigned char *)(v30 + 40) = 0;
      sub_24C8F24A0((void *)v28);
      v33[0] = 0;
      v33[1] = 0xE000000000000000;
      uint64_t v14 = v33;
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      sub_24C8F7F40();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, *MEMORY[0x263F8DCC0], v25);
      swift_willThrow();
    }
    else
    {
      uint64_t v13 = MEMORY[0x2533006D0](v11);
      if (v13 == sub_24C8F7B20())
      {
        LOBYTE(v14) = xpc_BOOL_get_value(v11);
        swift_unknownObjectRelease();
        v1[3] = v3 + 1;
        sub_24C8EC4FC(v1);
        return v14 & 1;
      }
      uint64_t v14 = (void *)*v5;
      sub_24C8F7F50();
      swift_allocError();
      uint64_t v16 = v15;
      swift_bridgeObjectRetain();
      sub_24C8E86AC(MEMORY[0x263F8D4F8], (uint64_t)v11, v16);
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
    }
    sub_24C8EC4FC(v1);
  }
  return v14 & 1;
}

void *sub_24C8F471C()
{
  uint64_t v2 = v0;
  int64_t v3 = (void *)v0[1];
  int64_t v4 = v0[3];
  if (v4 >= (uint64_t)xpc_array_get_count(v3))
  {
    uint64_t v18 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v20 = MEMORY[0x263F8D6C8];
    uint64_t v21 = *v0;
    swift_beginAccess();
    uint64_t v22 = *(void *)(v21 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24C8F9900;
    uint64_t v24 = v2[3];
    v38[1] = 0xE600000000000000;
    v34[0] = v24;
    swift_bridgeObjectRetain();
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    *(void *)(inited + 56) = &type metadata for XPCCodingKey;
    *(void *)(inited + 64) = sub_24C8E43A0();
    uint64_t v25 = swift_allocObject();
    *(void *)(inited + 32) = v25;
    *(void *)(v25 + 16) = 0x207865646E49;
    *(void *)(v25 + 24) = 0xE600000000000000;
    *(void *)(v25 + 32) = v24;
    *(unsigned char *)(v25 + 40) = 0;
    v38[0] = v22;
    uint64_t v15 = v38;
    sub_24C8F24A0((void *)inited);
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCC0], v18);
    swift_willThrow();
  }
  else
  {
    uint64_t v5 = (void *)*v0;
    *(void *)&long long v35 = 0x207865646E49;
    *((void *)&v35 + 1) = 0xE600000000000000;
    v38[0] = v4;
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + 2;
    swift_beginAccess();
    uint64_t v7 = (void *)v5[2];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v5[2] = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v7 = sub_24C8F2368(0, v7[2] + 1, 1, v7);
      *uint64_t v6 = v7;
    }
    unint64_t v10 = v7[2];
    unint64_t v9 = v7[3];
    if (v10 >= v9 >> 1)
    {
      uint64_t v7 = sub_24C8F2368((void *)(v9 > 1), v10 + 1, 1, v7);
      *uint64_t v6 = v7;
    }
    unint64_t v36 = &type metadata for XPCCodingKey;
    unint64_t v11 = sub_24C8E43A0();
    unint64_t v37 = v11;
    uint64_t v12 = swift_allocObject();
    *(void *)&long long v35 = v12;
    *(void *)(v12 + 16) = 0x207865646E49;
    *(void *)(v12 + 24) = 0xE600000000000000;
    *(void *)(v12 + 32) = v4;
    *(unsigned char *)(v12 + 40) = 0;
    v7[2] = v10 + 1;
    sub_24C8E8100(&v35, (uint64_t)&v7[5 * v10 + 4]);
    id v13 = xpc_array_get_value(v3, v4);
    uint64_t v14 = MEMORY[0x263F8D6C8];
    uint64_t v15 = v5;
    int64_t v16 = sub_24C8F2F20(v13, 7630409, 0xE300000000000000, MEMORY[0x263F8D6C8]);
    if (v1)
    {
      swift_unknownObjectRelease();
LABEL_12:
      sub_24C8EC4FC(v2);
      return v15;
    }
    uint64_t v15 = (void *)v16;
    char v26 = v17;
    swift_unknownObjectRelease();
    if (v26)
    {
      uint64_t v33 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v28 = v27;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
      *uint64_t v28 = v14;
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
      uint64_t v29 = swift_initStackObject();
      *(_OWORD *)(v29 + 16) = xmmword_24C8F9900;
      uint64_t v39 = v2[3];
      uint64_t v30 = v39;
      swift_bridgeObjectRetain();
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      *(void *)(v29 + 56) = &type metadata for XPCCodingKey;
      *(void *)(v29 + 64) = v11;
      uint64_t v31 = swift_allocObject();
      *(void *)(v29 + 32) = v31;
      *(void *)(v31 + 16) = 0x207865646E49;
      *(void *)(v31 + 24) = 0xE600000000000000;
      *(void *)(v31 + 32) = v30;
      *(unsigned char *)(v31 + 40) = 0;
      sub_24C8F24A0((void *)v29);
      v34[0] = 0;
      v34[1] = 0xE000000000000000;
      uint64_t v15 = v34;
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      sub_24C8F7F40();
      (*(void (**)(void *, void))(*(void *)(v33 - 8) + 104))(v28, *MEMORY[0x263F8DCC0]);
      swift_willThrow();
      goto LABEL_12;
    }
    v2[3] = v4 + 1;
    sub_24C8EC4FC(v2);
  }
  return v15;
}

void *sub_24C8F4C70()
{
  uint64_t v2 = v0;
  int64_t v3 = (void *)v0[1];
  int64_t v4 = v0[3];
  if (v4 >= (uint64_t)xpc_array_get_count(v3))
  {
    uint64_t v18 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v20 = MEMORY[0x263F8E5C0];
    uint64_t v21 = *v0;
    swift_beginAccess();
    uint64_t v22 = *(void *)(v21 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24C8F9900;
    uint64_t v24 = v2[3];
    v38[1] = 0xE600000000000000;
    v34[0] = v24;
    swift_bridgeObjectRetain();
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    *(void *)(inited + 56) = &type metadata for XPCCodingKey;
    *(void *)(inited + 64) = sub_24C8E43A0();
    uint64_t v25 = swift_allocObject();
    *(void *)(inited + 32) = v25;
    *(void *)(v25 + 16) = 0x207865646E49;
    *(void *)(v25 + 24) = 0xE600000000000000;
    *(void *)(v25 + 32) = v24;
    *(unsigned char *)(v25 + 40) = 0;
    v38[0] = v22;
    uint64_t v15 = v38;
    sub_24C8F24A0((void *)inited);
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCC0], v18);
    swift_willThrow();
  }
  else
  {
    uint64_t v5 = (void *)*v0;
    *(void *)&long long v35 = 0x207865646E49;
    *((void *)&v35 + 1) = 0xE600000000000000;
    v38[0] = v4;
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + 2;
    swift_beginAccess();
    uint64_t v7 = (void *)v5[2];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v5[2] = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v7 = sub_24C8F2368(0, v7[2] + 1, 1, v7);
      *uint64_t v6 = v7;
    }
    unint64_t v10 = v7[2];
    unint64_t v9 = v7[3];
    if (v10 >= v9 >> 1)
    {
      uint64_t v7 = sub_24C8F2368((void *)(v9 > 1), v10 + 1, 1, v7);
      *uint64_t v6 = v7;
    }
    unint64_t v36 = &type metadata for XPCCodingKey;
    unint64_t v11 = sub_24C8E43A0();
    unint64_t v37 = v11;
    uint64_t v12 = swift_allocObject();
    *(void *)&long long v35 = v12;
    *(void *)(v12 + 16) = 0x207865646E49;
    *(void *)(v12 + 24) = 0xE600000000000000;
    *(void *)(v12 + 32) = v4;
    *(unsigned char *)(v12 + 40) = 0;
    v7[2] = v10 + 1;
    sub_24C8E8100(&v35, (uint64_t)&v7[5 * v10 + 4]);
    id v13 = xpc_array_get_value(v3, v4);
    uint64_t v14 = MEMORY[0x263F8E5C0];
    uint64_t v15 = v5;
    int64_t v16 = sub_24C8F2F20(v13, 0x3436746E49, 0xE500000000000000, MEMORY[0x263F8E5C0]);
    if (v1)
    {
      swift_unknownObjectRelease();
LABEL_12:
      sub_24C8EC4FC(v2);
      return v15;
    }
    uint64_t v15 = (void *)v16;
    char v26 = v17;
    swift_unknownObjectRelease();
    if (v26)
    {
      uint64_t v33 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v28 = v27;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
      *uint64_t v28 = v14;
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
      uint64_t v29 = swift_initStackObject();
      *(_OWORD *)(v29 + 16) = xmmword_24C8F9900;
      uint64_t v39 = v2[3];
      uint64_t v30 = v39;
      swift_bridgeObjectRetain();
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      *(void *)(v29 + 56) = &type metadata for XPCCodingKey;
      *(void *)(v29 + 64) = v11;
      uint64_t v31 = swift_allocObject();
      *(void *)(v29 + 32) = v31;
      *(void *)(v31 + 16) = 0x207865646E49;
      *(void *)(v31 + 24) = 0xE600000000000000;
      *(void *)(v31 + 32) = v30;
      *(unsigned char *)(v31 + 40) = 0;
      sub_24C8F24A0((void *)v29);
      v34[0] = 0;
      v34[1] = 0xE000000000000000;
      uint64_t v15 = v34;
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      sub_24C8F7F40();
      (*(void (**)(void *, void))(*(void *)(v33 - 8) + 104))(v28, *MEMORY[0x263F8DCC0]);
      swift_willThrow();
      goto LABEL_12;
    }
    v2[3] = v4 + 1;
    sub_24C8EC4FC(v2);
  }
  return v15;
}

void *sub_24C8F51D0()
{
  uint64_t v2 = v0;
  int64_t v3 = (void *)v0[1];
  int64_t v4 = v0[3];
  if (v4 >= (uint64_t)xpc_array_get_count(v3))
  {
    uint64_t v18 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v20 = MEMORY[0x263F8D9D0];
    uint64_t v21 = *v0;
    swift_beginAccess();
    uint64_t v22 = *(void *)(v21 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24C8F9900;
    uint64_t v24 = v2[3];
    v38[1] = 0xE600000000000000;
    v34[0] = v24;
    swift_bridgeObjectRetain();
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    *(void *)(inited + 56) = &type metadata for XPCCodingKey;
    *(void *)(inited + 64) = sub_24C8E43A0();
    uint64_t v25 = swift_allocObject();
    *(void *)(inited + 32) = v25;
    *(void *)(v25 + 16) = 0x207865646E49;
    *(void *)(v25 + 24) = 0xE600000000000000;
    *(void *)(v25 + 32) = v24;
    *(unsigned char *)(v25 + 40) = 0;
    v38[0] = v22;
    uint64_t v15 = v38;
    sub_24C8F24A0((void *)inited);
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCC0], v18);
    swift_willThrow();
  }
  else
  {
    uint64_t v5 = (void *)*v0;
    *(void *)&long long v35 = 0x207865646E49;
    *((void *)&v35 + 1) = 0xE600000000000000;
    v38[0] = v4;
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + 2;
    swift_beginAccess();
    uint64_t v7 = (void *)v5[2];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v5[2] = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v7 = sub_24C8F2368(0, v7[2] + 1, 1, v7);
      *uint64_t v6 = v7;
    }
    unint64_t v10 = v7[2];
    unint64_t v9 = v7[3];
    if (v10 >= v9 >> 1)
    {
      uint64_t v7 = sub_24C8F2368((void *)(v9 > 1), v10 + 1, 1, v7);
      *uint64_t v6 = v7;
    }
    unint64_t v36 = &type metadata for XPCCodingKey;
    unint64_t v11 = sub_24C8E43A0();
    unint64_t v37 = v11;
    uint64_t v12 = swift_allocObject();
    *(void *)&long long v35 = v12;
    *(void *)(v12 + 16) = 0x207865646E49;
    *(void *)(v12 + 24) = 0xE600000000000000;
    *(void *)(v12 + 32) = v4;
    *(unsigned char *)(v12 + 40) = 0;
    v7[2] = v10 + 1;
    sub_24C8E8100(&v35, (uint64_t)&v7[5 * v10 + 4]);
    id v13 = xpc_array_get_value(v3, v4);
    uint64_t v14 = MEMORY[0x263F8D9D0];
    uint64_t v15 = v5;
    uint64_t v16 = sub_24C8F3198(v13, 1953384789, 0xE400000000000000, MEMORY[0x263F8D9D0]);
    if (v1)
    {
      swift_unknownObjectRelease();
LABEL_12:
      sub_24C8EC4FC(v2);
      return v15;
    }
    uint64_t v15 = (void *)v16;
    char v26 = v17;
    swift_unknownObjectRelease();
    if (v26)
    {
      uint64_t v33 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v28 = v27;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
      *uint64_t v28 = v14;
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
      uint64_t v29 = swift_initStackObject();
      *(_OWORD *)(v29 + 16) = xmmword_24C8F9900;
      uint64_t v39 = v2[3];
      uint64_t v30 = v39;
      swift_bridgeObjectRetain();
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      *(void *)(v29 + 56) = &type metadata for XPCCodingKey;
      *(void *)(v29 + 64) = v11;
      uint64_t v31 = swift_allocObject();
      *(void *)(v29 + 32) = v31;
      *(void *)(v31 + 16) = 0x207865646E49;
      *(void *)(v31 + 24) = 0xE600000000000000;
      *(void *)(v31 + 32) = v30;
      *(unsigned char *)(v31 + 40) = 0;
      sub_24C8F24A0((void *)v29);
      v34[0] = 0;
      v34[1] = 0xE000000000000000;
      uint64_t v15 = v34;
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      sub_24C8F7F40();
      (*(void (**)(void *, void))(*(void *)(v33 - 8) + 104))(v28, *MEMORY[0x263F8DCC0]);
      swift_willThrow();
      goto LABEL_12;
    }
    v2[3] = v4 + 1;
    sub_24C8EC4FC(v2);
  }
  return v15;
}

void *sub_24C8F572C(uint64_t (*a1)(void), uint64_t a2)
{
  uint64_t v6 = v2;
  uint64_t v7 = (void *)v2[1];
  int64_t v8 = v2[3];
  if (v8 >= (uint64_t)xpc_array_get_count(v7))
  {
    uint64_t v20 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v22 = a2;
    uint64_t v23 = *v2;
    swift_beginAccess();
    uint64_t v24 = *(void *)(v23 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24C8F9900;
    uint64_t v26 = v6[3];
    v39[1] = 0xE600000000000000;
    v35[0] = v26;
    swift_bridgeObjectRetain();
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    *(void *)(inited + 56) = &type metadata for XPCCodingKey;
    *(void *)(inited + 64) = sub_24C8E43A0();
    uint64_t v27 = swift_allocObject();
    *(void *)(inited + 32) = v27;
    *(void *)(v27 + 16) = 0x207865646E49;
    *(void *)(v27 + 24) = 0xE600000000000000;
    *(void *)(v27 + 32) = v26;
    *(unsigned char *)(v27 + 40) = 0;
    v39[0] = v24;
    uint64_t v18 = v39;
    sub_24C8F24A0((void *)inited);
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCC0], v20);
    swift_willThrow();
  }
  else
  {
    unint64_t v9 = (void *)*v2;
    *(void *)&long long v36 = 0x207865646E49;
    *((void *)&v36 + 1) = 0xE600000000000000;
    v39[0] = v8;
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    unint64_t v10 = v9 + 2;
    swift_beginAccess();
    unint64_t v11 = (void *)v9[2];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9[2] = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v11 = sub_24C8F2368(0, v11[2] + 1, 1, v11);
      *unint64_t v10 = v11;
    }
    unint64_t v14 = v11[2];
    unint64_t v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      unint64_t v11 = sub_24C8F2368((void *)(v13 > 1), v14 + 1, 1, v11);
      *unint64_t v10 = v11;
    }
    unint64_t v37 = &type metadata for XPCCodingKey;
    unint64_t v15 = sub_24C8E43A0();
    unint64_t v38 = v15;
    uint64_t v16 = swift_allocObject();
    *(void *)&long long v36 = v16;
    *(void *)(v16 + 16) = 0x207865646E49;
    *(void *)(v16 + 24) = 0xE600000000000000;
    *(void *)(v16 + 32) = v8;
    *(unsigned char *)(v16 + 40) = 0;
    v11[2] = v14 + 1;
    sub_24C8E8100(&v36, (uint64_t)&v11[5 * v14 + 4]);
    id v17 = xpc_array_get_value(v7, v8);
    uint64_t v18 = v9;
    uint64_t v19 = a1();
    if (v3)
    {
      swift_unknownObjectRelease();
LABEL_12:
      sub_24C8EC4FC(v6);
      return v18;
    }
    uint64_t v18 = (void *)v19;
    swift_unknownObjectRelease();
    if (((unsigned __int16)v18 & 0x100) != 0)
    {
      uint64_t v34 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v29 = v28;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
      *uint64_t v29 = a2;
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
      uint64_t v30 = swift_initStackObject();
      *(_OWORD *)(v30 + 16) = xmmword_24C8F9900;
      uint64_t v40 = v6[3];
      uint64_t v31 = v40;
      swift_bridgeObjectRetain();
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      *(void *)(v30 + 56) = &type metadata for XPCCodingKey;
      *(void *)(v30 + 64) = v15;
      uint64_t v32 = swift_allocObject();
      *(void *)(v30 + 32) = v32;
      *(void *)(v32 + 16) = 0x207865646E49;
      *(void *)(v32 + 24) = 0xE600000000000000;
      *(void *)(v32 + 32) = v31;
      *(unsigned char *)(v32 + 40) = 0;
      sub_24C8F24A0((void *)v30);
      v35[0] = 0;
      v35[1] = 0xE000000000000000;
      uint64_t v18 = v35;
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      sub_24C8F7F40();
      (*(void (**)(void *, void))(*(void *)(v34 - 8) + 104))(v29, *MEMORY[0x263F8DCC0]);
      swift_willThrow();
      goto LABEL_12;
    }
    v6[3] = v8 + 1;
    sub_24C8EC4FC(v6);
  }
  return v18;
}

void *sub_24C8F5C6C(uint64_t (*a1)(void), uint64_t a2)
{
  uint64_t v6 = v2;
  uint64_t v7 = (void *)v2[1];
  int64_t v8 = v2[3];
  if (v8 >= (uint64_t)xpc_array_get_count(v7))
  {
    uint64_t v20 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v22 = a2;
    uint64_t v23 = *v2;
    swift_beginAccess();
    uint64_t v24 = *(void *)(v23 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24C8F9900;
    uint64_t v26 = v6[3];
    v39[1] = 0xE600000000000000;
    v35[0] = v26;
    swift_bridgeObjectRetain();
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    *(void *)(inited + 56) = &type metadata for XPCCodingKey;
    *(void *)(inited + 64) = sub_24C8E43A0();
    uint64_t v27 = swift_allocObject();
    *(void *)(inited + 32) = v27;
    *(void *)(v27 + 16) = 0x207865646E49;
    *(void *)(v27 + 24) = 0xE600000000000000;
    *(void *)(v27 + 32) = v26;
    *(unsigned char *)(v27 + 40) = 0;
    v39[0] = v24;
    uint64_t v18 = v39;
    sub_24C8F24A0((void *)inited);
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCC0], v20);
    swift_willThrow();
  }
  else
  {
    unint64_t v9 = (void *)*v2;
    *(void *)&long long v36 = 0x207865646E49;
    *((void *)&v36 + 1) = 0xE600000000000000;
    v39[0] = v8;
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    unint64_t v10 = v9 + 2;
    swift_beginAccess();
    unint64_t v11 = (void *)v9[2];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9[2] = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v11 = sub_24C8F2368(0, v11[2] + 1, 1, v11);
      *unint64_t v10 = v11;
    }
    unint64_t v14 = v11[2];
    unint64_t v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      unint64_t v11 = sub_24C8F2368((void *)(v13 > 1), v14 + 1, 1, v11);
      *unint64_t v10 = v11;
    }
    unint64_t v37 = &type metadata for XPCCodingKey;
    unint64_t v15 = sub_24C8E43A0();
    unint64_t v38 = v15;
    uint64_t v16 = swift_allocObject();
    *(void *)&long long v36 = v16;
    *(void *)(v16 + 16) = 0x207865646E49;
    *(void *)(v16 + 24) = 0xE600000000000000;
    *(void *)(v16 + 32) = v8;
    *(unsigned char *)(v16 + 40) = 0;
    v11[2] = v14 + 1;
    sub_24C8E8100(&v36, (uint64_t)&v11[5 * v14 + 4]);
    id v17 = xpc_array_get_value(v7, v8);
    uint64_t v18 = v9;
    uint64_t v19 = a1();
    if (v3)
    {
      swift_unknownObjectRelease();
LABEL_12:
      sub_24C8EC4FC(v6);
      return v18;
    }
    uint64_t v18 = (void *)v19;
    swift_unknownObjectRelease();
    if ((v18 & 0x10000) != 0)
    {
      uint64_t v34 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v29 = v28;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
      *uint64_t v29 = a2;
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
      uint64_t v30 = swift_initStackObject();
      *(_OWORD *)(v30 + 16) = xmmword_24C8F9900;
      uint64_t v40 = v6[3];
      uint64_t v31 = v40;
      swift_bridgeObjectRetain();
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      *(void *)(v30 + 56) = &type metadata for XPCCodingKey;
      *(void *)(v30 + 64) = v15;
      uint64_t v32 = swift_allocObject();
      *(void *)(v30 + 32) = v32;
      *(void *)(v32 + 16) = 0x207865646E49;
      *(void *)(v32 + 24) = 0xE600000000000000;
      *(void *)(v32 + 32) = v31;
      *(unsigned char *)(v32 + 40) = 0;
      sub_24C8F24A0((void *)v30);
      v35[0] = 0;
      v35[1] = 0xE000000000000000;
      uint64_t v18 = v35;
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      sub_24C8F7F40();
      (*(void (**)(void *, void))(*(void *)(v34 - 8) + 104))(v29, *MEMORY[0x263F8DCC0]);
      swift_willThrow();
      goto LABEL_12;
    }
    v6[3] = v8 + 1;
    sub_24C8EC4FC(v6);
  }
  return v18;
}

uint64_t sub_24C8F61AC(uint64_t (*a1)(void), uint64_t a2)
{
  uint64_t v6 = v2;
  uint64_t v7 = (void *)v2[1];
  int64_t v8 = v2[3];
  if (v8 >= (uint64_t)xpc_array_get_count(v7))
  {
    uint64_t v20 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v22 = a2;
    uint64_t v23 = *v2;
    swift_beginAccess();
    uint64_t v24 = *(void *)(v23 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24C8F9900;
    uint64_t v26 = v6[3];
    v39[1] = 0xE600000000000000;
    v35[0] = v26;
    swift_bridgeObjectRetain();
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    *(void *)(inited + 56) = &type metadata for XPCCodingKey;
    *(void *)(inited + 64) = sub_24C8E43A0();
    uint64_t v27 = swift_allocObject();
    *(void *)(inited + 32) = v27;
    *(void *)(v27 + 16) = 0x207865646E49;
    *(void *)(v27 + 24) = 0xE600000000000000;
    *(void *)(v27 + 32) = v26;
    *(unsigned char *)(v27 + 40) = 0;
    v39[0] = v24;
    uint64_t v18 = (uint64_t)v39;
    sub_24C8F24A0((void *)inited);
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCC0], v20);
    swift_willThrow();
  }
  else
  {
    unint64_t v9 = (void *)*v2;
    *(void *)&long long v36 = 0x207865646E49;
    *((void *)&v36 + 1) = 0xE600000000000000;
    v39[0] = v8;
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    unint64_t v10 = v9 + 2;
    swift_beginAccess();
    unint64_t v11 = (void *)v9[2];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9[2] = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v11 = sub_24C8F2368(0, v11[2] + 1, 1, v11);
      *unint64_t v10 = v11;
    }
    unint64_t v14 = v11[2];
    unint64_t v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      unint64_t v11 = sub_24C8F2368((void *)(v13 > 1), v14 + 1, 1, v11);
      *unint64_t v10 = v11;
    }
    unint64_t v37 = &type metadata for XPCCodingKey;
    unint64_t v15 = sub_24C8E43A0();
    unint64_t v38 = v15;
    uint64_t v16 = swift_allocObject();
    *(void *)&long long v36 = v16;
    *(void *)(v16 + 16) = 0x207865646E49;
    *(void *)(v16 + 24) = 0xE600000000000000;
    *(void *)(v16 + 32) = v8;
    *(unsigned char *)(v16 + 40) = 0;
    v11[2] = v14 + 1;
    sub_24C8E8100(&v36, (uint64_t)&v11[5 * v14 + 4]);
    id v17 = xpc_array_get_value(v7, v8);
    uint64_t v18 = (uint64_t)v9;
    uint64_t v19 = a1();
    if (v3)
    {
      swift_unknownObjectRelease();
LABEL_12:
      sub_24C8EC4FC(v6);
      return v18;
    }
    uint64_t v18 = v19;
    swift_unknownObjectRelease();
    if ((v18 & 0x100000000) != 0)
    {
      uint64_t v34 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v29 = v28;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
      *uint64_t v29 = a2;
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
      uint64_t v30 = swift_initStackObject();
      *(_OWORD *)(v30 + 16) = xmmword_24C8F9900;
      uint64_t v40 = v6[3];
      uint64_t v31 = v40;
      swift_bridgeObjectRetain();
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      *(void *)(v30 + 56) = &type metadata for XPCCodingKey;
      *(void *)(v30 + 64) = v15;
      uint64_t v32 = swift_allocObject();
      *(void *)(v30 + 32) = v32;
      *(void *)(v32 + 16) = 0x207865646E49;
      *(void *)(v32 + 24) = 0xE600000000000000;
      *(void *)(v32 + 32) = v31;
      *(unsigned char *)(v32 + 40) = 0;
      sub_24C8F24A0((void *)v30);
      v35[0] = 0;
      v35[1] = 0xE000000000000000;
      uint64_t v18 = (uint64_t)v35;
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      sub_24C8F7F40();
      (*(void (**)(void *, void))(*(void *)(v34 - 8) + 104))(v29, *MEMORY[0x263F8DCC0]);
      swift_willThrow();
      goto LABEL_12;
    }
    v6[3] = v8 + 1;
    sub_24C8EC4FC(v6);
  }
  return v18;
}

void *sub_24C8F66EC()
{
  uint64_t v2 = v0;
  uint64_t v3 = (void *)v0[1];
  int64_t v4 = v0[3];
  if (v4 >= (uint64_t)xpc_array_get_count(v3))
  {
    uint64_t v18 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v20 = MEMORY[0x263F8E970];
    uint64_t v21 = *v0;
    swift_beginAccess();
    uint64_t v22 = *(void *)(v21 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24C8F9900;
    uint64_t v24 = v2[3];
    v38[1] = 0xE600000000000000;
    v34[0] = v24;
    swift_bridgeObjectRetain();
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    *(void *)(inited + 56) = &type metadata for XPCCodingKey;
    *(void *)(inited + 64) = sub_24C8E43A0();
    uint64_t v25 = swift_allocObject();
    *(void *)(inited + 32) = v25;
    *(void *)(v25 + 16) = 0x207865646E49;
    *(void *)(v25 + 24) = 0xE600000000000000;
    *(void *)(v25 + 32) = v24;
    *(unsigned char *)(v25 + 40) = 0;
    v38[0] = v22;
    unint64_t v15 = v38;
    sub_24C8F24A0((void *)inited);
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCC0], v18);
    swift_willThrow();
  }
  else
  {
    uint64_t v5 = (void *)*v0;
    *(void *)&long long v35 = 0x207865646E49;
    *((void *)&v35 + 1) = 0xE600000000000000;
    v38[0] = v4;
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + 2;
    swift_beginAccess();
    uint64_t v7 = (void *)v5[2];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v5[2] = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v7 = sub_24C8F2368(0, v7[2] + 1, 1, v7);
      *uint64_t v6 = v7;
    }
    unint64_t v10 = v7[2];
    unint64_t v9 = v7[3];
    if (v10 >= v9 >> 1)
    {
      uint64_t v7 = sub_24C8F2368((void *)(v9 > 1), v10 + 1, 1, v7);
      *uint64_t v6 = v7;
    }
    long long v36 = &type metadata for XPCCodingKey;
    unint64_t v11 = sub_24C8E43A0();
    unint64_t v37 = v11;
    uint64_t v12 = swift_allocObject();
    *(void *)&long long v35 = v12;
    *(void *)(v12 + 16) = 0x207865646E49;
    *(void *)(v12 + 24) = 0xE600000000000000;
    *(void *)(v12 + 32) = v4;
    *(unsigned char *)(v12 + 40) = 0;
    v7[2] = v10 + 1;
    sub_24C8E8100(&v35, (uint64_t)&v7[5 * v10 + 4]);
    id v13 = xpc_array_get_value(v3, v4);
    uint64_t v14 = MEMORY[0x263F8E970];
    unint64_t v15 = v5;
    uint64_t v16 = sub_24C8F3198(v13, 0x3436746E4955, 0xE600000000000000, MEMORY[0x263F8E970]);
    if (v1)
    {
      swift_unknownObjectRelease();
LABEL_12:
      sub_24C8EC4FC(v2);
      return v15;
    }
    unint64_t v15 = (void *)v16;
    char v26 = v17;
    swift_unknownObjectRelease();
    if (v26)
    {
      uint64_t v33 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v28 = v27;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
      *uint64_t v28 = v14;
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
      uint64_t v29 = swift_initStackObject();
      *(_OWORD *)(v29 + 16) = xmmword_24C8F9900;
      uint64_t v39 = v2[3];
      uint64_t v30 = v39;
      swift_bridgeObjectRetain();
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      *(void *)(v29 + 56) = &type metadata for XPCCodingKey;
      *(void *)(v29 + 64) = v11;
      uint64_t v31 = swift_allocObject();
      *(void *)(v29 + 32) = v31;
      *(void *)(v31 + 16) = 0x207865646E49;
      *(void *)(v31 + 24) = 0xE600000000000000;
      *(void *)(v31 + 32) = v30;
      *(unsigned char *)(v31 + 40) = 0;
      sub_24C8F24A0((void *)v29);
      v34[0] = 0;
      v34[1] = 0xE000000000000000;
      unint64_t v15 = v34;
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      sub_24C8F7F40();
      (*(void (**)(void *, void))(*(void *)(v33 - 8) + 104))(v28, *MEMORY[0x263F8DCC0]);
      swift_willThrow();
      goto LABEL_12;
    }
    v2[3] = v4 + 1;
    sub_24C8EC4FC(v2);
  }
  return v15;
}

float sub_24C8F6C4C()
{
  uint64_t v2 = v0;
  uint64_t v3 = (void *)v0[1];
  int64_t v4 = v0[3];
  if (v4 >= (uint64_t)xpc_array_get_count(v3))
  {
    uint64_t v17 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v19 = MEMORY[0x263F8D5C8];
    uint64_t v20 = *v0;
    swift_beginAccess();
    int64_t v21 = *(void *)(v20 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24C8F9900;
    uint64_t v23 = v0[3];
    unint64_t v38 = 0xE600000000000000;
    swift_bridgeObjectRetain();
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    *(void *)(inited + 56) = &type metadata for XPCCodingKey;
    *(void *)(inited + 64) = sub_24C8E43A0();
    uint64_t v24 = swift_allocObject();
    *(void *)(inited + 32) = v24;
    *(void *)(v24 + 16) = 0x207865646E49;
    *(void *)(v24 + 24) = 0xE600000000000000;
    *(void *)(v24 + 32) = v23;
    *(unsigned char *)(v24 + 40) = 0;
    int64_t v37 = v21;
    sub_24C8F24A0((void *)inited);
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x263F8DCC0], v17);
    swift_willThrow();
  }
  else
  {
    uint64_t v5 = *v0;
    *(void *)&long long v34 = 0x207865646E49;
    *((void *)&v34 + 1) = 0xE600000000000000;
    int64_t v37 = v4;
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    uint64_t v6 = (void *)(v5 + 16);
    swift_beginAccess();
    uint64_t v7 = *(void **)(v5 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v5 + 16) = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v7 = sub_24C8F2368(0, v7[2] + 1, 1, v7);
      *uint64_t v6 = v7;
    }
    unint64_t v10 = v7[2];
    unint64_t v9 = v7[3];
    if (v10 >= v9 >> 1)
    {
      uint64_t v7 = sub_24C8F2368((void *)(v9 > 1), v10 + 1, 1, v7);
      *uint64_t v6 = v7;
    }
    long long v35 = &type metadata for XPCCodingKey;
    unint64_t v33 = sub_24C8E43A0();
    unint64_t v36 = v33;
    uint64_t v11 = swift_allocObject();
    *(void *)&long long v34 = v11;
    *(void *)(v11 + 16) = 0x207865646E49;
    *(void *)(v11 + 24) = 0xE600000000000000;
    *(void *)(v11 + 32) = v4;
    *(unsigned char *)(v11 + 40) = 0;
    v7[2] = v10 + 1;
    sub_24C8E8100(&v34, (uint64_t)&v7[5 * v10 + 4]);
    xpc_object_t v12 = xpc_array_get_value(v3, v4);
    uint64_t v13 = MEMORY[0x2533006D0]();
    if (v13 == sub_24C8F7B30())
    {
      swift_unknownObjectRelease();
      uint64_t v25 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v27 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
      *uint64_t v27 = MEMORY[0x263F8D5C8];
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
      uint64_t v28 = swift_initStackObject();
      *(_OWORD *)(v28 + 16) = xmmword_24C8F9900;
      uint64_t v29 = v2[3];
      swift_bridgeObjectRetain();
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      *(void *)(v28 + 56) = &type metadata for XPCCodingKey;
      *(void *)(v28 + 64) = v33;
      uint64_t v30 = swift_allocObject();
      *(void *)(v28 + 32) = v30;
      *(void *)(v30 + 16) = 0x207865646E49;
      *(void *)(v30 + 24) = 0xE600000000000000;
      *(void *)(v30 + 32) = v29;
      *(unsigned char *)(v30 + 40) = 0;
      sub_24C8F24A0((void *)v28);
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      sub_24C8F7F40();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, *MEMORY[0x263F8DCC0], v25);
      swift_willThrow();
    }
    else
    {
      uint64_t v14 = MEMORY[0x2533006D0](v12);
      if (v14 == sub_24C8F7B70())
      {
        double value = xpc_double_get_value(v12);
        swift_unknownObjectRelease();
        float v1 = value;
        v2[3] = v4 + 1;
        sub_24C8EC4FC(v2);
        return v1;
      }
      sub_24C8F7F50();
      swift_allocError();
      uint64_t v16 = v15;
      swift_bridgeObjectRetain();
      sub_24C8E86AC(MEMORY[0x263F8D5C8], (uint64_t)v12, v16);
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
    }
    sub_24C8EC4FC(v2);
  }
  return v1;
}

double sub_24C8F720C()
{
  uint64_t v2 = v0;
  uint64_t v3 = (void *)v0[1];
  int64_t v4 = v0[3];
  if (v4 >= (uint64_t)xpc_array_get_count(v3))
  {
    uint64_t v17 = sub_24C8F7F50();
    swift_allocError();
    uint64_t v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
    *uint64_t v19 = MEMORY[0x263F8D538];
    uint64_t v20 = *v0;
    swift_beginAccess();
    int64_t v21 = *(void *)(v20 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24C8F9900;
    uint64_t v23 = v0[3];
    unint64_t v37 = 0xE600000000000000;
    swift_bridgeObjectRetain();
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    *(void *)(inited + 56) = &type metadata for XPCCodingKey;
    *(void *)(inited + 64) = sub_24C8E43A0();
    uint64_t v24 = swift_allocObject();
    *(void *)(inited + 32) = v24;
    *(void *)(v24 + 16) = 0x207865646E49;
    *(void *)(v24 + 24) = 0xE600000000000000;
    *(void *)(v24 + 32) = v23;
    *(unsigned char *)(v24 + 40) = 0;
    int64_t v36 = v21;
    sub_24C8F24A0((void *)inited);
    sub_24C8F7F40();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x263F8DCC0], v17);
    swift_willThrow();
  }
  else
  {
    uint64_t v5 = *v0;
    *(void *)&long long v33 = 0x207865646E49;
    *((void *)&v33 + 1) = 0xE600000000000000;
    int64_t v36 = v4;
    sub_24C8F8180();
    sub_24C8F7CF0();
    swift_bridgeObjectRelease();
    uint64_t v6 = (void *)(v5 + 16);
    swift_beginAccess();
    uint64_t v7 = *(void **)(v5 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v5 + 16) = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v7 = sub_24C8F2368(0, v7[2] + 1, 1, v7);
      *uint64_t v6 = v7;
    }
    unint64_t v10 = v7[2];
    unint64_t v9 = v7[3];
    if (v10 >= v9 >> 1)
    {
      uint64_t v7 = sub_24C8F2368((void *)(v9 > 1), v10 + 1, 1, v7);
      *uint64_t v6 = v7;
    }
    long long v34 = &type metadata for XPCCodingKey;
    unint64_t v32 = sub_24C8E43A0();
    unint64_t v35 = v32;
    uint64_t v11 = swift_allocObject();
    *(void *)&long long v33 = v11;
    *(void *)(v11 + 16) = 0x207865646E49;
    *(void *)(v11 + 24) = 0xE600000000000000;
    *(void *)(v11 + 32) = v4;
    *(unsigned char *)(v11 + 40) = 0;
    v7[2] = v10 + 1;
    sub_24C8E8100(&v33, (uint64_t)&v7[5 * v10 + 4]);
    xpc_object_t v12 = xpc_array_get_value(v3, v4);
    uint64_t v13 = MEMORY[0x2533006D0]();
    if (v13 == sub_24C8F7B30())
    {
      swift_unknownObjectRelease();
      uint64_t v25 = sub_24C8F7F50();
      swift_allocError();
      uint64_t v27 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F9640);
      *uint64_t v27 = MEMORY[0x263F8D538];
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F93D8);
      uint64_t v28 = swift_initStackObject();
      *(_OWORD *)(v28 + 16) = xmmword_24C8F9900;
      uint64_t v29 = v2[3];
      swift_bridgeObjectRetain();
      sub_24C8F8180();
      sub_24C8F7CF0();
      swift_bridgeObjectRelease();
      *(void *)(v28 + 56) = &type metadata for XPCCodingKey;
      *(void *)(v28 + 64) = v32;
      uint64_t v30 = swift_allocObject();
      *(void *)(v28 + 32) = v30;
      *(void *)(v30 + 16) = 0x207865646E49;
      *(void *)(v30 + 24) = 0xE600000000000000;
      *(void *)(v30 + 32) = v29;
      *(unsigned char *)(v30 + 40) = 0;
      sub_24C8F24A0((void *)v28);
      sub_24C8F7F00();
      swift_bridgeObjectRelease();
      sub_24C8F7F40();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, *MEMORY[0x263F8DCC0], v25);
      swift_willThrow();
    }
    else
    {
      uint64_t v14 = MEMORY[0x2533006D0](v12);
      if (v14 == sub_24C8F7B70())
      {
        double value = xpc_double_get_value(v12);
        swift_unknownObjectRelease();
        v2[3] = v4 + 1;
        sub_24C8EC4FC(v2);
        return value;
      }
      sub_24C8F7F50();
      swift_allocError();
      uint64_t v16 = v15;
      swift_bridgeObjectRetain();
      sub_24C8E86AC(MEMORY[0x263F8D538], (uint64_t)v12, v16);
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
    }
    sub_24C8EC4FC(v2);
  }
  return value;
}

uint64_t sub_24C8F77C8()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24C8F77D8(uint64_t a1, uint64_t a2)
{
  return sub_24C8ECE44(a1, a2, *(void *)(v2 + 32), *(void *)(v2 + 16));
}

uint64_t sub_24C8F77E4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24C8F77F4()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
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

uint64_t sub_24C8F78D0()
{
  return MEMORY[0x270EED998]();
}

uint64_t sub_24C8F78E0()
{
  return MEMORY[0x270EEDAA0]();
}

uint64_t sub_24C8F78F0()
{
  return MEMORY[0x270EEDB78]();
}

uint64_t sub_24C8F7900()
{
  return MEMORY[0x270EEDB90]();
}

uint64_t sub_24C8F7910()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_24C8F7920()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_24C8F7930()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_24C8F7940()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_24C8F7950()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_24C8F7960()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_24C8F7970()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_24C8F7980()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_24C8F7990()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_24C8F79A0()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_24C8F79B0()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_24C8F79C0()
{
  return MEMORY[0x270EEF7C8]();
}

uint64_t sub_24C8F79D0()
{
  return MEMORY[0x270EEF7E8]();
}

uint64_t sub_24C8F79E0()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_24C8F79F0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24C8F7A00()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24C8F7A10()
{
  return MEMORY[0x270EEFCA0]();
}

uint64_t sub_24C8F7A20()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24C8F7A30()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_24C8F7A40()
{
  return MEMORY[0x270EEFFE0]();
}

uint64_t sub_24C8F7A50()
{
  return MEMORY[0x270EEFFE8]();
}

uint64_t sub_24C8F7A60()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_24C8F7A70()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_24C8F7A80()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_24C8F7A90()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24C8F7AA0()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_24C8F7AB0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_24C8F7AC0()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_24C8F7AD0()
{
  return MEMORY[0x270EF0CF0]();
}

uint64_t sub_24C8F7AE0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24C8F7AF0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24C8F7B00()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24C8F7B10()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24C8F7B20()
{
  return MEMORY[0x270FA1978]();
}

uint64_t sub_24C8F7B30()
{
  return MEMORY[0x270FA19A0]();
}

uint64_t sub_24C8F7B40()
{
  return MEMORY[0x270FA19B8]();
}

uint64_t sub_24C8F7B50()
{
  return MEMORY[0x270FA19C0]();
}

uint64_t sub_24C8F7B60()
{
  return MEMORY[0x270FA19E0]();
}

uint64_t sub_24C8F7B70()
{
  return MEMORY[0x270FA19F0]();
}

uint64_t sub_24C8F7B80()
{
  return MEMORY[0x270FA1A00]();
}

uint64_t sub_24C8F7B90()
{
  return MEMORY[0x270FA1A08]();
}

uint64_t sub_24C8F7BA0()
{
  return MEMORY[0x270FA1A48]();
}

uint64_t sub_24C8F7BB0()
{
  return MEMORY[0x270FA2C18]();
}

uint64_t sub_24C8F7BC0()
{
  return MEMORY[0x270FA2C20]();
}

uint64_t sub_24C8F7BD0()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t sub_24C8F7BE0()
{
  return MEMORY[0x270FA1568]();
}

uint64_t sub_24C8F7BF0()
{
  return MEMORY[0x270FA1590]();
}

uint64_t sub_24C8F7C00()
{
  return MEMORY[0x270FA15C0]();
}

uint64_t sub_24C8F7C10()
{
  return MEMORY[0x270FA1600]();
}

uint64_t sub_24C8F7C20()
{
  return MEMORY[0x270FA1618]();
}

uint64_t sub_24C8F7C30()
{
  return MEMORY[0x270F9D220]();
}

uint64_t sub_24C8F7C40()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24C8F7C50()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24C8F7C60()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24C8F7C70()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24C8F7C80()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24C8F7C90()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24C8F7CA0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_24C8F7CB0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24C8F7CC0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_24C8F7CE0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24C8F7CF0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24C8F7D00()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_24C8F7D10()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24C8F7D20()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24C8F7D30()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24C8F7D40()
{
  return MEMORY[0x270EF1B98]();
}

uint64_t sub_24C8F7D50()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24C8F7D60()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24C8F7D70()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24C8F7D80()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_24C8F7D90()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24C8F7DA0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24C8F7DB0()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_24C8F7DC0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24C8F7DD0()
{
  return MEMORY[0x270F9DDF0]();
}

uint64_t sub_24C8F7DE0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_24C8F7DF0()
{
  return MEMORY[0x270EF1CA8]();
}

uint64_t sub_24C8F7E00()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24C8F7E10()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24C8F7E20()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24C8F7E30()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24C8F7E40()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24C8F7E50()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24C8F7E60()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24C8F7E70()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24C8F7E80()
{
  return MEMORY[0x270EF24C0]();
}

uint64_t sub_24C8F7E90()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24C8F7EA0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24C8F7EB0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24C8F7EC0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24C8F7ED0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24C8F7EE0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24C8F7EF0()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_24C8F7F00()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24C8F7F10()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24C8F7F20()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24C8F7F30()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_24C8F7F40()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24C8F7F50()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24C8F7F60()
{
  return MEMORY[0x270F9EAA0]();
}

uint64_t sub_24C8F7F70()
{
  return MEMORY[0x270F9EAB8]();
}

uint64_t sub_24C8F7F80()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24C8F7F90()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24C8F7FA0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24C8F7FB0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24C8F7FC0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24C8F7FD0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24C8F7FE0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24C8F7FF0()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t sub_24C8F8000()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24C8F8010()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24C8F8020()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24C8F8030()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24C8F8040()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24C8F8050()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24C8F8060()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24C8F8070()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24C8F8080()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24C8F8090()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24C8F80A0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24C8F80B0()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_24C8F80C0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24C8F80D0()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_24C8F80E0()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_24C8F80F0()
{
  return MEMORY[0x270F9F380]();
}

uint64_t sub_24C8F8100()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24C8F8110()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24C8F8120()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24C8F8130()
{
  return MEMORY[0x270F9F450]();
}

uint64_t sub_24C8F8140()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24C8F8150()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_24C8F8160()
{
  return MEMORY[0x270F9F4B0]();
}

uint64_t sub_24C8F8170()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24C8F8180()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24C8F8190()
{
  return MEMORY[0x270F9F5B0]();
}

uint64_t sub_24C8F81A0()
{
  return MEMORY[0x270F9F5B8]();
}

uint64_t sub_24C8F81B0()
{
  return MEMORY[0x270F9F5C0]();
}

uint64_t sub_24C8F81C0()
{
  return MEMORY[0x270F9F5C8]();
}

uint64_t sub_24C8F81D0()
{
  return MEMORY[0x270F9F5D0]();
}

uint64_t sub_24C8F81E0()
{
  return MEMORY[0x270F9F5D8]();
}

uint64_t sub_24C8F81F0()
{
  return MEMORY[0x270F9F5E0]();
}

uint64_t sub_24C8F8200()
{
  return MEMORY[0x270F9F5E8]();
}

uint64_t sub_24C8F8210()
{
  return MEMORY[0x270F9F5F0]();
}

uint64_t sub_24C8F8220()
{
  return MEMORY[0x270F9F5F8]();
}

uint64_t sub_24C8F8230()
{
  return MEMORY[0x270F9F688]();
}

uint64_t sub_24C8F8240()
{
  return MEMORY[0x270F9F690]();
}

uint64_t sub_24C8F8250()
{
  return MEMORY[0x270F9F698]();
}

uint64_t sub_24C8F8260()
{
  return MEMORY[0x270F9F6A0]();
}

uint64_t sub_24C8F8270()
{
  return MEMORY[0x270F9F6A8]();
}

uint64_t sub_24C8F8280()
{
  return MEMORY[0x270F9F6B0]();
}

uint64_t sub_24C8F8290()
{
  return MEMORY[0x270F9F6B8]();
}

uint64_t sub_24C8F82A0()
{
  return MEMORY[0x270F9F6C0]();
}

uint64_t sub_24C8F82B0()
{
  return MEMORY[0x270F9F6C8]();
}

uint64_t sub_24C8F82C0()
{
  return MEMORY[0x270F9F6D0]();
}

uint64_t sub_24C8F82D0()
{
  return MEMORY[0x270F9F6D8]();
}

uint64_t sub_24C8F82E0()
{
  return MEMORY[0x270F9F6E0]();
}

uint64_t sub_24C8F82F0()
{
  return MEMORY[0x270F9F6E8]();
}

uint64_t sub_24C8F8300()
{
  return MEMORY[0x270F9F6F0]();
}

uint64_t sub_24C8F8310()
{
  return MEMORY[0x270F9F6F8]();
}

uint64_t sub_24C8F8320()
{
  return MEMORY[0x270F9F700]();
}

uint64_t sub_24C8F8330()
{
  return MEMORY[0x270F9F708]();
}

uint64_t sub_24C8F8340()
{
  return MEMORY[0x270F9F710]();
}

uint64_t sub_24C8F8350()
{
  return MEMORY[0x270F9F718]();
}

uint64_t sub_24C8F8360()
{
  return MEMORY[0x270F9F720]();
}

uint64_t sub_24C8F8370()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_24C8F8380()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24C8F8390()
{
  return MEMORY[0x270F9F860]();
}

uint64_t sub_24C8F83A0()
{
  return MEMORY[0x270F9F868]();
}

uint64_t sub_24C8F83B0()
{
  return MEMORY[0x270F9F8F8]();
}

uint64_t sub_24C8F83C0()
{
  return MEMORY[0x270F9F900]();
}

uint64_t sub_24C8F83D0()
{
  return MEMORY[0x270F9F960]();
}

uint64_t sub_24C8F83E0()
{
  return MEMORY[0x270F9F968]();
}

uint64_t sub_24C8F83F0()
{
  return MEMORY[0x270F9F970]();
}

uint64_t sub_24C8F8400()
{
  return MEMORY[0x270F9F978]();
}

uint64_t sub_24C8F8410()
{
  return MEMORY[0x270F9F980]();
}

uint64_t sub_24C8F8420()
{
  return MEMORY[0x270F9F988]();
}

uint64_t sub_24C8F8430()
{
  return MEMORY[0x270F9F990]();
}

uint64_t sub_24C8F8440()
{
  return MEMORY[0x270F9F998]();
}

uint64_t sub_24C8F8450()
{
  return MEMORY[0x270F9F9A0]();
}

uint64_t sub_24C8F8460()
{
  return MEMORY[0x270F9F9A8]();
}

uint64_t sub_24C8F8470()
{
  return MEMORY[0x270F9F9B0]();
}

uint64_t sub_24C8F8480()
{
  return MEMORY[0x270F9F9B8]();
}

uint64_t sub_24C8F8490()
{
  return MEMORY[0x270F9F9C0]();
}

uint64_t sub_24C8F84A0()
{
  return MEMORY[0x270F9F9C8]();
}

uint64_t sub_24C8F84B0()
{
  return MEMORY[0x270F9F9D0]();
}

uint64_t sub_24C8F84C0()
{
  return MEMORY[0x270F9F9D8]();
}

uint64_t sub_24C8F84D0()
{
  return MEMORY[0x270F9F9E0]();
}

uint64_t sub_24C8F84E0()
{
  return MEMORY[0x270F9F9E8]();
}

uint64_t sub_24C8F84F0()
{
  return MEMORY[0x270F9F9F0]();
}

uint64_t sub_24C8F8500()
{
  return MEMORY[0x270F9F9F8]();
}

uint64_t sub_24C8F8510()
{
  return MEMORY[0x270F9FA00]();
}

uint64_t sub_24C8F8520()
{
  return MEMORY[0x270F9FA08]();
}

uint64_t sub_24C8F8530()
{
  return MEMORY[0x270F9FA10]();
}

uint64_t sub_24C8F8540()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24C8F8550()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24C8F8560()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24C8F8570()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24C8F8580()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24C8F8590()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24C8F85A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24C8F85B0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24C8F85C0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_24C8F85D0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24C8F85E0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24C8F85F0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24C8F8600()
{
  return MEMORY[0x270FA0090]();
}

uint64_t sub_24C8F8610()
{
  return MEMORY[0x270FA0098]();
}

uint64_t sub_24C8F8640()
{
  return MEMORY[0x270FA0128]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x270ED8068]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x270ED8468]();
}

void bzero(void *a1, size_t a2)
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

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x270EDB248](a1, a2, *(void *)&a3);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x270EDBDD8](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x270EDC168](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x270EDC170](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC210](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x270EDC218](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDC290]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x270EDC428](type);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC430](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDC440](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x270EDC458](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x270EDC460](xuuid);
}