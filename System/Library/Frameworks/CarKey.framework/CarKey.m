uint64_t sub_2211C74C4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  *(unsigned char *)(v5 + 120) = a4;
  *(void *)(v5 + 32) = a3;
  *(void *)(v5 + 40) = a5;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  v6 = sub_2211D7C00();
  *(void *)(v5 + 48) = v6;
  *(void *)(v5 + 56) = *(void *)(v6 - 8);
  *(void *)(v5 + 64) = swift_task_alloc();
  v7 = sub_2211D7C30();
  *(void *)(v5 + 72) = v7;
  *(void *)(v5 + 80) = *(void *)(v7 - 8);
  *(void *)(v5 + 88) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2211C75E8, 0, 0);
}

uint64_t sub_2211C75E8()
{
  id v1 = objc_msgSend(self, sel_processInfo);
  unsigned int v2 = objc_msgSend(v1, sel_isiOSAppOnMac);

  if (!v2) {
    goto LABEL_10;
  }
  if (qword_267F46B20 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_2211D7CB0();
  __swift_project_value_buffer(v3, (uint64_t)qword_267F46B28);
  v4 = sub_2211D7C90();
  os_log_type_t v5 = sub_2211D7E30();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2211C6000, v4, v5, "This feature is not supported on this platform", v6, 2u);
    MEMORY[0x223C7B120](v6, -1, -1);
  }

  sub_2211D22BC();
  uint64_t v7 = swift_allocError();
  unsigned char *v8 = 12;
  swift_willThrow();
  if (v7)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
  else
  {
LABEL_10:
    if (qword_267F46B40 != -1) {
      swift_once();
    }
    uint64_t v12 = *(void *)(v0 + 80);
    uint64_t v11 = *(void *)(v0 + 88);
    uint64_t v13 = *(void *)(v0 + 72);
    char v22 = *(unsigned char *)(v0 + 120);
    uint64_t v15 = *(void *)(v0 + 32);
    uint64_t v14 = *(void *)(v0 + 40);
    uint64_t v16 = *(void *)(v0 + 16);
    uint64_t v17 = *(void *)(v0 + 24);
    uint64_t v18 = __swift_project_value_buffer(v13, (uint64_t)qword_267F46B48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v18, v13);
    sub_2211D7C20();
    sub_2211D7BE0();
    uint64_t v19 = swift_task_alloc();
    *(void *)(v0 + 96) = v19;
    *(void *)(v19 + 16) = v14;
    *(void *)(v19 + 24) = v16;
    *(void *)(v19 + 32) = v17;
    *(void *)(v19 + 40) = v15;
    *(unsigned char *)(v19 + 48) = v22 & 1;
    v23 = (uint64_t (*)(uint64_t, uint64_t, char, uint64_t, uint64_t, uint64_t))((char *)&dword_267F467D8
                                                                                    + dword_267F467D8);
    v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v20;
    void *v20 = v0;
    v20[1] = sub_2211C7900;
    uint64_t v21 = *(void *)(v0 + 64);
    return v23((uint64_t)"Start Session", 13, 2, v21, (uint64_t)&unk_267F467D0, v19);
  }
}

uint64_t sub_2211C7900(uint64_t a1)
{
  v4 = *(void **)v2;
  os_log_type_t v5 = *(void **)v2;
  *(void *)(*(void *)v2 + 112) = v1;
  swift_task_dealloc();
  uint64_t v6 = v4[11];
  uint64_t v7 = v4[10];
  uint64_t v8 = v4[9];
  uint64_t v9 = v4[8];
  uint64_t v10 = v4[7];
  uint64_t v11 = v4[6];
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_2211C7B40, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(uint64_t))v5[1];
    return v12(a1);
  }
}

uint64_t sub_2211C7B40()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2211C7BB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(unsigned char *)(v6 + 200) = a6;
  *(void *)(v6 + 104) = a4;
  *(void *)(v6 + 112) = a5;
  *(void *)(v6 + 88) = a2;
  *(void *)(v6 + 96) = a3;
  *(void *)(v6 + 80) = a1;
  uint64_t v7 = sub_2211D7E50();
  *(void *)(v6 + 120) = v7;
  *(void *)(v6 + 128) = *(void *)(v7 - 8);
  *(void *)(v6 + 136) = swift_task_alloc();
  *(void *)(v6 + 144) = sub_2211D7E40();
  *(void *)(v6 + 152) = swift_task_alloc();
  sub_2211D7CE0();
  *(void *)(v6 + 160) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2211C7CD8, 0, 0);
}

uint64_t sub_2211C7CD8()
{
  uint64_t v1 = *(void **)(v0 + 88);
  if (v1)
  {
    uint64_t v2 = *(void **)(v0 + 88);
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + 136);
    uint64_t v4 = *(void *)(v0 + 128);
    uint64_t v15 = *(void *)(v0 + 120);
    sub_2211D79C0(0, &qword_267F46AA0);
    sub_2211D7CD0();
    *(void *)(v0 + 56) = MEMORY[0x263F8EE78];
    sub_2211D79FC(&qword_267F46AA8, MEMORY[0x263F8F0F8]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F46AB0);
    sub_2211D7A44(&qword_267F46AB8, &qword_267F46AB0);
    sub_2211D7EE0();
    (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, *MEMORY[0x263F8F130], v15);
    uint64_t v2 = (void *)sub_2211D7E70();
    uint64_t v1 = 0;
  }
  *(void *)(v0 + 168) = v2;
  char v5 = *(unsigned char *)(v0 + 200);
  uint64_t v7 = *(void *)(v0 + 104);
  uint64_t v6 = *(void *)(v0 + 112);
  sub_2211D7A94(*(void *)(v0 + 96), v0 + 16);
  type metadata accessor for CarKeyRemoteControlSession();
  uint64_t v8 = swift_allocObject();
  *(void *)(v0 + 176) = v8;
  *(void *)(v8 + 88) = 0;
  *(void *)(v8 + 96) = 0;
  sub_2211D7AF8((long long *)(v0 + 16), v8 + 40);
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v6;
  *(unsigned char *)(v8 + 32) = v5 & 1;
  *(void *)(v8 + 80) = v2;
  uint64_t v9 = *(void **)(v8 + 96);
  *(void *)(v8 + 96) = 0;
  id v10 = v1;
  id v11 = v2;

  uint64_t v12 = *(void **)(v8 + 88);
  *(void *)(v8 + 88) = 0;

  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_2211C7F3C;
  v13[14] = v8;
  return MEMORY[0x270FA2498](sub_2211CA224, 0, 0);
}

uint64_t sub_2211C7F3C()
{
  *(void *)(*(void *)v1 + 192) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2211C80EC;
  }
  else {
    uint64_t v2 = sub_2211C8050;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2211C8050()
{
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v2 = *(void **)(v0 + 80);

  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_2211C80EC()
{
  uint64_t v1 = *(void **)(v0 + 192);
  *(void *)(v0 + 64) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F46820);
  sub_2211D79C0(0, &qword_267F46828);
  if (swift_dynamicCast())
  {
    uint64_t v3 = *(void **)(v0 + 72);
    if (objc_msgSend(v3, sel_code) == (id)5)
    {
      uint64_t v4 = *(void **)(v0 + 168);

      sub_2211D22BC();
      swift_allocError();
      char v6 = 5;
LABEL_6:
      *uint64_t v5 = v6;
      swift_willThrow();

      swift_release();
      goto LABEL_9;
    }
    if (objc_msgSend(v3, sel_code) == (id)17)
    {
      uint64_t v4 = *(void **)(v0 + 168);

      sub_2211D22BC();
      swift_allocError();
      char v6 = 11;
      goto LABEL_6;
    }
  }
  uint64_t v7 = *(void **)(v0 + 192);
  uint64_t v8 = *(void **)(v0 + 168);

  sub_2211D22BC();
  swift_allocError();
  *uint64_t v9 = 0;
  swift_willThrow();

  swift_release();
LABEL_9:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_2211C82DC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v7 + 64) = a6;
  *(void *)(v7 + 72) = v6;
  *(void *)(v7 + 48) = a4;
  *(void *)(v7 + 56) = a5;
  *(unsigned char *)(v7 + 128) = a3;
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 40) = a2;
  uint64_t v8 = sub_2211D7C00();
  *(void *)(v7 + 80) = v8;
  *(void *)(v7 + 88) = *(void *)(v8 - 8);
  *(void *)(v7 + 96) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2211C83A8, 0, 0);
}

uint64_t sub_2211C83A8()
{
  uint64_t v1 = sub_2211D7C20();
  os_signpost_type_t v2 = sub_2211D7E90();
  uint64_t result = sub_2211D7EA0();
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v4 = *(const char **)(v0 + 32);
  if (*(unsigned char *)(v0 + 128))
  {
    if ((unint64_t)v4 >> 32)
    {
      __break(1u);
    }
    else
    {
      if (v4 >> 11 == 27)
      {
LABEL_16:
        __break(1u);
        return result;
      }
      if (v4 >> 16 <= 0x10)
      {
        uint64_t v4 = (const char *)(v0 + 16);
        goto LABEL_10;
      }
    }
    __break(1u);
    goto LABEL_16;
  }
  if (v4)
  {
LABEL_10:
    uint64_t v8 = *(void *)(v0 + 88);
    uint64_t v7 = *(void *)(v0 + 96);
    uint64_t v9 = *(void *)(v0 + 80);
    uint64_t v6 = *(void (**)(uint64_t, void, uint64_t))(v8 + 16);
    v6(v7, *(void *)(v0 + 48), v9);
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    os_signpost_id_t v11 = sub_2211D7BF0();
    _os_signpost_emit_with_name_impl(&dword_2211C6000, v1, v2, v11, v4, "", v10, 2u);
    MEMORY[0x223C7B120](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    goto LABEL_11;
  }
  __break(1u);
LABEL_5:
  uint64_t v5 = *(void *)(v0 + 88);

  uint64_t v6 = *(void (**)(uint64_t, void, uint64_t))(v5 + 16);
LABEL_11:
  uint64_t v12 = *(int **)(v0 + 56);
  v6(*(void *)(v0 + 96), *(void *)(v0 + 48), *(void *)(v0 + 80));
  sub_2211D7C70();
  swift_allocObject();
  *(void *)(v0 + 104) = sub_2211D7C60();
  uint64_t v14 = (uint64_t (*)(uint64_t))((char *)v12 + *v12);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_2211C85F8;
  return v14(v0 + 24);
}

uint64_t sub_2211C85F8()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0) {
    os_signpost_type_t v2 = sub_2211C8798;
  }
  else {
    os_signpost_type_t v2 = sub_2211C870C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2211C870C()
{
  sub_2211D1FAC(*(void *)(v0 + 72), *(const char **)(v0 + 32), *(unsigned char *)(v0 + 128));
  swift_release();
  uint64_t v1 = *(void *)(v0 + 24);
  swift_task_dealloc();
  os_signpost_type_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2211C8798()
{
  sub_2211D1FAC(*(void *)(v0 + 72), *(const char **)(v0 + 32), *(unsigned char *)(v0 + 128));
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2211C881C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 56) = a6;
  *(void *)(v7 + 64) = a7;
  *(unsigned char *)(v7 + 120) = a4;
  *(void *)(v7 + 40) = a3;
  *(void *)(v7 + 48) = a5;
  *(void *)(v7 + 24) = a1;
  *(void *)(v7 + 32) = a2;
  uint64_t v8 = sub_2211D7C00();
  *(void *)(v7 + 72) = v8;
  *(void *)(v7 + 80) = *(void *)(v8 - 8);
  *(void *)(v7 + 88) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2211C88E8, 0, 0);
}

