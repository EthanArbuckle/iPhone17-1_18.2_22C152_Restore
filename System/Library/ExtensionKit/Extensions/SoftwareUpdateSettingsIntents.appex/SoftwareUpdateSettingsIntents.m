uint64_t sub_100003874()
{
  uint64_t v0;

  v0 = sub_10001C560();
  sub_100006AB0(v0, qword_1000282F8);
  sub_100005FAC(v0, (uint64_t)qword_1000282F8);
  return sub_10001C550();
}

void sub_1000038F0()
{
  type metadata accessor for SUSettingsIntentsSUInterop();
  uint64_t v0 = swift_allocObject();
  sub_10000392C();
  qword_100028EB0 = v0;
}

void sub_10000392C()
{
  v1 = v0;
  uint64_t v37 = *v0;
  uint64_t v2 = sub_10001C560();
  uint64_t v40 = *(void *)(v2 - 8);
  uint64_t v41 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  v38 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v39 = (char *)&v36 - v5;
  uint64_t v6 = sub_10001C6A0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10001C690();
  __chkstk_darwin(v10);
  uint64_t v11 = sub_10001C580();
  __chkstk_darwin(v11 - 8);
  sub_100006BC4(0, &qword_100028570);
  sub_10001C570();
  uint64_t v43 = (uint64_t)&_swiftEmptyArrayStorage;
  sub_100006C00();
  sub_100006000(&qword_100028580);
  sub_100006C58();
  sub_10001C6F0();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v6);
  v12 = (void *)sub_10001C6B0();
  id v13 = [objc_allocWithZone((Class)SUSettingsSUPreferencesManager) initWithDispatchQueue:v12];

  if (v13)
  {
    v1[3] = 0;
    v1[4] = 0;
    v1[2] = v13;
    id v14 = [objc_allocWithZone((Class)SUManagerClient) initWithDelegate:0 queue:0 clientType:0];
    uint64_t v15 = v41;
    if (v14)
    {
      v16 = (void *)v1[3];
      v1[3] = v14;
      id v17 = v14;

      id v18 = [objc_allocWithZone((Class)SUSettingsStatefulUIManager) initWithManagerClient:v17];
      v19 = (void *)v1[4];
      v1[4] = v18;

      if (v1[4])
      {
      }
      else
      {
        if (qword_1000282F0 != -1) {
          swift_once();
        }
        uint64_t v28 = sub_100005FAC(v15, (uint64_t)qword_1000282F8);
        uint64_t v29 = v40;
        v30 = v38;
        (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v38, v28, v15);
        v31 = sub_10001C540();
        os_log_type_t v32 = sub_10001C670();
        if (os_log_type_enabled(v31, v32))
        {
          uint64_t v33 = swift_slowAlloc();
          v39 = (char *)swift_slowAlloc();
          v42 = v39;
          *(_DWORD *)uint64_t v33 = 136315650;
          uint64_t v43 = v37;
          swift_getMetatypeMetadata();
          uint64_t v34 = sub_10001C5F0();
          uint64_t v43 = sub_100006288(v34, v35, (uint64_t *)&v42);
          sub_10001C6C0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v33 + 12) = 2080;
          uint64_t v43 = sub_100006288(0x292874696E69, 0xE600000000000000, (uint64_t *)&v42);
          sub_10001C6C0();
          *(_WORD *)(v33 + 22) = 2048;
          uint64_t v43 = 30;
          sub_10001C6C0();
          _os_log_impl((void *)&_mh_execute_header, v31, v32, "🐞 %s | %s | line:%ld => Unable to create SUSettingsStatefulUIManager", (uint8_t *)v33, 0x20u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(char *, uint64_t))(v29 + 8))(v38, v15);
        }
        else
        {

          (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v15);
        }
      }
    }
    else
    {
      if (qword_1000282F0 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_100005FAC(v15, (uint64_t)qword_1000282F8);
      v21 = v39;
      uint64_t v22 = v40;
      (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v39, v20, v15);
      v23 = sub_10001C540();
      os_log_type_t v24 = sub_10001C670();
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = swift_slowAlloc();
        v42 = (char *)swift_slowAlloc();
        *(_DWORD *)uint64_t v25 = 136315650;
        uint64_t v43 = v37;
        swift_getMetatypeMetadata();
        uint64_t v26 = sub_10001C5F0();
        uint64_t v43 = sub_100006288(v26, v27, (uint64_t *)&v42);
        sub_10001C6C0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v25 + 12) = 2080;
        uint64_t v43 = sub_100006288(0x292874696E69, 0xE600000000000000, (uint64_t *)&v42);
        sub_10001C6C0();
        *(_WORD *)(v25 + 22) = 2048;
        uint64_t v43 = 33;
        sub_10001C6C0();
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "🐞 %s | %s | line:%ld => Unable to create SUManagerClient instance", (uint8_t *)v25, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v22 + 8))(v39, v15);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v22 + 8))(v21, v15);
      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000040A4()
{
  v1[29] = v0;
  v1[30] = *v0;
  uint64_t v2 = sub_10001C560();
  v1[31] = v2;
  v1[32] = *(void *)(v2 - 8);
  v1[33] = swift_task_alloc();
  return _swift_task_switch(sub_10000418C, 0, 0);
}

uint64_t sub_10000418C()
{
  v31 = v0;
  if (qword_1000282F0 != -1) {
    swift_once();
  }
  v0[34] = sub_100005FAC(v0[31], (uint64_t)qword_1000282F8);
  v1 = sub_10001C540();
  os_log_type_t v2 = sub_10001C670();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[30];
    uint64_t v4 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315650;
    v0[15] = v3;
    swift_getMetatypeMetadata();
    uint64_t v5 = sub_10001C5F0();
    v0[26] = sub_100006288(v5, v6, &v30);
    sub_10001C6C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2080;
    v0[27] = sub_100006288(0xD000000000000014, 0x800000010001F130, &v30);
    sub_10001C6C0();
    *(_WORD *)(v4 + 22) = 2048;
    v0[28] = 43;
    sub_10001C6C0();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "🐞 %s | %s | line:%ld => Starting to refreshBetaUpdates", (uint8_t *)v4, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v7 = *(void **)(v0[29] + 32);
  v0[35] = v7;
  if (v7)
  {
    v0[2] = v0;
    v0[7] = v0 + 16;
    v0[3] = sub_100004870;
    uint64_t v8 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_100005230;
    v0[13] = &unk_100025178;
    v0[14] = v8;
    [v7 refreshBetaUpdates:v0 + 10];
    return _swift_continuation_await(v0 + 2);
  }
  else
  {
    v9 = sub_10001C540();
    os_log_type_t v10 = sub_10001C670();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = v0[30];
      uint64_t v12 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315650;
      v0[17] = v11;
      swift_getMetatypeMetadata();
      uint64_t v13 = sub_10001C5F0();
      v0[23] = sub_100006288(v13, v14, &v30);
      sub_10001C6C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2080;
      v0[24] = sub_100006288(0xD000000000000014, 0x800000010001F130, &v30);
      sub_10001C6C0();
      *(_WORD *)(v12 + 22) = 2048;
      v0[25] = 45;
      sub_10001C6C0();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "🐞 %s | %s | line:%ld => Finished to refreshBetaUpdates", (uint8_t *)v12, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(void, void, void))(v0[32] + 16))(v0[33], v0[34], v0[31]);
    uint64_t v15 = sub_10001C540();
    os_log_type_t v16 = sub_10001C670();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = v0[30];
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315906;
      uint64_t v30 = v19;
      v0[18] = v17;
      swift_getMetatypeMetadata();
      uint64_t v20 = sub_10001C5F0();
      v0[19] = sub_100006288(v20, v21, &v30);
      sub_10001C6C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2080;
      v0[20] = sub_100006288(0xD000000000000014, 0x800000010001F130, &v30);
      sub_10001C6C0();
      *(_WORD *)(v18 + 22) = 2048;
      v0[21] = 47;
      sub_10001C6C0();
      *(_WORD *)(v18 + 32) = 2080;
      uint64_t v22 = v0[32];
      uint64_t v23 = v0[33];
      uint64_t v24 = v0[31];
      v0[22] = sub_100006288(7104878, 0xE300000000000000, &v30);
      sub_10001C6C0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "🐞 %s | %s | line:%ld => returning %s", (uint8_t *)v18, 0x2Au);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v24);
    }
    else
    {
      uint64_t v26 = v0[32];
      uint64_t v25 = v0[33];
      uint64_t v27 = v0[31];

      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
    }
    swift_task_dealloc();
    uint64_t v28 = (uint64_t (*)(void))v0[1];
    return v28(0);
  }
}

uint64_t sub_100004870()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 288) = v1;
  if (v1) {
    os_log_type_t v2 = sub_100004E00;
  }
  else {
    os_log_type_t v2 = sub_100004980;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100004980()
{
  uint64_t v29 = v0;
  uint64_t v1 = *(void **)(v0 + 128);

  os_log_type_t v2 = sub_10001C540();
  os_log_type_t v3 = sub_10001C670();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(v0 + 240);
    uint64_t v5 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315650;
    *(void *)(v0 + 136) = v4;
    swift_getMetatypeMetadata();
    uint64_t v6 = sub_10001C5F0();
    *(void *)(v0 + 184) = sub_100006288(v6, v7, &v28);
    sub_10001C6C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2080;
    *(void *)(v0 + 192) = sub_100006288(0xD000000000000014, 0x800000010001F130, &v28);
    sub_10001C6C0();
    *(_WORD *)(v5 + 22) = 2048;
    *(void *)(v0 + 200) = 45;
    sub_10001C6C0();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "🐞 %s | %s | line:%ld => Finished to refreshBetaUpdates", (uint8_t *)v5, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(void, void, void))(*(void *)(v0 + 256) + 16))(*(void *)(v0 + 264), *(void *)(v0 + 272), *(void *)(v0 + 248));
  id v8 = v1;
  v9 = sub_10001C540();
  os_log_type_t v10 = sub_10001C670();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v27 = v10;
    uint64_t v11 = *(void *)(v0 + 240);
    uint64_t v12 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315906;
    *(void *)(v0 + 144) = v11;
    swift_getMetatypeMetadata();
    uint64_t v13 = sub_10001C5F0();
    *(void *)(v0 + 152) = sub_100006288(v13, v14, &v28);
    sub_10001C6C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    *(void *)(v0 + 160) = sub_100006288(0xD000000000000014, 0x800000010001F130, &v28);
    sub_10001C6C0();
    *(_WORD *)(v12 + 22) = 2048;
    *(void *)(v0 + 168) = 47;
    sub_10001C6C0();
    *(_WORD *)(v12 + 32) = 2080;
    if (v8)
    {
      id v15 = [v8 description];
      uint64_t v16 = sub_10001C5C0();
      unint64_t v18 = v17;
    }
    else
    {
      unint64_t v18 = 0xE300000000000000;
      uint64_t v16 = 7104878;
    }
    uint64_t v22 = *(void *)(v0 + 256);
    uint64_t v26 = *(void *)(v0 + 264);
    uint64_t v23 = *(void *)(v0 + 248);
    *(void *)(v0 + 176) = sub_100006288(v16, v18, &v28);
    sub_10001C6C0();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v9, v27, "🐞 %s | %s | line:%ld => returning %s", (uint8_t *)v12, 0x2Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v26, v23);
  }
  else
  {
    uint64_t v20 = *(void *)(v0 + 256);
    uint64_t v19 = *(void *)(v0 + 264);
    uint64_t v21 = *(void *)(v0 + 248);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  swift_task_dealloc();
  uint64_t v24 = *(uint64_t (**)(id))(v0 + 8);
  return v24(v8);
}

uint64_t sub_100004E00()
{
  uint64_t v23 = v0;
  uint64_t v1 = (void *)v0[35];
  swift_willThrow();
  swift_errorRelease();

  os_log_type_t v2 = sub_10001C540();
  os_log_type_t v3 = sub_10001C670();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = v0[30];
    uint64_t v5 = swift_slowAlloc();
    v22[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315650;
    v0[17] = v4;
    swift_getMetatypeMetadata();
    uint64_t v6 = sub_10001C5F0();
    v0[23] = sub_100006288(v6, v7, v22);
    sub_10001C6C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2080;
    v0[24] = sub_100006288(0xD000000000000014, 0x800000010001F130, v22);
    sub_10001C6C0();
    *(_WORD *)(v5 + 22) = 2048;
    v0[25] = 45;
    sub_10001C6C0();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "🐞 %s | %s | line:%ld => Finished to refreshBetaUpdates", (uint8_t *)v5, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(void, void, void))(v0[32] + 16))(v0[33], v0[34], v0[31]);
  id v8 = sub_10001C540();
  os_log_type_t v9 = sub_10001C670();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = v0[30];
    uint64_t v11 = swift_slowAlloc();
    v22[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315906;
    v0[18] = v10;
    swift_getMetatypeMetadata();
    uint64_t v12 = sub_10001C5F0();
    v0[19] = sub_100006288(v12, v13, v22);
    sub_10001C6C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    v0[20] = sub_100006288(0xD000000000000014, 0x800000010001F130, v22);
    sub_10001C6C0();
    *(_WORD *)(v11 + 22) = 2048;
    v0[21] = 47;
    sub_10001C6C0();
    *(_WORD *)(v11 + 32) = 2080;
    uint64_t v15 = v0[32];
    uint64_t v14 = v0[33];
    uint64_t v16 = v0[31];
    v0[22] = sub_100006288(7104878, 0xE300000000000000, v22);
    sub_10001C6C0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "🐞 %s | %s | line:%ld => returning %s", (uint8_t *)v11, 0x2Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }
  else
  {
    uint64_t v18 = v0[32];
    uint64_t v17 = v0[33];
    uint64_t v19 = v0[31];

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  }
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20(0);
}

uint64_t sub_100005230(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100006000(&qword_100028550);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
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
    return _swift_continuation_throwingResume(a1);
  }
}

uint64_t sub_1000052F0()
{
  *(void *)(v1 + 40) = v0;
  *(void *)(v1 + 48) = *v0;
  return _swift_task_switch(sub_100005338, 0, 0);
}

uint64_t sub_100005338()
{
  uint64_t v1 = v0[5];
  os_log_type_t v2 = *(void **)(v1 + 24);
  v0[7] = v2;
  if (v2)
  {
    uint64_t v3 = v0[6];
    uint64_t v4 = (void *)swift_task_alloc();
    v0[8] = v4;
    v4[2] = v2;
    v4[3] = v1;
    v4[4] = v3;
    id v5 = v2;
    uint64_t v6 = (void *)swift_task_alloc();
    v0[9] = v6;
    uint64_t v7 = sub_100006000(&qword_100028540);
    *uint64_t v6 = v0;
    v6[1] = sub_10000555C;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 2, 0, 0, 0xD00000000000001ALL, 0x800000010001F050, sub_100005FF4, v4, v7);
  }
  else
  {
    if (qword_1000282F0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_10001C560();
    sub_100005FAC(v8, (uint64_t)qword_1000282F8);
    os_log_type_t v9 = sub_10001C540();
    os_log_type_t v10 = sub_10001C680();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "no client instance, unable to check for updates", v11, 2u);
      swift_slowDealloc();
    }

    uint64_t v12 = (uint64_t (*)(void, void, uint64_t))v0[1];
    return v12(0, 0, 255);
  }
}

uint64_t sub_10000555C()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    os_log_type_t v2 = sub_1000056E4;
  }
  else
  {
    swift_task_dealloc();
    os_log_type_t v2 = sub_100005678;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100005678()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 8);
  uint64_t v4 = *(unsigned __int8 *)(v0 + 32);
  return v3(v1, v2, v4);
}

