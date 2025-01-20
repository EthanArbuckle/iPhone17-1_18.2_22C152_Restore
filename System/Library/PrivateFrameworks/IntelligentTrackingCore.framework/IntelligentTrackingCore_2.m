uint64_t DKLogKeyframeRecorder.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0 + OBJC_IVAR____TtC23IntelligentTrackingCore21DKLogKeyframeRecorder_logFolder;
  v2 = sub_25436C610();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC23IntelligentTrackingCore21DKLogKeyframeRecorder_startTime;
  v4 = sub_25436C7B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = v0 + OBJC_IVAR____TtC23IntelligentTrackingCore21DKLogKeyframeRecorder_logger;
  v6 = sub_25436C9F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_release();
  return v0;
}

uint64_t DKLogKeyframeRecorder.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23IntelligentTrackingCore21DKLogKeyframeRecorder_logFolder;
  uint64_t v2 = sub_25436C610();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC23IntelligentTrackingCore21DKLogKeyframeRecorder_startTime;
  uint64_t v4 = sub_25436C7B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + OBJC_IVAR____TtC23IntelligentTrackingCore21DKLogKeyframeRecorder_logger;
  uint64_t v6 = sub_25436C9F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t DKLogRecorder.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  sub_25436C9E0();
  *(void *)(v0 + OBJC_IVAR____TtC23IntelligentTrackingCore13DKLogRecorder_keyframeLogger) = 0;
  return v0;
}

uint64_t DKLogRecorder.init()()
{
  sub_25436C9E0();
  *(void *)(v0 + OBJC_IVAR____TtC23IntelligentTrackingCore13DKLogRecorder_keyframeLogger) = 0;
  return v0;
}

uint64_t sub_25435AB74(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = type metadata accessor for DKLoggerMetafile(0);
  v2[5] = swift_task_alloc();
  uint64_t v3 = sub_25436C7B0();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  uint64_t v4 = sub_25436C9C0();
  v2[10] = v4;
  v2[11] = *(void *)(v4 - 8);
  v2[12] = swift_task_alloc();
  uint64_t v5 = sub_25436C610();
  v2[13] = v5;
  v2[14] = *(void *)(v5 - 8);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25435AD3C, 0, 0);
}

uint64_t sub_25435AD3C()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[14];
  uint64_t v4 = v0[11];
  uint64_t v3 = v0[12];
  uint64_t v6 = v0[9];
  uint64_t v5 = v0[10];
  uint64_t v7 = v0[7];
  uint64_t v16 = v0[8];
  uint64_t v14 = v0[15];
  uint64_t v15 = v0[6];
  uint64_t v8 = v0[2];
  sub_25436C9A0();
  sub_25436C5C0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_25436C790();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v14, v8, v1);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v0[17] = v9;
  v0[18] = (v7 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v9(v16, v6, v15);
  type metadata accessor for DKLogKeyframeRecorder(0);
  swift_allocObject();
  v10 = (void *)swift_task_alloc();
  v0[19] = v10;
  void *v10 = v0;
  v10[1] = sub_25435AEC0;
  uint64_t v11 = v0[15];
  uint64_t v12 = v0[8];
  return DKLogKeyframeRecorder.init(logFolder:startTime:)(v11, v12);
}

uint64_t sub_25435AEC0(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 160) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_25435B2A0;
  }
  else
  {
    *(void *)(v4 + 168) = a1;
    uint64_t v5 = sub_25435AFE8;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_25435AFE8()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[17];
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v7 = v0[4];
  uint64_t v6 = v0[5];
  *(void *)(v0[3] + OBJC_IVAR____TtC23IntelligentTrackingCore13DKLogRecorder_keyframeLogger) = v0[21];
  swift_release();
  sub_25436C460();
  swift_allocObject();
  sub_25436C450();
  v2(v6, v3, v4);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v6, 0, 1, v4);
  *(_OWORD *)(v6 + *(int *)(v7 + 20)) = xmmword_254378C70;
  *(_OWORD *)(v6 + *(int *)(v7 + 24)) = xmmword_254378C80;
  sub_25435BC64((unint64_t *)&unk_269DDA1E8, (void (*)(uint64_t))type metadata accessor for DKLoggerMetafile);
  uint64_t v8 = sub_25436C440();
  if (v1)
  {
    uint64_t v10 = v0[5];
    swift_release();
    sub_2542C72CC(v10);
    uint64_t v11 = v0[16];
    uint64_t v12 = v0[13];
    uint64_t v13 = v0[14];
    (*(void (**)(void, void))(v0[7] + 8))(v0[9], v0[6]);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  else
  {
    uint64_t v14 = v8;
    unint64_t v15 = v9;
    uint64_t v16 = v0[16];
    uint64_t v17 = v0[14];
    uint64_t v23 = v0[13];
    uint64_t v18 = v0[9];
    uint64_t v20 = v0[6];
    uint64_t v19 = v0[7];
    sub_2542C72CC(v0[5]);
    sub_25436C6C0();
    sub_2542564BC(v14, v15);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v23);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_25435B2A0()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[14];
  (*(void (**)(void, void))(v0[7] + 8))(v0[9], v0[6]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_25435B380()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_25435B3A0, 0, 0);
}

uint64_t sub_25435B3A0()
{
  uint64_t v1 = *(void *)(v0[2] + OBJC_IVAR____TtC23IntelligentTrackingCore13DKLogRecorder_keyframeLogger);
  v0[3] = v1;
  if (v1)
  {
    swift_retain();
    uint64_t v2 = (void *)swift_task_alloc();
    v0[4] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_25435B480;
    return sub_254359994();
  }
  else
  {
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
}

uint64_t sub_25435B480()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25435B5F8;
  }
  else {
    uint64_t v2 = sub_25435B594;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25435B594()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25435B5F8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25435B65C()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC23IntelligentTrackingCore13DKLogRecorder_keyframeLogger))
  {
    swift_retain();
    sub_25435A018();
    return swift_release();
  }
  return result;
}

uint64_t sub_25435B6B4(uint64_t result)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC23IntelligentTrackingCore13DKLogRecorder_keyframeLogger);
  if (v2)
  {
    if (*(void *)(v2 + OBJC_IVAR____TtC23IntelligentTrackingCore21DKLogKeyframeRecorder_currentKeyframe))
    {
      uint64_t v3 = result;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269DD7B00);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_25436F130;
      sub_25427215C(v3, inited + 32);
      swift_retain();
      swift_retain();
      uint64_t v5 = _s23IntelligentTrackingCore17DKKeyframeStorageC7convert4logsSayAA12DKLogCodableOGSayAA10DKLoggable_pG_tFZ_0(inited);
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269DD7B08);
      swift_arrayDestroy();
      sub_25427DB14((uint64_t)v5);
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_25435B7AC(uint64_t result)
{
  if (*(void *)(v1 + OBJC_IVAR____TtC23IntelligentTrackingCore13DKLogRecorder_keyframeLogger))
  {
    uint64_t v2 = (__CVBuffer *)result;
    swift_retain();
    sub_25435A334(v2);
    return swift_release();
  }
  return result;
}

uint64_t DKLogRecorder.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23IntelligentTrackingCore13DKLogRecorder_logger;
  uint64_t v2 = sub_25436C9F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return v0;
}

uint64_t DKLogRecorder.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23IntelligentTrackingCore13DKLogRecorder_logger;
  uint64_t v2 = sub_25436C9F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

id sub_25435B930(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  v15[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v6 = (void *)sub_25436C5B0();
  v15[0] = 0;
  id v7 = objc_msgSend(v3, sel_initWithURL_fileType_error_, v6, a2, v15);

  id v8 = v15[0];
  if (v7)
  {
    uint64_t v9 = sub_25436C610();
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
    id v11 = v8;
    v10(a1, v9);
  }
  else
  {
    id v12 = v15[0];
    sub_25436C570();

    swift_willThrow();
    uint64_t v13 = sub_25436C610();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a1, v13);
  }
  return v7;
}

uint64_t type metadata accessor for DKLogVideoRecorder(uint64_t a1)
{
  return sub_254252A6C(a1, (uint64_t *)&unk_269DDA1F8);
}

CMSampleBufferRef sub_25435BAA4(__CVBuffer *a1, Float64 a2)
{
  formatDescriptionOut[1] = *(CMVideoFormatDescriptionRef *)MEMORY[0x263EF8340];
  CMTimeMakeWithSeconds(&v12.duration, a2, 30);
  CMTimeValue value = v12.duration.value;
  CMTimeEpoch epoch = v12.duration.epoch;
  *(void *)&v12.presentationTimeStamp.timescale = *(void *)&v12.duration.timescale;
  CMTimeScale v5 = *(_DWORD *)(MEMORY[0x263F01090] + 8);
  CMTimeFlags v6 = *(_DWORD *)(MEMORY[0x263F01090] + 12);
  CMTimeEpoch v7 = *(void *)(MEMORY[0x263F01090] + 16);
  v12.duration.CMTimeValue value = *MEMORY[0x263F01090];
  v12.duration.timescale = v5;
  v12.duration.flags = v6;
  v12.duration.CMTimeEpoch epoch = v7;
  v12.presentationTimeStamp.CMTimeValue value = value;
  v12.presentationTimeStamp.CMTimeEpoch epoch = epoch;
  v12.decodeTimeStamp.CMTimeValue value = v12.duration.value;
  v12.decodeTimeStamp.timescale = v5;
  v12.decodeTimeStamp.flags = v6;
  v12.decodeTimeStamp.CMTimeEpoch epoch = v7;
  formatDescriptionOut[0] = 0;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], a1, formatDescriptionOut);
  CMVideoFormatDescriptionRef v9 = formatDescriptionOut[0];
  CMSampleBufferRef sampleBufferOut = 0;
  if (!formatDescriptionOut[0]) {
    return 0;
  }
  CMSampleBufferCreateReadyWithImageBuffer(v8, a1, formatDescriptionOut[0], &v12, &sampleBufferOut);
  CMSampleBufferRef v10 = sampleBufferOut;

  return v10;
}

unint64_t sub_25435BBA0()
{
  unint64_t result = qword_269DDA1D0;
  if (!qword_269DDA1D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DD98F0);
    sub_25435BC64((unint64_t *)&unk_269DDA1D8, (void (*)(uint64_t))type metadata accessor for DKKeyframeStorage);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DDA1D0);
  }
  return result;
}

uint64_t type metadata accessor for DKLogKeyframeRecorder(uint64_t a1)
{
  return sub_254252A6C(a1, (uint64_t *)&unk_269DDA218);
}

uint64_t sub_25435BC64(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25435BCAC()
{
  return type metadata accessor for DKLogVideoRecorder(0);
}

uint64_t sub_25435BCB4()
{
  uint64_t result = sub_25436C9F0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for DKLogVideoRecorder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DKLogVideoRecorder);
}

uint64_t dispatch thunk of DKLogVideoRecorder.__allocating_init(url:)(uint64_t a1)
{
  CMTimeFlags v6 = (uint64_t (*)(uint64_t))(*(void *)(v1 + 184) + **(int **)(v1 + 184));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25431CA18;
  return v6(a1);
}

uint64_t dispatch thunk of DKLogVideoRecorder.save()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 192) + **(int **)(*(void *)v0 + 192));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_25426C7EC;
  return v4();
}

uint64_t dispatch thunk of DKLogVideoRecorder.log(image:duration:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of DKLogVideoRecorder.getCMSampleBuffer(pixelBuffer:duration:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t sub_25435BFA0()
{
  return type metadata accessor for DKLogKeyframeRecorder(0);
}

uint64_t sub_25435BFA8()
{
  uint64_t result = sub_25436C610();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_25436C7B0();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_25436C9F0();
      if (v3 <= 0x3F) {
        return swift_updateClassMetadata2();
      }
    }
  }
  return result;
}

uint64_t method lookup function for DKLogKeyframeRecorder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DKLogKeyframeRecorder);
}

uint64_t dispatch thunk of DKLogKeyframeRecorder.__allocating_init(logFolder:startTime:)(uint64_t a1, uint64_t a2)
{
  CFAllocatorRef v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v2 + 280) + **(int **)(v2 + 280));
  CMTimeFlags v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *CMTimeFlags v6 = v3;
  v6[1] = sub_25431D6EC;
  return v8(a1, a2);
}

uint64_t dispatch thunk of DKLogKeyframeRecorder.save()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 288) + **(int **)(*(void *)v0 + 288));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_25426C7EC;
  return v4();
}

uint64_t dispatch thunk of DKLogKeyframeRecorder.addNewKeyframe()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of DKLogKeyframeRecorder.log(item:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of DKLogKeyframeRecorder.log(items:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of DKLogKeyframeRecorder.log(image:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t sub_25435C388()
{
  return type metadata accessor for DKLogRecorder(0);
}

uint64_t type metadata accessor for DKLogRecorder(uint64_t a1)
{
  return sub_254252A6C(a1, (uint64_t *)&unk_269DDA238);
}

uint64_t sub_25435C3B0()
{
  uint64_t result = sub_25436C9F0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for DKLogRecorder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DKLogRecorder);
}

uint64_t dispatch thunk of DKLogRecorder.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of DKLogRecorder.startRecording(logFolder:)(uint64_t a1)
{
  CMTimeFlags v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 128) + **(int **)(*(void *)v1 + 128));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25426C7EC;
  return v6(a1);
}

uint64_t dispatch thunk of DKLogRecorder.saveRecording()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 136) + **(int **)(*(void *)v0 + 136));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_25426BA30;
  return v4();
}

uint64_t dispatch thunk of DKLogRecorder.addNewKeyframe()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of DKLogRecorder.log(item:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of DKLogRecorder.log(image:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t DKBoundingBoxFilter.__allocating_init(alpha:)(double a1)
{
  uint64_t v2 = swift_allocObject();
  DKBoundingBoxFilter.init(alpha:)(a1);
  return v2;
}

void sub_25435C720(uint64_t a1@<X8>)
{
  uint64_t v3 = v1[2];
  double v4 = 0.0;
  if (*(unsigned char *)(v3 + 33) == 1
    && (*(unsigned char *)(v3 + 32) != 1
      ? (double v5 = *(double *)(v3 + 40))
      : (double v5 = atan2(*(long double *)(v3 + 48), *(long double *)(v3 + 56))),
        (uint64_t v6 = v1[3], *(unsigned char *)(v6 + 33) == 1)
     && (*(unsigned char *)(v6 + 32) != 1
       ? (double v7 = *(double *)(v6 + 40))
       : (double v7 = atan2(*(long double *)(v6 + 48), *(long double *)(v6 + 56))),
         (uint64_t v8 = v1[4], *(unsigned char *)(v8 + 33) == 1)
      && (*(unsigned char *)(v8 + 32) != 1
        ? (double v9 = *(double *)(v8 + 40))
        : (double v9 = atan2(*(long double *)(v8 + 48), *(long double *)(v8 + 56))),
          uint64_t v10 = v1[5],
          *(unsigned char *)(v10 + 33) == 1))))
  {
    if (*(unsigned char *)(v10 + 32) == 1) {
      double v11 = atan2(*(long double *)(v10 + 48), *(long double *)(v10 + 56));
    }
    else {
      double v11 = *(double *)(v10 + 40);
    }
    char v12 = 0;
    double v4 = v5 - v9 * 0.5;
    double v13 = v7 - v11 * 0.5;
  }
  else
  {
    char v12 = 1;
    double v13 = 0.0;
    double v9 = 0.0;
    double v11 = 0.0;
  }
  *(double *)a1 = v4;
  *(double *)(a1 + 8) = v13;
  *(double *)(a1 + 16) = v9;
  *(double *)(a1 + 24) = v11;
  *(unsigned char *)(a1 + 32) = v12;
}

uint64_t DKBoundingBoxFilter.init(alpha:)(double a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DD7A40);
  MEMORY[0x270FA5388](v3 - 8);
  double v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = v1;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(unsigned char *)(v1 + 80) = 1;
  uint64_t v6 = sub_25436C7B0();
  double v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  type metadata accessor for DKSmoothingFilter();
  uint64_t v8 = swift_allocObject();
  *(unsigned char *)(v8 + 33) = 0;
  *(void *)(v8 + 40) = 0;
  *(void *)(v8 + 48) = 0;
  *(void *)(v8 + 56) = 0x3FF0000000000000;
  uint64_t v9 = v8 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated;
  v7((char *)(v8 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated), 1, 1, v6);
  uint64_t v10 = v8 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lowThreshold;
  *(void *)uint64_t v10 = 0;
  *(unsigned char *)(v10 + 8) = 1;
  uint64_t v11 = v8 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_highThreshold;
  *(void *)uint64_t v11 = 0;
  *(unsigned char *)(v11 + 8) = 1;
  *(unsigned char *)(v8 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_BOOLeanValue) = 0;
  *(double *)(v8 + 16) = a1;
  *(double *)(v8 + 24) = a1;
  *(unsigned char *)(v8 + 32) = 0;
  sub_254277464((uint64_t)v5, v9);
  *(void *)uint64_t v10 = 0;
  *(unsigned char *)(v10 + 8) = 1;
  *(void *)uint64_t v11 = 0;
  *(unsigned char *)(v11 + 8) = 1;
  uint64_t v12 = v28;
  *(void *)(v28 + 16) = v8;
  v7(v5, 1, 1, v6);
  uint64_t v13 = swift_allocObject();
  *(unsigned char *)(v13 + 33) = 0;
  *(void *)(v13 + 40) = 0;
  *(void *)(v13 + 48) = 0;
  *(void *)(v13 + 56) = 0x3FF0000000000000;
  uint64_t v14 = v13 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated;
  v7((char *)(v13 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated), 1, 1, v6);
  uint64_t v15 = v13 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lowThreshold;
  *(void *)uint64_t v15 = 0;
  *(unsigned char *)(v15 + 8) = 1;
  uint64_t v16 = v13 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_highThreshold;
  *(void *)uint64_t v16 = 0;
  *(unsigned char *)(v16 + 8) = 1;
  *(unsigned char *)(v13 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_BOOLeanValue) = 0;
  *(double *)(v13 + 16) = a1;
  *(double *)(v13 + 24) = a1;
  *(unsigned char *)(v13 + 32) = 0;
  sub_254277464((uint64_t)v5, v14);
  *(void *)uint64_t v15 = 0;
  *(unsigned char *)(v15 + 8) = 1;
  *(void *)uint64_t v16 = 0;
  *(unsigned char *)(v16 + 8) = 1;
  *(void *)(v12 + 24) = v13;
  v7(v5, 1, 1, v6);
  uint64_t v17 = swift_allocObject();
  *(unsigned char *)(v17 + 33) = 0;
  *(void *)(v17 + 40) = 0;
  *(void *)(v17 + 48) = 0;
  *(void *)(v17 + 56) = 0x3FF0000000000000;
  uint64_t v18 = v17 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated;
  v7((char *)(v17 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated), 1, 1, v6);
  uint64_t v19 = v17 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lowThreshold;
  *(void *)uint64_t v19 = 0;
  *(unsigned char *)(v19 + 8) = 1;
  uint64_t v20 = v17 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_highThreshold;
  *(void *)uint64_t v20 = 0;
  *(unsigned char *)(v20 + 8) = 1;
  *(unsigned char *)(v17 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_BOOLeanValue) = 0;
  *(double *)(v17 + 16) = a1;
  *(double *)(v17 + 24) = a1;
  *(unsigned char *)(v17 + 32) = 0;
  sub_254277464((uint64_t)v5, v18);
  *(void *)uint64_t v19 = 0;
  *(unsigned char *)(v19 + 8) = 1;
  *(void *)uint64_t v20 = 0;
  *(unsigned char *)(v20 + 8) = 1;
  uint64_t v21 = v28;
  *(void *)(v28 + 32) = v17;
  v7(v5, 1, 1, v6);
  uint64_t v22 = swift_allocObject();
  *(unsigned char *)(v22 + 33) = 0;
  *(void *)(v22 + 40) = 0;
  *(void *)(v22 + 48) = 0;
  *(void *)(v22 + 56) = 0x3FF0000000000000;
  uint64_t v23 = v22 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated;
  v7((char *)(v22 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated), 1, 1, v6);
  uint64_t v24 = v22 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lowThreshold;
  *(void *)uint64_t v24 = 0;
  *(unsigned char *)(v24 + 8) = 1;
  uint64_t v25 = v22 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_highThreshold;
  *(void *)uint64_t v25 = 0;
  *(unsigned char *)(v25 + 8) = 1;
  *(unsigned char *)(v22 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_BOOLeanValue) = 0;
  *(double *)(v22 + 16) = a1;
  *(double *)(v22 + 24) = a1;
  *(unsigned char *)(v22 + 32) = 0;
  sub_254277464((uint64_t)v5, v23);
  *(void *)uint64_t v24 = 0;
  *(unsigned char *)(v24 + 8) = 1;
  *(void *)uint64_t v25 = 0;
  *(unsigned char *)(v25 + 8) = 1;
  uint64_t result = v21;
  *(void *)(v21 + 40) = v22;
  return result;
}

uint64_t sub_25435CC98(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DD7A40);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  double MidX = CGRectGetMidX(v20);
  uint64_t v13 = sub_25436C7B0();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v11, 1, 1, v13);
  sub_25435D340(0, 1, (uint64_t)v11, MidX);
  swift_release();
  sub_254258BD8((uint64_t)v11);
  swift_retain();
  v21.origin.x = a1;
  v21.origin.y = a2;
  v21.size.width = a3;
  v21.size.height = a4;
  double MidY = CGRectGetMidY(v21);
  v14(v11, 1, 1, v13);
  sub_25435D340(0, 1, (uint64_t)v11, MidY);
  swift_release();
  sub_254258BD8((uint64_t)v11);
  swift_retain();
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  double Width = CGRectGetWidth(v22);
  v14(v11, 1, 1, v13);
  sub_25435D340(0, 1, (uint64_t)v11, Width);
  swift_release();
  sub_254258BD8((uint64_t)v11);
  swift_retain();
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  double Height = CGRectGetHeight(v23);
  v14(v11, 1, 1, v13);
  sub_25435D340(0, 1, (uint64_t)v11, Height);
  swift_release();
  uint64_t result = sub_254258BD8((uint64_t)v11);
  *(CGFloat *)(v4 + 48) = a1;
  *(CGFloat *)(v4 + 56) = a2;
  *(CGFloat *)(v4 + 64) = a3;
  *(CGFloat *)(v4 + 72) = a4;
  *(unsigned char *)(v4 + 80) = 0;
  return result;
}

uint64_t DKBoundingBoxFilter.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t DKBoundingBoxFilter.__deallocating_deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DKBoundingBoxFilter()
{
  return self;
}

uint64_t method lookup function for DKBoundingBoxFilter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DKBoundingBoxFilter);
}