uint64_t sub_2211C88E8()
{
  uint64_t v1 = sub_2211D7C20();
  os_signpost_type_t v2 = sub_2211D7E90();
  uint64_t v3 = sub_2211D7EA0();
  if ((v3 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v6 = *(const char **)(v0 + 32);
  if (*(unsigned char *)(v0 + 120))
  {
    if ((unint64_t)v6 >> 32)
    {
      __break(1u);
    }
    else
    {
      if (v6 >> 11 == 27)
      {
LABEL_16:
        __break(1u);
        return MEMORY[0x270FA2498](v3, v4, v5);
      }
      if (v6 >> 16 <= 0x10)
      {
        uint64_t v6 = (const char *)(v0 + 16);
        goto LABEL_10;
      }
    }
    __break(1u);
    goto LABEL_16;
  }
  if (!v6)
  {
    __break(1u);
LABEL_5:
    uint64_t v7 = *(void *)(v0 + 80);

    (*(void (**)(void, void, void))(v7 + 16))(*(void *)(v0 + 88), *(void *)(v0 + 48), *(void *)(v0 + 72));
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v9 = *(void *)(v0 + 80);
  uint64_t v8 = *(void *)(v0 + 88);
  uint64_t v10 = *(void *)(v0 + 72);
  os_signpost_id_t v11 = *(void (**)(uint64_t, void, uint64_t))(v9 + 16);
  v11(v8, *(void *)(v0 + 48), v10);
  uint64_t v12 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v12 = 0;
  os_signpost_id_t v13 = sub_2211D7BF0();
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v1, v2, v13, v6, "", v12, 2u);
  MEMORY[0x223C7B120](v12, -1, -1);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  v11(*(void *)(v0 + 88), *(void *)(v0 + 48), *(void *)(v0 + 72));
LABEL_11:
  sub_2211D7C70();
  swift_allocObject();
  *(void *)(v0 + 96) = sub_2211D7C60();
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_2211C8B10;
  uint64_t v15 = *(void *)(v0 + 64);
  v14[4] = *(void *)(v0 + 24);
  v14[5] = v15;
  uint64_t v3 = (uint64_t)sub_2211CE888;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_2211C8B10()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0) {
    os_signpost_type_t v2 = sub_2211C8CB8;
  }
  else {
    os_signpost_type_t v2 = sub_2211C8C24;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2211C8C24()
{
  sub_2211D1FAC(*(void *)(v0 + 56), *(const char **)(v0 + 32), *(unsigned char *)(v0 + 120));
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2211C8CB8()
{
  sub_2211D1FAC(*(void *)(v0 + 56), *(const char **)(v0 + 32), *(unsigned char *)(v0 + 120));
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2211C8D4C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 56) = a6;
  *(void *)(v7 + 64) = a7;
  *(unsigned char *)(v7 + 120) = a4;
  *(void *)(v7 + 40) = a3;
  *(void *)(v7 + 48) = a5;
  *(void *)(v7 + 24) = a1;
  *(void *)(v7 + 32) = a2;
  uint64_t v8 = sub_2211D7C00();
  *(void *)(v7 + 72) = v8;
  *(void *)(v7 + 80) = *(void *)(v8 - 8);
  *(void *)(v7 + 88) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2211C8E18, 0, 0);
}

uint64_t sub_2211C8E18()
{
  uint64_t v1 = sub_2211D7C20();
  os_signpost_type_t v2 = sub_2211D7E90();
  uint64_t v3 = sub_2211D7EA0();
  if ((v3 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v6 = *(const char **)(v0 + 32);
  if (*(unsigned char *)(v0 + 120))
  {
    if ((unint64_t)v6 >> 32)
    {
      __break(1u);
    }
    else
    {
      if (v6 >> 11 == 27)
      {
LABEL_16:
        __break(1u);
        return MEMORY[0x270FA2498](v3, v4, v5);
      }
      if (v6 >> 16 <= 0x10)
      {
        uint64_t v6 = (const char *)(v0 + 16);
        goto LABEL_10;
      }
    }
    __break(1u);
    goto LABEL_16;
  }
  if (!v6)
  {
    __break(1u);
LABEL_5:
    uint64_t v7 = *(void *)(v0 + 80);

    (*(void (**)(void, void, void))(v7 + 16))(*(void *)(v0 + 88), *(void *)(v0 + 48), *(void *)(v0 + 72));
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v9 = *(void *)(v0 + 80);
  uint64_t v8 = *(void *)(v0 + 88);
  uint64_t v10 = *(void *)(v0 + 72);
  os_signpost_id_t v11 = *(void (**)(uint64_t, void, uint64_t))(v9 + 16);
  v11(v8, *(void *)(v0 + 48), v10);
  uint64_t v12 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v12 = 0;
  os_signpost_id_t v13 = sub_2211D7BF0();
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v1, v2, v13, v6, "", v12, 2u);
  MEMORY[0x223C7B120](v12, -1, -1);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  v11(*(void *)(v0 + 88), *(void *)(v0 + 48), *(void *)(v0 + 72));
LABEL_11:
  sub_2211D7C70();
  swift_allocObject();
  *(void *)(v0 + 96) = sub_2211D7C60();
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_2211C9040;
  uint64_t v15 = *(void *)(v0 + 64);
  v14[4] = *(void *)(v0 + 24);
  v14[5] = v15;
  uint64_t v3 = (uint64_t)sub_2211CFFE8;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_2211C9040()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0) {
    os_signpost_type_t v2 = sub_2211C91E4;
  }
  else {
    os_signpost_type_t v2 = sub_2211C9154;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2211C9154()
{
  uint64_t v1 = *(void **)(v0 + 64);
  sub_2211D1FAC(*(void *)(v0 + 56), *(const char **)(v0 + 32), *(unsigned char *)(v0 + 120));
  swift_release();

  swift_task_dealloc();
  os_signpost_type_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2211C91E4()
{
  uint64_t v1 = *(void **)(v0 + 64);
  sub_2211D1FAC(*(void *)(v0 + 56), *(const char **)(v0 + 32), *(unsigned char *)(v0 + 120));
  swift_release();

  swift_task_dealloc();
  os_signpost_type_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2211C9274(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 56) = a6;
  *(void *)(v7 + 64) = a7;
  *(unsigned char *)(v7 + 120) = a4;
  *(void *)(v7 + 40) = a3;
  *(void *)(v7 + 48) = a5;
  *(void *)(v7 + 24) = a1;
  *(void *)(v7 + 32) = a2;
  uint64_t v8 = sub_2211D7C00();
  *(void *)(v7 + 72) = v8;
  *(void *)(v7 + 80) = *(void *)(v8 - 8);
  *(void *)(v7 + 88) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2211C9340, 0, 0);
}

uint64_t sub_2211C9340()
{
  uint64_t v1 = sub_2211D7C20();
  os_signpost_type_t v2 = sub_2211D7E90();
  uint64_t v3 = sub_2211D7EA0();
  if ((v3 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v6 = *(const char **)(v0 + 32);
  if (*(unsigned char *)(v0 + 120))
  {
    if ((unint64_t)v6 >> 32)
    {
      __break(1u);
    }
    else
    {
      if (v6 >> 11 == 27)
      {
LABEL_16:
        __break(1u);
        return MEMORY[0x270FA2498](v3, v4, v5);
      }
      if (v6 >> 16 <= 0x10)
      {
        uint64_t v6 = (const char *)(v0 + 16);
        goto LABEL_10;
      }
    }
    __break(1u);
    goto LABEL_16;
  }
  if (!v6)
  {
    __break(1u);
LABEL_5:
    uint64_t v7 = *(void *)(v0 + 80);

    (*(void (**)(void, void, void))(v7 + 16))(*(void *)(v0 + 88), *(void *)(v0 + 48), *(void *)(v0 + 72));
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v9 = *(void *)(v0 + 80);
  uint64_t v8 = *(void *)(v0 + 88);
  uint64_t v10 = *(void *)(v0 + 72);
  os_signpost_id_t v11 = *(void (**)(uint64_t, void, uint64_t))(v9 + 16);
  v11(v8, *(void *)(v0 + 48), v10);
  uint64_t v12 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v12 = 0;
  os_signpost_id_t v13 = sub_2211D7BF0();
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v1, v2, v13, v6, "", v12, 2u);
  MEMORY[0x223C7B120](v12, -1, -1);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  v11(*(void *)(v0 + 88), *(void *)(v0 + 48), *(void *)(v0 + 72));
LABEL_11:
  sub_2211D7C70();
  swift_allocObject();
  *(void *)(v0 + 96) = sub_2211D7C60();
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_2211C9568;
  uint64_t v15 = *(void *)(v0 + 64);
  v14[4] = *(void *)(v0 + 24);
  v14[5] = v15;
  uint64_t v3 = (uint64_t)sub_2211D0FFC;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  return MEMORY[0x270FA2498](v3, v4, v5);
}

uint64_t sub_2211C9568()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0) {
    os_signpost_type_t v2 = sub_2211D7B9C;
  }
  else {
    os_signpost_type_t v2 = sub_2211D7B98;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t CarKeyRemoteControl.deinit()
{
  return v0;
}

uint64_t CarKeyRemoteControl.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_2211C9694(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_2211C99A4()
{
  return sub_2211D19B8(type metadata accessor for RKESessionDelegate);
}

id sub_2211C99CC()
{
  id v1 = v0;
  uint64_t v2 = sub_2211D7C00();
  uint64_t v37 = *(void *)(v2 - 8);
  uint64_t v38 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2211D7C30();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267F46B40 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v5, (uint64_t)qword_267F46B48);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  sub_2211D7C20();
  sub_2211D7BE0();
  uint64_t v10 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v10 = 0;
  os_signpost_id_t v11 = sub_2211D7C20();
  os_signpost_type_t v12 = sub_2211D7E90();
  os_signpost_id_t v13 = sub_2211D7BF0();
  v36 = v11;
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v11, v12, v13, "Get Vehicle Reports", "", v10, 2u);
  uint64_t v14 = (void *)v0[12];
  if (v14)
  {
    id v40 = 0;
    id v15 = v14;
    id v16 = objc_msgSend(v15, sel_getVehicleReports_, &v40);
    id v17 = v40;
    if (!v16)
    {
      id v25 = v40;
      char v22 = (void *)sub_2211D7BB0();

      swift_willThrow();
LABEL_10:
      id v40 = v22;
      id v26 = v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F46820);
      sub_2211D79C0(0, &qword_267F46828);
      if (swift_dynamicCast())
      {
        id v1 = v39;
        if (objc_msgSend(v39, sel_code) == (id)12)
        {

          sub_2211D22BC();
          uint64_t v27 = swift_allocError();
          unsigned char *v28 = 3;
          swift_willThrow();

          if (!v27) {
            goto LABEL_15;
          }
LABEL_18:

          (*(void (**)(char *, uint64_t))(v37 + 8))(v4, v38);
          (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
          return v1;
        }
      }
      sub_2211D22BC();
      uint64_t v32 = swift_allocError();
      unsigned char *v33 = 0;
      swift_willThrow();

      if (!v32) {
        goto LABEL_15;
      }
      goto LABEL_18;
    }
    id v1 = v16;
    sub_2211D79C0(0, &qword_267F46A70);
    uint64_t v18 = sub_2211D7D00();
    id v19 = v17;

    v20 = (void *)v35[1];
    uint64_t v21 = sub_2211C9EB0(v18);
    char v22 = v20;
    if (v20)
    {
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
    id v1 = (id)v21;

    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2211D22BC();
    uint64_t v23 = swift_allocError();
    *uint64_t v24 = 3;
    swift_willThrow();
    if (v23) {
      goto LABEL_18;
    }
  }
LABEL_15:
  os_signpost_type_t v29 = sub_2211D7E80();
  os_signpost_id_t v30 = sub_2211D7BF0();
  v31 = v36;
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v36, v29, v30, "Get Vehicle Reports", "", v10, 2u);

  MEMORY[0x223C7B120](v10, -1, -1);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v4, v38);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v1;
}

uint64_t sub_2211C9EB0(uint64_t a1)
{
  uint64_t v2 = v1;
  int64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (!v3) {
    return v4;
  }
  uint64_t v5 = a1;
  uint64_t v50 = MEMORY[0x263F8EE78];
  sub_2211D483C(0, v3, 0);
  uint64_t v4 = v50;
  uint64_t result = sub_2211D5450(v5);
  uint64_t v8 = result;
  uint64_t v9 = 0;
  uint64_t v10 = v5 + 64;
  uint64_t v35 = v5 + 80;
  int64_t v36 = v3;
  int v37 = v7;
  uint64_t v38 = v5 + 64;
  uint64_t v39 = v5;
  while ((v8 & 0x8000000000000000) == 0 && v8 < 1 << *(unsigned char *)(v5 + 32))
  {
    unint64_t v13 = (unint64_t)v8 >> 6;
    if ((*(void *)(v10 + 8 * ((unint64_t)v8 >> 6)) & (1 << v8)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(v5 + 36) != v7) {
      goto LABEL_24;
    }
    uint64_t v40 = v9;
    id v14 = *(id *)(*(void *)(v5 + 56) + 8 * v8);
    swift_bridgeObjectRetain();
    id v15 = objc_msgSend(v14, sel_readerIdentifier);
    uint64_t v16 = sub_2211D7D20();
    uint64_t v18 = v17;

    uint64_t v44 = v16;
    uint64_t v45 = v18;
    char v46 = 0;
    id v19 = (void *)MEMORY[0x263F8EE78];
    uint64_t v47 = MEMORY[0x263F8EE78];
    unint64_t v48 = sub_2211D5ACC(MEMORY[0x263F8EE78]);
    unint64_t v49 = sub_2211D5BA4(v19);
    id v20 = objc_msgSend(v14, sel_getSupportedRKEFunctions);
    sub_2211D79C0(0, &qword_267F46A78);
    unint64_t v21 = sub_2211D7D50();

    id v22 = v14;
    uint64_t v43 = sub_2211D5CA8(v21, v22, (uint64_t)&v44);
    uint64_t v41 = v2;
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    unint64_t v23 = v48;
    uint64_t v42 = *(void *)(v48 + 16);

    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v25 = v44;
    uint64_t v24 = v45;
    unint64_t v26 = v49;
    uint64_t v50 = v4;
    unint64_t v28 = *(void *)(v4 + 16);
    unint64_t v27 = *(void *)(v4 + 24);
    if (v28 >= v27 >> 1)
    {
      uint64_t result = sub_2211D483C(v27 > 1, v28 + 1, 1);
      uint64_t v4 = v50;
    }
    *(void *)(v4 + 16) = v28 + 1;
    uint64_t v29 = v4 + 48 * v28;
    *(void *)(v29 + 32) = v25;
    *(void *)(v29 + 40) = v24;
    *(unsigned char *)(v29 + 48) = v42 != 0;
    *(void *)(v29 + 56) = v43;
    *(void *)(v29 + 64) = v23;
    *(void *)(v29 + 72) = v26;
    uint64_t v5 = v39;
    int64_t v11 = 1 << *(unsigned char *)(v39 + 32);
    if (v8 >= v11) {
      goto LABEL_25;
    }
    uint64_t v10 = v38;
    uint64_t v30 = *(void *)(v38 + 8 * v13);
    if ((v30 & (1 << v8)) == 0) {
      goto LABEL_26;
    }
    int v7 = v37;
    if (*(_DWORD *)(v39 + 36) != v37) {
      goto LABEL_27;
    }
    unint64_t v31 = v30 & (-2 << (v8 & 0x3F));
    if (v31)
    {
      int64_t v11 = __clz(__rbit64(v31)) | v8 & 0xFFFFFFFFFFFFFFC0;
      uint64_t v2 = v41;
      int64_t v12 = v36;
    }
    else
    {
      unint64_t v32 = v13 + 1;
      unint64_t v33 = (unint64_t)(v11 + 63) >> 6;
      uint64_t v2 = v41;
      int64_t v12 = v36;
      if (v13 + 1 < v33)
      {
        unint64_t v34 = *(void *)(v38 + 8 * v32);
        if (v34)
        {
LABEL_20:
          int64_t v11 = __clz(__rbit64(v34)) + (v32 << 6);
        }
        else
        {
          while (v33 - 2 != v13)
          {
            unint64_t v34 = *(void *)(v35 + 8 * v13++);
            if (v34)
            {
              unint64_t v32 = v13 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    uint64_t v9 = v40 + 1;
    uint64_t v8 = v11;
    if (v40 + 1 == v12) {
      return v4;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_2211CA204()
{
  *(void *)(v1 + 112) = v0;
  return MEMORY[0x270FA2498](sub_2211CA224, 0, 0);
}

uint64_t sub_2211CA224()
{
  v0[12] = 0;
  uint64_t v1 = v0[14];
  if ((*(unsigned char *)(v1 + 32) & 1) == 0)
  {
    uint64_t v4 = v1 + 16;
    uint64_t v3 = *(void *)(v1 + 16);
    uint64_t v2 = *(void *)(v4 + 8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A10);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2211D86D0;
    *(void *)(inited + 32) = 0x61745365676E6172;
    *(void *)(inited + 40) = 0xEA00000000007472;
    *(void *)(inited + 48) = v3;
    *(void *)(inited + 56) = 0x646E4565676E6172;
    *(void *)(inited + 64) = 0xE800000000000000;
    *(void *)(inited + 72) = v2;
    v0[12] = sub_2211CA5AC(inited);
    uint64_t v1 = v0[14];
  }
  uint64_t v6 = swift_task_alloc();
  v0[15] = v6;
  *(void *)(v6 + 16) = v0 + 12;
  *(void *)(v6 + 24) = v1;
  int v7 = (void *)swift_task_alloc();
  v0[16] = v7;
  uint64_t v8 = sub_2211D79C0(0, &qword_267F46A08);
  *int v7 = v0;
  v7[1] = sub_2211CA3B0;
  return MEMORY[0x270FA2360](v0 + 13, 0, 0, 0xD000000000000014, 0x80000002211D9340, sub_2211D6E04, v6, v8);
}

uint64_t sub_2211CA3B0()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2211CA540;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2211CA4CC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2211CA4CC()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = *(void **)(v1 + 96);
  *(void *)(v1 + 96) = v0[13];

  swift_bridgeObjectRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_2211CA540()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_2211CA5AC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A18);
  uint64_t v2 = (void *)sub_2211D7FA0();
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
    unint64_t result = sub_2211D44CC(v5, v6);
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

void sub_2211CA6C0(uint64_t a1, void **a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A20);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  id v9 = objc_msgSend(self, sel_sharedInstance);
  uint64_t v10 = *a2;
  if (v10)
  {
    uint64_t v11 = swift_bridgeObjectRetain();
    sub_2211CA924(v11);
    swift_bridgeObjectRelease();
    uint64_t v10 = (void *)sub_2211D7CF0();
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v12 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v12, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  *(void *)(v13 + ((v8 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)) = a3;
  aBlock[4] = sub_2211D6EB4;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2211CACCC;
  aBlock[3] = &block_descriptor;
  id v14 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v15 = objc_msgSend(v9, sel_startRKESessionWithOptions_startCallback_, v10, v14);
  _Block_release(v14);
  swift_unknownObjectRelease();
}

uint64_t sub_2211CA924(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A28);
    uint64_t v2 = sub_2211D7FA0();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
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
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
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
    uint64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_2211D706C(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_2211D706C(v35, v36);
    sub_2211D706C(v36, &v32);
    uint64_t result = sub_2211D7EF0();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_2211D706C(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_2211D707C();
    return v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
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
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_2211CACCC(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_2211CAD58()
{
  uint64_t v18 = sub_2211D7C00();
  uint64_t v0 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2211D7C30();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267F46B40 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v3, (uint64_t)qword_267F46B48);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  sub_2211D7C20();
  sub_2211D7BE0();
  int64_t v8 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)int64_t v8 = 0;
  unint64_t v9 = sub_2211D7C20();
  os_signpost_type_t v10 = sub_2211D7E90();
  os_signpost_id_t v11 = sub_2211D7BF0();
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v9, v10, v11, "End Session", "", v8, 2u);
  unint64_t v12 = *(void **)(v17[1] + 96);
  if (v12)
  {
    objc_msgSend(v12, sel_endSession);
    os_signpost_type_t v13 = sub_2211D7E80();
    os_signpost_id_t v14 = sub_2211D7BF0();
    _os_signpost_emit_with_name_impl(&dword_2211C6000, v9, v13, v14, "End Session", "", v8, 2u);

    MEMORY[0x223C7B120](v8, -1, -1);
  }
  else
  {
    sub_2211D22BC();
    swift_allocError();
    *int64_t v16 = 3;
    swift_willThrow();
  }
  (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_2211CB06C(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F467E8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_2211D7C00();
  uint64_t v36 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  id v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2211D7C30();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  os_signpost_type_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *a1;
  uint64_t v32 = a1[1];
  uint64_t v33 = v11;
  uint64_t v12 = a1[3];
  uint64_t v31 = a1[2];
  if (qword_267F46B40 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v7, (uint64_t)qword_267F46B48);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v13, v7);
  sub_2211D7C20();
  sub_2211D7BE0();
  os_signpost_id_t v14 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)os_signpost_id_t v14 = 0;
  uint64_t v15 = sub_2211D7C20();
  uint64_t v35 = v7;
  int64_t v16 = v15;
  os_signpost_type_t v17 = sub_2211D7E90();
  os_signpost_id_t v18 = sub_2211D7BF0();
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v16, v17, v18, "Perform Remote Keyless Entry Action", "", v14, 2u);
  uint64_t v19 = *(void **)(v34 + 96);
  if (v19)
  {
    uint64_t v20 = sub_2211D7DA0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v4, 1, 1, v20);
    unint64_t v21 = (void *)swift_allocObject();
    v21[2] = 0;
    v21[3] = 0;
    uint64_t v22 = v33;
    v21[4] = v19;
    v21[5] = v22;
    uint64_t v23 = v31;
    v21[6] = v32;
    v21[7] = v23;
    v21[8] = v12;
    id v24 = v19;
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_2211CB7FC((uint64_t)v4, (uint64_t)&unk_267F467F8, (uint64_t)v21);
    type metadata accessor for RemoteKeylessEntryAction.ExecutionRequest();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v25;
    os_signpost_type_t v26 = sub_2211D7E80();
    os_signpost_id_t v27 = sub_2211D7BF0();
    _os_signpost_emit_with_name_impl(&dword_2211C6000, v16, v26, v27, "Perform Remote Keyless Entry Action", "", v14, 2u);

    MEMORY[0x223C7B120](v14, -1, -1);
  }
  else
  {
    sub_2211D22BC();
    swift_allocError();
    unsigned char *v28 = 3;
    swift_willThrow();
  }
  (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v37);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v35);
  return v12;
}

uint64_t sub_2211CB4A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[20] = a7;
  v8[21] = a8;
  v8[18] = a5;
  v8[19] = a6;
  v8[16] = a1;
  v8[17] = a4;
  return MEMORY[0x270FA2498](sub_2211CB4C8, 0, 0);
}

uint64_t sub_2211CB4C8()
{
  uint64_t v1 = (void *)v0[17];
  uint64_t v2 = sub_2211D7E00();
  v0[22] = v2;
  uint64_t v3 = sub_2211D7E00();
  v0[23] = v3;
  uint64_t v4 = sub_2211D7D10();
  v0[24] = v4;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_2211CB62C;
  uint64_t v5 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_2211CB73C;
  v0[13] = &block_descriptor_135;
  v0[14] = v5;
  objc_msgSend(v1, sel_sendRKEFunction_action_readerIdentifier_authorization_isEnduring_isHandlingExternal_completion_, v2, v3, v4, 0, 0, 0, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2211CB62C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 200) = v1;
  if (v1) {
    uint64_t v2 = sub_2211D7B10;
  }
  else {
    uint64_t v2 = sub_2211D7B60;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2211CB73C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F46820);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA2408](a1);
  }
}

uint64_t sub_2211CB7FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2211D7DA0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2211D7D90();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_2211D7964(a1, &qword_267F467E8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2211D7D60();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

char *sub_2211CB980(uint64_t *a1, unsigned __int8 *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F467E8);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2211D7C00();
  uint64_t v61 = *(void *)(v9 - 8);
  uint64_t v62 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2211D7C30();
  uint64_t v68 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  v63 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *a1;
  uint64_t v58 = a1[1];
  uint64_t v15 = a1[3];
  uint64_t v57 = a1[2];
  int v56 = *a2;
  if (qword_267F46B40 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v12, (uint64_t)qword_267F46B48);
  (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v63, v16, v12);
  sub_2211D7C20();
  sub_2211D7BE0();
  os_signpost_type_t v17 = (uint8_t *)swift_slowAlloc();
  uint64_t v60 = v12;
  os_signpost_id_t v18 = v17;
  *(_WORD *)os_signpost_type_t v17 = 0;
  uint64_t v19 = sub_2211D7C20();
  uint64_t v20 = (char *)sub_2211D7E90();
  os_signpost_id_t v21 = sub_2211D7BF0();
  v59 = v19;
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v19, (os_signpost_type_t)v20, v21, "Perform Remote Keyless Entry Enduring Action", "", v18, 2u);
  uint64_t v22 = *(void **)(v3 + 96);
  if (v22)
  {
    uint64_t v23 = sub_2211D7DA0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v8, 1, 1, v23);
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = 0;
    *(void *)(v24 + 24) = 0;
    *(void *)(v24 + 32) = v22;
    *(void *)(v24 + 40) = v14;
    uint64_t v25 = v14;
    v55 = v11;
    uint64_t v26 = v58;
    v54 = v18;
    uint64_t v27 = v57;
    *(void *)(v24 + 48) = v58;
    *(void *)(v24 + 56) = v27;
    *(void *)(v24 + 64) = v15;
    *(unsigned char *)(v24 + 72) = v56;
    id v28 = v22;
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_2211CB7FC((uint64_t)v8, (uint64_t)&unk_267F46808, v24);
    uint64_t v30 = (char *)objc_allocWithZone((Class)type metadata accessor for RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest());
    swift_bridgeObjectRetain();
    ObjectType = (objc_class *)swift_getObjectType();
    uint64_t v32 = &v30[OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_currentEventStream];
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46860);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v32, 1, 1, v33);
    uint64_t v34 = &v30[OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_currentEventStreamContinuation];
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46850);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v34, 1, 1, v35);
    uint64_t v36 = &v30[OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_action];
    *(void *)uint64_t v36 = v25;
    *((void *)v36 + 1) = v26;
    *((void *)v36 + 2) = v27;
    *((void *)v36 + 3) = v15;
    *(void *)&v30[OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_session] = v28;
    *(void *)&v30[OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_task] = v29;
    uint64_t v37 = (objc_class *)type metadata accessor for SESRKESessionContinuationDelegateHandler();
    uint64_t v38 = (char *)objc_allocWithZone(v37);
    uint64_t v39 = &v38[OBJC_IVAR____TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler_delegate];
    *(_OWORD *)uint64_t v39 = 0u;
    *((_OWORD *)v39 + 1) = 0u;
    *((void *)v39 + 4) = 0;
    *(void *)&v38[OBJC_IVAR____TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler_session] = v28;
    v67.receiver = v38;
    v67.super_class = v37;
    id v40 = v28;
    uint64_t v41 = v30;
    swift_retain();
    id v42 = objc_msgSendSuper2(&v67, sel_init);
    objc_msgSend(v40, sel_setContinuationDelegate_, v42);
    *(void *)&v41[OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_continuationDelegateHandler] = v42;

    v66.receiver = v41;
    v66.super_class = ObjectType;
    uint64_t v43 = (char *)objc_msgSendSuper2(&v66, sel_init);
    uint64_t v44 = *(void *)&v43[OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_continuationDelegateHandler];
    v65[3] = ObjectType;
    v65[4] = &off_26D30A290;
    v65[0] = v43;
    sub_2211D7A94((uint64_t)v65, (uint64_t)v64);
    uint64_t v45 = v44
        + OBJC_IVAR____TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler_delegate;
    swift_beginAccess();
    uint64_t v20 = v43;
    sub_2211D7900((uint64_t)v64, v45, &qword_267F469F8);
    swift_endAccess();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v65);
    swift_release();

    LOBYTE(v29) = sub_2211D7E80();
    char v46 = v55;
    os_signpost_id_t v47 = sub_2211D7BF0();
    os_signpost_type_t v48 = v29;
    unint64_t v49 = v59;
    uint64_t v50 = v54;
    _os_signpost_emit_with_name_impl(&dword_2211C6000, v59, v48, v47, "Perform Remote Keyless Entry Enduring Action", "", v54, 2u);

    MEMORY[0x223C7B120](v50, -1, -1);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v46, v62);
  }
  else
  {
    sub_2211D22BC();
    swift_allocError();
    unsigned char *v51 = 3;
    swift_willThrow();

    (*(void (**)(char *, uint64_t))(v61 + 8))(v11, v62);
  }
  (*(void (**)(char *, uint64_t))(v68 + 8))(v63, v60);
  return v20;
}

