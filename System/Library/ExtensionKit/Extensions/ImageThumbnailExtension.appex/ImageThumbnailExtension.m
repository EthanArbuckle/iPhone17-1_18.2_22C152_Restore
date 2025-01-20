uint64_t sub_1000022C0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v0 = sub_100005214(&qword_10000C058);
  __chkstk_darwin(v0 - 8);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100006C50();
  sub_100006484(v3, qword_10000C860);
  v4 = sub_100005258(v3, (uint64_t)qword_10000C860);
  sub_100006C60();
  v5 = *(void *)(v3 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v3);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v4, v2, v3);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000023F0()
{
  uint64_t v0 = sub_100006C90();
  sub_100006484(v0, qword_10000C878);
  sub_100005258(v0, (uint64_t)qword_10000C878);
  return sub_100006C80();
}

id sub_100002470()
{
  id result = [objc_allocWithZone((Class)QLMemoryLimitedQueue) initWithMaximumMemoryConsumption:41943040 maximumConcurrentTasks:4];
  qword_10000C890 = (uint64_t)result;
  return result;
}

uint64_t sub_1000024AC()
{
  sub_100006C50();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v0 = sub_100006BC0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = v1;
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v15 - v6;
  sub_100006C40();
  sub_100006BB0();
  sub_100006C20();
  sub_100006BB0();
  sub_100005214(&qword_10000C050);
  uint64_t v8 = *(void *)(v1 + 72);
  unint64_t v9 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100007160;
  unint64_t v11 = v10 + v9;
  v12 = *(void (**)(unint64_t, char *, uint64_t))(v2 + 16);
  v12(v11, v7, v0);
  v12(v11 + v8, v5, v0);
  sub_100006BE0();
  swift_bridgeObjectRelease();
  v13 = *(void (**)(char *, uint64_t))(v2 + 8);
  v13(v5, v0);
  return ((uint64_t (*)(char *, uint64_t))v13)(v7, v0);
}

uint64_t sub_1000026E8(uint64_t a1, uint64_t a2)
{
  v2[4] = a1;
  v2[5] = a2;
  uint64_t v3 = sub_100006B80();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  uint64_t v4 = sub_100006C50();
  v2[9] = v4;
  v2[10] = *(void *)(v4 - 8);
  v2[11] = swift_task_alloc();
  uint64_t v5 = sub_100006A30();
  v2[12] = v5;
  v2[13] = *(void *)(v5 - 8);
  v2[14] = swift_task_alloc();
  sub_100006970();
  v2[15] = swift_task_alloc();
  uint64_t v6 = sub_100006980();
  v2[16] = v6;
  v2[17] = *(void *)(v6 - 8);
  v2[18] = swift_task_alloc();
  sub_100005214(&qword_10000C060);
  uint64_t v7 = swift_task_alloc();
  v2[19] = v7;
  uint64_t v8 = (void *)swift_task_alloc();
  v2[20] = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100002958;
  return ThumbnailRequest.fileURL.getter(v7);
}

