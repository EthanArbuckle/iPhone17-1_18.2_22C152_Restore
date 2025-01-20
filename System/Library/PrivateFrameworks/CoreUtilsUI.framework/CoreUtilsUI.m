ValueMetadata *type metadata accessor for CUPlaceholder()
{
  return &type metadata for CUPlaceholder;
}

uint64_t sub_22A30D970()
{
  uint64_t v0 = sub_22A313B00();
  __swift_allocate_value_buffer(v0, qword_268372CC0);
  __swift_project_value_buffer(v0, (uint64_t)qword_268372CC0);
  return sub_22A313AF0();
}

void sub_22A30DACC(uint64_t a1, void *a2)
{
  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_22A30DBDC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_22A30DC7C()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__monitorTask;
  if (*(void *)(v0 + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__monitorTask))
  {
    uint64_t v3 = qword_268372CB8;
    swift_retain();
    if (v3 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_22A313B00();
    __swift_project_value_buffer(v4, (uint64_t)qword_268372CC0);
    v5 = sub_22A313AE0();
    os_log_type_t v6 = sub_22A313BF0();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_22A30C000, v5, v6, "Session stop", v7, 2u);
      MEMORY[0x22A6C5C20](v7, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_268372C48);
    sub_22A313BC0();
    swift_release();
    *(void *)(v1 + v2) = 0;
    swift_release();
  }
  uint64_t v8 = OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__systemMonitor;
  v9 = *(void **)(v1 + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__systemMonitor);
  if (v9)
  {
    objc_msgSend(v9, sel_invalidate);
    v9 = *(void **)(v1 + v8);
  }
  *(void *)(v1 + v8) = 0;
}

uint64_t sub_22A30DEA8(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268372C50);
  uint64_t result = MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__monitorTask;
  if (!*(void *)(a1 + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__monitorTask))
  {
    uint64_t v6 = sub_22A313B90();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
    uint64_t v7 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v8 = (void *)swift_allocObject();
    v8[2] = 0;
    v8[3] = 0;
    v8[4] = v7;
    *(void *)(a1 + v5) = sub_22A311610((uint64_t)v4, (uint64_t)&unk_268372C60, (uint64_t)v8);
    return swift_release();
  }
  return result;
}

uint64_t sub_22A30DFDC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22A30E014()
{
  return sub_22A30DEA8(*(void *)(v0 + 16));
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

unint64_t sub_22A30E07C()
{
  unint64_t result = qword_268372C20;
  if (!qword_268372C20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268372C18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268372C20);
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

uint64_t sub_22A30E190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[13] = a4;
  uint64_t v5 = sub_22A313C60();
  v4[14] = v5;
  v4[15] = *(void *)(v5 - 8);
  v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  uint64_t v6 = sub_22A313C80();
  v4[18] = v6;
  v4[19] = *(void *)(v6 - 8);
  v4[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22A30E2BC, 0, 0);
}

uint64_t sub_22A30E2BC()
{
  if (sub_22A313BD0())
  {
    if (qword_268372CB8 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_22A313B00();
    __swift_project_value_buffer(v1, (uint64_t)qword_268372CC0);
    uint64_t v2 = sub_22A313AE0();
    os_log_type_t v3 = sub_22A313BF0();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_22A30C000, v2, v3, "Session exit", v4, 2u);
      MEMORY[0x22A6C5C20](v4, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
  else
  {
    if (qword_268372CB8 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v7 = sub_22A313B00();
    v0[21] = __swift_project_value_buffer(v7, (uint64_t)qword_268372CC0);
    uint64_t v8 = sub_22A313AE0();
    os_log_type_t v9 = sub_22A313BF0();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_22A30C000, v8, v9, "Session start", v10, 2u);
      MEMORY[0x22A6C5C20](v10, -1, -1);
    }
    uint64_t v11 = v0[13];

    sub_22A313A10();
    swift_task_alloc();
    uint64_t v12 = *(void *)(sub_22A313A00() - 8);
    swift_task_alloc();
    (*(void (**)(void))(v12 + 104))();
    sub_22A313A20();
    swift_task_dealloc();
    sub_22A313AC0();
    swift_allocObject();
    uint64_t v13 = sub_22A313AD0();
    v0[22] = v13;
    swift_task_dealloc();
    uint64_t v14 = MEMORY[0x22A6C5CB0](v11 + 16);
    v0[23] = v14;
    if (v14)
    {
      v15 = (void *)swift_task_alloc();
      v0[24] = v15;
      void *v15 = v0;
      v15[1] = sub_22A30E730;
      return sub_22A310314(v13);
    }
    else
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268372C70);
      v0[25] = v16;
      v0[26] = *(void *)(v16 - 8);
      uint64_t v17 = swift_task_alloc();
      v0[27] = v17;
      v18 = (void *)swift_task_alloc();
      v0[28] = v18;
      void *v18 = v0;
      v18[1] = sub_22A30E8F8;
      return MEMORY[0x270F29728](v17);
    }
  }
}

uint64_t sub_22A30E730()
{
  uint64_t v1 = (void *)*v0;
  uint64_t v2 = *(void **)(*v0 + 184);
  uint64_t v3 = *v0;
  swift_task_dealloc();

  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268372C70);
  v1[25] = v4;
  v1[26] = *(void *)(v4 - 8);
  uint64_t v5 = swift_task_alloc();
  v1[27] = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  v1[28] = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_22A30E8F8;
  return MEMORY[0x270F29728](v5);
}

