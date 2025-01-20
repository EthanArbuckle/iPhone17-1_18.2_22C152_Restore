uint64_t sub_100004720()
{
  uint64_t v0;

  v0 = sub_10000A200();
  sub_100009A28(v0, qword_1000107A0);
  sub_100007E4C(v0, (uint64_t)qword_1000107A0);
  return sub_10000A1F0();
}

uint64_t sub_1000047A0(uint64_t a1, uint64_t a2)
{
  v2[75] = a2;
  v2[74] = a1;
  uint64_t v3 = sub_10000A0B0();
  v2[76] = v3;
  v2[77] = *(void *)(v3 - 8);
  v2[78] = swift_task_alloc();
  uint64_t v4 = sub_10000A1D0();
  v2[79] = v4;
  v2[80] = *(void *)(v4 - 8);
  v2[81] = swift_task_alloc();
  v2[82] = swift_task_alloc();
  v2[83] = swift_task_alloc();
  uint64_t v5 = sub_10000A000();
  v2[84] = v5;
  v2[85] = *(void *)(v5 - 8);
  v2[86] = swift_task_alloc();
  v2[87] = swift_task_alloc();
  uint64_t v6 = sub_10000A110();
  v2[88] = v6;
  v2[89] = *(void *)(v6 - 8);
  v2[90] = swift_task_alloc();
  v2[91] = swift_task_alloc();
  v2[92] = swift_task_alloc();
  return _swift_task_switch(sub_1000049C0, 0, 0);
}

uint64_t sub_1000049C0()
{
  uint64_t v1 = v0[92];
  uint64_t v2 = v0[89];
  uint64_t v3 = v0[88];
  sub_10000A130();
  sub_10000A100();
  v0[93] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[94] = v5;
  v0[95] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v1, v3);
  sub_10000A130();
  sub_10000A0D0();
  v0[96] = v6;
  v0[97] = v7;
  v5(v1, v3);
  sub_10000A130();
  sub_10000A0E0();
  v5(v1, v3);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[98] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_100004B14;
  uint64_t v9 = v0[87];
  return ThumbnailRequest.fileURL.getter(v9);
}