uint64_t sub_100002958()
{
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000030C0;
  }
  else {
    uint64_t v2 = sub_100002A6C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100002A6C()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v1, 0, 1, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = v0[19];
    uint64_t v7 = v0[12];
    uint64_t v8 = v0[13];
    sub_100006A20(v4);
    uint64_t v5 = v9;
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  id v10 = [objc_allocWithZone((Class)PFVideoComplement) initWithBundleAtURL:v5];
  v0[22] = v10;

  if (v10)
  {
    unint64_t v11 = (uint64_t (*)())[v10 imagePath];
    if (!v11)
    {
      __break(1u);
      return _swift_task_switch(v11, v12, v13);
    }
    v14 = v11;
    uint64_t v16 = v0[10];
    uint64_t v15 = v0[11];
    uint64_t v17 = v0[9];
    sub_100006CC0();

    sub_100006A10();
    swift_bridgeObjectRelease();
    sub_100006C10();
    sub_100006A20(v18);
    CFURLRef v20 = v19;
    CFDictionaryRef v21 = sub_100005F64();
    CGImageSourceRef v22 = CGImageSourceCreateWithURL(v20, v21);
    v0[23] = v22;

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    if (v22)
    {
      sub_100006BA0();
      v23 = (void *)swift_task_alloc();
      v0[24] = v23;
      void *v23 = v0;
      v23[1] = sub_100002E74;
      uint64_t v24 = v0[8];
      uint64_t v25 = v0[4];
      v23[4] = v22;
      v23[5] = v24;
      v23[3] = v25;
      unint64_t v11 = sub_100003260;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      return _swift_task_switch(v11, v12, v13);
    }
    uint64_t v30 = v0[13];
    uint64_t v29 = v0[14];
    uint64_t v31 = v0[12];
    type metadata accessor for QLThumbnailError(0);
    v0[3] = 0;
    sub_100005A5C((uint64_t)&_swiftEmptyArrayStorage);
    sub_1000061D0(&qword_10000C068, type metadata accessor for QLThumbnailError);
    sub_1000069F0();
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
  }
  else
  {
    uint64_t v27 = v0[17];
    uint64_t v26 = v0[18];
    uint64_t v28 = v0[16];
    sub_100006960();
    sub_100005A5C((uint64_t)&_swiftEmptyArrayStorage);
    sub_1000061D0(&qword_10000C0C0, (void (*)(uint64_t))&type metadata accessor for CocoaError);
    sub_1000069F0();
    sub_100006950();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
    swift_willThrow();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v32 = (uint64_t (*)(void))v0[1];
  return v32();
}

uint64_t sub_100002E74()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[7] + 8))(v2[8], v2[6]);
  if (v0) {
    uint64_t v3 = sub_100003168;
  }
  else {
    uint64_t v3 = sub_100002FDC;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100002FDC()
{
  uint64_t v1 = *(void **)(v0 + 184);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 104);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1000030C0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100003168()
{
  uint64_t v1 = *(void **)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 96);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_10000323C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  return _swift_task_switch(sub_100003260, 0, 0);
}

uint64_t sub_100003260()
{
  sub_100006B70();
  sub_100006B30();
  uint64_t v1 = QLThumbnailingImageIOExpectedMemoryUsageForImageSourceThumbnail();
  if (qword_10000C148 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006C90();
  sub_100005258(v2, (uint64_t)qword_10000C878);
  uint64_t v3 = sub_100006C70();
  os_log_type_t v4 = sub_100006D00();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134217984;
    v0[1].i64[0] = v1;
    sub_100006D30();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Enqueuing thumbnail generation, needing %{bytes}ld", v5, 0xCu);
    swift_slowDealloc();
  }

  uint64_t v6 = (int8x16_t *)swift_task_alloc();
  v0[3].i64[0] = (uint64_t)v6;
  v6[1] = vextq_s8(v0[2], v0[2], 8uLL);
  v6[2].i64[0] = v1;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[3].i64[1] = (uint64_t)v7;
  uint64_t v8 = sub_100006AF0();
  void *v7 = v0;
  v7[1] = sub_100003470;
  uint64_t v9 = v0[1].i64[1];
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v9, 0, 0, 0xD000000000000020, 0x80000001000079B0, sub_100006218, v6, v8);
}