uint64_t sub_2211CC01C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(unsigned char *)(v8 + 208) = v10;
  *(void *)(v8 + 160) = a7;
  *(void *)(v8 + 168) = a8;
  *(void *)(v8 + 144) = a5;
  *(void *)(v8 + 152) = a6;
  *(void *)(v8 + 128) = a1;
  *(void *)(v8 + 136) = a4;
  return MEMORY[0x270FA2498](sub_2211CC050, 0, 0);
}

uint64_t sub_2211CC050()
{
  uint64_t v1 = (void *)v0;
  uint64_t v2 = v0 + 16;
  uint64_t v3 = v0 + 80;
  uint64_t v4 = v0 + 120;
  uint64_t v5 = *(void **)(v0 + 136);
  uint64_t v6 = *(unsigned char *)(v0 + 208) & 1;
  uint64_t v7 = sub_2211D7E00();
  v1[22] = v7;
  uint64_t v8 = sub_2211D7E00();
  v1[23] = v8;
  uint64_t v9 = sub_2211D7D10();
  v1[24] = v9;
  v1[2] = v1;
  v1[7] = v4;
  v1[3] = sub_2211CC1C0;
  uint64_t v10 = swift_continuation_init();
  v1[10] = MEMORY[0x263EF8330];
  v1[11] = 0x40000000;
  v1[12] = sub_2211CB73C;
  v1[13] = &block_descriptor_133;
  v1[14] = v10;
  objc_msgSend(v5, sel_sendRKEFunction_action_readerIdentifier_authorization_isEnduring_isHandlingExternal_completion_, v7, v8, v9, 0, 1, v6, v3);
  return MEMORY[0x270FA23F0](v2);
}

uint64_t sub_2211CC1C0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 200) = v1;
  if (v1) {
    uint64_t v2 = sub_2211CC360;
  }
  else {
    uint64_t v2 = sub_2211CC2D0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2211CC2D0()
{
  uint64_t v1 = *(void **)(v0 + 184);
  uint64_t v2 = *(void **)(v0 + 176);
  uint64_t v3 = *(void **)(v0 + 120);
  uint64_t v4 = *(uint64_t **)(v0 + 128);

  uint64_t v5 = sub_2211D7DF0();
  uint64_t *v4 = v5;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_2211CC360()
{
  uint64_t v1 = (void *)v0[24];
  uint64_t v3 = (void *)v0[22];
  uint64_t v2 = (void *)v0[23];
  swift_willThrow();

  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

BOOL static CarKeyRemoteControlSession.ContinuationStrategy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void *sub_2211CC3FC(uint64_t *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F467E8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v43 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2211D7C00();
  uint64_t v49 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2211D7C30();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *a1;
  uint64_t v45 = a1[1];
  uint64_t v46 = v12;
  uint64_t v13 = a1[3];
  uint64_t v44 = a1[2];
  if (qword_267F46B40 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v8, (uint64_t)qword_267F46B48);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v14, v8);
  sub_2211D7C20();
  sub_2211D7BE0();
  uint64_t v15 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v15 = 0;
  uint64_t v16 = sub_2211D7C20();
  os_signpost_type_t v48 = v11;
  uint64_t v17 = v9;
  os_signpost_id_t v18 = v16;
  os_signpost_type_t v19 = sub_2211D7E90();
  uint64_t v47 = v8;
  os_signpost_type_t v20 = v19;
  os_signpost_id_t v21 = sub_2211D7BF0();
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v18, v20, v21, "Perform Remote Keyless Entry Enduring Action", "", v15, 2u);
  uint64_t v22 = *(void **)(v1 + 96);
  if (v22)
  {
    uint64_t v23 = sub_2211D7DA0();
    uint64_t v24 = (uint64_t)v43;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v43, 1, 1, v23);
    uint64_t v25 = (void *)swift_allocObject();
    v25[2] = 0;
    v25[3] = 0;
    uint64_t v39 = v7;
    os_log_t v40 = v18;
    uint64_t v26 = v13;
    uint64_t v42 = v17;
    uint64_t v28 = v45;
    uint64_t v27 = v46;
    v25[4] = v22;
    v25[5] = v27;
    uint64_t v29 = v44;
    v25[6] = v28;
    v25[7] = v29;
    v25[8] = v26;
    uint64_t v30 = v22;
    uint64_t v41 = v5;
    id v31 = v30;
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_2211CB7FC(v24, (uint64_t)&unk_267F46818, (uint64_t)v25);
    type metadata accessor for RemoteKeylessEntryEnduringAction.EnduringExecutionRequest();
    uint64_t v22 = (void *)swift_allocObject();
    v22[2] = v27;
    v22[3] = v28;
    v22[4] = v29;
    v22[5] = v26;
    v22[6] = v32;
    v22[7] = v31;
    swift_bridgeObjectRetain();
    LOBYTE(v31) = sub_2211D7E80();
    uint64_t v33 = v39;
    os_signpost_id_t v34 = sub_2211D7BF0();
    os_log_t v35 = v40;
    _os_signpost_emit_with_name_impl(&dword_2211C6000, v40, (os_signpost_type_t)v31, v34, "Perform Remote Keyless Entry Enduring Action", "", v15, 2u);

    MEMORY[0x223C7B120](v15, -1, -1);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v33, v41);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v48, v47);
  }
  else
  {
    sub_2211D22BC();
    swift_allocError();
    unsigned char *v36 = 3;
    swift_willThrow();

    (*(void (**)(char *, uint64_t))(v49 + 8))(v7, v5);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v48, v47);
  }
  return v22;
}

uint64_t sub_2211CC868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[20] = a7;
  v8[21] = a8;
  v8[18] = a5;
  v8[19] = a6;
  v8[16] = a1;
  v8[17] = a4;
  return MEMORY[0x270FA2498](sub_2211CC890, 0, 0);
}

uint64_t sub_2211CC890()
{
  uint64_t v1 = (void *)v0[17];
  uint64_t v2 = sub_2211D7E00();
  v0[22] = v2;
  uint64_t v3 = sub_2211D7E00();
  v0[23] = v3;
  uint64_t v4 = sub_2211D7D10();
  v0[24] = v4;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_2211CB62C;
  uint64_t v5 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_2211CB73C;
  v0[13] = &block_descriptor_131;
  v0[14] = v5;
  objc_msgSend(v1, sel_sendRKEFunction_action_readerIdentifier_authorization_isEnduring_isHandlingExternal_completion_, v2, v3, v4, 0, 1, 0, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2211CC9F4(uint64_t a1, uint64_t a2, uint8_t *a3, uint8_t *a4)
{
  uint64_t v6 = v5;
  v47[1] = a3;
  v47[2] = a4;
  uint64_t v7 = sub_2211D7C00();
  uint64_t v51 = *(void *)(v7 - 8);
  uint64_t v52 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2211D7C30();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267F46B40 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v10, (uint64_t)qword_267F46B48);
  uint64_t v50 = v11;
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v53 = v10;
  v15(v13, v14, v10);
  sub_2211D7C20();
  sub_2211D7BE0();
  uint64_t v16 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v16 = 0;
  uint64_t v49 = v13;
  uint64_t v17 = sub_2211D7C20();
  os_signpost_type_t v18 = sub_2211D7E90();
  os_signpost_id_t v19 = sub_2211D7BF0();
  os_signpost_type_t v48 = v17;
  v47[0] = v16;
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v17, v18, v19, "Send Passthrough Data", "", v16, 2u);
  os_signpost_type_t v20 = *(void **)(v4 + 96);
  os_signpost_id_t v21 = v9;
  if (!v20)
  {
    uint64_t v26 = v9;
    sub_2211D22BC();
    uint64_t v6 = swift_allocError();
    unsigned char *v28 = 3;
    swift_willThrow();
    goto LABEL_19;
  }
  id v22 = v20;
  uint64_t v23 = (void *)sub_2211D7BC0();
  uint64_t v24 = (void *)sub_2211D7D10();
  id v55 = 0;
  unsigned __int8 v25 = objc_msgSend(v22, sel_sendPassthroughMessage_readerIdentifier_error_, v23, v24, &v55);

  if ((v25 & 1) == 0)
  {
    id v29 = v55;
    uint64_t v30 = (void *)sub_2211D7BB0();

    swift_willThrow();
    id v55 = v30;
    id v31 = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F46820);
    sub_2211D79C0(0, &qword_267F46828);
    if (swift_dynamicCast())
    {
      id v32 = v54;
      if (objc_msgSend(v32, sel_code) == (id)19)
      {
        uint64_t v26 = v21;

        sub_2211D22BC();
        uint64_t v6 = swift_allocError();
        char v34 = 6;
LABEL_18:
        char *v33 = v34;
        swift_willThrow();

        goto LABEL_19;
      }
      if (objc_msgSend(v32, sel_code) == (id)12)
      {
        uint64_t v26 = v21;

        sub_2211D22BC();
        uint64_t v6 = swift_allocError();
        char v34 = 3;
        goto LABEL_18;
      }
      id v37 = objc_msgSend(v32, sel_code);

      if (v37 == (id)1)
      {
        uint64_t v26 = v21;

        sub_2211D22BC();
        uint64_t v6 = swift_allocError();
        char v34 = 7;
        goto LABEL_18;
      }
      uint64_t v26 = v21;
      if (objc_msgSend(v32, sel_code) == (id)13)
      {

        sub_2211D22BC();
        uint64_t v6 = swift_allocError();
        char v34 = 1;
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v26 = v21;
    }
    uint64_t v35 = v52;

    sub_2211D22BC();
    uint64_t v6 = swift_allocError();
    unsigned char *v36 = 0;
    swift_willThrow();

    goto LABEL_20;
  }
  uint64_t v26 = v9;
  id v27 = v55;

LABEL_19:
  uint64_t v35 = v52;
LABEL_20:
  uint64_t v38 = v50;
  uint64_t v39 = v51;
  uint64_t v41 = v48;
  os_log_t v40 = v49;
  if (v6)
  {
  }
  else
  {
    os_signpost_type_t v42 = sub_2211D7E80();
    os_signpost_id_t v43 = sub_2211D7BF0();
    os_signpost_type_t v44 = v42;
    uint64_t v45 = v47[0];
    _os_signpost_emit_with_name_impl(&dword_2211C6000, v41, v44, v43, "Send Passthrough Data", "", v47[0], 2u);

    MEMORY[0x223C7B120](v45, -1, -1);
  }
  (*(void (**)(char *, uint64_t))(v39 + 8))(v26, v35);
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v40, v53);
}