uint64_t sub_100004B14()
{
  *(void *)(*(void *)v1 + 792) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100006900;
  }
  else {
    uint64_t v2 = sub_100004C28;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100004C28()
{
  v48 = v0;
  sub_100007E08(&qword_1000100D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10000AA40;
  *(void *)(inited + 32) = sub_10000A370();
  *(void *)(inited + 40) = v2;
  *(void *)(inited + 72) = &type metadata for UInt;
  *(void *)(inited + 48) = 0xFFFFLL;
  *(void *)(inited + 80) = sub_10000A370();
  *(void *)(inited + 88) = v3;
  sub_10000A0C0();
  if (sub_10000A170() == 0xD000000000000022 && v4 == 0x800000010000B3E0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    uint64_t v6 = v0[82];
    uint64_t v7 = v0[80];
    uint64_t v8 = v0[79];
    sub_10000A180();
    uint64_t v9 = sub_10000A170();
    uint64_t v11 = v10;
    v12 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    uint64_t v13 = (v7 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v12(v6, v8);
    goto LABEL_7;
  }
  char v5 = sub_10000A540();
  swift_bridgeObjectRelease();
  if (v5) {
    goto LABEL_5;
  }
  uint64_t v14 = v0[80];
  uint64_t v9 = sub_10000A170();
  uint64_t v11 = v15;
  v12 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  uint64_t v13 = (v14 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
LABEL_7:
  v0[100] = v12;
  uint64_t v16 = v0[83];
  uint64_t v17 = v0[79];
  v0[101] = v13;
  v12(v16, v17);
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 96) = v9;
  *(void *)(inited + 104) = v11;
  v0[64] = sub_100006F14(inited);
  uint64_t v18 = qword_1000101F0;
  swift_bridgeObjectRetain();
  if (v18 != -1) {
    swift_once();
  }
  uint64_t v19 = v0[87];
  uint64_t v20 = v0[86];
  uint64_t v21 = v0[85];
  uint64_t v22 = v0[84];
  uint64_t v23 = sub_10000A200();
  v0[102] = sub_100007E4C(v23, (uint64_t)qword_1000107A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v20, v19, v22);
  swift_bridgeObjectRetain();
  v24 = sub_10000A1E0();
  os_log_type_t v25 = sub_10000A400();
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v27 = v0[86];
  uint64_t v28 = v0[85];
  uint64_t v29 = v0[84];
  if (v26)
  {
    os_log_type_t type = v25;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 136315394;
    uint64_t v47 = v44;
    uint64_t v31 = sub_100009FE0();
    v0[72] = sub_1000085A4(v31, v32, &v47);
    sub_10000A4B0();
    swift_bridgeObjectRelease();
    v33 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
    v33(v27, v29);
    *(_WORD *)(v30 + 12) = 2080;
    uint64_t v34 = sub_10000A350();
    v0[73] = sub_1000085A4(v34, v35, &v47);
    sub_10000A4B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v24, type, "Loading asset %s with options: %s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v33 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
    v33(v0[86], v0[84]);
    swift_bridgeObjectRelease_n();
  }
  v0[103] = v33;
  swift_beginAccess();
  id v36 = objc_allocWithZone((Class)AVURLAsset);
  sub_100009FF0(v37);
  v39 = v38;
  Class isa = sub_10000A340().super.isa;
  swift_bridgeObjectRelease();
  id v41 = [v36 initWithURL:v39 options:isa];
  v0[104] = v41;

  v46 = (uint64_t (*)(uint64_t))((char *)&dword_1000100E0 + dword_1000100E0);
  v42 = (void *)swift_task_alloc();
  v0[105] = v42;
  void *v42 = v0;
  v42[1] = sub_100005138;
  return v46((uint64_t)v41);
}

uint64_t sub_100005138(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  v3[55] = v2;
  v3[56] = a1;
  v3[57] = a2;
  v3[106] = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_100005240, 0, 0);
}

uint64_t sub_100005240()
{
  unint64_t v1 = *((void *)v0 + 106);
  if (v1 >> 60 == 15)
  {
    uint64_t v2 = (void (*)(uint64_t, uint64_t))*((void *)v0 + 100);
    uint64_t v3 = *((void *)v0 + 82);
    uint64_t v4 = *((void *)v0 + 81);
    uint64_t v5 = *((void *)v0 + 79);
    sub_10000A0C0();
    sub_10000A1A0();
    char v6 = sub_10000A1C0();
    v2(v4, v5);
    v2(v3, v5);
    if (v6)
    {
      uint64_t v7 = (void *)swift_task_alloc();
      *((void *)v0 + 107) = v7;
      *uint64_t v7 = v0;
      v7[1] = sub_1000055BC;
      double v8 = v0[97];
      double v9 = v0[96];
      uint64_t v10 = *((void *)v0 + 74);
      return sub_100007054(v10, v9, v8);
    }
    else
    {
      uint64_t v19 = (void *)*((void *)v0 + 104);
      *((void *)v0 + 2) = v0;
      *((void *)v0 + 7) = v0 + 65;
      *((void *)v0 + 3) = sub_1000057DC;
      uint64_t v20 = swift_continuation_init();
      *((void *)v0 + 44) = _NSConcreteStackBlock;
      *((void *)v0 + 45) = 0x40000000;
      *((void *)v0 + 46) = sub_100007210;
      *((void *)v0 + 47) = &unk_10000C960;
      *((void *)v0 + 48) = v20;
      [v19 loadTracksWithMediaCharacteristic:AVMediaCharacteristicVisual completionHandler:v0 + 44];
      return _swift_continuation_await(v0 + 2);
    }
  }
  else
  {
    uint64_t v12 = *((void *)v0 + 56);
    uint64_t v13 = (void (*)(uint64_t, uint64_t))*((void *)v0 + 100);
    uint64_t v23 = *((void *)v0 + 87);
    v24 = (void *)*((void *)v0 + 104);
    uint64_t v14 = *((void *)v0 + 82);
    uint64_t v15 = *((void *)v0 + 79);
    uint64_t v16 = *((void *)v0 + 78);
    uint64_t v17 = *((void *)v0 + 77);
    uint64_t v25 = *((void *)v0 + 76);
    BOOL v26 = (void (*)(uint64_t, uint64_t))*((void *)v0 + 103);
    uint64_t v21 = *((void *)v0 + 74);
    uint64_t v22 = *((void *)v0 + 84);
    sub_10000A1B0();
    sub_10000A090();
    v13(v14, v15);
    sub_10000A080();
    sub_100009754(v12, v1);

    v26(v23, v22);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v21, v16, v25);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v18 = (uint64_t (*)(void))*((void *)v0 + 1);
    return v18();
  }
}

uint64_t sub_1000055BC()
{
  *(void *)(*(void *)v1 + 864) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000069E4;
  }
  else {
    uint64_t v2 = sub_1000056D0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000056D0()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 824);
  uint64_t v2 = *(void *)(v0 + 696);
  uint64_t v3 = *(void *)(v0 + 672);

  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1000057DC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 872) = v1;
  if (v1) {
    uint64_t v2 = sub_100006AF8;
  }
  else {
    uint64_t v2 = sub_1000058EC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000058EC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = v4[65];
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_10000A510();
    a1 = swift_bridgeObjectRelease();
    if (v12)
    {
LABEL_3:
      if ((v5 & 0xC000000000000001) != 0)
      {
        id v6 = (id)sub_10000A4E0();
      }
      else
      {
        if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return AVAsynchronousKeyValueLoading.load<A, B>(_:_:)(a1, a2, a3, a4);
        }
        id v6 = *(id *)(v5 + 32);
      }
      v4[110] = v6;
      uint64_t v7 = v4[104];
      swift_bridgeObjectRelease();
      id v8 = [objc_allocWithZone((Class)AVAssetImageGenerator) initWithAsset:v7];
      v4[111] = v8;
      [v8 setAppliesPreferredTrackTransform:1];
      [v8 setDynamicRangePolicy:AVAssetImageGeneratorDynamicRangePolicyMatchSource];
      [v8 setUseSWDecoderForAV1:1];
      sub_100007E08(&qword_1000100E8);
      uint64_t v9 = sub_10000A010();
      v4[112] = v9;
      sub_100007E08(&qword_1000100F0);
      uint64_t v10 = sub_10000A020();
      v4[113] = v10;
      uint64_t v11 = (void *)swift_task_alloc();
      v4[114] = v11;
      *uint64_t v11 = v4;
      v11[1] = sub_100005C44;
      a1 = (uint64_t)(v4 + 58);
      a2 = v4 + 32;
      a3 = v9;
      a4 = v10;
      return AVAsynchronousKeyValueLoading.load<A, B>(_:_:)(a1, a2, a3, a4);
    }
  }
  else if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v13 = (void *)v4[104];
  uint64_t v14 = (void (*)(uint64_t, uint64_t))v4[103];
  uint64_t v15 = v4[87];
  uint64_t v16 = v4[84];
  swift_bridgeObjectRelease();
  type metadata accessor for QLThumbnailError(0);
  v4[71] = 4;
  sub_10000831C((uint64_t)&_swiftEmptyArrayStorage);
  sub_100007DC0(&qword_100010100, type metadata accessor for QLThumbnailError);
  sub_100009FD0();
  swift_willThrow();

  v14(v15, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v4[1];
  return v17();
}

