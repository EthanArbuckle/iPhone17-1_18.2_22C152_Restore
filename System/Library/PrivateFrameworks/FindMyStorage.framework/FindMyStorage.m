unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

void sub_24E54ADD0()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.startup()()
{
  uint64_t v4 = v2;
  uint64_t v5 = v1;
  uint64_t v6 = v0;
  v7 = *(uint64_t (**)(void))(v1 + 32);
  uint64_t v8 = v7();
  swift_release();
  if (!v8)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 144))(v6, v5);
    if (!v3)
    {
      uint64_t v9 = ((uint64_t (*)(uint64_t, uint64_t))v7)(v6, v5);
      if (v9)
      {
        uint64_t v10 = *(void *)(v9 + 24);
        swift_retain();
        swift_release();
        sub_24E5513F0();
        Database.optimize()();
        if (v11)
        {
LABEL_5:
          swift_release();
          return;
        }
        sub_24E5513D0();
        _sqlite3_maintain_load_factor();
        int v45 = v10;
        int v13 = sub_24E54D664();
        v43 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 72);
        if ((int)v43(v6, v5) < v13)
        {
          if (qword_26B1C25E0 == -1)
          {
LABEL_10:
            uint64_t v14 = sub_24E5514A0();
            __swift_project_value_buffer(v14, (uint64_t)qword_26B1C2610);
            swift_unknownObjectRetain_n();
            v15 = sub_24E551480();
            os_log_type_t v16 = sub_24E551510();
            if (os_log_type_enabled(v15, v16))
            {
              uint64_t v17 = swift_slowAlloc();
              uint64_t v46 = swift_slowAlloc();
              uint64_t v49 = v46;
              *(_DWORD *)uint64_t v17 = 136446722;
              uint64_t v51 = v4;
              uint64_t v18 = sub_24E5515E0();
              uint64_t v51 = sub_24E54F53C(v18, v19, &v49);
              sub_24E551540();
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
              *(_WORD *)(v17 + 12) = 1024;
              LODWORD(v51) = v13;
              sub_24E551540();
              *(_WORD *)(v17 + 18) = 1024;
              int v20 = v43(v6, v5);
              swift_unknownObjectRelease();
              LODWORD(v51) = v20;
              sub_24E551540();
              swift_unknownObjectRelease();
              _os_log_impl(&dword_24E549000, v15, v16, "%{public}s Schema too new! (%d) -- expected <= %d", (uint8_t *)v17, 0x18u);
              swift_arrayDestroy();
              MEMORY[0x25333EDD0](v46, -1, -1);
              MEMORY[0x25333EDD0](v17, -1, -1);
            }
            else
            {

              swift_unknownObjectRelease_n();
            }
            sub_24E54FBD8();
            swift_allocError();
            *(_DWORD *)uint64_t v40 = v13;
            *(unsigned char *)(v40 + 4) = 0;
            swift_willThrow();
            goto LABEL_5;
          }
LABEL_33:
          swift_once();
          goto LABEL_10;
        }
        if (v13 < (int)v43(v6, v5))
        {
          int v13 = v10;
          uint64_t v21 = sub_24E54D664();
          int v22 = v43(v6, v5);
          if (v22 < (int)v21)
          {
            __break(1u);
LABEL_35:
            swift_once();
LABEL_16:
            v42 = *(void (**)(uint64_t))(v5 + 120);
            int v41 = v2;
            while ((int)v21 < (int)v2)
            {
              unsigned int v47 = v21 + 1;
              uint64_t v23 = sub_24E5514A0();
              __swift_project_value_buffer(v23, (uint64_t)qword_26B1C2610);
              swift_unknownObjectRetain();
              v24 = sub_24E551480();
              os_log_type_t v25 = sub_24E551520();
              if (os_log_type_enabled(v24, v25))
              {
                unsigned int type = v21;
                uint64_t v26 = swift_slowAlloc();
                uint64_t v27 = swift_slowAlloc();
                uint64_t v49 = v27;
                *(_DWORD *)uint64_t v26 = 136446722;
                uint64_t v51 = v4;
                uint64_t v28 = sub_24E5515E0();
                *(void *)(v26 + 4) = sub_24E54F53C(v28, v29, &v49);
                swift_unknownObjectRelease();
                swift_bridgeObjectRelease();
                *(_WORD *)(v26 + 12) = 1024;
                *(_DWORD *)(v26 + 14) = type;
                *(_WORD *)(v26 + 18) = 1024;
                *(_DWORD *)(v26 + 20) = v47;
                _os_log_impl(&dword_24E549000, v24, v25, "%{public}s migrating schema %d -> %d", (uint8_t *)v26, 0x18u);
                swift_arrayDestroy();
                uint64_t v30 = v27;
                int v13 = v45;
                MEMORY[0x25333EDD0](v30, -1, -1);
                uint64_t v31 = v26;
                uint64_t v21 = type;
                MEMORY[0x25333EDD0](v31, -1, -1);
              }
              else
              {

                swift_unknownObjectRelease();
              }
              v42(v21);
              uint64_t v49 = 0;
              unint64_t v50 = 0xE000000000000000;
              sub_24E551560();
              swift_bridgeObjectRelease();
              uint64_t v49 = 0xD000000000000016;
              unint64_t v50 = 0x800000024E551E30;
              LODWORD(v51) = v47;
              sub_24E5515E0();
              sub_24E5514C0();
              swift_bridgeObjectRelease();
              sub_24E5513C0();
              swift_bridgeObjectRelease();
              swift_release();
              uint64_t v21 = v47;
              LODWORD(v2) = v41;
              if (v41 == v47) {
                goto LABEL_22;
              }
            }
            __break(1u);
            goto LABEL_33;
          }
          LODWORD(v2) = v22;
          if (v21 != v22)
          {
            if (qword_26B1C25E0 == -1) {
              goto LABEL_16;
            }
            goto LABEL_35;
          }
LABEL_22:
          Database.excludeFromBackup()();
          if (v32) {
            goto LABEL_5;
          }
        }
        if (qword_26B1C25E0 != -1) {
          swift_once();
        }
        uint64_t v33 = sub_24E5514A0();
        __swift_project_value_buffer(v33, (uint64_t)qword_26B1C2610);
        swift_unknownObjectRetain_n();
        v34 = sub_24E551480();
        os_log_type_t v35 = sub_24E551520();
        if (os_log_type_enabled(v34, v35))
        {
          uint64_t v36 = swift_slowAlloc();
          uint64_t v48 = swift_slowAlloc();
          uint64_t v49 = v48;
          *(_DWORD *)uint64_t v36 = 136446466;
          uint64_t v51 = v4;
          uint64_t v37 = sub_24E5515E0();
          uint64_t v51 = sub_24E54F53C(v37, v38, &v49);
          sub_24E551540();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          *(_WORD *)(v36 + 12) = 1024;
          int v39 = v43(v6, v5);
          swift_unknownObjectRelease();
          LODWORD(v51) = v39;
          sub_24E551540();
          swift_unknownObjectRelease();
          _os_log_impl(&dword_24E549000, v34, v35, "%{public}s is available. [schema version %d]", (uint8_t *)v36, 0x12u);
          swift_arrayDestroy();
          MEMORY[0x25333EDD0](v48, -1, -1);
          MEMORY[0x25333EDD0](v36, -1, -1);
        }
        else
        {

          swift_unknownObjectRelease_n();
        }
        (*(void (**)(uint64_t, uint64_t))(v5 + 112))(v6, v5);
        goto LABEL_5;
      }
      sub_24E54FBD8();
      swift_allocError();
      *(_DWORD *)uint64_t v12 = 2;
      *(unsigned char *)(v12 + 4) = 1;
      swift_willThrow();
    }
  }
}