uint64_t sub_1000056E4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_100005750(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_100006000(&qword_100028548);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  if (qword_1000282F0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_10001C560();
  sub_100005FAC(v10, (uint64_t)qword_1000282F8);
  uint64_t v11 = sub_10001C540();
  os_log_type_t v12 = sub_10001C670();
  if (os_log_type_enabled(v11, v12))
  {
    unint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Beginning to perform a scan for a Software Update", v13, 2u);
    swift_slowDealloc();
  }

  id v14 = [objc_allocWithZone((Class)SUScanOptions) init];
  [v14 setForced:1];
  NSString v15 = sub_10001C5B0();
  [v14 setIdentifier:v15];

  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v17 + v16, (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  *(void *)(v17 + ((v9 + v16 + 7) & 0xFFFFFFFFFFFFFFF8)) = a4;
  aBlock[4] = sub_1000060E4;
  aBlock[5] = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005EB4;
  aBlock[3] = &unk_100025150;
  uint64_t v18 = _Block_copy(aBlock);
  swift_release();
  [a2 scanForUpdates:v14 withScanResults:v18];
  _Block_release(v18);
}

void sub_100005A34(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_1000282F0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_10001C560();
  sub_100005FAC(v6, (uint64_t)qword_1000282F8);
  swift_errorRetain();
  id v7 = a1;
  swift_errorRetain();
  id v8 = v7;
  uint64_t v9 = sub_10001C540();
  os_log_type_t v10 = sub_10001C660();
  if (!os_log_type_enabled(v9, v10))
  {
    swift_errorRelease();
    swift_errorRelease();

    if (!a2) {
      goto LABEL_16;
    }
LABEL_7:
    swift_errorRetain();
    sub_100006000(&qword_100028550);
    sub_100006BC4(0, &qword_100028558);
    if (swift_dynamicCast()) {
      id v14 = v25;
    }
    else {
      id v14 = 0;
    }
    char v15 = sub_1000069C4(v14);

    if ((v15 & 1) == 0)
    {
      swift_errorRetain();
      sub_100006000(&qword_100028548);
      sub_10001C640();
      return;
    }
    goto LABEL_20;
  }
  uint64_t v24 = a3;
  uint64_t v11 = swift_slowAlloc();
  os_log_type_t v12 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v11 = 138412546;
  if (a2)
  {
    swift_errorRetain();
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    sub_10001C6C0();
  }
  else
  {
    sub_10001C6C0();
    uint64_t v13 = 0;
  }
  void *v12 = v13;
  swift_errorRelease();
  swift_errorRelease();
  *(_WORD *)(v11 + 12) = 2112;
  if (a1) {
    id v16 = v8;
  }
  sub_10001C6C0();
  v12[1] = a1;

  _os_log_impl((void *)&_mh_execute_header, v9, v10, "SUSettings Intents got SU Scan Results. Error: %@; results: %@",
    (uint8_t *)v11,
    0x16u);
  sub_100006000(&qword_100028560);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  if (a2) {
    goto LABEL_7;
  }
LABEL_16:
  if (!a1)
  {
LABEL_20:
    sub_100006000(&qword_100028548);
    sub_10001C650();
    return;
  }
  id v17 = v8;
  id v18 = [v17 preferredDescriptor];
  if (v18)
  {
    uint64_t v19 = v18;
    if ([v17 alternateDescriptor]) {
      goto LABEL_28;
    }
  }
  id v20 = objc_msgSend(v17, "preferredDescriptor", v24);
  id v21 = [v17 alternateDescriptor];
  id v22 = v21;
  if (v20)
  {

    if (!v22 && [v20 audienceType] == (id)1) {
      [v20 promoteAlternateUpdate];
    }
    id v23 = v20;
    sub_100006000(&qword_100028548);
    sub_10001C650();

    goto LABEL_29;
  }
  if (v21)
  {
LABEL_28:
    sub_100006000(&qword_100028548);
    sub_10001C650();
LABEL_29:

    return;
  }
  __break(1u);
}

void sub_100005EB4(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_100005F40()
{
  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for SUSettingsIntentsSUInterop()
{
  return self;
}

uint64_t sub_100005FAC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100005FE4(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

void sub_100005FF4(uint64_t a1)
{
  sub_100005750(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_100006000(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006044()
{
  uint64_t v1 = sub_100006000(&qword_100028548);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6, v5);
}

void sub_1000060E4(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_100006000(&qword_100028548) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  sub_100005A34(a1, a2, v6);
}

uint64_t sub_100006194(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000061A4()
{
  return swift_release();
}

uint64_t sub_1000061AC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1000061E8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100006210(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_100006288(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_10001C6C0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_100006288(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000635C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006B64((uint64_t)v12, *a3);
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
      sub_100006B64((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006B14((uint64_t)v12);
  return v7;
}

uint64_t sub_10000635C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10001C6D0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100006518(a5, a6);
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
  uint64_t v8 = sub_10001C720();
  if (!v8)
  {
    sub_10001C730();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10001C750();
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

uint64_t sub_100006518(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000065B0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006790(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006790(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000065B0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100006728(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10001C710();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10001C730();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10001C620();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10001C750();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10001C730();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100006728(uint64_t a1, uint64_t a2)
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
  sub_100006000(&qword_100028568);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006790(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006000(&qword_100028568);
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
  uint64_t result = sub_10001C750();
  __break(1u);
  return result;
}

unsigned char **sub_1000068E0(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *sub_1000068F0(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_10001C750();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_100006994@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_1000069C4(void *a1)
{
  if (!a1) {
    return 1;
  }
  id v2 = [a1 domain];
  uint64_t v3 = sub_10001C5C0();
  uint64_t v5 = v4;

  if (v3 == sub_10001C5C0() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v8 = sub_10001C770();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t result = 0;
    if ((v8 & 1) == 0) {
      return result;
    }
  }
  unint64_t v10 = (unint64_t)[a1 code];
  if (v10 <= 0x37) {
    return (0x80000000006808uLL >> v10) & 1;
  }
  else {
    return 0;
  }
}

uint64_t *sub_100006AB0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006B14(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006B64(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006BC4(uint64_t a1, unint64_t *a2)
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

unint64_t sub_100006C00()
{
  unint64_t result = qword_100028578;
  if (!qword_100028578)
  {
    sub_10001C690();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028578);
  }
  return result;
}

unint64_t sub_100006C58()
{
  unint64_t result = qword_100028588;
  if (!qword_100028588)
  {
    sub_100006CB4(&qword_100028580);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028588);
  }
  return result;
}

uint64_t sub_100006CB4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006CFC()
{
  id v0 = [self currentDevice];
  id v1 = [v0 systemVersion];

  sub_10001C5C0();
  sub_100006DEC();
  uint64_t v2 = sub_10001C6E0();
  swift_bridgeObjectRelease();
  if (*(void *)(v2 + 16))
  {
    uint64_t v3 = *(void *)(v2 + 32);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v3 = 0;
  }
  swift_bridgeObjectRelease();
  return v3;
}

unint64_t sub_100006DEC()
{
  unint64_t result = qword_100028590;
  if (!qword_100028590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028590);
  }
  return result;
}

id sub_100006E44(id result, void *a2, char a3)
{
  if (a3 && a3 != 2)
  {
    if (a3 != 1) {
      return result;
    }
    id v4 = result;
    unint64_t result = a2;
  }
  return result;
}

void destroy for SUSettingsIntentsScanResult(uint64_t a1)
{
}

void sub_100006EA8(void *a1, void *a2, char a3)
{
  if (a3 && a3 != 2)
  {
    if (a3 != 1) {
      return;
    }

    a1 = a2;
  }
}

uint64_t _s29SoftwareUpdateSettingsIntents27SUSettingsIntentsScanResultOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  id v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_100006E44(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SUSettingsIntentsScanResult(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  id v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_100006E44(*(id *)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  int64_t v7 = *(void **)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_100006EA8(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for SUSettingsIntentsScanResult(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SUSettingsIntentsScanResult(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  id v4 = *(void **)a1;
  char v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_100006EA8(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SUSettingsIntentsScanResult(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SUSettingsIntentsScanResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100007088(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_1000070A4(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)__n128 result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SUSettingsIntentsScanResult()
{
  return &type metadata for SUSettingsIntentsScanResult;
}

uint64_t sub_1000070CC()
{
  uint64_t v0 = sub_10001C4B0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  unsigned int v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10001C500();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10001C5A0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10001C4C0();
  sub_100006AB0(v6, qword_100028EB8);
  sub_100005FAC(v6, (uint64_t)qword_100028EB8);
  sub_10001C590();
  sub_10001C4F0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_10001C4D0();
}

uint64_t sub_1000072A8@<X0>(uint64_t a1@<X8>)
{
  sub_100006000(&qword_100028680);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v12 - v5;
  uint64_t v7 = sub_10001C4C0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_10001C4A0();
  sub_10001C4A0();
  int64_t v9 = *(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56);
  v9(v6, 0, 1, v7);
  sub_100006000(&qword_1000286A8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10001CD40;
  sub_10001C4A0();
  sub_10001C4A0();
  v9(v4, 0, 1, v7);
  sub_10001C300();
  uint64_t v10 = sub_10001C2F0();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a1, 0, 1, v10);
}

uint64_t sub_100007528()
{
  sub_10001C120();
  return v1;
}

uint64_t sub_10000755C()
{
  uint64_t v0 = sub_100006000(&qword_1000286C8);
  sub_100006AB0(v0, qword_100028ED0);
  sub_100005FAC(v0, (uint64_t)qword_100028ED0);
  sub_100006000(&qword_1000286D0);
  uint64_t v1 = *(void *)(sub_100006000(&qword_1000286D8) - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001CD50;
  *(unsigned char *)(v4 + v3) = 0;
  sub_100007FE4();
  sub_10001C3A0();
  *(unsigned char *)(v4 + v3 + v2) = 1;
  sub_10001C3A0();
  sub_100016300(v4);
  return sub_10001C3B0();
}

uint64_t sub_1000076F0()
{
  uint64_t v0 = sub_100006000(&qword_100028680);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10001C4C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_10001C460();
  sub_100006AB0(v5, qword_100028EE8);
  sub_100005FAC(v5, (uint64_t)qword_100028EE8);
  sub_10001C4A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_10001C450();
}

unint64_t sub_100007864()
{
  uint64_t v0 = sub_100006000(&qword_1000286B0);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  v48 = (char *)v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v31 - v3;
  uint64_t v5 = sub_100006000(&qword_100028680);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  v46 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)v31 - v8;
  uint64_t v10 = sub_10001C4C0();
  uint64_t v44 = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  v50 = (char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  v49 = (char *)v31 - v15;
  __chkstk_darwin(v14);
  uint64_t v40 = (char *)v31 - v16;
  sub_100006000(&qword_1000286B8);
  uint64_t v17 = sub_100006000(&qword_1000286C0);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v45 = *(void *)(v18 + 72);
  v31[2] = v17 - 8;
  unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v20 = swift_allocObject();
  uint64_t v47 = v20;
  *(_OWORD *)(v20 + 16) = xmmword_10001CD50;
  unint64_t v21 = v20 + v19;
  *(unsigned char *)(v20 + v19) = 0;
  sub_10001C4A0();
  uint64_t v36 = v9;
  unint64_t v37 = 0x800000010001F500;
  sub_10001C4A0();
  id v22 = *(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56);
  v11 += 56;
  uint64_t v43 = v22;
  v22(v9, 0, 1, v10);
  unint64_t v41 = 0x800000010001F520;
  unint64_t v42 = 0xD000000000000026;
  v31[0] = v4;
  sub_10001C360();
  uint64_t v23 = sub_10001C370();
  uint64_t v24 = *(void *)(v23 - 8);
  v38 = *(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56);
  uint64_t v39 = v24 + 56;
  v38(v4, 0, 1, v23);
  uint64_t v35 = sub_100006000(&qword_1000286A8);
  uint64_t v25 = *(void *)(v11 + 16);
  uint64_t v26 = *(unsigned __int8 *)(v11 + 24);
  v31[1] = 4 * v25;
  uint64_t v33 = v26 | 7;
  uint64_t v34 = ((v26 + 32) & ~v26) + 5 * v25;
  uint64_t v27 = swift_allocObject();
  long long v32 = xmmword_10001CD60;
  *(_OWORD *)(v27 + 16) = xmmword_10001CD60;
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  v31[3] = 3 * v25;
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C380();
  *(unsigned char *)(v21 + v45) = 1;
  sub_10001C4A0();
  uint64_t v28 = v46;
  sub_10001C4A0();
  v43(v28, 0, 1, v44);
  uint64_t v29 = v48;
  sub_10001C360();
  v38(v29, 0, 1, v23);
  *(_OWORD *)(swift_allocObject() + 16) = v32;
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C380();
  unint64_t result = sub_100016500(v47);
  qword_100028F00 = result;
  return result;
}

uint64_t sub_100007EA8(char a1)
{
  if (a1) {
    return 0x746867696E6F74;
  }
  else {
    return 7827310;
  }
}

uint64_t sub_100007ED8(char *a1, char *a2)
{
  return sub_100016264(*a1, *a2);
}

unint64_t sub_100007EE8()
{
  unint64_t result = qword_100028598;
  if (!qword_100028598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028598);
  }
  return result;
}

Swift::Int sub_100007F3C()
{
  return sub_100016AEC();
}

uint64_t sub_100007F44()
{
  return sub_100016B68();
}

Swift::Int sub_100007F4C()
{
  return sub_100016BCC();
}

uint64_t sub_100007F54@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100024F78;
  v8._object = v3;
  Swift::Int v5 = sub_10001C760(v4, v8);
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

uint64_t sub_100007FB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100007EA8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100007FE4()
{
  unint64_t result = qword_1000285A0;
  if (!qword_1000285A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285A0);
  }
  return result;
}

unint64_t sub_10000803C()
{
  unint64_t result = qword_1000285A8;
  if (!qword_1000285A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285A8);
  }
  return result;
}

uint64_t sub_100008090@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028320 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006000(&qword_1000286C8);
  uint64_t v3 = sub_100005FAC(v2, (uint64_t)qword_100028ED0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100008140()
{
  unint64_t result = qword_1000285B0;
  if (!qword_1000285B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285B0);
  }
  return result;
}

unint64_t sub_100008198()
{
  unint64_t result = qword_1000285B8;
  if (!qword_1000285B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285B8);
  }
  return result;
}

unint64_t sub_1000081F0()
{
  unint64_t result = qword_1000285C0;
  if (!qword_1000285C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285C0);
  }
  return result;
}

void *sub_100008244()
{
  return &protocol witness table for String;
}

uint64_t sub_100008250()
{
  sub_100009D58();
  uint64_t v2 = sub_10001C320();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100009DAC(v3, v0, v2, v1);
}

unint64_t sub_1000082E8()
{
  unint64_t result = qword_1000285D0;
  if (!qword_1000285D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285D0);
  }
  return result;
}

unint64_t sub_100008340()
{
  unint64_t result = qword_1000285D8;
  if (!qword_1000285D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285D8);
  }
  return result;
}

unint64_t sub_100008398()
{
  unint64_t result = qword_1000285E0;
  if (!qword_1000285E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285E0);
  }
  return result;
}

unint64_t sub_1000083F0()
{
  unint64_t result = qword_1000285E8;
  if (!qword_1000285E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285E8);
  }
  return result;
}

uint64_t sub_100008448@<X0>(uint64_t a1@<X8>)
{
  return sub_100008B0C(&qword_100028328, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100028EE8, a1);
}

uint64_t sub_100008480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100008A8C(a1, a2, a3, (void (*)(void))sub_100007FE4);
}

uint64_t sub_1000084AC(uint64_t a1)
{
  unint64_t v2 = sub_100007FE4();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000084FC()
{
  unint64_t result = qword_1000285F0;
  if (!qword_1000285F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285F0);
  }
  return result;
}

unint64_t sub_100008554()
{
  unint64_t result = qword_1000285F8;
  if (!qword_1000285F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000285F8);
  }
  return result;
}

unint64_t sub_1000085AC()
{
  unint64_t result = qword_100028600;
  if (!qword_100028600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028600);
  }
  return result;
}

uint64_t sub_100008600()
{
  if (qword_100028330 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_10000865C(uint64_t a1)
{
  unint64_t v2 = sub_1000083F0();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000086AC()
{
  unint64_t result = qword_100028608;
  if (!qword_100028608)
  {
    sub_100006CB4(&qword_100028610);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028608);
  }
  return result;
}

void sub_100008708(void *a1@<X8>)
{
  *a1 = &off_100024FF0;
}

unint64_t sub_10000871C()
{
  unint64_t result = qword_100028618;
  if (!qword_100028618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028618);
  }
  return result;
}

uint64_t sub_100008770@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10001C120();
  *a1 = v3;
  return result;
}

uint64_t sub_1000087AC()
{
  return sub_10001C130();
}

void (*sub_1000087E4(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10001C110();
  return sub_100008840;
}

void sub_100008840(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100008890()
{
  unint64_t result = qword_100028620;
  if (!qword_100028620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028620);
  }
  return result;
}

uint64_t sub_1000088E4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100009CB0();
  unint64_t v5 = sub_100009D58();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10000895C()
{
  unint64_t result = qword_100028628;
  if (!qword_100028628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028628);
  }
  return result;
}

unint64_t sub_1000089B4()
{
  unint64_t result = qword_100028630;
  if (!qword_100028630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028630);
  }
  return result;
}

unint64_t sub_100008A0C()
{
  unint64_t result = qword_100028638;
  if (!qword_100028638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028638);
  }
  return result;
}

uint64_t sub_100008A60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100008A8C(a1, a2, a3, (void (*)(void))sub_100008890);
}

uint64_t sub_100008A8C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100008AD4@<X0>(uint64_t a1@<X8>)
{
  return sub_100008B0C(&qword_100028318, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100028EB8, a1);
}

uint64_t sub_100008B0C@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100005FAC(v7, a3);
  int64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100008BB0()
{
  return 0;
}

uint64_t sub_100008BBC()
{
  return 1;
}

uint64_t sub_100008BCC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100009CB0();
  unint64_t v6 = sub_100009D04();
  unint64_t v7 = sub_100009D58();
  *unint64_t v4 = v2;
  v4[1] = sub_100008C98;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100008C98()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    unint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_100008DA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000097EC();
  *a1 = result;
  return result;
}

uint64_t sub_100008DC8(uint64_t a1)
{
  unint64_t v2 = sub_100008890();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100008E04()
{
  uint64_t v0 = sub_100006000(&qword_100028668);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  char v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008890();
  sub_10001C250();
  uint64_t v14 = sub_10001C1D0();
  unint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_10001C250();
  uint64_t v13 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v5 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v6 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v7 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v8 = sub_10001C1D0();
  v4(v3, v0);
  sub_100006000(&qword_100028670);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10001CD70;
  uint64_t v10 = v13;
  *(void *)(v9 + 32) = v14;
  *(void *)(v9 + 40) = v10;
  *(void *)(v9 + 48) = v5;
  *(void *)(v9 + 56) = v6;
  *(void *)(v9 + 64) = v7;
  *(void *)(v9 + 72) = v8;
  uint64_t v11 = sub_10001C1C0();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100009114()
{
  uint64_t v0 = sub_10001C240();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  char v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100008398();
  sub_10001C1B0();
  swift_release();
  sub_100008890();
  sub_10001C230();
  uint64_t v4 = sub_10001C220();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006000(&qword_100028660);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001CD40;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10001C210();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10000927C()
{
  uint64_t v0 = sub_10001C1F0();
  uint64_t v1 = sub_10001C1F0();
  sub_100006000(&qword_100028650);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10001CD50;
  *(void *)(v2 + 32) = v0;
  *(void *)(v2 + 40) = v1;
  uint64_t v3 = sub_10001C1E0();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_100009310()
{
  uint64_t v0 = sub_10001C1F0();
  sub_100006000(&qword_100028650);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10001CD40;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_10001C1E0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_10000937C()
{
  uint64_t v0 = sub_10001C2C0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_1000097EC();
  sub_100008890();
  sub_10001C2D0();
  uint64_t v4 = sub_10001C2B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006000(&qword_100028658);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001CD40;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10001C2A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1000094DC()
{
  uint64_t v0 = sub_10001C1A0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008890();
  sub_10001C190();
  uint64_t v4 = sub_10001C180();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006000(&qword_100028648);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001CD40;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10001C170();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for PerformSoftwareUpdateActionIntentAssistantIntentsProvider()
{
  return &type metadata for PerformSoftwareUpdateActionIntentAssistantIntentsProvider;
}

ValueMetadata *type metadata accessor for PerformSoftwareUpdateActionIntent()
{
  return &type metadata for PerformSoftwareUpdateActionIntent;
}

unsigned char *initializeBufferWithCopyOfBuffer for PerformSoftwareUpdateActionIntent.PerformSoftwareUpdateTiming(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PerformSoftwareUpdateActionIntent.PerformSoftwareUpdateTiming(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PerformSoftwareUpdateActionIntent.PerformSoftwareUpdateTiming(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000097A0);
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

uint64_t sub_1000097C8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000097D0(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PerformSoftwareUpdateActionIntent.PerformSoftwareUpdateTiming()
{
  return &type metadata for PerformSoftwareUpdateActionIntent.PerformSoftwareUpdateTiming;
}

uint64_t sub_1000097EC()
{
  uint64_t v0 = sub_10001C410();
  uint64_t v24 = *(void *)(v0 - 8);
  uint64_t v25 = v0;
  __chkstk_darwin(v0);
  uint64_t v23 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100006000(&qword_100028678);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  id v22 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unsigned int v6 = (char *)&v21 - v5;
  uint64_t v7 = sub_100006000(&qword_100028680);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10001C4B0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10001C500();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_10001C5A0();
  __chkstk_darwin(v15 - 8);
  uint64_t v16 = sub_10001C4C0();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v21 = sub_100006000(&qword_100028688);
  sub_10001C590();
  sub_10001C4F0();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for LocalizedStringResource.BundleDescription.main(_:), v10);
  sub_10001C4D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v9, 1, 1, v16);
  char v26 = 2;
  uint64_t v18 = sub_10001C0A0();
  unint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v6, 1, 1, v18);
  v19(v22, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v23, enum case for InputConnectionBehavior.default(_:), v25);
  sub_100007FE4();
  return sub_10001C140();
}

uint64_t sub_100009C3C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10001C120();
  *a1 = v3;
  return result;
}

uint64_t sub_100009C78()
{
  return sub_10001C130();
}

unint64_t sub_100009CB0()
{
  unint64_t result = qword_100028690;
  if (!qword_100028690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028690);
  }
  return result;
}

unint64_t sub_100009D04()
{
  unint64_t result = qword_100028698;
  if (!qword_100028698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028698);
  }
  return result;
}

unint64_t sub_100009D58()
{
  unint64_t result = qword_1000286A0;
  if (!qword_1000286A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000286A0);
  }
  return result;
}

uint64_t sub_100009DAC(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100009DC0()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SoftwareUpdateSettingsIntents()
{
  return self;
}

unint64_t sub_100009DF8()
{
  unint64_t result = qword_100028790;
  if (!qword_100028790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028790);
  }
  return result;
}

unint64_t sub_100009E50()
{
  unint64_t result = qword_100028798;
  if (!qword_100028798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028798);
  }
  return result;
}

uint64_t sub_100009EA4()
{
  uint64_t v0 = sub_10001C560();
  sub_100006AB0(v0, qword_100028778);
  sub_100005FAC(v0, (uint64_t)qword_100028778);
  return sub_10001C550();
}

uint64_t sub_100009F20()
{
  uint64_t v0 = sub_10001C4C0();
  sub_100006AB0(v0, qword_100028F08);
  sub_100005FAC(v0, (uint64_t)qword_100028F08);
  return sub_10001C4A0();
}

uint64_t sub_100009F84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v14 = a1;
  uint64_t v1 = sub_100006000(&qword_100028680);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  unsigned int v6 = (char *)&v13 - v5;
  uint64_t v7 = sub_10001C4C0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_10001C4A0();
  sub_10001C4A0();
  uint64_t v9 = *(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56);
  v9(v6, 0, 1, v7);
  sub_100006000(&qword_1000286A8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10001CD50;
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  v9(v4, 0, 1, v7);
  uint64_t v10 = v14;
  sub_10001C300();
  uint64_t v11 = sub_10001C2F0();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
}

uint64_t sub_10000A228(uint64_t a1, uint64_t a2)
{
  v2[36] = a1;
  v2[37] = a2;
  sub_10001C5A0();
  v2[38] = swift_task_alloc();
  uint64_t v3 = sub_10001C3D0();
  v2[39] = v3;
  v2[40] = *(void *)(v3 - 8);
  v2[41] = swift_task_alloc();
  uint64_t v4 = sub_10001C3E0();
  v2[42] = v4;
  v2[43] = *(void *)(v4 - 8);
  v2[44] = swift_task_alloc();
  uint64_t v5 = sub_10001C4C0();
  v2[45] = v5;
  v2[46] = *(void *)(v5 - 8);
  v2[47] = swift_task_alloc();
  v2[48] = swift_task_alloc();
  v2[49] = swift_task_alloc();
  uint64_t v6 = sub_10001C0A0();
  v2[50] = v6;
  v2[51] = *(void *)(v6 - 8);
  v2[52] = swift_task_alloc();
  uint64_t v7 = sub_10001C4B0();
  v2[53] = v7;
  v2[54] = *(void *)(v7 - 8);
  v2[55] = swift_task_alloc();
  sub_10001C500();
  v2[56] = swift_task_alloc();
  uint64_t v8 = sub_10001C560();
  v2[57] = v8;
  v2[58] = *(void *)(v8 - 8);
  v2[59] = swift_task_alloc();
  v2[60] = swift_task_alloc();
  v2[61] = swift_task_alloc();
  v2[62] = swift_task_alloc();
  v2[63] = swift_task_alloc();
  v2[64] = swift_task_alloc();
  v2[65] = swift_task_alloc();
  v2[66] = swift_task_alloc();
  return _swift_task_switch(sub_10000A580, 0, 0);
}

uint64_t sub_10000A580()
{
  uint64_t v107 = v0;
  if (qword_100028310 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(qword_100028EB0 + 24);
  *(void *)(v0 + 536) = v1;
  if (!v1)
  {
    if (qword_100028338 != -1) {
      swift_once();
    }
    uint64_t v19 = *(void *)(v0 + 464);
    uint64_t v18 = *(void *)(v0 + 472);
    uint64_t v20 = *(void *)(v0 + 456);
    uint64_t v21 = sub_100005FAC(v20, (uint64_t)qword_100028778);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v21, v20);
    id v22 = sub_10001C540();
    os_log_type_t v23 = sub_10001C680();
    BOOL v24 = os_log_type_enabled(v22, v23);
    uint64_t v26 = *(void *)(v0 + 464);
    uint64_t v25 = *(void *)(v0 + 472);
    uint64_t v27 = *(void *)(v0 + 456);
    if (v24)
    {
      uint64_t v103 = *(void *)(v0 + 472);
      uint64_t v28 = swift_slowAlloc();
      uint64_t v106 = swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 136315650;
      *(void *)(v0 + 16) = &type metadata for SetAutomaticInstallUpdatesIntent;
      sub_100006000(&qword_1000287F8);
      uint64_t v29 = sub_10001C5F0();
      *(void *)(v0 + 24) = sub_100006288(v29, v30, &v106);
      sub_10001C6C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 2080;
      *(void *)(v0 + 32) = sub_100006288(0x286D726F66726570, 0xE900000000000029, &v106);
      sub_10001C6C0();
      *(_WORD *)(v28 + 22) = 2048;
      *(void *)(v0 + 40) = 37;
      sub_10001C6C0();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "🐞 %s | %s | line:%ld => Unable to init SUManagerClient", (uint8_t *)v28, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v103, v27);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
    }
    sub_10001C0E0();
    goto LABEL_33;
  }
  uint64_t v2 = qword_100028338;
  id v98 = v1;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = *(void *)(v0 + 528);
  uint64_t v4 = *(void *)(v0 + 456);
  uint64_t v5 = *(void *)(v0 + 464);
  uint64_t v6 = sub_100005FAC(v4, (uint64_t)qword_100028778);
  *(void *)(v0 + 544) = v6;
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  *(void *)(v0 + 552) = v7;
  *(void *)(v0 + 560) = (v5 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v7(v3, v6, v4);
  swift_retain_n();
  uint64_t v8 = sub_10001C540();
  os_log_type_t v9 = sub_10001C670();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = *(void *)(v0 + 528);
  uint64_t v12 = *(void *)(v0 + 464);
  uint64_t v102 = *(void *)(v0 + 456);
  if (v10)
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v106 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315906;
    uint64_t v97 = v11;
    *(void *)(v0 + 264) = &type metadata for SetAutomaticInstallUpdatesIntent;
    sub_100006000(&qword_1000287F8);
    uint64_t v14 = sub_10001C5F0();
    *(void *)(v0 + 272) = sub_100006288(v14, v15, &v106);
    sub_10001C6C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    *(void *)(v0 + 280) = sub_100006288(0x286D726F66726570, 0xE900000000000029, &v106);
    sub_10001C6C0();
    *(_WORD *)(v13 + 22) = 2048;
    *(void *)(v0 + 48) = 41;
    sub_10001C6C0();
    *(_WORD *)(v13 + 32) = 1024;
    sub_10001C120();
    swift_release();
    uint64_t v16 = (unsigned char *)(v0 + 596);
    *(_DWORD *)(v0 + 592) = *(unsigned __int8 *)(v0 + 597);
    sub_10001C6C0();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "🐞 %s | %s | line:%ld => Perform called with property value: %{BOOL}d", (uint8_t *)v13, 0x26u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v17(v97, v102);
  }
  else
  {

    swift_release_n();
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v17(v11, v102);
    uint64_t v16 = (unsigned char *)(v0 + 596);
  }
  *(void *)(v0 + 568) = v17;
  sub_10001C120();
  uint64_t v31 = *(void *)(v0 + 456);
  if (*v16 == 1)
  {
    v7(*(void *)(v0 + 520), v6, v31);
    long long v32 = sub_10001C540();
    os_log_type_t v99 = sub_10001C670();
    BOOL v33 = os_log_type_enabled(v32, v99);
    uint64_t v34 = *(void *)(v0 + 520);
    uint64_t v35 = *(void *)(v0 + 456);
    if (v33)
    {
      uint64_t v36 = swift_slowAlloc();
      uint64_t v106 = swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 136315650;
      *(void *)(v0 + 232) = &type metadata for SetAutomaticInstallUpdatesIntent;
      sub_100006000(&qword_1000287F8);
      uint64_t v37 = sub_10001C5F0();
      *(void *)(v0 + 240) = sub_100006288(v37, v38, &v106);
      sub_10001C6C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 12) = 2080;
      *(void *)(v0 + 248) = sub_100006288(0x286D726F66726570, 0xE900000000000029, &v106);
      sub_10001C6C0();
      *(_WORD *)(v36 + 22) = 2048;
      *(void *)(v0 + 256) = 44;
      sub_10001C6C0();
      _os_log_impl((void *)&_mh_execute_header, v32, v99, "🐞 %s | %s | line:%ld => User requested turning on the auto update", (uint8_t *)v36, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    v17(v34, v35);
    uint64_t v47 = *(void *)(v0 + 512);
    uint64_t v48 = *(void *)(v0 + 456);
    v49 = *(void **)(qword_100028EB0 + 16);
    [v49 enableAutomaticUpdateV2:1];
    [v49 enableAutomaticDownload:1];
    [v49 enablePreviousUserSpecifiedAutomaticUpdateV2:1];
    v7(v47, v6, v48);
    v50 = sub_10001C540();
    os_log_type_t v51 = sub_10001C670();
    BOOL v52 = os_log_type_enabled(v50, v51);
    uint64_t v53 = *(void *)(v0 + 512);
    uint64_t v54 = *(void *)(v0 + 456);
    if (v52)
    {
      uint64_t v104 = *(void *)(v0 + 456);
      uint64_t v55 = swift_slowAlloc();
      uint64_t v106 = swift_slowAlloc();
      *(_DWORD *)uint64_t v55 = 136315650;
      *(void *)(v0 + 200) = &type metadata for SetAutomaticInstallUpdatesIntent;
      sub_100006000(&qword_1000287F8);
      uint64_t v56 = sub_10001C5F0();
      *(void *)(v0 + 208) = sub_100006288(v56, v57, &v106);
      sub_10001C6C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v55 + 12) = 2080;
      *(void *)(v0 + 216) = sub_100006288(0x286D726F66726570, 0xE900000000000029, &v106);
      sub_10001C6C0();
      *(_WORD *)(v55 + 22) = 2048;
      *(void *)(v0 + 224) = 52;
      sub_10001C6C0();
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "🐞 %s | %s | line:%ld => Auto update turned on by user request", (uint8_t *)v55, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v17(v53, v104);
    }
    else
    {

      v17(v53, v54);
    }
    goto LABEL_32;
  }
  v7(*(void *)(v0 + 504), v6, v31);
  uint64_t v39 = sub_10001C540();
  os_log_type_t v40 = sub_10001C670();
  BOOL v41 = os_log_type_enabled(v39, v40);
  uint64_t v42 = *(void *)(v0 + 504);
  uint64_t v43 = *(void *)(v0 + 456);
  if (v41)
  {
    uint64_t v96 = v6;
    uint64_t v44 = swift_slowAlloc();
    uint64_t v106 = swift_slowAlloc();
    *(_DWORD *)uint64_t v44 = 136315650;
    *(void *)(v0 + 168) = &type metadata for SetAutomaticInstallUpdatesIntent;
    sub_100006000(&qword_1000287F8);
    uint64_t v45 = sub_10001C5F0();
    *(void *)(v0 + 176) = sub_100006288(v45, v46, &v106);
    sub_10001C6C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2080;
    *(void *)(v0 + 184) = sub_100006288(0x286D726F66726570, 0xE900000000000029, &v106);
    sub_10001C6C0();
    *(_WORD *)(v44 + 22) = 2048;
    *(void *)(v0 + 192) = 56;
    sub_10001C6C0();
    _os_log_impl((void *)&_mh_execute_header, v39, v40, "🐞 %s | %s | line:%ld => User requested turning off the auto update", (uint8_t *)v44, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = v96;
    swift_slowDealloc();
  }

  v17(v42, v43);
  if (![v98 isAutoUpdateScheduled])
  {
    v66 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 552);
    uint64_t v67 = *(void *)(v0 + 544);
    uint64_t v68 = *(void *)(v0 + 480);
    uint64_t v69 = *(void *)(v0 + 456);
    v70 = *(void **)(qword_100028EB0 + 16);
    [v70 enableAutomaticUpdateV2:0];
    [v70 enablePreviousUserSpecifiedAutomaticUpdateV2:1];
    v66(v68, v67, v69);
    v71 = sub_10001C540();
    os_log_type_t v72 = sub_10001C670();
    BOOL v73 = os_log_type_enabled(v71, v72);
    v74 = *(void (**)(uint64_t, uint64_t))(v0 + 568);
    uint64_t v75 = *(void *)(v0 + 480);
    uint64_t v76 = *(void *)(v0 + 456);
    if (v73)
    {
      uint64_t v105 = *(void *)(v0 + 456);
      uint64_t v77 = swift_slowAlloc();
      uint64_t v106 = swift_slowAlloc();
      *(_DWORD *)uint64_t v77 = 136315650;
      *(void *)(v0 + 56) = &type metadata for SetAutomaticInstallUpdatesIntent;
      sub_100006000(&qword_1000287F8);
      uint64_t v78 = sub_10001C5F0();
      *(void *)(v0 + 64) = sub_100006288(v78, v79, &v106);
      sub_10001C6C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v77 + 12) = 2080;
      *(void *)(v0 + 72) = sub_100006288(0x286D726F66726570, 0xE900000000000029, &v106);
      sub_10001C6C0();
      *(_WORD *)(v77 + 22) = 2048;
      *(void *)(v0 + 80) = 74;
      sub_10001C6C0();
      _os_log_impl((void *)&_mh_execute_header, v71, v72, "🐞 %s | %s | line:%ld => Auto update turned off by user request", (uint8_t *)v77, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v74(v75, v105);
    }
    else
    {

      v74(v75, v76);
    }
LABEL_32:
    v93 = *(void **)(v0 + 536);
    sub_10001C0E0();

LABEL_33:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v94 = *(uint64_t (**)(void))(v0 + 8);
    return v94();
  }
  v7(*(void *)(v0 + 496), v6, *(void *)(v0 + 456));
  v58 = sub_10001C540();
  os_log_type_t v59 = sub_10001C670();
  BOOL v60 = os_log_type_enabled(v58, v59);
  uint64_t v61 = *(void *)(v0 + 496);
  uint64_t v62 = *(void *)(v0 + 456);
  if (v60)
  {
    uint64_t v63 = swift_slowAlloc();
    uint64_t v106 = swift_slowAlloc();
    *(_DWORD *)uint64_t v63 = 136315650;
    *(void *)(v0 + 136) = &type metadata for SetAutomaticInstallUpdatesIntent;
    sub_100006000(&qword_1000287F8);
    uint64_t v64 = sub_10001C5F0();
    *(void *)(v0 + 144) = sub_100006288(v64, v65, &v106);
    sub_10001C6C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v63 + 12) = 2080;
    *(void *)(v0 + 152) = sub_100006288(0x286D726F66726570, 0xE900000000000029, &v106);
    sub_10001C6C0();
    *(_WORD *)(v63 + 22) = 2048;
    *(void *)(v0 + 160) = 60;
    sub_10001C6C0();
    _os_log_impl((void *)&_mh_execute_header, v58, v59, "🐞 %s | %s | line:%ld => User needs to approved turning off the auto update since there is a scheduled update", (uint8_t *)v63, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  v17(v61, v62);
  uint64_t v80 = *(void *)(v0 + 440);
  uint64_t v81 = *(void *)(v0 + 424);
  uint64_t v82 = *(void *)(v0 + 432);
  uint64_t v83 = *(void *)(v0 + 384);
  uint64_t v101 = *(void *)(v0 + 392);
  uint64_t v84 = *(void *)(v0 + 368);
  uint64_t v85 = *(void *)(v0 + 376);
  uint64_t v86 = *(void *)(v0 + 360);
  *(void *)v100 = *(void *)(v0 + 296);
  sub_10001C590();
  sub_10001C4F0();
  (*(void (**)(uint64_t, void, uint64_t))(v82 + 104))(v80, enum case for LocalizedStringResource.BundleDescription.main(_:), v81);
  sub_10001C4D0();
  *(void *)(v0 + 88) = *(void *)v100;
  v87 = *(void (**)(uint64_t, uint64_t, uint64_t))(v84 + 16);
  v87(v101, v85, v86);
  v87(v83, v85, v86);
  sub_10001C090();
  *(void *)(v0 + 96) = &_swiftEmptyArrayStorage;
  sub_10000D5D8();
  sub_100006000(&qword_100028808);
  sub_10000D630(&qword_100028810, &qword_100028808);
  sub_10001C6F0();
  sub_10001C3C0();
  v88 = (void *)swift_task_alloc();
  *(void *)(v0 + 576) = v88;
  unint64_t v89 = sub_100009DF8();
  void *v88 = v0;
  v88[1] = sub_10000B8C0;
  uint64_t v90 = *(void *)(v0 + 416);
  uint64_t v91 = *(void *)(v0 + 352);
  uint64_t v92 = *(void *)(v0 + 328);
  return AppIntent.requestConfirmation(conditions:actionName:dialog:)(v91, v92, v90, &type metadata for SetAutomaticInstallUpdatesIntent, v89);
}

uint64_t sub_10000B8C0()
{
  uint64_t v12 = *(void *)(*(void *)v1 + 416);
  uint64_t v2 = *(void *)(*(void *)v1 + 408);
  uint64_t v3 = *(void *)(*(void *)v1 + 400);
  uint64_t v4 = *(void *)(*(void *)v1 + 352);
  uint64_t v5 = *(void *)(*(void *)v1 + 344);
  uint64_t v6 = *(void *)(*(void *)v1 + 336);
  uint64_t v7 = *(void *)(*(void *)v1 + 328);
  uint64_t v8 = *(void *)(*(void *)v1 + 320);
  uint64_t v9 = *(void *)(*(void *)v1 + 312);
  *(void *)(*(void *)v1 + 584) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v3);
  if (v0) {
    BOOL v10 = sub_10000C0B0;
  }
  else {
    BOOL v10 = sub_10000BAF4;
  }
  return _swift_task_switch(v10, 0, 0);
}

uint64_t sub_10000BAF4()
{
  uint64_t v38 = v0;
  (*(void (**)(void, void, void))(v0 + 552))(*(void *)(v0 + 488), *(void *)(v0 + 544), *(void *)(v0 + 456));
  uint64_t v1 = sub_10001C540();
  os_log_type_t v2 = sub_10001C670();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v30 = *(void *)(v0 + 456);
    uint64_t v31 = *(void *)(v0 + 488);
    uint64_t v3 = *(void *)(v0 + 368);
    BOOL v33 = *(void (**)(uint64_t, uint64_t))(v0 + 568);
    uint64_t v35 = *(void *)(v0 + 376);
    uint64_t v32 = *(void *)(v0 + 360);
    uint64_t v4 = swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315650;
    *(void *)(v0 + 104) = &type metadata for SetAutomaticInstallUpdatesIntent;
    sub_100006000(&qword_1000287F8);
    uint64_t v5 = sub_10001C5F0();
    *(void *)(v0 + 112) = sub_100006288(v5, v6, &v37);
    sub_10001C6C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2080;
    *(void *)(v0 + 120) = sub_100006288(0x286D726F66726570, 0xE900000000000029, &v37);
    sub_10001C6C0();
    *(_WORD *)(v4 + 22) = 2048;
    *(void *)(v0 + 128) = 66;
    sub_10001C6C0();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "🐞 %s | %s | line:%ld => User approved turning off the auto update", (uint8_t *)v4, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v33(v31, v30);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v35, v32);
  }
  else
  {
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v0 + 568);
    uint64_t v8 = *(void *)(v0 + 488);
    uint64_t v9 = *(void *)(v0 + 456);
    uint64_t v11 = *(void *)(v0 + 368);
    uint64_t v10 = *(void *)(v0 + 376);
    uint64_t v12 = *(void *)(v0 + 360);

    v7(v8, v9);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 552);
  uint64_t v14 = *(void *)(v0 + 544);
  uint64_t v15 = *(void *)(v0 + 480);
  uint64_t v16 = *(void *)(v0 + 456);
  uint64_t v17 = *(void **)(qword_100028EB0 + 16);
  [v17 enableAutomaticUpdateV2:0];
  [v17 enablePreviousUserSpecifiedAutomaticUpdateV2:1];
  v13(v15, v14, v16);
  uint64_t v18 = sub_10001C540();
  os_log_type_t v19 = sub_10001C670();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v0 + 568);
  uint64_t v22 = *(void *)(v0 + 480);
  uint64_t v23 = *(void *)(v0 + 456);
  if (v20)
  {
    uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v0 + 568);
    uint64_t v34 = *(void *)(v0 + 456);
    uint64_t v24 = swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 136315650;
    *(void *)(v0 + 56) = &type metadata for SetAutomaticInstallUpdatesIntent;
    sub_100006000(&qword_1000287F8);
    uint64_t v25 = sub_10001C5F0();
    *(void *)(v0 + 64) = sub_100006288(v25, v26, &v37);
    sub_10001C6C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    *(void *)(v0 + 72) = sub_100006288(0x286D726F66726570, 0xE900000000000029, &v37);
    sub_10001C6C0();
    *(_WORD *)(v24 + 22) = 2048;
    *(void *)(v0 + 80) = 74;
    sub_10001C6C0();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "🐞 %s | %s | line:%ld => Auto update turned off by user request", (uint8_t *)v24, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v36(v22, v34);
  }
  else
  {

    v21(v22, v23);
  }
  uint64_t v27 = *(void **)(v0 + 536);
  sub_10001C0E0();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
  return v28();
}

uint64_t sub_10000C0B0()
{
  uint64_t v1 = *(void *)(v0 + 376);
  uint64_t v3 = *(void *)(v0 + 360);
  uint64_t v2 = *(void *)(v0 + 368);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
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

unint64_t sub_10000C228()
{
  unint64_t result = qword_1000287A0;
  if (!qword_1000287A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287A0);
  }
  return result;
}

unint64_t sub_10000C280()
{
  unint64_t result = qword_1000287A8;
  if (!qword_1000287A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000287A8);
  }
  return result;
}

uint64_t sub_10000C2D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000C2F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000C340@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028340 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001C4C0();
  uint64_t v3 = sub_100005FAC(v2, (uint64_t)qword_100028F08);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000C3F4(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000C494;
  return sub_10000A228(a1, v4);
}

uint64_t sub_10000C494()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000C588@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000D05C();
  *a1 = result;
  return result;
}

uint64_t sub_10000C5B0(uint64_t a1)
{
  unint64_t v2 = sub_100009DF8();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_10000C5EC()
{
  uint64_t v0 = sub_100006000(&qword_1000287C8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006000(&qword_1000287D0);
  __chkstk_darwin(v4);
  sub_100009DF8();
  sub_10001C280();
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  sub_10001C270(v10);
  swift_getKeyPath();
  sub_100009E50();
  sub_10001C1B0();
  swift_release();
  sub_10001C260();
  swift_release();
  v11._object = (void *)0x800000010001F730;
  v11._countAndFlagsBits = 0xD00000000000001ALL;
  sub_10001C270(v11);
  sub_10001C290();
  uint64_t v5 = sub_10001C1D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006000(&qword_1000287D8);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001CD40;
  *(void *)(v6 + 32) = v5;
  uint64_t v7 = sub_10001C1C0();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_10000C828()
{
  return sub_10000CC18();
}

uint64_t sub_10000C840()
{
  uint64_t v0 = sub_10001C1F0();
  uint64_t v1 = sub_10001C1F0();
  sub_100006000(&qword_100028650);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_10001CD50;
  *(void *)(v2 + 32) = v0;
  *(void *)(v2 + 40) = v1;
  uint64_t v3 = sub_10001C1E0();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_10000C8D8(uint64_t a1)
{
  v11[1] = a1;
  uint64_t v13 = sub_100006000(&qword_1000287C8);
  uint64_t v1 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006000(&qword_1000287D0);
  __chkstk_darwin(v4);
  sub_100009DF8();
  sub_10001C280();
  v14._object = (void *)0x800000010001F6D0;
  v14._countAndFlagsBits = 0xD000000000000021;
  sub_10001C270(v14);
  swift_getKeyPath();
  sub_100009E50();
  sub_10001C1B0();
  swift_release();
  sub_10001C260();
  swift_release();
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  sub_10001C270(v15);
  sub_10001C290();
  uint64_t v12 = sub_10001C1D0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v6 = v13;
  v5(v3, v13);
  sub_10001C280();
  v16._countAndFlagsBits = 0xD000000000000024;
  v16._object = (void *)0x800000010001F700;
  sub_10001C270(v16);
  swift_getKeyPath();
  sub_10001C1B0();
  swift_release();
  sub_10001C260();
  swift_release();
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  sub_10001C270(v17);
  sub_10001C290();
  uint64_t v7 = sub_10001C1D0();
  v5(v3, v6);
  sub_100006000(&qword_1000287D8);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10001CD50;
  *(void *)(v8 + 32) = v12;
  *(void *)(v8 + 40) = v7;
  uint64_t v9 = sub_10001C1C0();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_10000CC00()
{
  return sub_10000CC18();
}

uint64_t sub_10000CC18()
{
  uint64_t v0 = sub_10001C240();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100009E50();
  sub_10001C1B0();
  swift_release();
  sub_100009DF8();
  sub_10001C230();
  uint64_t v4 = sub_10001C220();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006000(&qword_100028660);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001CD40;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10001C210();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10000CD74()
{
  uint64_t v0 = sub_10001C1F0();
  uint64_t v1 = sub_10001C1F0();
  uint64_t v2 = sub_10001C1F0();
  uint64_t v3 = sub_10001C1F0();
  sub_100006000(&qword_100028650);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001D370;
  *(void *)(v4 + 32) = v0;
  *(void *)(v4 + 40) = v1;
  *(void *)(v4 + 48) = v2;
  *(void *)(v4 + 56) = v3;
  uint64_t v5 = sub_10001C1E0();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10000CE48()
{
  uint64_t v0 = sub_10001C1F0();
  sub_100006000(&qword_100028650);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10001CD40;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_10001C1E0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_10000CEC8()
{
  uint64_t v0 = sub_10001C1A0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009DF8();
  sub_10001C190();
  uint64_t v4 = sub_10001C180();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006000(&qword_100028648);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001CD40;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10001C170();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for SetAutomaticInstallUpdatesIntentAssistantIntentsProvider()
{
  return &type metadata for SetAutomaticInstallUpdatesIntentAssistantIntentsProvider;
}

ValueMetadata *type metadata accessor for SetAutomaticInstallUpdatesIntent()
{
  return &type metadata for SetAutomaticInstallUpdatesIntent;
}

uint64_t sub_10000D020()
{
  return sub_10000D630(&qword_1000287B8, &qword_1000287C0);
}

uint64_t sub_10000D05C()
{
  uint64_t v0 = sub_10001C410();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = &v18[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_100006000(&qword_100028678);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = &v18[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100006000(&qword_1000287E0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_100006000(&qword_100028680);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_10001C4C0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_100006000(&qword_1000287E8);
  sub_10001C4A0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  v18[15] = 2;
  uint64_t v15 = sub_10001C630();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 1, 1, v15);
  uint64_t v16 = sub_10001C0A0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
  (*(void (**)(unsigned char *, void, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  return sub_10001C160();
}

uint64_t sub_10000D384()
{
  uint64_t v0 = sub_10001C2C0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000D05C();
  sub_100009DF8();
  sub_10001C2D0();
  uint64_t v4 = sub_10001C2B0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  uint64_t v11 = sub_10000D05C();
  sub_10001C2D0();
  uint64_t v6 = sub_10001C2B0();
  v5(v3, v0);
  sub_100006000(&qword_100028658);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10001CD50;
  *(void *)(v7 + 32) = v4;
  *(void *)(v7 + 40) = v6;
  uint64_t v8 = sub_10001C2A0();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_10000D564@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10001C120();
  *a1 = v3;
  return result;
}

uint64_t sub_10000D5A0()
{
  return sub_10001C130();
}

unint64_t sub_10000D5D8()
{
  unint64_t result = qword_100028800;
  if (!qword_100028800)
  {
    sub_10001C3E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028800);
  }
  return result;
}

uint64_t sub_10000D630(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006CB4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000D678()
{
  unint64_t result = qword_100028818;
  if (!qword_100028818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028818);
  }
  return result;
}

uint64_t sub_10000D6CC()
{
  uint64_t v0 = sub_10001C4C0();
  sub_100006AB0(v0, qword_100028F20);
  sub_100005FAC(v0, (uint64_t)qword_100028F20);
  return sub_10001C4A0();
}

uint64_t sub_10000D730@<X0>(uint64_t a1@<X8>)
{
  uint64_t v14 = a1;
  uint64_t v1 = sub_100006000(&qword_100028680);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v13 - v5;
  uint64_t v7 = sub_10001C4C0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_10001C4A0();
  sub_10001C4A0();
  uint64_t v9 = *(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56);
  v9(v6, 0, 1, v7);
  sub_100006000(&qword_1000286A8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10001CD50;
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  v9(v4, 0, 1, v7);
  uint64_t v10 = v14;
  sub_10001C300();
  uint64_t v11 = sub_10001C2F0();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
}

uint64_t sub_10000D9D4(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  sub_10001C4C0();
  *(void *)(v1 + 40) = swift_task_alloc();
  return _swift_task_switch(sub_10000DA64, 0, 0);
}

uint64_t sub_10000DA64()
{
  if (qword_100028310 != -1) {
    swift_once();
  }
  [*(id *)(qword_100028EB0 + 16) isAutomaticUpdateV2Enabled];
  sub_10001C4A0();
  v0[2] = sub_10001C5E0();
  v0[3] = v1;
  sub_10000E338();
  sub_10001C0D0();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

unint64_t sub_10000DB98()
{
  unint64_t result = qword_100028820;
  if (!qword_100028820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028820);
  }
  return result;
}

unint64_t sub_10000DBF0()
{
  unint64_t result = qword_100028828;
  if (!qword_100028828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028828);
  }
  return result;
}

uint64_t sub_10000DC44()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10000DC78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000DCC8@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028348 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001C4C0();
  uint64_t v3 = sub_100005FAC(v2, (uint64_t)qword_100028F20);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000DD74(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000C494;
  return sub_10000D9D4(a1);
}

uint64_t sub_10000DE0C(uint64_t a1)
{
  unint64_t v2 = sub_10000D678();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

void sub_10000DE48()
{
  qword_100028F38 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_10000DE5C()
{
  uint64_t v0 = sub_100006000(&qword_100028850);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E2E4();
  sub_10001C250();
  uint64_t v4 = sub_10001C1D0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_10001C250();
  uint64_t v6 = sub_10001C1D0();
  v5(v3, v0);
  sub_10001C250();
  uint64_t v7 = sub_10001C1D0();
  v5(v3, v0);
  sub_10001C250();
  uint64_t v8 = sub_10001C1D0();
  v5(v3, v0);
  sub_100006000(&qword_100028858);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10001D370;
  *(void *)(v9 + 32) = v4;
  *(void *)(v9 + 40) = v6;
  *(void *)(v9 + 48) = v7;
  *(void *)(v9 + 56) = v8;
  uint64_t v10 = sub_10001C1C0();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10000E0BC()
{
  uint64_t v0 = sub_10001C2C0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E2E4();
  sub_10001C2D0();
  uint64_t v4 = sub_10001C2B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006000(&qword_100028658);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001CD40;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10001C2A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10000E208()
{
  if (qword_100028350 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for GetAutomaticInstallUpdatesIntentAssistantIntentsProvider()
{
  return &type metadata for GetAutomaticInstallUpdatesIntentAssistantIntentsProvider;
}

ValueMetadata *type metadata accessor for GetAutomaticInstallUpdatesIntent()
{
  return &type metadata for GetAutomaticInstallUpdatesIntent;
}

unint64_t sub_10000E288()
{
  unint64_t result = qword_100028838;
  if (!qword_100028838)
  {
    sub_100006CB4(&qword_100028840);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028838);
  }
  return result;
}

unint64_t sub_10000E2E4()
{
  unint64_t result = qword_100028848;
  if (!qword_100028848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028848);
  }
  return result;
}

unint64_t sub_10000E338()
{
  unint64_t result = qword_100028868;
  if (!qword_100028868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028868);
  }
  return result;
}

unint64_t sub_10000E390()
{
  unint64_t result = qword_100028898;
  if (!qword_100028898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028898);
  }
  return result;
}

uint64_t sub_10000E3E4()
{
  return sub_10000D630(&qword_1000288A0, &qword_1000288A8);
}

uint64_t sub_10000E420()
{
  uint64_t v0 = sub_10001C560();
  sub_100006AB0(v0, qword_100028870);
  sub_100005FAC(v0, (uint64_t)qword_100028870);
  return sub_10001C550();
}

uint64_t sub_10000E4A0()
{
  uint64_t v0 = sub_100006000(&qword_100028680);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10001C4C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_10001C460();
  sub_100006AB0(v5, qword_100028F40);
  sub_100005FAC(v5, (uint64_t)qword_100028F40);
  sub_10001C4A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_10001C450();
}

uint64_t sub_10000E60C()
{
  uint64_t v0 = sub_10001C4C0();
  sub_100006AB0(v0, qword_100028F58);
  sub_100005FAC(v0, (uint64_t)qword_100028F58);
  return sub_10001C4A0();
}

uint64_t sub_10000E670()
{
  uint64_t v0 = sub_100006000(&qword_1000289D8);
  sub_100006AB0(v0, qword_100028F70);
  uint64_t v1 = sub_100005FAC(v0, (uint64_t)qword_100028F70);
  sub_10001C2E0();
  uint64_t v2 = sub_10001C2F0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_10000E728()
{
  uint64_t result = swift_getKeyPath();
  qword_100028F88 = result;
  return result;
}

uint64_t sub_10000E750()
{
  return swift_retain();
}

uint64_t sub_10000E758()
{
  sub_10001C120();
  return v1;
}

uint64_t sub_10000E78C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[21] = a2;
  v3[22] = a3;
  v3[20] = a1;
  sub_100006000(&qword_1000289A8);
  v3[23] = swift_task_alloc();
  sub_100006000(&qword_1000289B0);
  v3[24] = swift_task_alloc();
  sub_100006000(&qword_1000289B8);
  v3[25] = swift_task_alloc();
  uint64_t v4 = sub_10001C0A0();
  v3[26] = v4;
  v3[27] = *(void *)(v4 - 8);
  v3[28] = swift_task_alloc();
  uint64_t v5 = sub_100006000(&qword_1000289C0);
  v3[29] = v5;
  v3[30] = *(void *)(v5 - 8);
  v3[31] = swift_task_alloc();
  v3[32] = swift_task_alloc();
  return _swift_task_switch(sub_10000E950, 0, 0);
}

uint64_t sub_10000E950()
{
  sub_10001C120();
  long long v1 = *(_OWORD *)(v0 + 24);
  *(void *)(v0 + 40) = *(void *)(v0 + 16);
  *(_OWORD *)(v0 + 48) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v2;
  unint64_t v3 = sub_10000F7D8();
  *uint64_t v2 = v0;
  v2[1] = sub_10000EA34;
  uint64_t v4 = *(void *)(v0 + 256);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v4, v0 + 40, sub_10000F13C, 0, &type metadata for AutomaticInstallSecurityResponsesEntity, v3);
}

uint64_t sub_10000EA34()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000EB30, 0, 0);
}

uint64_t sub_10000EB30()
{
  sub_10001C120();
  *(void *)(v0 + 88) = *(void *)(v0 + 64);
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 80);
  *(void *)(v0 + 272) = v1;
  *(void *)(v0 + 280) = v2;
  *(void *)(v0 + 96) = v1;
  *(void *)(v0 + 104) = v2;
  sub_10001C120();
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 313);
  if (qword_100028378 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_100028F88;
  *(void *)(v0 + 288) = qword_100028F88;
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v4;
  uint64_t v5 = sub_10000D630(&qword_100028990, &qword_100028998);
  *uint64_t v4 = v0;
  v4[1] = sub_10000EC90;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 312, v3, &type metadata for Bool, v5);
}

uint64_t sub_10000EC90()
{
  *(void *)(*(void *)v1 + 304) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_10000F078;
  }
  else {
    uint64_t v2 = sub_10000EE00;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000EE00()
{
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v10 = *(void *)(v0 + 248);
  uint64_t v11 = *(void *)(v0 + 256);
  uint64_t v2 = *(void *)(v0 + 232);
  uint64_t v13 = *(void *)(v0 + 216);
  uint64_t v14 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v4 = *(void *)(v0 + 192);
  uint64_t v12 = *(void *)(v0 + 224);
  sub_10001C120();
  long long v5 = *(_OWORD *)(v0 + 144);
  *(void *)(v0 + 112) = *(void *)(v0 + 136);
  *(_OWORD *)(v0 + 120) = v5;
  uint64_t v6 = sub_10001C440();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  uint64_t v7 = sub_10001C470();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 1, 1, v7);
  sub_10000E390();
  sub_10000FE98();
  sub_10001C060();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v10, v11, v2);
  sub_10001C080();
  sub_10001C0C0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v11, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_10000F078()
{
  (*(void (**)(void, void))(v0[30] + 8))(v0[32], v0[29]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10000F140()
{
  uint64_t v0 = sub_100006000(&qword_1000289C8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100028378 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10001C340();
  swift_release();
  sub_10000FE98();
  sub_10000D630(&qword_1000289D0, &qword_1000289C8);
  sub_10001C330();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

__n128 sub_10000F2A8@<Q0>(uint64_t a1@<X8>)
{
  sub_10001C120();
  __n128 result = v4;
  *(void *)a1 = v3;
  *(__n128 *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_10000F2EC()
{
  return swift_bridgeObjectRelease();
}

void (*sub_10000F354(void *a1))(void *)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10001C110();
  return sub_10000F3B0;
}

uint64_t sub_10000F3B4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10001C120();
  *a1 = v3;
  return result;
}

uint64_t sub_10000F3F0()
{
  return sub_10001C130();
}

void (*sub_10000F428(void *a1))(void *)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_10001C110();
  return sub_10000F3B0;
}

uint64_t sub_10000F484()
{
  if (qword_100028378 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10000F4E0()
{
  return 0xD000000000000015;
}

unint64_t sub_10000F500()
{
  unint64_t result = qword_1000288B0;
  if (!qword_1000288B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000288B0);
  }
  return result;
}

unint64_t sub_10000F558()
{
  unint64_t result = qword_1000288B8;
  if (!qword_1000288B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000288B8);
  }
  return result;
}

uint64_t sub_10000F5AC()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10000F5E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000F630@<X0>(uint64_t a1@<X8>)
{
  return sub_10000FF94(&qword_100028368, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100028F58, a1);
}

uint64_t sub_10000F668@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028370 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006000(&qword_1000289D8);
  uint64_t v3 = sub_100005FAC(v2, (uint64_t)qword_100028F70);

  return sub_1000117FC(v3, a1);
}

uint64_t sub_10000F6E4(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_10000C494;
  return sub_10000E78C(a1, v5, v4);
}

uint64_t sub_10000F790@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100010E24();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10000F7B8()
{
  return 0xD000000000000042;
}

unint64_t sub_10000F7D8()
{
  unint64_t result = qword_1000288C8;
  if (!qword_1000288C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000288C8);
  }
  return result;
}

uint64_t sub_10000F82C()
{
  return sub_10000D630(&qword_1000288D0, &qword_1000288D8);
}

uint64_t sub_10000F868(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000F888, 0, 0);
}

uint64_t sub_10000F888()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  unsigned char *v1 = sub_100011268() & 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000F8F4(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_10000F918, 0, 0);
}

uint64_t sub_10000F918()
{
  sub_1000113C8(*(unsigned char *)(v0 + 16));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000F97C()
{
  uint64_t v0 = sub_100006000(&qword_1000288D8);
  sub_100006AB0(v0, qword_100028F90);
  sub_100005FAC(v0, (uint64_t)qword_100028F90);
  sub_10001179C();
  return sub_10001BF70();
}

uint64_t sub_10000F9F8(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_10001C4C0();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_10000FA88, 0, 0);
}

uint64_t sub_10000FA88()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_100006000(&qword_1000288A8);
  sub_10001C4A0();
  sub_10000D630(&qword_100028990, &qword_100028998);
  uint64_t v2 = sub_10001C490();
  void *v1 = 0xD000000000000027;
  v1[1] = 0x800000010001DBE0;
  v1[2] = v2;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10000FBB0()
{
  uint64_t v0 = qword_100028888;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10000FBEC()
{
  unint64_t result = qword_1000288E0;
  if (!qword_1000288E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000288E0);
  }
  return result;
}

unint64_t sub_10000FC44()
{
  unint64_t result = qword_1000288E8;
  if (!qword_1000288E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000288E8);
  }
  return result;
}

unint64_t sub_10000FC9C()
{
  unint64_t result = qword_1000288F0;
  if (!qword_1000288F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000288F0);
  }
  return result;
}

uint64_t sub_10000FCF0()
{
  return sub_10000D630(&qword_1000288F8, &qword_1000288D8);
}

void *sub_10000FD2C()
{
  return &protocol witness table for String;
}

uint64_t sub_10000FD38@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028380 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006000(&qword_1000288D8);
  uint64_t v3 = sub_100005FAC(v2, (uint64_t)qword_100028F90);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_10000FDE8()
{
  unint64_t result = qword_100028900;
  if (!qword_100028900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028900);
  }
  return result;
}

unint64_t sub_10000FE40()
{
  unint64_t result = qword_100028908;
  if (!qword_100028908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028908);
  }
  return result;
}

unint64_t sub_10000FE98()
{
  unint64_t result = qword_100028910;
  if (!qword_100028910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028910);
  }
  return result;
}

unint64_t sub_10000FEF0()
{
  unint64_t result = qword_100028918;
  if (!qword_100028918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028918);
  }
  return result;
}

void *sub_10000FF44()
{
  return &protocol witness table for String;
}

uint64_t sub_10000FF50@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000FF5C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000FF94(&qword_100028360, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100028F40, a1);
}

uint64_t sub_10000FF94@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100005FAC(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100010038()
{
  return sub_10000D630(&qword_100028920, &qword_100028928);
}

uint64_t sub_100010074(uint64_t a1)
{
  unint64_t v2 = sub_10000F7D8();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000100C4()
{
  unint64_t result = qword_100028930;
  if (!qword_100028930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028930);
  }
  return result;
}

uint64_t sub_100010118(uint64_t a1)
{
  unint64_t v2 = sub_10001179C();

  return UniqueAppEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_100010164(uint64_t a1)
{
  unint64_t v2 = sub_10000FEF0();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

void sub_1000101B0()
{
  qword_100028FA8 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_1000101C4()
{
  uint64_t v0 = sub_100006000(&qword_100028950);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006000(&qword_100028958);
  __chkstk_darwin(v4);
  sub_10000E390();
  sub_10001C280();
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  sub_10001C270(v10);
  swift_getKeyPath();
  sub_100009E50();
  sub_10001C1B0();
  swift_release();
  sub_10001C260();
  swift_release();
  v11._object = (void *)0x800000010001FAA0;
  v11._countAndFlagsBits = 0xD000000000000025;
  sub_10001C270(v11);
  sub_10001C290();
  uint64_t v5 = sub_10001C1D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006000(&qword_100028960);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001CD40;
  *(void *)(v6 + 32) = v5;
  uint64_t v7 = sub_10001C1C0();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_100010400()
{
  return sub_100010748();
}

uint64_t sub_100010418()
{
  uint64_t v0 = sub_10001C1F0();
  uint64_t v1 = sub_10001C1F0();
  uint64_t v2 = sub_10001C1F0();
  uint64_t v3 = sub_10001C1F0();
  sub_100006000(&qword_100028650);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001D370;
  *(void *)(v4 + 32) = v0;
  *(void *)(v4 + 40) = v1;
  *(void *)(v4 + 48) = v2;
  *(void *)(v4 + 56) = v3;
  uint64_t v5 = sub_10001C1E0();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1000104F4()
{
  uint64_t v0 = sub_100006000(&qword_100028950);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006000(&qword_100028958);
  __chkstk_darwin(v4);
  sub_10000E390();
  sub_10001C280();
  v10._object = (void *)0x800000010001FA70;
  v10._countAndFlagsBits = 0xD00000000000002CLL;
  sub_10001C270(v10);
  swift_getKeyPath();
  sub_100009E50();
  sub_10001C1B0();
  swift_release();
  sub_10001C260();
  swift_release();
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  sub_10001C270(v11);
  sub_10001C290();
  uint64_t v5 = sub_10001C1D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006000(&qword_100028960);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001CD40;
  *(void *)(v6 + 32) = v5;
  uint64_t v7 = sub_10001C1C0();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_100010730()
{
  return sub_100010748();
}

uint64_t sub_100010748()
{
  uint64_t v0 = sub_10001C240();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100009E50();
  sub_10001C1B0();
  swift_release();
  sub_10000E390();
  sub_10001C230();
  uint64_t v4 = sub_10001C220();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006000(&qword_100028660);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001CD40;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10001C210();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1000108A4()
{
  uint64_t v0 = sub_10001C1F0();
  uint64_t v1 = sub_10001C1F0();
  uint64_t v2 = sub_10001C1F0();
  uint64_t v3 = sub_10001C1F0();
  uint64_t v4 = sub_10001C1F0();
  uint64_t v5 = sub_10001C1F0();
  sub_100006000(&qword_100028650);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001CD70;
  *(void *)(v6 + 32) = v0;
  *(void *)(v6 + 40) = v1;
  *(void *)(v6 + 48) = v2;
  *(void *)(v6 + 56) = v3;
  *(void *)(v6 + 64) = v4;
  *(void *)(v6 + 72) = v5;
  uint64_t v7 = sub_10001C1E0();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1000109AC()
{
  if (qword_100028388 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for AutomaticInstallSecurityResponsesAssistantIntentsProvider()
{
  return &type metadata for AutomaticInstallSecurityResponsesAssistantIntentsProvider;
}

uint64_t destroy for AutomaticInstallSecurityResponsesEntity()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

void *_s29SoftwareUpdateSettingsIntents39AutomaticInstallSecurityResponsesEntityVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for AutomaticInstallSecurityResponsesEntity(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for AutomaticInstallSecurityResponsesEntity(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AutomaticInstallSecurityResponsesEntity(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AutomaticInstallSecurityResponsesEntity(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AutomaticInstallSecurityResponsesEntity(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AutomaticInstallSecurityResponsesEntity()
{
  return &type metadata for AutomaticInstallSecurityResponsesEntity;
}

uint64_t destroy for AutomaticInstallSecurityResponsesEntity.UpdateIntent_intentAutoValue()
{
  swift_release();

  return swift_release();
}

void *_s29SoftwareUpdateSettingsIntents39AutomaticInstallSecurityResponsesEntityV28UpdateIntent_intentAutoValueVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for AutomaticInstallSecurityResponsesEntity.UpdateIntent_intentAutoValue(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for AutomaticInstallSecurityResponsesEntity.UpdateIntent_intentAutoValue(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for AutomaticInstallSecurityResponsesEntity.UpdateIntent_intentAutoValue(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AutomaticInstallSecurityResponsesEntity.UpdateIntent_intentAutoValue(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AutomaticInstallSecurityResponsesEntity.UpdateIntent_intentAutoValue(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AutomaticInstallSecurityResponsesEntity.UpdateIntent_intentAutoValue()
{
  return &type metadata for AutomaticInstallSecurityResponsesEntity.UpdateIntent_intentAutoValue;
}

uint64_t sub_100010DAC()
{
  return sub_10000D630(&qword_100028938, &qword_100028940);
}

uint64_t sub_100010DE8()
{
  return sub_10000D630(&qword_100028948, &qword_100028940);
}

uint64_t sub_100010E24()
{
  uint64_t v0 = sub_100006000(&qword_1000287E0);
  __chkstk_darwin(v0 - 8);
  uint64_t v29 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_10001C410();
  uint64_t v2 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006000(&qword_100028678);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  Swift::String v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100006000(&qword_100028680);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v13;
  uint64_t v14 = sub_10001C4C0();
  uint64_t v28 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v23 = sub_100006000(&qword_100028968);
  sub_10001C4A0();
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v27(v13, 1, 1, v14);
  uint64_t v16 = sub_10001C0A0();
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v31 = 0;
  Swift::String v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v26 = enum case for InputConnectionBehavior.default(_:);
  uint64_t v18 = *(void (**)(void))(v2 + 104);
  uint64_t v24 = v2 + 104;
  uint64_t v25 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10000F7D8();
  os_log_type_t v19 = v22;
  uint64_t v23 = sub_10001C150();
  sub_100006000(&qword_1000287E8);
  sub_10001C4A0();
  v27(v19, 1, 1, v28);
  LOBYTE(v31) = 2;
  uint64_t v20 = sub_10001C630();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v29, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v25(v4, v26, v30);
  sub_10001C160();
  return v23;
}

id sub_100011268()
{
  if (qword_100028310 != -1) {
    swift_once();
  }
  id v0 = [*(id *)(qword_100028EB0 + 16) autoInstallSecurityResponse];
  if (qword_100028358 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10001C560();
  sub_100005FAC(v1, (uint64_t)qword_100028870);
  uint64_t v2 = sub_10001C540();
  os_log_type_t v3 = sub_10001C660();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67109120;
    sub_10001C6C0();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Intent getting the value of the Automatic Security Response Install: %{BOOL}d", v4, 8u);
    swift_slowDealloc();
  }

  return v0;
}

id sub_1000113C8(char a1)
{
  if (qword_100028358 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001C560();
  sub_100005FAC(v2, (uint64_t)qword_100028870);
  os_log_type_t v3 = sub_10001C540();
  os_log_type_t v4 = sub_10001C660();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 67109120;
    sub_10001C6C0();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Intent setting the value of the Automatic Security Response Install to: %{BOOL}d", v5, 8u);
    swift_slowDealloc();
  }

  if (qword_100028310 != -1) {
    swift_once();
  }
  uint64_t v6 = *(void **)(qword_100028EB0 + 16);
  uint64_t v7 = a1 & 1;
  [v6 enableAutoInstallSecurityResponse:v7];
  return [v6 enablePreviousUserSpecifiedAutoInstallSecurityResponse:v7];
}

uint64_t sub_100011548()
{
  uint64_t v0 = sub_10001C2C0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  os_log_type_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100010E24();
  uint64_t v13 = v4;
  sub_10000E390();
  sub_10001C2D0();
  uint64_t v5 = sub_10001C2B0();
  uint64_t v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  uint64_t v12 = sub_100010E24();
  uint64_t v13 = v7;
  sub_10001C2D0();
  uint64_t v8 = sub_10001C2B0();
  v6(v3, v0);
  sub_100006000(&qword_100028658);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10001CD50;
  *(void *)(v9 + 32) = v5;
  *(void *)(v9 + 40) = v8;
  uint64_t v10 = sub_10001C2A0();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100011728@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10001C120();
  *a1 = v3;
  return result;
}

uint64_t sub_100011764()
{
  return sub_10001C130();
}

unint64_t sub_10001179C()
{
  unint64_t result = qword_100028970;
  if (!qword_100028970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028970);
  }
  return result;
}

uint64_t sub_1000117F0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 16);
  return swift_retain();
}

uint64_t sub_1000117FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006000(&qword_1000289D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100011864()
{
  uint64_t v0 = sub_10001C560();
  sub_100006AB0(v0, qword_1000289E0);
  sub_100005FAC(v0, (uint64_t)qword_1000289E0);
  return sub_10001C550();
}

uint64_t sub_1000118E4()
{
  uint64_t v0 = sub_10001C4C0();
  sub_100006AB0(v0, qword_100028FB0);
  sub_100005FAC(v0, (uint64_t)qword_100028FB0);
  return sub_10001C4A0();
}

uint64_t sub_100011948@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100006000(&qword_100028680);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v13 - v6;
  uint64_t v8 = sub_10001C4C0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_10001C4A0();
  sub_10001C4A0();
  uint64_t v10 = *(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56);
  v10(v7, 0, 1, v8);
  sub_100006000(&qword_1000286A8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10001CD40;
  sub_10001C4A0();
  sub_10001C4A0();
  v10(v5, 0, 1, v8);
  sub_10001C300();
  uint64_t v11 = sub_10001C2F0();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(a1, 0, 1, v11);
}

uint64_t sub_100011BC8(uint64_t a1)
{
  v1[10] = a1;
  sub_100006000(&qword_100028AC8);
  v1[11] = swift_task_alloc();
  uint64_t v2 = sub_10001C0F0();
  v1[12] = v2;
  v1[13] = *(void *)(v2 - 8);
  v1[14] = swift_task_alloc();
  uint64_t v3 = sub_10001C560();
  v1[15] = v3;
  v1[16] = *(void *)(v3 - 8);
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  return _swift_task_switch(sub_100011D24, 0, 0);
}

uint64_t sub_100011D24()
{
  uint64_t v20 = v0;
  if (qword_100028390 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v4 = sub_100005FAC(v2, (uint64_t)qword_1000289E0);
  v0[19] = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[20] = v5;
  v0[21] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v2);
  uint64_t v6 = sub_10001C540();
  os_log_type_t v7 = sub_10001C670();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[18];
  uint64_t v10 = v0[15];
  uint64_t v11 = v0[16];
  if (v8)
  {
    uint64_t v18 = v0[18];
    uint64_t v12 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315650;
    v0[6] = &type metadata for OpenSoftwareUpdateBetaProgramIntent;
    sub_100006000(&qword_100028AE0);
    uint64_t v13 = sub_10001C5F0();
    v0[7] = sub_100006288(v13, v14, &v19);
    sub_10001C6C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    v0[8] = sub_100006288(0x286D726F66726570, 0xE900000000000029, &v19);
    sub_10001C6C0();
    *(_WORD *)(v12 + 22) = 2048;
    v0[9] = 49;
    sub_10001C6C0();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "🐞 %s | %s | line:%ld => start to refreshBetaUpdates", (uint8_t *)v12, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v15(v18, v10);
  }
  else
  {

    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v15(v9, v10);
  }
  v0[22] = v15;
  if (qword_100028310 != -1) {
    swift_once();
  }
  uint64_t v16 = (void *)swift_task_alloc();
  v0[23] = v16;
  void *v16 = v0;
  v16[1] = sub_10001203C;
  return sub_1000040A4();
}

uint64_t sub_10001203C(void *a1)
{
  swift_task_dealloc();

  return _swift_task_switch(sub_100012140, 0, 0);
}

uint64_t sub_100012140()
{
  uint64_t v20 = v0;
  (*(void (**)(void, void, void))(v0 + 160))(*(void *)(v0 + 136), *(void *)(v0 + 152), *(void *)(v0 + 120));
  uint64_t v1 = sub_10001C540();
  os_log_type_t v2 = sub_10001C670();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v17 = *(void *)(v0 + 136);
    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v0 + 176);
    uint64_t v16 = *(void *)(v0 + 120);
    uint64_t v3 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315650;
    *(void *)(v0 + 16) = &type metadata for OpenSoftwareUpdateBetaProgramIntent;
    sub_100006000(&qword_100028AE0);
    uint64_t v4 = sub_10001C5F0();
    *(void *)(v0 + 24) = sub_100006288(v4, v5, &v19);
    sub_10001C6C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2080;
    *(void *)(v0 + 32) = sub_100006288(0x286D726F66726570, 0xE900000000000029, &v19);
    sub_10001C6C0();
    *(_WORD *)(v3 + 22) = 2048;
    *(void *)(v0 + 40) = 51;
    sub_10001C6C0();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "🐞 %s | %s | line:%ld => finish to refreshBetaUpdates", (uint8_t *)v3, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v18(v17, v16);
  }
  else
  {
    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v0 + 176);
    uint64_t v7 = *(void *)(v0 + 136);
    uint64_t v8 = *(void *)(v0 + 120);

    v6(v7, v8);
  }
  uint64_t v9 = *(void *)(v0 + 88);
  sub_100014090();
  sub_10001C310();
  uint64_t v10 = sub_10001C4E0();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 1, v10);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 104);
    uint64_t v12 = *(void *)(v0 + 112);
    uint64_t v14 = *(void *)(v0 + 96);
    sub_10001C100();
    sub_1000140E4();
    sub_10001C0B0();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
    return v15();
  }
  return result;
}

uint64_t sub_100012474()
{
  uint64_t v0 = sub_100006000(&qword_100028B00);
  sub_100006AB0(v0, qword_100028FC8);
  sub_100005FAC(v0, (uint64_t)qword_100028FC8);
  sub_100006000(&qword_100028B08);
  sub_100006000(&qword_100028B10);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10001CD40;
  sub_100012B68();
  sub_10001C3A0();
  sub_1000166F8(v1);
  return sub_10001C3B0();
}

uint64_t sub_1000125AC()
{
  uint64_t v0 = sub_100006000(&qword_100028680);
  __chkstk_darwin(v0 - 8);
  os_log_type_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10001C4C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_10001C460();
  sub_100006AB0(v5, qword_100028FE0);
  sub_100005FAC(v5, (uint64_t)qword_100028FE0);
  sub_10001C4A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_10001C450();
}

unint64_t sub_10001271C()
{
  uint64_t v0 = sub_100006000(&qword_1000286B0);
  __chkstk_darwin(v0 - 8);
  os_log_type_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006000(&qword_100028680);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001C4C0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  sub_100006000(&qword_100028AF0);
  sub_100006000(&qword_100028AF8);
  uint64_t v9 = swift_allocObject();
  long long v12 = xmmword_10001CD40;
  *(_OWORD *)(v9 + 16) = xmmword_10001CD40;
  sub_10001C4A0();
  sub_10001C4A0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_10001C360();
  uint64_t v10 = sub_10001C370();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v2, 0, 1, v10);
  sub_100006000(&qword_1000286A8);
  *(_OWORD *)(swift_allocObject() + 16) = v12;
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C380();
  unint64_t result = sub_10001671C(v9);
  qword_100028FF8 = result;
  return result;
}

unint64_t sub_100012A88()
{
  unint64_t result = qword_1000289F8;
  if (!qword_1000289F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000289F8);
  }
  return result;
}

uint64_t sub_100012AE8@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100025040;
  v7._object = v3;
  Swift::Int v5 = sub_10001C760(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_100012B3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100013D90();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100012B68()
{
  unint64_t result = qword_100028A00;
  if (!qword_100028A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A00);
  }
  return result;
}

unint64_t sub_100012BC0()
{
  unint64_t result = qword_100028A08;
  if (!qword_100028A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A08);
  }
  return result;
}

uint64_t sub_100012C14@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000283A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006000(&qword_100028B00);
  uint64_t v3 = sub_100005FAC(v2, (uint64_t)qword_100028FC8);
  Swift::OpaquePointer v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100012CC4()
{
  unint64_t result = qword_100028A10;
  if (!qword_100028A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A10);
  }
  return result;
}

unint64_t sub_100012D1C()
{
  unint64_t result = qword_100028A18;
  if (!qword_100028A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A18);
  }
  return result;
}

unint64_t sub_100012D74()
{
  unint64_t result = qword_100028A20;
  if (!qword_100028A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A20);
  }
  return result;
}

uint64_t sub_100012DC8()
{
  sub_100014090();
  uint64_t v2 = sub_10001C320();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100009DAC(v3, v0, v2, v1);
}

unint64_t sub_100012E60()
{
  unint64_t result = qword_100028A30;
  if (!qword_100028A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A30);
  }
  return result;
}

unint64_t sub_100012EB8()
{
  unint64_t result = qword_100028A38;
  if (!qword_100028A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A38);
  }
  return result;
}

unint64_t sub_100012F10()
{
  unint64_t result = qword_100028A40;
  if (!qword_100028A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A40);
  }
  return result;
}

unint64_t sub_100012F68()
{
  unint64_t result = qword_100028A48;
  if (!qword_100028A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A48);
  }
  return result;
}

uint64_t sub_100012FBC@<X0>(uint64_t a1@<X8>)
{
  return sub_100008B0C(&qword_1000283A8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100028FE0, a1);
}

uint64_t sub_100012FF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000134D8(a1, a2, a3, (void (*)(void))sub_100012B68);
}

uint64_t sub_100013020(uint64_t a1)
{
  unint64_t v2 = sub_100012B68();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100013070()
{
  unint64_t result = qword_100028A50;
  if (!qword_100028A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A50);
  }
  return result;
}

unint64_t sub_1000130C8()
{
  unint64_t result = qword_100028A58;
  if (!qword_100028A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A58);
  }
  return result;
}

unint64_t sub_100013120()
{
  unint64_t result = qword_100028A60;
  if (!qword_100028A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A60);
  }
  return result;
}

uint64_t sub_100013174()
{
  if (qword_1000283B0 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000131D0(uint64_t a1)
{
  unint64_t v2 = sub_100012F68();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10001321C()
{
  return sub_10000D630(&qword_100028A68, &qword_100028A70);
}

void sub_100013258(void *a1@<X8>)
{
  *a1 = &off_100025078;
}

unint64_t sub_10001326C()
{
  unint64_t result = qword_100028A78;
  if (!qword_100028A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A78);
  }
  return result;
}

uint64_t sub_1000132C0()
{
  return sub_10001C120();
}

uint64_t sub_1000132E4()
{
  return sub_10001C130();
}

unint64_t sub_10001330C()
{
  unint64_t result = qword_100028A80;
  if (!qword_100028A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A80);
  }
  return result;
}

uint64_t sub_100013360(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10001413C();
  unint64_t v5 = sub_100014090();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_1000133CC()
{
  unint64_t result = qword_100028A88;
  if (!qword_100028A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A88);
  }
  return result;
}

unint64_t sub_100013424()
{
  unint64_t result = qword_100028A90;
  if (!qword_100028A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028A90);
  }
  return result;
}

uint64_t sub_100013478()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_1000134AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000134D8(a1, a2, a3, (void (*)(void))sub_10001330C);
}

uint64_t sub_1000134D8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100013520@<X0>(uint64_t a1@<X8>)
{
  return sub_100008B0C(&qword_100028398, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100028FB0, a1);
}

uint64_t sub_10001355C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000C494;
  return sub_100011BC8(a1);
}

uint64_t sub_1000135F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100013DA0();
  *a1 = result;
  return result;
}

uint64_t sub_10001361C(uint64_t a1)
{
  unint64_t v2 = sub_10001330C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100013658()
{
  uint64_t v0 = sub_100006000(&qword_100028AA8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001330C();
  sub_10001C250();
  uint64_t v14 = sub_10001C1D0();
  unint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_10001C250();
  uint64_t v13 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v5 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v6 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v7 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v8 = sub_10001C1D0();
  v4(v3, v0);
  sub_100006000(&qword_100028AB0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10001CD70;
  uint64_t v10 = v13;
  *(void *)(v9 + 32) = v14;
  *(void *)(v9 + 40) = v10;
  *(void *)(v9 + 48) = v5;
  *(void *)(v9 + 56) = v6;
  *(void *)(v9 + 64) = v7;
  *(void *)(v9 + 72) = v8;
  uint64_t v11 = sub_10001C1C0();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100013978()
{
  uint64_t v0 = sub_10001C2C0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_100013DA0();
  sub_10001330C();
  sub_10001C2D0();
  uint64_t v4 = sub_10001C2B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006000(&qword_100028658);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001CD40;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10001C2A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100013AD4()
{
  uint64_t v0 = sub_10001C1A0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001330C();
  sub_10001C190();
  uint64_t v4 = sub_10001C180();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006000(&qword_100028648);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001CD40;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10001C170();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for OpenSoftwareUpdateBetaProgramIntentAssistantIntentsProvider()
{
  return &type metadata for OpenSoftwareUpdateBetaProgramIntentAssistantIntentsProvider;
}

ValueMetadata *type metadata accessor for OpenSoftwareUpdateBetaProgramIntent()
{
  return &type metadata for OpenSoftwareUpdateBetaProgramIntent;
}

uint64_t getEnumTagSinglePayload for OpenSoftwareUpdateBetaProgramIntent.SoftwareUpdateBetaProgramDeepLinkEntity(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for OpenSoftwareUpdateBetaProgramIntent.SoftwareUpdateBetaProgramDeepLinkEntity(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100013D1CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenSoftwareUpdateBetaProgramIntent.SoftwareUpdateBetaProgramDeepLinkEntity()
{
  return &type metadata for OpenSoftwareUpdateBetaProgramIntent.SoftwareUpdateBetaProgramDeepLinkEntity;
}

uint64_t sub_100013D54()
{
  return sub_10000D630(&qword_100028AA0, &qword_1000287C0);
}

uint64_t sub_100013D90()
{
  return 1635018082;
}

uint64_t sub_100013DA0()
{
  uint64_t v17 = sub_10001C410();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  int v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006000(&qword_100028678);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100006000(&qword_100028680);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10001C4C0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100006000(&qword_100028AB8);
  sub_10001C4A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 1;
  uint64_t v14 = sub_10001C0A0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_100012B68();
  return sub_10001C140();
}

unint64_t sub_100014090()
{
  unint64_t result = qword_100028AD0;
  if (!qword_100028AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028AD0);
  }
  return result;
}

unint64_t sub_1000140E4()
{
  unint64_t result = qword_100028AD8;
  if (!qword_100028AD8)
  {
    sub_10001C0F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028AD8);
  }
  return result;
}

unint64_t sub_10001413C()
{
  unint64_t result = qword_100028AE8;
  if (!qword_100028AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028AE8);
  }
  return result;
}

uint64_t sub_100014190()
{
  uint64_t v0 = sub_10001C560();
  sub_100006AB0(v0, qword_100028B18);
  sub_100005FAC(v0, (uint64_t)qword_100028B18);
  return sub_10001C550();
}

uint64_t sub_100014220()
{
  uint64_t v0 = sub_10001C4C0();
  sub_100006AB0(v0, qword_100029000);
  sub_100005FAC(v0, (uint64_t)qword_100029000);
  return sub_10001C4A0();
}

uint64_t sub_100014284@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100006000(&qword_100028680);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v13 - v6;
  uint64_t v8 = sub_10001C4C0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_10001C4A0();
  sub_10001C4A0();
  uint64_t v10 = *(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56);
  v10(v7, 0, 1, v8);
  sub_100006000(&qword_1000286A8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10001CD50;
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  v10(v5, 0, 1, v8);
  sub_10001C300();
  uint64_t v11 = sub_10001C2F0();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(a1, 0, 1, v11);
}

unint64_t sub_100014528()
{
  unint64_t result = qword_100028B30;
  if (!qword_100028B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028B30);
  }
  return result;
}

unint64_t sub_100014580()
{
  unint64_t result = qword_100028B38;
  if (!qword_100028B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028B38);
  }
  return result;
}

uint64_t sub_1000145D4()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100014608()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100014658@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000283C0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001C4C0();
  uint64_t v3 = sub_100005FAC(v2, (uint64_t)qword_100029000);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100014704(uint64_t a1)
{
  *(void *)(v1 + 32) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100028B48 + dword_100028B48);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 40) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1000147A8;
  return v4();
}

uint64_t sub_1000147A8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  uint64_t v7 = *v3;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v8 = *(uint64_t (**)(void))(v7 + 8);
    return v8();
  }
  else
  {
    *(void *)(v6 + 48) = a2;
    *(void *)(v6 + 56) = a1;
    return _swift_task_switch(sub_100014904, 0, 0);
  }
}

uint64_t sub_100014904()
{
  uint64_t v1 = v0[6];
  v0[2] = v0[7];
  v0[3] = v1;
  sub_10000E338();
  sub_10001C0D0();
  swift_bridgeObjectRelease();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_1000149A0(uint64_t a1)
{
  unint64_t v2 = sub_10000E2E4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

void sub_1000149DC()
{
  qword_100029018 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_1000149F0()
{
  uint64_t v0 = sub_100006000(&qword_100028850);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E2E4();
  sub_10001C250();
  uint64_t v25 = sub_10001C1D0();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_10001C250();
  uint64_t v24 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v23 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v22 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v21 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v20 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v19 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v18 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v17 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v5 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v6 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v7 = sub_10001C1D0();
  v4(v3, v0);
  sub_10001C250();
  uint64_t v8 = sub_10001C1D0();
  v4(v3, v0);
  sub_100006000(&qword_100028858);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10001E210;
  uint64_t v10 = v24;
  *(void *)(v9 + 32) = v25;
  *(void *)(v9 + 40) = v10;
  uint64_t v11 = v22;
  *(void *)(v9 + 48) = v23;
  *(void *)(v9 + 56) = v11;
  uint64_t v12 = v20;
  *(void *)(v9 + 64) = v21;
  *(void *)(v9 + 72) = v12;
  uint64_t v13 = v18;
  *(void *)(v9 + 80) = v19;
  *(void *)(v9 + 88) = v13;
  *(void *)(v9 + 96) = v17;
  *(void *)(v9 + 104) = v5;
  *(void *)(v9 + 112) = v6;
  *(void *)(v9 + 120) = v7;
  *(void *)(v9 + 128) = v8;
  uint64_t v14 = sub_10001C1C0();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_100014F34()
{
  uint64_t v0 = sub_10001C2C0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E2E4();
  sub_10001C2D0();
  uint64_t v4 = sub_10001C2B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006000(&qword_100028658);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001CD40;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10001C2A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100015080()
{
  if (qword_1000283C8 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000150E0()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for SoftwareUpdateAvailableEntityError()
{
  return sub_1000150F8();
}

uint64_t sub_1000150F8()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s29SoftwareUpdateSettingsIntents34SoftwareUpdateAvailableEntityErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_1000150E0();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SoftwareUpdateAvailableEntityError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_1000150E0();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_1000150F8();
  return a1;
}

uint64_t assignWithTake for SoftwareUpdateAvailableEntityError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_1000150F8();
  return a1;
}

uint64_t getEnumTagSinglePayload for SoftwareUpdateAvailableEntityError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SoftwareUpdateAvailableEntityError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100015278(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_100015280(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SoftwareUpdateAvailableEntityError()
{
  return &type metadata for SoftwareUpdateAvailableEntityError;
}

ValueMetadata *type metadata accessor for SoftwareUpdateAvailableIntentAssistantIntentsProvider()
{
  return &type metadata for SoftwareUpdateAvailableIntentAssistantIntentsProvider;
}

ValueMetadata *type metadata accessor for SoftwareUpdateAvailableIntent()
{
  return &type metadata for SoftwareUpdateAvailableIntent;
}

uint64_t sub_1000152C0()
{
  sub_10001C4C0();
  *(void *)(v0 + 48) = swift_task_alloc();
  return _swift_task_switch(sub_10001534C, 0, 0);
}

uint64_t sub_10001534C()
{
  if (qword_1000283B8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10001C560();
  *(void *)(v0 + 56) = sub_100005FAC(v1, (uint64_t)qword_100028B18);
  uint64_t v2 = sub_10001C540();
  os_log_type_t v3 = sub_10001C660();
  if (os_log_type_enabled(v2, v3))
  {
    int v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Resolving an intent to check for the latest Software Update", v4, 2u);
    swift_slowDealloc();
  }

  if (qword_100028310 != -1) {
    swift_once();
  }
  char v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  *char v5 = v0;
  v5[1] = sub_1000154D0;
  return sub_1000052F0();
}

uint64_t sub_1000154D0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = *v4;
  uint64_t v6 = *v4;
  *(void *)(v5 + 72) = a1;
  *(void *)(v5 + 80) = a2;
  *(unsigned char *)(v5 + 33) = a3;
  swift_task_dealloc();
  if (v3)
  {
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v6 + 8);
    return v7();
  }
  else
  {
    return _swift_task_switch(sub_100015624, 0, 0);
  }
}

uint64_t sub_100015624()
{
  uint64_t v113 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 72);
  uint64_t v3 = *(void **)(v0 + 80);
  char v4 = *(unsigned char *)(v0 + 33);
  sub_1000160E4(v2, v3, v4);
  sub_1000160E4(v2, v3, v4);
  uint64_t v5 = sub_10001C540();
  os_log_type_t v6 = sub_10001C660();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v8 = *(void **)(v0 + 72);
    uint64_t v7 = *(void **)(v0 + 80);
    char v9 = *(unsigned char *)(v0 + 33);
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v0 + 16) = v8;
    uint64_t v111 = v11;
    *(void *)(v0 + 24) = v7;
    *(unsigned char *)(v0 + 32) = v9;
    sub_1000160E4(v8, v7, v9);
    sub_100006000(&qword_100028540);
    uint64_t v12 = sub_10001C5F0();
    *(void *)(v0 + 40) = sub_100006288(v12, v13, &v111);
    sub_10001C6C0();
    swift_bridgeObjectRelease();
    sub_1000160F8(v8, v7, v9);
    sub_1000160F8(v8, v7, v9);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Finished to scan for update with results: %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v14 = *(void **)(v0 + 72);
    uint64_t v15 = *(void **)(v0 + 80);
    char v16 = *(unsigned char *)(v1 + 33);
    sub_1000160F8(*(void **)(v1 + 72), *(void **)(v1 + 80), v16);
    sub_1000160F8(v14, v15, v16);
  }

  switch(*(unsigned char *)(v1 + 33))
  {
    case 0:
      uint64_t v18 = *(void **)(v1 + 72);
      uint64_t v17 = *(void **)(v1 + 80);
      sub_100006E44(v18, v17, 0);
      sub_100006E44(v18, v17, 0);
      id v19 = [v18 humanReadableUpdateName];
      uint64_t v21 = *(void **)(v1 + 72);
      uint64_t v20 = *(void **)(v1 + 80);
      if (v19)
      {
        uint64_t v22 = v19;
        uint64_t v23 = sub_10001C5C0();
        uint64_t v25 = v24;

        v115._countAndFlagsBits = 0xD00000000000002BLL;
        v115._object = (void *)0x8000000100020290;
        sub_10001C520(v115);
        sub_100006000(&qword_100028B58);
        uint64_t v26 = swift_allocObject();
        *(_OWORD *)(v26 + 16) = xmmword_10001CD40;
        *(void *)(v26 + 56) = &type metadata for String;
        *(void *)(v26 + 64) = sub_100016160();
        *(void *)(v26 + 32) = v23;
        *(void *)(v26 + 40) = v25;
        uint64_t v27 = sub_10001C5D0();
        uint64_t v29 = v28;
        swift_bridgeObjectRelease();
        sub_1000160F8(v21, v20, 0);
        sub_1000160F8(v21, v20, 0);
        sub_100006EA8(v21, v20, 0);
        goto LABEL_16;
      }
      uint64_t v111 = 0;
      unint64_t v112 = 0xE000000000000000;
      sub_10001C700(58);
      v119._object = (void *)0x8000000100020170;
      v119._countAndFlagsBits = 0xD000000000000038;
      sub_10001C610(v119);
      sub_100006E44(v21, v20, 0);
      id v74 = [v18 description];
      uint64_t v75 = sub_10001C5C0();
      uint64_t v77 = v76;

      sub_1000160F8(v21, v20, 0);
      v120._countAndFlagsBits = v75;
      v120._object = v77;
      sub_10001C610(v120);
      swift_bridgeObjectRelease();
      uint64_t v79 = v111;
      unint64_t v78 = v112;
      sub_10001610C();
      swift_allocError();
      *(void *)uint64_t v80 = v79;
      *(void *)(v80 + 8) = v78;
      *(unsigned char *)(v80 + 16) = 0;
      swift_willThrow();
      sub_1000160F8(v21, v20, 0);
      sub_1000160F8(v21, v20, 0);
      uint64_t v81 = v21;
      uint64_t v82 = v20;
      char v83 = 0;
      goto LABEL_23;
    case 1:
      uint64_t v35 = *(void **)(v1 + 72);
      uint64_t v34 = *(void **)(v1 + 80);
      sub_1000160E4(v35, v34, 1);
      id v36 = v35;
      id v37 = v34;
      id v38 = [v36 humanReadableUpdateName];
      if (!v38) {
        goto LABEL_25;
      }
      uint64_t v39 = v38;
      uint64_t v40 = sub_10001C5C0();
      uint64_t v42 = v41;

      id v43 = [v37 humanReadableUpdateName];
      if (v43)
      {
        uint64_t v44 = v43;
        v109 = *(void **)(v1 + 72);
        v110 = *(void **)(v1 + 80);
        uint64_t v108 = sub_10001C5C0();
        uint64_t v46 = v45;

        v116._countAndFlagsBits = 0xD00000000000002CLL;
        v116._object = (void *)0x8000000100020260;
        sub_10001C520(v116);
        sub_100006000(&qword_100028B58);
        uint64_t v47 = swift_allocObject();
        *(_OWORD *)(v47 + 16) = xmmword_10001CD50;
        *(void *)(v47 + 56) = &type metadata for String;
        unint64_t v48 = sub_100016160();
        *(void *)(v47 + 32) = v40;
        *(void *)(v47 + 40) = v42;
        *(void *)(v47 + 96) = &type metadata for String;
        *(void *)(v47 + 104) = v48;
        *(void *)(v47 + 64) = v48;
        *(void *)(v47 + 72) = v108;
        *(void *)(v47 + 80) = v46;
        uint64_t v27 = sub_10001C5D0();
        uint64_t v29 = v49;
        swift_bridgeObjectRelease();

        sub_1000160F8(v109, v110, 1);
        v50 = v109;
        os_log_type_t v51 = v110;
        char v52 = 1;
LABEL_15:
        sub_1000160F8(v50, v51, v52);
        goto LABEL_16;
      }
      swift_bridgeObjectRelease();
LABEL_25:
      v93 = *(void **)(v1 + 72);
      uint64_t v92 = *(void **)(v1 + 80);
      uint64_t v111 = 0;
      unint64_t v112 = 0xE000000000000000;
      sub_10001C700(76);
      v123._countAndFlagsBits = 0xD00000000000003CLL;
      v123._object = (void *)0x8000000100020220;
      sub_10001C610(v123);
      id v94 = v36;
      id v95 = [v94 description];
      uint64_t v96 = sub_10001C5C0();
      id v98 = v97;

      v124._countAndFlagsBits = v96;
      v124._object = v98;
      sub_10001C610(v124);
      swift_bridgeObjectRelease();
      v125._countAndFlagsBits = 0x616E7265746C410ALL;
      v125._object = (void *)0xEC000000203A6574;
      sub_10001C610(v125);
      id v99 = v37;
      id v100 = [v99 description];
      uint64_t v101 = sub_10001C5C0();
      uint64_t v103 = v102;

      v126._countAndFlagsBits = v101;
      v126._object = v103;
      sub_10001C610(v126);
      swift_bridgeObjectRelease();
      uint64_t v105 = v111;
      unint64_t v104 = v112;
      sub_10001610C();
      swift_allocError();
      *(void *)uint64_t v106 = v105;
      *(void *)(v106 + 8) = v104;
      *(unsigned char *)(v106 + 16) = 0;
      swift_willThrow();

      sub_1000160F8(v93, v92, 1);
      sub_1000160F8(v93, v92, 1);
      goto LABEL_26;
    case 2:
      uint64_t v54 = *(void **)(v1 + 72);
      uint64_t v53 = *(void **)(v1 + 80);
      sub_100006E44(v54, v53, 2);
      sub_100006E44(v54, v53, 2);
      id v55 = [v54 humanReadableUpdateName];
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = sub_10001C5C0();
        uint64_t v59 = v58;

        uint64_t v60 = sub_100006CFC();
        uint64_t v63 = *(void **)(v1 + 72);
        uint64_t v62 = *(void **)(v1 + 80);
        if (v61)
        {
          uint64_t v64 = v60;
          uint64_t v65 = v61;
          v117._object = (void *)0x80000001000201E0;
          v117._countAndFlagsBits = 0xD000000000000038;
          sub_10001C530(v117);
          sub_100006000(&qword_100028B58);
          uint64_t v66 = swift_allocObject();
          *(_OWORD *)(v66 + 16) = xmmword_10001CD50;
          *(void *)(v66 + 56) = &type metadata for String;
          unint64_t v67 = sub_100016160();
          *(void *)(v66 + 32) = v64;
          *(void *)(v66 + 40) = v65;
          *(void *)(v66 + 96) = &type metadata for String;
          *(void *)(v66 + 104) = v67;
          *(void *)(v66 + 64) = v67;
          *(void *)(v66 + 72) = v57;
          *(void *)(v66 + 80) = v59;
          uint64_t v27 = sub_10001C5D0();
          uint64_t v29 = v68;
          swift_bridgeObjectRelease();
          sub_1000160F8(v63, v62, 2);
          sub_1000160F8(v63, v62, 2);
          sub_100006EA8(v63, v62, 2);
LABEL_16:
          swift_task_dealloc();
          os_log_type_t v72 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8);
          return v72(v27, v29);
        }
        swift_bridgeObjectRelease();
        sub_10001610C();
        swift_allocError();
        *(void *)uint64_t v91 = 0xD000000000000028;
        *(void *)(v91 + 8) = 0x80000001000201B0;
        *(unsigned char *)(v91 + 16) = 1;
      }
      else
      {
        uint64_t v63 = *(void **)(v1 + 72);
        uint64_t v62 = *(void **)(v1 + 80);
        uint64_t v111 = 0;
        unint64_t v112 = 0xE000000000000000;
        sub_10001C700(58);
        v121._object = (void *)0x8000000100020170;
        v121._countAndFlagsBits = 0xD000000000000038;
        sub_10001C610(v121);
        sub_100006E44(v63, v62, 2);
        id v84 = [v54 description];
        uint64_t v85 = sub_10001C5C0();
        v87 = v86;

        sub_1000160F8(v63, v62, 2);
        v122._countAndFlagsBits = v85;
        v122._object = v87;
        sub_10001C610(v122);
        swift_bridgeObjectRelease();
        uint64_t v89 = v111;
        unint64_t v88 = v112;
        sub_10001610C();
        swift_allocError();
        *(void *)uint64_t v90 = v89;
        *(void *)(v90 + 8) = v88;
        *(unsigned char *)(v90 + 16) = 0;
      }
      swift_willThrow();
      sub_1000160F8(v63, v62, 2);
      sub_1000160F8(v63, v62, 2);
      uint64_t v81 = v63;
      uint64_t v82 = v62;
      char v83 = 2;
LABEL_23:
      sub_100006EA8(v81, v82, v83);
LABEL_26:
      swift_task_dealloc();
      uint64_t v107 = *(uint64_t (**)(void))(v1 + 8);
      return v107();
    case 3:
      uint64_t v69 = *(void **)(v1 + 72);
      v70 = *(void **)(v1 + 80);
      v118._countAndFlagsBits = 0xD000000000000035;
      v118._object = (void *)0x80000001000202C0;
      uint64_t v27 = sub_10001C520(v118);
      uint64_t v29 = v71;
      v50 = v69;
      os_log_type_t v51 = v70;
      char v52 = 3;
      goto LABEL_15;
    default:
      sub_10001C4A0();
      uint64_t v30 = sub_10001C5E0();
      uint64_t v32 = v31;
      sub_10001610C();
      swift_allocError();
      *(void *)uint64_t v33 = v30;
      *(void *)(v33 + 8) = v32;
      *(unsigned char *)(v33 + 16) = 0;
      swift_willThrow();
      goto LABEL_26;
  }
}

id sub_1000160E4(id result, void *a2, char a3)
{
  if (a3 != -1) {
    return sub_100006E44(result, a2, a3);
  }
  return result;
}

void sub_1000160F8(void *a1, void *a2, char a3)
{
  if (a3 != -1) {
    sub_100006EA8(a1, a2, a3);
  }
}

unint64_t sub_10001610C()
{
  unint64_t result = qword_100028B50;
  if (!qword_100028B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028B50);
  }
  return result;
}

unint64_t sub_100016160()
{
  unint64_t result = qword_100028B60;
  if (!qword_100028B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028B60);
  }
  return result;
}

unint64_t sub_1000161B8()
{
  unint64_t result = qword_100028B68;
  if (!qword_100028B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028B68);
  }
  return result;
}

unint64_t sub_100016210()
{
  unint64_t result = qword_100028B70;
  if (!qword_100028B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028B70);
  }
  return result;
}

uint64_t sub_100016264(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x746867696E6F74;
  }
  else {
    uint64_t v3 = 7827310;
  }
  if (v2) {
    unint64_t v4 = 0xE300000000000000;
  }
  else {
    unint64_t v4 = 0xE700000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x746867696E6F74;
  }
  else {
    uint64_t v5 = 7827310;
  }
  if (a2) {
    unint64_t v6 = 0xE700000000000000;
  }
  else {
    unint64_t v6 = 0xE300000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_10001C770();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

unint64_t sub_100016300(uint64_t a1)
{
  uint64_t v2 = sub_100006000(&qword_1000286D8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    char v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006000(&qword_100028CA0);
  uint64_t v6 = sub_10001C740();
  char v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  char v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100018F9C(v12, (uint64_t)v5, &qword_1000286D8);
    char v14 = *v5;
    unint64_t result = sub_100018868(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100006000(&qword_100028CA8);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
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

unint64_t sub_100016500(uint64_t a1)
{
  uint64_t v2 = sub_100006000(&qword_1000286C0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    char v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006000(&qword_100028C98);
  uint64_t v6 = sub_10001C740();
  char v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  char v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100018F9C(v12, (uint64_t)v5, &qword_1000286C0);
    char v14 = *v5;
    unint64_t result = sub_100018868(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_10001C390();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
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

unint64_t sub_1000166F8(uint64_t a1)
{
  return sub_100016738(a1, &qword_100028B10, &qword_100028C88, 1635018082, &qword_100028C90);
}

unint64_t sub_10001671C(uint64_t a1)
{
  return sub_100016914(a1, &qword_100028AF8, &qword_100028C80);
}

unint64_t sub_100016738(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v28 = a5;
  uint64_t v8 = sub_100006000(a2);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8 - 8);
  unint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v13 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006000(a3);
  uint64_t v12 = sub_10001C740();
  uint64_t v13 = (void *)v12;
  uint64_t v14 = *(void *)(a1 + 16);
  if (!v14)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v13;
  }
  uint64_t v15 = v12 + 64;
  unint64_t v16 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v27 = a1;
  uint64_t v17 = a1 + v16;
  uint64_t v18 = *(void *)(v9 + 72);
  swift_retain();
  while (1)
  {
    sub_100018F9C(v17, (uint64_t)v11, a2);
    unint64_t result = sub_100018A70();
    if (v20) {
      break;
    }
    unint64_t v21 = result;
    *(void *)(v15 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v22 = v13[7];
    uint64_t v23 = sub_100006000(v28);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v22 + *(void *)(*(void *)(v23 - 8) + 72) * v21, v11, v23);
    uint64_t v24 = v13[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_11;
    }
    v13[2] = v26;
    v17 += v18;
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

unint64_t sub_100016914(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006000(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    unint64_t v11 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006000(a3);
  uint64_t v10 = sub_10001C740();
  unint64_t v11 = (void *)v10;
  uint64_t v12 = *(void *)(a1 + 16);
  if (!v12)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v11;
  }
  uint64_t v13 = v10 + 64;
  unint64_t v14 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v25[1] = a1;
  uint64_t v15 = a1 + v14;
  uint64_t v16 = *(void *)(v7 + 72);
  swift_retain();
  while (1)
  {
    sub_100018F9C(v15, (uint64_t)v9, a2);
    unint64_t result = sub_100018A70();
    if (v18) {
      break;
    }
    unint64_t v19 = result;
    *(void *)(v13 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v20 = v11[7];
    uint64_t v21 = sub_10001C390();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v20 + *(void *)(*(void *)(v21 - 8) + 72) * v19, v9, v21);
    uint64_t v22 = v11[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    void v11[2] = v24;
    v15 += v16;
    if (!--v12)
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

Swift::Int sub_100016AEC()
{
  return sub_10001C7E0();
}

uint64_t sub_100016B68()
{
  sub_10001C600();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100016BCC()
{
  return sub_10001C7E0();
}

uint64_t sub_100016C44()
{
  uint64_t v0 = sub_10001C4C0();
  sub_100006AB0(v0, qword_100029020);
  sub_100005FAC(v0, (uint64_t)qword_100029020);
  return sub_10001C4A0();
}

uint64_t sub_100016CA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100006000(&qword_100028680);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v13 - v6;
  uint64_t v8 = sub_10001C4C0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_10001C4A0();
  sub_10001C4A0();
  uint64_t v10 = *(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56);
  v10(v7, 0, 1, v8);
  sub_100006000(&qword_1000286A8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10001CD40;
  sub_10001C4A0();
  sub_10001C4A0();
  v10(v5, 0, 1, v8);
  sub_10001C300();
  uint64_t v11 = sub_10001C2F0();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(a1, 0, 1, v11);
}

unint64_t sub_100016F2C()
{
  unint64_t result = qword_100028B78;
  if (!qword_100028B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028B78);
  }
  return result;
}

uint64_t sub_100016F80(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100018EF4();
  unint64_t v5 = sub_100018E90();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100016FEC()
{
  unint64_t result = qword_100028B80;
  if (!qword_100028B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028B80);
  }
  return result;
}

unint64_t sub_100017044()
{
  unint64_t result = qword_100028B88;
  if (!qword_100028B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028B88);
  }
  return result;
}

uint64_t sub_100017098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100018018(a1, a2, a3, (void (*)(void))sub_100016F2C);
}

uint64_t sub_1000170C4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000FF94(&qword_1000283D0, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100029020, a1);
}

uint64_t sub_100017100(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100018EF4();
  unint64_t v6 = sub_100018F48();
  unint64_t v7 = sub_100018E90();
  *unint64_t v4 = v2;
  v4[1] = sub_100008C98;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_1000171CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100018BA0();
  *a1 = result;
  return result;
}

uint64_t sub_1000171F4(uint64_t a1)
{
  unint64_t v2 = sub_100016F2C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100017230()
{
  uint64_t v0 = sub_100006000(&qword_100028C48);
  sub_100006AB0(v0, qword_100029038);
  sub_100005FAC(v0, (uint64_t)qword_100029038);
  sub_100006000(&qword_100028C50);
  sub_100006000(&qword_100028C58);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10001CD40;
  sub_100017BB8();
  sub_10001C3A0();
  sub_100016738(v1, &qword_100028C58, &qword_100028C60, 1953460082, &qword_100028C68);
  return sub_10001C3B0();
}

uint64_t sub_100017388()
{
  uint64_t v0 = sub_100006000(&qword_100028680);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10001C4C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_10001C460();
  sub_100006AB0(v5, qword_100029050);
  sub_100005FAC(v5, (uint64_t)qword_100029050);
  sub_10001C4A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_10001C450();
}

unint64_t sub_1000174FC()
{
  uint64_t v0 = sub_100006000(&qword_1000286B0);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006000(&qword_100028680);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001C4C0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  __chkstk_darwin(v8);
  sub_100006000(&qword_100028C28);
  uint64_t v9 = *(void *)(sub_100006000(&qword_100028C30) - 8);
  v13[1] = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10001CD40;
  sub_10001C4A0();
  sub_10001C4A0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_10001C350();
  uint64_t v11 = sub_10001C370();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v2, 0, 1, v11);
  sub_100006000(&qword_1000286A8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10001E470;
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C4A0();
  sub_10001C380();
  unint64_t result = sub_100016914(v10, &qword_100028C30, &qword_100028C38);
  qword_100029068 = result;
  return result;
}

unint64_t sub_100017AA0()
{
  unint64_t result = qword_100028B98;
  if (!qword_100028B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028B98);
  }
  return result;
}

Swift::Int sub_100017AF4()
{
  return sub_100018AE0();
}

Swift::Int sub_100017B18()
{
  return sub_100018B58();
}

uint64_t sub_100017B38@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_1000250C8;
  v7._object = v3;
  Swift::Int v5 = sub_10001C760(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_100017B8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100018EE4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100017BB8()
{
  unint64_t result = qword_100028BA0;
  if (!qword_100028BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028BA0);
  }
  return result;
}

unint64_t sub_100017C10()
{
  unint64_t result = qword_100028BA8;
  if (!qword_100028BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028BA8);
  }
  return result;
}

uint64_t sub_100017C64@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000283D8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006000(&qword_100028C48);
  uint64_t v3 = sub_100005FAC(v2, (uint64_t)qword_100029038);
  Swift::OpaquePointer v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100017D14()
{
  unint64_t result = qword_100028BB0;
  if (!qword_100028BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028BB0);
  }
  return result;
}

unint64_t sub_100017D6C()
{
  unint64_t result = qword_100028BB8;
  if (!qword_100028BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028BB8);
  }
  return result;
}

uint64_t sub_100017DC0()
{
  sub_100018E90();
  uint64_t v2 = sub_10001C320();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100009DAC(v3, v0, v2, v1);
}

unint64_t sub_100017E58()
{
  unint64_t result = qword_100028BC8;
  if (!qword_100028BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028BC8);
  }
  return result;
}

unint64_t sub_100017EB0()
{
  unint64_t result = qword_100028BD0;
  if (!qword_100028BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028BD0);
  }
  return result;
}

unint64_t sub_100017F08()
{
  unint64_t result = qword_100028BD8;
  if (!qword_100028BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028BD8);
  }
  return result;
}

unint64_t sub_100017F60()
{
  unint64_t result = qword_100028BE0;
  if (!qword_100028BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028BE0);
  }
  return result;
}

uint64_t sub_100017FB4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000FF94(&qword_1000283E0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100029050, a1);
}