uint64_t sub_2211CCF80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  v39[1] = a1;
  v39[2] = a2;
  uint64_t v40 = sub_2211D7C00();
  uint64_t v42 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v7 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2211D7C30();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267F46B40 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v8, (uint64_t)qword_267F46B48);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v41 = v8;
  v13(v11, v12, v8);
  sub_2211D7C20();
  sub_2211D7BE0();
  uint64_t v14 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v14 = 0;
  uint64_t v15 = sub_2211D7C20();
  os_signpost_type_t v16 = sub_2211D7E90();
  LOBYTE(v17) = (_BYTE)v7;
  os_signpost_id_t v18 = sub_2211D7BF0();
  os_signpost_type_t v19 = v16;
  os_signpost_type_t v20 = v15;
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v15, v19, v18, "Querying Passive Entry Availability", "", v14, 2u);
  os_signpost_id_t v21 = *(void **)(v5 + 96);
  if (!v21)
  {
    sub_2211D22BC();
    uint64_t v26 = swift_allocError();
    *id v27 = 3;
    swift_willThrow();
    uint64_t v28 = v40;
    if (!v26) {
      goto LABEL_17;
    }
    goto LABEL_20;
  }
  id v17 = v21;
  LOBYTE(v44) = 0;
  id v22 = (void *)sub_2211D7D10();
  id v45 = 0;
  unsigned int v23 = objc_msgSend(v17, sel_isPassiveEntryAvailable_isAvailable_error_, v22, &v44, &v45);

  if (v23)
  {
    LOBYTE(v24) = (_BYTE)v44;
    id v25 = v45;
    if (!v3) {
      goto LABEL_13;
    }
LABEL_10:
    id v45 = v4;
    id v29 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F46820);
    sub_2211D79C0(0, &qword_267F46828);
    if (swift_dynamicCast())
    {
      id v30 = v44;
      if (objc_msgSend(v44, sel_code) == (id)19)
      {

        sub_2211D22BC();
        uint64_t v32 = swift_allocError();
        char v33 = 6;
        goto LABEL_16;
      }
      if (objc_msgSend(v30, sel_code) == (id)12)
      {

        sub_2211D22BC();
        uint64_t v32 = swift_allocError();
        char v33 = 3;
LABEL_16:
        char *v31 = v33;
        swift_willThrow();

        uint64_t v28 = v40;
        if (!v32) {
          goto LABEL_17;
        }
LABEL_20:

        (*(void (**)(char *, uint64_t))(v42 + 8))(v7, v28);
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v41);
        return v17 & 1;
      }
    }
    sub_2211D22BC();
    uint64_t v36 = swift_allocError();
    *id v37 = 0;
    swift_willThrow();

    uint64_t v28 = v40;
    if (!v36) {
      goto LABEL_17;
    }
    goto LABEL_20;
  }
  id v24 = v45;
  uint64_t v4 = (void *)sub_2211D7BB0();

  swift_willThrow();
  if (v4) {
    goto LABEL_10;
  }
LABEL_13:

  char v43 = v24 & 1;
  uint64_t v28 = v40;
LABEL_17:
  os_signpost_type_t v34 = sub_2211D7E80();
  os_signpost_id_t v35 = sub_2211D7BF0();
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v20, v34, v35, "Querying Passive Entry Availability", "", v14, 2u);

  LOBYTE(v17) = v43;
  MEMORY[0x223C7B120](v14, -1, -1);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v7, v28);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v41);
  return v17 & 1;
}

void sub_2211CD490(uint64_t *a1@<X8>)
{
  v36[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(v1 + 96);
  if (!v3)
  {
    sub_2211D22BC();
    swift_allocError();
    *unsigned int v23 = 3;
    swift_willThrow();
    return;
  }
  id v4 = v3;
  uint64_t v5 = (void *)sub_2211D7BC0();
  uint64_t v6 = (void *)sub_2211D7D10();
  v36[0] = 0;
  id v7 = objc_msgSend(v4, sel_sign_readerIdentifier_error_, v5, v6, v36);

  if (v7)
  {
    id v8 = v36[0];
    id v9 = objc_msgSend(v7, sel_appBundleID);
    uint64_t v10 = sub_2211D7D20();
    uint64_t v33 = v11;
    uint64_t v34 = v10;

    id v12 = objc_msgSend(v7, sel_nonce);
    uint64_t v13 = sub_2211D7BD0();
    uint64_t v31 = v14;
    uint64_t v32 = v13;

    id v15 = objc_msgSend(v7, sel_signedData);
    uint64_t v16 = sub_2211D7BD0();
    uint64_t v18 = v17;

    id v19 = objc_msgSend(v7, sel_signature);
    uint64_t v20 = sub_2211D7BD0();
    uint64_t v22 = v21;

    *a1 = v34;
    a1[1] = v33;
    a1[2] = v32;
    a1[3] = v31;
    a1[4] = v16;
    a1[5] = v18;
    a1[6] = v20;
    a1[7] = v22;
    return;
  }
  id v24 = v36[0];
  id v25 = (void *)sub_2211D7BB0();

  swift_willThrow();
  v36[0] = v25;
  id v26 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F46820);
  sub_2211D79C0(0, &qword_267F46828);
  if (swift_dynamicCast())
  {
    id v27 = v35;
    if (objc_msgSend(v27, sel_code) == (id)12)
    {

      sub_2211D22BC();
      swift_allocError();
      char v29 = 3;
LABEL_12:
      char *v28 = v29;
      swift_willThrow();

      return;
    }
    if (objc_msgSend(v27, sel_code) == (id)17)
    {

      sub_2211D22BC();
      swift_allocError();
      char v29 = 11;
      goto LABEL_12;
    }

    if (objc_msgSend(v27, sel_code) == (id)19)
    {

      sub_2211D22BC();
      swift_allocError();
      char v29 = 6;
      goto LABEL_12;
    }
  }
  sub_2211D22BC();
  swift_allocError();
  *id v30 = 0;
  swift_willThrow();
}

uint64_t CarKeyRemoteControlSession.Attestation.appBundleIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CarKeyRemoteControlSession.Attestation.nonce.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_2211D26E4(v1, *(void *)(v0 + 24));
  return v1;
}

uint64_t CarKeyRemoteControlSession.Attestation.signedData.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_2211D26E4(v1, *(void *)(v0 + 40));
  return v1;
}

uint64_t CarKeyRemoteControlSession.Attestation.signature.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  sub_2211D26E4(v1, *(void *)(v0 + 56));
  return v1;
}

uint64_t CarKeyRemoteControlSession.ContinuationStrategy.hash(into:)()
{
  return sub_2211D8050();
}

uint64_t CarKeyRemoteControlSession.ContinuationStrategy.hashValue.getter()
{
  return sub_2211D8060();
}

BOOL sub_2211CD988(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2211CD9A0()
{
  return sub_2211D8060();
}

uint64_t sub_2211CD9E8()
{
  return sub_2211D8050();
}

uint64_t sub_2211CDA14()
{
  return sub_2211D8060();
}

id *CarKeyRemoteControlSession.deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 5));

  return v0;
}

uint64_t CarKeyRemoteControlSession.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 5));

  return MEMORY[0x270FA0228](v0, 104, 7);
}

uint64_t VehicleReport.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t VehicleReport.isConnected.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t VehicleReport.supportedFunctions.getter()
{
  return swift_bridgeObjectRetain();
}

CarKey::FunctionStatus_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> VehicleReport.status(for:)(CarKey::FunctionIdentifier a1)
{
  uint64_t v42 = v1;
  uint64_t v43 = sub_2211D7C00();
  uint64_t v47 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2211D7C30();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)a1.rawValue;
  uint64_t v12 = *(void *)(v2 + 24);
  uint64_t v41 = *(void *)(v2 + 32);
  if (qword_267F46B40 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v7, (uint64_t)qword_267F46B48);
  uint64_t v44 = v8;
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v46 = v7;
  v14(v10, v13, v7);
  sub_2211D7C20();
  sub_2211D7BE0();
  id v15 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)id v15 = 0;
  uint64_t v16 = sub_2211D7C20();
  os_signpost_type_t v17 = sub_2211D7E90();
  os_signpost_id_t v18 = sub_2211D7BF0();
  id v45 = v16;
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v16, v17, v18, "Getting Function Status", "", v15, 2u);
  uint64_t v19 = *(void *)(v12 + 16);
  if (v19)
  {
    uint64_t v20 = (uint64_t *)(v12 + 32);
    while (1)
    {
      uint64_t v21 = *v20++;
      if (v21 == v11) {
        break;
      }
      if (!--v19) {
        goto LABEL_7;
      }
    }
    uint64_t v31 = v41;
    if (*(void *)(v41 + 16))
    {
      unint64_t v32 = sub_2211D4588(v11);
      uint64_t v26 = v44;
      if (v33)
      {
        uint64_t v12 = *(void *)(*(void *)(v31 + 56) + 8 * v32);
        char v48 = 0;
      }
      else
      {
        uint64_t v12 = 0;
        char v48 = 1;
      }
      uint64_t v30 = v43;
      if (v3) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v12 = 0;
      char v48 = 1;
      uint64_t v30 = v43;
      uint64_t v26 = v44;
      if (v3)
      {
LABEL_20:

        goto LABEL_21;
      }
    }
  }
  else
  {
LABEL_7:
    if (qword_267F46B20 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_2211D7CB0();
    __swift_project_value_buffer(v22, (uint64_t)qword_267F46B28);
    unsigned int v23 = sub_2211D7C90();
    os_log_type_t v24 = sub_2211D7E30();
    BOOL v25 = os_log_type_enabled(v23, v24);
    uint64_t v26 = v44;
    if (v25)
    {
      uint64_t v12 = 12;
      id v27 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v27 = 134217984;
      uint64_t v49 = v11;
      sub_2211D7EC0();
      _os_log_impl(&dword_2211C6000, v23, v24, "Unknown function %ld", v27, 0xCu);
      MEMORY[0x223C7B120](v27, -1, -1);
    }

    sub_2211D22BC();
    uint64_t v28 = swift_allocError();
    *char v29 = 4;
    swift_willThrow();
    uint64_t v30 = v43;
    if (v28) {
      goto LABEL_20;
    }
  }
  os_signpost_type_t v34 = sub_2211D7E80();
  os_signpost_id_t v35 = sub_2211D7BF0();
  os_signpost_type_t v36 = v34;
  id v37 = v45;
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v45, v36, v35, "Getting Function Status", "", v15, 2u);

  LOBYTE(v37) = v48;
  MEMORY[0x223C7B120](v15, -1, -1);
  uint64_t v38 = v42;
  *uint64_t v42 = v12;
  *((unsigned char *)v38 + 8) = (_BYTE)v37;
LABEL_21:
  (*(void (**)(char *, uint64_t))(v47 + 8))(v6, v30);
  Swift::Int v39 = (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v10, v46);
  result.value.rawValue = v39;
  result.is_nil = v40;
  return result;
}

uint64_t VehicleReport.proprietaryData(for:)(uint64_t *a1)
{
  uint64_t v4 = sub_2211D7C00();
  uint64_t v43 = *(void *)(v4 - 8);
  uint64_t v44 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2211D7C30();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *a1;
  uint64_t v12 = *(void *)(v1 + 24);
  uint64_t v39 = *(void *)(v1 + 40);
  if (qword_267F46B40 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v7, (uint64_t)qword_267F46B48);
  uint64_t v40 = v8;
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v42 = v7;
  v14(v10, v13, v7);
  sub_2211D7C20();
  sub_2211D7BE0();
  id v15 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)id v15 = 0;
  uint64_t v16 = sub_2211D7C20();
  os_signpost_type_t v17 = sub_2211D7E90();
  os_signpost_id_t v18 = sub_2211D7BF0();
  uint64_t v41 = v16;
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v16, v17, v18, "Getting Function Proprietary Data", "", v15, 2u);
  uint64_t v19 = *(void *)(v12 + 16);
  if (!v19)
  {
LABEL_7:
    if (qword_267F46B20 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_2211D7CB0();
    __swift_project_value_buffer(v22, (uint64_t)qword_267F46B28);
    unsigned int v23 = sub_2211D7C90();
    os_log_type_t v24 = sub_2211D7E30();
    BOOL v25 = os_log_type_enabled(v23, v24);
    uint64_t v26 = v40;
    if (v25)
    {
      uint64_t v12 = 12;
      id v27 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v27 = 134217984;
      uint64_t v45 = v11;
      sub_2211D7EC0();
      _os_log_impl(&dword_2211C6000, v23, v24, "Unknown function %ld", v27, 0xCu);
      MEMORY[0x223C7B120](v27, -1, -1);
    }

    sub_2211D22BC();
    uint64_t v28 = swift_allocError();
    *char v29 = 4;
    swift_willThrow();
    if (!v28) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  uint64_t v20 = (uint64_t *)(v12 + 32);
  while (1)
  {
    uint64_t v21 = *v20++;
    if (v21 == v11) {
      break;
    }
    if (!--v19) {
      goto LABEL_7;
    }
  }
  uint64_t v30 = v39;
  if (!*(void *)(v39 + 16))
  {
    uint64_t v12 = 0;
    uint64_t v26 = v40;
    if (v2) {
      goto LABEL_18;
    }
LABEL_20:
    os_signpost_type_t v34 = sub_2211D7E80();
    os_signpost_id_t v35 = sub_2211D7BF0();
    os_signpost_type_t v36 = v34;
    id v37 = v41;
    _os_signpost_emit_with_name_impl(&dword_2211C6000, v41, v36, v35, "Getting Function Proprietary Data", "", v15, 2u);

    MEMORY[0x223C7B120](v15, -1, -1);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v6, v44);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v42);
    return v12;
  }
  unint64_t v31 = sub_2211D4588(v11);
  uint64_t v26 = v40;
  if ((v32 & 1) == 0)
  {
    uint64_t v12 = 0;
    if (v2) {
      goto LABEL_18;
    }
    goto LABEL_20;
  }
  uint64_t v33 = *(void *)(v30 + 56) + 16 * v31;
  uint64_t v12 = *(void *)v33;
  sub_2211D26E4(*(void *)v33, *(void *)(v33 + 8));
  if (!v2) {
    goto LABEL_20;
  }
LABEL_18:

  (*(void (**)(char *, uint64_t))(v43 + 8))(v6, v44);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v42);
  return v12;
}

void RemoteKeylessEntryAction.functionID.getter(void *a1@<X8>)
{
  *a1 = *v1;
}

void RemoteKeylessEntryAction.actionID.getter(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 8);
}

uint64_t RemoteKeylessEntryAction.recipientVehicleID.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

CarKey::RemoteKeylessEntryAction __swiftcall RemoteKeylessEntryAction.init(functionID:actionID:vehicleID:)(CarKey::FunctionIdentifier functionID, CarKey::ActionIdentifier actionID, Swift::String vehicleID)
{
  uint64_t v4 = *(void **)actionID.rawValue;
  v3->_countAndFlagsBits = *(void *)functionID.rawValue;
  v3->_object = v4;
  v3[1] = vehicleID;
  result.recipientVehicleID = vehicleID;
  result.actionID = actionID;
  result.functionID = functionID;
  return result;
}