void sub_24E54B938()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.purge()()
{
  uint64_t v3 = v1;
  uint64_t v4 = v0;
  v68[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v66 = sub_24E551390();
  uint64_t v5 = *(void *)(v66 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v66);
  v62 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v58 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  int v13 = (char *)&v58 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  os_log_type_t v16 = (char *)&v58 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  unint64_t v19 = (char *)&v58 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  v65 = (char *)&v58 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v64 = (char *)&v58 - v23;
  MEMORY[0x270FA5388](v22);
  v63 = (char *)&v58 - v24;
  (*(void (**)(void, uint64_t, uint64_t))(v3 + 40))(0, v4, v3);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v3 + 80))(v4, v3) & 1) == 0)
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 24))(v4, v3);
    (*(void (**)(char *, char *, char *, char *, uint64_t, uint64_t))(v3 + 96))(v19, v16, v13, v10, v4, v3);
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v66);
    }
    else
    {
      uint64_t v61 = 0;
      uint64_t v25 = v66;
      v60 = *(void (**)(char *, uint64_t))(v5 + 8);
      v60(v10, v66);
      uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
      uint64_t v27 = v63;
      v26(v63, v19, v25);
      uint64_t v28 = v16;
      uint64_t v29 = v25;
      v26(v64, v28, v25);
      v26(v65, v13, v25);
      id v59 = objc_msgSend(self, sel_defaultManager);
      if (qword_26B1C25E0 != -1) {
        swift_once();
      }
      uint64_t v30 = sub_24E5514A0();
      __swift_project_value_buffer(v30, (uint64_t)qword_26B1C2610);
      uint64_t v31 = v62;
      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v62, v27, v25);
      uint64_t v32 = sub_24E551480();
      os_log_type_t v33 = sub_24E551520();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = v31;
        os_log_type_t v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v36 = (void *)swift_slowAlloc();
        v68[0] = v36;
        *(_DWORD *)os_log_type_t v35 = 136446210;
        sub_24E54FC38(&qword_26B1C2518, MEMORY[0x263F06EA8]);
        uint64_t v37 = sub_24E5515E0();
        uint64_t v67 = sub_24E54F53C(v37, v38, (uint64_t *)v68);
        uint64_t v29 = v66;
        sub_24E551540();
        swift_bridgeObjectRelease();
        int v39 = v60;
        v60(v34, v29);
        _os_log_impl(&dword_24E549000, v32, v33, "Purging database: %{public}s", v35, 0xCu);
        swift_arrayDestroy();
        uint64_t v40 = v36;
        int v41 = v63;
        MEMORY[0x25333EDD0](v40, -1, -1);
        MEMORY[0x25333EDD0](v35, -1, -1);
      }
      else
      {
        int v41 = v27;
        int v39 = v60;
        v60(v31, v29);
      }

      v42 = (void *)sub_24E551360();
      v68[0] = 0;
      id v43 = v59;
      unsigned int v44 = objc_msgSend(v59, sel_removeItemAtURL_error_, v42, v68);

      if (v44)
      {
        id v45 = v68[0];
      }
      else
      {
        id v46 = v68[0];
        uint64_t v47 = sub_24E551330();

        swift_willThrow();
        MEMORY[0x25333ED10](v47);
      }
      uint64_t v48 = (void *)sub_24E551360();
      v68[0] = 0;
      unsigned int v49 = objc_msgSend(v43, sel_removeItemAtURL_error_, v48, v68);

      if (v49)
      {
        id v50 = v68[0];
      }
      else
      {
        id v51 = v68[0];
        uint64_t v52 = sub_24E551330();

        swift_willThrow();
        MEMORY[0x25333ED10](v52);
      }
      v53 = (void *)sub_24E551360();
      v68[0] = 0;
      unsigned int v54 = objc_msgSend(v43, sel_removeItemAtURL_error_, v53, v68);

      if (v54)
      {
        id v55 = v68[0];
      }
      else
      {
        id v56 = v68[0];
        uint64_t v57 = sub_24E551330();

        swift_willThrow();
        MEMORY[0x25333ED10](v57);
      }
      v39(v65, v29);
      v39(v64, v29);
      v39(v41, v29);
    }
  }
}

void sub_24E54BFFC()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.reset()()
{
  uint64_t v3 = v1;
  uint64_t v4 = v0;
  (*(void (**)(void))(v1 + 128))();
  if (!v2) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 104))(v4, v3);
  }
}

void sub_24E54C06C()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.createIfNecessary()()
{
  uint64_t v3 = v1;
  uint64_t v4 = v0;
  uint64_t v5 = sub_24E551390();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 32))(v4, v3);
  swift_release();
  if (!v9)
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 24))(v4, v3);
    char v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 80))(v4, v3);
    uint64_t v11 = Database.establishConnection(baseContainerURL:temporary:)(v8, v10 & 1, v4, v3);
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    else
    {
      uint64_t v12 = v11;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 40))(v12, v4, v3);
    }
  }
}

uint64_t Database.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C25E8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v40 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_24E551390();
  uint64_t v7 = *(void *)(v41 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v41);
  char v10 = (char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)v37 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  os_log_type_t v16 = (char *)v37 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  unint64_t v19 = (char *)v37 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v37 - v20;
  (*(void (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
  uint64_t v22 = *(void (**)(char *, char *, char *, char *, uint64_t, uint64_t))(a2 + 96);
  uint64_t v42 = a1;
  uint64_t v43 = v2;
  v22(v19, v16, v13, v10, a1, a2);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v24 = v41;
  v37[1] = v7 + 8;
  unint64_t v38 = v21;
  v37[0] = v23;
  v23(v10, v41);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C25F0);
  uint64_t v26 = (uint64_t)v40;
  uint64_t v27 = &v40[*(int *)(v25 + 48)];
  int v39 = &v40[*(int *)(v25 + 64)];
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v28(v40, v19, v24);
  v28(v27, v16, v24);
  v28(v39, v13, v24);
  uint64_t v29 = *(void *)(v25 - 8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v25);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v26, 1, v25) == 1)
  {
    sub_24E54FCE8(v26, &qword_26B1C25E8);
  }
  else
  {
    uint64_t v30 = v26 + *(int *)(v25 + 48);
    uint64_t v31 = v26 + *(int *)(v25 + 64);
    uint64_t v32 = v38;
    v28(v38, (char *)v26, v24);
    os_log_type_t v33 = (void (*)(uint64_t, uint64_t))v37[0];
    ((void (*)(uint64_t, uint64_t))v37[0])(v31, v24);
    v33(v30, v24);
    sub_24E551380();
    v33((uint64_t)v32, v24);
  }
  uint64_t v45 = 0;
  unint64_t v46 = 0xE000000000000000;
  sub_24E551560();
  swift_bridgeObjectRelease();
  uint64_t v45 = 60;
  unint64_t v46 = 0xE100000000000000;
  uint64_t v44 = v43;
  uint64_t v34 = *(void *)(a2 + 16);
  uint64_t v35 = v42;
  sub_24E5515C0();
  sub_24E5514C0();
  swift_bridgeObjectRelease();
  sub_24E5514C0();
  MEMORY[0x25333EA60](v35, v34);
  sub_24E5514C0();
  swift_bridgeObjectRelease();
  sub_24E5514C0();
  sub_24E5514C0();
  sub_24E5514C0();
  sub_24E5514C0();
  swift_bridgeObjectRelease();
  sub_24E5514C0();
  return v45;
}