uint64_t sub_100005C44()
{
  *(void *)(*(void *)v1 + 920) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_100006C14;
  }
  else {
    uint64_t v2 = sub_100005D94;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100005D94()
{
  uint64_t v36 = v0;
  uint64_t v1 = *(void *)(v0 + 464);
  uint64_t v2 = *(void *)(v0 + 472);
  long long v3 = *(_OWORD *)(v0 + 272);
  long long v4 = *(_OWORD *)(v0 + 288);
  *(_OWORD *)(v0 + 304) = *(_OWORD *)(v0 + 256);
  *(_OWORD *)(v0 + 320) = v3;
  *(_OWORD *)(v0 + 336) = v4;
  uint64_t v5 = 0;
  *(void *)&long long v3 = 0;
  CGRect v38 = CGRectApplyAffineTransform(*(CGRect *)(&v1 - 2), (CGAffineTransform *)(v0 + 304));
  CGFloat width = v38.size.width;
  CGFloat height = v38.size.height;
  id v8 = sub_10000A1E0();
  os_log_type_t v9 = sub_10000A400();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(void *)&v35.a = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136446210;
    uint64_t v11 = sub_10000A450();
    *(void *)(v0 + 552) = sub_1000085A4(v11, v12, (uint64_t *)&v35);
    sub_10000A4B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Transformed natural size %{public}s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v13 = *(void **)(v0 + 888);
  uint64_t v14 = *(void *)(v0 + 776);
  uint64_t v15 = *(void *)(v0 + 768);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v0 + 752);
  CGFloat v17 = *(double *)(v0 + 744);
  uint64_t v18 = *(void *)(v0 + 728);
  uint64_t v19 = *(void *)(v0 + 720);
  uint64_t v20 = *(void *)(v0 + 704);
  sub_10000A130();
  sub_10000A0E0();
  *(void *)(v0 + 928) = v21;
  v16(v18, v20);
  sub_10000A130();
  sub_10000A0E0();
  *(void *)(v0 + 936) = v22;
  v16(v19, v20);
  CGAffineTransformMakeScale(&v35, v17, v17);
  long long v23 = *(_OWORD *)&v35.c;
  long long v24 = *(_OWORD *)&v35.tx;
  *(_OWORD *)(v0 + 208) = *(_OWORD *)&v35.a;
  *(_OWORD *)(v0 + 224) = v23;
  *(_OWORD *)(v0 + 240) = v24;
  uint64_t v25 = v15;
  *(void *)&long long v23 = v14;
  CGSize v26 = CGSizeApplyAffineTransform(*(CGSize *)((char *)&v23 - 8), (CGAffineTransform *)(v0 + 208));
  *(CGFloat *)(v0 + 480) = width;
  *(CGFloat *)(v0 + 488) = height;
  *(CGSize *)(v0 + 496) = v26;
  QLDetermineSizeRespectingAspectRatioAndMinimumDimension();
  objc_msgSend(v13, "setMaximumSize:");
  uint64_t v27 = sub_10000A1E0();
  os_log_type_t v28 = sub_10000A400();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(void *)&v35.a = swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 136446210;
    uint64_t v30 = sub_10000A450();
    *(void *)(v0 + 544) = sub_1000085A4(v30, v31, (uint64_t *)&v35);
    sub_10000A4B0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Final size %{public}s", v29, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_100007E08(&qword_1000100F8);
  uint64_t v32 = sub_10000A050();
  *(void *)(v0 + 944) = v32;
  v33 = (void *)swift_task_alloc();
  *(void *)(v0 + 952) = v33;
  void *v33 = v0;
  v33[1] = sub_1000061B0;
  return AVAsynchronousKeyValueLoading.load<A>(_:)(v0 + 392, v32);
}