uint64_t RemoteKeylessEntryAction.ExecutionRequest.results()(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_2211D7C00();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2211CE52C, 0, 0);
}

uint64_t sub_2211CE52C()
{
  if (qword_267F46B40 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2211D7C30();
  uint64_t v2 = __swift_project_value_buffer(v1, (uint64_t)qword_267F46B48);
  sub_2211D7C20();
  sub_2211D7BE0();
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, char, uint64_t, uint64_t, uint64_t))((char *)&dword_267F46838
                                                                                          + dword_267F46838);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[7] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2211CE65C;
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[2];
  uint64_t v6 = v0[3];
  return v8(v5, (uint64_t)" Waiting for Remote Keyless Entry Action Results", 48, 2, v4, v2, v6);
}

uint64_t sub_2211CE65C()
{
  uint64_t v2 = *(void *)(*v1 + 48);
  uint64_t v3 = *(void *)(*v1 + 40);
  uint64_t v4 = *(void *)(*v1 + 32);
  uint64_t v5 = *v1;
  *(void *)(v5 + 64) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2211CE804, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_2211CE804()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2211CE868(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return MEMORY[0x270FA2498](sub_2211CE888, 0, 0);
}

uint64_t sub_2211CE888()
{
  uint64_t v1 = *(void *)(v0[5] + 16);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[6] = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46820);
  v0[7] = v3;
  *uint64_t v2 = v0;
  v2[1] = sub_2211CE950;
  uint64_t v4 = v0[4];
  uint64_t v5 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v4, v1, &type metadata for ExecutionStatus, v3, v5);
}

uint64_t sub_2211CE950()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2211CEA84, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2211CEA84()
{
  uint64_t v1 = *(void **)(v0 + 64);
  *(void *)(v0 + 16) = v1;
  id v2 = v1;
  sub_2211D79C0(0, &qword_267F46828);
  if (swift_dynamicCast())
  {
    id v3 = *(id *)(v0 + 24);
    if (objc_msgSend(v3, sel_code) == (id)19)
    {
      uint64_t v4 = *(void **)(v0 + 64);

      sub_2211D22BC();
      swift_allocError();
      char v6 = 6;
LABEL_14:
      *uint64_t v5 = v6;
      swift_willThrow();

      uint64_t v11 = *(void **)(v0 + 16);
      goto LABEL_17;
    }
    if (objc_msgSend(v3, sel_code) == (id)12)
    {
      uint64_t v7 = *(void **)(v0 + 64);

      sub_2211D22BC();
      swift_allocError();
      char v6 = 3;
      goto LABEL_14;
    }
    if (objc_msgSend(v3, sel_code) == (id)13)
    {
      uint64_t v8 = *(void **)(v0 + 64);

      sub_2211D22BC();
      swift_allocError();
      char v6 = 1;
      goto LABEL_14;
    }
    if (objc_msgSend(v3, sel_code) == (id)18)
    {
      uint64_t v9 = *(void **)(v0 + 64);

      sub_2211D22BC();
      swift_allocError();
      char v6 = 2;
      goto LABEL_14;
    }
    id v10 = objc_msgSend(v3, sel_code);

    if (v10 == (id)14)
    {

      sub_2211D22BC();
      swift_allocError();
      char v6 = 8;
      goto LABEL_14;
    }
    if (objc_msgSend(v3, sel_code) == (id)15)
    {

      sub_2211D22BC();
      swift_allocError();
      char v6 = 9;
      goto LABEL_14;
    }
  }
  uint64_t v12 = *(void **)(v0 + 64);

  sub_2211D22BC();
  swift_allocError();
  *uint64_t v13 = 0;
  swift_willThrow();
  uint64_t v11 = v12;
LABEL_17:

  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t RemoteKeylessEntryAction.ExecutionRequest.deinit()
{
  swift_release();
  return v0;
}

uint64_t RemoteKeylessEntryAction.ExecutionRequest.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.eventStream.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46840);
  MEMORY[0x270FA5388](v2 - 8);
  char v29 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46848);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46850);
  uint64_t v27 = *(void *)(v8 - 8);
  uint64_t v28 = v8;
  MEMORY[0x270FA5388](v8);
  id v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46858);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v26 - v15;
  uint64_t v30 = v1;
  uint64_t v17 = v1
      + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_currentEventStream;
  swift_beginAccess();
  sub_2211D6D3C(v17, (uint64_t)v16, &qword_267F46858);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46860);
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v19 + 32))(v31, v16, v18);
  }
  sub_2211D7964((uint64_t)v16, &qword_267F46858);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8F580], v4);
  uint64_t v20 = v31;
  sub_2211CF1B8(v31, (uint64_t)v10, (uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v14, v20, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v14, 0, 1, v18);
  swift_beginAccess();
  sub_2211D7900((uint64_t)v14, v17, &qword_267F46858);
  swift_endAccess();
  uint64_t v22 = v27;
  uint64_t v21 = v28;
  uint64_t v23 = (uint64_t)v29;
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v29, v10, v28);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 56))(v23, 0, 1, v21);
  uint64_t v24 = v30
      + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_currentEventStreamContinuation;
  swift_beginAccess();
  sub_2211D7900(v23, v24, &qword_267F46840);
  return swift_endAccess();
}

uint64_t sub_2211CF1B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  uint64_t v23 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46848);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46860);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46840);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v20 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46850);
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v22, v3);
  uint64_t v24 = v16;
  sub_2211D7DD0();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v23, v10, v7);
  sub_2211D6D3C((uint64_t)v16, (uint64_t)v14, &qword_267F46840);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v14, 1, v17);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(v21, v14, v17);
    return sub_2211D7964((uint64_t)v16, &qword_267F46840);
  }
  return result;
}

uint64_t sub_2211CF4B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46858);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v27 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46848);
  uint64_t v4 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46860);
  uint64_t v7 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46840);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v24 - v14;
  uint64_t v28 = v1;
  uint64_t v16 = v1
      + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_currentEventStreamContinuation;
  swift_beginAccess();
  sub_2211D6D3C(v16, (uint64_t)v15, &qword_267F46840);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46850);
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v15, 1, v17) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(v29, v15, v17);
  }
  sub_2211D7964((uint64_t)v15, &qword_267F46840);
  uint64_t v19 = v26;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F8F580], v26);
  sub_2211CF1B8((uint64_t)v9, v29, (uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v19);
  uint64_t v20 = (uint64_t)v27;
  uint64_t v21 = v25;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v27, v9, v25);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v20, 0, 1, v21);
  uint64_t v22 = v28
      + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_currentEventStream;
  swift_beginAccess();
  sub_2211D7900(v20, v22, &qword_267F46858);
  swift_endAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v13, v29, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v13, 0, 1, v17);
  swift_beginAccess();
  sub_2211D7900((uint64_t)v13, v16, &qword_267F46840);
  return swift_endAccess();
}

uint64_t sub_2211CF8C4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A00);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46850);
  uint64_t v30 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267F46B20 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_2211D7CB0();
  __swift_project_value_buffer(v13, (uint64_t)qword_267F46B28);
  uint64_t v14 = sub_2211D7C90();
  os_log_type_t v15 = sub_2211D7E20();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = v10;
    uint64_t v17 = v9;
    uint64_t v18 = a1;
    uint64_t v19 = v7;
    unint64_t v20 = a2;
    uint64_t v21 = v6;
    uint64_t v22 = v16;
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_2211C6000, v14, v15, "Sending ContinuationRequest over the AsyncStream", v16, 2u);
    uint64_t v23 = v22;
    uint64_t v6 = v21;
    a2 = v20;
    uint64_t v7 = v19;
    a1 = v18;
    uint64_t v9 = v17;
    uint64_t v10 = v29;
    MEMORY[0x223C7B120](v23, -1, -1);
  }

  sub_2211CF4B8((uint64_t)v12);
  uint64_t v24 = *(void **)(v3
                 + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_session);
  uint64_t v25 = *(void *)(v3
                  + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_action
                  + 16);
  uint64_t v26 = *(void *)(v3
                  + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_action
                  + 24);
  long long v31 = *(_OWORD *)(v3
                  + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_action);
  char v32 = v24;
  uint64_t v33 = v25;
  uint64_t v34 = v26;
  uint64_t v35 = a1;
  unint64_t v36 = a2;
  id v27 = v24;
  sub_2211D273C(a1, a2);
  swift_bridgeObjectRetain();
  sub_2211D7DB0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v12, v10);
}

uint64_t RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.results()(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_2211D7C00();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2211CFC4C, 0, 0);
}

uint64_t sub_2211CFC4C()
{
  if (qword_267F46B40 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = sub_2211D7C30();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_267F46B48);
  sub_2211D7C20();
  sub_2211D7BE0();
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, char, uint64_t, uint64_t, uint64_t))((char *)&dword_267F46870
                                                                                           + dword_267F46870);
  id v4 = v1;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[7] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_2211CFD78;
  uint64_t v6 = v0[6];
  uint64_t v7 = v0[2];
  uint64_t v8 = v0[3];
  return v10(v7, (uint64_t)" Waiting for Remote Keyless Entry Enduring Action Results", 57, 2, v6, v3, v8);
}

uint64_t sub_2211CFD78()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 48);
  uint64_t v3 = *(void *)(*(void *)v1 + 40);
  uint64_t v4 = *(void *)(*(void *)v1 + 32);
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_2211CFF58;
  }
  else {
    uint64_t v5 = sub_2211CFEE8;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_2211CFEE8()
{
  sub_2211D05C0(*(void *)(v0 + 24));
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2211CFF58()
{
  sub_2211D05C0(*(void *)(v0 + 24));
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2211CFFC8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return MEMORY[0x270FA2498](sub_2211CFFE8, 0, 0);
}

uint64_t sub_2211CFFE8()
{
  uint64_t v1 = *(void *)(v0[5]
                 + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_task);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[6] = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46820);
  v0[7] = v3;
  *uint64_t v2 = v0;
  v2[1] = sub_2211D00B8;
  uint64_t v4 = v0[4];
  uint64_t v5 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v4, v1, &type metadata for ExecutionStatus, v3, v5);
}

uint64_t sub_2211D00B8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2211D7B94, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.stop()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2211D7C00();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v30 = v2;
  uint64_t v31 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2211D7C30();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267F46B40 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v6, (uint64_t)qword_267F46B48);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  sub_2211D7C20();
  sub_2211D7BE0();
  uint64_t v11 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v11 = 0;
  uint64_t v12 = sub_2211D7C20();
  os_signpost_type_t v13 = sub_2211D7E90();
  os_signpost_id_t v14 = sub_2211D7BF0();
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v12, v13, v14, " Waiting for Remote Keyless Entry Action Results", "", v11, 2u);
  os_log_type_t v15 = *(void **)(v0
                 + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_session);
  uint64_t v32 = v1;
  uint64_t v16 = (void *)sub_2211D7E00();
  uint64_t v17 = (void *)sub_2211D7D10();
  id v18 = objc_msgSend(v15, sel_cancelRKEFunction_readerIdentifier_, v16, v17);

  if (!v18)
  {
    if (!v29) {
      goto LABEL_11;
    }
LABEL_10:

    (*(void (**)(char *, uint64_t))(v31 + 8))(v5, v30);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    sub_2211D05C0(v32);
    return;
  }
  id v19 = v18;
  unint64_t v20 = (void *)sub_2211D7BA0();
  uint64_t v21 = (char *)objc_msgSend(v20, sel_code);

  if ((unint64_t)(v21 - 12) >= 8) {
    char v22 = 0;
  }
  else {
    char v22 = 0x600000A00000003uLL >> (8 * (v21 - 12));
  }
  sub_2211D22BC();
  uint64_t v23 = swift_allocError();
  *uint64_t v24 = v22;
  swift_willThrow();

  if (v23) {
    goto LABEL_10;
  }
  uint64_t v29 = 0;
LABEL_11:
  uint64_t v25 = v30;
  os_signpost_type_t v26 = sub_2211D7E80();
  os_signpost_id_t v27 = sub_2211D7BF0();
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v12, v26, v27, " Waiting for Remote Keyless Entry Action Results", "", v11, 2u);

  MEMORY[0x223C7B120](v11, -1, -1);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v5, v25);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_2211D05C0(v32);
}

uint64_t sub_2211D05C0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46858);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = &v23[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46840);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = &v23[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v23[-v9];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46850);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  os_signpost_id_t v14 = &v23[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = a1
      + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_currentEventStreamContinuation;
  swift_beginAccess();
  sub_2211D6D3C(v15, (uint64_t)v10, &qword_267F46840);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1) {
    return sub_2211D7964((uint64_t)v10, &qword_267F46840);
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v12 + 32))(v14, v10, v11);
  if (qword_267F46B20 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_2211D7CB0();
  __swift_project_value_buffer(v17, (uint64_t)qword_267F46B28);
  id v18 = sub_2211D7C90();
  os_log_type_t v19 = sub_2211D7E20();
  if (os_log_type_enabled(v18, v19))
  {
    unint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v20 = 0;
    _os_log_impl(&dword_2211C6000, v18, v19, "Finishing event stream", v20, 2u);
    MEMORY[0x223C7B120](v20, -1, -1);
  }

  sub_2211D7DC0();
  (*(void (**)(unsigned char *, uint64_t))(v12 + 8))(v14, v11);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v8, 1, 1, v11);
  swift_beginAccess();
  sub_2211D7900((uint64_t)v8, v15, &qword_267F46840);
  swift_endAccess();
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46860);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v4, 1, 1, v21);
  uint64_t v22 = a1
      + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_currentEventStream;
  swift_beginAccess();
  sub_2211D7900((uint64_t)v4, v22, &qword_267F46858);
  return swift_endAccess();
}

uint64_t RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.ContinuationRequest.data.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  sub_2211D273C(v1, *(void *)(v0 + 48));
  return v1;
}

id RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.ContinuationRequest.confirm(_:)(uint64_t a1, unint64_t a2)
{
  v12[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(v2 + 16);
  uint64_t v5 = (void *)sub_2211D7E00();
  uint64_t v6 = (void *)sub_2211D7E00();
  if (a2 >> 60 == 15) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = (void *)sub_2211D7BC0();
  }
  uint64_t v8 = (void *)sub_2211D7D10();
  v12[0] = 0;
  unsigned int v9 = objc_msgSend(v4, sel_continueExecutingRKEFunction_action_arbitraryData_readerIdentifier_error_, v5, v6, v7, v8, v12);

  if (v9) {
    return v12[0];
  }
  id v11 = v12[0];
  sub_2211D7BB0();

  return (id)swift_willThrow();
}

id RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.init()()
{
}

id RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t RemoteKeylessEntryEnduringAction.EnduringExecutionRequest.results()(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_2211D7C00();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2211D0D04, 0, 0);
}

uint64_t sub_2211D0D04()
{
  if (qword_267F46B40 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2211D7C30();
  uint64_t v2 = __swift_project_value_buffer(v1, (uint64_t)qword_267F46B48);
  sub_2211D7C20();
  sub_2211D7BE0();
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, char, uint64_t, uint64_t, uint64_t))((char *)&dword_267F46880
                                                                                          + dword_267F46880);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[7] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2211D0E34;
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[2];
  uint64_t v6 = v0[3];
  return v8(v5, (uint64_t)" Waiting for Remote Keyless Entry Enduring Action Results", 57, 2, v4, v2, v6);
}

uint64_t sub_2211D0E34()
{
  uint64_t v2 = *(void *)(*v1 + 48);
  uint64_t v3 = *(void *)(*v1 + 40);
  uint64_t v4 = *(void *)(*v1 + 32);
  uint64_t v5 = *v1;
  *(void *)(v5 + 64) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2211D7B90, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_2211D0FDC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return MEMORY[0x270FA2498](sub_2211D0FFC, 0, 0);
}

uint64_t sub_2211D0FFC()
{
  uint64_t v1 = *(void *)(v0[5] + 48);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[6] = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46820);
  v0[7] = v3;
  *uint64_t v2 = v0;
  v2[1] = sub_2211D10C4;
  uint64_t v4 = v0[4];
  uint64_t v5 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v4, v1, &type metadata for ExecutionStatus, v3, v5);
}