uint64_t sub_100003470()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_1000035AC, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1000035AC()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100003610(uint64_t a1, uint64_t a2)
{
  v2[4] = a1;
  v2[5] = a2;
  uint64_t v3 = sub_100006B80();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  sub_100005214(&qword_10000C058);
  v2[9] = swift_task_alloc();
  uint64_t v4 = sub_100006C50();
  v2[10] = v4;
  v2[11] = *(void *)(v4 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  sub_100005214(&qword_10000C060);
  v2[15] = swift_task_alloc();
  uint64_t v5 = sub_100006A30();
  v2[16] = v5;
  v2[17] = *(void *)(v5 - 8);
  v2[18] = swift_task_alloc();
  return _swift_task_switch(sub_100003804, 0, 0);
}

uint64_t sub_100003804()
{
  if (sub_100006B10())
  {
    uint64_t v1 = (void *)swift_task_alloc();
    v0[19] = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_100003918;
    uint64_t v2 = v0[18];
    return ThumbnailRequest.fileURL.getter(v2);
  }
  else
  {
    uint64_t v3 = (void *)swift_task_alloc();
    v0[21] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_100003EF4;
    return ThumbnailRequest.data.getter();
  }
}

uint64_t sub_100003918()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10000467C;
  }
  else {
    uint64_t v2 = sub_100003A2C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100003A2C()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[15];
  uint64_t v4 = v0[16];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 16))(v3, v0[18], v4);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
  id v5 = objc_allocWithZone((Class)NSData);
  id v6 = sub_100005290(v3, 0, 4);
  if (v1)
  {
    (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
LABEL_3:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(void))v0[1];
LABEL_4:
    return v7();
  }
  uint64_t v9 = v6;
  sub_100006B00();
  id v10 = v9;
  uint64_t v11 = sub_100006A50();
  unint64_t v13 = v12;

  if (qword_10000C140 != -1) {
    swift_once();
  }
  sub_100005258(v0[10], (uint64_t)qword_10000C860);
  char v14 = sub_100006C30();
  uint64_t v15 = v0[14];
  uint64_t v17 = v0[10];
  uint64_t v16 = v0[11];
  if (v14)
  {
    char v18 = sub_1000047F8((uint64_t)&off_100008738, v11, v13);
    sub_1000060AC(v11, v13);
    CFURLRef v19 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v19(v15, v17);
    if (v18)
    {
      uint64_t v20 = v0[17];
      uint64_t v21 = v0[18];
      uint64_t v22 = v0[16];
      uint64_t v23 = v0[10];
      uint64_t v24 = v0[11];
      uint64_t v25 = v0[9];
      sub_100006C00();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v24 + 56))(v25, 0, 1, v23);
      sub_100006AE0();

      sub_100006118(v25);
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v7 = (uint64_t (*)(void))v0[1];
      goto LABEL_4;
    }
    v40 = v10;
  }
  else
  {
    v40 = v10;
    sub_1000060AC(v11, v13);
    CFURLRef v19 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v19(v15, v17);
  }
  uint64_t v27 = v0[17];
  uint64_t v26 = v0[18];
  uint64_t v28 = v0[13];
  uint64_t v38 = v0[10];
  uint64_t v39 = v0[16];
  sub_100006B00();
  sub_100006A20(v29);
  CFURLRef v31 = v30;
  CFDictionaryRef v32 = sub_100005F64();
  CGImageSourceRef v33 = CGImageSourceCreateWithURL(v31, v32);

  v19(v28, v38);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v39);
  v0[24] = v33;
  if (!v33)
  {
    type metadata accessor for QLThumbnailError(0);
    v0[3] = 0;
    sub_100005A5C((uint64_t)&_swiftEmptyArrayStorage);
    sub_1000061D0(&qword_10000C068, type metadata accessor for QLThumbnailError);
    sub_1000069F0();
    swift_willThrow();
    goto LABEL_3;
  }
  uint64_t v34 = v33;
  sub_100006BA0();
  v35 = (void *)swift_task_alloc();
  v0[25] = v35;
  void *v35 = v0;
  v35[1] = sub_100004458;
  uint64_t v36 = v0[8];
  uint64_t v37 = v0[4];
  v35[4] = v34;
  v35[5] = v36;
  v35[3] = v37;
  return _swift_task_switch(sub_100003260, 0, 0);
}

uint64_t sub_100003EF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[22] = a1;
  v4[23] = a2;
  swift_task_dealloc();
  if (v2)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v5 = (uint64_t (*)(void))v4[1];
    return v5();
  }
  else
  {
    return _swift_task_switch(sub_100004090, 0, 0);
  }
}