uint64_t sub_22A30E8F8()
{
  *(void *)(*(void *)v1 + 232) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_22A31003C;
  }
  else {
    uint64_t v2 = sub_22A30EA0C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_22A30EA0C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268372C90);
  v0[30] = v1;
  v0[31] = *(void *)(v1 - 8);
  v0[32] = swift_task_alloc();
  sub_22A313BA0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268372C98);
  v0[33] = swift_task_alloc();
  swift_beginAccess();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[34] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_22A30EB7C;
  uint64_t v3 = v0[33];
  uint64_t v4 = v0[30];
  return MEMORY[0x270FA1F68](v3, 0, 0, v4);
}

uint64_t sub_22A30EB7C()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_22A30EC78, 0, 0);
}

uint64_t sub_22A30EC78()
{
  v65 = v0;
  uint64_t v1 = v0[33];
  uint64_t v2 = sub_22A313A40();
  v0[35] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = v3;
  v0[36] = v3;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v6 = v0[31];
    uint64_t v5 = v0[32];
    uint64_t v7 = v0[30];
    uint64_t v9 = v0[26];
    uint64_t v8 = v0[27];
    uint64_t v10 = v0[25];
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    if (sub_22A313BD0())
    {
      if (qword_268372CB8 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_22A313B00();
      __swift_project_value_buffer(v11, (uint64_t)qword_268372CC0);
      uint64_t v12 = sub_22A313AE0();
      os_log_type_t v13 = sub_22A313BF0();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_22A30C000, v12, v13, "Session exit", v14, 2u);
        MEMORY[0x22A6C5C20](v14, -1, -1);
      }

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v15 = (uint64_t (*)(void))v0[1];
      return v15();
    }
    uint64_t v30 = sub_22A313B00();
    v0[21] = __swift_project_value_buffer(v30, (uint64_t)qword_268372CC0);
    v31 = sub_22A313AE0();
    os_log_type_t v32 = sub_22A313BF0();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_22A30C000, v31, v32, "Session start", v33, 2u);
      MEMORY[0x22A6C5C20](v33, -1, -1);
    }
    uint64_t v34 = v0[13];

    sub_22A313A10();
    swift_task_alloc();
    uint64_t v35 = *(void *)(sub_22A313A00() - 8);
    swift_task_alloc();
    (*(void (**)(void))(v35 + 104))();
    sub_22A313A20();
    swift_task_dealloc();
    sub_22A313AC0();
    swift_allocObject();
    uint64_t v36 = sub_22A313AD0();
    v0[22] = v36;
    swift_task_dealloc();
    uint64_t v37 = MEMORY[0x22A6C5CB0](v34 + 16);
    v0[23] = v37;
    if (v37)
    {
      v38 = (void *)swift_task_alloc();
      v0[24] = v38;
      void *v38 = v0;
      v38[1] = sub_22A30E730;
      uint64_t v39 = v36;
LABEL_21:
      return sub_22A310314(v39);
    }
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_268372C70);
    v0[25] = v44;
    v0[26] = *(void *)(v44 - 8);
    uint64_t v45 = swift_task_alloc();
    v0[27] = v45;
    v46 = (void *)swift_task_alloc();
    v0[28] = v46;
    void *v46 = v0;
    v46[1] = sub_22A30E8F8;
    return MEMORY[0x270F29728](v45);
  }
  else
  {
    uint64_t v17 = v0[13] + 16;
    v0[37] = swift_task_alloc();
    (*(void (**)(void))(v4 + 32))();
    uint64_t v18 = MEMORY[0x22A6C5CB0](v17);
    v0[38] = v18;
    if (v18)
    {
      uint64_t v19 = (void *)v18;
      uint64_t v20 = swift_task_alloc();
      v0[39] = v20;
      (*(void (**)(void))(v4 + 16))();
      int v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 88))(v20, v2);
      if (MEMORY[0x263F3CE28] && v21 == *MEMORY[0x263F3CE28])
      {
        (*(void (**)(uint64_t, uint64_t))(v4 + 96))(v20, v2);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268372CA0);
        uint64_t v22 = swift_task_alloc();
        sub_22A313100(v20, v22);
        uint64_t v23 = sub_22A313A90();
        uint64_t v24 = *(void *)(v23 - 8);
        uint64_t v25 = swift_task_alloc();
        uint64_t v26 = swift_task_alloc();
        sub_22A313168(v22, v26);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v26, 1, v23) == 1)
        {
          sub_22A3131D0(v26, &qword_268372CA0);
          swift_task_dealloc();
          swift_task_dealloc();
          v27 = sub_22A313AE0();
          os_log_type_t v28 = sub_22A313BF0();
          if (os_log_type_enabled(v27, v28))
          {
            v29 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v29 = 0;
            _os_log_impl(&dword_22A30C000, v27, v28, "Me device changed: nil", v29, 2u);
            MEMORY[0x22A6C5C20](v29, -1, -1);
          }
        }
        else
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(v25, v26, v23);
          swift_task_dealloc();
          uint64_t v47 = swift_task_alloc();
          v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16);
          uint64_t v63 = v47;
          v48(v47, v25, v23);
          uint64_t v49 = swift_task_alloc();
          v48(v49, v25, v23);
          v50 = sub_22A313AE0();
          os_log_type_t v51 = sub_22A313BF0();
          if (os_log_type_enabled(v50, v51))
          {
            uint64_t v52 = swift_slowAlloc();
            uint64_t v62 = swift_slowAlloc();
            uint64_t v64 = v62;
            *(_DWORD *)uint64_t v52 = 136315394;
            uint64_t v53 = sub_22A313A50();
            *(void *)(v52 + 4) = sub_22A312AA8(v53, v54, &v64);
            swift_bridgeObjectRelease();
            v55 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
            v55(v63, v23);
            *(_WORD *)(v52 + 12) = 2080;
            uint64_t v56 = sub_22A313A70();
            *(void *)(v52 + 14) = sub_22A312AA8(v56, v57, &v64);
            swift_bridgeObjectRelease();
            v55(v49, v23);
            _os_log_impl(&dword_22A30C000, v50, v51, "Me device changed: ids=%s, name=%s", (uint8_t *)v52, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x22A6C5C20](v62, -1, -1);
            MEMORY[0x22A6C5C20](v52, -1, -1);

            v55(v25, v23);
            swift_task_dealloc();
            swift_task_dealloc();
          }
          else
          {

            v58 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
            v58(v49, v23);
            swift_task_dealloc();
            v58(v63, v23);
            swift_task_dealloc();
            v58(v25, v23);
          }
          swift_task_dealloc();
        }
        sub_22A311AB8(v22);
        sub_22A3131D0(v22, &qword_268372CA0);

        swift_task_dealloc();
      }
      else
      {
        if ((!MEMORY[0x263F3CDF0] || v21 != *MEMORY[0x263F3CDF0])
          && (!MEMORY[0x263F3CE18] || v21 != *MEMORY[0x263F3CE18]))
        {
          if (MEMORY[0x263F3CE00] && v21 == *MEMORY[0x263F3CE00])
          {
            v40 = sub_22A313AE0();
            os_log_type_t v41 = sub_22A313BF0();
            if (os_log_type_enabled(v40, v41))
            {
              v42 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v42 = 0;
              _os_log_impl(&dword_22A30C000, v40, v41, "Session initialized", v42, 2u);
              MEMORY[0x22A6C5C20](v42, -1, -1);
            }

            v43 = (void *)swift_task_alloc();
            v0[40] = v43;
            void *v43 = v0;
            v43[1] = sub_22A30F830;
            uint64_t v39 = v0[22];
            goto LABEL_21;
          }
          (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v20, v2);
        }
      }
      swift_task_dealloc();
    }
    (*(void (**)(void, void))(v0[36] + 8))(v0[37], v0[35]);
    swift_task_dealloc();
    v59 = (void *)swift_task_alloc();
    v0[34] = v59;
    void *v59 = v0;
    v59[1] = sub_22A30EB7C;
    uint64_t v60 = v0[33];
    uint64_t v61 = v0[30];
    return MEMORY[0x270FA1F68](v60, 0, 0, v61);
  }
}