uint64_t dispatch thunk of DKBoundingBoxFilter.rect.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of DKBoundingBoxFilter.__allocating_init(alpha:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of DKBoundingBoxFilter.update(rect:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t DKSmoothingFilter.__allocating_init(value:alpha:beta:isAngle:lastUpdated:lowThreshold:highThreshold:initialBooleanValue:)(uint64_t a1, char a2, uint64_t a3, char a4, char a5, uint64_t a6, uint64_t a7, char a8, double a9, uint64_t a10, char a11)
{
  char v16 = a2 & 1;
  char v17 = a4 & 1;
  char v18 = a8 & 1;
  swift_allocObject();
  return sub_25435D778(a1, v16, a3, v17, a5, a6, a7, v18, a9, a10, a11 & 1);
}

uint64_t sub_25435D0E8()
{
  if (*(unsigned char *)(v0 + 33) != 1) {
    return 0;
  }
  if (*(unsigned char *)(v0 + 32) == 1) {
    return atan2(*(long double *)(v0 + 48), *(long double *)(v0 + 56));
  }
  return *(void *)(v0 + 40);
}

uint64_t sub_25435D13C()
{
  return *(unsigned __int8 *)(v0 + 33);
}

uint64_t sub_25435D144(uint64_t result)
{
  *(unsigned char *)(v1 + 33) = result;
  return result;
}

uint64_t (*sub_25435D14C())()
{
  return nullsub_1;
}

uint64_t sub_25435D16C(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DD7A40);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_254272818(a1, (uint64_t)v6);
  return sub_254277464((uint64_t)v6, *a2 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated);
}

uint64_t sub_25435D208@<X0>(uint64_t a1@<X8>)
{
  return sub_254272818(v1 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated, a1);
}

uint64_t sub_25435D21C(uint64_t a1)
{
  return sub_254277464(a1, v1 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated);
}

uint64_t (*sub_25435D22C())()
{
  return nullsub_1;
}

uint64_t sub_25435D254()
{
  return *(void *)(v0 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lowThreshold);
}

uint64_t sub_25435D26C(uint64_t result, char a2)
{
  uint64_t v3 = v2 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lowThreshold;
  *(void *)uint64_t v3 = result;
  *(unsigned char *)(v3 + 8) = a2 & 1;
  return result;
}

uint64_t (*sub_25435D288())()
{
  return nullsub_1;
}

uint64_t sub_25435D2B0()
{
  return *(void *)(v0 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_highThreshold);
}

uint64_t sub_25435D2C8(uint64_t result, char a2)
{
  uint64_t v3 = v2 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_highThreshold;
  *(void *)uint64_t v3 = result;
  *(unsigned char *)(v3 + 8) = a2 & 1;
  return result;
}

uint64_t (*sub_25435D2E4())()
{
  return nullsub_1;
}

uint64_t sub_25435D30C()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_BOOLeanValue);
}

uint64_t DKSmoothingFilter.init(value:alpha:beta:isAngle:lastUpdated:lowThreshold:highThreshold:initialBooleanValue:)(uint64_t a1, char a2, uint64_t a3, char a4, char a5, uint64_t a6, uint64_t a7, char a8, double a9, uint64_t a10, char a11)
{
  return sub_25435D778(a1, a2 & 1, a3, a4 & 1, a5, a6, a7, a8 & 1, a9, a10, a11 & 1);
}

void sub_25435D340(uint64_t a1, char a2, uint64_t a3, double a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DD7A40);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25436C7B0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  char v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v18 = *(unsigned __int8 *)(v4 + 32);
  if (*(unsigned char *)(v4 + 33) != 1)
  {
    if (*(unsigned char *)(v4 + 32)) {
      *(__double2 *)(v4 + 48) = __sincos_stret(a4);
    }
    else {
      *(double *)(v4 + 40) = a4;
    }
    goto LABEL_15;
  }
  if (*(unsigned char *)(v4 + 32))
  {
    double v19 = atan2(*(long double *)(v4 + 48), *(long double *)(v4 + 56));
    if (a2) {
      goto LABEL_4;
    }
  }
  else
  {
    double v19 = *(double *)(v4 + 40);
    if (a2)
    {
LABEL_4:
      if (fabs(v19) >= fabs(a4)) {
        *(void *)&long long v14 = *(void *)(v4 + 24);
      }
      else {
        *(void *)&long long v14 = *(void *)(v4 + 16);
      }
      goto LABEL_12;
    }
  }
  *(void *)&long long v14 = a1;
LABEL_12:
  *(double *)&long long v15 = 1.0 - *(double *)&v14;
  if (v18)
  {
    long long v26 = v14;
    long long v27 = v15;
    __double2 v20 = __sincos_stret(a4);
    *(float64x2_t *)(v4 + 48) = vaddq_f64(vmulq_n_f64((float64x2_t)v20, *(double *)&v26), vmulq_n_f64(*(float64x2_t *)(v4 + 48), *(double *)&v27));
  }
  else
  {
    *(double *)(v4 + 40) = *(double *)&v14 * a4 + *(double *)&v15 * *(double *)(v4 + 40);
  }
LABEL_15:
  *(unsigned char *)(v4 + 33) = 1;
  sub_254272818(a3, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_254258BD8((uint64_t)v11);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v17, v11, v12);
    uint64_t v21 = v4 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated;
    sub_254258BD8(v4 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated);
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(v21, v17, v12);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(v21, 0, 1, v12);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v12);
  }
  if ((*(unsigned char *)(v4 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lowThreshold + 8) & 1) == 0
    && (*(unsigned char *)(v4 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_highThreshold + 8) & 1) == 0
    && *(unsigned char *)(v4 + 33) == 1)
  {
    double v22 = *(double *)(v4 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lowThreshold);
    double v23 = *(double *)(v4 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_highThreshold);
    if (*(unsigned char *)(v4 + 32) == 1)
    {
      double v24 = atan2(*(long double *)(v4 + 48), *(long double *)(v4 + 56));
      if (v24 >= v22)
      {
LABEL_23:
        if (v23 >= v24) {
          return;
        }
        char v25 = 1;
        goto LABEL_27;
      }
    }
    else
    {
      double v24 = *(double *)(v4 + 40);
      if (v24 >= v22) {
        goto LABEL_23;
      }
    }
    char v25 = 0;
LABEL_27:
    *(unsigned char *)(v4 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_BOOLeanValue) = v25;
  }
}

uint64_t sub_25435D66C()
{
  *(unsigned char *)(v0 + 33) = 0;
  uint64_t v1 = v0 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated;
  sub_254258BD8(v0 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated);
  uint64_t v2 = sub_25436C7B0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  return v3(v1, 1, 1, v2);
}

uint64_t DKSmoothingFilter.deinit()
{
  sub_254258BD8(v0 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated);
  return v0;
}

uint64_t DKSmoothingFilter.__deallocating_deinit()
{
  sub_254258BD8(v0 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated);
  return swift_deallocClassInstance();
}

uint64_t sub_25435D778(uint64_t a1, char a2, uint64_t a3, char a4, char a5, uint64_t a6, uint64_t a7, char a8, double a9, uint64_t a10, char a11)
{
  *(unsigned char *)(v11 + 33) = 0;
  *(void *)(v11 + 40) = 0;
  *(void *)(v11 + 48) = 0;
  *(void *)(v11 + 56) = 0x3FF0000000000000;
  uint64_t v17 = v11 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated;
  uint64_t v18 = sub_25436C7B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  uint64_t v19 = v11 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lowThreshold;
  *(void *)uint64_t v19 = 0;
  *(unsigned char *)(v19 + 8) = 1;
  uint64_t v20 = v11 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_highThreshold;
  *(void *)uint64_t v20 = 0;
  *(unsigned char *)(v20 + 8) = 1;
  *(unsigned char *)(v11 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_BOOLeanValue) = 0;
  double v21 = *(double *)&a3;
  if (a4) {
    double v21 = a9;
  }
  *(double *)(v11 + 16) = a9;
  *(double *)(v11 + 24) = v21;
  *(unsigned char *)(v11 + 32) = a5;
  if ((a2 & 1) == 0)
  {
    if (a5) {
      *(__double2 *)(v11 + 48) = __sincos_stret(*(double *)&a1);
    }
    else {
      *(void *)(v11 + 40) = a1;
    }
    *(unsigned char *)(v11 + 33) = 1;
  }
  sub_254277464(a6, v17);
  *(void *)uint64_t v19 = a7;
  *(unsigned char *)(v19 + 8) = a8 & 1;
  *(void *)uint64_t v20 = a10;
  *(unsigned char *)(v20 + 8) = a11 & 1;
  return v11;
}

double sub_25435D904@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double result = *(double *)(*(void *)a1 + 16);
  *a2 = result;
  return result;
}

double sub_25435D914(double *a1, uint64_t a2)
{
  double result = *a1;
  *(double *)(*(void *)a2 + 16) = *a1;
  return result;
}

double sub_25435D924@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double result = *(double *)(*(void *)a1 + 24);
  *a2 = result;
  return result;
}

double sub_25435D934(double *a1, uint64_t a2)
{
  double result = *a1;
  *(double *)(*(void *)a2 + 24) = *a1;
  return result;
}

uint64_t sub_25435D944@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(*(void *)result + 32);
  return result;
}

unsigned char *sub_25435D954(unsigned char *result, uint64_t a2)
{
  *(unsigned char *)(*(void *)a2 + 32) = *result;
  return result;
}

uint64_t sub_25435D964@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(*(void *)result + 33);
  return result;
}

unsigned char *sub_25435D974(unsigned char *result, uint64_t a2)
{
  *(unsigned char *)(*(void *)a2 + 33) = *result;
  return result;
}

double sub_25435D984@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double result = *(double *)(*(void *)a1 + 40);
  *a2 = result;
  return result;
}

double sub_25435D994(double *a1, uint64_t a2)
{
  double result = *a1;
  *(double *)(*(void *)a2 + 40) = *a1;
  return result;
}

double sub_25435D9A4@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double result = *(double *)(*(void *)a1 + 48);
  *a2 = result;
  return result;
}

double sub_25435D9B4(double *a1, uint64_t a2)
{
  double result = *a1;
  *(double *)(*(void *)a2 + 48) = *a1;
  return result;
}

double sub_25435D9C4@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double result = *(double *)(*(void *)a1 + 56);
  *a2 = result;
  return result;
}

double sub_25435D9D4(double *a1, uint64_t a2)
{
  double result = *a1;
  *(double *)(*(void *)a2 + 56) = *a1;
  return result;
}

uint64_t sub_25435D9E4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_254272818(*a1 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lastUpdated, a2);
}

void *sub_25435DA00@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lowThreshold;
  uint64_t v3 = *(void *)v2;
  LOBYTE(v2) = *(unsigned char *)(v2 + 8);
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_25435DA24(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_50Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_lowThreshold);
}

void *sub_25435DA30@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_highThreshold;
  uint64_t v3 = *(void *)v2;
  LOBYTE(v2) = *(unsigned char *)(v2 + 8);
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_25435DA54(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_50Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_highThreshold);
}

void *sub_25435DA60@<X0>(void *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(*result + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_BOOLeanValue);
  return result;
}

unsigned char *sub_25435DA78(unsigned char *result, void *a2)
{
  *(unsigned char *)(*a2 + OBJC_IVAR____TtC23IntelligentTrackingCore17DKSmoothingFilter_BOOLeanValue) = *result;
  return result;
}

uint64_t sub_25435DA90()
{
  return type metadata accessor for DKSmoothingFilter();
}

uint64_t type metadata accessor for DKSmoothingFilter()
{
  uint64_t result = qword_269DDA258;
  if (!qword_269DDA258) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25435DAE4()
{
  sub_25428D510();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for DKSmoothingFilter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DKSmoothingFilter);
}

uint64_t dispatch thunk of DKSmoothingFilter.alpha.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of DKSmoothingFilter.alpha.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of DKSmoothingFilter.alpha.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of DKSmoothingFilter.beta.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of DKSmoothingFilter.beta.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of DKSmoothingFilter.beta.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of DKSmoothingFilter.value.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of DKSmoothingFilter.isAngle.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of DKSmoothingFilter.isAngle.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of DKSmoothingFilter.isAngle.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of DKSmoothingFilter.isInitialized.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of DKSmoothingFilter.isInitialized.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of DKSmoothingFilter.isInitialized.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of DKSmoothingFilter._value.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of DKSmoothingFilter._value.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of DKSmoothingFilter._value.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of DKSmoothingFilter._valueSin.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of DKSmoothingFilter._valueSin.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of DKSmoothingFilter._valueSin.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of DKSmoothingFilter._valueCos.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of DKSmoothingFilter._valueCos.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of DKSmoothingFilter._valueCos.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of DKSmoothingFilter.lastUpdated.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of DKSmoothingFilter.lastUpdated.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of DKSmoothingFilter.lastUpdated.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of DKSmoothingFilter.lowThreshold.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of DKSmoothingFilter.lowThreshold.setter(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)v2 + 376))(a1, a2 & 1);
}

uint64_t dispatch thunk of DKSmoothingFilter.lowThreshold.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of DKSmoothingFilter.highThreshold.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of DKSmoothingFilter.highThreshold.setter(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)v2 + 400))(a1, a2 & 1);
}

uint64_t dispatch thunk of DKSmoothingFilter.highThreshold.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of DKSmoothingFilter.BOOLeanValue.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of DKSmoothingFilter.__allocating_init(value:alpha:beta:isAngle:lastUpdated:lowThreshold:highThreshold:initialBooleanValue:)(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t, void, uint64_t, void, uint64_t, uint64_t, uint64_t, void, uint64_t))(v9 + 440))(a1, a2 & 1, a3, a4 & 1, a5, a6, a7, a8 & 1, a9);
}

uint64_t dispatch thunk of DKSmoothingFilter.update(_:smoothingFactor:updateTime:)(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)v2 + 448))(a1, a2 & 1);
}

uint64_t dispatch thunk of DKSmoothingFilter.reset()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t sub_25435E1E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DD7A40);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  double v7 = (char *)&v11 - v6;
  *(_OWORD *)(v1 + 56) = xmmword_254378E60;
  *(void *)(v1 + 72) = 0x3FB999999999999ALL;
  uint64_t v8 = sub_25436C7B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(unsigned char *)(v1 + 49) = 0;
  *(void *)(v1 + 24) = 0x3FE0000000000000;
  sub_254272818((uint64_t)v7, (uint64_t)v4);
  type metadata accessor for DKSmoothingFilter();
  swift_allocObject();
  uint64_t v9 = sub_25435D778(0x3FE0000000000000, 0, 0x3FB999999999999ALL, 0, 0, (uint64_t)v4, 0, 1, 0.1, 0, 1);
  sub_254258BD8((uint64_t)v7);
  *(void *)(v1 + 16) = v9;
  *(void *)(v1 + 32) = 0x3FE0000000000000;
  *(void *)(v1 + 40) = 0;
  *(unsigned char *)(v1 + 48) = 1;
  return v1;
}

void sub_25435E374()
{
}

uint64_t sub_25435E3A4()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DKPersonRankingFilter()
{
  return self;
}

Swift::Double __swiftcall wrapAngle(_:)(Swift::Double result)
{
  for (; result > 3.14159265; uint64_t result = result + -6.28318531)
    ;
  for (; result < -3.14159265; uint64_t result = result + 6.28318531)
    ;
  return result;
}

Swift::Double __swiftcall clamp(value:minValue:maxValue:)(Swift::Double value, Swift::Double minValue, Swift::Double maxValue)
{
  if (minValue > value) {
    CMTimeValue value = minValue;
  }
  if (value > maxValue) {
    return maxValue;
  }
  return value;
}

uint64_t FloatingPoint.toRadians()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v13[1] = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](v5);
  double v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v13 - v9;
  sub_25436CB30();
  sub_25436CF70();
  uint64_t v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v7, a1);
  swift_getAssociatedConformanceWitness();
  sub_25436D800();
  sub_25436D7A0();
  sub_25436CB20();
  v11(v7, a1);
  return ((uint64_t (*)(char *, uint64_t))v11)(v10, a1);
}

Swift::Double __swiftcall wrapAngle(_:around:)(Swift::Double _, Swift::Double around)
{
  for (; around + 3.14159265 < _; _ = _ + -6.28318531)
    ;
  for (double i = around + -3.14159265; _ < i; _ = _ + 6.28318531)
    ;
  return _;
}

Swift::Double __swiftcall handleZero(_:eps:)(Swift::Double _, Swift::Double eps)
{
  if (fabs(_) < eps)
  {
    if (_ <= 0.0) {
      return -eps;
    }
    else {
      return eps;
    }
  }
  return _;
}

uint64_t FloatingPoint.toDegrees()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v13[1] = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](v5);
  double v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v13 - v9;
  swift_getAssociatedConformanceWitness();
  sub_25436D800();
  sub_25436D7A0();
  sub_25436CF70();
  uint64_t v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v7, a1);
  sub_25436CB30();
  sub_25436CB20();
  v11(v7, a1);
  return ((uint64_t (*)(char *, uint64_t))v11)(v10, a1);
}

uint64_t FloatingPoint.isEqual(to:precision:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v13 - v8;
  sub_25436D520();
  sub_25436D820();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v6, a3);
  char v11 = sub_25436CB80();
  v10(v9, a3);
  return v11 & 1;
}

Swift::Double __swiftcall wrapAngle(_:minValue:maxValue:)(Swift::Double _, Swift::Double minValue, Swift::Double maxValue)
{
  for (; _ > maxValue; _ = _ + -6.28318531)
    ;
  for (; _ < minValue; _ = _ + 6.28318531)
    ;
  return _;
}

Swift::Int __swiftcall clamp(value:minValue:maxValue:)(Swift::Int value, Swift::Int minValue, Swift::Int maxValue)
{
  if (value <= minValue) {
    Swift::Int v3 = minValue;
  }
  else {
    Swift::Int v3 = value;
  }
  if (v3 >= maxValue) {
    return maxValue;
  }
  else {
    return v3;
  }
}

uint64_t DKMotion3.init(time:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_25436C7B0();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, a1, v4);
  uint64_t v6 = (int *)type metadata accessor for DKMotion3();
  *(void *)(a2 + v6[5]) = &unk_2703B1E78;
  *(void *)(a2 + v6[6]) = &unk_2703B1EB0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  *(void *)(a2 + v6[7]) = &unk_2703B1EE8;
  return result;
}

uint64_t type metadata accessor for DKMotion3()
{
  uint64_t result = qword_269DDA280;
  if (!qword_269DDA280) {
    return swift_getSingletonMetadata();
  }
  return result;
}

int *DKMotion3.init(time:position:velocity:acceleration:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7 = *a2;
  uint64_t v8 = *a3;
  uint64_t v9 = *a4;
  uint64_t v10 = sub_25436C7B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(a5, a1, v10);
  uint64_t result = (int *)type metadata accessor for DKMotion3();
  *(void *)(a5 + result[5]) = v7;
  *(void *)(a5 + result[6]) = v8;
  *(void *)(a5 + result[7]) = v9;
  return result;
}

uint64_t DKMotion3.time.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25436C7B0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t DKMotion3.time.setter(uint64_t a1)
{
  uint64_t v3 = sub_25436C7B0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t (*DKMotion3.time.modify())()
{
  return nullsub_1;
}

uint64_t DKMotion3.position.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + *(int *)(type metadata accessor for DKMotion3() + 20));
  return swift_bridgeObjectRetain();
}

uint64_t DKMotion3.position.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(int *)(type metadata accessor for DKMotion3() + 20);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = v2;
  return result;
}

uint64_t (*DKMotion3.position.modify())(void)
{
  return nullsub_1;
}

uint64_t DKMotion3.velocity.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + *(int *)(type metadata accessor for DKMotion3() + 24));
  return swift_bridgeObjectRetain();
}

uint64_t DKMotion3.velocity.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(int *)(type metadata accessor for DKMotion3() + 24);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = v2;
  return result;
}

uint64_t (*DKMotion3.velocity.modify())(void)
{
  return nullsub_1;
}

uint64_t DKMotion3.acceleration.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + *(int *)(type metadata accessor for DKMotion3() + 28));
  return swift_bridgeObjectRetain();
}

uint64_t DKMotion3.acceleration.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(int *)(type metadata accessor for DKMotion3() + 28);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = v2;
  return result;
}

uint64_t (*DKMotion3.acceleration.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_25435EFF8()
{
  uint64_t result = 1701669236;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6E6F697469736F70;
      break;
    case 2:
      uint64_t result = 0x797469636F6C6576;
      break;
    case 3:
      uint64_t result = 0x6172656C65636361;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25435F088@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_254360184(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25435F0B0(uint64_t a1)
{
  unint64_t v2 = sub_25435F87C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25435F0EC(uint64_t a1)
{
  unint64_t v2 = sub_25435F87C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DKMotion3.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DDA268);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25435F87C();
  sub_25436D950();
  LOBYTE(v12) = 0;
  sub_25436C7B0();
  sub_25435F8D0(&qword_269DD8110);
  sub_25436D710();
  if (!v2)
  {
    uint64_t v9 = (int *)type metadata accessor for DKMotion3();
    uint64_t v12 = *(void *)(v3 + v9[5]);
    HIBYTE(v11) = 1;
    sub_2542867C0();
    sub_25436D710();
    uint64_t v12 = *(void *)(v3 + v9[6]);
    HIBYTE(v11) = 2;
    sub_25436D710();
    uint64_t v12 = *(void *)(v3 + v9[7]);
    HIBYTE(v11) = 3;
    sub_25436D710();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t DKMotion3.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v4 = sub_25436C7B0();
  uint64_t v19 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v20 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DDA278);
  uint64_t v18 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (int *)type metadata accessor for DKMotion3();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25435F87C();
  double v22 = v7;
  sub_25436D940();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v16 = a1;
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = v19;
  LOBYTE(v24) = 0;
  sub_25435F8D0(&qword_269DD8220);
  uint64_t v13 = v20;
  uint64_t v14 = v21;
  sub_25436D650();
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v11, v13, v4);
  char v23 = 1;
  sub_254286EF8();
  sub_25436D650();
  *(void *)(v11 + v8[5]) = v24;
  char v23 = 2;
  sub_25436D650();
  *(void *)(v11 + v8[6]) = v24;
  char v23 = 3;
  sub_25436D650();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v22, v14);
  *(void *)(v11 + v8[7]) = v24;
  sub_25434E3B4(v11, v17);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return sub_254291788(v11);
}

uint64_t sub_25435F7B0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DKMotion3.init(from:)(a1, a2);
}

uint64_t sub_25435F7C8(void *a1)
{
  return DKMotion3.encode(to:)(a1);
}

BOOL _s23IntelligentTrackingCore9DKMotion3V2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((sub_25436C780() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = (int *)type metadata accessor for DKMotion3();
  if (!sub_2542ECE84(*(void *)(a1 + v4[5]), *(void *)(a2 + v4[5]))
    || !sub_2542ECE84(*(void *)(a1 + v4[6]), *(void *)(a2 + v4[6])))
  {
    return 0;
  }
  uint64_t v5 = v4[7];
  uint64_t v6 = *(void *)(a1 + v5);
  uint64_t v7 = *(void *)(a2 + v5);
  return sub_2542ECE84(v6, v7);
}

unint64_t sub_25435F87C()
{
  unint64_t result = qword_269DDA270;
  if (!qword_269DDA270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DDA270);
  }
  return result;
}