uint64_t sub_100004090()
{
  sub_100006B00();
  if (qword_10000C140 != -1) {
    swift_once();
  }
  sub_100005258(v0[10], (uint64_t)qword_10000C860);
  if (sub_100006C30())
  {
    uint64_t v2 = v0[11];
    uint64_t v1 = v0[12];
    uint64_t v3 = v0[10];
    char v4 = sub_1000047F8((uint64_t)&off_100008760, v0[22], v0[23]);
    id v5 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
    v5(v1, v3);
    if (v4)
    {
      uint64_t v6 = v0[22];
      unint64_t v7 = v0[23];
      uint64_t v8 = v0[13];
      uint64_t v9 = v0[10];
      sub_100006C00();
      sub_100006AC0();
      sub_1000060AC(v6, v7);
      v5(v8, v9);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      id v10 = (uint64_t (*)(void))v0[1];
LABEL_13:
      return v10();
    }
    uint64_t v23 = v5;
  }
  else
  {
    uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v0[11] + 8);
    v23(v0[12], v0[10]);
  }
  uint64_t v12 = v0[22];
  unint64_t v11 = v0[23];
  uint64_t v13 = v0[13];
  uint64_t v14 = v0[10];
  sub_100006B00();
  CFDataRef isa = sub_100006A40().super.isa;
  CFDictionaryRef v16 = sub_100005F64();
  CGImageSourceRef v17 = CGImageSourceCreateWithData(isa, v16);

  sub_1000060AC(v12, v11);
  v23(v13, v14);
  v0[24] = v17;
  if (!v17)
  {
    type metadata accessor for QLThumbnailError(0);
    v0[3] = 0;
    sub_100005A5C((uint64_t)&_swiftEmptyArrayStorage);
    sub_1000061D0(&qword_10000C068, type metadata accessor for QLThumbnailError);
    sub_1000069F0();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v10 = (uint64_t (*)(void))v0[1];
    goto LABEL_13;
  }
  char v18 = v17;
  sub_100006BA0();
  CFURLRef v19 = (void *)swift_task_alloc();
  v0[25] = v19;
  *CFURLRef v19 = v0;
  v19[1] = sub_100004458;
  uint64_t v20 = v0[8];
  uint64_t v21 = v0[4];
  v19[4] = v18;
  v19[5] = v20;
  v19[3] = v21;
  return _swift_task_switch(sub_100003260, 0, 0);
}