uint64_t sub_2211D10C4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2211D11F8, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2211D11F8()
{
  uint64_t v1 = *(void **)(v0 + 64);
  *(void *)(v0 + 16) = v1;
  id v2 = v1;
  sub_2211D79C0(0, &qword_267F46828);
  if (swift_dynamicCast())
  {
    id v3 = *(id *)(v0 + 24);
    if (objc_msgSend(v3, sel_code) == (id)19)
    {
      uint64_t v4 = *(void **)(v0 + 64);

      sub_2211D22BC();
      swift_allocError();
      char v6 = 6;
LABEL_12:
      *uint64_t v5 = v6;
      swift_willThrow();

      uint64_t v10 = *(void **)(v0 + 16);
      goto LABEL_15;
    }
    if (objc_msgSend(v3, sel_code) == (id)12)
    {
      uint64_t v7 = *(void **)(v0 + 64);

      sub_2211D22BC();
      swift_allocError();
      char v6 = 3;
      goto LABEL_12;
    }
    if (objc_msgSend(v3, sel_code) == (id)13)
    {
      uint64_t v8 = *(void **)(v0 + 64);

      sub_2211D22BC();
      swift_allocError();
      char v6 = 1;
      goto LABEL_12;
    }
    id v9 = objc_msgSend(v3, sel_code);

    if (v9 == (id)18)
    {

      sub_2211D22BC();
      swift_allocError();
      char v6 = 2;
      goto LABEL_12;
    }
    if (objc_msgSend(v3, sel_code) == (id)14)
    {

      sub_2211D22BC();
      swift_allocError();
      char v6 = 8;
      goto LABEL_12;
    }
  }
  id v11 = *(void **)(v0 + 64);

  sub_2211D22BC();
  swift_allocError();
  *uint64_t v12 = 0;
  swift_willThrow();
  uint64_t v10 = v11;
LABEL_15:

  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> RemoteKeylessEntryEnduringAction.EnduringExecutionRequest.stop()()
{
  uint64_t v27 = sub_2211D7C00();
  uint64_t v29 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  id v2 = (char *)v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2211D7C30();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267F46B40 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v3, (uint64_t)qword_267F46B48);
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v28 = v3;
  v8(v6, v7, v3);
  sub_2211D7C20();
  sub_2211D7BE0();
  id v9 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)id v9 = 0;
  uint64_t v10 = sub_2211D7C20();
  os_signpost_type_t v11 = sub_2211D7E90();
  os_signpost_id_t v12 = sub_2211D7BF0();
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v10, v11, v12, " Waiting for Remote Keyless Entry Action Results", "", v9, 2u);
  uint64_t v13 = *(void **)(v0 + 56);
  os_signpost_id_t v14 = (void *)sub_2211D7E00();
  uint64_t v15 = (void *)sub_2211D7D10();
  id v16 = objc_msgSend(v13, sel_cancelRKEFunction_readerIdentifier_, v14, v15);

  if (v16)
  {
    id v17 = v16;
    id v18 = (void *)sub_2211D7BA0();
    os_log_type_t v19 = (char *)objc_msgSend(v18, sel_code);

    if ((unint64_t)(v19 - 12) >= 8) {
      char v20 = 0;
    }
    else {
      char v20 = 0x600000A00000003uLL >> (8 * (v19 - 12));
    }
    sub_2211D22BC();
    uint64_t v21 = swift_allocError();
    *uint64_t v22 = v20;
    swift_willThrow();

    if (v21) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v23 = v27;
    os_signpost_type_t v24 = sub_2211D7E80();
    os_signpost_id_t v25 = sub_2211D7BF0();
    _os_signpost_emit_with_name_impl(&dword_2211C6000, v10, v24, v25, " Waiting for Remote Keyless Entry Action Results", "", v9, 2u);

    MEMORY[0x223C7B120](v9, -1, -1);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v2, v23);
    goto LABEL_11;
  }
  if (!v26[1]) {
    goto LABEL_10;
  }
LABEL_8:

  (*(void (**)(char *, uint64_t))(v29 + 8))(v2, v27);
LABEL_11:
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v28);
}

uint64_t RemoteKeylessEntryEnduringAction.EnduringExecutionRequest.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();

  return v0;
}

uint64_t RemoteKeylessEntryEnduringAction.EnduringExecutionRequest.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0228](v0, 64, 7);
}

id sub_2211D19A0()
{
  return sub_2211D19B8(type metadata accessor for SESRKESessionContinuationDelegateHandler);
}

id sub_2211D19B8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t FunctionIdentifier.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t ActionIdentifier.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t ExecutionStatus.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t FunctionStatus.rawValue.getter()
{
  return *(void *)v0;
}

CarKey::FunctionStatus __swiftcall FunctionStatus.init(rawValue:)(CarKey::FunctionStatus rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void *sub_2211D1A74@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_2211D1A84(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_2211D1A90()
{
  return sub_2211D8060();
}

uint64_t sub_2211D1AD8()
{
  return sub_2211D8050();
}

uint64_t sub_2211D1B04()
{
  return sub_2211D8060();
}

BOOL sub_2211D1B48(void *a1, void *a2)
{
  return *a1 == *a2;
}

BOOL static CarKeyErrorCode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CarKeyErrorCode.hash(into:)()
{
  return sub_2211D8050();
}

uint64_t CarKeyErrorCode.hashValue.getter()
{
  return sub_2211D8060();
}

BOOL sub_2211D1BE4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2211D1C08()
{
  uint64_t v0 = sub_2211D7CB0();
  __swift_allocate_value_buffer(v0, qword_267F46B28);
  __swift_project_value_buffer(v0, (uint64_t)qword_267F46B28);
  return sub_2211D7CA0();
}

uint64_t sub_2211D1C7C()
{
  uint64_t v0 = sub_2211D7CB0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  objc_super v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2211D7C30();
  __swift_allocate_value_buffer(v4, qword_267F46B48);
  __swift_project_value_buffer(v4, (uint64_t)qword_267F46B48);
  if (qword_267F46B20 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_267F46B28);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_2211D7C10();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2211D1DF0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 48);
  id v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *id v9 = v2;
  v9[1] = sub_2211D1EB8;
  return sub_2211C7BB0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_2211D1EB8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2211D1FAC(uint64_t a1, const char *a2, char a3)
{
  os_signpost_id_t v25 = a2;
  uint64_t v4 = sub_2211D7C40();
  uint64_t v24 = *(void *)(v4 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = &v22[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_2211D7C00();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v11 = &v22[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = &v22[-v12];
  os_signpost_id_t v14 = sub_2211D7C20();
  sub_2211D7C50();
  int v23 = sub_2211D7E80();
  uint64_t result = sub_2211D7EA0();
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  if ((a3 & 1) == 0)
  {
    id v16 = v25;
    if (!v25)
    {
      __break(1u);
LABEL_5:

      return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v13, v7);
    }
    goto LABEL_10;
  }
  if ((unint64_t)v25 >> 32)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v25 >> 11 == 27)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  if (v25 >> 16 > 0x10)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  id v16 = &v26;
LABEL_10:
  swift_retain();
  sub_2211D7C80();
  swift_release();
  uint64_t v17 = v24;
  if ((*(unsigned int (**)(unsigned char *, uint64_t))(v24 + 88))(v6, v4) == *MEMORY[0x263F90238])
  {
    id v18 = "[Error] Interval already ended";
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t))(v17 + 8))(v6, v4);
    id v18 = "";
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v11, v13, v7);
  os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)os_log_type_t v19 = 0;
  os_signpost_id_t v20 = sub_2211D7BF0();
  _os_signpost_emit_with_name_impl(&dword_2211C6000, v14, (os_signpost_type_t)v23, v20, v16, v18, v19, 2u);
  MEMORY[0x223C7B120](v19, -1, -1);

  uint64_t v21 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
  v21(v13, v7);
  return ((uint64_t (*)(unsigned char *, uint64_t))v21)(v11, v7);
}

unint64_t sub_2211D22BC()
{
  unint64_t result = qword_267F467E0;
  if (!qword_267F467E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F467E0);
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

uint64_t sub_2211D2354()
{
  return objectdestroyTm(72);
}

uint64_t sub_2211D235C(uint64_t a1)
{
  long long v7 = *(_OWORD *)(v1 + 48);
  long long v8 = *(_OWORD *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = sub_2211D7B24;
  *(void *)(v5 + 168) = v4;
  *(_OWORD *)(v5 + 152) = v7;
  *(_OWORD *)(v5 + 136) = v8;
  *(void *)(v5 + 128) = a1;
  return MEMORY[0x270FA2498](sub_2211CB4C8, 0, 0);
}

uint64_t type metadata accessor for RemoteKeylessEntryAction.ExecutionRequest()
{
  return self;
}

uint64_t sub_2211D2458()
{
  return objectdestroyTm(73);
}

uint64_t sub_2211D2460(uint64_t a1)
{
  long long v8 = *(_OWORD *)(v1 + 48);
  long long v9 = *(_OWORD *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 64);
  char v5 = *(unsigned char *)(v1 + 72);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_2211D7B24;
  *(unsigned char *)(v6 + 208) = v5;
  *(void *)(v6 + 168) = v4;
  *(_OWORD *)(v6 + 152) = v8;
  *(_OWORD *)(v6 + 136) = v9;
  *(void *)(v6 + 128) = a1;
  return MEMORY[0x270FA2498](sub_2211CC050, 0, 0);
}

uint64_t type metadata accessor for RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest()
{
  uint64_t result = qword_267F472F0;
  if (!qword_267F472F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2211D258C()
{
  return objectdestroyTm(72);
}

uint64_t objectdestroyTm(uint64_t a1)
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_2211D25E8(uint64_t a1)
{
  long long v7 = *(_OWORD *)(v1 + 48);
  long long v8 = *(_OWORD *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = sub_2211D7B24;
  *(void *)(v5 + 168) = v4;
  *(_OWORD *)(v5 + 152) = v7;
  *(_OWORD *)(v5 + 136) = v8;
  *(void *)(v5 + 128) = a1;
  return MEMORY[0x270FA2498](sub_2211CC890, 0, 0);
}

uint64_t type metadata accessor for RemoteKeylessEntryEnduringAction.EnduringExecutionRequest()
{
  return self;
}

uint64_t sub_2211D26E4(uint64_t a1, unint64_t a2)
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

uint64_t sub_2211D273C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2211D26E4(a1, a2);
  }
  return a1;
}

unint64_t sub_2211D2754()
{
  unint64_t result = qword_267F46888;
  if (!qword_267F46888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F46888);
  }
  return result;
}

unint64_t sub_2211D27AC()
{
  unint64_t result = qword_267F46890;
  if (!qword_267F46890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F46890);
  }
  return result;
}

unint64_t sub_2211D2804()
{
  unint64_t result = qword_267F46898;
  if (!qword_267F46898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F46898);
  }
  return result;
}

unint64_t sub_2211D285C()
{
  unint64_t result = qword_267F468A0;
  if (!qword_267F468A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F468A0);
  }
  return result;
}

unint64_t sub_2211D28B4()
{
  unint64_t result = qword_267F468A8;
  if (!qword_267F468A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F468A8);
  }
  return result;
}

uint64_t type metadata accessor for CarKeyRemoteControl()
{
  return self;
}

uint64_t method lookup function for CarKeyRemoteControl(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CarKeyRemoteControl);
}

uint64_t dispatch thunk of static CarKeyRemoteControl.start(delegate:subscriptionRange:with:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  os_signpost_id_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 + 80) + **(int **)(v5 + 80));
  uint64_t v11 = a4 & 1;
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  *uint64_t v12 = v6;
  v12[1] = sub_2211D2A60;
  return v14(a1, a2, a3, v11, a5);
}

uint64_t sub_2211D2A60(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t type metadata accessor for RKESessionDelegate()
{
  return self;
}

uint64_t type metadata accessor for CarKeyRemoteControlSession()
{
  return self;
}

uint64_t method lookup function for CarKeyRemoteControlSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CarKeyRemoteControlSession);
}