uint64_t Database.isolatedDescription.getter(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  uint64_t v5 = sub_24E5514F0();
  return MEMORY[0x270FA2498](sub_24E54C7A0, v5, v4);
}

uint64_t sub_24E54C7A0()
{
  uint64_t v1 = v0 + 2;
  uint64_t v2 = v0[4];
  uint64_t v3 = (*(uint64_t (**)(void, uint64_t))(v2 + 32))(v0[3], v2);
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[3];
  if (v3)
  {
    sub_24E551560();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v6 = *(void *)(v2 + 16);
    sub_24E5515C0();
    sub_24E5514C0();
    swift_bridgeObjectRelease();
    sub_24E5514C0();
    MEMORY[0x25333EA60](v5, v6);
    sub_24E5514C0();
    swift_bridgeObjectRelease();
    sub_24E5514C0();
    sub_24E5514C0();
    sub_24E5514C0();
    sub_24E5513B0();
    sub_24E5514C0();
    swift_bridgeObjectRelease();
    sub_24E5514C0();
    swift_release();
  }
  else
  {
    sub_24E551560();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v7 = *(void *)(v2 + 16);
    sub_24E5515C0();
    sub_24E5514C0();
    swift_bridgeObjectRelease();
    sub_24E5514C0();
    MEMORY[0x25333EA60](v5, v7);
    sub_24E5514C0();
    swift_bridgeObjectRelease();
    sub_24E5514C0();
    sub_24E5514C0();
    sub_24E5514C0();
  }
  uint64_t v8 = (uint64_t (*)(uint64_t, unint64_t))v0[1];
  return v8(60, 0xE100000000000000);
}

uint64_t Database.readConnection.getter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t *__return_ptr))(a2 + 56))(&v7);
  if (v7 != 1) {
    return 0;
  }
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = *(void *)(v4 + 16);
  swift_retain();
  swift_release();
  return v5;
}

BOOL static DatabaseState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Database.writeConnection.getter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t *__return_ptr))(a2 + 56))(&v7);
  if (v7 != 1) {
    return 0;
  }
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = *(void *)(v4 + 24);
  swift_retain();
  swift_release();
  return v5;
}