uint64_t sub_25435F8D0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25436C7B0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for DKMotion3(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25436C7B0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for DKMotion3(uint64_t a1)
{
  uint64_t v2 = sub_25436C7B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DKMotion3(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25436C7B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DKMotion3(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25436C7B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for DKMotion3(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25436C7B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for DKMotion3(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25436C7B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DKMotion3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25435FD4C);
}

uint64_t sub_25435FD4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25436C7B0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for DKMotion3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25435FE20);
}

uint64_t sub_25435FE20(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25436C7B0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_25435FEDC()
{
  uint64_t result = sub_25436C7B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DKMotion3.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x254360044);
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

ValueMetadata *type metadata accessor for DKMotion3.CodingKeys()
{
  return &type metadata for DKMotion3.CodingKeys;
}

unint64_t sub_254360080()
{
  unint64_t result = qword_269DDA290;
  if (!qword_269DDA290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DDA290);
  }
  return result;
}

unint64_t sub_2543600D8()
{
  unint64_t result = qword_269DDA298;
  if (!qword_269DDA298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DDA298);
  }
  return result;
}

unint64_t sub_254360130()
{
  unint64_t result = qword_269DDA2A0;
  if (!qword_269DDA2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DDA2A0);
  }
  return result;
}

uint64_t sub_254360184(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701669236 && a2 == 0xE400000000000000;
  if (v2 || (sub_25436D7B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F697469736F70 && a2 == 0xE800000000000000 || (sub_25436D7B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x797469636F6C6576 && a2 == 0xE800000000000000 || (sub_25436D7B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6172656C65636361 && a2 == 0xEC0000006E6F6974)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_25436D7B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

void DKVector3.x.getter()
{
  if (!*(void *)(*(void *)v0 + 16)) {
    __break(1u);
  }
}

void DKVector3.y.getter()
{
  if (*(void *)(*(void *)v0 + 16) < 2uLL) {
    __break(1u);
  }
}

uint64_t DKVector3.x.setter(double a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    if (*(void *)(v3 + 16))
    {
LABEL_3:
      *(double *)(v3 + 32) = a1;
      *unint64_t v1 = v3;
      return result;
    }
  }
  else
  {
    uint64_t result = (uint64_t)sub_2543631E4((void *)v3);
    uint64_t v3 = result;
    if (*(void *)(result + 16)) {
      goto LABEL_3;
    }
  }
  __break(1u);
  return result;
}

uint64_t DKVector3.y.setter(double a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2543631E4((void *)v3);
    uint64_t v3 = result;
  }
  if (*(void *)(v3 + 16) < 2uLL)
  {
    __break(1u);
  }
  else
  {
    *(double *)(v3 + 40) = a1;
    *unint64_t v1 = v3;
  }
  return result;
}

IntelligentTrackingCore::DKVector3 __swiftcall DKVector3.init()()
{
  *uint64_t v0 = &unk_2703B1CE8;
  return result;
}

uint64_t DKVectorProtocol.l2Norm()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v16[1] = a3;
  swift_getAssociatedTypeWitness();
  v16[0] = swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v6 = swift_checkMetadataState();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v16 - v12;
  v16[7] = (*(uint64_t (**)(uint64_t, uint64_t, double))(a2 + 40))(a1, a2, v11);
  swift_getAssociatedConformanceWitness();
  sub_25436D800();
  sub_25436D7A0();
  v16[4] = a1;
  v16[5] = a2;
  sub_25436CEA0();
  swift_getWitnessTable();
  sub_25436CD40();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v7 + 8);
  v14(v9, v6);
  swift_bridgeObjectRelease();
  sub_25436CB10();
  return ((uint64_t (*)(char *, uint64_t))v14)(v13, v6);
}

void DKVector3.z.getter()
{
  if (*(void *)(*(void *)v0 + 16) < 3uLL) {
    __break(1u);
  }
}

IntelligentTrackingCore::DKVector3 __swiftcall DKVector3.init(x:y:z:)(Swift::Double x, Swift::Double y, Swift::Double z)
{
  uint64_t v7 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DD7818);
  result.elements._rawValue = (void *)swift_allocObject();
  *((_OWORD *)result.elements._rawValue + 1) = xmmword_25436E6A0;
  *((Swift::Double *)result.elements._rawValue + 4) = x;
  *((Swift::Double *)result.elements._rawValue + 5) = y;
  *((Swift::Double *)result.elements._rawValue + 6) = z;
  v7->elements._rawValue = result.elements._rawValue;
  return result;
}

BOOL static DKVector3.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_2542ECE84(*a1, *a2);
}

uint64_t DKVector3.elements.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DKVector3.elements.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v1 = a1;
  return result;
}

uint64_t (*DKVector3.elements.modify())()
{
  return nullsub_1;
}

IntelligentTrackingCore::DKVector3 __swiftcall DKVector3.init(elements:)(IntelligentTrackingCore::DKVector3 elements)
{
  v1->elements._rawValue = elements.elements._rawValue;
  return elements;
}

IntelligentTrackingCore::DKVector3 __swiftcall DKVector3.init(repeating:count:)(Swift::Double repeating, Swift::Int count)
{
  if ((count & 0x8000000000000000) == 0)
  {
    unsigned int v4 = v2;
    if (count)
    {
      result.elements._rawValue = (void *)sub_25436CE40();
      *((void *)result.elements._rawValue + 2) = count;
      uint64_t v6 = (Swift::Double *)((char *)result.elements._rawValue + 32);
      if ((unint64_t)count >= 4)
      {
        unint64_t v7 = count & 0xFFFFFFFFFFFFFFFCLL;
        v6 += count & 0xFFFFFFFFFFFFFFFCLL;
        Swift::Double v8 = repeating;
        int64x2_t v9 = vdupq_lane_s64(*(uint64_t *)&repeating, 0);
        uint64_t v10 = (int64x2_t *)((char *)result.elements._rawValue + 48);
        unint64_t v11 = count & 0xFFFFFFFFFFFFFFFCLL;
        do
        {
          v10[-1] = v9;
          int64x2_t *v10 = v9;
          v10 += 2;
          v11 -= 4;
        }
        while (v11);
        if (v7 == count) {
          goto LABEL_11;
        }
      }
      else
      {
        unint64_t v7 = 0;
        Swift::Double v8 = repeating;
      }
      unint64_t v12 = count - v7;
      do
      {
        *v6++ = v8;
        --v12;
      }
      while (v12);
    }
    else
    {
      result.elements._rawValue = (void *)MEMORY[0x263F8EE78];
    }
LABEL_11:
    v4->elements._rawValue = result.elements._rawValue;
    return result;
  }
  result.elements._rawValue = (void *)sub_25436D4E0();
  __break(1u);
  return result;
}

uint64_t sub_2543608F0(uint64_t *a1, void **a2)
{
  uint64_t v3 = *a1;
  unsigned int v4 = *a2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    if (v4[2])
    {
LABEL_3:
      v4[4] = v3;
      *a2 = v4;
      return result;
    }
  }
  else
  {
    uint64_t result = (uint64_t)sub_2543631E4(v4);
    unsigned int v4 = (void *)result;
    if (*(void *)(result + 16)) {
      goto LABEL_3;
    }
  }
  __break(1u);
  return result;
}

uint64_t (*DKVector3.x.modify(uint64_t (*result)(uint64_t *a1, char a2)))(uint64_t *a1, char a2)
{
  *((void *)result + 1) = v1;
  if (*(void *)(*(void *)v1 + 16))
  {
    *(void *)uint64_t result = *(void *)(*(void *)v1 + 32);
    return sub_254360990;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_254360990(uint64_t *a1, char a2)
{
  uint64_t v3 = (void **)a1[1];
  uint64_t v4 = *a1;
  uint64_t v5 = *v3;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (result)
    {
      if (v5[2])
      {
LABEL_7:
        v5[4] = v4;
        *uint64_t v3 = v5;
        return result;
      }
    }
    else
    {
      uint64_t result = (uint64_t)sub_2543631E4(v5);
      uint64_t v5 = (void *)result;
      if (*(void *)(result + 16)) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  if (result)
  {
    if (v5[2]) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t result = (uint64_t)sub_2543631E4(v5);
    uint64_t v5 = (void *)result;
    if (*(void *)(result + 16)) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_254360A2C(uint64_t *a1, void **a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2543631E4(v4);
    uint64_t v4 = (void *)result;
  }
  if (v4[2] < 2uLL)
  {
    __break(1u);
  }
  else
  {
    v4[5] = v3;
    *a2 = v4;
  }
  return result;
}

uint64_t (*DKVector3.y.modify(uint64_t (*result)(uint64_t *a1, char a2)))(uint64_t *a1, char a2)
{
  *((void *)result + 1) = v1;
  if (*(void *)(*(void *)v1 + 16) < 2uLL)
  {
    __break(1u);
  }
  else
  {
    *(void *)uint64_t result = *(void *)(*(void *)v1 + 40);
    return sub_254360AD0;
  }
  return result;
}

uint64_t sub_254360AD0(uint64_t *a1, char a2)
{
  uint64_t v3 = (void **)a1[1];
  uint64_t v4 = *a1;
  uint64_t v5 = *v3;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_2543631E4(v5);
      uint64_t v5 = (void *)result;
    }
    if (v5[2] >= 2uLL) {
      goto LABEL_9;
    }
    __break(1u);
  }
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2543631E4(v5);
    uint64_t v5 = (void *)result;
  }
  if (v5[2] >= 2uLL)
  {
LABEL_9:
    v5[5] = v4;
    *uint64_t v3 = v5;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_254360B68(uint64_t *a1, void **a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2543631E4(v4);
    uint64_t v4 = (void *)result;
  }
  if (v4[2] < 3uLL)
  {
    __break(1u);
  }
  else
  {
    v4[6] = v3;
    *a2 = v4;
  }
  return result;
}

uint64_t DKVector3.z.setter(double a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2543631E4((void *)v3);
    uint64_t v3 = result;
  }
  if (*(void *)(v3 + 16) < 3uLL)
  {
    __break(1u);
  }
  else
  {
    *(double *)(v3 + 48) = a1;
    *uint64_t v1 = v3;
  }
  return result;
}

uint64_t (*DKVector3.z.modify(uint64_t (*result)(uint64_t *a1, char a2)))(uint64_t *a1, char a2)
{
  *((void *)result + 1) = v1;
  if (*(void *)(*(void *)v1 + 16) < 3uLL)
  {
    __break(1u);
  }
  else
  {
    *(void *)uint64_t result = *(void *)(*(void *)v1 + 48);
    return sub_254360C6C;
  }
  return result;
}

uint64_t sub_254360C6C(uint64_t *a1, char a2)
{
  uint64_t v3 = (void **)a1[1];
  uint64_t v4 = *a1;
  uint64_t v5 = *v3;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_2543631E4(v5);
      uint64_t v5 = (void *)result;
    }
    if (v5[2] >= 3uLL) {
      goto LABEL_9;
    }
    __break(1u);
  }
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2543631E4(v5);
    uint64_t v5 = (void *)result;
  }
  if (v5[2] >= 3uLL)
  {
LABEL_9:
    v5[6] = v4;
    *uint64_t v3 = v5;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_254360D04()
{
  return 0x73746E656D656C65;
}

uint64_t sub_254360D1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x73746E656D656C65 && a2 == 0xE800000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_25436D7B0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_254360DB4(uint64_t a1)
{
  unint64_t v2 = sub_254363214();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_254360DF0(uint64_t a1)
{
  unint64_t v2 = sub_254363214();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DKVector3.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DDA2A8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_254363214();
  sub_25436D950();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DD7A50);
  sub_254292020(&qword_269DD8560);
  sub_25436D710();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t DKVector3.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DDA2B8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  Swift::Double v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_254363214();
  sub_25436D940();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269DD7A50);
    sub_254292020(&qword_269DD8570);
    sub_25436D650();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_25436113C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_254361144(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*sub_254361170())()
{
  return nullsub_1;
}

void sub_254361190(void *a1@<X8>)
{
  *a1 = &unk_2703B3748;
}

unint64_t sub_2543611A0@<X0>(unint64_t result@<X0>, void *a2@<X8>)
{
  if ((result & 0x8000000000000000) != 0 || *(void *)(*(void *)v2 + 16) <= result)
  {
    uint64_t result = sub_25436D4F0();
    __break(1u);
  }
  else
  {
    *a2 = *(void *)(*(void *)v2 + 8 * result + 32);
  }
  return result;
}

uint64_t DKVectorProtocol.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (sub_2543628D8(a1, a2, a3))
  {
    (*(void (**)(uint64_t, uint64_t))(a3 + 40))(a2, a3);
    swift_getAssociatedTypeWitness();
    sub_25436CEB0();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = sub_25436D4F0();
    __break(1u);
  }
  return result;
}

uint64_t sub_254361304(double *a1, unint64_t a2)
{
  return sub_254361310(a2, *a1);
}

uint64_t sub_254361310(unint64_t a1, double a2)
{
  if ((a1 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = *(void **)v2;
    if (*(void *)(*(void *)v2 + 16) > a1)
    {
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_2543631E4(v4);
        uint64_t v4 = (void *)result;
      }
      if (v4[2] > a1)
      {
        *(double *)&v4[a1 + 4] = a2;
        *(void *)uint64_t v2 = v4;
        return result;
      }
      __break(1u);
    }
  }
  uint64_t result = sub_25436D4F0();
  __break(1u);
  return result;
}

uint64_t DKVectorProtocol.subscript.setter(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25436335C(a1, a2, a3, a4);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8);
  return v6(a1, AssociatedTypeWitness);
}

void (*sub_254361460(void *a1, unint64_t a2))(void *)
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2543614C4(v4, a2);
  return sub_2543614C0;
}

uint64_t (*sub_2543614C4(void *a1, unint64_t a2))(uint64_t *a1, char a2)
{
  a1[1] = a2;
  a1[2] = v2;
  if ((a2 & 0x8000000000000000) != 0 || *(void *)(*(void *)v2 + 16) <= a2)
  {
    uint64_t result = (uint64_t (*)(uint64_t *, char))sub_25436D4F0();
    __break(1u);
  }
  else
  {
    *a1 = *(void *)(*(void *)v2 + 8 * a2 + 32);
    return sub_254361560;
  }
  return result;
}

uint64_t sub_254361560(uint64_t *a1, char a2)
{
  unint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  uint64_t v4 = *a1;
  uint64_t v5 = *(void **)v2;
  unint64_t v6 = *(void *)(*(void *)v2 + 16);
  BOOL v7 = v6 > v3;
  if (a2)
  {
    if (v6 <= v3) {
      goto LABEL_14;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_2543631E4(v5);
      uint64_t v5 = (void *)result;
    }
    unint64_t v9 = v5[2];
    BOOL v7 = v9 > v3;
    if (v9 > v3) {
      goto LABEL_12;
    }
    __break(1u);
  }
  if (!v7) {
    goto LABEL_14;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2543631E4(v5);
    uint64_t v5 = (void *)result;
  }
  if (v5[2] > v3)
  {
LABEL_12:
    v5[v3 + 4] = v4;
    *(void *)uint64_t v2 = v5;
    return result;
  }
  __break(1u);
LABEL_14:
  uint64_t result = sub_25436D4F0();
  __break(1u);
  return result;
}

void (*DKVectorProtocol.subscript.modify(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(unint64_t **a1, char a2)
{
  unint64_t v9 = malloc(0x40uLL);
  *a1 = v9;
  void v9[2] = a4;
  v9[3] = v4;
  *unint64_t v9 = a2;
  v9[1] = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9[4] = AssociatedTypeWitness;
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  v9[5] = v11;
  size_t v12 = *(void *)(v11 + 64);
  v9[6] = malloc(v12);
  v9[7] = malloc(v12);
  DKVectorProtocol.subscript.getter(a2, a3, a4);
  return sub_25436175C;
}

void sub_25436175C(unint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = (void *)(*a1)[6];
  uint64_t v4 = (void *)(*a1)[7];
  unint64_t v5 = (*a1)[4];
  unint64_t v6 = (*a1)[5];
  uint64_t v7 = (*a1)[2];
  unint64_t v9 = **a1;
  uint64_t v8 = (*a1)[1];
  if (a2)
  {
    (*(void (**)(unint64_t, void *, unint64_t))(v6 + 16))((*a1)[6], v4, v5);
    sub_25436335C((uint64_t)v3, v9, v8, v7);
    uint64_t v10 = *(void (**)(void *, unint64_t))(v6 + 8);
    v10(v3, v5);
    v10(v4, v5);
  }
  else
  {
    sub_25436335C((*a1)[7], v9, v8, v7);
    (*(void (**)(void *, unint64_t))(v6 + 8))(v4, v5);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t sub_254361864@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return DKVector3.init(from:)(a1, a2);
}

uint64_t sub_25436187C(void *a1)
{
  return DKVector3.encode(to:)(a1);
}

BOOL sub_254361894(uint64_t *a1, uint64_t *a2)
{
  return sub_2542ECE84(*a1, *a2);
}

uint64_t sub_2543618A4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25436335C(a1, a2, a3, a4);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8);
  return v6(a1, AssociatedTypeWitness);
}

void (*sub_254361934(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(void *)
{
  uint64_t v8 = malloc(0x28uLL);
  *a1 = v8;
  v8[4] = DKVectorProtocol.subscript.modify(v8, a2, a3, a4);
  return sub_2543614C0;
}

uint64_t static DKVectorProtocol.* infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2543621D4(a1, a2, a3, a4, (uint64_t)sub_254363594, (void (*)(char *, char *))sub_25436359C);
}

{
  return sub_25436257C(a1, a2, a3, a4, (void (*)(char *, char *))sub_2543636A0);
}

{
  return sub_2543626E0(a1, a2, a3, a4, (void (*)(char *, char *))sub_254363AD0);
}

uint64_t sub_2543619D8()
{
  return sub_25436CF70();
}

uint64_t sub_254361A80(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v43 = a8;
  uint64_t v44 = a5;
  uint64_t v9 = v8;
  uint64_t v58 = a2;
  v59 = a4;
  v57 = a1;
  uint64_t v42 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  v55 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v53 = (char *)&v40 - v13;
  long long v15 = v14;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v54 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  v41 = (char *)&v40 - v17;
  uint64_t v18 = sub_25436D130();
  uint64_t v45 = *(void *)(v18 - 8);
  uint64_t v46 = v18;
  MEMORY[0x270FA5388](v18);
  v51 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  double v22 = (char *)&v40 - v21;
  MEMORY[0x270FA5388](v23);
  v40 = (char *)&v40 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v50 = *((void *)v15 - 1);
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)&v40 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = a6;
  v52 = v15;
  uint64_t v60 = swift_getAssociatedTypeWitness();
  uint64_t v47 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  v30 = (char *)&v40 - v29;
  uint64_t v31 = sub_25436CD30();
  uint64_t v61 = sub_25436CA90();
  uint64_t v56 = sub_25436D3F0();
  sub_25436D390();
  (*(void (**)(char *, uint64_t, void))(v50 + 16))(v28, v48, v52);
  v59 = v30;
  uint64_t result = sub_25436CD20();
  if (v31 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v31)
  {
    v33 = (uint64_t (**)(char *, uint64_t, uint64_t))(v54 + 48);
    v34 = (uint64_t (**)(char *, uint64_t))(v54 + 8);
    swift_getAssociatedConformanceWitness();
    while (1)
    {
      sub_25436D170();
      uint64_t result = (*v33)(v22, 1, AssociatedTypeWitness);
      if (result == 1) {
        goto LABEL_18;
      }
      v57(v22, v55);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v55, v44);
        return (*v34)(v22, AssociatedTypeWitness);
      }
      uint64_t v9 = 0;
      (*v34)(v22, AssociatedTypeWitness);
      sub_25436D3D0();
      if (!--v31)
      {
        uint64_t v35 = v54;
        v36 = v51;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  uint64_t v35 = v54;
  v36 = v51;
LABEL_9:
  sub_25436D170();
  v55 = *(char **)(v35 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v55)(v36, 1, AssociatedTypeWitness) == 1)
  {
    v37 = v51;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v37, v46);
    return v61;
  }
  else
  {
    v52 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
    uint64_t v54 = v35 + 32;
    v38 = (void (**)(char *, uint64_t))(v35 + 8);
    v39 = v41;
    v37 = v51;
    while (1)
    {
      v52(v39, v37, AssociatedTypeWitness);
      v57(v39, v53);
      if (v9) {
        break;
      }
      uint64_t v9 = 0;
      (*v38)(v39, AssociatedTypeWitness);
      sub_25436D3D0();
      sub_25436D170();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v55)(v37, 1, AssociatedTypeWitness) == 1) {
        goto LABEL_14;
      }
    }
    (*v38)(v39, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v53, v44);
  }
}

uint64_t static DKVectorProtocol.+ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2543621D4(a1, a2, a3, a4, (uint64_t)sub_2543635B4, (void (*)(char *, char *))sub_25436359C);
}

uint64_t static DKVectorProtocol.- infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2543621D4(a1, a2, a3, a4, (uint64_t)sub_2543635E4, (void (*)(char *, char *))sub_25436359C);
}

uint64_t sub_2543621D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(char *, char *))
{
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(a4 + 40);
  v10(a3, a4);
  v10(a3, a4);
  uint64_t AssociatedTypeWitness = (char *)swift_getAssociatedTypeWitness();
  uint64_t v12 = sub_25436CEA0();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_25436D830();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v27 = v28;
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = a5;
  v19[5] = &v20;
  uint64_t v23 = v12;
  uint64_t v24 = v12;
  uint64_t v25 = WitnessTable;
  uint64_t v26 = WitnessTable;
  uint64_t v14 = sub_25436D2F0();
  uint64_t v15 = swift_getWitnessTable();
  uint64_t v17 = sub_254361A80(a6, (uint64_t)v19, v14, AssociatedTypeWitness, MEMORY[0x263F8E628], v15, MEMORY[0x263F8E658], v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(a4 + 64))(a3, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 48))(v17, a3, a4);
}

uint64_t sub_2543623D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, void))
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  return a5(a1, a2, AssociatedTypeWitness, *(void *)(*(void *)(*(void *)(AssociatedConformanceWitness + 16) + 8) + 8));
}

uint64_t sub_2543624B4()
{
  return sub_25436CF70();
}

uint64_t static DKVectorProtocol./ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25436257C(a1, a2, a3, a4, (void (*)(char *, char *))sub_2543636C4);
}

{
  return sub_2543626E0(a1, a2, a3, a4, (void (*)(char *, char *))sub_254363AE8);
}

uint64_t sub_25436257C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *))
{
  v15[7] = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 40))(a3, a4);
  id v15[2] = a3;
  v15[3] = a4;
  v15[4] = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = sub_25436CEA0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v13 = sub_254272228(a5, (uint64_t)v15, v10, AssociatedTypeWitness, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v12);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(a4 + 64))(a3, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 48))(v13, a3, a4);
}

uint64_t sub_2543626E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *))
{
  v15[7] = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 40))(a3, a4);
  id v15[2] = a3;
  v15[3] = a4;
  v15[4] = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = sub_25436CEA0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v13 = sub_254272228(a5, (uint64_t)v15, v10, AssociatedTypeWitness, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v12);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(a4 + 64))(a3, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 48))(v13, a3, a4);
}

uint64_t sub_25436282C()
{
  return sub_25436CB20();
}

BOOL sub_2543628D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 - 8);
  double v7 = MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v6 + 16))(v9, v10, a2, v7);
  if (a1 < 0)
  {
    BOOL v14 = 0;
  }
  else
  {
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 40))(a2, a3);
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v13 = MEMORY[0x25A275560](v11, AssociatedTypeWitness);
    swift_bridgeObjectRelease();
    BOOL v14 = v13 > a1;
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, a2);
  return v14;
}