uint64_t dispatch thunk of CarKeyRemoteControlSession.vehicleReports.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of CarKeyRemoteControlSession.end()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of CarKeyRemoteControlSession.perform(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of CarKeyRemoteControlSession.perform(_:continuationStrategy:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of CarKeyRemoteControlSession.sendPassthroughData(_:toVehicle:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of CarKeyRemoteControlSession.isPassiveEntryAvailable(forVehicle:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))() & 1;
}

uint64_t dispatch thunk of CarKeyRemoteControlSession.sign(data:forVehicle:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t initializeBufferWithCopyOfBuffer for CarKeyRemoteControlSession.Attestation(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CarKeyRemoteControlSession.Attestation(void *a1)
{
  swift_bridgeObjectRelease();
  sub_2211D2E00(a1[2], a1[3]);
  sub_2211D2E00(a1[4], a1[5]);
  uint64_t v2 = a1[6];
  unint64_t v3 = a1[7];

  return sub_2211D2E00(v2, v3);
}

uint64_t sub_2211D2E00(uint64_t a1, unint64_t a2)
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

void *initializeWithCopy for CarKeyRemoteControlSession.Attestation(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[2];
  unint64_t v6 = a2[3];
  swift_bridgeObjectRetain();
  sub_2211D26E4(v5, v6);
  a1[2] = v5;
  a1[3] = v6;
  uint64_t v7 = a2[4];
  unint64_t v8 = a2[5];
  sub_2211D26E4(v7, v8);
  a1[4] = v7;
  a1[5] = v8;
  uint64_t v10 = a2[6];
  unint64_t v9 = a2[7];
  sub_2211D26E4(v10, v9);
  a1[6] = v10;
  a1[7] = v9;
  return a1;
}

void *assignWithCopy for CarKeyRemoteControlSession.Attestation(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  unint64_t v5 = a2[3];
  sub_2211D26E4(v4, v5);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  a1[2] = v4;
  a1[3] = v5;
  sub_2211D2E00(v6, v7);
  uint64_t v8 = a2[4];
  unint64_t v9 = a2[5];
  sub_2211D26E4(v8, v9);
  uint64_t v10 = a1[4];
  unint64_t v11 = a1[5];
  a1[4] = v8;
  a1[5] = v9;
  sub_2211D2E00(v10, v11);
  uint64_t v13 = a2[6];
  unint64_t v12 = a2[7];
  sub_2211D26E4(v13, v12);
  uint64_t v14 = a1[6];
  unint64_t v15 = a1[7];
  a1[6] = v13;
  a1[7] = v12;
  sub_2211D2E00(v14, v15);
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for CarKeyRemoteControlSession.Attestation(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a1[2];
  unint64_t v6 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_2211D2E00(v5, v6);
  uint64_t v7 = a1[4];
  unint64_t v8 = a1[5];
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  sub_2211D2E00(v7, v8);
  uint64_t v9 = a1[6];
  unint64_t v10 = a1[7];
  *((_OWORD *)a1 + 3) = *(_OWORD *)(a2 + 48);
  sub_2211D2E00(v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarKeyRemoteControlSession.Attestation(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CarKeyRemoteControlSession.Attestation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CarKeyRemoteControlSession.Attestation()
{
  return &type metadata for CarKeyRemoteControlSession.Attestation;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CarKeyRemoteControlSession.ContinuationStrategy(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CarKeyRemoteControlSession.ContinuationStrategy(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2211D3204);
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

uint64_t sub_2211D322C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2211D3234(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CarKeyRemoteControlSession.ContinuationStrategy()
{
  return &type metadata for CarKeyRemoteControlSession.ContinuationStrategy;
}

uint64_t dispatch thunk of CarKeyRemoteControlSessionDelegate.remoteControlSession(_:didInvalidateWithError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of CarKeyRemoteControlSessionDelegate.remoteControlSession(_:didCreateKey:forVehicle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 16))();
}

uint64_t dispatch thunk of CarKeyRemoteControlSessionDelegate.remoteControlSession(_:vehicleDidUpdateReport:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of CarKeyRemoteControlSessionDelegate.remoteControlSession(_:didReceivePassthroughData:fromVehicle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 32))();
}

uint64_t destroy for VehicleReport()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for VehicleReport(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for VehicleReport(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for VehicleReport(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for VehicleReport(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for VehicleReport(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for VehicleReport()
{
  return &type metadata for VehicleReport;
}

uint64_t destroy for RemoteKeylessEntryAction()
{
  return swift_bridgeObjectRelease();
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

ValueMetadata *type metadata accessor for RemoteKeylessEntryAction()
{
  return &type metadata for RemoteKeylessEntryAction;
}

uint64_t method lookup function for RemoteKeylessEntryAction.ExecutionRequest(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RemoteKeylessEntryAction.ExecutionRequest);
}

ValueMetadata *type metadata accessor for RemoteKeylessEntryConfigurableEnduringAction()
{
  return &type metadata for RemoteKeylessEntryConfigurableEnduringAction;
}

uint64_t sub_2211D3574()
{
  return type metadata accessor for RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest();
}

void sub_2211D357C()
{
  sub_2211D36EC(319, &qword_267F46970, &qword_267F46860);
  if (v0 <= 0x3F)
  {
    sub_2211D36EC(319, &qword_267F46978, &qword_267F46850);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest);
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

void sub_2211D36EC(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_2211D7EB0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_2211D3748(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.ContinuationRequest()
{
  return &type metadata for RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.ContinuationRequest;
}

uint64_t _s6CarKey44RemoteKeylessEntryConfigurableEnduringActionV24EnduringExecutionRequestC19ContinuationRequestVwxx_0(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v3 = *(void *)(a1 + 48);
  if (v3 >> 60 != 15)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    return sub_2211D2E00(v4, v3);
  }
  return result;
}

uint64_t _s6CarKey44RemoteKeylessEntryConfigurableEnduringActionV24EnduringExecutionRequestC19ContinuationRequestVwcp_0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unint64_t v3 = *(void **)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = (uint64_t *)(a2 + 40);
  unint64_t v6 = *(void *)(a2 + 48);
  id v7 = v3;
  swift_bridgeObjectRetain();
  if (v6 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)v5;
  }
  else
  {
    uint64_t v8 = *v5;
    sub_2211D26E4(*v5, v6);
    *(void *)(a1 + 40) = v8;
    *(void *)(a1 + 48) = v6;
  }
  return a1;
}

void *_s6CarKey44RemoteKeylessEntryConfigurableEnduringActionV24EnduringExecutionRequestC19ContinuationRequestVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v4 = (void *)a2[2];
  uint64_t v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v7 = a2 + 5;
  unint64_t v8 = a2[6];
  if (a1[6] >> 60 != 15)
  {
    if (v8 >> 60 != 15)
    {
      uint64_t v10 = *v7;
      sub_2211D26E4(*v7, v8);
      uint64_t v11 = a1[5];
      unint64_t v12 = a1[6];
      a1[5] = v10;
      a1[6] = v8;
      sub_2211D2E00(v11, v12);
      return a1;
    }
    sub_2211D3748((uint64_t)(a1 + 5));
    goto LABEL_6;
  }
  if (v8 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 5) = *(_OWORD *)v7;
    return a1;
  }
  uint64_t v9 = *v7;
  sub_2211D26E4(*v7, v8);
  a1[5] = v9;
  a1[6] = v8;
  return a1;
}

uint64_t _s6CarKey44RemoteKeylessEntryConfigurableEnduringActionV24EnduringExecutionRequestC19ContinuationRequestVwta_0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  id v6 = (void *)(a2 + 40);
  unint64_t v7 = *(void *)(a1 + 48);
  if (v7 >> 60 != 15)
  {
    unint64_t v8 = *(void *)(a2 + 48);
    if (v8 >> 60 != 15)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(void *)(a1 + 40) = *v6;
      *(void *)(a1 + 48) = v8;
      sub_2211D2E00(v9, v7);
      return a1;
    }
    sub_2211D3748(a1 + 40);
  }
  *(_OWORD *)(a1 + 40) = *(_OWORD *)v6;
  return a1;
}

uint64_t _s6CarKey44RemoteKeylessEntryConfigurableEnduringActionV24EnduringExecutionRequestC19ContinuationRequestVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_2211D3A98(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_2211D3AE4()
{
  return 0;
}

ValueMetadata *type metadata accessor for RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.Event()
{
  return &type metadata for RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.Event;
}

uint64_t _s6CarKey24RemoteKeylessEntryActionVwcp_0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *_s6CarKey24RemoteKeylessEntryActionVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6CarKey24RemoteKeylessEntryActionVwta_0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6CarKey24RemoteKeylessEntryActionVwet_0(uint64_t a1, int a2)
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

uint64_t sub_2211D3C0C(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RemoteKeylessEntryEnduringAction()
{
  return &type metadata for RemoteKeylessEntryEnduringAction;
}

uint64_t method lookup function for RemoteKeylessEntryEnduringAction.EnduringExecutionRequest(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RemoteKeylessEntryEnduringAction.EnduringExecutionRequest);
}

uint64_t type metadata accessor for SESRKESessionContinuationDelegateHandler()
{
  return self;
}

ValueMetadata *type metadata accessor for FunctionIdentifier()
{
  return &type metadata for FunctionIdentifier;
}

ValueMetadata *type metadata accessor for ActionIdentifier()
{
  return &type metadata for ActionIdentifier;
}

ValueMetadata *type metadata accessor for ExecutionStatus()
{
  return &type metadata for ExecutionStatus;
}

ValueMetadata *type metadata accessor for FunctionStatus()
{
  return &type metadata for FunctionStatus;
}

uint64_t getEnumTagSinglePayload for CarKeyErrorCode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
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
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CarKeyErrorCode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *uint64_t result = a2 + 12;
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
        JUMPOUT(0x2211D3E34);
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
          *uint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

unsigned char *sub_2211D3E5C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CarKeyErrorCode()
{
  return &type metadata for CarKeyErrorCode;
}

uint64_t sub_2211D3E74(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2211D3F48(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2211D7440((uint64_t)v12, *a3);
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
      sub_2211D7440((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_2211D3F48(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2211D7ED0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2211D4104(a5, a6);
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
  uint64_t v8 = sub_2211D7F40();
  if (!v8)
  {
    sub_2211D7F50();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2211D7FB0();
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

uint64_t sub_2211D4104(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2211D419C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2211D437C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2211D437C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2211D419C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2211D4314(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2211D7F20();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2211D7F50();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2211D7D40();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2211D7FB0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2211D7F50();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2211D4314(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A50);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2211D437C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A50);
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
  uint64_t result = sub_2211D7FB0();
  __break(1u);
  return result;
}

unint64_t sub_2211D44CC(uint64_t a1, uint64_t a2)
{
  sub_2211D8040();
  sub_2211D7D30();
  uint64_t v4 = sub_2211D8060();

  return sub_2211D45F4(a1, a2, v4);
}

unint64_t sub_2211D4544(uint64_t a1)
{
  uint64_t v2 = sub_2211D7EF0();

  return sub_2211D46D8(a1, v2);
}

unint64_t sub_2211D4588(uint64_t a1)
{
  sub_2211D8040();
  sub_2211D8050();
  uint64_t v2 = sub_2211D8060();

  return sub_2211D47A0(a1, v2);
}

unint64_t sub_2211D45F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2211D7FC0() & 1) == 0)
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
      while (!v14 && (sub_2211D7FC0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2211D46D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_2211D74F0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x223C7AB00](v9, a1);
      sub_2211D7204((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_2211D47A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_2211D483C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2211D487C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2211D485C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2211D4A04(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2211D487C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A98);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8]) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[48 * v8] || v12 >= &v13[48 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2211D7FB0();
  __break(1u);
  return result;
}

uint64_t sub_2211D4A04(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A90);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2211D7FB0();
  __break(1u);
  return result;
}

uint64_t sub_2211D4B64(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A88);
  uint64_t result = sub_2211D7F90();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v29 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v12) {
          goto LABEL_33;
        }
        unint64_t v21 = v29[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v12) {
            goto LABEL_33;
          }
          unint64_t v21 = v29[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v12)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v28 = 1 << *(unsigned char *)(v5 + 32);
              if (v28 >= 64) {
                bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v29 = -1 << v28;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v29[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v12) {
                  goto LABEL_33;
                }
                unint64_t v21 = v29[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = *(void *)(*(void *)(v5 + 48) + 8 * v19);
      long long v30 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * v19);
      if ((a2 & 1) == 0) {
        sub_2211D26E4(v30, *((unint64_t *)&v30 + 1));
      }
      sub_2211D8040();
      sub_2211D8050();
      uint64_t result = sub_2211D8060();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v16 == v24;
          if (v16 == v24) {
            unint64_t v16 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v13 + 8 * v16);
        }
        while (v26 == -1);
        unint64_t v17 = __clz(__rbit64(~v26)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(void *)(*(void *)(v7 + 48) + 8 * v17) = v27;
      *(_OWORD *)(*(void *)(v7 + 56) + 16 * v17) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2211D4E40(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A80);
  uint64_t result = sub_2211D7F90();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v32 = a2;
    int64_t v8 = 0;
    uint64_t v33 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v17 = v16 | (v8 << 6);
      }
      else
      {
        int64_t v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v18 >= v12) {
          goto LABEL_31;
        }
        unint64_t v19 = v33[v18];
        ++v8;
        if (!v19)
        {
          int64_t v8 = v18 + 1;
          if (v18 + 1 >= v12) {
            goto LABEL_31;
          }
          unint64_t v19 = v33[v8];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v12)
            {
LABEL_31:
              if ((v32 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_38;
              }
              uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
              if (v31 >= 64) {
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v33 = -1 << v31;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v19 = v33[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v8 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v12) {
                  goto LABEL_31;
                }
                unint64_t v19 = v33[v8];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v20;
          }
        }
LABEL_21:
        unint64_t v11 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      uint64_t v21 = 8 * v17;
      uint64_t v22 = *(void *)(*(void *)(v5 + 48) + v21);
      uint64_t v23 = *(void *)(*(void *)(v5 + 56) + v21);
      sub_2211D8040();
      sub_2211D8050();
      uint64_t result = sub_2211D8060();
      uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v13 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v25) & ~*(void *)(v13 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v13 + 8 * v26);
        }
        while (v30 == -1);
        unint64_t v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = 8 * v14;
      *(void *)(*(void *)(v7 + 48) + v15) = v22;
      *(void *)(*(void *)(v7 + 56) + v15) = v23;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

void *sub_2211D5110()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A88);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2211D7F80();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    long long v19 = *(_OWORD *)(*(void *)(v2 + 56) + v18);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(void *)(v4 + 56) + v18) = v19;
    uint64_t result = (void *)sub_2211D26E4(v19, *((unint64_t *)&v19 + 1));
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2211D52C0()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A80);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2211D7F80();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v21 = __clz(__rbit64(v19));
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = v21 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2211D5450(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
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
  int64_t v9 = (unint64_t *)(a1 + 80);
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

uint64_t sub_2211D54D8()
{
  uint64_t v0 = sub_2211D7CC0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2211D7CE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v9 = result;
    unint64_t v10 = (void *)sub_2211D7BA0();
    id v11 = objc_msgSend(v10, sel_code);

    if (v11 == (id)17) {
      char v12 = 11;
    }
    else {
      char v12 = 0;
    }
    uint64_t v17 = *(void *)(v9 + 80);
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v9;
    *(unsigned char *)(v13 + 24) = v12;
    aBlock[4] = sub_2211D7704;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2211C9694;
    aBlock[3] = &block_descriptor_118;
    unint64_t v14 = _Block_copy(aBlock);
    swift_retain();
    sub_2211D7CD0();
    uint64_t v18 = MEMORY[0x263F8EE78];
    sub_2211D79FC(&qword_267F46A30, MEMORY[0x263F8F030]);
    uint64_t v16 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A38);
    sub_2211D7A44(&qword_267F46A40, &qword_267F46A38);
    sub_2211D7EE0();
    MEMORY[0x223C7AA60](0, v7, v3, v14);
    _Block_release(v14);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v16);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2211D57D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_2211D7CC0();
  uint64_t v20 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_2211D7CE0();
  uint64_t v11 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v15 = result;
    uint64_t v18 = *(void *)(result + 80);
    uint64_t v16 = (void *)swift_allocObject();
    v16[2] = v15;
    v16[3] = a1;
    v16[4] = a2;
    v16[5] = a3;
    v16[6] = a4;
    aBlock[4] = sub_2211D7594;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2211C9694;
    aBlock[3] = &block_descriptor_112;
    uint64_t v17 = _Block_copy(aBlock);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2211D7CD0();
    uint64_t v21 = MEMORY[0x263F8EE78];
    sub_2211D79FC(&qword_267F46A30, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A38);
    sub_2211D7A44(&qword_267F46A40, &qword_267F46A38);
    sub_2211D7EE0();
    MEMORY[0x223C7AA60](0, v13, v10, v17);
    _Block_release(v17);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v8);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v19);
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_2211D5ACC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A80);
    uint64_t v3 = (void *)sub_2211D7FA0();
    for (i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      uint64_t v5 = *(i - 1);
      uint64_t v6 = *i;
      unint64_t result = sub_2211D4588(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v9 = 8 * result;
      *(void *)(v3[6] + v9) = v5;
      *(void *)(v3[7] + v9) = v6;
      uint64_t v10 = v3[2];
      BOOL v11 = __OFADD__(v10, 1);
      uint64_t v12 = v10 + 1;
      if (v11) {
        goto LABEL_10;
      }
      v3[2] = v12;
      if (!--v1) {
        return (unint64_t)v3;
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

unint64_t sub_2211D5BA4(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A88);
  uint64_t v3 = (void *)sub_2211D7FA0();
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t v6 = a1[6];
  unint64_t result = sub_2211D4588(v5);
  if (v8)
  {
LABEL_7:
    __break(1u);
    return MEMORY[0x263F8EE80];
  }
  uint64_t v9 = a1 + 9;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v5;
    uint64_t v10 = (uint64_t *)(v3[7] + 16 * result);
    *uint64_t v10 = v4;
    v10[1] = v6;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    v3[2] = v13;
    sub_2211D26E4(v4, v6);
    if (!--v1) {
      return (unint64_t)v3;
    }
    uint64_t v5 = *(v9 - 2);
    uint64_t v4 = *(v9 - 1);
    unint64_t v6 = *v9;
    unint64_t result = sub_2211D4588(v5);
    v9 += 3;
    if (v14) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2211D5CA8(unint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v6 = a1;
  if (a1 >> 62) {
    goto LABEL_45;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  uint64_t result = MEMORY[0x263F8EE78];
  if (v7)
  {
    uint64_t v58 = MEMORY[0x263F8EE78];
    uint64_t v54 = v7;
    sub_2211D485C(0, v7 & ~(v7 >> 63), 0);
    uint64_t v9 = v54;
    if ((v54 & 0x8000000000000000) == 0)
    {
      uint64_t v51 = v4;
      unint64_t v52 = v6;
      uint64_t v10 = 0;
      unint64_t v53 = v6 & 0xC000000000000001;
      uint64_t result = v58;
      uint64_t v55 = a3;
      while (1)
      {
        if (v9 == v10)
        {
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
LABEL_45:
          swift_bridgeObjectRetain();
          uint64_t v50 = sub_2211D7F70();
          swift_bridgeObjectRelease();
          uint64_t v7 = v50;
          goto LABEL_3;
        }
        uint64_t v56 = result;
        id v11 = v53 ? (id)MEMORY[0x223C7AB30](v10, v6) : *(id *)(v6 + 8 * v10 + 32);
        uint64_t v4 = v11;
        id v12 = objc_msgSend(v11, sel_integerValue, v51);
        id v13 = objc_msgSend(a2, sel_getStatusForRKEFunction_, v4);
        if (v13) {
          break;
        }
LABEL_23:
        id v30 = objc_msgSend(a2, sel_getProprietaryDataForRKEFunction_, v4);
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = sub_2211D7BD0();
          unint64_t v6 = v33;

          sub_2211D26E4(v32, v6);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v35 = *(void **)(a3 + 40);
          *(void *)(a3 + 40) = 0x8000000000000000;
          a3 = (uint64_t)v12;
          unint64_t v37 = sub_2211D4588((uint64_t)v12);
          uint64_t v38 = v35[2];
          BOOL v39 = (v36 & 1) == 0;
          uint64_t v40 = v38 + v39;
          if (__OFADD__(v38, v39)) {
            goto LABEL_42;
          }
          char v41 = v36;
          if (v35[3] >= v40)
          {
            if (isUniquelyReferenced_nonNull_native)
            {
              if ((v36 & 1) == 0) {
                goto LABEL_33;
              }
            }
            else
            {
              sub_2211D5110();
              if ((v41 & 1) == 0) {
                goto LABEL_33;
              }
            }
          }
          else
          {
            sub_2211D4B64(v40, isUniquelyReferenced_nonNull_native);
            unint64_t v42 = sub_2211D4588(a3);
            if ((v41 & 1) != (v43 & 1)) {
              goto LABEL_47;
            }
            unint64_t v37 = v42;
            if ((v41 & 1) == 0)
            {
LABEL_33:
              v35[(v37 >> 6) + 8] |= 1 << v37;
              *(void *)(v35[6] + 8 * v37) = a3;
              uint64_t v45 = (uint64_t *)(v35[7] + 16 * v37);
              *uint64_t v45 = v32;
              v45[1] = v6;
              uint64_t v46 = v35[2];
              BOOL v28 = __OFADD__(v46, 1);
              uint64_t v47 = v46 + 1;
              if (v28) {
                goto LABEL_44;
              }
              id v12 = (id)a3;
              _OWORD v35[2] = v47;
              goto LABEL_35;
            }
          }
          uint64_t v44 = v35[7] + 16 * v37;
          sub_2211D2E00(*(void *)v44, *(void *)(v44 + 8));
          *(void *)uint64_t v44 = v32;
          *(void *)(v44 + 8) = v6;
          id v12 = (id)a3;
LABEL_35:
          a3 = v55;
          *(void *)(v55 + 40) = v35;
          swift_bridgeObjectRelease();
          sub_2211D2E00(v32, v6);
        }

        uint64_t result = v56;
        unint64_t v49 = *(void *)(v56 + 16);
        unint64_t v48 = *(void *)(v56 + 24);
        uint64_t v4 = (void *)(v49 + 1);
        if (v49 >= v48 >> 1)
        {
          sub_2211D485C(v48 > 1, v49 + 1, 1);
          uint64_t result = v56;
        }
        ++v10;
        *(void *)(result + 16) = v4;
        *(void *)(result + 8 * v49 + 32) = v12;
        uint64_t v9 = v54;
        unint64_t v6 = v52;
        if (v54 == v10) {
          return result;
        }
      }
      unint64_t v6 = (unint64_t)v13;
      id v14 = objc_msgSend(v13, sel_integerValue);
      char v15 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v16 = *(void **)(a3 + 32);
      *(void *)(a3 + 32) = 0x8000000000000000;
      a3 = (uint64_t)v12;
      unint64_t v18 = sub_2211D4588((uint64_t)v12);
      uint64_t v19 = v16[2];
      BOOL v20 = (v17 & 1) == 0;
      uint64_t v21 = v19 + v20;
      if (__OFADD__(v19, v20)) {
        goto LABEL_41;
      }
      char v22 = v17;
      if (v16[3] < v21)
      {
        sub_2211D4E40(v21, v15);
        unint64_t v23 = sub_2211D4588(a3);
        if ((v22 & 1) != (v24 & 1)) {
          goto LABEL_47;
        }
        unint64_t v18 = v23;
        unint64_t v25 = v16;
        if ((v22 & 1) == 0) {
          goto LABEL_20;
        }
LABEL_18:
        *(void *)(v25[7] + 8 * v18) = v14;
        id v12 = (id)a3;
LABEL_22:
        a3 = v55;
        *(void *)(v55 + 32) = v25;

        swift_bridgeObjectRelease();
        goto LABEL_23;
      }
      if (v15)
      {
        unint64_t v25 = v16;
        if (v17) {
          goto LABEL_18;
        }
      }
      else
      {
        sub_2211D52C0();
        unint64_t v25 = v16;
        if (v22) {
          goto LABEL_18;
        }
      }
LABEL_20:
      v25[(v18 >> 6) + 8] |= 1 << v18;
      uint64_t v26 = 8 * v18;
      *(void *)(v25[6] + v26) = a3;
      *(void *)(v25[7] + v26) = v14;
      uint64_t v27 = v25[2];
      BOOL v28 = __OFADD__(v27, 1);
      uint64_t v29 = v27 + 1;
      if (v28) {
        goto LABEL_43;
      }
      id v12 = (id)a3;
      v25[2] = v29;
      goto LABEL_22;
    }
    __break(1u);
LABEL_47:
    uint64_t result = sub_2211D7FE0();
    __break(1u);
  }
  return result;
}

void sub_2211D60FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2211D7CC0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2211D7CE0();
  uint64_t v34 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v14 = Strong;
    strcpy((char *)v39, "xpcEventName");
    BYTE5(v39[1]) = 0;
    HIWORD(v39[1]) = -5120;
    sub_2211D7F10();
    if (*(void *)(a1 + 16) && (unint64_t v15 = sub_2211D4544((uint64_t)&v40), (v16 & 1) != 0))
    {
      sub_2211D7440(*(void *)(a1 + 56) + 32 * v15, (uint64_t)&aBlock);
    }
    else
    {
      long long aBlock = 0u;
      long long v36 = 0u;
    }
    sub_2211D7204((uint64_t)&v40);
    if (*((void *)&v36 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v33 = v7;
        uint64_t v18 = v39[0];
        uint64_t v17 = v39[1];
        if (v39[0] == 0xD000000000000042 && v39[1] == 0x80000002211D93D0
          || (sub_2211D7FC0() & 1) != 0
          || v18 == 0xD00000000000003FLL && v17 == 0x80000002211D9420)
        {
          swift_bridgeObjectRelease();
LABEL_23:
          unint64_t v23 = sub_2211C99CC();
          uint64_t v24 = v23[2];
          if (!v24)
          {
LABEL_31:
            swift_release();
            swift_bridgeObjectRelease();
            return;
          }
          uint64_t v25 = 4;
          while (1)
          {
            long long v26 = *(_OWORD *)&v23[v25 + 4];
            long long v27 = *(_OWORD *)&v23[v25];
            long long v41 = *(_OWORD *)&v23[v25 + 2];
            long long v42 = v26;
            long long v40 = v27;
            BOOL v28 = (void)v27 == a2 && *((void *)&v27 + 1) == a3;
            if (v28 || (sub_2211D7FC0() & 1) != 0) {
              break;
            }
            v25 += 6;
            if (!--v24) {
              goto LABEL_31;
            }
          }
          sub_2211D7258((uint64_t)&v40);
          swift_bridgeObjectRelease();
          uint64_t v29 = swift_allocObject();
          long long v30 = v41;
          *(_OWORD *)(v29 + 24) = v40;
          *(void *)(v29 + 16) = v14;
          *(_OWORD *)(v29 + 40) = v30;
          *(_OWORD *)(v29 + 56) = v42;
          unint64_t v37 = sub_2211D7304;
          uint64_t v38 = v29;
          *(void *)&long long aBlock = MEMORY[0x263EF8330];
          *((void *)&aBlock + 1) = 1107296256;
          *(void *)&long long v36 = sub_2211C9694;
          *((void *)&v36 + 1) = &block_descriptor_106;
          uint64_t v31 = _Block_copy(&aBlock);
          swift_retain();
          sub_2211D7CD0();
          v39[0] = MEMORY[0x263F8EE78];
          sub_2211D79FC(&qword_267F46A30, MEMORY[0x263F8F030]);
          __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A38);
          sub_2211D7A44(&qword_267F46A40, &qword_267F46A38);
          sub_2211D7EE0();
          MEMORY[0x223C7AA60](0, v12, v9, v31);
          _Block_release(v31);
          (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v6);
          (*(void (**)(char *, uint64_t))(v34 + 8))(v12, v10);
          swift_release();
          goto LABEL_17;
        }
        char v32 = sub_2211D7FC0();
        swift_bridgeObjectRelease();
        if (v32) {
          goto LABEL_23;
        }
LABEL_17:
        swift_release();
        return;
      }
    }
    else
    {
      sub_2211D7964((uint64_t)&aBlock, &qword_267F46A48);
    }
    if (qword_267F46B20 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_2211D7CB0();
    __swift_project_value_buffer(v19, (uint64_t)qword_267F46B28);
    BOOL v20 = sub_2211D7C90();
    os_log_type_t v21 = sub_2211D7E10();
    if (os_log_type_enabled(v20, v21))
    {
      char v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v22 = 0;
      _os_log_impl(&dword_2211C6000, v20, v21, "Unable to convert event name to string, dropping event", v22, 2u);
      MEMORY[0x223C7B120](v22, -1, -1);
      swift_release();

      return;
    }

    goto LABEL_17;
  }
}

uint64_t sub_2211D6868(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_2211D7CC0();
  uint64_t v20 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_2211D7CE0();
  uint64_t v11 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  id v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v15 = result;
    uint64_t v18 = *(void *)(result + 80);
    char v16 = (void *)swift_allocObject();
    v16[2] = v15;
    v16[3] = a1;
    v16[4] = a2;
    v16[5] = a3;
    v16[6] = a4;
    aBlock[4] = sub_2211D70CC;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2211C9694;
    aBlock[3] = &block_descriptor_100;
    uint64_t v17 = _Block_copy(aBlock);
    swift_retain();
    sub_2211D26E4(a1, a2);
    swift_bridgeObjectRetain();
    sub_2211D7CD0();
    uint64_t v21 = MEMORY[0x263F8EE78];
    sub_2211D79FC(&qword_267F46A30, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A38);
    sub_2211D7A44(&qword_267F46A40, &qword_267F46A38);
    sub_2211D7EE0();
    MEMORY[0x223C7AA60](0, v13, v10, v17);
    _Block_release(v17);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v8);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v19);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2211D6B60(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_267F46B20 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2211D7CB0();
  __swift_project_value_buffer(v6, (uint64_t)qword_267F46B28);
  uint64_t v7 = sub_2211D7C90();
  os_log_type_t v8 = sub_2211D7E20();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_2211C6000, v7, v8, "Received continuation request", v9, 2u);
    MEMORY[0x223C7B120](v9, -1, -1);
  }

  uint64_t v10 = v3
      + OBJC_IVAR____TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler_delegate;
  swift_beginAccess();
  sub_2211D6D3C(v10, (uint64_t)v13, &qword_267F469F8);
  if (!v14) {
    return sub_2211D7964((uint64_t)v13, &qword_267F469F8);
  }
  sub_2211D7A94((uint64_t)v13, (uint64_t)v12);
  sub_2211D7964((uint64_t)v13, &qword_267F469F8);
  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  sub_2211CF8C4(a1, a2);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
}

uint64_t sub_2211D6CE4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2211D2E00(a1, a2);
  }
  return a1;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2211D6D3C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
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

void sub_2211D6E04(uint64_t a1)
{
  sub_2211CA6C0(a1, *(void ***)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2211D6E0C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A20);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_2211D6EB4(void *a1, void *a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F46A20) - 8);
  if (a2)
  {
    v14.receiver = a2;
    id v6 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A20);
    return sub_2211D7D70();
  }
  else if (a1)
  {
    uint64_t v8 = *(void *)(v2
                   + ((*(void *)(v5 + 64)
                     + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
                     + 7) & 0xFFFFFFFFFFFFFFF8));
    uint64_t v9 = (objc_class *)type metadata accessor for RKESessionDelegate();
    id v10 = objc_allocWithZone(v9);
    swift_weakInit();
    swift_weakAssign();
    v14.receiver = v10;
    v14.super_class = v9;
    id v11 = a1;
    id v12 = objc_msgSendSuper2(&v14, sel_init);
    id v13 = *(void **)(v8 + 88);
    *(void *)(v8 + 88) = v12;

    objc_msgSend(v11, sel_setDelegate_, *(void *)(v8 + 88));
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F46A20);
    return sub_2211D7D80();
  }
  else
  {
    uint64_t result = sub_2211D7F60();
    __break(1u);
  }
  return result;
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

_OWORD *sub_2211D706C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2211D707C()
{
  return swift_release();
}

uint64_t sub_2211D7084()
{
  swift_release();
  sub_2211D2E00(*(void *)(v0 + 24), *(void *)(v0 + 32));
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2211D70CC()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  if (qword_267F46B20 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2211D7CB0();
  __swift_project_value_buffer(v6, (uint64_t)qword_267F46B28);
  uint64_t v7 = sub_2211D7C90();
  os_log_type_t v8 = sub_2211D7E10();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_2211C6000, v7, v8, "Calling delegate didReceivePassthroughData", v9, 2u);
    MEMORY[0x223C7B120](v9, -1, -1);
  }

  uint64_t v10 = v1[8];
  uint64_t v11 = v1[9];
  __swift_project_boxed_opaque_existential_1(v1 + 5, v10);
  return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 32))(v1, v2, v3, v4, v5, v10, v11);
}

