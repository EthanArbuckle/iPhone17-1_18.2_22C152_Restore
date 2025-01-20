uint64_t sub_1000045B4()
{
  uint64_t v0;

  v0 = sub_10000A750();
  sub_100009798(v0, qword_100010180);
  sub_100008750(v0, (uint64_t)qword_100010180);
  return sub_10000A740();
}

void InferenceProviderAdapter.init()()
{
}

uint64_t InferenceProviderAdapter.init(_:)@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100004698(a1, a2);
}

uint64_t sub_100004698(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t InferenceProviderAdapter.prewarmHint(_:)(uint64_t a1)
{
  v2[21] = a1;
  v2[22] = v1;
  uint64_t v3 = sub_10000A5D0();
  v2[23] = v3;
  v2[24] = *(void *)(v3 - 8);
  v2[25] = swift_task_alloc();
  uint64_t v4 = sub_10000A700();
  v2[26] = v4;
  v2[27] = *(void *)(v4 - 8);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  return _swift_task_switch(sub_1000047F4, 0, 0);
}

uint64_t sub_1000047F4()
{
  uint64_t v65 = v0;
  sub_100008E24(*(void *)(v0 + 176), v0 + 56);
  sub_10000870C(&qword_1000101A0);
  sub_10000870C(&qword_1000101A8);
  if (swift_dynamicCast())
  {
    sub_100004698((long long *)(v0 + 96), v0 + 16);
    if (qword_100010178 != -1) {
      swift_once();
    }
    uint64_t v1 = *(void *)(v0 + 168);
    uint64_t v3 = *(void *)(v0 + 240);
    uint64_t v2 = *(void *)(v0 + 248);
    uint64_t v4 = *(void *)(v0 + 208);
    uint64_t v5 = *(void *)(v0 + 216);
    uint64_t v6 = sub_10000A750();
    sub_100008750(v6, (uint64_t)qword_100010180);
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    v7(v2, v1, v4);
    v7(v3, v1, v4);
    v8 = sub_10000A730();
    os_log_type_t v9 = sub_10000A820();
    BOOL v10 = os_log_type_enabled(v8, v9);
    uint64_t v12 = *(void *)(v0 + 240);
    uint64_t v11 = *(void *)(v0 + 248);
    uint64_t v14 = *(void *)(v0 + 208);
    uint64_t v13 = *(void *)(v0 + 216);
    if (v10)
    {
      log = v8;
      uint64_t v16 = *(void *)(v0 + 192);
      uint64_t v15 = *(void *)(v0 + 200);
      uint64_t v57 = *(void *)(v0 + 184);
      uint64_t v17 = swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 136315394;
      os_log_type_t type = v9;
      sub_10000A6E0();
      uint64_t v18 = sub_10000A5C0();
      uint64_t v55 = v12;
      unint64_t v20 = v19;
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v57);
      *(void *)(v0 + 152) = sub_100008788(v18, v20, &v64);
      sub_10000A840();
      swift_bridgeObjectRelease();
      v21 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
      v21(v11, v14);
      *(_WORD *)(v17 + 12) = 2080;
      uint64_t v22 = sub_10000A6F0();
      *(void *)(v0 + 160) = sub_100008788(v22, v23, &v64);
      sub_10000A840();
      swift_bridgeObjectRelease();
      v21(v55, v14);
      _os_log_impl((void *)&_mh_execute_header, log, type, "prewarmHint. sessionUUID=%s modelBundleIdentifier=%s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v47 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
      v47(*(void *)(v0 + 248), *(void *)(v0 + 208));
      v47(v12, v14);
    }
    uint64_t v48 = *(void *)(v0 + 40);
    uint64_t v49 = *(void *)(v0 + 48);
    sub_100008DE0((void *)(v0 + 16), v48);
    v50 = (void *)swift_task_alloc();
    *(void *)(v0 + 256) = v50;
    void *v50 = v0;
    v50[1] = sub_100004EB4;
    uint64_t v51 = *(void *)(v0 + 168);
    return dispatch thunk of InferenceProviderWithPrewarm.prewarmHint(_:)(v51, v48, v49);
  }
  else
  {
    *(void *)(v0 + 128) = 0;
    *(_OWORD *)(v0 + 96) = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
    sub_1000094CC(v0 + 96, &qword_1000101B0);
    if (qword_100010178 != -1) {
      swift_once();
    }
    uint64_t v24 = *(void *)(v0 + 224);
    uint64_t v25 = *(void *)(v0 + 232);
    uint64_t v26 = *(void *)(v0 + 208);
    uint64_t v27 = *(void *)(v0 + 216);
    uint64_t v28 = *(void *)(v0 + 168);
    uint64_t v29 = sub_10000A750();
    sub_100008750(v29, (uint64_t)qword_100010180);
    v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
    v30(v25, v28, v26);
    v30(v24, v28, v26);
    v31 = sub_10000A730();
    os_log_type_t v32 = sub_10000A820();
    BOOL v33 = os_log_type_enabled(v31, v32);
    uint64_t v34 = *(void *)(v0 + 224);
    uint64_t v35 = *(void *)(v0 + 232);
    uint64_t v37 = *(void *)(v0 + 208);
    uint64_t v36 = *(void *)(v0 + 216);
    if (v33)
    {
      v63 = v31;
      *(void *)typea = *(void *)(v0 + 224);
      uint64_t v39 = *(void *)(v0 + 192);
      uint64_t v38 = *(void *)(v0 + 200);
      uint64_t v56 = *(void *)(v0 + 184);
      uint64_t v40 = swift_slowAlloc();
      os_log_t loga = (os_log_t)swift_slowAlloc();
      *(_DWORD *)uint64_t v40 = 136315394;
      uint64_t v64 = (uint64_t)loga;
      os_log_type_t v60 = v32;
      sub_10000A6E0();
      uint64_t v41 = sub_10000A5C0();
      unint64_t v43 = v42;
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v56);
      *(void *)(v0 + 136) = sub_100008788(v41, v43, &v64);
      sub_10000A840();
      swift_bridgeObjectRelease();
      v44 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
      v44(v35, v37);
      *(_WORD *)(v40 + 12) = 2080;
      uint64_t v45 = sub_10000A6F0();
      *(void *)(v0 + 144) = sub_100008788(v45, v46, &v64);
      sub_10000A840();
      swift_bridgeObjectRelease();
      v44(*(void *)typea, v37);
      _os_log_impl((void *)&_mh_execute_header, v63, v60, "prewarmHint skipped, not implemented. sessionUUID=%s modelBundleIdentifier=%s", (uint8_t *)v40, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v52 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
      v52(*(void *)(v0 + 232), *(void *)(v0 + 208));
      v52(v34, v37);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v53 = *(uint64_t (**)(void))(v0 + 8);
    return v53();
  }
}

uint64_t sub_100004EB4()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100004FB0, 0, 0);
}