uint64_t Database.await(state:)()
{
  return sub_24E54FC2C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t Database.establishConnection(baseContainerURL:temporary:)(char *a1, int a2, uint64_t a3, uint64_t a4)
{
  int v116 = a2;
  v120 = a1;
  v124[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v7 = sub_24E551410();
  uint64_t v117 = *(void *)(v7 - 8);
  uint64_t v118 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  v115 = (uint64_t *)((char *)&v105 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v113 = (uint64_t *)((char *)&v105 - v11);
  MEMORY[0x270FA5388](v10);
  v112 = (void (*)(uint64_t, uint64_t, uint64_t))((char *)&v105 - v12);
  uint64_t v119 = sub_24E551390();
  uint64_t v121 = *(void *)(v119 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v119);
  v114 = (char *)&v105 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v105 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v105 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v105 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v105 - v25;
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v29 = (char *)&v105 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v105 - v30;
  uint64_t v32 = a4;
  os_log_type_t v33 = *(void (**)(char *, char *, char *, char *, uint64_t))(a4 + 96);
  uint64_t v34 = v122;
  uint64_t v35 = a3;
  uint64_t v36 = a3;
  uint64_t v37 = v32;
  v33(v23, v20, v17, v120, v36);
  v122 = v34;
  if (v34) {
    return v4;
  }
  uint64_t v109 = v4;
  uint64_t v110 = v35;
  uint64_t v111 = v37;
  unint64_t v38 = *(void (**)(char *, char *, uint64_t))(v121 + 32);
  uint64_t v39 = v119;
  v38(v31, v23, v119);
  v38(v29, v20, v39);
  v38(v26, v17, v39);
  uint64_t v40 = (unsigned int *)MEMORY[0x263F7BF98];
  uint64_t v41 = v39;
  uint64_t v42 = v31;
  uint64_t v43 = v29;
  v108 = v26;
  if ((v116 & 1) == 0)
  {
    uint64_t v49 = sub_24E551380();
    uint64_t v50 = (uint64_t)v113;
    uint64_t *v113 = v49;
    *(void *)(v50 + 8) = v51;
    uint64_t v52 = *v40;
    uint64_t v54 = v117;
    uint64_t v53 = v118;
    v112 = *(void (**)(uint64_t, uint64_t, uint64_t))(v117 + 104);
    v112(v50, v52, v118);
    id v55 = v122;
    uint64_t v56 = (*(uint64_t (**)(uint64_t))(v111 + 88))(v110);
    uint64_t v48 = v55;
    if (v55)
    {
      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v50, v53);
      goto LABEL_7;
    }
    uint64_t v80 = v56;
    unint64_t v81 = v57;
    type metadata accessor for ConnectionPair();
    swift_allocObject();
    uint64_t v4 = ConnectionPair.init(_:readonly:key:)(v50, 0, v80, v81);
    v79 = *(void (**)(char *, uint64_t))(v121 + 8);
    v79(v108, v41);
LABEL_28:
    v79(v43, v41);
    v79(v42, v41);
    return v4;
  }
  uint64_t v44 = *(char **)(v117 + 104);
  uint64_t v45 = (uint64_t)v112;
  ((void (*)(void, void, uint64_t))v44)(v112, *MEMORY[0x263F7BFA8], v118);
  type metadata accessor for ConnectionPair();
  swift_allocObject();
  unint64_t v46 = v122;
  uint64_t v47 = ConnectionPair.init(_:readonly:key:)(v45, 0, 0, 0xF000000000000000);
  uint64_t v48 = v46;
  if (!v46)
  {
    uint64_t v4 = v47;
    v79 = *(void (**)(char *, uint64_t))(v121 + 8);
    v79(v26, v41);
    goto LABEL_28;
  }
  v112 = (void (*)(uint64_t, uint64_t, uint64_t))v44;
LABEL_7:
  v113 = 0;
  uint64_t v58 = v121;
  v107 = v43;
  v122 = (uint64_t *)objc_msgSend(self, sel_defaultManager);
  id v59 = v114;
  if (qword_26B1C25E0 != -1) {
    swift_once();
  }
  uint64_t v60 = sub_24E5514A0();
  __swift_project_value_buffer(v60, (uint64_t)qword_26B1C2610);
  uint64_t v61 = *(void (**)(char *, char *, uint64_t))(v58 + 16);
  v120 = v42;
  v61(v59, v42, v41);
  MEMORY[0x25333ED20](v48);
  MEMORY[0x25333ED20](v48);
  v62 = sub_24E551480();
  os_log_type_t v63 = sub_24E551500();
  if (os_log_type_enabled(v62, v63))
  {
    v64 = v48;
    uint64_t v65 = swift_slowAlloc();
    v105 = (void *)swift_slowAlloc();
    v106 = (void *)swift_slowAlloc();
    v124[0] = v106;
    *(_DWORD *)uint64_t v65 = 136446466;
    sub_24E54FC38(&qword_26B1C2518, MEMORY[0x263F06EA8]);
    uint64_t v66 = sub_24E5515E0();
    uint64_t v123 = sub_24E54F53C(v66, v67, (uint64_t *)v124);
    sub_24E551540();
    swift_bridgeObjectRelease();
    v68 = *(void (**)(char *, uint64_t))(v121 + 8);
    v68(v59, v41);
    *(_WORD *)(v65 + 12) = 2114;
    uint64_t v69 = sub_24E551320();
    uint64_t v123 = v69;
    sub_24E551540();
    v70 = v105;
    void *v105 = v69;
    MEMORY[0x25333ED10](v64);
    MEMORY[0x25333ED10](v64);
    _os_log_impl(&dword_24E549000, v62, v63, "Unable to open %{public}s: %{public}@", (uint8_t *)v65, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698F0880);
    swift_arrayDestroy();
    MEMORY[0x25333EDD0](v70, -1, -1);
    v71 = v106;
    swift_arrayDestroy();
    MEMORY[0x25333EDD0](v71, -1, -1);
    uint64_t v72 = v65;
    uint64_t v48 = v64;
    MEMORY[0x25333EDD0](v72, -1, -1);
  }
  else
  {
    v68 = *(void (**)(char *, uint64_t))(v58 + 8);
    v68(v59, v41);
    MEMORY[0x25333ED10](v48);
    MEMORY[0x25333ED10](v48);
  }

  uint64_t v73 = v118;
  v74 = v107;
  v75 = v115;
  if ((v116 & 1) == 0)
  {
    v76 = (void *)sub_24E551360();
    v124[0] = 0;
    unsigned int v77 = objc_msgSend(v122, sel_removeItemAtURL_error_, v76, v124);

    if (v77)
    {
      id v78 = v124[0];
    }
    else
    {
      id v82 = v124[0];
      uint64_t v83 = sub_24E551330();

      swift_willThrow();
      MEMORY[0x25333ED10](v83);
      v113 = 0;
    }
    v84 = (void *)sub_24E551360();
    v124[0] = 0;
    unsigned int v85 = objc_msgSend(v122, sel_removeItemAtURL_error_, v84, v124);

    if (v85)
    {
      id v86 = v124[0];
    }
    else
    {
      id v87 = v124[0];
      uint64_t v88 = sub_24E551330();

      swift_willThrow();
      MEMORY[0x25333ED10](v88);
      v113 = 0;
    }
    v89 = (void *)sub_24E551360();
    v124[0] = 0;
    unsigned int v90 = objc_msgSend(v122, sel_removeItemAtURL_error_, v89, v124);

    if (v90)
    {
      id v91 = v124[0];
    }
    else
    {
      id v92 = v124[0];
      uint64_t v93 = sub_24E551330();

      swift_willThrow();
      MEMORY[0x25333ED10](v93);
      v113 = 0;
    }
  }
  uint64_t v95 = v110;
  uint64_t v94 = v111;
  uint64_t *v75 = sub_24E551380();
  v75[1] = v96;
  uint64_t v97 = v117;
  v112((uint64_t)v75, *MEMORY[0x263F7BF98], v73);
  v98 = v113;
  uint64_t v99 = (*(uint64_t (**)(uint64_t, uint64_t))(v94 + 88))(v95, v94);
  if (v98)
  {

    MEMORY[0x25333ED10](v48);
    (*(void (**)(uint64_t *, uint64_t))(v97 + 8))(v75, v73);
    v122 = v98;
    uint64_t v4 = v119;
    v68(v108, v119);
    v68(v74, v4);
    v68(v120, v4);
  }
  else
  {
    uint64_t v101 = v99;
    unint64_t v102 = v100;
    type metadata accessor for ConnectionPair();
    swift_allocObject();
    uint64_t v4 = ConnectionPair.init(_:readonly:key:)((uint64_t)v75, 0, v101, v102);

    MEMORY[0x25333ED10](v48);
    uint64_t v104 = v119;
    v68(v108, v119);
    v68(v74, v104);
    v68(v120, v104);
  }
  return v4;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.optimize()()
{
  sub_24E54DD04(v0, v1);
}

uint64_t sub_24E54D664()
{
  sub_24E5513E0();
  if (!v3) {
    goto LABEL_7;
  }
  sub_24E550A68(&v2, (uint64_t)v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2548);
  swift_dynamicCast();
  uint64_t result = v1;
  if (v1 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v1 > 0x7FFFFFFF)
  {
LABEL_6:
    __break(1u);
LABEL_7:
    __break(1u);
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.excludeFromBackup()()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v4 = sub_24E551310();
  uint64_t v48 = *(void *)(v4 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v50 = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_24E551390();
  uint64_t v6 = *(void *)(v55 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v9 = (char *)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)v46 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)v46 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)v46 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v49 = (char *)v46 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v52 = (char *)v46 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v51 = (char *)v46 - v23;
  id v53 = objc_msgSend(self, sel_defaultManager);
  (*(void (**)(uint64_t, uint64_t))(v2 + 24))(v3, v2);
  uint64_t v24 = v54;
  (*(void (**)(char *, char *, char *, char *, uint64_t, uint64_t))(v2 + 96))(v18, v15, v12, v9, v3, v2);
  if (v24)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v55);

    return;
  }
  uint64_t v54 = 0;
  uint64_t v47 = v4;
  uint64_t v25 = v55;
  v46[0] = *(void *)(v6 + 8);
  v46[1] = v6 + 8;
  ((void (*)(char *, uint64_t))v46[0])(v9, v55);
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  uint64_t v27 = v51;
  v26(v51, v18, v25);
  v26(v52, v15, v25);
  uint64_t v28 = v49;
  v26(v49, v12, v25);
  uint64_t v29 = v50;
  sub_24E551300();
  sub_24E5512F0();
  sub_24E551380();
  uint64_t v30 = (void *)sub_24E5514B0();
  swift_bridgeObjectRelease();
  id v31 = v53;
  LODWORD(v26) = objc_msgSend(v53, sel_fileExistsAtPath_, v30);

  uint64_t v32 = v52;
  if (v26)
  {
    os_log_type_t v33 = v27;
    uint64_t v34 = v54;
    sub_24E551350();
    uint64_t v35 = v34;
    if (v34)
    {

      (*(void (**)(char *, uint64_t))(v48 + 8))(v29, v47);
      uint64_t v36 = (void (*)(char *, uint64_t))v46[0];
      ((void (*)(char *, uint64_t))v46[0])(v28, v25);
      v36(v32, v25);
      v36(v33, v25);
      return;
    }
  }
  else
  {
    uint64_t v35 = v54;
  }
  sub_24E551380();
  uint64_t v37 = (void *)sub_24E5514B0();
  swift_bridgeObjectRelease();
  unsigned int v38 = objc_msgSend(v31, sel_fileExistsAtPath_, v37);

  if (v38)
  {
    sub_24E551350();
    if (v35)
    {

      (*(void (**)(char *, uint64_t))(v48 + 8))(v29, v47);
      uint64_t v39 = (void (*)(char *, uint64_t))v46[0];
      ((void (*)(char *, uint64_t))v46[0])(v28, v25);
      v39(v32, v25);
      v39(v51, v25);
      return;
    }
  }
  sub_24E551380();
  uint64_t v40 = (void *)sub_24E5514B0();
  swift_bridgeObjectRelease();
  unsigned int v41 = objc_msgSend(v31, sel_fileExistsAtPath_, v40);

  if (v41)
  {
    sub_24E551350();
    uint64_t v42 = v47;
    uint64_t v43 = v51;
    if (v35)
    {

      (*(void (**)(char *, uint64_t))(v48 + 8))(v29, v42);
      goto LABEL_16;
    }
    uint64_t v44 = v48;
  }
  else
  {
    uint64_t v42 = v47;
    uint64_t v44 = v48;
    uint64_t v43 = v51;
  }

  (*(void (**)(char *, uint64_t))(v44 + 8))(v29, v42);
LABEL_16:
  uint64_t v45 = (void (*)(char *, uint64_t))v46[0];
  ((void (*)(char *, uint64_t))v46[0])(v28, v25);
  v45(v32, v25);
  v45(v43, v25);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.incrementalVacuum()()
{
  sub_24E54DD04(v0, v1);
}

uint64_t sub_24E54DD04(uint64_t a1, uint64_t a2)
{
  if ((*(uint64_t (**)(void))(a2 + 32))())
  {
    swift_retain();
    swift_release();
    sub_24E5513F0();
    return swift_release();
  }
  else
  {
    sub_24E54FBD8();
    swift_allocError();
    *(_DWORD *)uint64_t v3 = 2;
    *(unsigned char *)(v3 + 4) = 1;
    return swift_willThrow();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.checkpoint(mode:)(FindMyStorage::DatabaseCheckpointMode mode)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)mode;
  if ((*(uint64_t (**)())(v1 + 32))())
  {
    swift_retain();
    swift_release();
    *(void *)pnCkpt = 0;
    uint64_t v3 = (sqlite3 *)sub_24E5513D0();
    sqlite3_wal_checkpoint_v2(v3, "main", v2, &pnCkpt[1], pnCkpt);
    if (qword_26B1C2558 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_24E5514A0();
    __swift_project_value_buffer(v4, (uint64_t)qword_26B1C25F8);
    uint64_t v5 = sub_24E551480();
    os_log_type_t v6 = sub_24E551520();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 67109376;
      swift_beginAccess();
      int v10 = pnCkpt[0];
      sub_24E551540();
      *(_WORD *)(v7 + 8) = 1024;
      swift_beginAccess();
      sub_24E551540();
      _os_log_impl(&dword_24E549000, v5, v6, "Checkpointed %d/%d", (uint8_t *)v7, 0xEu);
      MEMORY[0x25333EDD0](v7, -1, -1);
    }

    swift_release();
  }
  else
  {
    sub_24E54FBD8();
    swift_allocError();
    *(_DWORD *)uint64_t v8 = 2;
    *(unsigned char *)(v8 + 4) = 1;
    swift_willThrow();
  }
}

uint64_t Database.tableNames(connection:)()
{
  uint64_t v2 = sub_24E551400();
  if (v0) {
    return (uint64_t)v1;
  }
  uint64_t v3 = v2;
  v13[0] = v2;
  sub_24E551470();
  uint64_t v4 = (void (*)(uint64_t))MEMORY[0x263F7BFE8];
  sub_24E54FC38(&qword_26B1C24E8, MEMORY[0x263F7BFE8]);
  swift_retain();
  sub_24E5514E0();
  sub_24E54FC38(&qword_26B1C24F0, v4);
  uint64_t result = sub_24E551530();
  uint64_t v6 = v16;
  if (!v16)
  {
    uint64_t v1 = (void *)MEMORY[0x263F8EE78];
LABEL_20:
    swift_release();
    swift_release();
    return (uint64_t)v1;
  }
  uint64_t v1 = (void *)MEMORY[0x263F8EE78];
  while (*(void *)(v6 + 16))
  {
    sub_24E54FC80(v6 + 32, (uint64_t)v13);
    if (v13[3])
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2548);
      if (swift_dynamicCast()) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_24E54FCE8((uint64_t)v13, &qword_26B1C2550);
    }
    uint64_t v14 = 0;
    uint64_t v15 = 0;
LABEL_10:
    swift_bridgeObjectRelease();
    uint64_t v7 = v15;
    if (v15)
    {
      uint64_t v11 = v14;
      uint64_t v12 = v3;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v1 = sub_24E54F42C(0, v1[2] + 1, 1, v1);
      }
      unint64_t v9 = v1[2];
      unint64_t v8 = v1[3];
      if (v9 >= v8 >> 1) {
        uint64_t v1 = sub_24E54F42C((void *)(v8 > 1), v9 + 1, 1, v1);
      }
      v1[2] = v9 + 1;
      int v10 = &v1[2 * v9];
      v10[4] = v11;
      v10[5] = v7;
      uint64_t result = sub_24E551530();
      uint64_t v6 = v16;
      uint64_t v3 = v12;
      if (!v16) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t result = sub_24E551530();
      uint64_t v6 = v16;
      if (!v16) {
        goto LABEL_20;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t Database.columnNames(connection:tableName:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24E551400();
  if (v3) {
    return (uint64_t)v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C24E0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_24E5519F0;
  uint64_t v8 = MEMORY[0x263F7C008];
  *(void *)(v7 + 56) = MEMORY[0x263F8D310];
  *(void *)(v7 + 64) = v8;
  *(void *)(v7 + 32) = a2;
  *(void *)(v7 + 40) = a3;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_24E551460();
  swift_bridgeObjectRelease();
  v20[0] = v10;
  sub_24E551470();
  uint64_t v11 = (void (*)(uint64_t))MEMORY[0x263F7BFE8];
  sub_24E54FC38(&qword_26B1C24E8, MEMORY[0x263F7BFE8]);
  swift_retain();
  sub_24E5514E0();
  sub_24E54FC38(&qword_26B1C24F0, v11);
  uint64_t result = sub_24E551530();
  uint64_t v12 = v23;
  if (!v23)
  {
    uint64_t v4 = (void *)MEMORY[0x263F8EE78];
LABEL_21:
    swift_release();
    swift_release();
    swift_release();
    return (uint64_t)v4;
  }
  uint64_t v4 = (void *)MEMORY[0x263F8EE78];
  while (*(void *)(v12 + 16))
  {
    sub_24E54FC80(v12 + 32, (uint64_t)v20);
    if (v20[3])
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2548);
      if (swift_dynamicCast()) {
        goto LABEL_12;
      }
    }
    else
    {
      sub_24E54FCE8((uint64_t)v20, &qword_26B1C2550);
    }
    uint64_t v21 = 0;
    uint64_t v22 = 0;
LABEL_12:
    swift_bridgeObjectRelease();
    uint64_t v13 = v22;
    if (v22)
    {
      uint64_t v19 = v21;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v4 = sub_24E54F42C(0, v4[2] + 1, 1, v4);
      }
      unint64_t v15 = v4[2];
      unint64_t v14 = v4[3];
      unint64_t v16 = v15 + 1;
      if (v15 >= v14 >> 1)
      {
        uint64_t v18 = sub_24E54F42C((void *)(v14 > 1), v15 + 1, 1, v4);
        unint64_t v16 = v15 + 1;
        uint64_t v4 = v18;
      }
      v4[2] = v16;
      uint64_t v17 = &v4[2 * v15];
      v17[4] = v19;
      v17[5] = v13;
    }
    uint64_t result = sub_24E551530();
    uint64_t v12 = v23;
    if (!v23) {
      goto LABEL_21;
    }
  }
  __break(1u);
  return result;
}

Swift::Int64 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database._test_raw_scalar_sql_query(_:)(Swift::String a1)
{
  uint64_t v4 = v2;
  uint64_t v5 = v1;
  if ((MEMORY[0x25333E740]() & 1) == 0) {
    return 0;
  }
  if (Database.readConnection.getter(v5, v4))
  {
    sub_24E5513E0();
    if (!v3)
    {
      if (v11)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2548);
        if (swift_dynamicCast())
        {
          swift_release();
          return v9;
        }
      }
      else
      {
        sub_24E54FCE8((uint64_t)v10, &qword_26B1C2550);
      }
      sub_24E54FBD8();
      swift_allocError();
      *(_DWORD *)uint64_t v8 = 0;
      *(unsigned char *)(v8 + 4) = 1;
      swift_willThrow();
    }
    return swift_release();
  }
  else
  {
    sub_24E54FBD8();
    swift_allocError();
    *(_DWORD *)uint64_t v7 = 2;
    *(unsigned char *)(v7 + 4) = 1;
    return swift_willThrow();
  }
}