uint64_t sub_1000061B0()
{
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    swift_release();
    uint64_t v1 = sub_100006D38;
  }
  else
  {
    swift_release();
    uint64_t v1 = sub_1000062F8;
  }
  return _swift_task_switch(v1, 0, 0);
}

uint64_t sub_1000062F8()
{
  Swift::Int32 v1 = *(_DWORD *)(v0 + 400);
  char v2 = sub_10000A490();
  unint64_t value = kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  if (v2)
  {
    unint64_t v5 = *(void *)&kCMTimeZero.timescale;
    if (sub_10000A460())
    {
      sub_10000A480();
      double v7 = v6;
      double v8 = 10.0;
      if (v7 <= 20.0)
      {
        sub_10000A480();
        double v8 = v9 * 0.5;
      }
      unint64_t value = sub_10000A470(v8, v1);
      unsigned int timescale = v10;
      CMTimeEpoch epoch = v12;
      unint64_t flags = HIDWORD(v10);
    }
    else
    {
      unint64_t flags = HIDWORD(v5);
      unsigned int timescale = v5;
    }
  }
  else
  {
    unsigned int timescale = kCMTimeZero.timescale;
    unint64_t flags = kCMTimeZero.flags;
  }
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 960) = v14;
  *uint64_t v14 = v0;
  v14[1] = sub_100006478;
  return AVAssetImageGenerator.image(at:)(value, timescale | (flags << 32), epoch);
}

