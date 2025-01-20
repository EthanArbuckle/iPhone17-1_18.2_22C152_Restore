unint64_t ATBiomeMediaType.description.getter(char a1)
{
  unint64_t result;

  result = 1735290739;
  switch(a1)
  {
    case 1:
      result = 0x74736163646F70;
      break;
    case 2:
      result = 0x6F6F626F69647561;
      break;
    case 3:
      result = 0xD000000000000010;
      break;
    case 4:
      result = 0x6E776F6E6B6E75;
      break;
    default:
      return result;
  }
  return result;
}

BOOL static ATBiomeMediaType.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t ATBiomeMediaType.hash(into:)()
{
  return sub_2486ABFB8();
}

uint64_t ATBiomeMediaType.hashValue.getter()
{
  return sub_2486ABFD8();
}

BOOL sub_248684CB8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_248684CCC()
{
  return sub_2486ABFD8();
}

uint64_t sub_248684D14()
{
  return sub_2486ABFB8();
}

uint64_t sub_248684D40()
{
  return sub_2486ABFD8();
}

unint64_t sub_248684D84()
{
  unint64_t result = 1735290739;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x74736163646F70;
      break;
    case 2:
      unint64_t result = 0x6F6F626F69647561;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t ATBiomeMediaItem.title.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATBiomeMediaItem.artist.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATBiomeMediaItem.album.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATBiomeMediaItem.iTunesStoreIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t variable initialization expression of ATBiomeMediaItem.link()
{
  return 0;
}

uint64_t ATBiomeMediaItem.link.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATBiomeMediaItem.link.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return result;
}

uint64_t (*ATBiomeMediaItem.link.modify())()
{
  return nullsub_1;
}

uint64_t ATBiomeMediaItem.bundleID.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATBiomeMediaItem.mediaType.getter()
{
  return *(unsigned __int8 *)(v0 + 96);
}

uint64_t ATBiomeMediaItem.description.getter()
{
  switch(*(unsigned char *)(v0 + 96))
  {
    case 1:
      sub_2486ABD98();
      swift_bridgeObjectRelease();
      strcpy((char *)v2, "[podcast (");
      BYTE3(v2[1]) = 0;
      HIDWORD(v2[1]) = -369098752;
      swift_bridgeObjectRetain();
      sub_2486ABBB8();
      swift_bridgeObjectRelease();
      sub_2486ABBB8();
      if (!*(void *)(v0 + 24)) {
        goto LABEL_20;
      }
      swift_bridgeObjectRetain();
      sub_2486ABBB8();
      swift_bridgeObjectRelease();
      sub_2486ABBB8();
      if (*(void *)(v0 + 8)) {
        goto LABEL_14;
      }
      __break(1u);
LABEL_13:
      sub_2486ABD98();
      swift_bridgeObjectRelease();
      v2[0] = 0xD000000000000010;
      v2[1] = 0x80000002486ACFD0;
      swift_bridgeObjectRetain();
      sub_2486ABBB8();
      swift_bridgeObjectRelease();
      sub_2486ABBB8();
      if (*(void *)(v0 + 8)) {
        goto LABEL_14;
      }
      goto LABEL_21;
    case 2:
      sub_2486ABD98();
      swift_bridgeObjectRelease();
      strcpy((char *)v2, "[audiobook (");
      BYTE5(v2[1]) = 0;
      HIWORD(v2[1]) = -5120;
      swift_bridgeObjectRetain();
      sub_2486ABBB8();
      swift_bridgeObjectRelease();
      sub_2486ABBB8();
      if (!*(void *)(v0 + 40)) {
        goto LABEL_18;
      }
      swift_bridgeObjectRetain();
      sub_2486ABBB8();
      swift_bridgeObjectRelease();
      sub_2486ABBB8();
      if (!*(void *)(v0 + 24)) {
        goto LABEL_19;
      }
      swift_bridgeObjectRetain();
      sub_2486ABBB8();
      swift_bridgeObjectRelease();
      sub_2486ABBB8();
      if (!*(void *)(v0 + 8))
      {
        __break(1u);
LABEL_9:
        sub_2486ABD98();
        swift_bridgeObjectRelease();
        strcpy((char *)v2, "[unknown (");
        BYTE3(v2[1]) = 0;
        HIDWORD(v2[1]) = -369098752;
        swift_bridgeObjectRetain();
        sub_2486ABBB8();
        swift_bridgeObjectRelease();
        sub_2486ABBB8();
      }
LABEL_14:
      swift_bridgeObjectRetain();
      sub_2486ABBB8();
      swift_bridgeObjectRelease();
      sub_2486ABBB8();
      return v2[0];
    case 3:
      goto LABEL_13;
    case 4:
      goto LABEL_9;
    default:
      sub_2486ABD98();
      swift_bridgeObjectRelease();
      strcpy((char *)v2, "[song (");
      v2[1] = 0xE700000000000000;
      swift_bridgeObjectRetain();
      sub_2486ABBB8();
      swift_bridgeObjectRelease();
      sub_2486ABBB8();
      if (!*(void *)(v0 + 8))
      {
        __break(1u);
LABEL_17:
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x248685468);
      }
      swift_bridgeObjectRetain();
      sub_2486ABBB8();
      swift_bridgeObjectRelease();
      sub_2486ABBB8();
      if (!*(void *)(v0 + 24)) {
        goto LABEL_17;
      }
      swift_bridgeObjectRetain();
      sub_2486ABBB8();
      swift_bridgeObjectRelease();
      return v2[0];
  }
}

uint64_t sub_24868547C()
{
  v1[41] = v0;
  uint64_t v2 = sub_2486ABB08();
  v1[42] = v2;
  v1[43] = *(void *)(v2 - 8);
  v1[44] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24868553C, 0, 0);
}

uint64_t sub_24868553C()
{
  uint64_t v1 = v0[41];
  uint64_t v2 = *(void *)(v1 + 56);
  if (v2)
  {
    uint64_t v3 = *(void *)(v1 + 48);
    int v4 = *(unsigned __int8 *)(v1 + 96);
    if (!v4)
    {
      uint64_t v5 = 203;
      goto LABEL_9;
    }
    if (v4 == 1)
    {
      uint64_t v5 = 301;
LABEL_9:
      v8 = self;
      swift_bridgeObjectRetain();
      id v9 = objc_msgSend(v8, sel_createBagForSubProfile);
      if (v9)
      {
        v10 = v9;
        id v11 = objc_allocWithZone(MEMORY[0x263F27D18]);
        v12 = (void *)sub_2486ABB58();
        v13 = (void *)sub_2486ABB58();
        id v14 = objc_msgSend(v11, sel_initWithType_clientIdentifier_clientVersion_bag_, v5, v12, v13, v10);
        v0[45] = v14;

        __swift_instantiateConcreteTypeFromMangledName(&qword_26931D290);
        uint64_t v15 = swift_allocObject();
        *(_OWORD *)(v15 + 16) = xmmword_2486AC710;
        *(void *)(v15 + 32) = v3;
        *(void *)(v15 + 40) = v2;
        v16 = (void *)sub_2486ABBE8();
        swift_bridgeObjectRelease();
        objc_msgSend(v14, sel_setItemIdentifiers_, v16);

        id v17 = objc_msgSend(v14, sel_perform);
        v0[46] = v17;
        v0[2] = v0;
        v0[7] = v0 + 40;
        v0[3] = sub_2486857F0;
        uint64_t v18 = swift_continuation_init();
        v0[15] = MEMORY[0x263EF8330];
        v0[16] = 0x40000000;
        v0[17] = sub_248685CDC;
        v0[18] = &block_descriptor_13;
        v0[19] = v18;
        objc_msgSend(v17, sel_resultWithCompletion_, v0 + 15);
        id v9 = v0 + 2;
      }
      else
      {
        __break(1u);
      }
      return MEMORY[0x270FA23F0](v9);
    }
  }
  swift_task_dealloc();
  v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_2486857F0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 376) = v1;
  if (v1) {
    uint64_t v2 = sub_248685BB8;
  }
  else {
    uint64_t v2 = sub_248685900;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_248685900()
{
  uint64_t v1 = (_OWORD *)(v0 + 200);
  uint64_t v2 = (_OWORD *)(v0 + 232);
  uint64_t v3 = *(void **)(v0 + 320);

  id v4 = objc_msgSend(v3, sel_responseDataItems);
  if (!v4)
  {
    *uint64_t v2 = 0u;
    *(_OWORD *)(v0 + 248) = 0u;
LABEL_13:
    v13 = *(void **)(v0 + 360);

    sub_24868D470(v0 + 232, &qword_26931D2C8);
LABEL_15:
    *uint64_t v1 = 0u;
    *(_OWORD *)(v0 + 216) = 0u;
    goto LABEL_16;
  }
  uint64_t v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2D0);
  uint64_t v6 = sub_2486ABBF8();

  if (!*(void *)(v6 + 16))
  {
    __break(1u);
    return;
  }
  uint64_t v7 = *(void *)(v6 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 264) = 0x7475626972747461;
  *(void *)(v0 + 272) = 0xEA00000000007365;
  sub_2486ABD68();
  if (*(void *)(v7 + 16) && (unint64_t v8 = sub_248689374(v0 + 80), (v9 & 1) != 0))
  {
    sub_24868D3B0(*(void *)(v7 + 56) + 32 * v8, v0 + 232);
  }
  else
  {
    *uint64_t v2 = 0u;
    *(_OWORD *)(v0 + 248) = 0u;
  }
  swift_bridgeObjectRelease();
  sub_24868D35C(v0 + 80);
  if (!*(void *)(v0 + 256)) {
    goto LABEL_13;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    id v14 = *(void **)(v0 + 360);

    goto LABEL_15;
  }
  uint64_t v10 = *(void *)(v0 + 312);
  *(void *)(v0 + 296) = 7107189;
  *(void *)(v0 + 304) = 0xE300000000000000;
  sub_2486ABD68();
  if (*(void *)(v10 + 16) && (unint64_t v11 = sub_248689374(v0 + 160), (v12 & 1) != 0))
  {
    sub_24868D3B0(*(void *)(v10 + 56) + 32 * v11, v0 + 200);
  }
  else
  {
    *uint64_t v1 = 0u;
    *(_OWORD *)(v0 + 216) = 0u;
  }

  swift_bridgeObjectRelease();
  sub_24868D35C(v0 + 160);
  if (*(void *)(v0 + 224))
  {
    int v19 = swift_dynamicCast();
    if (v19) {
      uint64_t v15 = *(void *)(v0 + 280);
    }
    else {
      uint64_t v15 = 0;
    }
    if (v19) {
      uint64_t v16 = *(void *)(v0 + 288);
    }
    else {
      uint64_t v16 = 0;
    }
    goto LABEL_17;
  }
LABEL_16:
  sub_24868D470(v0 + 200, &qword_26931D2C8);
  uint64_t v15 = 0;
  uint64_t v16 = 0;
LABEL_17:
  uint64_t v17 = *(void *)(v0 + 328);
  swift_bridgeObjectRelease();
  *(void *)(v17 + 64) = v15;
  *(void *)(v17 + 72) = v16;
  swift_task_dealloc();
  uint64_t v18 = *(void (**)(void))(v0 + 8);
  v18();
}

uint64_t sub_248685BB8()
{
  uint64_t v1 = *(void **)(v0 + 368);
  swift_willThrow();

  sub_2486ABAF8();
  uint64_t v2 = sub_2486ABAE8();
  os_log_type_t v3 = sub_2486ABC98();
  if (os_log_type_enabled(v2, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_248682000, v2, v3, "Failed to query the media server for the link.", v4, 2u);
    MEMORY[0x24C57BD90](v4, -1, -1);
  }
  uint64_t v5 = *(void **)(v0 + 376);
  uint64_t v6 = *(void *)(v0 + 352);
  uint64_t v7 = *(void *)(v0 + 336);
  uint64_t v8 = *(void *)(v0 + 344);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  swift_task_dealloc();
  char v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_248685CDC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2D8);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
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

uint64_t ATBiomeMediaItem.hash(into:)()
{
  if (v0[1])
  {
    sub_2486ABFC8();
    swift_bridgeObjectRetain();
    sub_2486ABB98();
    swift_bridgeObjectRelease();
    if (v0[3]) {
      goto LABEL_3;
    }
  }
  else
  {
    sub_2486ABFC8();
    if (v0[3])
    {
LABEL_3:
      sub_2486ABFC8();
      swift_bridgeObjectRetain();
      sub_2486ABB98();
      swift_bridgeObjectRelease();
      if (v0[5]) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  sub_2486ABFC8();
  if (v0[5])
  {
LABEL_4:
    sub_2486ABFC8();
    swift_bridgeObjectRetain();
    sub_2486ABB98();
    swift_bridgeObjectRelease();
    if (v0[7]) {
      goto LABEL_5;
    }
LABEL_10:
    sub_2486ABFC8();
    if (v0[9]) {
      goto LABEL_6;
    }
LABEL_11:
    sub_2486ABFC8();
    goto LABEL_12;
  }
LABEL_9:
  sub_2486ABFC8();
  if (!v0[7]) {
    goto LABEL_10;
  }
LABEL_5:
  sub_2486ABFC8();
  swift_bridgeObjectRetain();
  sub_2486ABB98();
  swift_bridgeObjectRelease();
  if (!v0[9]) {
    goto LABEL_11;
  }
LABEL_6:
  sub_2486ABFC8();
  swift_bridgeObjectRetain();
  sub_2486ABB98();
  swift_bridgeObjectRelease();
LABEL_12:
  swift_bridgeObjectRetain();
  sub_2486ABB98();
  swift_bridgeObjectRelease();
  return sub_2486ABFB8();
}

uint64_t ATBiomeMediaItem.hashValue.getter()
{
  return sub_2486ABFD8();
}

BOOL sub_248685F88(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 80);
  v11[4] = *(_OWORD *)(a1 + 64);
  v11[5] = v2;
  char v12 = *(unsigned char *)(a1 + 96);
  long long v3 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v3;
  long long v4 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v4;
  long long v5 = *(_OWORD *)(a2 + 16);
  v13[0] = *(_OWORD *)a2;
  v13[1] = v5;
  long long v6 = *(_OWORD *)(a2 + 32);
  long long v7 = *(_OWORD *)(a2 + 48);
  long long v8 = *(_OWORD *)(a2 + 64);
  long long v9 = *(_OWORD *)(a2 + 80);
  char v14 = *(unsigned char *)(a2 + 96);
  v13[4] = v8;
  v13[5] = v9;
  v13[2] = v6;
  v13[3] = v7;
  return _s15ArchetypeEngine16ATBiomeMediaItemV23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v11, (uint64_t)v13);
}

uint64_t sub_248685FF4()
{
  return sub_2486ABFD8();
}

uint64_t sub_248686038()
{
  return sub_2486ABFD8();
}

uint64_t ATBiomeDataRetriever.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t ATBiomeDataRetriever.init()()
{
  return v0;
}

uint64_t ATBiomeDataRetriever.getTopPlayedMedia(k:start:end:mediaTypesOfInterest:maxNumRecordsToFetch:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[33] = a4;
  v5[34] = a5;
  v5[31] = a2;
  v5[32] = a3;
  v5[30] = a1;
  return MEMORY[0x270FA2498](sub_2486860B8, 0, 0);
}

uint64_t sub_2486860B8()
{
  v128 = v0;
  uint64_t v1 = v0[31];
  uint64_t v2 = sub_2486AB8F8();
  v0[35] = v2;
  long long v3 = *(void **)(v2 - 8);
  uint64_t v4 = swift_task_alloc();
  v0[36] = v4;
  uint64_t v5 = swift_task_alloc();
  uint64_t result = sub_2486AB8E8();
  if ((unsigned __int128)(v1 * (__int128)86400) >> 64 != (86400 * v1) >> 63)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  uint64_t v7 = v0[32];
  sub_2486AB878();
  long long v8 = (void (*)(uint64_t, uint64_t))v3[1];
  v0[37] = v8;
  v0[38] = (unint64_t)(v3 + 1) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v8(v5, v2);
  swift_task_dealloc();
  uint64_t v9 = swift_task_alloc();
  v0[39] = v9;
  uint64_t v10 = swift_task_alloc();
  uint64_t result = sub_2486AB8E8();
  if ((unsigned __int128)(v7 * (__int128)86400) >> 64 != (86400 * v7) >> 63)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  uint64_t v116 = v0[34];
  uint64_t v119 = v0[33];
  sub_2486AB878();
  v121 = (void (*)(char *, uint64_t))v8;
  v8(v10, v2);
  swift_task_dealloc();
  sub_24868CFDC(0, &qword_26931D238);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
  uint64_t v11 = swift_task_alloc();
  char v12 = (void (*)(uint64_t, uint64_t, uint64_t))v3[2];
  v12(v11, v4, v2);
  v13 = (void (*)(uint64_t, void, uint64_t, uint64_t))v3[7];
  v13(v11, 0, 1, v2);
  uint64_t v14 = swift_task_alloc();
  v12(v14, v9, v2);
  uint64_t v124 = v2;
  v13(v14, 0, 1, v2);
  id v15 = sub_248687460(v11, v14, v116, v116, 0);
  v0[40] = v15;
  swift_task_dealloc();
  swift_task_dealloc();
  id v16 = objc_msgSend((id)BiomeLibrary(), sel_Media);
  swift_unknownObjectRelease();
  id v17 = objc_msgSend(v16, sel_NowPlaying);
  swift_unknownObjectRelease();
  id v18 = objc_msgSend(v17, sel_publisherWithOptions_, v15);
  v0[41] = v18;

  uint64_t v19 = swift_allocObject();
  uint64_t v20 = (void *)MEMORY[0x263F8EE78];
  *(void *)(v19 + 16) = MEMORY[0x263F8EE78];
  v0[42] = v19;
  v0[19] = sub_2486875E0;
  v0[20] = 0;
  v0[15] = MEMORY[0x263EF8330];
  v0[16] = 1107296256;
  v0[17] = sub_2486877FC;
  v0[18] = &block_descriptor_0;
  v21 = _Block_copy(v0 + 15);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v119;
  *(void *)(v22 + 24) = v19;
  v0[25] = sub_24868C2C8;
  v0[26] = v22;
  v0[21] = MEMORY[0x263EF8330];
  v0[22] = 1107296256;
  v0[23] = sub_248688354;
  v0[24] = &block_descriptor_6;
  v23 = _Block_copy(v0 + 21);
  v106 = v0;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  id v24 = objc_msgSend(v18, sel_sinkWithCompletion_shouldContinue_, v21, v23);
  _Block_release(v23);
  _Block_release(v21);

  swift_beginAccess();
  uint64_t v25 = *(void *)(v19 + 16);
  uint64_t v109 = *(void *)(v25 + 16);
  if (v109)
  {
    uint64_t v108 = v25 + 32;
    uint64_t result = swift_bridgeObjectRetain();
    unint64_t v26 = 0;
    uint64_t v107 = v25;
    while (v26 < *(void *)(v25 + 16))
    {
      unint64_t v110 = v26;
      v27 = (uint64_t *)(v108 + 112 * v26);
      uint64_t v112 = *v27;
      uint64_t v28 = v27[11];
      char v111 = *((unsigned char *)v27 + 96);
      uint64_t v29 = v27[13];
      uint64_t v123 = *(void *)(v29 + 16);
      long long v117 = *(_OWORD *)(v27 + 7);
      *(_OWORD *)aBlock = *(_OWORD *)(v27 + 9);
      long long v114 = *(_OWORD *)(v27 + 3);
      long long v115 = *(_OWORD *)(v27 + 5);
      long long v113 = *(_OWORD *)(v27 + 1);
      if (v123)
      {
        uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D248);
        uint64_t v122 = *(void *)(v30 - 8);
        uint64_t v125 = v29 + ((*(unsigned __int8 *)(v122 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v122 + 80));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v120 = v29;
        swift_bridgeObjectRetain();
        uint64_t v31 = 0;
        double v32 = 0.0;
        do
        {
          v33 = (int *)swift_task_alloc();
          uint64_t v34 = *(void *)(v122 + 72);
          uint64_t v35 = v125 + v34 * v31;
          sub_24868C2D0(v35, (uint64_t)v33);
          int v36 = *v33;
          v121((char *)v33 + *(int *)(v30 + 48), v124);
          swift_task_dealloc();
          if (v36 == 2
            || (v37 = (int *)swift_task_alloc(),
                sub_24868C2D0(v35, (uint64_t)v37),
                int v38 = *v37,
                v121((char *)v37 + *(int *)(v30 + 48), v124),
                swift_task_dealloc(),
                v38 == 3))
          {
            if (v31)
            {
              uint64_t result = swift_task_alloc();
              if ((unint64_t)(v31 - 1) >= *(void *)(v120 + 16))
              {
                __break(1u);
                goto LABEL_60;
              }
              v39 = (int *)result;
              uint64_t v40 = v125 + v34 * (v31 - 1);
              sub_24868C2D0(v40, result);
              int v41 = *v39;
              v121((char *)v39 + *(int *)(v30 + 48), v124);
              swift_task_dealloc();
              if (v41 == 1)
              {
                uint64_t v42 = swift_task_alloc();
                sub_24868C2D0(v35, v42);
                uint64_t v43 = v42 + *(int *)(v30 + 48);
                uint64_t v44 = swift_task_alloc();
                sub_24868C2D0(v40, v44);
                uint64_t v45 = v44 + *(int *)(v30 + 48);
                sub_2486AB868();
                double v47 = v46;
                v121((char *)v45, v124);
                swift_task_dealloc();
                v121((char *)v43, v124);
                swift_task_dealloc();
                double v32 = v32 + v47;
              }
            }
          }
          ++v31;
        }
        while (v123 != v31);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          goto LABEL_21;
        }
      }
      else
      {
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        double v32 = 0.0;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_21:
        }
          uint64_t v20 = sub_2486889C4(0, v20[2] + 1, 1, v20);
      }
      uint64_t v25 = v107;
      unint64_t v49 = v20[2];
      unint64_t v48 = v20[3];
      if (v49 >= v48 >> 1) {
        uint64_t v20 = sub_2486889C4((void *)(v48 > 1), v49 + 1, 1, v20);
      }
      v20[2] = v49 + 1;
      v50 = &v20[14 * v49];
      v50[4] = v112;
      ++v26;
      *(_OWORD *)(v50 + 5) = v113;
      *(_OWORD *)(v50 + 7) = v114;
      *(_OWORD *)(v50 + 9) = v115;
      *(_OWORD *)(v50 + 11) = v117;
      *(_OWORD *)(v50 + 13) = *(_OWORD *)aBlock;
      v50[15] = v28;
      *((unsigned char *)v50 + 128) = v111;
      *((double *)v50 + 17) = v32;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (v110 + 1 == v109)
      {
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
    }
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
LABEL_22:
  v106[43] = v20;
  v51 = (void *)sub_2486883AC(MEMORY[0x263F8EE78]);
  uint64_t v52 = v20[2];
  if (v52)
  {
    v126 = v106 + 2;
    swift_bridgeObjectRetain();
    v53 = (double *)(v20 + 17);
    while (1)
    {
      uint64_t v54 = *((void *)v53 - 2);
      char v55 = *((unsigned char *)v53 - 8);
      double v56 = *v53;
      long long v57 = *((_OWORD *)v53 - 6);
      long long v58 = *((_OWORD *)v53 - 5);
      long long v59 = *((_OWORD *)v53 - 4);
      long long v60 = *((_OWORD *)v53 - 3);
      long long v61 = *((_OWORD *)v53 - 2);
      v106[2] = *((void *)v53 - 13);
      *(_OWORD *)(v106 + 3) = v57;
      *(_OWORD *)(v106 + 5) = v58;
      *(_OWORD *)(v106 + 7) = v59;
      *(_OWORD *)(v106 + 9) = v60;
      *(_OWORD *)(v106 + 11) = v61;
      v106[13] = v54;
      *((unsigned char *)v106 + 112) = v55;
      uint64_t v62 = v51[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v62)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v63 = sub_2486893B8(v126);
        double v64 = 0.0;
        if (v65) {
          double v64 = *(double *)(v51[7] + 8 * v63);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        double v64 = 0.0;
      }
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v127 = v51;
      unint64_t v68 = sub_2486893B8(v126);
      uint64_t v69 = v51[2];
      BOOL v70 = (v67 & 1) == 0;
      uint64_t result = v69 + v70;
      if (__OFADD__(v69, v70)) {
        break;
      }
      char v71 = v67;
      if (v51[3] >= result)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_24868ADD8();
          v51 = v127;
        }
      }
      else
      {
        sub_24868A75C(result, isUniquelyReferenced_nonNull_native);
        v51 = v127;
        uint64_t result = sub_2486893B8(v126);
        if ((v71 & 1) != (v72 & 1))
        {
          return sub_2486ABF38();
        }
        unint64_t v68 = result;
      }
      double v73 = v56 + v64;
      if (v71)
      {
        *(double *)(v51[7] + 8 * v68) = v73;
      }
      else
      {
        v51[(v68 >> 6) + 8] |= 1 << v68;
        uint64_t v74 = v51[6] + 104 * v68;
        long long v76 = *((_OWORD *)v106 + 2);
        long long v75 = *((_OWORD *)v106 + 3);
        *(_OWORD *)uint64_t v74 = *(_OWORD *)v126;
        *(_OWORD *)(v74 + 16) = v76;
        *(_OWORD *)(v74 + 32) = v75;
        long long v77 = *((_OWORD *)v106 + 4);
        long long v78 = *((_OWORD *)v106 + 5);
        long long v79 = *((_OWORD *)v106 + 6);
        *(unsigned char *)(v74 + 96) = *((unsigned char *)v106 + 112);
        *(_OWORD *)(v74 + 64) = v78;
        *(_OWORD *)(v74 + 80) = v79;
        *(_OWORD *)(v74 + 48) = v77;
        *(double *)(v51[7] + 8 * v68) = v73;
        uint64_t v80 = v51[2];
        BOOL v81 = __OFADD__(v80, 1);
        uint64_t v82 = v80 + 1;
        if (v81) {
          goto LABEL_62;
        }
        v51[2] = v82;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v53 += 14;
      if (!--v52)
      {
        swift_bridgeObjectRelease();
        goto LABEL_41;
      }
    }
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
LABEL_41:
  v106[44] = v51;
  swift_bridgeObjectRetain_n();
  v83 = sub_248689948((uint64_t)v51);
  swift_bridgeObjectRelease();
  v127 = v83;
  sub_24868887C(&v127);
  int64_t v84 = v106[30];
  swift_bridgeObjectRelease();
  uint64_t result = sub_248688680(v84, (uint64_t)v127);
  v106[45] = v87;
  uint64_t v88 = v87 >> 1;
  if ((uint64_t)(v87 >> 1) < v86)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  uint64_t v89 = result;
  uint64_t v90 = v86;
  if (v86 == v88)
  {
    v91 = (void *)v106[40];

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v92 = v106[35];
    uint64_t v93 = v106[36];
    v94 = (void (*)(uint64_t, uint64_t))v106[37];
    v94(v106[39], v92);
    v94(v93, v92);
    swift_bridgeObjectRelease();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    v95 = (uint64_t (*)(uint64_t))v106[1];
    uint64_t v96 = MEMORY[0x263F8EE78];
    return v95(v96);
  }
  else
  {
    if (v86 >= v88)
    {
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
      return result;
    }
    uint64_t v97 = v85;
    unint64_t v98 = v87;
    v106[46] = v86;
    if (v87 & 1) != 0 && (uint64_t result = swift_isUniquelyReferenced_nonNull(), (result))
    {
      uint64_t v99 = v90;
    }
    else
    {
      sub_24868C448(v97, v90, v98);
      uint64_t v101 = v100;
      uint64_t v97 = v102;
      uint64_t v99 = v103;
      unint64_t v98 = v104;
      uint64_t result = swift_unknownObjectRelease();
      uint64_t v88 = v98 >> 1;
      uint64_t v89 = v101;
    }
    v106[49] = v97;
    v106[50] = v89;
    v106[47] = v98;
    v106[48] = v99;
    if (v90 < v99 || v90 >= v88) {
      goto LABEL_67;
    }
    v105 = (void *)swift_task_alloc();
    v106[51] = v105;
    void *v105 = v106;
    v105[1] = sub_248686FC8;
    return sub_24868547C();
  }
}

uint64_t sub_248686FC8()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2486870C4, 0, 0);
}

void sub_2486870C4()
{
  uint64_t v1 = *(void *)(v0 + 368) + 1;
  uint64_t v2 = *(void *)(v0 + 392);
  uint64_t v3 = *(void *)(v0 + 400);
  unint64_t v4 = *(void *)(v0 + 376);
  uint64_t v5 = *(void *)(v0 + 384);
  if (v1 == *(void *)(v0 + 360) >> 1)
  {
    uint64_t v6 = (v4 >> 1) - v5;
    if (__OFSUB__(v4 >> 1, v5))
    {
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    if (v6)
    {
      uint64_t v44 = MEMORY[0x263F8EE78];
      swift_unknownObjectRetain();
      sub_24868B1D8(0, v6 & ~(v6 >> 63), 0);
      if (v6 < 0)
      {
LABEL_32:
        __break(1u);
        return;
      }
      uint64_t v34 = v0;
      uint64_t v7 = v44;
      if (v5 <= (uint64_t)(v4 >> 1)) {
        unint64_t v8 = v4 >> 1;
      }
      else {
        unint64_t v8 = v5;
      }
      unint64_t v9 = v8 - v5;
      uint64_t v10 = (void *)(v2 + 112 * v5 + 104);
      while (v9)
      {
        uint64_t v11 = *(v10 - 10);
        uint64_t v41 = *(v10 - 11);
        uint64_t v42 = *(v10 - 13);
        uint64_t v12 = *(v10 - 8);
        uint64_t v13 = *(v10 - 6);
        uint64_t v39 = *(v10 - 7);
        uint64_t v40 = *(v10 - 9);
        uint64_t v14 = *(v10 - 4);
        uint64_t v15 = *(v10 - 2);
        uint64_t v37 = *(v10 - 3);
        uint64_t v38 = *(v10 - 5);
        char v36 = *((unsigned char *)v10 - 8);
        uint64_t v16 = *v10;
        unint64_t v17 = *(void *)(v7 + 16);
        unint64_t v35 = *(void *)(v7 + 24);
        uint64_t v45 = v7;
        uint64_t v18 = v7;
        uint64_t v43 = *(v10 - 12);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v7 = v18;
        if (v17 >= v35 >> 1)
        {
          sub_24868B1D8(v35 > 1, v17 + 1, 1);
          uint64_t v7 = v45;
        }
        *(void *)(v7 + 16) = v17 + 1;
        uint64_t v19 = v7 + 112 * v17;
        *(void *)(v19 + 32) = v42;
        *(void *)(v19 + 40) = v43;
        *(void *)(v19 + 48) = v41;
        *(void *)(v19 + 56) = v11;
        *(void *)(v19 + 64) = v40;
        *(void *)(v19 + 72) = v12;
        *(void *)(v19 + 80) = v39;
        *(void *)(v19 + 88) = v13;
        *(void *)(v19 + 96) = v38;
        *(void *)(v19 + 104) = v14;
        *(void *)(v19 + 112) = v37;
        *(void *)(v19 + 120) = v15;
        *(unsigned char *)(v19 + 128) = v36;
        --v9;
        v10 += 14;
        *(void *)(v19 + 136) = v16;
        if (!--v6)
        {
          uint64_t v0 = v34;
          v27 = *(void **)(v34 + 320);
          uint64_t v28 = v7;

          swift_unknownObjectRelease_n();
          swift_bridgeObjectRelease();
          goto LABEL_26;
        }
      }
      __break(1u);
      goto LABEL_30;
    }
    uint64_t v29 = *(void **)(v0 + 320);

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v28 = MEMORY[0x263F8EE78];
LABEL_26:
    uint64_t v30 = *(void *)(v0 + 288);
    uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v0 + 296);
    uint64_t v32 = *(void *)(v0 + 280);
    v31(*(void *)(v0 + 312), v32);
    v31(v30, v32);
    swift_bridgeObjectRelease();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    v33 = *(void (**)(uint64_t))(v0 + 8);
    v33(v28);
  }
  else
  {
    *(void *)(v0 + 368) = v1;
    if ((v4 & 1) == 0 || (swift_isUniquelyReferenced_nonNull() & 1) == 0)
    {
      sub_24868C448(v2, v5, v4);
      uint64_t v21 = v20;
      uint64_t v2 = v22;
      uint64_t v5 = v23;
      unint64_t v4 = v24;
      swift_unknownObjectRelease();
      uint64_t v3 = v21;
    }
    *(void *)(v0 + 392) = v2;
    *(void *)(v0 + 400) = v3;
    *(void *)(v0 + 376) = v4;
    *(void *)(v0 + 384) = v5;
    if (v1 < v5 || v1 >= (uint64_t)(v4 >> 1)) {
      goto LABEL_31;
    }
    unint64_t v26 = (void *)swift_task_alloc();
    *(void *)(v0 + 408) = v26;
    *unint64_t v26 = v0;
    v26[1] = sub_248686FC8;
    sub_24868547C();
  }
}

id sub_248687460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v9 = sub_2486AB8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  uint64_t v12 = 0;
  if (v11(a1, 1, v9) != 1)
  {
    uint64_t v12 = (void *)sub_2486AB888();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  }
  if (v11(a2, 1, v9) == 1)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = (void *)sub_2486AB888();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a2, v9);
  }
  id v14 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithStartDate_endDate_maxEvents_lastN_reversed_, v12, v13, a3, a4, a5 & 1);

  return v14;
}

id sub_2486875E0(void *a1)
{
  uint64_t v2 = sub_2486ABB08();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(a1, sel_error);
  if (result)
  {
    uint64_t v7 = result;
    sub_2486ABAF8();
    unint64_t v8 = v7;
    uint64_t v9 = sub_2486ABAE8();
    os_log_type_t v10 = sub_2486ABC98();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      v16[0] = v2;
      uint64_t v12 = (uint8_t *)v11;
      uint64_t v13 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 138412290;
      unint64_t v8 = v8;
      uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
      v16[1] = v14;
      sub_2486ABD08();
      void *v13 = v14;

      _os_log_impl(&dword_248682000, v9, v10, "Failed to access Now Playing Biome stream with error: \"%@\"", v12, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2F0);
      swift_arrayDestroy();
      MEMORY[0x24C57BD90](v13, -1, -1);
      uint64_t v15 = v12;
      uint64_t v2 = v16[0];
      MEMORY[0x24C57BD90](v15, -1, -1);
    }
    else
    {

      uint64_t v9 = v8;
    }

    return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

void sub_2486877FC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_248687864(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_msgSend(a1, sel_eventBody);
  if (!v6) {
    return 1;
  }
  uint64_t v7 = v6;
  id v8 = objc_msgSend(v6, sel_bundleID);

  if (!v8) {
    return 1;
  }
  uint64_t v9 = sub_2486ABB68();
  uint64_t v11 = v10;

  id v12 = objc_msgSend(a1, sel_eventBody);
  if (!v12 || (v13 = v12, unsigned int v14 = objc_msgSend(v12, sel_duration), v13, !v14))
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  uint64_t v119 = a3;
  uint64_t v120 = v9;
  uint64_t v126 = v11;
  uint64_t v15 = sub_2486AB8F8();
  uint64_t v124 = &v111;
  uint64_t v16 = *(void *)(v15 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v123 = (char *)&v111 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
  uint64_t v125 = &v111;
  uint64_t v19 = *(void *)(*(void *)(v18 - 8) + 64);
  ((void (*)(void))MEMORY[0x270FA5388])();
  unint64_t v20 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v21 = (char *)&v111 - v20;
  id v22 = objc_msgSend(a1, sel_eventBody);
  if (!v22)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))((char *)&v111 - v20, 1, 1, v15);
LABEL_12:
    swift_bridgeObjectRelease();
    sub_24868D470((uint64_t)v21, &qword_26931D240);
    return 1;
  }
  uint64_t v23 = v22;
  uint64_t v121 = v15;
  uint64_t v122 = v16;
  id v24 = objc_msgSend(v22, sel_absoluteTimestamp);

  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v25 = (char *)&v111 - v20;
  if (v24)
  {
    sub_2486AB8C8();

    uint64_t v26 = v122;
    v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v122 + 56);
    uint64_t v28 = (char *)&v111 - v20;
    uint64_t v29 = 0;
  }
  else
  {
    uint64_t v26 = v122;
    v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v122 + 56);
    uint64_t v28 = (char *)&v111 - v20;
    uint64_t v29 = 1;
  }
  uint64_t v30 = v121;
  v27(v28, v29, 1, v121);
  sub_24868D544((uint64_t)v25, (uint64_t)v21, &qword_26931D240);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v21, 1, v30) == 1) {
    goto LABEL_12;
  }
  uint64_t v32 = v123;
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v123, v21, v30);
  id v33 = objc_msgSend(a1, sel_eventBody);
  if (!v33)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v32, v30);
    swift_bridgeObjectRelease();
    return 1;
  }
  uint64_t v34 = v33;
  unsigned int v116 = objc_msgSend(v33, sel_playbackState);

  id v35 = objc_msgSend(a1, sel_eventBody);
  if (v35
    && (char v36 = v35, v37 = objc_msgSend(v35, sel_title), v36, v37))
  {
    uint64_t v38 = sub_2486ABB68();
    uint64_t v40 = v39;
  }
  else
  {
    uint64_t v38 = 0;
    uint64_t v40 = 0;
  }
  id v41 = objc_msgSend(a1, sel_eventBody);
  if (v41
    && (uint64_t v42 = v41, v43 = objc_msgSend(v41, sel_artist), v42, v43))
  {
    uint64_t v125 = (uint64_t *)sub_2486ABB68();
    uint64_t v118 = v44;
  }
  else
  {
    uint64_t v125 = 0;
    uint64_t v118 = 0;
  }
  id v45 = objc_msgSend(a1, sel_eventBody);
  if (v45
    && (uint64_t v46 = v45, v47 = objc_msgSend(v45, sel_album), v46, v47))
  {
    uint64_t v117 = sub_2486ABB68();
    uint64_t v49 = v48;
  }
  else
  {
    uint64_t v117 = 0;
    uint64_t v49 = 0;
  }
  id v50 = objc_msgSend(a1, sel_eventBody);
  if (v50)
  {
    v51 = v50;
    uint64_t v52 = v40;
    id v53 = objc_msgSend(v50, sel_iTunesStoreIdentifier);

    if (v53)
    {
      uint64_t v54 = sub_2486ABB68();
      uint64_t v56 = v55;
    }
    else
    {
      uint64_t v54 = 0;
      uint64_t v56 = 0;
    }
    uint64_t v40 = v52;
  }
  else
  {
    uint64_t v54 = 0;
    uint64_t v56 = 0;
  }
  sub_24868BAB8(v38, v40, (uint64_t)v125, v118, v117, v49, v54, v56, (uint64_t)v127, 0, 0, v120, v126);
  uint64_t v57 = v127[0];
  uint64_t v58 = v127[1];
  uint64_t v59 = v127[2];
  uint64_t v60 = v127[3];
  uint64_t v61 = v127[4];
  uint64_t v62 = v127[5];
  uint64_t v125 = (uint64_t *)v127[7];
  uint64_t v126 = v127[6];
  uint64_t v120 = v127[8];
  uint64_t v117 = v127[10];
  uint64_t v118 = v127[9];
  uint64_t v115 = v127[11];
  unsigned __int8 v63 = v128;
  if (!sub_2486882F4(v128, a2))
  {
    (*(void (**)(char *, uint64_t))(v122 + 8))(v123, v30);
    sub_24868D4CC((uint64_t)v127);
    return 1;
  }
  uint64_t v111 = v62;
  uint64_t v112 = v61;
  uint64_t v113 = v60;
  uint64_t v114 = v59;
  double v64 = (void *)(v119 + 16);
  swift_beginAccess();
  char v65 = (void *)*v64;
  uint64_t v66 = *(void *)(*v64 + 16);
  if (!v66) {
    goto LABEL_40;
  }
  char v67 = v65 + 4;
  uint64_t v68 = (uint64_t)&v65[14 * v66 + 4];
  long long v69 = *(_OWORD *)(v68 - 32);
  v129[4] = *(_OWORD *)(v68 - 48);
  v129[5] = v69;
  char v130 = *(unsigned char *)(v68 - 16);
  long long v70 = *(_OWORD *)(v68 - 96);
  v129[0] = *(_OWORD *)(v68 - 112);
  v129[1] = v70;
  long long v71 = *(_OWORD *)(v68 - 64);
  v129[2] = *(_OWORD *)(v68 - 80);
  v129[3] = v71;
  if (!_s15ArchetypeEngine16ATBiomeMediaItemV23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v129, (uint64_t)v127)) {
    goto LABEL_40;
  }
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D248);
  uint64_t v73 = *(void *)(*(void *)(v72 - 8) + 64);
  uint64_t v74 = MEMORY[0x270FA5388](&v111);
  long long v76 = (char *)&v111 - ((v73 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = v65[2];
  uint64_t v119 = v75;
  if (v77)
  {
    char v65 = (void *)v74;
    uint64_t v78 = v67[14 * v77 - 1];
    uint64_t v79 = *(void *)(v78 + 16);
    if (v79)
    {
      sub_24868C2D0(v78+ ((*(unsigned __int8 *)(v75 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80))+ *(void *)(v75 + 72) * (v79 - 1), (uint64_t)&v111 - ((v73 + 15) & 0xFFFFFFFFFFFFFFF0));
      int v80 = *(_DWORD *)v76;
      (*(void (**)(char *, uint64_t))(v122 + 8))(&v76[*(int *)(v72 + 48)], v121);
      if (v80 == 3)
      {
LABEL_40:
        __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2E0);
        BOOL v81 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26931D248) - 8);
        unint64_t v82 = (*(unsigned __int8 *)(*(void *)v81 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v81 + 80);
        uint64_t v83 = swift_allocObject();
        *(_OWORD *)(v83 + 16) = xmmword_2486AC710;
        unint64_t v84 = v83 + v82 + v81[14];
        *(_DWORD *)(v83 + v82) = v116;
        (*(void (**)(unint64_t, char *, uint64_t))(v122 + 16))(v84, v123, v121);
        swift_beginAccess();
        uint64_t v85 = (void *)*v64;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *double v64 = v85;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t v85 = sub_248688D60(0, v85[2] + 1, 1, v85);
          *double v64 = v85;
        }
        unint64_t v88 = v85[2];
        unint64_t v87 = v85[3];
        uint64_t v89 = v111;
        if (v88 >= v87 >> 1)
        {
          uint64_t v85 = sub_248688D60((void *)(v87 > 1), v88 + 1, 1, v85);
          *double v64 = v85;
        }
        v85[2] = v88 + 1;
        uint64_t v90 = &v85[14 * v88];
        v90[4] = v57;
        v90[5] = v58;
        uint64_t v91 = v113;
        v90[6] = v114;
        v90[7] = v91;
        v90[8] = v112;
        v90[9] = v89;
        uint64_t v92 = (uint64_t)v125;
        v90[10] = v126;
        v90[11] = v92;
        uint64_t v93 = v118;
        v90[12] = v120;
        v90[13] = v93;
        uint64_t v94 = v115;
        v90[14] = v117;
        v90[15] = v94;
        *((unsigned char *)v90 + 128) = v63;
        v90[17] = v83;
        swift_endAccess();
        (*(void (**)(char *, uint64_t))(v122 + 8))(v123, v121);
        return 1;
      }
    }
  }
  sub_24868D4CC((uint64_t)v127);
  uint64_t v95 = swift_beginAccess();
  unint64_t v96 = *(void *)(*v64 + 16);
  MEMORY[0x270FA5388](v95);
  uint64_t v97 = (unsigned int *)((char *)&v111 - ((v73 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v98 = (char *)v97 + *(int *)(v72 + 48);
  *uint64_t v97 = v116;
  uint64_t v99 = v123;
  (*(void (**)(char *, char *, uint64_t))(v122 + 16))(v98, v123, v121);
  swift_beginAccess();
  uint64_t v100 = (void *)*v64;
  char v101 = swift_isUniquelyReferenced_nonNull_native();
  *double v64 = v100;
  if (v101)
  {
    if (v96) {
      goto LABEL_48;
    }
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  uint64_t v100 = sub_2486A14EC(v100);
  *double v64 = v100;
  if (!v96) {
    goto LABEL_54;
  }
LABEL_48:
  if (v96 > v100[2])
  {
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  uint64_t v102 = &v100[14 * v96 - 14];
  uint64_t v103 = (void *)v102[17];
  char v65 = v102 + 17;
  double v64 = v103;
  char v104 = swift_isUniquelyReferenced_nonNull_native();
  *char v65 = v103;
  if ((v104 & 1) == 0)
  {
LABEL_56:
    double v64 = (void *)sub_248688AF0(0, v64[2] + 1, 1, (unint64_t)v64);
    *char v65 = v64;
  }
  uint64_t v105 = v119;
  unint64_t v107 = v64[2];
  unint64_t v106 = v64[3];
  if (v107 >= v106 >> 1)
  {
    unint64_t v108 = (unint64_t)v64;
    uint64_t v109 = v119;
    uint64_t v110 = sub_248688AF0(v106 > 1, v107 + 1, 1, v108);
    uint64_t v105 = v109;
    double v64 = (void *)v110;
    *char v65 = v110;
  }
  v64[2] = v107 + 1;
  sub_24868D544((uint64_t)v97, (uint64_t)v64+ ((*(unsigned __int8 *)(v105 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v105 + 80))+ *(void *)(v105 + 72) * v107, &qword_26931D248);
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v122 + 8))(v99, v121);
  return 1;
}

BOOL sub_2486882F4(BOOL result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  int v3 = result;
  if (*(unsigned char *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 33; ; ++i)
  {
    uint64_t v5 = i - 31;
    if (__OFADD__(i - 32, 1)) {
      break;
    }
    int v6 = *(unsigned __int8 *)(a2 + i);
    id result = v6 == v3;
    if (v6 == v3 || v5 == v2) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_248688354(uint64_t a1, void *a2)
{
  int v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

unint64_t sub_2486883AC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2A0);
  uint64_t v2 = (void *)sub_2486ABEA8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (void *)(a1 + 136);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    char v6 = *((unsigned char *)v4 - 8);
    uint64_t v7 = *v4;
    *(void *)uint64_t v19 = *(v4 - 13);
    long long v8 = *((_OWORD *)v4 - 5);
    *(_OWORD *)&v19[8] = *((_OWORD *)v4 - 6);
    *(_OWORD *)&v19[24] = v8;
    long long v9 = *((_OWORD *)v4 - 3);
    *(_OWORD *)&v19[40] = *((_OWORD *)v4 - 4);
    *(_OWORD *)&v19[56] = v9;
    *(_OWORD *)&v19[72] = *((_OWORD *)v4 - 2);
    char v20 = v6;
    *(void *)&v19[88] = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_2486893B8(v19);
    if (v11) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = v2[6] + 104 * result;
    long long v13 = *(_OWORD *)&v19[80];
    *(_OWORD *)(v12 + 64) = *(_OWORD *)&v19[64];
    *(_OWORD *)(v12 + 80) = v13;
    *(unsigned char *)(v12 + 96) = v20;
    long long v14 = *(_OWORD *)&v19[16];
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v19;
    *(_OWORD *)(v12 + 16) = v14;
    long long v15 = *(_OWORD *)&v19[48];
    *(_OWORD *)(v12 + 32) = *(_OWORD *)&v19[32];
    *(_OWORD *)(v12 + 48) = v15;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v16 = v2[2];
    BOOL v17 = __OFADD__(v16, 1);
    uint64_t v18 = v16 + 1;
    if (v17) {
      goto LABEL_11;
    }
    void v2[2] = v18;
    v4 += 14;
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

unint64_t sub_248688564(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D298);
  uint64_t v2 = (void *)sub_2486ABEA8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_248689424(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    void v2[2] = v13;
    v4 += 3;
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

int64_t sub_248688680(int64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = *(void *)(a2 + 16);
    if ((uint64_t)v2 >= result) {
      unint64_t v3 = result;
    }
    else {
      unint64_t v3 = *(void *)(a2 + 16);
    }
    if (!result) {
      unint64_t v3 = 0;
    }
    if (v2 >= v3) {
      return a2;
    }
  }
  __break(1u);
  return result;
}

uint64_t ATBiomeDataRetriever.deinit()
{
  return v0;
}

uint64_t ATBiomeDataRetriever.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t variable initialization expression of ATSpotlightDataRecord.extendedContent()
{
  return 0;
}

id variable initialization expression of ATLocationRetriever.locationManager()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F00A60]);
  return objc_msgSend(v0, sel_init);
}

dispatch_semaphore_t variable initialization expression of ATLocationRetriever.semaphore()
{
  return dispatch_semaphore_create(0);
}

unint64_t variable initialization expression of ATSpotlightCalendarRetriever.bundleID()
{
  return 0xD000000000000013;
}

uint64_t variable initialization expression of ATSpotlightCalendarRetriever.timestampSearchPaddingInSeconds()
{
  return 30;
}

id variable initialization expression of ATMegadomeLifeEvent.dateFormatter()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F08788]);
  return objc_msgSend(v0, sel_init);
}

uint64_t variable initialization expression of ATSpotlightDataRetriever.oneYearBack()
{
  uint64_t v0 = sub_2486AB8F8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  unint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2486AB8E8();
  sub_2486AB878();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t variable initialization expression of ATSpotlightDataRetriever.records()
{
  return MEMORY[0x263F8EE78];
}

uint64_t sub_24868887C(void **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (void *)sub_2486A1514(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = v2 + 4;
  v5[1] = v3;
  uint64_t result = sub_248689C84(v5);
  *a1 = v2;
  return result;
}

unint64_t variable initialization expression of ATSpotlightMailRetriever.bundleId()
{
  return 0xD000000000000014;
}

uint64_t variable initialization expression of ATSpotlightMailRetriever.mailUniqueRecordIdentifier()
{
  return sub_2486ABB68();
}

uint64_t variable initialization expression of ATSpotlightMailRetriever.mailConversationId()
{
  return sub_2486ABB68();
}

uint64_t variable initialization expression of ATSpotlightMailRetriever.mailReceivedDate()
{
  return sub_2486ABB68();
}

uint64_t variable initialization expression of ATSpotlightMailRetriever.longestChain()
{
  return 100;
}

uint64_t variable initialization expression of ATAccessibility._cachedSystemWideElement()
{
  return 0;
}

BOOL sub_248688980(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *sub_248688994@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_2486889A4(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

void sub_2486889B0(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_2486889B8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_2486889C4(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2A8);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 112);
      BOOL v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[14 * v8 + 4]) {
          memmove(v12, a4 + 4, 112 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      BOOL v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_24868C338(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_248688AF0(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2E0);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26931D248) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2486ABE58();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26931D248) - 8);
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
    sub_24868CCDC(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_248688D60(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2E8);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 112);
      unint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[14 * v8 + 4]) {
          memmove(v12, a4 + 4, 112 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_24868CBE4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_248688E8C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26931D290);
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
    sub_24868D018(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_248688F9C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2486890F4(a1, a2, a3, a4, &qword_26931D270, (uint64_t (*)(void))type metadata accessor for ATSpotlightDataRecord, (uint64_t (*)(void))type metadata accessor for ATSpotlightDataRecord);
}

void *sub_248688FC0(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26931D288);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 + 95;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 7);
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
        if (v10 != a4 || v13 >= &a4[16 * v8 + 4]) {
          memmove(v13, a4 + 4, v8 << 7);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24868D10C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2486890D0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2486890F4(a1, a2, a3, a4, &qword_26931D280, (uint64_t (*)(void))type metadata accessor for ATMegadomeLifeEvent, (uint64_t (*)(void))type metadata accessor for ATMegadomeLifeEvent);
}

uint64_t sub_2486890F4(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
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
    unint64_t v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_2486ABE58();
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
    sub_24868D200(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

unint64_t sub_248689374(uint64_t a1)
{
  uint64_t v2 = sub_2486ABD48();
  return sub_24868949C(a1, v2);
}

unint64_t sub_2486893B8(void *a1)
{
  sub_2486ABFA8();
  ATBiomeMediaItem.hash(into:)();
  uint64_t v2 = sub_2486ABFD8();
  return sub_248689564(a1, v2);
}

unint64_t sub_248689424(uint64_t a1, uint64_t a2)
{
  sub_2486ABFA8();
  sub_2486ABB98();
  uint64_t v4 = sub_2486ABFD8();
  return sub_248689864(a1, a2, v4);
}

unint64_t sub_24868949C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_24868D40C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x24C57B580](v9, a1);
      sub_24868D35C((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_248689564(void *a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = a1;
    uint64_t v7 = ~v4;
    uint64_t v8 = *(void *)(v2 + 48);
    uint64_t v9 = a1[1];
    uint64_t v61 = *a1;
    uint64_t v55 = v2 + 64;
    uint64_t v53 = v8;
    uint64_t v54 = ~v4;
    do
    {
      uint64_t v10 = v8 + 104 * v5;
      uint64_t v11 = *(void *)(v10 + 8);
      uint64_t v12 = *(void *)(v10 + 16);
      uint64_t v14 = *(void *)(v10 + 24);
      uint64_t v13 = *(void *)(v10 + 32);
      uint64_t v15 = *(void *)(v10 + 40);
      uint64_t v16 = *(void *)(v10 + 48);
      uint64_t v17 = *(void *)(v10 + 56);
      uint64_t v18 = *(void *)(v10 + 64);
      uint64_t v20 = *(void *)(v10 + 72);
      uint64_t v19 = *(void *)(v10 + 80);
      uint64_t v21 = *(void *)(v10 + 88);
      int v22 = *(unsigned __int8 *)(v10 + 96);
      if (v11)
      {
        if (!v9) {
          goto LABEL_4;
        }
        if (*(void *)v10 != v61 || v11 != v9)
        {
          uint64_t v58 = *(void *)(v10 + 56);
          uint64_t v59 = *(void *)(v10 + 48);
          uint64_t v57 = *(void *)(v10 + 64);
          uint64_t v24 = *(void *)(v10 + 72);
          uint64_t v25 = v9;
          uint64_t v26 = *(void *)(v10 + 88);
          uint64_t v27 = *(void *)(v10 + 80);
          int v28 = *(unsigned __int8 *)(v10 + 96);
          uint64_t v29 = *(void *)(v10 + 40);
          uint64_t v30 = *(void *)(v10 + 32);
          char v31 = sub_2486ABF08();
          uint64_t v13 = v30;
          uint64_t v15 = v29;
          int v22 = v28;
          uint64_t v19 = v27;
          uint64_t v21 = v26;
          uint64_t v9 = v25;
          uint64_t v20 = v24;
          uint64_t v18 = v57;
          uint64_t v17 = v58;
          uint64_t v16 = v59;
          uint64_t v8 = v53;
          uint64_t v7 = v54;
          uint64_t v3 = v55;
          uint64_t v6 = a1;
          if ((v31 & 1) == 0) {
            goto LABEL_4;
          }
        }
      }
      else if (v9)
      {
        goto LABEL_4;
      }
      uint64_t v32 = v6[3];
      if (v14)
      {
        if (!v32) {
          goto LABEL_4;
        }
        if (v12 != v6[2] || v14 != v32)
        {
          int v34 = v22;
          uint64_t v60 = v15;
          uint64_t v35 = v13;
          char v36 = sub_2486ABF08();
          uint64_t v13 = v35;
          uint64_t v15 = v60;
          int v22 = v34;
          uint64_t v8 = v53;
          uint64_t v7 = v54;
          uint64_t v3 = v55;
          uint64_t v6 = a1;
          if ((v36 & 1) == 0) {
            goto LABEL_4;
          }
        }
      }
      else if (v32)
      {
        goto LABEL_4;
      }
      uint64_t v37 = v6[5];
      if (v15)
      {
        if (!v37) {
          goto LABEL_4;
        }
        if (v13 != v6[4] || v15 != v37)
        {
          uint64_t v39 = v16;
          uint64_t v40 = v17;
          int v41 = v22;
          char v42 = sub_2486ABF08();
          int v22 = v41;
          uint64_t v17 = v40;
          uint64_t v16 = v39;
          uint64_t v8 = v53;
          uint64_t v7 = v54;
          uint64_t v3 = v55;
          uint64_t v6 = a1;
          if ((v42 & 1) == 0) {
            goto LABEL_4;
          }
        }
      }
      else if (v37)
      {
        goto LABEL_4;
      }
      uint64_t v43 = v6[7];
      if (v17)
      {
        if (!v43) {
          goto LABEL_4;
        }
        if (v16 != v6[6] || v17 != v43)
        {
          int v45 = v22;
          char v46 = sub_2486ABF08();
          int v22 = v45;
          uint64_t v8 = v53;
          uint64_t v7 = v54;
          uint64_t v3 = v55;
          uint64_t v6 = a1;
          if ((v46 & 1) == 0) {
            goto LABEL_4;
          }
        }
      }
      else if (v43)
      {
        goto LABEL_4;
      }
      uint64_t v47 = v6[9];
      if (v20)
      {
        if (!v47) {
          goto LABEL_4;
        }
        if (v18 != v6[8] || v20 != v47)
        {
          int v48 = v22;
          char v49 = sub_2486ABF08();
          int v22 = v48;
          uint64_t v8 = v53;
          uint64_t v7 = v54;
          uint64_t v3 = v55;
          uint64_t v6 = a1;
          if ((v49 & 1) == 0) {
            goto LABEL_4;
          }
        }
      }
      else if (v47)
      {
        goto LABEL_4;
      }
      if (v19 == v6[10] && v21 == v6[11]
        || (v50 = v22, v51 = sub_2486ABF08(), v22 = v50, v8 = v53, v7 = v54, uint64_t v3 = v55, v6 = a1, (v51 & 1) != 0))
      {
        if (v22 == *((unsigned __int8 *)v6 + 96)) {
          return v5;
        }
      }
LABEL_4:
      unint64_t v5 = (v5 + 1) & v7;
    }
    while (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t sub_248689864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2486ABF08() & 1) == 0)
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
      while (!v14 && (sub_2486ABF08() & 1) == 0);
    }
  }
  return v6;
}

void *sub_248689948(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2B8);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 112);
  uint64_t v5 = sub_24868B7B8(&v7, (uint64_t)(v3 + 4), v1, a1);
  swift_bridgeObjectRetain();
  sub_24868D468();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_248689A44(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3)) {
    goto LABEL_21;
  }
  if (!v5) {
    return MEMORY[0x263F8EE78];
  }
  if (v5 <= 0)
  {
    BOOL v11 = (void *)MEMORY[0x263F8EE78];
    if (v4 != a3)
    {
LABEL_10:
      if (v5 < 0) {
        goto LABEL_24;
      }
      uint64_t v14 = *(void *)(type metadata accessor for ATSpotlightDataRecord() - 8);
      uint64_t v15 = (char *)v11 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
      uint64_t v16 = *(void *)(v14 + 72);
      unint64_t v17 = a2 + v16 * a3;
      uint64_t v18 = v16 * v5;
      uint64_t v19 = &v15[v18];
      unint64_t v20 = v17 + v18;
      if (v17 < (unint64_t)v19 && (unint64_t)v15 < v20) {
        goto LABEL_24;
      }
      swift_arrayInitWithCopy();
      return (uint64_t)v11;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D270);
  uint64_t v8 = *(void *)(type metadata accessor for ATSpotlightDataRecord() - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  BOOL v11 = (void *)swift_allocObject();
  size_t v12 = _swift_stdlib_malloc_size(v11);
  if (v9)
  {
    if (v12 - v10 == 0x8000000000000000 && v9 == -1) {
      goto LABEL_23;
    }
    v11[2] = v5;
    v11[3] = 2 * ((uint64_t)(v12 - v10) / v9);
    if (v4 != a3) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_2486ABEB8();
  __break(1u);
  return result;
}

uint64_t sub_248689C84(void *a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_2486ABED8();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_139;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v94 = *v2;
      uint64_t v95 = *v2 + 104;
      uint64_t v96 = -1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        double v98 = *(double *)(v94 + 112 * i + 104);
        uint64_t v99 = v96;
        uint64_t v100 = v95;
        do
        {
          if (*(double *)v100 >= v98) {
            break;
          }
          if (!v94) {
            goto LABEL_143;
          }
          uint64_t v101 = v100 + 8;
          uint64_t v102 = *(void *)(v100 + 88);
          uint64_t v103 = *(void *)(v100 + 96);
          uint64_t result = *(unsigned __int8 *)(v100 + 104);
          long long v104 = *(_OWORD *)(v100 + 8);
          long long v105 = *(_OWORD *)(v100 + 24);
          long long v106 = *(_OWORD *)(v100 + 40);
          long long v107 = *(_OWORD *)(v100 + 56);
          long long v108 = *(_OWORD *)(v100 + 72);
          long long v109 = *(_OWORD *)(v100 - 24);
          *(_OWORD *)(v100 + 72) = *(_OWORD *)(v100 - 40);
          *(_OWORD *)(v100 + 88) = v109;
          *(_OWORD *)(v100 + 104) = *(_OWORD *)(v100 - 8);
          long long v110 = *(_OWORD *)(v100 - 88);
          *(_OWORD *)(v100 + 8) = *(_OWORD *)(v100 - 104);
          *(_OWORD *)(v100 + 24) = v110;
          long long v112 = *(_OWORD *)(v100 - 72);
          long long v111 = *(_OWORD *)(v100 - 56);
          *(_OWORD *)(v100 - 104) = v104;
          *(_OWORD *)(v100 - 88) = v105;
          *(_OWORD *)(v100 - 72) = v106;
          *(_OWORD *)(v100 - 56) = v107;
          *(_OWORD *)(v100 - 40) = v108;
          *(void *)(v100 - 24) = v102;
          *(void *)(v100 - 16) = v103;
          *(unsigned char *)(v100 - 8) = result;
          *(double *)uint64_t v100 = v98;
          v100 -= 112;
          *(_OWORD *)(v101 + 32) = v112;
          *(_OWORD *)(v101 + 48) = v111;
        }
        while (!__CFADD__(v99++, 1));
        v95 += 112;
        --v96;
      }
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
    goto LABEL_148;
  }
  uint64_t v125 = result;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    v133 = (double *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v114 = (char *)MEMORY[0x263F8EE78];
LABEL_105:
      uint64_t v124 = v8;
      if (v11 >= 2)
      {
        uint64_t v115 = *v2;
        do
        {
          unint64_t v116 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_134;
          }
          if (!v115) {
            goto LABEL_147;
          }
          uint64_t v117 = v114;
          uint64_t v118 = *(void *)&v114[16 * v116 + 32];
          uint64_t v119 = *(void *)&v114[16 * v11 + 24];
          sub_24868A49C((double *)(v115 + 112 * v118), (double *)(v115 + 112 * *(void *)&v114[16 * v11 + 16]), v115 + 112 * v119, v133);
          if (v1) {
            break;
          }
          if (v119 < v118) {
            goto LABEL_135;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v117 = sub_2486A14D8((uint64_t)v117);
          }
          if (v116 >= *((void *)v117 + 2)) {
            goto LABEL_136;
          }
          uint64_t v120 = &v117[16 * v116 + 32];
          *(void *)uint64_t v120 = v118;
          *((void *)v120 + 1) = v119;
          unint64_t v121 = *((void *)v117 + 2);
          if (v11 > v121) {
            goto LABEL_137;
          }
          memmove(&v117[16 * v11 + 16], &v117[16 * v11 + 32], 16 * (v121 - v11));
          uint64_t v114 = v117;
          *((void *)v117 + 2) = v121 - 1;
          unint64_t v11 = v121 - 1;
        }
        while (v121 > 2);
      }
LABEL_95:
      swift_bridgeObjectRelease();
      *(void *)(v124 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v124 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2C0);
    uint64_t v7 = sub_2486ABC18();
    *(void *)(v7 + 16) = v6;
    uint64_t v124 = v7;
    v133 = (double *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v123 = v2;
  uint64_t v10 = *v2;
  v134 = (char *)MEMORY[0x263F8EE78];
  uint64_t v126 = v3;
  while (1)
  {
    uint64_t v12 = v9++;
    if (v9 < v3)
    {
      double v13 = *(double *)(v10 + 112 * v9 + 104);
      double v14 = *(double *)(v10 + 112 * v12 + 104);
      uint64_t v9 = v12 + 2;
      if (v12 + 2 < v3)
      {
        uint64_t v15 = (double *)(v10 + 328 + 112 * v12);
        double v16 = v13;
        while (1)
        {
          double v17 = v16;
          double v16 = *v15;
          if (v14 < v13 == v17 >= *v15) {
            break;
          }
          ++v9;
          v15 += 14;
          if (v3 == v9)
          {
            uint64_t v9 = v3;
            break;
          }
        }
      }
      if (v14 < v13)
      {
        if (v9 < v12) {
          goto LABEL_140;
        }
        if (v12 < v9)
        {
          uint64_t v18 = 112 * v9;
          uint64_t v19 = v9;
          uint64_t v20 = v12;
          uint64_t v122 = v12;
          uint64_t v21 = 112 * v12;
          do
          {
            if (v20 != --v19)
            {
              if (!v10) {
                goto LABEL_146;
              }
              uint64_t v22 = v10 + v18;
              uint64_t v23 = *(void *)(v10 + v21 + 80);
              uint64_t v24 = *(void *)(v10 + v21 + 88);
              char v132 = *(unsigned char *)(v10 + v21 + 96);
              uint64_t v25 = *(void *)(v10 + v21 + 104);
              long long v130 = *(_OWORD *)(v10 + v21 + 16);
              long long v131 = *(_OWORD *)(v10 + v21);
              long long v128 = *(_OWORD *)(v10 + v21 + 48);
              long long v129 = *(_OWORD *)(v10 + v21 + 32);
              long long v127 = *(_OWORD *)(v10 + v21 + 64);
              memmove((void *)(v10 + v21), (const void *)(v10 + v18 - 112), 0x70uLL);
              *(_OWORD *)(v22 - 112) = v131;
              *(_OWORD *)(v22 - 96) = v130;
              *(_OWORD *)(v22 - 80) = v129;
              *(_OWORD *)(v22 - 64) = v128;
              *(_OWORD *)(v22 - 48) = v127;
              *(void *)(v22 - 32) = v23;
              *(void *)(v22 - 24) = v24;
              *(unsigned char *)(v22 - 16) = v132;
              *(void *)(v22 - 8) = v25;
            }
            ++v20;
            v18 -= 112;
            v21 += 112;
          }
          while (v20 < v19);
          uint64_t v3 = v126;
          uint64_t v12 = v122;
        }
      }
    }
    if (v9 >= v3) {
      goto LABEL_39;
    }
    if (__OFSUB__(v9, v12)) {
      goto LABEL_138;
    }
    if (v9 - v12 >= v125) {
      goto LABEL_39;
    }
    uint64_t v26 = v12 + v125;
    if (__OFADD__(v12, v125)) {
      goto LABEL_141;
    }
    if (v26 >= v3) {
      uint64_t v26 = v3;
    }
    if (v26 < v12) {
      break;
    }
    if (v9 != v26)
    {
      uint64_t v77 = v10 - 8 + 112 * v9;
      uint64_t v27 = v134;
      do
      {
        double v78 = *(double *)(v10 + 112 * v9 + 104);
        uint64_t v79 = v12;
        uint64_t v80 = v77;
        do
        {
          if (*(double *)v80 >= v78) {
            break;
          }
          if (!v10) {
            goto LABEL_144;
          }
          uint64_t v81 = v80 + 8;
          uint64_t v82 = *(void *)(v80 + 88);
          uint64_t v83 = *(void *)(v80 + 96);
          char v84 = *(unsigned char *)(v80 + 104);
          long long v85 = *(_OWORD *)(v80 + 8);
          long long v86 = *(_OWORD *)(v80 + 24);
          long long v87 = *(_OWORD *)(v80 + 40);
          long long v88 = *(_OWORD *)(v80 + 56);
          long long v89 = *(_OWORD *)(v80 + 72);
          long long v90 = *(_OWORD *)(v80 - 24);
          *(_OWORD *)(v80 + 72) = *(_OWORD *)(v80 - 40);
          *(_OWORD *)(v80 + 88) = v90;
          *(_OWORD *)(v80 + 104) = *(_OWORD *)(v80 - 8);
          long long v91 = *(_OWORD *)(v80 - 88);
          *(_OWORD *)(v80 + 8) = *(_OWORD *)(v80 - 104);
          *(_OWORD *)(v80 + 24) = v91;
          long long v93 = *(_OWORD *)(v80 - 72);
          long long v92 = *(_OWORD *)(v80 - 56);
          *(_OWORD *)(v80 - 104) = v85;
          *(_OWORD *)(v80 - 88) = v86;
          *(_OWORD *)(v80 - 72) = v87;
          *(_OWORD *)(v80 - 56) = v88;
          *(_OWORD *)(v80 - 40) = v89;
          *(void *)(v80 - 24) = v82;
          *(void *)(v80 - 16) = v83;
          *(unsigned char *)(v80 - 8) = v84;
          *(double *)uint64_t v80 = v78;
          v80 -= 112;
          ++v79;
          *(_OWORD *)(v81 + 32) = v93;
          *(_OWORD *)(v81 + 48) = v92;
        }
        while (v9 != v79);
        ++v9;
        v77 += 112;
      }
      while (v9 != v26);
      uint64_t v9 = v26;
      if (v26 < v12) {
        goto LABEL_133;
      }
      goto LABEL_40;
    }
LABEL_39:
    uint64_t v27 = v134;
    if (v9 < v12) {
      goto LABEL_133;
    }
LABEL_40:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v27 = sub_2486A11C8(0, *((void *)v27 + 2) + 1, 1, v27);
    }
    unint64_t v29 = *((void *)v27 + 2);
    unint64_t v28 = *((void *)v27 + 3);
    unint64_t v11 = v29 + 1;
    if (v29 >= v28 >> 1) {
      uint64_t v27 = sub_2486A11C8((char *)(v28 > 1), v29 + 1, 1, v27);
    }
    *((void *)v27 + 2) = v11;
    uint64_t v30 = v27 + 32;
    char v31 = &v27[16 * v29 + 32];
    *(void *)char v31 = v12;
    *((void *)v31 + 1) = v9;
    v134 = v27;
    if (v29)
    {
      while (1)
      {
        unint64_t v32 = v11 - 1;
        if (v11 >= 4)
        {
          uint64_t v37 = &v30[16 * v11];
          uint64_t v38 = *((void *)v37 - 8);
          uint64_t v39 = *((void *)v37 - 7);
          BOOL v43 = __OFSUB__(v39, v38);
          uint64_t v40 = v39 - v38;
          if (v43) {
            goto LABEL_122;
          }
          uint64_t v42 = *((void *)v37 - 6);
          uint64_t v41 = *((void *)v37 - 5);
          BOOL v43 = __OFSUB__(v41, v42);
          uint64_t v35 = v41 - v42;
          char v36 = v43;
          if (v43) {
            goto LABEL_123;
          }
          unint64_t v44 = v11 - 2;
          int v45 = &v30[16 * v11 - 32];
          uint64_t v47 = *(void *)v45;
          uint64_t v46 = *((void *)v45 + 1);
          BOOL v43 = __OFSUB__(v46, v47);
          uint64_t v48 = v46 - v47;
          if (v43) {
            goto LABEL_125;
          }
          BOOL v43 = __OFADD__(v35, v48);
          uint64_t v49 = v35 + v48;
          if (v43) {
            goto LABEL_128;
          }
          if (v49 >= v40)
          {
            char v67 = &v30[16 * v32];
            uint64_t v69 = *(void *)v67;
            uint64_t v68 = *((void *)v67 + 1);
            BOOL v43 = __OFSUB__(v68, v69);
            uint64_t v70 = v68 - v69;
            if (v43) {
              goto LABEL_132;
            }
            BOOL v60 = v35 < v70;
            goto LABEL_76;
          }
        }
        else
        {
          if (v11 != 3)
          {
            uint64_t v61 = *((void *)v27 + 4);
            uint64_t v62 = *((void *)v27 + 5);
            BOOL v43 = __OFSUB__(v62, v61);
            uint64_t v54 = v62 - v61;
            char v55 = v43;
            goto LABEL_70;
          }
          uint64_t v34 = *((void *)v27 + 4);
          uint64_t v33 = *((void *)v27 + 5);
          BOOL v43 = __OFSUB__(v33, v34);
          uint64_t v35 = v33 - v34;
          char v36 = v43;
        }
        if (v36) {
          goto LABEL_124;
        }
        unint64_t v44 = v11 - 2;
        int v50 = &v30[16 * v11 - 32];
        uint64_t v52 = *(void *)v50;
        uint64_t v51 = *((void *)v50 + 1);
        BOOL v53 = __OFSUB__(v51, v52);
        uint64_t v54 = v51 - v52;
        char v55 = v53;
        if (v53) {
          goto LABEL_127;
        }
        uint64_t v56 = &v30[16 * v32];
        uint64_t v58 = *(void *)v56;
        uint64_t v57 = *((void *)v56 + 1);
        BOOL v43 = __OFSUB__(v57, v58);
        uint64_t v59 = v57 - v58;
        if (v43) {
          goto LABEL_130;
        }
        if (__OFADD__(v54, v59)) {
          goto LABEL_131;
        }
        if (v54 + v59 >= v35)
        {
          BOOL v60 = v35 < v59;
LABEL_76:
          if (v60) {
            unint64_t v32 = v44;
          }
          goto LABEL_78;
        }
LABEL_70:
        if (v55) {
          goto LABEL_126;
        }
        unsigned __int8 v63 = &v30[16 * v32];
        uint64_t v65 = *(void *)v63;
        uint64_t v64 = *((void *)v63 + 1);
        BOOL v43 = __OFSUB__(v64, v65);
        uint64_t v66 = v64 - v65;
        if (v43) {
          goto LABEL_129;
        }
        if (v66 < v54) {
          goto LABEL_15;
        }
LABEL_78:
        unint64_t v71 = v32 - 1;
        if (v32 - 1 >= v11)
        {
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
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
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
          goto LABEL_142;
        }
        if (!v10) {
          goto LABEL_145;
        }
        uint64_t v72 = &v30[16 * v71];
        uint64_t v73 = *(void *)v72;
        uint64_t v74 = &v30[16 * v32];
        uint64_t v75 = *((void *)v74 + 1);
        sub_24868A49C((double *)(v10 + 112 * *(void *)v72), (double *)(v10 + 112 * *(void *)v74), v10 + 112 * v75, v133);
        if (v1) {
          goto LABEL_95;
        }
        if (v75 < v73) {
          goto LABEL_119;
        }
        if (v32 > *((void *)v134 + 2)) {
          goto LABEL_120;
        }
        *(void *)uint64_t v72 = v73;
        *(void *)&v30[16 * v71 + 8] = v75;
        unint64_t v76 = *((void *)v134 + 2);
        if (v32 >= v76) {
          goto LABEL_121;
        }
        uint64_t v27 = v134;
        unint64_t v11 = v76 - 1;
        memmove(&v30[16 * v32], v74 + 16, 16 * (v76 - 1 - v32));
        *((void *)v134 + 2) = v76 - 1;
        if (v76 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v11 = 1;
LABEL_15:
    uint64_t v3 = v126;
    if (v9 >= v126)
    {
      uint64_t v8 = v124;
      uint64_t v114 = v134;
      uint64_t v2 = v123;
      goto LABEL_105;
    }
  }
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
  uint64_t result = sub_2486ABE58();
  __break(1u);
  return result;
}

uint64_t sub_24868A49C(double *__dst, double *__src, unint64_t a3, double *a4)
{
  unint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = (char *)__src - (char *)__dst;
  int64_t v9 = ((char *)__src - (char *)__dst) / 112;
  uint64_t v10 = a3 - (void)__src;
  uint64_t v11 = (uint64_t)(a3 - (void)__src) / 112;
  uint64_t v23 = __dst;
  uint64_t v22 = a4;
  if (v9 >= v11)
  {
    if (v10 >= -111)
    {
      if (a4 != __src || &__src[14 * v11] <= a4) {
        memmove(a4, __src, 112 * v11);
      }
      double v16 = &v4[14 * v11];
      uint64_t v21 = (char *)v16;
      uint64_t v23 = v6;
      if (v7 < v6 && v10 >= 112)
      {
        double v17 = (double *)(a3 - 112);
        do
        {
          uint64_t v18 = v17 + 14;
          if (*(v6 - 1) >= *(v16 - 1))
          {
            uint64_t v21 = (char *)(v16 - 14);
            if (v18 < v16 || v17 >= v16 || v18 != v16) {
              memmove(v17, v16 - 14, 0x70uLL);
            }
            uint64_t v19 = v6;
            v16 -= 14;
            if (v6 <= v7) {
              break;
            }
          }
          else
          {
            uint64_t v19 = v6 - 14;
            if (v18 != v6 || v17 >= v6) {
              memmove(v17, v6 - 14, 0x70uLL);
            }
            uint64_t v23 = v6 - 14;
            if (v19 <= v7) {
              break;
            }
          }
          v17 -= 14;
          uint64_t v6 = v19;
        }
        while (v16 > v4);
      }
LABEL_40:
      sub_2486A12C4((void **)&v23, (const void **)&v22, &v21);
      return 1;
    }
  }
  else if (v8 >= -111)
  {
    if (a4 != __dst || &__dst[14 * v9] <= a4) {
      memmove(a4, __dst, 112 * v9);
    }
    uint64_t v12 = &v4[14 * v9];
    uint64_t v21 = (char *)v12;
    if ((unint64_t)v6 < a3 && v8 >= 112)
    {
      double v13 = v4;
      while (1)
      {
        if (v13[13] >= v6[13])
        {
          unint64_t v4 = v13 + 14;
          uint64_t v15 = v13;
          double v14 = v6;
          if (v7 == v13)
          {
            v13 += 14;
            if (v7 < v4) {
              goto LABEL_18;
            }
          }
          else
          {
            v13 += 14;
          }
        }
        else
        {
          double v14 = v6 + 14;
          uint64_t v15 = v6;
          if (v7 == v6 && v7 < v14) {
            goto LABEL_18;
          }
        }
        memmove(v7, v15, 0x70uLL);
LABEL_18:
        v7 += 14;
        if (v13 < v12)
        {
          uint64_t v6 = v14;
          if ((unint64_t)v14 < a3) {
            continue;
          }
        }
        uint64_t v22 = v4;
        uint64_t v23 = v7;
        goto LABEL_40;
      }
    }
    goto LABEL_40;
  }
  uint64_t result = sub_2486ABEB8();
  __break(1u);
  return result;
}

unint64_t sub_24868A75C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2A0);
  uint64_t v6 = sub_2486ABE98();
  uint64_t v7 = (void *)v6;
  if (*(void *)(v5 + 16))
  {
    char v31 = v2;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v33 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v32 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v39 = v6 + 64;
    unint64_t result = swift_retain();
    for (int64_t i = 0; ; int64_t i = v40)
    {
      if (v10)
      {
        unint64_t v14 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = i;
        unint64_t v15 = v14 | (i << 6);
      }
      else
      {
        int64_t v16 = i + 1;
        if (__OFADD__(i, 1))
        {
          __break(1u);
LABEL_30:
          __break(1u);
          return result;
        }
        if (v16 >= v32) {
          goto LABEL_23;
        }
        unint64_t v17 = v33[v16];
        int64_t v18 = i + 1;
        if (!v17)
        {
          int64_t v18 = i + 2;
          if (i + 2 >= v32) {
            goto LABEL_23;
          }
          unint64_t v17 = v33[v18];
          if (!v17)
          {
            uint64_t v19 = i + 3;
            if (i + 3 >= v32)
            {
LABEL_23:
              swift_release();
              uint64_t v3 = v31;
              if (a2)
              {
                uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
                if (v30 > 63) {
                  bzero(v33, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v33 = -1 << v30;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v17 = v33[v19];
            if (!v17)
            {
              while (1)
              {
                int64_t v18 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_30;
                }
                if (v18 >= v32) {
                  goto LABEL_23;
                }
                unint64_t v17 = v33[v18];
                ++v19;
                if (v17) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v18 = i + 3;
          }
        }
LABEL_20:
        unint64_t v10 = (v17 - 1) & v17;
        int64_t v40 = v18;
        unint64_t v15 = __clz(__rbit64(v17)) + (v18 << 6);
      }
      uint64_t v20 = *(void *)(v5 + 48) + 104 * v15;
      uint64_t v21 = *(void *)v20;
      long long v22 = *(_OWORD *)(v20 + 8);
      long long v23 = *(_OWORD *)(v20 + 24);
      long long v24 = *(_OWORD *)(v20 + 40);
      long long v25 = *(_OWORD *)(v20 + 56);
      long long v26 = *(_OWORD *)(v20 + 72);
      uint64_t v27 = *(void *)(v20 + 88);
      char v28 = *(unsigned char *)(v20 + 96);
      uint64_t v29 = *(void *)(*(void *)(v5 + 56) + 8 * v15);
      if ((a2 & 1) == 0)
      {
        long long v37 = *(_OWORD *)(v20 + 56);
        long long v38 = *(_OWORD *)(v20 + 72);
        long long v35 = *(_OWORD *)(v20 + 24);
        long long v36 = *(_OWORD *)(v20 + 40);
        long long v34 = *(_OWORD *)(v20 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        long long v22 = v34;
        long long v23 = v35;
        long long v24 = v36;
        long long v25 = v37;
        long long v26 = v38;
      }
      *(void *)uint64_t v41 = v21;
      *(_OWORD *)&v41[8] = v22;
      *(_OWORD *)&v41[24] = v23;
      *(_OWORD *)&v41[40] = v24;
      *(_OWORD *)&v41[56] = v25;
      *(_OWORD *)&v41[72] = v26;
      *(void *)&v41[88] = v27;
      sub_2486ABFA8();
      ATBiomeMediaItem.hash(into:)();
      sub_2486ABFD8();
      unint64_t result = sub_2486ABD38();
      *(void *)(v39 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
      uint64_t v13 = v7[6] + 104 * result;
      *(_OWORD *)(v13 + 64) = *(_OWORD *)&v41[64];
      *(_OWORD *)(v13 + 80) = *(_OWORD *)&v41[80];
      *(unsigned char *)(v13 + 96) = v28;
      *(_OWORD *)uint64_t v13 = *(_OWORD *)v41;
      *(_OWORD *)(v13 + 16) = *(_OWORD *)&v41[16];
      *(_OWORD *)(v13 + 32) = *(_OWORD *)&v41[32];
      *(_OWORD *)(v13 + 48) = *(_OWORD *)&v41[48];
      *(void *)(v7[7] + 8 * result) = v29;
      ++v7[2];
    }
  }
  unint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24868AAC0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D298);
  char v36 = a2;
  uint64_t v6 = sub_2486ABE98();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34) {
      break;
    }
    long long v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2486ABFA8();
    sub_2486ABB98();
    uint64_t result = sub_2486ABFD8();
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
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  long long v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *long long v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_24868ADD8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2A0);
  uint64_t v29 = v0;
  uint64_t v1 = *v0;
  uint64_t v2 = sub_2486ABE88();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v29 = v3;
    return result;
  }
  uint64_t result = (void *)(v2 + 64);
  unint64_t v5 = (unint64_t)((1 << *(unsigned char *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v5) {
    uint64_t result = memmove(result, (const void *)(v1 + 64), 8 * v5);
  }
  uint64_t v30 = v1 + 64;
  int64_t v7 = 0;
  *(void *)(v3 + 16) = *(void *)(v1 + 16);
  uint64_t v8 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(v1 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      unint64_t v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v13 = v12 | (v7 << 6);
      goto LABEL_12;
    }
    int64_t v26 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v11) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v30 + 8 * v26);
    ++v7;
    if (!v27)
    {
      int64_t v7 = v26 + 1;
      if (v26 + 1 >= v11) {
        goto LABEL_26;
      }
      unint64_t v27 = *(void *)(v30 + 8 * v7);
      if (!v27) {
        break;
      }
    }
LABEL_25:
    unint64_t v10 = (v27 - 1) & v27;
    unint64_t v13 = __clz(__rbit64(v27)) + (v7 << 6);
LABEL_12:
    uint64_t v14 = 104 * v13;
    uint64_t v15 = *(void *)(v1 + 48) + 104 * v13;
    uint64_t v16 = *(void *)(v15 + 88);
    char v17 = *(unsigned char *)(v15 + 96);
    uint64_t v18 = 8 * v13;
    uint64_t v19 = *(void *)(*(void *)(v1 + 56) + v18);
    uint64_t v20 = *(void *)(v3 + 48) + v14;
    long long v21 = *(_OWORD *)(v15 + 8);
    long long v22 = *(_OWORD *)(v15 + 24);
    long long v23 = *(_OWORD *)(v15 + 40);
    long long v24 = *(_OWORD *)(v15 + 56);
    long long v25 = *(_OWORD *)(v15 + 72);
    *(void *)uint64_t v20 = *(void *)v15;
    *(_OWORD *)(v20 + 8) = v21;
    *(_OWORD *)(v20 + 24) = v22;
    *(_OWORD *)(v20 + 40) = v23;
    *(_OWORD *)(v20 + 56) = v24;
    *(_OWORD *)(v20 + 72) = v25;
    *(void *)(v20 + 88) = v16;
    *(unsigned char *)(v20 + 96) = v17;
    *(void *)(*(void *)(v3 + 56) + v18) = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v11) {
    goto LABEL_26;
  }
  unint64_t v27 = *(void *)(v30 + 8 * v28);
  if (v27)
  {
    int64_t v7 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v7 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v7 >= v11) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v30 + 8 * v7);
    ++v28;
    if (v27) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24868B020()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D298);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2486ABE88();
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    long long v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24868B1D8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24868B25C(a1, a2, a3, (void *)*v3, &qword_26931D2A8, &qword_26931D2B0);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_24868B208(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24868B40C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24868B228(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24868B578(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_24868B248(char a1, int64_t a2, char a3, void *a4)
{
  return sub_24868B25C(a1, a2, a3, a4, &qword_26931D2B8, &qword_26931D2C0);
}

uint64_t sub_24868B25C(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    int64_t v13 = (void *)swift_allocObject();
    size_t v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 112);
  }
  else
  {
    int64_t v13 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v15 = (unint64_t)(v13 + 4);
  unint64_t v16 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v13 != a4 || v15 >= v16 + 112 * v11) {
      memmove(v13 + 4, a4 + 4, 112 * v11);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= v15 + 112 * v11 || v15 >= v16 + 112 * v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_30:
  uint64_t result = sub_2486ABEB8();
  __break(1u);
  return result;
}

uint64_t sub_24868B40C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D290);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
  uint64_t result = sub_2486ABEB8();
  __break(1u);
  return result;
}

uint64_t sub_24868B578(char a1, int64_t a2, char a3, void *a4)
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
    int64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D270);
  uint64_t v10 = *(void *)(type metadata accessor for ATSpotlightDataRecord() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  int64_t v13 = (void *)swift_allocObject();
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
  uint64_t v16 = *(void *)(type metadata accessor for ATSpotlightDataRecord() - 8);
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
  long long v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_2486ABEB8();
  __break(1u);
  return result;
}

void *sub_24868B7B8(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a4 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(a4 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v9 = 0;
    uint64_t v7 = 0;
LABEL_39:
    *uint64_t result = a4;
    result[1] = v28;
    result[2] = ~v4;
    result[3] = v9;
    result[4] = v6;
    return (void *)v7;
  }
  uint64_t v7 = a3;
  if (!a3)
  {
    int64_t v9 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v8 = a2;
  uint64_t v25 = -1 << *(unsigned char *)(a4 + 32);
  int64_t v26 = result;
  int64_t v9 = 0;
  uint64_t v10 = 0;
  int64_t v27 = (unint64_t)(63 - v4) >> 6;
  if (!v6) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v11 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v12 = v11 | (v9 << 6);
  while (1)
  {
    ++v10;
    uint64_t v16 = *(void *)(a4 + 48) + 104 * v12;
    uint64_t v17 = *(void *)(v16 + 88);
    char v18 = *(unsigned char *)(v16 + 96);
    uint64_t v19 = *(void *)(*(void *)(a4 + 56) + 8 * v12);
    long long v20 = *(_OWORD *)(v16 + 8);
    long long v21 = *(_OWORD *)(v16 + 24);
    long long v22 = *(_OWORD *)(v16 + 40);
    long long v23 = *(_OWORD *)(v16 + 56);
    long long v24 = *(_OWORD *)(v16 + 72);
    *(void *)uint64_t v8 = *(void *)v16;
    *(_OWORD *)(v8 + 8) = v20;
    *(_OWORD *)(v8 + 24) = v21;
    *(_OWORD *)(v8 + 40) = v22;
    *(_OWORD *)(v8 + 56) = v23;
    *(_OWORD *)(v8 + 72) = v24;
    *(void *)(v8 + 88) = v17;
    *(unsigned char *)(v8 + 96) = v18;
    *(void *)(v8 + 104) = v19;
    if (v10 == v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v8 += 112;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v6) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v13 = v9 + 1;
    if (__OFADD__(v9, 1)) {
      break;
    }
    if (v13 >= v27) {
      goto LABEL_33;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    if (!v14)
    {
      v9 += 2;
      if (v13 + 1 >= v27)
      {
        unint64_t v6 = 0;
        int64_t v9 = v13;
      }
      else
      {
        unint64_t v14 = *(void *)(v28 + 8 * v9);
        if (v14) {
          goto LABEL_14;
        }
        int64_t v15 = v13 + 2;
        if (v13 + 2 >= v27) {
          goto LABEL_33;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (v14)
        {
LABEL_17:
          int64_t v13 = v15;
          goto LABEL_18;
        }
        int64_t v9 = v13 + 3;
        if (v13 + 3 < v27)
        {
          unint64_t v14 = *(void *)(v28 + 8 * v9);
          if (v14)
          {
LABEL_14:
            int64_t v13 = v9;
            goto LABEL_18;
          }
          int64_t v15 = v13 + 4;
          if (v13 + 4 >= v27)
          {
LABEL_33:
            unint64_t v6 = 0;
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14)
          {
            while (1)
            {
              int64_t v13 = v15 + 1;
              if (__OFADD__(v15, 1)) {
                goto LABEL_42;
              }
              if (v13 >= v27)
              {
                unint64_t v6 = 0;
                int64_t v9 = v27 - 1;
                goto LABEL_37;
              }
              unint64_t v14 = *(void *)(v28 + 8 * v13);
              ++v15;
              if (v14) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v6 = 0;
        int64_t v9 = v13 + 2;
      }
LABEL_37:
      uint64_t v7 = v10;
LABEL_38:
      uint64_t v4 = v25;
      uint64_t result = v26;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v13 << 6);
    int64_t v9 = v13;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_24868BAB8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v18 = result;
  BOOL v20 = a12 == 0x6C7070612E6D6F63 && a13 == 0xEF636973754D2E65;
  if (v20
    || (uint64_t result = sub_2486ABF08(), (result & 1) != 0)
    || a12 == 0xD000000000000029 && a13 == 0x80000002486AD270)
  {
    if (!a2)
    {
      if (a12 != 0xD000000000000012 || a13 != 0x80000002486AD2A0)
      {
        sub_2486ABF08();
        if (a12 != 0xD000000000000010 || a13 != 0x80000002486AD2C0)
        {
          uint64_t result = sub_2486ABF08();
          if (a12 == 0x6C7070612E6D6F63 && a13 == 0xEC00000076742E65) {
            goto LABEL_72;
          }
        }
        goto LABEL_52;
      }
      goto LABEL_36;
    }
  }
  else
  {
    uint64_t result = sub_2486ABF08();
    if ((result & 1) == 0 || !a2)
    {
LABEL_33:
      if (a12 != 0xD000000000000012 || a13 != 0x80000002486AD2A0)
      {
LABEL_37:
        uint64_t result = sub_2486ABF08();
        if ((result & 1) == 0 || !a2)
        {
LABEL_49:
          if (a12 != 0xD000000000000010 || a13 != 0x80000002486AD2C0)
          {
LABEL_53:
            uint64_t result = sub_2486ABF08();
            if ((result & 1) == 0 || !a2) {
              goto LABEL_65;
            }
            goto LABEL_55;
          }
          if (a2)
          {
LABEL_55:
            if (!v18 && a2 == 0xE000000000000000)
            {
              if (a12 == 0x6C7070612E6D6F63 && a13 == 0xEC00000076742E65) {
                goto LABEL_69;
              }
              goto LABEL_67;
            }
            uint64_t result = sub_2486ABF08();
            if ((result & 1) == 0 && a4 && (a3 || a4 != 0xE000000000000000))
            {
              uint64_t result = sub_2486ABF08();
              if ((result & 1) == 0)
              {
                char v21 = 2;
                goto LABEL_73;
              }
            }
LABEL_65:
            if (a12 == 0x6C7070612E6D6F63 && a13 == 0xEC00000076742E65)
            {
LABEL_68:
              if (a2)
              {
LABEL_69:
                if (v18 || a2 != 0xE000000000000000)
                {
                  uint64_t result = sub_2486ABF08();
                  if ((result & 1) == 0)
                  {
                    char v21 = 3;
                    goto LABEL_73;
                  }
                }
              }
LABEL_72:
              char v21 = 4;
              goto LABEL_73;
            }
LABEL_67:
            uint64_t result = sub_2486ABF08();
            if ((result & 1) == 0) {
              goto LABEL_72;
            }
            goto LABEL_68;
          }
LABEL_52:
          uint64_t result = sub_2486ABF08();
          goto LABEL_72;
        }
LABEL_39:
        if (!v18 && a2 == 0xE000000000000000)
        {
          if (a12 != 0xD000000000000010 || a13 != 0x80000002486AD2C0) {
            goto LABEL_53;
          }
          goto LABEL_55;
        }
        uint64_t result = sub_2486ABF08();
        if ((result & 1) == 0 && a4 && (a3 || a4 != 0xE000000000000000))
        {
          uint64_t result = sub_2486ABF08();
          if ((result & 1) == 0)
          {
            char v21 = 1;
            goto LABEL_73;
          }
        }
        goto LABEL_49;
      }
      if (a2) {
        goto LABEL_39;
      }
LABEL_36:
      sub_2486ABF08();
      goto LABEL_52;
    }
  }
  if (!v18 && a2 == 0xE000000000000000)
  {
    if (a12 == 0xD000000000000012 && a13 == 0x80000002486AD2A0) {
      goto LABEL_39;
    }
    goto LABEL_37;
  }
  uint64_t result = sub_2486ABF08();
  if ((result & 1) != 0 || !a4 || !a3 && a4 == 0xE000000000000000) {
    goto LABEL_33;
  }
  uint64_t result = sub_2486ABF08();
  if ((result & 1) != 0 || !a6 || !a5 && a6 == 0xE000000000000000) {
    goto LABEL_33;
  }
  uint64_t result = sub_2486ABF08();
  char v21 = 0;
  if (result) {
    goto LABEL_33;
  }
LABEL_73:
  *(void *)a9 = v18;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(void *)(a9 + 64) = a10;
  *(void *)(a9 + 72) = a11;
  *(void *)(a9 + 80) = a12;
  *(void *)(a9 + 88) = a13;
  *(unsigned char *)(a9 + 96) = v21;
  return result;
}

BOOL _s15ArchetypeEngine16ATBiomeMediaItemV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    if (!v5) {
      return 0;
    }
    if (*(void *)a1 != *(void *)a2 || v4 != v5)
    {
      char v7 = sub_2486ABF08();
      BOOL result = 0;
      if ((v7 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v5)
  {
    return 0;
  }
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a2 + 24);
  if (v9)
  {
    if (!v10) {
      return 0;
    }
    if (*(void *)(a1 + 16) != *(void *)(a2 + 16) || v9 != v10)
    {
      char v11 = sub_2486ABF08();
      BOOL result = 0;
      if ((v11 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v10)
  {
    return 0;
  }
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a2 + 40);
  if (v12)
  {
    if (!v13) {
      return 0;
    }
    if (*(void *)(a1 + 32) != *(void *)(a2 + 32) || v12 != v13)
    {
      char v14 = sub_2486ABF08();
      BOOL result = 0;
      if ((v14 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v13)
  {
    return 0;
  }
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = *(void *)(a2 + 56);
  if (v15)
  {
    if (!v16) {
      return 0;
    }
    if (*(void *)(a1 + 48) != *(void *)(a2 + 48) || v15 != v16)
    {
      char v17 = sub_2486ABF08();
      BOOL result = 0;
      if ((v17 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v16)
  {
    return 0;
  }
  uint64_t v18 = *(void *)(a1 + 72);
  uint64_t v19 = *(void *)(a2 + 72);
  if (v18)
  {
    if (v19)
    {
      if (*(void *)(a1 + 64) != *(void *)(a2 + 64) || v18 != v19)
      {
        char v20 = sub_2486ABF08();
        BOOL result = 0;
        if ((v20 & 1) == 0) {
          return result;
        }
      }
      goto LABEL_40;
    }
    return 0;
  }
  if (v19) {
    return 0;
  }
LABEL_40:
  if (*(void *)(a1 + 80) == *(void *)(a2 + 80) && *(void *)(a1 + 88) == *(void *)(a2 + 88)) {
    return *(unsigned __int8 *)(a1 + 96) == *(unsigned __int8 *)(a2 + 96);
  }
  char v21 = sub_2486ABF08();
  BOOL result = 0;
  if (v21) {
    return *(unsigned __int8 *)(a1 + 96) == *(unsigned __int8 *)(a2 + 96);
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

uint64_t sub_24868C238()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
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

uint64_t sub_24868C288()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24868C2C8(void *a1)
{
  return sub_248687864(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24868C2D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24868C338(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 112 * a1 + 32;
    unint64_t v6 = a3 + 112 * v4;
    if (v5 >= v6 || v5 + 112 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2B0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2486ABEB8();
  __break(1u);
  return result;
}

void sub_24868C448(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int64_t v3 = a3 >> 1;
  uint64_t v4 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2)) {
    goto LABEL_11;
  }
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2B8);
    unint64_t v6 = (void *)swift_allocObject();
    size_t v7 = _swift_stdlib_malloc_size(v6);
    v6[2] = v4;
    v6[3] = 2 * ((uint64_t)(v7 - 32) / 112);
    if (v3 >= a2) {
      goto LABEL_4;
    }
    goto LABEL_10;
  }
  unint64_t v6 = (void *)MEMORY[0x263F8EE78];
  if (v3 < a2)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
LABEL_4:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2C0);
  swift_arrayInitWithCopy();
  if (__OFSUB__(0, a2))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v8 = v6[2];
  BOOL v9 = __OFADD__(a2, v8);
  uint64_t v10 = a2 + v8;
  if (v9)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v10 < a2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v10 < 0) {
LABEL_15:
  }
    __break(1u);
}

unint64_t sub_24868C574()
{
  unint64_t result = qword_26931D258;
  if (!qword_26931D258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931D258);
  }
  return result;
}

unint64_t sub_24868C5CC()
{
  unint64_t result = qword_26931D260;
  if (!qword_26931D260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931D260);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ATBiomeMediaType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ATBiomeMediaType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x24868C78CLL);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_24868C7B4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24868C7BC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ATBiomeMediaType()
{
  return &type metadata for ATBiomeMediaType;
}

uint64_t initializeBufferWithCopyOfBuffer for ATBiomeMediaItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ATBiomeMediaItem()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ATBiomeMediaItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ATBiomeMediaItem(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  return a1;
}

__n128 __swift_memcpy97_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(unsigned char *)(a1 + 96) = *((unsigned char *)a2 + 96);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for ATBiomeMediaItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  return a1;
}

uint64_t getEnumTagSinglePayload for ATBiomeMediaItem(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 97)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 88);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ATBiomeMediaItem(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 96) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 97) = 1;
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
      *(void *)(result + 88) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 97) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ATBiomeMediaItem()
{
  return &type metadata for ATBiomeMediaItem;
}

uint64_t type metadata accessor for ATBiomeDataRetriever()
{
  return self;
}

void type metadata accessor for BMMediaNowPlayingPlaybackState()
{
  if (!qword_26931D268)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26931D268);
    }
  }
}

uint64_t sub_24868CBE4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 112 * a1 + 32;
    unint64_t v6 = a3 + 112 * v4;
    if (v5 >= v6 || v5 + 112 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2486ABEB8();
  __break(1u);
  return result;
}

uint64_t sub_24868CCDC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26931D248) - 8);
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
  uint64_t result = sub_2486ABEB8();
  __break(1u);
  return result;
}

uint64_t sub_24868CE38(uint64_t result, unint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = a2;
    uint64_t v3 = result;
    unint64_t v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_2486ABE68();
  uint64_t result = swift_bridgeObjectRelease();
LABEL_4:
  if (v5 >= v3) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v5 < 0) {
    uint64_t v6 = v3;
  }
  if (v3) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2486ABE68();
    uint64_t result = swift_bridgeObjectRelease();
    if (v9 < 0)
    {
LABEL_28:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_2486ABE68();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 < v7)
  {
    __break(1u);
    goto LABEL_28;
  }
  if ((v2 & 0xC000000000000001) != 0 && v7)
  {
    sub_24868CFDC(0, &qword_26931D278);
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = v10 + 1;
      sub_2486ABDB8();
      uint64_t v10 = v11;
    }
    while (v7 != v11);
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_2486ABE78();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  return v12;
}

uint64_t sub_24868CFDC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24868D018(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_2486ABEB8();
  __break(1u);
  return result;
}

uint64_t sub_24868D10C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + (a1 << 7) + 32;
    unint64_t v6 = a3 + (v4 << 7);
    if (v5 >= v6 || v5 + (v4 << 7) <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2486ABEB8();
  __break(1u);
  return result;
}

uint64_t sub_24868D200(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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
  uint64_t result = sub_2486ABEB8();
  __break(1u);
  return result;
}

uint64_t sub_24868D35C(uint64_t a1)
{
  return a1;
}

uint64_t sub_24868D3B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24868D40C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24868D468()
{
  return swift_release();
}

uint64_t sub_24868D470(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24868D4CC(uint64_t a1)
{
  return a1;
}

uint64_t sub_24868D544(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t destroy for ATBiomeMediaRecord()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ATBiomeMediaRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ATBiomeMediaRecord(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy112_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t assignWithTake for ATBiomeMediaRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ATBiomeMediaRecord(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 112)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 88);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ATBiomeMediaRecord(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
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
      *(void *)(result + 88) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ATBiomeMediaRecord()
{
  return &type metadata for ATBiomeMediaRecord;
}

unint64_t ATAccessibilityError.errorDescription.getter(uint64_t a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 1:
      sub_2486ABD98();
      swift_bridgeObjectRelease();
      unint64_t v9 = 0xD000000000000025;
      goto LABEL_8;
    case 2:
      sub_2486ABD98();
      swift_bridgeObjectRelease();
      unint64_t v9 = 0xD000000000000020;
      goto LABEL_8;
    case 3:
      sub_2486ABD98();
      swift_bridgeObjectRelease();
      unint64_t v9 = 0xD00000000000001DLL;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2F8);
      uint64_t v5 = swift_allocObject();
      uint64_t v6 = MEMORY[0x263F8E970];
      *(_OWORD *)(v5 + 16) = xmmword_2486AC710;
      uint64_t v7 = MEMORY[0x263F8E9C0];
      *(void *)(v5 + 56) = v6;
      *(void *)(v5 + 64) = v7;
      *(void *)(v5 + 32) = a1;
      sub_2486ABB78();
      goto LABEL_9;
    case 4:
      sub_2486ABD98();
      swift_bridgeObjectRelease();
      unint64_t v9 = 0xD00000000000001FLL;
LABEL_8:
      sub_2486ABEE8();
LABEL_9:
      sub_2486ABBB8();
      swift_bridgeObjectRelease();
      return v9;
    case 5:
      sub_2486ABD98();
      swift_bridgeObjectRelease();
      unint64_t v4 = 0xD000000000000024;
      goto LABEL_11;
    case 6:
      swift_bridgeObjectRetain();
      return a1;
    case 7:
      unint64_t result = 0xD000000000000023;
      switch(a1)
      {
        case 1:
          unint64_t result = 0xD00000000000002ALL;
          break;
        case 2:
          unint64_t result = 0xD00000000000002CLL;
          break;
        case 3:
          unint64_t result = 0xD000000000000029;
          break;
        case 4:
        case 7:
          unint64_t result = 0xD000000000000025;
          break;
        case 5:
          unint64_t result = 0xD00000000000001BLL;
          break;
        case 6:
          unint64_t result = 0xD000000000000022;
          break;
        case 8:
          unint64_t result = 0xD000000000000028;
          break;
        case 9:
          unint64_t result = 0xD00000000000002ELL;
          break;
        default:
          return result;
      }
      return result;
    default:
      sub_2486ABD98();
      swift_bridgeObjectRelease();
      unint64_t v4 = 0xD00000000000002BLL;
LABEL_11:
      unint64_t v9 = v4;
      sub_2486ABBB8();
      return v9;
  }
}

unint64_t sub_24868DCF8()
{
  unint64_t result = qword_26931D300;
  if (!qword_26931D300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931D300);
  }
  return result;
}

unint64_t sub_24868DD4C()
{
  return ATAccessibilityError.errorDescription.getter(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_24868DD58()
{
  return sub_2486AB838();
}

uint64_t sub_24868DD70()
{
  return sub_2486AB848();
}

uint64_t sub_24868DD88()
{
  return sub_2486AB828();
}

uint64_t sub_24868DDB4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 6u && ((1 << a3) & 0x61) != 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for ATAccessibilityError(uint64_t a1)
{
  return sub_24868DDF0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_24868DDF0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 6u && ((1 << a3) & 0x61) != 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s15ArchetypeEngine20ATAccessibilityErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24868DDB4(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ATAccessibilityError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24868DDB4(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24868DDF0(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ATAccessibilityError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24868DDF0(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ATAccessibilityError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF9 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 249);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 7) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ATAccessibilityError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 249;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24868DFA8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 6u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 7);
  }
}

uint64_t sub_24868DFC0(uint64_t result, unsigned int a2)
{
  if (a2 >= 7)
  {
    *(void *)__n128 result = a2 - 7;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 7;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ATAccessibilityError()
{
  return &type metadata for ATAccessibilityError;
}

BOOL static ATSpotlightDataRecordType.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t ATSpotlightDataRecordType.hash(into:)()
{
  return sub_2486ABFB8();
}

uint64_t ATSpotlightDataRecordType.hashValue.getter()
{
  return sub_2486ABFD8();
}

uint64_t ATSpotlightDataRecord.recordType.getter()
{
  return *v0;
}

uint64_t ATSpotlightDataRecord.uniqueIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.content.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.content.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*ATSpotlightDataRecord.content.modify())()
{
  return nullsub_1;
}

uint64_t ATSpotlightDataRecord.creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 28);
  uint64_t v4 = sub_2486AB8F8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for ATSpotlightDataRecord()
{
  uint64_t result = qword_26931D340;
  if (!qword_26931D340) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ATSpotlightDataRecord.lastUsedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 32);
  return sub_24868E230(v3, a1);
}

uint64_t sub_24868E230(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ATSpotlightDataRecord.lastModifiedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 36);
  return sub_24868E230(v3, a1);
}

uint64_t ATSpotlightDataRecord.mailMessageID.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.authors.getter()
{
  type metadata accessor for ATSpotlightDataRecord();
  return swift_bridgeObjectRetain();
}

uint64_t ATSpotlightDataRecord.recipients.getter()
{
  type metadata accessor for ATSpotlightDataRecord();
  return swift_bridgeObjectRetain();
}

uint64_t ATSpotlightDataRecord.additionalRecipients.getter()
{
  type metadata accessor for ATSpotlightDataRecord();
  return swift_bridgeObjectRetain();
}

uint64_t ATSpotlightDataRecord.subject.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 56));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.mailLastViewedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 60);
  return sub_24868E230(v3, a1);
}

uint64_t ATSpotlightDataRecord.mailReceivedDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 64);
  return sub_24868E230(v3, a1);
}

uint64_t ATSpotlightDataRecord.mailConversationId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 68));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.likelyJunk.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 72));
}

uint64_t ATSpotlightDataRecord.extendedContent.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 76));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.extendedContent.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 76));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ATSpotlightDataRecord.extendedContent.modify())()
{
  return nullsub_1;
}

uint64_t ATSpotlightDataRecord.isGroupChat.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 80));
}

uint64_t ATSpotlightDataRecord.title.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 84));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.displayName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 88));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.calendarType.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 92));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.eventStart.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 96);
  return sub_24868E230(v3, a1);
}

uint64_t ATSpotlightDataRecord.eventEnd.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 100);
  return sub_24868E230(v3, a1);
}

uint64_t ATSpotlightDataRecord.isAllDayEvent.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 104));
}

uint64_t ATSpotlightDataRecord.eventLocation.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 108));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.comment.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 112));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.eventHasNavigationInfo.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 116));
}

uint64_t ATSpotlightDataRecord.genre.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 120));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.artist.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 124));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.composer.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 128));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.album.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 132));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATSpotlightDataRecord.init(item:bundleID:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  v230 = (int *)type metadata accessor for ATSpotlightDataRecord();
  unsigned __int8 v8 = (uint64_t *)(a4 + v230[19]);
  uint64_t *v8 = 0;
  v8[1] = 0;
  v9._countAndFlagsBits = a2;
  v9._object = a3;
  int v10 = bundleIDToRecordType(bundleID:)(v9);
  swift_bridgeObjectRelease();
  *(unsigned char *)a4 = v10;
  id v11 = objc_msgSend(a1, sel_attributeSet);
  id v12 = objc_msgSend(v11, sel_uniqueIdentifier);

  if (v12)
  {
    uint64_t v13 = sub_2486ABB68();
    unint64_t v15 = v14;
  }
  else
  {
    uint64_t v13 = 0;
    unint64_t v15 = 0xE000000000000000;
  }
  *(void *)(a4 + 8) = v13;
  *(void *)(a4 + 16) = v15;
  id v16 = objc_msgSend(a1, sel_attributeSet);
  id v17 = objc_msgSend(v16, sel_contentSnippet);

  id v231 = a1;
  v222 = v8;
  int v221 = v10;
  if (v17)
  {
    uint64_t v18 = sub_2486ABB68();
    unint64_t v20 = v19;
  }
  else
  {
    uint64_t v18 = 0;
    unint64_t v20 = 0xE000000000000000;
  }
  *(void *)(a4 + 24) = v18;
  *(void *)(a4 + 32) = v20;
  uint64_t v228 = a4;
  uint64_t v21 = sub_2486AB8F8();
  v234 = &v219;
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(void *)(v22 + 64);
  MEMORY[0x270FA5388](v21);
  unint64_t v24 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  id v25 = objc_msgSend(v231, sel_attributeSet);
  id v26 = objc_msgSend(v25, sel_contentCreationDate);

  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
  uint64_t v28 = *(void *)(*(void *)(v27 - 8) + 64);
  uint64_t v29 = MEMORY[0x270FA5388](v27 - 8);
  uint64_t v30 = (char *)&v219 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v232 = v22;
  uint64_t v229 = v28;
  if (!v26)
  {
    v226 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
    uint64_t v32 = v226((char *)&v219 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v21);
    goto LABEL_11;
  }
  MEMORY[0x270FA5388](v29);
  sub_2486AB8C8();

  uint64_t v31 = *(uint64_t (**)(void))(v232 + 32);
  uint64_t v22 = v232;
  ((void (*)(char *, char *, uint64_t))v31)(v30, (char *)&v219 - v24, v21);
  v226 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
  v226(v30, 0, 1, v21);
  uint64_t v32 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48))(v30, 1, v21);
  if (v32 == 1)
  {
    uint64_t v28 = v229;
LABEL_11:
    MEMORY[0x270FA5388](v32);
    sub_2486AB8E8();
    sub_2486AB878();
    (*(void (**)(char *, uint64_t))(v22 + 8))((char *)&v219 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0), v21);
    sub_24868D470((uint64_t)v30, &qword_26931D240);
    uint64_t v31 = *(uint64_t (**)(void))(v22 + 32);
    goto LABEL_13;
  }
  ((void (*)(char *, char *, uint64_t))v31)((char *)&v219 - v24, v30, v21);
  uint64_t v28 = v229;
LABEL_13:
  uint64_t v224 = v228 + v230[7];
  uint64_t v33 = v31();
  v227 = (char *)&v219;
  MEMORY[0x270FA5388](v33);
  unint64_t v34 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v35 = (char *)&v219 - v34;
  unint64_t v36 = 0x26523C000uLL;
  id v37 = objc_msgSend(v231, sel_attributeSet);
  id v38 = objc_msgSend(v37, sel_lastUsedDate);

  uint64_t v40 = MEMORY[0x270FA5388](v39);
  uint64_t v41 = (char *)&v219 - v34;
  v220 = v31;
  if (v38)
  {
    MEMORY[0x270FA5388](v40);
    sub_2486AB8C8();

    ((void (*)(char *, char *, uint64_t))v31)((char *)&v219 - v34, (char *)&v219 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0), v21);
    uint64_t v42 = v232;
    BOOL v43 = (char *)&v219 - v34;
    unint64_t v44 = v226;
    v226(v43, 0, 1, v21);
    unint64_t v36 = 0x26523C000;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v41, 1, v21) != 1)
    {
      ((void (*)(char *, char *, uint64_t))v220)(v35, v41, v21);
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v42 = v232;
    int v45 = (char *)&v219 - v34;
    unint64_t v44 = v226;
    v226(v45, 1, 1, v21);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v35, v224, v21);
  sub_24868D470((uint64_t)v41, &qword_26931D240);
LABEL_18:
  uint64_t v46 = v228;
  v234 = (uint64_t *)(v42 + 56);
  v44(v35, 0, 1, v21);
  uint64_t v47 = sub_24868D544((uint64_t)v35, v46 + v230[8], &qword_26931D240);
  MEMORY[0x270FA5388](v47);
  uint64_t v49 = (char *)&v219 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v50 = [v231 *(SEL *)(v36 + 3152)];
  id v51 = objc_msgSend(v50, sel_attributeForKey_, *MEMORY[0x263F01DC8]);

  if (v51)
  {
    sub_2486ABD28();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v237 = 0u;
    long long v238 = 0u;
  }
  sub_24868D544((uint64_t)&v237, (uint64_t)v239, &qword_26931D2C8);
  uint64_t v233 = v21;
  if (v240)
  {
    uint64_t v52 = swift_dynamicCast() ^ 1;
    BOOL v53 = v49;
  }
  else
  {
    sub_24868D470((uint64_t)v239, &qword_26931D2C8);
    BOOL v53 = v49;
    uint64_t v52 = 1;
  }
  uint64_t v54 = v44(v53, v52, 1, v21);
  v223 = &v219;
  MEMORY[0x270FA5388](v54);
  unint64_t v55 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  v227 = (char *)&v219 - v55;
  id v56 = [v231 *(SEL *)(v36 + 3152)];
  id v57 = objc_msgSend(v56, sel_contentModificationDate);

  uint64_t v59 = MEMORY[0x270FA5388](v58);
  uint64_t v61 = (char *)&v219 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0);
  v225 = v49;
  if (v57)
  {
    MEMORY[0x270FA5388](v59);
    sub_2486AB8C8();

    uint64_t v62 = v233;
    unsigned __int8 v63 = v220;
    ((void (*)(char *, char *, uint64_t))v220)(v61, (char *)&v219 - v55, v233);
    v44(v61, 0, 1, v62);
    uint64_t v49 = v225;
    uint64_t v64 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v232 + 48);
    if (v64(v61, 1, v62) != 1)
    {
      uint64_t v65 = ((uint64_t (*)(char *, char *, uint64_t))v63)(v227, v61, v62);
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v62 = v233;
    v44((char *)&v219 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v233);
  }
  uint64_t v66 = v232;
  (*(void (**)(char *, uint64_t, uint64_t))(v232 + 16))(v227, v224, v62);
  uint64_t v65 = sub_24868D470((uint64_t)v61, &qword_26931D240);
  uint64_t v64 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v66 + 48);
LABEL_29:
  uint64_t v68 = v229;
  char v67 = v230;
  uint64_t v69 = v228;
  MEMORY[0x270FA5388](v65);
  unint64_t v70 = (v68 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v71 = (char *)&v219 - v70;
  uint64_t v72 = ((uint64_t (*)(char *, uint64_t, uint64_t))v64)(v49, 1, v62);
  if (v72 == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v232 + 16))((char *)&v219 - v70, v227, v62);
    uint64_t v73 = v226;
    v226((char *)&v219 - v70, 0, 1, v62);
    id v74 = v231;
    uint64_t v75 = v68;
    unint64_t v76 = v73;
  }
  else
  {
    MEMORY[0x270FA5388](v72);
    uint64_t v77 = (char *)&v219 - v70;
    sub_24868E230((uint64_t)v49, (uint64_t)v77);
    uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v64)(v77, 1, v62);
    if (result == 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v79 = v227;
    char v80 = sub_2486AB8A8();
    uint64_t v81 = v232;
    (*(void (**)(char *, uint64_t))(v232 + 8))(v77, v62);
    unint64_t v76 = v226;
    if (v80)
    {
      sub_24868E230((uint64_t)v225, (uint64_t)v71);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v71, v79, v62);
      v76(v71, 0, 1, v62);
    }
    char v67 = v230;
    id v74 = v231;
    uint64_t v75 = v229;
  }
  sub_24868D544((uint64_t)v71, v69 + v67[9], &qword_26931D240);
  id v82 = objc_msgSend(v74, sel_attributeSet);
  uint64_t v83 = (void *)sub_2486ABB58();
  id v84 = objc_msgSend(v82, sel_attributeForKey_, v83);

  if (v84)
  {
    sub_2486ABD28();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v237 = 0u;
    long long v238 = 0u;
  }
  unsigned __int8 v85 = v221;
  sub_24868D544((uint64_t)&v237, (uint64_t)v239, &qword_26931D2C8);
  if (v240)
  {
    int v86 = swift_dynamicCast();
    uint64_t v87 = v235;
    uint64_t v88 = v236;
    if (!v86)
    {
      uint64_t v87 = 0;
      uint64_t v88 = 0;
    }
  }
  else
  {
    sub_24868D470((uint64_t)v239, &qword_26931D2C8);
    uint64_t v87 = 0;
    uint64_t v88 = 0;
  }
  long long v89 = (uint64_t *)(v69 + v67[10]);
  *long long v89 = v87;
  v89[1] = v88;
  int v90 = v85;
  id v91 = objc_msgSend(v74, sel_attributeSet);
  long long v92 = v91;
  if (v90 != 5)
  {
    id v95 = objc_msgSend(v91, sel_authorNames);

    if (v95)
    {
      uint64_t v96 = sub_2486ABBF8();
    }
    else
    {
      uint64_t v96 = 0;
    }
    *(void *)(v69 + v67[11]) = v96;
    id v99 = objc_msgSend(v74, sel_attributeSet);
    id v100 = objc_msgSend(v99, sel_recipientNames);

    if (v100)
    {
      uint64_t v101 = sub_2486ABBF8();

      goto LABEL_61;
    }
LABEL_60:
    uint64_t v101 = 0;
    goto LABEL_61;
  }
  id v93 = objc_msgSend(v91, sel_authorEmailAddresses);

  if (v93)
  {
    uint64_t v94 = sub_2486ABBF8();
  }
  else
  {
    uint64_t v94 = 0;
  }
  *(void *)(v69 + v67[11]) = v94;
  id v97 = objc_msgSend(v74, sel_attributeSet);
  id v98 = objc_msgSend(v97, sel_attributeForKey_, *MEMORY[0x263F02710]);

  if (v98)
  {
    sub_2486ABD28();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v237 = 0u;
    long long v238 = 0u;
  }
  sub_24868D544((uint64_t)&v237, (uint64_t)v239, &qword_26931D2C8);
  if (!v240)
  {
    sub_24868D470((uint64_t)v239, &qword_26931D2C8);
    goto LABEL_60;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D308);
  if (swift_dynamicCast()) {
    uint64_t v101 = v235;
  }
  else {
    uint64_t v101 = 0;
  }
LABEL_61:
  *(void *)(v69 + v67[12]) = v101;
  id v102 = objc_msgSend(v74, sel_attributeSet);
  id v103 = objc_msgSend(v102, sel_attributeForKey_, *MEMORY[0x263F01D20]);

  if (v103)
  {
    sub_2486ABD28();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v237 = 0u;
    long long v238 = 0u;
  }
  sub_24868D544((uint64_t)&v237, (uint64_t)v239, &qword_26931D2C8);
  if (v240)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D308);
    int v104 = swift_dynamicCast();
    uint64_t v105 = v235;
    if (!v104) {
      uint64_t v105 = 0;
    }
  }
  else
  {
    sub_24868D470((uint64_t)v239, &qword_26931D2C8);
    uint64_t v105 = 0;
  }
  *(void *)(v69 + v67[13]) = v105;
  id v106 = objc_msgSend(v74, sel_attributeSet);
  id v107 = objc_msgSend(v106, sel_subject);

  if (v107)
  {
    uint64_t v109 = sub_2486ABB68();
    uint64_t v111 = v110;
  }
  else
  {
    uint64_t v109 = 0;
    uint64_t v111 = 0;
  }
  long long v112 = (uint64_t *)(v69 + v67[14]);
  *long long v112 = v109;
  v112[1] = v111;
  MEMORY[0x270FA5388](v108);
  id v113 = objc_msgSend(v74, sel_attributeSet);
  id v114 = objc_msgSend(v113, sel_attributeForKey_, *MEMORY[0x263F02988]);

  if (v114)
  {
    sub_2486ABD28();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v237 = 0u;
    long long v238 = 0u;
  }
  sub_24868D544((uint64_t)&v237, (uint64_t)v239, &qword_26931D2C8);
  if (v240)
  {
    uint64_t v115 = v233;
    uint64_t v116 = swift_dynamicCast() ^ 1;
    uint64_t v117 = (char *)&v219 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v118 = v115;
  }
  else
  {
    sub_24868D470((uint64_t)v239, &qword_26931D2C8);
    uint64_t v117 = (char *)&v219 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v116 = 1;
    uint64_t v118 = v233;
  }
  v76(v117, v116, 1, v118);
  uint64_t v119 = sub_24868D544((uint64_t)&v219 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0), v69 + v67[15], &qword_26931D240);
  MEMORY[0x270FA5388](v119);
  id v120 = objc_msgSend(v74, sel_attributeSet);
  id v121 = objc_msgSend(v120, sel_attributeForKey_, *MEMORY[0x263F02990]);

  if (v121)
  {
    sub_2486ABD28();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v237 = 0u;
    long long v238 = 0u;
  }
  sub_24868D544((uint64_t)&v237, (uint64_t)v239, &qword_26931D2C8);
  if (v240)
  {
    uint64_t v122 = v233;
    uint64_t v123 = swift_dynamicCast() ^ 1;
    uint64_t v124 = (char *)&v219 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v125 = v122;
  }
  else
  {
    sub_24868D470((uint64_t)v239, &qword_26931D2C8);
    uint64_t v124 = (char *)&v219 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v123 = 1;
    uint64_t v125 = v233;
  }
  v76(v124, v123, 1, v125);
  sub_24868D544((uint64_t)&v219 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0), v69 + v67[16], &qword_26931D240);
  id v126 = objc_msgSend(v74, sel_attributeSet);
  id v127 = objc_msgSend(v126, sel_mailConversationID);

  if (v127)
  {
    uint64_t v128 = sub_2486ABB68();
    uint64_t v130 = v129;
  }
  else
  {
    uint64_t v128 = 0;
    uint64_t v130 = 0;
  }
  long long v131 = (uint64_t *)(v69 + v67[17]);
  *long long v131 = v128;
  v131[1] = v130;
  id v132 = objc_msgSend(v74, sel_attributeSet);
  id v133 = objc_msgSend(v132, sel_isLikelyJunk);

  LOBYTE(v132) = objc_msgSend(v133, sel_BOOLValue);
  *(unsigned char *)(v69 + v67[18]) = (_BYTE)v132;
  id v134 = objc_msgSend(v74, sel_attributeSet);
  v135 = (void *)sub_2486ABB58();
  id v136 = objc_msgSend(v134, sel_attributeForKey_, v135);

  if (v136)
  {
    sub_2486ABD28();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v237 = 0u;
    long long v238 = 0u;
  }
  v137 = v222;
  sub_24868D544((uint64_t)&v237, (uint64_t)v239, &qword_26931D2C8);
  if (v240)
  {
    int v138 = swift_dynamicCast();
    if (v138) {
      uint64_t v139 = v235;
    }
    else {
      uint64_t v139 = 0;
    }
    if (v138) {
      uint64_t v140 = v236;
    }
    else {
      uint64_t v140 = 0;
    }
  }
  else
  {
    sub_24868D470((uint64_t)v239, &qword_26931D2C8);
    uint64_t v139 = 0;
    uint64_t v140 = 0;
  }
  swift_bridgeObjectRelease();
  uint64_t *v137 = v139;
  v137[1] = v140;
  id v141 = objc_msgSend(v74, sel_attributeSet);
  v142 = (void *)sub_2486ABB58();
  id v143 = objc_msgSend(v141, sel_attributeForKey_, v142);

  if (v143)
  {
    sub_2486ABD28();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v237 = 0u;
    long long v238 = 0u;
  }
  v144 = v230;
  sub_24868D544((uint64_t)&v237, (uint64_t)v239, &qword_26931D2C8);
  if (v240)
  {
    if (swift_dynamicCast()) {
      char v145 = v235;
    }
    else {
      char v145 = 2;
    }
  }
  else
  {
    sub_24868D470((uint64_t)v239, &qword_26931D2C8);
    char v145 = 2;
  }
  *(unsigned char *)(v69 + v144[20]) = v145;
  id v146 = objc_msgSend(v74, sel_attributeSet);
  id v147 = objc_msgSend(v146, sel_title);

  if (v147)
  {
    uint64_t v148 = sub_2486ABB68();
    uint64_t v150 = v149;
  }
  else
  {
    uint64_t v148 = 0;
    uint64_t v150 = 0;
  }
  v151 = (uint64_t *)(v69 + v144[21]);
  uint64_t *v151 = v148;
  v151[1] = v150;
  id v152 = objc_msgSend(v74, sel_attributeSet);
  id v153 = objc_msgSend(v152, sel_displayName);

  if (v153)
  {
    uint64_t v154 = sub_2486ABB68();
    uint64_t v156 = v155;
  }
  else
  {
    uint64_t v154 = 0;
    uint64_t v156 = 0;
  }
  v157 = (uint64_t *)(v69 + v144[22]);
  uint64_t *v157 = v154;
  v157[1] = v156;
  id v158 = objc_msgSend(v74, sel_attributeSet);
  id v159 = objc_msgSend(v158, sel_attributeForKey_, *MEMORY[0x263F01F50]);

  if (v159)
  {
    sub_2486ABD28();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v237 = 0u;
    long long v238 = 0u;
  }
  sub_24868D544((uint64_t)&v237, (uint64_t)v239, &qword_26931D2C8);
  if (v240)
  {
    int v160 = swift_dynamicCast();
    uint64_t v161 = v235;
    uint64_t v162 = v236;
    if (!v160)
    {
      uint64_t v161 = 0;
      uint64_t v162 = 0;
    }
  }
  else
  {
    sub_24868D470((uint64_t)v239, &qword_26931D2C8);
    uint64_t v161 = 0;
    uint64_t v162 = 0;
  }
  v163 = (uint64_t *)(v69 + v144[23]);
  uint64_t *v163 = v161;
  v163[1] = v162;
  id v164 = objc_msgSend(v74, sel_attributeSet);
  id v165 = objc_msgSend(v164, sel_startDate);

  MEMORY[0x270FA5388](v166);
  unint64_t v167 = (v75 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v165)
  {
    sub_2486AB8C8();

    uint64_t v168 = 0;
  }
  else
  {
    uint64_t v168 = 1;
  }
  uint64_t v169 = 1;
  v76((char *)&v219 - v167, v168, 1, v233);
  sub_24868D544((uint64_t)&v219 - v167, v69 + v144[24], &qword_26931D240);
  id v170 = objc_msgSend(v74, sel_attributeSet);
  id v171 = objc_msgSend(v170, sel_endDate);

  MEMORY[0x270FA5388](v172);
  if (v171)
  {
    sub_2486AB8C8();

    uint64_t v169 = 0;
  }
  v173 = v227;
  v76((char *)&v219 - v167, v169, 1, v233);
  sub_24868D544((uint64_t)&v219 - v167, v69 + v144[25], &qword_26931D240);
  id v174 = objc_msgSend(v74, sel_attributeSet);
  id v175 = objc_msgSend(v174, sel_allDay);

  if (v175)
  {
    unsigned __int8 v176 = objc_msgSend(v175, sel_BOOLValue);
  }
  else
  {
    unsigned __int8 v176 = 2;
  }
  *(unsigned char *)(v69 + v144[26]) = v176;
  id v177 = objc_msgSend(v74, sel_attributeSet);
  id v178 = objc_msgSend(v177, sel_namedLocation);

  if (v178)
  {
    uint64_t v179 = sub_2486ABB68();
    uint64_t v181 = v180;
  }
  else
  {
    uint64_t v179 = 0;
    uint64_t v181 = 0;
  }
  v182 = (uint64_t *)(v69 + v144[27]);
  uint64_t *v182 = v179;
  v182[1] = v181;
  id v183 = objc_msgSend(v74, sel_attributeSet);
  id v184 = objc_msgSend(v183, sel_comment);

  if (v184)
  {
    uint64_t v185 = sub_2486ABB68();
    uint64_t v187 = v186;
  }
  else
  {
    uint64_t v185 = 0;
    uint64_t v187 = 0;
  }
  v188 = (uint64_t *)(v69 + v144[28]);
  uint64_t *v188 = v185;
  v188[1] = v187;
  id v189 = objc_msgSend(v74, sel_attributeSet);
  id v190 = objc_msgSend(v189, sel_supportsNavigation);

  if (v190
    && (id v191 = objc_msgSend(v74, sel_attributeSet),
        id v192 = objc_msgSend(v191, sel_supportsNavigation),
        v191,
        v192))
  {
    unsigned __int8 v193 = objc_msgSend(v192, sel_BOOLValue);
  }
  else
  {
    unsigned __int8 v193 = 2;
  }
  *(unsigned char *)(v69 + v144[29]) = v193;
  id v194 = objc_msgSend(v74, sel_attributeSet);
  id v195 = objc_msgSend(v194, sel_genre);

  if (v195)
  {
    uint64_t v196 = sub_2486ABB68();
    uint64_t v198 = v197;
  }
  else
  {
    uint64_t v196 = 0;
    uint64_t v198 = 0;
  }
  v199 = (uint64_t *)(v69 + v144[30]);
  uint64_t *v199 = v196;
  v199[1] = v198;
  id v200 = objc_msgSend(v74, sel_attributeSet);
  id v201 = objc_msgSend(v200, sel_artist);

  if (v201)
  {
    uint64_t v202 = sub_2486ABB68();
    uint64_t v204 = v203;
  }
  else
  {
    uint64_t v202 = 0;
    uint64_t v204 = 0;
  }
  v205 = (uint64_t *)(v69 + v144[31]);
  uint64_t *v205 = v202;
  v205[1] = v204;
  id v206 = objc_msgSend(v74, sel_attributeSet);
  id v207 = objc_msgSend(v206, sel_composer);

  if (v207)
  {
    uint64_t v208 = sub_2486ABB68();
    uint64_t v210 = v209;
  }
  else
  {
    uint64_t v208 = 0;
    uint64_t v210 = 0;
  }
  v211 = (uint64_t *)(v69 + v144[32]);
  uint64_t *v211 = v208;
  v211[1] = v210;
  id v212 = objc_msgSend(v74, sel_attributeSet);
  id v213 = objc_msgSend(v212, sel_composer);

  if (v213)
  {
    uint64_t v214 = sub_2486ABB68();
    uint64_t v216 = v215;
  }
  else
  {

    uint64_t v214 = 0;
    uint64_t v216 = 0;
  }
  uint64_t v217 = (uint64_t)v225;
  (*(void (**)(char *, uint64_t))(v232 + 8))(v173, v233);
  v218 = (uint64_t *)(v69 + v144[33]);
  uint64_t *v218 = v214;
  v218[1] = v216;
  return sub_24868D470(v217, &qword_26931D240);
}

ArchetypeEngine::ATSpotlightDataRecordType __swiftcall bundleIDToRecordType(bundleID:)(Swift::String bundleID)
{
  object = bundleID._object;
  uint64_t countAndFlagsBits = bundleID._countAndFlagsBits;
  if (bundleID._countAndFlagsBits == 0xD000000000000013 && bundleID._object == (void *)0x80000002486AD5B0
    || (sub_2486ABF08() & 1) != 0)
  {
    return 4;
  }
  if (countAndFlagsBits == 0xD000000000000014 && object == (void *)0x80000002486AD040 || (sub_2486ABF08() & 1) != 0) {
    return 5;
  }
  if (countAndFlagsBits == 0xD000000000000013 && object == (void *)0x80000002486AD5D0 || (sub_2486ABF08() & 1) != 0) {
    return 3;
  }
  if (countAndFlagsBits == 0xD000000000000015 && object == (void *)0x80000002486AD5F0 || (sub_2486ABF08() & 1) != 0) {
    return 1;
  }
  if (countAndFlagsBits == 0xD000000000000013 && object == (void *)0x80000002486AD020) {
    return 0;
  }
  ArchetypeEngine::ATSpotlightDataRecordType v3 = ArchetypeEngine_ATSpotlightDataRecordType_SpotlightCalendarRecord;
  if ((sub_2486ABF08() & 1) == 0)
  {
    ArchetypeEngine::ATSpotlightDataRecordType v3 = ArchetypeEngine_ATSpotlightDataRecordType_SpotlightMusicRecord;
    if (countAndFlagsBits != 0x6C7070612E6D6F63 || object != (void *)0xEF636973754D2E65)
    {
      if (sub_2486ABF08()) {
        return 2;
      }
      else {
        return 6;
      }
    }
  }
  return v3;
}

uint64_t static ATSpotlightDataRecord.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) == *(void *)(a2 + 8) && *(void *)(a1 + 16) == *(void *)(a2 + 16)) {
    return 1;
  }
  else {
    return sub_2486ABF08();
  }
}

uint64_t ATSpotlightDataRecord.description.getter()
{
  uint64_t v1 = sub_2486AC008();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v28 = 0xD00000000000003DLL;
  unint64_t v29 = 0x80000002486AD670;
  uint64_t v24 = 0;
  unint64_t v25 = 0xE000000000000000;
  sub_2486ABBB8();
  LOBYTE(v23[0]) = *v0;
  sub_2486ABE48();
  sub_2486ABBB8();
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  v26[1] = type metadata accessor for ATSpotlightDataRecord();
  uint64_t v5 = __swift_allocate_boxed_opaque_existential_0(&v24);
  sub_24869222C((uint64_t)v0, (uint64_t)v5);
  sub_2486ABFE8();
  sub_2486ABFF8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v6 = sub_2486ABE38();
  swift_release();
  swift_retain();
  sub_2486ABEC8();
  sub_24868D544((uint64_t)v23, (uint64_t)&v24, &qword_26931D310);
  if (!v27)
  {
LABEL_21:
    swift_release_n();
    sub_2486ABBB8();
    return v28;
  }
  uint64_t v7 = v26;
  v20[1] = v6;
  v20[0] = v26;
  v20[2] = MEMORY[0x263F8EE58] + 8;
  while (1)
  {
    unint64_t v8 = v25;
    sub_248692290(v7, v23);
    sub_24868D3B0((uint64_t)v23, (uint64_t)&v21);
    if (swift_dynamicCast()) {
      break;
    }
    sub_24868D3B0((uint64_t)v23, (uint64_t)&v21);
    if (!swift_dynamicCast())
    {
      uint64_t v9 = sub_2486AB8F8();
      uint64_t v10 = *(void *)(v9 - 8);
      MEMORY[0x270FA5388](v9);
      id v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_24868D3B0((uint64_t)v23, (uint64_t)&v21);
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
      MEMORY[0x270FA5388](v13 - 8);
      unint64_t v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      int v16 = swift_dynamicCast();
      id v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
      if (v16)
      {
        v17(v15, 0, 1, v9);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v15, 1, v9) != 1)
        {
          (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
          uint64_t v21 = 0;
          unint64_t v22 = 0xE000000000000000;
          if (!v8) {
            goto LABEL_25;
          }
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          sub_2486951A8(&qword_26931D318);
          sub_2486ABEE8();
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
LABEL_4:
          uint64_t v7 = (_OWORD *)v20[0];
          goto LABEL_5;
        }
      }
      else
      {
        v17(v15, 1, 1, v9);
      }
      sub_24868D470((uint64_t)v15, &qword_26931D240);
      sub_24868D3B0((uint64_t)v23, (uint64_t)&v21);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26931D308);
      if (swift_dynamicCast())
      {
        uint64_t v18 = v20[3];
        uint64_t v21 = 0;
        unint64_t v22 = 0xE000000000000000;
        uint64_t v7 = (_OWORD *)v20[0];
        if (!v8) {
          goto LABEL_24;
        }
        sub_2486ABBB8();
        swift_bridgeObjectRelease();
        sub_2486ABBB8();
        MEMORY[0x24C57B430](v18, MEMORY[0x263F8D310]);
        sub_2486ABBB8();
        swift_bridgeObjectRelease();
        goto LABEL_9;
      }
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
      goto LABEL_4;
    }
    uint64_t v21 = 0;
    unint64_t v22 = 0xE000000000000000;
    if (!v8) {
      goto LABEL_23;
    }
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    sub_2486ABBB8();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    sub_2486ABBB8();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
LABEL_5:
    sub_2486ABEC8();
    sub_24868D544((uint64_t)v23, (uint64_t)&v24, &qword_26931D310);
    if (!v27) {
      goto LABEL_21;
    }
  }
  uint64_t v21 = 0;
  unint64_t v22 = 0xE000000000000000;
  if (v8)
  {
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    sub_2486ABBB8();
    sub_2486ABBB8();
LABEL_9:
    swift_bridgeObjectRelease();
    sub_2486ABBB8();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
    goto LABEL_5;
  }
  swift_release();
  __break(1u);
LABEL_23:
  swift_release();
  __break(1u);
LABEL_24:
  swift_release();
  __break(1u);
LABEL_25:
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

BOOL sub_248690CF8(uint64_t a1, unsigned __int8 *a2)
{
  return (_s15ArchetypeEngine21ATSpotlightDataRecordV1loiySbAC_ACtFZ_0(a2, a1) & 1) == 0;
}

BOOL sub_248690D24(unsigned __int8 *a1, uint64_t a2)
{
  return (_s15ArchetypeEngine21ATSpotlightDataRecordV1loiySbAC_ACtFZ_0(a1, a2) & 1) == 0;
}

uint64_t sub_248690D44(uint64_t a1, unsigned __int8 *a2)
{
  return _s15ArchetypeEngine21ATSpotlightDataRecordV1loiySbAC_ACtFZ_0(a2, a1);
}

uint64_t sub_248690D58(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) == *(void *)(a2 + 8) && *(void *)(a1 + 16) == *(void *)(a2 + 16)) {
    return 1;
  }
  else {
    return sub_2486ABF08();
  }
}

void *ATBundleID.messages.unsafeMutableAddressor()
{
  return &static ATBundleID.messages;
}

unint64_t static ATBundleID.messages.getter()
{
  return 0xD000000000000013;
}

void *ATBundleID.mail.unsafeMutableAddressor()
{
  return &static ATBundleID.mail;
}

unint64_t static ATBundleID.mail.getter()
{
  return 0xD000000000000014;
}

void *ATBundleID.reminders.unsafeMutableAddressor()
{
  return &static ATBundleID.reminders;
}

unint64_t static ATBundleID.reminders.getter()
{
  return 0xD000000000000013;
}

void *ATBundleID.notes.unsafeMutableAddressor()
{
  return &static ATBundleID.notes;
}

unint64_t static ATBundleID.notes.getter()
{
  return 0xD000000000000015;
}

void *ATBundleID.calendar.unsafeMutableAddressor()
{
  return &static ATBundleID.calendar;
}

unint64_t static ATBundleID.calendar.getter()
{
  return 0xD000000000000013;
}

void *ATBundleID.music.unsafeMutableAddressor()
{
  return &static ATBundleID.music;
}

uint64_t static ATBundleID.music.getter()
{
  return 0x6C7070612E6D6F63;
}

uint64_t ATBundleID.deinit()
{
  return v0;
}

uint64_t ATBundleID.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_248690E98(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x80000002486AD5B0 || (sub_2486ABF08() & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D290);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_2486ACA80;
    *(void *)(v5 + 32) = sub_2486ABB68();
    *(void *)(v5 + 40) = v6;
    *(void *)(v5 + 48) = sub_2486ABB68();
    *(void *)(v5 + 56) = v7;
    *(void *)(v5 + 64) = 0xD00000000000001FLL;
    *(void *)(v5 + 72) = 0x80000002486AD650;
LABEL_5:
    uint64_t v30 = *(void *)(v2 + 16);
    swift_bridgeObjectRetain();
    sub_24869153C(v5);
    return v30;
  }
  if (a1 == 0xD000000000000014 && a2 == 0x80000002486AD040 || (sub_2486ABF08() & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D290);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_2486ACA70;
    *(void *)(v5 + 32) = sub_2486ABB68();
    *(void *)(v5 + 40) = v9;
    *(void *)(v5 + 48) = sub_2486ABB68();
    *(void *)(v5 + 56) = v10;
    *(void *)(v5 + 64) = sub_2486ABB68();
    *(void *)(v5 + 72) = v11;
    *(void *)(v5 + 80) = sub_2486ABB68();
    *(void *)(v5 + 88) = v12;
    *(void *)(v5 + 96) = sub_2486ABB68();
    *(void *)(v5 + 104) = v13;
    *(void *)(v5 + 112) = sub_2486ABB68();
    *(void *)(v5 + 120) = v14;
    *(void *)(v5 + 128) = sub_2486ABB68();
    *(void *)(v5 + 136) = v15;
    *(void *)(v5 + 144) = sub_2486ABB68();
    *(void *)(v5 + 152) = v16;
    *(void *)(v5 + 160) = sub_2486ABB68();
    *(void *)(v5 + 168) = v17;
    *(void *)(v5 + 176) = sub_2486ABB68();
    *(void *)(v5 + 184) = v18;
    *(void *)(v5 + 192) = 0xD000000000000019;
    *(void *)(v5 + 200) = 0x80000002486AD630;
    goto LABEL_5;
  }
  if (a1 == 0xD000000000000013 && a2 == 0x80000002486AD5D0 || (sub_2486ABF08() & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D290);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_2486AC710;
    *(void *)(v5 + 32) = sub_2486ABB68();
    *(void *)(v5 + 40) = v19;
    goto LABEL_5;
  }
  if (a1 == 0xD000000000000015 && a2 == 0x80000002486AD5F0 || (sub_2486ABF08() & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D290);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_2486ACA60;
    *(void *)(v5 + 32) = sub_2486ABB68();
    *(void *)(v5 + 40) = v20;
    *(void *)(v5 + 48) = sub_2486ABB68();
    *(void *)(v5 + 56) = v21;
    goto LABEL_5;
  }
  if (a1 == 0xD000000000000013 && a2 == 0x80000002486AD020
    || (sub_2486ABF08() & 1) != 0
    || a1 == 0x6C7070612E6D6F63 && a2 == 0xEF636973754D2E65
    || (sub_2486ABF08() & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D290);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_2486ACA50;
    *(void *)(v5 + 32) = sub_2486ABB68();
    *(void *)(v5 + 40) = v22;
    *(void *)(v5 + 48) = sub_2486ABB68();
    *(void *)(v5 + 56) = v23;
    *(void *)(v5 + 64) = sub_2486ABB68();
    *(void *)(v5 + 72) = v24;
    *(void *)(v5 + 80) = sub_2486ABB68();
    *(void *)(v5 + 88) = v25;
    *(void *)(v5 + 96) = sub_2486ABB68();
    *(void *)(v5 + 104) = v26;
    *(void *)(v5 + 112) = sub_2486ABB68();
    *(void *)(v5 + 120) = v27;
    *(void *)(v5 + 128) = sub_2486ABB68();
    *(void *)(v5 + 136) = v28;
    *(void *)(v5 + 144) = sub_2486ABB68();
    *(void *)(v5 + 152) = v29;
    goto LABEL_5;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_248691440()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_248691478()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D290);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_2486ACA90;
  *(void *)(v1 + 32) = sub_2486ABB68();
  *(void *)(v1 + 40) = v2;
  *(void *)(v1 + 48) = sub_2486ABB68();
  *(void *)(v1 + 56) = v3;
  *(void *)(v1 + 64) = sub_2486ABB68();
  *(void *)(v1 + 72) = v4;
  *(void *)(v1 + 80) = sub_2486ABB68();
  *(void *)(v1 + 88) = v5;
  *(void *)(v1 + 96) = sub_2486ABB68();
  *(void *)(v1 + 104) = v6;
  *(void *)(v1 + 112) = sub_2486ABB68();
  *(void *)(v1 + 120) = v7;
  *(void *)(v0 + 16) = v1;
  return v0;
}

uint64_t sub_24869153C(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_248688E8C(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_2486ABEB8();
  __break(1u);
  return result;
}

uint64_t sub_248691694(uint64_t a1)
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
  unint64_t v3 = sub_248688F9C(isUniquelyReferenced_nonNull_native, v22, 1, v3);
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
  uint64_t v10 = *(void *)(type metadata accessor for ATSpotlightDataRecord() - 8);
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
  uint64_t result = sub_2486ABEB8();
  __break(1u);
  return result;
}

uint64_t _s15ArchetypeEngine21ATSpotlightDataRecordV1loiySbAC_ACtFZ_0(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v82 = a2;
  unint64_t v3 = (int *)type metadata accessor for ATSpotlightDataRecord();
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v71 - v6;
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  double v78 = (void *)((char *)v71 - v9);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)v71 - v11;
  int v13 = *a1;
  uint64_t v79 = (int *)v10;
  uint64_t v72 = v7;
  uint64_t v73 = v14;
  uint64_t v77 = a1;
  if (v13 == 5)
  {
    uint64_t v15 = sub_2486AB8F8();
    unint64_t v16 = *(void **)(v15 - 8);
    uint64_t v17 = v16[8];
    MEMORY[0x270FA5388](v15);
    unint64_t v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0;
    char v80 = (char *)v71 - v18;
    uint64_t v20 = v19 + v3[16];
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    unint64_t v76 = v71;
    uint64_t v22 = *(void *)(*(void *)(v21 - 8) + 64);
    MEMORY[0x270FA5388](v21 - 8);
    unint64_t v23 = (v22 + 15) & 0xFFFFFFFFFFFFFFF0;
    sub_24868E230(v20, (uint64_t)v71 - v23);
    uint64_t v83 = v16;
    uint64_t v24 = (unsigned int (*)(char *, uint64_t, uint64_t))v16[6];
    if (v24((char *)v71 - v23, 1, v15) == 1)
    {
      sub_24868D470((uint64_t)v71 - v23, &qword_26931D240);
    }
    else
    {
      uint64_t v81 = v71;
      uint64_t v75 = (uint64_t (*)(char *, char *, uint64_t))v83[4];
      uint64_t v25 = v75(v80, (char *)v71 - v23, v15);
      unint64_t v76 = v71;
      MEMORY[0x270FA5388](v25);
      uint64_t v26 = (char *)v71 - v18;
      uint64_t v27 = MEMORY[0x270FA5388](v82 + v79[16]);
      sub_24868E230(v27, (uint64_t)v71 - v23);
      if (v24((char *)v71 - v23, 1, v15) != 1)
      {
        v75(v26, (char *)v71 - v23, v15);
        uint64_t v69 = v80;
        char v56 = sub_2486AB8A8();
        unint64_t v70 = (void (*)(char *, uint64_t))v83[1];
        v70(v26, v15);
        v70(v69, v15);
        return v56 & 1;
      }
      ((void (*)(char *, uint64_t))v83[1])(v80, v15);
      sub_24868D470((uint64_t)v71 - v23, &qword_26931D240);
    }
    unint64_t v3 = v79;
    a1 = v77;
  }
  uint64_t v28 = sub_2486AB8F8();
  uint64_t v81 = v71;
  uint64_t v29 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v83 = v30;
  uint64_t v31 = (uint64_t)v12;
  uint64_t v32 = (char *)v71 - (((unint64_t)v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = (uint64_t)&a1[v3[9]];
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
  unint64_t v76 = v71;
  uint64_t v35 = *(void *)(*(void *)(v34 - 8) + 64);
  MEMORY[0x270FA5388](v34 - 8);
  sub_24868E230(v33, (uint64_t)v71 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_24869222C((uint64_t)a1, v31);
  unint64_t v36 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
  unsigned int v37 = v36((char *)v71 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v28);
  char v80 = v32;
  if (v37 == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v32, v31 + v3[7], v28);
    sub_24869514C(v31);
    uint64_t v38 = sub_24868D470((uint64_t)v71 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26931D240);
  }
  else
  {
    sub_24869514C(v31);
    uint64_t v38 = (*(uint64_t (**)(char *, char *, uint64_t))(v29 + 32))(v32, (char *)v71 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0), v28);
  }
  uint64_t v75 = (uint64_t (*)(char *, char *, uint64_t))v71;
  MEMORY[0x270FA5388](v38);
  uint64_t v40 = (char *)v71 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v74 = v71;
  uint64_t v41 = v82;
  uint64_t v42 = MEMORY[0x270FA5388](v82 + v3[9]);
  sub_24868E230(v42, (uint64_t)v71 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v43 = v41;
  uint64_t v44 = (uint64_t)v78;
  sub_24869222C(v43, (uint64_t)v78);
  if (v36((char *)v71 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v28) == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v40, v44 + v3[7], v28);
    sub_24869514C(v44);
    sub_24868D470((uint64_t)v71 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26931D240);
  }
  else
  {
    sub_24869514C(v44);
    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v40, (char *)v71 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0), v28);
  }
  sub_2486951A8((unint64_t *)&qword_26931D358);
  int v45 = v80;
  uint64_t v46 = sub_2486ABB48();
  if (v46)
  {
    double v78 = v71;
    MEMORY[0x270FA5388](v46);
    uint64_t v48 = (char *)v71 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
    v71[1] = v71;
    uint64_t v49 = v79;
    id v50 = (unsigned int (*)(void, void, void))v77;
    uint64_t v51 = MEMORY[0x270FA5388](&v77[v79[8]]);
    sub_24868E230(v51, (uint64_t)v71 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v52 = (uint64_t)v50;
    uint64_t v53 = (uint64_t)v72;
    sub_24869222C(v52, (uint64_t)v72);
    uint64_t v77 = (unsigned __int8 *)v36;
    unsigned int v54 = v36((char *)v71 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v28);
    v71[0] = v48;
    if (v54 == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v48, v53 + v49[7], v28);
      sub_24869514C(v53);
      uint64_t v55 = sub_24868D470((uint64_t)v71 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26931D240);
    }
    else
    {
      sub_24869514C(v53);
      uint64_t v55 = (*(uint64_t (**)(char *, char *, uint64_t))(v29 + 32))(v48, (char *)v71 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0), v28);
    }
    MEMORY[0x270FA5388](v55);
    uint64_t v59 = (char *)v71 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v83 = v71;
    uint64_t v60 = v49[8];
    uint64_t v61 = v49;
    uint64_t v62 = v82;
    uint64_t v63 = MEMORY[0x270FA5388](v82 + v60);
    uint64_t v64 = (char *)v71 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_24868E230(v63, (uint64_t)v64);
    uint64_t v65 = v73;
    sub_24869222C(v62, v73);
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v77)(v64, 1, v28) == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v59, v65 + v61[7], v28);
      sub_24869514C(v65);
      sub_24868D470((uint64_t)v64, &qword_26931D240);
    }
    else
    {
      sub_24869514C(v65);
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v59, v64, v28);
    }
    uint64_t v66 = (char *)v71[0];
    char v56 = sub_2486AB8A8();
    char v67 = *(void (**)(char *, uint64_t))(v29 + 8);
    v67(v59, v28);
    v67(v66, v28);
    v67(v40, v28);
    v67(v80, v28);
  }
  else
  {
    char v56 = sub_2486AB8A8();
    id v57 = *(void (**)(char *, uint64_t))(v29 + 8);
    v57(v40, v28);
    v57(v45, v28);
  }
  return v56 & 1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_24869222C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ATSpotlightDataRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_248692290(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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

unint64_t sub_2486922F4()
{
  unint64_t result = qword_26931D320;
  if (!qword_26931D320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931D320);
  }
  return result;
}

uint64_t sub_248692348(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_2486923E4(&qword_26931D328);
  uint64_t result = sub_2486923E4(&qword_26931D330);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2486923B0()
{
  return sub_2486923E4(&qword_26931D338);
}

uint64_t sub_2486923E4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ATSpotlightDataRecord();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ATSpotlightDataRecordType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ATSpotlightDataRecordType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x248692584);
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

ValueMetadata *type metadata accessor for ATSpotlightDataRecordType()
{
  return &type metadata for ATSpotlightDataRecordType;
}

void *initializeBufferWithCopyOfBuffer for ATSpotlightDataRecord(void *a1, char *a2, int *a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *(void *)a2;
    *unsigned int v4 = *(void *)a2;
    unsigned int v4 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *a2;
    uint64_t v7 = *((void *)a2 + 2);
    a1[1] = *((void *)a2 + 1);
    a1[2] = v7;
    uint64_t v8 = *((void *)a2 + 4);
    uint64_t v9 = a3[7];
    id v102 = (char *)a1 + v9;
    uint64_t v10 = &a2[v9];
    a1[3] = *((void *)a2 + 3);
    a1[4] = v8;
    uint64_t v11 = sub_2486AB8F8();
    uint64_t v12 = *(void *)(v11 - 8);
    int v13 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v102, v10, v11);
    uint64_t v14 = a3[8];
    uint64_t v15 = (char *)v4 + v14;
    unint64_t v16 = &a2[v14];
    uint64_t v101 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    if (v101(&a2[v14], 1, v11))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
      memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      v13(v15, v16, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v15, 0, 1, v11);
    }
    uint64_t v19 = a3[9];
    uint64_t v20 = (char *)v4 + v19;
    uint64_t v21 = &a2[v19];
    uint64_t v100 = v12;
    id v99 = v13;
    if (v101(&a2[v19], 1, v11))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      v13(v20, v21, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v20, 0, 1, v11);
    }
    uint64_t v23 = a3[10];
    uint64_t v24 = a3[11];
    uint64_t v25 = (void *)((char *)v4 + v23);
    uint64_t v26 = &a2[v23];
    uint64_t v27 = *((void *)v26 + 1);
    *uint64_t v25 = *(void *)v26;
    v25[1] = v27;
    *(void *)((char *)v4 + v24) = *(void *)&a2[v24];
    uint64_t v28 = a3[13];
    *(void *)((char *)v4 + a3[12]) = *(void *)&a2[a3[12]];
    *(void *)((char *)v4 + v28) = *(void *)&a2[v28];
    uint64_t v29 = a3[14];
    uint64_t v30 = a3[15];
    uint64_t v31 = (void *)((char *)v4 + v29);
    uint64_t v32 = &a2[v29];
    uint64_t v33 = *((void *)v32 + 1);
    *uint64_t v31 = *(void *)v32;
    v31[1] = v33;
    uint64_t v34 = (char *)v4 + v30;
    uint64_t v35 = &a2[v30];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v101(v35, 1, v11))
    {
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
      memcpy(v34, v35, *(void *)(*(void *)(v36 - 8) + 64));
      uint64_t v37 = v12;
    }
    else
    {
      v13(v34, v35, v11);
      uint64_t v37 = v12;
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v34, 0, 1, v11);
    }
    uint64_t v38 = a3[16];
    uint64_t v39 = (char *)v4 + v38;
    uint64_t v40 = &a2[v38];
    if (v101(&a2[v38], 1, v11))
    {
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
      memcpy(v39, v40, *(void *)(*(void *)(v41 - 8) + 64));
    }
    else
    {
      v99(v39, v40, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v39, 0, 1, v11);
    }
    uint64_t v42 = a3[17];
    uint64_t v43 = a3[18];
    uint64_t v44 = (void *)((char *)v4 + v42);
    int v45 = &a2[v42];
    uint64_t v46 = *((void *)v45 + 1);
    *uint64_t v44 = *(void *)v45;
    v44[1] = v46;
    *((unsigned char *)v4 + v43) = a2[v43];
    uint64_t v47 = a3[19];
    uint64_t v48 = a3[20];
    uint64_t v49 = (void *)((char *)v4 + v47);
    id v50 = &a2[v47];
    uint64_t v51 = *((void *)v50 + 1);
    *uint64_t v49 = *(void *)v50;
    v49[1] = v51;
    *((unsigned char *)v4 + v48) = a2[v48];
    uint64_t v52 = a3[21];
    uint64_t v53 = a3[22];
    unsigned int v54 = (void *)((char *)v4 + v52);
    uint64_t v55 = &a2[v52];
    uint64_t v56 = *((void *)v55 + 1);
    *unsigned int v54 = *(void *)v55;
    v54[1] = v56;
    id v57 = (void *)((char *)v4 + v53);
    uint64_t v58 = &a2[v53];
    uint64_t v59 = *((void *)v58 + 1);
    *id v57 = *(void *)v58;
    v57[1] = v59;
    uint64_t v60 = a3[23];
    uint64_t v61 = a3[24];
    uint64_t v62 = (void *)((char *)v4 + v60);
    uint64_t v63 = &a2[v60];
    uint64_t v64 = *((void *)v63 + 1);
    *uint64_t v62 = *(void *)v63;
    v62[1] = v64;
    uint64_t v65 = (char *)v4 + v61;
    uint64_t v66 = &a2[v61];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v101(v66, 1, v11))
    {
      uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
      memcpy(v65, v66, *(void *)(*(void *)(v67 - 8) + 64));
      uint64_t v68 = v100;
    }
    else
    {
      v99(v65, v66, v11);
      uint64_t v68 = v100;
      (*(void (**)(char *, void, uint64_t, uint64_t))(v100 + 56))(v65, 0, 1, v11);
    }
    uint64_t v69 = a3[25];
    unint64_t v70 = (char *)v4 + v69;
    unint64_t v71 = &a2[v69];
    if (v101(&a2[v69], 1, v11))
    {
      uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
      memcpy(v70, v71, *(void *)(*(void *)(v72 - 8) + 64));
    }
    else
    {
      v99(v70, v71, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v68 + 56))(v70, 0, 1, v11);
    }
    uint64_t v73 = a3[27];
    *((unsigned char *)v4 + a3[26]) = a2[a3[26]];
    id v74 = (void *)((char *)v4 + v73);
    uint64_t v75 = &a2[v73];
    uint64_t v76 = *((void *)v75 + 1);
    *id v74 = *(void *)v75;
    v74[1] = v76;
    uint64_t v77 = a3[28];
    uint64_t v78 = a3[29];
    uint64_t v79 = (void *)((char *)v4 + v77);
    char v80 = &a2[v77];
    uint64_t v81 = *((void *)v80 + 1);
    *uint64_t v79 = *(void *)v80;
    v79[1] = v81;
    *((unsigned char *)v4 + v78) = a2[v78];
    uint64_t v82 = a3[30];
    uint64_t v83 = a3[31];
    id v84 = (void *)((char *)v4 + v82);
    unsigned __int8 v85 = &a2[v82];
    uint64_t v86 = *((void *)v85 + 1);
    *id v84 = *(void *)v85;
    v84[1] = v86;
    uint64_t v87 = (void *)((char *)v4 + v83);
    uint64_t v88 = &a2[v83];
    uint64_t v89 = *((void *)v88 + 1);
    *uint64_t v87 = *(void *)v88;
    v87[1] = v89;
    uint64_t v90 = a3[32];
    uint64_t v91 = a3[33];
    long long v92 = (void *)((char *)v4 + v90);
    id v93 = &a2[v90];
    uint64_t v94 = *((void *)v93 + 1);
    *long long v92 = *(void *)v93;
    v92[1] = v94;
    id v95 = (void *)((char *)v4 + v91);
    uint64_t v96 = &a2[v91];
    uint64_t v97 = *((void *)v96 + 1);
    *id v95 = *(void *)v96;
    v95[1] = v97;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for ATSpotlightDataRecord(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[7];
  uint64_t v5 = sub_2486AB8F8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v7(v4, v5);
  uint64_t v8 = a1 + a2[8];
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v9(v8, 1, v5)) {
    v7(v8, v5);
  }
  uint64_t v10 = a1 + a2[9];
  if (!v9(v10, 1, v5)) {
    v7(v10, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = a1 + a2[15];
  if (!v9(v11, 1, v5)) {
    v7(v11, v5);
  }
  uint64_t v12 = a1 + a2[16];
  if (!v9(v12, 1, v5)) {
    v7(v12, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = a1 + a2[24];
  if (!v9(v13, 1, v5)) {
    v7(v13, v5);
  }
  uint64_t v14 = a1 + a2[25];
  if (!v9(v14, 1, v5)) {
    v7(v14, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ATSpotlightDataRecord(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  uint64_t v8 = a3[7];
  uint64_t v100 = (void *)(a1 + v8);
  uint64_t v9 = (const void *)(a2 + v8);
  uint64_t v10 = sub_2486AB8F8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(void *, const void *, uint64_t))(v11 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v100, v9, v10);
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  id v99 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (v99(a2 + v13, 1, v10))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    v12(v14, v15, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
  }
  uint64_t v17 = a3[9];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (const void *)(a2 + v17);
  uint64_t v98 = v11;
  uint64_t v97 = v12;
  if (v99(a2 + v17, 1, v10))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    v12(v18, v19, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v18, 0, 1, v10);
  }
  uint64_t v21 = a3[10];
  uint64_t v22 = a3[11];
  uint64_t v23 = (void *)(a1 + v21);
  uint64_t v24 = (void *)(a2 + v21);
  uint64_t v25 = v24[1];
  void *v23 = *v24;
  v23[1] = v25;
  *(void *)(a1 + v22) = *(void *)(a2 + v22);
  uint64_t v26 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(void *)(a1 + v26) = *(void *)(a2 + v26);
  uint64_t v27 = a3[14];
  uint64_t v28 = a3[15];
  uint64_t v29 = (void *)(a1 + v27);
  uint64_t v30 = (void *)(a2 + v27);
  uint64_t v31 = v30[1];
  *uint64_t v29 = *v30;
  v29[1] = v31;
  uint64_t v32 = (void *)(a1 + v28);
  uint64_t v33 = (const void *)(a2 + v28);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v99((uint64_t)v33, 1, v10))
  {
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v32, v33, *(void *)(*(void *)(v34 - 8) + 64));
    uint64_t v35 = v11;
  }
  else
  {
    v12(v32, v33, v10);
    uint64_t v35 = v11;
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v32, 0, 1, v10);
  }
  uint64_t v36 = a3[16];
  uint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = (const void *)(a2 + v36);
  if (v99(a2 + v36, 1, v10))
  {
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v37, v38, *(void *)(*(void *)(v39 - 8) + 64));
  }
  else
  {
    v97(v37, v38, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v35 + 56))(v37, 0, 1, v10);
  }
  uint64_t v40 = a3[17];
  uint64_t v41 = a3[18];
  uint64_t v42 = (void *)(a1 + v40);
  uint64_t v43 = (void *)(a2 + v40);
  uint64_t v44 = v43[1];
  *uint64_t v42 = *v43;
  v42[1] = v44;
  *(unsigned char *)(a1 + v41) = *(unsigned char *)(a2 + v41);
  uint64_t v45 = a3[19];
  uint64_t v46 = a3[20];
  uint64_t v47 = (void *)(a1 + v45);
  uint64_t v48 = (void *)(a2 + v45);
  uint64_t v49 = v48[1];
  *uint64_t v47 = *v48;
  v47[1] = v49;
  *(unsigned char *)(a1 + v46) = *(unsigned char *)(a2 + v46);
  uint64_t v50 = a3[21];
  uint64_t v51 = a3[22];
  uint64_t v52 = (void *)(a1 + v50);
  uint64_t v53 = (void *)(a2 + v50);
  uint64_t v54 = v53[1];
  *uint64_t v52 = *v53;
  v52[1] = v54;
  uint64_t v55 = (void *)(a1 + v51);
  uint64_t v56 = (void *)(a2 + v51);
  uint64_t v57 = v56[1];
  *uint64_t v55 = *v56;
  v55[1] = v57;
  uint64_t v58 = a3[23];
  uint64_t v59 = a3[24];
  uint64_t v60 = (void *)(a1 + v58);
  uint64_t v61 = (void *)(a2 + v58);
  uint64_t v62 = v61[1];
  *uint64_t v60 = *v61;
  v60[1] = v62;
  uint64_t v63 = (void *)(a1 + v59);
  uint64_t v64 = (const void *)(a2 + v59);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v99((uint64_t)v64, 1, v10))
  {
    uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v63, v64, *(void *)(*(void *)(v65 - 8) + 64));
    uint64_t v66 = v98;
  }
  else
  {
    v97(v63, v64, v10);
    uint64_t v66 = v98;
    (*(void (**)(void *, void, uint64_t, uint64_t))(v98 + 56))(v63, 0, 1, v10);
  }
  uint64_t v67 = a3[25];
  uint64_t v68 = (void *)(a1 + v67);
  uint64_t v69 = (const void *)(a2 + v67);
  if (v99(a2 + v67, 1, v10))
  {
    uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v68, v69, *(void *)(*(void *)(v70 - 8) + 64));
  }
  else
  {
    v97(v68, v69, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v66 + 56))(v68, 0, 1, v10);
  }
  uint64_t v71 = a3[27];
  *(unsigned char *)(a1 + a3[26]) = *(unsigned char *)(a2 + a3[26]);
  uint64_t v72 = (void *)(a1 + v71);
  uint64_t v73 = (void *)(a2 + v71);
  uint64_t v74 = v73[1];
  *uint64_t v72 = *v73;
  v72[1] = v74;
  uint64_t v75 = a3[28];
  uint64_t v76 = a3[29];
  uint64_t v77 = (void *)(a1 + v75);
  uint64_t v78 = (void *)(a2 + v75);
  uint64_t v79 = v78[1];
  *uint64_t v77 = *v78;
  v77[1] = v79;
  *(unsigned char *)(a1 + v76) = *(unsigned char *)(a2 + v76);
  uint64_t v80 = a3[30];
  uint64_t v81 = a3[31];
  uint64_t v82 = (void *)(a1 + v80);
  uint64_t v83 = (void *)(a2 + v80);
  uint64_t v84 = v83[1];
  *uint64_t v82 = *v83;
  v82[1] = v84;
  unsigned __int8 v85 = (void *)(a1 + v81);
  uint64_t v86 = (void *)(a2 + v81);
  uint64_t v87 = v86[1];
  *unsigned __int8 v85 = *v86;
  v85[1] = v87;
  uint64_t v88 = a3[32];
  uint64_t v89 = a3[33];
  uint64_t v90 = (void *)(a1 + v88);
  uint64_t v91 = (void *)(a2 + v88);
  uint64_t v92 = v91[1];
  *uint64_t v90 = *v91;
  v90[1] = v92;
  id v93 = (void *)(a1 + v89);
  uint64_t v94 = (void *)(a2 + v89);
  uint64_t v95 = v94[1];
  *id v93 = *v94;
  v93[1] = v95;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ATSpotlightDataRecord(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[7];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_2486AB8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v88 = *(void (**)(void *, const void *, uint64_t))(v10 + 24);
  v88(v7, v8, v9);
  uint64_t v11 = a3[8];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  int v15 = v14((const void *)(a1 + v11), 1, v9);
  int v16 = v14(v13, 1, v9);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v12, v13, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v12, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v12, v9);
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  v88(v12, v13, v9);
LABEL_7:
  uint64_t v18 = a3[9];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  int v21 = v14((const void *)(a1 + v18), 1, v9);
  int v22 = v14(v20, 1, v9);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v19, v20, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v19, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v19, v9);
LABEL_12:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  v88(v19, v20, v9);
LABEL_13:
  uint64_t v24 = a3[10];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[14];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (void *)(a2 + v27);
  *uint64_t v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[15];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (const void *)(a2 + v30);
  int v33 = v14((const void *)(a1 + v30), 1, v9);
  int v34 = v14(v32, 1, v9);
  if (v33)
  {
    if (!v34)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v31, v32, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v31, 0, 1, v9);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v34)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v31, v9);
LABEL_18:
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
    goto LABEL_19;
  }
  v88(v31, v32, v9);
LABEL_19:
  uint64_t v36 = a3[16];
  uint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = (const void *)(a2 + v36);
  int v39 = v14((const void *)(a1 + v36), 1, v9);
  int v40 = v14(v38, 1, v9);
  if (v39)
  {
    if (!v40)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v37, v38, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v37, 0, 1, v9);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v40)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v37, v9);
LABEL_24:
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
    goto LABEL_25;
  }
  v88(v37, v38, v9);
LABEL_25:
  uint64_t v42 = a3[17];
  uint64_t v43 = (void *)(a1 + v42);
  uint64_t v44 = (void *)(a2 + v42);
  *uint64_t v43 = *v44;
  v43[1] = v44[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[18]) = *(unsigned char *)(a2 + a3[18]);
  uint64_t v45 = a3[19];
  uint64_t v46 = (void *)(a1 + v45);
  uint64_t v47 = (void *)(a2 + v45);
  *uint64_t v46 = *v47;
  v46[1] = v47[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[20]) = *(unsigned char *)(a2 + a3[20]);
  uint64_t v48 = a3[21];
  uint64_t v49 = (void *)(a1 + v48);
  uint64_t v50 = (void *)(a2 + v48);
  *uint64_t v49 = *v50;
  v49[1] = v50[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v51 = a3[22];
  uint64_t v52 = (void *)(a1 + v51);
  uint64_t v53 = (void *)(a2 + v51);
  *uint64_t v52 = *v53;
  v52[1] = v53[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v54 = a3[23];
  uint64_t v55 = (void *)(a1 + v54);
  uint64_t v56 = (void *)(a2 + v54);
  *uint64_t v55 = *v56;
  v55[1] = v56[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v57 = a3[24];
  uint64_t v58 = (void *)(a1 + v57);
  uint64_t v59 = (const void *)(a2 + v57);
  int v60 = v14((const void *)(a1 + v57), 1, v9);
  int v61 = v14(v59, 1, v9);
  if (v60)
  {
    if (!v61)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v58, v59, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v58, 0, 1, v9);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v61)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v58, v9);
LABEL_30:
    uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v58, v59, *(void *)(*(void *)(v62 - 8) + 64));
    goto LABEL_31;
  }
  v88(v58, v59, v9);
LABEL_31:
  uint64_t v63 = a3[25];
  uint64_t v64 = (void *)(a1 + v63);
  uint64_t v65 = (const void *)(a2 + v63);
  int v66 = v14((const void *)(a1 + v63), 1, v9);
  int v67 = v14(v65, 1, v9);
  if (!v66)
  {
    if (!v67)
    {
      v88(v64, v65, v9);
      goto LABEL_37;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v64, v9);
    goto LABEL_36;
  }
  if (v67)
  {
LABEL_36:
    uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v64, v65, *(void *)(*(void *)(v68 - 8) + 64));
    goto LABEL_37;
  }
  (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v64, v65, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v64, 0, 1, v9);
LABEL_37:
  *(unsigned char *)(a1 + a3[26]) = *(unsigned char *)(a2 + a3[26]);
  uint64_t v69 = a3[27];
  uint64_t v70 = (void *)(a1 + v69);
  uint64_t v71 = (void *)(a2 + v69);
  *uint64_t v70 = *v71;
  v70[1] = v71[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v72 = a3[28];
  uint64_t v73 = (void *)(a1 + v72);
  uint64_t v74 = (void *)(a2 + v72);
  *uint64_t v73 = *v74;
  v73[1] = v74[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[29]) = *(unsigned char *)(a2 + a3[29]);
  uint64_t v75 = a3[30];
  uint64_t v76 = (void *)(a1 + v75);
  uint64_t v77 = (void *)(a2 + v75);
  *uint64_t v76 = *v77;
  v76[1] = v77[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v78 = a3[31];
  uint64_t v79 = (void *)(a1 + v78);
  uint64_t v80 = (void *)(a2 + v78);
  *uint64_t v79 = *v80;
  v79[1] = v80[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v81 = a3[32];
  uint64_t v82 = (void *)(a1 + v81);
  uint64_t v83 = (void *)(a2 + v81);
  *uint64_t v82 = *v83;
  v82[1] = v83[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v84 = a3[33];
  unsigned __int8 v85 = (void *)(a1 + v84);
  uint64_t v86 = (void *)(a2 + v84);
  *unsigned __int8 v85 = *v86;
  v85[1] = v86[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for ATSpotlightDataRecord(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = a3[7];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_2486AB8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(void *, const void *, uint64_t))(v10 + 32);
  v11(v7, v8, v9);
  uint64_t v12 = a3[8];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v46 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (v46(a2 + v12, 1, v9))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    v11(v13, v14, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
  }
  uint64_t v16 = a3[9];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  if (v46(a2 + v16, 1, v9))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    v11(v17, v18, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v17, 0, 1, v9);
  }
  uint64_t v20 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(void *)(a1 + v20) = *(void *)(a2 + v20);
  uint64_t v21 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(void *)(a1 + v21) = *(void *)(a2 + v21);
  uint64_t v22 = a3[15];
  *(_OWORD *)(a1 + a3[14]) = *(_OWORD *)(a2 + a3[14]);
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (const void *)(a2 + v22);
  if (v46(a2 + v22, 1, v9))
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    v11(v23, v24, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v23, 0, 1, v9);
  }
  uint64_t v26 = a3[16];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (const void *)(a2 + v26);
  if (v46(a2 + v26, 1, v9))
  {
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    v11(v27, v28, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v27, 0, 1, v9);
  }
  uint64_t v30 = a3[18];
  *(_OWORD *)(a1 + a3[17]) = *(_OWORD *)(a2 + a3[17]);
  *(unsigned char *)(a1 + v30) = *(unsigned char *)(a2 + v30);
  uint64_t v31 = a3[20];
  *(_OWORD *)(a1 + a3[19]) = *(_OWORD *)(a2 + a3[19]);
  *(unsigned char *)(a1 + v31) = *(unsigned char *)(a2 + v31);
  uint64_t v32 = a3[22];
  *(_OWORD *)(a1 + a3[21]) = *(_OWORD *)(a2 + a3[21]);
  *(_OWORD *)(a1 + v32) = *(_OWORD *)(a2 + v32);
  uint64_t v33 = a3[24];
  *(_OWORD *)(a1 + a3[23]) = *(_OWORD *)(a2 + a3[23]);
  int v34 = (void *)(a1 + v33);
  uint64_t v35 = (const void *)(a2 + v33);
  if (v46(a2 + v33, 1, v9))
  {
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v34, v35, *(void *)(*(void *)(v36 - 8) + 64));
  }
  else
  {
    v11(v34, v35, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v34, 0, 1, v9);
  }
  uint64_t v37 = a3[25];
  uint64_t v38 = (void *)(a1 + v37);
  int v39 = (const void *)(a2 + v37);
  if (v46(a2 + v37, 1, v9))
  {
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v38, v39, *(void *)(*(void *)(v40 - 8) + 64));
  }
  else
  {
    v11(v38, v39, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v38, 0, 1, v9);
  }
  uint64_t v41 = a3[27];
  *(unsigned char *)(a1 + a3[26]) = *(unsigned char *)(a2 + a3[26]);
  *(_OWORD *)(a1 + v41) = *(_OWORD *)(a2 + v41);
  uint64_t v42 = a3[29];
  *(_OWORD *)(a1 + a3[28]) = *(_OWORD *)(a2 + a3[28]);
  *(unsigned char *)(a1 + v42) = *(unsigned char *)(a2 + v42);
  uint64_t v43 = a3[31];
  *(_OWORD *)(a1 + a3[30]) = *(_OWORD *)(a2 + a3[30]);
  *(_OWORD *)(a1 + v43) = *(_OWORD *)(a2 + v43);
  uint64_t v44 = a3[33];
  *(_OWORD *)(a1 + a3[32]) = *(_OWORD *)(a2 + a3[32]);
  *(_OWORD *)(a1 + v44) = *(_OWORD *)(a2 + v44);
  return a1;
}

uint64_t assignWithTake for ATSpotlightDataRecord(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[7];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_2486AB8F8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v116 = *(void (**)(void *, const void *, uint64_t))(v12 + 40);
  v116(v9, v10, v11);
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  int v17 = v16((const void *)(a1 + v13), 1, v11);
  int v18 = v16(v15, 1, v11);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v14, v15, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v14, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v14, v11);
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v14, v15, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  v116(v14, v15, v11);
LABEL_7:
  uint64_t v20 = a3[9];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (const void *)(a2 + v20);
  int v23 = v16((const void *)(a1 + v20), 1, v11);
  int v24 = v16(v22, 1, v11);
  if (v23)
  {
    if (!v24)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v21, v22, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v21, 0, 1, v11);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v24)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v21, v11);
LABEL_12:
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_13;
  }
  v116(v21, v22, v11);
LABEL_13:
  uint64_t v26 = a3[10];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (uint64_t *)(a2 + v26);
  uint64_t v30 = *v28;
  uint64_t v29 = v28[1];
  void *v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  swift_bridgeObjectRelease();
  uint64_t v31 = a3[14];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (uint64_t *)(a2 + v31);
  uint64_t v35 = *v33;
  uint64_t v34 = v33[1];
  *uint64_t v32 = v35;
  v32[1] = v34;
  swift_bridgeObjectRelease();
  uint64_t v36 = a3[15];
  uint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = (const void *)(a2 + v36);
  int v39 = v16((const void *)(a1 + v36), 1, v11);
  int v40 = v16(v38, 1, v11);
  if (v39)
  {
    if (!v40)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v37, v38, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v37, 0, 1, v11);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v40)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v37, v11);
LABEL_18:
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
    goto LABEL_19;
  }
  v116(v37, v38, v11);
LABEL_19:
  uint64_t v42 = a3[16];
  uint64_t v43 = (void *)(a1 + v42);
  uint64_t v44 = (const void *)(a2 + v42);
  int v45 = v16((const void *)(a1 + v42), 1, v11);
  int v46 = v16(v44, 1, v11);
  if (v45)
  {
    if (!v46)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v43, v44, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v43, 0, 1, v11);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v46)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v43, v11);
LABEL_24:
    uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v43, v44, *(void *)(*(void *)(v47 - 8) + 64));
    goto LABEL_25;
  }
  v116(v43, v44, v11);
LABEL_25:
  uint64_t v48 = a3[17];
  uint64_t v49 = (void *)(a1 + v48);
  uint64_t v50 = (uint64_t *)(a2 + v48);
  uint64_t v52 = *v50;
  uint64_t v51 = v50[1];
  *uint64_t v49 = v52;
  v49[1] = v51;
  swift_bridgeObjectRelease();
  uint64_t v53 = a3[19];
  *(unsigned char *)(a1 + a3[18]) = *(unsigned char *)(a2 + a3[18]);
  uint64_t v54 = (void *)(a1 + v53);
  uint64_t v55 = (uint64_t *)(a2 + v53);
  uint64_t v57 = *v55;
  uint64_t v56 = v55[1];
  *uint64_t v54 = v57;
  v54[1] = v56;
  swift_bridgeObjectRelease();
  uint64_t v58 = a3[21];
  *(unsigned char *)(a1 + a3[20]) = *(unsigned char *)(a2 + a3[20]);
  uint64_t v59 = (void *)(a1 + v58);
  int v60 = (uint64_t *)(a2 + v58);
  uint64_t v62 = *v60;
  uint64_t v61 = v60[1];
  *uint64_t v59 = v62;
  v59[1] = v61;
  swift_bridgeObjectRelease();
  uint64_t v63 = a3[22];
  uint64_t v64 = (void *)(a1 + v63);
  uint64_t v65 = (uint64_t *)(a2 + v63);
  uint64_t v67 = *v65;
  uint64_t v66 = v65[1];
  *uint64_t v64 = v67;
  v64[1] = v66;
  swift_bridgeObjectRelease();
  uint64_t v68 = a3[23];
  uint64_t v69 = (void *)(a1 + v68);
  uint64_t v70 = (uint64_t *)(a2 + v68);
  uint64_t v72 = *v70;
  uint64_t v71 = v70[1];
  *uint64_t v69 = v72;
  v69[1] = v71;
  swift_bridgeObjectRelease();
  uint64_t v73 = a3[24];
  uint64_t v74 = (void *)(a1 + v73);
  uint64_t v75 = (const void *)(a2 + v73);
  int v76 = v16((const void *)(a1 + v73), 1, v11);
  int v77 = v16(v75, 1, v11);
  if (v76)
  {
    if (!v77)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v74, v75, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v74, 0, 1, v11);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v77)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v74, v11);
LABEL_30:
    uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v74, v75, *(void *)(*(void *)(v78 - 8) + 64));
    goto LABEL_31;
  }
  v116(v74, v75, v11);
LABEL_31:
  uint64_t v79 = a3[25];
  uint64_t v80 = (void *)(a1 + v79);
  uint64_t v81 = (const void *)(a2 + v79);
  int v82 = v16((const void *)(a1 + v79), 1, v11);
  int v83 = v16(v81, 1, v11);
  if (!v82)
  {
    if (!v83)
    {
      v116(v80, v81, v11);
      goto LABEL_37;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v80, v11);
    goto LABEL_36;
  }
  if (v83)
  {
LABEL_36:
    uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v80, v81, *(void *)(*(void *)(v84 - 8) + 64));
    goto LABEL_37;
  }
  (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v80, v81, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v80, 0, 1, v11);
LABEL_37:
  uint64_t v85 = a3[27];
  *(unsigned char *)(a1 + a3[26]) = *(unsigned char *)(a2 + a3[26]);
  uint64_t v86 = (void *)(a1 + v85);
  uint64_t v87 = (uint64_t *)(a2 + v85);
  uint64_t v89 = *v87;
  uint64_t v88 = v87[1];
  *uint64_t v86 = v89;
  v86[1] = v88;
  swift_bridgeObjectRelease();
  uint64_t v90 = a3[28];
  uint64_t v91 = (void *)(a1 + v90);
  uint64_t v92 = (uint64_t *)(a2 + v90);
  uint64_t v94 = *v92;
  uint64_t v93 = v92[1];
  void *v91 = v94;
  v91[1] = v93;
  swift_bridgeObjectRelease();
  uint64_t v95 = a3[30];
  *(unsigned char *)(a1 + a3[29]) = *(unsigned char *)(a2 + a3[29]);
  uint64_t v96 = (void *)(a1 + v95);
  uint64_t v97 = (uint64_t *)(a2 + v95);
  uint64_t v99 = *v97;
  uint64_t v98 = v97[1];
  *uint64_t v96 = v99;
  v96[1] = v98;
  swift_bridgeObjectRelease();
  uint64_t v100 = a3[31];
  uint64_t v101 = (void *)(a1 + v100);
  id v102 = (uint64_t *)(a2 + v100);
  uint64_t v104 = *v102;
  uint64_t v103 = v102[1];
  *uint64_t v101 = v104;
  v101[1] = v103;
  swift_bridgeObjectRelease();
  uint64_t v105 = a3[32];
  id v106 = (void *)(a1 + v105);
  id v107 = (uint64_t *)(a2 + v105);
  uint64_t v109 = *v107;
  uint64_t v108 = v107[1];
  void *v106 = v109;
  v106[1] = v108;
  swift_bridgeObjectRelease();
  uint64_t v110 = a3[33];
  uint64_t v111 = (void *)(a1 + v110);
  long long v112 = (uint64_t *)(a2 + v110);
  uint64_t v114 = *v112;
  uint64_t v113 = v112[1];
  *uint64_t v111 = v114;
  v111[1] = v113;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ATSpotlightDataRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_248694D10);
}

uint64_t sub_248694D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_2486AB8F8();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 32);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for ATSpotlightDataRecord(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_248694E54);
}

uint64_t sub_248694E54(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_2486AB8F8();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 32);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_248694F84()
{
  sub_2486AB8F8();
  if (v0 <= 0x3F)
  {
    sub_2486950AC();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_2486950AC()
{
  if (!qword_26931D350)
  {
    sub_2486AB8F8();
    unint64_t v0 = sub_2486ABCF8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26931D350);
    }
  }
}

uint64_t type metadata accessor for ATBundleID()
{
  return self;
}

uint64_t type metadata accessor for ATSpolightAttributes()
{
  return self;
}

uint64_t sub_24869514C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ATSpotlightDataRecord();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2486951A8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2486AB8F8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void ATLocationRetriever.__allocating_init(effectiveBundleIdentifier:)()
{
  id v1 = objc_allocWithZone(v0);
  ATLocationRetriever.init(effectiveBundleIdentifier:)();
}

void ATLocationRetriever.init(effectiveBundleIdentifier:)()
{
  uint64_t v1 = OBJC_IVAR____TtC15ArchetypeEngine19ATLocationRetriever_locationManager;
  id v2 = objc_allocWithZone(MEMORY[0x263F00A60]);
  int v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_init);
  uint64_t v4 = OBJC_IVAR____TtC15ArchetypeEngine19ATLocationRetriever_semaphore;
  *(void *)&v3[v4] = dispatch_semaphore_create(0);

  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for ATLocationRetriever();
  id v5 = objc_msgSendSuper2(&v12, sel_init);
  sub_24868CFDC(0, &qword_26931D370);
  uint64_t v6 = (char *)v5;
  uint64_t v7 = (void *)sub_2486ABCA8();
  id v8 = objc_allocWithZone(MEMORY[0x263F00A60]);
  uint64_t v9 = (void *)sub_2486ABB58();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v8, sel_initWithEffectiveBundleIdentifier_delegate_onQueue_, v9, v6, v7);

  if (v10)
  {

    uint64_t v11 = *(void **)&v6[OBJC_IVAR____TtC15ArchetypeEngine19ATLocationRetriever_locationManager];
    *(void *)&v6[OBJC_IVAR____TtC15ArchetypeEngine19ATLocationRetriever_locationManager] = v10;
  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for ATLocationRetriever()
{
  return self;
}

Swift::Void __swiftcall ATLocationRetriever.requestLocation()()
{
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC15ArchetypeEngine19ATLocationRetriever_locationManager), sel_requestLocation);
  sub_2486ABCB8();
}

uint64_t sub_2486953EC()
{
  v1[17] = v0;
  uint64_t v2 = sub_2486ABB08();
  v1[18] = v2;
  v1[19] = *(void *)(v2 - 8);
  v1[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2486954AC, 0, 0);
}

uint64_t sub_2486954AC()
{
  id v1 = objc_msgSend(*(id *)(v0[17] + OBJC_IVAR____TtC15ArchetypeEngine19ATLocationRetriever_locationManager), sel_location);
  v0[21] = v1;
  if (v1)
  {
    id v2 = v1;
    id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00A40]), sel_init);
    v0[22] = v3;
    v0[2] = v0;
    v0[7] = v0 + 15;
    v0[3] = sub_248695644;
    uint64_t v4 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_248695A24;
    v0[13] = &block_descriptor;
    v0[14] = v4;
    objc_msgSend(v3, sel_reverseGeocodeLocation_completionHandler_, v2, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
  else
  {
    swift_task_dealloc();
    id v5 = (uint64_t (*)(void))v0[1];
    return v5(0);
  }
}

uint64_t sub_248695644()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 184) = v1;
  if (v1) {
    id v2 = sub_248695810;
  }
  else {
    id v2 = sub_248695754;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_248695754()
{
  uint64_t v1 = *(void *)(v0 + 120);
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v2 = (id)MEMORY[0x24C57B5F0](0, *(void *)(v0 + 120));
  }
  else
  {
    if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v2 = *(id *)(v1 + 32);
  }
  id v3 = v2;
  uint64_t v4 = *(void **)(v0 + 176);

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  id v5 = *(void (**)(id))(v0 + 8);
  v5(v3);
}

uint64_t sub_248695810()
{
  uint64_t v1 = *(void **)(v0 + 184);
  swift_willThrow();
  sub_2486ABAF8();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_2486ABAE8();
  os_log_type_t v5 = sub_2486ABC98();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v7 = *(void **)(v0 + 176);
    uint64_t v6 = *(void **)(v0 + 184);
    uint64_t v16 = *(void **)(v0 + 168);
    id v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)id v8 = 138412290;
    id v10 = v6;
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 128) = v11;
    sub_2486ABD08();
    *uint64_t v9 = v11;

    _os_log_impl(&dword_248682000, v4, v5, "Failed to retrieve a placemark for the last location with error: \"%@\".", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2F0);
    swift_arrayDestroy();
    MEMORY[0x24C57BD90](v9, -1, -1);
    MEMORY[0x24C57BD90](v8, -1, -1);
  }
  else
  {
    objc_super v12 = *(void **)(v0 + 184);
    uint64_t v13 = *(void **)(v0 + 168);
  }
  (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 160), *(void *)(v0 + 144));
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14(0);
}

uint64_t sub_248695A24(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2D8);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    sub_24868CFDC(0, (unint64_t *)&unk_26931D400);
    **(void **)(*(void *)(v3 + 64) + 40) = sub_2486ABBF8();
    return MEMORY[0x270FA2408](v3);
  }
}

uint64_t sub_248695B00()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x270FA2498](sub_248695B20, 0, 0);
}

uint64_t sub_248695B20()
{
  id v1 = objc_msgSend(*(id *)(v0[3] + OBJC_IVAR____TtC15ArchetypeEngine19ATLocationRetriever_locationManager), sel_location);
  v0[4] = v1;
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = swift_task_alloc();
    v0[5] = v3;
    *(void *)(v3 + 16) = v2;
    uint64_t v4 = (void *)swift_task_alloc();
    v0[6] = v4;
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D410);
    *uint64_t v4 = v0;
    v4[1] = sub_248695C88;
    return MEMORY[0x270FA2318](v0 + 2, 0, 0, 0xD000000000000019, 0x80000002486AD830, sub_248696C9C, v3, v5);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_248695C88()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248695DA0, 0, 0);
}

uint64_t sub_248695DA0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = objc_msgSend(*(id *)(v0 + 16), sel_preferredName);
    uint64_t v3 = *(void **)(v0 + 32);
    if (v2)
    {
      uint64_t v4 = v2;
      uint64_t v5 = sub_2486ABB68();
      uint64_t v7 = v6;

      goto LABEL_7;
    }
  }
  else
  {
  }
  uint64_t v5 = 0;
  uint64_t v7 = 0;
LABEL_7:
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v8(v5, v7);
}

void sub_248695E74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D418);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  id v7 = objc_msgSend(self, sel_defaultManager);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_248696D38;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2486962D4;
  aBlock[3] = &block_descriptor_8;
  uint64_t v10 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v7, sel_fetchLocationOfInterestAtLocation_withHandler_, a2, v10);
  _Block_release(v10);
}

uint64_t sub_248696048(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_2486ABB08();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v20 = (uint64_t)a1;
    id v8 = a1;
  }
  else
  {
    sub_2486ABAF8();
    id v9 = a2;
    id v10 = a2;
    uint64_t v11 = sub_2486ABAE8();
    os_log_type_t v12 = sub_2486ABC98();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 138412290;
      if (a2)
      {
        id v14 = a2;
        uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v20 = v15;
        sub_2486ABD08();
      }
      else
      {
        uint64_t v20 = 0;
        sub_2486ABD08();
        uint64_t v15 = 0;
      }
      uint64_t v16 = v19;
      *uint64_t v19 = v15;

      _os_log_impl(&dword_248682000, v11, v12, "Failed to fetch locations of interest with error: \"%@\".", v13, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2F0);
      swift_arrayDestroy();
      MEMORY[0x24C57BD90](v16, -1, -1);
      MEMORY[0x24C57BD90](v13, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v20 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D418);
  return sub_2486ABC38();
}

void sub_2486962D4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t ATLocationRetriever.currentLocationName()()
{
  *(void *)(v1 + 16) = v0;
  id v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *id v2 = v1;
  v2[1] = sub_24869640C;
  v2[3] = v0;
  return MEMORY[0x270FA2498](sub_248695B20, 0, 0);
}

uint64_t sub_24869640C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = *v2;
  swift_task_dealloc();
  if (a2)
  {
    id v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v7(a1, a2);
  }
  else
  {
    id v9 = (void *)swift_task_alloc();
    *(void *)(v5 + 32) = v9;
    *id v9 = v6;
    v9[1] = sub_248696588;
    return sub_2486953EC();
  }
}

uint64_t sub_248696588(uint64_t a1)
{
  *(void *)(*(void *)v1 + 40) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248696688, 0, 0);
}

uint64_t sub_248696688()
{
  uint64_t v1 = *(void **)(v0 + 40);
  if (v1)
  {
    id v2 = objc_msgSend(*(id *)(v0 + 40), sel_name);

    if (v2)
    {
      uint64_t v1 = (void *)sub_2486ABB68();
      uint64_t v4 = v3;

      goto LABEL_6;
    }
    uint64_t v1 = 0;
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = *(uint64_t (**)(void *, uint64_t))(v0 + 8);
  return v5(v1, v4);
}

Swift::Void __swiftcall ATLocationRetriever.locationManager(_:didUpdateLocations:)(CLLocationManager _, Swift::OpaquePointer didUpdateLocations)
{
}

uint64_t ATLocationRetriever.locationManager(_:didFailWithError:)(uint64_t a1, void *a2)
{
  return sub_248696A74(a2);
}

id ATLocationRetriever.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ATLocationRetriever.init()()
{
}

id ATLocationRetriever.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ATLocationRetriever();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24869695C(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_248696994(uint64_t (*a1)(void))
{
  return a1();
}

void sub_2486969BC(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_2486ABD08();
  *a1 = v7;
  id v8 = *a2;
  if (*a2)
  {
    void *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_248696A74(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2486ABB08();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2486ABAF8();
  id v8 = a1;
  id v9 = a1;
  uint64_t v10 = sub_2486ABAE8();
  os_log_type_t v11 = sub_2486ABC98();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v21 = v2;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = v4;
    uint64_t v13 = (uint8_t *)v12;
    id v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412290;
    id v15 = a1;
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v22 = v16;
    sub_2486ABD08();
    *id v14 = v16;

    _os_log_impl(&dword_248682000, v10, v11, "Failed to fetch the current location from CoreLocation with error: \"%@\".", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2F0);
    swift_arrayDestroy();
    MEMORY[0x24C57BD90](v14, -1, -1);
    uint64_t v17 = v13;
    uint64_t v4 = v20;
    MEMORY[0x24C57BD90](v17, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_2486ABCC8();
}

void sub_248696C9C(uint64_t a1)
{
  sub_248695E74(a1, *(void *)(v1 + 16));
}

uint64_t sub_248696CA4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D418);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_248696D38(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D418);
  return sub_248696048(a1, a2);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t ATSpotlightCalendarRetriever.getRecentRecordsAsync(maxNumRecordsToFetch:addendum:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_248696DF8, 0, 0);
}

uint64_t sub_248696DF8()
{
  uint64_t v1 = (uint64_t *)(v0[5] + OBJC_IVAR____TtC15ArchetypeEngine28ATSpotlightCalendarRetriever_bundleID);
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2486998A8;
  uint64_t v5 = v0[4];
  uint64_t v6 = v0[2];
  uint64_t v7 = v0[3];
  return ATSpotlightDataRetriever.getRecentRecordsAsync(bundleId:nRecords:addendum:)(v3, v2, v6, v7, v5);
}

uint64_t ATSpotlightCalendarRetriever.getRecentRecords(maxNumRecordsToFetch:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D488);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC15ArchetypeEngine28ATSpotlightCalendarRetriever_bundleID);
  uint64_t v7 = *(void *)(v2 + OBJC_IVAR____TtC15ArchetypeEngine28ATSpotlightCalendarRetriever_bundleID + 8);
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v10 = sub_2486ABC58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  os_log_type_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v2;
  v11[5] = v8;
  _OWORD v11[6] = v7;
  v11[7] = a1;
  v11[8] = v9;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v12 = v9;
  sub_2486991E8((uint64_t)v6, (uint64_t)&unk_26931D490, (uint64_t)v11);
  swift_release();
  sub_2486ABCB8();

  return swift_bridgeObjectRetain();
}

uint64_t ATSpotlightCalendarRetriever.getCalendarEvents(startOffsetInSeconds:endOffsetInSeconds:excludeAllDayEvents:maxNumRecordsToFetch:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)(v5 + 48) = a4;
  *(void *)(v5 + 56) = v4;
  *(unsigned char *)(v5 + 88) = a3;
  *(void *)(v5 + 32) = a1;
  *(void *)(v5 + 40) = a2;
  return MEMORY[0x270FA2498](sub_248697040, 0, 0);
}

uint64_t sub_248697040()
{
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  sub_2486ABD98();
  sub_2486ABBB8();
  v0[2] = v2;
  sub_2486ABEE8();
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  sub_2486ABBB8();
  v0[3] = v3;
  sub_2486ABEE8();
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  sub_2486ABBB8();
  swift_bridgeObjectRetain();
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v0[8] = 0xE000000000000000;
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine28ATSpotlightCalendarRetriever_bundleID);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine28ATSpotlightCalendarRetriever_bundleID + 8);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[9] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_248697240;
  uint64_t v7 = v0[6];
  return ATSpotlightDataRetriever.getRecentRecordsAsync(bundleId:nRecords:addendum:)(v4, v5, v7, 0, 0xE000000000000000);
}

uint64_t sub_248697240(uint64_t a1)
{
  *(void *)(*(void *)v1 + 80) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248697340, 0, 0);
}

uint64_t sub_248697340()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 80);
  return v1(v2);
}

uint64_t ATSpotlightCalendarRetriever.getCalendarEvents(startOffsetInDays:endOffsetInDays:excludeAllDayEvents:maxNumRecordsToFetch:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)(v5 + 32) = a4;
  *(void *)(v5 + 40) = v4;
  *(unsigned char *)(v5 + 56) = a3;
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  return MEMORY[0x270FA2498](sub_2486973CC, 0, 0);
}

uint64_t sub_2486973CC(uint64_t (*a1)(), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v5 = 86400 * v4;
  if ((unsigned __int128)(v4 * (__int128)86400) >> 64 != (86400 * v4) >> 63)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(v3 + 24);
  uint64_t v7 = 86400 * v6;
  if ((unsigned __int128)(v6 * (__int128)86400) >> 64 != (86400 * v6) >> 63)
  {
LABEL_7:
    __break(1u);
    return MEMORY[0x270FA2498](a1, a2, a3);
  }
  uint64_t v8 = swift_task_alloc();
  *(void *)(v3 + 48) = v8;
  *(void *)uint64_t v8 = v3;
  *(void *)(v8 + 8) = sub_2486974BC;
  uint64_t v9 = *(void *)(v3 + 40);
  char v10 = *(unsigned char *)(v3 + 56);
  *(void *)(v8 + 48) = *(void *)(v3 + 32);
  *(void *)(v8 + 56) = v9;
  *(unsigned char *)(v8 + 88) = v10;
  *(void *)(v8 + 32) = v5;
  *(void *)(v8 + 40) = v7;
  a1 = sub_248697040;
  a2 = 0;
  a3 = 0;
  return MEMORY[0x270FA2498](a1, a2, a3);
}

uint64_t sub_2486974BC(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t ATSpotlightCalendarRetriever.parseCalendarEventRecords(eventRecords:)(uint64_t a1)
{
  uint64_t v2 = (int *)type metadata accessor for ATSpotlightDataRecord();
  uint64_t v3 = *((void *)v2 - 1);
  MEMORY[0x270FA5388](v2);
  uint64_t v75 = (uint64_t)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v63 = sub_248688564(MEMORY[0x263F8EE78]);
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08788]), sel_init);
  objc_msgSend(v5, sel_setDateStyle_, 1);
  objc_msgSend(v5, sel_setTimeStyle_, 1);
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {

    uint64_t v55 = 0;
LABEL_30:
    sub_248699394((uint64_t)v55);
    return v63;
  }
  uint64_t v57 = a1;
  id v58 = v5;
  uint64_t v7 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v68 = *(void *)(v3 + 72);
  swift_bridgeObjectRetain();
  uint64_t v61 = v2;
  uint64_t v62 = 0;
  while (1)
  {
    uint64_t v8 = v75;
    sub_24869222C(v7, v75);
    uint64_t v9 = (uint64_t *)(v8 + v2[23]);
    uint64_t v73 = v9[1];
    if (!v73)
    {
      sub_24869514C(v75);
      goto LABEL_4;
    }
    uint64_t v70 = v7;
    uint64_t v71 = v6;
    uint64_t v66 = *v9;
    uint64_t v10 = sub_2486AB8F8();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(void *)(v11 + 64);
    MEMORY[0x270FA5388](v10);
    uint64_t v67 = (char *)((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v74 = (char *)((char *)&v57 - v67);
    uint64_t v13 = v75 + v2[24];
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    uint64_t v72 = &v57;
    uint64_t v15 = *(void *)(*(void *)(v14 - 8) + 64);
    MEMORY[0x270FA5388](v14 - 8);
    unint64_t v16 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
    sub_248699754(v13, (uint64_t)&v57 - v16, &qword_26931D240);
    uint64_t v69 = v11;
    uint64_t v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    if (v17((char *)&v57 - v16, 1, v10) == 1)
    {
      sub_24869514C(v75);
      sub_24868D470((uint64_t)&v57 - v16, &qword_26931D240);
LABEL_10:
      uint64_t v7 = v70;
      uint64_t v6 = v71;
      goto LABEL_4;
    }
    uint64_t v65 = &v57;
    uint64_t v64 = *(uint64_t (**)(char *, char *, uint64_t))(v69 + 32);
    uint64_t v18 = v64(v74, (char *)&v57 - v16, v10);
    MEMORY[0x270FA5388](v18);
    uint64_t v67 = (char *)((char *)&v57 - v67);
    uint64_t v72 = &v57;
    uint64_t v19 = MEMORY[0x270FA5388](v75 + v2[25]);
    uint64_t v20 = (char *)&v57 - v16;
    sub_248699754(v19, (uint64_t)&v57 - v16, &qword_26931D240);
    if (v17((char *)&v57 - v16, 1, v10) == 1)
    {
      (*(void (**)(char *, uint64_t))(v69 + 8))(v74, v10);
      sub_24869514C(v75);
      sub_24868D470((uint64_t)&v57 - v16, &qword_26931D240);
      uint64_t v2 = v61;
      goto LABEL_10;
    }
    uint64_t v59 = &v57;
    uint64_t v60 = v10;
    uint64_t v21 = v67;
    v64(v67, v20, v10);
    uint64_t v22 = v73;
    uint64_t v76 = 0;
    unint64_t v77 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_2486ABD98();
    swift_bridgeObjectRelease();
    uint64_t v76 = 0x2074612079737542;
    unint64_t v77 = 0xE90000000000005BLL;
    int v23 = (void *)sub_2486AB888();
    id v24 = v58;
    id v25 = objc_msgSend(v58, sel_stringFromDate_, v23);

    sub_2486ABB68();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    sub_2486ABBB8();
    uint64_t v26 = (void *)sub_2486AB888();
    id v27 = objc_msgSend(v24, sel_stringFromDate_, v26);

    sub_2486ABB68();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    sub_2486ABBB8();
    uint64_t v28 = (uint64_t (*)(char *, char *, uint64_t))v76;
    uint64_t v72 = (uint64_t *)v77;
    sub_248699394((uint64_t)v62);
    unint64_t v29 = v63;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v76 = v29;
    uint64_t v31 = v66;
    unint64_t v33 = sub_248689424(v66, v22);
    uint64_t v34 = *(void *)(v29 + 16);
    BOOL v35 = (v32 & 1) == 0;
    uint64_t v36 = v34 + v35;
    if (__OFADD__(v34, v35)) {
      break;
    }
    char v37 = v32;
    uint64_t v38 = *(void *)(v29 + 24);
    uint64_t v64 = v28;
    if (v38 >= v36)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_24868B020();
      }
    }
    else
    {
      sub_24868AAC0(v36, isUniquelyReferenced_nonNull_native);
      unint64_t v39 = sub_248689424(v31, v22);
      if ((v37 & 1) != (v40 & 1)) {
        goto LABEL_33;
      }
      unint64_t v33 = v39;
    }
    uint64_t v41 = (void *)v76;
    swift_bridgeObjectRelease();
    if ((v37 & 1) == 0)
    {
      v41[(v33 >> 6) + 8] |= 1 << v33;
      uint64_t v42 = (uint64_t *)(v41[6] + 16 * v33);
      *uint64_t v42 = v31;
      v42[1] = v22;
      *(void *)(v41[7] + 8 * v33) = MEMORY[0x263F8EE78];
      uint64_t v43 = v41[2];
      uint64_t v44 = v43 + 1;
      BOOL v45 = __OFADD__(v43, 1);
      swift_bridgeObjectRetain();
      if (v45) {
        goto LABEL_32;
      }
      v41[2] = v44;
    }
    swift_bridgeObjectRetain();
    uint64_t v46 = v41[7];
    unint64_t v63 = (unint64_t)v41;
    swift_bridgeObjectRelease();
    uint64_t v47 = *(void **)(v46 + 8 * v33);
    char v48 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v46 + 8 * v33) = v47;
    if ((v48 & 1) == 0)
    {
      uint64_t v47 = sub_248688E8C(0, v47[2] + 1, 1, v47);
      *(void *)(v46 + 8 * v33) = v47;
    }
    unint64_t v50 = v47[2];
    unint64_t v49 = v47[3];
    if (v50 >= v49 >> 1)
    {
      uint64_t v47 = sub_248688E8C((void *)(v49 > 1), v50 + 1, 1, v47);
      *(void *)(v46 + 8 * v33) = v47;
    }
    uint64_t v7 = v70;
    uint64_t v6 = v71;
    v47[2] = v50 + 1;
    uint64_t v51 = &v47[2 * v50];
    uint64_t v52 = v72;
    v51[4] = v64;
    v51[5] = v52;
    swift_bridgeObjectRelease();
    uint64_t v53 = *(void (**)(char *, uint64_t))(v69 + 8);
    uint64_t v54 = v60;
    v53(v21, v60);
    v53(v74, v54);
    sub_24869514C(v75);
    uint64_t v62 = sub_248697D48;
    uint64_t v2 = v61;
LABEL_4:
    v7 += v68;
    if (!--v6)
    {

      swift_bridgeObjectRelease();
      uint64_t v55 = v62;
      goto LABEL_30;
    }
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  uint64_t result = sub_2486ABF38();
  __break(1u);
  return result;
}

void sub_248697D48(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
}

uint64_t ATSpotlightCalendarRetriever.getCalendarEvents(atTime:excludeAllDayEvents:maxNumRecordsToFetch:)(uint64_t a1, char a2, uint64_t a3)
{
  *(void *)(v4 + 24) = a3;
  *(void *)(v4 + 32) = v3;
  *(unsigned char *)(v4 + 56) = a2;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_248697D80, 0, 0);
}

uint64_t sub_248697D80()
{
  uint64_t v1 = sub_2486AB8B8();
  if ((~*(void *)&v4 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v4 <= -9.22337204e18)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v4 >= 9.22337204e18)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v5 = (uint64_t)v4 - 30;
  if (__OFSUB__((uint64_t)v4, 30))
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v1 = sub_2486AB8B8();
  if ((~*(void *)&v6 & 0x7FF0000000000000) == 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v6 <= -9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v6 >= 9.22337204e18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v7 = (uint64_t)v6 + 30;
  if (__OFADD__((uint64_t)v6, 30))
  {
LABEL_19:
    __break(1u);
    return MEMORY[0x270FA2498](v1, v2, v3);
  }
  uint64_t v8 = swift_task_alloc();
  *(void *)(v0 + 40) = v8;
  *(void *)uint64_t v8 = v0;
  *(void *)(v8 + 8) = sub_248697EE8;
  uint64_t v9 = *(void *)(v0 + 32);
  char v10 = *(unsigned char *)(v0 + 56);
  *(void *)(v8 + 48) = *(void *)(v0 + 24);
  *(void *)(v8 + 56) = v9;
  *(unsigned char *)(v8 + 88) = v10;
  *(void *)(v8 + 32) = v5;
  *(void *)(v8 + 40) = v7;
  uint64_t v1 = (uint64_t)sub_248697040;
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_248697EE8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 48) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_248697FE8, 0, 0);
}

uint64_t sub_248697FE8()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[2];
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = v2;
  uint64_t v4 = sub_248698994((uint64_t (*)(char *))sub_248699578, v3, v1);
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_248698094(uint64_t a1, char *a2)
{
  uint64_t v90 = a2;
  uint64_t v3 = type metadata accessor for ATSpotlightDataRecord();
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v94 = (uint64_t)v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v69 - v7;
  uint64_t v9 = a1 + *(int *)(v6 + 96);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
  unint64_t v11 = *(void *)(*(void *)(v10 - 8) + 64);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v93 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = (char *)v69 - v93;
  sub_248699754(v9, (uint64_t)v69 - v93, &qword_26931D240);
  uint64_t v13 = sub_2486AB8F8();
  uint64_t v91 = *(void **)(v13 - 8);
  uint64_t v14 = (uint64_t (*)(char *, uint64_t, uint64_t))v91[6];
  int v15 = v14(v12, 1, v13);
  sub_24868D470((uint64_t)v12, &qword_26931D240);
  uint64_t v16 = a1;
  sub_24869222C(a1, (uint64_t)v8);
  uint64_t v87 = v14;
  uint64_t v88 = (char *)v3;
  unint64_t v86 = v11;
  if (v15 == 1)
  {
    sub_24869514C((uint64_t)v8);
    BOOL v17 = 0;
  }
  else
  {
    uint64_t v18 = MEMORY[0x270FA5388](&v8[*(int *)(v3 + 100)]);
    uint64_t v19 = (char *)v69 - v93;
    sub_248699754(v18, (uint64_t)v69 - v93, &qword_26931D240);
    sub_24869514C((uint64_t)v8);
    BOOL v17 = v14(v19, 1, v13) != 1;
    sub_24868D470((uint64_t)v19, &qword_26931D240);
  }
  uint64_t v20 = v94;
  uint64_t v21 = sub_24869222C(v16, v94);
  uint64_t v89 = v69;
  uint64_t v22 = v91;
  uint64_t v23 = v91[8];
  MEMORY[0x270FA5388](v21);
  uint64_t v92 = (void (*)(char *, char *, uint64_t))v22[2];
  unint64_t v93 = (unint64_t)(v22 + 2);
  v92((char *)v69 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0), v90, v13);
  if (!v17)
  {
    ((void (*)(char *, uint64_t))v22[1])((char *)v69 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
    sub_24869514C(v20);
    char v65 = 0;
    return v65 & 1;
  }
  uint64_t v78 = (char *)v69 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = v23;
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D4C0);
  uint64_t v81 = v69;
  MEMORY[0x270FA5388](v80);
  uint64_t v83 = v24;
  uint64_t v84 = (uint64_t)v69 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = v69;
  id v25 = v88;
  unint64_t v26 = v86;
  uint64_t v27 = MEMORY[0x270FA5388](v20 + *((int *)v88 + 24));
  unint64_t v28 = (v26 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_248699754(v27, (uint64_t)v69 - v28, &qword_26931D240);
  uint64_t v90 = (char *)v69 - v28;
  unint64_t v29 = v87;
  uint64_t result = v87((char *)v69 - v28, 1, v13);
  if (result == 1) {
    goto LABEL_15;
  }
  unint64_t v77 = v69;
  uint64_t v31 = MEMORY[0x270FA5388](v20 + *((int *)v25 + 25));
  char v32 = (char *)v69 - v28;
  sub_248699754(v31, (uint64_t)v32, &qword_26931D240);
  uint64_t result = v29(v32, 1, v13);
  if (result != 1)
  {
    uint64_t v33 = v85;
    MEMORY[0x270FA5388](result);
    uint64_t v34 = (char *)v69 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
    BOOL v35 = v92;
    uint64_t v36 = ((uint64_t (*)(char *, char *, uint64_t))v92)(v34, v90, v13);
    uint64_t v87 = (uint64_t (*)(char *, uint64_t, uint64_t))v69;
    MEMORY[0x270FA5388](v36);
    unint64_t v76 = (v33 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v88 = v32;
    v35(v34, v32, v13);
    unint64_t v82 = sub_2486996A0();
    char v37 = sub_2486ABB38();
    unint64_t v39 = v22 + 1;
    uint64_t v38 = (void (*)(char *, uint64_t))v22[1];
    v38(v34, v13);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v38)(v34, v13);
    if (v37)
    {
      uint64_t v73 = v69;
      MEMORY[0x270FA5388](result);
      unint64_t v74 = (v40 + 15) & 0xFFFFFFFFFFFFFFF0;
      uint64_t v71 = (char *)v69 - v74;
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D4D0);
      uint64_t v72 = v69;
      uint64_t v42 = v41 - 8;
      uint64_t v43 = *(void *)(*(void *)(v41 - 8) + 64);
      MEMORY[0x270FA5388](v41);
      v69[1] = v43;
      unint64_t v86 = (v43 + 15) & 0xFFFFFFFFFFFFFFF0;
      uint64_t v87 = (uint64_t (*)(char *, uint64_t, uint64_t))v38;
      uint64_t v44 = v22;
      BOOL v45 = (char *)v69 - v86;
      uint64_t v46 = (char *)v69 + *(int *)(v42 + 56) - v86;
      uint64_t v75 = v39;
      uint64_t v47 = (uint64_t (*)(char *, char *, uint64_t))v92;
      v92((char *)v69 - v86, v90, v13);
      uint64_t v70 = v46;
      uint64_t v48 = v47(v46, v88, v13);
      v69[0] = v69;
      MEMORY[0x270FA5388](v48);
      unint64_t v49 = (char *)v69 - v86;
      unint64_t v50 = (char *)v69 + *(int *)(v42 + 56) - v86;
      v47((char *)v69 - v86, v45, v13);
      v47(v50, v46, v13);
      uint64_t v51 = (void (*)(char *, char *, uint64_t))v44[4];
      uint64_t v52 = (uint64_t)v71;
      v51(v71, v49, v13);
      uint64_t v53 = v50;
      uint64_t v54 = (void (*)(char *, uint64_t))v87;
      uint64_t v55 = ((uint64_t (*)(char *, uint64_t))v87)(v53, v13);
      uint64_t v91 = v69;
      MEMORY[0x270FA5388](v55);
      uint64_t v56 = (char *)v69 - v86;
      uint64_t v57 = (char *)v69 + *(int *)(v42 + 56) - v86;
      v51((char *)v69 - v86, v45, v13);
      v51(v57, v70, v13);
      v51((char *)(v52 + *(int *)(v80 + 36)), v57, v13);
      v54(v56, v13);
      uint64_t v58 = v84;
      sub_2486996EC(v52, v84);
      v54(v88, v13);
      v54(v90, v13);
      uint64_t v59 = v78;
      uint64_t v60 = sub_2486ABB28();
      LOBYTE(v44) = v60;
      uint64_t v91 = v69;
      MEMORY[0x270FA5388](v60);
      uint64_t v61 = (char *)v69 - v76;
      uint64_t v62 = v59;
      uint64_t v63 = ((uint64_t (*)(char *, char *, uint64_t))v92)((char *)v69 - v76, v59, v13);
      MEMORY[0x270FA5388](v63);
      uint64_t v64 = (char *)v69 - v74;
      sub_248699754(v58, (uint64_t)v69 - v74, &qword_26931D4C0);
      if (v44) {
        char v65 = sub_2486ABB38();
      }
      else {
        char v65 = 0;
      }
      uint64_t v66 = v94;
      sub_24868D470((uint64_t)v64, &qword_26931D4C0);
      uint64_t v67 = v61;
      uint64_t v68 = (void (*)(char *, uint64_t))v87;
      ((void (*)(char *, uint64_t))v87)(v67, v13);
      sub_24868D470(v84, &qword_26931D4C0);
      v68(v62, v13);
      sub_24869514C(v66);
      return v65 & 1;
    }
    __break(1u);
LABEL_15:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_248698994(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for ATSpotlightDataRecord();
  uint64_t v24 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v23 = (uint64_t)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v20 - v11;
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t v22 = *(void *)(a3 + 16);
  if (v22)
  {
    unint64_t v14 = 0;
    uint64_t v15 = MEMORY[0x263F8EE78];
    v20[1] = a2;
    uint64_t v21 = a3;
    v20[0] = a1;
    while (v14 < *(void *)(a3 + 16))
    {
      unint64_t v16 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      uint64_t v13 = *(void *)(v24 + 72);
      sub_24869222C(a3 + v16 + v13 * v14, (uint64_t)v12);
      char v17 = a1(v12);
      if (v3)
      {
        sub_24869514C((uint64_t)v12);
        swift_release();
        swift_bridgeObjectRelease();
        return v13;
      }
      if (v17)
      {
        sub_24869963C((uint64_t)v12, v23);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_24868B228(0, *(void *)(v15 + 16) + 1, 1);
        }
        uint64_t v15 = v25;
        unint64_t v19 = *(void *)(v25 + 16);
        unint64_t v18 = *(void *)(v25 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_24868B228(v18 > 1, v19 + 1, 1);
          uint64_t v15 = v25;
        }
        *(void *)(v15 + 16) = v19 + 1;
        uint64_t result = sub_24869963C(v23, v15 + v16 + v19 * v13);
        a3 = v21;
        a1 = (uint64_t (*)(char *))v20[0];
      }
      else
      {
        uint64_t result = sub_24869514C((uint64_t)v12);
      }
      if (v22 == ++v14)
      {
        uint64_t v13 = v25;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t ATSpotlightCalendarRetriever.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC15ArchetypeEngine28ATSpotlightCalendarRetriever_bundleID);
  *uint64_t v1 = 0xD000000000000013;
  v1[1] = 0x80000002486AD020;
  *(void *)(v0 + OBJC_IVAR____TtC15ArchetypeEngine28ATSpotlightCalendarRetriever_timestampSearchPaddingInSeconds) = 30;
  uint64_t v2 = sub_2486AB8F8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2486AB8E8();
  sub_2486AB878();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v0 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_records) = MEMORY[0x263F8EE78];
  return v0;
}

uint64_t ATSpotlightCalendarRetriever.init()()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC15ArchetypeEngine28ATSpotlightCalendarRetriever_bundleID);
  *uint64_t v1 = 0xD000000000000013;
  v1[1] = 0x80000002486AD020;
  *(void *)(v0 + OBJC_IVAR____TtC15ArchetypeEngine28ATSpotlightCalendarRetriever_timestampSearchPaddingInSeconds) = 30;
  uint64_t v2 = sub_2486AB8F8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2486AB8E8();
  sub_2486AB878();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v0 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_records) = MEMORY[0x263F8EE78];
  return v0;
}

uint64_t sub_248698E60()
{
  return swift_bridgeObjectRelease();
}

uint64_t ATSpotlightCalendarRetriever.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_oneYearBack;
  uint64_t v2 = sub_2486AB8F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ATSpotlightCalendarRetriever.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_oneYearBack;
  uint64_t v2 = sub_2486AB8F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_248698FC8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_248699018(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_2486990F4;
  return sub_24869ED70(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2486990F4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2486991E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2486ABC58();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2486ABC48();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24868D470(a1, &qword_26931D488);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2486ABC28();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_248699394(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_2486993A4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248699480;
  return v6(a1);
}

uint64_t sub_248699480()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_248699578(uint64_t a1)
{
  return sub_248698094(a1, *(char **)(v1 + 16)) & 1;
}

uint64_t sub_248699598()
{
  return type metadata accessor for ATSpotlightCalendarRetriever();
}

uint64_t type metadata accessor for ATSpotlightCalendarRetriever()
{
  uint64_t result = qword_26931D4B0;
  if (!qword_26931D4B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2486995EC()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_24869963C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ATSpotlightDataRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2486996A0()
{
  unint64_t result = qword_26931D4C8;
  if (!qword_26931D4C8)
  {
    sub_2486AB8F8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931D4C8);
  }
  return result;
}

uint64_t sub_2486996EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D4C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248699754(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2486997B8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2486997F0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2486990F4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26931D4D8 + dword_26931D4D8);
  return v6(a1, v4);
}

uint64_t sub_2486998AC()
{
  uint64_t v1 = v0;
  char v2 = *(unsigned char *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 24);
  if (v2)
  {
    if (v3) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2486ABC68();
  if ((v3 & 1) == 0) {
LABEL_3:
  }
    sub_2486ABC68();
LABEL_5:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2486ABD98();
  swift_bridgeObjectRelease();
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  sub_2486ABBB8();
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  sub_2486ABBB8();
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  sub_2486ABBB8();
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  sub_2486ABBB8();
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  sub_2486ABBB8();
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  sub_2486ABBB8();
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  if (*(void *)(v1 + 120))
  {
    swift_bridgeObjectRetain();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    sub_2486ABBB8();
  }
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  return 40;
}

uint64_t sub_248699C90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v77 = a2;
  uint64_t v5 = (int *)type metadata accessor for ATMegadomeLifeEvent();
  uint64_t v73 = v5[9];
  *(uint64_t *)((char *)a3 + v73) = (uint64_t)objc_msgSend(objc_allocWithZone(MEMORY[0x263F08788]), sel_init);
  *a3 = sub_2486AB9D8();
  a3[1] = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D528);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2486AB9F8();
  uint64_t v12 = sub_24869D6BC(&qword_26931D530, MEMORY[0x270FB9918]);
  uint64_t v72 = v11;
  MEMORY[0x24C57B150](v11, v12);
  uint64_t v13 = sub_2486AB948();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)v71 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2486AB998();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D4E8);
  MEMORY[0x270FA5388](v17 - 8);
  unint64_t v19 = (char *)v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2486AB938();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v20 = v5[5];
  unint64_t v76 = a3;
  sub_24868D544((uint64_t)v19, (uint64_t)a3 + v20, &qword_26931D4E8);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
  uint64_t v22 = *(void *)(*(void *)(v21 - 8) + 64);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D538);
  uint64_t v24 = *(void *)(*(void *)(v23 - 8) + 64);
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v74 = a1;
  sub_2486AB9C8();
  uint64_t v25 = sub_2486ABA28();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
  if (v27((char *)v71 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v25) == 1)
  {
    sub_24868D470((uint64_t)v71 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26931D538);
    uint64_t v28 = sub_2486AB8F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))((char *)v71 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v28);
  }
  else
  {
    sub_2486ABA18();
    (*(void (**)(char *, uint64_t))(v26 + 8))((char *)v71 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v25);
  }
  uint64_t v29 = sub_24868D544((uint64_t)v71 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v76 + v5[6], &qword_26931D240);
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  uint64_t v31 = (char *)v71 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  char v32 = (char *)v71 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2486AB9C8();
  if (v27(v32, 1, v25) == 1)
  {
    sub_24868D470((uint64_t)v32, &qword_26931D538);
    uint64_t v33 = sub_2486AB8F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v31, 1, 1, v33);
  }
  else
  {
    sub_2486ABA08();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v32, v25);
  }
  uint64_t v34 = v76;
  sub_24868D544((uint64_t)v31, (uint64_t)v76 + v5[7], &qword_26931D240);
  uint64_t v75 = v5[8];
  *(uint64_t *)((char *)v34 + v75) = MEMORY[0x263F8EE78];
  uint64_t v35 = sub_2486AB9E8();
  uint64_t v36 = *(void *)(v35 + 16);
  if (v36)
  {
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D540);
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)(v37 - 8);
    uint64_t v83 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 16);
    unint64_t v40 = (*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
    v71[1] = v35;
    unint64_t v41 = v35 + v40;
    uint64_t v81 = (uint64_t (**)(char *, uint64_t))(v39 + 8);
    uint64_t v80 = *(void *)(v39 + 72);
    uint64_t v82 = v39 + 16;
    uint64_t v79 = *(void *)(v39 + 64);
    uint64_t v84 = v37;
    do
    {
      uint64_t v92 = v71;
      MEMORY[0x270FA5388](v37);
      uint64_t v43 = (char *)v71 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
      v83(v43, v41, v38);
      uint64_t v44 = sub_2486AB978();
      uint64_t v91 = v71;
      uint64_t v89 = v44;
      uint64_t v88 = *(void *)(v44 - 8);
      uint64_t v45 = *(void *)(v88 + 64);
      MEMORY[0x270FA5388](v44);
      uint64_t v85 = (char *)v71 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D548);
      uint64_t v87 = v71;
      MEMORY[0x270FA5388](v46 - 8);
      uint64_t v48 = (char *)v71 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D550);
      unint64_t v86 = v71;
      MEMORY[0x270FA5388](v49 - 8);
      uint64_t v51 = (char *)v71 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v90 = v43;
      sub_2486ABA38();
      uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D558);
      uint64_t v53 = *(void *)(v52 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48))(v51, 1, v52) == 1)
      {
        sub_24868D470((uint64_t)v51, &qword_26931D550);
        uint64_t v38 = v84;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v88 + 56))(v48, 1, 1, v89);
      }
      else
      {
        uint64_t v78 = v36;
        uint64_t v93 = v77;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26931D4F8);
        sub_24869D704();
        sub_24869D6BC(&qword_26931D508, MEMORY[0x270FB98B0]);
        sub_2486AB988();
        (*(void (**)(char *, uint64_t))(v53 + 8))(v51, v52);
        uint64_t v54 = v88;
        uint64_t v55 = v89;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v88 + 48))(v48, 1, v89) != 1)
        {
          uint64_t v56 = v85;
          uint64_t v57 = (*(uint64_t (**)(char *, char *, uint64_t))(v54 + 32))(v85, v48, v55);
          MEMORY[0x270FA5388](v57);
          (*(void (**)(char *, char *, uint64_t))(v54 + 16))((char *)v71 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0), v56, v55);
          sub_24869D754((uint64_t)v71 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v94);
          uint64_t v58 = *(void **)((char *)v76 + v75);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v36 = v78;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            uint64_t v58 = sub_248688FC0(0, v58[2] + 1, 1, v58);
          }
          unint64_t v61 = v58[2];
          unint64_t v60 = v58[3];
          if (v61 >= v60 >> 1) {
            uint64_t v58 = sub_248688FC0((void *)(v60 > 1), v61 + 1, 1, v58);
          }
          v58[2] = v61 + 1;
          uint64_t v62 = &v58[16 * v61];
          long long v63 = v94[0];
          long long v64 = v94[1];
          long long v65 = v94[3];
          v62[4] = v94[2];
          v62[5] = v65;
          v62[2] = v63;
          v62[3] = v64;
          long long v66 = v94[4];
          long long v67 = v94[5];
          long long v68 = v94[7];
          v62[8] = v94[6];
          v62[9] = v68;
          v62[6] = v66;
          v62[7] = v67;
          *(uint64_t *)((char *)v76 + v75) = (uint64_t)v58;
          (*(void (**)(char *, uint64_t))(v54 + 8))(v56, v55);
          uint64_t v38 = v84;
          uint64_t v37 = (*v81)(v90, v84);
          goto LABEL_13;
        }
        uint64_t v36 = v78;
        uint64_t v38 = v84;
      }
      (*v81)(v90, v38);
      uint64_t v37 = sub_24868D470((uint64_t)v48, &qword_26931D548);
LABEL_13:
      v41 += v80;
      --v36;
    }
    while (v36);
  }
  swift_bridgeObjectRelease();
  uint64_t v69 = *(void **)((char *)v76 + v73);
  objc_msgSend(v69, sel_setDateStyle_, 1);
  objc_msgSend(v69, sel_setTimeStyle_, 1);
  swift_release();
  return (*(uint64_t (**)(uint64_t))(*(void *)(v72 - 8) + 8))(v74);
}

uint64_t ATMegadomeLifeEvent.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[1];
  if (v2)
  {
    v56[0] = *v1;
    v56[1] = v2;
  }
  else
  {
    HIBYTE(v56[1]) = -18;
    strcpy((char *)v56, "[unknown name]");
  }
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D4E8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (int *)type metadata accessor for ATMegadomeLifeEvent();
  sub_248699754((uint64_t)v1 + v6[5], (uint64_t)v5, &qword_26931D4E8);
  uint64_t v7 = sub_2486AB918();
  uint64_t v8 = *(void *)(v7 - 8);
  int v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7);
  swift_bridgeObjectRetain();
  if (v9 == 1)
  {
    sub_24868D470((uint64_t)v5, &qword_26931D4E8);
    HIBYTE(v55[1]) = -18;
    strcpy((char *)v55, "[unknown type]");
  }
  else
  {
    v55[0] = sub_2486AB908();
    v55[1] = v10;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  unint64_t v57 = 0xEE005D6574616420;
  uint64_t v11 = (uint64_t)v1 + v6[6];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
  uint64_t v13 = *(void *)(*(void *)(v12 - 8) + 64);
  MEMORY[0x270FA5388](v12 - 8);
  unint64_t v14 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v53 = v11;
  sub_248699754(v11, (uint64_t)&v50 - v14, &qword_26931D240);
  uint64_t v15 = sub_2486AB8F8();
  uint64_t v54 = *(void *)(v15 - 8);
  unint64_t v16 = *(uint64_t (**)(char *, uint64_t))(v54 + 48);
  uint64_t v59 = v15;
  int v17 = v16((char *)&v50 - v14, 1);
  uint64_t v18 = sub_24868D470((uint64_t)&v50 - v14, &qword_26931D240);
  uint64_t v58 = 0x6E776F6E6B6E755BLL;
  unint64_t v19 = 0xEE005D6574616420;
  if (v17 != 1)
  {
    uint64_t v52 = v6;
    uint64_t v20 = *(void **)((char *)v1 + v6[9]);
    uint64_t v51 = v13;
    MEMORY[0x270FA5388](v18);
    unint64_t v50 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v21 = (char *)&v50 - v14;
    sub_248699754(v53, (uint64_t)v21, &qword_26931D240);
    uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v16)(v21, 1, v59);
    if (result == 1)
    {
      __break(1u);
      goto LABEL_21;
    }
    uint64_t v23 = (void *)sub_2486AB888();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v21, v59);
    id v24 = objc_msgSend(v20, sel_stringFromDate_, v23);

    uint64_t v58 = sub_2486ABB68();
    unint64_t v19 = v25;

    uint64_t v6 = v52;
    uint64_t v13 = v51;
    unint64_t v14 = v50;
  }
  uint64_t v53 = v19;
  uint64_t v26 = (uint64_t)v1 + v6[7];
  MEMORY[0x270FA5388](v18);
  uint64_t v27 = (char *)&v50 - v14;
  sub_248699754(v26, (uint64_t)v27, &qword_26931D240);
  int v28 = ((uint64_t (*)(char *, uint64_t, uint64_t))v16)(v27, 1, v59);
  uint64_t v29 = sub_24868D470((uint64_t)v27, &qword_26931D240);
  if (v28 != 1)
  {
    uint64_t v30 = *(void **)((char *)v1 + v6[9]);
    MEMORY[0x270FA5388](v29);
    sub_248699754(v26, (uint64_t)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26931D240);
    uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v16)((char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v59);
    if (result != 1)
    {
      uint64_t v31 = (void *)sub_2486AB888();
      (*(void (**)(char *, uint64_t))(v54 + 8))((char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v59);
      id v32 = objc_msgSend(v30, sel_stringFromDate_, v31);

      sub_2486ABB68();
      unint64_t v57 = v33;

      goto LABEL_13;
    }
LABEL_21:
    __break(1u);
    return result;
  }
LABEL_13:
  uint64_t v34 = *(void *)((char *)v1 + v6[8]);
  int64_t v35 = *(void *)(v34 + 16);
  uint64_t v36 = MEMORY[0x263F8EE78];
  if (v35)
  {
    uint64_t v60 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_24868B208(0, v35, 0);
    uint64_t v37 = 32;
    uint64_t v36 = v60;
    do
    {
      long long v38 = *(_OWORD *)(v34 + v37);
      long long v39 = *(_OWORD *)(v34 + v37 + 16);
      long long v40 = *(_OWORD *)(v34 + v37 + 48);
      v62[2] = *(_OWORD *)(v34 + v37 + 32);
      v62[3] = v40;
      v62[0] = v38;
      v62[1] = v39;
      long long v41 = *(_OWORD *)(v34 + v37 + 64);
      long long v42 = *(_OWORD *)(v34 + v37 + 80);
      long long v43 = *(_OWORD *)(v34 + v37 + 112);
      v62[6] = *(_OWORD *)(v34 + v37 + 96);
      v62[7] = v43;
      v62[4] = v41;
      v62[5] = v42;
      sub_24869BA80((uint64_t)v62);
      uint64_t v44 = sub_2486998AC();
      uint64_t v46 = v45;
      sub_24869BAF8((uint64_t)v62);
      uint64_t v60 = v36;
      unint64_t v48 = *(void *)(v36 + 16);
      unint64_t v47 = *(void *)(v36 + 24);
      if (v48 >= v47 >> 1)
      {
        sub_24868B208(v47 > 1, v48 + 1, 1);
        uint64_t v36 = v60;
      }
      *(void *)(v36 + 16) = v48 + 1;
      unint64_t v49 = v36 + 16 * v48;
      *(void *)(v49 + 32) = v44;
      *(void *)(v49 + 40) = v46;
      v37 += 128;
      --v35;
    }
    while (v35);
    swift_bridgeObjectRelease();
  }
  uint64_t v60 = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D308);
  sub_24869BB70();
  sub_2486ABB18();
  swift_bridgeObjectRelease();
  uint64_t v60 = 0;
  unint64_t v61 = 0xE000000000000000;
  sub_2486ABD98();
  swift_bridgeObjectRelease();
  uint64_t v60 = 10;
  unint64_t v61 = 0xE100000000000000;
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  sub_2486ABBB8();
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  sub_2486ABBB8();
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  sub_2486ABBB8();
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  sub_2486ABBB8();
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  sub_2486ABBB8();
  return v60;
}

uint64_t type metadata accessor for ATMegadomeLifeEvent()
{
  uint64_t result = qword_26931D510;
  if (!qword_26931D510) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ATMegadomeDataRetriever.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t ATMegadomeDataRetriever.init()()
{
  return v0;
}

uint64_t ATMegadomeDataRetriever.getLifeEvents(nRecords:start:end:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v69 = MEMORY[0x263F8EE78];
  if (MEMORY[0x263F4E828]) {
    BOOL v3 = MEMORY[0x263F4E830] == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3 || MEMORY[0x263F4E838] == 0 || MEMORY[0x263F4E818] == 0 || MEMORY[0x263F4E820] == 0) {
    return v69;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D4F8);
  uint64_t v10 = sub_2486AB9B8();
  uint64_t v59 = a1;
  uint64_t v11 = sub_2486AB8F8();
  uint64_t v60 = v47;
  uint64_t v12 = *(void **)(v11 - 8);
  uint64_t v13 = v12[8];
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  unint64_t v15 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  long long v65 = (char *)v47 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t result = sub_2486AB8E8();
  if ((unsigned __int128)(a2 * (__int128)86400) >> 64 != (86400 * a2) >> 63)
  {
    __break(1u);
    goto LABEL_22;
  }
  sub_2486AB878();
  uint64_t v58 = v12;
  long long v63 = (uint64_t (*)(char *, uint64_t))v12[1];
  long long v64 = v12 + 1;
  uint64_t v17 = v63((char *)v47 - v15, v11);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v62 = (char *)v47 - v15;
  MEMORY[0x270FA5388](v18);
  uint64_t result = sub_2486AB8E8();
  if ((unsigned __int128)(a3 * (__int128)86400) >> 64 != (86400 * a3) >> 63)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v55 = v47;
  uint64_t v56 = v10;
  unint64_t v57 = 0;
  sub_2486AB878();
  v63((char *)v47 - v15, v11);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D4C0);
  uint64_t v54 = v47;
  uint64_t v52 = v19;
  uint64_t v20 = *(void *)(*(void *)(v19 - 8) + 64);
  MEMORY[0x270FA5388](v19);
  unint64_t v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v53 = (uint64_t)v47 - v21;
  sub_24869D6BC((unint64_t *)&qword_26931D4C8, MEMORY[0x270FA9278]);
  uint64_t result = sub_2486ABB38();
  if (result)
  {
    uint64_t v51 = v47;
    MEMORY[0x270FA5388](result);
    unint64_t v61 = (char *)v47 - v21;
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D4D0);
    unint64_t v50 = v47;
    uint64_t v23 = v22 - 8;
    uint64_t v24 = *(void *)(*(void *)(v22 - 8) + 64);
    MEMORY[0x270FA5388](v22);
    unint64_t v49 = (v24 + 15) & 0xFFFFFFFFFFFFFFF0;
    unint64_t v25 = (char *)v47 + *(int *)(v23 + 56) - v49;
    uint64_t v26 = v58;
    uint64_t v27 = (void (*)(char *, char *, uint64_t))v58[2];
    v27((char *)v47 - v49, v65, v11);
    unint64_t v48 = v25;
    uint64_t v28 = ((uint64_t (*)(char *, char *, uint64_t))v27)(v25, v62, v11);
    v47[1] = v47;
    MEMORY[0x270FA5388](v28);
    uint64_t v29 = (char *)v47 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v30 = &v29[*(int *)(v23 + 56)];
    v27(v29, v29, v11);
    v27(v30, v25, v11);
    uint64_t v31 = (void (*)(char *, char *, uint64_t))v26[4];
    v31(v61, v29, v11);
    id v32 = (void (*)(char *, uint64_t))v63;
    uint64_t v33 = v63(v30, v11);
    uint64_t v58 = v47;
    MEMORY[0x270FA5388](v33);
    uint64_t v34 = (char *)v47 - v49;
    int64_t v35 = (char *)v47 + *(int *)(v23 + 56) - v49;
    v31((char *)v47 - v49, (char *)v47 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
    v31(v35, v48, v11);
    uint64_t v36 = v61;
    v31(&v61[*(int *)(v52 + 36)], v35, v11);
    v32(v34, v11);
    uint64_t v37 = (uint64_t)v36;
    uint64_t v38 = v53;
    uint64_t v39 = sub_24868D544(v37, v53, &qword_26931D4C0);
    MEMORY[0x270FA5388](v39);
    uint64_t v40 = v56;
    v47[-4] = &v69;
    v47[-3] = v40;
    v47[-2] = v59;
    sub_24869D6BC(&qword_26931D508, MEMORY[0x270FB98B0]);
    long long v41 = v57;
    sub_2486AB9A8();
    sub_24868D470(v38, &qword_26931D4C0);
    if (v41)
    {
      long long v42 = (void (*)(char *, uint64_t))v63;
      v63(v62, v11);
      v42(v65, v11);
      swift_release();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26931D500);
      uint64_t v43 = swift_allocObject();
      *(_OWORD *)(v43 + 16) = xmmword_2486AC710;
      uint64_t v67 = 0;
      unint64_t v68 = 0xE000000000000000;
      sub_2486ABD98();
      sub_2486ABBB8();
      long long v66 = v41;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26931D2D8);
      sub_2486ABE48();
      sub_2486ABBB8();
      uint64_t v44 = v67;
      unint64_t v45 = v68;
      *(void *)(v43 + 56) = MEMORY[0x263F8D310];
      *(void *)(v43 + 32) = v44;
      *(void *)(v43 + 40) = v45;
      sub_2486ABF98();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v46 = (void (*)(char *, uint64_t))v63;
      v63(v62, v11);
      v46(v65, v11);
      swift_release();
    }
    return v69;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_24869B850(uint64_t a1, BOOL *a2, unint64_t *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v10 = type metadata accessor for ATMegadomeLifeEvent();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (void *)((char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = sub_2486AB9F8();
  MEMORY[0x270FA5388](v14);
  unint64_t v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v17 + 16))(v16, a1);
  swift_retain();
  sub_248699C90((uint64_t)v16, a4, v13);
  unint64_t v18 = *a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a3 = v18;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v18 = sub_2486890D0(0, *(void *)(v18 + 16) + 1, 1, v18);
    *a3 = v18;
  }
  unint64_t v21 = *(void *)(v18 + 16);
  unint64_t v20 = *(void *)(v18 + 24);
  if (v21 >= v20 >> 1)
  {
    unint64_t v18 = sub_2486890D0(v20 > 1, v21 + 1, 1, v18);
    *a3 = v18;
  }
  *(void *)(v18 + 16) = v21 + 1;
  uint64_t result = sub_24869D658((uint64_t)v13, v18+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(void *)(v11 + 72) * v21);
  *a2 = *(void *)(*a3 + 16) >= a5;
  return result;
}

uint64_t ATMegadomeDataRetriever.deinit()
{
  return v0;
}

uint64_t ATMegadomeDataRetriever.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_24869BA80(uint64_t a1)
{
  return a1;
}

uint64_t sub_24869BAF8(uint64_t a1)
{
  return a1;
}

unint64_t sub_24869BB70()
{
  unint64_t result = qword_26931D4F0;
  if (!qword_26931D4F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26931D308);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931D4F0);
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

uint64_t sub_24869BC14(uint64_t a1, BOOL *a2)
{
  return sub_24869B850(a1, a2, *(unint64_t **)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t *initializeBufferWithCopyOfBuffer for ATMegadomeLifeEvent(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    int v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2486AB918();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D4E8);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v16 = a3[6];
    uint64_t v17 = (char *)v4 + v16;
    unint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = sub_2486AB8F8();
    uint64_t v20 = *(void *)(v19 - 8);
    unint64_t v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
    if (v21(v18, 1, v19))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
      memcpy(v17, v18, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
    }
    uint64_t v23 = a3[7];
    uint64_t v24 = (char *)v4 + v23;
    unint64_t v25 = (char *)a2 + v23;
    if (v21((char *)a2 + v23, 1, v19))
    {
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
      memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v24, v25, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v24, 0, 1, v19);
    }
    uint64_t v27 = a3[9];
    *(uint64_t *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    uint64_t v28 = *(void **)((char *)a2 + v27);
    *(uint64_t *)((char *)v4 + v27) = (uint64_t)v28;
    swift_bridgeObjectRetain();
    id v29 = v28;
  }
  return v4;
}

void destroy for ATMegadomeLifeEvent(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_2486AB918();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + a2[6];
  uint64_t v8 = sub_2486AB8F8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v10(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  uint64_t v11 = a1 + a2[7];
  if (!v10(v11, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v8);
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void **)(a1 + a2[9]);
}

void *initializeWithCopy for ATMegadomeLifeEvent(void *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *a1 = *(void *)a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_2486AB918();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D4E8);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = a3[6];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = &a2[v14];
  uint64_t v17 = sub_2486AB8F8();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (v19(v16, 1, v17))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v15, v16, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  uint64_t v21 = a3[7];
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = &a2[v21];
  if (v19(&a2[v21], 1, v17))
  {
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v22, v23, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v22, 0, 1, v17);
  }
  uint64_t v25 = a3[9];
  *(void *)((char *)a1 + a3[8]) = *(void *)&a2[a3[8]];
  uint64_t v26 = *(void **)&a2[v25];
  *(void *)((char *)a1 + v25) = v26;
  swift_bridgeObjectRetain();
  id v27 = v26;
  return a1;
}

char *assignWithCopy for ATMegadomeLifeEvent(char *a1, void *a2, int *a3)
{
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2486AB918();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D4E8);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_2486AB8F8();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
LABEL_12:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v16, v17, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v16, v17, v18);
LABEL_13:
  uint64_t v24 = a3[7];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = (char *)a2 + v24;
  int v27 = v20(&a1[v24], 1, v18);
  int v28 = v20(v26, 1, v18);
  if (!v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v25, v26, v18);
      goto LABEL_19;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v25, v18);
    goto LABEL_18;
  }
  if (v28)
  {
LABEL_18:
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v25, v26, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v25, 0, 1, v18);
LABEL_19:
  *(void *)&a1[a3[8]] = *(void *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[9];
  uint64_t v31 = *(void **)((char *)a2 + v30);
  id v32 = *(void **)&a1[v30];
  *(void *)&a1[v30] = v31;
  id v33 = v31;

  return a1;
}

_OWORD *initializeWithTake for ATMegadomeLifeEvent(_OWORD *a1, char *a2, int *a3)
{
  *a1 = *(_OWORD *)a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_2486AB918();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D4E8);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[6];
  int v13 = (char *)a1 + v12;
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_2486AB8F8();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  if (v17(v14, 1, v15))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  uint64_t v19 = a3[7];
  uint64_t v20 = (char *)a1 + v19;
  int v21 = &a2[v19];
  if (v17(&a2[v19], 1, v15))
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v20, v21, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v20, 0, 1, v15);
  }
  uint64_t v23 = a3[9];
  *(void *)((char *)a1 + a3[8]) = *(void *)&a2[a3[8]];
  *(void *)((char *)a1 + v23) = *(void *)&a2[v23];
  return a1;
}

char *assignWithTake for ATMegadomeLifeEvent(char *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2486AB918();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D4E8);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = a3[6];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = sub_2486AB8F8();
  uint64_t v20 = *(void *)(v19 - 8);
  int v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v17, v18, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v23)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v19);
LABEL_12:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v17, v18, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v17, v18, v19);
LABEL_13:
  uint64_t v25 = a3[7];
  uint64_t v26 = &a1[v25];
  int v27 = (char *)a2 + v25;
  int v28 = v21(&a1[v25], 1, v19);
  int v29 = v21(v27, 1, v19);
  if (!v28)
  {
    if (!v29)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v26, v27, v19);
      goto LABEL_19;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v26, v19);
    goto LABEL_18;
  }
  if (v29)
  {
LABEL_18:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v26, v27, v19);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v26, 0, 1, v19);
LABEL_19:
  *(void *)&a1[a3[8]] = *(void *)((char *)a2 + a3[8]);
  swift_bridgeObjectRelease();
  uint64_t v31 = a3[9];
  id v32 = *(void **)&a1[v31];
  *(void *)&a1[v31] = *(void *)((char *)a2 + v31);

  return a1;
}

uint64_t getEnumTagSinglePayload for ATMegadomeLifeEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24869CED8);
}

uint64_t sub_24869CED8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D4E8);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84) == a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 - 8);
    uint64_t v9 = a3[5];
LABEL_5:
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v11(a1 + v9, a2, v7);
  }
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
  if (*(_DWORD *)(*(void *)(v10 - 8) + 84) == a2)
  {
    uint64_t v7 = v10;
    uint64_t v8 = *(void *)(v10 - 8);
    uint64_t v9 = a3[6];
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + a3[8]);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t storeEnumTagSinglePayload for ATMegadomeLifeEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24869D004);
}

uint64_t sub_24869D004(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D4E8);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
  }
  else
  {
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
    if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
    {
      *(void *)(a1 + a4[8]) = (a2 - 1);
      return result;
    }
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(result - 8);
    uint64_t v11 = a4[6];
  }
  unint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  return v13(a1 + v11, a2, a2, v9);
}

void sub_24869D118()
{
  sub_24869D228(319, &qword_26931D520, MEMORY[0x270FB9860]);
  if (v0 <= 0x3F)
  {
    sub_24869D228(319, (unint64_t *)&qword_26931D350, MEMORY[0x270FA91D0]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_24869D228(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_2486ABCF8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t type metadata accessor for ATMegadomeDataRetriever()
{
  return self;
}

uint64_t destroy for ATLocation()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ATLocation(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  uint64_t v3 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v3;
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  uint64_t v5 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v5;
  uint64_t v6 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  uint64_t v7 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v7;
  uint64_t v8 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ATLocation(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  uint64_t v5 = a2[2];
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = a2[6];
  *(void *)(a1 + 56) = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = a2[8];
  *(void *)(a1 + 72) = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = a2[10];
  *(void *)(a1 + 88) = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = a2[12];
  *(void *)(a1 + 104) = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = a2[14];
  *(void *)(a1 + 120) = a2[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy128_8(uint64_t a1, long long *a2)
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
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for ATLocation(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ATLocation(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 128)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 40);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ATLocation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 128) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 128) = 0;
    }
    if (a2) {
      *(void *)(result + 40) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ATLocation()
{
  return &type metadata for ATLocation;
}

uint64_t sub_24869D658(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ATMegadomeLifeEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24869D6BC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24869D704()
{
  unint64_t result = qword_26931D560;
  if (!qword_26931D560)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26931D4F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931D560);
  }
  return result;
}

uint64_t sub_24869D754@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D568);
  uint64_t v5 = *(void *)(*(void *)(v4 - 8) + 64);
  MEMORY[0x270FA5388](v4 - 8);
  sub_2486AB968();
  uint64_t v6 = sub_2486ABAD8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8((char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v6) == 1)
  {
    uint64_t v9 = sub_24868D470((uint64_t)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26931D568);
    uint64_t v60 = 0;
    char v10 = 1;
  }
  else
  {
    uint64_t v60 = sub_2486ABAB8();
    char v10 = v11 & 1;
    uint64_t v9 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))((char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  }
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2486AB968();
  if (v8(v12, 1, v6) == 1)
  {
    sub_24868D470((uint64_t)v12, &qword_26931D568);
    uint64_t v59 = 0;
    char v13 = 1;
  }
  else
  {
    uint64_t v59 = sub_2486ABAC8();
    char v13 = v14 & 1;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
  char v62 = v10;
  char v61 = v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D570);
  uint64_t v16 = *(void *)(*(void *)(v15 - 8) + 64);
  MEMORY[0x270FA5388](v15 - 8);
  sub_2486AB958();
  uint64_t v17 = sub_2486ABAA8();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (v19((char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v17) == 1)
  {
    uint64_t v20 = sub_24868D470((uint64_t)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26931D570);
    uint64_t v57 = 0;
    uint64_t v58 = 0;
  }
  else
  {
    uint64_t v21 = sub_2486ABA88();
    uint64_t v57 = v22;
    uint64_t v58 = v21;
    uint64_t v20 = (*(uint64_t (**)(char *, uint64_t))(v18 + 8))((char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
  }
  MEMORY[0x270FA5388](v20);
  sub_2486AB958();
  if (v19((char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v17) == 1)
  {
    uint64_t v23 = sub_24868D470((uint64_t)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26931D570);
    uint64_t v55 = 0;
    uint64_t v56 = 0;
  }
  else
  {
    uint64_t v24 = sub_2486ABA68();
    uint64_t v55 = v25;
    uint64_t v56 = v24;
    uint64_t v23 = (*(uint64_t (**)(char *, uint64_t))(v18 + 8))((char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
  }
  MEMORY[0x270FA5388](v23);
  sub_2486AB958();
  if (v19((char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v17) == 1)
  {
    uint64_t v26 = sub_24868D470((uint64_t)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26931D570);
    uint64_t v53 = 0;
    uint64_t v54 = 0;
  }
  else
  {
    uint64_t v27 = sub_2486ABA78();
    uint64_t v53 = v28;
    uint64_t v54 = v27;
    uint64_t v26 = (*(uint64_t (**)(char *, uint64_t))(v18 + 8))((char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
  }
  MEMORY[0x270FA5388](v26);
  sub_2486AB958();
  if (v19((char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v17) == 1)
  {
    uint64_t v29 = sub_24868D470((uint64_t)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26931D570);
    uint64_t v51 = 0;
    uint64_t v52 = 0;
  }
  else
  {
    uint64_t v30 = sub_2486ABA48();
    uint64_t v51 = v31;
    uint64_t v52 = v30;
    uint64_t v29 = (*(uint64_t (**)(char *, uint64_t))(v18 + 8))((char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
  }
  MEMORY[0x270FA5388](v29);
  sub_2486AB958();
  if (v19((char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v17) == 1)
  {
    uint64_t v32 = sub_24868D470((uint64_t)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_26931D570);
    uint64_t v49 = 0;
    uint64_t v50 = 0;
  }
  else
  {
    uint64_t v33 = sub_2486ABA98();
    uint64_t v49 = v34;
    uint64_t v50 = v33;
    uint64_t v32 = (*(uint64_t (**)(char *, uint64_t))(v18 + 8))((char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
  }
  MEMORY[0x270FA5388](v32);
  int64_t v35 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2486AB958();
  if (v19(v35, 1, v17) == 1)
  {
    uint64_t v36 = sub_2486AB978();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v36 - 8) + 8))(a1, v36);
    uint64_t result = sub_24868D470((uint64_t)v35, &qword_26931D570);
    uint64_t v38 = 0;
    uint64_t v39 = 0;
  }
  else
  {
    uint64_t v38 = sub_2486ABA58();
    uint64_t v39 = v40;
    uint64_t v41 = sub_2486AB978();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v41 - 8) + 8))(a1, v41);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v35, v17);
  }
  char v42 = v62;
  char v43 = v61;
  *(void *)a2 = v60;
  *(unsigned char *)(a2 + 8) = v42;
  *(void *)(a2 + 16) = v59;
  *(unsigned char *)(a2 + 24) = v43;
  uint64_t v44 = v57;
  *(void *)(a2 + 32) = v58;
  *(void *)(a2 + 40) = v44;
  uint64_t v45 = v55;
  *(void *)(a2 + 48) = v56;
  *(void *)(a2 + 56) = v45;
  uint64_t v46 = v53;
  *(void *)(a2 + 64) = v54;
  *(void *)(a2 + 72) = v46;
  uint64_t v47 = v51;
  *(void *)(a2 + 80) = v52;
  *(void *)(a2 + 88) = v47;
  uint64_t v48 = v49;
  *(void *)(a2 + 96) = v50;
  *(void *)(a2 + 104) = v48;
  *(void *)(a2 + 112) = v38;
  *(void *)(a2 + 120) = v39;
  return result;
}

uint64_t ATSpotlightDataRetriever.getRecentRecordsAsync(bundleId:nRecords:addendum:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[8] = a5;
  v6[9] = v5;
  v6[6] = a3;
  v6[7] = a4;
  v6[4] = a1;
  v6[5] = a2;
  return MEMORY[0x270FA2498](sub_24869DE50, 0, 0);
}

uint64_t sub_24869DE50()
{
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  id v4 = sub_2486A18D8(v3, v2, v0[7], v0[8]);
  v0[10] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[11] = v5;
  void v5[2] = v1;
  v5[3] = v3;
  v5[4] = v2;
  v5[5] = v4;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[12] = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D580);
  *uint64_t v6 = v0;
  v6[1] = sub_24869DF7C;
  return MEMORY[0x270FA2318](v0 + 2, 0, 0, 0xD000000000000032, 0x80000002486ADA90, sub_2486A1A4C, v5, v7);
}

uint64_t sub_24869DF7C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24869E094, 0, 0);
}

uint64_t sub_24869E094()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if (!*(void *)(v1 + 16)) {
    goto LABEL_6;
  }
  uint64_t v2 = (void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 48);
  swift_retain();
  uint64_t v5 = swift_bridgeObjectRetain();
  sub_2486A1A58(v5, v3);
  swift_release();
  swift_bridgeObjectRelease_n();
  swift_retain();
  uint64_t v6 = swift_bridgeObjectRetain();
  uint64_t v7 = sub_2486A1528(v6, v3);
  swift_release();
  swift_bridgeObjectRelease_n();
  *(void *)(v0 + 16) = v7;
  sub_24869ECC4((unint64_t *)(v0 + 16));
  uint64_t v1 = *(void *)(v0 + 16);
  if (*(void *)(v1 + 16) <= v4)
  {
LABEL_6:

    goto LABEL_12;
  }
  uint64_t v8 = *(void *)(v0 + 48);
  if (v8 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_2486ABF18();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain_n();
    uint64_t v9 = swift_dynamicCastClass();
    if (v9)
    {
      uint64_t v10 = v8;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v10 = *(void *)(v0 + 48);
      uint64_t v9 = MEMORY[0x263F8EE78];
    }
    uint64_t v11 = *(void *)(v9 + 16);
    swift_release();
    uint64_t v2 = *(void **)(v0 + 80);
    if (v11 == v10)
    {
      uint64_t v12 = swift_dynamicCastClass();

      if (!v12)
      {
        swift_bridgeObjectRelease();
        uint64_t v12 = MEMORY[0x263F8EE78];
      }
      goto LABEL_11;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(type metadata accessor for ATSpotlightDataRecord() - 8);
  uint64_t v12 = sub_248689A44(v1, v1 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80)), 0, (2 * v8) | 1);

LABEL_11:
  swift_bridgeObjectRelease_n();
  uint64_t v1 = v12;
LABEL_12:
  char v13 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v13(v1);
}

uint64_t ATSpotlightDataRetriever.getRecentRecords(bundleId:nRecords:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D488);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  uint64_t v12 = sub_2486ABC58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  char v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v4;
  v13[5] = a1;
  _OWORD v13[6] = a2;
  v13[7] = a3;
  v13[8] = v11;
  swift_retain();
  swift_bridgeObjectRetain();
  char v14 = v11;
  sub_2486991E8((uint64_t)v10, (uint64_t)&unk_26931D490, (uint64_t)v13);
  swift_release();
  sub_2486ABCB8();

  return swift_bridgeObjectRetain();
}

uint64_t ATSpotlightDataRetriever.init()()
{
  uint64_t v1 = sub_2486AB8F8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2486AB8E8();
  sub_2486AB878();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  *(void *)(v0 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_records) = MEMORY[0x263F8EE78];
  return v0;
}

uint64_t ATSpotlightDataRetriever.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_oneYearBack;
  uint64_t v2 = sub_2486AB8F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24869E58C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24869222C(a1, a2);
}

uint64_t sub_24869E594(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  swift_bridgeObjectRetain();
  sub_2486A16D0(a1, a3, a4);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_248691694(v7);
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24869E630(void *a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_2486ABB08();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  char v14 = (char *)&v33 - v13;
  if (a1)
  {
    sub_2486ABAF8();
    id v15 = a1;
    id v16 = a1;
    uint64_t v17 = sub_2486ABAE8();
    os_log_type_t v18 = sub_2486ABC98();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v35 = v8;
      uint64_t v20 = (uint8_t *)v19;
      uint64_t v21 = swift_slowAlloc();
      uint64_t v34 = a2;
      uint64_t v22 = v21;
      v38[0] = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      uint64_t v36 = a3;
      swift_getErrorValue();
      uint64_t v23 = sub_2486ABF48();
      uint64_t v37 = sub_24869F0B0(v23, v24, v38);
      sub_2486ABD08();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_248682000, v17, v18, "Failed to fetch items with error %s", v20, 0xCu);
      swift_arrayDestroy();
      uint64_t v25 = v22;
      a2 = v34;
      MEMORY[0x24C57BD90](v25, -1, -1);
      MEMORY[0x24C57BD90](v20, -1, -1);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v35);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }
    return a2(0);
  }
  else
  {
    sub_2486ABAF8();
    swift_retain();
    uint64_t v26 = sub_2486ABAE8();
    os_log_type_t v27 = sub_2486ABC88();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = v8;
      uint64_t v29 = v28;
      uint64_t v36 = a3;
      *(_DWORD *)uint64_t v28 = 134217984;
      swift_beginAccess();
      v38[0] = *(void *)(*(void *)(a4 + 16) + 16);
      sub_2486ABD08();
      swift_release();
      _os_log_impl(&dword_248682000, v26, v27, "Fetched %ld items from Spotlight", v29, 0xCu);
      uint64_t v30 = v29;
      uint64_t v8 = v35;
      MEMORY[0x24C57BD90](v30, -1, -1);
    }
    else
    {

      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    swift_beginAccess();
    uint64_t v32 = swift_bridgeObjectRetain();
    a2(v32);
    return swift_bridgeObjectRelease();
  }
}

uint64_t ATSpotlightDataRetriever.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = sub_2486AB8F8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2486AB8E8();
  sub_2486AB878();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  *(void *)(v0 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_records) = MEMORY[0x263F8EE78];
  return v0;
}

uint64_t sub_24869EB10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D5B8);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  sub_2486A226C(a3, a4, a5, (uint64_t)sub_2486A21F8, v13);
  return swift_release();
}

uint64_t sub_24869EC6C()
{
  return sub_2486ABC38();
}

uint64_t sub_24869ECC4(unint64_t *a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for ATSpotlightDataRecord() - 8);
  unint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v3 = sub_2486A1500(v3);
  }
  uint64_t v4 = *(void *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_24869F708(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_24869ED70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[2] = a4;
  v8[3] = a8;
  uint64_t v13 = (void *)swift_task_alloc();
  v8[4] = v13;
  void *v13 = v8;
  v13[1] = sub_24869EE3C;
  v13[8] = 0;
  v13[9] = a4;
  _OWORD v13[6] = a7;
  v13[7] = 0;
  v13[4] = a5;
  v13[5] = a6;
  return MEMORY[0x270FA2498](sub_24869DE50, 0, 0);
}

uint64_t sub_24869EE3C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 40) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24869EF3C, 0, 0);
}

uint64_t sub_24869EF3C()
{
  *(void *)(v0[2] + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_records) = v0[5];
  swift_bridgeObjectRelease();
  sub_2486ABCC8();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t ATSpotlightDataRetriever.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_oneYearBack;
  uint64_t v2 = sub_2486AB8F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24869F064(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_24869F0A0(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_24869F0B0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24869F184(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24868D3B0((uint64_t)v12, *a3);
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
      sub_24868D3B0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24869F184(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2486ABD18();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24869F340(a5, a6);
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
  uint64_t v8 = sub_2486ABDD8();
  if (!v8)
  {
    sub_2486ABE58();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2486ABEB8();
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

uint64_t sub_24869F340(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24869F3D8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24869F5B8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24869F5B8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24869F3D8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24869F550(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2486ABDA8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2486ABE58();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2486ABBC8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2486ABEB8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2486ABE58();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24869F550(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D5C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24869F5B8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D5C0);
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
  uint64_t result = sub_2486ABEB8();
  __break(1u);
  return result;
}

uint64_t sub_24869F708(uint64_t *a1)
{
  uint64_t v3 = type metadata accessor for ATSpotlightDataRecord();
  uint64_t v181 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v176 = (uint64_t)&v173 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v201 = (uint64_t)&v173 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v173 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v173 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  id v16 = (char *)&v173 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v191 = (uint64_t)&v173 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v173 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v210 = (uint64_t)&v173 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  id v178 = (unsigned __int8 *)&v173 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v177 = (uint64_t)&v173 - v26;
  uint64_t v27 = a1[1];
  uint64_t result = sub_2486ABED8();
  if (result >= v27)
  {
    if (v27 < 0) {
      goto LABEL_167;
    }
    if (v27) {
      return sub_2486A0B08(0, v27, 1, a1);
    }
    return result;
  }
  if (v27 >= 0) {
    uint64_t v29 = v27;
  }
  else {
    uint64_t v29 = v27 + 1;
  }
  if (v27 < -1) {
    goto LABEL_175;
  }
  uint64_t v209 = (int *)v3;
  uint64_t v185 = v10;
  id v184 = v13;
  id v190 = v16;
  uint64_t v174 = result;
  uint64_t v182 = v1;
  if (v27 < 2)
  {
    uint64_t v33 = MEMORY[0x263F8EE78];
    unint64_t v180 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v181 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v181 + 80));
    if (v27 != 1)
    {
      unint64_t v36 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v35 = (char *)MEMORY[0x263F8EE78];
LABEL_130:
      uint64_t v173 = v33;
      if (v36 >= 2)
      {
        uint64_t v165 = *a1;
        do
        {
          unint64_t v166 = v36 - 2;
          if (v36 < 2) {
            goto LABEL_162;
          }
          if (!v165) {
            goto LABEL_174;
          }
          id v183 = v35;
          uint64_t v167 = *(void *)&v35[16 * v166 + 32];
          uint64_t v168 = *(void *)&v35[16 * v36 + 24];
          uint64_t v169 = v182;
          sub_2486A0D58(v165 + *(void *)(v181 + 72) * v167, v165 + *(void *)(v181 + 72) * *(void *)&v35[16 * v36 + 16], v165 + *(void *)(v181 + 72) * v168, v180);
          uint64_t v182 = v169;
          if (v169) {
            break;
          }
          if (v168 < v167) {
            goto LABEL_163;
          }
          if (swift_isUniquelyReferenced_nonNull_native()) {
            id v170 = v183;
          }
          else {
            id v170 = sub_2486A14D8((uint64_t)v183);
          }
          if (v166 >= *((void *)v170 + 2)) {
            goto LABEL_164;
          }
          id v171 = &v170[16 * v166 + 32];
          *(void *)id v171 = v167;
          *((void *)v171 + 1) = v168;
          unint64_t v172 = *((void *)v170 + 2);
          if (v36 > v172) {
            goto LABEL_165;
          }
          memmove(&v170[16 * v36 + 16], &v170[16 * v36 + 32], 16 * (v172 - v36));
          uint64_t v35 = v170;
          *((void *)v170 + 2) = v172 - 1;
          unint64_t v36 = v172 - 1;
        }
        while (v172 > 2);
      }
LABEL_143:
      swift_bridgeObjectRelease();
      *(void *)(v173 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v173 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v30 = v29 >> 1;
    uint64_t v31 = sub_2486ABC18();
    *(void *)(v31 + 16) = v30;
    uint64_t v32 = *(unsigned __int8 *)(v181 + 80);
    uint64_t v173 = v31;
    unint64_t v180 = v31 + ((v32 + 32) & ~v32);
  }
  uint64_t v34 = 0;
  uint64_t v35 = (char *)MEMORY[0x263F8EE78];
  id v192 = a1;
  uint64_t v197 = v21;
LABEL_16:
  uint64_t v37 = v34;
  uint64_t v38 = v34 + 1;
  id v183 = v35;
  uint64_t v179 = v34;
  if (v34 + 1 < v27)
  {
    uint64_t v39 = *a1;
    uint64_t v40 = *(void *)(v181 + 72);
    uint64_t v41 = v177;
    sub_24869222C(*a1 + v40 * v38, v177);
    char v42 = v178;
    sub_24869222C(v39 + v40 * v37, (uint64_t)v178);
    LODWORD(v208) = _s15ArchetypeEngine21ATSpotlightDataRecordV1loiySbAC_ACtFZ_0(v42, v41);
    sub_24869514C((uint64_t)v42);
    sub_24869514C(v41);
    id v206 = (char *)v39;
    if (v37 + 2 >= v27)
    {
      uint64_t v38 = v37 + 2;
    }
    else
    {
      int64_t v207 = v40 * v38;
      uint64_t v43 = v39;
      uint64_t v44 = v40 * (v37 + 2);
      uint64_t v38 = v37 + 2;
      while (1)
      {
        uint64_t v45 = v27;
        uint64_t v46 = v177;
        sub_24869222C(v43 + v44, v177);
        uint64_t v47 = v178;
        sub_24869222C(v43 + v207, (uint64_t)v178);
        int v48 = _s15ArchetypeEngine21ATSpotlightDataRecordV1loiySbAC_ACtFZ_0(v47, v46);
        sub_24869514C((uint64_t)v47);
        sub_24869514C(v46);
        if ((v208 ^ v48)) {
          break;
        }
        ++v38;
        v43 += v40;
        uint64_t v27 = v45;
        if (v45 == v38)
        {
          uint64_t v38 = v45;
          a1 = v192;
          uint64_t v37 = v179;
          goto LABEL_24;
        }
      }
      a1 = v192;
      uint64_t v37 = v179;
      uint64_t v27 = v45;
LABEL_24:
      uint64_t v39 = (uint64_t)v206;
    }
    if (v208)
    {
      if (v38 < v37) {
        goto LABEL_168;
      }
      if (v37 < v38)
      {
        int64_t v207 = v27;
        uint64_t v49 = 0;
        uint64_t v50 = v40 * (v38 - 1);
        uint64_t v51 = v38 * v40;
        uint64_t v52 = v37;
        uint64_t v53 = v37 * v40;
        do
        {
          if (v52 != v38 + v49 - 1)
          {
            if (!v39) {
              goto LABEL_173;
            }
            uint64_t v208 = (uint64_t *)(v39 + v50);
            sub_24869963C(v39 + v53, v176);
            if (v53 < v50 || v39 + v53 >= (unint64_t)(v39 + v51))
            {
              uint64_t v54 = (uint64_t)v208;
              swift_arrayInitWithTakeFrontToBack();
            }
            else
            {
              uint64_t v54 = (uint64_t)v208;
              if (v53 != v50) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            sub_24869963C(v176, v54);
            uint64_t v37 = v179;
            uint64_t v39 = (uint64_t)v206;
          }
          ++v52;
          --v49;
          v50 -= v40;
          v51 -= v40;
          v53 += v40;
        }
        while (v52 < v38 + v49);
        a1 = v192;
        uint64_t v21 = v197;
        uint64_t v27 = v207;
      }
    }
  }
  if (v38 >= v27) {
    goto LABEL_80;
  }
  if (__OFSUB__(v38, v37)) {
    goto LABEL_166;
  }
  uint64_t v55 = v209;
  if (v38 - v37 >= v174) {
    goto LABEL_80;
  }
  if (__OFADD__(v37, v174)) {
    goto LABEL_169;
  }
  if (v37 + v174 >= v27) {
    uint64_t v56 = v27;
  }
  else {
    uint64_t v56 = v37 + v174;
  }
  if (v56 >= v37)
  {
    if (v38 == v56) {
      goto LABEL_80;
    }
    uint64_t v57 = *(void *)(v181 + 72);
    uint64_t v58 = v57 * (v38 - 1);
    uint64_t v193 = v57;
    uint64_t v59 = v38 * v57;
    uint64_t v175 = v56;
LABEL_51:
    uint64_t v61 = 0;
    uint64_t v195 = v58;
    uint64_t v196 = v38;
    uint64_t v194 = v59;
    while (1)
    {
      uint64_t v62 = *a1;
      uint64_t v203 = v59 + v61;
      uint64_t v204 = v37;
      sub_24869222C(v59 + v61 + v62, v210);
      uint64_t v205 = v61;
      uint64_t v202 = v58 + v61;
      sub_24869222C(v58 + v61 + v62, (uint64_t)v21);
      if (*v21 == 5)
      {
        uint64_t v63 = sub_2486AB8F8();
        uint64_t v208 = &v173;
        long long v64 = *(void **)(v63 - 8);
        uint64_t v65 = v64[8];
        MEMORY[0x270FA5388](v63);
        id v200 = (char *)((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
        int64_t v207 = (char *)&v173 - v200;
        uint64_t v66 = (uint64_t)&v21[v55[16]];
        uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
        id v206 = (char *)&v173;
        uint64_t v68 = *(void *)(*(void *)(v67 - 8) + 64);
        MEMORY[0x270FA5388](v67 - 8);
        unint64_t v69 = (v68 + 15) & 0xFFFFFFFFFFFFFFF0;
        sub_24868E230(v66, (uint64_t)&v173 - v69);
        uint64_t v70 = (unsigned int (*)(char *, uint64_t, uint64_t))v64[6];
        if (v70((char *)&v173 - v69, 1, v63) == 1)
        {
          sub_2486A20B8((uint64_t)&v173 - v69);
        }
        else
        {
          v199 = (uint64_t *)v64[4];
          uint64_t v71 = ((uint64_t (*)(int64_t, char *, uint64_t))v199)(v207, (char *)&v173 - v69, v63);
          id v206 = (char *)&v173;
          MEMORY[0x270FA5388](v71);
          uint64_t v72 = (char *)((char *)&v173 - v200);
          id v200 = (char *)&v173;
          uint64_t v73 = MEMORY[0x270FA5388](v210 + v209[16]);
          sub_24868E230(v73, (uint64_t)&v173 - v69);
          if (v70((char *)&v173 - v69, 1, v63) != 1)
          {
            ((void (*)(char *, char *, uint64_t))v199)(v72, (char *)&v173 - v69, v63);
            int64_t v105 = v207;
            char v94 = sub_2486AB8A8();
            id v106 = (void (*)(char *, uint64_t))v64[1];
            v106(v72, v63);
            v106((char *)v105, v63);
            a1 = v192;
            uint64_t v21 = v197;
            goto LABEL_75;
          }
          ((void (*)(int64_t, uint64_t))v64[1])(v207, v63);
          sub_2486A20B8((uint64_t)&v173 - v69);
          uint64_t v21 = v197;
        }
        uint64_t v55 = v209;
      }
      uint64_t v74 = sub_2486AB8F8();
      uint64_t v208 = &v173;
      uint64_t v75 = *(void *)(v74 - 8);
      uint64_t v76 = *(void *)(v75 + 64);
      MEMORY[0x270FA5388](v74);
      uint64_t v77 = (uint64_t)&v21[v55[9]];
      uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
      id v200 = (char *)&v173;
      uint64_t v79 = *(void *)(*(void *)(v78 - 8) + 64);
      MEMORY[0x270FA5388](v78 - 8);
      sub_24868E230(v77, (uint64_t)&v173 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v80 = v191;
      sub_24869222C((uint64_t)v21, v191);
      int64_t v207 = *(void *)(v75 + 48);
      int v81 = ((uint64_t (*)(char *, uint64_t, uint64_t))v207)((char *)&v173 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v74);
      id v206 = (char *)&v173 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v81 == 1)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))((char *)&v173 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0), v80 + v55[7], v74);
        sub_24869514C(v80);
        uint64_t v82 = sub_2486A20B8((uint64_t)&v173 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0));
      }
      else
      {
        sub_24869514C(v80);
        uint64_t v82 = (*(uint64_t (**)(char *, char *, uint64_t))(v75 + 32))((char *)&v173 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v173 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0), v74);
      }
      v199 = &v173;
      MEMORY[0x270FA5388](v82);
      uint64_t v83 = (char *)&v173 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v198 = &v173;
      uint64_t v84 = v210;
      uint64_t v85 = MEMORY[0x270FA5388](v210 + v55[9]);
      sub_24868E230(v85, (uint64_t)&v173 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v86 = v84;
      uint64_t v87 = (uint64_t)v190;
      sub_24869222C(v86, (uint64_t)v190);
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v207)((char *)&v173 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v74) == 1)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))((char *)&v173 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0), v87 + v55[7], v74);
        sub_24869514C(v87);
        sub_2486A20B8((uint64_t)&v173 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0));
      }
      else
      {
        sub_24869514C(v87);
        (*(void (**)(char *, char *, uint64_t))(v75 + 32))((char *)&v173 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v173 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0), v74);
      }
      sub_2486A2118();
      uint64_t v88 = v206;
      uint64_t v89 = sub_2486ABB48();
      uint64_t v21 = v197;
      if ((v89 & 1) == 0)
      {
        char v94 = sub_2486AB8A8();
        uint64_t v95 = *(void (**)(char *, uint64_t))(v75 + 8);
        v95((char *)&v173 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0), v74);
        v95(v88, v74);
        a1 = v192;
LABEL_75:
        uint64_t v59 = v194;
        uint64_t v58 = v195;
        uint64_t v104 = v205;
        goto LABEL_76;
      }
      id v189 = &v173;
      MEMORY[0x270FA5388](v89);
      v188 = &v173;
      uint64_t v90 = MEMORY[0x270FA5388](&v21[v209[8]]);
      sub_24868E230(v90, (uint64_t)&v173 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v91 = (uint64_t)v184;
      sub_24869222C((uint64_t)v21, (uint64_t)v184);
      int v92 = ((uint64_t (*)(char *, uint64_t, uint64_t))v207)((char *)&v173 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v74);
      uint64_t v187 = (char *)&v173 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v92 == 1)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))((char *)&v173 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0), v91 + v209[7], v74);
        sub_24869514C(v91);
        uint64_t v93 = sub_2486A20B8((uint64_t)&v173 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0));
      }
      else
      {
        sub_24869514C(v91);
        uint64_t v93 = (*(uint64_t (**)(char *, char *, uint64_t))(v75 + 32))((char *)&v173 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v173 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0), v74);
      }
      uint64_t v186 = &v173;
      MEMORY[0x270FA5388](v93);
      uint64_t v96 = (char *)&v173 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v97 = v210;
      uint64_t v98 = MEMORY[0x270FA5388](v210 + v209[8]);
      uint64_t v99 = (char *)&v173 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_24868E230(v98, (uint64_t)v99);
      uint64_t v100 = (uint64_t)v185;
      sub_24869222C(v97, (uint64_t)v185);
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v207)(v99, 1, v74) == 1)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v96, v100 + v209[7], v74);
        sub_24869514C(v100);
        sub_2486A20B8((uint64_t)v99);
      }
      else
      {
        sub_24869514C(v100);
        (*(void (**)(char *, char *, uint64_t))(v75 + 32))(v96, v99, v74);
      }
      uint64_t v101 = v187;
      char v94 = sub_2486AB8A8();
      id v102 = v101;
      uint64_t v103 = *(void (**)(char *, uint64_t))(v75 + 8);
      v103(v96, v74);
      v103(v102, v74);
      v103(v83, v74);
      v103(v206, v74);
      uint64_t v21 = v197;
      a1 = v192;
      uint64_t v59 = v194;
      uint64_t v58 = v195;
      uint64_t v104 = v205;
LABEL_76:
      sub_24869514C((uint64_t)v21);
      sub_24869514C(v210);
      if ((v94 & 1) == 0)
      {
        uint64_t v55 = v209;
        uint64_t v60 = v196;
LABEL_50:
        uint64_t v38 = v60 + 1;
        v58 += v193;
        v59 += v193;
        uint64_t v37 = v179;
        if (v38 != v175) {
          goto LABEL_51;
        }
        uint64_t v38 = v175;
LABEL_80:
        if (v38 < v37) {
          goto LABEL_161;
        }
        if (swift_isUniquelyReferenced_nonNull_native()) {
          uint64_t v35 = v183;
        }
        else {
          uint64_t v35 = sub_2486A11C8(0, *((void *)v183 + 2) + 1, 1, v183);
        }
        unint64_t v110 = *((void *)v35 + 2);
        unint64_t v109 = *((void *)v35 + 3);
        unint64_t v36 = v110 + 1;
        if (v110 >= v109 >> 1) {
          uint64_t v35 = sub_2486A11C8((char *)(v109 > 1), v110 + 1, 1, v35);
        }
        *((void *)v35 + 2) = v36;
        uint64_t v111 = v35 + 32;
        long long v112 = &v35[16 * v110 + 32];
        *(void *)long long v112 = v37;
        *((void *)v112 + 1) = v38;
        uint64_t v196 = v38;
        if (v110)
        {
          id v183 = v35;
          while (1)
          {
            unint64_t v113 = v36 - 1;
            if (v36 >= 4)
            {
              uint64_t v118 = &v111[16 * v36];
              uint64_t v119 = *((void *)v118 - 8);
              uint64_t v120 = *((void *)v118 - 7);
              BOOL v124 = __OFSUB__(v120, v119);
              uint64_t v121 = v120 - v119;
              if (v124) {
                goto LABEL_150;
              }
              uint64_t v123 = *((void *)v118 - 6);
              uint64_t v122 = *((void *)v118 - 5);
              BOOL v124 = __OFSUB__(v122, v123);
              uint64_t v116 = v122 - v123;
              char v117 = v124;
              if (v124) {
                goto LABEL_151;
              }
              unint64_t v125 = v36 - 2;
              id v126 = &v111[16 * v36 - 32];
              uint64_t v128 = *(void *)v126;
              uint64_t v127 = *((void *)v126 + 1);
              BOOL v124 = __OFSUB__(v127, v128);
              uint64_t v129 = v127 - v128;
              if (v124) {
                goto LABEL_153;
              }
              BOOL v124 = __OFADD__(v116, v129);
              uint64_t v130 = v116 + v129;
              if (v124) {
                goto LABEL_156;
              }
              if (v130 >= v121)
              {
                uint64_t v148 = &v111[16 * v113];
                uint64_t v150 = *(void *)v148;
                uint64_t v149 = *((void *)v148 + 1);
                BOOL v124 = __OFSUB__(v149, v150);
                uint64_t v151 = v149 - v150;
                if (v124) {
                  goto LABEL_160;
                }
                BOOL v141 = v116 < v151;
                goto LABEL_118;
              }
            }
            else
            {
              if (v36 != 3)
              {
                uint64_t v142 = *((void *)v35 + 4);
                uint64_t v143 = *((void *)v35 + 5);
                BOOL v124 = __OFSUB__(v143, v142);
                uint64_t v135 = v143 - v142;
                char v136 = v124;
                goto LABEL_112;
              }
              uint64_t v115 = *((void *)v35 + 4);
              uint64_t v114 = *((void *)v35 + 5);
              BOOL v124 = __OFSUB__(v114, v115);
              uint64_t v116 = v114 - v115;
              char v117 = v124;
            }
            if (v117) {
              goto LABEL_152;
            }
            unint64_t v125 = v36 - 2;
            long long v131 = &v111[16 * v36 - 32];
            uint64_t v133 = *(void *)v131;
            uint64_t v132 = *((void *)v131 + 1);
            BOOL v134 = __OFSUB__(v132, v133);
            uint64_t v135 = v132 - v133;
            char v136 = v134;
            if (v134) {
              goto LABEL_155;
            }
            v137 = &v111[16 * v113];
            uint64_t v139 = *(void *)v137;
            uint64_t v138 = *((void *)v137 + 1);
            BOOL v124 = __OFSUB__(v138, v139);
            uint64_t v140 = v138 - v139;
            if (v124) {
              goto LABEL_158;
            }
            if (__OFADD__(v135, v140)) {
              goto LABEL_159;
            }
            if (v135 + v140 >= v116)
            {
              BOOL v141 = v116 < v140;
LABEL_118:
              if (v141) {
                unint64_t v113 = v125;
              }
              goto LABEL_120;
            }
LABEL_112:
            if (v136) {
              goto LABEL_154;
            }
            v144 = &v111[16 * v113];
            uint64_t v146 = *(void *)v144;
            uint64_t v145 = *((void *)v144 + 1);
            BOOL v124 = __OFSUB__(v145, v146);
            uint64_t v147 = v145 - v146;
            if (v124) {
              goto LABEL_157;
            }
            if (v147 < v135) {
              goto LABEL_15;
            }
LABEL_120:
            unint64_t v152 = v113 - 1;
            if (v113 - 1 >= v36)
            {
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
              __break(1u);
LABEL_161:
              __break(1u);
LABEL_162:
              __break(1u);
LABEL_163:
              __break(1u);
LABEL_164:
              __break(1u);
LABEL_165:
              __break(1u);
LABEL_166:
              __break(1u);
LABEL_167:
              __break(1u);
LABEL_168:
              __break(1u);
LABEL_169:
              __break(1u);
              goto LABEL_170;
            }
            uint64_t v153 = *a1;
            if (!*a1) {
              goto LABEL_172;
            }
            uint64_t v154 = a1;
            uint64_t v155 = v111;
            uint64_t v156 = &v111[16 * v152];
            uint64_t v157 = *(void *)v156;
            id v158 = v155;
            unint64_t v159 = v113;
            int v160 = &v155[16 * v113];
            uint64_t v161 = *((void *)v160 + 1);
            uint64_t v162 = v182;
            sub_2486A0D58(v153 + *(void *)(v181 + 72) * *(void *)v156, v153 + *(void *)(v181 + 72) * *(void *)v160, v153 + *(void *)(v181 + 72) * v161, v180);
            uint64_t v182 = v162;
            if (v162) {
              goto LABEL_143;
            }
            if (v161 < v157) {
              goto LABEL_147;
            }
            v163 = v183;
            if (v159 > *((void *)v183 + 2)) {
              goto LABEL_148;
            }
            *(void *)uint64_t v156 = v157;
            *(void *)&v158[16 * v152 + 8] = v161;
            unint64_t v164 = *((void *)v163 + 2);
            if (v159 >= v164) {
              goto LABEL_149;
            }
            uint64_t v111 = v158;
            unint64_t v36 = v164 - 1;
            memmove(v160, v160 + 16, 16 * (v164 - 1 - v159));
            uint64_t v35 = v183;
            *((void *)v183 + 2) = v164 - 1;
            a1 = v154;
            if (v164 <= 2) {
              goto LABEL_15;
            }
          }
        }
        unint64_t v36 = 1;
LABEL_15:
        uint64_t v27 = a1[1];
        uint64_t v34 = v196;
        if (v196 >= v27)
        {
          uint64_t v33 = v173;
          goto LABEL_130;
        }
        goto LABEL_16;
      }
      uint64_t v107 = *a1;
      uint64_t v55 = v209;
      if (!*a1) {
        goto LABEL_171;
      }
      uint64_t v108 = v107 + v58 + v104;
      sub_24869963C(v107 + v59 + v104, v201);
      uint64_t v60 = v196;
      swift_arrayInitWithTakeFrontToBack();
      sub_24869963C(v201, v108);
      uint64_t v61 = v104 - v193;
      uint64_t v37 = v204 + 1;
      if (v60 == v204 + 1) {
        goto LABEL_50;
      }
    }
  }
LABEL_170:
  __break(1u);
LABEL_171:
  __break(1u);
LABEL_172:
  __break(1u);
LABEL_173:
  __break(1u);
LABEL_174:
  __break(1u);
LABEL_175:
  uint64_t result = sub_2486ABE58();
  __break(1u);
  return result;
}

uint64_t sub_2486A0B08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v24 = a1;
  uint64_t v25 = type metadata accessor for ATSpotlightDataRecord();
  uint64_t v7 = MEMORY[0x270FA5388](v25);
  uint64_t v28 = (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (unsigned __int8 *)&v22 - v10;
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v27 = a3;
  uint64_t v23 = a2;
  if (a3 != a2)
  {
    uint64_t v16 = *(void *)(v13 + 72);
    uint64_t v30 = v16 * (v27 - 1);
    uint64_t v26 = v16;
    uint64_t v29 = v16 * v27;
LABEL_5:
    uint64_t v17 = 0;
    uint64_t v18 = v24;
    while (1)
    {
      uint64_t v19 = *a4;
      sub_24869222C(v29 + v17 + *a4, (uint64_t)v15);
      sub_24869222C(v30 + v17 + v19, (uint64_t)v11);
      LOBYTE(v19) = _s15ArchetypeEngine21ATSpotlightDataRecordV1loiySbAC_ACtFZ_0(v11, (uint64_t)v15);
      sub_24869514C((uint64_t)v11);
      uint64_t result = sub_24869514C((uint64_t)v15);
      if ((v19 & 1) == 0)
      {
LABEL_4:
        v30 += v26;
        v29 += v26;
        if (++v27 == v23) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v20 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v21 = v20 + v30 + v17;
      sub_24869963C(v20 + v29 + v17, v28);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_24869963C(v28, v21);
      v17 -= v26;
      if (v27 == ++v18) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_2486A0D58(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v36 = type metadata accessor for ATSpotlightDataRecord();
  uint64_t v8 = MEMORY[0x270FA5388](v36);
  uint64_t v10 = (unsigned __int8 *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v34 - v11;
  uint64_t v14 = *(void *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  if (a2 - a1 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_61;
  }
  int64_t v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_62;
  }
  uint64_t v16 = (uint64_t)(a2 - a1) / v14;
  unint64_t v39 = a1;
  unint64_t v38 = a4;
  uint64_t v17 = v15 / v14;
  if (v16 >= v15 / v14)
  {
    if ((v17 & 0x8000000000000000) == 0)
    {
      uint64_t v19 = v17 * v14;
      if (a4 < a2 || a2 + v19 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v26 = a4 + v19;
      unint64_t v37 = a4 + v19;
      unint64_t v39 = a2;
      unint64_t v35 = a1;
      if (v19 >= 1 && a1 < a2)
      {
        uint64_t v28 = -v14;
        do
        {
          unint64_t v29 = a3 + v28;
          sub_24869222C(v26 + v28, (uint64_t)v12);
          unint64_t v30 = a2 + v28;
          sub_24869222C(a2 + v28, (uint64_t)v10);
          char v31 = _s15ArchetypeEngine21ATSpotlightDataRecordV1loiySbAC_ACtFZ_0(v10, (uint64_t)v12);
          sub_24869514C((uint64_t)v10);
          sub_24869514C((uint64_t)v12);
          if (v31)
          {
            if (a3 < a2 || v29 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v39 += v28;
          }
          else
          {
            unint64_t v32 = v37;
            v37 += v28;
            if (a3 < v32 || v29 >= v32)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v32)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v30 = a2;
          }
          unint64_t v26 = v37;
          if (v37 <= a4) {
            break;
          }
          a2 = v30;
          a3 += v28;
        }
        while (v30 > v35);
      }
      goto LABEL_59;
    }
  }
  else if ((v16 & 0x8000000000000000) == 0)
  {
    uint64_t v18 = v16 * v14;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v20 = a4 + v18;
    unint64_t v37 = a4 + v18;
    if (v18 >= 1 && a2 < a3)
    {
      do
      {
        sub_24869222C(a2, (uint64_t)v12);
        sub_24869222C(a4, (uint64_t)v10);
        char v22 = _s15ArchetypeEngine21ATSpotlightDataRecordV1loiySbAC_ACtFZ_0(v10, (uint64_t)v12);
        sub_24869514C((uint64_t)v10);
        sub_24869514C((uint64_t)v12);
        unint64_t v23 = v39;
        if (v22)
        {
          unint64_t v24 = a2 + v14;
          if (v39 < a2 || v39 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v39 == a2)
          {
            unint64_t v23 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          unint64_t v25 = v38 + v14;
          if (v39 < v38 || v39 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v39 != v38)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v38 = v25;
          unint64_t v24 = a2;
        }
        unint64_t v39 = v23 + v14;
        a4 = v38;
        if (v38 >= v20) {
          break;
        }
        a2 = v24;
      }
      while (v24 < a3);
    }
LABEL_59:
    sub_2486A1398(&v39, &v38, (uint64_t *)&v37);
    return 1;
  }
LABEL_63:
  uint64_t result = sub_2486ABEB8();
  __break(1u);
  return result;
}

char *sub_2486A11C8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D5B0);
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

char *sub_2486A12C4(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -112)
  {
    uint64_t result = (char *)sub_2486ABEB8();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v6 = v4 / 112;
    if (result != v3 || result >= &v3[112 * v6])
    {
      return (char *)memmove(result, v3, 112 * v6);
    }
  }
  return result;
}

uint64_t sub_2486A1398(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = type metadata accessor for ATSpotlightDataRecord();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_2486ABEB8();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_2486A14D8(uint64_t a1)
{
  return sub_2486A11C8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_2486A14EC(void *a1)
{
  return sub_248688D60(0, a1[2], 0, a1);
}

uint64_t sub_2486A1500(unint64_t a1)
{
  return sub_248688F9C(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_2486A1514(void *a1)
{
  return sub_24868B248(0, a1[2], 0, a1);
}

uint64_t sub_2486A1528(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for ATSpotlightDataRecord();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (v9)
  {
    uint64_t v16 = v2;
    uint64_t v20 = MEMORY[0x263F8EE78];
    sub_24868B228(0, v9, 0);
    uint64_t v10 = v20;
    unint64_t v18 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v19 = a2;
    uint64_t v11 = a1 + v18;
    uint64_t v17 = *(void (**)(uint64_t))(*(void *)a2 + 152);
    uint64_t v12 = *(void *)(v6 + 72);
    do
    {
      v17(v11);
      uint64_t v20 = v10;
      unint64_t v14 = *(void *)(v10 + 16);
      unint64_t v13 = *(void *)(v10 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_24868B228(v13 > 1, v14 + 1, 1);
        uint64_t v10 = v20;
      }
      *(void *)(v10 + 16) = v14 + 1;
      sub_24869963C((uint64_t)v8, v10 + v18 + v14 * v12);
      v11 += v12;
      --v9;
    }
    while (v9);
  }
  return v10;
}

uint64_t sub_2486A16D0(unint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = v3;
  uint64_t v22 = a2;
  uint64_t v7 = type metadata accessor for ATSpotlightDataRecord();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v12 = MEMORY[0x263F8EE78];
    if (!v11) {
      return v12;
    }
    uint64_t v23 = MEMORY[0x263F8EE78];
    uint64_t result = sub_24868B228(0, v11 & ~(v11 >> 63), 0);
    if (v11 < 0) {
      break;
    }
    uint64_t v14 = 0;
    uint64_t v12 = v23;
    v20[1] = v4;
    unint64_t v21 = a1 & 0xC000000000000001;
    unint64_t v15 = a1;
    while (v11 != v14)
    {
      if (v21) {
        id v16 = (id)MEMORY[0x24C57B5F0](v14, a1);
      }
      else {
        id v16 = *(id *)(a1 + 8 * v14 + 32);
      }
      uint64_t v17 = v16;
      swift_bridgeObjectRetain();
      ATSpotlightDataRecord.init(item:bundleID:)(v17, v22, a3, (uint64_t)v10);
      uint64_t v23 = v12;
      unint64_t v19 = *(void *)(v12 + 16);
      unint64_t v18 = *(void *)(v12 + 24);
      unint64_t v4 = v19 + 1;
      if (v19 >= v18 >> 1)
      {
        sub_24868B228(v18 > 1, v19 + 1, 1);
        uint64_t v12 = v23;
      }
      ++v14;
      *(void *)(v12 + 16) = v4;
      sub_24869963C((uint64_t)v10, v12+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v19);
      a1 = v15;
      if (v11 == v14) {
        return v12;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_2486ABE68();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

id sub_2486A18D8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_2486ABBB8();
  if (a4)
  {
    uint64_t v8 = HIBYTE(a4) & 0xF;
    if ((a4 & 0x2000000000000000) == 0) {
      uint64_t v8 = a3 & 0xFFFFFFFFFFFFLL;
    }
    if (v8) {
      sub_2486ABBB8();
    }
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for ATSpolightAttributes();
  swift_initStackObject();
  sub_248691478();
  sub_248690E98(a1, a2);
  swift_release();
  id v9 = objc_allocWithZone(MEMORY[0x263F02AC8]);
  uint64_t v10 = (void *)sub_2486ABB58();
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)sub_2486ABBE8();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v9, sel_initWithQueryString_attributes_, v10, v11);

  return v12;
}

uint64_t sub_2486A1A4C(uint64_t a1)
{
  return sub_24869EB10(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_2486A1A58(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for ATSpotlightDataRecord();
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v49 = (uint64_t)v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)v44 - v9;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v57 = MEMORY[0x263F8EE78];
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13)
  {
    uint64_t v48 = a2 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_oneYearBack;
    uint64_t v14 = *(unsigned __int8 *)(v8 + 80);
    uint64_t v15 = *(void *)(v8 + 72);
    v44[1] = v2;
    uint64_t v45 = (v14 + 32) & ~v14;
    uint64_t v16 = a1 + v45;
    uint64_t v17 = v10;
    uint64_t v47 = v15;
    uint64_t v51 = v10;
    uint64_t v52 = (char *)v44 - v9;
    while (1)
    {
      sub_24869222C(v16, (uint64_t)v11);
      unint64_t v18 = *((void *)v11 + 2);
      uint64_t v19 = *((void *)v11 + 1) & 0xFFFFFFFFFFFFLL;
      if ((v18 & 0x2000000000000000) != 0) {
        uint64_t v19 = HIBYTE(v18) & 0xF;
      }
      if (!v19) {
        goto LABEL_3;
      }
      uint64_t v55 = v13;
      uint64_t v20 = sub_2486AB8F8();
      uint64_t v54 = v44;
      uint64_t v21 = *(void *)(v20 - 8);
      uint64_t v22 = *(void *)(v21 + 64);
      MEMORY[0x270FA5388](v20);
      unint64_t v50 = (v22 + 15) & 0xFFFFFFFFFFFFFFF0;
      uint64_t v23 = (char *)v44 - v50;
      uint64_t v24 = (uint64_t)&v11[*(int *)(v17 + 36)];
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
      uint64_t v53 = v44;
      uint64_t v26 = *(void *)(*(void *)(v25 - 8) + 64);
      MEMORY[0x270FA5388](v25 - 8);
      unint64_t v27 = (v26 + 15) & 0xFFFFFFFFFFFFFFF0;
      sub_24868E230(v24, (uint64_t)v44 - v27);
      uint64_t v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
      uint64_t v56 = v20;
      uint64_t v29 = v20;
      unint64_t v30 = v28;
      if (v28((char *)v44 - v27, 1, v29) == 1)
      {
        uint64_t v46 = v21;
        uint64_t v31 = sub_2486A20B8((uint64_t)v44 - v27);
        uint64_t v54 = v44;
        MEMORY[0x270FA5388](v31);
        unint64_t v32 = (char *)v44 - v50;
        uint64_t v33 = MEMORY[0x270FA5388](&v52[*(int *)(v51 + 32)]);
        uint64_t v34 = (char *)v44 - v27;
        sub_24868E230(v33, (uint64_t)v44 - v27);
        uint64_t v35 = v56;
        if (v30((char *)v44 - v27, 1, v56) == 1)
        {
          sub_2486A20B8((uint64_t)v44 - v27);
          uint64_t v17 = v51;
          uint64_t v11 = v52;
          char v36 = sub_2486AB898();
          uint64_t v15 = v47;
          uint64_t v13 = v55;
          if (v36) {
            goto LABEL_15;
          }
          goto LABEL_3;
        }
        uint64_t v40 = v46;
        (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v32, v34, v35);
        char v39 = sub_2486AB898();
        (*(void (**)(char *, uint64_t))(v40 + 8))(v32, v35);
      }
      else
      {
        unint64_t v37 = (char *)v44 - v27;
        uint64_t v38 = v56;
        (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v23, v37, v56);
        char v39 = sub_2486AB898();
        (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v38);
      }
      uint64_t v13 = v55;
      uint64_t v17 = v51;
      uint64_t v11 = v52;
      uint64_t v15 = v47;
      if (v39)
      {
LABEL_15:
        sub_24869963C((uint64_t)v11, v49);
        uint64_t v41 = v57;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24868B228(0, *(void *)(v41 + 16) + 1, 1);
          uint64_t v41 = v57;
        }
        unint64_t v43 = *(void *)(v41 + 16);
        unint64_t v42 = *(void *)(v41 + 24);
        if (v43 >= v42 >> 1)
        {
          sub_24868B228(v42 > 1, v43 + 1, 1);
          uint64_t v41 = v57;
        }
        *(void *)(v41 + 16) = v43 + 1;
        sub_24869963C(v49, v41 + v45 + v43 * v15);
        goto LABEL_4;
      }
LABEL_3:
      sub_24869514C((uint64_t)v11);
LABEL_4:
      v16 += v15;
      if (!--v13) {
        return v57;
      }
    }
  }
  return result;
}

uint64_t sub_2486A1F1C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

unint64_t sub_2486A1F70()
{
  unint64_t result = qword_26931D598;
  if (!qword_26931D598)
  {
    type metadata accessor for ATSpotlightDataRecord();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931D598);
  }
  return result;
}

uint64_t sub_2486A1FC8()
{
  return type metadata accessor for ATSpotlightDataRetriever();
}

uint64_t type metadata accessor for ATSpotlightDataRetriever()
{
  uint64_t result = qword_26931D5A0;
  if (!qword_26931D5A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2486A201C()
{
  uint64_t result = sub_2486AB8F8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2486A20B8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2486A2118()
{
  unint64_t result = qword_26931D358;
  if (!qword_26931D358)
  {
    sub_2486AB8F8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931D358);
  }
  return result;
}

uint64_t sub_2486A2164()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D5B8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2486A21F8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D5B8);
  return sub_24869EC6C();
}

uint64_t sub_2486A226C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x263F8EE78];
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v10;
  v11[3] = a1;
  v11[4] = a2;
  uint64_t v20 = sub_2486A24E0;
  uint64_t v21 = v11;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 1107296256;
  unint64_t v18 = sub_2486A2558;
  uint64_t v19 = &block_descriptor_1;
  id v12 = _Block_copy(&v16);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(a3, sel_setFoundItemsHandler_, v12);
  _Block_release(v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a4;
  v13[3] = a5;
  v13[4] = v10;
  uint64_t v20 = sub_2486A2544;
  uint64_t v21 = v13;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 1107296256;
  unint64_t v18 = sub_2486A25DC;
  uint64_t v19 = &block_descriptor_26;
  uint64_t v14 = _Block_copy(&v16);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(a3, sel_setCompletionHandler_, v14);
  _Block_release(v14);
  objc_msgSend(a3, sel_start);
  return swift_release();
}

uint64_t sub_2486A2468()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2486A24A0()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2486A24E0(unint64_t a1)
{
  return sub_24869E594(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_2486A2504()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2486A2544(void *a1)
{
  return sub_24869E630(a1, *(uint64_t (**)(void))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_2486A2558(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_24868CFDC(0, &qword_26931D278);
  uint64_t v2 = sub_2486ABBF8();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_2486A25DC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

Swift::Int __swiftcall ArchetypeRawAssortment.returnNumber()()
{
  return 42;
}

uint64_t sub_2486A265C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  sub_24868CE38(a2, a1);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  unint64_t v11 = v10;
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v13 = (v11 >> 1) - v9;
  if (v11 >> 1 == v9)
  {
    return swift_unknownObjectRelease();
  }
  if ((uint64_t)(v11 >> 1) > v9)
  {
    uint64_t v14 = (void **)(a3 + 16);
    uint64_t v15 = (id *)(v7 + 8 * v9);
    do
    {
      id v16 = *v15;
      id v17 = objc_msgSend(v16, sel_attributeSet);
      id v18 = objc_msgSend(v17, sel_title);

      if (v18)
      {
        uint64_t v19 = sub_2486ABB68();
        unint64_t v21 = v20;
      }
      else
      {
        uint64_t v19 = 0;
        unint64_t v21 = 0xE000000000000000;
      }
      swift_beginAccess();
      uint64_t v22 = *v14;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v14 = v22;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v22 = sub_248688E8C(0, v22[2] + 1, 1, v22);
        *uint64_t v14 = v22;
      }
      unint64_t v25 = v22[2];
      unint64_t v24 = v22[3];
      if (v25 >= v24 >> 1)
      {
        uint64_t v22 = sub_248688E8C((void *)(v24 > 1), v25 + 1, 1, v22);
        *uint64_t v14 = v22;
      }
      v22[2] = v25 + 1;
      uint64_t v26 = &v22[2 * v25];
      v26[4] = v19;
      v26[5] = v21;
      swift_endAccess();

      ++v15;
      --v13;
    }
    while (v13);
    return swift_unknownObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_2486A2874(unint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  sub_24868CE38(a2, a1);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  unint64_t v11 = v10;
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v13 = (v11 >> 1) - v9;
  if (v11 >> 1 == v9)
  {
    return swift_unknownObjectRelease();
  }
  else if ((uint64_t)(v11 >> 1) <= v9)
  {
    __break(1u);
  }
  else
  {
    unint64_t v32 = (void **)(a3 + 16);
    uint64_t v14 = (id *)(v7 + 8 * v9);
    uint64_t v31 = *MEMORY[0x263F02848];
    do
    {
      id v15 = *v14;
      id v16 = objc_msgSend(v15, sel_attributeSet);
      id v17 = objc_msgSend(v16, sel_authorEmailAddresses);

      if (v17)
      {
        uint64_t v18 = sub_2486ABBF8();
      }
      else
      {
        uint64_t v18 = MEMORY[0x263F8EE78];
      }
      *(void *)&long long v34 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26931D308);
      sub_24869BB70();
      sub_2486ABB18();
      swift_bridgeObjectRelease();
      id v19 = objc_msgSend(v15, sel_attributeSet);
      id v20 = objc_msgSend(v19, sel_recipientEmailAddresses);

      if (v20)
      {
        uint64_t v21 = sub_2486ABBF8();
      }
      else
      {
        uint64_t v21 = MEMORY[0x263F8EE78];
      }
      *(void *)&long long v34 = v21;
      sub_2486ABB18();
      swift_bridgeObjectRelease();
      *(void *)&long long v34 = 0;
      *((void *)&v34 + 1) = 0xE000000000000000;
      sub_2486ABD98();
      long long v36 = v34;
      sub_2486ABBB8();
      id v22 = objc_msgSend(v15, sel_attributeSet);
      id v23 = objc_msgSend(v22, sel_subject);

      if (v23)
      {
        sub_2486ABB68();
      }
      sub_2486ABBB8();
      swift_bridgeObjectRelease();
      sub_2486ABBB8();
      sub_2486ABBB8();
      swift_bridgeObjectRelease();
      sub_2486ABBB8();
      sub_2486ABBB8();
      swift_bridgeObjectRelease();
      sub_2486ABBB8();
      id v24 = objc_msgSend(v15, sel_attributeSet);
      id v25 = objc_msgSend(v24, sel_attributeForKey_, v31);

      if (v25)
      {
        sub_2486ABD28();
        swift_unknownObjectRelease();
        sub_248692290(&v33, &v34);
      }
      else
      {
        uint64_t v35 = MEMORY[0x263F8D310];
        *(void *)&long long v34 = 0;
        *((void *)&v34 + 1) = 0xE000000000000000;
      }
      sub_2486ABE48();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v34);
      sub_2486ABBB8();
      long long v26 = v36;
      swift_beginAccess();
      unint64_t v27 = *v32;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *unint64_t v32 = v27;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v27 = sub_248688E8C(0, v27[2] + 1, 1, v27);
        *unint64_t v32 = v27;
      }
      unint64_t v30 = v27[2];
      unint64_t v29 = v27[3];
      if (v30 >= v29 >> 1)
      {
        unint64_t v27 = sub_248688E8C((void *)(v29 > 1), v30 + 1, 1, v27);
        *unint64_t v32 = v27;
      }
      v27[2] = v30 + 1;
      *(_OWORD *)&v27[2 * v30 + 4] = v26;
      swift_endAccess();

      ++v14;
      --v13;
    }
    while (v13);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_2486A2D7C(void *a1, int a2, uint64_t a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t))
{
  unint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  id v13 = a1;
  a7(a3, a6, v12);

  return swift_release();
}

uint64_t sub_2486A2E64(unint64_t a1, uint64_t a2)
{
  unint64_t v3 = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2486ABE68();
    uint64_t v4 = result;
    if (result)
    {
LABEL_3:
      if (v4 < 1)
      {
        __break(1u);
      }
      else
      {
        uint64_t v6 = 0;
        uint64_t v240 = (void *)(a2 + 16);
        unint64_t v238 = v3 & 0xC000000000000001;
        uint64_t v237 = *MEMORY[0x263F02848];
        uint64_t v236 = *MEMORY[0x263F02428];
        unint64_t v235 = 0x80000002486ADDA0;
        uint64_t v234 = *MEMORY[0x263F025E8];
        uint64_t v233 = *MEMORY[0x263F02420];
        unint64_t v232 = 0x80000002486ADDC0;
        uint64_t v231 = *MEMORY[0x263F025E0];
        uint64_t v230 = *MEMORY[0x263F01FC8];
        unint64_t v229 = 0x80000002486ADDE0;
        uint64_t v228 = *MEMORY[0x263F02948];
        unint64_t v227 = 0x80000002486ADE00;
        unint64_t v226 = 0x80000002486ADE20;
        unint64_t v225 = 0x80000002486ADE40;
        unint64_t v224 = 0x80000002486ADE60;
        unint64_t v223 = 0x80000002486ADE80;
        unint64_t v222 = 0x80000002486ADEA0;
        unint64_t v221 = 0x80000002486ADEC0;
        unint64_t v220 = 0x80000002486ADEE0;
        unint64_t v219 = 0x80000002486ADF00;
        unint64_t v218 = 0x80000002486ADF20;
        unint64_t v217 = 0x80000002486ADF40;
        unint64_t v216 = 0x80000002486ADF60;
        uint64_t v7 = MEMORY[0x263F8D310];
        uint64_t v215 = MEMORY[0x263F8EE58] + 8;
        unint64_t v214 = v3;
        uint64_t v239 = v4;
        do
        {
          if (v238) {
            id v8 = (id)MEMORY[0x24C57B5F0](v6, v3);
          }
          else {
            id v8 = *(id *)(v3 + 8 * v6 + 32);
          }
          uint64_t v9 = v8;
          strcpy((char *)&v250, "title: [");
          BYTE9(v250) = 0;
          WORD5(v250) = 0;
          HIDWORD(v250) = -402653184;
          id v10 = objc_msgSend(v8, sel_attributeSet);
          id v11 = objc_msgSend(v10, sel_title);

          if (v11)
          {
            sub_2486ABB68();
          }
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v12 = v250;
          id v13 = sub_248688E8C(0, 1, 1, MEMORY[0x263F8EE78]);
          unint64_t v15 = v13[2];
          unint64_t v14 = v13[3];
          if (v15 >= v14 >> 1) {
            id v13 = sub_248688E8C((void *)(v14 > 1), v15 + 1, 1, v13);
          }
          v13[2] = v15 + 1;
          *(_OWORD *)&v13[2 * v15 + 4] = v12;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          swift_bridgeObjectRelease();
          *(void *)&long long v250 = 0x2079616C70736964;
          *((void *)&v250 + 1) = 0xEF5B203A656D616ELL;
          id v16 = objc_msgSend(v9, sel_attributeSet);
          id v17 = objc_msgSend(v16, sel_displayName);

          if (v17)
          {
            sub_2486ABB68();
          }
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v18 = v250;
          unint64_t v20 = v13[2];
          unint64_t v19 = v13[3];
          if (v20 >= v19 >> 1) {
            id v13 = sub_248688E8C((void *)(v19 > 1), v20 + 1, 1, v13);
          }
          v13[2] = v20 + 1;
          *(_OWORD *)&v13[2 * v20 + 4] = v18;
          *(void *)&long long v252 = 0;
          *((void *)&v252 + 1) = 0xE000000000000000;
          sub_2486ABBB8();
          id v21 = objc_msgSend(v9, sel_attributeSet);
          id v22 = objc_msgSend(v21, sel_attributeForKey_, v237);

          if (v22)
          {
            sub_2486ABD28();
            swift_unknownObjectRelease();
            sub_248692290(&v249, &v250);
          }
          else
          {
            uint64_t v251 = v7;
            *(void *)&long long v250 = 0;
            *((void *)&v250 + 1) = 0xE000000000000000;
          }
          sub_2486ABE48();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v250);
          sub_2486ABBB8();
          long long v23 = v252;
          unint64_t v25 = v13[2];
          unint64_t v24 = v13[3];
          uint64_t v241 = v6;
          if (v25 >= v24 >> 1) {
            id v13 = sub_248688E8C((void *)(v24 > 1), v25 + 1, 1, v13);
          }
          v13[2] = v25 + 1;
          *(_OWORD *)&v13[2 * v25 + 4] = v23;
          strcpy((char *)&v250, "due time: [");
          HIDWORD(v250) = -352321536;
          id v248 = v9;
          id v26 = objc_msgSend(v9, sel_attributeSet);
          uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
          uint64_t v28 = *(void *)(*(void *)(v27 - 8) + 64);
          MEMORY[0x270FA5388](v27 - 8);
          unint64_t v29 = (char *)&v212 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
          id v30 = objc_msgSend(v26, sel_dueDate);

          MEMORY[0x270FA5388](v31);
          if (v30)
          {
            sub_2486AB8C8();

            uint64_t v32 = sub_2486AB8F8();
            (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v29, 0, 1, v32);
          }
          else
          {
            uint64_t v32 = sub_2486AB8F8();
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v29, 1, 1, v32);
          }
          sub_2486A64D8((uint64_t)v29, (uint64_t)v29);
          sub_2486AB8F8();
          uint64_t v33 = *(void *)(v32 - 8);
          v246 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48);
          uint64_t v247 = v33 + 48;
          uint64_t v34 = v246(v29, 1, v32);
          uint64_t v245 = v33;
          if (v34)
          {
            sub_2486A20B8((uint64_t)v29);
          }
          else
          {
            MEMORY[0x270FA5388](v34);
            long long v36 = (char *)&v212 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
            (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v36, v29, v32);
            sub_2486A20B8((uint64_t)v29);
            sub_2486AB8D8();
            (*(void (**)(char *, uint64_t))(v33 + 8))(v36, v32);
          }
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v37 = v250;
          unint64_t v39 = v13[2];
          unint64_t v38 = v13[3];
          if (v39 >= v38 >> 1) {
            id v13 = sub_248688E8C((void *)(v38 > 1), v39 + 1, 1, v13);
          }
          v13[2] = v39 + 1;
          *(_OWORD *)&v13[2 * v39 + 4] = v37;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          swift_bridgeObjectRelease();
          *(void *)&long long v250 = 0xD000000000000012;
          *((void *)&v250 + 1) = v235;
          id v40 = objc_msgSend(v248, sel_attributeSet);
          unint64_t v41 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
          unint64_t v42 = (char *)&v212 - v41;
          id v43 = objc_msgSend((id)MEMORY[0x270FA5388](v40), sel_completionDate);

          MEMORY[0x270FA5388](v44);
          if (v43)
          {
            sub_2486AB8C8();

            uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v245 + 56);
            uint64_t v46 = (char *)&v212 - v41;
            uint64_t v47 = 0;
          }
          else
          {
            uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v245 + 56);
            uint64_t v46 = (char *)&v212 - v41;
            uint64_t v47 = 1;
          }
          v244 = v45;
          v45(v46, v47, 1, v32);
          sub_2486A64D8((uint64_t)&v212 - v41, (uint64_t)&v212 - v41);
          uint64_t v48 = v246((char *)&v212 - v41, 1, v32);
          if (v48)
          {
            sub_2486A20B8((uint64_t)&v212 - v41);
          }
          else
          {
            v243 = &v212;
            uint64_t v49 = v245;
            MEMORY[0x270FA5388](v48);
            uint64_t v51 = (char *)&v212 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
            (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v51, v42, v32);
            sub_2486A20B8((uint64_t)v42);
            sub_2486AB8D8();
            (*(void (**)(char *, uint64_t))(v49 + 8))(v51, v32);
          }
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v52 = v250;
          unint64_t v54 = v13[2];
          unint64_t v53 = v13[3];
          if (v54 >= v53 >> 1) {
            id v13 = sub_248688E8C((void *)(v53 > 1), v54 + 1, 1, v13);
          }
          v13[2] = v54 + 1;
          *(_OWORD *)&v13[2 * v54 + 4] = v52;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          swift_bridgeObjectRelease();
          unint64_t v242 = 0xD000000000000010;
          *(void *)&long long v250 = 0xD000000000000010;
          *((void *)&v250 + 1) = v232;
          id v55 = objc_msgSend(v248, sel_attributeSet);
          uint64_t v56 = (char *)&v212 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
          id v57 = objc_msgSend((id)MEMORY[0x270FA5388](v55), sel_contentCreationDate);

          MEMORY[0x270FA5388](v58);
          if (v57)
          {
            sub_2486AB8C8();

            uint64_t v59 = 0;
          }
          else
          {
            uint64_t v59 = 1;
          }
          uint64_t v60 = v245;
          v243 = (uint64_t *)(v245 + 56);
          v244(v56, v59, 1, v32);
          sub_2486A64D8((uint64_t)v56, (uint64_t)v56);
          uint64_t v61 = v246(v56, 1, v32);
          if (v61)
          {
            sub_2486A20B8((uint64_t)v56);
          }
          else
          {
            id v213 = &v212;
            MEMORY[0x270FA5388](v61);
            uint64_t v63 = (char *)&v212 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0);
            (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v63, v56, v32);
            sub_2486A20B8((uint64_t)v56);
            sub_2486AB8D8();
            (*(void (**)(char *, uint64_t))(v60 + 8))(v63, v32);
          }
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v64 = v250;
          unint64_t v66 = v13[2];
          unint64_t v65 = v13[3];
          if (v66 >= v65 >> 1) {
            id v13 = sub_248688E8C((void *)(v65 > 1), v66 + 1, 1, v13);
          }
          v13[2] = v66 + 1;
          *(_OWORD *)&v13[2 * v66 + 4] = v64;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          swift_bridgeObjectRelease();
          *(void *)&long long v250 = 0xD000000000000014;
          *((void *)&v250 + 1) = v229;
          id v67 = objc_msgSend(v248, sel_attributeSet);
          unint64_t v68 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
          unint64_t v69 = (char *)&v212 - v68;
          id v70 = objc_msgSend((id)MEMORY[0x270FA5388](v67), sel_contentModificationDate);

          MEMORY[0x270FA5388](v71);
          if (v70)
          {
            sub_2486AB8C8();

            uint64_t v72 = 0;
          }
          else
          {
            uint64_t v72 = 1;
          }
          v244((char *)&v212 - v68, v72, 1, v32);
          sub_2486A64D8((uint64_t)&v212 - v68, (uint64_t)&v212 - v68);
          uint64_t v73 = v246((char *)&v212 - v68, 1, v32);
          if (v73)
          {
            sub_2486A20B8((uint64_t)&v212 - v68);
          }
          else
          {
            id v213 = &v212;
            uint64_t v74 = v245;
            MEMORY[0x270FA5388](v73);
            uint64_t v76 = (char *)&v212 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0);
            (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v76, v69, v32);
            sub_2486A20B8((uint64_t)v69);
            sub_2486AB8D8();
            (*(void (**)(char *, uint64_t))(v74 + 8))(v76, v32);
          }
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v77 = v250;
          unint64_t v79 = v13[2];
          unint64_t v78 = v13[3];
          if (v79 >= v78 >> 1) {
            id v13 = sub_248688E8C((void *)(v78 > 1), v79 + 1, 1, v13);
          }
          v13[2] = v79 + 1;
          *(_OWORD *)&v13[2 * v79 + 4] = v77;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          swift_bridgeObjectRelease();
          strcpy((char *)&v250, "start time: [");
          HIWORD(v250) = -4864;
          id v80 = objc_msgSend(v248, sel_attributeSet);
          unint64_t v81 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
          uint64_t v82 = (char *)&v212 - v81;
          id v83 = objc_msgSend((id)MEMORY[0x270FA5388](v80), sel_startDate);

          MEMORY[0x270FA5388](v84);
          if (v83)
          {
            sub_2486AB8C8();

            uint64_t v85 = 0;
          }
          else
          {
            uint64_t v85 = 1;
          }
          v244((char *)&v212 - v81, v85, 1, v32);
          sub_2486A64D8((uint64_t)&v212 - v81, (uint64_t)&v212 - v81);
          uint64_t v86 = v246((char *)&v212 - v81, 1, v32);
          if (v86)
          {
            sub_2486A20B8((uint64_t)&v212 - v81);
          }
          else
          {
            id v213 = &v212;
            uint64_t v87 = v245;
            MEMORY[0x270FA5388](v86);
            uint64_t v89 = (char *)&v212 - ((v88 + 15) & 0xFFFFFFFFFFFFFFF0);
            (*(void (**)(char *, char *, uint64_t))(v87 + 16))(v89, v82, v32);
            sub_2486A20B8((uint64_t)v82);
            sub_2486AB8D8();
            (*(void (**)(char *, uint64_t))(v87 + 8))(v89, v32);
          }
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v90 = v250;
          unint64_t v92 = v13[2];
          unint64_t v91 = v13[3];
          if (v92 >= v91 >> 1) {
            id v13 = sub_248688E8C((void *)(v91 > 1), v92 + 1, 1, v13);
          }
          v13[2] = v92 + 1;
          *(_OWORD *)&v13[2 * v92 + 4] = v90;
          strcpy((char *)&v250, "end time: [");
          HIDWORD(v250) = -352321536;
          id v93 = objc_msgSend(v248, sel_attributeSet);
          unint64_t v94 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
          uint64_t v95 = (char *)&v212 - v94;
          id v96 = objc_msgSend((id)MEMORY[0x270FA5388](v93), sel_endDate);

          MEMORY[0x270FA5388](v97);
          if (v96)
          {
            sub_2486AB8C8();

            uint64_t v98 = 0;
          }
          else
          {
            uint64_t v98 = 1;
          }
          uint64_t v99 = MEMORY[0x263F8D310];
          uint64_t v100 = v245;
          v244((char *)&v212 - v94, v98, 1, v32);
          sub_2486A64D8((uint64_t)&v212 - v94, (uint64_t)&v212 - v94);
          uint64_t v101 = v246((char *)&v212 - v94, 1, v32);
          if (v101)
          {
            sub_2486A20B8((uint64_t)&v212 - v94);
          }
          else
          {
            MEMORY[0x270FA5388](v101);
            uint64_t v103 = (char *)&v212 - ((v102 + 15) & 0xFFFFFFFFFFFFFFF0);
            (*(void (**)(char *, char *, uint64_t))(v100 + 16))(v103, v95, v32);
            sub_2486A20B8((uint64_t)v95);
            sub_2486AB8D8();
            uint64_t v104 = v103;
            uint64_t v99 = MEMORY[0x263F8D310];
            (*(void (**)(char *, uint64_t))(v100 + 8))(v104, v32);
          }
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v105 = v250;
          unint64_t v107 = v13[2];
          unint64_t v106 = v13[3];
          if (v107 >= v106 >> 1) {
            id v13 = sub_248688E8C((void *)(v106 > 1), v107 + 1, 1, v13);
          }
          uint64_t v108 = v241;
          id v109 = v248;
          v13[2] = v107 + 1;
          *(_OWORD *)&v13[2 * v107 + 4] = v105;
          strcpy((char *)&v250, "location: [");
          HIDWORD(v250) = -352321536;
          id v110 = objc_msgSend(v109, sel_attributeSet);
          id v111 = objc_msgSend(v110, sel_namedLocation);

          if (v111)
          {
            sub_2486ABB68();
          }
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v112 = v250;
          unint64_t v114 = v13[2];
          unint64_t v113 = v13[3];
          if (v114 >= v113 >> 1) {
            id v13 = sub_248688E8C((void *)(v113 > 1), v114 + 1, 1, v13);
          }
          v13[2] = v114 + 1;
          *(_OWORD *)&v13[2 * v114 + 4] = v112;
          strcpy((char *)&v250, "comment: [");
          BYTE11(v250) = 0;
          HIDWORD(v250) = -369098752;
          id v115 = objc_msgSend(v109, sel_attributeSet);
          id v116 = objc_msgSend(v115, sel_comment);

          if (v116)
          {
            sub_2486ABB68();
          }
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v117 = v250;
          unint64_t v119 = v13[2];
          unint64_t v118 = v13[3];
          if (v119 >= v118 >> 1) {
            id v13 = sub_248688E8C((void *)(v118 > 1), v119 + 1, 1, v13);
          }
          v13[2] = v119 + 1;
          *(_OWORD *)&v13[2 * v119 + 4] = v117;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          swift_bridgeObjectRelease();
          *(void *)&long long v250 = 0xD000000000000013;
          *((void *)&v250 + 1) = v227;
          id v120 = objc_msgSend(v109, sel_attributeSet);
          id v121 = objc_msgSend(v120, sel_allDay);

          if (!v121)
          {
            sub_24868CFDC(0, &qword_26931D5C8);
            id v121 = (id)sub_2486ABCD8();
          }
          id v122 = objc_msgSend(v121, sel_description);
          sub_2486ABB68();

          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v123 = v250;
          unint64_t v125 = v13[2];
          unint64_t v124 = v13[3];
          if (v125 >= v124 >> 1) {
            id v13 = sub_248688E8C((void *)(v124 > 1), v125 + 1, 1, v13);
          }
          unint64_t v3 = v214;
          v13[2] = v125 + 1;
          *(_OWORD *)&v13[2 * v125 + 4] = v123;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          swift_bridgeObjectRelease();
          *(void *)&long long v250 = 0xD00000000000001ELL;
          *((void *)&v250 + 1) = v226;
          id v126 = objc_msgSend(v248, sel_attributeSet);
          id v127 = objc_msgSend(v126, sel_calendarHolidayIdentifier);

          if (v127)
          {
            sub_2486ABB68();
          }
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v128 = v250;
          unint64_t v130 = v13[2];
          unint64_t v129 = v13[3];
          if (v130 >= v129 >> 1) {
            id v13 = sub_248688E8C((void *)(v129 > 1), v130 + 1, 1, v13);
          }
          v13[2] = v130 + 1;
          *(_OWORD *)&v13[2 * v130 + 4] = v128;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          swift_bridgeObjectRelease();
          *(void *)&long long v250 = 0xD000000000000015;
          *((void *)&v250 + 1) = v225;
          id v131 = objc_msgSend(v248, sel_attributeSet);
          id v132 = objc_msgSend(v131, sel_accountIdentifier);

          if (v132)
          {
            sub_2486ABB68();
          }
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v133 = v250;
          unint64_t v135 = v13[2];
          unint64_t v134 = v13[3];
          if (v135 >= v134 >> 1) {
            id v13 = sub_248688E8C((void *)(v134 > 1), v135 + 1, 1, v13);
          }
          v13[2] = v135 + 1;
          *(_OWORD *)&v13[2 * v135 + 4] = v133;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          long long v252 = v250;
          sub_2486ABBB8();
          id v136 = objc_msgSend(v248, sel_attributeSet);
          id v137 = objc_msgSend(v136, sel_attributeForKey_, v236);

          if (v137)
          {
            sub_2486ABD28();
            swift_unknownObjectRelease();
            sub_248692290(&v249, &v250);
          }
          else
          {
            uint64_t v251 = v99;
            *(void *)&long long v250 = 0;
            *((void *)&v250 + 1) = 0xE000000000000000;
          }
          sub_2486ABE48();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v250);
          sub_2486ABBB8();
          long long v138 = v252;
          unint64_t v140 = v13[2];
          unint64_t v139 = v13[3];
          if (v140 >= v139 >> 1) {
            id v13 = sub_248688E8C((void *)(v139 > 1), v140 + 1, 1, v13);
          }
          v13[2] = v140 + 1;
          *(_OWORD *)&v13[2 * v140 + 4] = v138;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          long long v252 = v250;
          sub_2486ABBB8();
          id v141 = objc_msgSend(v248, sel_attributeSet);
          id v142 = objc_msgSend(v141, sel_attributeForKey_, v234);

          if (v142)
          {
            sub_2486ABD28();
            swift_unknownObjectRelease();
            sub_248692290(&v249, &v250);
          }
          else
          {
            uint64_t v251 = v99;
            *(void *)&long long v250 = 0;
            *((void *)&v250 + 1) = 0xE000000000000000;
          }
          sub_2486ABE48();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v250);
          sub_2486ABBB8();
          long long v143 = v252;
          unint64_t v145 = v13[2];
          unint64_t v144 = v13[3];
          if (v145 >= v144 >> 1) {
            id v13 = sub_248688E8C((void *)(v144 > 1), v145 + 1, 1, v13);
          }
          v13[2] = v145 + 1;
          *(_OWORD *)&v13[2 * v145 + 4] = v143;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          long long v252 = v250;
          sub_2486ABBB8();
          id v146 = objc_msgSend(v248, sel_attributeSet);
          id v147 = objc_msgSend(v146, sel_attributeForKey_, v233);

          if (v147)
          {
            sub_2486ABD28();
            swift_unknownObjectRelease();
            sub_248692290(&v249, &v250);
          }
          else
          {
            uint64_t v251 = v99;
            *(void *)&long long v250 = 0;
            *((void *)&v250 + 1) = 0xE000000000000000;
          }
          sub_2486ABE48();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v250);
          sub_2486ABBB8();
          long long v148 = v252;
          unint64_t v150 = v13[2];
          unint64_t v149 = v13[3];
          if (v150 >= v149 >> 1) {
            id v13 = sub_248688E8C((void *)(v149 > 1), v150 + 1, 1, v13);
          }
          v13[2] = v150 + 1;
          *(_OWORD *)&v13[2 * v150 + 4] = v148;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          long long v252 = v250;
          sub_2486ABBB8();
          id v151 = objc_msgSend(v248, sel_attributeSet);
          id v152 = objc_msgSend(v151, sel_attributeForKey_, v231);

          if (v152)
          {
            sub_2486ABD28();
            swift_unknownObjectRelease();
            sub_248692290(&v249, &v250);
          }
          else
          {
            uint64_t v251 = v99;
            *(void *)&long long v250 = 0;
            *((void *)&v250 + 1) = 0xE000000000000000;
          }
          sub_2486ABE48();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v250);
          sub_2486ABBB8();
          long long v153 = v252;
          unint64_t v155 = v13[2];
          unint64_t v154 = v13[3];
          if (v155 >= v154 >> 1) {
            id v13 = sub_248688E8C((void *)(v154 > 1), v155 + 1, 1, v13);
          }
          v13[2] = v155 + 1;
          *(_OWORD *)&v13[2 * v155 + 4] = v153;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          long long v252 = v250;
          sub_2486ABBB8();
          id v156 = objc_msgSend(v248, sel_attributeSet);
          id v157 = objc_msgSend(v156, sel_attributeForKey_, v230);

          if (v157)
          {
            sub_2486ABD28();
            swift_unknownObjectRelease();
            sub_248692290(&v249, &v250);
          }
          else
          {
            uint64_t v251 = v99;
            *(void *)&long long v250 = 0;
            *((void *)&v250 + 1) = 0xE000000000000000;
          }
          sub_2486ABE48();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v250);
          sub_2486ABBB8();
          long long v158 = v252;
          unint64_t v160 = v13[2];
          unint64_t v159 = v13[3];
          if (v160 >= v159 >> 1) {
            id v13 = sub_248688E8C((void *)(v159 > 1), v160 + 1, 1, v13);
          }
          v13[2] = v160 + 1;
          *(_OWORD *)&v13[2 * v160 + 4] = v158;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          swift_bridgeObjectRelease();
          *(void *)&long long v250 = 0xD000000000000012;
          *((void *)&v250 + 1) = v219;
          id v161 = objc_msgSend(v248, sel_attributeSet);
          id v162 = objc_msgSend(v161, sel_accountHandles);

          if (v162)
          {
            uint64_t v163 = MEMORY[0x263F8D310];
            uint64_t v164 = sub_2486ABBF8();
          }
          else
          {
            uint64_t v164 = MEMORY[0x263F8EE78];
            uint64_t v163 = MEMORY[0x263F8D310];
          }
          MEMORY[0x24C57B430](v164, v163);
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v165 = v250;
          unint64_t v167 = v13[2];
          unint64_t v166 = v13[3];
          if (v167 >= v166 >> 1) {
            id v13 = sub_248688E8C((void *)(v166 > 1), v167 + 1, 1, v13);
          }
          v13[2] = v167 + 1;
          *(_OWORD *)&v13[2 * v167 + 4] = v165;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          swift_bridgeObjectRelease();
          *(void *)&long long v250 = v242;
          *((void *)&v250 + 1) = v218;
          id v168 = objc_msgSend(v248, sel_attributeSet);
          id v169 = objc_msgSend(v168, sel_phoneNumbers);

          if (v169)
          {
            uint64_t v170 = MEMORY[0x263F8D310];
            uint64_t v171 = sub_2486ABBF8();
          }
          else
          {
            uint64_t v171 = MEMORY[0x263F8EE78];
            uint64_t v170 = MEMORY[0x263F8D310];
          }
          MEMORY[0x24C57B430](v171, v170);
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v172 = v250;
          unint64_t v174 = v13[2];
          unint64_t v173 = v13[3];
          if (v174 >= v173 >> 1) {
            id v13 = sub_248688E8C((void *)(v173 > 1), v174 + 1, 1, v13);
          }
          v13[2] = v174 + 1;
          *(_OWORD *)&v13[2 * v174 + 4] = v172;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          swift_bridgeObjectRelease();
          *(void *)&long long v250 = 0xD000000000000012;
          *((void *)&v250 + 1) = v217;
          id v175 = objc_msgSend(v248, sel_attributeSet);
          id v176 = objc_msgSend(v175, sel_emailAddresses);

          if (v176)
          {
            uint64_t v177 = MEMORY[0x263F8D310];
            uint64_t v178 = sub_2486ABBF8();
          }
          else
          {
            uint64_t v178 = MEMORY[0x263F8EE78];
            uint64_t v177 = MEMORY[0x263F8D310];
          }
          MEMORY[0x24C57B430](v178, v177);
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v179 = v250;
          unint64_t v181 = v13[2];
          unint64_t v180 = v13[3];
          if (v181 >= v180 >> 1) {
            id v13 = sub_248688E8C((void *)(v180 > 1), v181 + 1, 1, v13);
          }
          v13[2] = v181 + 1;
          *(_OWORD *)&v13[2 * v181 + 4] = v179;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          swift_bridgeObjectRelease();
          *(void *)&long long v250 = 0xD000000000000012;
          *((void *)&v250 + 1) = v216;
          id v182 = objc_msgSend(v248, sel_attributeSet);
          id v183 = objc_msgSend(v182, sel_alternateNames);

          if (v183)
          {
            uint64_t v7 = MEMORY[0x263F8D310];
            uint64_t v184 = sub_2486ABBF8();
          }
          else
          {
            uint64_t v184 = MEMORY[0x263F8EE78];
            uint64_t v7 = MEMORY[0x263F8D310];
          }
          MEMORY[0x24C57B430](v184, v7);
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v185 = v250;
          unint64_t v187 = v13[2];
          unint64_t v186 = v13[3];
          if (v187 >= v186 >> 1) {
            id v13 = sub_248688E8C((void *)(v186 > 1), v187 + 1, 1, v13);
          }
          v13[2] = v187 + 1;
          *(_OWORD *)&v13[2 * v187 + 4] = v185;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          long long v252 = v250;
          sub_2486ABBB8();
          id v188 = objc_msgSend(v248, sel_attributeSet);
          id v189 = objc_msgSend(v188, sel_attributeForKey_, v228);

          if (v189)
          {
            sub_2486ABD28();
            swift_unknownObjectRelease();
            sub_248692290(&v249, &v250);
          }
          else
          {
            uint64_t v251 = v7;
            *(void *)&long long v250 = 0;
            *((void *)&v250 + 1) = 0xE000000000000000;
          }
          sub_2486ABE48();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v250);
          sub_2486ABBB8();
          long long v190 = v252;
          unint64_t v192 = v13[2];
          unint64_t v191 = v13[3];
          if (v192 >= v191 >> 1) {
            id v13 = sub_248688E8C((void *)(v191 > 1), v192 + 1, 1, v13);
          }
          v13[2] = v192 + 1;
          *(_OWORD *)&v13[2 * v192 + 4] = v190;
          strcpy((char *)&v250, "bundleID: [");
          HIDWORD(v250) = -352321536;
          id v193 = objc_msgSend(v248, sel_attributeSet);
          id v194 = objc_msgSend(v193, sel_bundleID);

          if (v194)
          {
            sub_2486ABB68();
          }
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v195 = v250;
          unint64_t v197 = v13[2];
          unint64_t v196 = v13[3];
          if (v197 >= v196 >> 1) {
            id v13 = sub_248688E8C((void *)(v196 > 1), v197 + 1, 1, v13);
          }
          v13[2] = v197 + 1;
          *(_OWORD *)&v13[2 * v197 + 4] = v195;
          *(void *)&long long v250 = 0;
          *((void *)&v250 + 1) = 0xE000000000000000;
          sub_2486ABD98();
          swift_bridgeObjectRelease();
          strcpy((char *)&v250, "contentType: [");
          HIBYTE(v250) = -18;
          id v198 = objc_msgSend(v248, sel_attributeSet);
          id v199 = objc_msgSend(v198, sel_contentType);

          if (v199)
          {
            sub_2486ABB68();
          }
          sub_2486ABBB8();
          swift_bridgeObjectRelease();
          sub_2486ABBB8();
          long long v200 = v250;
          unint64_t v202 = v13[2];
          unint64_t v201 = v13[3];
          if (v202 >= v201 >> 1) {
            id v13 = sub_248688E8C((void *)(v201 > 1), v202 + 1, 1, v13);
          }
          v13[2] = v202 + 1;
          *(_OWORD *)&v13[2 * v202 + 4] = v200;
          *(void *)&long long v250 = v13;
          __swift_instantiateConcreteTypeFromMangledName(&qword_26931D308);
          sub_24869BB70();
          uint64_t v203 = sub_2486ABB18();
          uint64_t v205 = v204;
          swift_bridgeObjectRelease();
          id v206 = (void **)v240;
          swift_beginAccess();
          int64_t v207 = *v206;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *id v206 = v207;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            int64_t v207 = sub_248688E8C(0, v207[2] + 1, 1, v207);
            *uint64_t v240 = v207;
          }
          unint64_t v210 = v207[2];
          unint64_t v209 = v207[3];
          if (v210 >= v209 >> 1)
          {
            int64_t v207 = sub_248688E8C((void *)(v209 > 1), v210 + 1, 1, v207);
            *uint64_t v240 = v207;
          }
          uint64_t v6 = v108 + 1;
          v207[2] = v210 + 1;
          v211 = &v207[2 * v210];
          v211[4] = v203;
          v211[5] = v205;
          swift_endAccess();
        }
        while (v239 != v6);
        return swift_bridgeObjectRelease();
      }
      return result;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_2486A5544(uint64_t a1, void (*a2)(uint64_t))
{
  swift_beginAccess();
  uint64_t v3 = swift_bridgeObjectRetain();
  a2(v3);
  return swift_bridgeObjectRelease();
}

id ArchetypeRawAssortment.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ArchetypeRawAssortment.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ArchetypeRawAssortment();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ArchetypeRawAssortment.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ArchetypeRawAssortment();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void _s15ArchetypeEngine0A13RawAssortmentC19spotlightItemTitles01nG017completionHandlerySi_ySaySSGctF_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = MEMORY[0x263F8EE78];
  id v7 = objc_allocWithZone(MEMORY[0x263F02AC8]);
  id v8 = (void *)sub_2486ABB58();
  uint64_t v9 = (void *)sub_2486ABBE8();
  id v10 = objc_msgSend(v7, sel_initWithQueryString_attributes_, v8, v9);

  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = v6;
  unint64_t v19 = sub_2486A6584;
  unint64_t v20 = (void *)v11;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 1107296256;
  id v17 = sub_2486A2558;
  long long v18 = &block_descriptor_38;
  long long v12 = _Block_copy(&v15);
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_setFoundItemsHandler_, v12);
  _Block_release(v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = a2;
  v13[3] = a3;
  v13[4] = v6;
  unint64_t v19 = (uint64_t (*)(unint64_t))sub_2486A65D0;
  unint64_t v20 = v13;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 1107296256;
  id v17 = sub_2486A25DC;
  long long v18 = &block_descriptor_44;
  unint64_t v14 = _Block_copy(&v15);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_setCompletionHandler_, v14);
  _Block_release(v14);
  objc_msgSend(v10, sel_start);
  swift_release();
}

void _s15ArchetypeEngine0A13RawAssortmentC24spotlightEmailAttributes7nEmails17completionHandlerySi_ySaySSGctF_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D290);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2486ACEE0;
  *(void *)(v7 + 32) = sub_2486ABB68();
  *(void *)(v7 + 40) = v8;
  *(void *)(v7 + 48) = sub_2486ABB68();
  *(void *)(v7 + 56) = v9;
  *(void *)(v7 + 64) = sub_2486ABB68();
  *(void *)(v7 + 72) = v10;
  *(void *)(v7 + 80) = sub_2486ABB68();
  *(void *)(v7 + 88) = v11;
  id v12 = objc_allocWithZone(MEMORY[0x263F02AC8]);
  id v13 = (void *)sub_2486ABB58();
  unint64_t v14 = (void *)sub_2486ABBE8();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v12, sel_initWithQueryString_attributes_, v13, v14);

  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  *(void *)(v16 + 24) = v6;
  unint64_t v24 = sub_2486A6578;
  unint64_t v25 = (void *)v16;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  id v22 = sub_2486A2558;
  long long v23 = &block_descriptor_25;
  id v17 = _Block_copy(&v20);
  swift_retain();
  swift_release();
  objc_msgSend(v15, sel_setFoundItemsHandler_, v17);
  _Block_release(v17);
  long long v18 = (void *)swift_allocObject();
  v18[2] = a2;
  v18[3] = a3;
  v18[4] = v6;
  unint64_t v24 = (uint64_t (*)(unint64_t))sub_2486A65D0;
  unint64_t v25 = v18;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  id v22 = sub_2486A25DC;
  long long v23 = &block_descriptor_31;
  unint64_t v19 = _Block_copy(&v20);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v15, sel_setCompletionHandler_, v19);
  _Block_release(v19);
  objc_msgSend(v15, sel_start);
  swift_release();
}

void _s15ArchetypeEngine0A13RawAssortmentC12textOnScreenSSyF_0()
{
  id v0 = objc_msgSend(self, sel_primaryApp);
  if (!v0) {
    return;
  }
  id v1 = v0;
  id v2 = objc_msgSend(v1, sel_visibleElements);
  if (v2)
  {
    uint64_t v3 = v2;
    sub_24868CFDC(0, (unint64_t *)&qword_26931D5D0);
    unint64_t v4 = sub_2486ABBF8();

    if (!(v4 >> 62)) {
      goto LABEL_4;
    }
LABEL_21:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_2486ABE68();
    swift_bridgeObjectRelease();
    long long v18 = v1;
    if (v5) {
      goto LABEL_5;
    }
LABEL_22:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D308);
    sub_24869BB70();
    sub_2486ABB18();
    swift_bridgeObjectRelease();

    return;
  }
  unint64_t v4 = MEMORY[0x263F8EE78];
  if (MEMORY[0x263F8EE78] >> 62) {
    goto LABEL_21;
  }
LABEL_4:
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  long long v18 = v1;
  if (!v5) {
    goto LABEL_22;
  }
LABEL_5:
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v4 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x24C57B5F0](v6, v4);
      }
      else {
        id v8 = *(id *)(v4 + 8 * v6 + 32);
      }
      uint64_t v9 = v8;
      id v10 = objc_msgSend(v8, sel_label, v18);
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = sub_2486ABB68();
        unint64_t v14 = v13;
      }
      else
      {
        uint64_t v12 = 0;
        unint64_t v14 = 0xE000000000000000;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v7 = sub_248688E8C(0, v7[2] + 1, 1, v7);
      }
      unint64_t v16 = v7[2];
      unint64_t v15 = v7[3];
      if (v16 >= v15 >> 1) {
        uint64_t v7 = sub_248688E8C((void *)(v15 > 1), v16 + 1, 1, v7);
      }
      ++v6;
      v7[2] = v16 + 1;
      id v17 = &v7[2 * v16];
      v17[4] = v12;
      v17[5] = v14;
    }
    while (v5 != v6);
    goto LABEL_22;
  }
  __break(1u);
}

void _s15ArchetypeEngine0A13RawAssortmentC14spotlightItems11contentType17completionHandlerySS_ySaySSGctF_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = MEMORY[0x263F8EE78];
  sub_2486ABD98();
  swift_bridgeObjectRelease();
  uint64_t v41 = 0x54746E65746E6F63;
  unint64_t v42 = 0xEF203D3D20657079;
  sub_2486ABBB8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D290);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2486ACEF0;
  *(void *)(v7 + 32) = sub_2486ABB68();
  *(void *)(v7 + 40) = v8;
  *(void *)(v7 + 48) = sub_2486ABB68();
  *(void *)(v7 + 56) = v9;
  *(void *)(v7 + 64) = sub_2486ABB68();
  *(void *)(v7 + 72) = v10;
  *(void *)(v7 + 80) = sub_2486ABB68();
  *(void *)(v7 + 88) = v11;
  *(void *)(v7 + 96) = sub_2486ABB68();
  *(void *)(v7 + 104) = v12;
  *(void *)(v7 + 112) = sub_2486ABB68();
  *(void *)(v7 + 120) = v13;
  *(void *)(v7 + 128) = sub_2486ABB68();
  *(void *)(v7 + 136) = v14;
  *(void *)(v7 + 144) = sub_2486ABB68();
  *(void *)(v7 + 152) = v15;
  *(void *)(v7 + 160) = sub_2486ABB68();
  *(void *)(v7 + 168) = v16;
  *(void *)(v7 + 176) = sub_2486ABB68();
  *(void *)(v7 + 184) = v17;
  *(void *)(v7 + 192) = sub_2486ABB68();
  *(void *)(v7 + 200) = v18;
  *(void *)(v7 + 208) = sub_2486ABB68();
  *(void *)(v7 + 216) = v19;
  *(void *)(v7 + 224) = sub_2486ABB68();
  *(void *)(v7 + 232) = v20;
  *(void *)(v7 + 240) = sub_2486ABB68();
  *(void *)(v7 + 248) = v21;
  *(void *)(v7 + 256) = sub_2486ABB68();
  *(void *)(v7 + 264) = v22;
  *(void *)(v7 + 272) = sub_2486ABB68();
  *(void *)(v7 + 280) = v23;
  *(void *)(v7 + 288) = sub_2486ABB68();
  *(void *)(v7 + 296) = v24;
  *(void *)(v7 + 304) = sub_2486ABB68();
  *(void *)(v7 + 312) = v25;
  *(void *)(v7 + 320) = sub_2486ABB68();
  *(void *)(v7 + 328) = v26;
  *(void *)(v7 + 336) = sub_2486ABB68();
  *(void *)(v7 + 344) = v27;
  *(void *)(v7 + 352) = sub_2486ABB68();
  *(void *)(v7 + 360) = v28;
  *(void *)(v7 + 368) = sub_2486ABB68();
  *(void *)(v7 + 376) = v29;
  *(void *)(v7 + 384) = sub_2486ABB68();
  *(void *)(v7 + 392) = v30;
  *(void *)(v7 + 400) = sub_2486ABB68();
  *(void *)(v7 + 408) = v31;
  *(void *)(v7 + 416) = sub_2486ABB68();
  *(void *)(v7 + 424) = v32;
  *(void *)(v7 + 432) = sub_2486ABB68();
  *(void *)(v7 + 440) = v33;
  id v34 = objc_allocWithZone(MEMORY[0x263F02AC8]);
  uint64_t v35 = (void *)sub_2486ABB58();
  swift_bridgeObjectRelease();
  long long v36 = (void *)sub_2486ABBE8();
  swift_bridgeObjectRelease();
  id v37 = objc_msgSend(v34, sel_initWithQueryString_attributes_, v35, v36, v41, v42);

  uint64_t v45 = sub_2486A6494;
  uint64_t v46 = (void *)v6;
  uint64_t v41 = MEMORY[0x263EF8330];
  unint64_t v42 = 1107296256;
  id v43 = sub_2486A2558;
  uint64_t v44 = &block_descriptor_2;
  unint64_t v38 = _Block_copy(&v41);
  swift_retain();
  swift_release();
  objc_msgSend(v37, sel_setFoundItemsHandler_, v38);
  _Block_release(v38);
  unint64_t v39 = (void *)swift_allocObject();
  v39[2] = a3;
  v39[3] = a4;
  v39[4] = v6;
  uint64_t v45 = sub_2486A64B8;
  uint64_t v46 = v39;
  uint64_t v41 = MEMORY[0x263EF8330];
  unint64_t v42 = 1107296256;
  id v43 = sub_2486A25DC;
  uint64_t v44 = &block_descriptor_18;
  id v40 = _Block_copy(&v41);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v37, sel_setCompletionHandler_, v40);
  _Block_release(v40);
  objc_msgSend(v37, sel_start);
  swift_release();
}

uint64_t type metadata accessor for ArchetypeRawAssortment()
{
  return self;
}

uint64_t sub_2486A63C0()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2486A63FC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = (id)sub_2486ABBE8();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t sub_2486A645C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2486A6494(unint64_t a1)
{
  return sub_2486A2E64(a1, v1);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_2486A64B8(uint64_t a1)
{
  return sub_2486A5544(a1, *(void (**)(uint64_t))(v1 + 16));
}

uint64_t sub_2486A64D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2486A6540()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2486A6578(unint64_t a1)
{
  return sub_2486A2874(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2486A6584(unint64_t a1)
{
  return sub_2486A265C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t objectdestroy_14Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t ATSpotlightMailRetriever.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  ATSpotlightMailRetriever.init()();
  return v0;
}

uint64_t ATSpotlightMailRetriever.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)(v0 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_bundleId);
  *uint64_t v2 = 0xD000000000000014;
  v2[1] = 0x80000002486AD040;
  uint64_t v3 = (uint64_t *)(v0 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_mailUniqueRecordIdentifier);
  *uint64_t v3 = sub_2486ABB68();
  v3[1] = v4;
  uint64_t v5 = (uint64_t *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_mailConversationId);
  *uint64_t v5 = sub_2486ABB68();
  v5[1] = v6;
  uint64_t v7 = (uint64_t *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_mailReceivedDate);
  *uint64_t v7 = sub_2486ABB68();
  v7[1] = v8;
  *(void *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_longestChain) = 100;
  uint64_t v9 = sub_2486AB8F8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2486AB8E8();
  sub_2486AB878();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  *(void *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_records) = MEMORY[0x263F8EE78];
  return v1;
}

uint64_t ATSpotlightMailRetriever.getRecentRecordsAsync(nRecords:addendum:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[6] = a3;
  v4[7] = v3;
  v4[4] = a1;
  v4[5] = a2;
  return MEMORY[0x270FA2498](sub_2486A6808, 0, 0);
}

uint64_t sub_2486A6808()
{
  uint64_t v1 = v0[6];
  sub_2486ABD98();
  uint64_t v2 = sub_2486ABB68();
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  sub_2486ABBB8();
  uint64_t v6 = v2;
  uint64_t v5 = v4;
  v0[2] = v6;
  v0[3] = v4;
  if (v1)
  {
    unint64_t v7 = v0[6];
    uint64_t v8 = HIBYTE(v7) & 0xF;
    if ((v7 & 0x2000000000000000) == 0) {
      uint64_t v8 = v0[5] & 0xFFFFFFFFFFFFLL;
    }
    if (v8) {
      sub_2486ABBB8();
    }
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    uint64_t v6 = v0[2];
    uint64_t v5 = v0[3];
  }
  v0[8] = v5;
  uint64_t v9 = (uint64_t *)(v0[7] + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_bundleId);
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (void *)swift_task_alloc();
  v0[9] = v12;
  void *v12 = v0;
  v12[1] = sub_2486A69A8;
  uint64_t v13 = v0[4];
  return ATSpotlightDataRetriever.getRecentRecordsAsync(bundleId:nRecords:addendum:)(v10, v11, v13, v6, v5);
}

uint64_t sub_2486A69A8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 80) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_2486A6AC8, 0, 0);
}

uint64_t sub_2486A6AC8()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 80));
}

uint64_t ATSpotlightMailRetriever.getRecentRecords(nRecords:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26931D488);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_bundleId);
  uint64_t v7 = *(void *)(v2 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_bundleId + 8);
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v10 = sub_2486ABC58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v2;
  v11[5] = v8;
  _OWORD v11[6] = v7;
  v11[7] = a1;
  v11[8] = v9;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v12 = v9;
  sub_2486991E8((uint64_t)v6, (uint64_t)&unk_26931D490, (uint64_t)v11);
  swift_release();
  sub_2486ABCB8();

  return swift_bridgeObjectRetain();
}

uint64_t sub_2486A6C44()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t ATSpotlightMailRetriever.getEmailChain(uniqueIdentifier:)(uint64_t a1, uint64_t a2)
{
  v3[2] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D5E8);
  uint64_t v6 = swift_task_alloc();
  v3[3] = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[4] = v7;
  *uint64_t v7 = v3;
  v7[4] = a2;
  v7[5] = v2;
  v7[2] = v6;
  v7[3] = a1;
  v7[1] = sub_2486A6D88;
  return MEMORY[0x270FA2498](sub_2486A8980, 0, 0);
}

uint64_t sub_2486A6D88()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 40) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_2486A6EE0;
  uint64_t v4 = *(void *)(v1 + 24);
  return sub_2486A823C(v4);
}

uint64_t sub_2486A6EE0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 48) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2486A6FE0, 0, 0);
}

uint64_t sub_2486A6FE0()
{
  sub_24868D470(v0[3], &qword_26931D5E8);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[6];
  return v1(v2);
}

uint64_t ATSpotlightMailRetriever.getPreviousEmailsInChain(uniqueIdentifier:)(uint64_t a1, uint64_t a2)
{
  v3[2] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D5E8);
  v3[3] = swift_task_alloc();
  uint64_t v6 = swift_task_alloc();
  v3[4] = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *uint64_t v7 = v3;
  v7[4] = a2;
  v7[5] = v2;
  v7[2] = v6;
  v7[3] = a1;
  v7[1] = sub_2486A715C;
  return MEMORY[0x270FA2498](sub_2486A8980, 0, 0);
}

uint64_t sub_2486A715C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 48) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_2486A72B4;
  uint64_t v4 = *(void *)(v1 + 32);
  return sub_2486A823C(v4);
}

uint64_t sub_2486A72B4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 56) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2486A73B4, 0, 0);
}

uint64_t sub_2486A73B4()
{
  uint64_t v30 = *(void *)(v0 + 56);
  uint64_t v1 = *(void *)(v0 + 32);
  if (!*(void *)(v30 + 16))
  {
    sub_24868D470(*(void *)(v0 + 32), &qword_26931D5E8);
    uint64_t v18 = *(void *)(v0 + 56);
    goto LABEL_25;
  }
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = sub_2486AB8F8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v27 = swift_task_alloc();
  sub_248699754(v1, v2, &qword_26931D5E8);
  uint64_t v5 = type metadata accessor for ATSpotlightDataRecord();
  uint64_t v29 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v2, 1, v5);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v7 = *(void *)(v0 + 24);
  uint64_t v8 = v7 + *(int *)(v5 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D240);
  uint64_t v9 = swift_task_alloc();
  sub_248699754(v8, v9, &qword_26931D240);
  sub_24869514C(v7);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  uint64_t result = v10(v9, 1, v3);
  if (result == 1)
  {
LABEL_32:
    __break(1u);
    return result;
  }
  uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
  v26(v27, v9, v3);
  swift_task_dealloc();
  unint64_t v11 = *(void *)(v30 + 16);
  if (!v11)
  {
LABEL_22:
    uint64_t v18 = MEMORY[0x263F8EE78];
LABEL_23:
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  unint64_t v12 = 0;
  uint64_t v24 = v4;
  uint64_t v25 = v0;
  uint64_t v28 = *(void *)(v0 + 56)
      + ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80));
  uint64_t v13 = (void (**)(uint64_t, uint64_t))(v4 + 8);
  while (1)
  {
    uint64_t v14 = swift_task_alloc();
    if (v12 >= *(void *)(v30 + 16))
    {
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      swift_bridgeObjectRelease();
      uint64_t v18 = sub_248689A44((uint64_t)v13, v28, v12, (2 * v11) | 1);
      goto LABEL_13;
    }
    uint64_t v15 = v14;
    uint64_t v16 = v28 + *(void *)(v29 + 72) * v12 + *(int *)(v5 + 64);
    uint64_t v17 = swift_task_alloc();
    sub_248699754(v16, v17, &qword_26931D240);
    uint64_t v0 = v3;
    if (v10(v17, 1, v3) != 1) {
      break;
    }
    sub_24868D470(v17, &qword_26931D240);
    swift_task_dealloc();
LABEL_7:
    swift_task_dealloc();
    if (v11 == ++v12)
    {
      unint64_t v12 = 0;
      goto LABEL_16;
    }
  }
  v26(v15, v17, v3);
  swift_task_dealloc();
  uint64_t v0 = sub_2486AB8A8();
  (*v13)(v15, v3);
  if ((v0 & 1) == 0) {
    goto LABEL_7;
  }
  swift_task_dealloc();
  if (v12 >= v11)
  {
    uint64_t v18 = MEMORY[0x263F8EE78];
    uint64_t v0 = v25;
LABEL_13:
    uint64_t v4 = v24;
    goto LABEL_23;
  }
LABEL_16:
  unint64_t v19 = *(void *)(v30 + 16);
  uint64_t v0 = v25;
  if (v19 < v12 || v19 < v11) {
    goto LABEL_29;
  }
  sub_2486ABF18();
  swift_unknownObjectRetain_n();
  uint64_t v20 = swift_dynamicCastClass();
  if (!v20)
  {
    swift_bridgeObjectRelease();
    uint64_t v20 = MEMORY[0x263F8EE78];
  }
  uint64_t v21 = *(void *)(v20 + 16);
  swift_release();
  uint64_t v13 = *(void (***)(uint64_t, uint64_t))(v25 + 56);
  if (v21 != v11 - v12) {
    goto LABEL_30;
  }
  uint64_t v18 = swift_dynamicCastClass();
  swift_bridgeObjectRelease();
  uint64_t v4 = v24;
  if (!v18) {
    goto LABEL_22;
  }
LABEL_24:
  uint64_t v22 = *(void *)(v0 + 32);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v27, v3);
  sub_24868D470(v22, &qword_26931D5E8);
  swift_task_dealloc();
LABEL_25:
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v23(v18);
}

uint64_t ATSpotlightMailRetriever.getRecentEmailsSubsetMatch(fromAuthor:toRecipients:withAdditionalRecipients:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[7] = a4;
  v5[8] = v4;
  v5[5] = a2;
  v5[6] = a3;
  v5[4] = a1;
  v5[9] = *(void *)(type metadata accessor for ATSpotlightDataRecord() - 8);
  v5[10] = swift_task_alloc();
  v5[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2486A7930, 0, 0);
}

uint64_t sub_2486A7930()
{
  unint64_t v1 = v0[5];
  uint64_t v2 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0) {
    uint64_t v2 = v0[4] & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    uint64_t v3 = v0[6];
    uint64_t v18 = sub_2486ABB68();
    uint64_t v19 = v4;
    swift_bridgeObjectRetain();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    v0[2] = v18;
    v0[3] = v19;
    uint64_t v5 = *(void *)(v3 + 16);
    if (v5)
    {
      uint64_t v6 = swift_bridgeObjectRetain() + 40;
      do
      {
        sub_2486ABB68();
        swift_bridgeObjectRetain();
        sub_2486ABBB8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_2486ABBB8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_2486ABBB8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_2486ABBB8();
        swift_bridgeObjectRelease();
        v6 += 16;
        --v5;
      }
      while (v5);
      swift_bridgeObjectRelease();
    }
    uint64_t v7 = *(void *)(v0[7] + 16);
    if (v7)
    {
      uint64_t v8 = swift_bridgeObjectRetain() + 40;
      do
      {
        sub_2486ABB68();
        swift_bridgeObjectRetain();
        sub_2486ABBB8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_2486ABBB8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_2486ABBB8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_2486ABBB8();
        swift_bridgeObjectRelease();
        v8 += 16;
        --v7;
      }
      while (v7);
      swift_bridgeObjectRelease();
    }
    uint64_t v9 = (uint64_t *)(v0[8] + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_bundleId);
    uint64_t v11 = *v9;
    uint64_t v10 = v9[1];
    uint64_t v12 = v0[2];
    uint64_t v13 = v0[3];
    v0[12] = v13;
    swift_bridgeObjectRetain();
    uint64_t v14 = (void *)swift_task_alloc();
    v0[13] = v14;
    *uint64_t v14 = v0;
    v14[1] = sub_2486A7CDC;
    return ATSpotlightDataRetriever.getRecentRecordsAsync(bundleId:nRecords:addendum:)(v11, v10, 100, v12, v13);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v17 = MEMORY[0x263F8EE78];
    return v16(v17);
  }
}

uint64_t sub_2486A7CDC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 112) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_2486A7DFC, 0, 0);
}

void sub_2486A7DFC()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = MEMORY[0x263F8EE78];
  uint64_t v17 = MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    unint64_t v4 = 0;
    uint64_t v5 = v0[11];
    uint64_t v6 = v0[9];
    uint64_t v16 = v0[14];
    while (v4 < *(void *)(v1 + 16))
    {
      unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      uint64_t v8 = *(void *)(v6 + 72);
      sub_24869222C(v0[14] + v7 + v8 * v4, v0[11]);
      unint64_t v9 = *(void *)(v5 + 32);
      uint64_t v10 = *(void *)(v5 + 24) & 0xFFFFFFFFFFFFLL;
      if ((v9 & 0x2000000000000000) != 0) {
        uint64_t v10 = HIBYTE(v9) & 0xF;
      }
      uint64_t v11 = v0[11];
      if (v10)
      {
        sub_24869963C(v11, v0[10]);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24868B228(0, *(void *)(v2 + 16) + 1, 1);
          uint64_t v2 = v17;
        }
        unint64_t v13 = *(void *)(v2 + 16);
        unint64_t v12 = *(void *)(v2 + 24);
        if (v13 >= v12 >> 1)
        {
          sub_24868B228(v12 > 1, v13 + 1, 1);
          uint64_t v2 = v17;
        }
        uint64_t v14 = v0[10];
        *(void *)(v2 + 16) = v13 + 1;
        sub_24869963C(v14, v2 + v7 + v13 * v8);
        uint64_t v1 = v16;
      }
      else
      {
        sub_24869514C(v11);
      }
      if (v3 == ++v4) {
        goto LABEL_14;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = (void (*)(uint64_t))v0[1];
    v15(v2);
  }
}

uint64_t ATSpotlightMailRetriever.getRecentEmails(fromAuthor:toRecipients:withAdditionalRecipients:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  unint64_t v9 = (void *)swift_task_alloc();
  v4[6] = v9;
  *unint64_t v9 = v4;
  v9[1] = sub_2486A806C;
  return ATSpotlightMailRetriever.getRecentEmailsSubsetMatch(fromAuthor:toRecipients:withAdditionalRecipients:)(a1, a2, a3, a4);
}

uint64_t sub_2486A806C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 56) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2486A816C, 0, 0);
}

uint64_t sub_2486A816C()
{
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v4 = v0[2];
  uint64_t v5 = v0[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_2486AA0E0(v1, v4, v5, v3, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v7 = (uint64_t (*)(uint64_t))v0[1];
  return v7(v6);
}

uint64_t sub_2486A823C(uint64_t a1)
{
  void v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_2486ABB08();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D5E8);
  v2[7] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for ATSpotlightDataRecord();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2486A83A4, 0, 0);
}

uint64_t sub_2486A83A4()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[7];
  sub_248699754(v0[2], v3, &qword_26931D5E8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_24868D470(v0[7], &qword_26931D5E8);
LABEL_8:
    sub_2486ABAF8();
    uint64_t v11 = sub_2486ABAE8();
    os_log_type_t v12 = sub_2486ABC98();
    if (os_log_type_enabled(v11, v12))
    {
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v13 = 0;
      _os_log_impl(&dword_248682000, v11, v12, "No mail record found with given unique id or record does not have conversation id set - cannot build email chain", v13, 2u);
      MEMORY[0x24C57BD90](v13, -1, -1);
    }
    uint64_t v15 = v0[5];
    uint64_t v14 = v0[6];
    uint64_t v16 = v0[4];

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v18 = MEMORY[0x263F8EE78];
    return v17(v18);
  }
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[8];
  sub_24869963C(v0[7], v4);
  if (!*(void *)(v4 + *(int *)(v5 + 68) + 8))
  {
    sub_24869514C(v0[12]);
    goto LABEL_8;
  }
  uint64_t v6 = v0[3];
  uint64_t v19 = *(void *)(v6 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_mailConversationId);
  uint64_t v20 = *(void *)(v6 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_mailConversationId + 8);
  swift_bridgeObjectRetain();
  sub_2486ABBB8();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v0[13] = v20;
  uint64_t v7 = *(void *)(v6 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_bundleId);
  uint64_t v8 = *(void *)(v6 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_bundleId + 8);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[14] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_2486A8670;
  return ATSpotlightDataRetriever.getRecentRecordsAsync(bundleId:nRecords:addendum:)(v7, v8, 100, v19, v20);
}

uint64_t sub_2486A8670(uint64_t a1)
{
  *(void *)(*(void *)v1 + 120) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_2486A8790, 0, 0);
}

void sub_2486A8790()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = MEMORY[0x263F8EE78];
  uint64_t v18 = MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    unint64_t v4 = 0;
    uint64_t v5 = v0[11];
    uint64_t v6 = v0[9];
    uint64_t v17 = v0[15];
    while (v4 < *(void *)(v1 + 16))
    {
      unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      uint64_t v8 = *(void *)(v6 + 72);
      sub_24869222C(v0[15] + v7 + v8 * v4, v0[11]);
      unint64_t v9 = *(void *)(v5 + 32);
      uint64_t v10 = *(void *)(v5 + 24) & 0xFFFFFFFFFFFFLL;
      if ((v9 & 0x2000000000000000) != 0) {
        uint64_t v10 = HIBYTE(v9) & 0xF;
      }
      uint64_t v11 = v0[11];
      if (v10)
      {
        sub_24869963C(v11, v0[10]);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24868B228(0, *(void *)(v2 + 16) + 1, 1);
          uint64_t v2 = v18;
        }
        unint64_t v13 = *(void *)(v2 + 16);
        unint64_t v12 = *(void *)(v2 + 24);
        if (v13 >= v12 >> 1)
        {
          sub_24868B228(v12 > 1, v13 + 1, 1);
          uint64_t v2 = v18;
        }
        uint64_t v14 = v0[10];
        *(void *)(v2 + 16) = v13 + 1;
        sub_24869963C(v14, v2 + v7 + v13 * v8);
        uint64_t v1 = v17;
      }
      else
      {
        sub_24869514C(v11);
      }
      if (v3 == ++v4) {
        goto LABEL_14;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_14:
    uint64_t v15 = v0[12];
    swift_bridgeObjectRelease();
    sub_24869514C(v15);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = (void (*)(uint64_t))v0[1];
    v16(v2);
  }
}

uint64_t sub_2486A895C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_2486A8980, 0, 0);
}

uint64_t sub_2486A8980()
{
  uint64_t v1 = v0[5];
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_mailUniqueRecordIdentifier);
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_mailUniqueRecordIdentifier + 8);
  swift_bridgeObjectRetain();
  sub_2486ABBB8();
  swift_bridgeObjectRetain();
  sub_2486ABBB8();
  swift_bridgeObjectRelease();
  v0[6] = v7;
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_bundleId);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightMailRetriever_bundleId + 8);
  unint64_t v4 = (void *)swift_task_alloc();
  v0[7] = v4;
  *unint64_t v4 = v0;
  v4[1] = sub_2486A8AB4;
  return ATSpotlightDataRetriever.getRecentRecordsAsync(bundleId:nRecords:addendum:)(v2, v3, 1, v6, v7);
}

uint64_t sub_2486A8AB4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 64) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_2486A8BD4, 0, 0);
}

uint64_t sub_2486A8BD4()
{
  uint64_t v1 = v0[8];
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = v0[2];
    uint64_t v3 = type metadata accessor for ATSpotlightDataRecord();
    uint64_t v4 = *(void *)(v3 - 8);
    sub_24869222C(v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)), v2);
    swift_bridgeObjectRelease();
    uint64_t v5 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = type metadata accessor for ATSpotlightDataRecord();
    uint64_t v4 = *(void *)(v3 - 8);
    uint64_t v5 = 1;
  }
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v4 + 56))(v0[2], v5, 1, v3);
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

void sub_2486A8D04(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_24869222C(a1, a2);
  id v4 = objc_allocWithZone(MEMORY[0x263F08AF0]);
  id v5 = sub_2486A92C0(0xD0000000000000BELL, 0x80000002486AE070, 0);
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 24);
    uint64_t v7 = *(void *)(a1 + 32);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D628);
    sub_2486AA64C();
    sub_2486AA6A8();
    uint64_t v8 = sub_2486ABCE8();
    uint64_t v10 = v9;
    uint64_t v11 = (void *)sub_2486ABB58();
    id v12 = objc_msgSend(v5, sel_firstMatchInString_options_range_, v11, 0, v8, v10);

    if (v12)
    {
      objc_msgSend(v12, sel_range);
      sub_2486ABBA8();
      uint64_t v13 = sub_2486ABBD8();
      uint64_t v14 = MEMORY[0x24C57B3B0](v13);
      uint64_t v16 = v15;

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)(a2 + 24) = v14;
      *(void *)(a2 + 32) = v16;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a2 + 24) = v6;
      *(void *)(a2 + 32) = v7;
    }
    uint64_t v17 = (uint64_t *)(a2 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 76));
    uint64_t v18 = v17[1];
    if (v18)
    {
      uint64_t v19 = *v17;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_2486ABCE8();
      uint64_t v22 = v21;
      uint64_t v23 = (void *)sub_2486ABB58();
      id v24 = objc_msgSend(v5, sel_firstMatchInString_options_range_, v23, 0, v20, v22);

      if (v24)
      {
        objc_msgSend(v24, sel_range);
        sub_2486ABBA8();
        uint64_t v25 = sub_2486ABBD8();
        uint64_t v26 = MEMORY[0x24C57B3B0](v25);
        uint64_t v28 = v27;

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        uint64_t v29 = (uint64_t *)(a2 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 76));
        *uint64_t v29 = v26;
        v29[1] = v28;
      }
      else
      {

        swift_bridgeObjectRelease();
        uint64_t v30 = (void *)(a2 + *(int *)(type metadata accessor for ATSpotlightDataRecord() + 76));
        *uint64_t v30 = v19;
        v30[1] = v18;
      }
    }
    else
    {
    }
  }
}

uint64_t sub_2486A9084()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t ATSpotlightMailRetriever.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_oneYearBack;
  uint64_t v2 = sub_2486AB8F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ATSpotlightMailRetriever.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15ArchetypeEngine24ATSpotlightDataRetriever_oneYearBack;
  uint64_t v2 = sub_2486AB8F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

id sub_2486A92C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  id v5 = (void *)sub_2486ABB58();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_2486AB858();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_2486A939C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2486A93AC(uint64_t result, uint64_t a2)
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
      goto LABEL_26;
    }
    int64_t v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
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
        if (!v11)
        {
          int64_t v12 = v3 + 4;
          if (v3 + 4 >= v30) {
            return 1;
          }
          unint64_t v11 = *(void *)(v29 + 8 * v12);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_25:
    unint64_t v6 = (v11 - 1) & v11;
    int64_t v31 = v12;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    uint64_t v14 = result;
    uint64_t v15 = (uint64_t *)(*(void *)(result + 48) + 16 * v9);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_2486ABFA8();
    swift_bridgeObjectRetain();
    sub_2486ABB98();
    uint64_t v18 = sub_2486ABFD8();
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
      goto LABEL_41;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    uint64_t v22 = (void *)(v21 + 16 * v20);
    BOOL v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_2486ABF08() & 1) == 0)
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
        if (v28 || (sub_2486ABF08() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    uint64_t result = v14;
    int64_t v3 = v31;
  }
  uint64_t v13 = v3 + 5;
  if (v3 + 5 >= v30) {
    return 1;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v13);
  if (v11)
  {
    int64_t v12 = v3 + 5;
    goto LABEL_25;
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
      goto LABEL_25;
    }
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_2486A9650(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_2486ABFA8();
  swift_bridgeObjectRetain();
  sub_2486ABB98();
  uint64_t v8 = sub_2486ABFD8();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    int64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2486ABF08() & 1) != 0)
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
      if (v19 || (sub_2486ABF08() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *int64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2486A9AE0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *int64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2486A9800()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D640);
  uint64_t v3 = sub_2486ABD88();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v30 = (void *)(v2 + 56);
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
                  *int64_t v30 = -1 << v29;
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
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_2486ABFA8();
      sub_2486ABB98();
      uint64_t result = sub_2486ABFD8();
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
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_2486A9AE0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2486A9800();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_2486A9C7C();
      goto LABEL_22;
    }
    sub_2486A9E30();
  }
  uint64_t v11 = *v4;
  sub_2486ABFA8();
  sub_2486ABB98();
  uint64_t result = sub_2486ABFD8();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_2486ABF08(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_2486ABF28();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_2486ABF08();
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
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
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

void *sub_2486A9C7C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D640);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2486ABD78();
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
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

uint64_t sub_2486A9E30()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26931D640);
  uint64_t v3 = sub_2486ABD88();
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
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_2486ABFA8();
    swift_bridgeObjectRetain();
    sub_2486ABB98();
    uint64_t result = sub_2486ABFD8();
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
    void *v13 = v20;
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

uint64_t sub_2486AA0E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v58 = a3;
  uint64_t v59 = a2;
  uint64_t v9 = (int *)type metadata accessor for ATSpotlightDataRecord();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v56 = (uint64_t)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  unint64_t v14 = (char *)&v50 - v13;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v65 = MEMORY[0x263F8EE78];
  uint64_t v61 = *(void *)(a1 + 16);
  if (v61)
  {
    uint64_t v50 = v5;
    uint64_t v16 = 0;
    unint64_t v17 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    uint64_t v62 = *(void *)(v12 + 72);
    uint64_t v60 = a1 + v17;
    unint64_t v54 = (uint64_t *)(a4 + 40);
    uint64_t v51 = (uint64_t *)(a5 + 40);
    unint64_t v52 = v17;
    uint64_t v55 = MEMORY[0x263F8EE78];
    uint64_t v53 = a5;
    uint64_t v57 = a4;
    uint64_t v18 = v58;
    do
    {
      sub_24869222C(v60 + v62 * v16, (uint64_t)v14);
      BOOL v19 = *(void **)&v14[v9[11]];
      if (!v19 || v19[2] != 1) {
        goto LABEL_35;
      }
      BOOL v20 = v19[4] == v59 && v19[5] == v18;
      if (!v20 && (sub_2486ABF08() & 1) == 0) {
        goto LABEL_35;
      }
      uint64_t v21 = *(void *)(a4 + 16);
      if (v21)
      {
        uint64_t v22 = *(void *)&v14[v9[12]];
        if (!v22) {
          goto LABEL_35;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v64 = sub_2486ABC78();
        unint64_t v23 = v54;
        do
        {
          uint64_t v24 = *(v23 - 1);
          uint64_t v25 = *v23;
          swift_bridgeObjectRetain();
          sub_2486A9650(&v63, v24, v25);
          swift_bridgeObjectRelease();
          v23 += 2;
          --v21;
        }
        while (v21);
        a4 = v57;
        swift_bridgeObjectRelease();
        uint64_t v26 = v64;
        uint64_t v27 = *(void *)(v22 + 16);
        uint64_t v28 = sub_2486ABC78();
        uint64_t v64 = v28;
        if (v27)
        {
          int64_t v29 = (uint64_t *)(v22 + 40);
          do
          {
            uint64_t v30 = *(v29 - 1);
            uint64_t v31 = *v29;
            swift_bridgeObjectRetain();
            sub_2486A9650(&v63, v30, v31);
            swift_bridgeObjectRelease();
            v29 += 2;
            --v27;
          }
          while (v27);
          swift_bridgeObjectRelease();
          uint64_t v32 = v64;
          a5 = v53;
          a4 = v57;
        }
        else
        {
          uint64_t v32 = v28;
          swift_bridgeObjectRelease();
        }
        char v33 = sub_2486A93AC(v26, v32);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v18 = v58;
        if ((v33 & 1) == 0) {
          goto LABEL_35;
        }
      }
      uint64_t v34 = *(void *)(a5 + 16);
      if (!v34) {
        goto LABEL_30;
      }
      uint64_t v35 = *(void *)&v14[v9[13]];
      if (!v35) {
        goto LABEL_35;
      }
      uint64_t v36 = *(void *)(v35 + 16);
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_2486ABC78();
      uint64_t v64 = v37;
      if (v36)
      {
        unint64_t v38 = (uint64_t *)(v35 + 40);
        do
        {
          uint64_t v39 = *(v38 - 1);
          uint64_t v40 = *v38;
          swift_bridgeObjectRetain();
          sub_2486A9650(&v63, v39, v40);
          swift_bridgeObjectRelease();
          v38 += 2;
          --v36;
        }
        while (v36);
        swift_bridgeObjectRelease();
        uint64_t v41 = v64;
        a5 = v53;
      }
      else
      {
        uint64_t v41 = v37;
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRetain();
      uint64_t v64 = sub_2486ABC78();
      unint64_t v42 = v51;
      do
      {
        uint64_t v43 = *(v42 - 1);
        uint64_t v44 = *v42;
        swift_bridgeObjectRetain();
        sub_2486A9650(&v63, v43, v44);
        swift_bridgeObjectRelease();
        v42 += 2;
        --v34;
      }
      while (v34);
      swift_bridgeObjectRelease();
      char v45 = sub_2486A93AC(v41, v64);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a4 = v57;
      uint64_t v18 = v58;
      if (v45)
      {
LABEL_30:
        sub_24869963C((uint64_t)v14, v56);
        uint64_t v46 = v55;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24868B228(0, *(void *)(v46 + 16) + 1, 1);
          uint64_t v18 = v58;
        }
        uint64_t v47 = v65;
        unint64_t v49 = *(void *)(v65 + 16);
        unint64_t v48 = *(void *)(v65 + 24);
        if (v49 >= v48 >> 1)
        {
          sub_24868B228(v48 > 1, v49 + 1, 1);
          uint64_t v18 = v58;
          uint64_t v47 = v65;
        }
        *(void *)(v47 + 16) = v49 + 1;
        uint64_t v55 = v47;
        sub_24869963C(v56, v47 + v52 + v49 * v62);
      }
      else
      {
LABEL_35:
        sub_24869514C((uint64_t)v14);
      }
      ++v16;
    }
    while (v16 != v61);
    return v65;
  }
  return result;
}

uint64_t sub_2486AA5A0()
{
  return type metadata accessor for ATSpotlightMailRetriever();
}

uint64_t type metadata accessor for ATSpotlightMailRetriever()
{
  uint64_t result = qword_26931D618;
  if (!qword_26931D618) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2486AA5F4()
{
  return swift_updateClassMetadata2();
}

unint64_t sub_2486AA64C()
{
  unint64_t result = qword_26931D630;
  if (!qword_26931D630)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26931D628);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931D630);
  }
  return result;
}

unint64_t sub_2486AA6A8()
{
  unint64_t result = qword_26931D638;
  if (!qword_26931D638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26931D638);
  }
  return result;
}

void ATAccessibility.systemAXApp.getter()
{
  uint64_t v1 = OBJC_IVAR____TtC15ArchetypeEngine15ATAccessibility__cachedSystemWideElement;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC15ArchetypeEngine15ATAccessibility__cachedSystemWideElement);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC15ArchetypeEngine15ATAccessibility__cachedSystemWideElement);
  }
  else
  {
    id v4 = objc_msgSend(self, sel_systemWideElement);
    if (!v4)
    {
      sub_24868DCF8();
      swift_allocError();
      *(void *)uint64_t v10 = 0;
      *(void *)(v10 + 8) = 0;
      goto LABEL_9;
    }
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v6 = v4;

    uint64_t v7 = *(void **)(v0 + v1);
    if (!v7)
    {
      __break(1u);
      return;
    }
    id v3 = v7;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  id v9 = objc_msgSend(v3, sel_systemApplication);

  if (v9) {
    return;
  }
  sub_24868DCF8();
  swift_allocError();
  *(_OWORD *)uint64_t v10 = xmmword_2486ACF80;
LABEL_9:
  *(unsigned char *)(v10 + 16) = 7;
  swift_willThrow();
}

void *ATAccessibility.currentAXApps.getter()
{
  ATAccessibility.systemAXApp.getter();
  if (!v1)
  {
    uint64_t v0 = v2;
    id v3 = objc_msgSend(v2, sel_currentApplications);

    if (!v3
      || (v4 = sub_2486ABBF8(), v3, uint64_t v0 = (void *)sub_2486AA8F8(v4), swift_bridgeObjectRelease(), !v0))
    {
      sub_24868DCF8();
      swift_allocError();
      *(_OWORD *)uint64_t v5 = xmmword_2486ACF90;
      *(unsigned char *)(v5 + 16) = 7;
      swift_willThrow();
    }
  }
  return v0;
}

uint64_t sub_2486AA8F8(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_2486ABE08();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_24868D3B0(i, (uint64_t)v5);
    sub_2486AB7C4();
    if (!swift_dynamicCast()) {
      break;
    }
    sub_2486ABDE8();
    sub_2486ABE18();
    sub_2486ABE28();
    sub_2486ABDF8();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

Swift::String __swiftcall ATAccessibility.onScreenText()()
{
  ATAccessibility.systemAXApp.getter();
  id v3 = v2;
  id v4 = objc_msgSend(v2, sel_currentApplications);

  if (!v4) {
    goto LABEL_2;
  }
  uint64_t v5 = sub_2486ABBF8();

  unint64_t v6 = sub_2486AA8F8(v5);
  swift_bridgeObjectRelease();
  uint64_t v1 = (void *)0xE000000000000000;
  if (!v6)
  {
    id v0 = 0;
    goto LABEL_108;
  }
  uint64_t v83 = v6 & 0xFFFFFFFFFFFFFF8;
  unint64_t v84 = v6;
  if (v6 >> 62)
  {
LABEL_103:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2486ABE68();
    swift_bridgeObjectRelease();
    unint64_t v8 = v84;
    if (v7) {
      goto LABEL_7;
    }
    goto LABEL_104;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  unint64_t v8 = v6;
  if (!v7)
  {
LABEL_104:
    swift_bridgeObjectRelease();
LABEL_2:
    id v0 = 0;
    uint64_t v1 = (void *)0xE000000000000000;
    goto LABEL_108;
  }
LABEL_7:
  unint64_t v9 = 0;
  unint64_t v82 = v8 + 32;
  unint64_t v86 = v8 & 0xC000000000000001;
  uint64_t v85 = v7;
  while (1)
  {
    if (v86)
    {
      id v10 = (id)MEMORY[0x24C57B5F0](v9, v84);
    }
    else
    {
      if (v9 >= *(void *)(v83 + 16)) {
        goto LABEL_102;
      }
      id v10 = *(id *)(v82 + 8 * v9);
    }
    uint64_t v11 = v10;
    BOOL v12 = __OFADD__(v9, 1);
    unint64_t v13 = v9 + 1;
    if (v12)
    {
      __break(1u);
LABEL_98:
      __break(1u);
LABEL_99:
      __break(1u);
LABEL_100:
      __break(1u);
LABEL_101:
      __break(1u);
LABEL_102:
      __break(1u);
      goto LABEL_103;
    }
    id v0 = objc_msgSend(v10, sel_label);
    if (!v0) {
      break;
    }
    unint64_t v14 = v0;
    sub_2486ABB68();

    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    id v0 = objc_msgSend(v11, sel_bundleId);
    if (!v0) {
      goto LABEL_107;
    }
    unint64_t v15 = v0;
    sub_2486ABB68();

    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    id v0 = objc_msgSend(v11, sel_processName);
    if (!v0) {
      goto LABEL_106;
    }
    uint64_t v16 = v0;
    sub_2486ABB68();

    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    id v17 = objc_msgSend(v11, sel_visibleElements);
    if (v17)
    {
      uint64_t v18 = v17;
      sub_2486AB7C4();
      unint64_t v19 = sub_2486ABBF8();

      if (!(v19 >> 62)) {
        goto LABEL_19;
      }
    }
    else
    {
      unint64_t v19 = MEMORY[0x263F8EE78];
      if (!(MEMORY[0x263F8EE78] >> 62))
      {
LABEL_19:
        uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
        goto LABEL_20;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_2486ABE68();
    swift_bridgeObjectRelease();
LABEL_20:
    unint64_t v87 = v13;
    if (v20)
    {
      if (v20 < 1) {
        goto LABEL_98;
      }
      uint64_t v21 = 0;
      uint64_t v22 = (void *)MEMORY[0x263F8EE78];
      do
      {
        if ((v19 & 0xC000000000000001) != 0) {
          id v23 = (id)MEMORY[0x24C57B5F0](v21, v19);
        }
        else {
          id v23 = *(id *)(v19 + 8 * v21 + 32);
        }
        uint64_t v24 = v23;
        id v25 = objc_msgSend(v23, sel_label, v82);
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = sub_2486ABB68();
          unint64_t v29 = v28;
        }
        else
        {
          uint64_t v27 = 0;
          unint64_t v29 = 0xE000000000000000;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v22 = sub_248688E8C(0, v22[2] + 1, 1, v22);
        }
        unint64_t v31 = v22[2];
        unint64_t v30 = v22[3];
        if (v31 >= v30 >> 1) {
          uint64_t v22 = sub_248688E8C((void *)(v30 > 1), v31 + 1, 1, v22);
        }
        ++v21;
        v22[2] = v31 + 1;
        uint64_t v32 = &v22[2 * v31];
        v32[4] = v27;
        v32[5] = v29;
      }
      while (v20 != v21);
    }
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26931D308);
    sub_24869BB70();
    sub_2486ABB18();
    swift_bridgeObjectRelease();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    id v33 = objc_msgSend(v11, sel_explorerElements);
    if (v33)
    {
      uint64_t v34 = v33;
      sub_2486AB7C4();
      unint64_t v35 = sub_2486ABBF8();

      if (v35 >> 62) {
        goto LABEL_55;
      }
    }
    else
    {
      unint64_t v35 = MEMORY[0x263F8EE78];
      if (MEMORY[0x263F8EE78] >> 62)
      {
LABEL_55:
        swift_bridgeObjectRetain();
        uint64_t v36 = sub_2486ABE68();
        swift_bridgeObjectRelease();
        if (!v36) {
          goto LABEL_56;
        }
        goto LABEL_40;
      }
    }
    uint64_t v36 = *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v36) {
      goto LABEL_56;
    }
LABEL_40:
    if (v36 < 1) {
      goto LABEL_99;
    }
    uint64_t v37 = 0;
    unint64_t v38 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v35 & 0xC000000000000001) != 0) {
        id v39 = (id)MEMORY[0x24C57B5F0](v37, v35);
      }
      else {
        id v39 = *(id *)(v35 + 8 * v37 + 32);
      }
      uint64_t v40 = v39;
      id v41 = objc_msgSend(v39, sel_label, v82);
      if (v41)
      {
        unint64_t v42 = v41;
        uint64_t v43 = sub_2486ABB68();
        unint64_t v45 = v44;
      }
      else
      {
        uint64_t v43 = 0;
        unint64_t v45 = 0xE000000000000000;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v38 = sub_248688E8C(0, v38[2] + 1, 1, v38);
      }
      unint64_t v47 = v38[2];
      unint64_t v46 = v38[3];
      if (v47 >= v46 >> 1) {
        unint64_t v38 = sub_248688E8C((void *)(v46 > 1), v47 + 1, 1, v38);
      }
      ++v37;
      v38[2] = v47 + 1;
      unint64_t v48 = &v38[2 * v47];
      v48[4] = v43;
      v48[5] = v45;
    }
    while (v36 != v37);
LABEL_56:
    swift_bridgeObjectRelease();
    sub_2486ABB18();
    swift_bridgeObjectRelease();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    id v49 = objc_msgSend(v11, sel_nativeFocusableElements);
    if (v49)
    {
      uint64_t v50 = v49;
      sub_2486AB7C4();
      unint64_t v51 = sub_2486ABBF8();

      if (v51 >> 62) {
        goto LABEL_74;
      }
    }
    else
    {
      unint64_t v51 = MEMORY[0x263F8EE78];
      if (MEMORY[0x263F8EE78] >> 62)
      {
LABEL_74:
        swift_bridgeObjectRetain();
        uint64_t v52 = sub_2486ABE68();
        swift_bridgeObjectRelease();
        if (!v52) {
          goto LABEL_75;
        }
        goto LABEL_59;
      }
    }
    uint64_t v52 = *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v52) {
      goto LABEL_75;
    }
LABEL_59:
    if (v52 < 1) {
      goto LABEL_100;
    }
    uint64_t v53 = 0;
    unint64_t v54 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v51 & 0xC000000000000001) != 0) {
        id v55 = (id)MEMORY[0x24C57B5F0](v53, v51);
      }
      else {
        id v55 = *(id *)(v51 + 8 * v53 + 32);
      }
      uint64_t v56 = v55;
      id v57 = objc_msgSend(v55, sel_label, v82);
      if (v57)
      {
        uint64_t v58 = v57;
        uint64_t v59 = sub_2486ABB68();
        unint64_t v61 = v60;
      }
      else
      {
        uint64_t v59 = 0;
        unint64_t v61 = 0xE000000000000000;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v54 = sub_248688E8C(0, v54[2] + 1, 1, v54);
      }
      unint64_t v63 = v54[2];
      unint64_t v62 = v54[3];
      if (v63 >= v62 >> 1) {
        unint64_t v54 = sub_248688E8C((void *)(v62 > 1), v63 + 1, 1, v54);
      }
      ++v53;
      v54[2] = v63 + 1;
      uint64_t v64 = &v54[2 * v63];
      v64[4] = v59;
      v64[5] = v61;
    }
    while (v52 != v53);
LABEL_75:
    swift_bridgeObjectRelease();
    sub_2486ABB18();
    swift_bridgeObjectRelease();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    id v65 = objc_msgSend(v11, sel_elementsWithSemanticContext);
    if (v65)
    {
      unint64_t v66 = v65;
      sub_2486AB7C4();
      unint64_t v67 = sub_2486ABBF8();

      if (!(v67 >> 62)) {
        goto LABEL_77;
      }
    }
    else
    {
      unint64_t v67 = MEMORY[0x263F8EE78];
      if (!(MEMORY[0x263F8EE78] >> 62))
      {
LABEL_77:
        uint64_t v68 = *(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v68) {
          goto LABEL_8;
        }
        goto LABEL_78;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v68 = sub_2486ABE68();
    swift_bridgeObjectRelease();
    if (!v68) {
      goto LABEL_8;
    }
LABEL_78:
    if (v68 < 1) {
      goto LABEL_101;
    }
    uint64_t v69 = 0;
    id v70 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v67 & 0xC000000000000001) != 0) {
        id v71 = (id)MEMORY[0x24C57B5F0](v69, v67);
      }
      else {
        id v71 = *(id *)(v67 + 8 * v69 + 32);
      }
      uint64_t v72 = v71;
      id v73 = objc_msgSend(v71, sel_label, v82);
      if (v73)
      {
        uint64_t v74 = v73;
        uint64_t v75 = sub_2486ABB68();
        unint64_t v77 = v76;
      }
      else
      {
        uint64_t v75 = 0;
        unint64_t v77 = 0xE000000000000000;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v70 = sub_248688E8C(0, v70[2] + 1, 1, v70);
      }
      unint64_t v79 = v70[2];
      unint64_t v78 = v70[3];
      if (v79 >= v78 >> 1) {
        id v70 = sub_248688E8C((void *)(v78 > 1), v79 + 1, 1, v70);
      }
      ++v69;
      v70[2] = v79 + 1;
      id v80 = &v70[2 * v79];
      v80[4] = v75;
      v80[5] = v77;
    }
    while (v68 != v69);
LABEL_8:
    swift_bridgeObjectRelease();
    sub_2486ABB18();
    swift_bridgeObjectRelease();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();
    sub_2486ABBB8();
    swift_bridgeObjectRelease();

    unint64_t v9 = v87;
    if (v87 == v85)
    {
      swift_bridgeObjectRelease();
      id v0 = 0;
      uint64_t v1 = (void *)0xE000000000000000;
      goto LABEL_108;
    }
  }
  __break(1u);
LABEL_106:
  __break(1u);
LABEL_107:
  __break(1u);
LABEL_108:
  result._object = v1;
  result._uint64_t countAndFlagsBits = (uint64_t)v0;
  return result;
}

id ATAccessibility.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ATAccessibility.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC15ArchetypeEngine15ATAccessibility__cachedSystemWideElement] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ATAccessibility();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ATAccessibility.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ATAccessibility();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2486AB7C4()
{
  unint64_t result = qword_26931D5D0;
  if (!qword_26931D5D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26931D5D0);
  }
  return result;
}

uint64_t type metadata accessor for ATAccessibility()
{
  return self;
}

uint64_t sub_2486AB828()
{
  return MEMORY[0x270EEE918]();
}

uint64_t sub_2486AB838()
{
  return MEMORY[0x270EEE928]();
}

uint64_t sub_2486AB848()
{
  return MEMORY[0x270EEE948]();
}

uint64_t sub_2486AB858()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_2486AB868()
{
  return MEMORY[0x270EF07D8]();
}

uint64_t sub_2486AB878()
{
  return MEMORY[0x270EF08A0]();
}

uint64_t sub_2486AB888()
{
  return MEMORY[0x270EF0990]();
}

uint64_t sub_2486AB898()
{
  return MEMORY[0x270EF09A0]();
}

uint64_t sub_2486AB8A8()
{
  return MEMORY[0x270EF09B0]();
}

uint64_t sub_2486AB8B8()
{
  return MEMORY[0x270EF09E8]();
}

uint64_t sub_2486AB8C8()
{
  return MEMORY[0x270EF0BB0]();
}

uint64_t sub_2486AB8D8()
{
  return MEMORY[0x270EF0C08]();
}

uint64_t sub_2486AB8E8()
{
  return MEMORY[0x270EF0C28]();
}

uint64_t sub_2486AB8F8()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_2486AB908()
{
  return MEMORY[0x270F41BF8]();
}

uint64_t sub_2486AB918()
{
  return MEMORY[0x270F41C00]();
}

uint64_t sub_2486AB928()
{
  return MEMORY[0x270F41C08]();
}

uint64_t sub_2486AB938()
{
  return MEMORY[0x270F41D18]();
}

uint64_t sub_2486AB948()
{
  return MEMORY[0x270F41D30]();
}

uint64_t sub_2486AB958()
{
  return MEMORY[0x270F41D80]();
}

uint64_t sub_2486AB968()
{
  return MEMORY[0x270F41D88]();
}

uint64_t sub_2486AB978()
{
  return MEMORY[0x270F41D90]();
}

uint64_t sub_2486AB988()
{
  return MEMORY[0x270F41D98]();
}

uint64_t sub_2486AB998()
{
  return MEMORY[0x270F41DA0]();
}

uint64_t sub_2486AB9A8()
{
  return MEMORY[0x270F41DB0]();
}

uint64_t sub_2486AB9B8()
{
  return MEMORY[0x270F41DC0]();
}

uint64_t sub_2486AB9C8()
{
  return MEMORY[0x270F41DD8]();
}

uint64_t sub_2486AB9D8()
{
  return MEMORY[0x270F41DE0]();
}

uint64_t sub_2486AB9E8()
{
  return MEMORY[0x270F41DF0]();
}

uint64_t sub_2486AB9F8()
{
  return MEMORY[0x270F41DF8]();
}

uint64_t sub_2486ABA08()
{
  return MEMORY[0x270F41E18]();
}

uint64_t sub_2486ABA18()
{
  return MEMORY[0x270F41E20]();
}

uint64_t sub_2486ABA28()
{
  return MEMORY[0x270F41E28]();
}

uint64_t sub_2486ABA38()
{
  return MEMORY[0x270F41E60]();
}

uint64_t sub_2486ABA48()
{
  return MEMORY[0x270F41E68]();
}

uint64_t sub_2486ABA58()
{
  return MEMORY[0x270F41E70]();
}

uint64_t sub_2486ABA68()
{
  return MEMORY[0x270F41E78]();
}

uint64_t sub_2486ABA78()
{
  return MEMORY[0x270F41E80]();
}

uint64_t sub_2486ABA88()
{
  return MEMORY[0x270F41E88]();
}

uint64_t sub_2486ABA98()
{
  return MEMORY[0x270F41E90]();
}

uint64_t sub_2486ABAA8()
{
  return MEMORY[0x270F41E98]();
}

uint64_t sub_2486ABAB8()
{
  return MEMORY[0x270F41EA0]();
}

uint64_t sub_2486ABAC8()
{
  return MEMORY[0x270F41EA8]();
}

uint64_t sub_2486ABAD8()
{
  return MEMORY[0x270F41EB0]();
}

uint64_t sub_2486ABAE8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2486ABAF8()
{
  return MEMORY[0x270FA2E18]();
}

uint64_t sub_2486ABB08()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2486ABB18()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2486ABB28()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_2486ABB38()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_2486ABB48()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2486ABB58()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_2486ABB68()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_2486ABB78()
{
  return MEMORY[0x270EF1A48]();
}

uint64_t sub_2486ABB88()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2486ABB98()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2486ABBA8()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_2486ABBB8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2486ABBC8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2486ABBD8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2486ABBE8()
{
  return MEMORY[0x270EF1B90]();
}

uint64_t sub_2486ABBF8()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_2486ABC08()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2486ABC18()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2486ABC28()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2486ABC38()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2486ABC48()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2486ABC58()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2486ABC68()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_2486ABC78()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2486ABC88()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2486ABC98()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2486ABCA8()
{
  return MEMORY[0x270FA0D68]();
}

uint64_t sub_2486ABCB8()
{
  return MEMORY[0x270FA0F18]();
}

uint64_t sub_2486ABCC8()
{
  return MEMORY[0x270FA0F20]();
}

uint64_t sub_2486ABCD8()
{
  return MEMORY[0x270EF2190]();
}

uint64_t sub_2486ABCE8()
{
  return MEMORY[0x270EF2208]();
}

uint64_t sub_2486ABCF8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2486ABD08()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2486ABD18()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2486ABD28()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2486ABD38()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_2486ABD48()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2486ABD58()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2486ABD68()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2486ABD78()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2486ABD88()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2486ABD98()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2486ABDA8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2486ABDB8()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_2486ABDC8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2486ABDD8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2486ABDE8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2486ABDF8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2486ABE08()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2486ABE18()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2486ABE28()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2486ABE38()
{
  return MEMORY[0x270F9ED20]();
}

uint64_t sub_2486ABE48()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2486ABE58()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2486ABE68()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2486ABE78()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_2486ABE88()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2486ABE98()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2486ABEA8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2486ABEB8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2486ABEC8()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_2486ABED8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2486ABEE8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2486ABF08()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2486ABF18()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_2486ABF28()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2486ABF38()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2486ABF48()
{
  return MEMORY[0x270EF2688]();
}

uint64_t sub_2486ABF58()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2486ABF68()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2486ABF78()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2486ABF88()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2486ABF98()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_2486ABFA8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2486ABFB8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2486ABFC8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2486ABFD8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2486ABFE8()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_2486ABFF8()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_2486AC008()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
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

void bzero(void *a1, size_t a2)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94C0](value);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x270FA04B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}