void *sub_24E54E6E8(uint64_t a1, int a2, uint64_t a3, unint64_t a4)
{
  int v26 = a2;
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v7 = sub_24E551390();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(self, sel_defaultManager);
  sub_24E551370();
  uint64_t v12 = (void *)sub_24E551360();
  unint64_t v15 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  uint64_t v13 = v8 + 8;
  unint64_t v14 = v15;
  v15((uint64_t)v10, v7);
  *(void *)uint64_t v29 = 0;
  LODWORD(v10) = objc_msgSend(v11, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v12, 1, 0, v29);

  id v16 = *(id *)v29;
  if (v10)
  {
    uint64_t v24 = v14;
    uint64_t v25 = v13;
    sub_24E551380();
    uint64_t v17 = v27;
    uint64_t v18 = v28;
    uint64_t v19 = sub_24E551440();
    if (v18)
    {
      sub_24E550674(a3, a4);
      v24(a1, v7);
    }
    else
    {
      uint64_t v17 = (void *)v19;
      if (a4 >> 60 == 15)
      {
        swift_retain();
      }
      else
      {
        uint64_t v21 = a3;
        switch(a4 >> 62)
        {
          case 1uLL:
            if ((int)a3 > a3 >> 32) {
              __break(1u);
            }
            swift_retain();
            sub_24E5507F4(a3, a4);
            swift_retain();
            sub_24E5507F4(a3, a4);
            sub_24E5506E0((int)a3, a4 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t)v17, a3, a4);
            break;
          case 2uLL:
            uint64_t v22 = *(void *)(a3 + 16);
            swift_retain();
            sub_24E5507F4(v21, a4);
            swift_retain();
            sub_24E5507F4(v21, a4);
            swift_retain();
            swift_retain();
            sub_24E5506E0(v22, a4 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t)v17, v21, a4);
            swift_release();
            swift_release();
            break;
          case 3uLL:
            *(void *)&v29[6] = 0;
            *(void *)uint64_t v29 = 0;
            swift_retain_n();
            sub_24E5513D0();
            goto LABEL_12;
          default:
            *(void *)uint64_t v29 = a3;
            *(_WORD *)&v29[8] = a4;
            v29[10] = BYTE2(a4);
            v29[11] = BYTE3(a4);
            v29[12] = BYTE4(a4);
            v29[13] = BYTE5(a4);
            swift_retain_n();
            sub_24E5513D0();
LABEL_12:
            sqlite3_key_v2();
            sub_24E550674(a3, a4);
            break;
        }
        swift_release();
        sub_24E550674(v21, a4);
        sub_24E5513E0();
        sub_24E54FCE8((uint64_t)v29, &qword_26B1C2550);
        sub_24E550674(v21, a4);
        sub_24E550674(v21, a4);
      }
      v24(a1, v7);
      swift_release();
    }
  }
  else
  {
    uint64_t v17 = v16;
    sub_24E551330();

    swift_willThrow();
    sub_24E550674(a3, a4);
    v14(a1, v7);
  }
  return v17;
}