uint64_t sub_100004458()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 208) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[7] + 8))(v2[8], v2[6]);
  if (v0) {
    uint64_t v3 = sub_100004734;
  }
  else {
    uint64_t v3 = sub_1000045C0;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000045C0()
{
  uint64_t v1 = *(void **)(v0 + 192);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000467C()
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

uint64_t sub_100004734()
{
  uint64_t v1 = *(void **)(v0 + 192);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000047F8(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_100006A60();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v15[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  switch(a3 >> 62)
  {
    case 1uLL:
    case 2uLL:
      sub_100006178(a2, a3);
      sub_100006178(a2, a3);
      break;
    default:
      break;
  }
  swift_bridgeObjectRetain();
  sub_100006A70();
  sub_1000060AC(a2, a3);
  sub_1000061D0(&qword_10000C078, (void (*)(uint64_t))&type metadata accessor for Data.Iterator);
  unint64_t v10 = 0;
  while (1)
  {
    sub_100006D20();
    if (v15[15]) {
      break;
    }
    unint64_t v11 = *(void *)(a1 + 16);
    if (v10 == v11)
    {
      (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
      swift_bridgeObjectRelease();
      return 1;
    }
    if (v10 >= v11)
    {
      __break(1u);
      goto LABEL_16;
    }
    uint64_t v12 = a1 + v10++;
    if (v15[14] != *(unsigned __int8 *)(v12 + 32))
    {
      (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  unint64_t v13 = *(void *)(a1 + 16);
  swift_bridgeObjectRelease();
  if (v13 == v10) {
    return 1;
  }
  if (v10 >= v13)
  {
LABEL_16:
    __break(1u);
    JUMPOUT(0x100004A34);
  }
  return 0;
}

unint64_t sub_100004A44(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005214(&qword_10000C0A8);
  uint64_t v2 = sub_100006D40();
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
    sub_10000650C(v6, (uint64_t)&v13, &qword_10000C0B0);
    uint64_t v7 = v13;
    unint64_t result = sub_100005D54(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_1000064E8(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

void sub_100004B74(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v23 = a3;
  uint64_t v24 = a4;
  uint64_t v6 = sub_100005214(&qword_10000C080);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  char v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100006B80();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  unint64_t v14 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v15 = (v12 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + v15 + 8) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v17 + v14, v13, v10);
  char v18 = v23;
  *(void *)(v17 + v15) = v23;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v17 + v16, v9, v6);
  id v19 = objc_allocWithZone((Class)QLMemoryLimitedQueueTask);
  aBlock[4] = sub_10000638C;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005408;
  aBlock[3] = &unk_1000087D0;
  uint64_t v20 = _Block_copy(aBlock);
  id v21 = v18;
  id v22 = [v19 initWithBlock:v20 expectedMemoryConsumption:v24];
  _Block_release(v20);
  swift_release();
  if (qword_10000C150 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_10000C890, "addTask:", v22, v23);
}

uint64_t sub_100004E6C()
{
  uint64_t v0 = sub_100006AF0();
  __chkstk_darwin(v0 - 8);
  sub_100006B70();
  sub_100006B30();
  sub_100006B40();
  sub_100006B50();
  sub_100006B60();
  uint64_t v1 = QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSourceAndContentType();
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    sub_100006B70();
    sub_100006AD0();

    sub_100005214(&qword_10000C080);
    return sub_100006CF0();
  }
  else
  {
    type metadata accessor for QLThumbnailError(0);
    sub_100005A5C((uint64_t)&_swiftEmptyArrayStorage);
    sub_1000061D0(&qword_10000C068, type metadata accessor for QLThumbnailError);
    sub_1000069F0();
    sub_100005214(&qword_10000C080);
    return sub_100006CE0();
  }
}

uint64_t sub_10000505C(uint64_t a1)
{
  unint64_t v2 = sub_1000051C0();

  return ThumbnailExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100005108()
{
  unint64_t result = qword_10000C030;
  if (!qword_10000C030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }
  return result;
}

ValueMetadata *type metadata accessor for ImageThumbnailExtension()
{
  return &type metadata for ImageThumbnailExtension;
}

uint64_t sub_100005170()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000051C0()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }
  return result;
}

uint64_t sub_100005214(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005258(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id sub_100005290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100006A30();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1, 1, v8) != 1)
  {
    sub_100006A20(v10);
    uint64_t v11 = v12;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  }
  id v17 = 0;
  id v13 = [v4 initWithContentsOfURL:v11 options:a2 maxLength:a3 error:&v17];

  if (v13)
  {
    id v14 = v17;
  }
  else
  {
    id v15 = v17;
    sub_100006A00();

    swift_willThrow();
  }
  return v13;
}

uint64_t sub_100005408(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10000544C(uint64_t a1)
{
  uint64_t v2 = sub_1000061D0(&qword_10000C0F8, type metadata accessor for QLThumbnailError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_1000054B8(uint64_t a1)
{
  uint64_t v2 = sub_1000061D0(&qword_10000C0F8, type metadata accessor for QLThumbnailError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100005528(uint64_t a1)
{
  uint64_t v2 = sub_1000061D0(&qword_10000C068, type metadata accessor for QLThumbnailError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

id sub_100005594()
{
  return *v0;
}

uint64_t sub_10000559C@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1000055A4()
{
  return sub_100006AA0();
}

uint64_t sub_1000055F0()
{
  return sub_100006A90();
}

Swift::Int sub_100005648()
{
  return sub_100006DB0();
}

uint64_t sub_1000056B0()
{
  return sub_100006CC0();
}

uint64_t sub_1000056C0(uint64_t a1)
{
  uint64_t v2 = sub_1000061D0(&qword_10000C068, type metadata accessor for QLThumbnailError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_10000572C(uint64_t a1)
{
  uint64_t v2 = sub_1000061D0(&qword_10000C068, type metadata accessor for QLThumbnailError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100005798(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_1000061D0(&qword_10000C068, type metadata accessor for QLThumbnailError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100005828()
{
  id v1 = *v0;
  uint64_t v2 = sub_100006D10();

  return v2;
}

uint64_t sub_100005860(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000061D0(&qword_10000C068, type metadata accessor for QLThumbnailError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_1000058DC()
{
  return sub_100006DB0();
}

void *sub_10000593C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_10000594C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100005958()
{
  swift_getWitnessTable();

  return sub_100006A80();
}

uint64_t sub_1000059C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000061D0(&qword_10000C068, type metadata accessor for QLThumbnailError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

BOOL sub_100005A48(void *a1, void *a2)
{
  return *a1 == *a2;
}

unint64_t sub_100005A5C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005214(&qword_10000C088);
  uint64_t v2 = sub_100006D40();
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
    sub_10000650C(v6, (uint64_t)&v15, &qword_10000C090);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100005B94(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000064E8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_100005B94(uint64_t a1, uint64_t a2)
{
  sub_100006DA0();
  sub_100006CD0();
  Swift::Int v4 = sub_100006DB0();

  return sub_100005C0C(a1, a2, v4);
}

unint64_t sub_100005C0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_100006D50() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_100006D50() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_100006D50()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

unint64_t sub_100005D54(uint64_t a1)
{
  sub_100006DA0();
  type metadata accessor for CFString(0);
  sub_1000061D0(&qword_10000C0B8, type metadata accessor for CFString);
  sub_100006A90();
  Swift::Int v2 = sub_100006DB0();

  return sub_100005E08(a1, v2);
}

unint64_t sub_100005E08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    uint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_1000061D0(&qword_10000C0B8, type metadata accessor for CFString);
    id v7 = v6;
    char v8 = sub_100006A80();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_100006A80();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

Class sub_100005F64()
{
  sub_100005214(&qword_10000C098);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100007170;
  *(void *)(inited + 32) = kCGImageSourceTypeIdentifierHint;
  CFStringRef v1 = (id)kCGImageSourceTypeIdentifierHint;
  *(void *)(inited + 40) = sub_100006BF0();
  *(void *)(inited + 48) = v2;
  uint64_t v3 = (void *)kCGImageSourceIgnoreJPEGAuxImages;
  *(void *)(inited + 64) = &type metadata for String;
  *(void *)(inited + 72) = v3;
  *(unsigned char *)(inited + 80) = 1;
  uint64_t v4 = (void *)kCGImageSourceFailForDataNotMatchingHint;
  *(void *)(inited + 104) = &type metadata for Bool;
  *(void *)(inited + 112) = v4;
  *(unsigned char *)(inited + 120) = 1;
  uint64_t v5 = (void *)kCGImageSourceSkipMetadata;
  *(void *)(inited + 144) = &type metadata for Bool;
  *(void *)(inited + 152) = v5;
  *(void *)(inited + 184) = &type metadata for Bool;
  *(unsigned char *)(inited + 160) = 1;
  id v6 = v3;
  id v7 = v4;
  id v8 = v5;
  sub_100004A44(inited);
  type metadata accessor for CFString(0);
  sub_1000061D0(&qword_10000C0A0, type metadata accessor for CFString);
  Class isa = sub_100006CA0().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

uint64_t sub_1000060AC(uint64_t a1, unint64_t a2)
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

void type metadata accessor for QLThumbnailError(uint64_t a1)
{
}

uint64_t sub_100006118(uint64_t a1)
{
  uint64_t v2 = sub_100005214(&qword_10000C058);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006178(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000061D0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_100006218(uint64_t a1)
{
  sub_100004B74(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_100006224()
{
  uint64_t v1 = sub_100006B80();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = sub_100005214(&qword_10000C080);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return _swift_deallocObject(v0, v10, v11);
}

uint64_t sub_10000638C()
{
  sub_100006B80();
  sub_100005214(&qword_10000C080);

  return sub_100004E6C();
}

uint64_t sub_10000646C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000647C()
{
  return swift_release();
}

uint64_t *sub_100006484(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

_OWORD *sub_1000064E8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void type metadata accessor for CFString(uint64_t a1)
{
}

uint64_t sub_10000650C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005214(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void type metadata accessor for CGImageSource(uint64_t a1)
{
}

uint64_t sub_100006584()
{
  return sub_1000061D0(&qword_10000C0E0, type metadata accessor for QLThumbnailError);
}

uint64_t sub_1000065CC()
{
  return sub_1000061D0(&qword_10000C0E8, type metadata accessor for QLThumbnailError);
}

uint64_t sub_100006614()
{
  return sub_1000061D0(&qword_10000C0A0, type metadata accessor for CFString);
}

uint64_t sub_10000665C()
{
  return sub_1000061D0(&qword_10000C0F0, type metadata accessor for CFString);
}

uint64_t sub_1000066A4()
{
  return sub_1000061D0(&qword_10000C0F8, type metadata accessor for QLThumbnailError);
}

uint64_t sub_1000066EC()
{
  return sub_1000061D0(&qword_10000C100, type metadata accessor for QLThumbnailError);
}

uint64_t sub_100006734()
{
  return sub_1000061D0(&qword_10000C108, type metadata accessor for QLThumbnailError);
}

uint64_t sub_10000677C()
{
  return sub_1000061D0(&qword_10000C110, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_1000067D8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100006820()
{
  return sub_1000061D0(&qword_10000C118, type metadata accessor for Code);
}

unint64_t sub_10000686C()
{
  unint64_t result = qword_10000C120;
  if (!qword_10000C120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }
  return result;
}

uint64_t sub_1000068C0()
{
  return sub_1000061D0(&qword_10000C128, type metadata accessor for Code);
}

uint64_t sub_100006908()
{
  return sub_1000061D0(&qword_10000C068, type metadata accessor for QLThumbnailError);
}

uint64_t sub_100006950()
{
  return CocoaError._nsError.getter();
}

uint64_t sub_100006960()
{
  return static CocoaError.Code.fileReadUnknown.getter();
}

uint64_t sub_100006970()
{
  return type metadata accessor for CocoaError.Code();
}

uint64_t sub_100006980()
{
  return type metadata accessor for CocoaError();
}

uint64_t sub_1000069F0()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t sub_100006A00()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100006A10()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

void sub_100006A20(NSURL *retstr@<X8>)
{
}

uint64_t sub_100006A30()
{
  return type metadata accessor for URL();
}

NSData sub_100006A40()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100006A50()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006A60()
{
  return type metadata accessor for Data.Iterator();
}

uint64_t sub_100006A70()
{
  return Data.Iterator.init(_:at:)();
}

uint64_t sub_100006A80()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t sub_100006A90()
{
  return _CFObject.hash(into:)();
}

uint64_t sub_100006AA0()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_100006AB0()
{
  return static AppExtension.main()();
}

uint64_t sub_100006AC0()
{
  return static ThumbnailReply.data(_:contentType:attachments:)();
}

uint64_t sub_100006AD0()
{
  return static ThumbnailReply.cgImage(_:scale:isLowQuality:)();
}

uint64_t sub_100006AE0()
{
  return static ThumbnailReply.fileURL(_:contentType:)();
}

uint64_t sub_100006AF0()
{
  return type metadata accessor for ThumbnailReply();
}

uint64_t sub_100006B00()
{
  return ThumbnailRequest.contentType.getter();
}

uint64_t sub_100006B10()
{
  return ThumbnailRequest.isFileBacked.getter();
}

uint64_t sub_100006B30()
{
  return ThumbnailRequest.Options.maximumSize.getter();
}

uint64_t sub_100006B40()
{
  return ThumbnailRequest.Options.minimumSize.getter();
}

uint64_t sub_100006B50()
{
  return ThumbnailRequest.Options.wantsLowQuality.getter();
}

uint64_t sub_100006B60()
{
  return ThumbnailRequest.Options.interpolationQuality.getter();
}

uint64_t sub_100006B70()
{
  return ThumbnailRequest.Options.scale.getter();
}

uint64_t sub_100006B80()
{
  return type metadata accessor for ThumbnailRequest.Options();
}

uint64_t sub_100006BA0()
{
  return ThumbnailRequest.options.getter();
}

uint64_t sub_100006BB0()
{
  return ThumbnailProvider.init(contentType:generator:)();
}

uint64_t sub_100006BC0()
{
  return type metadata accessor for ThumbnailProvider();
}

uint64_t sub_100006BE0()
{
  return static ThumbnailProviderBuilder.buildBlock(_:)();
}

uint64_t sub_100006BF0()
{
  return UTType.identifier.getter();
}

uint64_t sub_100006C00()
{
  return static UTType.pdf.getter();
}

uint64_t sub_100006C10()
{
  return static UTType.heic.getter();
}

uint64_t sub_100006C20()
{
  return static UTType.item.getter();
}

uint64_t sub_100006C30()
{
  return UTType.conforms(to:)();
}

uint64_t sub_100006C40()
{
  return static UTType.livePhoto.getter();
}

uint64_t sub_100006C50()
{
  return type metadata accessor for UTType();
}

uint64_t sub_100006C60()
{
  return UTType.init(_:)();
}

uint64_t sub_100006C70()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006C80()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006C90()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_100006CA0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100006CB0()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_100006CC0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006CD0()
{
  return String.hash(into:)();
}

uint64_t sub_100006CE0()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_100006CF0()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_100006D00()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100006D10()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_100006D20()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t sub_100006D30()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006D40()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100006D50()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006D90()
{
  return Error._userInfo.getter();
}

uint64_t sub_100006DA0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006DB0()
{
  return Hasher._finalize()();
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithData(data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithURL(url, options);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSourceAndContentType()
{
  return _QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSourceAndContentType();
}

uint64_t QLThumbnailingImageIOExpectedMemoryUsageForImageSourceThumbnail()
{
  return _QLThumbnailingImageIOExpectedMemoryUsageForImageSourceThumbnail();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}