uint64_t sub_100017FEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100018018(a1, a2, a3, (void (*)(void))sub_100017BB8);
}

uint64_t sub_100018018(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100018060(uint64_t a1)
{
  unint64_t v2 = sub_100017BB8();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000180B0()
{
  unint64_t result = qword_100028BE8;
  if (!qword_100028BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028BE8);
  }
  return result;
}

unint64_t sub_100018108()
{
  unint64_t result = qword_100028BF0;
  if (!qword_100028BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028BF0);
  }
  return result;
}

unint64_t sub_100018160()
{
  unint64_t result = qword_100028BF8;
  if (!qword_100028BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028BF8);
  }
  return result;
}

uint64_t sub_1000181B4()
{
  if (qword_1000283E8 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_100018210(uint64_t a1)
{
  unint64_t v2 = sub_100017F60();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100018260()
{
  unint64_t result = qword_100028C00;
  if (!qword_100028C00)
  {
    sub_100006CB4(&qword_100028C08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028C00);
  }
  return result;
}

void sub_1000182BC(void *a1@<X8>)
{
  *a1 = &off_100025100;
}

uint64_t sub_1000182CC()
{
  uint64_t v0 = sub_100006000(&qword_100028C10);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016F2C();
  sub_10001C250();
  uint64_t v4 = sub_10001C1D0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_10001C250();
  uint64_t v6 = sub_10001C1D0();
  v5(v3, v0);
  sub_10001C250();
  uint64_t v7 = sub_10001C1D0();
  v5(v3, v0);
  sub_100006000(&qword_100028C18);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10001E480;
  *(void *)(v8 + 32) = v4;
  *(void *)(v8 + 40) = v6;
  *(void *)(v8 + 48) = v7;
  uint64_t v9 = sub_10001C1C0();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1000184E0()
{
  uint64_t v0 = sub_10001C2C0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_100018BA0();
  sub_100016F2C();
  sub_10001C2D0();
  uint64_t v4 = sub_10001C2B0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006000(&qword_100028658);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001CD40;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10001C2A0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10001863C()
{
  uint64_t v0 = sub_10001C1A0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016F2C();
  sub_10001C190();
  uint64_t v4 = sub_10001C180();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006000(&qword_100028648);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001CD40;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10001C170();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for OpenSoftwareUpdateIntentAssistantIntentsProvider()
{
  return &type metadata for OpenSoftwareUpdateIntentAssistantIntentsProvider;
}

unsigned char *storeEnumTagSinglePayload for SoftwareUpdateDeepLinkEntity(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100018820);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SoftwareUpdateDeepLinkEntity()
{
  return &type metadata for SoftwareUpdateDeepLinkEntity;
}

ValueMetadata *type metadata accessor for OpenSoftwareUpdateIntent()
{
  return &type metadata for OpenSoftwareUpdateIntent;
}

unint64_t sub_100018868(char a1)
{
  sub_10001C7D0();
  sub_10001C600();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_10001C7E0();

  return sub_100018908(a1 & 1, v2);
}

unint64_t sub_100018908(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    if (a1) {
      uint64_t v6 = 0x746867696E6F74;
    }
    else {
      uint64_t v6 = 7827310;
    }
    if (a1) {
      unint64_t v7 = 0xE700000000000000;
    }
    else {
      unint64_t v7 = 0xE300000000000000;
    }
    while (1)
    {
      uint64_t v8 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0x746867696E6F74 : 7827310;
      unint64_t v9 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0xE700000000000000 : 0xE300000000000000;
      if (v8 == v6 && v9 == v7) {
        break;
      }
      char v11 = sub_10001C770();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_100018A44(uint64_t a1)
{
  return a1 & ~(-1 << *(unsigned char *)(v1 + 32));
}

uint64_t sub_100018A70()
{
  sub_10001C7D0();
  sub_10001C600();
  Swift::Int v0 = sub_10001C7E0();
  return sub_100018A44(v0);
}

Swift::Int sub_100018AD4()
{
  return sub_100018AE0();
}

Swift::Int sub_100018AE0()
{
  return sub_10001C7E0();
}

uint64_t sub_100018B2C()
{
  return sub_10001C600();
}

uint64_t sub_100018B3C()
{
  return sub_10001C600();
}

Swift::Int sub_100018B4C()
{
  return sub_100018B58();
}

Swift::Int sub_100018B58()
{
  return sub_10001C7E0();
}

uint64_t sub_100018BA0()
{
  uint64_t v17 = sub_10001C410();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006000(&qword_100028678);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100006000(&qword_100028680);
  __chkstk_darwin(v9 - 8);
  char v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10001C4C0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100006000(&qword_100028C20);
  sub_10001C4A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 1;
  uint64_t v14 = sub_10001C0A0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_100017BB8();
  return sub_10001C140();
}

unint64_t sub_100018E90()
{
  unint64_t result = qword_100028C40;
  if (!qword_100028C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028C40);
  }
  return result;
}

uint64_t sub_100018EE4()
{
  return 1953460082;
}

unint64_t sub_100018EF4()
{
  unint64_t result = qword_100028C70;
  if (!qword_100028C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028C70);
  }
  return result;
}

unint64_t sub_100018F48()
{
  unint64_t result = qword_100028C78;
  if (!qword_100028C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028C78);
  }
  return result;
}

uint64_t sub_100018F9C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006000(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100019000(uint64_t a1)
{
  unint64_t v2 = sub_100019150();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000190A8()
{
  unint64_t result = qword_100028CB0;
  if (!qword_100028CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028CB0);
  }
  return result;
}

uint64_t sub_100019100()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100019150()
{
  unint64_t result = qword_100028CB8;
  if (!qword_100028CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028CB8);
  }
  return result;
}

ValueMetadata *type metadata accessor for SoftwareUpdateSettingsIntentsExtension()
{
  return &type metadata for SoftwareUpdateSettingsIntentsExtension;
}

unint64_t sub_1000191B8()
{
  unint64_t result = qword_100028CE8;
  if (!qword_100028CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028CE8);
  }
  return result;
}

uint64_t sub_10001920C()
{
  return sub_10000D630(&qword_100028CF0, &qword_100028CF8);
}

uint64_t sub_100019248()
{
  uint64_t v0 = sub_10001C560();
  sub_100006AB0(v0, qword_100028CC0);
  sub_100005FAC(v0, (uint64_t)qword_100028CC0);
  return sub_10001C550();
}

uint64_t sub_1000192C8()
{
  uint64_t v0 = sub_100006000(&qword_100028680);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10001C4C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_10001C460();
  sub_100006AB0(v5, qword_100029070);
  sub_100005FAC(v5, (uint64_t)qword_100029070);
  sub_10001C4A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_10001C450();
}

uint64_t sub_100019434()
{
  uint64_t v0 = sub_10001C4C0();
  sub_100006AB0(v0, qword_100029088);
  sub_100005FAC(v0, (uint64_t)qword_100029088);
  return sub_10001C4A0();
}

uint64_t sub_100019498()
{
  uint64_t v0 = sub_100006000(&qword_1000289D8);
  sub_100006AB0(v0, qword_1000290A0);
  uint64_t v1 = sub_100005FAC(v0, (uint64_t)qword_1000290A0);
  sub_10001C2E0();
  uint64_t v2 = sub_10001C2F0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 0, 1, v2);
}

uint64_t sub_100019550()
{
  uint64_t result = swift_getKeyPath();
  qword_1000290B8 = result;
  return result;
}

uint64_t sub_100019578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[21] = a2;
  v3[22] = a3;
  v3[20] = a1;
  sub_100006000(&qword_1000289A8);
  v3[23] = swift_task_alloc();
  sub_100006000(&qword_1000289B0);
  v3[24] = swift_task_alloc();
  sub_100006000(&qword_100028DF8);
  v3[25] = swift_task_alloc();
  uint64_t v4 = sub_10001C0A0();
  v3[26] = v4;
  v3[27] = *(void *)(v4 - 8);
  v3[28] = swift_task_alloc();
  uint64_t v5 = sub_100006000(&qword_100028E00);
  v3[29] = v5;
  v3[30] = *(void *)(v5 - 8);
  v3[31] = swift_task_alloc();
  v3[32] = swift_task_alloc();
  return _swift_task_switch(sub_10001973C, 0, 0);
}

uint64_t sub_10001973C()
{
  sub_10001C120();
  long long v1 = *(_OWORD *)(v0 + 24);
  *(void *)(v0 + 40) = *(void *)(v0 + 16);
  *(_OWORD *)(v0 + 48) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v2;
  unint64_t v3 = sub_10001A308();
  *uint64_t v2 = v0;
  v2[1] = sub_100019820;
  uint64_t v4 = *(void *)(v0 + 256);
  return IntentDialog._CapturedContent.init<>(entity:_:)(v4, v0 + 40, sub_100019E64, 0, &type metadata for AutomaticDownloadUpdatesEntity, v3);
}

uint64_t sub_100019820()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001991C, 0, 0);
}