uint64_t DatabaseState.hash(into:)()
{
  return sub_24E551650();
}

uint64_t DatabaseState.hashValue.getter()
{
  return sub_24E551660();
}

BOOL sub_24E54EC8C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24E54ECA4()
{
  return sub_24E551660();
}

uint64_t sub_24E54ECEC()
{
  return sub_24E551650();
}

uint64_t sub_24E54ED18()
{
  return sub_24E551660();
}

unint64_t static UInt8.fromDatatypeValue(_:)(unint64_t result)
{
  if ((result & 0x8000000000000000) != 0 || result >= 0x100)
  {
    uint64_t result = sub_24E551590();
    __break(1u);
  }
  return result;
}

uint64_t UInt8.datatypeValue.getter(uint64_t result)
{
  return result;
}

unint64_t *sub_24E54EE24@<X0>(unint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  unint64_t v2 = *result;
  if ((*result & 0x8000000000000000) != 0 || v2 >= 0x100)
  {
    uint64_t result = (unint64_t *)sub_24E551590();
    __break(1u);
  }
  else
  {
    *a2 = v2;
  }
  return result;
}

void sub_24E54EED8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24E54EEE4(uint64_t a1)
{
  unint64_t v2 = sub_24E550620();

  return MEMORY[0x270F79440](a1, v2);
}

uint64_t static Int32.fromDatatypeValue(_:)(uint64_t result)
{
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (result > 0x7FFFFFFF) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t Int32.datatypeValue.getter(uint64_t result)
{
  return (int)result;
}

uint64_t *sub_24E54EF60@<X0>(uint64_t *result@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2 = *result;
  if (*result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v2 <= 0x7FFFFFFF)
  {
    *a2 = v2;
    return result;
  }
  __break(1u);
  return result;
}

void sub_24E54EF8C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24E54EF98(uint64_t a1)
{
  unint64_t v2 = sub_24E5505CC();

  return MEMORY[0x270F79440](a1, v2);
}

unint64_t static UInt32.fromDatatypeValue(_:)(unint64_t result)
{
  if ((result & 0x8000000000000000) != 0 || HIDWORD(result))
  {
    uint64_t result = sub_24E551590();
    __break(1u);
  }
  return result;
}

uint64_t UInt32.datatypeValue.getter(uint64_t result)
{
  return result;
}

unint64_t *sub_24E54F098@<X0>(unint64_t *result@<X0>, _DWORD *a2@<X8>)
{
  unint64_t v2 = *result;
  if ((*result & 0x8000000000000000) != 0 || HIDWORD(v2))
  {
    uint64_t result = (unint64_t *)sub_24E551590();
    __break(1u);
  }
  else
  {
    *a2 = v2;
  }
  return result;
}

void sub_24E54F14C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24E54F158(uint64_t a1)
{
  unint64_t v2 = sub_24E550578();

  return MEMORY[0x270F79440](a1, v2);
}

uint64_t static UInt64.fromDatatypeValue(_:)(uint64_t result)
{
  if (result < 0)
  {
    uint64_t result = sub_24E551590();
    __break(1u);
  }
  return result;
}

uint64_t UInt64.datatypeValue.getter(uint64_t result)
{
  if (result < 0) {
    __break(1u);
  }
  return result;
}

void *sub_24E54F210@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if ((*result & 0x8000000000000000) != 0)
  {
    uint64_t result = (void *)sub_24E551590();
    __break(1u);
  }
  else
  {
    *a2 = *result;
  }
  return result;
}