uint64_t DKVectorProtocol.isEqual(_:tolerance:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v57 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v46 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v56 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v55 = (char *)&v42 - v11;
  MEMORY[0x270FA5388](v12);
  uint64_t v54 = (char *)&v42 - v13;
  MEMORY[0x270FA5388](v14);
  v53 = (char *)&v42 - v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v17 = sub_25436D130();
  double v18 = MEMORY[0x270FA5388](v17 - 8);
  char v20 = (char *)&v42 - v19;
  uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 40);
  uint64_t v45 = v4;
  uint64_t v58 = a3;
  uint64_t v59 = a4;
  uint64_t v44 = a4 + 40;
  uint64_t v43 = v21;
  ((void (*)(uint64_t, uint64_t, double))v21)(a3, a4, v18);
  uint64_t v52 = MEMORY[0x25A275560]();
  swift_bridgeObjectRelease();
  uint64_t v23 = a1[3];
  uint64_t v22 = a1[4];
  uint64_t v50 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v23);
  uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v22 + 40);
  v24(v23, v22);
  v51 = &associated type descriptor for DKVectorProtocol.DataType;
  swift_getAssociatedTypeWitness();
  uint64_t v47 = (void (**)(char *, char *, uint64_t))__swift_instantiateConcreteTypeFromMangledName(&qword_269DDA2C0);
  uint64_t v25 = sub_25436D450();
  swift_bridgeObjectRelease();
  uint64_t v26 = *(void *)(v25 + 16);
  swift_bridgeObjectRelease();
  if (v52 != v26) {
    return 0;
  }
  __swift_project_boxed_opaque_existential_1(v50, v50[3]);
  v24(v23, v22);
  long long v27 = &protocol requirements base descriptor for DKVectorProtocol;
  swift_getAssociatedTypeWitness();
  sub_25436D450();
  swift_bridgeObjectRelease();
  uint64_t v28 = sub_25436D590();
  swift_bridgeObjectRelease();
  if (!v28) {
    return 0;
  }
  uint64_t v60 = v43(v58, v59);
  *(void *)&long long v64 = v28;
  uint64_t v29 = sub_25436CEA0();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_25436D830();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v64 = v65;
  uint64_t v60 = v29;
  uint64_t v61 = v29;
  uint64_t v52 = v29;
  uint64_t v62 = WitnessTable;
  uint64_t v63 = WitnessTable;
  v51 = (void *)WitnessTable;
  sub_25436D2F0();
  sub_25436D2C0();
  uint64_t v50 = (void *)(TupleTypeMetadata2 - 8);
  uint64_t v47 = (void (**)(char *, char *, uint64_t))(v46 + 32);
  uint64_t v31 = (void (**)(char *, uint64_t))(v46 + 8);
  uint64_t v49 = TupleTypeMetadata2;
  uint64_t v48 = v20;
  v32 = v53;
  v33 = v56;
  while (1)
  {
    uint64_t v60 = v52;
    uint64_t v61 = v52;
    uint64_t v62 = (uint64_t)v51;
    uint64_t v63 = (uint64_t)v51;
    sub_25436D2E0();
    sub_25436D2D0();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 48))(v20, 1, TupleTypeMetadata2) == 1)break; {
    v34 = &v20[*(int *)(TupleTypeMetadata2 + 48)];
    }
    uint64_t v35 = *v47;
    (*v47)(v32, v20, AssociatedTypeWitness);
    v36 = v54;
    v35(v54, v34, AssociatedTypeWitness);
    swift_getAssociatedConformanceWitness();
    v37 = v27;
    v38 = v55;
    sub_25436D520();
    sub_25436CF80();
    v39 = *v31;
    (*v31)(v38, AssociatedTypeWitness);
    LOBYTE(v34) = sub_25436CB70();
    v39(v33, AssociatedTypeWitness);
    v40 = v36;
    char v20 = v48;
    v39(v40, AssociatedTypeWitness);
    v39(v32, AssociatedTypeWitness);
    long long v27 = v37;
    TupleTypeMetadata2 = v49;
    if (v34)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_254363038()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v1 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v3 = (char *)&v5 - v2;
  swift_getAssociatedConformanceWitness();
  sub_25436CF70();
  sub_25436D510();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, AssociatedTypeWitness);
}

uint64_t sub_254363190(unint64_t a1, uint64_t a2)
{
  uint64_t result = _swift_isClassOrObjCExistentialType();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v5 = a2 & 0xFFFFFFFFFFFFFF8;
  if ((result & 1) == 0) {
    uint64_t v5 = a2;
  }
  if (*(void *)(v5 + 16) <= a1) {
    goto LABEL_7;
  }
  return result;
}

void *sub_2543631E4(void *a1)
{
  return sub_2542585F4(0, a1[2], 0, a1);
}

uint64_t sub_2543631F8()
{
  return sub_254363038();
}

unint64_t sub_254363214()
{
  unint64_t result = qword_269DDA2B0;
  if (!qword_269DDA2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DDA2B0);
  }
  return result;
}

char *sub_254363268(uint64_t a1)
{
  return sub_254258814(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_25436327C(void *a1)
{
  return sub_25425932C(0, a1[2], 0, a1);
}

void *sub_254363290(void *a1)
{
  return sub_2542596A8(0, a1[2], 0, a1);
}

void *sub_2543632A4(void *a1)
{
  return sub_2542598BC(0, a1[2], 0, a1);
}

void *sub_2543632B8(void *a1)
{
  return sub_2542599E4(0, a1[2], 0, a1);
}

void sub_2543632CC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_25436D530();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x25A275A10);
}

uint64_t sub_254363348(unint64_t a1)
{
  return sub_254259D50(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_25436335C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *(void *)(a3 - 8);
  double v11 = MEMORY[0x270FA5388](a1);
  uint64_t v13 = &v23[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, double))(v10 + 16))(v13, v5, v11);
  BOOL v14 = sub_2543628D8(a2, a3, a4);
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v13, a3);
  if (v14)
  {
    uint64_t v15 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(a4 + 56))(v23, a3, a4);
    uint64_t v17 = v16;
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    sub_25436CEA0();
    sub_25436CE20();
    uint64_t v19 = *v17;
    sub_254363190(a2, v19);
    char isClassOrObjCExistentialType = _swift_isClassOrObjCExistentialType();
    uint64_t v21 = v19 & 0xFFFFFFFFFFFFFF8;
    if ((isClassOrObjCExistentialType & 1) == 0) {
      uint64_t v21 = v19;
    }
    (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 24))(v21+ ((*(unsigned __int8 *)(*(void *)(AssociatedTypeWitness - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(AssociatedTypeWitness - 8) + 80))+ *(void *)(*(void *)(AssociatedTypeWitness - 8) + 72) * a2, a1, AssociatedTypeWitness);
    return v15(v23, 0);
  }
  else
  {
    uint64_t result = sub_25436D4F0();
    __break(1u);
  }
  return result;
}

uint64_t sub_254363594()
{
  return sub_2543619D8();
}

uint64_t sub_25436359C(uint64_t a1)
{
  return sub_254363614(a1);
}

uint64_t sub_2543635B4(uint64_t a1, uint64_t a2)
{
  return sub_2543623D0(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), MEMORY[0x263F8DF20]);
}

uint64_t sub_2543635E4(uint64_t a1, uint64_t a2)
{
  return sub_2543623D0(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), MEMORY[0x263F8DF28]);
}

uint64_t sub_254363614(uint64_t a1)
{
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 32);
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return v3(a1, a1 + *(int *)(TupleTypeMetadata2 + 48));
}

uint64_t sub_2543636A0()
{
  return sub_2543624B4();
}

uint64_t sub_2543636C4()
{
  return sub_25436282C();
}

unint64_t sub_2543636EC()
{
  unint64_t result = qword_269DDA2C8;
  if (!qword_269DDA2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DDA2C8);
  }
  return result;
}

unint64_t sub_254363740(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_254286EF8();
  unint64_t result = sub_2542867C0();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_254363770@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (*(void *)(*(void *)result + 16)) {
    *a2 = *(void *)(*(void *)result + 32);
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_254363790@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (*(void *)(*(void *)result + 16) <= 1uLL) {
    __break(1u);
  }
  else {
    *a2 = *(void *)(*(void *)result + 40);
  }
  return result;
}

uint64_t sub_2543637B4@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (*(void *)(*(void *)result + 16) <= 2uLL) {
    __break(1u);
  }
  else {
    *a2 = *(void *)(*(void *)result + 48);
  }
  return result;
}

uint64_t sub_2543637D8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return DKVectorProtocol.subscript.getter(*a2, *(uint64_t *)((char *)a2 + a3 - 16), *(uint64_t *)((char *)a2 + a3 - 8));
}

uint64_t sub_25436380C(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t a4)
{
  return sub_25436335C(a1, *a3, *(unint64_t *)((char *)a3 + a4 - 16), *(unint64_t *)((char *)a3 + a4 - 8));
}

uint64_t sub_254363840()
{
  return 16;
}

__n128 sub_25436384C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

ValueMetadata *type metadata accessor for DKVector3()
{
  return &type metadata for DKVector3;
}

uint64_t dispatch thunk of DKVectorProtocol.elements.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of DKVectorProtocol.elements.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of DKVectorProtocol.elements.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of DKVectorProtocol.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of DKVectorProtocol.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of DKVectorProtocol.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

uint64_t dispatch thunk of DKVectorProtocol.subscript.modify(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 88))();
}

unsigned char *storeEnumTagSinglePayload for DKVector3.CodingKeys(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x254363990);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DKVector3.CodingKeys()
{
  return &type metadata for DKVector3.CodingKeys;
}

unint64_t sub_2543639CC()
{
  unint64_t result = qword_269DDA2D0;
  if (!qword_269DDA2D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DDA2D0);
  }
  return result;
}

unint64_t sub_254363A24()
{
  unint64_t result = qword_269DDA2D8;
  if (!qword_269DDA2D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DDA2D8);
  }
  return result;
}

unint64_t sub_254363A7C()
{
  unint64_t result = qword_269DDA2E0;
  if (!qword_269DDA2E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DDA2E0);
  }
  return result;
}

uint64_t sub_254363AD0()
{
  return sub_2543636A0();
}

uint64_t sub_254363AE8()
{
  return sub_2543636C4();
}

void *static DKConstantVelocityFilter.Index.allCases.getter()
{
  return &unk_2703B3780;
}

uint64_t DKConstantVelocityFilter.Index.rawValue.getter()
{
  return *v0;
}

uint64_t DKConstantVelocityFilter.Measurement.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC23IntelligentTrackingCore14DKKalmanFilter11Measurement_time;
  uint64_t v2 = sub_25436C7B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DKConstantVelocityFilter.Measurement.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC23IntelligentTrackingCore14DKKalmanFilter11Measurement_time;
  uint64_t v2 = sub_25436C7B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

IntelligentTrackingCore::DKConstantVelocityFilter::Index_optional __swiftcall DKConstantVelocityFilter.Index.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  *uint64_t v1 = v2;
  return (IntelligentTrackingCore::DKConstantVelocityFilter::Index_optional)rawValue;
}

void *sub_254363CB4@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void sub_254363CD4(void *a1@<X8>)
{
  *a1 = &unk_2703B37A8;
}

uint64_t DKConstantVelocityFilter.Configuration.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DKConstantVelocityFilter.Configuration.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t DKConstantVelocityFilter.__allocating_init(configuration:)(uint64_t a1)
{
  *(void *)(swift_allocObject() + OBJC_IVAR____TtC23IntelligentTrackingCore24DKConstantVelocityFilter_cvConfiguration) = a1;
  uint64_t v1 = swift_retain();
  sub_254353F8C(v1, 2);
  uint64_t v3 = v2;
  swift_release();
  return v3;
}

uint64_t DKConstantVelocityFilter.init(configuration:)(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC23IntelligentTrackingCore24DKConstantVelocityFilter_cvConfiguration) = a1;
  uint64_t v2 = swift_retain();
  sub_254353F8C(v2, 2);
  uint64_t v4 = v3;
  swift_release();
  return v4;
}

uint64_t sub_254363DF4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25436C7B0();
  uint64_t v5 = *(void *)(v4 - 8);
  double v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v5 + 16))(v8, v2 + OBJC_IVAR____TtC23IntelligentTrackingCore14DKKalmanFilter_lastPredictionTime, v4, v6);
  sub_25436C700();
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  double v11 = *(void **)(v2 + OBJC_IVAR____TtC23IntelligentTrackingCore14DKKalmanFilter_F);
  uint64_t v12 = v11[2];
  if (v12 < 1 || (uint64_t)v11[3] <= 1)
  {
    uint64_t result = sub_25436D4F0();
    __break(1u);
  }
  else
  {
    *(void *)(v11[4] + 8 * v12) = v10;
    return sub_25434F220(a1);
  }
  return result;
}

void DKConstantVelocityFilter.__allocating_init(configuration:stateSize:)()
{
}

void DKConstantVelocityFilter.init(configuration:stateSize:)()
{
}

uint64_t sub_254363FDC()
{
  return swift_release();
}

uint64_t DKConstantVelocityFilter.deinit()
{
  uint64_t v0 = DKKalmanFilter.deinit();
  swift_release();
  return v0;
}

uint64_t DKConstantVelocityFilter.__deallocating_deinit()
{
  DKKalmanFilter.deinit();
  swift_release();
  return swift_deallocClassInstance();
}

unint64_t sub_25436409C()
{
  unint64_t result = qword_269DDA2E8;
  if (!qword_269DDA2E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DDA2E8);
  }
  return result;
}

unint64_t sub_2543640F4()
{
  unint64_t result = qword_269DDA2F0;
  if (!qword_269DDA2F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DDA2F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DDA2F0);
  }
  return result;
}

uint64_t sub_254364150()
{
  return type metadata accessor for DKConstantVelocityFilter(0);
}

uint64_t type metadata accessor for DKConstantVelocityFilter(uint64_t a1)
{
  return sub_254252A6C(a1, (uint64_t *)&unk_269DDA300);
}

uint64_t method lookup function for DKConstantVelocityFilter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DKConstantVelocityFilter);
}

uint64_t dispatch thunk of DKConstantVelocityFilter.__allocating_init(configuration:)()
{
  return (*(uint64_t (**)(void))(v0 + 512))();
}

uint64_t dispatch thunk of DKConstantVelocityFilter.updateQ(row:column:value:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t dispatch thunk of DKConstantVelocityFilter.getState(index:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 528))();
}

uint64_t dispatch thunk of DKConstantVelocityFilter.setState(index:value:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 536))();
}

uint64_t sub_254364228()
{
  return type metadata accessor for DKConstantVelocityFilter.Measurement(0);
}

uint64_t type metadata accessor for DKConstantVelocityFilter.Measurement(uint64_t a1)
{
  return sub_254252A6C(a1, (uint64_t *)&unk_269DDA310);
}

uint64_t method lookup function for DKConstantVelocityFilter.Measurement(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DKConstantVelocityFilter.Measurement);
}

unsigned char *storeEnumTagSinglePayload for DKConstantVelocityFilter.Index(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x254364334);
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

ValueMetadata *type metadata accessor for DKConstantVelocityFilter.Index()
{
  return &type metadata for DKConstantVelocityFilter.Index;
}

uint64_t type metadata accessor for DKConstantVelocityFilter.Configuration()
{
  return self;
}

uint64_t method lookup function for DKConstantVelocityFilter.Configuration(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DKConstantVelocityFilter.Configuration);
}

uint64_t type metadata accessor for DKConfig()
{
  return self;
}