uint64_t sub_22A30F830()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_22A30F92C, 0, 0);
}

uint64_t sub_22A30F92C()
{
  swift_task_dealloc();
  (*(void (**)(void, void))(*(void *)(v0 + 288) + 8))(*(void *)(v0 + 296), *(void *)(v0 + 280));
  swift_task_dealloc();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 272) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_22A30EB7C;
  uint64_t v2 = *(void *)(v0 + 264);
  uint64_t v3 = *(void *)(v0 + 240);
  return MEMORY[0x270FA1F68](v2, 0, 0, v3);
}

uint64_t sub_22A30FA04()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 352) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 328))(*(void *)(v2 + 136), *(void *)(v2 + 112));
    uint64_t v3 = sub_22A30FF94;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v6 = *(void *)(v2 + 144);
    (*(void (**)(void, void))(v2 + 328))(*(void *)(v2 + 136), *(void *)(v2 + 112));
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v3 = sub_22A30FB5C;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_22A30FB5C()
{
  if (sub_22A313BD0())
  {
    if (qword_268372CB8 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_22A313B00();
    __swift_project_value_buffer(v1, (uint64_t)qword_268372CC0);
    uint64_t v2 = sub_22A313AE0();
    os_log_type_t v3 = sub_22A313BF0();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_22A30C000, v2, v3, "Session exit", v4, 2u);
      MEMORY[0x22A6C5C20](v4, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
  else
  {
    uint64_t v7 = sub_22A313B00();
    *(void *)(v0 + 168) = __swift_project_value_buffer(v7, (uint64_t)qword_268372CC0);
    uint64_t v8 = sub_22A313AE0();
    os_log_type_t v9 = sub_22A313BF0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_22A30C000, v8, v9, "Session start", v10, 2u);
      MEMORY[0x22A6C5C20](v10, -1, -1);
    }
    uint64_t v11 = *(void *)(v0 + 104);

    sub_22A313A10();
    swift_task_alloc();
    uint64_t v12 = *(void *)(sub_22A313A00() - 8);
    swift_task_alloc();
    (*(void (**)(void))(v12 + 104))();
    sub_22A313A20();
    swift_task_dealloc();
    sub_22A313AC0();
    swift_allocObject();
    uint64_t v13 = sub_22A313AD0();
    *(void *)(v0 + 176) = v13;
    swift_task_dealloc();
    uint64_t v14 = MEMORY[0x22A6C5CB0](v11 + 16);
    *(void *)(v0 + 184) = v14;
    if (v14)
    {
      v15 = (void *)swift_task_alloc();
      *(void *)(v0 + 192) = v15;
      void *v15 = v0;
      v15[1] = sub_22A30E730;
      return sub_22A310314(v13);
    }
    else
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268372C70);
      *(void *)(v0 + 200) = v16;
      *(void *)(v0 + 208) = *(void *)(v16 - 8);
      uint64_t v17 = swift_task_alloc();
      *(void *)(v0 + 216) = v17;
      uint64_t v18 = (void *)swift_task_alloc();
      *(void *)(v0 + 224) = v18;
      void *v18 = v0;
      v18[1] = sub_22A30E8F8;
      return MEMORY[0x270F29728](v17);
    }
  }
}