uint64_t sub_10001991C()
{
  sub_10001C120();
  *(void *)(v0 + 88) = *(void *)(v0 + 64);
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 80);
  *(void *)(v0 + 272) = v1;
  *(void *)(v0 + 280) = v2;
  *(void *)(v0 + 96) = v1;
  *(void *)(v0 + 104) = v2;
  sub_10001C120();
  *(unsigned char *)(v0 + 312) = *(unsigned char *)(v0 + 313);
  if (qword_100028410 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_1000290B8;
  *(void *)(v0 + 288) = qword_1000290B8;
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v4;
  uint64_t v5 = sub_10000D630(&qword_100028DE0, &qword_100028DE8);
  *uint64_t v4 = v0;
  v4[1] = sub_100019A7C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 312, v3, &type metadata for Bool, v5);
}

uint64_t sub_100019A7C()
{
  *(void *)(*(void *)v1 + 304) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_10000F078;
  }
  else {
    uint64_t v2 = sub_100019BEC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100019BEC()
{
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v10 = *(void *)(v0 + 248);
  uint64_t v11 = *(void *)(v0 + 256);
  uint64_t v2 = *(void *)(v0 + 232);
  uint64_t v13 = *(void *)(v0 + 216);
  uint64_t v14 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v4 = *(void *)(v0 + 192);
  uint64_t v12 = *(void *)(v0 + 224);
  sub_10001C120();
  long long v5 = *(_OWORD *)(v0 + 144);
  *(void *)(v0 + 112) = *(void *)(v0 + 136);
  *(_OWORD *)(v0 + 120) = v5;
  uint64_t v6 = sub_10001C440();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  uint64_t v7 = sub_10001C470();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 1, 1, v7);
  sub_1000191B8();
  sub_10001A9C0();
  sub_10001C060();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v10, v11, v2);
  sub_10001C080();
  sub_10001C0C0();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v11, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_100019E68()
{
  uint64_t v0 = sub_100006000(&qword_100028E08);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100028410 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10001C340();
  swift_release();
  sub_10001A9C0();
  sub_10000D630(&qword_100028E10, &qword_100028E08);
  sub_10001C330();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100019FD0()
{
  if (qword_100028410 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_10001A030()
{
  unint64_t result = qword_100028D00;
  if (!qword_100028D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028D00);
  }
  return result;
}

unint64_t sub_10001A088()
{
  unint64_t result = qword_100028D08;
  if (!qword_100028D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028D08);
  }
  return result;
}

uint64_t sub_10001A0DC()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_10001A110()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001A160@<X0>(uint64_t a1@<X8>)
{
  return sub_10000FF94(&qword_100028400, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100029088, a1);
}

uint64_t sub_10001A198@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028408 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006000(&qword_1000289D8);
  uint64_t v3 = sub_100005FAC(v2, (uint64_t)qword_1000290A0);

  return sub_1000117FC(v3, a1);
}