void sub_2543643CC()
{
  uint64_t v1 = v0;
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v47 = sub_25436C610();
  uint64_t v2 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  unsigned int v4 = (char *)v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v38 - v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v38 - v9;
  *(_OWORD *)(v1 + 216) = 0u;
  *(void *)(v1 + 16) = 0;
  *(_OWORD *)(v1 + 48) = 0u;
  *(void *)(v1 + 384) = 0;
  *(void *)(v1 + 24) = 0;
  *(void *)(v1 + 32) = 0;
  *(_DWORD *)(v1 + 40) = 0;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(_OWORD *)(v1 + 96) = 0u;
  *(_OWORD *)(v1 + 112) = 0u;
  *(_OWORD *)(v1 + 128) = 0u;
  *(_OWORD *)(v1 + 144) = 0u;
  *(_OWORD *)(v1 + 160) = 0u;
  *(_OWORD *)(v1 + 176) = 0u;
  *(_OWORD *)(v1 + 192) = 0u;
  *(_DWORD *)(v1 + 208) = 0;
  *(_OWORD *)(v1 + 232) = 0u;
  *(_OWORD *)(v1 + 248) = 0u;
  *(_OWORD *)(v1 + 264) = 0u;
  *(_OWORD *)(v1 + 280) = 0u;
  *(_OWORD *)(v1 + 296) = 0u;
  *(_OWORD *)(v1 + 312) = 0u;
  *(_OWORD *)(v1 + 328) = 0u;
  *(_OWORD *)(v1 + 344) = 0u;
  *(_OWORD *)(v1 + 360) = 0u;
  *(_DWORD *)(v1 + 376) = 0;
  uint64_t context = espresso_create_context();
  if (!context)
  {
    swift_release();
    sub_254261A48();
    swift_allocError();
    *(void *)uint64_t v22 = 0xD000000000000018;
    *(void *)(v22 + 8) = 0x800000025437F2B0;
    *(unsigned char *)(v22 + 16) = 0;
    swift_willThrow();
    return;
  }
  v41 = (void *)(v1 + 16);
  uint64_t v42 = v1 + 48;
  uint64_t v45 = v1;
  uint64_t v46 = v10;
  uint64_t v40 = context;
  uint64_t plan = espresso_create_plan();
  uint64_t v48 = 0;
  int v49 = 0;
  uint64_t v12 = (void *)sub_25436CBD0();
  id v13 = objc_msgSend(self, sel_bundleWithIdentifier_, v12);

  if (v13)
  {
    id v14 = objc_msgSend(v13, sel_bundleURL);
    uint64_t v15 = v46;
    sub_25436C5F0();

    sub_25436C5D0();
    sub_25436C5D0();
    uint64_t v16 = *(void (**)(char *, uint64_t))(v2 + 8);
    uint64_t v17 = v7;
    uint64_t v18 = v47;
    v16(v4, v47);
    sub_25436C5E0();
    sub_25436C600();
    id v43 = v13;
    v16(v4, v18);
    sub_25436CC70();
    swift_bridgeObjectRelease();
    uint64_t v19 = plan;
    int v20 = espresso_plan_add_network();
    swift_release();
    if (v20)
    {
      swift_release();
      sub_254261A48();
      swift_allocError();
      *(void *)uint64_t v21 = 0xD000000000000016;
      *(void *)(v21 + 8) = 0x800000025437F2F0;
      *(unsigned char *)(v21 + 16) = 0;
      swift_willThrow();

      v16(v17, v18);
      v16(v15, v18);
      return;
    }
    v39 = v16;
    uint64_t v23 = v17;
    if (espresso_plan_build())
    {
      swift_release();
      sub_254261A48();
      swift_allocError();
      *(void *)uint64_t v24 = 0xD000000000000014;
      *(void *)(v24 + 8) = 0x800000025437F310;
      *(unsigned char *)(v24 + 16) = 0;
      swift_willThrow();

      uint64_t v25 = v39;
      v39(v17, v18);
      v25(v46, v18);
      return;
    }
    if (espresso_network_bind_buffer())
    {
      swift_release();
      sub_254261A48();
      swift_allocError();
      unint64_t v27 = 0x800000025437F330;
      *(void *)uint64_t v26 = 0xD000000000000014;
LABEL_10:
      *(void *)(v26 + 8) = v27;
      *(unsigned char *)(v26 + 16) = 0;
      swift_willThrow();

      uint64_t v28 = v47;
      uint64_t v29 = v39;
      v39(v17, v47);
      v29(v46, v28);
      return;
    }
    *(void *)(v45 + 384) = 1572864;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269DDA320);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 32) = xmmword_2543793F0;
    v38[1] = inited + 32;
    *(_OWORD *)(inited + 16) = xmmword_25436E6A0;
    *(_OWORD *)(inited + 48) = xmmword_254379400;
    *(void *)(inited + 64) = 0;
    *(void *)(inited + 72) = 0;
    uint64_t v42 = sub_25436CC70();
    int v31 = espresso_network_bind_buffer();
    swift_release();
    if (v31)
    {
      uint64_t v42 = sub_25436CC70();
      int v32 = espresso_network_bind_buffer();
      swift_release();
      if (v32)
      {
        if (espresso_network_bind_buffer())
        {
          swift_release();
          swift_setDeallocating();
          __swift_instantiateConcreteTypeFromMangledName(&qword_269DDA328);
          swift_arrayDestroy();
          sub_254261A48();
          swift_allocError();
          unint64_t v27 = 0x800000025437F370;
          *(void *)uint64_t v26 = 0xD000000000000015;
          goto LABEL_10;
        }
      }
    }
    swift_release();
    uint64_t v33 = v45;
    if (*(void *)(v45 + 24)) {
      espresso_plan_destroy();
    }
    v34 = v46;
    uint64_t v35 = v47;
    if (*v41) {
      espresso_context_destroy();
    }

    v36 = v39;
    v39(v23, v35);
    v36(v34, v35);
    *(void *)(v33 + 16) = v40;
    *(void *)(v33 + 24) = v19;
    int v37 = v49;
    *(void *)(v33 + 32) = v48;
    *(_DWORD *)(v33 + 40) = v37;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_254364B94()
{
  espresso_plan_destroy();
  espresso_context_destroy();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DKSpeechDetectionModel()
{
  return self;
}

unint64_t sub_254364BF8(unint64_t result)
{
  unint64_t v2 = v1[6];
  if (!v2) {
    goto LABEL_97;
  }
  unint64_t v3 = result;
  if (result >> 62) {
    goto LABEL_88;
  }
  uint64_t v4 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
  unint64_t result = swift_bridgeObjectRetain();
  if (v4) {
    goto LABEL_4;
  }
  while (1)
  {
LABEL_51:
    swift_bridgeObjectRelease();
    unint64_t result = espresso_plan_execute_sync();
    if (result)
    {
      int v40 = result;
      sub_25436D290();
      swift_bridgeObjectRelease();
      int v58 = v40;
      type metadata accessor for espresso_return_status_t(0);
      sub_25436CC60();
      sub_25436CCB0();
      swift_bridgeObjectRelease();
      sub_254261A48();
      swift_allocError();
      *(void *)uint64_t v41 = 0xD000000000000020;
      *(void *)(v41 + 8) = 0x800000025437F280;
      *(unsigned char *)(v41 + 16) = 0;
      return swift_willThrow();
    }
    uint64_t v42 = v1[38];
    if ((unsigned __int128)((uint64_t)v1[37] * (__int128)v42) >> 64 != (v1[37] * v42) >> 63)
    {
LABEL_91:
      __break(1u);
LABEL_92:
      __break(1u);
      goto LABEL_93;
    }
    uint64_t v43 = v1[27];
    if (!v43) {
      goto LABEL_98;
    }
    if (v42 < 0) {
      goto LABEL_92;
    }
    if (!v42) {
      break;
    }
    uint64_t v44 = 0;
    unint64_t v3 = MEMORY[0x263F8EE78];
    uint64_t v57 = v1[38];
    while (v44 != v42)
    {
      uint64_t v45 = v1[37];
      if (v45 < 0) {
        goto LABEL_87;
      }
      if (v45)
      {
        uint64_t v46 = sub_2542585F4(0, 1, 1, MEMORY[0x263F8EE78]);
        uint64_t v47 = 0;
        while (1)
        {
          uint64_t v48 = v1[37];
          uint64_t v49 = v44 * v48;
          if ((unsigned __int128)(v44 * (__int128)v48) >> 64 != (v44 * v48) >> 63) {
            break;
          }
          BOOL v50 = __OFADD__(v49, v47);
          uint64_t v51 = v49 + v47;
          if (v50) {
            goto LABEL_81;
          }
          float v52 = *(float *)(v43 + 4 * v51);
          unint64_t v2 = v46[2];
          unint64_t v53 = v46[3];
          if (v2 >= v53 >> 1) {
            uint64_t v46 = sub_2542585F4((void *)(v53 > 1), v2 + 1, 1, v46);
          }
          ++v47;
          v46[2] = v2 + 1;
          *(double *)&v46[v2 + 4] = v52;
          if (v45 == v47) {
            goto LABEL_69;
          }
        }
        __break(1u);
LABEL_81:
        __break(1u);
        goto LABEL_82;
      }
      uint64_t v46 = (void *)MEMORY[0x263F8EE78];
LABEL_69:
      unint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        unint64_t result = (unint64_t)sub_254259578(0, *(void *)(v3 + 16) + 1, 1, (void *)v3);
        unint64_t v3 = result;
      }
      uint64_t v42 = v57;
      unint64_t v2 = *(void *)(v3 + 16);
      unint64_t v54 = *(void *)(v3 + 24);
      if (v2 >= v54 >> 1)
      {
        unint64_t result = (unint64_t)sub_254259578((void *)(v54 > 1), v2 + 1, 1, (void *)v3);
        unint64_t v3 = result;
      }
      ++v44;
      *(void *)(v3 + 16) = v2 + 1;
      *(void *)(v3 + 8 * v2 + 32) = v46;
      if (v44 == v57) {
        goto LABEL_76;
      }
    }
    while (1)
    {
      __break(1u);
LABEL_87:
      __break(1u);
LABEL_88:
      swift_bridgeObjectRetain();
      unint64_t result = sub_25436D530();
      uint64_t v4 = result;
      if (!result) {
        break;
      }
LABEL_4:
      if (v4 < 1)
      {
        __break(1u);
        goto LABEL_91;
      }
      if ((v3 & 0xC000000000000001) != 0)
      {
        uint64_t v5 = 0;
        uint64_t v6 = (char *)(v2 + 0x20000);
        uint64_t v7 = 0x8000;
        unint64_t v2 = 65568;
        while (1)
        {
          uint64_t v8 = MEMORY[0x25A275A00](v5, v3);
          uint64_t v9 = v6 - 0x20000;
          uint64_t v10 = *(void *)(v8 + OBJC_IVAR____TtC23IntelligentTrackingCore23DKImageRGBBufferStamped_redBuffer);
          double v11 = (char *)(v10 + 32);
          unint64_t v12 = v10 + 65568;
          if (v6 - 0x20000 != v11 || (unint64_t)v9 >= v12) {
            memmove(v9, v11, 0x10000uLL);
          }
          id v14 = v6 - 0x10000;
          uint64_t v15 = *(void *)(v8 + OBJC_IVAR____TtC23IntelligentTrackingCore23DKImageRGBBufferStamped_greenBuffer);
          uint64_t v16 = (char *)(v15 + 32);
          unint64_t v17 = v15 + 65568;
          if (v6 - 0x10000 != v16 || (unint64_t)v14 >= v17) {
            memmove(v14, v16, 0x10000uLL);
          }
          if (v5 == 0xAAAAAAAAAAAALL) {
            break;
          }
          uint64_t v19 = *(void *)(v8 + OBJC_IVAR____TtC23IntelligentTrackingCore23DKImageRGBBufferStamped_blueBuffer);
          int v20 = (char *)(v19 + 32);
          unint64_t v21 = v19 + 65568;
          if (v6 != v20 || (unint64_t)v6 >= v21) {
            memmove(v6, v20, 0x10000uLL);
          }
          swift_unknownObjectRelease();
          if (__OFADD__(v7, 0x4000)) {
            goto LABEL_83;
          }
          ++v5;
          v6 += 196608;
          v7 += 49152;
          if (v4 == v5) {
            goto LABEL_51;
          }
        }
LABEL_82:
        __break(1u);
LABEL_83:
        __break(1u);
      }
      else
      {
        uint64_t v23 = 0;
        uint64_t v24 = (char *)(v2 + 0x20000);
        unint64_t v2 = 0x8000;
        while (1)
        {
          uint64_t v25 = *(void *)(v3 + 32 + 8 * v23);
          uint64_t v26 = v24 - 0x20000;
          uint64_t v27 = *(void *)(v25 + OBJC_IVAR____TtC23IntelligentTrackingCore23DKImageRGBBufferStamped_redBuffer);
          uint64_t v28 = (char *)(v27 + 32);
          unint64_t v29 = v27 + 65568;
          if (v24 - 0x20000 != v28 || (unint64_t)v26 >= v29) {
            memmove(v26, v28, 0x10000uLL);
          }
          swift_retain();
          int v31 = v24 - 0x10000;
          uint64_t v32 = *(void *)(v25 + OBJC_IVAR____TtC23IntelligentTrackingCore23DKImageRGBBufferStamped_greenBuffer);
          uint64_t v33 = (char *)(v32 + 32);
          unint64_t v34 = v32 + 65568;
          if (v24 - 0x10000 != v33 || (unint64_t)v31 >= v34) {
            memmove(v31, v33, 0x10000uLL);
          }
          if (v23 == 0xAAAAAAAAAAAALL) {
            break;
          }
          uint64_t v36 = *(void *)(v25 + OBJC_IVAR____TtC23IntelligentTrackingCore23DKImageRGBBufferStamped_blueBuffer);
          int v37 = (char *)(v36 + 32);
          unint64_t v38 = v36 + 65568;
          if (v24 != v37 || (unint64_t)v24 >= v38) {
            memmove(v24, v37, 0x10000uLL);
          }
          swift_release();
          if (__OFADD__(v2, 0x4000)) {
            goto LABEL_85;
          }
          ++v23;
          v24 += 196608;
          v2 += 49152;
          if (v4 == v23) {
            goto LABEL_51;
          }
        }
      }
      __break(1u);
LABEL_85:
      __break(1u);
    }
  }
  unint64_t v3 = MEMORY[0x263F8EE78];
  if (!*(void *)(MEMORY[0x263F8EE78] + 16))
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
LABEL_76:
  unint64_t v55 = *(void *)(*(void *)(v3 + 32) + 16);
  if (v55 < 2)
  {
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  if (v55 < 4)
  {
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  if (v55 != 4)
  {
    LOBYTE(v58) = 5;
    sub_25436D290();
    sub_25436CCB0();
    sub_25436CF50();
    sub_25436CCB0();
    sub_25436CF50();
    os_log_type_t v56 = sub_25436D000();
    _s23IntelligentTrackingCore5DKLogC3log8category7message5levelyAC8CategoryO_SSSo03os_E7_type_tatFZ_0(&v58, 0, 0xE000000000000000, v56);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
LABEL_96:
  __break(1u);
LABEL_97:
  __break(1u);
LABEL_98:
  __break(1u);
  return result;
}

uint64_t DKBodyTrackerConfiguration.__allocating_init()()
{
  return DKTrackerConfiguration.init()();
}

uint64_t DKBodyTracker.__allocating_init(time:configuration:uuid:trackerId:anstId:camera:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v25 = a6;
  uint64_t v26 = a2;
  uint64_t v27 = a4;
  uint64_t v28 = a5;
  uint64_t v24 = a1;
  uint64_t v8 = type metadata accessor for DKCamera();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25436C800();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_25436C7B0();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, v15);
  uint64_t v19 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a3, v11);
  uint64_t v20 = v25;
  sub_25428CF24(v25, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for DKCamera);
  uint64_t v21 = sub_2543654C0((uint64_t)v18, v26, (uint64_t)v14, v27, v28, (uint64_t)v10);
  sub_25428CA3C(v20, (uint64_t (*)(void))type metadata accessor for DKCamera);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a3, v19);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v24, v15);
  return v21;
}

uint64_t sub_2543654C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v40 = a1;
  uint64_t v13 = type metadata accessor for DKCamera();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v37 = (uint64_t)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_25436C7B0();
  uint64_t v38 = *(void *)(v15 - 8);
  uint64_t v39 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v36 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = (void *)(v6 + qword_269DDAA00);
  *uint64_t v17 = -1;
  v17[1] = 0;
  *(void *)(v6 + qword_269DDAA08) = -1;
  sub_25436C9E0();
  uint64_t v18 = qword_269DDAA18;
  type metadata accessor for DKBoundingBoxFilter();
  swift_allocObject();
  *(void *)(v6 + v18) = DKBoundingBoxFilter.init(alpha:)(0.9);
  sub_25436C6E0();
  *(unsigned char *)(v6 + qword_269DDAA30) = 0;
  uint64_t v19 = MEMORY[0x263F8EE78];
  *(void *)(v7 + qword_269DDAA38) = MEMORY[0x263F8EE78];
  *(void *)(v7 + *(void *)(*(void *)v7 + 200)) = 0;
  *(void *)(v7 + *(void *)(*(void *)v7 + 216)) = 0;
  uint64_t v20 = v7 + *(void *)(*(void *)v7 + 232);
  uint64_t v21 = type metadata accessor for DKPersonGroupFilter.Track(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v20, 1, 1, v21);
  *(unsigned char *)(v7 + *(void *)(*(void *)v7 + 240)) = 0;
  *(void *)(v7 + qword_269DDAA20) = a2;
  *(void *)(v7 + qword_269DDA9F8) = a4;
  uint64_t v22 = v7 + qword_269DDA9F0;
  uint64_t v23 = sub_25436C800();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = a3;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v22, a3, v23);
  *(void *)(v7 + qword_269DDAA08) = a5;
  uint64_t v26 = a6;
  sub_25428CF24(a6, v7 + *(void *)(*(void *)v7 + 224), (uint64_t (*)(void))type metadata accessor for DKCamera);
  double v27 = *(double *)(a2 + 16);
  double v28 = *(double *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(qword_269DD8770);
  swift_allocObject();
  swift_retain();
  *(void *)(v7 + *(void *)(*(void *)v7 + 208)) = sub_2542A7C48(v19, v27, v28);
  if (*(unsigned char *)(a2 + 136) == 1)
  {
    uint64_t v29 = v38;
    v30 = *(void (**)(char *, uint64_t, uint64_t))(v38 + 16);
    uint64_t v31 = (uint64_t)v36;
    uint64_t v35 = v25;
    v30(v36, v40, v39);
    uint64_t v32 = v37;
    sub_25428CF24(v26, v37, (uint64_t (*)(void))type metadata accessor for DKCamera);
    type metadata accessor for DKSphericalMotionFilter(0);
    swift_allocObject();
    uint64_t v33 = sub_254320A24(v31, (void *)a2, v32);
    swift_release();
    sub_25428CA3C(v26, (uint64_t (*)(void))type metadata accessor for DKCamera);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v35, v23);
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v40, v39);
    *(void *)(v7 + *(void *)(*(void *)v7 + 216)) = v33;
    swift_release();
  }
  else
  {
    swift_release();
    sub_25428CA3C(a6, (uint64_t (*)(void))type metadata accessor for DKCamera);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(a3, v23);
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v40, v39);
  }
  return v7;
}

uint64_t DKBodyTrackerConfiguration.__allocating_init(configuration:)(uint64_t a1)
{
  swift_allocObject();
  uint64_t v2 = sub_2542A88E8(a1);
  swift_release();
  return v2;
}

uint64_t DKBodyTrackerConfiguration.init(configuration:)(uint64_t a1)
{
  uint64_t v1 = sub_2542A88E8(a1);
  swift_release();
  return v1;
}

uint64_t DKBodyTrackerConfiguration.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t DKBodyTrackerConfiguration.__deallocating_deinit()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_254365ACC(uint64_t a1)
{
  uint64_t v92 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DD8040);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v91 = (uint64_t)&v80 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25436C800();
  uint64_t v93 = *(void *)(v4 - 8);
  uint64_t v94 = v4;
  MEMORY[0x270FA5388](v4);
  v95 = (char *)&v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_25436C7B0();
  uint64_t v89 = *(void *)(v90 - 8);
  MEMORY[0x270FA5388](v90);
  v96 = (char *)&v80 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v80 - v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v80 - v11;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v80 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DD7810);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v80 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v80 - v20;
  uint64_t v22 = type metadata accessor for DKMotion3();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v80 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = v1;
  sub_25435C720((uint64_t)v98);
  sub_2542721C0((uint64_t)v98, (uint64_t)v99);
  uint64_t v27 = 0;
  if (v100) {
    return v27;
  }
  v83 = v21;
  v80 = v12;
  v82 = v15;
  uint64_t v87 = v23;
  uint64_t v88 = v22;
  uint64_t v28 = v90;
  v84 = v25;
  v85 = v18;
  v86 = v9;
  double v29 = *(double *)v99;
  double v30 = *(double *)&v99[1];
  double v31 = *(double *)&v99[2];
  double v32 = *(double *)&v99[3];
  uint64_t v33 = *(void *)(v26 + *(void *)(*(void *)v26 + 216));
  uint64_t v34 = v92;
  if (!v33) {
    goto LABEL_5;
  }
  swift_retain();
  swift_retain();
  sub_254251374(v34);
  swift_release();
  swift_retain();
  sub_254251374(v34);
  swift_release();
  swift_retain();
  sub_254251374(v34);
  swift_release();
  sub_25431FE58(v34);
  uint64_t v35 = *(void *)(v33 + OBJC_IVAR____TtC23IntelligentTrackingCore23DKSphericalMotionFilter_lastState);
  swift_retain();
  swift_release();
  if (v35)
  {
    uint64_t v36 = (uint64_t)v83;
    sub_25428CF24(v35 + OBJC_IVAR____TtCC23IntelligentTrackingCore23DKSphericalMotionFilter5State_motion, (uint64_t)v83, (uint64_t (*)(void))type metadata accessor for DKMotion3);
    uint64_t v37 = v36;
    swift_release();
    uint64_t v38 = v87;
    uint64_t v39 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v87 + 56);
    uint64_t v40 = v37;
    uint64_t v41 = 0;
  }
  else
  {
LABEL_5:
    uint64_t v38 = v87;
    uint64_t v39 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v87 + 56);
    uint64_t v37 = (uint64_t)v83;
    uint64_t v40 = (uint64_t)v83;
    uint64_t v41 = 1;
  }
  uint64_t v42 = v88;
  v81 = v39;
  v39(v40, v41, 1, v88);
  uint64_t v43 = v28;
  uint64_t v44 = v89;
  uint64_t v45 = v82;
  uint64_t v46 = *(void (**)(char *, uint64_t, uint64_t))(v89 + 16);
  v46(v82, v34, v43);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48))(v37, 1, v42) == 1)
  {
    uint64_t v47 = v80;
    v46(v80, (uint64_t)v45, v43);
    uint64_t v90 = v26;
    uint64_t v48 = (uint64_t)v84;
    v46(v84, (uint64_t)v47, v43);
    *(void *)(v48 + *(int *)(v42 + 20)) = &unk_2703B1E78;
    *(void *)(v48 + *(int *)(v42 + 24)) = &unk_2703B1EB0;
    uint64_t v49 = v45;
    uint64_t v50 = v42;
    uint64_t v51 = *(void (**)(char *, uint64_t))(v44 + 8);
    v51(v47, v43);
    *(void *)(v48 + *(int *)(v50 + 28)) = &unk_2703B1EE8;
    v51(v49, v43);
    uint64_t v52 = v48;
    uint64_t v26 = v90;
    sub_25425042C((uint64_t)v83, &qword_269DD7810);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v43);
    uint64_t v52 = (uint64_t)v84;
    sub_254291724(v37, (uint64_t)v84);
  }
  uint64_t v53 = v94;
  uint64_t v54 = (uint64_t)v95;
  uint64_t v55 = v93;
  v46(v86, v34, v43);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 16))(v54, v26 + qword_269DDA9F0, v53);
  uint64_t v56 = *(void *)(v26 + qword_269DDAA00 + 8);
  v97[0] = *(void *)(v26 + qword_269DDAA00);
  v97[1] = v56;
  v95 = *(char **)(v26 + qword_269DDAA08);
  uint64_t v57 = *(void *)(v26 + qword_269DDA9F8);
  uint64_t v58 = v91;
  sub_2542A8A14(v26 + *(void *)(*(void *)v26 + 232), v91);
  uint64_t v59 = type metadata accessor for DKPersonGroupFilter.Track(0);
  int v60 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 48))(v58, 1, v59);
  uint64_t v61 = (uint64_t)v96;
  uint64_t v62 = (void (*)(uint64_t, uint64_t, uint64_t))v46;
  if (v60)
  {
    uint64_t v63 = v58;
    uint64_t v64 = v26;
    sub_25425042C(v63, &qword_269DD8040);
    long long v65 = v81;
  }
  else
  {
    uint64_t v66 = v58;
    uint64_t v64 = v26;
    uint64_t v67 = *(void *)v66;
    int v68 = *(unsigned __int8 *)(v66 + 8);
    sub_25425042C(v66, &qword_269DD8040);
    BOOL v69 = v68 == 1;
    uint64_t v61 = (uint64_t)v96;
    long long v65 = v81;
    if (!v69) {
      goto LABEL_14;
    }
  }
  uint64_t v67 = -1;
LABEL_14:
  uint64_t v70 = v52;
  uint64_t v71 = (uint64_t)v85;
  sub_25428CF24(v70, (uint64_t)v85, (uint64_t (*)(void))type metadata accessor for DKMotion3);
  v65(v71, 0, 1, v88);
  v62(v61, v64 + qword_269DDAA28, v43);
  uint64_t v72 = *(void *)(v64 + qword_269DDAA38);
  uint64_t v73 = *(void *)(v72 + 16);
  if (v73)
  {
    uint64_t v74 = *(void *)(v72 + 8 * v73 + 24);
    swift_retain();
  }
  else
  {
    uint64_t v74 = 0;
  }
  uint64_t v75 = (uint64_t)v86;
  uint64_t v76 = (uint64_t)v85;
  uint64_t v77 = (uint64_t)v84;
  uint64_t v78 = (uint64_t)v95;
  type metadata accessor for DKBodyTrackerState(0);
  swift_allocObject();
  uint64_t v27 = DKBodyTrackerState.init(time:uuid:rect:identity:anstId:trackerId:groupId:motion:lastUpdated:framesSinceLastUpdate:lastObservation:)(v75, v54, v97, v78, v57, v67, v76, v61, v29, v30, v31, v32, 0, v74);
  sub_25428CA3C(v77, (uint64_t (*)(void))type metadata accessor for DKMotion3);
  return v27;
}

uint64_t DKBodyTracker.init(time:configuration:uuid:trackerId:anstId:camera:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v27 = a5;
  uint64_t v25 = a2;
  uint64_t v26 = a4;
  uint64_t v24 = a1;
  uint64_t v9 = type metadata accessor for DKCamera();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25436C800();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25436C7B0();
  uint64_t v17 = *(void *)(v16 - 8);
  double v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v23 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v17 + 16))(v20, a1, v16, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a3, v12);
  sub_25428CF24(a6, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DKCamera);
  uint64_t v21 = sub_2543654C0((uint64_t)v20, v25, (uint64_t)v15, v26, v27, (uint64_t)v11);
  sub_25428CA3C(a6, (uint64_t (*)(void))type metadata accessor for DKCamera);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a3, v12);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v24, v16);
  return v21;
}

uint64_t DKBodyTracker.__deallocating_deinit()
{
  _s23IntelligentTrackingCore13DKBodyTrackerCfd_0();
  return swift_deallocClassInstance();
}

uint64_t sub_254366638@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_254365ACC(a1);
  *a2 = result;
  return result;
}

uint64_t type metadata accessor for DKBodyTrackerConfiguration()
{
  return self;
}

uint64_t type metadata accessor for DKBodyTracker()
{
  uint64_t result = qword_269DDA330;
  if (!qword_269DDA330) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2543666D0()
{
  v1[12] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DD7808);
  v1[13] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for DKCamera();
  v1[14] = v2;
  v1[15] = *(void *)(v2 - 8);
  v1[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2543667C0, 0, 0);
}