uint64_t sub_100006478(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 968) = a1;
  *(void *)(v3 + 976) = v1;
  swift_task_dealloc();
  if (v1) {
    long long v4 = sub_100006DF0;
  }
  else {
    long long v4 = sub_100006590;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100006590()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 752);
  uint64_t v2 = *(void *)(v0 + 736);
  uint64_t v3 = *(void *)(v0 + 704);
  id v4 = *(id *)(v0 + 968);
  sub_10000A130();
  sub_10000A0F0();
  v1(v2, v3);
  unint64_t v5 = (void *)QLThumbnailingImageIOCreateCroppedAndScaledThumbnailToSatisfyConstraints();

  if (v5)
  {
    uint64_t v6 = *(void **)(v0 + 968);
    double v7 = *(void **)(v0 + 888);
    double v8 = *(void **)(v0 + 880);
    double v9 = *(void **)(v0 + 832);
    uint64_t v10 = *(void *)(v0 + 672);
    uint64_t v11 = *(void *)(v0 + 624);
    uint64_t v12 = *(void *)(v0 + 616);
    uint64_t v22 = *(void *)(v0 + 608);
    long long v24 = *(void (**)(uint64_t, uint64_t))(v0 + 824);
    uint64_t v19 = *(void *)(v0 + 696);
    uint64_t v20 = *(void *)(v0 + 592);
    sub_10000A0A0();

    sub_10000A080();
    v24(v19, v10);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v20, v11, v22);
  }
  else
  {
    uint64_t v14 = *(void **)(v0 + 968);
    uint64_t v15 = *(void **)(v0 + 888);
    uint64_t v16 = *(void **)(v0 + 880);
    CGFloat v17 = *(void **)(v0 + 832);
    uint64_t v23 = *(void *)(v0 + 696);
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v0 + 824);
    uint64_t v21 = *(void *)(v0 + 672);
    type metadata accessor for QLThumbnailError(0);
    *(void *)(v0 + 536) = 0;
    sub_10000831C((uint64_t)&_swiftEmptyArrayStorage);
    sub_100007DC0(&qword_100010100, type metadata accessor for QLThumbnailError);
    sub_100009FD0();
    swift_willThrow();

    v25(v23, v21);
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
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_100006900()
{
  swift_task_dealloc();
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

uint64_t sub_1000069E4()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 824);
  uint64_t v2 = *(void *)(v0 + 696);
  uint64_t v3 = *(void *)(v0 + 672);

  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100006AF8()
{
  uint64_t v1 = (void *)v0[104];
  uint64_t v2 = (void (*)(uint64_t, uint64_t))v0[103];
  uint64_t v3 = v0[87];
  uint64_t v4 = v0[84];
  swift_willThrow();

  v2(v3, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_100006C14()
{
  uint64_t v1 = *(void **)(v0 + 880);
  uint64_t v2 = *(void **)(v0 + 832);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v0 + 824);
  uint64_t v4 = *(void *)(v0 + 696);
  uint64_t v5 = *(void *)(v0 + 672);

  v3(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100006D38()
{
  uint64_t v1 = *(void *)&kCMTimeZero.timescale;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 960) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100006478;
  return AVAssetImageGenerator.image(at:)(kCMTimeZero.value, v1, epoch);
}

uint64_t sub_100006DF0()
{
  uint64_t v1 = *(void **)(v0 + 880);
  uint64_t v2 = *(void **)(v0 + 832);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v0 + 824);
  uint64_t v4 = *(void *)(v0 + 696);
  uint64_t v5 = *(void *)(v0 + 672);

  v3(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

unint64_t sub_100006F14(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007E08(&qword_100010130);
  uint64_t v2 = sub_10000A520();
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
    sub_100009974(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100008BFC(v15, v16, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_100008C80);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000099DC(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_100007054(uint64_t a1, double a2, double a3)
{
  *(double *)(v3 + 56) = a2;
  *(double *)(v3 + 64) = a3;
  *(void *)(v3 + 48) = a1;
  sub_10000A3F0();
  *(void *)(v3 + 72) = sub_10000A3E0();
  uint64_t v5 = sub_10000A3D0();
  return _swift_task_switch(sub_1000070F0, v5, v4);
}

uint64_t sub_1000070F0()
{
  swift_release();
  *(void *)(v0 + 16) = sub_1000072EC;
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 32) = 0x3FF0000000000000;
  *(_WORD *)(v0 + 40) = 0;
  sub_100007E08(&qword_100010110);
  swift_allocObject();
  sub_10000A250();
  sub_10000A230();
  sub_10000A260();
  swift_retain();
  sub_10000A070();
  swift_release_n();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100007210(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100007E08(&qword_100010148);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    sub_1000099EC(0, &qword_100010140);
    **(void **)(*(void *)(v3 + 64) + 40) = sub_10000A3B0();
    return _swift_continuation_throwingResume(v3);
  }
}

double sub_1000072EC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10000A2D0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007E08(&qword_100010118);
  __chkstk_darwin();
  id v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_10000A2F0();
  sub_10000A220();
  uint64_t v8 = sub_10000A2B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v28 = sub_10000A2C0();
  sub_100009864((uint64_t)v7);
  uint64_t KeyPath = swift_getKeyPath();
  sub_10000A220();
  sub_10000A220();
  sub_10000A310();
  sub_10000A210();
  uint64_t v23 = v32;
  LOBYTE(v7) = v33;
  uint64_t v24 = v34;
  char v9 = v35;
  uint64_t v26 = v36;
  uint64_t v25 = v37;
  uint64_t v10 = enum case for Color.RGBColorSpace.sRGB(_:);
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v11(v5, enum case for Color.RGBColorSpace.sRGB(_:), v2);
  uint64_t v12 = sub_10000A2E0();
  sub_100007E08(&qword_100010120);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_10000AA40;
  v11(v5, v10, v2);
  *(void *)(v13 + 32) = sub_10000A2E0();
  v11(v5, v10, v2);
  *(void *)(v13 + 40) = sub_10000A2E0();
  uint64_t v38 = v13;
  sub_10000A3C0();
  sub_10000A320();
  sub_10000A330();
  sub_10000A300();
  sub_10000A270();
  uint64_t v14 = v38;
  long long v22 = v39;
  uint64_t v15 = v40;
  uint64_t v16 = v41;
  char v17 = sub_10000A2A0();
  uint64_t v18 = KeyPath;
  *(void *)a1 = v29;
  *(void *)(a1 + 8) = v18;
  uint64_t v19 = v23;
  *(void *)(a1 + 16) = v28;
  *(void *)(a1 + 24) = v19;
  *(unsigned char *)(a1 + 32) = (_BYTE)v7;
  *(_DWORD *)(a1 + 33) = *(_DWORD *)v31;
  *(_DWORD *)(a1 + 36) = *(_DWORD *)&v31[3];
  *(void *)(a1 + 40) = v24;
  *(unsigned char *)(a1 + 48) = v9;
  *(_DWORD *)(a1 + 49) = *(_DWORD *)v30;
  *(_DWORD *)(a1 + 52) = *(_DWORD *)&v30[3];
  uint64_t v20 = v25;
  *(void *)(a1 + 56) = v26;
  *(void *)(a1 + 64) = v20;
  *(void *)(a1 + 72) = v12;
  *(void *)(a1 + 80) = v14;
  double result = *(double *)&v22;
  *(_OWORD *)(a1 + 88) = v22;
  *(void *)(a1 + 104) = v15;
  *(void *)(a1 + 112) = v16;
  *(unsigned char *)(a1 + 120) = v17;
  return result;
}

uint64_t sub_1000076B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10000A150();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_10000771C(uint64_t a1)
{
  uint64_t v2 = sub_100007DC0(&qword_1000100C8, (void (*)(uint64_t))type metadata accessor for AudiovisualThumbnailExtension);

  return ThumbnailExtension.configuration.getter(a1, v2);
}

uint64_t sub_100007798()
{
  return sub_10000A140();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for AudiovisualThumbnailExtension()
{
  uint64_t result = qword_1000101F8;
  if (!qword_1000101F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100007908(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A150();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_100007974(uint64_t a1)
{
  uint64_t v2 = sub_10000A150();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_1000079D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A150();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_100007A3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A150();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100007AA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A150();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_100007B04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A150();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100007B68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100007B7C);
}

uint64_t sub_100007B7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A150();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_100007BE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100007BFC);
}

uint64_t sub_100007BFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A150();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_100007C6C()
{
  uint64_t result = sub_10000A150();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100007CF8()
{
  return sub_100007DC0(&qword_100010040, (void (*)(uint64_t))type metadata accessor for AudiovisualThumbnailExtension);
}

uint64_t sub_100007D40()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100007DC0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100007E08(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007E4C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100007E84(uint64_t a1)
{
  uint64_t v2 = sub_100007DC0(&qword_1000101A0, type metadata accessor for QLThumbnailError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100007EF0(uint64_t a1)
{
  uint64_t v2 = sub_100007DC0(&qword_1000101A0, type metadata accessor for QLThumbnailError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100007F60(uint64_t a1)
{
  uint64_t v2 = sub_100007DC0(&qword_100010100, type metadata accessor for QLThumbnailError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

id sub_100007FCC()
{
  return *v0;
}

uint64_t sub_100007FD4@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_100007FDC()
{
  return sub_10000A370();
}

uint64_t sub_100007FEC(uint64_t a1)
{
  uint64_t v2 = sub_100007DC0(&qword_100010100, type metadata accessor for QLThumbnailError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100008058(uint64_t a1)
{
  uint64_t v2 = sub_100007DC0(&qword_100010100, type metadata accessor for QLThumbnailError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_1000080C4(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100007DC0(&qword_100010100, type metadata accessor for QLThumbnailError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100008154()
{
  id v1 = *v0;
  uint64_t v2 = sub_10000A4A0();

  return v2;
}

uint64_t sub_10000818C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007DC0(&qword_100010100, type metadata accessor for QLThumbnailError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100008208()
{
  return sub_10000A590();
}

void *sub_100008268@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100008278(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100008284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100007DC0(&qword_100010100, type metadata accessor for QLThumbnailError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

BOOL sub_100008308(void *a1, void *a2)
{
  return *a1 == *a2;
}

unint64_t sub_10000831C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007E08(&qword_100010130);
  uint64_t v2 = sub_10000A520();
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
    sub_100009974(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100008BFC(v15, v16, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10000845C);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000099DC(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_10000845C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_10000A540() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_10000A540() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_10000A540()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_1000085A4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100008678(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100009914((uint64_t)v12, *a3);
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
      sub_100009914((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000098C4((uint64_t)v12);
  return v7;
}

uint64_t sub_100008678(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000A4C0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100008834(a5, a6);
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
  uint64_t v8 = sub_10000A4F0();
  if (!v8)
  {
    sub_10000A500();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000A530();
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

uint64_t sub_100008834(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000088CC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100008AAC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100008AAC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000088CC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100008A44(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000A4D0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000A500();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000A390();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000A530();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000A500();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100008A44(uint64_t a1, uint64_t a2)
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
  sub_100007E08(&qword_100010128);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100008AAC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007E08(&qword_100010128);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  BOOL v13 = a4 + 32;
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
  uint64_t result = sub_10000A530();
  __break(1u);
  return result;
}

uint64_t sub_100008BFC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, Swift::Int))
{
  sub_10000A580();
  sub_10000A380();
  Swift::Int v5 = sub_10000A590();

  return a3(a1, a2, v5);
}

unint64_t sub_100008C80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000A540() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10000A540() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100008D64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000A280();
  *a1 = result;
  return result;
}

uint64_t sub_100008D90()
{
  return sub_10000A290();
}

uint64_t sub_100008DBC(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
  return _swift_task_switch(sub_100008DDC, 0, 0);
}

uint64_t sub_100008DDC()
{
  sub_100007E08(&qword_100010150);
  uint64_t v1 = sub_10000A040();
  *(void *)(v0 + 56) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v2;
  void *v2 = v0;
  v2[1] = sub_100008EA4;
  return AVAsynchronousKeyValueLoading.load<A>(_:)(v0 + 32, v1);
}

uint64_t sub_100008EA4()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_100009324;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_100008FC0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100008FC0()
{
  uint64_t v1 = self;
  sub_1000099EC(0, &qword_100010160);
  Class isa = sub_10000A3A0().super.isa;
  swift_bridgeObjectRelease();
  id v3 = [v1 metadataItemsFromArray:isa filteredByIdentifier:AVMetadataCommonIdentifierArtwork];

  unint64_t v4 = sub_10000A3B0();
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_10000A510();
    uint64_t v5 = swift_bridgeObjectRelease();
    if (v10)
    {
LABEL_3:
      if ((v4 & 0xC000000000000001) != 0)
      {
        id v7 = (id)sub_10000A4E0();
      }
      else
      {
        if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return AVAsynchronousKeyValueLoading.load<A>(_:)(v5, v6);
        }
        id v7 = *(id *)(v4 + 32);
      }
      v0[10] = v7;
      swift_bridgeObjectRelease();
      sub_100007E08(&qword_100010168);
      uint64_t v8 = sub_10000A030();
      v0[11] = v8;
      uint64_t v9 = (void *)swift_task_alloc();
      v0[12] = v9;
      *uint64_t v9 = v0;
      v9[1] = sub_1000091D8;
      uint64_t v5 = (uint64_t)(v0 + 2);
      uint64_t v6 = v8;
      return AVAsynchronousKeyValueLoading.load<A>(_:)(v5, v6);
    }
  }
  else if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  BOOL v11 = (uint64_t (*)(void, unint64_t))v0[1];
  return v11(0, 0xF000000000000000);
}

uint64_t sub_1000091D8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v3 = sub_100009530;
  }
  else
  {
    unint64_t v4 = *(void **)(v2 + 80);
    swift_release();

    id v3 = sub_1000092F8;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000092F8()
{
  unint64_t v1 = *(void *)(v0 + 24);
  if (v1 >> 60 == 15) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = *(void *)(v0 + 16);
  }
  if (v1 >> 60 == 15) {
    unint64_t v3 = 0xF000000000000000;
  }
  else {
    unint64_t v3 = *(void *)(v0 + 24);
  }
  return (*(uint64_t (**)(uint64_t, unint64_t))(v0 + 8))(v2, v3);
}

uint64_t sub_100009324()
{
  swift_release();
  if (qword_1000101F0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10000A200();
  sub_100007E4C(v1, (uint64_t)qword_1000107A0);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_10000A1E0();
  os_log_type_t v3 = sub_10000A410();
  if (os_log_type_enabled(v2, v3))
  {
    unint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v4 = 138412290;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 40) = v6;
    sub_10000A4B0();
    *uint64_t v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Failed to fetch artwork data: %@", v4, 0xCu);
    sub_100007E08(&qword_100010158);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  id v7 = *(uint64_t (**)(void, unint64_t))(v0 + 8);
  return v7(0, 0xF000000000000000);
}

uint64_t sub_100009530()
{
  uint64_t v1 = (void *)v0[10];
  swift_release();

  if (qword_1000101F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000A200();
  sub_100007E4C(v2, (uint64_t)qword_1000107A0);
  swift_errorRetain();
  swift_errorRetain();
  os_log_type_t v3 = sub_10000A1E0();
  os_log_type_t v4 = sub_10000A410();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    v0[5] = v7;
    sub_10000A4B0();
    *uint64_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed to fetch artwork data: %@", v5, 0xCu);
    sub_100007E08(&qword_100010158);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v8 = (uint64_t (*)(void, unint64_t))v0[1];
  return v8(0, 0xF000000000000000);
}

void type metadata accessor for QLThumbnailError(uint64_t a1)
{
}

uint64_t sub_100009754(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100009768(a1, a2);
  }
  return a1;
}

uint64_t sub_100009768(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000097C0()
{
  return sub_10000A240();
}

void sub_100009800(void (*a1)(void))
{
  id v3 = (id)(*(uint64_t (**)(void))(v1 + 16))();
  a1();
}

uint64_t sub_100009864(uint64_t a1)
{
  uint64_t v2 = sub_100007E08(&qword_100010118);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000098C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100009914(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100009974(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007E08(&qword_100010138);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1000099DC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000099EC(uint64_t a1, unint64_t *a2)
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

uint64_t *sub_100009A28(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

__n128 sub_100009A8C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_100009AA4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100009AC4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

void type metadata accessor for CMTime(uint64_t a1)
{
}

uint64_t sub_100009B04(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_100009B38(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_100009B4C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100009B6C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
}

__n128 sub_100009BB8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100009BC4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100009BE4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t sub_100009C20()
{
  return sub_100007DC0(&qword_100010190, type metadata accessor for QLThumbnailError);
}

uint64_t sub_100009C68()
{
  return sub_100007DC0(&qword_100010198, type metadata accessor for QLThumbnailError);
}

uint64_t sub_100009CB0()
{
  return sub_100007DC0(&qword_1000101A0, type metadata accessor for QLThumbnailError);
}

uint64_t sub_100009CF8()
{
  return sub_100007DC0(&qword_1000101A8, type metadata accessor for QLThumbnailError);
}

uint64_t sub_100009D40()
{
  return sub_100007DC0(&qword_1000101B0, type metadata accessor for QLThumbnailError);
}

uint64_t sub_100009D88()
{
  return sub_100007DC0(&qword_1000101B8, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

uint64_t sub_100009DE4()
{
  return sub_100007DC0(&qword_1000101C0, type metadata accessor for Code);
}

unint64_t sub_100009E30()
{
  unint64_t result = qword_1000101C8;
  if (!qword_1000101C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000101C8);
  }
  return result;
}

uint64_t sub_100009E84()
{
  return sub_100007DC0(&qword_1000101D0, type metadata accessor for Code);
}

uint64_t sub_100009ECC()
{
  return sub_100007DC0(&qword_100010100, type metadata accessor for QLThumbnailError);
}

void type metadata accessor for CMTimeFlags(uint64_t a1)
{
}

void sub_100009F28(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100009FD0()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t sub_100009FE0()
{
  return URL.lastPathComponent.getter();
}

void sub_100009FF0(NSURL *retstr@<X8>)
{
}

uint64_t sub_10000A000()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000A010()
{
  return static AVPartialAsyncProperty<A>.naturalSize.getter();
}

uint64_t sub_10000A020()
{
  return static AVPartialAsyncProperty<A>.preferredTransform.getter();
}

uint64_t sub_10000A030()
{
  return static AVPartialAsyncProperty<A>.dataValue.getter();
}

uint64_t sub_10000A040()
{
  return static AVPartialAsyncProperty<A>.commonMetadata.getter();
}

uint64_t sub_10000A050()
{
  return static AVPartialAsyncProperty<A>.duration.getter();
}

uint64_t sub_10000A060()
{
  return static AppExtension.main()();
}

uint64_t sub_10000A070()
{
  return static ThumbnailReply.imageRenderer(_:)();
}

uint64_t sub_10000A080()
{
  return ThumbnailReply.inlinePreviewMode.setter();
}

uint64_t sub_10000A090()
{
  return static ThumbnailReply.data(_:contentType:attachments:)();
}

uint64_t sub_10000A0A0()
{
  return static ThumbnailReply.cgImage(_:scale:isLowQuality:)();
}

uint64_t sub_10000A0B0()
{
  return type metadata accessor for ThumbnailReply();
}

uint64_t sub_10000A0C0()
{
  return ThumbnailRequest.contentType.getter();
}

uint64_t sub_10000A0D0()
{
  return ThumbnailRequest.Options.maximumSize.getter();
}

uint64_t sub_10000A0E0()
{
  return ThumbnailRequest.Options.minimumSize.getter();
}

uint64_t sub_10000A0F0()
{
  return ThumbnailRequest.Options.interpolationQuality.getter();
}

uint64_t sub_10000A100()
{
  return ThumbnailRequest.Options.scale.getter();
}

uint64_t sub_10000A110()
{
  return type metadata accessor for ThumbnailRequest.Options();
}

uint64_t sub_10000A130()
{
  return ThumbnailRequest.options.getter();
}

uint64_t sub_10000A140()
{
  return ThumbnailProvider.init(contentType:generator:)();
}

uint64_t sub_10000A150()
{
  return type metadata accessor for ThumbnailProvider();
}

uint64_t sub_10000A170()
{
  return UTType.identifier.getter();
}

uint64_t sub_10000A180()
{
  return static UTType.appleProtectedMPEG4Audio.getter();
}

uint64_t sub_10000A190()
{
  return static UTType.item.getter();
}

uint64_t sub_10000A1A0()
{
  return static UTType.audio.getter();
}

uint64_t sub_10000A1B0()
{
  return static UTType.image.getter();
}

uint64_t sub_10000A1C0()
{
  return UTType.conforms(to:)();
}

uint64_t sub_10000A1D0()
{
  return type metadata accessor for UTType();
}

uint64_t sub_10000A1E0()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000A1F0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000A200()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10000A210()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_10000A220()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_10000A230()
{
  return ImageRenderer.proposedSize.setter();
}

uint64_t sub_10000A240()
{
  return ImageRenderer.render(rasterizationScale:renderer:)();
}

uint64_t sub_10000A250()
{
  return ImageRenderer.init(content:)();
}

uint64_t sub_10000A260()
{
  return ImageRenderer.isOpaque.setter();
}

uint64_t sub_10000A270()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t sub_10000A280()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_10000A290()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_10000A2A0()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_10000A2B0()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_10000A2C0()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_10000A2D0()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_10000A2E0()
{
  return Color.init(_:white:opacity:)();
}

uint64_t sub_10000A2F0()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_10000A300()
{
  return Gradient.init(colors:)();
}

uint64_t sub_10000A310()
{
  return static Alignment.center.getter();
}

uint64_t sub_10000A320()
{
  return static UnitPoint.top.getter();
}

uint64_t sub_10000A330()
{
  return static UnitPoint.bottom.getter();
}

NSDictionary sub_10000A340()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10000A350()
{
  return Dictionary.debugDescription.getter();
}

uint64_t sub_10000A360()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_10000A370()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A380()
{
  return String.hash(into:)();
}

Swift::Int sub_10000A390()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_10000A3A0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10000A3B0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A3C0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10000A3D0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000A3E0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10000A3F0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10000A400()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10000A410()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000A450()
{
  return CGSize.debugDescription.getter();
}

uint64_t sub_10000A460()
{
  return static CMTime.!= infix(_:_:)();
}

unint64_t sub_10000A470(Swift::Double seconds, Swift::Int32 preferredTimescale)
{
  return (unint64_t)CMTime.init(seconds:preferredTimescale:)(seconds, preferredTimescale);
}

uint64_t sub_10000A480()
{
  return CMTime.seconds.getter();
}

uint64_t sub_10000A490()
{
  return CMTime.isNumeric.getter();
}

uint64_t sub_10000A4A0()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_10000A4B0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000A4C0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000A4D0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000A4E0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10000A4F0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000A500()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000A510()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10000A520()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000A530()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000A540()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000A570()
{
  return Error._userInfo.getter();
}

uint64_t sub_10000A580()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10000A590()
{
  return Hasher._finalize()();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

CGSize CGSizeApplyAffineTransform(CGSize size, CGAffineTransform *t)
{
  CGSize v4 = _CGSizeApplyAffineTransform(size, t);
  double height = v4.height;
  double width = v4.width;
  result.double height = height;
  result.double width = width;
  return result;
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t QLDetermineSizeRespectingAspectRatioAndMinimumDimension()
{
  return _QLDetermineSizeRespectingAspectRatioAndMinimumDimension();
}

uint64_t QLThumbnailingImageIOCreateCroppedAndScaledThumbnailToSatisfyConstraints()
{
  return _QLThumbnailingImageIOCreateCroppedAndScaledThumbnailToSatisfyConstraints();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}