uint64_t sub_22A30FF94()
{
  uint64_t v1 = (void *)v0[29];
  (*(void (**)(void, void))(v0[19] + 8))(v0[20], v0[18]);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_22A31003C()
{
  uint64_t v1 = *(void **)(v0 + 232);
  swift_release();
  swift_task_dealloc();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_22A313AE0();
  os_log_type_t v5 = sub_22A313BE0();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = *(void **)(v0 + 232);
  if (v6)
  {
    uint64_t v8 = swift_slowAlloc();
    os_log_type_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    id v10 = v7;
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v8 + 4) = v11;
    void *v9 = v11;

    _os_log_impl(&dword_22A30C000, v4, v5, "### Session failed: error=%@", (uint8_t *)v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268372C88);
    swift_arrayDestroy();
    MEMORY[0x22A6C5C20](v9, -1, -1);
    MEMORY[0x22A6C5C20](v8, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = *(void *)(v0 + 120);
  uint64_t v12 = *(void *)(v0 + 128);
  uint64_t v14 = *(void *)(v0 + 112);

  sub_22A313C70();
  *(_OWORD *)(v0 + 88) = xmmword_22A3141B0;
  *(void *)(v0 + 72) = 0;
  *(void *)(v0 + 64) = 0;
  *(unsigned char *)(v0 + 80) = 1;
  uint64_t v15 = sub_22A312A60(&qword_268372C78, MEMORY[0x263F8F710]);
  sub_22A313CC0();
  sub_22A312A60(&qword_268372C80, MEMORY[0x263F8F6D8]);
  sub_22A313C90();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  *(void *)(v0 + 328) = v16;
  *(void *)(v0 + 336) = (v13 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v16(v12, v14);
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v0 + 344) = v17;
  *uint64_t v17 = v0;
  v17[1] = sub_22A30FA04;
  uint64_t v19 = *(void *)(v0 + 136);
  uint64_t v18 = *(void *)(v0 + 144);
  return MEMORY[0x270FA2380](v19, v0 + 64, v18, v15);
}

uint64_t sub_22A310314(uint64_t a1)
{
  v2[12] = a1;
  v2[13] = v1;
  uint64_t v3 = sub_22A313B10();
  v2[14] = v3;
  v2[15] = *(void *)(v3 - 8);
  v2[16] = swift_task_alloc();
  uint64_t v4 = sub_22A313B30();
  v2[17] = v4;
  v2[18] = *(void *)(v4 - 8);
  v2[19] = swift_task_alloc();
  uint64_t v5 = sub_22A313A90();
  v2[20] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v2[21] = v6;
  v2[22] = *(void *)(v6 + 64);
  uint64_t v7 = swift_task_alloc();
  v2[23] = v7;
  uint64_t v8 = (void *)swift_task_alloc();
  v2[24] = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_22A3104DC;
  return MEMORY[0x270F296F8](v7, 1);
}

uint64_t sub_22A3104DC()
{
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_22A3108B8;
  }
  else {
    id v2 = sub_22A3105F0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_22A3105F0()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[21];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268372CA0);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v1, v2);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  sub_22A311AB8(v4);
  sub_22A3131D0(v4, &qword_268372CA0);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = v0[18];
  uint64_t v5 = v0[19];
  uint64_t v7 = v0[16];
  uint64_t v8 = v0[14];
  uint64_t v9 = v0[15];
  uint64_t v10 = (void *)v0[13];
  uint64_t v16 = v0[17];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(unsigned char *)(v11 + 24) = 1;
  v0[6] = sub_22A3133D4;
  v0[7] = v11;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_22A30E01C;
  v0[5] = &block_descriptor_41;
  uint64_t v12 = _Block_copy(v0 + 2);
  id v13 = v10;
  sub_22A313B20();
  v0[9] = MEMORY[0x263F8EE78];
  sub_22A312A60(&qword_268372C10, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268372C18);
  sub_22A30E07C();
  sub_22A313C30();
  MEMORY[0x22A6C5830](0, v5, v7, v12);
  _Block_release(v12);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v16);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_22A3108B8()
{
  uint64_t v1 = (void *)v0[25];
  swift_task_dealloc();
  v0[8] = v1;
  uint64_t v2 = sub_22A313A30();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = swift_task_alloc();
  v0[26] = v4;
  id v5 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268372C48);
  if (swift_dynamicCast())
  {
    int v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v4, v2);
    if (MEMORY[0x263F3CD60] && v6 == *MEMORY[0x263F3CD60])
    {

      if (qword_268372CB8 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_22A313B00();
      v0[27] = __swift_project_value_buffer(v7, (uint64_t)qword_268372CC0);
      uint64_t v8 = sub_22A313AE0();
      os_log_type_t v9 = sub_22A313BF0();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_22A30C000, v8, v9, "Get me device failed: missingMeDevice cached", v10, 2u);
        MEMORY[0x22A6C5C20](v10, -1, -1);
      }

      uint64_t v11 = swift_task_alloc();
      v0[28] = v11;
      uint64_t v12 = (void *)swift_task_alloc();
      v0[29] = v12;
      *uint64_t v12 = v0;
      v12[1] = sub_22A310EB0;
      return MEMORY[0x270F296F8](v11, 0);
    }
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v2);
  }
  swift_task_dealloc();

  if (qword_268372CB8 != -1) {
    swift_once();
  }
  id v13 = (void *)v0[25];
  uint64_t v14 = sub_22A313B00();
  __swift_project_value_buffer(v14, (uint64_t)qword_268372CC0);
  id v15 = v13;
  id v16 = v13;
  uint64_t v17 = sub_22A313AE0();
  os_log_type_t v18 = sub_22A313BE0();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v20 = (void *)v0[25];
  if (v19)
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 138412290;
    id v23 = v20;
    uint64_t v24 = _swift_stdlib_bridgeErrorToNSError();
    v0[10] = v24;
    sub_22A313C10();
    *uint64_t v22 = v24;

    _os_log_impl(&dword_22A30C000, v17, v18, "### Get me device failed: cached, error=%@", v21, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268372C88);
    swift_arrayDestroy();
    MEMORY[0x22A6C5C20](v22, -1, -1);
    MEMORY[0x22A6C5C20](v21, -1, -1);
  }
  else
  {
  }
  uint64_t v26 = v0[18];
  uint64_t v25 = v0[19];
  uint64_t v27 = v0[16];
  uint64_t v28 = v0[14];
  uint64_t v29 = v0[15];
  uint64_t v30 = (void *)v0[13];
  uint64_t v36 = v0[17];
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v30;
  *(unsigned char *)(v31 + 24) = 0;
  v0[6] = sub_22A3133D4;
  v0[7] = v31;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_22A30E01C;
  v0[5] = &block_descriptor_41;
  os_log_type_t v32 = _Block_copy(v0 + 2);
  id v33 = v30;
  sub_22A313B20();
  v0[9] = MEMORY[0x263F8EE78];
  sub_22A312A60(&qword_268372C10, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268372C18);
  sub_22A30E07C();
  sub_22A313C30();
  MEMORY[0x22A6C5830](0, v25, v27, v32);
  _Block_release(v32);
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v27, v28);
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v36);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v34 = (uint64_t (*)(void))v0[1];
  return v34();
}