uint64_t sub_10001A214(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_10000C494;
  return sub_100019578(a1, v5, v4);
}

uint64_t sub_10001A2C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001B580();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10001A2E8()
{
  return 0xD000000000000039;
}

unint64_t sub_10001A308()
{
  unint64_t result = qword_100028D18;
  if (!qword_100028D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028D18);
  }
  return result;
}

uint64_t sub_10001A35C()
{
  return sub_10000D630(&qword_100028D20, &qword_100028D28);
}

uint64_t sub_10001A398(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10001A3B8, 0, 0);
}

uint64_t sub_10001A3B8()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  unsigned char *v1 = sub_10001B9C4() & 1;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10001A424(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 16) = *a2;
  return _swift_task_switch(sub_10001A448, 0, 0);
}

uint64_t sub_10001A448()
{
  sub_10001BB24(*(unsigned char *)(v0 + 16));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10001A4AC()
{
  uint64_t v0 = sub_100006000(&qword_100028D28);
  sub_100006AB0(v0, qword_1000290C0);
  sub_100005FAC(v0, (uint64_t)qword_1000290C0);
  sub_10001BEDC();
  return sub_10001BF70();
}

uint64_t sub_10001A528(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_10001C4C0();
  *(void *)(v1 + 24) = swift_task_alloc();
  return _swift_task_switch(sub_10001A5B8, 0, 0);
}

uint64_t sub_10001A5B8()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_100006000(&qword_100028CF8);
  sub_10001C4A0();
  sub_10000D630(&qword_100028DE0, &qword_100028DE8);
  uint64_t v2 = sub_10001C490();
  void *v1 = 0xD00000000000001ELL;
  v1[1] = 0x800000010001EF00;
  v1[2] = v2;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10001A6E4()
{
  uint64_t v0 = qword_100028CD8;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10001A720()
{
  unint64_t result = qword_100028D30;
  if (!qword_100028D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028D30);
  }
  return result;
}

unint64_t sub_10001A778()
{
  unint64_t result = qword_100028D38;
  if (!qword_100028D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028D38);
  }
  return result;
}