void sub_24E54F280(void *a1@<X8>)
{
  if ((*v1 & 0x8000000000000000) != 0) {
    __break(1u);
  }
  else {
    *a1 = *v1;
  }
}

uint64_t sub_24E54F294(uint64_t a1)
{
  unint64_t v2 = sub_24E550524();

  return MEMORY[0x270F79440](a1, v2);
}

BOOL static DatabaseCheckpointMode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DatabaseCheckpointMode.hash(into:)()
{
  return sub_24E551650();
}

uint64_t DatabaseCheckpointMode.hashValue.getter()
{
  return sub_24E551660();
}

BOOL sub_24E54F368(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24E54F37C()
{
  uint64_t v0 = sub_24E5514A0();
  __swift_allocate_value_buffer(v0, qword_26B1C2610);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1C2610);
  return sub_24E551490();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void *sub_24E54F42C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C24F8);
      uint64_t v10 = (void *)swift_allocObject();
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
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
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
    sub_24E550860(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24E54F53C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24E54F610(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24E5509A8((uint64_t)v12, *a3);
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
      sub_24E5509A8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24E54F610(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24E551550();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24E54F7CC(a5, a6);
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
  uint64_t v8 = sub_24E551580();
  if (!v8)
  {
    sub_24E551590();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24E5515B0();
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

uint64_t sub_24E54F7CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24E54F864(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24E54FA44(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24E54FA44(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24E54F864(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24E54F9DC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24E551570();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24E551590();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24E5514D0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24E5515B0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24E551590();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24E54F9DC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698F08D8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24E54FA44(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698F08D8);
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
  uint64_t result = sub_24E5515B0();
  __break(1u);
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

unint64_t sub_24E54FBD8()
{
  unint64_t result = qword_2698F0888;
  if (!qword_2698F0888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698F0888);
  }
  return result;
}

uint64_t sub_24E54FC2C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24E54FC38(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24E54FC80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C2550);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24E54FCE8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24E54FD48()
{
  unint64_t result = qword_2698F08A0;
  if (!qword_2698F08A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698F08A0);
  }
  return result;
}

unint64_t sub_24E54FDA0()
{
  unint64_t result = qword_26B1C2500;
  if (!qword_26B1C2500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C2500);
  }
  return result;
}

uint64_t sub_24E54FDF4()
{
  return MEMORY[0x263F7C028];
}

unint64_t sub_24E54FE04()
{
  unint64_t result = qword_2698F08A8;
  if (!qword_2698F08A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698F08A8);
  }
  return result;
}

unint64_t sub_24E54FE5C()
{
  unint64_t result = qword_2698F08B0;
  if (!qword_2698F08B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698F08B0);
  }
  return result;
}

unint64_t sub_24E54FEB4()
{
  unint64_t result = qword_26B1C2508;
  if (!qword_26B1C2508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C2508);
  }
  return result;
}

unint64_t sub_24E54FF0C()
{
  unint64_t result = qword_2698F08B8;
  if (!qword_2698F08B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698F08B8);
  }
  return result;
}

uint64_t dispatch thunk of Database.baseContainerURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of Database.connectionPair.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of Database.connectionPair.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of Database.connectionPair.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of Database.state.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of Database.stateStream.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of Database.currentVersion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of Database.temporary.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of Database.encryptionKey()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of Database.underlyingFileURLs(baseContainerURL:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 96))();
}

uint64_t dispatch thunk of Database.startup()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of Database.databaseAvailable()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

uint64_t dispatch thunk of Database.migrate(from:to:writeConnection:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 120))();
}

uint64_t dispatch thunk of Database.purge()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t dispatch thunk of Database.reset()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

uint64_t dispatch thunk of Database.createIfNecessary()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 144))();
}

uint64_t getEnumTagSinglePayload for DatabaseState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DatabaseState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E55028CLL);
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

uint64_t sub_24E5502B4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24E5502C0(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DatabaseState()
{
  return &type metadata for DatabaseState;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DatabaseError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DatabaseError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 4) = 0;
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
  *(unsigned char *)(result + 5) = v3;
  return result;
}

uint64_t sub_24E55033C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24E550358(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)unint64_t result = a2 - 1;
    *(unsigned char *)(result + 4) = 1;
  }
  else
  {
    *(unsigned char *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for DatabaseError()
{
  return &type metadata for DatabaseError;
}

uint64_t getEnumTagSinglePayload for DatabaseCheckpointMode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DatabaseCheckpointMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E5504E4);
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

unsigned char *sub_24E55050C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DatabaseCheckpointMode()
{
  return &type metadata for DatabaseCheckpointMode;
}

unint64_t sub_24E550524()
{
  unint64_t result = qword_26B1C2510;
  if (!qword_26B1C2510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1C2510);
  }
  return result;
}

unint64_t sub_24E550578()
{
  unint64_t result = qword_2698F08C0;
  if (!qword_2698F08C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698F08C0);
  }
  return result;
}

unint64_t sub_24E5505CC()
{
  unint64_t result = qword_2698F08C8;
  if (!qword_2698F08C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698F08C8);
  }
  return result;
}

unint64_t sub_24E550620()
{
  unint64_t result = qword_2698F08D0;
  if (!qword_2698F08D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698F08D0);
  }
  return result;
}

uint64_t sub_24E550674(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24E550688(a1, a2);
  }
  return a1;
}

uint64_t sub_24E550688(uint64_t a1, unint64_t a2)
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

uint64_t sub_24E5506E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  if (sub_24E5512C0() && __OFSUB__(a1, sub_24E5512E0())) {
    goto LABEL_13;
  }
  sub_24E5512D0();
  sub_24E5513D0();
  switch(a5 >> 62)
  {
    case 1uLL:
      if (!__OFSUB__(HIDWORD(a4), a4)) {
        return sqlite3_key_v2();
      }
      __break(1u);
LABEL_7:
      uint64_t v9 = *(void *)(a4 + 16);
      uint64_t v8 = *(void *)(a4 + 24);
      uint64_t v10 = v8 - v9;
      if (__OFSUB__(v8, v9)) {
        goto LABEL_14;
      }
      if (v10 < (uint64_t)0xFFFFFFFF80000000)
      {
        __break(1u);
        goto LABEL_12;
      }
      if (v10 > 0x7FFFFFFF)
      {
LABEL_12:
        __break(1u);
LABEL_13:
        __break(1u);
LABEL_14:
        __break(1u);
        JUMPOUT(0x24E5507E4);
      }
      return sqlite3_key_v2();
    case 2uLL:
      goto LABEL_7;
    default:
      return sqlite3_key_v2();
  }
}

uint64_t sub_24E5507F4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24E550808(a1, a2);
  }
  return a1;
}

uint64_t sub_24E550808(uint64_t a1, unint64_t a2)
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