uint64_t sub_22A310EB0()
{
  *(void *)(*(void *)v1 + 240) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_22A3112A4;
  }
  else {
    uint64_t v2 = sub_22A310FC4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_22A310FC4()
{
  uint64_t v1 = v0[28];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[21];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268372CA0);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v1, v2);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  sub_22A311AB8(v4);
  sub_22A3131D0(v4, &qword_268372CA0);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();

  BOOL v5 = v0[30] == 0;
  uint64_t v7 = v0[18];
  uint64_t v6 = v0[19];
  uint64_t v8 = v0[16];
  uint64_t v9 = v0[14];
  uint64_t v10 = v0[15];
  uint64_t v11 = (void *)v0[13];
  uint64_t v17 = v0[17];
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  *(unsigned char *)(v12 + 24) = v5;
  v0[6] = sub_22A3133D4;
  v0[7] = v12;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_22A30E01C;
  v0[5] = &block_descriptor_41;
  id v13 = _Block_copy(v0 + 2);
  id v14 = v11;
  sub_22A313B20();
  v0[9] = MEMORY[0x263F8EE78];
  sub_22A312A60(&qword_268372C10, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268372C18);
  sub_22A30E07C();
  sub_22A313C30();
  MEMORY[0x22A6C5830](0, v6, v8, v13);
  _Block_release(v13);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v17);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  id v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_22A3112A4()
{
  uint64_t v1 = (void *)v0[30];
  swift_task_dealloc();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_22A313AE0();
  os_log_type_t v5 = sub_22A313BE0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[30];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[11] = v10;
    sub_22A313C10();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_22A30C000, v4, v5, "### Get me device failed: uncached, error=%@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268372C88);
    swift_arrayDestroy();
    MEMORY[0x22A6C5C20](v8, -1, -1);
    MEMORY[0x22A6C5C20](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = (void *)v0[30];
  }
  swift_task_dealloc();

  BOOL v12 = v0[30] == 0;
  uint64_t v14 = v0[18];
  uint64_t v13 = v0[19];
  uint64_t v15 = v0[16];
  uint64_t v16 = v0[14];
  uint64_t v17 = v0[15];
  uint64_t v18 = (void *)v0[13];
  uint64_t v24 = v0[17];
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v18;
  *(unsigned char *)(v19 + 24) = v12;
  v0[6] = sub_22A3133D4;
  v0[7] = v19;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_22A30E01C;
  v0[5] = &block_descriptor_41;
  uint64_t v20 = _Block_copy(v0 + 2);
  id v21 = v18;
  sub_22A313B20();
  v0[9] = MEMORY[0x263F8EE78];
  sub_22A312A60(&qword_268372C10, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268372C18);
  sub_22A30E07C();
  sub_22A313C30();
  MEMORY[0x22A6C5830](0, v13, v15, v20);
  _Block_release(v20);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v24);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(void))v0[1];
  return v22();
}

