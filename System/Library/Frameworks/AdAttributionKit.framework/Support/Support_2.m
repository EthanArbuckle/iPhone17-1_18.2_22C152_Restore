uint64_t sub_10014361C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  long long v12;
  long long v13;
  uint64_t v14;

  *(void *)(v8 + 128) = v14;
  *(_OWORD *)(v8 + 96) = v12;
  *(_OWORD *)(v8 + 112) = v13;
  *(void *)(v8 + 80) = a7;
  *(void *)(v8 + 88) = a8;
  *(unsigned char *)(v8 + 200) = a6;
  *(void *)(v8 + 64) = a4;
  *(void *)(v8 + 72) = a5;
  v9 = type metadata accessor for Logger();
  *(void *)(v8 + 136) = v9;
  *(void *)(v8 + 144) = *(void *)(v9 - 8);
  *(void *)(v8 + 152) = swift_task_alloc();
  sub_100012960(&qword_1001E0EE0);
  *(void *)(v8 + 160) = swift_task_alloc();
  return _swift_task_switch(sub_100143728, 0, 0);
}

void sub_100143728()
{
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 72);
  char v7 = *(unsigned char *)(v0 + 200);
  type metadata accessor for Transaction();
  long long v10 = *(_OWORD *)(v0 + 96);
  long long v11 = *(_OWORD *)(v0 + 80);
  long long v12 = *(_OWORD *)(v0 + 112);
  *(void *)(v0 + 168) = swift_initStackObject();
  *(void *)(v0 + 176) = sub_100146C54();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  uint64_t v8 = swift_task_alloc();
  *(void *)(v0 + 184) = v8;
  *(_OWORD *)(v8 + 16) = v11;
  *(_OWORD *)(v8 + 32) = v10;
  *(void *)(v8 + 48) = v6;
  *(void *)(v8 + 56) = v5;
  *(unsigned char *)(v8 + 64) = v7;
  *(_OWORD *)(v8 + 72) = v12;
  *(void *)(v8 + 88) = v4;
  v13 = (char *)&dword_1001E4AF0 + dword_1001E4AF0;
  v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 192) = v9;
  void *v9 = v0;
  v9[1] = sub_100142F78;
  __asm { BR              X0; sub_100140B34 }
}

uint64_t sub_1001438D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 128) = v14;
  *(_OWORD *)(v8 + 96) = v12;
  *(_OWORD *)(v8 + 112) = v13;
  *(void *)(v8 + 80) = a7;
  *(void *)(v8 + 88) = a8;
  *(unsigned char *)(v8 + 200) = a6;
  *(void *)(v8 + 64) = a4;
  *(void *)(v8 + 72) = a5;
  uint64_t v9 = type metadata accessor for Logger();
  *(void *)(v8 + 136) = v9;
  *(void *)(v8 + 144) = *(void *)(v9 - 8);
  *(void *)(v8 + 152) = swift_task_alloc();
  sub_100012960(&qword_1001E0EE0);
  *(void *)(v8 + 160) = swift_task_alloc();
  return _swift_task_switch(sub_1001439DC, 0, 0);
}

void sub_1001439DC()
{
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 72);
  char v7 = *(unsigned char *)(v0 + 200);
  type metadata accessor for Transaction();
  long long v10 = *(_OWORD *)(v0 + 96);
  long long v11 = *(_OWORD *)(v0 + 80);
  long long v12 = *(_OWORD *)(v0 + 112);
  *(void *)(v0 + 168) = swift_initStackObject();
  *(void *)(v0 + 176) = sub_100146C54();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  uint64_t v8 = swift_task_alloc();
  *(void *)(v0 + 184) = v8;
  *(_OWORD *)(v8 + 16) = v11;
  *(_OWORD *)(v8 + 32) = v10;
  *(void *)(v8 + 48) = v6;
  *(void *)(v8 + 56) = v5;
  *(unsigned char *)(v8 + 64) = v7;
  *(_OWORD *)(v8 + 72) = v12;
  *(void *)(v8 + 88) = v4;
  long long v13 = (char *)&dword_1001E4AF0 + dword_1001E4AF0;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 192) = v9;
  void *v9 = v0;
  v9[1] = sub_100143B84;
  __asm { BR              X0; sub_100140B34 }
}

uint64_t sub_100143B84()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 160);
  swift_task_dealloc();
  swift_task_dealloc();
  sub_100019960(v1, &qword_1001E0EE0);
  return _swift_task_switch(sub_100143CC0, 0, 0);
}

uint64_t sub_100143CC0()
{
  v20 = v0;
  uint64_t v2 = v0[18];
  uint64_t v1 = v0[19];
  uint64_t v3 = v0[17];
  uint64_t v4 = Logger.xpc.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_retain();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = v0[22];
    uint64_t v16 = v0[18];
    uint64_t v17 = v0[17];
    uint64_t v18 = v0[19];
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v9 = *(void *)(v7 + 24);
    unint64_t v10 = *(void *)(v7 + 32);
    swift_bridgeObjectRetain();
    v0[7] = sub_100147668(v9, v10, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Transaction %s out of scope", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v18, v17);
  }
  else
  {
    uint64_t v12 = v0[18];
    uint64_t v11 = v0[19];
    uint64_t v13 = v0[17];
    swift_release_n();

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_100143EF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 128) = v14;
  *(_OWORD *)(v8 + 96) = v12;
  *(_OWORD *)(v8 + 112) = v13;
  *(void *)(v8 + 80) = a7;
  *(void *)(v8 + 88) = a8;
  *(unsigned char *)(v8 + 200) = a6;
  *(void *)(v8 + 64) = a4;
  *(void *)(v8 + 72) = a5;
  uint64_t v9 = type metadata accessor for Logger();
  *(void *)(v8 + 136) = v9;
  *(void *)(v8 + 144) = *(void *)(v9 - 8);
  *(void *)(v8 + 152) = swift_task_alloc();
  sub_100012960(&qword_1001E0EE0);
  *(void *)(v8 + 160) = swift_task_alloc();
  return _swift_task_switch(sub_100143FFC, 0, 0);
}

void sub_100143FFC()
{
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 72);
  char v7 = *(unsigned char *)(v0 + 200);
  type metadata accessor for Transaction();
  long long v10 = *(_OWORD *)(v0 + 96);
  long long v11 = *(_OWORD *)(v0 + 80);
  long long v12 = *(_OWORD *)(v0 + 112);
  *(void *)(v0 + 168) = swift_initStackObject();
  *(void *)(v0 + 176) = sub_100146C54();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  uint64_t v8 = swift_task_alloc();
  *(void *)(v0 + 184) = v8;
  *(_OWORD *)(v8 + 16) = v11;
  *(_OWORD *)(v8 + 32) = v10;
  *(void *)(v8 + 48) = v6;
  *(void *)(v8 + 56) = v5;
  *(unsigned char *)(v8 + 64) = v7;
  *(_OWORD *)(v8 + 72) = v12;
  *(void *)(v8 + 88) = v4;
  long long v13 = (char *)&dword_1001E4AF0 + dword_1001E4AF0;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 192) = v9;
  void *v9 = v0;
  v9[1] = sub_100142F78;
  __asm { BR              X0; sub_100140B34 }
}

uint64_t sub_1001441A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 128) = v14;
  *(_OWORD *)(v8 + 96) = v12;
  *(_OWORD *)(v8 + 112) = v13;
  *(void *)(v8 + 80) = a7;
  *(void *)(v8 + 88) = a8;
  *(unsigned char *)(v8 + 200) = a6;
  *(void *)(v8 + 64) = a4;
  *(void *)(v8 + 72) = a5;
  uint64_t v9 = type metadata accessor for Logger();
  *(void *)(v8 + 136) = v9;
  *(void *)(v8 + 144) = *(void *)(v9 - 8);
  *(void *)(v8 + 152) = swift_task_alloc();
  sub_100012960(&qword_1001E0EE0);
  *(void *)(v8 + 160) = swift_task_alloc();
  return _swift_task_switch(sub_1001442B0, 0, 0);
}

void sub_1001442B0()
{
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 72);
  char v7 = *(unsigned char *)(v0 + 200);
  type metadata accessor for Transaction();
  long long v10 = *(_OWORD *)(v0 + 96);
  long long v11 = *(_OWORD *)(v0 + 80);
  long long v12 = *(_OWORD *)(v0 + 112);
  *(void *)(v0 + 168) = swift_initStackObject();
  *(void *)(v0 + 176) = sub_100146C54();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  uint64_t v8 = swift_task_alloc();
  *(void *)(v0 + 184) = v8;
  *(_OWORD *)(v8 + 16) = v11;
  *(_OWORD *)(v8 + 32) = v10;
  *(void *)(v8 + 48) = v6;
  *(void *)(v8 + 56) = v5;
  *(unsigned char *)(v8 + 64) = v7;
  *(_OWORD *)(v8 + 72) = v12;
  *(void *)(v8 + 88) = v4;
  long long v13 = (char *)&dword_1001E4AF0 + dword_1001E4AF0;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 192) = v9;
  void *v9 = v0;
  v9[1] = sub_100142F78;
  __asm { BR              X0; sub_100140B34 }
}

uint64_t sub_100144458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 128) = v14;
  *(_OWORD *)(v8 + 96) = v12;
  *(_OWORD *)(v8 + 112) = v13;
  *(void *)(v8 + 80) = a7;
  *(void *)(v8 + 88) = a8;
  *(unsigned char *)(v8 + 200) = a6;
  *(void *)(v8 + 64) = a4;
  *(void *)(v8 + 72) = a5;
  uint64_t v9 = type metadata accessor for Logger();
  *(void *)(v8 + 136) = v9;
  *(void *)(v8 + 144) = *(void *)(v9 - 8);
  *(void *)(v8 + 152) = swift_task_alloc();
  sub_100012960(&qword_1001E0EE0);
  *(void *)(v8 + 160) = swift_task_alloc();
  return _swift_task_switch(sub_100144564, 0, 0);
}

void sub_100144564()
{
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 72);
  char v7 = *(unsigned char *)(v0 + 200);
  type metadata accessor for Transaction();
  long long v10 = *(_OWORD *)(v0 + 96);
  long long v11 = *(_OWORD *)(v0 + 80);
  long long v12 = *(_OWORD *)(v0 + 112);
  *(void *)(v0 + 168) = swift_initStackObject();
  *(void *)(v0 + 176) = sub_100146C54();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  uint64_t v8 = swift_task_alloc();
  *(void *)(v0 + 184) = v8;
  *(_OWORD *)(v8 + 16) = v11;
  *(_OWORD *)(v8 + 32) = v10;
  *(void *)(v8 + 48) = v6;
  *(void *)(v8 + 56) = v5;
  *(unsigned char *)(v8 + 64) = v7;
  *(_OWORD *)(v8 + 72) = v12;
  *(void *)(v8 + 88) = v4;
  long long v13 = (char *)&dword_1001E4AF0 + dword_1001E4AF0;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 192) = v9;
  void *v9 = v0;
  v9[1] = sub_100142F78;
  __asm { BR              X0; sub_100140B34 }
}

uint64_t sub_10014470C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)(v8 + 80) = v12;
  *(void *)(v8 + 88) = v13;
  *(unsigned char *)(v8 + 186) = a8;
  *(void *)(v8 + 64) = a6;
  *(void *)(v8 + 72) = a7;
  *(void *)(v8 + 48) = a4;
  *(void *)(v8 + 56) = a5;
  *(void *)(v8 + 32) = a2;
  *(void *)(v8 + 40) = a3;
  uint64_t v9 = type metadata accessor for Logger();
  *(void *)(v8 + 96) = v9;
  *(void *)(v8 + 104) = *(void *)(v9 - 8);
  *(void *)(v8 + 112) = swift_task_alloc();
  *(void *)(v8 + 120) = swift_task_alloc();
  return _swift_task_switch(sub_1001447F4, 0, 0);
}

uint64_t sub_1001447F4()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  uint64_t v4 = Logger.xpc.unsafeMutableAddressor();
  v0[16] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[17] = v5;
  v0[18] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Is anything happening?", v8, 2u);
    swift_slowDealloc();
  }
  uint64_t v9 = v0[15];
  uint64_t v10 = v0[12];
  uint64_t v11 = v0[13];
  uint64_t v12 = (int *)v0[4];

  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[19] = v13;
  v0[20] = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v13(v9, v10);
  uint64_t v18 = (int *)((char *)v12 + *v12);
  uint64_t v14 = (void *)swift_task_alloc();
  v0[21] = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_1001449B8;
  uint64_t v15 = v0[6];
  uint64_t v16 = v0[7];
  return ((uint64_t (*)(void *, uint64_t, uint64_t))v18)(v0 + 23, v15, v16);
}

uint64_t sub_1001449B8()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100149ED4;
  }
  else {
    uint64_t v2 = sub_100149EC8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100144ACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)(v8 + 80) = v12;
  *(void *)(v8 + 88) = v13;
  *(unsigned char *)(v8 + 208) = a8;
  *(void *)(v8 + 64) = a6;
  *(void *)(v8 + 72) = a7;
  *(void *)(v8 + 48) = a4;
  *(void *)(v8 + 56) = a5;
  *(void *)(v8 + 32) = a2;
  *(void *)(v8 + 40) = a3;
  uint64_t v9 = type metadata accessor for Logger();
  *(void *)(v8 + 96) = v9;
  *(void *)(v8 + 104) = *(void *)(v9 - 8);
  *(void *)(v8 + 112) = swift_task_alloc();
  *(void *)(v8 + 120) = swift_task_alloc();
  *(void *)(v8 + 128) = sub_100012960(&qword_1001E3288);
  *(void *)(v8 + 136) = swift_task_alloc();
  *(void *)(v8 + 144) = swift_task_alloc();
  return _swift_task_switch(sub_100144BF8, 0, 0);
}

uint64_t sub_100144BF8()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  uint64_t v4 = Logger.xpc.unsafeMutableAddressor();
  v0[19] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[20] = v5;
  v0[21] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Is anything happening?", v8, 2u);
    swift_slowDealloc();
  }
  uint64_t v9 = v0[15];
  uint64_t v10 = v0[12];
  uint64_t v11 = v0[13];
  uint64_t v12 = (int *)v0[4];

  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[22] = v13;
  v0[23] = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v13(v9, v10);
  uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v12 + *v12);
  uint64_t v14 = (void *)swift_task_alloc();
  v0[24] = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_100144DB4;
  uint64_t v15 = v0[17];
  uint64_t v16 = v0[6];
  uint64_t v17 = v0[7];
  return v19(v15, v16, v17);
}

uint64_t sub_100144DB4()
{
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100144FBC;
  }
  else {
    uint64_t v2 = sub_100144EC8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100144EC8()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  swift_storeEnumTagMultiPayload();
  sub_100149B0C(v1, v2);
  uint64_t v3 = v0[18];
  uint64_t v4 = (void (*)(void))v0[10];
  uint64_t v5 = sub_1001482A4();
  unint64_t v7 = v6;
  v4();
  sub_100020930(v5, v7);
  sub_100019960(v3, &qword_1001E3288);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100144FBC()
{
  uint64_t v24 = v0;
  (*(void (**)(void, void, void))(v0 + 160))(*(void *)(v0 + 112), *(void *)(v0 + 152), *(void *)(v0 + 96));
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v22 = *(void (**)(uint64_t, uint64_t))(v0 + 176);
    uint64_t v20 = *(void *)(v0 + 96);
    uint64_t v21 = *(void *)(v0 + 112);
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    uint64_t v5 = StaticString.description.getter();
    *(void *)(v0 + 16) = sub_100147668(v5, v6, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2114;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 24) = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v4 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error in %s: %{public}@", (uint8_t *)v3, 0x16u);
    sub_100012960(&qword_1001E0B30);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v22(v21, v20);
  }
  else
  {
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v0 + 176);
    uint64_t v9 = *(void *)(v0 + 112);
    uint64_t v10 = *(void *)(v0 + 96);
    swift_errorRelease();
    swift_errorRelease();

    v8(v9, v10);
  }
  uint64_t v11 = *(unsigned char **)(v0 + 144);
  char v12 = sub_1000C1ADC();
  swift_errorRelease();
  *uint64_t v11 = v12;
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = *(void *)(v0 + 144);
  uint64_t v14 = *(void (**)(void))(v0 + 80);
  uint64_t v15 = sub_1001482A4();
  unint64_t v17 = v16;
  v14();
  sub_100020930(v15, v17);
  sub_100019960(v13, &qword_1001E3288);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_1001452E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)(v8 + 104) = v12;
  *(void *)(v8 + 112) = v13;
  *(unsigned char *)(v8 + 33) = a8;
  *(void *)(v8 + 88) = a6;
  *(void *)(v8 + 96) = a7;
  *(void *)(v8 + 72) = a4;
  *(void *)(v8 + 80) = a5;
  *(void *)(v8 + 56) = a2;
  *(void *)(v8 + 64) = a3;
  uint64_t v9 = type metadata accessor for Logger();
  *(void *)(v8 + 120) = v9;
  *(void *)(v8 + 128) = *(void *)(v9 - 8);
  *(void *)(v8 + 136) = swift_task_alloc();
  *(void *)(v8 + 144) = swift_task_alloc();
  return _swift_task_switch(sub_1001453C8, 0, 0);
}

uint64_t sub_1001453C8()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v4 = Logger.xpc.unsafeMutableAddressor();
  v0[19] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[20] = v5;
  v0[21] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  unint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Is anything happening?", v8, 2u);
    swift_slowDealloc();
  }
  uint64_t v9 = v0[18];
  uint64_t v10 = v0[15];
  uint64_t v11 = v0[16];
  uint64_t v12 = (int *)v0[7];

  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[22] = v13;
  v0[23] = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v13(v9, v10);
  uint64_t v18 = (int *)((char *)v12 + *v12);
  uint64_t v14 = (void *)swift_task_alloc();
  v0[24] = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_10014558C;
  uint64_t v15 = v0[9];
  uint64_t v16 = v0[10];
  return ((uint64_t (*)(void *, uint64_t, uint64_t))v18)(v0 + 2, v15, v16);
}

uint64_t sub_10014558C()
{
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100145780;
  }
  else {
    uint64_t v2 = sub_1001456A0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1001456A0()
{
  uint64_t v1 = v0[2];
  unint64_t v2 = v0[3];
  uint64_t v3 = (void (*)(void))v0[13];
  char v4 = v0[25] != 0;
  uint64_t v5 = sub_100148560();
  unint64_t v7 = v6;
  v3();
  sub_100020930(v5, v7);
  sub_100149A00(v1, v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100145780()
{
  uint64_t v23 = v0;
  (*(void (**)(void, void, void))(v0 + 160))(*(void *)(v0 + 136), *(void *)(v0 + 152), *(void *)(v0 + 120));
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v0 + 176);
    uint64_t v19 = *(void *)(v0 + 120);
    uint64_t v20 = *(void *)(v0 + 136);
    uint64_t v3 = swift_slowAlloc();
    char v4 = (void *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    uint64_t v5 = StaticString.description.getter();
    *(void *)(v0 + 40) = sub_100147668(v5, v6, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2114;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 48) = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *char v4 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error in %s: %{public}@", (uint8_t *)v3, 0x16u);
    sub_100012960(&qword_1001E0B30);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v21(v20, v19);
  }
  else
  {
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v0 + 176);
    uint64_t v9 = *(void *)(v0 + 136);
    uint64_t v10 = *(void *)(v0 + 120);
    swift_errorRelease();
    swift_errorRelease();

    v8(v9, v10);
  }
  unsigned __int8 v11 = sub_1000C1ADC();
  swift_errorRelease();
  uint64_t v12 = *(void (**)(void))(v0 + 104);
  char v13 = *(void *)(v0 + 200) != 0;
  uint64_t v14 = sub_100148560();
  unint64_t v16 = v15;
  v12();
  sub_100020930(v14, v16);
  sub_100149A00(v11, 0, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

uint64_t sub_100145A8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)(v8 + 80) = v12;
  *(void *)(v8 + 88) = v13;
  *(unsigned char *)(v8 + 186) = a8;
  *(void *)(v8 + 64) = a6;
  *(void *)(v8 + 72) = a7;
  *(void *)(v8 + 48) = a4;
  *(void *)(v8 + 56) = a5;
  *(void *)(v8 + 32) = a2;
  *(void *)(v8 + 40) = a3;
  uint64_t v9 = type metadata accessor for Logger();
  *(void *)(v8 + 96) = v9;
  *(void *)(v8 + 104) = *(void *)(v9 - 8);
  *(void *)(v8 + 112) = swift_task_alloc();
  *(void *)(v8 + 120) = swift_task_alloc();
  return _swift_task_switch(sub_100145B74, 0, 0);
}

uint64_t sub_100145B74()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  uint64_t v4 = Logger.xpc.unsafeMutableAddressor();
  v0[16] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[17] = v5;
  v0[18] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  unint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Is anything happening?", v8, 2u);
    swift_slowDealloc();
  }
  uint64_t v9 = v0[15];
  uint64_t v10 = v0[12];
  uint64_t v11 = v0[13];
  uint64_t v12 = (int *)v0[4];

  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[19] = v13;
  v0[20] = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v13(v9, v10);
  uint64_t v18 = (int *)((char *)v12 + *v12);
  uint64_t v14 = (void *)swift_task_alloc();
  v0[21] = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_100145D38;
  uint64_t v15 = v0[6];
  uint64_t v16 = v0[7];
  return ((uint64_t (*)(void *, uint64_t, uint64_t))v18)(v0 + 23, v15, v16);
}

uint64_t sub_100145D38()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100145F1C;
  }
  else {
    uint64_t v2 = sub_100145E4C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100145E4C()
{
  uint64_t v1 = *(void (**)(void))(v0 + 80);
  uint64_t v2 = sub_100148830(*(unsigned __int8 *)(v0 + 184) | ((*(void *)(v0 + 176) != 0) << 8), &qword_1001E4B10, &qword_1001E4B18);
  unint64_t v4 = v3;
  v1();
  sub_100020930(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_100145F1C()
{
  uint64_t v22 = v0;
  (*(void (**)(void, void, void))(v0 + 136))(*(void *)(v0 + 112), *(void *)(v0 + 128), *(void *)(v0 + 96));
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
    uint64_t v18 = *(void *)(v0 + 96);
    uint64_t v19 = *(void *)(v0 + 112);
    uint64_t v3 = swift_slowAlloc();
    unint64_t v4 = (void *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    uint64_t v5 = StaticString.description.getter();
    *(void *)(v0 + 16) = sub_100147668(v5, v6, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2114;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 24) = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *unint64_t v4 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error in %s: %{public}@", (uint8_t *)v3, 0x16u);
    sub_100012960(&qword_1001E0B30);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v20(v19, v18);
  }
  else
  {
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
    uint64_t v9 = *(void *)(v0 + 112);
    uint64_t v10 = *(void *)(v0 + 96);
    swift_errorRelease();
    swift_errorRelease();

    v8(v9, v10);
  }
  unsigned __int8 v11 = sub_1000C1ADC();
  swift_errorRelease();
  uint64_t v12 = *(void (**)(void))(v0 + 80);
  uint64_t v13 = sub_100148830(v11 | ((*(void *)(v0 + 176) != 0) << 8), &qword_1001E4B10, &qword_1001E4B18);
  unint64_t v15 = v14;
  v12();
  sub_100020930(v13, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_100146220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)(v8 + 80) = v12;
  *(void *)(v8 + 88) = v13;
  *(unsigned char *)(v8 + 186) = a8;
  *(void *)(v8 + 64) = a6;
  *(void *)(v8 + 72) = a7;
  *(void *)(v8 + 48) = a4;
  *(void *)(v8 + 56) = a5;
  *(void *)(v8 + 32) = a2;
  *(void *)(v8 + 40) = a3;
  uint64_t v9 = type metadata accessor for Logger();
  *(void *)(v8 + 96) = v9;
  *(void *)(v8 + 104) = *(void *)(v9 - 8);
  *(void *)(v8 + 112) = swift_task_alloc();
  *(void *)(v8 + 120) = swift_task_alloc();
  return _swift_task_switch(sub_100146308, 0, 0);
}

uint64_t sub_100146308()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  uint64_t v4 = Logger.xpc.unsafeMutableAddressor();
  v0[16] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[17] = v5;
  v0[18] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  unint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Is anything happening?", v8, 2u);
    swift_slowDealloc();
  }
  uint64_t v9 = v0[15];
  uint64_t v10 = v0[12];
  uint64_t v11 = v0[13];
  uint64_t v12 = (int *)v0[4];

  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[19] = v13;
  v0[20] = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v13(v9, v10);
  uint64_t v18 = (int *)((char *)v12 + *v12);
  unint64_t v14 = (void *)swift_task_alloc();
  v0[21] = v14;
  *unint64_t v14 = v0;
  v14[1] = sub_1001464CC;
  uint64_t v15 = v0[6];
  uint64_t v16 = v0[7];
  return ((uint64_t (*)(void *, uint64_t, uint64_t))v18)(v0 + 23, v15, v16);
}

uint64_t sub_1001464CC()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1001466B0;
  }
  else {
    uint64_t v2 = sub_1001465E0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1001465E0()
{
  uint64_t v1 = *(void (**)(void))(v0 + 80);
  uint64_t v2 = sub_100148830(*(unsigned __int8 *)(v0 + 184) | ((*(void *)(v0 + 176) != 0) << 8), &qword_1001E4B48, &qword_1001E4B50);
  unint64_t v4 = v3;
  v1();
  sub_100020930(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1001466B0()
{
  uint64_t v22 = v0;
  (*(void (**)(void, void, void))(v0 + 136))(*(void *)(v0 + 112), *(void *)(v0 + 128), *(void *)(v0 + 96));
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
    uint64_t v18 = *(void *)(v0 + 96);
    uint64_t v19 = *(void *)(v0 + 112);
    uint64_t v3 = swift_slowAlloc();
    unint64_t v4 = (void *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    uint64_t v5 = StaticString.description.getter();
    *(void *)(v0 + 16) = sub_100147668(v5, v6, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2114;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 24) = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *unint64_t v4 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error in %s: %{public}@", (uint8_t *)v3, 0x16u);
    sub_100012960(&qword_1001E0B30);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v20(v19, v18);
  }
  else
  {
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
    uint64_t v9 = *(void *)(v0 + 112);
    uint64_t v10 = *(void *)(v0 + 96);
    swift_errorRelease();
    swift_errorRelease();

    v8(v9, v10);
  }
  unsigned __int8 v11 = sub_1000C1ADC();
  swift_errorRelease();
  uint64_t v12 = *(void (**)(void))(v0 + 80);
  uint64_t v13 = sub_100148830(v11 | ((*(void *)(v0 + 176) != 0) << 8), &qword_1001E4B48, &qword_1001E4B50);
  unint64_t v15 = v14;
  v12();
  sub_100020930(v13, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_1001469B4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  String.utf8CString.getter();
  uint64_t v10 = os_transaction_create();
  uint64_t result = swift_release();
  if (v10)
  {
    v3[2] = v10;
    v3[3] = a1;
    v3[4] = a2;
    swift_bridgeObjectRetain();
    __int16 timestamp = os_transaction_get_timestamp();
    uint64_t v13 = Logger.general.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v13, v6);
    swift_bridgeObjectRetain_n();
    unint64_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v19 = v6;
      uint64_t v21 = v17;
      *(_DWORD *)uint64_t v16 = 33554946;
      LOWORD(v20) = timestamp;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v16 + 6) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_100147668(a1, a2, &v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "[TXN%hx] 🐏 Beginning transaction (%s)", (uint8_t *)v16, 0x10u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_bridgeObjectRelease();

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v19);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    return (uint64_t)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100146C54()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  StaticString.description.getter();
  String.utf8CString.getter();
  swift_bridgeObjectRelease();
  uint64_t v6 = os_transaction_create();
  uint64_t result = swift_release();
  if (v6)
  {
    v1[2] = v6;
    v1[3] = StaticString.description.getter();
    v1[4] = v8;
    __int16 timestamp = os_transaction_get_timestamp();
    uint64_t v10 = Logger.general.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v10, v2);
    unsigned __int8 v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v19 = v1;
      uint64_t v14 = v13;
      uint64_t v15 = swift_slowAlloc();
      uint64_t v18 = v2;
      uint64_t v21 = v15;
      *(_DWORD *)uint64_t v14 = 33554946;
      LOWORD(v20) = timestamp;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v14 + 6) = 2080;
      uint64_t v16 = StaticString.description.getter();
      uint64_t v20 = sub_100147668(v16, v17, &v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[TXN%hx] 🐏 Beginning transaction (%s)", (uint8_t *)v14, 0x10u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v1 = v19;
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v18);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    return (uint64_t)v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100146EFC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(sub_100146F1C, 0, 0);
}

uint64_t sub_100146F1C()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  *uint64_t v1 = sub_10002B478() & 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100147124(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 24) = a3;
  *(void *)(v3 + 16) = a1;
  return _swift_task_switch(sub_100147148, 0, 0);
}

uint64_t sub_100147148()
{
  sub_10002B630(*(unsigned char *)(v0 + 24));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1001473F8()
{
  return sub_100019E64(v0 + OBJC_IVAR____TtC20AttributionKitDaemon29DeveloperModeServiceXPCBridge_service);
}

uint64_t type metadata accessor for DeveloperModeServiceXPCBridge()
{
  return self;
}

uint64_t sub_10014743C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100147478()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100147488(uint64_t a1)
{
  char v4 = *(unsigned char *)(v1 + 16);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(unsigned char *)(v5 + 24) = v4;
  *(void *)(v5 + 8) = sub_100013480;
  *(void *)(v5 + 16) = a1;
  return _swift_task_switch(sub_100147148, 0, 0);
}

uint64_t sub_100147538(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_100147570(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100147598@<X0>(uint64_t (*a1)(void)@<X0>, _WORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_1001475C8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1001475F0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_100147668(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_100147668(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10014773C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10003742C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10003742C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v12);
  return v7;
}

uint64_t sub_10014773C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1001478F8(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_1001478F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100147990(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100147BEC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100147BEC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100147990(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100147B08(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100147B08(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100012960(&qword_1001E4AF8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100147B70(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
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
    uint64_t v5 = String.UTF8View._foreignIndex(_:offsetBy:)();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_100147BEC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100012960(&qword_1001E4AF8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_100147D3C(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_100147DF4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100147E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v8 = *(int **)(v3 + 16);
  int64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = sub_100013480;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1001E4AC0 + dword_1001E4AC0);
  return v10(a1, a2, a3, v8);
}

uint64_t sub_100147F00(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v13 = *(void *)(v1 + 56);
  uint64_t v11 = *(void *)(v1 + 64);
  char v8 = *(unsigned char *)(v1 + 48);
  int64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_100013480;
  return sub_100144458(a1, v4, v5, v6, v7, v8, v13, v11);
}

uint64_t sub_100148018(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  char v10 = *(unsigned char *)(v1 + 64);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_100013480;
  return sub_10014470C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100148118(uint64_t a1)
{
  long long v9 = *(_OWORD *)(v1 + 16);
  char v4 = *(unsigned char *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 48);
  uint64_t v6 = swift_task_alloc();
  long long v7 = *(_OWORD *)(v1 + 64);
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_100012AB8;
  *(_OWORD *)(v6 + 48) = v7;
  *(void *)(v6 + 40) = v5;
  *(unsigned char *)(v6 + 72) = v4;
  *(_OWORD *)(v6 + 24) = v9;
  *(void *)(v6 + 16) = a1;
  return _swift_task_switch(sub_10014108C, 0, 0);
}

uint64_t sub_1001481FC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

void sub_10014824C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  isa = Data._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, objc_class *))(v1 + 16))(v1, isa);
}

uint64_t sub_1001482A4()
{
  uint64_t v0 = type metadata accessor for Logger();
  __chkstk_darwin(v0);
  type metadata accessor for PropertyListEncoder();
  swift_allocObject();
  PropertyListEncoder.init()();
  sub_100012960(&qword_1001E3288);
  sub_100149B74(&qword_1001E4C00, &qword_1001E3288);
  uint64_t v1 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
  swift_release();
  return v1;
}

uint64_t sub_100148560()
{
  uint64_t v0 = type metadata accessor for Logger();
  __chkstk_darwin(v0);
  type metadata accessor for PropertyListEncoder();
  swift_allocObject();
  PropertyListEncoder.init()();
  sub_100012960(&qword_1001E4BD8);
  sub_100149B74(&qword_1001E4BE0, &qword_1001E4BD8);
  uint64_t v1 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
  swift_release();
  return v1;
}

uint64_t sub_100148830(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v5 = type metadata accessor for Logger();
  __chkstk_darwin(v5);
  type metadata accessor for PropertyListEncoder();
  swift_allocObject();
  PropertyListEncoder.init()();
  sub_100012960(a2);
  sub_100149B74(a3, a2);
  uint64_t v6 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
  swift_release();
  return v6;
}

uint64_t sub_100148AF8()
{
  swift_unknownObjectRelease();
  swift_release();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 72);
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 144)) {
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 120);
  }

  swift_release();

  return _swift_deallocObject(v0, 184, 7);
}

uint64_t sub_100148B68(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v13 = *(void *)(v1 + 56);
  uint64_t v11 = *(void *)(v1 + 64);
  char v8 = *(unsigned char *)(v1 + 48);
  long long v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_100013480;
  return sub_1001441A4(a1, v4, v5, v6, v7, v8, v13, v11);
}

uint64_t sub_100148C80(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  char v10 = *(unsigned char *)(v1 + 64);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_100013480;
  return sub_100146220(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100148D80()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 96);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 136);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 176);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 216);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 256);
  swift_release();
  swift_bridgeObjectRelease();

  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 328);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 368);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 528);
  swift_bridgeObjectRelease();

  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 592);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 632);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 672);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 712);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 752);
  swift_bridgeObjectRelease();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 800);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 840);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 880);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 968);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 1008);
  swift_bridgeObjectRelease();

  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 1072);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 1112);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 1152);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 1192);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 1232);
  if (*(void *)(v0 + 1296)) {
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 1272);
  }

  swift_release();

  return _swift_deallocObject(v0, 1336, 7);
}

uint64_t sub_100148F58(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v13 = *(void *)(v1 + 56);
  uint64_t v11 = *(void *)(v1 + 64);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_100013480;
  return sub_100143EF0(a1, v4, v5, v6, v7, v8, v13, v11);
}

uint64_t sub_100149070(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  char v10 = *(unsigned char *)(v1 + 64);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_100013480;
  return sub_10014470C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100149170()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 120);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 160);
  swift_bridgeObjectRelease();

  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 224);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 264);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 304);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 344);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 384);
  if (*(void *)(v0 + 448)) {
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 424);
  }

  swift_release();

  return _swift_deallocObject(v0, 488, 7);
}

uint64_t sub_100149238(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v13 = *(void *)(v1 + 56);
  uint64_t v11 = *(void *)(v1 + 64);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_100012AB8;
  return sub_1001438D0(a1, v4, v5, v6, v7, v8, v13, v11);
}

uint64_t sub_100149350(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  char v10 = *(unsigned char *)(v1 + 64);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_100013480;
  return sub_100145A8C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100149454(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v13 = *(void *)(v1 + 56);
  uint64_t v11 = *(void *)(v1 + 64);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_100013480;
  return sub_100143368(a1, v4, v5, v6, v7, v8, v13, v11);
}

uint64_t sub_100149570(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  char v10 = *(unsigned char *)(v1 + 64);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_100013480;
  return sub_10014470C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100149674()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 192);
  swift_bridgeObjectRelease();

  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 256);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 296);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 336);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 376);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 416);
  swift_bridgeObjectRelease();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 464);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 504);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 544);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 632);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 672);
  swift_bridgeObjectRelease();

  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 736);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 776);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 816);
  swift_release();
  if (*(void *)(v0 + 888)) {
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 864);
  }

  swift_release();

  return _swift_deallocObject(v0, 928, 7);
}

uint64_t sub_1001497E4(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v13 = *(void *)(v1 + 56);
  uint64_t v11 = *(void *)(v1 + 64);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_100013480;
  return sub_10014361C(a1, v4, v5, v6, v7, v8, v13, v11);
}

uint64_t sub_100149900(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  char v10 = *(unsigned char *)(v1 + 64);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_100013480;
  return sub_1001452E0(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100149A00(uint64_t a1, unint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return sub_10005E9FC(a1, a2);
  }
  return a1;
}

uint64_t sub_100149A0C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  char v10 = *(unsigned char *)(v1 + 64);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_100013480;
  return sub_100144ACC(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100149B0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100012960(&qword_1001E3288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100149B74(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100011ECC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100149BC4()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 96);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 136);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 224);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 264);
  swift_bridgeObjectRelease();

  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 328);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 368);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 408);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 448);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 488);
  if (*(void *)(v0 + 552)) {
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 528);
  }

  swift_release();

  return _swift_deallocObject(v0, 592, 7);
}

uint64_t sub_100149CAC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v13 = *(void *)(v1 + 56);
  uint64_t v11 = *(void *)(v1 + 64);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_100013480;
  return sub_100142CC4(a1, v4, v5, v6, v7, v8, v13, v11);
}

uint64_t sub_100149DC8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  char v10 = *(unsigned char *)(v1 + 64);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_100013480;
  return sub_10014470C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100149ED8()
{
  id v0 = objc_allocWithZone((Class)NSXPCConnection);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithMachServiceName:v1 options:0];

  uint64_t v3 = self;
  id v4 = [v3 interfaceWithProtocol:&OBJC_PROTOCOL____TtP20AttributionKitCommon17XPCClientProtocol_];
  [v2 setExportedInterface:v4];

  id v5 = [objc_allocWithZone((Class)type metadata accessor for XPCClient()) init];
  [v2 setExportedObject:v5];

  id v6 = [v3 interfaceWithProtocol:&OBJC_PROTOCOL____TtP20AttributionKitCommon28DeveloperModeServiceProtocol_];
  [v2 setRemoteObjectInterface:v6];

  uint64_t v14 = sub_10014A130;
  uint64_t v15 = 0;
  char v10 = _NSConcreteStackBlock;
  uint64_t v11 = 1107296256;
  uint64_t v12 = sub_10002437C;
  uint64_t v13 = &unk_1001CD310;
  uint64_t v7 = _Block_copy(&v10);
  [v2 setInterruptionHandler:v7];
  _Block_release(v7);
  uint64_t v14 = sub_10014A13C;
  uint64_t v15 = 0;
  char v10 = _NSConcreteStackBlock;
  uint64_t v11 = 1107296256;
  uint64_t v12 = sub_10002437C;
  uint64_t v13 = &unk_1001CD338;
  uint64_t v8 = _Block_copy(&v10);
  [v2 setInvalidationHandler:v8];
  _Block_release(v8);
  [v2 resume];
  type metadata accessor for DeveloperModeServiceConnection();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v2;
  qword_1001E60F0 = result;
  return result;
}

void sub_10014A130()
{
}

void sub_10014A13C()
{
}

void sub_10014A148(const char *a1)
{
  if (qword_1001E4C50 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100012E74(v2, (uint64_t)static Logger.xpc);
  oslog = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v3, a1, v4, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_10014A238()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DeveloperModeServiceConnection()
{
  return self;
}

__n128 sub_10014A298(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t sub_10014A2AC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 20)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10014A2CC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 20) = v3;
  return result;
}

void type metadata accessor for Decimal()
{
  if (!qword_1001E4D70)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1001E4D70);
    }
  }
}

uint64_t sub_10014A350(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10014A360()
{
  return swift_release();
}

uint64_t sub_10014A370()
{
  uint64_t result = sub_10014A3B4();
  qword_1001E60F8 = result;
  return result;
}

uint64_t type metadata accessor for PostbackUpdateTestingServiceConnection()
{
  return self;
}

uint64_t sub_10014A3B4()
{
  uint64_t v18 = &type metadata for FeatureFlag;
  unint64_t v19 = sub_10014A6FC();
  LOBYTE(v15) = 1;
  char v0 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)&v15);
  if (v0)
  {
    id v1 = objc_allocWithZone((Class)NSXPCConnection);
    NSString v2 = String._bridgeToObjectiveC()();
    id v3 = objc_msgSend(v1, "initWithMachServiceName:options:", v2, 0, v15);

    id v4 = self;
    id v5 = [v4 interfaceWithProtocol:&OBJC_PROTOCOL____TtP20AttributionKitCommon17XPCClientProtocol_];
    [v3 setExportedInterface:v5];

    id v6 = [objc_allocWithZone((Class)type metadata accessor for XPCClient()) init];
    [v3 setExportedObject:v6];

    id v7 = [v4 interfaceWithProtocol:&OBJC_PROTOCOL____TtP20AttributionKitCommon36PostbackUpdateTestingServiceProtocol_];
    [v3 setRemoteObjectInterface:v7];

    unint64_t v19 = (unint64_t)sub_10014A130;
    uint64_t v20 = 0;
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 1107296256;
    unint64_t v17 = sub_10002437C;
    uint64_t v18 = (ValueMetadata *)&unk_1001CD360;
    uint64_t v8 = _Block_copy(&v15);
    [v3 setInterruptionHandler:v8];
    _Block_release(v8);
    unint64_t v19 = (unint64_t)sub_10014A13C;
    uint64_t v20 = 0;
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 1107296256;
    unint64_t v17 = sub_10002437C;
    uint64_t v18 = (ValueMetadata *)&unk_1001CD388;
    uint64_t v9 = _Block_copy(&v15);
    [v3 setInvalidationHandler:v9];
    _Block_release(v9);
    [v3 resume];
    type metadata accessor for PostbackUpdateTestingServiceConnection();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v3;
  }
  else
  {
    if (qword_1001E4C50 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_100012E74(v11, (uint64_t)static Logger.xpc);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Testing feature flag is not enabled", v14, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  return result;
}

unint64_t sub_10014A6FC()
{
  unint64_t result = qword_1001E4E38;
  if (!qword_1001E4E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4E38);
  }
  return result;
}

uint64_t sub_10014A750(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10014A760()
{
  return swift_release();
}

uint64_t MessageRegistration.description.getter()
{
  return 0x676E6967676F4CLL;
}

uint64_t sub_10014A790()
{
  return 0x676E6967676F6CLL;
}

uint64_t sub_10014A7A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x676E6967676F6CLL && a2 == 0xE700000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_10014A840(uint64_t a1)
{
  unint64_t v2 = sub_10014AB0C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10014A87C(uint64_t a1)
{
  unint64_t v2 = sub_10014AB0C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10014A8B8()
{
  return 0;
}

uint64_t sub_10014A8C4(uint64_t a1)
{
  unint64_t v2 = sub_10014AB60();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10014A900(uint64_t a1)
{
  unint64_t v2 = sub_10014AB60();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t MessageRegistration.encode(to:)(void *a1)
{
  uint64_t v2 = sub_100012960(&qword_1001E4E40);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100012960(&qword_1001E4E48);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_10014AB0C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  sub_10014AB60();
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

unint64_t sub_10014AB0C()
{
  unint64_t result = qword_1001E4E50;
  if (!qword_1001E4E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4E50);
  }
  return result;
}

unint64_t sub_10014AB60()
{
  unint64_t result = qword_1001E4E58;
  if (!qword_1001E4E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4E58);
  }
  return result;
}

uint64_t MessageRegistration.init(from:)(void *a1)
{
  return sub_10014B84C(a1);
}

uint64_t sub_10014ABCC()
{
  if (*v0) {
    return 6778732;
  }
  else {
    return 0xD000000000000015;
  }
}

uint64_t sub_10014AC04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10014BC30(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10014AC2C(uint64_t a1)
{
  unint64_t v2 = sub_10014BB34();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10014AC68(uint64_t a1)
{
  unint64_t v2 = sub_10014BB34();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10014ACA4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_10014ACD4(uint64_t a1)
{
  unint64_t v2 = sub_10014BBDC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10014AD10(uint64_t a1)
{
  unint64_t v2 = sub_10014BBDC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10014AD4C()
{
  return 6778732;
}

uint64_t sub_10014AD5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 6778732 && a2 == 0xE300000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_10014ADE4(uint64_t a1)
{
  unint64_t v2 = sub_10014BB88();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10014AE20(uint64_t a1)
{
  unint64_t v2 = sub_10014BB88();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t XPCClientMessage.MessageType.encode(to:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = a3;
  uint64_t v18 = a2;
  uint64_t v4 = sub_100012960(&qword_1001E4E60);
  uint64_t v19 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100012960(&qword_1001E4E68);
  uint64_t v16 = *(void *)(v7 - 8);
  uint64_t v17 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100012960(&qword_1001E4E70);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  os_log_type_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_10014BB34();
  uint64_t v14 = v20;
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if (v14)
  {
    char v22 = 1;
    sub_10014BB88();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    KeyedEncodingContainer.encode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v4);
  }
  else
  {
    char v21 = 0;
    sub_10014BBDC();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v17);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t XPCClientMessage.MessageType.init(from:)(void *a1)
{
  return sub_10014BD10(a1);
}

uint64_t sub_10014B15C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10014BD10(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_10014B188(void *a1)
{
  return XPCClientMessage.MessageType.encode(to:)(a1, *v1, v1[1]);
}

uint64_t sub_10014B1A4()
{
  return 1701869940;
}

uint64_t sub_10014B1B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 1701869940 && a2 == 0xE400000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_10014B23C(uint64_t a1)
{
  unint64_t v2 = sub_10014C1A4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10014B278(uint64_t a1)
{
  unint64_t v2 = sub_10014C1A4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t XPCClientMessage.encode(to:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100012960(&qword_1001E4E90);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_10014C1A4();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v11[0] = a2;
  v11[1] = a3;
  sub_10014C1F8();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void *XPCClientMessage.init(from:)(void *a1)
{
  return sub_10014C24C(a1);
}

void *sub_10014B41C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_10014C24C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_10014B448(void *a1)
{
  return XPCClientMessage.encode(to:)(a1, *v1, v1[1]);
}

uint64_t XPCClientProtocol.handleMessage(_:)(uint64_t a1, uint64_t a2)
{
  sub_100012960(&qword_1001E4EA8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100179990;
  *(void *)(v4 + 32) = a1;
  *(void *)(v4 + 40) = a2;
  swift_bridgeObjectRetain();
  XPCClientProtocol.handleMessages(_:)((Swift::OpaquePointer)v4);

  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall XPCClientProtocol.handleMessages(_:)(Swift::OpaquePointer a1)
{
  uint64_t v2 = v1;
  type metadata accessor for PropertyListEncoder();
  swift_allocObject();
  PropertyListEncoder.init()();
  sub_100012960(&qword_1001E4EB0);
  sub_10014C3BC();
  uint64_t v3 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
  unint64_t v5 = v4;
  swift_release();
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  [v2 handleMessages:isa];

  sub_100020930(v3, v5);
}

Swift::Void __swiftcall XPCClientProtocol.logMessage(_:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  swift_bridgeObjectRetain();
  XPCClientProtocol.handleMessage(_:)(countAndFlagsBits, (uint64_t)object);

  swift_bridgeObjectRelease();
}

uint64_t sub_10014B84C(void *a1)
{
  uint64_t v3 = sub_100012960(&qword_1001E4F80);
  uint64_t v16 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100012960(&qword_1001E4F88);
  uint64_t v6 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_10014AB0C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    uint64_t v9 = v16;
    uint64_t v15 = v6;
    if (*(void *)(KeyedDecodingContainer.allKeys.getter() + 16) == 1)
    {
      sub_10014AB60();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v10 = v15;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v3);
    }
    else
    {
      uint64_t v11 = type metadata accessor for DecodingError();
      swift_allocError();
      os_log_type_t v13 = v12;
      sub_100012960(&qword_1001E4F78);
      void *v13 = &type metadata for MessageRegistration;
      KeyedDecodingContainer.codingPath.getter();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, enum case for DecodingError.typeMismatch(_:), v11);
      swift_willThrow();
      uint64_t v10 = v15;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v17);
  }
  return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
}

unint64_t sub_10014BB34()
{
  unint64_t result = qword_1001E4E78;
  if (!qword_1001E4E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4E78);
  }
  return result;
}

unint64_t sub_10014BB88()
{
  unint64_t result = qword_1001E4E80;
  if (!qword_1001E4E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4E80);
  }
  return result;
}

unint64_t sub_10014BBDC()
{
  unint64_t result = qword_1001E4E88;
  if (!qword_1001E4E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4E88);
  }
  return result;
}

uint64_t sub_10014BC30(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000015 && a2 == 0x80000001001886E0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 6778732 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_10014BD10(void *a1)
{
  uint64_t v2 = sub_100012960(&qword_1001E4F60);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v24 = v2;
  uint64_t v25 = v3;
  __chkstk_darwin(v2);
  char v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100012960(&qword_1001E4F68);
  uint64_t v27 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100012960(&qword_1001E4F70);
  uint64_t v26 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t)sub_100012D78(a1, a1[3]);
  sub_10014BB34();
  uint64_t v13 = (uint64_t)v28;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v13) {
    goto LABEL_9;
  }
  uint64_t v14 = v27;
  uint64_t v23 = v6;
  v28 = a1;
  uint64_t v15 = KeyedDecodingContainer.allKeys.getter();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v19 = type metadata accessor for DecodingError();
    swift_allocError();
    char v21 = v20;
    sub_100012960(&qword_1001E4F78);
    *char v21 = &type metadata for XPCClientMessage.MessageType;
    uint64_t v12 = (uint64_t)v11;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, enum case for DecodingError.typeMismatch(_:), v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
    a1 = v28;
LABEL_9:
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
    return v12;
  }
  if (*(unsigned char *)(v15 + 32))
  {
    char v30 = 1;
    sub_10014BB88();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    uint64_t v16 = v24;
    uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v17 = v5;
    uint64_t v18 = v26;
    (*(void (**)(char *, uint64_t))(v25 + 8))(v17, v16);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v9);
  }
  else
  {
    char v29 = 0;
    sub_10014BBDC();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v23);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
    uint64_t v12 = 0;
  }
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v28);
  return v12;
}

unint64_t sub_10014C1A4()
{
  unint64_t result = qword_1001E4E98;
  if (!qword_1001E4E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4E98);
  }
  return result;
}

unint64_t sub_10014C1F8()
{
  unint64_t result = qword_1001E4EA0;
  if (!qword_1001E4EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4EA0);
  }
  return result;
}

void *sub_10014C24C(void *a1)
{
  uint64_t v3 = sub_100012960(&qword_1001E4F50);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100012D78(a1, a1[3]);
  sub_10014C1A4();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  }
  else
  {
    sub_10014CDFC();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = v9;
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_10014C3BC()
{
  unint64_t result = qword_1001E4EB8;
  if (!qword_1001E4EB8)
  {
    sub_100011ECC(&qword_1001E4EB0);
    sub_10014C430();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4EB8);
  }
  return result;
}

unint64_t sub_10014C430()
{
  unint64_t result = qword_1001E4EC0;
  if (!qword_1001E4EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4EC0);
  }
  return result;
}

unint64_t sub_10014C488()
{
  unint64_t result = qword_1001E4EC8;
  if (!qword_1001E4EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4EC8);
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageRegistration()
{
  return &type metadata for MessageRegistration;
}

uint64_t getEnumTagSinglePayload for XPCClientMessage(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for XPCClientMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
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

ValueMetadata *type metadata accessor for XPCClientMessage()
{
  return &type metadata for XPCClientMessage;
}

uint64_t getEnumTagSinglePayload for XPCClientMessage.MessageType(uint64_t a1, unsigned int a2)
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
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for XPCClientMessage.MessageType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
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

ValueMetadata *type metadata accessor for XPCClientMessage.MessageType()
{
  return &type metadata for XPCClientMessage.MessageType;
}

ValueMetadata *type metadata accessor for XPCClientMessage.CodingKeys()
{
  return &type metadata for XPCClientMessage.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for XPCClientMessage.MessageType.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10014C740);
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

ValueMetadata *type metadata accessor for XPCClientMessage.MessageType.CodingKeys()
{
  return &type metadata for XPCClientMessage.MessageType.CodingKeys;
}

ValueMetadata *type metadata accessor for XPCClientMessage.MessageType.ConnectionEstablishedCodingKeys()
{
  return &type metadata for XPCClientMessage.MessageType.ConnectionEstablishedCodingKeys;
}

ValueMetadata *type metadata accessor for XPCClientMessage.MessageType.LogCodingKeys()
{
  return &type metadata for XPCClientMessage.MessageType.LogCodingKeys;
}

unsigned char *_s20AttributionKitCommon19MessageRegistrationOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10014C834);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageRegistration.CodingKeys()
{
  return &type metadata for MessageRegistration.CodingKeys;
}

ValueMetadata *type metadata accessor for MessageRegistration.LoggingCodingKeys()
{
  return &type metadata for MessageRegistration.LoggingCodingKeys;
}

unint64_t sub_10014C880()
{
  unint64_t result = qword_1001E4ED0;
  if (!qword_1001E4ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4ED0);
  }
  return result;
}

unint64_t sub_10014C8D8()
{
  unint64_t result = qword_1001E4ED8;
  if (!qword_1001E4ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4ED8);
  }
  return result;
}

unint64_t sub_10014C930()
{
  unint64_t result = qword_1001E4EE0;
  if (!qword_1001E4EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4EE0);
  }
  return result;
}

unint64_t sub_10014C988()
{
  unint64_t result = qword_1001E4EE8;
  if (!qword_1001E4EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4EE8);
  }
  return result;
}

unint64_t sub_10014C9E0()
{
  unint64_t result = qword_1001E4EF0;
  if (!qword_1001E4EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4EF0);
  }
  return result;
}

unint64_t sub_10014CA38()
{
  unint64_t result = qword_1001E4EF8;
  if (!qword_1001E4EF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4EF8);
  }
  return result;
}

unint64_t sub_10014CA90()
{
  unint64_t result = qword_1001E4F00;
  if (!qword_1001E4F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4F00);
  }
  return result;
}

unint64_t sub_10014CAE8()
{
  unint64_t result = qword_1001E4F08;
  if (!qword_1001E4F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4F08);
  }
  return result;
}

unint64_t sub_10014CB40()
{
  unint64_t result = qword_1001E4F10;
  if (!qword_1001E4F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4F10);
  }
  return result;
}

unint64_t sub_10014CB98()
{
  unint64_t result = qword_1001E4F18;
  if (!qword_1001E4F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4F18);
  }
  return result;
}

unint64_t sub_10014CBF0()
{
  unint64_t result = qword_1001E4F20;
  if (!qword_1001E4F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4F20);
  }
  return result;
}

unint64_t sub_10014CC48()
{
  unint64_t result = qword_1001E4F28;
  if (!qword_1001E4F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4F28);
  }
  return result;
}

unint64_t sub_10014CCA0()
{
  unint64_t result = qword_1001E4F30;
  if (!qword_1001E4F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4F30);
  }
  return result;
}

unint64_t sub_10014CCF8()
{
  unint64_t result = qword_1001E4F38;
  if (!qword_1001E4F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4F38);
  }
  return result;
}

unint64_t sub_10014CD50()
{
  unint64_t result = qword_1001E4F40;
  if (!qword_1001E4F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4F40);
  }
  return result;
}

unint64_t sub_10014CDA8()
{
  unint64_t result = qword_1001E4F48;
  if (!qword_1001E4F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4F48);
  }
  return result;
}

unint64_t sub_10014CDFC()
{
  unint64_t result = qword_1001E4F58;
  if (!qword_1001E4F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4F58);
  }
  return result;
}

Swift::String *PostbackUpdateTestingServiceMachName.unsafeMutableAddressor()
{
  return &PostbackUpdateTestingServiceMachName;
}

uint64_t sub_10014CE6C(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  v3[10] = *v2;
  return _swift_task_switch(sub_10014CEB8, 0, 0);
}

uint64_t sub_10014CEB8()
{
  *(void *)(v0 + 40) = &type metadata for FeatureFlag;
  unint64_t v1 = sub_10014A6FC();
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 48) = v1;
  char v2 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 16);
  if (v2)
  {
    type metadata accessor for PropertyListEncoder();
    swift_allocObject();
    PropertyListEncoder.init()();
    sub_100151C44();
    uint64_t v3 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
    *(void *)(v0 + 88) = v3;
    *(void *)(v0 + 96) = v4;
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    uint64_t v10 = *(void *)(v0 + 72);
    uint64_t v11 = *(void *)(v0 + 80);
    long long v16 = *(_OWORD *)(v0 + 56);
    swift_release();
    uint64_t v12 = *(void *)(v10 + 16);
    uint64_t v13 = swift_task_alloc();
    *(void *)(v0 + 104) = v13;
    *(void *)(v13 + 16) = v12;
    *(_OWORD *)(v13 + 24) = v16;
    *(void *)(v13 + 40) = v8;
    *(void *)(v13 + 48) = v9;
    *(void *)(v13 + 56) = v11;
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v14;
    uint64_t v15 = sub_100012960(&qword_1001E4FE8);
    *uint64_t v14 = v0;
    v14[1] = sub_10014D0EC;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 128, 0, 0, 0xD000000000000023, 0x8000000100188730, sub_100151C98, v13, v15);
  }
  else
  {
    sub_10006608C();
    swift_allocError();
    *uint64_t v5 = 3;
    swift_willThrow();
    unsigned int v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_10014D0EC()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    char v2 = sub_100151EC8;
  }
  else
  {
    swift_task_dealloc();
    char v2 = sub_100151EC0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10014D208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[9] = a3;
  v4[10] = v3;
  v4[7] = a1;
  v4[8] = a2;
  v4[11] = *v3;
  return _swift_task_switch(sub_10014D254, 0, 0);
}

uint64_t sub_10014D254()
{
  *(void *)(v0 + 40) = &type metadata for FeatureFlag;
  unint64_t v1 = sub_10014A6FC();
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 48) = v1;
  char v2 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 16);
  if (v2)
  {
    type metadata accessor for PropertyListEncoder();
    swift_allocObject();
    PropertyListEncoder.init()();
    type metadata accessor for PurchaseIntakeRequest();
    sub_100151BBC();
    uint64_t v3 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
    *(void *)(v0 + 96) = v3;
    *(void *)(v0 + 104) = v4;
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    uint64_t v10 = *(void *)(v0 + 80);
    uint64_t v11 = *(void *)(v0 + 88);
    long long v16 = *(_OWORD *)(v0 + 64);
    swift_release();
    uint64_t v12 = *(void *)(v10 + 16);
    uint64_t v13 = swift_task_alloc();
    *(void *)(v0 + 112) = v13;
    *(void *)(v13 + 16) = v12;
    *(_OWORD *)(v13 + 24) = v16;
    *(void *)(v13 + 40) = v8;
    *(void *)(v13 + 48) = v9;
    *(void *)(v13 + 56) = v11;
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v14;
    uint64_t v15 = sub_100012960(&qword_1001E4FE8);
    *uint64_t v14 = v0;
    v14[1] = sub_10014D498;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 136, 0, 0, 0xD000000000000023, 0x8000000100188730, sub_100151C14, v13, v15);
  }
  else
  {
    sub_10006608C();
    swift_allocError();
    *uint64_t v5 = 3;
    swift_willThrow();
    unsigned int v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_10014D498()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    char v2 = sub_10014D61C;
  }
  else
  {
    swift_task_dealloc();
    char v2 = sub_10014D5B4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10014D5B4()
{
  sub_100020930(*(void *)(v0 + 96), *(void *)(v0 + 104));
  uint64_t v1 = *(unsigned __int8 *)(v0 + 136);
  char v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_10014D61C()
{
  sub_100020930(v0[12], v0[13]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10014D68C(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 64) = a3;
  *(void *)(v4 + 72) = v3;
  *(void *)(v4 + 56) = a2;
  *(unsigned char *)(v4 + 130) = a1;
  *(void *)(v4 + 80) = *v3;
  return _swift_task_switch(sub_10014D6DC, 0, 0);
}

uint64_t sub_10014D6DC()
{
  *(void *)(v0 + 40) = &type metadata for FeatureFlag;
  unint64_t v1 = sub_10014A6FC();
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 48) = v1;
  char v2 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 16);
  if (v2)
  {
    *(unsigned char *)(v0 + 129) = *(unsigned char *)(v0 + 130);
    type metadata accessor for PropertyListEncoder();
    swift_allocObject();
    PropertyListEncoder.init()();
    sub_100151B38();
    uint64_t v3 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
    *(void *)(v0 + 88) = v3;
    *(void *)(v0 + 96) = v4;
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    uint64_t v10 = *(void *)(v0 + 72);
    uint64_t v11 = *(void *)(v0 + 80);
    long long v16 = *(_OWORD *)(v0 + 56);
    swift_release();
    uint64_t v12 = *(void *)(v10 + 16);
    uint64_t v13 = swift_task_alloc();
    *(void *)(v0 + 104) = v13;
    *(void *)(v13 + 16) = v12;
    *(_OWORD *)(v13 + 24) = v16;
    *(void *)(v13 + 40) = v8;
    *(void *)(v13 + 48) = v9;
    *(void *)(v13 + 56) = v11;
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v14;
    uint64_t v15 = sub_100012960(&qword_1001E4FE8);
    *uint64_t v14 = v0;
    v14[1] = sub_10014D920;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 128, 0, 0, 0xD000000000000023, 0x8000000100188730, sub_100151B8C, v13, v15);
  }
  else
  {
    sub_10006608C();
    swift_allocError();
    *uint64_t v5 = 3;
    swift_willThrow();
    unsigned int v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_10014D920()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    char v2 = sub_10014DAA4;
  }
  else
  {
    swift_task_dealloc();
    char v2 = sub_10014DA3C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10014DA3C()
{
  sub_100020930(*(void *)(v0 + 88), *(void *)(v0 + 96));
  uint64_t v1 = *(unsigned __int8 *)(v0 + 128);
  char v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_10014DAA4()
{
  sub_100020930(v0[11], v0[12]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10014DB14(uint64_t a1, __int16 a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v6 + 104) = a5;
  *(void *)(v6 + 112) = v5;
  *(void *)(v6 + 88) = a3;
  *(void *)(v6 + 96) = a4;
  *(_WORD *)(v6 + 168) = a2;
  *(void *)(v6 + 80) = a1;
  *(void *)(v6 + 120) = *v5;
  return _swift_task_switch(sub_10014DB68, 0, 0);
}

uint64_t sub_10014DB68()
{
  *(void *)(v0 + 40) = &type metadata for FeatureFlag;
  unint64_t v1 = sub_10014A6FC();
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 48) = v1;
  char v2 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 16);
  if (v2)
  {
    __int16 v3 = *(_WORD *)(v0 + 168);
    uint64_t v4 = *(void *)(v0 + 88);
    *(void *)(v0 + 56) = *(void *)(v0 + 80);
    *(unsigned char *)(v0 + 64) = v3;
    *(unsigned char *)(v0 + 65) = HIBYTE(v3) & 1;
    *(void *)(v0 + 72) = v4;
    type metadata accessor for PropertyListEncoder();
    swift_allocObject();
    PropertyListEncoder.init()();
    sub_100151AB4();
    uint64_t v5 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
    *(void *)(v0 + 128) = v5;
    *(void *)(v0 + 136) = v6;
    uint64_t v10 = v5;
    uint64_t v11 = v6;
    uint64_t v12 = *(void *)(v0 + 112);
    uint64_t v13 = *(void *)(v0 + 120);
    long long v18 = *(_OWORD *)(v0 + 96);
    swift_release();
    uint64_t v14 = *(void *)(v12 + 16);
    uint64_t v15 = swift_task_alloc();
    *(void *)(v0 + 144) = v15;
    *(void *)(v15 + 16) = v14;
    *(_OWORD *)(v15 + 24) = v18;
    *(void *)(v15 + 40) = v10;
    *(void *)(v15 + 48) = v11;
    *(void *)(v15 + 56) = v13;
    long long v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 152) = v16;
    uint64_t v17 = sub_100012960(&qword_1001E4FE8);
    *long long v16 = v0;
    v16[1] = sub_10014DDC0;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 170, 0, 0, 0xD000000000000023, 0x8000000100188730, sub_100151B08, v15, v17);
  }
  else
  {
    sub_10006608C();
    swift_allocError();
    *uint64_t v7 = 3;
    swift_willThrow();
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
}

uint64_t sub_10014DDC0()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    char v2 = sub_10014DF44;
  }
  else
  {
    swift_task_dealloc();
    char v2 = sub_10014DEDC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10014DEDC()
{
  sub_100020930(*(void *)(v0 + 128), *(void *)(v0 + 136));
  uint64_t v1 = *(unsigned __int8 *)(v0 + 170);
  char v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_10014DF44()
{
  sub_100020930(v0[16], v0[17]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10014DFB4(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  v3[10] = *v2;
  return _swift_task_switch(sub_10014E000, 0, 0);
}

uint64_t sub_10014E000()
{
  *(void *)(v0 + 40) = &type metadata for FeatureFlag;
  unint64_t v1 = sub_10014A6FC();
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 48) = v1;
  char v2 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 16);
  if (v2)
  {
    type metadata accessor for PropertyListEncoder();
    swift_allocObject();
    PropertyListEncoder.init()();
    sub_10015198C();
    uint64_t v3 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
    *(void *)(v0 + 88) = v3;
    *(void *)(v0 + 96) = v4;
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    uint64_t v10 = *(void *)(v0 + 72);
    uint64_t v11 = *(void *)(v0 + 80);
    long long v16 = *(_OWORD *)(v0 + 56);
    swift_release();
    uint64_t v12 = *(void *)(v10 + 16);
    uint64_t v13 = swift_task_alloc();
    *(void *)(v0 + 104) = v13;
    *(void *)(v13 + 16) = v12;
    *(_OWORD *)(v13 + 24) = v16;
    *(void *)(v13 + 40) = v8;
    *(void *)(v13 + 48) = v9;
    *(void *)(v13 + 56) = v11;
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v14;
    uint64_t v15 = sub_100012960(&qword_1001E4FE8);
    *uint64_t v14 = v0;
    v14[1] = sub_10014D920;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 128, 0, 0, 0xD000000000000023, 0x8000000100188730, sub_1001519E0, v13, v15);
  }
  else
  {
    sub_10006608C();
    swift_allocError();
    *uint64_t v5 = 3;
    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_10014E234(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  v3[10] = *v2;
  return _swift_task_switch(sub_10014E280, 0, 0);
}

uint64_t sub_10014E280()
{
  *(void *)(v0 + 40) = &type metadata for FeatureFlag;
  unint64_t v1 = sub_10014A6FC();
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 48) = v1;
  char v2 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 16);
  if (v2)
  {
    type metadata accessor for PropertyListEncoder();
    swift_allocObject();
    PropertyListEncoder.init()();
    sub_100151768();
    uint64_t v3 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
    *(void *)(v0 + 88) = v3;
    *(void *)(v0 + 96) = v4;
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    uint64_t v11 = *(void *)(v0 + 72);
    uint64_t v10 = *(void *)(v0 + 80);
    long long v15 = *(_OWORD *)(v0 + 56);
    swift_release();
    uint64_t v12 = *(void *)(v11 + 16);
    uint64_t v13 = swift_task_alloc();
    *(void *)(v0 + 104) = v13;
    *(void *)(v13 + 16) = v12;
    *(_OWORD *)(v13 + 24) = v15;
    *(void *)(v13 + 40) = v8;
    *(void *)(v13 + 48) = v9;
    *(void *)(v13 + 56) = v10;
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v14;
    *uint64_t v14 = v0;
    v14[1] = sub_10014E4B0;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 128, 0, 0, 0xD000000000000023, 0x8000000100188730, sub_100151814, v13, &type metadata for Bool);
  }
  else
  {
    sub_10006608C();
    swift_allocError();
    *uint64_t v5 = 3;
    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6(0);
  }
}

uint64_t sub_10014E4B0()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    char v2 = sub_10014E5CC;
  }
  else
  {
    swift_task_dealloc();
    char v2 = sub_10014DA3C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10014E5CC()
{
  sub_100020930(v0[11], v0[12]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1(0);
}

uint64_t sub_10014E640(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  v3[10] = *v2;
  return _swift_task_switch(sub_10014E68C, 0, 0);
}

uint64_t sub_10014E68C()
{
  *(void *)(v0 + 40) = &type metadata for FeatureFlag;
  unint64_t v1 = sub_10014A6FC();
  *(unsigned char *)(v0 + 16) = 0;
  *(void *)(v0 + 48) = v1;
  char v2 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v0 + 16);
  if (v2)
  {
    type metadata accessor for PropertyListEncoder();
    swift_allocObject();
    PropertyListEncoder.init()();
    sub_100151768();
    uint64_t v3 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
    *(void *)(v0 + 88) = v3;
    *(void *)(v0 + 96) = v4;
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    uint64_t v10 = *(void *)(v0 + 72);
    uint64_t v11 = *(void *)(v0 + 80);
    long long v16 = *(_OWORD *)(v0 + 56);
    swift_release();
    uint64_t v12 = *(void *)(v10 + 16);
    uint64_t v13 = swift_task_alloc();
    *(void *)(v0 + 104) = v13;
    *(void *)(v13 + 16) = v12;
    *(_OWORD *)(v13 + 24) = v16;
    *(void *)(v13 + 40) = v8;
    *(void *)(v13 + 48) = v9;
    *(void *)(v13 + 56) = v11;
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v14;
    uint64_t v15 = sub_100012960(&qword_1001E4FE8);
    *uint64_t v14 = v0;
    v14[1] = sub_10014D0EC;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 128, 0, 0, 0xD000000000000023, 0x8000000100188730, sub_1001517BC, v13, v15);
  }
  else
  {
    sub_10006608C();
    swift_allocError();
    *uint64_t v5 = 3;
    swift_willThrow();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t ImpressionRequest.preflight(advertisedItemID:compactJWS:adNetworkID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return _swift_task_switch(sub_10014E8E8, 0, 0);
}

uint64_t sub_10014E8E8()
{
  if (qword_1001E4CA0 != -1) {
    swift_once();
  }
  if (qword_1001E6228)
  {
    uint64_t v1 = *(void *)(v0 + 48);
    long long v7 = *(_OWORD *)(v0 + 16);
    long long v8 = *(_OWORD *)(v0 + 32);
    uint64_t v2 = swift_task_alloc();
    *(void *)(v0 + 56) = v2;
    *(_OWORD *)(v2 + 16) = v7;
    *(_OWORD *)(v2 + 32) = v8;
    *(void *)(v2 + 48) = v1;
    uint64_t v3 = swift_task_alloc();
    *(void *)(v0 + 64) = v3;
    *(void *)(v3 + 16) = sub_100151540;
    *(void *)(v3 + 24) = v2;
    uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1001E4F98 + dword_1001E4F98);
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_10014EA6C;
    return v9((uint64_t)sub_100151570, v3);
  }
  else
  {
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_10014EA6C()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100151EC4;
  }
  else {
    uint64_t v2 = sub_100151EB8;
  }
  return _swift_task_switch(v2, 0, 0);
}

void sub_10014EB80(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSString v10 = String._bridgeToObjectiveC()();
  NSString v11 = String._bridgeToObjectiveC()();
  v13[4] = a4;
  v13[5] = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10016FE18;
  v13[3] = &unk_1001CDBE0;
  uint64_t v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  [a1 preflightImpressionWithAdvertisedItemID:a6 compactJWS:v10 adNetworkID:v11 reply:v12];
  _Block_release(v12);
}

uint64_t ImpressionRequest.startView(advertisedItemID:compactJWS:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return _swift_task_switch(sub_10014ECAC, 0, 0);
}

uint64_t sub_10014ECAC()
{
  if (qword_1001E4CA0 != -1) {
    swift_once();
  }
  if (qword_1001E6228)
  {
    uint64_t v1 = *(void *)(v0 + 32);
    long long v7 = *(_OWORD *)(v0 + 16);
    uint64_t v2 = swift_task_alloc();
    *(void *)(v0 + 40) = v2;
    *(_OWORD *)(v2 + 16) = v7;
    *(void *)(v2 + 32) = v1;
    uint64_t v3 = swift_task_alloc();
    *(void *)(v0 + 48) = v3;
    *(void *)(v3 + 16) = sub_10015159C;
    *(void *)(v3 + 24) = v2;
    long long v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1001E4F98 + dword_1001E4F98);
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_10014EE28;
    return v8((uint64_t)sub_100151EBC, v3);
  }
  else
  {
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_10014EE28()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100151E60;
  }
  else {
    uint64_t v2 = sub_100151E64;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t ImpressionRequest.endView(advertisedItemID:compactJWS:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return _swift_task_switch(sub_10014EF60, 0, 0);
}

uint64_t sub_10014EF60()
{
  if (qword_1001E4CA0 != -1) {
    swift_once();
  }
  if (qword_1001E6228)
  {
    uint64_t v1 = *(void *)(v0 + 32);
    long long v7 = *(_OWORD *)(v0 + 16);
    uint64_t v2 = swift_task_alloc();
    *(void *)(v0 + 40) = v2;
    *(_OWORD *)(v2 + 16) = v7;
    *(void *)(v2 + 32) = v1;
    uint64_t v3 = swift_task_alloc();
    *(void *)(v0 + 48) = v3;
    *(void *)(v3 + 16) = sub_1001515D8;
    *(void *)(v3 + 24) = v2;
    long long v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1001E4F98 + dword_1001E4F98);
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_10014F0DC;
    return v8((uint64_t)sub_100151EBC, v3);
  }
  else
  {
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_10014F0DC()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10014F25C;
  }
  else {
    uint64_t v2 = sub_10014F1F0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10014F1F0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10014F25C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_10014F2C8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, SEL *a10)
{
  NSString v14 = String._bridgeToObjectiveC()();
  v16[4] = a4;
  v16[5] = a5;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_10016FE18;
  v16[3] = a9;
  uint64_t v15 = _Block_copy(v16);
  swift_retain();
  swift_release();
  objc_msgSend(a1, *a10, a6, v14, v15);
  _Block_release(v15);
}

uint64_t ImpressionRequest.processTap(advertisedItemID:compactJWS:eventMessage:reengagementURL:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return _swift_task_switch(sub_10014F3D4, 0, 0);
}

uint64_t sub_10014F3D4()
{
  if (qword_1001E4CA0 != -1) {
    swift_once();
  }
  if (qword_1001E6228)
  {
    uint64_t v1 = *(void *)(v0 + 48);
    uint64_t v3 = *(void *)(v0 + 16);
    uint64_t v2 = *(void *)(v0 + 24);
    uint64_t v4 = swift_task_alloc();
    *(void *)(v0 + 56) = v4;
    long long v5 = *(_OWORD *)(v0 + 32);
    *(void *)(v4 + 16) = v3;
    *(void *)(v4 + 24) = v2;
    *(_OWORD *)(v4 + 32) = v5;
    *(void *)(v4 + 48) = v1;
    uint64_t v6 = swift_task_alloc();
    *(void *)(v0 + 64) = v6;
    *(void *)(v6 + 16) = sub_100151614;
    *(void *)(v6 + 24) = v4;
    NSString v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1001E4F98 + dword_1001E4F98);
    long long v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v7;
    *long long v7 = v0;
    v7[1] = sub_10014F55C;
    return v10((uint64_t)sub_100151EBC, v6);
  }
  else
  {
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_10014F55C()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10014F6DC;
  }
  else {
    uint64_t v2 = sub_10014F670;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10014F670()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10014F6DC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_10014F748(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v14 = sub_100012960(&qword_1001E1170);
  __chkstk_darwin(v14 - 8);
  long long v16 = (char *)aBlock - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v17 = String._bridgeToObjectiveC()();
  sub_1000207C4(a10, (uint64_t)v16);
  uint64_t v18 = type metadata accessor for URL();
  uint64_t v19 = *(void *)(v18 - 8);
  char v21 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18) != 1)
  {
    URL._bridgeToObjectiveC()(v20);
    char v21 = v22;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
  }
  aBlock[4] = a4;
  aBlock[5] = a5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10016FE18;
  aBlock[3] = &unk_1001CDAF0;
  uint64_t v23 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [a1 processTapWithAdvertisedItemID:a6 compactJWS:v17 eventMessage:a9 reengagementURL:v21 reply:v23];
  _Block_release(v23);
}

uint64_t sub_10014F930(uint64_t a1)
{
  unint64_t v2 = sub_100151644();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10014F96C(uint64_t a1)
{
  unint64_t v2 = sub_100151644();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ImpressionRequest.encode(to:)(void *a1)
{
  uint64_t v2 = sub_100012960(&qword_1001E4FB8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  long long v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_100151644();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t DeveloperModeRequest.init(from:)(uint64_t a1)
{
  return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(a1);
}

uint64_t sub_10014FAE0(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v25 = a7;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v28 = a4;
  char v29 = a3;
  uint64_t v9 = sub_100012960(&qword_1001E4FF0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v30 = a1;
  uint64_t v24 = v13;
  v13(v12, a1, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = swift_allocObject();
  long long v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_100151D48;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001552BC;
  aBlock[3] = &unk_1001CDB90;
  NSString v17 = _Block_copy(aBlock);
  swift_release();
  id v18 = [a2 remoteObjectProxyWithErrorHandler:v17];
  _Block_release(v17);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10003742C((uint64_t)aBlock, (uint64_t)v32);
  sub_100012960(&qword_1001E5018);
  if (swift_dynamicCast() && v31)
  {
    uint64_t v33 = v31;
    v24(v12, v30, v9);
    uint64_t v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    uint64_t v20 = v26;
    *(void *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v33, v20, v27, sub_100151810, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_10006608C();
    uint64_t v21 = swift_allocError();
    *char v22 = 3;
    v32[0] = v21;
    CheckedContinuation.resume(throwing:)();
  }
  return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)aBlock);
}

uint64_t sub_10014FDF0(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v25 = a7;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v28 = a4;
  char v29 = a3;
  uint64_t v9 = sub_100012960(&qword_1001E4FF0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v30 = a1;
  uint64_t v24 = v13;
  v13(v12, a1, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = swift_allocObject();
  long long v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_1001517E0;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001552BC;
  aBlock[3] = &unk_1001CDAA0;
  NSString v17 = _Block_copy(aBlock);
  swift_release();
  id v18 = [a2 remoteObjectProxyWithErrorHandler:v17];
  _Block_release(v17);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10003742C((uint64_t)aBlock, (uint64_t)v32);
  sub_100012960(&qword_1001E5040);
  if (swift_dynamicCast())
  {
    uint64_t v33 = v31;
    v24(v12, v30, v9);
    uint64_t v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    uint64_t v20 = v26;
    *(void *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v33, v20, v27, sub_100151810, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_10006608C();
    uint64_t v21 = swift_allocError();
    *char v22 = 3;
    v32[0] = v21;
    CheckedContinuation.resume(throwing:)();
  }
  return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)aBlock);
}

uint64_t sub_1001500F8(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v25 = a7;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v28 = a4;
  char v29 = a3;
  uint64_t v9 = sub_100012960(&qword_1001E4FF0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v30 = a1;
  uint64_t v24 = v13;
  v13(v12, a1, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = swift_allocObject();
  long long v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_1001517E0;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001552BC;
  aBlock[3] = &unk_1001CDA28;
  NSString v17 = _Block_copy(aBlock);
  swift_release();
  id v18 = [a2 remoteObjectProxyWithErrorHandler:v17];
  _Block_release(v17);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10003742C((uint64_t)aBlock, (uint64_t)v32);
  sub_100012960(&qword_1001E5040);
  if (swift_dynamicCast())
  {
    uint64_t v33 = v31;
    v24(v12, v30, v9);
    uint64_t v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    uint64_t v20 = v26;
    *(void *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v33, v20, v27, sub_100151810, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_10006608C();
    uint64_t v21 = swift_allocError();
    *char v22 = 3;
    v32[0] = v21;
    CheckedContinuation.resume(throwing:)();
  }
  return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)aBlock);
}

uint64_t sub_100150400(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v25 = a7;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v28 = a4;
  char v29 = a3;
  uint64_t v9 = sub_100012960(&qword_1001E4FF0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v30 = a1;
  uint64_t v24 = v13;
  v13(v12, a1, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = swift_allocObject();
  long long v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_1001517E0;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001552BC;
  aBlock[3] = &unk_1001CD9B0;
  NSString v17 = _Block_copy(aBlock);
  swift_release();
  id v18 = [a2 remoteObjectProxyWithErrorHandler:v17];
  _Block_release(v17);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10003742C((uint64_t)aBlock, (uint64_t)v32);
  sub_100012960(&qword_1001E5018);
  if (swift_dynamicCast())
  {
    uint64_t v33 = v31;
    v24(v12, v30, v9);
    uint64_t v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    uint64_t v20 = v26;
    *(void *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v33, v20, v27, sub_100151810, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_10006608C();
    uint64_t v21 = swift_allocError();
    *char v22 = 3;
    v32[0] = v21;
    CheckedContinuation.resume(throwing:)();
  }
  return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)aBlock);
}

uint64_t sub_100150708(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v25 = a7;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v28 = a4;
  char v29 = a3;
  uint64_t v9 = sub_100012960(&qword_1001E4FF0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v30 = a1;
  uint64_t v24 = v13;
  v13(v12, a1, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = swift_allocObject();
  long long v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_1001517E0;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001552BC;
  aBlock[3] = &unk_1001CD938;
  NSString v17 = _Block_copy(aBlock);
  swift_release();
  id v18 = [a2 remoteObjectProxyWithErrorHandler:v17];
  _Block_release(v17);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10003742C((uint64_t)aBlock, (uint64_t)v32);
  sub_100012960(&qword_1001E5018);
  if (swift_dynamicCast())
  {
    uint64_t v33 = v31;
    v24(v12, v30, v9);
    uint64_t v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    uint64_t v20 = v26;
    *(void *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v33, v20, v27, sub_100151810, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_10006608C();
    uint64_t v21 = swift_allocError();
    *char v22 = 3;
    v32[0] = v21;
    CheckedContinuation.resume(throwing:)();
  }
  return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)aBlock);
}

uint64_t sub_100150A10(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v25 = a7;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v28 = a4;
  char v29 = a3;
  uint64_t v9 = sub_100012960(&qword_1001E4908);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v30 = a1;
  uint64_t v24 = v13;
  v13(v12, a1, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = swift_allocObject();
  long long v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_100151850;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001552BC;
  aBlock[3] = &unk_1001CD8C0;
  NSString v17 = _Block_copy(aBlock);
  swift_release();
  id v18 = [a2 remoteObjectProxyWithErrorHandler:v17];
  _Block_release(v17);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10003742C((uint64_t)aBlock, (uint64_t)v32);
  sub_100012960(&qword_1001E4FF8);
  if (swift_dynamicCast())
  {
    uint64_t v33 = v31;
    v24(v12, v30, v9);
    uint64_t v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    uint64_t v20 = v26;
    *(void *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v33, v20, v27, sub_1001518DC, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_10006608C();
    uint64_t v21 = swift_allocError();
    *char v22 = 3;
    v32[0] = v21;
    CheckedContinuation.resume(throwing:)();
  }
  return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)aBlock);
}

uint64_t sub_100150D18(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, uint64_t (*)(), uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v25 = a7;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v28 = a4;
  char v29 = a3;
  uint64_t v9 = sub_100012960(&qword_1001E4FF0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v30 = a1;
  uint64_t v24 = v13;
  v13(v12, a1, v9);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = swift_allocObject();
  long long v16 = *(void (**)(unint64_t, char *, uint64_t))(v10 + 32);
  v16(v15 + v14, v12, v9);
  aBlock[4] = sub_1001517E0;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001552BC;
  aBlock[3] = &unk_1001CD848;
  NSString v17 = _Block_copy(aBlock);
  swift_release();
  id v18 = [a2 remoteObjectProxyWithErrorHandler:v17];
  _Block_release(v17);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10003742C((uint64_t)aBlock, (uint64_t)v32);
  sub_100012960(&qword_1001E4FF8);
  if (swift_dynamicCast())
  {
    uint64_t v33 = v31;
    v24(v12, v30, v9);
    uint64_t v19 = swift_allocObject();
    v16(v19 + v14, v12, v9);
    uint64_t v20 = v26;
    *(void *)(v19 + ((v14 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
    v29(&v33, v20, v27, sub_100151810, v19);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_10006608C();
    uint64_t v21 = swift_allocError();
    *char v22 = 3;
    v32[0] = v21;
    CheckedContinuation.resume(throwing:)();
  }
  return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)aBlock);
}

uint64_t sub_100151020()
{
  if (qword_1001E4C50 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100012E74(v0, (uint64_t)static Logger.xpc);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138543362;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v4 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error fetching remote object proxy: %{public}@", v3, 0xCu);
    sub_100012960(&qword_1001E0B30);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  sub_10006608C();
  swift_allocError();
  *long long v5 = 3;
  sub_100012960(&qword_1001E4FF0);
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_10015121C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (qword_1001E4C50 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100012E74(v4, (uint64_t)static Logger.xpc);
  swift_errorRetain();
  swift_errorRetain();
  long long v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    long long v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138543362;
    swift_errorRetain();
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *long long v8 = v11;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Error fetching remote object proxy: %{public}@", v7, 0xCu);
    sub_100012960(&qword_1001E0B30);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  sub_10006608C();
  swift_allocError();
  unsigned char *v9 = 3;
  sub_100012960(a3);
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_100151418()
{
  __int16 v0 = sub_100155CA0();
  char v1 = v0;
  if ((v0 & 0x100) != 0)
  {
    sub_10006608C();
    swift_allocError();
    *uint64_t v3 = v1;
    sub_100012960(&qword_1001E4908);
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    sub_100012960(&qword_1001E4908);
    return CheckedContinuation.resume(returning:)();
  }
}

uint64_t sub_1001514AC()
{
  __int16 v0 = sub_100155324();
  char v1 = v0;
  if ((v0 & 0x100) != 0)
  {
    sub_10006608C();
    swift_allocError();
    *uint64_t v3 = v1;
    sub_100012960(&qword_1001E4FF0);
    return CheckedContinuation.resume(throwing:)();
  }
  else
  {
    sub_100012960(&qword_1001E4FF0);
    return CheckedContinuation.resume(returning:)();
  }
}

void sub_100151540(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_10014EB80(a1, a2, a3, a4, a5, *(void *)(v5 + 16));
}

uint64_t sub_100151570(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

void sub_10015159C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_10014F2C8(a1, a2, a3, a4, a5, v5[2], v5[3], v5[4], (uint64_t)&unk_1001CDB40, (SEL *)&selRef_startViewWithAdvertisedItemID_compactJWS_reply_);
}

void sub_1001515D8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_10014F2C8(a1, a2, a3, a4, a5, v5[2], v5[3], v5[4], (uint64_t)&unk_1001CDB18, (SEL *)&selRef_endViewWithAdvertisedItemID_compactJWS_reply_);
}

void sub_100151614(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_10014F748(a1, a2, a3, a4, a5, v5[2], v5[3], v5[4], v5[5], v5[6]);
}

unint64_t sub_100151644()
{
  unint64_t result = qword_1001E4FC0;
  if (!qword_1001E4FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4FC0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ImpressionRequest()
{
  return &type metadata for ImpressionRequest;
}

ValueMetadata *type metadata accessor for ImpressionRequest.CodingKeys()
{
  return &type metadata for ImpressionRequest.CodingKeys;
}

unint64_t sub_1001516BC()
{
  unint64_t result = qword_1001E4FC8;
  if (!qword_1001E4FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4FC8);
  }
  return result;
}

unint64_t sub_100151714()
{
  unint64_t result = qword_1001E4FD0;
  if (!qword_1001E4FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4FD0);
  }
  return result;
}

unint64_t sub_100151768()
{
  unint64_t result = qword_1001E4FE0;
  if (!qword_1001E4FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E4FE0);
  }
  return result;
}

uint64_t sub_1001517BC(uint64_t a1)
{
  return sub_10015182C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_100150D18);
}

uint64_t sub_1001517D4()
{
  return sub_100151CBC(&qword_1001E4FF0);
}

uint64_t sub_1001517E0(uint64_t a1)
{
  return sub_10015185C(a1, &qword_1001E4FF0);
}

uint64_t sub_1001517EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1001517FC()
{
  return swift_release();
}

uint64_t sub_100151804()
{
  return sub_100151DC8(&qword_1001E4FF0);
}

uint64_t sub_100151814(uint64_t a1)
{
  return sub_10015182C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_100150A10);
}

uint64_t sub_10015182C(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_100151844()
{
  return sub_100151CBC(&qword_1001E4908);
}

uint64_t sub_100151850(uint64_t a1)
{
  return sub_10015185C(a1, &qword_1001E4908);
}

uint64_t sub_10015185C(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = *(void *)(sub_100012960(a2) - 8);
  return sub_10015121C(a1, v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), a2);
}

uint64_t sub_1001518D0()
{
  return sub_100151DC8(&qword_1001E4908);
}

uint64_t sub_1001518DC()
{
  sub_100012960(&qword_1001E4908);

  return sub_100151418();
}

unint64_t sub_10015198C()
{
  unint64_t result = qword_1001E5010;
  if (!qword_1001E5010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5010);
  }
  return result;
}

uint64_t sub_1001519E0(uint64_t a1)
{
  return sub_10015182C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_100150708);
}

uint64_t sub_1001519F8()
{
  return sub_100151CBC(&qword_1001E4FF0);
}

uint64_t sub_100151A04()
{
  return sub_100151DC8(&qword_1001E4FF0);
}

uint64_t sub_100151A10()
{
  return sub_1001514AC();
}

unint64_t sub_100151AB4()
{
  unint64_t result = qword_1001E5028;
  if (!qword_1001E5028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5028);
  }
  return result;
}

uint64_t sub_100151B08(uint64_t a1)
{
  return sub_10015182C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_100150400);
}

uint64_t sub_100151B20()
{
  return sub_100151CBC(&qword_1001E4FF0);
}

uint64_t sub_100151B2C()
{
  return sub_100151DC8(&qword_1001E4FF0);
}

unint64_t sub_100151B38()
{
  unint64_t result = qword_1001E5038;
  if (!qword_1001E5038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5038);
  }
  return result;
}

uint64_t sub_100151B8C(uint64_t a1)
{
  return sub_10015182C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_1001500F8);
}

uint64_t sub_100151BA4()
{
  return sub_100151CBC(&qword_1001E4FF0);
}

uint64_t sub_100151BB0()
{
  return sub_100151DC8(&qword_1001E4FF0);
}

unint64_t sub_100151BBC()
{
  unint64_t result = qword_1001E5050;
  if (!qword_1001E5050)
  {
    type metadata accessor for PurchaseIntakeRequest();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5050);
  }
  return result;
}

uint64_t sub_100151C14(uint64_t a1)
{
  return sub_10015182C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_10014FDF0);
}

uint64_t sub_100151C2C()
{
  return sub_100151CBC(&qword_1001E4FF0);
}

uint64_t sub_100151C38()
{
  return sub_100151DC8(&qword_1001E4FF0);
}

unint64_t sub_100151C44()
{
  unint64_t result = qword_1001E5058;
  if (!qword_1001E5058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5058);
  }
  return result;
}

uint64_t sub_100151C98(uint64_t a1)
{
  return sub_10015182C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_10014FAE0);
}

uint64_t sub_100151CB0()
{
  return sub_100151CBC(&qword_1001E4FF0);
}

uint64_t sub_100151CBC(uint64_t *a1)
{
  uint64_t v2 = sub_100012960(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return _swift_deallocObject(v1, v6, v7);
}

uint64_t sub_100151D48()
{
  sub_100012960(&qword_1001E4FF0);

  return sub_100151020();
}

uint64_t sub_100151DBC()
{
  return sub_100151DC8(&qword_1001E4FF0);
}

uint64_t sub_100151DC8(uint64_t *a1)
{
  uint64_t v2 = sub_100012960(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v4 | 7;
  unint64_t v7 = ((*(void *)(v3 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return _swift_deallocObject(v1, v7, v6);
}

BOOL ImpressionType.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1001CCF08, v2);
  swift_bridgeObjectRelease();
  return v3 != 0;
}

uint64_t ImpressionType.rawValue.getter()
{
  return 0x72706D692D707061;
}

unint64_t sub_100151F3C()
{
  unint64_t result = qword_1001E5060;
  if (!qword_1001E5060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5060);
  }
  return result;
}

Swift::Int sub_100151F90()
{
  return Hasher._finalize()();
}

uint64_t sub_100151FF0()
{
  return String.hash(into:)();
}

Swift::Int sub_100152014()
{
  return Hasher._finalize()();
}

uint64_t sub_100152070@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1001CCF40, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void sub_1001520C4(char *a1@<X8>)
{
  a1[15] = -18;
}

uint64_t sub_1001520EC()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10015214C()
{
  return RawRepresentable<>.encode(to:)();
}

unsigned char *storeEnumTagSinglePayload for ImpressionType(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100152238);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ImpressionType()
{
  return &type metadata for ImpressionType;
}

unint64_t sub_100152270()
{
  unint64_t result = qword_1001E5068;
  if (!qword_1001E5068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5068);
  }
  return result;
}

Swift::String *ImpressionIntakeServiceMachName.unsafeMutableAddressor()
{
  return &ImpressionIntakeServiceMachName;
}

uint64_t sub_1001522D0(long long *a1, void (*a2)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(), uint64_t))
{
  uint64_t v6 = *v2;
  *((void *)&v27 + 1) = &type metadata for FeatureFlag;
  unint64_t v28 = sub_10014A6FC();
  LOBYTE(aBlock) = 0;
  char v7 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)&aBlock);
  if (v7)
  {
    sub_100012960(&qword_1001E50B0);
    uint64_t v8 = swift_allocObject();
    *(_WORD *)(v8 + 16) = -256;
    uint64_t v9 = (void *)v2[2];
    unint64_t v28 = (unint64_t)sub_1001573B8;
    uint64_t v29 = v8;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v27 = sub_1001552BC;
    *((void *)&v27 + 1) = &unk_1001CE0F8;
    uint64_t v10 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v10];
    _Block_release(v10);
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_10003742C((uint64_t)v30, (uint64_t)&aBlock);
    sub_100012960(&qword_1001E5138);
    if (swift_dynamicCast())
    {
      uint64_t v24 = a2;
      uint64_t v31 = v25;
      long long v12 = a1[1];
      long long aBlock = *a1;
      long long v27 = v12;
      unint64_t v28 = *((void *)a1 + 4);
      type metadata accessor for PropertyListEncoder();
      swift_allocObject();
      PropertyListEncoder.init()();
      sub_1001576BC();
      uint64_t v13 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
      if (v3)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        uint64_t v17 = v13;
        unint64_t v18 = v14;
        swift_release();
        uint64_t v19 = swift_allocObject();
        *(void *)(v19 + 16) = v8;
        *(void *)(v19 + 24) = v6;
        swift_retain();
        v24(&v31, v17, v18, sub_100157840, v19);
        swift_release();
        swift_beginAccess();
        unsigned int v20 = *(unsigned __int16 *)(v8 + 16);
        if (v20 >> 8 <= 0xFE)
        {
          if ((v20 & 0x100) == 0)
          {
            sub_100020930(v17, v18);
            swift_release();
            swift_unknownObjectRelease();
            _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v30);
            return v20 & 1;
          }
          sub_10006608C();
          swift_willThrowTypedImpl();
          swift_allocError();
          *uint64_t v23 = v20;
        }
        else
        {
          sub_10006608C();
          swift_allocError();
          *uint64_t v21 = 0;
          swift_willThrow();
        }
        sub_100020930(v17, v18);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_10006608C();
      swift_allocError();
      *long long v16 = 3;
      swift_willThrow();
      swift_release();
    }
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v30);
  }
  else
  {
    sub_10006608C();
    swift_allocError();
    *uint64_t v15 = 3;
    swift_willThrow();
  }
  return 0;
}

uint64_t sub_1001526E4@<X0>(long long *a1@<X0>, void (*a2)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t a1, uint64_t a2), uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v47 = a3;
  v46 = a2;
  uint64_t v7 = *v4;
  uint64_t v8 = sub_100012960(&qword_1001E5120);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100012960(&qword_1001E5128);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((void *)&v51 + 1) = &type metadata for FeatureFlag;
  unint64_t v52 = sub_10014A6FC();
  LOBYTE(aBlock) = 0;
  char v15 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)&aBlock);
  if (v15)
  {
    v44 = v10;
    v45 = a1;
    v42 = v14;
    uint64_t v43 = v7;
    uint64_t v41 = a4;
    sub_100012960(&qword_1001E5130);
    uint64_t v16 = swift_allocObject();
    uint64_t v17 = v16 + *(void *)(*(void *)v16 + 104);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v17, 1, 1, v11);
    unint64_t v18 = (void *)v4[2];
    unint64_t v52 = (unint64_t)sub_1001576B4;
    uint64_t v53 = v16;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v51 = sub_1001552BC;
    *((void *)&v51 + 1) = &unk_1001CE080;
    uint64_t v19 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v20 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v19];
    _Block_release(v19);
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_10003742C((uint64_t)v54, (uint64_t)&aBlock);
    sub_100012960(&qword_1001E5138);
    if (swift_dynamicCast())
    {
      uint64_t v21 = v11;
      uint64_t v55 = v49;
      long long v22 = v45[1];
      long long aBlock = *v45;
      long long v51 = v22;
      unint64_t v52 = *((void *)v45 + 4);
      type metadata accessor for PropertyListEncoder();
      swift_allocObject();
      PropertyListEncoder.init()();
      sub_1001576BC();
      uint64_t v23 = v48;
      uint64_t v24 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
      if (v23)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        uint64_t v29 = v24;
        unint64_t v30 = v25;
        swift_release();
        uint64_t v31 = v21;
        uint64_t v32 = swift_allocObject();
        uint64_t v33 = v43;
        *(void *)(v32 + 16) = v16;
        *(void *)(v32 + 24) = v33;
        swift_retain();
        v46(&v55, v29, v30, sub_100157710, v32);
        swift_release();
        swift_beginAccess();
        uint64_t v34 = (uint64_t)v44;
        sub_100036994(v17, (uint64_t)v44, &qword_1001E5120);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v34, 1, v31) == 1)
        {
          sub_100019960(v34, &qword_1001E5120);
          sub_10006608C();
          swift_allocError();
          unsigned char *v35 = 0;
          swift_willThrow();
        }
        else
        {
          uint64_t v36 = v34;
          v37 = v42;
          sub_100059F98(v36, (uint64_t)v42, &qword_1001E5128);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            LOBYTE(v49) = *v37;
            char v38 = v49;
            sub_10006608C();
            swift_willThrowTypedImpl();
            swift_allocError();
            unsigned char *v39 = v38;
          }
          else
          {
            sub_100059F98((uint64_t)v37, v41, &qword_1001E1170);
          }
        }
        sub_100020930(v29, v30);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_10006608C();
      swift_allocError();
      unsigned char *v28 = 3;
      swift_willThrow();
      swift_release();
    }
    return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v54);
  }
  else
  {
    sub_10006608C();
    swift_allocError();
    *uint64_t v26 = 3;
    return swift_willThrow();
  }
}

uint64_t sub_100152C58(long long *a1, void (*a2)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(), uint64_t))
{
  uint64_t v6 = *v2;
  *((void *)&v29 + 1) = &type metadata for FeatureFlag;
  *(void *)&long long v30 = sub_10014A6FC();
  LOBYTE(aBlock) = 0;
  char v7 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)&aBlock);
  if (v7)
  {
    sub_100012960(&qword_1001E50B0);
    uint64_t v8 = swift_allocObject();
    *(_WORD *)(v8 + 16) = -256;
    uint64_t v9 = (void *)v2[2];
    *(void *)&long long v30 = sub_1001573B8;
    *((void *)&v30 + 1) = v8;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v29 = sub_1001552BC;
    *((void *)&v29 + 1) = &unk_1001CE030;
    uint64_t v10 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v10];
    _Block_release(v10);
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_10003742C((uint64_t)v39, (uint64_t)&aBlock);
    sub_100012960(&qword_1001E50B8);
    if (swift_dynamicCast())
    {
      long long v27 = a2;
      uint64_t v40 = v38;
      long long v12 = a1[7];
      long long v34 = a1[6];
      long long v35 = v12;
      long long v36 = a1[8];
      char v37 = *((unsigned char *)a1 + 144);
      long long v13 = a1[3];
      long long v30 = a1[2];
      long long v31 = v13;
      long long v14 = a1[5];
      long long v32 = a1[4];
      long long v33 = v14;
      long long v15 = a1[1];
      long long aBlock = *a1;
      long long v29 = v15;
      type metadata accessor for PropertyListEncoder();
      swift_allocObject();
      PropertyListEncoder.init()();
      sub_10015760C();
      uint64_t v16 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
      if (v3)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        uint64_t v20 = v16;
        unint64_t v21 = v17;
        swift_release();
        uint64_t v22 = swift_allocObject();
        *(void *)(v22 + 16) = v8;
        *(void *)(v22 + 24) = v6;
        swift_retain();
        v27(&v40, v20, v21, sub_100157840, v22);
        swift_release();
        swift_beginAccess();
        unsigned int v23 = *(unsigned __int16 *)(v8 + 16);
        if (v23 >> 8 <= 0xFE)
        {
          if ((v23 & 0x100) == 0)
          {
            sub_100020930(v20, v21);
            swift_release();
            swift_unknownObjectRelease();
            _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v39);
            return v23 & 1;
          }
          LOBYTE(v38) = *(_WORD *)(v8 + 16);
          sub_10006608C();
          swift_willThrowTypedImpl();
          swift_allocError();
          *uint64_t v26 = v23;
        }
        else
        {
          sub_10006608C();
          swift_allocError();
          *uint64_t v24 = 0;
          swift_willThrow();
        }
        sub_100020930(v20, v21);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_10006608C();
      swift_allocError();
      *uint64_t v19 = 3;
      swift_willThrow();
      swift_release();
    }
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v39);
  }
  else
  {
    sub_10006608C();
    swift_allocError();
    *unint64_t v18 = 3;
    swift_willThrow();
  }
  return 0;
}

uint64_t sub_10015308C(long long *a1, void (*a2)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(), uint64_t))
{
  uint64_t v6 = *v2;
  *((void *)&v28 + 1) = &type metadata for FeatureFlag;
  *(void *)&long long v29 = sub_10014A6FC();
  LOBYTE(aBlock) = 0;
  char v7 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)&aBlock);
  if (v7)
  {
    sub_100012960(&qword_1001E50B0);
    uint64_t v8 = swift_allocObject();
    *(_WORD *)(v8 + 16) = -256;
    uint64_t v9 = (void *)v2[2];
    *(void *)&long long v29 = sub_1001573B8;
    *((void *)&v29 + 1) = v8;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v28 = sub_1001552BC;
    *((void *)&v28 + 1) = &unk_1001CDFE0;
    uint64_t v10 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v10];
    _Block_release(v10);
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_10003742C((uint64_t)v34, (uint64_t)&aBlock);
    sub_100012960(&qword_1001E50B8);
    if (swift_dynamicCast())
    {
      uint64_t v26 = a2;
      uint64_t v35 = v33;
      long long v12 = a1[5];
      long long v31 = a1[4];
      v32[0] = v12;
      *(_OWORD *)((char *)v32 + 9) = *(long long *)((char *)a1 + 89);
      long long v13 = a1[1];
      long long aBlock = *a1;
      long long v28 = v13;
      long long v14 = a1[3];
      long long v29 = a1[2];
      long long v30 = v14;
      type metadata accessor for PropertyListEncoder();
      swift_allocObject();
      PropertyListEncoder.init()();
      sub_1001575B8();
      uint64_t v15 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
      if (v3)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        uint64_t v19 = v15;
        unint64_t v20 = v16;
        swift_release();
        uint64_t v21 = swift_allocObject();
        *(void *)(v21 + 16) = v8;
        *(void *)(v21 + 24) = v6;
        swift_retain();
        v26(&v35, v19, v20, sub_100157840, v21);
        swift_release();
        swift_beginAccess();
        unsigned int v22 = *(unsigned __int16 *)(v8 + 16);
        if (v22 >> 8 <= 0xFE)
        {
          if ((v22 & 0x100) == 0)
          {
            sub_100020930(v19, v20);
            swift_release();
            swift_unknownObjectRelease();
            _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v34);
            return v22 & 1;
          }
          LOBYTE(v33) = *(_WORD *)(v8 + 16);
          sub_10006608C();
          swift_willThrowTypedImpl();
          swift_allocError();
          *unint64_t v25 = v22;
        }
        else
        {
          sub_10006608C();
          swift_allocError();
          *unsigned int v23 = 0;
          swift_willThrow();
        }
        sub_100020930(v19, v20);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_10006608C();
      swift_allocError();
      *unint64_t v18 = 3;
      swift_willThrow();
      swift_release();
    }
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v34);
  }
  else
  {
    sub_10006608C();
    swift_allocError();
    *unint64_t v17 = 3;
    swift_willThrow();
  }
  return 0;
}

uint64_t sub_1001534B0(void (*a1)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(), uint64_t))
{
  uint64_t v4 = *v1;
  uint64_t v24 = &type metadata for FeatureFlag;
  unint64_t v25 = sub_10014A6FC();
  LOBYTE(aBlock[0]) = 0;
  char v5 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)aBlock);
  if (v5)
  {
    sub_100012960(&qword_1001E50B0);
    uint64_t v6 = swift_allocObject();
    *(_WORD *)(v6 + 16) = -256;
    char v7 = (void *)v1[2];
    unint64_t v25 = (unint64_t)sub_1001573B8;
    uint64_t v26 = v6;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1001552BC;
    uint64_t v24 = (ValueMetadata *)&unk_1001CDF90;
    uint64_t v8 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    id v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v8];
    _Block_release(v8);
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_10003742C((uint64_t)v27, (uint64_t)aBlock);
    sub_100012960(&qword_1001E50B8);
    if (swift_dynamicCast())
    {
      uint64_t v21 = a1;
      uint64_t v28 = v22;
      type metadata accessor for PropertyListEncoder();
      swift_allocObject();
      PropertyListEncoder.init()();
      sub_100157564();
      uint64_t v10 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
      if (v2)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        uint64_t v14 = v10;
        unint64_t v15 = v11;
        swift_release();
        uint64_t v16 = swift_allocObject();
        *(void *)(v16 + 16) = v6;
        *(void *)(v16 + 24) = v4;
        swift_retain();
        v21(&v28, v14, v15, sub_100157840, v16);
        swift_release();
        swift_beginAccess();
        unsigned int v17 = *(unsigned __int16 *)(v6 + 16);
        if (v17 >> 8 <= 0xFE)
        {
          if ((v17 & 0x100) == 0)
          {
            sub_100020930(v14, v15);
            swift_release();
            swift_unknownObjectRelease();
            _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v27);
            return v17 & 1;
          }
          sub_10006608C();
          swift_willThrowTypedImpl();
          swift_allocError();
          unsigned char *v20 = v17;
        }
        else
        {
          sub_10006608C();
          swift_allocError();
          *unint64_t v18 = 0;
          swift_willThrow();
        }
        sub_100020930(v14, v15);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_10006608C();
      swift_allocError();
      unsigned char *v13 = 3;
      swift_willThrow();
      swift_release();
    }
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v27);
  }
  else
  {
    sub_10006608C();
    swift_allocError();
    *long long v12 = 3;
    swift_willThrow();
  }
  return 0;
}

uint64_t sub_1001538B0(void **a1, char a2, void (*a3)(uint64_t a1, void *a2), ValueMetadata *a4, void (*a5)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(), uint64_t))
{
  uint64_t v11 = *v5;
  uint64_t v35 = &type metadata for FeatureFlag;
  unint64_t v36 = sub_10014A6FC();
  LOBYTE(aBlock) = 0;
  char v12 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)&aBlock);
  if (v12)
  {
    char v29 = a2;
    uint64_t v28 = v11;
    sub_100012960(&qword_1001E50B0);
    uint64_t v13 = swift_allocObject();
    *(_WORD *)(v13 + 16) = -256;
    uint64_t v14 = (void *)v5[2];
    unint64_t v36 = (unint64_t)sub_1001573B8;
    uint64_t v37 = v13;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v33 = 1107296256;
    long long v34 = sub_1001552BC;
    uint64_t v35 = (ValueMetadata *)&unk_1001CDF40;
    unint64_t v15 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v16 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v15];
    _Block_release(v15);
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_10003742C((uint64_t)v38, (uint64_t)&aBlock);
    sub_100012960(&qword_1001E50B8);
    if (swift_dynamicCast())
    {
      uint64_t v39 = v31;
      long long aBlock = a1;
      LOBYTE(v33) = v29;
      long long v34 = a3;
      uint64_t v35 = a4;
      type metadata accessor for PropertyListEncoder();
      swift_allocObject();
      PropertyListEncoder.init()();
      sub_100157510();
      uint64_t v17 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
      if (v30)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        uint64_t v21 = v17;
        unint64_t v22 = v18;
        swift_release();
        uint64_t v23 = swift_allocObject();
        *(void *)(v23 + 16) = v13;
        *(void *)(v23 + 24) = v28;
        swift_retain();
        a5(&v39, v21, v22, sub_100157840, v23);
        swift_release();
        swift_beginAccess();
        unsigned int v24 = *(unsigned __int16 *)(v13 + 16);
        if (v24 >> 8 <= 0xFE)
        {
          if ((v24 & 0x100) == 0)
          {
            sub_100020930(v21, v22);
            swift_release();
            swift_unknownObjectRelease();
            _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v38);
            return v24 & 1;
          }
          sub_10006608C();
          swift_willThrowTypedImpl();
          swift_allocError();
          *long long v27 = v24;
        }
        else
        {
          sub_10006608C();
          swift_allocError();
          *unint64_t v25 = 0;
          swift_willThrow();
        }
        sub_100020930(v21, v22);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_10006608C();
      swift_allocError();
      unsigned char *v20 = 3;
      swift_willThrow();
      swift_release();
    }
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v38);
  }
  else
  {
    sub_10006608C();
    swift_allocError();
    *uint64_t v19 = 3;
    swift_willThrow();
  }
  return 0;
}

uint64_t sub_100153CD8(char a1, void (*a2)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t a1, uint64_t a2), uint64_t))
{
  uint64_t v6 = *v2;
  uint64_t v26 = &type metadata for FeatureFlag;
  unint64_t v27 = sub_10014A6FC();
  LOBYTE(aBlock[0]) = 0;
  char v7 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)aBlock);
  if (v7)
  {
    sub_100012960(&qword_1001E50B0);
    uint64_t v8 = swift_allocObject();
    *(_WORD *)(v8 + 16) = -256;
    id v9 = (void *)v2[2];
    unint64_t v27 = (unint64_t)sub_1001573B8;
    uint64_t v28 = v8;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1001552BC;
    uint64_t v26 = (ValueMetadata *)&unk_1001CDEF0;
    uint64_t v10 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v10];
    _Block_release(v10);
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_10003742C((uint64_t)v29, (uint64_t)aBlock);
    sub_100012960(&qword_1001E5040);
    if (swift_dynamicCast())
    {
      uint64_t v23 = a2;
      uint64_t v30 = v24;
      LOBYTE(aBlock[0]) = a1;
      type metadata accessor for PropertyListEncoder();
      swift_allocObject();
      PropertyListEncoder.init()();
      sub_100151B38();
      uint64_t v12 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
      if (v3)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        uint64_t v16 = v12;
        unint64_t v17 = v13;
        swift_release();
        uint64_t v18 = swift_allocObject();
        *(void *)(v18 + 16) = v8;
        *(void *)(v18 + 24) = v6;
        swift_retain();
        v23(&v30, v16, v17, sub_1001574F4, v18);
        swift_release();
        swift_beginAccess();
        unsigned int v19 = *(unsigned __int16 *)(v8 + 16);
        if (v19 >> 8 <= 0xFE)
        {
          if ((v19 & 0x100) == 0)
          {
            sub_100020930(v16, v17);
            swift_release();
            swift_unknownObjectRelease();
            _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v29);
            return v19 & 1;
          }
          sub_10006608C();
          swift_willThrowTypedImpl();
          swift_allocError();
          *unint64_t v22 = v19;
        }
        else
        {
          sub_10006608C();
          swift_allocError();
          unsigned char *v20 = 0;
          swift_willThrow();
        }
        sub_100020930(v16, v17);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_10006608C();
      swift_allocError();
      *unint64_t v15 = 3;
      swift_willThrow();
      swift_release();
    }
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v29);
  }
  else
  {
    sub_10006608C();
    swift_allocError();
    *uint64_t v14 = 3;
    swift_willThrow();
  }
  return 0;
}

uint64_t sub_1001540E0@<X0>(void (*a1)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t a1, uint64_t a2), uint64_t)@<X0>, void *a2@<X8>)
{
  uint64_t v6 = *v2;
  uint64_t v28 = &type metadata for FeatureFlag;
  unint64_t v29 = sub_10014A6FC();
  LOBYTE(aBlock[0]) = 0;
  char v7 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)aBlock);
  if ((v7 & 1) == 0)
  {
    sub_10006608C();
    swift_allocError();
    *uint64_t v14 = 3;
    return swift_willThrow();
  }
  sub_100012960(&qword_1001E50D8);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = 0;
  *(unsigned char *)(v8 + 32) = -1;
  id v9 = (void *)v2[2];
  unint64_t v29 = (unint64_t)sub_100157478;
  uint64_t v30 = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001552BC;
  uint64_t v28 = (ValueMetadata *)&unk_1001CDEA0;
  uint64_t v10 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v10];
  _Block_release(v10);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10003742C((uint64_t)v31, (uint64_t)aBlock);
  sub_100012960(&qword_1001E50B8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_10006608C();
    swift_allocError();
    *uint64_t v16 = 3;
    swift_willThrow();
    swift_release();
    return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v31);
  }
  unint64_t v25 = a2;
  uint64_t v32 = v26;
  type metadata accessor for PropertyListEncoder();
  swift_allocObject();
  PropertyListEncoder.init()();
  sub_100157480();
  uint64_t v12 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
  if (!v3)
  {
    uint64_t v17 = v12;
    unint64_t v18 = v13;
    swift_release();
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v8;
    *(void *)(v19 + 24) = v6;
    swift_retain();
    a1(&v32, v17, v18, sub_1001574D4, v19);
    swift_release();
    swift_beginAccess();
    int v20 = *(unsigned __int8 *)(v8 + 32);
    if (v20 == 255)
    {
      sub_10006608C();
      swift_allocError();
      *uint64_t v21 = 0;
      swift_willThrow();
    }
    else
    {
      uint64_t v22 = *(void *)(v8 + 16);
      if ((v20 & 1) == 0)
      {
        unint64_t v23 = *(void *)(v8 + 24);
        sub_10005EA64(*(void *)(v8 + 16), v23);
        sub_100020930(v17, v18);
        swift_release();
        *unint64_t v25 = v22;
        v25[1] = v23;
LABEL_13:
        swift_unknownObjectRelease();
        return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v31);
      }
      sub_10006608C();
      swift_willThrowTypedImpl();
      swift_allocError();
      *uint64_t v24 = v22;
    }
    sub_100020930(v17, v18);
    swift_release();
    goto LABEL_13;
  }
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v31);
}

uint64_t sub_1001544E4(void (*a1)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(), uint64_t))
{
  uint64_t v4 = *v1;
  uint64_t v24 = &type metadata for FeatureFlag;
  unint64_t v25 = sub_10014A6FC();
  LOBYTE(aBlock[0]) = 0;
  char v5 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)aBlock);
  if (v5)
  {
    sub_100012960(&qword_1001E50B0);
    uint64_t v6 = swift_allocObject();
    *(_WORD *)(v6 + 16) = -256;
    char v7 = (void *)v1[2];
    unint64_t v25 = (unint64_t)sub_1001573B8;
    uint64_t v26 = v6;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1001552BC;
    uint64_t v24 = (ValueMetadata *)&unk_1001CDE50;
    uint64_t v8 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    id v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v8];
    _Block_release(v8);
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_10003742C((uint64_t)v27, (uint64_t)aBlock);
    sub_100012960(&qword_1001E50B8);
    if (swift_dynamicCast())
    {
      uint64_t v21 = a1;
      uint64_t v28 = v22;
      type metadata accessor for PropertyListEncoder();
      swift_allocObject();
      PropertyListEncoder.init()();
      sub_1001573EC();
      uint64_t v10 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
      if (v2)
      {
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
      }
      else
      {
        uint64_t v14 = v10;
        unint64_t v15 = v11;
        swift_release();
        uint64_t v16 = swift_allocObject();
        *(void *)(v16 + 16) = v6;
        *(void *)(v16 + 24) = v4;
        swift_retain();
        v21(&v28, v14, v15, sub_100157840, v16);
        swift_release();
        swift_beginAccess();
        unsigned int v17 = *(unsigned __int16 *)(v6 + 16);
        if (v17 >> 8 <= 0xFE)
        {
          if ((v17 & 0x100) == 0)
          {
            sub_100020930(v14, v15);
            swift_release();
            swift_unknownObjectRelease();
            _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v27);
            return v17 & 1;
          }
          sub_10006608C();
          swift_willThrowTypedImpl();
          swift_allocError();
          unsigned char *v20 = v17;
        }
        else
        {
          sub_10006608C();
          swift_allocError();
          *unint64_t v18 = 0;
          swift_willThrow();
        }
        sub_100020930(v14, v15);
        swift_release();
        swift_unknownObjectRelease();
      }
    }
    else
    {
      sub_10006608C();
      swift_allocError();
      unsigned char *v13 = 3;
      swift_willThrow();
      swift_release();
    }
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v27);
  }
  else
  {
    sub_10006608C();
    swift_allocError();
    *uint64_t v12 = 3;
    swift_willThrow();
  }
  return 0;
}

uint64_t ImpressionIntakeRequest.interactionType.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

void __swiftcall ImpressionIntakeRequest.init(compactJWS:interactionType:clientBundleID:)(AttributionKitCommon::ImpressionIntakeRequest *__return_ptr retstr, Swift::String compactJWS, AttributionKitCommon::ImpressionIntakeRequest::InteractionType interactionType, Swift::String clientBundleID)
{
  retstr->compactJWS = compactJWS;
  retstr->interactionType = interactionType & 1;
  retstr->clientBundleID = clientBundleID;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ImpressionIntakeRequest.recordImpression(advertisedItemID:)(Swift::UInt64 advertisedItemID)
{
  if (qword_1001E4CA8 != -1) {
    advertisedItemID = swift_once();
  }
  if (qword_1001E6230)
  {
    uint64_t v2 = __chkstk_darwin(advertisedItemID);
    __chkstk_darwin(v2);
    sub_1001522D0(v1, (void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(), uint64_t))sub_100151570);
  }
}

void sub_1001549F8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v12[4] = a4;
  v12[5] = a5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10016FE18;
  uint64_t v12[3] = &unk_1001CE148;
  unint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  [a1 recordImpressionWithAdvertisedItemID:a6 intakeRequestData:isa reply:v11];
  _Block_release(v11);
}

uint64_t ImpressionIntakeRequest.processReengagement(advertisedItemID:reengagementURL:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1;
  if (qword_1001E4CA8 != -1) {
    a1 = swift_once();
  }
  if (qword_1001E6230)
  {
    uint64_t v7 = __chkstk_darwin(a1);
    v11[6] = v5;
    v11[7] = a2;
    __chkstk_darwin(v7);
    void v11[2] = sub_100156A24;
    v11[3] = v8;
    return sub_1001526E4(v3, (void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))sub_100151EBC, (uint64_t)v11, a3);
  }
  else
  {
    uint64_t v10 = type metadata accessor for URL();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a3, 1, 1, v10);
  }
}

void sub_100154C28(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12 = sub_100012960(&qword_1001E1170);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)aBlock - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100036994(a7, (uint64_t)v14, &qword_1001E1170);
  uint64_t v16 = type metadata accessor for URL();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v19 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v14, 1, v16) != 1)
  {
    URL._bridgeToObjectiveC()(v18);
    uint64_t v19 = v20;
    (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v16);
  }
  aBlock[4] = a4;
  aBlock[5] = a5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10016FE18;
  void aBlock[3] = &unk_1001CE0D0;
  uint64_t v21 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [a1 processReengagementWithAdvertisedItemID:a6 intakeRequestData:v15.super.isa reengagementURL:v19 reply:v21];
  _Block_release(v21);
}

AttributionKitCommon::ImpressionIntakeRequest::InteractionType_optional __swiftcall ImpressionIntakeRequest.InteractionType.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v2._uint64_t countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1001CCF78, v2);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    v4.value = AttributionKitCommon_ImpressionIntakeRequest_InteractionType_click;
  }
  else {
    v4.value = AttributionKitCommon_ImpressionIntakeRequest_InteractionType_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t ImpressionIntakeRequest.InteractionType.rawValue.getter(char a1)
{
  if (a1) {
    return 0x6B63696C63;
  }
  else {
    return 2003134838;
  }
}

uint64_t sub_100154E94@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1001CCF78, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

uint64_t sub_100154EF4()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_100154F54()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_100154FA4()
{
  uint64_t v1 = 0x7463617265746E69;
  if (*v0 != 1) {
    uint64_t v1 = 0x7542746E65696C63;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x4A746361706D6F63;
  }
}

uint64_t sub_10015501C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100156AD4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100155044(uint64_t a1)
{
  unint64_t v2 = sub_100156A2C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100155080(uint64_t a1)
{
  unint64_t v2 = sub_100156A2C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ImpressionIntakeRequest.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100012960(&qword_1001E5070);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100012D78(a1, a1[3]);
  sub_100156A2C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v10[15] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    v10[14] = *(unsigned char *)(v3 + 16);
    v10[13] = 1;
    sub_100156A80();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    v10[12] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

double ImpressionIntakeRequest.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_100156C80(a1, (uint64_t)v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(void *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_1001552A4(void *a1)
{
  return ImpressionIntakeRequest.encode(to:)(a1);
}

void sub_1001552BC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_100155324()
{
  type metadata accessor for PropertyListDecoder();
  swift_allocObject();
  PropertyListDecoder.init()();
  sub_100012960(&qword_1001E4B10);
  sub_100157780(&qword_1001E50C8, &qword_1001E4B10);
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
  swift_release();
  if (v3) {
    int v0 = v2;
  }
  else {
    int v0 = v2 & 1;
  }
  return v0 | (v3 << 8);
}

uint64_t sub_1001555E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100012960(&qword_1001E5128);
  __chkstk_darwin(v2);
  id v4 = &v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_100012960(&qword_1001E3288);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  uint64_t v10 = &v12[-v9];
  type metadata accessor for PropertyListDecoder();
  swift_allocObject();
  PropertyListDecoder.init()();
  sub_100157780(&qword_1001E5148, &qword_1001E3288);
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
  swift_release();
  sub_100059F98((uint64_t)v10, (uint64_t)v8, &qword_1001E3288);
  if (swift_getEnumCaseMultiPayload() == 1) {
    *id v4 = *v8;
  }
  else {
    sub_100059F98((uint64_t)v8, (uint64_t)v4, &qword_1001E1170);
  }
  swift_storeEnumTagMultiPayload();
  return sub_100059F98((uint64_t)v4, a1, &qword_1001E5128);
}

uint64_t sub_1001559C8@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for PropertyListDecoder();
  swift_allocObject();
  PropertyListDecoder.init()();
  sub_100012960(&qword_1001E4BD8);
  sub_100157780(&qword_1001E50E8, &qword_1001E4BD8);
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
  uint64_t result = swift_release();
  uint64_t v3 = v5;
  uint64_t v4 = v6;
  if (v7)
  {
    uint64_t v3 = v5;
    uint64_t v4 = 0;
  }
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v7;
  return result;
}

uint64_t sub_100155CA0()
{
  type metadata accessor for PropertyListDecoder();
  swift_allocObject();
  PropertyListDecoder.init()();
  sub_100012960(&qword_1001E4B48);
  sub_100157780(&qword_1001E50D0, &qword_1001E4B48);
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
  swift_release();
  if (v3) {
    int v0 = v2;
  }
  else {
    int v0 = v2 & 1;
  }
  return v0 | (v3 << 8);
}

uint64_t sub_100155F5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100012960(&qword_1001E5120);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v24 - v7;
  uint64_t v9 = sub_100012960(&qword_1001E5128);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1001E4C50 != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  sub_100012E74(v13, (uint64_t)static Logger.xpc);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v24 = a2;
    uint64_t v16 = swift_slowAlloc();
    unint64_t v27 = v6;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    unint64_t v25 = v8;
    uint64_t v19 = (void *)v18;
    uint64_t v26 = v12;
    *(_DWORD *)uint64_t v17 = 138543362;
    swift_errorRetain();
    uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v28 = v20;
    a2 = v24;
    uint64_t v12 = v26;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v19 = v20;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Error fetching synchronous remote object proxy: %{public}@", v17, 0xCu);
    sub_100012960(&qword_1001E0B30);
    swift_arrayDestroy();
    uint64_t v8 = v25;
    swift_slowDealloc();
    uint64_t v6 = v27;
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  *uint64_t v12 = 3;
  swift_storeEnumTagMultiPayload();
  uint64_t v21 = a2 + *(void *)(*(void *)a2 + 104);
  swift_beginAccess();
  sub_100036994(v21, (uint64_t)v8, &qword_1001E5120);
  int v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  uint64_t result = sub_100019960((uint64_t)v8, &qword_1001E5120);
  if (v22 == 1)
  {
    sub_100036994((uint64_t)v12, (uint64_t)v6, &qword_1001E5128);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
    swift_beginAccess();
    sub_100157718((uint64_t)v6, v21);
    swift_endAccess();
    return sub_100019960((uint64_t)v12, &qword_1001E5128);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10015632C(uint64_t a1, uint64_t a2)
{
  if (qword_1001E4C50 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100012E74(v3, (uint64_t)static Logger.xpc);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138543362;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v7 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Error fetching synchronous remote object proxy: %{public}@", v6, 0xCu);
    sub_100012960(&qword_1001E0B30);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t result = swift_beginAccess();
  if (*(unsigned __int8 *)(a2 + 17) == 255) {
    *(_WORD *)(a2 + 16) = 259;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_100156514(uint64_t a1, uint64_t a2)
{
  if (qword_1001E4C50 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100012E74(v3, (uint64_t)static Logger.xpc);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138543362;
    swift_errorRetain();
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v7 = v11;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Error fetching synchronous remote object proxy: %{public}@", v6, 0xCu);
    sub_100012960(&qword_1001E0B30);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t result = swift_beginAccess();
  if (*(unsigned __int8 *)(a2 + 32) == 255)
  {
    uint64_t v9 = *(void *)(a2 + 16);
    unint64_t v10 = *(void *)(a2 + 24);
    *(_OWORD *)(a2 + 16) = xmmword_10017C780;
    *(unsigned char *)(a2 + 32) = 1;
    return sub_1001574DC(v9, v10, 0xFFu);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100156710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_100012960(&qword_1001E5120);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  uint64_t v9 = &v17[-v8];
  uint64_t v10 = sub_100012960(&qword_1001E5128);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1001555E0((uint64_t)v13);
  uint64_t v14 = a3 + *(void *)(*(void *)a3 + 104);
  swift_beginAccess();
  sub_100036994(v14, (uint64_t)v9, &qword_1001E5120);
  int v15 = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  uint64_t result = sub_100019960((uint64_t)v9, &qword_1001E5120);
  if (v15 == 1)
  {
    sub_100036994((uint64_t)v13, (uint64_t)v7, &qword_1001E5128);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    swift_beginAccess();
    sub_100157718((uint64_t)v7, v14);
    swift_endAccess();
    return sub_100019960((uint64_t)v13, &qword_1001E5128);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10015693C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001559C8((uint64_t)v10);
  uint64_t v4 = v10[0];
  uint64_t v5 = v10[1];
  char v6 = v11;
  uint64_t result = swift_beginAccess();
  if (*(unsigned __int8 *)(a3 + 32) == 255)
  {
    uint64_t v8 = *(void *)(a3 + 16);
    unint64_t v9 = *(void *)(a3 + 24);
    *(void *)(a3 + 16) = v4;
    *(void *)(a3 + 24) = v5;
    *(unsigned char *)(a3 + 32) = v6;
    return sub_1001574DC(v8, v9, 0xFFu);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1001569B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v4 = sub_100155324();
  uint64_t result = swift_beginAccess();
  if (*(unsigned __int8 *)(a3 + 17) == 255) {
    *(_WORD *)(a3 + 16) = v4 & 0x1FF;
  }
  else {
    __break(1u);
  }
  return result;
}

void sub_100156A1C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_1001549F8(a1, a2, a3, a4, a5, *(void *)(v5 + 16));
}

void sub_100156A24(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_100154C28(a1, a2, a3, a4, a5, *(void *)(v5 + 16), *(void *)(v5 + 24));
}

unint64_t sub_100156A2C()
{
  unint64_t result = qword_1001E5078;
  if (!qword_1001E5078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5078);
  }
  return result;
}

unint64_t sub_100156A80()
{
  unint64_t result = qword_1001E5080;
  if (!qword_1001E5080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5080);
  }
  return result;
}

uint64_t sub_100156AD4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4A746361706D6F63 && a2 == 0xEA00000000005357;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7463617265746E69 && a2 == 0xEF657079546E6F69 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7542746E65696C63 && a2 == 0xEE004449656C646ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_100156C80@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100012960(&qword_1001E5110);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_100156A2C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  }
  char v23 = 0;
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v11 = v10;
  char v21 = 1;
  sub_100157660();
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  int v19 = v22;
  char v20 = 2;
  uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v14 = v13;
  int v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v18 = v12;
  v15(v8, v5);
  swift_bridgeObjectRetain();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(unsigned char *)(a2 + 16) = v19;
  *(void *)(a2 + 24) = v18;
  *(void *)(a2 + 32) = v14;
  return result;
}

unint64_t sub_100156EE0()
{
  unint64_t result = qword_1001E5088;
  if (!qword_1001E5088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5088);
  }
  return result;
}

uint64_t initializeWithCopy for ImpressionIntakeRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ImpressionIntakeRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ImpressionIntakeRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ImpressionIntakeRequest()
{
  return &type metadata for ImpressionIntakeRequest;
}

unsigned char *storeEnumTagSinglePayload for ImpressionIntakeRequest.InteractionType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100157120);
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

ValueMetadata *type metadata accessor for ImpressionIntakeRequest.InteractionType()
{
  return &type metadata for ImpressionIntakeRequest.InteractionType;
}

unsigned char *storeEnumTagSinglePayload for ImpressionIntakeRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100157224);
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

ValueMetadata *type metadata accessor for ImpressionIntakeRequest.CodingKeys()
{
  return &type metadata for ImpressionIntakeRequest.CodingKeys;
}

unint64_t sub_100157260()
{
  unint64_t result = qword_1001E5090;
  if (!qword_1001E5090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5090);
  }
  return result;
}

unint64_t sub_1001572B8()
{
  unint64_t result = qword_1001E5098;
  if (!qword_1001E5098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5098);
  }
  return result;
}

unint64_t sub_100157310()
{
  unint64_t result = qword_1001E50A0;
  if (!qword_1001E50A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E50A0);
  }
  return result;
}

unint64_t sub_100157364()
{
  unint64_t result = qword_1001E50A8;
  if (!qword_1001E50A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E50A8);
  }
  return result;
}

uint64_t sub_1001573B8(uint64_t a1)
{
  return sub_10015632C(a1, v1);
}

uint64_t sub_1001573D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1001573E4()
{
  return swift_release();
}

unint64_t sub_1001573EC()
{
  unint64_t result = qword_1001E50C0;
  if (!qword_1001E50C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E50C0);
  }
  return result;
}

uint64_t sub_100157440()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100157478(uint64_t a1)
{
  return sub_100156514(a1, v1);
}

unint64_t sub_100157480()
{
  unint64_t result = qword_1001E50E0;
  if (!qword_1001E50E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E50E0);
  }
  return result;
}

uint64_t sub_1001574D4(uint64_t a1, uint64_t a2)
{
  return sub_10015693C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1001574DC(uint64_t result, unint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_100149A00(result, a2, a3 & 1);
  }
  return result;
}

uint64_t sub_1001574F4(uint64_t a1, uint64_t a2)
{
  return sub_1001569B4(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_100157510()
{
  unint64_t result = qword_1001E50F0;
  if (!qword_1001E50F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E50F0);
  }
  return result;
}

unint64_t sub_100157564()
{
  unint64_t result = qword_1001E50F8;
  if (!qword_1001E50F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E50F8);
  }
  return result;
}

unint64_t sub_1001575B8()
{
  unint64_t result = qword_1001E5100;
  if (!qword_1001E5100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5100);
  }
  return result;
}

unint64_t sub_10015760C()
{
  unint64_t result = qword_1001E5108;
  if (!qword_1001E5108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5108);
  }
  return result;
}

unint64_t sub_100157660()
{
  unint64_t result = qword_1001E5118;
  if (!qword_1001E5118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5118);
  }
  return result;
}

uint64_t sub_1001576B4(uint64_t a1)
{
  return sub_100155F5C(a1, v1);
}

unint64_t sub_1001576BC()
{
  unint64_t result = qword_1001E5140;
  if (!qword_1001E5140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5140);
  }
  return result;
}

uint64_t sub_100157710(uint64_t a1, uint64_t a2)
{
  return sub_100156710(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100157718(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100012960(&qword_1001E5120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100157780(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100011ECC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100157844(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_100157858(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_10015786C(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, SEL *a7)
{
  uint64_t v11 = *a1;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v14[4] = a4;
  v14[5] = a5;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10016FE18;
  v14[3] = a6;
  uint64_t v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(v11, *a7, isa, v13);
  _Block_release(v13);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> BiomeEventRequest.submitConversionEvent(conversionEvent:)(AttributionKitCommon::BiomeEventRequest::ConversionEvent *conversionEvent)
{
  if (qword_1001E4C30 != -1) {
    swift_once();
  }
  if (qword_1001E60F8) {
    sub_100152C58((long long *)&conversionEvent->conversionID.value._countAndFlagsBits, (void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(), uint64_t))sub_100157844);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> BiomeEventRequest.submitPurchaseEvent(purchaseEvent:)(AttributionKitCommon::BiomeEventRequest::PurchaseEvent *purchaseEvent)
{
  if (qword_1001E4C30 != -1) {
    swift_once();
  }
  if (qword_1001E60F8) {
    sub_10015308C((long long *)purchaseEvent, (void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(), uint64_t))sub_100157858);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> BiomeEventRequest.clearBiome(clearEvent:)(Swift::String clearEvent)
{
  if (qword_1001E4C30 != -1) {
    clearEvent._uint64_t countAndFlagsBits = swift_once();
  }
  if (qword_1001E60F8)
  {
    uint64_t v1 = __chkstk_darwin(clearEvent._countAndFlagsBits);
    __chkstk_darwin(v1);
    sub_1001534B0((void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(), uint64_t))sub_100151570);
  }
}

void sub_100157B68(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v8 = String._bridgeToObjectiveC()();
  v10[4] = a4;
  v10[5] = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  void v10[2] = sub_10016FE18;
  v10[3] = &unk_1001CE408;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  [a1 clearBiomeWithClearEvent:v8 reply:v9];
  _Block_release(v9);
}

void sub_100157C44(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t BiomeEventRequest.ConversionEvent.advertisedItemID.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t BiomeEventRequest.ConversionEvent.conversionType.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t BiomeEventRequest.ConversionEvent.adNetworkID.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t BiomeEventRequest.ConversionEvent.sourceID.getter()
{
  return *(unsigned int *)(v0 + 64) | ((unint64_t)*(unsigned __int8 *)(v0 + 68) << 32);
}

uint64_t BiomeEventRequest.ConversionEvent.publisherItemID.getter()
{
  return *(void *)(v0 + 72);
}

uint64_t BiomeEventRequest.ConversionEvent.impressionDate.getter()
{
  return *(void *)(v0 + 120);
}

uint64_t BiomeEventRequest.ConversionEvent.conversionDate.getter()
{
  return *(void *)(v0 + 136);
}

void __swiftcall BiomeEventRequest.ConversionEvent.init(conversionID:advertisedItemID:conversionType:adNetworkID:sourceID:publisherItemID:marketplaceID:storefrontID:impressionDate:conversionDate:)(AttributionKitCommon::BiomeEventRequest::ConversionEvent *__return_ptr retstr, Swift::String_optional conversionID, Swift::UInt64_optional advertisedItemID, Swift::Int_optional conversionType, Swift::String_optional adNetworkID, Swift::UInt32_optional sourceID, Swift::UInt64_optional publisherItemID, Swift::String_optional marketplaceID, Swift::String_optional storefrontID, Swift::Double_optional impressionDate, Swift::Double_optional conversionDate)
{
  retstr->conversionID = conversionID;
  retstr->advertisedItemID.value = advertisedItemID.value;
  retstr->advertisedItemID.is_nil = advertisedItemID.is_nil;
  retstr->conversionType.value = conversionType.value;
  retstr->conversionType.is_nil = conversionType.is_nil;
  retstr->adNetworkID = adNetworkID;
  retstr->sourceID.value = sourceID.value;
  retstr->sourceID.is_nil = sourceID.is_nil;
  retstr->publisherItemID.value = publisherItemID.value;
  retstr->publisherItemID.is_nil = publisherItemID.is_nil;
  retstr->marketplaceID = marketplaceID;
  retstr->storefrontID = storefrontID;
  retstr->impressionDate.value = *(Swift::Double *)&impressionDate.is_nil;
  retstr->impressionDate.is_nil = v11 & 1;
  retstr->conversionDate.value = v12;
  retstr->conversionDate.is_nil = v13 & 1;
}

unint64_t sub_100157D80(char a1)
{
  unint64_t result = 0x69737265766E6F63;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0x726F7774654E6461;
      break;
    case 4:
      unint64_t result = 0x4449656372756F73;
      break;
    case 5:
      unint64_t result = 0x656873696C627570;
      break;
    case 6:
      unint64_t result = 0x6C7074656B72616DLL;
      break;
    case 7:
      unint64_t result = 0x6F726665726F7473;
      break;
    case 8:
      unint64_t result = 0x6973736572706D69;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_100157ED8()
{
  return sub_100157D80(*v0);
}

uint64_t sub_100157EE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100158998(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100157F08(uint64_t a1)
{
  unint64_t v2 = sub_100158244();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100157F44(uint64_t a1)
{
  unint64_t v2 = sub_100158244();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t BiomeEventRequest.ConversionEvent.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100012960(&qword_1001E5150);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  NSString v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100012D78(a1, a1[3]);
  sub_100158244();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v11[15] = 0;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v2)
  {
    v11[14] = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v11[13] = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v11[12] = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v9 = *(unsigned char *)(v3 + 68);
    v11[11] = 4;
    void v11[8] = v9;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v11[7] = 5;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v11[6] = 6;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v11[5] = 7;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v11[4] = 8;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v11[3] = 9;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_100158244()
{
  unint64_t result = qword_1001E5158;
  if (!qword_1001E5158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5158);
  }
  return result;
}

double BiomeEventRequest.ConversionEvent.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_100158E5C(a1, (uint64_t)v9);
  if (!v2)
  {
    long long v5 = v9[7];
    *(_OWORD *)(a2 + 96) = v9[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(_OWORD *)(a2 + 128) = v9[8];
    *(unsigned char *)(a2 + 144) = v10;
    long long v6 = v9[3];
    *(_OWORD *)(a2 + 32) = v9[2];
    *(_OWORD *)(a2 + 48) = v6;
    long long v7 = v9[5];
    *(_OWORD *)(a2 + 64) = v9[4];
    *(_OWORD *)(a2 + 80) = v7;
    double result = *(double *)v9;
    long long v8 = v9[1];
    *(_OWORD *)a2 = v9[0];
    *(_OWORD *)(a2 + 16) = v8;
  }
  return result;
}

uint64_t sub_10015830C(void *a1)
{
  return BiomeEventRequest.ConversionEvent.encode(to:)(a1);
}

uint64_t BiomeEventRequest.PurchaseEvent.advertisedItemID.getter()
{
  return *(void *)v0;
}

uint64_t BiomeEventRequest.PurchaseEvent.inAppPurchaseType.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t BiomeEventRequest.PurchaseEvent.inAppPurchaseSubscriptionDuration.getter()
{
  return *(void *)(v0 + 80);
}

uint64_t BiomeEventRequest.PurchaseEvent.purchaseDate.getter()
{
  return *(void *)(v0 + 96);
}

void __swiftcall BiomeEventRequest.PurchaseEvent.init(advertisedItemID:conversionID:storefrontID:amountCharged:inAppPurchaseType:inAppPurchaseSubscriptionDuration:purchaseDate:)(AttributionKitCommon::BiomeEventRequest::PurchaseEvent *__return_ptr retstr, Swift::UInt64_optional advertisedItemID, Swift::String_optional conversionID, Swift::String_optional storefrontID, Swift::Int64_optional amountCharged, Swift::Int_optional inAppPurchaseType, Swift::Int_optional inAppPurchaseSubscriptionDuration, Swift::Double_optional purchaseDate)
{
  retstr->advertisedItemID.value = advertisedItemID.value;
  retstr->advertisedItemID.is_nil = advertisedItemID.is_nil;
  retstr->conversionID = conversionID;
  retstr->storefrontID = storefrontID;
  retstr->amountCharged.value = amountCharged.value;
  retstr->amountCharged.is_nil = amountCharged.is_nil;
  retstr->inAppPurchaseType.value = inAppPurchaseType.value;
  retstr->inAppPurchaseType.is_nil = inAppPurchaseType.is_nil;
  retstr->inAppPurchaseSubscriptionDuration.value = inAppPurchaseSubscriptionDuration.value;
  retstr->inAppPurchaseSubscriptionDuration.is_nil = inAppPurchaseSubscriptionDuration.is_nil;
  retstr->purchaseDate.value = v8;
  retstr->purchaseDate.is_nil = v9 & 1;
}

unint64_t sub_1001583B4(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x69737265766E6F63;
      break;
    case 2:
      unint64_t result = 0x6F726665726F7473;
      break;
    case 3:
      unint64_t result = 0x6843746E756F6D61;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    case 5:
      unint64_t result = 0xD000000000000021;
      break;
    case 6:
      unint64_t result = 0x6573616863727570;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1001584C0()
{
  return sub_1001583B4(*v0);
}

uint64_t sub_1001584C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10015954C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001584F0(uint64_t a1)
{
  unint64_t v2 = sub_1001594F8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10015852C(uint64_t a1)
{
  unint64_t v2 = sub_1001594F8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t BiomeEventRequest.PurchaseEvent.encode(to:)(void *a1)
{
  uint64_t v3 = sub_100012960(&qword_1001E5160);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  long long v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100012D78(a1, a1[3]);
  sub_1001594F8();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v8[15] = 0;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v1)
  {
    v8[14] = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v8[13] = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v8[12] = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v8[11] = 4;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v8[10] = 5;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v8[9] = 6;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

__n128 BiomeEventRequest.PurchaseEvent.init(from:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_100159870(a1, (uint64_t)v7);
  if (!v2)
  {
    long long v5 = v8[0];
    *(_OWORD *)(a2 + 64) = v7[4];
    *(_OWORD *)(a2 + 80) = v5;
    *(_OWORD *)(a2 + 89) = *(_OWORD *)((char *)v8 + 9);
    long long v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
    __n128 result = (__n128)v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(__n128 *)(a2 + 48) = result;
  }
  return result;
}

uint64_t sub_1001587F8(void *a1)
{
  return BiomeEventRequest.PurchaseEvent.encode(to:)(a1);
}

uint64_t sub_100158810(uint64_t a1)
{
  unint64_t v2 = sub_100159C7C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10015884C(uint64_t a1)
{
  unint64_t v2 = sub_100159C7C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t BiomeEventRequest.encode(to:)(void *a1)
{
  uint64_t v2 = sub_100012960(&qword_1001E5170);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  long long v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_100159C7C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100158998(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x69737265766E6F63 && a2 == 0xEC00000044496E6FLL;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000100188790 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x69737265766E6F63 && a2 == 0xEE00657079546E6FLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x726F7774654E6461 && a2 == 0xEB0000000044496BLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x4449656372756F73 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x656873696C627570 && a2 == 0xEF44496D65744972 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6C7074656B72616DLL && a2 == 0xED00004449656361 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6F726665726F7473 && a2 == 0xEC0000004449746ELL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6973736572706D69 && a2 == 0xEE00657461446E6FLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x69737265766E6F63 && a2 == 0xEE00657461446E6FLL)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 9;
    }
    else {
      return 10;
    }
  }
}

uint64_t sub_100158E5C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v61 = sub_100012960(&qword_1001E51C8);
  uint64_t v5 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_100158244();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  }
  uint64_t v8 = v5;
  uint64_t v60 = a2;
  LOBYTE(v72[0]) = 0;
  uint64_t v9 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v11 = v10;
  LOBYTE(v72[0]) = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v57 = v9;
  uint64_t v58 = v12;
  char v94 = v13 & 1;
  LOBYTE(v72[0]) = 2;
  LODWORD(v9) = v13;
  uint64_t v14 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v55 = v9;
  uint64_t v56 = v14;
  char v93 = v15 & 1;
  LOBYTE(v72[0]) = 3;
  LODWORD(v9) = v15;
  uint64_t v16 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v53 = v9;
  uint64_t v54 = v16;
  LOBYTE(v72[0]) = 4;
  uint64_t v18 = v17;
  swift_bridgeObjectRetain();
  unint64_t v19 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v59 = v18;
  unint64_t v52 = v19;
  uint64_t v20 = HIDWORD(v19) & 1;
  char v95 = BYTE4(v19) & 1;
  LOBYTE(v72[0]) = 5;
  uint64_t v21 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v49 = v20;
  uint64_t v50 = v21;
  char v92 = v22 & 1;
  LOBYTE(v72[0]) = 6;
  LODWORD(v20) = v22;
  uint64_t v23 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v51 = v24;
  int v45 = v20;
  uint64_t v46 = v23;
  LOBYTE(v72[0]) = 7;
  swift_bridgeObjectRetain();
  uint64_t v47 = 0;
  uint64_t v44 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  LOBYTE(v72[0]) = 8;
  uint64_t v48 = v25;
  swift_bridgeObjectRetain();
  uint64_t v43 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v42 = v26 & 1;
  char v91 = v26 & 1;
  char v96 = 9;
  uint64_t v27 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  char v29 = v28;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v7, v61);
  char v30 = v29 & 1;
  char v90 = v29 & 1;
  *(void *)&long long v62 = v57;
  *((void *)&v62 + 1) = v11;
  uint64_t v31 = v59;
  *(void *)&long long v63 = v58;
  BYTE8(v63) = v55 & 1;
  *(void *)&long long v64 = v56;
  BYTE8(v64) = v53 & 1;
  *(void *)&long long v65 = v54;
  *((void *)&v65 + 1) = v59;
  uint64_t v32 = v51;
  LODWORD(v66) = v52;
  uint64_t v33 = v50;
  BYTE4(v66) = v49;
  *((void *)&v66 + 1) = v50;
  LOBYTE(v67) = v45 & 1;
  *((void *)&v67 + 1) = v46;
  *(void *)&long long v68 = v51;
  uint64_t v34 = v48;
  *((void *)&v68 + 1) = v44;
  *(void *)&long long v69 = v48;
  *((void *)&v69 + 1) = v43;
  LOBYTE(v70) = v42;
  *((void *)&v70 + 1) = v27;
  char v71 = v30;
  sub_1000D08B8((uint64_t)&v62);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  v72[0] = v57;
  v72[1] = v11;
  v72[2] = v58;
  char v73 = v94;
  uint64_t v74 = v56;
  char v75 = v93;
  uint64_t v76 = v54;
  uint64_t v77 = v31;
  int v78 = v52;
  char v79 = v95;
  uint64_t v80 = v33;
  char v81 = v92;
  uint64_t v82 = v46;
  uint64_t v83 = v32;
  uint64_t v84 = v44;
  uint64_t v85 = v34;
  uint64_t v86 = v43;
  char v87 = v91;
  uint64_t v88 = v27;
  char v89 = v90;
  uint64_t result = sub_1000D0910((uint64_t)v72);
  long long v36 = v69;
  uint64_t v37 = v60;
  *(_OWORD *)(v60 + 96) = v68;
  *(_OWORD *)(v37 + 112) = v36;
  *(_OWORD *)(v37 + 128) = v70;
  *(unsigned char *)(v37 + 144) = v71;
  long long v38 = v65;
  *(_OWORD *)(v37 + 32) = v64;
  *(_OWORD *)(v37 + 48) = v38;
  long long v39 = v67;
  *(_OWORD *)(v37 + 64) = v66;
  *(_OWORD *)(v37 + 80) = v39;
  long long v40 = v63;
  *(_OWORD *)uint64_t v37 = v62;
  *(_OWORD *)(v37 + 16) = v40;
  return result;
}

unint64_t sub_1001594F8()
{
  unint64_t result = qword_1001E5168;
  if (!qword_1001E5168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5168);
  }
  return result;
}

uint64_t sub_10015954C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x8000000100188790
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x69737265766E6F63 && a2 == 0xEC00000044496E6FLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F726665726F7473 && a2 == 0xEC0000004449746ELL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6843746E756F6D61 && a2 == 0xED00006465677261 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001001887B0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000021 && a2 == 0x80000001001887D0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6573616863727570 && a2 == 0xEC00000065746144)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t sub_100159870@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100012960(&qword_1001E51C0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_1001594F8();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  }
  char v46 = 0;
  uint64_t v9 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  char v11 = v10;
  uint64_t v39 = v9;
  char v45 = 1;
  uint64_t v12 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v14 = v13;
  uint64_t v37 = v12;
  char v44 = 2;
  swift_bridgeObjectRetain();
  uint64_t v15 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v38 = v16;
  uint64_t v34 = v15;
  uint64_t v36 = v14;
  char v43 = 3;
  swift_bridgeObjectRetain();
  uint64_t v35 = 0;
  uint64_t v17 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v32 = v18;
  uint64_t v33 = v17;
  char v42 = 4;
  uint64_t v19 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v31 = v20;
  char v41 = 5;
  uint64_t v21 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  HIDWORD(v29) = v22;
  uint64_t v30 = v21;
  char v40 = 6;
  uint64_t v23 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  LODWORD(v35) = v24;
  uint64_t v25 = v23;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  uint64_t v26 = v38;
  swift_bridgeObjectRelease();
  uint64_t v27 = v36;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v39;
  *(unsigned char *)(a2 + 8) = v11 & 1;
  *(void *)(a2 + 16) = v37;
  *(void *)(a2 + 24) = v27;
  *(void *)(a2 + 32) = v34;
  *(void *)(a2 + 40) = v26;
  *(void *)(a2 + 48) = v33;
  *(unsigned char *)(a2 + 56) = v32 & 1;
  *(void *)(a2 + 64) = v19;
  *(unsigned char *)(a2 + 72) = v31 & 1;
  *(void *)(a2 + 80) = v30;
  *(unsigned char *)(a2 + 88) = BYTE4(v29) & 1;
  *(void *)(a2 + 96) = v25;
  *(unsigned char *)(a2 + 104) = v35 & 1;
  return result;
}

unint64_t sub_100159C7C()
{
  unint64_t result = qword_1001E5178;
  if (!qword_1001E5178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5178);
  }
  return result;
}

ValueMetadata *type metadata accessor for BiomeEventRequest()
{
  return &type metadata for BiomeEventRequest;
}

uint64_t destroy for BiomeEventRequest.ConversionEvent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BiomeEventRequest.ConversionEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  int v5 = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  *(_DWORD *)(a1 + 64) = v5;
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v6 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v6;
  uint64_t v7 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v7;
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  uint64_t v8 = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 136) = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BiomeEventRequest.ConversionEvent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v6 = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  *(_DWORD *)(a1 + 64) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 72) = v7;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 120) = v8;
  uint64_t v9 = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 136) = v9;
  return a1;
}

__n128 initializeWithTake for BiomeEventRequest.ConversionEvent(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 128);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for BiomeEventRequest.ConversionEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v6 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  return a1;
}

uint64_t getEnumTagSinglePayload for BiomeEventRequest.ConversionEvent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 145)) {
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

uint64_t storeEnumTagSinglePayload for BiomeEventRequest.ConversionEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 144) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 145) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 145) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BiomeEventRequest.ConversionEvent()
{
  return &type metadata for BiomeEventRequest.ConversionEvent;
}

uint64_t destroy for BiomeEventRequest.PurchaseEvent()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BiomeEventRequest.PurchaseEvent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v5 = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 64) = v5;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BiomeEventRequest.PurchaseEvent(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[6];
  *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = a2[8];
  *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
  *(void *)(a1 + 64) = v6;
  uint64_t v7 = a2[10];
  *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
  *(void *)(a1 + 80) = v7;
  uint64_t v8 = a2[12];
  *(unsigned char *)(a1 + 104) = *((unsigned char *)a2 + 104);
  *(void *)(a1 + 96) = v8;
  return a1;
}

__n128 initializeWithTake for BiomeEventRequest.PurchaseEvent(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(_OWORD *)(a1 + 89) = *(long long *)((char *)a2 + 89);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for BiomeEventRequest.PurchaseEvent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  return a1;
}

uint64_t getEnumTagSinglePayload for BiomeEventRequest.PurchaseEvent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 105)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BiomeEventRequest.PurchaseEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 104) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 105) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 105) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BiomeEventRequest.PurchaseEvent()
{
  return &type metadata for BiomeEventRequest.PurchaseEvent;
}

ValueMetadata *type metadata accessor for BiomeEventRequest.CodingKeys()
{
  return &type metadata for BiomeEventRequest.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for BiomeEventRequest.PurchaseEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 6;
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
        JUMPOUT(0x10015A4F0);
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
          *__n128 result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BiomeEventRequest.PurchaseEvent.CodingKeys()
{
  return &type metadata for BiomeEventRequest.PurchaseEvent.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for BiomeEventRequest.ConversionEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 9;
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
        JUMPOUT(0x10015A5F4);
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
          *__n128 result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BiomeEventRequest.ConversionEvent.CodingKeys()
{
  return &type metadata for BiomeEventRequest.ConversionEvent.CodingKeys;
}

unint64_t sub_10015A630()
{
  unint64_t result = qword_1001E5180;
  if (!qword_1001E5180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5180);
  }
  return result;
}

unint64_t sub_10015A688()
{
  unint64_t result = qword_1001E5188;
  if (!qword_1001E5188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5188);
  }
  return result;
}

unint64_t sub_10015A6E0()
{
  unint64_t result = qword_1001E5190;
  if (!qword_1001E5190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5190);
  }
  return result;
}

unint64_t sub_10015A738()
{
  unint64_t result = qword_1001E5198;
  if (!qword_1001E5198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5198);
  }
  return result;
}

unint64_t sub_10015A790()
{
  unint64_t result = qword_1001E51A0;
  if (!qword_1001E51A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E51A0);
  }
  return result;
}

unint64_t sub_10015A7E8()
{
  unint64_t result = qword_1001E51A8;
  if (!qword_1001E51A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E51A8);
  }
  return result;
}

unint64_t sub_10015A840()
{
  unint64_t result = qword_1001E51B0;
  if (!qword_1001E51B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E51B0);
  }
  return result;
}

unint64_t sub_10015A898()
{
  unint64_t result = qword_1001E51B8;
  if (!qword_1001E51B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E51B8);
  }
  return result;
}

uint64_t sub_10015A8EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10015A8FC()
{
  return swift_release();
}

uint64_t sub_10015A914()
{
  uint64_t result = sub_10015A958();
  qword_1001E6100 = result;
  return result;
}

uint64_t type metadata accessor for TokenHandoffServiceConnection()
{
  return self;
}

uint64_t sub_10015A958()
{
  int v18 = &type metadata for FeatureFlag;
  unint64_t v19 = sub_10014A6FC();
  LOBYTE(v15) = 0;
  char v0 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)&v15);
  if (v0)
  {
    id v1 = objc_allocWithZone((Class)NSXPCConnection);
    NSString v2 = String._bridgeToObjectiveC()();
    id v3 = objc_msgSend(v1, "initWithMachServiceName:options:", v2, 0, v15);

    unsigned int v4 = self;
    id v5 = [v4 interfaceWithProtocol:&OBJC_PROTOCOL____TtP20AttributionKitCommon17XPCClientProtocol_];
    [v3 setExportedInterface:v5];

    id v6 = [objc_allocWithZone((Class)type metadata accessor for XPCClient()) init];
    [v3 setExportedObject:v6];

    id v7 = [v4 interfaceWithProtocol:&OBJC_PROTOCOL____TtP20AttributionKitCommon27TokenHandoffServiceProtocol_];
    [v3 setRemoteObjectInterface:v7];

    unint64_t v19 = (unint64_t)sub_10014A130;
    uint64_t v20 = 0;
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 1107296256;
    uint64_t v17 = sub_10002437C;
    int v18 = (ValueMetadata *)&unk_1001CE480;
    uint64_t v8 = _Block_copy(&v15);
    [v3 setInterruptionHandler:v8];
    _Block_release(v8);
    unint64_t v19 = (unint64_t)sub_10014A13C;
    uint64_t v20 = 0;
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 1107296256;
    uint64_t v17 = sub_10002437C;
    int v18 = (ValueMetadata *)&unk_1001CE4A8;
    uint64_t v9 = _Block_copy(&v15);
    [v3 setInvalidationHandler:v9];
    _Block_release(v9);
    [v3 resume];
    type metadata accessor for TokenHandoffServiceConnection();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v3;
  }
  else
  {
    if (qword_1001E4C50 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_100012E74(v11, (uint64_t)static Logger.xpc);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Service feature flag is not enabled", v14, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  return result;
}

uint64_t sub_10015AC9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10015ACAC()
{
  return swift_release();
}

uint64_t Logger.xpc.unsafeMutableAddressor()
{
  return sub_10015B224(&qword_1001E4C50, (uint64_t)static Logger.xpc);
}

void *Logger.aakSubsystem.unsafeMutableAddressor()
{
  return &static Logger.aakSubsystem;
}

unint64_t static Logger.aakSubsystem.getter()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_10015AD08(uint64_t a1)
{
  return sub_10015B188(a1, static Logger.general);
}

uint64_t Logger.general.unsafeMutableAddressor()
{
  return sub_10015B224(&qword_1001E4C40, (uint64_t)static Logger.general);
}

uint64_t static Logger.general.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10015B29C(&qword_1001E4C40, (uint64_t)static Logger.general, a1);
}

uint64_t sub_10015AD70(uint64_t a1)
{
  return sub_10015B188(a1, static Logger.impression);
}

uint64_t Logger.impression.unsafeMutableAddressor()
{
  return sub_10015B224(&qword_1001E4C48, (uint64_t)static Logger.impression);
}

uint64_t static Logger.impression.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10015B29C(&qword_1001E4C48, (uint64_t)static Logger.impression, a1);
}

uint64_t sub_10015ADDC(uint64_t a1)
{
  return sub_10015B188(a1, static Logger.xpc);
}

uint64_t static Logger.xpc.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10015B29C(&qword_1001E4C50, (uint64_t)static Logger.xpc, a1);
}

uint64_t sub_10015AE18(uint64_t a1)
{
  return sub_10015B188(a1, static Logger.network);
}

uint64_t Logger.network.unsafeMutableAddressor()
{
  return sub_10015B224(&qword_1001E4C58, (uint64_t)static Logger.network);
}

uint64_t static Logger.network.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10015B29C(&qword_1001E4C58, (uint64_t)static Logger.network, a1);
}

uint64_t sub_10015AE80(uint64_t a1)
{
  return sub_10015B188(a1, static Logger.daemon);
}

uint64_t Logger.daemon.unsafeMutableAddressor()
{
  return sub_10015B224(&qword_1001E4C60, (uint64_t)static Logger.daemon);
}

uint64_t static Logger.daemon.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10015B29C(&qword_1001E4C60, (uint64_t)static Logger.daemon, a1);
}

uint64_t sub_10015AEE4(uint64_t a1)
{
  return sub_10015B188(a1, static Logger.sql);
}

uint64_t Logger.sql.unsafeMutableAddressor()
{
  return sub_10015B224(&qword_1001E4C68, (uint64_t)static Logger.sql);
}

uint64_t static Logger.sql.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10015B29C(&qword_1001E4C68, (uint64_t)static Logger.sql, a1);
}

uint64_t sub_10015AF44(uint64_t a1)
{
  return sub_10015B188(a1, static Logger.impressionIntake);
}

uint64_t Logger.impressionIntake.unsafeMutableAddressor()
{
  return sub_10015B224(&qword_1001E4C70, (uint64_t)static Logger.impressionIntake);
}

uint64_t static Logger.impressionIntake.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10015B29C(&qword_1001E4C70, (uint64_t)static Logger.impressionIntake, a1);
}

uint64_t sub_10015AFB0(uint64_t a1)
{
  return sub_10015B188(a1, static Logger.token);
}

uint64_t Logger.token.unsafeMutableAddressor()
{
  return sub_10015B224(&qword_1001E4C78, (uint64_t)static Logger.token);
}

uint64_t static Logger.token.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10015B29C(&qword_1001E4C78, (uint64_t)static Logger.token, a1);
}

uint64_t sub_10015B014(uint64_t a1)
{
  return sub_10015B188(a1, static Logger.postback);
}

uint64_t Logger.postback.unsafeMutableAddressor()
{
  return sub_10015B224(&qword_1001E4C80, (uint64_t)static Logger.postback);
}

uint64_t static Logger.postback.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10015B29C(&qword_1001E4C80, (uint64_t)static Logger.postback, a1);
}

uint64_t sub_10015B07C(uint64_t a1)
{
  return sub_10015B188(a1, static Logger.ghostback);
}

uint64_t Logger.ghostback.unsafeMutableAddressor()
{
  return sub_10015B224(&qword_1001E4C88, (uint64_t)static Logger.ghostback);
}

uint64_t static Logger.ghostback.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10015B29C(&qword_1001E4C88, (uint64_t)static Logger.ghostback, a1);
}

uint64_t sub_10015B0E8(uint64_t a1)
{
  return sub_10015B188(a1, static Logger.developerMode);
}

uint64_t Logger.developerMode.unsafeMutableAddressor()
{
  return sub_10015B224(&qword_1001E4C90, (uint64_t)static Logger.developerMode);
}

uint64_t static Logger.developerMode.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10015B29C(&qword_1001E4C90, (uint64_t)static Logger.developerMode, a1);
}

uint64_t sub_10015B15C(uint64_t a1)
{
  return sub_10015B188(a1, static Logger.purchaseIntake);
}

uint64_t sub_10015B188(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_10002ADAC(v3, a2);
  sub_100012E74(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.purchaseIntake.unsafeMutableAddressor()
{
  return sub_10015B224(&qword_1001E4C98, (uint64_t)static Logger.purchaseIntake);
}

uint64_t sub_10015B224(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();

  return sub_100012E74(v3, a2);
}

uint64_t static Logger.purchaseIntake.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10015B29C(&qword_1001E4C98, (uint64_t)static Logger.purchaseIntake, a1);
}

uint64_t sub_10015B29C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = sub_100012E74(v5, a2);
  id v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for XPCServiceConnection()
{
  return self;
}

uint64_t sub_10015B358(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 4931905;
    }
    else {
      uint64_t v3 = 1162891086;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE300000000000000;
    }
    else {
      unint64_t v4 = 0xE400000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 4931905;
      }
      else {
        uint64_t v6 = 1162891086;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE300000000000000;
      }
      else {
        unint64_t v7 = 0xE400000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE300000000000000;
    uint64_t v3 = 5129543;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE300000000000000;
  if (v3 != 5129543)
  {
LABEL_21:
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
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

uint64_t sub_10015B444(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 7827308;
    }
    else {
      uint64_t v3 = 0x6D756964656DLL;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE300000000000000;
    }
    else {
      unint64_t v4 = 0xE600000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 7827308;
      }
      else {
        uint64_t v6 = 0x6D756964656DLL;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE300000000000000;
      }
      else {
        unint64_t v7 = 0xE600000000000000;
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
    uint64_t v3 = 1751607656;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE400000000000000;
  if (v3 != 1751607656)
  {
LABEL_21:
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
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

uint64_t sub_10015B538(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000015;
  unint64_t v3 = 0x8000000100184AE0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000015;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000019;
      uint64_t v6 = "publisher-item-identifier";
      goto LABEL_9;
    case 2:
      unint64_t v5 = 0xD00000000000001ALL;
      uint64_t v6 = "advertised-item-identifier";
      goto LABEL_9;
    case 3:
      unint64_t v5 = 0xD000000000000011;
      uint64_t v6 = "source-identifier";
      goto LABEL_9;
    case 4:
      unint64_t v5 = 0x6D617473656D6974;
      unint64_t v3 = 0xE900000000000070;
      break;
    case 5:
      unint64_t v5 = 0x6973736572706D69;
      unint64_t v3 = 0xEF657079742D6E6FLL;
      break;
    case 6:
      uint64_t v6 = "ad-network-identifier";
      goto LABEL_9;
    case 7:
      unint64_t v5 = 0xD00000000000001ALL;
      uint64_t v6 = "eligible-for-re-engagement";
LABEL_9:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x8000000100184AE0;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD000000000000019;
      char v8 = "publisher-item-identifier";
      goto LABEL_18;
    case 2:
      unint64_t v2 = 0xD00000000000001ALL;
      char v8 = "advertised-item-identifier";
      goto LABEL_18;
    case 3:
      unint64_t v2 = 0xD000000000000011;
      char v8 = "source-identifier";
      goto LABEL_18;
    case 4:
      unint64_t v2 = 0x6D617473656D6974;
      unint64_t v7 = 0xE900000000000070;
      break;
    case 5:
      unint64_t v2 = 0x6973736572706D69;
      unint64_t v7 = 0xEF657079742D6E6FLL;
      break;
    case 6:
      char v8 = "ad-network-identifier";
      goto LABEL_18;
    case 7:
      unint64_t v2 = 0xD00000000000001ALL;
      char v8 = "eligible-for-re-engagement";
LABEL_18:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_10015B76C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x69746375646F7270;
  }
  else {
    uint64_t v3 = 0x6D706F6C65766564;
  }
  if (v2) {
    unint64_t v4 = 0xEB00000000746E65;
  }
  else {
    unint64_t v4 = 0xEA00000000006E6FLL;
  }
  if (a2) {
    uint64_t v5 = 0x69746375646F7270;
  }
  else {
    uint64_t v5 = 0x6D706F6C65766564;
  }
  if (a2) {
    unint64_t v6 = 0xEA00000000006E6FLL;
  }
  else {
    unint64_t v6 = 0xEB00000000746E65;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_10015B820(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x6F6C6E776F646572;
    }
    else {
      uint64_t v3 = 0x6761676E652D6572;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEA00000000006461;
    }
    else {
      unint64_t v4 = 0xED0000746E656D65;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x6F6C6E776F646572;
      }
      else {
        uint64_t v6 = 0x6761676E652D6572;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xEA00000000006461;
      }
      else {
        unint64_t v7 = 0xED0000746E656D65;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE800000000000000;
    uint64_t v3 = 0x64616F6C6E776F64;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE800000000000000;
  if (v3 != 0x64616F6C6E776F64)
  {
LABEL_21:
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
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

uint64_t sub_10015B95C()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10015BA84()
{
  return Hasher._finalize()();
}

uint64_t sub_10015BBC8@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1001CCFC8, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

uint64_t sub_10015BC28@<X0>(Swift::String string@<0:X0, 8:X1>, char *a2@<X8>)
{
  object = string._object;
  v3._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1001CCFC8, v3);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

uint64_t sub_10015BC8C(uint64_t a1)
{
  unint64_t v2 = sub_10015D3BC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10015BCC8(uint64_t a1)
{
  unint64_t v2 = sub_10015D3BC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t AppImpressionHeader.init(from:)(void *a1)
{
  uint64_t result = sub_10015C658(a1);
  if (v1) {
    return v3;
  }
  return result;
}

uint64_t sub_10015BD30@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10015C658(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t AppImpressionPayload.impressionID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for UUID();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t AppImpressionPayload.publisherItemID.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 20));
}

uint64_t AppImpressionPayload.advertisedItemID.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 24));
}

uint64_t AppImpressionPayload.sourceID.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 28));
}

uint64_t AppImpressionPayload.timestamp.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 32));
}

uint64_t AppImpressionPayload.adNetworkID.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppImpressionPayload.eligibleForReengagement.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for AppImpressionPayload() + 44));
}

unint64_t sub_10015BEBC(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000019;
      break;
    case 2:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x6D617473656D6974;
      break;
    case 5:
      unint64_t result = 0x6973736572706D69;
      break;
    case 7:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_10015BFB0(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000019;
      break;
    case 2:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x6D617473656D6974;
      break;
    case 5:
      unint64_t result = 0x6973736572706D69;
      break;
    case 7:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10015C0A4(unsigned __int8 *a1, char *a2)
{
  return sub_10015B538(*a1, *a2);
}

Swift::Int sub_10015C0B0()
{
  return sub_10015BA84();
}

uint64_t sub_10015C0BC()
{
  return sub_10015B95C();
}

Swift::Int sub_10015C0C4()
{
  return sub_10015BA84();
}

unint64_t sub_10015C0CC@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10015D370(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_10015C0FC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10015BEBC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10015C128()
{
  return sub_10015BFB0(*v0);
}

unint64_t sub_10015C130@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10015D370(a1);
  *a2 = result;
  return result;
}

uint64_t sub_10015C158(uint64_t a1)
{
  unint64_t v2 = sub_10015C8AC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10015C194(uint64_t a1)
{
  unint64_t v2 = sub_10015C8AC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t AppImpressionPayload.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v22 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100012960(&qword_1001E5350);
  uint64_t v21 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v8 = (int *)type metadata accessor for AppImpressionPayload();
  __chkstk_darwin(v8);
  char v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_10015C8AC();
  int v24 = v7;
  uint64_t v11 = v25;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v11) {
    return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  }
  uint64_t v12 = v22;
  char v33 = 0;
  sub_10015C900();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v10, v5, v3);
  char v32 = 1;
  *(void *)&v10[v8[5]] = KeyedDecodingContainer.decode(_:forKey:)();
  char v31 = 2;
  *(void *)&v10[v8[6]] = KeyedDecodingContainer.decode(_:forKey:)();
  char v30 = 3;
  uint64_t v13 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v14 = v21;
  *(void *)&v10[v8[7]] = v13;
  char v29 = 4;
  *(void *)&v10[v8[8]] = KeyedDecodingContainer.decode(_:forKey:)();
  char v28 = 5;
  sub_10015C958();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  char v27 = 6;
  uint64_t v15 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v16 = (uint64_t *)&v10[v8[10]];
  *uint64_t v16 = v15;
  v16[1] = v17;
  char v26 = 7;
  char v18 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v24, v23);
  v10[v8[11]] = v18;
  sub_10015C9AC((uint64_t)v10, v20);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  return sub_10015CA10((uint64_t)v10);
}

uint64_t sub_10015C640@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AppImpressionPayload.init(from:)(a1, a2);
}

uint64_t sub_10015C658(void *a1)
{
  uint64_t v3 = sub_100012960(&qword_1001E5428);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[4];
  sub_100012D78(a1, a1[3]);
  sub_10015D3BC();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  }
  else
  {
    char v11 = 0;
    uint64_t v7 = KeyedDecodingContainer.decode(_:forKey:)();
    char v10 = 1;
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t type metadata accessor for AppImpressionPayload()
{
  uint64_t result = qword_1001E53C0;
  if (!qword_1001E53C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_10015C8AC()
{
  unint64_t result = qword_1001E5358;
  if (!qword_1001E5358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5358);
  }
  return result;
}

unint64_t sub_10015C900()
{
  unint64_t result = qword_1001E0CF0;
  if (!qword_1001E0CF0)
  {
    type metadata accessor for UUID();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E0CF0);
  }
  return result;
}

unint64_t sub_10015C958()
{
  unint64_t result = qword_1001E5360;
  if (!qword_1001E5360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5360);
  }
  return result;
}

uint64_t sub_10015C9AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppImpressionPayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10015CA10(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AppImpressionPayload();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for AppImpressionHeader()
{
  return &type metadata for AppImpressionHeader;
}

void *initializeBufferWithCopyOfBuffer for AppImpressionPayload(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for UUID();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
    uint64_t v9 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    *(void *)((char *)a1 + v9) = *(void *)((char *)a2 + v9);
    uint64_t v10 = a3[10];
    uint64_t v11 = a3[11];
    uint64_t v12 = (void *)((char *)a1 + v10);
    uint64_t v13 = (void *)((char *)a2 + v10);
    uint64_t v14 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
    *((unsigned char *)a1 + v11) = *((unsigned char *)a2 + v11);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for AppImpressionPayload(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AppImpressionPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  uint64_t v10 = a3[11];
  uint64_t v11 = (void *)(a1 + v9);
  uint64_t v12 = (void *)(a2 + v9);
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  *(unsigned char *)(a1 + v10) = *(unsigned char *)(a2 + v10);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppImpressionPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  uint64_t v7 = a3[10];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t initializeWithTake for AppImpressionPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  return a1;
}

uint64_t assignWithTake for AppImpressionPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (uint64_t *)(a2 + v9);
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  *uint64_t v10 = v13;
  v10[1] = v12;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppImpressionPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10015CF0C);
}

uint64_t sub_10015CF0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 40) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for AppImpressionPayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10015CFE4);
}

uint64_t sub_10015CFE4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 40) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_10015D0A4()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AppImpressionPayload.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10015D230);
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

ValueMetadata *type metadata accessor for AppImpressionPayload.CodingKeys()
{
  return &type metadata for AppImpressionPayload.CodingKeys;
}

unint64_t sub_10015D26C()
{
  unint64_t result = qword_1001E5410;
  if (!qword_1001E5410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5410);
  }
  return result;
}

unint64_t sub_10015D2C4()
{
  unint64_t result = qword_1001E5418;
  if (!qword_1001E5418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5418);
  }
  return result;
}

unint64_t sub_10015D31C()
{
  unint64_t result = qword_1001E5420;
  if (!qword_1001E5420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5420);
  }
  return result;
}

unint64_t sub_10015D370(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1001CD018, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 8) {
    return 8;
  }
  else {
    return v3;
  }
}

unint64_t sub_10015D3BC()
{
  unint64_t result = qword_1001E5430;
  if (!qword_1001E5430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5430);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AppImpressionHeader.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10015D4DCLL);
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

ValueMetadata *type metadata accessor for AppImpressionHeader.CodingKeys()
{
  return &type metadata for AppImpressionHeader.CodingKeys;
}

unint64_t sub_10015D518()
{
  unint64_t result = qword_1001E5438;
  if (!qword_1001E5438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5438);
  }
  return result;
}

unint64_t sub_10015D570()
{
  unint64_t result = qword_1001E5440;
  if (!qword_1001E5440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5440);
  }
  return result;
}

unint64_t sub_10015D5C8()
{
  unint64_t result = qword_1001E5448;
  if (!qword_1001E5448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5448);
  }
  return result;
}

uint64_t static ConversionType.allCasesSet.getter()
{
  return sub_10015E894((uint64_t)&off_1001CD0F8);
}

_UNKNOWN **static ConversionType.allCases.getter()
{
  return &off_1001CD120;
}

uint64_t ConversionType.isInstall.getter(char a1)
{
  if (!a1)
  {
    char v3 = 1;
LABEL_8:
    swift_bridgeObjectRelease();
    return v3 & 1;
  }
  char v2 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((v2 & 1) == 0)
  {
    if (a1 == 2) {
      char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    else {
      char v3 = 1;
    }
    goto LABEL_8;
  }
  char v3 = 1;
  return v3 & 1;
}

uint64_t ConversionType.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x64616F6C6E776F64;
  }
  if (a1 == 1) {
    return 0x6F6C6E776F646572;
  }
  return 0x6761676E652D6572;
}

uint64_t sub_10015D7CC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10015B820(*a1, *a2);
}

Swift::Int sub_10015D7D8()
{
  return Hasher._finalize()();
}

uint64_t sub_10015D88C()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10015D92C()
{
  return Hasher._finalize()();
}

unint64_t sub_10015D9DC@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = _s20AttributionKitCommon14ConversionTypeO8rawValueACSgSS_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_10015DA0C(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE800000000000000;
  unint64_t v4 = 0xEA00000000006461;
  uint64_t v5 = 0x6F6C6E776F646572;
  if (v2 != 1)
  {
    uint64_t v5 = 0x6761676E652D6572;
    unint64_t v4 = 0xED0000746E656D65;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x64616F6C6E776F64;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_10015DA7C()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10015DADC()
{
  return RawRepresentable<>.encode(to:)();
}

void sub_10015DB2C(void *a1@<X8>)
{
  *a1 = &off_1001CD148;
}

uint64_t sub_10015DB3C(unsigned char *a1, Swift::Int a2)
{
  uint64_t v5 = *v2;
  Hasher.init(_seed:)();
  char v18 = v2;
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v6 = Hasher._finalize()();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *v18;
    *char v18 = 0x8000000000000000;
    sub_10015E138(a2, v8, isUniquelyReferenced_nonNull_native);
    *char v18 = v19;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_24;
  }
  uint64_t v9 = ~v7;
  while (!*(unsigned char *)(*(void *)(v5 + 48) + v8))
  {
    unint64_t v11 = 0xE800000000000000;
    uint64_t v10 = 0x64616F6C6E776F64;
    int v12 = a2;
    if (!(_BYTE)a2) {
      goto LABEL_17;
    }
LABEL_8:
    if (v12 == 1) {
      uint64_t v13 = 0x6F6C6E776F646572;
    }
    else {
      uint64_t v13 = 0x6761676E652D6572;
    }
    if (v12 == 1) {
      unint64_t v14 = 0xEA00000000006461;
    }
    else {
      unint64_t v14 = 0xED0000746E656D65;
    }
    if (v10 == v13) {
      goto LABEL_18;
    }
LABEL_19:
    char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v15) {
      goto LABEL_23;
    }
    unint64_t v8 = (v8 + 1) & v9;
    if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)(*(void *)(v5 + 48) + v8) == 1)
  {
    uint64_t v10 = 0x6F6C6E776F646572;
    unint64_t v11 = 0xEA00000000006461;
    int v12 = a2;
    if (!(_BYTE)a2) {
      goto LABEL_17;
    }
    goto LABEL_8;
  }
  uint64_t v10 = 0x6761676E652D6572;
  unint64_t v11 = 0xED0000746E656D65;
  int v12 = a2;
  if ((_BYTE)a2) {
    goto LABEL_8;
  }
LABEL_17:
  unint64_t v14 = 0xE800000000000000;
  if (v10 != 0x64616F6C6E776F64) {
    goto LABEL_19;
  }
LABEL_18:
  if (v11 != v14) {
    goto LABEL_19;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_23:
  swift_bridgeObjectRelease();
  uint64_t result = 0;
  LOBYTE(a2) = *(unsigned char *)(*(void *)(*v18 + 48) + v8);
LABEL_24:
  *a1 = a2;
  return result;
}

uint64_t sub_10015DE14()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100012960(&qword_1001E5470);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    Swift::Int v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
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
                unint64_t v1 = v0;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *Swift::Int v6 = -1 << v27;
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
      char v19 = *(unsigned char *)(*(void *)(v2 + 48) + v15);
      Hasher.init(_seed:)();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      uint64_t result = Hasher._finalize()();
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
      *(unsigned char *)(*(void *)(v4 + 48) + v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v1 = v4;
  return result;
}

Swift::Int sub_10015E138(Swift::Int result, unint64_t a2, char a3)
{
  unsigned __int8 v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_10015DE14();
    }
    else
    {
      if (v7 > v6)
      {
        uint64_t result = (Swift::Int)sub_10015E410();
        goto LABEL_28;
      }
      sub_10015E5A4();
    }
    uint64_t v8 = *v3;
    Hasher.init(_seed:)();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    uint64_t result = Hasher._finalize()();
    uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
    a2 = result & ~v9;
    if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v10 = ~v9;
      do
      {
        if (*(unsigned char *)(*(void *)(v8 + 48) + a2))
        {
          if (*(unsigned char *)(*(void *)(v8 + 48) + a2) == 1)
          {
            uint64_t v11 = 0x6F6C6E776F646572;
            unint64_t v12 = 0xEA00000000006461;
            int v13 = v5;
            if (!v5) {
              goto LABEL_24;
            }
          }
          else
          {
            uint64_t v11 = 0x6761676E652D6572;
            unint64_t v12 = 0xED0000746E656D65;
            int v13 = v5;
            if (!v5)
            {
LABEL_24:
              unint64_t v15 = 0xE800000000000000;
              if (v11 == 0x64616F6C6E776F64) {
                goto LABEL_25;
              }
              goto LABEL_26;
            }
          }
        }
        else
        {
          unint64_t v12 = 0xE800000000000000;
          uint64_t v11 = 0x64616F6C6E776F64;
          int v13 = v5;
          if (!v5) {
            goto LABEL_24;
          }
        }
        if (v13 == 1) {
          uint64_t v14 = 0x6F6C6E776F646572;
        }
        else {
          uint64_t v14 = 0x6761676E652D6572;
        }
        if (v13 == 1) {
          unint64_t v15 = 0xEA00000000006461;
        }
        else {
          unint64_t v15 = 0xED0000746E656D65;
        }
        if (v11 == v14)
        {
LABEL_25:
          if (v12 == v15) {
            goto LABEL_31;
          }
        }
LABEL_26:
        char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v16) {
          goto LABEL_32;
        }
        a2 = (a2 + 1) & v10;
      }
      while (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
    }
  }
LABEL_28:
  uint64_t v17 = *v21;
  *(void *)(*v21 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v17 + 48) + a2) = v5;
  uint64_t v18 = *(void *)(v17 + 16);
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19)
  {
    __break(1u);
LABEL_31:
    swift_bridgeObjectRelease_n();
LABEL_32:
    uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
  else
  {
    *(void *)(v17 + 16) = v20;
  }
  return result;
}

void *sub_10015E410()
{
  unint64_t v1 = v0;
  sub_100012960(&qword_1001E5470);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10015E5A4()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100012960(&qword_1001E5470);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *unint64_t v1 = v4;
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
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
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
    char v19 = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    Hasher.init(_seed:)();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    uint64_t result = Hasher._finalize()();
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
    *(unsigned char *)(*(void *)(v4 + 48) + v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    unint64_t v1 = v0;
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

uint64_t sub_10015E894(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_10015EB10();
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (unsigned __int8 *)(a1 + 32);
    do
    {
      unsigned int v5 = *v4++;
      sub_10015DB3C(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

unint64_t _s20AttributionKitCommon14ConversionTypeO8rawValueACSgSS_tcfC_0(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1001C1078, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

unint64_t sub_10015E958()
{
  unint64_t result = qword_1001E5450;
  if (!qword_1001E5450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5450);
  }
  return result;
}

unint64_t sub_10015E9B0()
{
  unint64_t result = qword_1001E5458;
  if (!qword_1001E5458)
  {
    sub_100011ECC(&qword_1001E5460);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5458);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ConversionType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10015EAD8);
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

ValueMetadata *type metadata accessor for ConversionType()
{
  return &type metadata for ConversionType;
}

unint64_t sub_10015EB10()
{
  unint64_t result = qword_1001E5468;
  if (!qword_1001E5468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5468);
  }
  return result;
}

AttributionKitCommon::SystemEnvironment_optional __swiftcall SystemEnvironment.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v2._uint64_t countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1001CD170, v2);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    v4.value = AttributionKitCommon_SystemEnvironment_production;
  }
  else {
    v4.value = AttributionKitCommon_SystemEnvironment_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t SystemEnvironment.rawValue.getter(char a1)
{
  if (a1) {
    return 0x69746375646F7270;
  }
  else {
    return 0x6D706F6C65766564;
  }
}

uint64_t sub_10015EBFC(char *a1, char *a2)
{
  return sub_10015B76C(*a1, *a2);
}

unint64_t sub_10015EC0C()
{
  unint64_t result = qword_1001E5478;
  if (!qword_1001E5478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5478);
  }
  return result;
}

Swift::Int sub_10015EC60()
{
  return Hasher._finalize()();
}

uint64_t sub_10015ECF0()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10015ED6C()
{
  return Hasher._finalize()();
}

uint64_t sub_10015EDF8@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1001CD170, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

void sub_10015EE58(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6D706F6C65766564;
  if (*v1) {
    uint64_t v2 = 0x69746375646F7270;
  }
  unint64_t v3 = 0xEB00000000746E65;
  if (*v1) {
    unint64_t v3 = 0xEA00000000006E6FLL;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_10015EEA4()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10015EF04()
{
  return RawRepresentable<>.encode(to:)();
}

unsigned char *storeEnumTagSinglePayload for SystemEnvironment(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10015F020);
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

ValueMetadata *type metadata accessor for SystemEnvironment()
{
  return &type metadata for SystemEnvironment;
}

unint64_t sub_10015F058()
{
  unint64_t result = qword_1001E5480;
  if (!qword_1001E5480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5480);
  }
  return result;
}

uint64_t sub_10015F0AC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void))
{
  return a6(*a1);
}

uint64_t PurchaseIntakeRequest.inAppPurchaseDetails.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1000B71A4(v1, a1);
}

uint64_t PurchaseIntakeRequest.init(inAppPurchaseDetails:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10015FAD8(a1, a2, (uint64_t (*)(void))type metadata accessor for InAppPurchaseDetails);
}

uint64_t PurchaseIntakeRequest.processInAppPurchase(appItemID:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return _swift_task_switch(sub_10015F134, 0, 0);
}

uint64_t sub_10015F134()
{
  if (qword_1001E4C38 != -1) {
    swift_once();
  }
  if (qword_1001E6100)
  {
    uint64_t v1 = v0[2];
    uint64_t v2 = swift_task_alloc();
    v0[4] = v2;
    *(void *)(v2 + 16) = v1;
    uint64_t v3 = swift_task_alloc();
    v0[5] = v3;
    *(void *)(v3 + 16) = sub_10015F578;
    *(void *)(v3 + 24) = v2;
    unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1001E5048 + dword_1001E5048);
    unsigned int v4 = (void *)swift_task_alloc();
    v0[6] = v4;
    *unsigned int v4 = v0;
    v4[1] = sub_10015F2A8;
    uint64_t v5 = v0[3];
    return v8(v5, (uint64_t)sub_100151570, v3);
  }
  else
  {
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
}

uint64_t sub_10015F2A8()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10015F428;
  }
  else {
    uint64_t v2 = sub_10015F3BC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10015F3BC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10015F428()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_10015F494(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v12[4] = a4;
  v12[5] = a5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10016FE18;
  uint64_t v12[3] = &unk_1001CE830;
  uint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  [a1 processInAppPurchaseWithAppItemID:a6 requestData:isa reply:v11];
  _Block_release(v11);
}

void sub_10015F578(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_10015F494(a1, a2, a3, a4, a5, *(void *)(v5 + 16));
}

unint64_t sub_10015F580()
{
  return 0xD000000000000014;
}

uint64_t sub_10015F59C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100160490(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10015F5C8(uint64_t a1)
{
  unint64_t v2 = sub_10015F7A0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10015F604(uint64_t a1)
{
  unint64_t v2 = sub_10015F7A0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t PurchaseIntakeRequest.encode(to:)(void *a1)
{
  uint64_t v2 = sub_100012960(&qword_1001E5490);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_10015F7A0();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  type metadata accessor for InAppPurchaseDetails();
  sub_10015FA94(&qword_1001E54A0);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_10015F7A0()
{
  unint64_t result = qword_1001E5498;
  if (!qword_1001E5498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5498);
  }
  return result;
}

uint64_t PurchaseIntakeRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v13 = a2;
  uint64_t v4 = type metadata accessor for InAppPurchaseDetails();
  __chkstk_darwin(v4);
  uint64_t v15 = (uint64_t)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100012960(&qword_1001E54A8);
  uint64_t v14 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PurchaseIntakeRequest();
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_10015F7A0();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    sub_10015FA94(&qword_1001E54B0);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v6);
    sub_10015FAD8(v15, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for InAppPurchaseDetails);
    sub_10015FAD8((uint64_t)v11, v13, (uint64_t (*)(void))type metadata accessor for PurchaseIntakeRequest);
  }
  return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
}

uint64_t type metadata accessor for PurchaseIntakeRequest()
{
  uint64_t result = qword_1001E5510;
  if (!qword_1001E5510) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10015FA94(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for InAppPurchaseDetails();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10015FAD8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10015FB40@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PurchaseIntakeRequest.init(from:)(a1, a2);
}

uint64_t initializeBufferWithCopyOfBuffer for PurchaseIntakeRequest(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for InAppPurchaseDetails();
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *(void *)a1 = *a2;
    a1 = v18 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
    uint64_t v7 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v7;
    uint64_t v8 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v8;
    uint64_t v9 = *(int *)(v4 + 28);
    uint64_t v10 = a1 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    uint64_t v12 = type metadata accessor for Date();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    *(unsigned char *)(a1 + *(int *)(v6 + 32)) = *((unsigned char *)a2 + *(int *)(v6 + 32));
    uint64_t v14 = *(int *)(v6 + 36);
    uint64_t v15 = (void *)(a1 + v14);
    int64_t v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for PurchaseIntakeRequest(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = a1 + *(int *)(type metadata accessor for InAppPurchaseDetails() + 28);
  uint64_t v3 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PurchaseIntakeRequest(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = (int *)type metadata accessor for InAppPurchaseDetails();
  uint64_t v7 = v6[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  *(unsigned char *)(a1 + v6[8]) = *(unsigned char *)(a2 + v6[8]);
  uint64_t v12 = v6[9];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  uint64_t v15 = v14[1];
  void *v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PurchaseIntakeRequest(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  *(_WORD *)(a1 + 6) = *(_WORD *)(a2 + 6);
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
  *(_WORD *)(a1 + 12) = *(_WORD *)(a2 + 12);
  *(_WORD *)(a1 + 14) = *(_WORD *)(a2 + 14);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_WORD *)(a1 + 18) = *(_WORD *)(a2 + 18);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)type metadata accessor for InAppPurchaseDetails();
  uint64_t v5 = v4[7];
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 24))(v6, v7, v8);
  *(unsigned char *)(a1 + v4[8]) = *(unsigned char *)(a2 + v4[8]);
  uint64_t v9 = v4[9];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  *uint64_t v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for PurchaseIntakeRequest(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v4 = (int *)type metadata accessor for InAppPurchaseDetails();
  uint64_t v5 = v4[7];
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  *(unsigned char *)(a1 + v4[8]) = *(unsigned char *)(a2 + v4[8]);
  *(_OWORD *)(a1 + v4[9]) = *(_OWORD *)(a2 + v4[9]);
  return a1;
}

uint64_t assignWithTake for PurchaseIntakeRequest(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 4) = *(_OWORD *)(a2 + 4);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)type metadata accessor for InAppPurchaseDetails();
  uint64_t v7 = v6[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(unsigned char *)(a1 + v6[8]) = *(unsigned char *)(a2 + v6[8]);
  uint64_t v11 = v6[9];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PurchaseIntakeRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100160138);
}

uint64_t sub_100160138(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InAppPurchaseDetails();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for PurchaseIntakeRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001601B8);
}

uint64_t sub_1001601B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InAppPurchaseDetails();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_100160228()
{
  uint64_t result = type metadata accessor for InAppPurchaseDetails();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PurchaseIntakeRequest.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100160350);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PurchaseIntakeRequest.CodingKeys()
{
  return &type metadata for PurchaseIntakeRequest.CodingKeys;
}

unint64_t sub_10016038C()
{
  unint64_t result = qword_1001E5548;
  if (!qword_1001E5548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5548);
  }
  return result;
}

unint64_t sub_1001603E4()
{
  unint64_t result = qword_1001E5550;
  if (!qword_1001E5550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5550);
  }
  return result;
}

unint64_t sub_10016043C()
{
  unint64_t result = qword_1001E5558;
  if (!qword_1001E5558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5558);
  }
  return result;
}

uint64_t sub_100160490(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x80000001001888F0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_100160518(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100160528()
{
  return swift_release();
}

Swift::String *TokenHandoffServiceMachName.unsafeMutableAddressor()
{
  return &TokenHandoffServiceMachName;
}

void sub_10016053C(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = *a1;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v10[4] = a4;
  v10[5] = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  void v10[2] = sub_10016FE18;
  v10[3] = &unk_1001CE980;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  [v7 updateConversionValue:isa reply:v9];
  _Block_release(v9);
}

uint64_t PostbackUpdateTestingRequest.coarseCV.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> PostbackUpdateTestingRequest.updateConversionValue()()
{
  unsigned int v4 = v3;
  uint64_t v5 = v2;
  char v6 = v1;
  uint64_t v7 = v0;
  if (qword_1001E4C30 != -1) {
    swift_once();
  }
  if (qword_1001E60F8) {
    sub_1001538B0(v7, v6, v5, v4, (void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(), uint64_t))sub_10016053C);
  }
}

uint64_t sub_1001606D4()
{
  uint64_t v1 = 0x5643657372616F63;
  if (*v0 != 1) {
    uint64_t v1 = 0x7542746E65696C63;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x5643656E6966;
  }
}

uint64_t sub_100160738@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100160A6C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100160760(uint64_t a1)
{
  unint64_t v2 = sub_100160998();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10016079C(uint64_t a1)
{
  unint64_t v2 = sub_100160998();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t PostbackUpdateTestingRequest.encode(to:)(void *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  v12[1] = a5;
  int v13 = a3;
  uint64_t v7 = sub_100012960(&qword_1001E5560);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_100160998();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v17 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v5)
  {
    char v16 = v13;
    char v15 = 1;
    sub_10005D678();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    char v14 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

unint64_t sub_100160998()
{
  unint64_t result = qword_1001E5568;
  if (!qword_1001E5568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5568);
  }
  return result;
}

uint64_t PostbackUpdateTestingRequest.init(from:)(void *a1)
{
  uint64_t result = sub_100160BE0(a1);
  if (v1) {
    return v3;
  }
  return result;
}

uint64_t sub_100160A14@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100160BE0(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(unsigned char *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
    *(void *)(a2 + 24) = v7;
  }
  return result;
}

uint64_t sub_100160A48(void *a1)
{
  return PostbackUpdateTestingRequest.encode(to:)(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100160A6C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x5643656E6966 && a2 == 0xE600000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5643657372616F63 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7542746E65696C63 && a2 == 0xEE004449656C646ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_100160BE0(void *a1)
{
  uint64_t v3 = sub_100012960(&qword_1001E5588);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  sub_100012D78(a1, v7);
  sub_100160998();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    char v12 = 0;
    uint64_t v7 = KeyedDecodingContainer.decode(_:forKey:)();
    char v11 = 1;
    sub_10005D4F8();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    char v10 = 2;
    KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  return v7;
}

uint64_t initializeWithCopy for PostbackUpdateTestingRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PostbackUpdateTestingRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PostbackUpdateTestingRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PostbackUpdateTestingRequest(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PostbackUpdateTestingRequest(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PostbackUpdateTestingRequest()
{
  return &type metadata for PostbackUpdateTestingRequest;
}

unsigned char *storeEnumTagSinglePayload for PostbackUpdateTestingRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10016100CLL);
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

ValueMetadata *type metadata accessor for PostbackUpdateTestingRequest.CodingKeys()
{
  return &type metadata for PostbackUpdateTestingRequest.CodingKeys;
}

unint64_t sub_100161048()
{
  unint64_t result = qword_1001E5570;
  if (!qword_1001E5570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5570);
  }
  return result;
}

unint64_t sub_1001610A0()
{
  unint64_t result = qword_1001E5578;
  if (!qword_1001E5578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5578);
  }
  return result;
}

unint64_t sub_1001610F8()
{
  unint64_t result = qword_1001E5580;
  if (!qword_1001E5580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5580);
  }
  return result;
}

uint64_t sub_10016114C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10016115C()
{
  return swift_release();
}

uint64_t sub_100161164()
{
  uint64_t result = sub_1001612B8();
  qword_1001E6228 = result;
  return result;
}

uint64_t sub_100161184()
{
  uint64_t v1 = v0;
  if (qword_1001E4C50 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100012E74(v2, (uint64_t)static Logger.xpc);
  int v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "deinitializing ServiceConnection", v5, 2u);
    swift_slowDealloc();
  }

  unsigned int v6 = *(void **)(v1 + 16);
  [v6 invalidate];

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ServiceConnection()
{
  return self;
}

uint64_t sub_1001612B8()
{
  unint64_t v22 = &type metadata for FeatureFlag;
  unint64_t v23 = sub_10014A6FC();
  LOBYTE(v19) = 0;
  char v0 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)&v19);
  if (v0)
  {
    if (qword_1001E4C50 != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    sub_100012E74(v1, (uint64_t)static Logger.xpc);
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v2, v3))
    {
      os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "initializing ServiceConnection", v4, 2u);
      swift_slowDealloc();
    }

    id v5 = objc_allocWithZone((Class)NSXPCConnection);
    NSString v6 = String._bridgeToObjectiveC()();
    id v7 = objc_msgSend(v5, "initWithMachServiceName:options:", v6, 0, v19);

    uint64_t v8 = self;
    id v9 = [v8 interfaceWithProtocol:&OBJC_PROTOCOL____TtP20AttributionKitCommon17XPCClientProtocol_];
    [v7 setExportedInterface:v9];

    id v10 = [objc_allocWithZone((Class)type metadata accessor for XPCClient()) init];
    [v7 setExportedObject:v10];

    id v11 = [v8 interfaceWithProtocol:&OBJC_PROTOCOL____TtP20AttributionKitCommon15ServiceProtocol_];
    [v7 setRemoteObjectInterface:v11];

    unint64_t v23 = (unint64_t)sub_10014A130;
    uint64_t v24 = 0;
    char v19 = _NSConcreteStackBlock;
    uint64_t v20 = 1107296256;
    unint64_t v21 = sub_10002437C;
    unint64_t v22 = (ValueMetadata *)&unk_1001CE9A8;
    char v12 = _Block_copy(&v19);
    [v7 setInterruptionHandler:v12];
    _Block_release(v12);
    unint64_t v23 = (unint64_t)sub_10014A13C;
    uint64_t v24 = 0;
    char v19 = _NSConcreteStackBlock;
    uint64_t v20 = 1107296256;
    unint64_t v21 = sub_10002437C;
    unint64_t v22 = (ValueMetadata *)&unk_1001CE9D0;
    int v13 = _Block_copy(&v19);
    [v7 setInvalidationHandler:v13];
    _Block_release(v13);
    [v7 resume];
    type metadata accessor for ServiceConnection();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v7;
  }
  else
  {
    if (qword_1001E4C50 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_100012E74(v15, (uint64_t)static Logger.xpc);
    char v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Service feature flag is not enabled", v18, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  return result;
}

uint64_t sub_10016169C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1001616AC()
{
  return swift_release();
}

uint64_t TokenHandoffRequest.handoffUTToken(advertisedItemID:tokenData:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v4 + 72) = a4;
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = a3;
  *(void *)(v4 + 16) = a1;
  return _swift_task_switch(sub_1001616E4, 0, 0);
}

uint64_t sub_1001616E4()
{
  if (qword_1001E4C38 != -1) {
    swift_once();
  }
  if (qword_1001E6100)
  {
    uint64_t v1 = *(void *)(v0 + 32);
    long long v8 = *(_OWORD *)(v0 + 16);
    uint64_t v2 = swift_task_alloc();
    *(void *)(v0 + 40) = v2;
    *(_OWORD *)(v2 + 16) = v8;
    *(void *)(v2 + 32) = v1;
    uint64_t v3 = swift_task_alloc();
    *(void *)(v0 + 48) = v3;
    *(void *)(v3 + 16) = sub_100161974;
    *(void *)(v3 + 24) = v2;
    id v9 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_1001E5030 + dword_1001E5030);
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_10014F0DC;
    char v5 = *(unsigned char *)(v0 + 72);
    return v9(v5, (uint64_t)sub_100161980, v3);
  }
  else
  {
    id v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

void sub_100161868(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  Class v11 = Data._bridgeToObjectiveC()().super.isa;
  v13[4] = a4;
  v13[5] = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10016FE18;
  v13[3] = &unk_1001CEB58;
  char v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  [a1 handoffTokenWithAdvertisedItemID:a6 tokenData:isa requestData:v11 reply:v12];
  _Block_release(v12);
}

void sub_100161974(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_100161868(a1, a2, a3, a4, a5, *(void *)(v5 + 16));
}

uint64_t sub_100161980(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10015F0AC(a1, a2, a3, a4, a5, *(uint64_t (**)(void))(v5 + 16));
}

uint64_t TokenHandoffRequest.handoffUTMetrics(advertisedItemID:eventsData:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v4 + 72) = a4;
  *(void *)(v4 + 24) = a2;
  *(void *)(v4 + 32) = a3;
  *(void *)(v4 + 16) = a1;
  return _swift_task_switch(sub_1001619B0, 0, 0);
}

uint64_t sub_1001619B0()
{
  if (qword_1001E4C38 != -1) {
    swift_once();
  }
  if (qword_1001E6100)
  {
    uint64_t v1 = *(void *)(v0 + 32);
    long long v8 = *(_OWORD *)(v0 + 16);
    uint64_t v2 = swift_task_alloc();
    *(void *)(v0 + 40) = v2;
    *(_OWORD *)(v2 + 16) = v8;
    *(void *)(v2 + 32) = v1;
    uint64_t v3 = swift_task_alloc();
    *(void *)(v0 + 48) = v3;
    *(void *)(v3 + 16) = sub_100161B34;
    *(void *)(v3 + 24) = v2;
    id v9 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_1001E5030 + dword_1001E5030);
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_10014EE28;
    char v5 = *(unsigned char *)(v0 + 72);
    return v9(v5, (uint64_t)sub_100162600, v3);
  }
  else
  {
    id v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

void sub_100161B34(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_100161C84(a1, a2, a3, a4, a5, v5[2], v5[3], v5[4], (uint64_t)&unk_1001CEB30, (SEL *)&selRef_handoffUTMetricsWithAdvertisedItemID_eventsData_reply_);
}

uint64_t TokenHandoffRequest.handoffPODToken(advertisedItemID:tokenData:)(uint64_t result, uint64_t a2, uint64_t a3, char a4)
{
  if (qword_1001E4C38 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_1001E6100)
  {
    uint64_t v5 = __chkstk_darwin(result);
    __chkstk_darwin(v5);
    return sub_100153CD8(a4, (void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))sub_100162600);
  }
  return result;
}

void sub_100161C84(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, SEL *a10)
{
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v16[4] = a4;
  v16[5] = a5;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_10016FE18;
  v16[3] = a9;
  uint64_t v15 = _Block_copy(v16);
  swift_retain();
  swift_release();
  objc_msgSend(a1, *a10, a6, isa, v15);
  _Block_release(v15);
}

void sub_100161D68(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_100161C84(a1, a2, a3, a4, a5, v5[2], v5[3], v5[4], (uint64_t)&unk_1001CEB08, (SEL *)&selRef_handoffPODTokenWithAdvertisedItemID_tokenData_reply_);
}

uint64_t sub_100161DA4()
{
  return 0x69766E456E616B73;
}

uint64_t sub_100161DC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x69766E456E616B73 && a2 == 0xEF746E656D6E6F72)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_100161E84(uint64_t a1)
{
  unint64_t v2 = sub_100162040();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100161EC0(uint64_t a1)
{
  unint64_t v2 = sub_100162040();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t TokenHandoffRequest.encode(to:)(void *a1, char a2)
{
  uint64_t v4 = sub_100012960(&qword_1001E5660);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100012D78(a1, a1[3]);
  sub_100162040();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v9[15] = a2;
  sub_100046408();
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_100162040()
{
  unint64_t result = qword_1001E5668;
  if (!qword_1001E5668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5668);
  }
  return result;
}

void *TokenHandoffRequest.init(from:)(void *a1)
{
  return sub_1001620F4(a1);
}

void *sub_1001620AC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1001620F4(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_1001620D8(void *a1)
{
  return TokenHandoffRequest.encode(to:)(a1, *v1);
}

void *sub_1001620F4(void *a1)
{
  uint64_t v3 = sub_100012960(&qword_1001E5688);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  char v7 = sub_100012D78(a1, a1[3]);
  sub_100162040();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  }
  else
  {
    sub_1000472D8();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    char v7 = (void *)v9[15];
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  }
  return v7;
}

uint64_t getEnumTagSinglePayload for TokenHandoffRequest(unsigned __int8 *a1, unsigned int a2)
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
  if (*a1 <= 2u) {
    int v6 = 2;
  }
  else {
    int v6 = *a1;
  }
  int v7 = v6 - 3;
  if (*a1 < 2u) {
    int v8 = -1;
  }
  else {
    int v8 = v7;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TokenHandoffRequest(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1001623CCLL);
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

ValueMetadata *type metadata accessor for TokenHandoffRequest()
{
  return &type metadata for TokenHandoffRequest;
}

unsigned char *storeEnumTagSinglePayload for TokenHandoffRequest.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1001624A0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenHandoffRequest.CodingKeys()
{
  return &type metadata for TokenHandoffRequest.CodingKeys;
}

unint64_t sub_1001624DC()
{
  unint64_t result = qword_1001E5670;
  if (!qword_1001E5670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5670);
  }
  return result;
}

unint64_t sub_100162534()
{
  unint64_t result = qword_1001E5678;
  if (!qword_1001E5678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5678);
  }
  return result;
}

unint64_t sub_10016258C()
{
  unint64_t result = qword_1001E5680;
  if (!qword_1001E5680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5680);
  }
  return result;
}

uint64_t sub_1001625E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1001625F0()
{
  return swift_release();
}

void sub_10016260C(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a1;
  v7[4] = a4;
  _OWORD v7[5] = a5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_10016FE18;
  v7[3] = &unk_1001CEBC0;
  unsigned int v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  [v5 getSnoutStoriesWithReply:v6];
  _Block_release(v6);
}

uint64_t SnoutRequest.getSnoutStories()()
{
  if (qword_1001E4C30 != -1) {
    swift_once();
  }
  if (!qword_1001E60F8) {
    return 0;
  }
  uint64_t result = sub_1001540E0((void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(uint64_t, uint64_t), uint64_t))sub_10016260C, &v2);
  if (!v0) {
    return v2;
  }
  return result;
}

uint64_t sub_10016276C(uint64_t a1)
{
  unint64_t v2 = sub_1001628F4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1001627A8(uint64_t a1)
{
  unint64_t v2 = sub_1001628F4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t SnoutRequest.encode(to:)(void *a1)
{
  uint64_t v2 = sub_100012960(&qword_1001E5690);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_1001628F4();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_1001628F4()
{
  unint64_t result = qword_1001E5698;
  if (!qword_1001E5698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5698);
  }
  return result;
}

ValueMetadata *type metadata accessor for SnoutRequest()
{
  return &type metadata for SnoutRequest;
}

ValueMetadata *type metadata accessor for SnoutRequest.CodingKeys()
{
  return &type metadata for SnoutRequest.CodingKeys;
}

unint64_t sub_10016296C()
{
  unint64_t result = qword_1001E56A0;
  if (!qword_1001E56A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E56A0);
  }
  return result;
}

unint64_t sub_1001629C4()
{
  unint64_t result = qword_1001E56A8[0];
  if (!qword_1001E56A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1001E56A8);
  }
  return result;
}

uint64_t sub_100162A18(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100162A28()
{
  return swift_release();
}

void *PostbackConstants.reengagementOpenURLParameter.unsafeMutableAddressor()
{
  return &static PostbackConstants.reengagementOpenURLParameter;
}

unint64_t static PostbackConstants.reengagementOpenURLParameter.getter()
{
  return 0xD000000000000020;
}

ValueMetadata *type metadata accessor for PostbackConstants()
{
  return &type metadata for PostbackConstants;
}

uint64_t sub_100162A6C()
{
  type metadata accessor for Result();
  uint64_t result = type metadata accessor for Optional();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100162B10()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 104);
  type metadata accessor for Result();
  uint64_t v2 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_100162BCC()
{
  sub_100162B10();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SyncXPCResult()
{
  return sub_10005A688();
}

BOOL static JWSError.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void JWSError.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int JWSError.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

uint64_t static JWS.headerDictionary(fromJWS:)(uint64_t a1, unint64_t a2)
{
  uint64_t v33 = 46;
  unint64_t v34 = 0xE100000000000000;
  char v32 = &v33;
  swift_bridgeObjectRetain();
  if (*(void *)(sub_1000FF9F8(0x7FFFFFFFFFFFFFFFLL, 0, sub_100164294, (uint64_t)v31, a1, a2) + 16) != 3)
  {
    swift_bridgeObjectRelease();
    sub_10006ECF8();
    swift_allocError();
    unsigned char *v20 = 0;
    return swift_willThrow();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = static String._fromSubstring(_:)();
  unint64_t v6 = v5;
  swift_bridgeObjectRelease();
  uint64_t v33 = v4;
  unint64_t v34 = v6;
  unint64_t v7 = sub_10003985C();
  uint64_t v33 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  unint64_t v34 = v8;
  unint64_t v29 = v7;
  unint64_t v30 = v7;
  unint64_t v28 = v7;
  uint64_t v9 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  uint64_t v33 = v9;
  unint64_t v34 = v11;
  swift_bridgeObjectRetain();
  uint64_t v12 = String.count.getter();
  swift_bridgeObjectRelease();
  uint64_t v13 = v12 & 3;
  if (v12 <= 0) {
    uint64_t v13 = -(-v12 & 3);
  }
  if (v13)
  {
    v14._uint64_t countAndFlagsBits = 61;
    v14._object = (void *)0xE100000000000000;
    Swift::String v15 = String.init(repeating:count:)(v14, 4 - v13);
    String.append(_:)(v15);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v16 = Data.init(base64Encoded:options:)();
  unint64_t v18 = v17;
  swift_bridgeObjectRelease();
  if (v18 >> 60 == 15)
  {
    sub_10006ECF8();
    swift_allocError();
    *char v19 = 1;
    return swift_willThrow();
  }
  unint64_t v22 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  uint64_t v33 = 0;
  id v24 = objc_msgSend(v22, "JSONObjectWithData:options:error:", isa, 0, &v33, &type metadata for String, v28, v29, v30, 47, 0xE100000000000000);

  if (v24)
  {
    id v25 = (id)v33;
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_100012960(&qword_1001E2090);
    if (swift_dynamicCast())
    {
      sub_10005E9FC(v16, v18);
      return 95;
    }
    sub_10006ECF8();
    swift_allocError();
    *uint64_t v27 = 1;
  }
  else
  {
    id v26 = (id)v33;
    _convertNSErrorToError(_:)();
  }
  swift_willThrow();
  return sub_10005E9FC(v16, v18);
}

Swift::String __swiftcall String.base64URLEncodedToBase64()()
{
  sub_10003985C();
  StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  uint64_t v0 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  uint64_t v2 = v1;
  swift_bridgeObjectRelease();
  uint64_t v10 = v0;
  swift_bridgeObjectRetain();
  uint64_t v3 = String.count.getter();
  swift_bridgeObjectRelease();
  uint64_t v4 = v3 & 3;
  if (v3 <= 0) {
    uint64_t v4 = -(-v3 & 3);
  }
  if (v4)
  {
    v5._uint64_t countAndFlagsBits = 61;
    v5._object = (void *)0xE100000000000000;
    Swift::String v6 = String.init(repeating:count:)(v5, 4 - v4);
    String.append(_:)(v6);
    swift_bridgeObjectRelease();
  }
  uint64_t v7 = v10;
  unint64_t v8 = v2;
  result._object = v8;
  result._uint64_t countAndFlagsBits = v7;
  return result;
}

uint64_t static JWS.payloadDictionary(fromJWS:)(uint64_t a1, unint64_t a2)
{
  uint64_t v33 = 46;
  unint64_t v34 = 0xE100000000000000;
  char v32 = &v33;
  swift_bridgeObjectRetain();
  if (*(void *)(sub_1000FF9F8(0x7FFFFFFFFFFFFFFFLL, 0, sub_100164294, (uint64_t)v31, a1, a2) + 16) != 3)
  {
    swift_bridgeObjectRelease();
    sub_10006ECF8();
    swift_allocError();
    unsigned char *v20 = 0;
    return swift_willThrow();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = static String._fromSubstring(_:)();
  unint64_t v6 = v5;
  swift_bridgeObjectRelease();
  uint64_t v33 = v4;
  unint64_t v34 = v6;
  unint64_t v7 = sub_10003985C();
  uint64_t v33 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  unint64_t v34 = v8;
  unint64_t v29 = v7;
  unint64_t v30 = v7;
  unint64_t v28 = v7;
  uint64_t v9 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  uint64_t v33 = v9;
  unint64_t v34 = v11;
  swift_bridgeObjectRetain();
  uint64_t v12 = String.count.getter();
  swift_bridgeObjectRelease();
  uint64_t v13 = v12 & 3;
  if (v12 <= 0) {
    uint64_t v13 = -(-v12 & 3);
  }
  if (v13)
  {
    v14._uint64_t countAndFlagsBits = 61;
    v14._object = (void *)0xE100000000000000;
    Swift::String v15 = String.init(repeating:count:)(v14, 4 - v13);
    String.append(_:)(v15);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v16 = Data.init(base64Encoded:options:)();
  unint64_t v18 = v17;
  swift_bridgeObjectRelease();
  if (v18 >> 60 == 15)
  {
    sub_10006ECF8();
    swift_allocError();
    *char v19 = 2;
    return swift_willThrow();
  }
  unint64_t v22 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  uint64_t v33 = 0;
  id v24 = objc_msgSend(v22, "JSONObjectWithData:options:error:", isa, 0, &v33, &type metadata for String, v28, v29, v30, 47, 0xE100000000000000);

  if (v24)
  {
    id v25 = (id)v33;
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_100012960(&qword_1001E2090);
    if (swift_dynamicCast())
    {
      sub_10005E9FC(v16, v18);
      return 95;
    }
    sub_10006ECF8();
    swift_allocError();
    *uint64_t v27 = 2;
  }
  else
  {
    id v26 = (id)v33;
    _convertNSErrorToError(_:)();
  }
  swift_willThrow();
  return sub_10005E9FC(v16, v18);
}

uint64_t JWS.header.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t JWS.payload.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) - 8) + 16))(a2, v2 + *(int *)(a1 + 52));
}

uint64_t JWS.signature.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 56));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t JWS.compactJWS.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 60));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t JWS.init(compactJWS:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v93 = a5;
  unint64_t v94 = a3;
  uint64_t v97 = a4;
  uint64_t v91 = *(void *)(a3 - 8);
  uint64_t v10 = __chkstk_darwin(a1);
  char v92 = (char *)&v84 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = v12;
  uint64_t v96 = *(void *)(v12 - 8);
  __chkstk_darwin(v10);
  Swift::String v14 = (char *)&v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for JSONDecoder.DateDecodingStrategy();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  unint64_t v18 = (char *)&v84 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = 46;
  unint64_t v101 = 0xE100000000000000;
  v99 = &v100;
  swift_bridgeObjectRetain_n();
  uint64_t v90 = a1;
  uint64_t v19 = sub_1000FF9F8(0x7FFFFFFFFFFFFFFFLL, 0, sub_100164294, (uint64_t)v98, a1, a2);
  swift_bridgeObjectRelease();
  if (*(void *)(v19 + 16) != 3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10006ECF8();
    swift_allocError();
    unsigned char *v37 = 0;
    return swift_willThrow();
  }
  unint64_t v89 = v6;
  type metadata accessor for JSONDecoder();
  swift_allocObject();
  uint64_t v20 = JSONDecoder.init()();
  (*(void (**)(char *, void, uint64_t))(v16 + 104))(v18, enum case for JSONDecoder.DateDecodingStrategy.millisecondsSince1970(_:), v15);
  uint64_t result = dispatch thunk of JSONDecoder.dateDecodingStrategy.setter();
  if (!*(void *)(v19 + 16))
  {
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v95 = v20;
  uint64_t v88 = a6;
  swift_bridgeObjectRetain();
  uint64_t v22 = static String._fromSubstring(_:)();
  unint64_t v24 = v23;
  swift_bridgeObjectRelease();
  uint64_t v100 = v22;
  unint64_t v101 = v24;
  uint64_t v106 = 45;
  unint64_t v107 = 0xE100000000000000;
  uint64_t v104 = 43;
  unint64_t v105 = 0xE100000000000000;
  sub_10003985C();
  uint64_t v100 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  unint64_t v101 = v25;
  uint64_t v106 = 95;
  unint64_t v107 = 0xE100000000000000;
  uint64_t v104 = 47;
  unint64_t v105 = 0xE100000000000000;
  uint64_t v26 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  unint64_t v28 = v27;
  swift_bridgeObjectRelease();
  uint64_t v100 = v26;
  unint64_t v101 = v28;
  swift_bridgeObjectRetain();
  uint64_t v29 = String.count.getter();
  swift_bridgeObjectRelease();
  uint64_t v30 = v29 & 3;
  if (v29 <= 0) {
    uint64_t v30 = -(-v29 & 3);
  }
  if (v30)
  {
    v31._uint64_t countAndFlagsBits = 61;
    v31._object = (void *)0xE100000000000000;
    Swift::String v32 = String.init(repeating:count:)(v31, 4 - v30);
    String.append(_:)(v32);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v33 = Data.init(base64Encoded:options:)();
  unint64_t v35 = v34;
  swift_bridgeObjectRelease();
  if (v35 >> 60 == 15)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10006ECF8();
    swift_allocError();
    *uint64_t v36 = 1;
    swift_willThrow();
    return swift_release();
  }
  uint64_t v38 = v108;
  unint64_t v39 = v89;
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  if (v39)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_10005E9FC(v33, v35);
    return swift_bridgeObjectRelease();
  }
  uint64_t v87 = v33;
  unint64_t v89 = v35;
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v96 + 32))(v88, v14, v38);
  if (*(void *)(v19 + 16) < 2uLL) {
    goto LABEL_36;
  }
  swift_bridgeObjectRetain();
  uint64_t v40 = static String._fromSubstring(_:)();
  unint64_t v42 = v41;
  swift_bridgeObjectRelease();
  uint64_t v100 = v40;
  unint64_t v101 = v42;
  uint64_t v106 = 45;
  unint64_t v107 = 0xE100000000000000;
  uint64_t v104 = 43;
  unint64_t v105 = 0xE100000000000000;
  uint64_t v100 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  unint64_t v101 = v43;
  uint64_t v106 = 95;
  unint64_t v107 = 0xE100000000000000;
  uint64_t v104 = 47;
  unint64_t v105 = 0xE100000000000000;
  uint64_t v44 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  unint64_t v46 = v45;
  swift_bridgeObjectRelease();
  uint64_t v100 = v44;
  unint64_t v101 = v46;
  swift_bridgeObjectRetain();
  uint64_t v47 = String.count.getter();
  swift_bridgeObjectRelease();
  uint64_t v48 = v47 & 3;
  if (v47 <= 0) {
    uint64_t v48 = -(-v47 & 3);
  }
  if (v48)
  {
    v49._uint64_t countAndFlagsBits = 61;
    v49._object = (void *)0xE100000000000000;
    Swift::String v50 = String.init(repeating:count:)(v49, 4 - v48);
    String.append(_:)(v50);
    swift_bridgeObjectRelease();
  }
  uint64_t v51 = v93;
  unint64_t v52 = v94;
  swift_bridgeObjectRelease();
  uint64_t v53 = Data.init(base64Encoded:options:)();
  unint64_t v55 = v54;
  swift_bridgeObjectRelease();
  if (v55 >> 60 != 15)
  {
    dispatch thunk of JSONDecoder.decode<A>(_:from:)();
    unint64_t v86 = v55;
    uint64_t v85 = v53;
    uint64_t v100 = v108;
    unint64_t v101 = v52;
    uint64_t v102 = v97;
    uint64_t v103 = v51;
    uint64_t v84 = type metadata accessor for JWS();
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, unint64_t))(v91 + 32))(v88 + *(int *)(v84 + 52), v92, v52);
    if (*(void *)(v19 + 16) >= 3uLL)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v63 = static String._fromSubstring(_:)();
      unint64_t v65 = v64;
      swift_bridgeObjectRelease();
      uint64_t v66 = v63;
      uint64_t v100 = v63;
      unint64_t v101 = v65;
      uint64_t v106 = 45;
      unint64_t v107 = 0xE100000000000000;
      uint64_t v104 = 43;
      unint64_t v105 = 0xE100000000000000;
      uint64_t v100 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
      unint64_t v101 = v67;
      uint64_t v106 = 95;
      unint64_t v107 = 0xE100000000000000;
      uint64_t v104 = 47;
      unint64_t v105 = 0xE100000000000000;
      uint64_t v68 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
      unint64_t v70 = v69;
      swift_bridgeObjectRelease();
      uint64_t v100 = v68;
      unint64_t v101 = v70;
      swift_bridgeObjectRetain();
      uint64_t v71 = String.count.getter();
      swift_bridgeObjectRelease();
      uint64_t v72 = v71 & 3;
      if (v71 <= 0) {
        uint64_t v72 = -(-v71 & 3);
      }
      if (v72)
      {
        v73._uint64_t countAndFlagsBits = 61;
        v73._object = (void *)0xE100000000000000;
        Swift::String v74 = String.init(repeating:count:)(v73, 4 - v72);
        String.append(_:)(v74);
        swift_bridgeObjectRelease();
      }
      uint64_t v75 = HIBYTE(v65) & 0xF;
      if ((v65 & 0x2000000000000000) == 0) {
        uint64_t v75 = v66 & 0xFFFFFFFFFFFFLL;
      }
      uint64_t v76 = v85;
      if (v75)
      {
        uint64_t v77 = Data.init(base64Encoded:options:)();
        unint64_t v79 = v78;
        swift_bridgeObjectRelease();
        uint64_t v58 = v88;
        if (v79 >> 60 != 15)
        {
          sub_10005E9FC(v77, v79);
          swift_release();
          sub_10005E9FC(v87, v89);
          uint64_t result = sub_10005E9FC(v76, v86);
          uint64_t v80 = v84;
          char v81 = (uint64_t *)(v58 + *(int *)(v84 + 56));
          *char v81 = v66;
          v81[1] = v65;
          uint64_t v82 = (uint64_t *)(v58 + *(int *)(v80 + 60));
          *uint64_t v82 = v90;
          v82[1] = a2;
          return result;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v58 = v88;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10006ECF8();
      swift_allocError();
      *uint64_t v83 = 3;
      swift_willThrow();
      sub_10005E9FC(v76, v86);
      sub_10005E9FC(v87, v89);
      swift_release();
      int v57 = 1;
      uint64_t v51 = v93;
      unint64_t v52 = v94;
      goto LABEL_20;
    }
LABEL_37:
    __break(1u);
    return result;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10006ECF8();
  swift_allocError();
  *uint64_t v56 = 2;
  swift_willThrow();
  sub_10005E9FC(v87, v89);
  swift_release();
  int v57 = 0;
  uint64_t v58 = v88;
LABEL_20:
  uint64_t v59 = v58;
  uint64_t v60 = v58;
  uint64_t v61 = v108;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v96 + 8))(v59, v108);
  if (v57)
  {
    uint64_t v100 = v61;
    unint64_t v101 = v52;
    uint64_t v102 = v97;
    uint64_t v103 = v51;
    uint64_t v62 = type metadata accessor for JWS();
    return (*(uint64_t (**)(uint64_t, unint64_t))(v91 + 8))(v60 + *(int *)(v62 + 52), v52);
  }
  return result;
}

Swift::String __swiftcall Data.base64URLEncodedString()()
{
  Data.base64EncodedString(options:)(0);
  sub_10003985C();
  StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  swift_bridgeObjectRelease();
  StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  swift_bridgeObjectRelease();
  uint64_t v0 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  uint64_t v2 = v1;
  swift_bridgeObjectRelease();
  uint64_t v3 = v0;
  uint64_t v4 = v2;
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

uint64_t sub_100164294(void *a1)
{
  return sub_1001012FC(a1) & 1;
}

uint64_t type metadata accessor for JWS()
{
  return swift_getGenericMetadata();
}

unint64_t sub_1001642CC()
{
  unint64_t result = qword_1001E5730[0];
  if (!qword_1001E5730[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1001E5730);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for JWSError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1001643ECLL);
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

ValueMetadata *type metadata accessor for JWSError()
{
  return &type metadata for JWSError;
}

uint64_t sub_100164424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 48);
}

uint64_t sub_10016442C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_100164508(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = *(void *)(a3 + 24);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = v6 + v9;
  uint64_t v11 = *(void *)(v8 + 64) + 7;
  unint64_t v12 = ((((v11 + ((v6 + v9) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  unsigned int v13 = v9 | *(_DWORD *)(v5 + 80) & 0xF8;
  if (v13 > 7 || ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0 || v12 > 0x18)
  {
    uint64_t v16 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (uint64_t *)(v16 + (((v13 | 7) + 16) & ~(unint64_t)(v13 | 7)));
    swift_retain();
  }
  else
  {
    uint64_t v17 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v18 = ((unint64_t)a2 + v10) & v17;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(((unint64_t)v4 + v10) & v17, v18, v7);
    uint64_t v19 = (void *)((v11 + (((unint64_t)v4 + v10) & v17)) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v20 = (void *)((v11 + v18) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v19 = *v20;
    v19[1] = v20[1];
    unint64_t v21 = (void *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v22 = (void *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
    *unint64_t v21 = *v22;
    v21[1] = v22[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_1001646DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v4)();
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 24) - 8) + 8))((*(void *)(v4 + 56)
                                                                                            + a1
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80));
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1001647AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 48);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 16;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 48) + 7;
  uint64_t v15 = (void *)((v14 + v12) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (void *)((v14 + v13) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  uint64_t v17 = (void *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v18 = (void *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1001648B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 40);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 24;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 24))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 40) + 7;
  uint64_t v15 = (void *)((v14 + v12) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (void *)((v14 + v13) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = (void *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v18 = (void *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1001649C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 32);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 32;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 32) + 7;
  uint64_t v15 = (_OWORD *)((v14 + v12) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (_OWORD *)((v14 + v13) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v15 = *v16;
  *(_OWORD *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_100164AA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(v6 + 24);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  uint64_t v9 = v8 + 40;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (v11 + a1) & ~v10;
  uint64_t v13 = (v11 + a2) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v12, v13);
  uint64_t v14 = *(void *)(v9 + 24) + 7;
  uint64_t v15 = (void *)((v14 + v12) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = (void *)((v14 + v13) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRelease();
  uint64_t v17 = (void *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v18 = (void *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100164BB0(int *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(void *)(*(void *)(a3 + 24) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  if (v8 <= v6) {
    unsigned int v10 = *(_DWORD *)(v5 + 84);
  }
  else {
    unsigned int v10 = *(_DWORD *)(v7 + 84);
  }
  if (v10 <= 0x7FFFFFFF) {
    unsigned int v10 = 0x7FFFFFFF;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v11 = *(void *)(*(void *)(v4 - 8) + 64) + v9;
  uint64_t v12 = *(void *)(v7 + 64) + 7;
  if (v10 < a2)
  {
    unint64_t v13 = ((((v12 + (v11 & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v14 = a2 - v10;
    uint64_t v15 = v13 & 0xFFFFFFF8;
    if ((v13 & 0xFFFFFFF8) != 0) {
      unsigned int v16 = 2;
    }
    else {
      unsigned int v16 = v14 + 1;
    }
    if (v16 >= 0x10000) {
      unsigned int v17 = 4;
    }
    else {
      unsigned int v17 = 2;
    }
    if (v16 < 0x100) {
      unsigned int v17 = 1;
    }
    if (v16 >= 2) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 0;
    }
    switch(v18)
    {
      case 1:
        int v19 = *((unsigned __int8 *)a1 + v13);
        if (!v19) {
          break;
        }
        goto LABEL_24;
      case 2:
        int v19 = *(unsigned __int16 *)((char *)a1 + v13);
        if (v19) {
          goto LABEL_24;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x100164D90);
      case 4:
        int v19 = *(int *)((char *)a1 + v13);
        if (!v19) {
          break;
        }
LABEL_24:
        int v21 = v19 - 1;
        if (v15)
        {
          int v21 = 0;
          int v22 = *a1;
        }
        else
        {
          int v22 = 0;
        }
        return v10 + (v22 | v21) + 1;
      default:
        break;
    }
  }
  if (v6 == v10) {
    return (*(uint64_t (**)(int *, uint64_t, uint64_t))(v5 + 48))(a1, v6, v4);
  }
  unint64_t v23 = ((unint64_t)a1 + v11) & ~v9;
  if (v8 == v10) {
    return (*(uint64_t (**)(unint64_t))(v7 + 48))(v23);
  }
  unint64_t v24 = *(void *)(((v12 + v23) & 0xFFFFFFFFFFFFFFF8) + 8);
  if (v24 >= 0xFFFFFFFF) {
    LODWORD(v24) = -1;
  }
  return (v24 + 1);
}

void sub_100164DA4(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  uint64_t v7 = *(void *)(a4 + 24);
  unsigned int v8 = *(_DWORD *)(v6 + 84);
  uint64_t v9 = *(void *)(v7 - 8);
  unsigned int v10 = *(_DWORD *)(v9 + 84);
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  if (v10 <= v8) {
    unsigned int v12 = *(_DWORD *)(v6 + 84);
  }
  else {
    unsigned int v12 = *(_DWORD *)(v9 + 84);
  }
  if (v12 <= 0x7FFFFFFF) {
    unsigned int v12 = 0x7FFFFFFF;
  }
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + v11;
  uint64_t v14 = *(void *)(*(void *)(v7 - 8) + 64) + 7;
  unint64_t v15 = ((((v14 + (v13 & ~v11)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v12 >= a3)
  {
    int v19 = 0;
    int v20 = a2 - v12;
    if (a2 <= v12)
    {
LABEL_19:
      switch(v19)
      {
        case 1:
          a1[v15] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_32;
        case 2:
          *(_WORD *)&a1[v15] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_32;
        case 3:
          goto LABEL_48;
        case 4:
          *(_DWORD *)&a1[v15] = 0;
          goto LABEL_31;
        default:
LABEL_31:
          if (a2)
          {
LABEL_32:
            if (v8 == v12)
            {
              unint64_t v23 = *(void (**)(void))(v6 + 56);
              v23();
            }
            else
            {
              unint64_t v24 = (unint64_t)&a1[v13] & ~v11;
              if (v10 == v12)
              {
                unint64_t v25 = *(void (**)(unint64_t))(v9 + 56);
                v25(v24);
              }
              else
              {
                uint64_t v26 = (void *)((v14 + v24) & 0xFFFFFFFFFFFFFFF8);
                if ((a2 & 0x80000000) != 0)
                {
                  *uint64_t v26 = a2 ^ 0x80000000;
                  v26[1] = 0;
                }
                else
                {
                  v26[1] = a2 - 1;
                }
              }
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v16 = a3 - v12;
    if (((((v14 + (v13 & ~v11)) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v17 = v16 + 1;
    }
    else {
      unsigned int v17 = 2;
    }
    if (v17 >= 0x10000) {
      int v18 = 4;
    }
    else {
      int v18 = 2;
    }
    if (v17 < 0x100) {
      int v18 = 1;
    }
    if (v17 >= 2) {
      int v19 = v18;
    }
    else {
      int v19 = 0;
    }
    int v20 = a2 - v12;
    if (a2 <= v12) {
      goto LABEL_19;
    }
  }
  if (((((v14 + (v13 & ~v11)) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    int v21 = v20;
  }
  else {
    int v21 = 1;
  }
  if (((((v14 + (v13 & ~v11)) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    int v22 = ~v12 + a2;
    bzero(a1, ((((v14 + (v13 & ~v11)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16);
    *(_DWORD *)a1 = v22;
  }
  switch(v19)
  {
    case 1:
      a1[v15] = v21;
      break;
    case 2:
      *(_WORD *)&a1[v15] = v21;
      break;
    case 3:
LABEL_48:
      __break(1u);
      JUMPOUT(0x100165044);
    case 4:
      *(_DWORD *)&a1[v15] = v21;
      break;
    default:
      return;
  }
}

uint64_t sub_10016506C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1001650A4()
{
  return _swift_deallocObject(v0, 24, 7);
}

Swift::String *DeveloperModeServiceMachName.unsafeMutableAddressor()
{
  return &DeveloperModeServiceMachName;
}

uint64_t InAppPurchaseDetails.amountCharged.getter()
{
  return *(void *)v0;
}

uint64_t InAppPurchaseDetails.storefront.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InAppPurchaseDetails.purchaseDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for InAppPurchaseDetails() + 28);
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for InAppPurchaseDetails()
{
  uint64_t result = qword_1001E58B0;
  if (!qword_1001E58B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t InAppPurchaseDetails.purchaseType.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for InAppPurchaseDetails() + 32));
}

uint64_t InAppPurchaseDetails.subscriptionDuration.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for InAppPurchaseDetails() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InAppPurchaseDetails.init(amountCharged:currencyCode:storefront:purchaseDate:purchaseType:subscriptionDuration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10, uint64_t a11, uint64_t a12)
{
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(_DWORD *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  uint64_t v14 = (int *)type metadata accessor for InAppPurchaseDetails();
  uint64_t v15 = a9 + v14[7];
  uint64_t v16 = type metadata accessor for Date();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v15, a8, v16);
  *(unsigned char *)(a9 + v14[8]) = a10;
  int v18 = (void *)(a9 + v14[9]);
  *int v18 = a11;
  v18[1] = a12;
  return result;
}

uint64_t sub_100165310(uint64_t a1)
{
  unint64_t v2 = sub_100165B2C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10016534C(uint64_t a1)
{
  unint64_t v2 = sub_100165B2C();

  return CodingKey.debugDescription.getter(a1, v2);
}

unint64_t sub_100165388()
{
  unint64_t result = 0x62616D75736E6F63;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x75736E6F436E6F6ELL;
      break;
    case 2:
      unint64_t result = 0xD000000000000019;
      break;
    case 3:
      unint64_t result = 0xD000000000000017;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100165434@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100166620(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10016545C(uint64_t a1)
{
  unint64_t v2 = sub_100165A84();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100165498(uint64_t a1)
{
  unint64_t v2 = sub_100165A84();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001654D4(uint64_t a1)
{
  unint64_t v2 = sub_100165BD4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100165510(uint64_t a1)
{
  unint64_t v2 = sub_100165BD4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10016554C(uint64_t a1)
{
  unint64_t v2 = sub_100165B80();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100165588(uint64_t a1)
{
  unint64_t v2 = sub_100165B80();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1001655C4(uint64_t a1)
{
  unint64_t v2 = sub_100165AD8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100165600(uint64_t a1)
{
  unint64_t v2 = sub_100165AD8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t InAppPurchaseDetails.InAppPurchaseType.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v31 = a2;
  uint64_t v3 = sub_100012960(&qword_1001E57B8);
  uint64_t v29 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  __chkstk_darwin(v3);
  unint64_t v28 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100012960(&qword_1001E57C0);
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v27 = v5;
  __chkstk_darwin(v5);
  unint64_t v25 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100012960(&qword_1001E57C8);
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100012960(&qword_1001E57D0);
  uint64_t v22 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unsigned int v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100012960(&qword_1001E57D8);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_100165A84();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  switch((char)v31)
  {
    case 1:
      char v33 = 1;
      sub_100165B80();
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
      break;
    case 2:
      char v34 = 2;
      sub_100165B2C();
      unsigned int v17 = v25;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v19 = v26;
      uint64_t v18 = v27;
      goto LABEL_5;
    case 3:
      char v35 = 3;
      sub_100165AD8();
      unsigned int v17 = v28;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v19 = v29;
      uint64_t v18 = v30;
LABEL_5:
      (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
      break;
    default:
      char v32 = 0;
      sub_100165BD4();
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v10);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

unint64_t sub_100165A84()
{
  unint64_t result = qword_1001E57E0;
  if (!qword_1001E57E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E57E0);
  }
  return result;
}

unint64_t sub_100165AD8()
{
  unint64_t result = qword_1001E57E8;
  if (!qword_1001E57E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E57E8);
  }
  return result;
}

unint64_t sub_100165B2C()
{
  unint64_t result = qword_1001E57F0;
  if (!qword_1001E57F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E57F0);
  }
  return result;
}

unint64_t sub_100165B80()
{
  unint64_t result = qword_1001E57F8;
  if (!qword_1001E57F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E57F8);
  }
  return result;
}

unint64_t sub_100165BD4()
{
  unint64_t result = qword_1001E5800;
  if (!qword_1001E5800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5800);
  }
  return result;
}

char *InAppPurchaseDetails.InAppPurchaseType.init(from:)(void *a1)
{
  return sub_100166804(a1);
}

char *sub_100165C40@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_100166804(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_100165C6C(void *a1)
{
  return InAppPurchaseDetails.InAppPurchaseType.encode(to:)(a1, *v1);
}

unint64_t sub_100165C88()
{
  unint64_t result = 0x6843746E756F6D61;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x79636E6572727563;
      break;
    case 2:
      unint64_t result = 0x6F726665726F7473;
      break;
    case 3:
    case 4:
      unint64_t result = 0x6573616863727570;
      break;
    case 5:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100165D68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100167F28(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100165D90(uint64_t a1)
{
  unint64_t v2 = sub_100166E3C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100165DCC(uint64_t a1)
{
  unint64_t v2 = sub_100166E3C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t InAppPurchaseDetails.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100012960(&qword_1001E5808);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_100166E3C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  int v13 = *v3;
  long long v14 = *(_OWORD *)(v3 + 1);
  char v12 = 0;
  type metadata accessor for Decimal();
  sub_100166EE4(&qword_1001E5818, (void (*)(uint64_t))type metadata accessor for Decimal);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    LOBYTE(v13) = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    LOBYTE(v13) = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    uint64_t v9 = type metadata accessor for InAppPurchaseDetails();
    LOBYTE(v13) = 3;
    type metadata accessor for Date();
    sub_100166EE4(&qword_1001E5820, (void (*)(uint64_t))&type metadata accessor for Date);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v13) = *((unsigned char *)v3 + *(int *)(v9 + 32));
    char v12 = 4;
    sub_100166E90();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    LOBYTE(v13) = 5;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t InAppPurchaseDetails.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v28 = *(void *)(v4 - 8);
  uint64_t v29 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_100012960(&qword_1001E5830);
  uint64_t v7 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = type metadata accessor for InAppPurchaseDetails();
  __chkstk_darwin(v27);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_100166E3C();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  }
  uint64_t v24 = v6;
  uint64_t v12 = v7;
  type metadata accessor for Decimal();
  char v32 = 0;
  sub_100166EE4(&qword_1001E5838, (void (*)(uint64_t))type metadata accessor for Decimal);
  uint64_t v13 = v26;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  *(_DWORD *)uint64_t v11 = v30;
  *(_OWORD *)(v11 + 4) = v31;
  LOBYTE(v30) = 1;
  *((void *)v11 + 3) = KeyedDecodingContainer.decode(_:forKey:)();
  *((void *)v11 + 4) = v14;
  LOBYTE(v30) = 2;
  *((void *)v11 + 5) = KeyedDecodingContainer.decode(_:forKey:)();
  *((void *)v11 + 6) = v15;
  LOBYTE(v30) = 3;
  sub_100166EE4(&qword_1001E5840, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t v16 = v29;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v17 = v27;
  (*(void (**)(char *, char *, uint64_t))(v28 + 32))(&v11[*(int *)(v27 + 28)], v24, v16);
  char v32 = 4;
  sub_100166F2C();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v11[*(int *)(v17 + 32)] = v30;
  LOBYTE(v30) = 5;
  uint64_t v18 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v13);
  uint64_t v21 = (uint64_t *)&v11[*(int *)(v17 + 36)];
  *uint64_t v21 = v18;
  v21[1] = v20;
  sub_1000B71A4((uint64_t)v11, v25);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  return sub_100166F80((uint64_t)v11);
}

uint64_t sub_1001665F0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return InAppPurchaseDetails.init(from:)(a1, a2);
}

uint64_t sub_100166608(void *a1)
{
  return InAppPurchaseDetails.encode(to:)(a1);
}

uint64_t sub_100166620(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x62616D75736E6F63 && a2 == 0xEA0000000000656CLL;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x75736E6F436E6F6ELL && a2 == 0xED0000656C62616DLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x80000001001889B0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x80000001001889D0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

char *sub_100166804(void *a1)
{
  uint64_t v41 = sub_100012960(&qword_1001E5968);
  uint64_t v45 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v44 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_100012960(&qword_1001E5970);
  uint64_t v42 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  unint64_t v43 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100012960(&qword_1001E5978);
  uint64_t v38 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  __chkstk_darwin(v4);
  char v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100012960(&qword_1001E5980);
  uint64_t v37 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100012960(&qword_1001E5988);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  unint64_t v46 = a1;
  sub_100012D78(a1, v14);
  sub_100165A84();
  uint64_t v15 = v47;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v15) {
    goto LABEL_7;
  }
  uint64_t v35 = v7;
  uint64_t v36 = v9;
  uint64_t v16 = v43;
  uint64_t v17 = v44;
  uint64_t v47 = 0;
  uint64_t v18 = v45;
  uint64_t v19 = v11;
  uint64_t v20 = v13;
  uint64_t v21 = KeyedDecodingContainer.allKeys.getter();
  uint64_t v22 = (char *)v21;
  if (*(void *)(v21 + 16) != 1)
  {
    uint64_t v25 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v13 = v22;
    uint64_t v26 = v10;
    uint64_t v28 = v27;
    sub_100012960(&qword_1001E4F78);
    void *v28 = &type metadata for InAppPurchaseDetails.InAppPurchaseType;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v28, enum case for DecodingError.typeMismatch(_:), v25);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v26);
LABEL_7:
    uint64_t v29 = (uint64_t)v46;
    goto LABEL_8;
  }
  uint64_t v13 = (char *)*(unsigned __int8 *)(v21 + 32);
  switch(*(unsigned char *)(v21 + 32))
  {
    case 1:
      char v49 = 1;
      sub_100165B80();
      uint64_t v31 = v47;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      if (v31) {
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v39);
      goto LABEL_14;
    case 2:
      char v50 = 2;
      sub_100165B2C();
      uint64_t v32 = v47;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      if (v32) {
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v42 + 8))(v16, v40);
      goto LABEL_14;
    case 3:
      char v51 = 3;
      sub_100165AD8();
      uint64_t v33 = v47;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      if (v33) {
        goto LABEL_14;
      }
      (*(void (**)(char *, uint64_t))(v18 + 8))(v17, v41);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v10);
      uint64_t v29 = (uint64_t)v46;
      break;
    default:
      char v48 = 0;
      sub_100165BD4();
      uint64_t v23 = v36;
      uint64_t v24 = v47;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      if (v24)
      {
LABEL_12:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v10);
        goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v37 + 8))(v23, v35);
LABEL_14:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v10);
      uint64_t v29 = (uint64_t)v46;
      break;
  }
LABEL_8:
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v29);
  return v13;
}

unint64_t sub_100166E3C()
{
  unint64_t result = qword_1001E5810;
  if (!qword_1001E5810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5810);
  }
  return result;
}

unint64_t sub_100166E90()
{
  unint64_t result = qword_1001E5828;
  if (!qword_1001E5828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5828);
  }
  return result;
}

uint64_t sub_100166EE4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100166F2C()
{
  unint64_t result = qword_1001E5848;
  if (!qword_1001E5848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5848);
  }
  return result;
}

uint64_t sub_100166F80(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InAppPurchaseDetails();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100166FE0()
{
  unint64_t result = qword_1001E5850;
  if (!qword_1001E5850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5850);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for InAppPurchaseDetails(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
    uint64_t v7 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v7;
    uint64_t v8 = a2[6];
    uint64_t v9 = a3[7];
    uint64_t v10 = a1 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v8;
    uint64_t v12 = type metadata accessor for Date();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    uint64_t v14 = a3[9];
    *((unsigned char *)v4 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    uint64_t v15 = (void *)((char *)v4 + v14);
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for InAppPurchaseDetails(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for InAppPurchaseDetails(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  uint64_t v13 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InAppPurchaseDetails(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  *(_WORD *)(a1 + 6) = *(_WORD *)(a2 + 6);
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
  *(_WORD *)(a1 + 12) = *(_WORD *)(a2 + 12);
  *(_WORD *)(a1 + 14) = *(_WORD *)(a2 + 14);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_WORD *)(a1 + 18) = *(_WORD *)(a2 + 18);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[7];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v10 = a3[9];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for InAppPurchaseDetails(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v6 = a3[7];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  return a1;
}

uint64_t assignWithTake for InAppPurchaseDetails(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 4) = *(_OWORD *)(a2 + 4);
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  void *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InAppPurchaseDetails(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001675D4);
}

uint64_t sub_1001675D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Date();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for InAppPurchaseDetails(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100167698);
}

uint64_t sub_100167698(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 32) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Date();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_100167740()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for InAppPurchaseDetails.InAppPurchaseType()
{
  return &type metadata for InAppPurchaseDetails.InAppPurchaseType;
}

unsigned char *storeEnumTagSinglePayload for InAppPurchaseDetails.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1001678DCLL);
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

ValueMetadata *type metadata accessor for InAppPurchaseDetails.CodingKeys()
{
  return &type metadata for InAppPurchaseDetails.CodingKeys;
}

unsigned char *_s20AttributionKitCommon20InAppPurchaseDetailsV17InAppPurchaseTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1001679E0);
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

ValueMetadata *type metadata accessor for InAppPurchaseDetails.InAppPurchaseType.CodingKeys()
{
  return &type metadata for InAppPurchaseDetails.InAppPurchaseType.CodingKeys;
}

ValueMetadata *type metadata accessor for InAppPurchaseDetails.InAppPurchaseType.ConsumableCodingKeys()
{
  return &type metadata for InAppPurchaseDetails.InAppPurchaseType.ConsumableCodingKeys;
}

ValueMetadata *type metadata accessor for InAppPurchaseDetails.InAppPurchaseType.NonConsumableCodingKeys()
{
  return &type metadata for InAppPurchaseDetails.InAppPurchaseType.NonConsumableCodingKeys;
}

ValueMetadata *type metadata accessor for InAppPurchaseDetails.InAppPurchaseType.AutoRenewableSubscriptionCodingKeys()
{
  return &type metadata for InAppPurchaseDetails.InAppPurchaseType.AutoRenewableSubscriptionCodingKeys;
}

ValueMetadata *type metadata accessor for InAppPurchaseDetails.InAppPurchaseType.NonRenewingSubscriptionCodingKeys()
{
  return &type metadata for InAppPurchaseDetails.InAppPurchaseType.NonRenewingSubscriptionCodingKeys;
}

unint64_t sub_100167A5C()
{
  unint64_t result = qword_1001E58F8;
  if (!qword_1001E58F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E58F8);
  }
  return result;
}

unint64_t sub_100167AB4()
{
  unint64_t result = qword_1001E5900;
  if (!qword_1001E5900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5900);
  }
  return result;
}

unint64_t sub_100167B0C()
{
  unint64_t result = qword_1001E5908;
  if (!qword_1001E5908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5908);
  }
  return result;
}

unint64_t sub_100167B64()
{
  unint64_t result = qword_1001E5910;
  if (!qword_1001E5910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5910);
  }
  return result;
}

unint64_t sub_100167BBC()
{
  unint64_t result = qword_1001E5918;
  if (!qword_1001E5918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5918);
  }
  return result;
}

unint64_t sub_100167C14()
{
  unint64_t result = qword_1001E5920;
  if (!qword_1001E5920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5920);
  }
  return result;
}

unint64_t sub_100167C6C()
{
  unint64_t result = qword_1001E5928;
  if (!qword_1001E5928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5928);
  }
  return result;
}

unint64_t sub_100167CC4()
{
  unint64_t result = qword_1001E5930;
  if (!qword_1001E5930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5930);
  }
  return result;
}

unint64_t sub_100167D1C()
{
  unint64_t result = qword_1001E5938;
  if (!qword_1001E5938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5938);
  }
  return result;
}

unint64_t sub_100167D74()
{
  unint64_t result = qword_1001E5940;
  if (!qword_1001E5940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5940);
  }
  return result;
}

unint64_t sub_100167DCC()
{
  unint64_t result = qword_1001E5948;
  if (!qword_1001E5948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5948);
  }
  return result;
}

unint64_t sub_100167E24()
{
  unint64_t result = qword_1001E5950;
  if (!qword_1001E5950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5950);
  }
  return result;
}

unint64_t sub_100167E7C()
{
  unint64_t result = qword_1001E5958;
  if (!qword_1001E5958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5958);
  }
  return result;
}

unint64_t sub_100167ED4()
{
  unint64_t result = qword_1001E5960;
  if (!qword_1001E5960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5960);
  }
  return result;
}

uint64_t sub_100167F28(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6843746E756F6D61 && a2 == 0xED00006465677261;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x79636E6572727563 && a2 == 0xEC00000065646F43 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F726665726F7473 && a2 == 0xEA0000000000746ELL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6573616863727570 && a2 == 0xEC00000065746144 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6573616863727570 && a2 == 0xEC00000065707954 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000001001889F0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_100168218()
{
  uint64_t result = sub_10016825C();
  qword_1001E6230 = result;
  return result;
}

uint64_t type metadata accessor for ImpressionIntakeServiceConnection()
{
  return self;
}

uint64_t sub_10016825C()
{
  uint64_t v18 = &type metadata for FeatureFlag;
  unint64_t v19 = sub_10014A6FC();
  LOBYTE(v15) = 0;
  char v0 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)&v15);
  if (v0)
  {
    id v1 = objc_allocWithZone((Class)NSXPCConnection);
    NSString v2 = String._bridgeToObjectiveC()();
    id v3 = objc_msgSend(v1, "initWithMachServiceName:options:", v2, 0, v15);

    unsigned int v4 = self;
    id v5 = [v4 interfaceWithProtocol:&OBJC_PROTOCOL____TtP20AttributionKitCommon17XPCClientProtocol_];
    [v3 setExportedInterface:v5];

    id v6 = [objc_allocWithZone((Class)type metadata accessor for XPCClient()) init];
    [v3 setExportedObject:v6];

    id v7 = [v4 interfaceWithProtocol:&OBJC_PROTOCOL____TtP20AttributionKitCommon31ImpressionIntakeServiceProtocol_];
    [v3 setRemoteObjectInterface:v7];

    unint64_t v19 = (unint64_t)sub_10014A130;
    uint64_t v20 = 0;
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 1107296256;
    uint64_t v17 = sub_10002437C;
    uint64_t v18 = (ValueMetadata *)&unk_1001CF048;
    uint64_t v8 = _Block_copy(&v15);
    [v3 setInterruptionHandler:v8];
    _Block_release(v8);
    unint64_t v19 = (unint64_t)sub_10014A13C;
    uint64_t v20 = 0;
    uint64_t v15 = _NSConcreteStackBlock;
    uint64_t v16 = 1107296256;
    uint64_t v17 = sub_10002437C;
    uint64_t v18 = (ValueMetadata *)&unk_1001CF070;
    uint64_t v9 = _Block_copy(&v15);
    [v3 setInvalidationHandler:v9];
    _Block_release(v9);
    [v3 resume];
    type metadata accessor for ImpressionIntakeServiceConnection();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v3;
  }
  else
  {
    if (qword_1001E4C50 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_100012E74(v11, (uint64_t)static Logger.xpc);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Service feature flag is not enabled", v14, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  return result;
}

uint64_t sub_1001685A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1001685B0()
{
  return swift_release();
}

void sub_1001685C0(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = *a1;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v10[4] = a4;
  v10[5] = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  void v10[2] = sub_10016FE18;
  v10[3] = &unk_1001CF1B0;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  [v7 updateConversionValue:isa reply:v9];
  _Block_release(v9);
}

uint64_t PostbackRequest.lockPostback.getter(uint64_t a1, unsigned int a2)
{
  return (a2 >> 8) & 1;
}

uint64_t PostbackRequest.conversionTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PostbackRequest.updateConversionValue()(uint64_t a1, __int16 a2, uint64_t a3)
{
  *(_WORD *)(v3 + 40) = a2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a3;
  return _swift_task_switch(sub_1001686EC, 0, 0);
}

uint64_t sub_1001686EC()
{
  if (qword_1001E4CA0 != -1) {
    swift_once();
  }
  if (qword_1001E6228)
  {
    __int16 v1 = *(_WORD *)(v0 + 40);
    id v7 = (char *)&dword_1001E5020 + dword_1001E5020;
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 32) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_100168828;
    uint64_t v4 = *(void *)(v0 + 16);
    uint64_t v3 = *(void *)(v0 + 24);
    return ((uint64_t (*)(uint64_t, void, uint64_t, void, void))v7)(v4, v1 & 0x1FF, v3, sub_1001685C0, 0);
  }
  else
  {
    id v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
}

uint64_t sub_100168828()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  __int16 v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_10016891C()
{
  unint64_t result = 0xD000000000000013;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000015;
      break;
    case 2:
      unint64_t result = 0x74736F506B636F6CLL;
      break;
    case 3:
      unint64_t result = 0x69737265766E6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1001689C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100168D80(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1001689EC(uint64_t a1)
{
  unint64_t v2 = sub_100168C90();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100168A28(uint64_t a1)
{
  unint64_t v2 = sub_100168C90();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t PostbackRequest.encode(to:)(void *a1, uint64_t a2, char a3, uint64_t a4)
{
  v13[0] = a4;
  uint64_t v7 = sub_100012960(&qword_1001E5A58);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_100168C90();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v18 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v4)
  {
    uint64_t v11 = v13[0];
    char v17 = a3;
    char v16 = 1;
    sub_10005D678();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    char v15 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v13[1] = v11;
    char v14 = 3;
    sub_100012960(&qword_1001E5A68);
    sub_100169594(&qword_1001E5A70, (void (*)(void))sub_10005D6CC);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

unint64_t sub_100168C90()
{
  unint64_t result = qword_1001E5A60;
  if (!qword_1001E5A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5A60);
  }
  return result;
}

uint64_t PostbackRequest.init(from:)(void *a1)
{
  uint64_t result = sub_100168F70(a1);
  if (v1) {
    return v3;
  }
  return result;
}

uint64_t sub_100168D0C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100168F70(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(unsigned char *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 9) = HIBYTE(v5) & 1;
    *(void *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_100168D48(void *a1)
{
  return PostbackRequest.encode(to:)(a1, *(void *)v1, *(unsigned char *)(v1 + 8), *(void *)(v1 + 16));
}

uint64_t sub_100168D80(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x8000000100188A50
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000100188A70 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74736F506B636F6CLL && a2 == 0xEC0000006B636162 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x69737265766E6F63 && a2 == 0xEF73657079546E6FLL)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_100168F70(void *a1)
{
  uint64_t v2 = sub_100012960(&qword_1001E5A90);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100012D78(a1, a1[3]);
  sub_100168C90();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  v8[31] = 0;
  uint64_t v6 = KeyedDecodingContainer.decode(_:forKey:)();
  v8[29] = 1;
  sub_10005D4F8();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  v8[28] = 2;
  KeyedDecodingContainer.decode(_:forKey:)();
  sub_100012960(&qword_1001E5A68);
  v8[27] = 3;
  sub_100169594(&qword_1001E5A98, (void (*)(void))sub_10005D54C);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  return v6;
}

uint64_t sub_1001691E8(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PostbackRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PostbackRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PostbackRequest(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PostbackRequest(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PostbackRequest()
{
  return &type metadata for PostbackRequest;
}

unsigned char *storeEnumTagSinglePayload for PostbackRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100169454);
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

ValueMetadata *type metadata accessor for PostbackRequest.CodingKeys()
{
  return &type metadata for PostbackRequest.CodingKeys;
}

unint64_t sub_100169490()
{
  unint64_t result = qword_1001E5A78;
  if (!qword_1001E5A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5A78);
  }
  return result;
}

unint64_t sub_1001694E8()
{
  unint64_t result = qword_1001E5A80;
  if (!qword_1001E5A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5A80);
  }
  return result;
}

unint64_t sub_100169540()
{
  unint64_t result = qword_1001E5A88;
  if (!qword_1001E5A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5A88);
  }
  return result;
}

uint64_t sub_100169594(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100011ECC(&qword_1001E5A68);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100169604(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100169614()
{
  return swift_release();
}

uint64_t Result.init<>(_:)@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  type metadata accessor for ServiceResult();
  if (swift_getEnumCaseMultiPayload() == 1) {
    *a3 = *a1;
  }
  else {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
  }
  sub_10006608C();
  type metadata accessor for Result();

  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata accessor for ServiceResult()
{
  return sub_10005A688();
}

uint64_t sub_100169720(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x73736563637573 && a2 == 0xE700000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6572756C696166 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_100169814(char a1)
{
  if (a1) {
    return 0x6572756C696166;
  }
  else {
    return 0x73736563637573;
  }
}

uint64_t sub_100169844(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

BOOL sub_1001698B4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1000CD4B4(*a1, *a2);
}

Swift::Int sub_1001698CC()
{
  return sub_1000CD4EC(*v0);
}

void sub_1001698E0(uint64_t a1)
{
  sub_1000CD4C4(a1, *v1);
}

Swift::Int sub_1001698F4()
{
  Hasher.init(_seed:)();
  sub_1000CD4C4((uint64_t)v2, *v0);
  return Hasher._finalize()();
}

uint64_t sub_100169940()
{
  return sub_100169814(*v0);
}

uint64_t sub_100169954@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100169720(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100169988@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10016BB44();
  *a1 = result;
  return result;
}

uint64_t sub_1001699BC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.description.getter(a1, WitnessTable);
}

uint64_t sub_100169A10(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.debugDescription.getter(a1, WitnessTable);
}

uint64_t sub_100169A64()
{
  return 12383;
}

uint64_t sub_100169A74@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_100169B6C(a1, (uint64_t (*)(void, void, void))static MessageRegistration.__derived_enum_equals(_:_:), a2);
}

uint64_t sub_100169A8C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.description.getter(a1, WitnessTable);
}

uint64_t sub_100169AE0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.debugDescription.getter(a1, WitnessTable);
}

uint64_t sub_100169B34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100169844(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100169B6C@<X0>(void *a1@<X1>, uint64_t (*a2)(void, void, void)@<X3>, unsigned char *a3@<X8>)
{
  uint64_t result = a2(a1[2], a1[3], a1[4]);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100169BA8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.description.getter(a1, WitnessTable);
}

uint64_t sub_100169BFC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.debugDescription.getter(a1, WitnessTable);
}

uint64_t ServiceResult.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = type metadata accessor for ServiceResult.FailureCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v40 = v6;
  uint64_t v7 = type metadata accessor for KeyedEncodingContainer();
  uint64_t v42 = *(void *)(v7 - 8);
  uint64_t v43 = v7;
  __chkstk_darwin(v7);
  uint64_t v41 = (char *)&v32 - v8;
  uint64_t v9 = type metadata accessor for ServiceResult.SuccessCodingKeys();
  uint64_t v10 = swift_getWitnessTable();
  uint64_t v35 = v9;
  uint64_t v32 = v10;
  uint64_t v11 = type metadata accessor for KeyedEncodingContainer();
  uint64_t v37 = *(void *)(v11 - 8);
  uint64_t v38 = v11;
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v34 = (char *)&v32 - v13;
  uint64_t v36 = *(void *)(v4 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v33 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(a2 - 8);
  __chkstk_darwin(v14);
  char v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = v5;
  uint64_t v45 = v4;
  type metadata accessor for ServiceResult.CodingKeys();
  swift_getWitnessTable();
  uint64_t v19 = type metadata accessor for KeyedEncodingContainer();
  uint64_t v47 = *(void *)(v19 - 8);
  uint64_t v48 = v19;
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v32 - v20;
  sub_100012D78(a1, a1[3]);
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v46, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    char v22 = *v18;
    char v51 = 1;
    uint64_t v23 = v41;
    uint64_t v24 = v48;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    char v50 = v22;
    sub_10016A19C();
    uint64_t v25 = v43;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v23, v25);
  }
  else
  {
    uint64_t v26 = v36;
    uint64_t v27 = v33;
    uint64_t v28 = v45;
    (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v33, v18, v45);
    char v49 = 0;
    uint64_t v29 = v34;
    uint64_t v24 = v48;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    uint64_t v30 = v38;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v29, v30);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v28);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v21, v24);
}

uint64_t type metadata accessor for ServiceResult.FailureCodingKeys()
{
  return sub_10005A688();
}

uint64_t type metadata accessor for ServiceResult.SuccessCodingKeys()
{
  return sub_10005A688();
}

uint64_t type metadata accessor for ServiceResult.CodingKeys()
{
  return sub_10005A688();
}

unint64_t sub_10016A19C()
{
  unint64_t result = qword_1001E5AA0;
  if (!qword_1001E5AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5AA0);
  }
  return result;
}

uint64_t ServiceResult.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v62 = a4;
  uint64_t v7 = type metadata accessor for ServiceResult.FailureCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v60 = v7;
  uint64_t v52 = type metadata accessor for KeyedDecodingContainer();
  uint64_t v55 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v61 = (char *)&v47 - v8;
  uint64_t v9 = type metadata accessor for ServiceResult.SuccessCodingKeys();
  uint64_t v56 = swift_getWitnessTable();
  uint64_t v57 = v9;
  uint64_t v51 = type metadata accessor for KeyedDecodingContainer();
  uint64_t v54 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  uint64_t v58 = (char *)&v47 - v10;
  type metadata accessor for ServiceResult.CodingKeys();
  uint64_t v67 = swift_getWitnessTable();
  uint64_t v11 = type metadata accessor for KeyedDecodingContainer();
  uint64_t v64 = *(void *)(v11 - 8);
  uint64_t v65 = v11;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v47 - v12;
  uint64_t v66 = a2;
  uint64_t v53 = a3;
  uint64_t v63 = type metadata accessor for ServiceResult();
  uint64_t v50 = *(void *)(v63 - 8);
  uint64_t v14 = __chkstk_darwin(v63);
  uint64_t v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v47 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v47 - v20;
  sub_100012D78(a1, a1[3]);
  char v22 = v72;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v22) {
    goto LABEL_7;
  }
  uint64_t v67 = (uint64_t)v19;
  uint64_t v48 = v16;
  char v49 = v21;
  uint64_t v23 = v65;
  uint64_t v72 = a1;
  *(void *)&long long v68 = KeyedDecodingContainer.allKeys.getter();
  type metadata accessor for Array();
  swift_getWitnessTable();
  *(void *)&long long v70 = ArraySlice.init<A>(_:)();
  *((void *)&v70 + 1) = v24;
  *(void *)&long long v71 = v25;
  *((void *)&v71 + 1) = v26;
  type metadata accessor for ArraySlice();
  swift_getWitnessTable();
  Collection<>.popFirst()();
  char v27 = v68;
  if (v68 == 2 || (long long v47 = v70, v68 = v70, v69 = v71, (Collection.isEmpty.getter() & 1) == 0))
  {
    uint64_t v32 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v34 = v33;
    sub_100012960(&qword_1001E4F78);
    *uint64_t v34 = v63;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v32 - 8) + 104))(v34, enum case for DecodingError.typeMismatch(_:), v32);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v64 + 8))(v13, v23);
    a1 = v72;
LABEL_7:
    uint64_t v35 = (uint64_t)a1;
    return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v35);
  }
  if (v27)
  {
    LOBYTE(v68) = 1;
    uint64_t v37 = v61;
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    uint64_t v45 = v62;
    sub_10016A9DC();
    uint64_t v38 = v52;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v39 = v37;
    uint64_t v40 = v64;
    (*(void (**)(char *, uint64_t))(v55 + 8))(v39, v38);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v13, v23);
    uint64_t v46 = v48;
    *uint64_t v48 = v68;
    uint64_t v41 = v63;
    swift_storeEnumTagMultiPayload();
    uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v50 + 32);
    uint64_t v44 = v49;
    v42(v49, v46, v41);
  }
  else
  {
    LOBYTE(v68) = 0;
    uint64_t v28 = v58;
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    uint64_t v29 = v67;
    uint64_t v30 = v51;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v31 = v64;
    (*(void (**)(char *, uint64_t))(v54 + 8))(v28, v30);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v23);
    uint64_t v41 = v63;
    swift_storeEnumTagMultiPayload();
    uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v50 + 32);
    uint64_t v43 = v29;
    uint64_t v44 = v49;
    v42(v49, (char *)v43, v41);
    uint64_t v45 = v62;
  }
  v42(v45, v44, v41);
  uint64_t v35 = (uint64_t)v72;
  return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0(v35);
}

unint64_t sub_10016A9DC()
{
  unint64_t result = qword_1001E5AA8[0];
  if (!qword_1001E5AA8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1001E5AA8);
  }
  return result;
}

uint64_t sub_10016AA30@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  return ServiceResult.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_10016AA54(void *a1, uint64_t a2)
{
  return ServiceResult.encode(to:)(a1, a2);
}

uint64_t sub_10016AA6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t sub_10016AA74()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_10016AB08(unsigned char *a1, unsigned __int8 *a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 1uLL) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  uint64_t v6 = *(_DWORD *)(v4 + 80);
  if (v6 > 7 || (*(_DWORD *)(v4 + 80) & 0x100000) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    uint64_t v9 = *(void *)a2;
    *char v3 = *(void *)a2;
    char v3 = (void *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  else
  {
    unsigned int v10 = a2[v5];
    unsigned int v11 = v10 - 2;
    if (v10 >= 2)
    {
      if (v5 <= 3) {
        uint64_t v12 = v5;
      }
      else {
        uint64_t v12 = 4;
      }
      switch(v12)
      {
        case 1:
          int v13 = *a2;
          goto LABEL_22;
        case 2:
          int v13 = *(unsigned __int16 *)a2;
          goto LABEL_22;
        case 3:
          int v13 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_22;
        case 4:
          int v13 = *(_DWORD *)a2;
LABEL_22:
          int v14 = (v13 | (v11 << (8 * v5))) + 2;
          unsigned int v10 = v13 + 2;
          if (v5 < 4) {
            unsigned int v10 = v14;
          }
          break;
        default:
          break;
      }
    }
    if (v10 == 1)
    {
      *a1 = *a2;
      a1[v5] = 1;
    }
    else
    {
      (*(void (**)(unsigned char *))(v4 + 16))(a1);
      *((unsigned char *)v3 + v5) = 0;
    }
  }
  return v3;
}

unsigned __int8 *sub_10016AC78(unsigned __int8 *result, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 1) {
    unint64_t v2 = 1;
  }
  unsigned int v3 = result[v2];
  unsigned int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *result;
        goto LABEL_12;
      case 2:
        int v6 = *(unsigned __int16 *)result;
        goto LABEL_12;
      case 3:
        int v6 = *(unsigned __int16 *)result | (result[2] << 16);
        goto LABEL_12;
      case 4:
        int v6 = *(_DWORD *)result;
LABEL_12:
        int v7 = (v6 | (v4 << (8 * v2))) + 2;
        unsigned int v3 = v6 + 2;
        if (v2 < 4) {
          unsigned int v3 = v7;
        }
        break;
      default:
        break;
    }
  }
  if (v3 != 1) {
    return (unsigned __int8 *)(*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
  return result;
}

unsigned char *sub_10016AD70(unsigned char *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 1uLL) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    *a1 = *a2;
    char v10 = 1;
  }
  else
  {
    (*(void (**)(unsigned char *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1);
    char v10 = 0;
  }
  a1[v4] = v10;
  return a1;
}

unsigned __int8 *sub_10016AEA4(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 1uLL) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 != 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_27;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_27;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_27;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_27:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      *a1 = *a2;
      char v18 = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      char v18 = 0;
    }
    a1[v7] = v18;
  }
  return a1;
}

unsigned char *sub_10016B0AC(unsigned char *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 1uLL) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    *a1 = *a2;
    char v10 = 1;
  }
  else
  {
    (*(void (**)(unsigned char *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(a1);
    char v10 = 0;
  }
  a1[v4] = v10;
  return a1;
}

unsigned __int8 *sub_10016B1E0(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 1uLL) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 != 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_27;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_27;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_27;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_27:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      *a1 = *a2;
      char v18 = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
      char v18 = 0;
    }
    a1[v7] = v18;
  }
  return a1;
}

uint64_t sub_10016B3E8(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v3 + 64) <= 1uLL) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_23;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 254) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v9 < 2)
    {
LABEL_23:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 2) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_23;
  }
LABEL_15:
  int v10 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v10 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v5 | v10) + 255;
}

void sub_10016B518(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 1) {
    unint64_t v5 = 1;
  }
  size_t v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v8 = a2 - 255;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x10016B6DCLL);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_10016B704(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  if (*(void *)(v2 + 64) <= 1uLL) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  uint64_t v4 = a1[v3];
  int v5 = v4 - 2;
  if (v4 >= 2)
  {
    if (v3 <= 3) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_13;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_13;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_13;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_13:
        unsigned int v8 = (v7 | (v5 << (8 * v3))) + 2;
        LODWORD(v4) = v7 + 2;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v8;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_10016B7B8(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 1uLL) {
    size_t v4 = 1;
  }
  else {
    size_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (a2 > 1)
  {
    unsigned int v5 = a2 - 2;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if (v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if (v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

unsigned char *sub_10016B88C(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10016B958);
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

unsigned char *sub_10016B984(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10016BA20);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10016BA48()
{
  return swift_getWitnessTable();
}

uint64_t sub_10016BA64()
{
  return swift_getWitnessTable();
}

uint64_t sub_10016BA80()
{
  return swift_getWitnessTable();
}

uint64_t sub_10016BA9C()
{
  return swift_getWitnessTable();
}

uint64_t sub_10016BAB8()
{
  return swift_getWitnessTable();
}

uint64_t sub_10016BAD4()
{
  return swift_getWitnessTable();
}

uint64_t sub_10016BAF0()
{
  return swift_getWitnessTable();
}

uint64_t sub_10016BB0C()
{
  return swift_getWitnessTable();
}

uint64_t sub_10016BB28()
{
  return swift_getWitnessTable();
}

uint64_t sub_10016BB44()
{
  return 2;
}

void sub_10016BB4C(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a1;
  v7[4] = a4;
  _OWORD v7[5] = a5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_10016FE18;
  v7[3] = &unk_1001CF3D8;
  unsigned int v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  [v5 handleHeartbeatWithReply:v6];
  _Block_release(v6);
}

uint64_t WoofRequest.heartbeat()()
{
  return _swift_task_switch(sub_10016BC20, 0, 0);
}

uint64_t sub_10016BC20()
{
  if (qword_1001E4CA0 != -1) {
    swift_once();
  }
  if (qword_1001E6228)
  {
    unsigned int v4 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1001E5008 + dword_1001E5008);
    unint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 16) = v1;
    *unint64_t v1 = v0;
    v1[1] = sub_100012AB8;
    return v4((uint64_t)sub_10016BB4C, 0);
  }
  else
  {
    int v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
}

uint64_t sub_10016BD44(uint64_t a1)
{
  unint64_t v2 = sub_10016BECC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10016BD80(uint64_t a1)
{
  unint64_t v2 = sub_10016BECC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t WoofRequest.encode(to:)(void *a1)
{
  uint64_t v2 = sub_100012960(&qword_1001E5CB8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_10016BECC();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_10016BECC()
{
  unint64_t result = qword_1001E5CC0;
  if (!qword_1001E5CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5CC0);
  }
  return result;
}

ValueMetadata *type metadata accessor for WoofRequest()
{
  return &type metadata for WoofRequest;
}

ValueMetadata *type metadata accessor for WoofRequest.CodingKeys()
{
  return &type metadata for WoofRequest.CodingKeys;
}

unint64_t sub_10016BF44()
{
  unint64_t result = qword_1001E5CC8;
  if (!qword_1001E5CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5CC8);
  }
  return result;
}

unint64_t sub_10016BF9C()
{
  unint64_t result = qword_1001E5CD0;
  if (!qword_1001E5CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5CD0);
  }
  return result;
}

uint64_t sub_10016BFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10016C000()
{
  return swift_release();
}

void sub_10016C008(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a1;
  v7[4] = a4;
  _OWORD v7[5] = a5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_10016FE18;
  v7[3] = &unk_1001CF468;
  unsigned int v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  [v5 getDeveloperModeEnabledWithReply:v6];
  _Block_release(v6);
}

uint64_t DeveloperModeRequest.getDeveloperModeEnabled()()
{
  return _swift_task_switch(sub_10016C0DC, 0, 0);
}

uint64_t sub_10016C0DC()
{
  if (qword_1001E4C28 != -1) {
    swift_once();
  }
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1001E5000 + dword_1001E5000);
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_10016C1CC;
  return v3((uint64_t)sub_10016C008, 0);
}

uint64_t sub_10016C1CC(char a1)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (v1) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = a1 & 1;
  }
  return v4(v5);
}

uint64_t DeveloperModeRequest.setDeveloperModeEnabled(_:)(char a1)
{
  *(unsigned char *)(v1 + 48) = a1;
  return _swift_task_switch(sub_10016C2F4, 0, 0);
}

uint64_t sub_10016C2F4()
{
  if (qword_1001E4C28 != -1) {
    swift_once();
  }
  char v1 = *(unsigned char *)(v0 + 48);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 16) = v2;
  *(unsigned char *)(v2 + 16) = v1;
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 24) = v3;
  *(void *)(v3 + 16) = sub_10016C6DC;
  *(void *)(v3 + 24) = v2;
  unsigned int v6 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1001E4FD8 + dword_1001E4FD8);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_10016C428;
  return v6((uint64_t)sub_100151570, v3);
}

uint64_t sub_10016C428()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10016C5A8;
  }
  else {
    uint64_t v2 = sub_10016C53C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10016C53C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10016C5A8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_10016C614(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  v9[4] = a4;
  v9[5] = a5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_10016FE18;
  v9[3] = &unk_1001CF440;
  uint64_t v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  [a1 setDeveloperModeEnabled:a6 & 1 reply:v8];
  _Block_release(v8);
}

void sub_10016C6DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_10016C614(a1, a2, a3, a4, a5, *(unsigned char *)(v5 + 16));
}

uint64_t sub_10016C6E4(uint64_t a1)
{
  unint64_t v2 = sub_10016C86C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10016C720(uint64_t a1)
{
  unint64_t v2 = sub_10016C86C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t DeveloperModeRequest.encode(to:)(void *a1)
{
  uint64_t v2 = sub_100012960(&qword_1001E5CE8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_10016C86C();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_10016C86C()
{
  unint64_t result = qword_1001E5CF0;
  if (!qword_1001E5CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5CF0);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeveloperModeRequest()
{
  return &type metadata for DeveloperModeRequest;
}

ValueMetadata *type metadata accessor for DeveloperModeRequest.CodingKeys()
{
  return &type metadata for DeveloperModeRequest.CodingKeys;
}

unint64_t sub_10016C8E4()
{
  unint64_t result = qword_1001E5CF8;
  if (!qword_1001E5CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5CF8);
  }
  return result;
}

unint64_t sub_10016C93C()
{
  unint64_t result = qword_1001E5D00;
  if (!qword_1001E5D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5D00);
  }
  return result;
}

uint64_t sub_10016C990(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10016C9A0()
{
  return swift_release();
}

id static XPCClient.interface()()
{
  id v0 = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP20AttributionKitCommon17XPCClientProtocol_];

  return v0;
}

id XPCClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id XPCClient.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  UUID.init()();
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, "init");
}

uint64_t _s20AttributionKitCommon9XPCClientC14handleMessagesyy10Foundation4DataVF_0()
{
  type metadata accessor for PropertyListDecoder();
  swift_allocObject();
  PropertyListDecoder.init()();
  sub_100012960(&qword_1001E4EB0);
  sub_10016D078();
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
  swift_release();
  uint64_t v0 = *(void *)(v10 + 16);
  if (v0)
  {
    id v1 = (uint64_t *)(v10 + 40);
    do
    {
      uint64_t v2 = *v1;
      if (*v1)
      {
        uint64_t v3 = *(v1 - 1);
        sub_100012960(&qword_1001E4780);
        uint64_t v4 = swift_allocObject();
        *(_OWORD *)(v4 + 16) = xmmword_100179990;
        *(void *)(v4 + 56) = &type metadata for String;
        *(void *)(v4 + 32) = v3;
        *(void *)(v4 + 40) = v2;
        swift_bridgeObjectRetain_n();
        print(_:separator:terminator:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        if (qword_1001E4C50 != -1) {
          swift_once();
        }
        uint64_t v5 = type metadata accessor for Logger();
        sub_100012E74(v5, (uint64_t)static Logger.xpc);
        unsigned int v6 = Logger.logObject.getter();
        os_log_type_t v7 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v6, v7))
        {
          uint64_t v8 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v8 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, v7, "Connection established", v8, 2u);
          swift_slowDealloc();
        }
      }
      v1 += 2;
      --v0;
    }
    while (v0);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_10016CF94()
{
  return type metadata accessor for XPCClient();
}

uint64_t type metadata accessor for XPCClient()
{
  uint64_t result = qword_1001E5D38;
  if (!qword_1001E5D38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10016CFE8()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_10016D078()
{
  unint64_t result = qword_1001E5D48;
  if (!qword_1001E5D48)
  {
    sub_100011ECC(&qword_1001E4EB0);
    sub_10016D0EC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5D48);
  }
  return result;
}

unint64_t sub_10016D0EC()
{
  unint64_t result = qword_1001E5D50;
  if (!qword_1001E5D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5D50);
  }
  return result;
}

Swift::Bool __swiftcall isAdAttributionKitEnabled()()
{
  uint64_t v3 = &type metadata for FeatureFlag;
  unint64_t v4 = sub_10014A6FC();
  v2[0] = 0;
  char v0 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v2);
  return v0 & 1;
}

Swift::Bool __swiftcall isTestingEnabled()()
{
  uint64_t v3 = &type metadata for FeatureFlag;
  unint64_t v4 = sub_10014A6FC();
  v2[0] = 1;
  char v0 = isFeatureEnabled(_:)();
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v2);
  return v0 & 1;
}

unsigned char *storeEnumTagSinglePayload for FeatureFlag(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10016D2B8);
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

ValueMetadata *type metadata accessor for FeatureFlag()
{
  return &type metadata for FeatureFlag;
}

unint64_t sub_10016D2F4()
{
  unint64_t result = qword_1001E5D58;
  if (!qword_1001E5D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5D58);
  }
  return result;
}

const char *sub_10016D348()
{
  return "AdAttributionKit";
}

const char *sub_10016D35C()
{
  if (*v0) {
    return "Testing";
  }
  else {
    return "Service";
  }
}

unint64_t sub_10016D384(char a1)
{
  unint64_t result = 0x6E776F6E6B6E75;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6165627472616568;
      break;
    case 2:
      unint64_t result = 0x6F68747541746F6ELL;
      break;
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    case 4:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000016;
      break;
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    case 7:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 8:
      unint64_t result = 0xD00000000000001BLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_10016D4C4()
{
  return sub_10016D384(*v0);
}

uint64_t sub_10016D4CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10016E5D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10016D4F4(uint64_t a1)
{
  unint64_t v2 = sub_10016E228();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10016D530(uint64_t a1)
{
  unint64_t v2 = sub_10016E228();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10016D56C(uint64_t a1)
{
  unint64_t v2 = sub_10016E3CC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10016D5A8(uint64_t a1)
{
  unint64_t v2 = sub_10016E3CC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10016D5E4(uint64_t a1)
{
  unint64_t v2 = sub_10016E4C8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10016D620(uint64_t a1)
{
  unint64_t v2 = sub_10016E4C8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10016D65C(uint64_t a1)
{
  unint64_t v2 = sub_10016E324();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10016D698(uint64_t a1)
{
  unint64_t v2 = sub_10016E324();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10016D6D4(uint64_t a1)
{
  unint64_t v2 = sub_10016E2D0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10016D710(uint64_t a1)
{
  unint64_t v2 = sub_10016E2D0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10016D74C(uint64_t a1)
{
  unint64_t v2 = sub_10016E27C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10016D788(uint64_t a1)
{
  unint64_t v2 = sub_10016E27C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10016D7C4(uint64_t a1)
{
  unint64_t v2 = sub_10016E378();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10016D800(uint64_t a1)
{
  unint64_t v2 = sub_10016E378();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10016D83C(uint64_t a1)
{
  unint64_t v2 = sub_10016E474();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10016D878(uint64_t a1)
{
  unint64_t v2 = sub_10016E474();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10016D8B4(uint64_t a1)
{
  unint64_t v2 = sub_10016E420();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10016D8F0(uint64_t a1)
{
  unint64_t v2 = sub_10016E420();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10016D92C(uint64_t a1)
{
  unint64_t v2 = sub_10016E51C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10016D968(uint64_t a1)
{
  unint64_t v2 = sub_10016E51C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t AttributionKitError.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v55 = a2;
  uint64_t v3 = sub_100012960(&qword_1001E5D60);
  uint64_t v53 = *(void *)(v3 - 8);
  uint64_t v54 = v3;
  __chkstk_darwin(v3);
  uint64_t v52 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100012960(&qword_1001E5D68);
  uint64_t v50 = *(void *)(v5 - 8);
  uint64_t v51 = v5;
  __chkstk_darwin(v5);
  char v49 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100012960(&qword_1001E5D70);
  uint64_t v47 = *(void *)(v7 - 8);
  uint64_t v48 = v7;
  __chkstk_darwin(v7);
  uint64_t v46 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100012960(&qword_1001E5D78);
  uint64_t v44 = *(void *)(v9 - 8);
  uint64_t v45 = v9;
  __chkstk_darwin(v9);
  uint64_t v43 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100012960(&qword_1001E5D80);
  uint64_t v41 = *(void *)(v11 - 8);
  uint64_t v42 = v11;
  __chkstk_darwin(v11);
  uint64_t v40 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_100012960(&qword_1001E5D88);
  uint64_t v38 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v37 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_100012960(&qword_1001E5D90);
  uint64_t v35 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100012960(&qword_1001E5D98);
  uint64_t v34 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  char v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100012960(&qword_1001E5DA0);
  uint64_t v33 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100012960(&qword_1001E5DA8);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v56 = v22;
  uint64_t v57 = v23;
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v33 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_10016E228();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  switch((char)v55)
  {
    case 1:
      char v59 = 1;
      sub_10016E4C8();
      uint64_t v28 = v56;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v18, v16);
      goto LABEL_12;
    case 2:
      char v60 = 2;
      sub_10016E474();
      uint64_t v28 = v56;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v36);
      goto LABEL_12;
    case 3:
      char v61 = 3;
      sub_10016E420();
      uint64_t v29 = v37;
      uint64_t v28 = v56;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v29, v39);
      goto LABEL_12;
    case 4:
      char v62 = 4;
      sub_10016E3CC();
      uint64_t v30 = v40;
      uint64_t v28 = v56;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v32 = v41;
      uint64_t v31 = v42;
      goto LABEL_11;
    case 5:
      char v63 = 5;
      sub_10016E378();
      uint64_t v30 = v43;
      uint64_t v28 = v56;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v32 = v44;
      uint64_t v31 = v45;
      goto LABEL_11;
    case 6:
      char v64 = 6;
      sub_10016E324();
      uint64_t v30 = v46;
      uint64_t v28 = v56;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v32 = v47;
      uint64_t v31 = v48;
      goto LABEL_11;
    case 7:
      char v65 = 7;
      sub_10016E2D0();
      uint64_t v30 = v49;
      uint64_t v28 = v56;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v32 = v50;
      uint64_t v31 = v51;
      goto LABEL_11;
    case 8:
      char v66 = 8;
      sub_10016E27C();
      uint64_t v30 = v52;
      uint64_t v28 = v56;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v32 = v53;
      uint64_t v31 = v54;
LABEL_11:
      (*(void (**)(char *, uint64_t))(v32 + 8))(v30, v31);
LABEL_12:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v25, v28);
      break;
    default:
      char v58 = 0;
      sub_10016E51C();
      uint64_t v26 = v56;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v21, v19);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v25, v26);
      break;
  }
  return result;
}

unint64_t sub_10016E228()
{
  unint64_t result = qword_1001E5DB0;
  if (!qword_1001E5DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5DB0);
  }
  return result;
}

unint64_t sub_10016E27C()
{
  unint64_t result = qword_1001E5DB8;
  if (!qword_1001E5DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5DB8);
  }
  return result;
}

unint64_t sub_10016E2D0()
{
  unint64_t result = qword_1001E5DC0;
  if (!qword_1001E5DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5DC0);
  }
  return result;
}

unint64_t sub_10016E324()
{
  unint64_t result = qword_1001E5DC8;
  if (!qword_1001E5DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5DC8);
  }
  return result;
}

unint64_t sub_10016E378()
{
  unint64_t result = qword_1001E5DD0;
  if (!qword_1001E5DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5DD0);
  }
  return result;
}

unint64_t sub_10016E3CC()
{
  unint64_t result = qword_1001E5DD8;
  if (!qword_1001E5DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5DD8);
  }
  return result;
}

unint64_t sub_10016E420()
{
  unint64_t result = qword_1001E5DE0;
  if (!qword_1001E5DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5DE0);
  }
  return result;
}

unint64_t sub_10016E474()
{
  unint64_t result = qword_1001E5DE8;
  if (!qword_1001E5DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5DE8);
  }
  return result;
}

unint64_t sub_10016E4C8()
{
  unint64_t result = qword_1001E5DF0;
  if (!qword_1001E5DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5DF0);
  }
  return result;
}

unint64_t sub_10016E51C()
{
  unint64_t result = qword_1001E5DF8;
  if (!qword_1001E5DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5DF8);
  }
  return result;
}

char *AttributionKitError.init(from:)(void *a1)
{
  return sub_10016E974(a1);
}

char *sub_10016E588@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10016E974(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_10016E5B4(void *a1)
{
  return AttributionKitError.encode(to:)(a1, *v1);
}

uint64_t sub_10016E5D0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6165627472616568 && a2 == 0xE900000000000074 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F68747541746F6ELL && a2 == 0xED000064657A6972 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000100188AF0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x8000000100188B10 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000100188B30 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000100188B50 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000100188B70 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x8000000100188B90)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 8;
    }
    else {
      return 9;
    }
  }
}

char *sub_10016E974(void *a1)
{
  uint64_t v2 = sub_100012960(&qword_1001E5EB0);
  uint64_t v64 = *(void *)(v2 - 8);
  uint64_t v65 = v2;
  __chkstk_darwin(v2);
  long long v69 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100012960(&qword_1001E5EB8);
  uint64_t v62 = *(void *)(v4 - 8);
  uint64_t v63 = v4;
  __chkstk_darwin(v4);
  uint64_t v72 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100012960(&qword_1001E5EC0);
  uint64_t v60 = *(void *)(v6 - 8);
  uint64_t v61 = v6;
  __chkstk_darwin(v6);
  long long v68 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100012960(&qword_1001E5EC8);
  uint64_t v58 = *(void *)(v8 - 8);
  uint64_t v59 = v8;
  __chkstk_darwin(v8);
  long long v71 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100012960(&qword_1001E5ED0);
  uint64_t v56 = *(void *)(v10 - 8);
  uint64_t v57 = v10;
  __chkstk_darwin(v10);
  long long v70 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_100012960(&qword_1001E5ED8);
  uint64_t v55 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  uint64_t v67 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_100012960(&qword_1001E5EE0);
  uint64_t v53 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  char v66 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_100012960(&qword_1001E5EE8);
  uint64_t v51 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100012960(&qword_1001E5EF0);
  uint64_t v49 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  char v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100012960(&qword_1001E5EF8);
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = a1[3];
  Swift::String v73 = a1;
  sub_100012D78(a1, v23);
  sub_10016E228();
  uint64_t v24 = v74;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v24)
  {
    uint64_t v48 = v18;
    uint64_t v47 = v16;
    uint64_t v26 = v70;
    uint64_t v25 = v71;
    char v27 = v72;
    uint64_t v74 = v20;
    uint64_t v28 = v22;
    uint64_t v29 = KeyedDecodingContainer.allKeys.getter();
    if (*(void *)(v29 + 16) == 1)
    {
      uint64_t v22 = (char *)*(unsigned __int8 *)(v29 + 32);
      switch(*(unsigned char *)(v29 + 32))
      {
        case 1:
          uint64_t v30 = v74;
          char v76 = 1;
          sub_10016E4C8();
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          uint64_t v32 = *(void (**)(char *, uint64_t))(v51 + 8);
          uint64_t v33 = v15;
          uint64_t v34 = &v86;
          goto LABEL_9;
        case 2:
          uint64_t v30 = v74;
          char v77 = 2;
          sub_10016E474();
          uint64_t v39 = v66;
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          uint64_t v32 = *(void (**)(char *, uint64_t))(v53 + 8);
          uint64_t v33 = v39;
          uint64_t v34 = &v87;
          goto LABEL_9;
        case 3:
          uint64_t v30 = v74;
          char v78 = 3;
          sub_10016E420();
          uint64_t v40 = v67;
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          uint64_t v32 = *(void (**)(char *, uint64_t))(v55 + 8);
          uint64_t v33 = v40;
          uint64_t v34 = &v85;
          goto LABEL_9;
        case 4:
          uint64_t v30 = v74;
          char v79 = 4;
          sub_10016E3CC();
          uint64_t v25 = v26;
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          uint64_t v42 = v56;
          uint64_t v41 = v57;
          goto LABEL_16;
        case 5:
          uint64_t v30 = v74;
          char v80 = 5;
          sub_10016E378();
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          uint64_t v42 = v58;
          uint64_t v41 = v59;
          goto LABEL_16;
        case 6:
          uint64_t v30 = v74;
          char v81 = 6;
          sub_10016E324();
          uint64_t v25 = v68;
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          uint64_t v42 = v60;
          uint64_t v41 = v61;
LABEL_16:
          uint64_t v32 = *(void (**)(char *, uint64_t))(v42 + 8);
          uint64_t v33 = v25;
          goto LABEL_17;
        case 7:
          uint64_t v44 = v74;
          char v82 = 7;
          sub_10016E2D0();
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          (*(void (**)(char *, uint64_t))(v62 + 8))(v27, v63);
          swift_bridgeObjectRelease();
          uint64_t v30 = v44;
          goto LABEL_18;
        case 8:
          uint64_t v45 = v74;
          char v83 = 8;
          sub_10016E27C();
          uint64_t v46 = v69;
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          (*(void (**)(char *, uint64_t))(v64 + 8))(v46, v65);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v45 + 8))(v28, v19);
          break;
        default:
          uint64_t v30 = v74;
          char v75 = 0;
          sub_10016E51C();
          uint64_t v31 = v48;
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          uint64_t v32 = *(void (**)(char *, uint64_t))(v49 + 8);
          uint64_t v33 = v31;
          uint64_t v34 = &v84;
LABEL_9:
          uint64_t v41 = *(v34 - 32);
LABEL_17:
          v32(v33, v41);
          swift_bridgeObjectRelease();
LABEL_18:
          (*(void (**)(char *, uint64_t))(v30 + 8))(v28, v19);
          break;
      }
    }
    else
    {
      uint64_t v35 = v19;
      uint64_t v36 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v38 = v37;
      sub_100012960(&qword_1001E4F78);
      *uint64_t v38 = &type metadata for AttributionKitError;
      KeyedDecodingContainer.codingPath.getter();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v36 - 8) + 104))(v38, enum case for DecodingError.typeMismatch(_:), v36);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v74 + 8))(v22, v35);
    }
  }
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v73);
  return v22;
}

unint64_t sub_10016F428()
{
  unint64_t result = qword_1001E5E00;
  if (!qword_1001E5E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E00);
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributionKitError()
{
  return &type metadata for AttributionKitError;
}

unsigned char *_s20AttributionKitCommon19AttributionKitErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x10016F560);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributionKitError.CodingKeys()
{
  return &type metadata for AttributionKitError.CodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.UnknownCodingKeys()
{
  return &type metadata for AttributionKitError.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.HeartbeatCodingKeys()
{
  return &type metadata for AttributionKitError.HeartbeatCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.NotAuthorizedCodingKeys()
{
  return &type metadata for AttributionKitError.NotAuthorizedCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.ServiceUnavailableCodingKeys()
{
  return &type metadata for AttributionKitError.ServiceUnavailableCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.GenericNetworkRequestFailureCodingKeys()
{
  return &type metadata for AttributionKitError.GenericNetworkRequestFailureCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.MissingAttributionViewCodingKeys()
{
  return &type metadata for AttributionKitError.MissingAttributionViewCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.ImpressionExpiredCodingKeys()
{
  return &type metadata for AttributionKitError.ImpressionExpiredCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.InvalidImpressionJWSHeaderCodingKeys()
{
  return &type metadata for AttributionKitError.InvalidImpressionJWSHeaderCodingKeys;
}

ValueMetadata *type metadata accessor for AttributionKitError.InvalidImpressionJWSPayloadCodingKeys()
{
  return &type metadata for AttributionKitError.InvalidImpressionJWSPayloadCodingKeys;
}

unint64_t sub_10016F62C()
{
  unint64_t result = qword_1001E5E08;
  if (!qword_1001E5E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E08);
  }
  return result;
}

unint64_t sub_10016F684()
{
  unint64_t result = qword_1001E5E10;
  if (!qword_1001E5E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E10);
  }
  return result;
}

unint64_t sub_10016F6DC()
{
  unint64_t result = qword_1001E5E18;
  if (!qword_1001E5E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E18);
  }
  return result;
}

unint64_t sub_10016F734()
{
  unint64_t result = qword_1001E5E20;
  if (!qword_1001E5E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E20);
  }
  return result;
}

unint64_t sub_10016F78C()
{
  unint64_t result = qword_1001E5E28;
  if (!qword_1001E5E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E28);
  }
  return result;
}

unint64_t sub_10016F7E4()
{
  unint64_t result = qword_1001E5E30;
  if (!qword_1001E5E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E30);
  }
  return result;
}

unint64_t sub_10016F83C()
{
  unint64_t result = qword_1001E5E38;
  if (!qword_1001E5E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E38);
  }
  return result;
}

unint64_t sub_10016F894()
{
  unint64_t result = qword_1001E5E40;
  if (!qword_1001E5E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E40);
  }
  return result;
}

unint64_t sub_10016F8EC()
{
  unint64_t result = qword_1001E5E48;
  if (!qword_1001E5E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E48);
  }
  return result;
}

unint64_t sub_10016F944()
{
  unint64_t result = qword_1001E5E50;
  if (!qword_1001E5E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E50);
  }
  return result;
}

unint64_t sub_10016F99C()
{
  unint64_t result = qword_1001E5E58;
  if (!qword_1001E5E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E58);
  }
  return result;
}

unint64_t sub_10016F9F4()
{
  unint64_t result = qword_1001E5E60;
  if (!qword_1001E5E60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E60);
  }
  return result;
}

unint64_t sub_10016FA4C()
{
  unint64_t result = qword_1001E5E68;
  if (!qword_1001E5E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E68);
  }
  return result;
}

unint64_t sub_10016FAA4()
{
  unint64_t result = qword_1001E5E70;
  if (!qword_1001E5E70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E70);
  }
  return result;
}

unint64_t sub_10016FAFC()
{
  unint64_t result = qword_1001E5E78;
  if (!qword_1001E5E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E78);
  }
  return result;
}

unint64_t sub_10016FB54()
{
  unint64_t result = qword_1001E5E80;
  if (!qword_1001E5E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E80);
  }
  return result;
}

unint64_t sub_10016FBAC()
{
  unint64_t result = qword_1001E5E88;
  if (!qword_1001E5E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E88);
  }
  return result;
}

unint64_t sub_10016FC04()
{
  unint64_t result = qword_1001E5E90;
  if (!qword_1001E5E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E90);
  }
  return result;
}

unint64_t sub_10016FC5C()
{
  unint64_t result = qword_1001E5E98;
  if (!qword_1001E5E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5E98);
  }
  return result;
}

unint64_t sub_10016FCB4()
{
  unint64_t result = qword_1001E5EA0;
  if (!qword_1001E5EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5EA0);
  }
  return result;
}

unint64_t sub_10016FD0C()
{
  unint64_t result = qword_1001E5EA8;
  if (!qword_1001E5EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5EA8);
  }
  return result;
}

void sub_10016FD60(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a1;
  v7[4] = a4;
  _OWORD v7[5] = a5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_10016FE18;
  v7[3] = &unk_1001CF7A0;
  unsigned int v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  [v5 fetchReengagementTokensWithReply:v6];
  _Block_release(v6);
}

uint64_t sub_10016FE18(uint64_t a1, void *a2)
{
  int v3 = *(void (**)(uint64_t, unint64_t))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  v3(v5, v7);
  sub_100020930(v5, v7);

  return swift_release();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> TokenFetchRequest.fetchReengagementTokens()()
{
  if (qword_1001E4C30 != -1) {
    swift_once();
  }
  if (qword_1001E60F8) {
    sub_1001544E4((void (*)(uint64_t *, uint64_t, unint64_t, uint64_t (*)(), uint64_t))sub_10016FD60);
  }
}

uint64_t sub_10016FF24(uint64_t a1)
{
  unint64_t v2 = sub_1001700AC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10016FF60(uint64_t a1)
{
  unint64_t v2 = sub_1001700AC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t TokenFetchRequest.encode(to:)(void *a1)
{
  uint64_t v2 = sub_100012960(&qword_1001E5F00);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012D78(a1, a1[3]);
  sub_1001700AC();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_1001700AC()
{
  unint64_t result = qword_1001E5F08;
  if (!qword_1001E5F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5F08);
  }
  return result;
}

unint64_t sub_100170124()
{
  unint64_t result = qword_1001E5F10;
  if (!qword_1001E5F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5F10);
  }
  return result;
}

unint64_t sub_10017017C()
{
  unint64_t result = qword_1001E5F18;
  if (!qword_1001E5F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5F18);
  }
  return result;
}

uint64_t sub_1001701D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1001701E0()
{
  return swift_release();
}

const char *LogKey.Prefix.fallbackActivityName.getter(char a1)
{
  if (!a1) {
    return "General";
  }
  if (a1 == 1) {
    return "woofctl";
  }
  return "nope nope";
}

uint64_t LogKey.Prefix.rawValue.getter(char a1)
{
  if (!a1) {
    return 5129543;
  }
  if (a1 == 1) {
    return 4931905;
  }
  return 1162891086;
}

uint64_t sub_100170274(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10015B358(*a1, *a2);
}

Swift::Int sub_100170280()
{
  return Hasher._finalize()();
}

uint64_t sub_10017030C()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100170384()
{
  return Hasher._finalize()();
}

unint64_t sub_10017040C@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = _s20AttributionKitCommon6LogKeyV6PrefixO8rawValueAESgSS_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_10017043C(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE300000000000000;
  unint64_t v4 = 0xE300000000000000;
  uint64_t v5 = 4931905;
  if (v2 != 1)
  {
    uint64_t v5 = 1162891086;
    unint64_t v4 = 0xE400000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 5129543;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t LogKey.Representation.init(from:)(void *a1)
{
  uint64_t v3 = (uint64_t)sub_100012D78(a1, a1[3]);
  dispatch thunk of Decoder.singleValueContainer()();
  if (!v1)
  {
    sub_100012D78(v5, v5[3]);
    uint64_t v3 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v5);
  }
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  return v3;
}

uint64_t LogKey.Representation.encode(to:)(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  char v6 = a4 & 1;
  sub_100012D78(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  LogKey.Representation.description.getter(a2, a3, v6);
  sub_10004DD80((uint64_t)v8, v9);
  dispatch thunk of SingleValueEncodingContainer.encode(_:)();
  swift_bridgeObjectRelease();
  return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v8);
}

uint64_t LogKey.Representation.description.getter(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3 = a1;
  if (a3)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    int v4 = a1;
    if ((_BYTE)a1)
    {
      if (a1 == 1) {
        uint64_t v5 = 4931905;
      }
      else {
        uint64_t v5 = 1162891086;
      }
      if (v4 == 1) {
        unint64_t v6 = 0xE300000000000000;
      }
      else {
        unint64_t v6 = 0xE400000000000000;
      }
    }
    else
    {
      unint64_t v6 = 0xE300000000000000;
      uint64_t v5 = 5129543;
    }
    unint64_t v7 = v6;
    String.append(_:)(*(Swift::String *)&v5);
    swift_bridgeObjectRelease();
    sub_100170B5C();
    v8._uint64_t countAndFlagsBits = String.init<A>(_:radix:uppercase:)();
    String.append(_:)(v8);
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_100170704()
{
  return LogKey.Representation.description.getter(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_100170710@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_100012D78(a1, a1[3]);
  dispatch thunk of Decoder.singleValueContainer()();
  if (v2) {
    return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  }
  sub_100012D78(v9, v9[3]);
  uint64_t v5 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
  uint64_t v7 = v6;
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v9);
  uint64_t result = _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 16) = 1;
  return result;
}

uint64_t sub_1001707E4(void *a1)
{
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  char v4 = *(unsigned char *)(v1 + 16);
  sub_100012D78(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  LogKey.Representation.description.getter(v2, v3, v4);
  sub_10004DD80((uint64_t)v6, v7);
  dispatch thunk of SingleValueEncodingContainer.encode(_:)();
  swift_bridgeObjectRelease();
  return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v6);
}

uint64_t LogKey.representation.getter(uint64_t a1, uint64_t a2, char a3)
{
  return a1;
}

uint64_t LogKey.init(prefix:)(unsigned __int8 a1)
{
  return a1;
}

void *LogKey.init(from:)(void *a1)
{
  uint64_t result = sub_100170BB0(a1);
  if (v1) {
    return (void *)v3;
  }
  return result;
}

uint64_t LogKey.encode(to:)(void *a1)
{
  sub_100012D78(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  sub_10004DD80((uint64_t)v2, v3);
  sub_100170C98();
  dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
  return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v2);
}

void *sub_100170A24@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100170BB0(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6 & 1;
  }
  return result;
}

uint64_t sub_100170A58(void *a1)
{
  sub_100012D78(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  sub_10004DD80((uint64_t)v2, v3);
  sub_100170C98();
  dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
  return _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v2);
}

unint64_t _s20AttributionKitCommon6LogKeyV6PrefixO8rawValueAESgSS_tcfC_0(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1001CD1C0, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

unint64_t sub_100170B5C()
{
  unint64_t result = qword_1001E5F20;
  if (!qword_1001E5F20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5F20);
  }
  return result;
}

void *sub_100170BB0(void *a1)
{
  unint64_t v3 = sub_100012D78(a1, a1[3]);
  dispatch thunk of Decoder.singleValueContainer()();
  if (!v1)
  {
    sub_100012D78(v6, v6[3]);
    sub_100170E78();
    dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)();
    unint64_t v3 = v5;
    _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)v6);
  }
  _s20AttributionKitDaemon17SnoutStoryMetricsVwxx_0((uint64_t)a1);
  return v3;
}

unint64_t sub_100170C98()
{
  unint64_t result = qword_1001E5F28;
  if (!qword_1001E5F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5F28);
  }
  return result;
}

unint64_t sub_100170CF0()
{
  unint64_t result = qword_1001E5F30;
  if (!qword_1001E5F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5F30);
  }
  return result;
}

ValueMetadata *type metadata accessor for LogKey()
{
  return &type metadata for LogKey;
}

unsigned char *storeEnumTagSinglePayload for LogKey.Prefix(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100170E30);
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

ValueMetadata *type metadata accessor for LogKey.Prefix()
{
  return &type metadata for LogKey.Prefix;
}

ValueMetadata *type metadata accessor for LogKey.Representation()
{
  return &type metadata for LogKey.Representation;
}

unint64_t sub_100170E78()
{
  unint64_t result = qword_1001E5F38;
  if (!qword_1001E5F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5F38);
  }
  return result;
}

uint64_t CoarseConversionValue.rawValue.getter(char a1)
{
  if (!a1) {
    return 1751607656;
  }
  if (a1 == 1) {
    return 7827308;
  }
  return 0x6D756964656DLL;
}

uint64_t sub_100170F18(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10015B444(*a1, *a2);
}

Swift::Int sub_100170F24()
{
  return Hasher._finalize()();
}

uint64_t sub_100170FB4()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100171030()
{
  return Hasher._finalize()();
}

unint64_t sub_1001710BC@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = _s20AttributionKitCommon21CoarseConversionValueO03rawF0ACSgSS_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_1001710EC(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE400000000000000;
  unint64_t v4 = 0xE300000000000000;
  uint64_t v5 = 7827308;
  if (v2 != 1)
  {
    uint64_t v5 = 0x6D756964656DLL;
    unint64_t v4 = 0xE600000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 1751607656;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_100171138()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_100171198()
{
  return RawRepresentable<>.encode(to:)();
}

unint64_t _s20AttributionKitCommon21CoarseConversionValueO03rawF0ACSgSS_tcfC_0(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1001CD228, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

unint64_t sub_100171238()
{
  unint64_t result = qword_1001E5F40;
  if (!qword_1001E5F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5F40);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for CoarseConversionValue(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100171358);
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

ValueMetadata *type metadata accessor for CoarseConversionValue()
{
  return &type metadata for CoarseConversionValue;
}

unint64_t sub_100171390()
{
  unint64_t result = qword_1001E5F48;
  if (!qword_1001E5F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1001E5F48);
  }
  return result;
}

Swift::String *ServiceMachName.unsafeMutableAddressor()
{
  return &ServiceMachName;
}

uint64_t URLRequest.httpMethod.setter()
{
  return URLRequest.httpMethod.setter();
}

uint64_t URLRequest.cachePolicy.setter()
{
  return URLRequest.cachePolicy.setter();
}

uint64_t URLRequest.timeoutInterval.setter()
{
  return URLRequest.timeoutInterval.setter();
}

NSURLRequest __swiftcall URLRequest._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)URLRequest._bridgeToObjectiveC()();
  result._internal = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t URLRequest.init(url:cachePolicy:timeoutInterval:)()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

uint64_t URLRequest.url.getter()
{
  return URLRequest.url.getter();
}

uint64_t URLRequest.httpBody.setter()
{
  return URLRequest.httpBody.setter();
}

Swift::Void __swiftcall URLRequest.setValue(_:forHTTPHeaderField:)(Swift::String_optional _, Swift::String forHTTPHeaderField)
{
}

uint64_t type metadata accessor for URLRequest()
{
  return type metadata accessor for URLRequest();
}

uint64_t type metadata accessor for JSONDecoder.DateDecodingStrategy()
{
  return type metadata accessor for JSONDecoder.DateDecodingStrategy();
}

uint64_t dispatch thunk of JSONDecoder.dateDecodingStrategy.setter()
{
  return dispatch thunk of JSONDecoder.dateDecodingStrategy.setter();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t Measurement.init(value:unit:)()
{
  return Measurement.init(value:unit:)();
}

uint64_t Measurement<>.converted(to:)()
{
  return Measurement<>.converted(to:)();
}

uint64_t Measurement<>.formatted()()
{
  return Measurement<>.formatted()();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Notification.userInfo.getter()
{
  return Notification.userInfo.getter();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t URLQueryItem.init(name:value:)()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t URLQueryItem.name.getter()
{
  return URLQueryItem.name.getter();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t URLComponents.queryItems.modify()
{
  return URLComponents.queryItems.modify();
}

uint64_t URLComponents.init(url:resolvingAgainstBaseURL:)()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t URLComponents.url.getter()
{
  return URLComponents.url.getter();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t type metadata accessor for DateComponents()
{
  return type metadata accessor for DateComponents();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t PropertyListDecoder.init()()
{
  return PropertyListDecoder.init()();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t PropertyListEncoder.init()()
{
  return PropertyListEncoder.init()();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t _BridgedStoredNSError.init(_:userInfo:)()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String_optional __swiftcall URL.host(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.host(percentEncoded:)(percentEncoded);
  result.value._object = v2;
  result.value._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t URL.host.getter()
{
  return URL.host.getter();
}

uint64_t URL.port.getter()
{
  return URL.port.getter();
}

uint64_t URL.append<A>(path:directoryHint:)()
{
  return URL.append<A>(path:directoryHint:)();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t URL.appending(queryItems:)()
{
  return URL.appending(queryItems:)();
}

uint64_t URL.appending<A>(path:directoryHint:)()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

uint64_t Data.init(base64Encoded:options:)()
{
  return Data.init(base64Encoded:options:)();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

Swift::String __swiftcall Data.base64EncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1 = Data.base64EncodedString(options:)(options);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return Date.addingTimeInterval(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.> infix(_:_:)()
{
  return static Date.> infix(_:_:)();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t Date.init(timeIntervalSinceNow:)()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t Date.init(timeIntervalSince1970:)()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Calendar.dateComponents(_:from:)()
{
  return Calendar.dateComponents(_:from:)();
}

uint64_t Calendar.date(from:)()
{
  return Calendar.date(from:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t static Calendar.Component.== infix(_:_:)()
{
  return static Calendar.Component.== infix(_:_:)();
}

uint64_t type metadata accessor for Calendar.Component()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t _CFObject.hash(into:)()
{
  return _CFObject.hash(into:)();
}

uint64_t _CFObject.hashValue.getter()
{
  return _CFObject.hashValue.getter();
}

uint64_t SKANUTClient.init(privateInput:)()
{
  return SKANUTClient.init(privateInput:)();
}

uint64_t SKANUTClient.blindedElement()()
{
  return SKANUTClient.blindedElement()();
}

uint64_t SKANUTClient.finalize(publicInput:evaluatedElement:proof:publicKey:)()
{
  return SKANUTClient.finalize(publicInput:evaluatedElement:proof:publicKey:)();
}

uint64_t type metadata accessor for SKANUTClient()
{
  return type metadata accessor for SKANUTClient();
}

uint64_t type metadata accessor for Library.Streams.AdAttributionKit.AggregatedReporting.Conversion()
{
  return type metadata accessor for Library.Streams.AdAttributionKit.AggregatedReporting.Conversion();
}

uint64_t type metadata accessor for Library.Streams.AdAttributionKit.AggregatedReporting.Purchase()
{
  return type metadata accessor for Library.Streams.AdAttributionKit.AggregatedReporting.Purchase();
}

uint64_t static StreamResource.source()()
{
  return static StreamResource.source()();
}

uint64_t AdAttributionKitPurchase.inAppPurchaseSubscriptionISO8601Duration.setter()
{
  return AdAttributionKitPurchase.inAppPurchaseSubscriptionISO8601Duration.setter();
}

uint64_t AdAttributionKitPurchase.inAppPurchaseType.setter()
{
  return AdAttributionKitPurchase.inAppPurchaseType.setter();
}

uint64_t AdAttributionKitPurchase.conversionID.setter()
{
  return AdAttributionKitPurchase.conversionID.setter();
}

uint64_t AdAttributionKitPurchase.currencyCode.setter()
{
  return AdAttributionKitPurchase.currencyCode.setter();
}

uint64_t AdAttributionKitPurchase.purchaseDate.setter()
{
  return AdAttributionKitPurchase.purchaseDate.setter();
}

uint64_t AdAttributionKitPurchase.storefrontID.setter()
{
  return AdAttributionKitPurchase.storefrontID.setter();
}

uint64_t AdAttributionKitPurchase.amountCharged.setter()
{
  return AdAttributionKitPurchase.amountCharged.setter();
}

uint64_t AdAttributionKitPurchase.advertisedItemID.setter()
{
  return AdAttributionKitPurchase.advertisedItemID.setter();
}

uint64_t AdAttributionKitPurchase.amountChargedUSD.setter()
{
  return AdAttributionKitPurchase.amountChargedUSD.setter();
}

uint64_t AdAttributionKitPurchase.init()()
{
  return AdAttributionKitPurchase.init()();
}

uint64_t type metadata accessor for AdAttributionKitPurchase()
{
  return type metadata accessor for AdAttributionKitPurchase();
}

uint64_t AdAttributionKitConversion.adNetworkID.setter()
{
  return AdAttributionKitConversion.adNetworkID.setter();
}

uint64_t AdAttributionKitConversion.conversionID.setter()
{
  return AdAttributionKitConversion.conversionID.setter();
}

uint64_t AdAttributionKitConversion.sourceDomain.setter()
{
  return AdAttributionKitConversion.sourceDomain.setter();
}

uint64_t AdAttributionKitConversion.storefrontID.setter()
{
  return AdAttributionKitConversion.storefrontID.setter();
}

uint64_t AdAttributionKitConversion.marketplaceID.setter()
{
  return AdAttributionKitConversion.marketplaceID.setter();
}

uint64_t AdAttributionKitConversion.conversionDate.setter()
{
  return AdAttributionKitConversion.conversionDate.setter();
}

uint64_t AdAttributionKitConversion.conversionType.setter()
{
  return AdAttributionKitConversion.conversionType.setter();
}

uint64_t AdAttributionKitConversion.impressionDate.setter()
{
  return AdAttributionKitConversion.impressionDate.setter();
}

uint64_t AdAttributionKitConversion.publisherItemID.setter()
{
  return AdAttributionKitConversion.publisherItemID.setter();
}

uint64_t AdAttributionKitConversion.advertisedItemID.setter()
{
  return AdAttributionKitConversion.advertisedItemID.setter();
}

uint64_t AdAttributionKitConversion.sourceID.setter()
{
  return AdAttributionKitConversion.sourceID.setter();
}

uint64_t AdAttributionKitConversion.init()()
{
  return AdAttributionKitConversion.init()();
}

uint64_t type metadata accessor for AdAttributionKitConversion()
{
  return type metadata accessor for AdAttributionKitConversion();
}

uint64_t type metadata accessor for AdAttributionKitConversionType()
{
  return type metadata accessor for AdAttributionKitConversionType();
}

uint64_t type metadata accessor for AdAttributionKitInAppPurchaseType()
{
  return type metadata accessor for AdAttributionKitInAppPurchaseType();
}

uint64_t dispatch thunk of Source.sendEvent(_:)()
{
  return dispatch thunk of Source.sendEvent(_:)();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t OSSignposter.init(logger:)()
{
  return OSSignposter.init(logger:)();
}

uint64_t OSSignposter.logHandle.getter()
{
  return OSSignposter.logHandle.getter();
}

uint64_t type metadata accessor for OSSignposter()
{
  return type metadata accessor for OSSignposter();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t XPC_EVENT_KEY_NAME.getter()
{
  return XPC_EVENT_KEY_NAME.getter();
}

uint64_t XPC_TYPE_DICTIONARY.getter()
{
  return XPC_TYPE_DICTIONARY.getter();
}

uint64_t SIG_IGN.getter()
{
  return SIG_IGN.getter();
}

uint64_t DispatchSpecificKey.init()()
{
  return DispatchSpecificKey.init()();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t String.init(data:encoding:)()
{
  return String.init(data:encoding:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

uint64_t String.index(after:)()
{
  return String.index(after:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return String.UTF8View._foreignDistance(from:to:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

Swift::String __swiftcall String.init(repeating:count:)(Swift::String repeating, Swift::Int count)
{
  uint64_t v2 = String.init(repeating:count:)(repeating._countAndFlagsBits, repeating._object, count);
  result._object = v3;
  result._uint64_t countAndFlagsBits = v2;
  return result;
}

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return String.init<A>(_:radix:uppercase:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

{
  return String.subscript.getter();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

{
  return String.init<A>(_:)();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Array._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static AsyncStream.makeStream(of:bufferingPolicy:)()
{
  return static AsyncStream.makeStream(of:bufferingPolicy:)();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return AsyncStream.Continuation.yield(_:)();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return AsyncStream.makeAsyncIterator()();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t Double.write<A>(to:)()
{
  return Double.write<A>(to:)();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Collection<>.popFirst()()
{
  return Collection<>.popFirst()();
}

uint64_t Collection.isEmpty.getter()
{
  return Collection.isEmpty.getter();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t static OS_dispatch_queue.getSpecific<A>(key:)()
{
  return static OS_dispatch_queue.getSpecific<A>(key:)();
}

uint64_t OS_dispatch_queue.setSpecific<A>(key:value:)()
{
  return OS_dispatch_queue.setSpecific<A>(key:value:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t static OS_dispatch_source.makeSignalSource(signal:queue:)()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

Swift::Void __swiftcall OS_dispatch_source.cancel()()
{
}

Swift::Void __swiftcall OS_dispatch_source.activate()()
{
}

uint64_t static os_signpost_type_t.end.getter()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t NSObject.hashValue.getter()
{
  return NSObject.hashValue.getter();
}

void __swiftcall NSDecimal.init(integerLiteral:)(NSDecimal *__return_ptr retstr, Swift::Int integerLiteral)
{
}

void __swiftcall NSDecimal._bridgeToObjectiveC()(NSDecimalNumber *__return_ptr retstr)
{
}

uint64_t static NSDecimal.* infix(_:_:)()
{
  return static NSDecimal.* infix(_:_:)();
}

void __swiftcall NSDecimal.init(_:)(NSDecimal *__return_ptr retstr, Swift::Double a2)
{
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t Optional.debugDescription.getter()
{
  return Optional.debugDescription.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t Substring.index(after:)()
{
  return Substring.index(after:)();
}

uint64_t Substring.distance(from:to:)()
{
  return Substring.distance(from:to:)();
}

uint64_t Substring.subscript.getter()
{
  return Substring.subscript.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t StringProtocol.removingPercentEncoding.getter()
{
  return StringProtocol.removingPercentEncoding.getter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t type metadata accessor for ArraySlice()
{
  return type metadata accessor for ArraySlice();
}

uint64_t ArraySlice.init<A>(_:)()
{
  return ArraySlice.init<A>(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t StaticString.description.getter()
{
  return StaticString.description.getter();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t type metadata accessor for DecodingError()
{
  return type metadata accessor for DecodingError();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t ContinuousClock.init()()
{
  return ContinuousClock.init()();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t type metadata accessor for KeyedDecodingContainer()
{
  return type metadata accessor for KeyedDecodingContainer();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t type metadata accessor for KeyedEncodingContainer()
{
  return type metadata accessor for KeyedEncodingContainer();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return dispatch thunk of SingleValueDecodingContainer.decode(_:)();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)()
{
  return dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return dispatch thunk of SingleValueEncodingContainer.encode(_:)();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)()
{
  return dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t type metadata accessor for Result()
{
  return type metadata accessor for Result();
}

NSNumber __swiftcall UInt64._bridgeToObjectiveC()()
{
  return (NSNumber)UInt64._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return dispatch thunk of Decoder.singleValueContainer()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return dispatch thunk of Encoder.singleValueContainer()();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t TaskLocal.init(wrappedValue:)()
{
  return TaskLocal.init(wrappedValue:)();
}

uint64_t TaskLocal.get()()
{
  return TaskLocal.get()();
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return _CFNumberGetType(number);
}

void CFRelease(CFTypeRef cf)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return _CFStringGetCharactersPtr(theString);
}

CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString)
{
  return _CFStringGetFastestEncoding(theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t MobileGestalt_copy_marketingProductName_obj()
{
  return _MobileGestalt_copy_marketingProductName_obj();
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

void NSDecimalRound(NSDecimal *result, const NSDecimal *number, NSInteger scale, NSRoundingMode roundingMode)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return _SecCertificateCopyKey(certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return _SecCertificateCreateWithData(allocator, data);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return _SecKeyCopyExternalRepresentation(key, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFHostIsDomainTopLevel()
{
  return __CFHostIsDomainTopLevel();
}

uint64_t _CFPreferencesSetBackupDisabled()
{
  return __CFPreferencesSetBackupDisabled();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void objc_terminate(void)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_transaction_get_description()
{
  return _os_transaction_get_description();
}

uint64_t os_transaction_get_timestamp()
{
  return _os_transaction_get_timestamp();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return _sqlite3_bind_double(a1, a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_bind_null(a1, a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_bind_text16(sqlite3_stmt *a1, int a2, const void *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text16(a1, a2, a3, a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return _sqlite3_changes(a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return _sqlite3_clear_bindings(a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return _sqlite3_close_v2(a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_blob(a1, iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_bytes(a1, iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return _sqlite3_column_count(pStmt);
}

const char *__cdecl sqlite3_column_decltype(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_column_decltype(a1, a2);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return _sqlite3_column_name(a1, N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_type(a1, iCol);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return _sqlite3_create_function(db, zFunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return _sqlite3_errstr(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return _sqlite3_extended_result_codes(a1, onoff);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

sqlite3_stmt *__cdecl sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt)
{
  return _sqlite3_next_stmt(pDb, pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return _sqlite3_reset(pStmt);
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return _sqlite3_sql(pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int sqlite3_stmt_readonly(sqlite3_stmt *pStmt)
{
  return _sqlite3_stmt_readonly(pStmt);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_asyncLet_begin()
{
  return _swift_asyncLet_begin();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_resume()
{
  return _swift_continuation_resume();
}

uint64_t swift_deallocBox()
{
  return _swift_deallocBox();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_task_localValuePop()
{
  return _swift_task_localValuePop();
}

uint64_t swift_task_localValuePush()
{
  return _swift_task_localValuePush();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_dictionary(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_SQLForEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "SQLForEntityClass:");
}

id objc_msgSend_SQLJoinClausesForEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "SQLJoinClausesForEntityClass:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__newSelectSQLWithProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newSelectSQLWithProperties:");
}

id objc_msgSend__newSelectSQLWithProperties_columns_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newSelectSQLWithProperties:columns:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applyBinding_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyBinding:atIndex:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bindArray_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindArray:atPosition:");
}

id objc_msgSend_bindData_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindData:atPosition:");
}

id objc_msgSend_bindDictionary_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindDictionary:atPosition:");
}

id objc_msgSend_bindDouble_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindDouble:atPosition:");
}

id objc_msgSend_bindInt64_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindInt64:atPosition:");
}

id objc_msgSend_bindNullAtPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindNullAtPosition:");
}

id objc_msgSend_bindNumber_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindNumber:atPosition:");
}

id objc_msgSend_bindString_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindString:atPosition:");
}

id objc_msgSend_bindUUID_atPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bindUUID:atPosition:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_clearBindings(void *a1, const char *a2, ...)
{
  return _[a1 clearBindings];
}

id objc_msgSend_comparisonType(void *a1, const char *a2, ...)
{
  return _[a1 comparisonType];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectionNeedsResetForCorruption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionNeedsResetForCorruption:");
}

id objc_msgSend_connectionNeedsResetForReopen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionNeedsResetForReopen:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copySelectSQLWithProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copySelectSQLWithProperties:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_databaseEntityClass(void *a1, const char *a2, ...)
{
  return _[a1 databaseEntityClass];
}

id objc_msgSend_databaseID(void *a1, const char *a2, ...)
{
  return _[a1 databaseID];
}

id objc_msgSend_databaseTable(void *a1, const char *a2, ...)
{
  return _[a1 databaseTable];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultProperties(void *a1, const char *a2, ...)
{
  return _[a1 defaultProperties];
}

id objc_msgSend_deleteFromDatabase(void *a1, const char *a2, ...)
{
  return _[a1 deleteFromDatabase];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithSharedKeySet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithSharedKeySet:");
}

id objc_msgSend_disambiguatedSQLForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disambiguatedSQLForProperty:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateMemoryEntitiesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateMemoryEntitiesUsingBlock:");
}

id objc_msgSend_enumerateMemoryEntitiesWithProperties_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateMemoryEntitiesWithProperties:usingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratePersistentIDsAndProperties_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratePersistentIDsAndProperties:usingBlock:");
}

id objc_msgSend_enumeratePersistentIDsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratePersistentIDsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_externalPropertyValues(void *a1, const char *a2, ...)
{
  return _[a1 externalPropertyValues];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_foreignDatabaseColumnForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foreignDatabaseColumnForProperty:");
}

id objc_msgSend_foreignDatabaseTableForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foreignDatabaseTableForProperty:");
}

id objc_msgSend_foreignDatabaseTablesToDelete(void *a1, const char *a2, ...)
{
  return _[a1 foreignDatabaseTablesToDelete];
}

id objc_msgSend_foreignKeyColumnForTable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foreignKeyColumnForTable:");
}

id objc_msgSend_getValuesForProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getValuesForProperties:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initOnConnection_descriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initOnConnection:descriptor:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithDatabaseEntity_properties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabaseEntity:properties:");
}

id objc_msgSend_initWithDatabaseID_propertyValues_externalPropertyValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabaseID:propertyValues:externalPropertyValues:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithEntityClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntityClass:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLongLong:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithPersistentID_onConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersistentID:onConnection:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isNegative(void *a1, const char *a2, ...)
{
  return _[a1 isNegative];
}

id objc_msgSend_joinClauseForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinClauseForProperty:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_matchesNull(void *a1, const char *a2, ...)
{
  return _[a1 matchesNull];
}

id objc_msgSend_memoryEntityClass(void *a1, const char *a2, ...)
{
  return _[a1 memoryEntityClass];
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return _[a1 objCType];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return _[a1 persistentID];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_predicateMatchingAnyPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingAnyPredicates:");
}

id objc_msgSend_predicateWithProperty_equalToValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithProperty:equalToValue:");
}

id objc_msgSend_predicateWithProperty_value_comparisonType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithProperty:value:comparisonType:");
}

id objc_msgSend_predicates(void *a1, const char *a2, ...)
{
  return _[a1 predicates];
}

id objc_msgSend_property(void *a1, const char *a2, ...)
{
  return _[a1 property];
}

id objc_msgSend_propertyValues(void *a1, const char *a2, ...)
{
  return _[a1 propertyValues];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return _[a1 query];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_reloadFromDatabaseEntity_properties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadFromDatabaseEntity:properties:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setDatabaseID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDatabaseID:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setValues_forExternalProperties_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:forExternalProperties:count:");
}

id objc_msgSend_setValues_forProperties_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:forProperties:count:");
}

id objc_msgSend_setValuesWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValuesWithDictionary:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_sharedKeySetForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedKeySetForKeys:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return _[a1 values];
}