uint64_t sub_100004FB0()
{
  _s39PrivateMLClientInferenceProviderService32PrivateMLClientInferenceProviderVwxx_0(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t _s39PrivateMLClientInferenceProviderService0cD7AdapterV15transitionAsset_2toy20ModelManagerServices0cdH10DescriptorV_AF9LoadStateOtYaAF0C5ErrorOYKF(uint64_t a1)
{
  v1[3] = a1;
  uint64_t v2 = sub_10000A6D0();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return _swift_task_switch(sub_100005108, 0, 0);
}

uint64_t sub_100005108()
{
  uint64_t v18 = v0;
  if (qword_100010178 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[3];
  uint64_t v3 = v0[5];
  uint64_t v2 = v0[6];
  uint64_t v4 = v0[4];
  uint64_t v5 = sub_10000A750();
  sub_100008750(v5, (uint64_t)qword_100010180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
  uint64_t v6 = sub_10000A730();
  os_log_type_t v7 = sub_10000A820();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v10 = v0[5];
  uint64_t v9 = v0[6];
  uint64_t v11 = v0[4];
  if (v8)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    sub_1000093BC(&qword_1000101C0, 255, (void (*)(uint64_t))&type metadata accessor for InferenceProviderAssetDescriptor);
    uint64_t v13 = sub_10000A8C0();
    v0[2] = sub_100008788(v13, v14, &v17);
    sub_10000A840();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "transitionAsset not implemented. asset=%s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(void, void))(v10 + 8))(v0[6], v0[4]);
  }

  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t _s39PrivateMLClientInferenceProviderService0cD7AdapterV15transitionAsset14withIdentifier2to4fromySS_20ModelManagerServices9LoadStateOAJtYaAH0C5ErrorOYKF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[31] = v5;
  v6[32] = a5;
  v6[29] = a3;
  v6[30] = a4;
  v6[27] = a1;
  v6[28] = a2;
  uint64_t v7 = sub_10000A610();
  v6[33] = v7;
  v6[34] = *(void *)(v7 - 8);
  v6[35] = swift_task_alloc();
  v6[36] = swift_task_alloc();
  uint64_t v8 = sub_10000A710();
  v6[37] = v8;
  v6[38] = *(void *)(v8 - 8);
  v6[39] = swift_task_alloc();
  v6[40] = swift_task_alloc();
  v6[41] = swift_task_alloc();
  v6[42] = swift_task_alloc();
  return _swift_task_switch(sub_1000054D4, 0, 0);
}

uint64_t sub_1000054D4()
{
  uint64_t v35 = v0;
  if (qword_100010178 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[41];
  uint64_t v2 = v0[42];
  uint64_t v3 = v0[37];
  uint64_t v4 = v0[38];
  uint64_t v6 = v0[29];
  uint64_t v5 = v0[30];
  uint64_t v7 = sub_10000A750();
  sub_100008750(v7, (uint64_t)qword_100010180);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v8(v2, v6, v3);
  v8(v1, v5, v3);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_10000A730();
  os_log_type_t v10 = sub_10000A820();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v13 = v0[41];
  uint64_t v12 = v0[42];
  uint64_t v15 = v0[37];
  uint64_t v14 = v0[38];
  unint64_t v16 = v0[28];
  if (v11)
  {
    log = v9;
    uint64_t v17 = v0[27];
    uint64_t v32 = v0[41];
    uint64_t v18 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315650;
    swift_bridgeObjectRetain();
    v0[24] = sub_100008788(v17, v16, &v34);
    sub_10000A840();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2080;
    sub_1000093BC(&qword_1000101F0, 255, (void (*)(uint64_t))&type metadata accessor for LoadState);
    uint64_t v19 = sub_10000A8C0();
    v0[25] = sub_100008788(v19, v20, &v34);
    sub_10000A840();
    swift_bridgeObjectRelease();
    v21 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v21(v12, v15);
    *(_WORD *)(v18 + 22) = 2080;
    uint64_t v22 = sub_10000A8C0();
    v0[26] = sub_100008788(v22, v23, &v34);
    sub_10000A840();
    swift_bridgeObjectRelease();
    v21(v32, v15);
    _os_log_impl((void *)&_mh_execute_header, log, v10, "transitionAsset with state asset=%s to=%s from=%s", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    v21 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v21(v12, v15);
    v21(v13, v15);
  }
  v0[43] = v21;
  uint64_t v24 = (void *)v0[31];
  uint64_t v25 = v24[3];
  uint64_t v26 = v24[4];
  sub_100008DE0(v24, v25);
  uint64_t v27 = (void *)swift_task_alloc();
  v0[44] = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_1000058B8;
  uint64_t v28 = v0[28];
  uint64_t v29 = v0[29];
  uint64_t v30 = v0[27];
  return dispatch thunk of InferenceProvider.transitionAsset(withIdentifier:to:)(v30, v28, v29, v25, v26);
}

uint64_t sub_1000058B8()
{
  *(void *)(*(void *)v1 + 360) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000060D0;
  }
  else {
    uint64_t v2 = sub_1000059CC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000059CC()
{
  unsigned int v24 = enum case for LoadState.unloaded(_:);
  unint64_t v23 = *(void (**)(void))(v0[38] + 104);
  v23(v0[40]);
  sub_1000093BC(&qword_1000101E8, 255, (void (*)(uint64_t))&type metadata accessor for LoadState);
  sub_10000A7D0();
  sub_10000A7D0();
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[43];
  uint64_t v2 = v0[40];
  uint64_t v3 = v0[37];
  if (v0[19] == v0[13] && v0[20] == v0[14])
  {
    swift_bridgeObjectRelease_n();
    v1(v2, v3);
LABEL_5:
    uint64_t v5 = (void *)v0[31];
    uint64_t v6 = v5[3];
    uint64_t v7 = v5[4];
    sub_100008DE0(v5, v6);
    uint64_t v8 = (void *)swift_task_alloc();
    v0[46] = v8;
    void *v8 = v0;
    v8[1] = sub_100005DC0;
    uint64_t v10 = v0[27];
    uint64_t v9 = v0[28];
    return dispatch thunk of InferenceProvider.loadOut(inferenceAssetIdentifier:)(v10, v9, v6, v7);
  }
  char v4 = sub_10000A8E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1(v2, v3);
  if (v4) {
    goto LABEL_5;
  }
  ((void (*)(void, void, void))v23)(v0[39], v24, v0[37]);
  sub_10000A7D0();
  sub_10000A7D0();
  BOOL v11 = (void (*)(uint64_t, uint64_t))v0[43];
  uint64_t v12 = v0[39];
  uint64_t v13 = v0[37];
  if (v0[17] == v0[15] && v0[18] == v0[16])
  {
    swift_bridgeObjectRelease_n();
    v11(v12, v13);
LABEL_12:
    uint64_t v15 = (void *)v0[31];
    uint64_t v16 = v15[3];
    uint64_t v17 = v15[4];
    sub_100008DE0(v15, v16);
    uint64_t v18 = (void *)swift_task_alloc();
    v0[48] = v18;
    *uint64_t v18 = v0;
    v18[1] = sub_100005F48;
    uint64_t v20 = v0[27];
    uint64_t v19 = v0[28];
    return dispatch thunk of InferenceProvider.loadIn(inferenceAssetIdentifier:)(v20, v19, v16, v17);
  }
  char v14 = sub_10000A8E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11(v12, v13);
  if (v14) {
    goto LABEL_12;
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

uint64_t sub_100005DC0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 376) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_10000643C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_100005F48()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 392) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_1000067A8, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1000060D0()
{
  uint64_t v1 = v0[45];
  v0[21] = v1;
  swift_errorRetain();
  sub_10000870C(&qword_1000101D0);
  if (swift_dynamicCast())
  {
    uint64_t v3 = v0[35];
    uint64_t v2 = v0[36];
    uint64_t v4 = v0[33];
    uint64_t v5 = v0[34];
    uint64_t v6 = v0[32];
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v3, v2, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v6, v3, v4);
    sub_1000093BC(&qword_1000101E0, 255, (void (*)(uint64_t))&type metadata accessor for InferenceError);
    swift_willThrowTypedImpl();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    swift_errorRelease();
  }
  else
  {
    uint64_t v8 = v0[34];
    uint64_t v7 = v0[35];
    uint64_t v16 = v0[33];
    uint64_t v17 = v0[32];
    swift_errorRelease();
    uint64_t v9 = (void *)sub_10000A5B0();
    v0[23] = v1;
    swift_errorRetain();
    sub_10000A7A0();
    id v10 = [v9 domain];
    sub_10000A790();

    [v9 code];
    sub_10000870C(&qword_1000101D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10000ACB0;
    *(void *)(inited + 32) = sub_10000A790();
    *(void *)(inited + 40) = v12;
    swift_getErrorValue();
    *(void *)(inited + 48) = sub_10000A8F0();
    *(void *)(inited + 56) = v13;
    sub_100006B14(inited);
    sub_10000A600();
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v7, enum case for InferenceError.inferenceFailed(_:), v16);
    sub_1000093BC(&qword_1000101E0, 255, (void (*)(uint64_t))&type metadata accessor for InferenceError);
    swift_willThrowTypedImpl();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v17, v7, v16);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_10000643C()
{
  uint64_t v1 = v0[47];
  v0[21] = v1;
  swift_errorRetain();
  sub_10000870C(&qword_1000101D0);
  if (swift_dynamicCast())
  {
    uint64_t v3 = v0[35];
    uint64_t v2 = v0[36];
    uint64_t v4 = v0[33];
    uint64_t v5 = v0[34];
    uint64_t v6 = v0[32];
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v3, v2, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v6, v3, v4);
    sub_1000093BC(&qword_1000101E0, 255, (void (*)(uint64_t))&type metadata accessor for InferenceError);
    swift_willThrowTypedImpl();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    swift_errorRelease();
  }
  else
  {
    uint64_t v8 = v0[34];
    uint64_t v7 = v0[35];
    uint64_t v16 = v0[33];
    uint64_t v17 = v0[32];
    swift_errorRelease();
    uint64_t v9 = (void *)sub_10000A5B0();
    v0[23] = v1;
    swift_errorRetain();
    sub_10000A7A0();
    id v10 = [v9 domain];
    sub_10000A790();

    [v9 code];
    sub_10000870C(&qword_1000101D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10000ACB0;
    *(void *)(inited + 32) = sub_10000A790();
    *(void *)(inited + 40) = v12;
    swift_getErrorValue();
    *(void *)(inited + 48) = sub_10000A8F0();
    *(void *)(inited + 56) = v13;
    sub_100006B14(inited);
    sub_10000A600();
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v7, enum case for InferenceError.inferenceFailed(_:), v16);
    sub_1000093BC(&qword_1000101E0, 255, (void (*)(uint64_t))&type metadata accessor for InferenceError);
    swift_willThrowTypedImpl();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v17, v7, v16);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_1000067A8()
{
  uint64_t v1 = v0[49];
  v0[21] = v1;
  swift_errorRetain();
  sub_10000870C(&qword_1000101D0);
  if (swift_dynamicCast())
  {
    uint64_t v3 = v0[35];
    uint64_t v2 = v0[36];
    uint64_t v4 = v0[33];
    uint64_t v5 = v0[34];
    uint64_t v6 = v0[32];
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v3, v2, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v6, v3, v4);
    sub_1000093BC(&qword_1000101E0, 255, (void (*)(uint64_t))&type metadata accessor for InferenceError);
    swift_willThrowTypedImpl();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    swift_errorRelease();
  }
  else
  {
    uint64_t v8 = v0[34];
    uint64_t v7 = v0[35];
    uint64_t v16 = v0[33];
    uint64_t v17 = v0[32];
    swift_errorRelease();
    uint64_t v9 = (void *)sub_10000A5B0();
    v0[23] = v1;
    swift_errorRetain();
    sub_10000A7A0();
    id v10 = [v9 domain];
    sub_10000A790();

    [v9 code];
    sub_10000870C(&qword_1000101D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10000ACB0;
    *(void *)(inited + 32) = sub_10000A790();
    *(void *)(inited + 40) = v12;
    swift_getErrorValue();
    *(void *)(inited + 48) = sub_10000A8F0();
    *(void *)(inited + 56) = v13;
    sub_100006B14(inited);
    sub_10000A600();
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v7, enum case for InferenceError.inferenceFailed(_:), v16);
    sub_1000093BC(&qword_1000101E0, 255, (void (*)(uint64_t))&type metadata accessor for InferenceError);
    swift_willThrowTypedImpl();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v17, v7, v16);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

unint64_t sub_100006B14(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000870C(&qword_100010340);
  uint64_t v2 = (void *)sub_10000A8A0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_10000958C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v11 = (uint64_t *)(v2[6] + 16 * result);
    *BOOL v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

uint64_t _s39PrivateMLClientInferenceProviderService0cD7AdapterV14requestOneShot10clientData13configuration20ModelManagerServices06ClientK0VAI_AG0cD20RequestConfigurationVtYaAG0C5ErrorOYKF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[19] = v4;
  v5[20] = a4;
  v5[17] = a2;
  v5[18] = a3;
  v5[16] = a1;
  uint64_t v6 = sub_10000A610();
  v5[21] = v6;
  v5[22] = *(void *)(v6 - 8);
  v5[23] = swift_task_alloc();
  v5[24] = swift_task_alloc();
  return _swift_task_switch(sub_100006D10, 0, 0);
}

uint64_t sub_100006D10()
{
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_100008DE0(v1, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[25] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100006DD0;
  uint64_t v5 = v0[17];
  uint64_t v6 = v0[18];
  uint64_t v7 = v0[16];
  return dispatch thunk of InferenceProvider.requestOneShot(clientData:configuration:)(v7, v5, v6, v2, v3);
}

uint64_t sub_100006DD0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 208) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_100006F18, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_100006F18()
{
  uint64_t v1 = v0;
  v0[13] = v0[26];
  swift_errorRetain();
  sub_10000870C(&qword_1000101D0);
  if (swift_dynamicCast())
  {
    uint64_t v2 = v0[23];
    uint64_t v3 = v0[24];
    uint64_t v4 = v0[21];
    uint64_t v5 = v0[22];
    uint64_t v6 = v1[20];
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v2, v3, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v6, v2, v4);
    sub_1000093BC(&qword_1000101E0, 255, (void (*)(uint64_t))&type metadata accessor for InferenceError);
    swift_willThrowTypedImpl();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
    swift_errorRelease();
  }
  else
  {
    uint64_t v7 = v0[26];
    uint64_t v9 = v0[22];
    uint64_t v8 = v0[23];
    uint64_t v17 = v0[21];
    uint64_t v18 = v0[20];
    swift_errorRelease();
    char v10 = (void *)sub_10000A5B0();
    v0[14] = v7;
    swift_errorRetain();
    sub_10000A7A0();
    id v11 = [v10 domain];
    sub_10000A790();

    [v10 code];
    sub_10000870C(&qword_1000101D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10000ACB0;
    *(void *)(inited + 32) = sub_10000A790();
    *(void *)(inited + 40) = v13;
    swift_getErrorValue();
    *(void *)(inited + 48) = sub_10000A8F0();
    *(void *)(inited + 56) = v14;
    sub_100006B14(inited);
    sub_10000A600();
    (*(void (**)(uint64_t, void, uint64_t))(v9 + 104))(v8, enum case for InferenceError.inferenceFailed(_:), v17);
    sub_1000093BC(&qword_1000101E0, 255, (void (*)(uint64_t))&type metadata accessor for InferenceError);
    swift_willThrowTypedImpl();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v18, v8, v17);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v1[1];
  return v15();
}

uint64_t InferenceProviderAdapter.requestStream(clientData:configuration:)@<X0>(uint64_t *a1@<X8>)
{
  sub_100008DE0(v1, v1[3]);
  sub_10000A620();
  sub_100008E24((uint64_t)v15, (uint64_t)v14);
  uint64_t v3 = type metadata accessor for InferenceProviderAdapter.StreamAdapter();
  uint64_t v4 = swift_allocObject();
  swift_defaultActor_initialize();
  uint64_t v5 = sub_100008DE0(v14, v14[3]);
  __chkstk_darwin(v5, v5);
  (*(void (**)(char *))(v7 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  sub_100009528((uint64_t *)&v11);
  sub_10000A800();
  sub_100004698(&v11, v4 + 112);
  _s39PrivateMLClientInferenceProviderService32PrivateMLClientInferenceProviderVwxx_0((uint64_t)v14);
  a1[3] = v3;
  a1[4] = sub_1000093BC(qword_100010200, v8, (void (*)(uint64_t))type metadata accessor for InferenceProviderAdapter.StreamAdapter);
  *a1 = v4;
  return _s39PrivateMLClientInferenceProviderService32PrivateMLClientInferenceProviderVwxx_0((uint64_t)v15);
}

uint64_t sub_100007454(uint64_t a1)
{
  v2[21] = a1;
  v2[22] = v1;
  sub_10000870C(&qword_100010328);
  v2[23] = swift_task_alloc();
  return _swift_task_switch(sub_1000074E8, v1, 0);
}

uint64_t sub_1000074E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2[22];
  uint64_t v4 = sub_1000093BC(&qword_100010330, a2, (void (*)(uint64_t))type metadata accessor for InferenceProviderAdapter.StreamAdapter);
  swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 136);
  v2[24] = v5;
  uint64_t v6 = *(void *)(v3 + 144);
  v2[25] = v6;
  sub_100009404(v3 + 112, v5);
  v2[26] = swift_getAssociatedTypeWitness();
  uint64_t v7 = sub_10000A830();
  v2[27] = v7;
  v2[28] = *(void *)(v7 - 8);
  uint64_t v8 = swift_task_alloc();
  v2[29] = v8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2[30] = AssociatedTypeWitness;
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  v2[31] = v10;
  v2[32] = *(void *)(v10 + 64);
  uint64_t v11 = swift_task_alloc();
  v2[33] = v11;
  uint64_t v12 = (void *)swift_task_alloc();
  v2[34] = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_100007730;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v8, v3, v4, v11, v5, v6);
}

uint64_t sub_100007730()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 176);
    uint64_t v4 = sub_100007B48;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 176);
    swift_endAccess();
    swift_task_dealloc();
    uint64_t v4 = sub_100007860;
    uint64_t v3 = v5;
  }
  return _swift_task_switch(v4, v3, 0);
}

uint64_t sub_100007860()
{
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 224) + 8))(v1, *(void *)(v0 + 216));
    swift_task_dealloc();
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
  }
  else
  {
    *(void *)(v0 + 40) = v2;
    uint64_t v4 = sub_100009528((uint64_t *)(v0 + 16));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 32))(v4, v1, v2);
    swift_task_dealloc();
  }
  sub_100009454(v0 + 16, v0 + 80);
  if (*(void *)(v0 + 104))
  {
    sub_1000094BC((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 48));
    sub_1000094BC((_OWORD *)(v0 + 48), (_OWORD *)(v0 + 112));
    uint64_t v5 = sub_10000A5F0();
    int v6 = swift_dynamicCast();
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v8 = *(void *)(v0 + 184);
    uint64_t v9 = *(void *)(v0 + 168);
    if (v6)
    {
      uint64_t v10 = *(void *)(v5 - 8);
      v7(*(void *)(v0 + 184), 0, 1, v5);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v9, v8, v5);
      uint64_t v11 = v9;
      uint64_t v12 = 0;
    }
    else
    {
      v7(*(void *)(v0 + 184), 1, 1, v5);
      sub_1000094CC(v8, &qword_100010328);
      uint64_t v11 = v9;
      uint64_t v12 = 1;
    }
    v7(v11, v12, 1, v5);
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 168);
    sub_1000094CC(v0 + 80, &qword_100010338);
    uint64_t v14 = sub_10000A5F0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  }
  sub_1000094CC(v0 + 16, &qword_100010338);
  swift_task_dealloc();
  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t sub_100007B48()
{
  uint64_t v1 = v0[33];
  uint64_t v2 = v0[30];
  uint64_t v3 = v0[31];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32);
  v5(v4, v1, v2);
  swift_getAssociatedConformanceWitness();
  if (sub_10000A8D0())
  {
    (*(void (**)(uint64_t, void))(v0[31] + 8))(v4, v0[30]);
  }
  else
  {
    uint64_t v6 = v0[30];
    swift_allocError();
    v5(v7, v4, v6);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100007CB4()
{
  _s39PrivateMLClientInferenceProviderService32PrivateMLClientInferenceProviderVwxx_0(v0 + 112);
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t sub_100007CEC()
{
  return v0;
}

void sub_100007CF8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100007D04(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100007DA0;
  return sub_100007454(a1);
}

uint64_t sub_100007DA0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100007E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[4] = v4;
  v5[5] = a4;
  v5[3] = a1;
  uint64_t v7 = sub_10000A610();
  v5[6] = v7;
  v5[7] = *(void *)(v7 - 8);
  v5[8] = swift_task_alloc();
  v5[9] = swift_task_alloc();
  if (a2)
  {
    swift_getObjectType();
    uint64_t v8 = sub_10000A7E0();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  v5[10] = v8;
  v5[11] = v10;
  return _swift_task_switch(sub_100007FA4, v8, v10);
}

uint64_t sub_100007FA4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100008040;
  uint64_t v2 = *(void *)(v0 + 24);
  return sub_100007454(v2);
}

uint64_t sub_100008040()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 88);
  uint64_t v4 = *(void *)(v2 + 80);
  if (v0) {
    uint64_t v5 = sub_1000081E8;
  }
  else {
    uint64_t v5 = sub_10000817C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10000817C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000081E8()
{
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[6];
  uint64_t v4 = v0[7];
  uint64_t v5 = v0[5];
  v0[2] = v0[13];
  sub_10000870C(&qword_1000101D0);
  swift_dynamicCast();
  sub_1000093BC(&qword_1000101E0, 255, (void (*)(uint64_t))&type metadata accessor for InferenceError);
  swift_willThrowTypedImpl();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
  v6(v1, v2, v3);
  v6(v5, v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_10000831C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100007DA0;
  return InferenceProviderAdapter.prewarmHint(_:)(a1);
}

uint64_t sub_1000083B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a3;
  uint64_t v5 = sub_10000A610();
  v3[3] = v5;
  v3[4] = *(void *)(v5 - 8);
  v3[5] = swift_task_alloc();
  uint64_t v6 = (void *)swift_task_alloc();
  v3[6] = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_1000097FC;
  return _s39PrivateMLClientInferenceProviderService0cD7AdapterV15transitionAsset_2toy20ModelManagerServices0cdH10DescriptorV_AF9LoadStateOtYaAF0C5ErrorOYKF(a1);
}

uint64_t sub_1000084A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v8 = sub_10000A610();
  v4[3] = v8;
  v4[4] = *(void *)(v8 - 8);
  uint64_t v9 = swift_task_alloc();
  v4[5] = v9;
  uint64_t v10 = (void *)swift_task_alloc();
  v4[6] = v10;
  *uint64_t v10 = v4;
  v10[1] = sub_1000085C8;
  return _s39PrivateMLClientInferenceProviderService0cD7AdapterV14requestOneShot10clientData13configuration20ModelManagerServices06ClientK0VAI_AG0cD20RequestConfigurationVtYaAG0C5ErrorOYKF(a1, a2, a3, v9);
}