uint64_t sub_2543667C0()
{
  uint64_t v43 = v0;
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v1 + 48);
  unint64_t v3 = *(void *)(v2 + OBJC_IVAR____TtC23IntelligentTrackingCore26DKIntelligentTrackingState_selectedSubjects);
  if (!v3) {
    goto LABEL_4;
  }
  uint64_t v4 = *(void *)(v0 + 112);
  uint64_t v5 = *(void *)(v0 + 120);
  uint64_t v6 = *(void *)(v0 + 104);
  sub_2542503C8(v2 + OBJC_IVAR____TtC23IntelligentTrackingCore26DKIntelligentTrackingState_camera, v6, &qword_269DD7808);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4) == 1)
  {
    sub_25425042C(*(void *)(v0 + 104), &qword_269DD7808);
LABEL_4:
    uint64_t v7 = 0;
    goto LABEL_5;
  }
  uint64_t v10 = *(void *)(v0 + 128);
  uint64_t v11 = *(void *)(v0 + 96);
  sub_2542502F0(*(void *)(v0 + 104), v10);
  uint64_t v12 = *(void *)(*(void *)(v11 + 40)
                  + OBJC_IVAR____TtC23IntelligentTrackingCore34DKIntelligentTrackingInternalState_framingEngine);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_25432DF2C(v2);
  swift_release();
  uint64_t v13 = *(void *)(v1 + 48);
  *(unsigned char *)(v13 + OBJC_IVAR____TtC23IntelligentTrackingCore26DKIntelligentTrackingState_framingMode) = *(unsigned char *)(v12 + 41);
  *(unsigned char *)(v13 + OBJC_IVAR____TtC23IntelligentTrackingCore26DKIntelligentTrackingState_verticalFraming) = *(unsigned char *)(v12 + 43);
  *(unsigned char *)(v13 + OBJC_IVAR____TtC23IntelligentTrackingCore26DKIntelligentTrackingState_horizontalFraming) = *(unsigned char *)(v12 + 42);
  *(unsigned char *)(*(void *)(v11 + 40)
           + OBJC_IVAR____TtC23IntelligentTrackingCore34DKIntelligentTrackingInternalState_lastHorizontalFraming) = *(unsigned char *)(v12 + 42);
  double v14 = *(double *)(v12 + 48);
  double v15 = *(double *)(v12 + 56) - v14;
  double v16 = *(double *)(v12 + 64);
  double v17 = *(double *)(v12 + 72) - v16;
  uint64_t v18 = v13 + OBJC_IVAR____TtC23IntelligentTrackingCore26DKIntelligentTrackingState_deadband2D;
  *(double *)uint64_t v18 = v14;
  *(double *)(v18 + 8) = v16;
  *(double *)(v18 + 16) = v15;
  *(double *)(v18 + 24) = v17;
  *(unsigned char *)(v18 + 32) = 0;
  double v19 = *(double *)(v10 + 8);
  LOBYTE(v41) = *(unsigned char *)v10;
  double v20 = sub_25432FD48((unsigned __int8 *)&v41, v19);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  char v40 = 3;
  uint64_t v41 = 0;
  unint64_t v42 = 0xE000000000000000;
  sub_25436D290();
  unint64_t v27 = v42;
  *(void *)(v0 + 80) = v41;
  *(void *)(v0 + 88) = v27;
  uint64_t result = sub_25436CCB0();
  uint64_t v28 = *(void *)(v1 + 48) + OBJC_IVAR____TtC23IntelligentTrackingCore26DKIntelligentTrackingState_deadband2D;
  if (*(unsigned char *)(v28 + 32))
  {
    __break(1u);
    return result;
  }
  uint64_t v39 = *(void *)(v0 + 128);
  long long v29 = *(_OWORD *)(v28 + 16);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)v28;
  *(_OWORD *)(v0 + 32) = v29;
  type metadata accessor for CGRect(0);
  sub_25436D460();
  sub_25436CCB0();
  *(double *)(v0 + 48) = v20;
  *(double *)(v0 + 56) = v22;
  *(double *)(v0 + 64) = v24;
  *(double *)(v0 + 72) = v26;
  sub_25436D460();
  uint64_t v30 = *(void *)(v0 + 80);
  unint64_t v31 = *(void *)(v0 + 88);
  os_log_type_t v32 = sub_25436D000();
  _s23IntelligentTrackingCore5DKLogC3log8category7message5levelyAC8CategoryO_SSSo03os_E7_type_tatFZ_0(&v40, v30, v31, v32);
  swift_bridgeObjectRelease();
  double v33 = COERCE_DOUBLE(sub_254366BE4(v3));
  double v35 = v34;
  char v37 = v36;
  swift_bridgeObjectRelease();
  swift_release();
  sub_254250354(v39);
  uint64_t v38 = *(void *)(v1 + 48) + OBJC_IVAR____TtC23IntelligentTrackingCore26DKIntelligentTrackingState_deadband3D;
  if (v37)
  {
    *(_OWORD *)uint64_t v38 = 0u;
    *(_OWORD *)(v38 + 16) = 0u;
    uint64_t v7 = 1;
    *(unsigned char *)(v38 + 32) = 1;
  }
  else
  {
    *(double *)uint64_t v38 = v20 + v33 - v24 * 0.5;
    *(double *)(v38 + 8) = v22 + v35 - v26 * 0.5;
    *(double *)(v38 + 16) = v24;
    *(double *)(v38 + 24) = v26;
    *(unsigned char *)(v38 + 32) = 0;
    uint64_t v7 = 1;
  }
LABEL_5:
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v8(v7);
}

uint64_t sub_254366B90()
{
  return type metadata accessor for DKFramingTask();
}

uint64_t type metadata accessor for DKFramingTask()
{
  uint64_t result = qword_269DDA340;
  if (!qword_269DDA340) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unsigned int (*sub_254366BE4(unint64_t a1))(void, void, void)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DD7810);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  MEMORY[0x270FA5388](v6);
  uint64_t v45 = (char *)&v40 - v7;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (uint64_t *)((char *)&v40 - v10);
  uint64_t v12 = (unsigned int (*)(void, void, void))(a1 >> 62);
  if (a1 >> 62) {
    goto LABEL_61;
  }
  int64_t v13 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v13 < 1)
  {
LABEL_62:
    *(double *)&uint64_t result = 0.0;
    return result;
  }
LABEL_3:
  uint64_t v43 = (char *)v9;
  uint64_t v44 = v12;
  uint64_t v41 = v4;
  uint64_t v49 = MEMORY[0x263F8EE78];
  sub_2542E27D8(0, v13, 0);
  double v14 = 0;
  int64_t v47 = a1;
  unint64_t v48 = a1 & 0xC000000000000001;
  uint64_t v4 = (char *)v13;
  uint64_t v46 = v13;
  do
  {
    if (v48)
    {
      uint64_t v15 = MEMORY[0x25A275A00](v14, v47);
    }
    else
    {
      uint64_t v15 = *(void *)(v47 + 8 * (void)v14 + 32);
      swift_retain();
    }
    sub_2542503C8(v15 + OBJC_IVAR____TtC23IntelligentTrackingCore20DKPersonTrackerState_motion, (uint64_t)v11, &qword_269DD7810);
    uint64_t v16 = type metadata accessor for DKMotion3();
    uint64_t v12 = *(unsigned int (**)(void, void, void))(*(void *)(v16 - 8) + 48);
    uint64_t v17 = 0;
    if (!v12(v11, 1, v16))
    {
      uint64_t v18 = *(uint64_t *)((char *)v11 + *(int *)(v16 + 20));
      if (!*(void *)(v18 + 16))
      {
        __break(1u);
LABEL_56:
        __break(1u);
LABEL_57:
        __break(1u);
LABEL_58:
        __break(1u);
LABEL_59:
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        uint64_t v39 = v9;
        swift_bridgeObjectRetain();
        int64_t v13 = sub_25436D530();
        swift_bridgeObjectRelease();
        uint64_t v9 = v39;
        if (v13 < 1) {
          goto LABEL_62;
        }
        goto LABEL_3;
      }
      uint64_t v17 = *(void *)(v18 + 32);
    }
    sub_25425042C((uint64_t)v11, &qword_269DD7810);
    swift_release();
    uint64_t v19 = v49;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2542E27D8(0, *(void *)(v19 + 16) + 1, 1);
      uint64_t v4 = (char *)v46;
      uint64_t v19 = v49;
    }
    a1 = *(void *)(v19 + 16);
    unint64_t v20 = *(void *)(v19 + 24);
    if (a1 >= v20 >> 1)
    {
      sub_2542E27D8(v20 > 1, a1 + 1, 1);
      uint64_t v4 = (char *)v46;
      uint64_t v19 = v49;
    }
    ++v14;
    *(void *)(v19 + 16) = a1 + 1;
    *(void *)(v19 + 8 * a1 + 32) = v17;
  }
  while (v4 != v14);
  if (!a1)
  {
    uint64_t v21 = 0;
    double v23 = 0.0;
    double v25 = v44;
    uint64_t v4 = v45;
LABEL_21:
    uint64_t v26 = a1 - v21 + 1;
    unint64_t v27 = (double *)(v19 + 8 * v21 + 32);
    do
    {
      double v28 = *v27++;
      double v23 = v23 + v28;
      --v26;
    }
    while (v26);
    goto LABEL_23;
  }
  uint64_t v21 = (a1 + 1) & 0x7FFFFFFFFFFFFFFELL;
  double v22 = (double *)(v19 + 40);
  double v23 = 0.0;
  uint64_t v24 = v21;
  double v25 = v44;
  uint64_t v4 = v45;
  do
  {
    double v23 = v23 + *(v22 - 1) + *v22;
    v22 += 2;
    v24 -= 2;
  }
  while (v24);
  if (a1 + 1 != v21) {
    goto LABEL_21;
  }
LABEL_23:
  swift_bridgeObjectRelease();
  if (!v25)
  {
    int64_t v29 = v47;
    uint64_t v30 = *(unsigned int (**)(void, void, void))((v47 & 0xFFFFFFFFFFFFFF8) + 0x10);
    *(double *)&uint64_t result = COERCE_DOUBLE(swift_bridgeObjectRetain());
    uint64_t v44 = v30;
    if (v30) {
      goto LABEL_25;
    }
LABEL_50:
    swift_bridgeObjectRelease();
LABEL_54:
    *(double *)&uint64_t result = v23 / (double)v46;
    return result;
  }
  int64_t v29 = v47;
  swift_bridgeObjectRetain();
  *(double *)&uint64_t result = COERCE_DOUBLE(sub_25436D530());
  uint64_t v44 = result;
  if (*(double *)&result == 0.0) {
    goto LABEL_50;
  }
LABEL_25:
  if (v48)
  {
    uint64_t v11 = (uint64_t *)MEMORY[0x25A275A00](0, v29);
    goto LABEL_28;
  }
  if (*(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v11 = *(uint64_t **)(v29 + 32);
    swift_retain();
LABEL_28:
    if (v44 != (unsigned int (*)(void, void, void))1)
    {
      uint64_t v42 = v29 & 0xFFFFFFFFFFFFFF8;
      uint64_t v32 = 1;
      do
      {
        int64_t v47 = (int64_t)v11;
        unint64_t v33 = v32;
        while (1)
        {
          if (v48)
          {
            uint64_t v11 = (uint64_t *)MEMORY[0x25A275A00](v33, v29);
            uint64_t v32 = v33 + 1;
            if (__OFADD__(v33, 1)) {
              goto LABEL_56;
            }
          }
          else
          {
            if ((v33 & 0x8000000000000000) != 0) {
              goto LABEL_57;
            }
            if (v33 >= *(void *)(v42 + 16)) {
              goto LABEL_58;
            }
            uint64_t v11 = *(uint64_t **)(v29 + 8 * v33 + 32);
            swift_retain();
            uint64_t v32 = v33 + 1;
            if (__OFADD__(v33, 1)) {
              goto LABEL_56;
            }
          }
          a1 = (unint64_t)&OBJC_IVAR____TtC23IntelligentTrackingCore20DKPersonTrackerState_motion;
          sub_2542503C8((uint64_t)v11 + OBJC_IVAR____TtC23IntelligentTrackingCore20DKPersonTrackerState_motion, (uint64_t)v4, &qword_269DD7810);
          double v34 = 0.0;
          double v35 = 0.0;
          if (!v12(v4, 1, v16))
          {
            uint64_t v36 = *(void *)&v4[*(int *)(v16 + 20)];
            if (*(void *)(v36 + 16) < 2uLL) {
              goto LABEL_59;
            }
            double v35 = *(double *)(v36 + 40);
          }
          sub_25425042C((uint64_t)v4, &qword_269DD7810);
          uint64_t v4 = v43;
          sub_2542503C8(v47 + OBJC_IVAR____TtC23IntelligentTrackingCore20DKPersonTrackerState_motion, (uint64_t)v43, &qword_269DD7810);
          if (!v12(v4, 1, v16))
          {
            uint64_t v37 = *(void *)&v4[*(int *)(v16 + 20)];
            if (*(void *)(v37 + 16) < 2uLL) {
              goto LABEL_60;
            }
            double v34 = *(double *)(v37 + 40);
          }
          sub_25425042C((uint64_t)v4, &qword_269DD7810);
          if (v35 < v34) {
            break;
          }
          swift_release();
          ++v33;
          uint64_t v4 = v45;
          if ((unsigned int (*)(void, void, void))v32 == v44)
          {
            uint64_t v11 = (uint64_t *)v47;
            goto LABEL_51;
          }
        }
        swift_release();
        uint64_t v4 = v45;
      }
      while ((unsigned int (*)(void, void, void))v32 != v44);
    }
LABEL_51:
    swift_bridgeObjectRelease();
    uint64_t v38 = (uint64_t)v41;
    sub_2542503C8((uint64_t)v11 + OBJC_IVAR____TtC23IntelligentTrackingCore20DKPersonTrackerState_motion, (uint64_t)v41, &qword_269DD7810);
    swift_release();
    *(double *)&uint64_t result = COERCE_DOUBLE(((uint64_t (*)(uint64_t, uint64_t, uint64_t))v12)(v38, 1, v16));
    if (result || *(void *)(*(void *)(v38 + *(int *)(v16 + 20)) + 16) >= 2uLL)
    {
      sub_25425042C(v38, &qword_269DD7810);
      goto LABEL_54;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_254367204(double *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DD7A40);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v8 = *a1;
  uint64_t v7 = *((void *)a1 + 1);
  double v9 = a1[2];
  uint64_t v10 = *((void *)a1 + 3);
  uint64_t v11 = *((void *)a1 + 4);
  uint64_t v12 = *((void *)a1 + 5);
  sub_25436C6E0();
  sub_25436C6E0();
  uint64_t v13 = OBJC_IVAR____TtC23IntelligentTrackingCore19DKAdaptiveFramerate_lock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DD84D0);
  uint64_t v14 = swift_allocObject();
  *(_DWORD *)(v14 + 16) = 0;
  *(void *)(v2 + v13) = v14;
  uint64_t v15 = OBJC_IVAR____TtC23IntelligentTrackingCore19DKAdaptiveFramerate_statsFilter;
  type metadata accessor for DKStatisticsFilter();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 32) = 0;
  *(unsigned char *)(v16 + 40) = 1;
  uint64_t v17 = MEMORY[0x263F8EE78];
  *(void *)(v16 + 48) = MEMORY[0x263F8EE78];
  *(void *)(v16 + 56) = v17;
  *(void *)(v16 + 16) = 30;
  *(unsigned char *)(v16 + 24) = 0;
  *(void *)(v2 + v15) = v16;
  uint64_t v18 = v2 + OBJC_IVAR____TtC23IntelligentTrackingCore19DKAdaptiveFramerate_lastThermalStateStamped;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(qword_269DDA3A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  *(double *)(v2 + 16) = v8;
  *(void *)(v2 + 24) = v7;
  *(double *)(v2 + 32) = v9;
  *(void *)(v2 + 40) = v10;
  *(void *)(v2 + 48) = v11;
  *(void *)(v2 + 56) = v12;
  *(void *)(v2 + 64) = v7;
  *(unsigned char *)(v2 + 72) = 0;
  sub_25436C6E0();
  uint64_t v20 = sub_25436C7B0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v6, 0, 1, v20);
  type metadata accessor for DKSmoothingFilter();
  swift_allocObject();
  *(void *)(v2 + 80) = sub_25435D778(COERCE__INT64(1.0 / (double)v7), 0, v10, 0, 0, (uint64_t)v6, 0, 1, v9, 0, 1);
  return v2;
}

void sub_254367448(double a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DD7A40);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25436C7B0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v46 - v12;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v46 - v15;
  uint64_t v17 = OBJC_IVAR____TtC23IntelligentTrackingCore19DKAdaptiveFramerate_lock;
  uint64_t v18 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR____TtC23IntelligentTrackingCore19DKAdaptiveFramerate_lock);
  swift_retain();
  os_unfair_lock_lock(v18 + 4);
  swift_release();
  sub_25436C790();
  swift_retain();
  sub_254257CD0(a1);
  swift_release();
  uint64_t v19 = sub_254258294();
  if ((v20 & 1) == 0)
  {
    double v21 = *(double *)&v19;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    swift_retain();
    sub_25435D340(0, 1, (uint64_t)v6, v21);
    swift_release();
    sub_25425042C((uint64_t)v6, &qword_269DD7A40);
  }
  uint64_t v22 = *(void *)(v2 + 80);
  if ((*(unsigned char *)(v22 + 33) & 1) == 0)
  {
    uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
LABEL_36:
    uint64_t v44 = v2 + OBJC_IVAR____TtC23IntelligentTrackingCore19DKAdaptiveFramerate_lastProcessTime;
    v24(v2 + OBJC_IVAR____TtC23IntelligentTrackingCore19DKAdaptiveFramerate_lastProcessTime, v7);
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v44, v16, v7);
    uint64_t v45 = *(os_unfair_lock_s **)(v2 + v17);
    swift_retain();
    os_unfair_lock_unlock(v45 + 4);
    swift_release();
    v24((uint64_t)v16, v7);
    return;
  }
  if (*(unsigned char *)(v22 + 32) == 1) {
    double v23 = atan2(*(long double *)(v22 + 48), *(long double *)(v22 + 56));
  }
  else {
    double v23 = *(double *)(v22 + 40);
  }
  if (fabs(v23) < 0.00001) {
    double v23 = dbl_254376420[v23 > 0.0];
  }
  double v25 = 1.0 / v23;
  if ((~*(void *)&v25 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v25 <= -9.22337204e18)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  if (v25 >= 9.22337204e18)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  uint64_t v26 = *(void *)(v2 + 16);
  BOOL v27 = __OFSUB__(v26, 2);
  uint64_t v28 = v26 - 2;
  if (v27)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v49 = v17;
  if (v28 <= (uint64_t)v25) {
    uint64_t v28 = (uint64_t)v25;
  }
  if (*(void *)(v2 + 24) >= v28) {
    uint64_t v29 = v28;
  }
  else {
    uint64_t v29 = *(void *)(v2 + 24);
  }
  uint64_t v30 = *(void *)(v2 + 64);
  if (!__OFSUB__(v30, v29))
  {
    if (v30 != v29)
    {
      char v53 = 13;
      unint64_t v51 = 0;
      unint64_t v52 = 0xE000000000000000;
      sub_25436D290();
      swift_bridgeObjectRelease();
      unint64_t v51 = 0xD000000000000018;
      unint64_t v52 = 0x800000025437F4F0;
      uint64_t v50 = *(void *)(v2 + 64);
      sub_25436D760();
      sub_25436CCB0();
      swift_bridgeObjectRelease();
      sub_25436CCB0();
      uint64_t v50 = v29;
      sub_25436D760();
      sub_25436CCB0();
      swift_bridgeObjectRelease();
      uint64_t v31 = v51;
      unint64_t v32 = v52;
      os_log_type_t v33 = sub_25436D020();
      _s23IntelligentTrackingCore5DKLogC3log8category7message5levelyAC8CategoryO_SSSo03os_E7_type_tatFZ_0(&v53, v31, v32, v33);
      swift_bridgeObjectRelease();
      *(void *)(v2 + 64) = v29;
    }
    if (*(unsigned char *)(v2 + 72))
    {
      if (*(unsigned char *)(v2 + 72) != 1) {
        goto LABEL_30;
      }
    }
    else
    {
      if (v29 < *(void *)(v2 + 16) || sub_254367B5C())
      {
        *(unsigned char *)(v2 + 72) = 1;
        uint64_t v35 = v2 + OBJC_IVAR____TtC23IntelligentTrackingCore19DKAdaptiveFramerate_lastModeSwitchTime;
        uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
        v24(v2 + OBJC_IVAR____TtC23IntelligentTrackingCore19DKAdaptiveFramerate_lastModeSwitchTime, v7);
        (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v35, v16, v7);
        LOBYTE(v51) = 13;
        os_log_type_t v36 = sub_25436D020();
        _s23IntelligentTrackingCore5DKLogC3log8category7message5levelyAC8CategoryO_SSSo03os_E7_type_tatFZ_0(&v51, 0xD00000000000001FLL, 0x800000025437F560, v36);
LABEL_35:
        uint64_t v17 = v49;
        goto LABEL_36;
      }
      if (*(unsigned char *)(v2 + 72) != 1) {
        goto LABEL_30;
      }
    }
    if (*(void *)(v2 + 64) == *(void *)(v2 + 24))
    {
      BOOL v34 = !sub_254367B5C();
      goto LABEL_31;
    }
LABEL_30:
    BOOL v34 = 0;
LABEL_31:
    uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v37(v13, v16, v7);
    if (v34)
    {
      int64_t v47 = (char *)(v2 + OBJC_IVAR____TtC23IntelligentTrackingCore19DKAdaptiveFramerate_lastModeSwitchTime);
      unint64_t v48 = (void (*)(char *, uint64_t, uint64_t))v37;
      ((void (*)(char *))v37)(v10);
      sub_25436C700();
      double v39 = v38;
      uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
      v24((uint64_t)v10, v7);
      v24((uint64_t)v13, v7);
      if (*(double *)(v2 + 48) < v39)
      {
        *(unsigned char *)(v2 + 72) = 0;
        LOBYTE(v50) = 13;
        unint64_t v51 = 0;
        unint64_t v52 = 0xE000000000000000;
        sub_25436D290();
        sub_25436CCB0();
        v48(v10, (uint64_t)v47, v7);
        sub_25436C700();
        v24((uint64_t)v10, v7);
        sub_25436CF50();
        sub_25436CCB0();
        uint64_t v40 = v51;
        unint64_t v41 = v52;
        os_log_type_t v42 = sub_25436D020();
        _s23IntelligentTrackingCore5DKLogC3log8category7message5levelyAC8CategoryO_SSSo03os_E7_type_tatFZ_0(&v50, v40, v41, v42);
        swift_bridgeObjectRelease();
        uint64_t v43 = v47;
        v24((uint64_t)v47, v7);
        v48(v43, (uint64_t)v16, v7);
      }
    }
    else
    {
      uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
      v24((uint64_t)v13, v7);
    }
    goto LABEL_35;
  }
LABEL_41:
  __break(1u);
}

BOOL sub_254367B5C()
{
  uint64_t v43 = sub_25436C7B0();
  uint64_t v1 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v3 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DDA380);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v45 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v39 - v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v39 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(qword_269DDA3A0);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  os_log_type_t v42 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v39 - v16;
  uint64_t v18 = v0 + OBJC_IVAR____TtC23IntelligentTrackingCore19DKAdaptiveFramerate_lastThermalStateStamped;
  sub_2543683F0(v0 + OBJC_IVAR____TtC23IntelligentTrackingCore19DKAdaptiveFramerate_lastThermalStateStamped, (uint64_t)v11);
  uint64_t v44 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v19 = v44(v11, 1, v12);
  uint64_t v46 = v1;
  if (v19 == 1)
  {
    sub_25425042C((uint64_t)v11, &qword_269DDA380);
    uint64_t v20 = *(int *)(v12 + 48);
    sub_25436C790();
    id v21 = objc_msgSend(self, sel_processInfo);
    uint64_t v22 = (uint64_t)v8;
    id v23 = objc_msgSend(v21, sel_thermalState);

    *(void *)(v22 + v20) = v23;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(v22, 0, 1, v12);
    sub_254368458(v22, v18);
    uint64_t v24 = v43;
LABEL_5:
    uint64_t v33 = (uint64_t)v45;
    goto LABEL_7;
  }
  double v39 = v8;
  uint64_t v40 = v0;
  uint64_t v41 = v18;
  uint64_t v25 = *(int *)(v12 + 48);
  uint64_t v26 = v43;
  (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v17, v11, v43);
  *(void *)&v17[v25] = *(void *)&v11[v25];
  sub_25436C790();
  sub_25436C700();
  double v28 = v27;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v26);
  uint64_t v24 = v26;
  if (*(double *)(v40 + 56) < v28)
  {
    uint64_t v29 = *(int *)(v12 + 48);
    uint64_t v30 = (uint64_t)v39;
    sub_25436C790();
    id v31 = objc_msgSend(self, sel_processInfo);
    id v32 = objc_msgSend(v31, sel_thermalState);

    *(void *)(v30 + v29) = v32;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(v30, 0, 1, v12);
    uint64_t v18 = v41;
    sub_254368458(v30, v41);
    sub_25425042C((uint64_t)v17, qword_269DDA3A0);
    goto LABEL_5;
  }
  sub_25425042C((uint64_t)v17, qword_269DDA3A0);
  uint64_t v33 = (uint64_t)v45;
  uint64_t v18 = v41;
LABEL_7:
  sub_2543683F0(v18, v33);
  if (v44((char *)v33, 1, v12) == 1)
  {
    sub_25425042C(v33, &qword_269DDA380);
    return 0;
  }
  else
  {
    uint64_t v35 = *(int *)(v12 + 48);
    uint64_t v36 = (uint64_t)v42;
    (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v42, v33, v24);
    uint64_t v37 = *(void *)(v33 + v35);
    *(void *)(v36 + v35) = v37;
    BOOL v34 = v37 == 3;
    sub_25425042C(v36, qword_269DDA3A0);
  }
  return v34;
}