unint64_t sub_10001A7D0()
{
  unint64_t result = qword_100028D40;
  if (!qword_100028D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028D40);
  }
  return result;
}

uint64_t sub_10001A824()
{
  return sub_10000D630(&qword_100028D48, &qword_100028D28);
}

uint64_t sub_10001A860@<X0>(uint64_t a1@<X8>)
{
  if (qword_100028418 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006000(&qword_100028D28);
  uint64_t v3 = sub_100005FAC(v2, (uint64_t)qword_1000290C0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_10001A910()
{
  unint64_t result = qword_100028D50;
  if (!qword_100028D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028D50);
  }
  return result;
}

unint64_t sub_10001A968()
{
  unint64_t result = qword_100028D58;
  if (!qword_100028D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028D58);
  }
  return result;
}

unint64_t sub_10001A9C0()
{
  unint64_t result = qword_100028D60;
  if (!qword_100028D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028D60);
  }
  return result;
}

unint64_t sub_10001AA18()
{
  unint64_t result = qword_100028D68;
  if (!qword_100028D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028D68);
  }
  return result;
}

uint64_t sub_10001AA6C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000FF94(&qword_1000283F8, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100029070, a1);
}

uint64_t sub_10001AAA4()
{
  return sub_10000D630(&qword_100028D70, &qword_100028D78);
}