uint64_t sub_2211D7204(uint64_t a1)
{
  return a1;
}

uint64_t sub_2211D7258(uint64_t a1)
{
  return a1;
}

uint64_t sub_2211D72AC()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2211D7304()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 16);
  if (qword_267F46B20 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_2211D7CB0();
  __swift_project_value_buffer(v3, (uint64_t)qword_267F46B28);
  uint64_t v4 = sub_2211D7C90();
  os_log_type_t v5 = sub_2211D7E10();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_2211C6000, v4, v5, "Calling delegate vehicleDidUpdateReport", v6, 2u);
    MEMORY[0x223C7B120](v6, -1, -1);
  }

  uint64_t v7 = v2[8];
  uint64_t v8 = v2[9];
  __swift_project_boxed_opaque_existential_1(v2 + 5, v7);
  long long v9 = *(_OWORD *)(v1 + 40);
  v11[0] = *(_OWORD *)(v1 + 24);
  v11[1] = v9;
  v11[2] = *(_OWORD *)(v1 + 56);
  return (*(uint64_t (**)(void *, _OWORD *, uint64_t, uint64_t))(v8 + 24))(v2, v11, v7, v8);
}

uint64_t sub_2211D7440(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2211D74F0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2211D754C()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2211D7594()
{
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  if (qword_267F46B20 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2211D7CB0();
  __swift_project_value_buffer(v6, (uint64_t)qword_267F46B28);
  uint64_t v7 = sub_2211D7C90();
  os_log_type_t v8 = sub_2211D7E10();
  if (os_log_type_enabled(v7, v8))
  {
    long long v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v9 = 0;
    _os_log_impl(&dword_2211C6000, v7, v8, "Calling delegate didCreateKey", v9, 2u);
    MEMORY[0x223C7B120](v9, -1, -1);
  }

  uint64_t v10 = v1[8];
  uint64_t v11 = v1[9];
  __swift_project_boxed_opaque_existential_1(v1 + 5, v10);
  return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 16))(v1, v2, v3, v4, v5, v10, v11);
}

uint64_t sub_2211D76CC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 25, 7);
}

uint64_t sub_2211D7704()
{
  uint64_t v1 = *(void **)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 24);
  if (qword_267F46B20 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_2211D7CB0();
  __swift_project_value_buffer(v3, (uint64_t)qword_267F46B28);
  uint64_t v4 = sub_2211D7C90();
  os_log_type_t v5 = sub_2211D7E10();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_2211C6000, v4, v5, "Calling delegate didInvalidateWithError", v6, 2u);
    MEMORY[0x223C7B120](v6, -1, -1);
  }

  uint64_t v7 = v1[8];
  uint64_t v8 = v1[9];
  __swift_project_boxed_opaque_existential_1(v1 + 5, v7);
  char v10 = v2;
  return (*(uint64_t (**)(void *, char *, uint64_t, uint64_t))(v8 + 8))(v1, &v10, v7, v8);
}

uint64_t sub_2211D7830(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  sub_2211D7964(v3, &qword_267F46840);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F46850);
  uint64_t v7 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v3, a1, v4);
  os_log_type_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56);

  return v5(v3, 0, 1, v4);
}

uint64_t sub_2211D7900(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_2211D7964(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2211D79C0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2211D79FC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2211D7A44(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2211D7A94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2211D7AF8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2211D7BA0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2211D7BB0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2211D7BC0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2211D7BD0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2211D7BE0()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_2211D7BF0()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_2211D7C00()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_2211D7C10()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_2211D7C20()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_2211D7C30()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_2211D7C40()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_2211D7C50()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_2211D7C60()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_2211D7C70()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_2211D7C80()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_2211D7C90()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2211D7CA0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2211D7CB0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2211D7CC0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2211D7CD0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2211D7CE0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2211D7CF0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2211D7D00()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2211D7D10()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2211D7D20()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2211D7D30()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2211D7D40()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2211D7D50()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2211D7D60()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2211D7D70()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2211D7D80()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2211D7D90()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2211D7DA0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2211D7DB0()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_2211D7DC0()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_2211D7DD0()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_2211D7DF0()
{
  return MEMORY[0x270EF1CD8]();
}

uint64_t sub_2211D7E00()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_2211D7E10()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2211D7E20()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2211D7E30()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2211D7E40()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2211D7E50()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_2211D7E60()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2211D7E70()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_2211D7E80()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_2211D7E90()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_2211D7EA0()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_2211D7EB0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2211D7EC0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2211D7ED0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2211D7EE0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2211D7EF0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2211D7F00()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2211D7F10()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2211D7F20()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2211D7F30()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2211D7F40()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2211D7F50()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2211D7F60()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2211D7F70()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2211D7F80()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2211D7F90()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2211D7FA0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2211D7FB0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2211D7FC0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2211D7FE0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2211D7FF0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2211D8000()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2211D8010()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2211D8020()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2211D8030()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2211D8040()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2211D8050()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2211D8060()
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}