uint64_t DKAdaptiveFramerate.deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC23IntelligentTrackingCore19DKAdaptiveFramerate_lastModeSwitchTime;
  uint64_t v2 = sub_25436C7B0();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC23IntelligentTrackingCore19DKAdaptiveFramerate_lastProcessTime, v2);
  swift_release();
  swift_release();
  sub_25425042C(v0 + OBJC_IVAR____TtC23IntelligentTrackingCore19DKAdaptiveFramerate_lastThermalStateStamped, &qword_269DDA380);
  return v0;
}

uint64_t DKAdaptiveFramerate.__deallocating_deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC23IntelligentTrackingCore19DKAdaptiveFramerate_lastModeSwitchTime;
  uint64_t v2 = sub_25436C7B0();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC23IntelligentTrackingCore19DKAdaptiveFramerate_lastProcessTime, v2);
  swift_release();
  swift_release();
  sub_25425042C(v0 + OBJC_IVAR____TtC23IntelligentTrackingCore19DKAdaptiveFramerate_lastThermalStateStamped, &qword_269DDA380);
  return swift_deallocClassInstance();
}

uint64_t sub_2543681C4()
{
  return type metadata accessor for DKAdaptiveFramerate();
}

uint64_t type metadata accessor for DKAdaptiveFramerate()
{
  uint64_t result = qword_269DDA388;
  if (!qword_269DDA388) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_254368218()
{
  sub_25436C7B0();
  if (v0 <= 0x3F)
  {
    sub_25436832C();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for DKAdaptiveFramerate(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DKAdaptiveFramerate);
}

void sub_25436832C()
{
  if (!qword_269DDA398)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269DDA3A0);
    unint64_t v0 = sub_25436D130();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269DDA398);
    }
  }
}

uint64_t getEnumTagSinglePayload for DKAdaptiveFramerate.Config(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DKAdaptiveFramerate.Config(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = (a2 - 1);
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

ValueMetadata *type metadata accessor for DKAdaptiveFramerate.Config()
{
  return &type metadata for DKAdaptiveFramerate.Config;
}

uint64_t sub_2543683F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DDA380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_254368458(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DDA380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t DKProbabilityValue.__allocating_init(variable:probability:)(uint64_t a1, double a2)
{
  uint64_t v4 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v4 + 80) - 8) + 32))(v4 + *(void *)(*(void *)v4 + 104), a1);
  *(double *)(v4 + *(void *)(*(void *)v4 + 112)) = a2;
  return v4;
}

uint64_t DKProbabilityDistribution.__allocating_init(variables:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t sub_2543685AC(uint64_t a1)
{
  double v1 = MEMORY[0x270FA5388](a1);
  char v3 = (char *)&v6 - v2;
  (*(void (**)(char *, double))(v4 + 16))((char *)&v6 - v2, v1);
  return sub_2543686C8((uint64_t)v3);
}

uint64_t sub_25436866C@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v1 + 80) - 8) + 16))(a1, v1 + *(void *)(*(void *)v1 + 104));
}

uint64_t sub_2543686C8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v1 + 80) - 8) + 40))(v1 + *(void *)(*(void *)v1 + 104), a1);
}

uint64_t (*sub_254368724())()
{
  return nullsub_1;
}

double sub_254368758()
{
  return *(double *)(v0 + *(void *)(*(void *)v0 + 112));
}

void sub_254368774(double a1)
{
  *(double *)(v1 + *(void *)(*(void *)v1 + 112)) = a1;
}

uint64_t (*sub_254368790())()
{
  return nullsub_1;
}

uint64_t DKProbabilityValue.init(variable:probability:)(uint64_t a1, double a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v2 + 80) - 8) + 32))(v2 + *(void *)(*(void *)v2 + 104), a1);
  *(double *)(v2 + *(void *)(*(void *)v2 + 112)) = a2;
  return v2;
}

BOOL sub_25436885C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_25436886C()
{
  return sub_25436D900();
}

uint64_t sub_254368894(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656C626169726176 && a2 == 0xE800000000000000;
  if (v2 || (sub_25436D7B0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C696261626F7270 && a2 == 0xEB00000000797469)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_25436D7B0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2543689A0()
{
  return sub_25436D930();
}

uint64_t sub_2543689E8(char a1)
{
  if (a1) {
    return 0x6C696261626F7270;
  }
  else {
    return 0x656C626169726176;
  }
}

BOOL sub_254368A28(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_25436885C(*a1, *a2);
}

uint64_t sub_254368A40()
{
  return sub_2543689A0();
}

uint64_t sub_254368A54()
{
  return sub_25436886C();
}

uint64_t sub_254368A68()
{
  return sub_25436D930();
}

uint64_t sub_254368AB4()
{
  return sub_2543689E8(*v0);
}

uint64_t sub_254368AC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_254368894(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_254368AFC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25436A728();
  *a1 = result;
  return result;
}

uint64_t sub_254368B30(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_254368B84(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t DKProbabilityValue.deinit()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 104));
  return v0;
}

uint64_t DKProbabilityValue.__deallocating_deinit()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 104));
  return swift_deallocClassInstance();
}

uint64_t sub_254368CF4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(*(void *)v2 + 80);
  uint64_t v20 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v16 = (char *)&v15 - v5;
  uint64_t v18 = *(void *)(v6 + 96);
  type metadata accessor for DKProbabilityValue.CodingKeys();
  swift_getWitnessTable();
  uint64_t v7 = sub_25436D720();
  uint64_t v17 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v15 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v10 = v16;
  uint64_t v11 = v7;
  sub_25436D950();
  (*(void (**)(char *, uint64_t))(*(void *)(*(void *)(*(void *)v2 + 80) - 8) + 16))(v10, v2 + *(void *)(*(void *)v2 + 104));
  char v22 = 0;
  uint64_t v12 = v19;
  sub_25436D710();
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v9, v7);
  }
  else
  {
    uint64_t v14 = v17;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v4);
    char v21 = 1;
    sub_25436D6F0();
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v9, v11);
  }
}

uint64_t DKProbabilityValue.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  DKProbabilityValue.init(from:)(a1);
  return v2;
}

uint64_t DKProbabilityValue.init(from:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v20 = *(void *)(*(void *)(*(void *)v1 + 80) - 8);
  MEMORY[0x270FA5388](a1);
  char v22 = (char *)&v19 - v4;
  uint64_t v23 = *(void *)(v5 + 96);
  type metadata accessor for DKProbabilityValue.CodingKeys();
  swift_getWitnessTable();
  uint64_t v21 = sub_25436D670();
  uint64_t v19 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v7 = (char *)&v19 - v6;
  uint64_t v8 = a1[3];
  uint64_t v24 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v8);
  uint64_t v9 = v25;
  sub_25436D940();
  if (v9)
  {
    uint64_t v14 = (uint64_t)v24;
    type metadata accessor for DKProbabilityValue();
    swift_deallocPartialClassInstance();
    uint64_t v18 = v14;
  }
  else
  {
    uint64_t v11 = v19;
    uint64_t v10 = v20;
    char v27 = 0;
    uint64_t v12 = v21;
    sub_25436D650();
    uint64_t v13 = *(void (**)(void))(v10 + 32);
    uint64_t v25 = v1 + *(void *)(*(void *)v1 + 104);
    v13();
    char v26 = 1;
    sub_25436D630();
    uint64_t v17 = v16;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v12);
    *(void *)(v1 + *(void *)(*(void *)v1 + 112)) = v17;
    uint64_t v18 = (uint64_t)v24;
  }
  __swift_destroy_boxed_opaque_existential_1(v18);
  return v2;
}

uint64_t sub_2543693CC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = DKProbabilityValue.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_2543693F8(void *a1)
{
  return sub_254368CF4(a1);
}

uint64_t sub_25436941C()
{
  sub_254291A6C();
  return swift_bridgeObjectRetain();
}

uint64_t DKProbabilityDistribution.init(variables:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t type metadata accessor for DKProbabilityValue.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for DKProbabilityValue()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_254369480()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)v0;
  uint64_t v3 = *((void *)v0 + 2);
  v13[13] = 0;
  v13[14] = v3;
  uint64_t v4 = v2[10];
  v13[8] = v4;
  uint64_t v5 = v2[11];
  v13[9] = v5;
  uint64_t v6 = v2[12];
  v13[10] = v6;
  uint64_t v7 = type metadata accessor for DKProbabilityValue();
  uint64_t v8 = sub_25436CEA0();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_25436CD40();
  uint64_t result = swift_bridgeObjectRelease();
  if (v14 != 0.0)
  {
    double v14 = v1[2];
    void v13[2] = v4;
    v13[3] = v5;
    v13[4] = v6;
    v13[5] = MEMORY[0x270FA5388](*(void *)&v14);
    swift_bridgeObjectRetain();
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v12 = sub_254272228((void (*)(char *, char *))sub_254369F34, (uint64_t)v13, v8, v7, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v11);
    swift_bridgeObjectRelease();
    *((void *)v1 + 2) = v12;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_254369668()
{
  uint64_t v2 = *(void *)(v0 + 16);
  type metadata accessor for DKProbabilityValue();
  sub_25436CEA0();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  sub_25436CD50();
  swift_bridgeObjectRelease();
  swift_getWitnessTable();
  sub_25436CB60();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_25436979C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x656C626169726176 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25436D7B0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_254369830()
{
  return 0x656C626169726176;
}

uint64_t sub_25436984C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25436979C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_254369884@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25428442C();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2543698BC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_254369910(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t DKProbabilityDistribution.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DKProbabilityDistribution.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2543699BC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v2;
  v10[3] = *(void *)(*v2 + 80);
  void v10[2] = *(void *)(v4 + 88);
  v10[1] = *(void *)(v4 + 96);
  type metadata accessor for DKProbabilityDistribution.CodingKeys();
  swift_getWitnessTable();
  uint64_t v5 = sub_25436D720();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v10 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25436D950();
  v10[7] = v2[2];
  type metadata accessor for DKProbabilityValue();
  sub_25436CEA0();
  v10[5] = swift_getWitnessTable();
  swift_getWitnessTable();
  sub_25436D710();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t DKProbabilityDistribution.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  DKProbabilityDistribution.init(from:)(a1);
  return v2;
}

uint64_t DKProbabilityDistribution.init(from:)(void *a1)
{
  type metadata accessor for DKProbabilityDistribution.CodingKeys();
  swift_getWitnessTable();
  uint64_t v3 = sub_25436D670();
  uint64_t v10 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v9 - v4;
  type metadata accessor for DKProbabilityValue();
  *(void *)(v1 + 16) = sub_25436CE30();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v6 = v11;
  sub_25436D940();
  if (v6)
  {
    swift_release();
  }
  else
  {
    uint64_t v7 = v10;
    sub_25436CEA0();
    uint64_t WitnessTable = swift_getWitnessTable();
    swift_getWitnessTable();
    sub_25436D650();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v3);
    *(void *)(v1 + 16) = v13;
    swift_bridgeObjectRelease();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t sub_254369EB8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = DKProbabilityDistribution.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_254369EE4(void *a1)
{
  return sub_2543699BC(a1);
}

double sub_254369F08@<D0>(double *a1@<X0>, uint64_t a2@<X1>, double *a3@<X8>)
{
  double result = *a1 + *(double *)(*(void *)a2 + *(void *)(**(void **)a2 + 112));
  *a3 = result;
  return result;
}

uint64_t sub_254369F34@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  *(double *)(v3 + *(void *)(*(void *)v3 + 112)) = *(double *)(v3 + *(void *)(*(void *)v3 + 112))
                                                       / *(double *)(v2 + 40);
  *a2 = v3;
  return swift_retain();
}

BOOL sub_254369F78(uint64_t a1, uint64_t a2)
{
  return *(double *)(*(void *)a1 + *(void *)(**(void **)a1 + 112)) < *(double *)(*(void *)a2
                                                                                       + *(void *)(**(void **)a2 + 112));
}

uint64_t type metadata accessor for DKProbabilityDistribution.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_254369FD4@<X0>(uint64_t a1@<X8>)
{
  return sub_25436866C(a1);
}

uint64_t sub_254369FFC()
{
  return 24;
}

__n128 sub_25436A008(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

void sub_25436A01C(double *a1@<X8>)
{
  *a1 = sub_254368758();
}

void sub_25436A048(double *a1)
{
}

uint64_t sub_25436A070()
{
  return 24;
}

__n128 sub_25436A07C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t sub_25436A090@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_254291A6C();
  return swift_bridgeObjectRetain();
}

uint64_t sub_25436A0CC()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_2542DD974(v0);
}

uint64_t sub_25436A0F8()
{
  return 24;
}

__n128 sub_25436A104(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t sub_25436A118()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for DKProbabilityValue(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DKProbabilityValue);
}

uint64_t dispatch thunk of DKProbabilityValue.variable.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of DKProbabilityValue.variable.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of DKProbabilityValue.variable.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of DKProbabilityValue.probability.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of DKProbabilityValue.probability.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of DKProbabilityValue.probability.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of DKProbabilityValue.__allocating_init(variable:probability:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of DKProbabilityValue.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of DKProbabilityValue.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t sub_25436A31C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for DKProbabilityDistribution()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for DKProbabilityDistribution(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DKProbabilityDistribution);
}

uint64_t dispatch thunk of DKProbabilityDistribution.variables.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of DKProbabilityDistribution.variables.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of DKProbabilityDistribution.variables.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of DKProbabilityDistribution.__allocating_init(variables:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of DKProbabilityDistribution.normalize()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of DKProbabilityDistribution.max(threshold:)(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)v2 + 152))(a1, a2 & 1);
}

uint64_t dispatch thunk of DKProbabilityDistribution.encode(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of DKProbabilityDistribution.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t sub_25436A4C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

unsigned char *sub_25436A4C8(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25436A564);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

unsigned char *sub_25436A58C(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25436A658);
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

uint64_t sub_25436A680()
{
  return swift_getWitnessTable();
}

uint64_t sub_25436A69C()
{
  return swift_getWitnessTable();
}

uint64_t sub_25436A6B8()
{
  return swift_getWitnessTable();
}

uint64_t sub_25436A6D4()
{
  return swift_getWitnessTable();
}

uint64_t sub_25436A6F0()
{
  return swift_getWitnessTable();
}

uint64_t sub_25436A70C()
{
  return swift_getWitnessTable();
}

uint64_t sub_25436A728()
{
  return 2;
}

uint64_t sub_25436A730()
{
  v1[2] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DD7A40);
  v1[3] = swift_task_alloc();
  v1[4] = swift_task_alloc();
  uint64_t v2 = sub_25436C7B0();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25436A830, 0, 0);
}

uint64_t sub_25436A830()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *(void *)(v2 + OBJC_IVAR____TtC23IntelligentTrackingCore34DKIntelligentTrackingInternalState_localHomePosition);
  if (v3
    && (*(unsigned char *)(v1 + OBJC_IVAR____TtC23IntelligentTrackingCore18DKReturnToBaseTask_returnToBaseIssued) & 1) == 0)
  {
    uint64_t v5 = v0[6];
    uint64_t v4 = v0[7];
    uint64_t v7 = v0[4];
    uint64_t v6 = v0[5];
    *(unsigned char *)(v1 + OBJC_IVAR____TtC23IntelligentTrackingCore18DKReturnToBaseTask_returnToBaseIssued) = 1;
    uint64_t v8 = *(void *)(v1 + 48);
    uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    v21(v4, v8 + OBJC_IVAR____TtC23IntelligentTrackingCore26DKIntelligentTrackingState_time, v6);
    type metadata accessor for DKIntelligentTrackingCommand(0);
    uint64_t v9 = swift_allocObject();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v9 + OBJC_IVAR____TtC23IntelligentTrackingCore28DKIntelligentTrackingCommand_time, v4, v6);
    uint64_t v10 = v9 + OBJC_IVAR____TtC23IntelligentTrackingCore28DKIntelligentTrackingCommand_command;
    *(void *)uint64_t v10 = v3;
    *(void *)(v10 + 8) = 0x4008000000000000;
    *(_WORD *)(v10 + 16) = 0x4000;
    *(void *)(v8 + OBJC_IVAR____TtC23IntelligentTrackingCore26DKIntelligentTrackingState_command) = v9;
    swift_bridgeObjectRetain();
    swift_release();
    uint64_t v11 = *(void *)(v1 + 40);
    v21(v7, *(void *)(v1 + 48) + OBJC_IVAR____TtC23IntelligentTrackingCore26DKIntelligentTrackingState_time, v6);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v6);
    sub_254277464(v7, v11 + OBJC_IVAR____TtC23IntelligentTrackingCore34DKIntelligentTrackingInternalState_lastReturnToBaseCommandTime);
    uint64_t v2 = *(void *)(v1 + 40);
  }
  uint64_t v12 = v0[5];
  uint64_t v13 = v0[6];
  uint64_t v14 = v0[3];
  sub_254272818(v2 + OBJC_IVAR____TtC23IntelligentTrackingCore34DKIntelligentTrackingInternalState_lastReturnToBaseCommandTime, v14);
  LODWORD(v12) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v14, 1, v12);
  sub_254258BD8(v14);
  if (v12 == 1)
  {
    uint64_t v15 = v0[5];
    uint64_t v16 = v0[6];
    uint64_t v17 = v0[4];
    uint64_t v18 = *(void *)(v1 + 40);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v17, *(void *)(v0[2] + 48) + OBJC_IVAR____TtC23IntelligentTrackingCore26DKIntelligentTrackingState_time, v15);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56))(v17, 0, 1, v15);
    sub_254277464(v17, v18 + OBJC_IVAR____TtC23IntelligentTrackingCore34DKIntelligentTrackingInternalState_lastReturnToBaseCommandTime);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = (uint64_t (*)(uint64_t))v0[1];
  return v19(1);
}

uint64_t sub_25436AAE8()
{
  return type metadata accessor for DKReturnToBaseTask();
}

uint64_t type metadata accessor for DKReturnToBaseTask()
{
  uint64_t result = qword_269DDA5A8;
  if (!qword_269DDA5A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25436AB3C()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_25436AB80(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DD7A40);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v13 - v8;
  *(_OWORD *)(v2 + 56) = xmmword_2543798C0;
  *(_OWORD *)(v2 + 72) = xmmword_2543798D0;
  *(_OWORD *)(v2 + 88) = xmmword_2543798D0;
  *(_OWORD *)(v2 + 104) = xmmword_2543798E0;
  *(_OWORD *)(v2 + 120) = xmmword_2543798F0;
  *(unsigned char *)(v2 + 136) = 0;
  swift_retain();
  sub_25436C9E0();
  *(unsigned char *)(v2 + 137) = a1;
  swift_release();
  uint64_t v10 = sub_25436C7B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(unsigned char *)(v2 + 49) = 0;
  *(void *)(v2 + 24) = 0x3FE0000000000000;
  sub_254272818((uint64_t)v9, (uint64_t)v6);
  type metadata accessor for DKSmoothingFilter();
  swift_allocObject();
  uint64_t v11 = sub_25435D778(0x3FE0000000000000, 0, 0x3FB999999999999ALL, 0, 0, (uint64_t)v6, 0, 1, 0.2, 0, 1);
  sub_254258BD8((uint64_t)v9);
  *(void *)(v2 + 16) = v11;
  *(void *)(v2 + 32) = 0x3FE6666666666666;
  *(void *)(v2 + 40) = 0x3FD3333333333333;
  *(unsigned char *)(v2 + 48) = 0;
  return v2;
}

BOOL sub_25436AD9C(uint64_t a1)
{
  uint64_t v2 = sub_25436C9F0();
  uint64_t v3 = *(char **)(v2 - 8);
  uint64_t v89 = v2;
  uint64_t v90 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v83 = (char *)&v82 - v7;
  MEMORY[0x270FA5388](v8);
  v85 = (char *)&v82 - v9;
  MEMORY[0x270FA5388](v10);
  v84 = (char *)&v82 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DD7A40);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v87 = (char *)&v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for DKPersonSelectionFilter.Signals(0);
  MEMORY[0x270FA5388](v14);
  v86 = (char *)&v82 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (double *)((char *)&v82 - v17);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (double *)((char *)&v82 - v20);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (double *)((char *)&v82 - v23);
  MEMORY[0x270FA5388](v25);
  char v27 = (double *)((char *)&v82 - v26);
  MEMORY[0x270FA5388](v28);
  uint64_t v30 = (double *)((char *)&v82 - v29);
  MEMORY[0x270FA5388](v31);
  uint64_t v33 = (double *)((char *)&v82 - v32);
  MEMORY[0x270FA5388](v34);
  uint64_t v36 = (double *)((char *)&v82 - v35);
  uint64_t v88 = v37;
  uint64_t v91 = *(int *)(v37 + 44);
  int v38 = *(unsigned __int8 *)(a1 + v91);
  sub_25436BB24(a1, (uint64_t)&v82 - v35);
  if (v38 != 1)
  {
    sub_25436BB88((uint64_t)v36);
    sub_25436BB24(a1, (uint64_t)v33);
    goto LABEL_8;
  }
  double v39 = *v36;
  sub_25436BB88((uint64_t)v36);
  sub_25436BB24(a1, (uint64_t)v33);
  if (v39 <= 0.75)
  {
LABEL_8:
    sub_25436BB88((uint64_t)v33);
    uint64_t v41 = v90;
    goto LABEL_9;
  }
  double v40 = v33[1];
  sub_25436BB88((uint64_t)v33);
  uint64_t v41 = v90;
  if (v40 > 0.75)
  {
    uint64_t v42 = sub_25436C7B0();
    uint64_t v43 = (uint64_t)v87;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v87, 1, 1, v42);
    uint64_t v44 = v92;
    swift_retain();
    sub_25435D340(0, 1, v43, 1.0);
    swift_release();
    sub_254258BD8(v43);
    uint64_t v45 = v84;
    uint64_t v46 = v89;
    (*((void (**)(char *, uint64_t, uint64_t))v41 + 2))(v84, v44 + OBJC_IVAR____TtC23IntelligentTrackingCore23DKPersonSelectionFilter_logger, v89);
    int64_t v47 = sub_25436C9D0();
    os_log_type_t v48 = sub_25436D000();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v49 = 0;
      _os_log_impl(&dword_254249000, v47, v48, "hybrid selection: always select if speaking and looking", v49, 2u);
      MEMORY[0x25A276B10](v49, -1, -1);
    }

    (*((void (**)(char *, uint64_t))v41 + 1))(v45, v46);
    return *(double *)(a1 + *(int *)(v88 + 40)) < 0.5;
  }