uint64_t sub_22A311610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_22A313B90();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_22A313B80();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_22A3131D0(a1, &qword_268372C50);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22A313B70();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_22A311798(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22A313B10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  id v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22A313B30();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[0] = *(void *)&v3[OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__dispatchQueue];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v3;
  aBlock[4] = a2;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22A30E01C;
  aBlock[3] = a3;
  uint64_t v15 = _Block_copy(aBlock);
  uint64_t v16 = v3;
  sub_22A313B20();
  v18[1] = MEMORY[0x263F8EE78];
  sub_22A312A60(&qword_268372C10, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268372C18);
  sub_22A30E07C();
  sub_22A313C30();
  MEMORY[0x22A6C5830](0, v13, v9, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return swift_release();
}

void sub_22A311A24()
{
}

uint64_t sub_22A311AB8(uint64_t a1)
{
  id v2 = v1;
  uint64_t v4 = sub_22A313B10();
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v62 = &v48[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_22A313B30();
  uint64_t v60 = *(void *)(v7 - 8);
  uint64_t v61 = v7;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v59 = &v48[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_22A313A90();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v12 = &v48[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268372CA0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v14 = &v48[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_22A313168(a1, (uint64_t)v14);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v14, 1, v9) == 1)
  {
    sub_22A3131D0((uint64_t)v14, &qword_268372CA0);
    if (qword_268372CB8 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_22A313B00();
    __swift_project_value_buffer(v15, (uint64_t)qword_268372CC0);
    uint64_t v16 = sub_22A313AE0();
    os_log_type_t v17 = sub_22A313BF0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_22A30C000, v16, v17, "Me device fetched: nil", v18, 2u);
      MEMORY[0x22A6C5C20](v18, -1, -1);
    }

    id v19 = 0;
  }
  else
  {
    uint64_t v56 = v2;
    uint64_t v57 = v5;
    uint64_t v58 = v4;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(&v48[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)], v14, v9);
    if (qword_268372CB8 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_22A313B00();
    __swift_project_value_buffer(v20, (uint64_t)qword_268372CC0);
    v55 = v48;
    ((void (*)(void))MEMORY[0x270FA5388])();
    unint64_t v21 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v22 = *(uint64_t (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16);
    uint64_t v23 = v22(&v48[-v21], &v48[-v21], v9);
    unint64_t v54 = v48;
    MEMORY[0x270FA5388](v23);
    v22(&v48[-v21], &v48[-v21], v9);
    uint64_t v24 = sub_22A313AE0();
    os_log_type_t v25 = sub_22A313BF0();
    int v26 = v25;
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      aBlock[0] = v51;
      *(_DWORD *)uint64_t v27 = 136315394;
      os_log_t v50 = v24;
      uint64_t v28 = sub_22A313A50();
      uint64_t v63 = sub_22A312AA8(v28, v29, aBlock);
      sub_22A313C10();
      swift_bridgeObjectRelease();
      int v49 = v26;
      uint64_t v30 = *(void (**)(unsigned char *, uint64_t))(v10 + 8);
      uint64_t v52 = (v10 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v30(&v48[-v21], v9);
      *(_WORD *)(v27 + 12) = 2080;
      uint64_t v31 = sub_22A313A70();
      uint64_t v63 = sub_22A312AA8(v31, v32, aBlock);
      sub_22A313C10();
      swift_bridgeObjectRelease();
      uint64_t v53 = v30;
      v30(&v48[-v21], v9);
      os_log_t v33 = v50;
      _os_log_impl(&dword_22A30C000, v50, (os_log_type_t)v49, "Me device fetched: ids=%s, name=%s", (uint8_t *)v27, 0x16u);
      uint64_t v34 = v51;
      swift_arrayDestroy();
      MEMORY[0x22A6C5C20](v34, -1, -1);
      MEMORY[0x22A6C5C20](v27, -1, -1);
    }
    else
    {
      uint64_t v35 = *(void (**)(unsigned char *, uint64_t))(v10 + 8);
      uint64_t v52 = (v10 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v35(&v48[-v21], v9);
      uint64_t v53 = v35;
      v35(&v48[-v21], v9);
    }
    sub_22A313A80();
    sub_22A313A50();
    char v36 = sub_22A313A60();
    sub_22A313A70();
    id v37 = objc_allocWithZone((Class)CUFindMyLocateMeDevice);
    v38 = (void *)sub_22A313B40();
    swift_bridgeObjectRelease();
    uint64_t v39 = (void *)sub_22A313B40();
    swift_bridgeObjectRelease();
    v40 = (void *)sub_22A313B40();
    swift_bridgeObjectRelease();
    id v19 = objc_msgSend(v37, sel_initWithFindMyIdentifier_idsID_isThisDevice_name_, v38, v39, v36 & 1, v40);

    v53(v12, v9);
    uint64_t v5 = v57;
    uint64_t v4 = v58;
    id v2 = v56;
  }
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = v2;
  *(void *)(v41 + 24) = v19;
  aBlock[4] = (uint64_t)sub_22A31331C;
  aBlock[5] = v41;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_22A30E01C;
  aBlock[3] = (uint64_t)&block_descriptor_35;
  v42 = _Block_copy(aBlock);
  id v43 = v19;
  id v44 = v2;
  uint64_t v45 = v59;
  sub_22A313B20();
  uint64_t v63 = MEMORY[0x263F8EE78];
  sub_22A312A60(&qword_268372C10, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268372C18);
  sub_22A30E07C();
  v46 = v62;
  sub_22A313C30();
  MEMORY[0x22A6C5830](0, v45, v46, v42);
  _Block_release(v42);

  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v46, v4);
  (*(void (**)(unsigned char *, uint64_t))(v60 + 8))(v45, v61);
  return swift_release();
}

id sub_22A3122D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268372C50);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = *(id *)(v0 + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__systemMonitor);
  if (result)
  {
    id result = objc_msgSend(result, sel_firstUnlocked);
    if (result)
    {
      if (qword_268372CB8 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_22A313B00();
      __swift_project_value_buffer(v6, (uint64_t)qword_268372CC0);
      uint64_t v7 = sub_22A313AE0();
      os_log_type_t v8 = sub_22A313BF0();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_22A30C000, v7, v8, "First unlocked", v9, 2u);
        MEMORY[0x22A6C5C20](v9, -1, -1);
      }

      uint64_t v10 = OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__monitorTask;
      if (*(void *)(v1 + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__monitorTask))
      {
        swift_retain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_268372C48);
        sub_22A313BC0();
        swift_release();
      }
      *(void *)(v1 + v10) = 0;
      id result = (id)swift_release();
      if (!*(void *)(v1 + v10))
      {
        uint64_t v11 = sub_22A313B90();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v4, 1, 1, v11);
        uint64_t v12 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v13 = (void *)swift_allocObject();
        v13[2] = 0;
        v13[3] = 0;
        v13[4] = v12;
        *(void *)(v1 + v10) = sub_22A311610((uint64_t)v4, (uint64_t)&unk_268372CB0, (uint64_t)v13);
        return (id)swift_release();
      }
    }
  }
  return result;
}