uint64_t sub_24E550860(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_24E5515B0();
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

uint64_t sub_24E5509A8(uint64_t a1, uint64_t a2)
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

uint64_t sub_24E550A68(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t ConnectionPair.__allocating_init(_:readonly:key:)(uint64_t a1, int a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  ConnectionPair.init(_:readonly:key:)(a1, a2, a3, a4);
  return v8;
}

uint64_t ConnectionPair.readConnection.getter()
{
  return swift_retain();
}

uint64_t ConnectionPair.writeConnection.getter()
{
  return swift_retain();
}

uint64_t ConnectionPair.init(_:readonly:key:)(uint64_t a1, int a2, uint64_t a3, unint64_t a4)
{
  unint64_t v44 = a4;
  uint64_t v47 = a3;
  int v42 = a2;
  uint64_t v41 = *v4;
  uint64_t v51 = sub_24E551390();
  uint64_t v40 = *(void *)(v51 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v51);
  uint64_t v39 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v39 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v48 = (char *)&v39 - v11;
  uint64_t v12 = sub_24E551410();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  id v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v39 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v39 - v20;
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v45 = a1;
  v22((char *)&v39 - v20, a1, v12);
  int v23 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v21, v12);
  if (v23 != *MEMORY[0x263F7BF98])
  {
    uint64_t v32 = v43;
    if (v23 != *MEMORY[0x263F7BFA0] && v23 != *MEMORY[0x263F7BFA8])
    {
      v22(v16, v45, v12);
      unint64_t v49 = 0;
      unint64_t v50 = 0xE000000000000000;
      sub_24E551560();
      swift_bridgeObjectRelease();
      unint64_t v49 = 0xD000000000000014;
      unint64_t v50 = 0x800000024E5522F0;
      sub_24E5510D0();
      sub_24E5515E0();
      sub_24E5514C0();
      swift_bridgeObjectRelease();
      uint64_t result = sub_24E5515A0();
      __break(1u);
      return result;
    }
    uint64_t v34 = v45;
    v22(v19, v45, v12);
    sub_24E551420();
    swift_allocObject();
    uint64_t v35 = v32;
    uint64_t v36 = sub_24E551430();
    uint64_t v31 = v46;
    if (v35)
    {
      sub_24E550674(v47, v44);
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v34, v12);
      goto LABEL_12;
    }
    *(void *)(v46 + 16) = v36;
    *(void *)(v31 + 24) = v36;
    swift_retain();
    unint64_t v28 = v44;
LABEL_14:
    swift_retain();
    sub_24E5513A0();
    swift_release();
    sub_24E5513A0();
    sub_24E550674(v47, v28);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v34, v12);
    return v31;
  }
  (*(void (**)(char *, uint64_t))(v13 + 96))(v21, v12);
  uint64_t v24 = v48;
  sub_24E551340();
  swift_bridgeObjectRelease();
  sub_24E551420();
  uint64_t v25 = v40;
  int v26 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
  v26(v10, v24, v51);
  uint64_t v27 = v47;
  unint64_t v28 = v44;
  sub_24E5507F4(v47, v44);
  uint64_t v29 = v43;
  uint64_t v30 = sub_24E54E6E8((uint64_t)v10, v42 & 1, v27, v28);
  if (!v29)
  {
    uint64_t v31 = v46;
    *(void *)(v46 + 24) = v30;
    v26(v39, v48, v51);
    sub_24E5507F4(v27, v28);
    uint64_t v37 = sub_24E54E6E8((uint64_t)v39, 1, v27, v28);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v48, v51);
    *(void *)(v31 + 16) = v37;
    uint64_t v34 = v45;
    goto LABEL_14;
  }
  sub_24E550674(v27, v28);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v45, v12);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v48, v51);
  uint64_t v31 = v46;
LABEL_12:
  swift_deallocPartialClassInstance();
  return v31;
}

unint64_t sub_24E5510D0()
{
  unint64_t result = qword_2698F08E0;
  if (!qword_2698F08E0)
  {
    sub_24E551410();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698F08E0);
  }
  return result;
}

uint64_t ConnectionPair.deinit()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t ConnectionPair.__deallocating_deinit()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t ConnectionPair.description.getter()
{
  return sub_24E5513B0();
}

uint64_t sub_24E5511B4()
{
  return sub_24E5513B0();
}

uint64_t type metadata accessor for ConnectionPair()
{
  return self;
}

uint64_t method lookup function for ConnectionPair(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ConnectionPair);
}

uint64_t dispatch thunk of ConnectionPair.__allocating_init(_:readonly:key:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_24E551240()
{
  uint64_t v0 = sub_24E5514A0();
  __swift_allocate_value_buffer(v0, qword_26B1C25F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1C25F8);
  return sub_24E551490();
}

uint64_t sub_24E5512C0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_24E5512D0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_24E5512E0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_24E5512F0()
{
  return MEMORY[0x270EEEF88]();
}

uint64_t sub_24E551300()
{
  return MEMORY[0x270EEEFE8]();
}

uint64_t sub_24E551310()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_24E551320()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24E551330()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24E551340()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_24E551350()
{
  return MEMORY[0x270EEFCE8]();
}

uint64_t sub_24E551360()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24E551370()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_24E551380()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_24E551390()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24E5513A0()
{
  return MEMORY[0x270F79300]();
}

uint64_t sub_24E5513B0()
{
  return MEMORY[0x270F79308]();
}

uint64_t sub_24E5513C0()
{
  return MEMORY[0x270F79310]();
}

uint64_t sub_24E5513D0()
{
  return MEMORY[0x270F79328]();
}

uint64_t sub_24E5513E0()
{
  return MEMORY[0x270F79330]();
}

uint64_t sub_24E5513F0()
{
  return MEMORY[0x270F79340]();
}

uint64_t sub_24E551400()
{
  return MEMORY[0x270F79348]();
}

uint64_t sub_24E551410()
{
  return MEMORY[0x270F79358]();
}

uint64_t sub_24E551420()
{
  return MEMORY[0x270F79368]();
}

uint64_t sub_24E551430()
{
  return MEMORY[0x270F79370]();
}

uint64_t sub_24E551440()
{
  return MEMORY[0x270F79378]();
}

uint64_t sub_24E551460()
{
  return MEMORY[0x270F794A8]();
}

uint64_t sub_24E551470()
{
  return MEMORY[0x270F794C0]();
}

uint64_t sub_24E551480()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24E551490()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24E5514A0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24E5514B0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24E5514C0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24E5514D0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24E5514E0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_24E5514F0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24E551500()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24E551510()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24E551520()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24E551530()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_24E551540()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24E551550()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24E551560()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24E551570()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24E551580()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24E551590()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24E5515A0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24E5515B0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24E5515C0()
{
  return MEMORY[0x270F28EB0]();
}

uint64_t sub_24E5515D0()
{
  return MEMORY[0x270F28EB8]();
}

uint64_t sub_24E5515E0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24E5515F0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24E551600()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24E551610()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24E551620()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t _ss5Int32V13FindMyStorageE16declaredDatatypeSSvgZ_0()
{
  return MEMORY[0x270F794D0]();
}

uint64_t sub_24E551640()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24E551650()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24E551660()
{
  return MEMORY[0x270F9FC90]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sqlite3_maintain_load_factor()
{
  return MEMORY[0x270F9B458]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t sqlite3_key_v2()
{
  return MEMORY[0x270F9B6C8]();
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x270F9B900](db, zDb, *(void *)&eMode, pnLog, pnCkpt);
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

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
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