uint64_t sub_10001AAE0(uint64_t a1)
{
  unint64_t v2 = sub_10001A308();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001AB30()
{
  unint64_t result = qword_100028D80;
  if (!qword_100028D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028D80);
  }
  return result;
}

uint64_t sub_10001AB84(uint64_t a1)
{
  unint64_t v2 = sub_10001BEDC();

  return UniqueAppEntity.displayRepresentation.getter(a1, v2);
}

uint64_t sub_10001ABD0(uint64_t a1)
{
  unint64_t v2 = sub_10001AA18();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

void sub_10001AC1C()
{
  qword_1000290D8 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_10001AC30()
{
  uint64_t v0 = sub_100006000(&qword_100028DA0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006000(&qword_100028DA8);
  __chkstk_darwin(v4);
  sub_1000191B8();
  sub_10001C280();
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  sub_10001C270(v10);
  swift_getKeyPath();
  sub_100009E50();
  sub_10001C1B0();
  swift_release();
  sub_10001C260();
  swift_release();
  v11._object = (void *)0x8000000100020530;
  v11._countAndFlagsBits = 0xD00000000000001BLL;
  sub_10001C270(v11);
  sub_10001C290();
  uint64_t v5 = sub_10001C1D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006000(&qword_100028DB0);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001CD40;
  *(void *)(v6 + 32) = v5;
  uint64_t v7 = sub_10001C1C0();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_10001AE6C()
{
  return sub_10001B1C4();
}

uint64_t sub_10001AE84(uint64_t a1)
{
  v11[1] = a1;
  uint64_t v13 = sub_100006000(&qword_100028DA0);
  uint64_t v1 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006000(&qword_100028DA8);
  __chkstk_darwin(v4);
  sub_1000191B8();
  sub_10001C280();
  v14._countAndFlagsBits = 0xD000000000000022;
  v14._object = (void *)0x80000001000204E0;
  sub_10001C270(v14);
  swift_getKeyPath();
  sub_100009E50();
  sub_10001C1B0();
  swift_release();
  sub_10001C260();
  swift_release();
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  sub_10001C270(v15);
  sub_10001C290();
  uint64_t v12 = sub_10001C1D0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v6 = v13;
  v5(v3, v13);
  sub_10001C280();
  v16._object = (void *)0x8000000100020510;
  v16._countAndFlagsBits = 0xD00000000000001DLL;
  sub_10001C270(v16);
  swift_getKeyPath();
  sub_10001C1B0();
  swift_release();
  sub_10001C260();
  swift_release();
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  sub_10001C270(v17);
  sub_10001C290();
  uint64_t v7 = sub_10001C1D0();
  v5(v3, v6);
  sub_100006000(&qword_100028DB0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10001CD50;
  *(void *)(v8 + 32) = v12;
  *(void *)(v8 + 40) = v7;
  uint64_t v9 = sub_10001C1C0();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_10001B1AC()
{
  return sub_10001B1C4();
}

uint64_t sub_10001B1C4()
{
  uint64_t v0 = sub_10001C240();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100009E50();
  sub_10001C1B0();
  swift_release();
  sub_1000191B8();
  sub_10001C230();
  uint64_t v4 = sub_10001C220();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100006000(&qword_100028660);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001CD40;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_10001C210();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10001B320()
{
  uint64_t v0 = sub_10001C1F0();
  uint64_t v1 = sub_10001C1F0();
  uint64_t v2 = sub_10001C1F0();
  uint64_t v3 = sub_10001C1F0();
  sub_100006000(&qword_100028650);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001D370;
  *(void *)(v4 + 32) = v0;
  *(void *)(v4 + 40) = v1;
  *(void *)(v4 + 48) = v2;
  *(void *)(v4 + 56) = v3;
  uint64_t v5 = sub_10001C1E0();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10001B3F8()
{
  if (qword_100028420 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for AutomaticDownloadUpdatesAssistantIntentsProvider()
{
  return &type metadata for AutomaticDownloadUpdatesAssistantIntentsProvider;
}

ValueMetadata *type metadata accessor for AutomaticDownloadUpdatesEntity()
{
  return &type metadata for AutomaticDownloadUpdatesEntity;
}

ValueMetadata *type metadata accessor for AutomaticDownloadUpdatesEntity.UpdateIntent_intentAutoValue()
{
  return &type metadata for AutomaticDownloadUpdatesEntity.UpdateIntent_intentAutoValue;
}

uint64_t sub_10001B484()
{
  return sub_10000D630(&qword_100028D88, &qword_100028D90);
}

uint64_t sub_10001B4C0()
{
  return sub_10000D630(&qword_100028D98, &qword_100028D90);
}

uint64_t sub_10001B4FC(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_10001B528(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001B550@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_10001B580()
{
  uint64_t v0 = sub_100006000(&qword_1000287E0);
  __chkstk_darwin(v0 - 8);
  uint64_t v29 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_10001C410();
  uint64_t v2 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006000(&qword_100028678);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  Swift::String v10 = (char *)&v22 - v9;
  uint64_t v11 = sub_100006000(&qword_100028680);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v13;
  uint64_t v14 = sub_10001C4C0();
  uint64_t v28 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v23 = sub_100006000(&qword_100028DB8);
  sub_10001C4A0();
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v27(v13, 1, 1, v14);
  uint64_t v16 = sub_10001C0A0();
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v31 = 0;
  Swift::String v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  v17(v10, 1, 1, v16);
  v17(v8, 1, 1, v16);
  unsigned int v26 = enum case for InputConnectionBehavior.default(_:);
  char v18 = *(void (**)(void))(v2 + 104);
  uint64_t v24 = v2 + 104;
  BOOL v25 = (void (*)(char *, void, uint64_t))v18;
  v18(v4);
  sub_10001A308();
  unint64_t v19 = v22;
  uint64_t v23 = sub_10001C150();
  sub_100006000(&qword_1000287E8);
  sub_10001C4A0();
  v27(v19, 1, 1, v28);
  LOBYTE(v31) = 2;
  uint64_t v20 = sub_10001C630();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v29, 1, 1, v20);
  v17(v10, 1, 1, v16);
  v25(v4, v26, v30);
  sub_10001C160();
  return v23;
}

id sub_10001B9C4()
{
  if (qword_100028310 != -1) {
    swift_once();
  }
  id v0 = [*(id *)(qword_100028EB0 + 16) isAutomaticDownloadEnabled];
  if (qword_1000283F0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10001C560();
  sub_100005FAC(v1, (uint64_t)qword_100028CC0);
  uint64_t v2 = sub_10001C540();
  os_log_type_t v3 = sub_10001C660();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67109120;
    sub_10001C6C0();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Intent getting the value of the OS Automatic Download: %{BOOL}d", v4, 8u);
    swift_slowDealloc();
  }

  return v0;
}

id sub_10001BB24(char a1)
{
  if (qword_1000283F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001C560();
  sub_100005FAC(v2, (uint64_t)qword_100028CC0);
  os_log_type_t v3 = sub_10001C540();
  os_log_type_t v4 = sub_10001C660();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 67109120;
    sub_10001C6C0();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Intent setting the value of the OS Automatic Download to: %{BOOL}d", v5, 8u);
    swift_slowDealloc();
  }

  if (qword_100028310 != -1) {
    swift_once();
  }
  return [*(id *)(qword_100028EB0 + 16) enableAutomaticDownload:a1 & 1];
}

uint64_t sub_10001BC88()
{
  uint64_t v0 = sub_10001C2C0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  os_log_type_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10001B580();
  uint64_t v13 = v4;
  sub_1000191B8();
  sub_10001C2D0();
  uint64_t v5 = sub_10001C2B0();
  uint64_t v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  uint64_t v12 = sub_10001B580();
  uint64_t v13 = v7;
  sub_10001C2D0();
  uint64_t v8 = sub_10001C2B0();
  v6(v3, v0);
  sub_100006000(&qword_100028658);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10001CD50;
  *(void *)(v9 + 32) = v5;
  *(void *)(v9 + 40) = v8;
  uint64_t v10 = sub_10001C2A0();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10001BE68@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10001C120();
  *a1 = v3;
  return result;
}

uint64_t sub_10001BEA4()
{
  return sub_10001C130();
}

unint64_t sub_10001BEDC()
{
  unint64_t result = qword_100028DC0;
  if (!qword_100028DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100028DC0);
  }
  return result;
}

uint64_t sub_10001BF30@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 16);
  return swift_retain();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_10001BF60()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_10001BF70()
{
  return UniqueAppEntityProvider.init(_:)();
}

uint64_t sub_10001BF90()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_10001BFA0()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_10001BFB0()
{
  return static AppIntentInternal.attributionBundleIdentifier.getter();
}

uint64_t sub_10001BFF0()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_10001C000()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_10001C010()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_10001C030()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_10001C060()
{
  return IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)();
}

uint64_t sub_10001C080()
{
  return IntentDialog.init<A, B>(from:capturedContent:)();
}

uint64_t sub_10001C090()
{
  return IntentDialog.init(full:supporting:)();
}

uint64_t sub_10001C0A0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_10001C0B0()
{
  return static IntentResult.result<A>(opensIntent:)();
}

uint64_t sub_10001C0C0()
{
  return static IntentResult.result<A>(value:dialog:)();
}

uint64_t sub_10001C0D0()
{
  return static IntentResult.result<A>(value:)();
}

uint64_t sub_10001C0E0()
{
  return static IntentResult.result<>()();
}

uint64_t sub_10001C0F0()
{
  return type metadata accessor for OpenURLIntent();
}

uint64_t sub_10001C100()
{
  return OpenURLIntent.init(_:)();
}

uint64_t sub_10001C110()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_10001C120()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_10001C130()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_10001C140()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_10001C150()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_10001C160()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_10001C170()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
}

uint64_t sub_10001C180()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)();
}

uint64_t sub_10001C190()
{
  return _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)();
}

uint64_t sub_10001C1A0()
{
  return type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases();
}

uint64_t sub_10001C1B0()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_10001C1C0()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_10001C1D0()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_10001C1E0()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_10001C1F0()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_10001C200()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock()();
}

uint64_t sub_10001C210()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_10001C220()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_10001C230()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_10001C240()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_10001C250()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_10001C260()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_10001C270(Swift::String a1)
{
}

uint64_t sub_10001C280()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10001C290()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_10001C2A0()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_10001C2B0()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_10001C2C0()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_10001C2D0()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_10001C2E0()
{
  return IntentDescription.init(stringLiteral:)();
}

uint64_t sub_10001C2F0()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_10001C300()
{
  return IntentDescription.init(_:categoryName:searchKeywords:resultValueName:)();
}

uint64_t sub_10001C310()
{
  return URLRepresentableEnum.urlRepresentation.getter();
}

uint64_t sub_10001C320()
{
  return URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_10001C330()
{
  return static _DialogBuilderEntity.buildBlock<A>(_:)();
}

uint64_t sub_10001C340()
{
  return static _DialogBuilderEntity.buildExpression<A, B>(_:)();
}

uint64_t sub_10001C350()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_10001C360()
{
  return DisplayRepresentation.Image.init(named:isTemplate:)();
}

uint64_t sub_10001C370()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_10001C380()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_10001C390()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_10001C3A0()
{
  return EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_10001C3B0()
{
  return EnumURLRepresentation.init(_:)();
}

uint64_t sub_10001C3C0()
{
  return static ConfirmationActionName.continue.getter();
}

uint64_t sub_10001C3D0()
{
  return type metadata accessor for ConfirmationActionName();
}

uint64_t sub_10001C3E0()
{
  return type metadata accessor for ConfirmationConditions();
}

uint64_t sub_10001C410()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_10001C430()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_10001C440()
{
  return type metadata accessor for _GeneratedContentOptions();
}

uint64_t sub_10001C450()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_10001C460()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_10001C470()
{
  return type metadata accessor for _GeneratedContentFallback();
}

uint64_t sub_10001C490()
{
  return _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)();
}

uint64_t sub_10001C4A0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_10001C4B0()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_10001C4C0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_10001C4D0()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_10001C4E0()
{
  return type metadata accessor for URL();
}

uint64_t sub_10001C4F0()
{
  return static Locale.current.getter();
}

uint64_t sub_10001C500()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10001C510()
{
  return static AppExtension.main()();
}

uint64_t sub_10001C520(Swift::String a1)
{
  return localizedUIString(_:)(a1)._countAndFlagsBits;
}

uint64_t sub_10001C530(Swift::String a1)
{
  return localizedUIModelString(_:)(a1)._countAndFlagsBits;
}

uint64_t sub_10001C540()
{
  return Logger.logObject.getter();
}

uint64_t sub_10001C550()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10001C560()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10001C570()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10001C580()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10001C590()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_10001C5A0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_10001C5B0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10001C5C0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001C5D0()
{
  return String.init(format:_:)();
}

uint64_t sub_10001C5E0()
{
  return String.init(localized:)();
}

uint64_t sub_10001C5F0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10001C600()
{
  return String.hash(into:)();
}

void sub_10001C610(Swift::String a1)
{
}

Swift::Int sub_10001C620()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10001C630()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_10001C640()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_10001C650()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_10001C660()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10001C670()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10001C680()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10001C690()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_10001C6A0()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_10001C6B0()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_10001C6C0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10001C6D0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10001C6E0()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_10001C6F0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

void sub_10001C700(Swift::Int a1)
{
}

uint64_t sub_10001C710()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10001C720()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10001C730()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10001C740()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10001C750()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10001C760(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10001C770()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10001C790()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10001C7A0()
{
  return Error._code.getter();
}

uint64_t sub_10001C7B0()
{
  return Error._domain.getter();
}

uint64_t sub_10001C7C0()
{
  return Error._userInfo.getter();
}

uint64_t sub_10001C7D0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10001C7E0()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
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

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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