uint64_t sub_22A31253C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void CUFindMyLocateMeDeviceMonitor.init()()
{
}

id sub_22A312618()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_22A313B40();
  swift_bridgeObjectRelease();

  return v0;
}

id _sSo29CUFindMyLocateMeDeviceMonitorC11CoreUtilsUIEABycfC_0()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return objc_msgSend(v0, sel_init);
}

void CUFindMyLocateMeDevice.init()()
{
}

uint64_t type metadata accessor for CUFindMyLocateMeDeviceMonitor(uint64_t a1)
{
  return sub_22A31286C(a1, &qword_268372CD8);
}

uint64_t type metadata accessor for CUFindMyLocateMeDevice(uint64_t a1)
{
  return sub_22A31286C(a1, &qword_268372CE0);
}

uint64_t sub_22A31286C(uint64_t a1, unint64_t *a2)
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
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

uint64_t sub_22A312944()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22A31297C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_22A312990()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22A3129CC()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_22A3139C8;
  return sub_22A30E190((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_22A312A60(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22A312AA8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22A312B7C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22A31327C((uint64_t)v12, *a3);
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
      sub_22A31327C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_22A312B7C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_22A313C20();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_22A312D38(a5, a6);
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
  uint64_t v8 = sub_22A313C50();
  if (!v8)
  {
    sub_22A313CA0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_22A313CB0();
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

uint64_t sub_22A312D38(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_22A312DD0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_22A312FB0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_22A312FB0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22A312DD0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_22A312F48(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_22A313C40();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_22A313CA0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_22A313B60();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_22A313CB0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_22A313CA0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_22A312F48(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268372CA8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22A312FB0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268372CA8);
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
  uint64_t result = sub_22A313CB0();
  __break(1u);
  return result;
}

uint64_t sub_22A313100(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268372CA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22A313168(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268372CA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22A3131D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
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

uint64_t sub_22A31327C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22A3132DC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_22A31331C()
{
  uint64_t v1 = *(char **)(v0 + 16);
  if (*(void *)&v1[OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__monitorTask])
  {
    uint64_t v2 = *(void *)(v0 + 24);
    id v3 = objc_msgSend(v1, sel_meDeviceUpdatedHandler);
    if (v3)
    {
      uint64_t v4 = v3;
      (*((void (**)(id, uint64_t))v3 + 2))(v3, v2);
      _Block_release(v4);
    }
  }
}

uint64_t sub_22A31339C()
{
  return MEMORY[0x270FA0238](v0, 25, 7);
}

void sub_22A3133D4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if (*(unsigned char *)(v0 + 24) == 1)
  {
    uint64_t v2 = OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__systemMonitor;
    id v3 = *(void **)(v1 + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__systemMonitor);
    if (v3)
    {
      uint64_t v4 = qword_268372CB8;
      id v5 = v3;
      if (v4 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_22A313B00();
      __swift_project_value_buffer(v6, (uint64_t)qword_268372CC0);
      int64_t v7 = sub_22A313AE0();
      os_log_type_t v8 = sub_22A313BF0();
      if (os_log_type_enabled(v7, v8))
      {
        int64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int64_t v9 = 0;
        _os_log_impl(&dword_22A30C000, v7, v8, "First unlock monitor stop", v9, 2u);
        MEMORY[0x22A6C5C20](v9, -1, -1);
      }

      objc_msgSend(v5, sel_invalidate);
      uint64_t v10 = *(void **)(v1 + v2);
      *(void *)(v1 + v2) = 0;
    }
  }
  else
  {
    uint64_t v11 = OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__firstUnlockStarted;
    if ((*(unsigned char *)(v1 + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__firstUnlockStarted) & 1) == 0)
    {
      uint64_t v12 = OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__systemMonitor;
      if (!*(void *)(v1 + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__systemMonitor))
      {
        if (qword_268372CB8 != -1) {
          swift_once();
        }
        uint64_t v13 = sub_22A313B00();
        __swift_project_value_buffer(v13, (uint64_t)qword_268372CC0);
        uint64_t v14 = sub_22A313AE0();
        os_log_type_t v15 = sub_22A313BF0();
        if (os_log_type_enabled(v14, v15))
        {
          uint64_t v16 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v16 = 0;
          _os_log_impl(&dword_22A30C000, v14, v15, "First unlock monitor start", v16, 2u);
          MEMORY[0x22A6C5C20](v16, -1, -1);
        }

        *(unsigned char *)(v1 + v11) = 1;
        id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F385E0]), sel_init);
        uint64_t v18 = *(void **)(v1 + v12);
        *(void *)(v1 + v12) = v17;
        id v19 = v17;

        objc_msgSend(v19, sel_setDispatchQueue_, *(void *)(v1 + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__dispatchQueue));
        uint64_t v20 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v28 = sub_22A3137A4;
        uint64_t v29 = v20;
        uint64_t v24 = MEMORY[0x263EF8330];
        uint64_t v25 = 1107296256;
        int v26 = sub_22A30E01C;
        uint64_t v27 = &block_descriptor_47;
        unint64_t v21 = _Block_copy(&v24);
        swift_release();
        objc_msgSend(v19, sel_setFirstUnlockHandler_, v21);
        _Block_release(v21);
        uint64_t v22 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v28 = sub_22A3137A4;
        uint64_t v29 = v22;
        uint64_t v24 = MEMORY[0x263EF8330];
        uint64_t v25 = 1107296256;
        int v26 = sub_22A30E01C;
        uint64_t v27 = &block_descriptor_51;
        uint64_t v23 = _Block_copy(&v24);
        swift_release();
        objc_msgSend(v19, sel_activateWithCompletion_, v23);
        _Block_release(v23);
      }
    }
  }
}

void sub_22A3137A8()
{
  swift_beginAccess();
  uint64_t v1 = MEMORY[0x22A6C5CB0](v0 + 16);
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    sub_22A3122D4();
  }
}

uint64_t objectdestroy_21Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22A313840()
{
  uint64_t v2 = *(void *)(v0 + 32);
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_22A3138D4;
  return sub_22A30E190((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_22A3138D4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_22A313A00()
{
  return MEMORY[0x270F29230]();
}

uint64_t sub_22A313A10()
{
  return MEMORY[0x270F29268]();
}

uint64_t sub_22A313A20()
{
  return MEMORY[0x270F29278]();
}

uint64_t sub_22A313A30()
{
  return MEMORY[0x270F292B0]();
}

uint64_t sub_22A313A40()
{
  return MEMORY[0x270F29338]();
}

uint64_t sub_22A313A50()
{
  return MEMORY[0x270F29500]();
}

uint64_t sub_22A313A60()
{
  return MEMORY[0x270F29518]();
}

uint64_t sub_22A313A70()
{
  return MEMORY[0x270F29520]();
}

uint64_t sub_22A313A80()
{
  return MEMORY[0x270F29530]();
}

uint64_t sub_22A313A90()
{
  return MEMORY[0x270F29560]();
}

uint64_t sub_22A313AC0()
{
  return MEMORY[0x270F29760]();
}

uint64_t sub_22A313AD0()
{
  return MEMORY[0x270F29778]();
}

uint64_t sub_22A313AE0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22A313AF0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_22A313B00()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22A313B10()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_22A313B20()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22A313B30()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22A313B40()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22A313B50()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22A313B60()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22A313B70()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_22A313B80()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_22A313B90()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_22A313BA0()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_22A313BC0()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_22A313BD0()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_22A313BE0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22A313BF0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22A313C00()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_22A313C10()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22A313C20()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22A313C30()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22A313C40()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22A313C50()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22A313C60()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_22A313C70()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_22A313C80()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_22A313C90()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_22A313CA0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22A313CB0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22A313CC0()
{
  return MEMORY[0x270FA2378]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}