uint64_t sub_1000085C8()
{
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = (void *)*v1;
  swift_task_dealloc();
  if (v0) {
    (*(void (**)(void, void, void))(v2[4] + 32))(v2[2], v2[5], v2[3]);
  }
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v3[1];
  return v4();
}

uint64_t sub_1000086FC(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10000870C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100008750(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100008788(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000885C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100009738((uint64_t)v12, *a3);
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
      sub_100009738((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  _s39PrivateMLClientInferenceProviderService32PrivateMLClientInferenceProviderVwxx_0((uint64_t)v12);
  return v7;
}

uint64_t sub_10000885C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000A850();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100008A18(a5, a6);
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
  uint64_t v8 = sub_10000A870();
  if (!v8)
  {
    sub_10000A880();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000A8B0();
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

uint64_t sub_100008A18(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100008AB0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100008C90(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100008C90(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100008AB0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100008C28(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000A860();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000A880();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000A7C0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000A8B0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000A880();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100008C28(uint64_t a1, uint64_t a2)
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
  sub_10000870C(&qword_100010348);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100008C90(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000870C(&qword_100010348);
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
  uint64_t result = sub_10000A8B0();
  __break(1u);
  return result;
}

void *sub_100008DE0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100008E24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for InferenceProviderAdapter.StreamAdapter()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for InferenceProviderAdapter(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for InferenceProviderAdapter(uint64_t a1)
{
  return _s39PrivateMLClientInferenceProviderService32PrivateMLClientInferenceProviderVwxx_0(a1);
}

uint64_t initializeWithCopy for InferenceProviderAdapter(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for InferenceProviderAdapter(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *sub_100008F78(uint64_t *result, uint64_t *a2)
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
        uint64_t result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        size_t v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *uint64_t result = *a2;
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

__n128 initializeWithTake for InferenceProviderAdapter(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for InferenceProviderAdapter(uint64_t a1, uint64_t a2)
{
  _s39PrivateMLClientInferenceProviderService32PrivateMLClientInferenceProviderVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for InferenceProviderAdapter(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for InferenceProviderAdapter(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for InferenceProviderAdapter()
{
  return &type metadata for InferenceProviderAdapter;
}

uint64_t sub_100009298()
{
  return sub_1000093BC(&qword_1000101E0, 255, (void (*)(uint64_t))&type metadata accessor for InferenceError);
}

uint64_t sub_1000092E4(uint64_t a1, uint64_t a2)
{
  return sub_1000093BC(&qword_100010310, a2, (void (*)(uint64_t))type metadata accessor for InferenceProviderAdapter.StreamAdapter);
}

uint64_t sub_10000932C(uint64_t a1, uint64_t a2)
{
  return sub_1000093BC(&qword_100010318, a2, (void (*)(uint64_t))type metadata accessor for InferenceProviderAdapter.StreamAdapter);
}

uint64_t sub_100009374(uint64_t a1, uint64_t a2)
{
  return sub_1000093BC(&qword_100010320, a2, (void (*)(uint64_t))type metadata accessor for InferenceProviderAdapter.StreamAdapter);
}

uint64_t sub_1000093BC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_100009404(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_100009454(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000870C(&qword_100010338);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1000094BC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000094CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000870C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_100009528(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_10000958C(uint64_t a1, uint64_t a2)
{
  sub_10000A900();
  sub_10000A7B0();
  Swift::Int v4 = sub_10000A910();

  return sub_100009604(a1, a2, v4);
}

unint64_t sub_100009604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000A8E0() & 1) == 0)
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
      while (!v14 && (sub_10000A8E0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t _s39PrivateMLClientInferenceProviderService32PrivateMLClientInferenceProviderVwxx_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100009738(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100009798(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t PrivateMLClientInferenceProvider.init()@<X0>(void *a1@<X8>)
{
  uint64_t v2 = sub_10000A750();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = __chkstk_darwin(v2, v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v8);
  uint64_t v10 = (char *)&v22 - v9;
  sub_10000A720();
  BOOL v11 = sub_10000A730();
  os_log_type_t v12 = sub_10000A810();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Initializing PrivateMLClientInferenceProvider", v13, 2u);
    swift_slowDealloc();
  }

  BOOL v14 = *(void (**)(char *, uint64_t))(v3 + 8);
  v14(v10, v2);
  sub_10000A720();
  uint64_t v15 = sub_10000A730();
  os_log_type_t v16 = sub_10000A810();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Using NewPrivateInferenceProvider", v17, 2u);
    swift_slowDealloc();
  }

  v14(v7, v2);
  uint64_t v18 = sub_10000A770();
  swift_allocObject();
  uint64_t v19 = sub_10000A760();
  a1[3] = &type metadata for InferenceProviderAdapter;
  a1[4] = sub_100009A50();
  uint64_t v20 = (void *)swift_allocObject();
  *a1 = v20;
  v20[5] = v18;
  unint64_t result = sub_100009ADC();
  v20[6] = result;
  v20[2] = v19;
  return result;
}

unint64_t sub_100009A50()
{
  unint64_t result = qword_100010350;
  if (!qword_100010350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010350);
  }
  return result;
}

uint64_t sub_100009AA4()
{
  _s39PrivateMLClientInferenceProviderService32PrivateMLClientInferenceProviderVwxx_0(v0 + 16);

  return _swift_deallocObject(v0, 56, 7);
}

unint64_t sub_100009ADC()
{
  unint64_t result = qword_100010358;
  if (!qword_100010358)
  {
    sub_10000A770();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010358);
  }
  return result;
}

uint64_t PrivateMLClientInferenceProvider.prewarmHint(_:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return _swift_task_switch(sub_100009B54, 0, 0);
}

uint64_t sub_100009B54()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_100008DE0(v1, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[4] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100009C10;
  uint64_t v5 = v0[2];
  return dispatch thunk of InferenceProviding.prewarmHint(_:)(v5, v2, v3);
}

uint64_t sub_100009C10()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t _s39PrivateMLClientInferenceProviderService0abcD0V15transitionAsset_2toy20ModelManagerServices0cdG10DescriptorV_AF9LoadStateOtYaAF0C5ErrorOYKF(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = v3;
  v4[5] = a3;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = sub_10000A610();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return _swift_task_switch(sub_100009DC8, 0, 0);
}

uint64_t sub_100009DC8()
{
  uint64_t v1 = (void *)v0[4];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_100008DE0(v1, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[9] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100009E88;
  uint64_t v5 = v0[8];
  uint64_t v7 = v0[2];
  uint64_t v6 = v0[3];
  return _s20ModelManagerServices18InferenceProvidingP15transitionAsset_2toyAA0d8ProviderG10DescriptorV_AA9LoadStateOtYaAA0D5ErrorOYKFTj(v7, v6, v5, v2, v3);
}

uint64_t sub_100009E88()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_100009FC0, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_100009FC0()
{
  (*(void (**)(void, void, void))(v0[7] + 32))(v0[5], v0[8], v0[6]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t _s39PrivateMLClientInferenceProviderService0abcD0V14requestOneShot10clientData13configuration20ModelManagerServices06ClientJ0VAI_AG0cD20RequestConfigurationVtYaAG0C5ErrorOYKF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = v4;
  v5[6] = a4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  uint64_t v6 = sub_10000A610();
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  return _swift_task_switch(sub_10000A108, 0, 0);
}

uint64_t sub_10000A108()
{
  uint64_t v1 = (void *)v0[5];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_100008DE0(v1, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[10] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_10000A1CC;
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[3];
  uint64_t v7 = v0[4];
  uint64_t v8 = v0[2];
  return _s20ModelManagerServices18InferenceProvidingP14requestOneShot10clientData13configurationAA06ClientJ0VAH_AA0D28ProviderRequestConfigurationVtYaAA0D5ErrorOYKFTj(v8, v6, v7, v5, v2, v3);
}

uint64_t sub_10000A1CC()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_10000A304, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_10000A304()
{
  (*(void (**)(void, void, void))(v0[8] + 32))(v0[6], v0[9], v0[7]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t PrivateMLClientInferenceProvider.requestStream(clientData:configuration:)()
{
  sub_100008DE0(v0, v0[3]);
  return sub_10000A680();
}

ValueMetadata *type metadata accessor for PrivateMLClientInferenceProvider()
{
  return &type metadata for PrivateMLClientInferenceProvider;
}

uint64_t sub_10000A400()
{
  return sub_10000A6B0();
}

uint64_t sub_10000A434()
{
  uint64_t v0 = sub_10000A6C0();

  return _swift_deallocClassInstance(v0, 16, 7);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for PrivateMLClientInferenceProviderService()
{
  uint64_t result = qword_100010398;
  if (!qword_100010398) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_10000A510()
{
  unint64_t result = qword_100010390;
  if (!qword_100010390)
  {
    type metadata accessor for PrivateMLClientInferenceProviderService();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010390);
  }
  return result;
}

uint64_t sub_10000A568()
{
  return swift_initClassMetadata2();
}

uint64_t sub_10000A5A8()
{
  return type metadata accessor for PrivateMLClientInferenceProviderService();
}

uint64_t sub_10000A5B0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10000A5C0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_10000A5D0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10000A5E0()
{
  return static AppExtension.main()();
}

uint64_t sub_10000A5F0()
{
  return type metadata accessor for ClientData();
}

uint64_t sub_10000A600()
{
  return InferenceError.Context.init(additionalDescription:domain:code:userInfo:fallbackAllowed:)();
}

uint64_t sub_10000A610()
{
  return type metadata accessor for InferenceError();
}

uint64_t sub_10000A620()
{
  return dispatch thunk of InferenceProvider.requestStream(clientData:configuration:)();
}

uint64_t sub_10000A680()
{
  return dispatch thunk of InferenceProviding.requestStream(clientData:configuration:)();
}

uint64_t sub_10000A6B0()
{
  return InferenceProviderExtension.init()();
}

uint64_t sub_10000A6C0()
{
  return InferenceProviderExtension.deinit();
}

uint64_t sub_10000A6D0()
{
  return type metadata accessor for InferenceProviderAssetDescriptor();
}

uint64_t sub_10000A6E0()
{
  return InferenceProviderPrewarmInformation.sessionUUID.getter();
}

uint64_t sub_10000A6F0()
{
  return InferenceProviderPrewarmInformation.modelBundleIdentifier.getter();
}

uint64_t sub_10000A700()
{
  return type metadata accessor for InferenceProviderPrewarmInformation();
}

uint64_t sub_10000A710()
{
  return type metadata accessor for LoadState();
}

uint64_t sub_10000A720()
{
  return static Logger.viewCycle.getter();
}

uint64_t sub_10000A730()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000A740()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000A750()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10000A760()
{
  return NewInferenceProvider.init()();
}

uint64_t sub_10000A770()
{
  return type metadata accessor for NewInferenceProvider();
}

uint64_t sub_10000A790()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A7A0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10000A7B0()
{
  return String.hash(into:)();
}

Swift::Int sub_10000A7C0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000A7D0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_10000A7E0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000A800()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

uint64_t sub_10000A810()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10000A820()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10000A830()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10000A840()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000A850()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000A860()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000A870()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000A880()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000A890()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000A8A0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000A8B0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000A8C0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10000A8D0()
{
  return _getErrorEmbeddedNSError<A>(_:)();
}

uint64_t sub_10000A8E0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000A8F0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10000A900()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10000A910()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
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

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}