LABEL_9:
  int v50 = *(unsigned __int8 *)(a1 + v91);
  sub_25436BB24(a1, (uint64_t)v30);
  if (v50 != 1)
  {
    sub_25436BB88((uint64_t)v30);
    sub_25436BB24(a1, (uint64_t)v27);
    uint64_t v52 = v89;
    goto LABEL_14;
  }
  double v51 = v30[2];
  sub_25436BB88((uint64_t)v30);
  sub_25436BB24(a1, (uint64_t)v27);
  uint64_t v52 = v89;
  if (v51 >= 1.5)
  {
LABEL_14:
    sub_25436BB88((uint64_t)v27);
    goto LABEL_15;
  }
  double v53 = v27[1];
  sub_25436BBE4((uint64_t)v27, (uint64_t)v24);
  if (v53 > 0.75)
  {
    sub_25436BB88((uint64_t)v24);
LABEL_31:
    uint64_t v75 = sub_25436C7B0();
    uint64_t v76 = (uint64_t)v87;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v75 - 8) + 56))(v87, 1, 1, v75);
    uint64_t v77 = v92;
    swift_retain();
    sub_25435D340(0, 1, v76, 1.0);
    swift_release();
    sub_254258BD8(v76);
    uint64_t v78 = v85;
    (*((void (**)(char *, uint64_t, uint64_t))v41 + 2))(v85, v77 + OBJC_IVAR____TtC23IntelligentTrackingCore23DKPersonSelectionFilter_logger, v52);
    v79 = sub_25436C9D0();
    os_log_type_t v80 = sub_25436D000();
    if (os_log_type_enabled(v79, v80))
    {
      v81 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v81 = 0;
      _os_log_impl(&dword_254249000, v79, v80, "hybrid selection: always select if near camera and speaking or looking", v81, 2u);
      MEMORY[0x25A276B10](v81, -1, -1);
    }

    (*((void (**)(char *, uint64_t))v41 + 1))(v78, v52);
    return *(double *)(a1 + *(int *)(v88 + 40)) < 0.5;
  }
  double v74 = *v24;
  sub_25436BB88((uint64_t)v24);
  if (v74 > 0.75) {
    goto LABEL_31;
  }
LABEL_15:
  double v54 = *(double *)(a1 + 16);
  sub_25436BB24(a1, (uint64_t)v21);
  if (v54 <= 2.0)
  {
    sub_25436BB88((uint64_t)v21);
    sub_25436BB24(a1, (uint64_t)v18);
    goto LABEL_22;
  }
  double v55 = v21[1];
  sub_25436BB88((uint64_t)v21);
  sub_25436BB24(a1, (uint64_t)v18);
  if (v55 >= 0.25)
  {
LABEL_22:
    sub_25436BB88((uint64_t)v18);
    uint64_t v57 = (uint64_t)v86;
    goto LABEL_23;
  }
  double v56 = *v18;
  sub_25436BB88((uint64_t)v18);
  uint64_t v57 = (uint64_t)v86;
  if (v56 < 0.25)
  {
    uint64_t v58 = sub_25436C7B0();
    uint64_t v59 = (uint64_t)v87;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v87, 1, 1, v58);
    uint64_t v60 = v92;
    swift_retain();
    sub_25435D340(0, 1, v59, 0.0);
    swift_release();
    sub_254258BD8(v59);
    uint64_t v61 = v83;
    (*((void (**)(char *, uint64_t, uint64_t))v41 + 2))(v83, v60 + OBJC_IVAR____TtC23IntelligentTrackingCore23DKPersonSelectionFilter_logger, v52);
    uint64_t v62 = sub_25436C9D0();
    os_log_type_t v63 = sub_25436D000();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v64 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v64 = 0;
      _os_log_impl(&dword_254249000, v62, v63, "hybrid selection: never select if far from camera and not looking and not speeking", v64, 2u);
      MEMORY[0x25A276B10](v64, -1, -1);
    }

    (*((void (**)(char *, uint64_t))v41 + 1))(v61, v52);
    return *(double *)(a1 + *(int *)(v88 + 40)) >= 0.5;
  }
LABEL_23:
  (*((void (**)(char *, uint64_t, uint64_t))v41 + 2))(v5, v92 + OBJC_IVAR____TtC23IntelligentTrackingCore23DKPersonSelectionFilter_logger, v52);
  sub_25436BB24(a1, v57);
  uint64_t v66 = sub_25436C9D0();
  os_log_type_t v67 = sub_25436D000();
  if (os_log_type_enabled(v66, v67))
  {
    int v68 = (uint8_t *)swift_slowAlloc();
    uint64_t v90 = v5;
    *(_DWORD *)int v68 = 67109120;
    uint64_t v69 = v88;
    BOOL v70 = *(double *)(v57 + *(int *)(v88 + 40)) >= 0.5;
    sub_25436BB88(v57);
    BOOL v93 = v70;
    uint64_t v5 = v90;
    sub_25436D180();
    _os_log_impl(&dword_254249000, v66, v67, "hybrid selection: select using iss %{BOOL}d", v68, 8u);
    MEMORY[0x25A276B10](v68, -1, -1);
  }
  else
  {
    sub_25436BB88(v57);
    uint64_t v69 = v88;
  }

  (*((void (**)(char *, uint64_t))v41 + 1))(v5, v52);
  double v71 = *(double *)(a1 + *(int *)(v69 + 40));
  if (v71 <= 0.5 || *(unsigned char *)(a1 + v91) == 1)
  {
    uint64_t v72 = sub_25436C7B0();
    uint64_t v73 = (uint64_t)v87;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(v87, 1, 1, v72);
    swift_retain();
    sub_25435D340(0x3FB999999999999ALL, 0, v73, v71);
    swift_release();
    sub_254258BD8(v73);
  }
  return 0;
}

void sub_25436B778()
{
}

uint64_t sub_25436B7A8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23IntelligentTrackingCore23DKPersonSelectionFilter_logger;
  uint64_t v2 = sub_25436C9F0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(v1, v2);
}

uint64_t sub_25436B814()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC23IntelligentTrackingCore23DKPersonSelectionFilter_logger;
  uint64_t v2 = sub_25436C9F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_25436B8BC()
{
  return type metadata accessor for DKPersonSelectionFilter(0);
}

uint64_t type metadata accessor for DKPersonSelectionFilter(uint64_t a1)
{
  return sub_254252A6C(a1, (uint64_t *)&unk_269DDA5C8);
}

uint64_t sub_25436B8E4()
{
  uint64_t result = sub_25436C9F0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DKPersonSelectionFilter.SelectionCriteria(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25436BA74);
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

ValueMetadata *type metadata accessor for DKPersonSelectionFilter.SelectionCriteria()
{
  return &type metadata for DKPersonSelectionFilter.SelectionCriteria;
}

unint64_t sub_25436BAB0()
{
  unint64_t result = qword_269DDA5D8;
  if (!qword_269DDA5D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DDA5D8);
  }
  return result;
}

uint64_t type metadata accessor for DKPersonSelectionFilter.Signals(uint64_t a1)
{
  return sub_254252A6C(a1, (uint64_t *)&unk_269DDA5E0);
}

uint64_t sub_25436BB24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DKPersonSelectionFilter.Signals(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25436BB88(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DKPersonSelectionFilter.Signals(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25436BBE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DKPersonSelectionFilter.Signals(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

char *sub_25436BC48(char *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = (char *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    long long v7 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v7;
    uint64_t v8 = a3[8];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_25436C7B0();
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    v12(v9, v10, v11);
    v12(&v4[a3[9]], (uint64_t)a2 + a3[9], v11);
    uint64_t v13 = a3[11];
    *(void *)&v4[a3[10]] = *(uint64_t *)((char *)a2 + a3[10]);
    v4[v13] = *((unsigned char *)a2 + v13);
  }
  return v4;
}

uint64_t sub_25436BD60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_25436C7B0();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v5 - 8), v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 36);
  return v8(v6, v5);
}

char *sub_25436BE08(char *a1, char *a2, int *a3)
{
  long long v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  uint64_t v7 = a3[8];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_25436C7B0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  v11(v8, v9, v10);
  v11(&a1[a3[9]], &a2[a3[9]], v10);
  uint64_t v12 = a3[11];
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  a1[v12] = a2[v12];
  return a1;
}

char *sub_25436BED0(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = *((void *)a2 + 3);
  uint64_t v6 = a3[8];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_25436C7B0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(&a1[a3[9]], &a2[a3[9]], v9);
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  a1[a3[11]] = a2[a3[11]];
  return a1;
}

char *sub_25436BFB4(char *a1, char *a2, int *a3)
{
  long long v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  uint64_t v7 = a3[8];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_25436C7B0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(&a1[a3[9]], &a2[a3[9]], v10);
  uint64_t v12 = a3[11];
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  a1[v12] = a2[v12];
  return a1;
}

char *sub_25436C07C(char *a1, char *a2, int *a3)
{
  long long v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  uint64_t v7 = a3[8];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_25436C7B0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(&a1[a3[9]], &a2[a3[9]], v10);
  uint64_t v12 = a3[11];
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  a1[v12] = a2[v12];
  return a1;
}

uint64_t sub_25436C144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25436C158);
}

uint64_t sub_25436C158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25436C7B0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 32);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unsigned int v12 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 44));
    if (v12 >= 2) {
      return ((v12 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_25436C22C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25436C240);
}

uint64_t sub_25436C240(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25436C7B0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 32);
    unsigned int v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 44)) = a2 + 1;
  }
  return result;
}

uint64_t sub_25436C300()
{
  uint64_t result = sub_25436C7B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_25436C3D0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_25436C3E0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_25436C3F0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_25436C400()
{
  return MEMORY[0x270EEDE28]();
}

uint64_t sub_25436C410()
{
  return MEMORY[0x270EEDE38]();
}

uint64_t sub_25436C420()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_25436C430()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_25436C440()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25436C450()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25436C460()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25436C470()
{
  return MEMORY[0x270EEE218]();
}

uint64_t sub_25436C480()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_25436C490()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_25436C4A0()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_25436C4B0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25436C4C0()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_25436C4D0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25436C4E0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25436C4F0()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_25436C500()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_25436C510()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_25436C520()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_25436C530()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_25436C540()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_25436C550()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_25436C560()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_25436C570()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25436C580()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_25436C590()
{
  return MEMORY[0x270EEFCA0]();
}

uint64_t sub_25436C5A0()
{
  return MEMORY[0x270EEFD10]();
}

uint64_t sub_25436C5B0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25436C5C0()
{
  return MEMORY[0x270FA1648]();
}

uint64_t sub_25436C5D0()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_25436C5E0()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_25436C5F0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25436C600()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_25436C610()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25436C620()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_25436C630()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_25436C640()
{
  return MEMORY[0x270EF0000]();
}

uint64_t sub_25436C650()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_25436C660()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_25436C670()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_25436C680()
{
  return MEMORY[0x270EF0108]();
}

uint64_t sub_25436C690()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25436C6A0()
{
  return MEMORY[0x270EF0168]();
}

uint64_t sub_25436C6B0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25436C6C0()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_25436C6D0()
{
  return MEMORY[0x270EF0260]();
}

uint64_t sub_25436C6E0()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_25436C6F0()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t sub_25436C700()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_25436C710()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_25436C720()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25436C730()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_25436C740()
{
  return MEMORY[0x270EF09C0]();
}

uint64_t sub_25436C750()
{
  return MEMORY[0x270EF09C8]();
}

uint64_t sub_25436C760()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_25436C770()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_25436C780()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_25436C790()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_25436C7A0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25436C7B0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25436C7C0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25436C7D0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_25436C7E0()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_25436C7F0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_25436C800()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25436C810()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_25436C820()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_25436C830()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_25436C840()
{
  return MEMORY[0x270F9C860]();
}

uint64_t sub_25436C850()
{
  return MEMORY[0x270F9C870]();
}

uint64_t sub_25436C860()
{
  return MEMORY[0x270F9C890]();
}

uint64_t sub_25436C870()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_25436C880()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_25436C890()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_25436C8A0()
{
  return MEMORY[0x270F84350]();
}

uint64_t sub_25436C8B0()
{
  return MEMORY[0x270F84358]();
}

uint64_t sub_25436C8C0()
{
  return MEMORY[0x270F84360]();
}

uint64_t sub_25436C8D0()
{
  return MEMORY[0x270F84368]();
}

uint64_t sub_25436C8E0()
{
  return MEMORY[0x270F84370]();
}

uint64_t sub_25436C8F0()
{
  return MEMORY[0x270F84378]();
}

uint64_t sub_25436C900()
{
  return MEMORY[0x270F84380]();
}

uint64_t sub_25436C910()
{
  return MEMORY[0x270F84388]();
}

uint64_t sub_25436C920()
{
  return MEMORY[0x270F84390]();
}

uint64_t sub_25436C930()
{
  return MEMORY[0x270F84398]();
}

uint64_t sub_25436C940()
{
  return MEMORY[0x270F843A0]();
}

uint64_t sub_25436C950()
{
  return MEMORY[0x270F843A8]();
}

uint64_t sub_25436C960()
{
  return MEMORY[0x270F84438]();
}

uint64_t sub_25436C970()
{
  return MEMORY[0x270F84440]();
}

uint64_t sub_25436C980()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_25436C990()
{
  return MEMORY[0x270FA1828]();
}

uint64_t sub_25436C9A0()
{
  return MEMORY[0x270FA18C8]();
}

uint64_t sub_25436C9B0()
{
  return MEMORY[0x270FA1908]();
}

uint64_t sub_25436C9C0()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_25436C9D0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25436C9E0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25436C9F0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25436CA00()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_25436CA10()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25436CA20()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25436CA30()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25436CA40()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_25436CA50()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_25436CA60()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_25436CA70()
{
  return MEMORY[0x270FA0730]();
}

uint64_t sub_25436CA80()
{
  return MEMORY[0x270FA0740]();
}

uint64_t sub_25436CA90()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_25436CAA0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25436CAB0()
{
  return MEMORY[0x270F9D068]();
}

uint64_t sub_25436CAC0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_25436CAD0()
{
  return MEMORY[0x270F9D148]();
}

uint64_t sub_25436CAE0()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_25436CAF0()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_25436CB00()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_25436CB10()
{
  return MEMORY[0x270F9D230]();
}

uint64_t sub_25436CB20()
{
  return MEMORY[0x270F9D260]();
}

uint64_t sub_25436CB30()
{
  return MEMORY[0x270F9D288]();
}

uint64_t sub_25436CB40()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25436CB50()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25436CB60()
{
  return MEMORY[0x270F9D428]();
}

uint64_t sub_25436CB70()
{
  return MEMORY[0x270F9D480]();
}

uint64_t sub_25436CB80()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_25436CB90()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_25436CBA0()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_25436CBB0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25436CBC0()
{
  return MEMORY[0x270EF1870]();
}

uint64_t sub_25436CBD0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25436CBE0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25436CBF0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25436CC00()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25436CC10()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_25436CC20()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_25436CC30()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_25436CC40()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25436CC50()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25436CC60()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25436CC70()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_25436CC80()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25436CC90()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25436CCA0()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_25436CCB0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25436CCC0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25436CCD0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25436CCE0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25436CCF0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25436CD00()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25436CD20()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_25436CD30()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_25436CD40()
{
  return MEMORY[0x270F9D9A8]();
}

uint64_t sub_25436CD50()
{
  return MEMORY[0x270F9D9B0]();
}

uint64_t sub_25436CD60()
{
  return MEMORY[0x270F9D9D8]();
}

uint64_t sub_25436CD70()
{
  return MEMORY[0x270F9DA18]();
}

uint64_t sub_25436CD80()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_25436CD90()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_25436CDA0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25436CDB0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25436CDC0()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_25436CDD0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25436CDE0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25436CDF0()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_25436CE00()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_25436CE10()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25436CE20()
{
  return MEMORY[0x270F9DC08]();
}

uint64_t sub_25436CE30()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_25436CE40()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25436CE50()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_25436CE60()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25436CE70()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_25436CE80()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_25436CE90()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_25436CEA0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25436CEB0()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_25436CEC0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25436CED0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_25436CEE0()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_25436CEF0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_25436CF00()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_25436CF10()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25436CF20()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25436CF40()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_25436CF50()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25436CF60()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25436CF70()
{
  return MEMORY[0x270F9E018]();
}

uint64_t sub_25436CF80()
{
  return MEMORY[0x270F9E030]();
}

uint64_t sub_25436CF90()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_25436CFA0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_25436CFB0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_25436CFC0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_25436CFD0()
{
  return MEMORY[0x270F9E240]();
}

uint64_t sub_25436CFE0()
{
  return MEMORY[0x270EF1E40]();
}

uint64_t sub_25436CFF0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25436D000()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25436D010()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25436D020()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25436D030()
{
  return MEMORY[0x270FA0DE0]();
}

uint64_t sub_25436D040()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_25436D050()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_25436D060()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_25436D070()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_25436D080()
{
  return MEMORY[0x270FA0EC8]();
}

uint64_t sub_25436D090()
{
  return MEMORY[0x270FA0ED8]();
}

uint64_t sub_25436D0B0()
{
  return MEMORY[0x270FA0F58]();
}

uint64_t sub_25436D0C0()
{
  return MEMORY[0x270FA0F68]();
}

uint64_t sub_25436D0E0()
{
  return MEMORY[0x270FA0870]();
}

uint64_t sub_25436D0F0()
{
  return MEMORY[0x270FA0888]();
}

uint64_t sub_25436D100()
{
  return MEMORY[0x270FA0890]();
}

uint64_t sub_25436D110()
{
  return MEMORY[0x270EF20C0]();
}

uint64_t sub_25436D120()
{
  return MEMORY[0x270F9E360]();
}

uint64_t sub_25436D130()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25436D140()
{
  return MEMORY[0x270F9E3E0]();
}

uint64_t sub_25436D150()
{
  return MEMORY[0x270F9E400]();
}

uint64_t sub_25436D160()
{
  return MEMORY[0x270F9E430]();
}

uint64_t sub_25436D170()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_25436D180()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25436D190()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25436D1A0()
{
  return MEMORY[0x270F9E568]();
}

uint64_t sub_25436D1B0()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_25436D1C0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25436D1D0()
{
  return MEMORY[0x270EF2568]();
}

uint64_t sub_25436D1E0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25436D1F0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25436D200()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25436D210()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_25436D220()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25436D230()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25436D240()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25436D250()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25436D260()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25436D270()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25436D280()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_25436D290()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25436D2A0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25436D2B0()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_25436D2C0()
{
  return MEMORY[0x270F9E9F0]();
}

uint64_t sub_25436D2D0()
{
  return MEMORY[0x270F9E9F8]();
}

uint64_t sub_25436D2E0()
{
  return MEMORY[0x270F9EA00]();
}

uint64_t sub_25436D2F0()
{
  return MEMORY[0x270F9EA08]();
}

uint64_t sub_25436D300()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_25436D310()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25436D320()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25436D330()
{
  return MEMORY[0x270F9EA50]();
}

uint64_t sub_25436D340()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25436D350()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25436D360()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25436D370()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25436D380()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25436D390()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_25436D3A0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25436D3B0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25436D3C0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25436D3D0()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_25436D3E0()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_25436D3F0()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_25436D400()
{
  return MEMORY[0x270F9ECA0]();
}

uint64_t sub_25436D410()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_25436D420()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_25436D430()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_25436D440()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_25436D450()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_25436D460()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25436D470()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_25436D480()
{
  return MEMORY[0x270F9EF10]();
}

uint64_t sub_25436D490()
{
  return MEMORY[0x270F9EF28]();
}

uint64_t sub_25436D4A0()
{
  return MEMORY[0x270F9EF40]();
}

uint64_t sub_25436D4B0()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_25436D4C0()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_25436D4D0()
{
  return MEMORY[0x270F9EFC8]();
}

uint64_t sub_25436D4E0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25436D4F0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25436D500()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_25436D510()
{
  return MEMORY[0x270F9F010]();
}

uint64_t sub_25436D520()
{
  return MEMORY[0x270F9F018]();
}

uint64_t sub_25436D530()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25436D540()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25436D550()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25436D560()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25436D570()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25436D590()
{
  return MEMORY[0x270F9F220]();
}

uint64_t sub_25436D5A0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25436D5B0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25436D5C0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25436D5D0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_25436D5E0()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_25436D5F0()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_25436D600()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_25436D610()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25436D620()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_25436D630()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_25436D640()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_25436D650()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25436D660()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25436D670()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_25436D680()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25436D690()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_25436D6A0()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_25436D6B0()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_25436D6C0()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_25436D6D0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25436D6E0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_25436D6F0()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_25436D700()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_25436D710()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25436D720()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_25436D730()
{
  return MEMORY[0x270F9F4B8]();
}

uint64_t sub_25436D740()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_25436D750()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_25436D760()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25436D790()
{
  return MEMORY[0x270F9F7A8]();
}

uint64_t sub_25436D7A0()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_25436D7B0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25436D7C0()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_25436D7D0()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_25436D7E0()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_25436D7F0()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_25436D800()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_25436D810()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_25436D820()
{
  return MEMORY[0x270F9FA90]();
}

uint64_t sub_25436D830()
{
  return MEMORY[0x270F9FAB8]();
}

uint64_t sub_25436D840()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25436D850()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25436D860()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_25436D880()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25436D890()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25436D8A0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25436D8B0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25436D8C0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25436D8D0()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_25436D8E0()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25436D8F0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25436D900()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25436D910()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_25436D920()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25436D930()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25436D940()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25436D950()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_25436D960()
{
  return MEMORY[0x270F9FF80]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B80](red, green, blue, alpha);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x270EE7188]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

OSStatus CMSampleBufferCreateReadyWithImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BF8](allocator, imageBuffer, formatDescription, sampleTiming, sampleBufferOut);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7FB8](allocator, imageBuffer, formatDescriptionOut);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

CGRect VNImageRectForNormalizedRect(CGRect normalizedRect, size_t imageWidth, size_t imageHeight)
{
  MEMORY[0x270F06980](imageWidth, imageHeight, (__n128)normalizedRect.origin, *(__n128 *)&normalizedRect.origin.y, (__n128)normalizedRect.size, *(__n128 *)&normalizedRect.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x270F06678](pixelBuffer, options, imageOut);
}

OSStatus VTPixelRotationSessionCreate(CFAllocatorRef allocator, VTPixelRotationSessionRef *pixelRotationSessionOut)
{
  return MEMORY[0x270F067C0](allocator, pixelRotationSessionOut);
}

void VTPixelRotationSessionInvalidate(VTPixelRotationSessionRef session)
{
}

OSStatus VTPixelRotationSessionRotateImage(VTPixelRotationSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067D0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x270F06820](session, propertyKey, propertyValue);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x270FA0150]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cblas_dgemm_NEWLAPACK()
{
  return MEMORY[0x270EDE330]();
}

uint64_t cblas_sgemm_NEWLAPACK()
{
  return MEMORY[0x270EDE440]();
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

uint64_t dgetrf_NEWLAPACK()
{
  return MEMORY[0x270EDE598]();
}

uint64_t dgetri_NEWLAPACK()
{
  return MEMORY[0x270EDE5A8]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x270F27EE0]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x270F27F08]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x270F27F20]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x270F27F78]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x270F28068]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x270F28070]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x270F28090]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x270F280A0]();
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x270EDAB10]();
}

uint64_t sgetrf_NEWLAPACK()
{
  return MEMORY[0x270EDE7C8]();
}

uint64_t sgetri_NEWLAPACK()
{
  return MEMORY[0x270EDE7D8]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

long double tan(long double __x)
{
  MEMORY[0x270EDB810](__x);
  return result;
}

void vDSP_mtrans(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N)
{
}

void vDSP_mtransD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N)
{
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vaddD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vfill(const float *__A, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vfillD(const double *__A, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vfltu8(const unsigned __int8 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsdiv(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmulD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}