uint64_t sub_4EB4()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_4F28()
{
  return sub_4F50();
}

uint64_t sub_4F3C()
{
  return sub_4F50();
}

uint64_t sub_4F50()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  return v1;
}

id sub_4FBC()
{
  uint64_t v1 = v0;
  sub_9134(&qword_39338);
  __chkstk_darwin();
  v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_9134(&qword_39340);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_9134(&qword_39348);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_9A40())
  {
    char v16 = 0;
    goto LABEL_18;
  }
  uint64_t v36 = v8;
  uint64_t v12 = sub_9B98();
  if (qword_39230 != -1) {
    swift_once();
  }
  v13 = (void *)qword_3A248;
  NSString v14 = sub_2A4C8();
  id v15 = [v13 objectForKey:v14];

  if (v15)
  {
    sub_2A618();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v38, 0, sizeof(v38));
  }
  sub_9CCC((uint64_t)v38, (uint64_t)v39);
  if (v40)
  {
    sub_A0F0();
    if (swift_dynamicCast())
    {
      id v17 = v37;
      unint64_t v18 = (unint64_t)[v37 integerValue];

      v12 |= v18;
      goto LABEL_15;
    }
  }
  else
  {
    sub_9D34((uint64_t)v39);
  }
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    v20 = result;
    char quickNoteCapability = MobileGestalt_get_quickNoteCapability();

    if ((quickNoteCapability & 1) == 0)
    {
LABEL_15:
      uint64_t v8 = v36;
      if (v12) {
        char v16 = v12 & 1;
      }
      else {
        char v16 = 1;
      }
      goto LABEL_18;
    }
    uint64_t v8 = v36;
    char v16 = 1;
LABEL_18:
    uint64_t v22 = v1
        + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings30CornerGesturesSectionViewModel__allowFingerToSwipeFromCorner;
    v39[0] = v16;
    sub_29EA8();
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v22, v11, v8);
    uint64_t v23 = v1
        + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings30CornerGesturesSectionViewModel__bottomLeftCornerGestureFeature;
    v39[0] = sub_9588();
    sub_29EA8();
    v24 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
    v24(v23, v7, v4);
    uint64_t v25 = v1
        + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings30CornerGesturesSectionViewModel__bottomRightCornerGestureFeature;
    v39[0] = sub_97AC();
    sub_29EA8();
    v24(v25, v7, v4);
    uint64_t v26 = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings30CornerGesturesSectionViewModel_cornerGestureEducationTypes;
    *(void *)(v1 + v26) = sub_9A40();
    v27 = (void *)(v1 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings30CornerGesturesSectionViewModel_referrer);
    uint64_t v28 = sub_2A598();
    void *v27 = 0;
    v27[1] = 0;
    v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56);
    v29(v3, 1, 1, v28);
    sub_2A578();
    swift_retain();
    uint64_t v30 = sub_2A568();
    v31 = (void *)swift_allocObject();
    v31[2] = v30;
    v31[3] = &protocol witness table for MainActor;
    v31[4] = v1;
    sub_19004((uint64_t)v3, (uint64_t)&unk_39360, (uint64_t)v31);
    swift_release();
    v29(v3, 1, 1, v28);
    swift_retain();
    uint64_t v32 = sub_2A568();
    v33 = (void *)swift_allocObject();
    v33[2] = v32;
    v33[3] = &protocol witness table for MainActor;
    v33[4] = v1;
    sub_19004((uint64_t)v3, (uint64_t)&unk_39370, (uint64_t)v33);
    swift_release();
    v29(v3, 1, 1, v28);
    swift_retain();
    uint64_t v34 = sub_2A568();
    v35 = (void *)swift_allocObject();
    v35[2] = v34;
    v35[3] = &protocol witness table for MainActor;
    v35[4] = v1;
    sub_19004((uint64_t)v3, (uint64_t)&unk_39380, (uint64_t)v35);
    swift_release();
    return (id)v1;
  }
  __break(1u);
  return result;
}

uint64_t sub_5520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[13] = a4;
  v4[14] = sub_9134(&qword_393D0);
  v4[15] = swift_task_alloc();
  v4[16] = sub_9134(&qword_393D8);
  v4[17] = swift_task_alloc();
  uint64_t v5 = sub_9134(&qword_393E0);
  v4[18] = v5;
  v4[19] = *(void *)(v5 - 8);
  v4[20] = swift_task_alloc();
  uint64_t v6 = sub_9134(&qword_393E8);
  v4[21] = v6;
  v4[22] = *(void *)(v6 - 8);
  v4[23] = swift_task_alloc();
  uint64_t v7 = sub_9134(&qword_393F0);
  v4[24] = v7;
  v4[25] = *(void *)(v7 - 8);
  v4[26] = swift_task_alloc();
  v4[27] = sub_2A578();
  v4[28] = sub_2A568();
  uint64_t v9 = sub_2A548();
  v4[29] = v9;
  v4[30] = v8;
  return _swift_task_switch(sub_5744, v9, v8);
}

uint64_t sub_5744()
{
  uint64_t v1 = v0[23];
  uint64_t v11 = v0[22];
  uint64_t v3 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[19];
  swift_beginAccess();
  sub_9134(&qword_39348);
  sub_29EB8();
  swift_endAccess();
  sub_A7C8(&qword_393F8, &qword_393E0);
  sub_29EF8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  sub_A7C8(&qword_39400, &qword_393D8);
  sub_2A758();
  sub_2A6F8();
  sub_2A5B8();
  sub_2A708();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v2);
  sub_2A748();
  v0[31] = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings30CornerGesturesSectionViewModel_referrer;
  uint64_t v6 = sub_2A568();
  v0[32] = v6;
  if (v6)
  {
    swift_getObjectType();
    uint64_t v7 = sub_2A548();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  v0[33] = v7;
  v0[34] = v9;
  return _swift_task_switch(sub_5970, v7, v9);
}

uint64_t sub_5970()
{
  uint64_t v1 = sub_2A728();
  if (v1 < 1)
  {
    uint64_t v6 = v0[32];
    sub_2A738();
    v0[38] = sub_2A718();
    sub_A7C8(&qword_39408, &qword_393D0);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[39] = v7;
    void *v7 = v0;
    v7[1] = sub_5FA4;
    uint64_t v4 = v0 + 40;
    uint64_t v5 = v6;
  }
  else
  {
    v0[35] = v1;
    uint64_t v2 = v0[32];
    v0[36] = sub_2A718();
    sub_A7C8(&qword_39408, &qword_393D0);
    uint64_t v3 = (void *)swift_task_alloc();
    v0[37] = v3;
    void *v3 = v0;
    v3[1] = sub_5B5C;
    uint64_t v4 = (void *)((char *)v0 + 321);
    uint64_t v5 = v2;
  }
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v4, v5, &protocol witness table for MainActor);
}

uint64_t sub_5B5C()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_5EC8;
  }
  else
  {
    (*(void (**)(void))(v2 + 288))();
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_5C84;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_5C84()
{
  if (*(unsigned char *)(v0 + 321) == 2)
  {
    sub_2A738();
    swift_release();
    uint64_t v1 = *(void *)(v0 + 232);
    uint64_t v2 = *(void *)(v0 + 240);
    return _swift_task_switch(sub_5EE0, v1, v2);
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + 280);
    BOOL v4 = v3 <= 1;
    uint64_t v5 = v3 - 1;
    if (v4)
    {
      uint64_t v10 = *(void *)(v0 + 256);
      sub_2A738();
      *(void *)(v0 + 304) = sub_2A718();
      sub_A7C8(&qword_39408, &qword_393D0);
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 312) = v11;
      void *v11 = v0;
      v11[1] = sub_5FA4;
      uint64_t v8 = v0 + 320;
      uint64_t v9 = v10;
    }
    else
    {
      *(void *)(v0 + 280) = v5;
      uint64_t v6 = *(void *)(v0 + 256);
      *(void *)(v0 + 288) = sub_2A718();
      sub_A7C8(&qword_39408, &qword_393D0);
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 296) = v7;
      void *v7 = v0;
      v7[1] = sub_5B5C;
      uint64_t v8 = v0 + 321;
      uint64_t v9 = v6;
    }
    return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v8, v9, &protocol witness table for MainActor);
  }
}

uint64_t sub_5EC8()
{
  return (*(uint64_t (**)(void))(v0 + 288))();
}

uint64_t sub_5EE0()
{
  (*(void (**)(void, void))(v0[25] + 8))(v0[26], v0[24]);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_5FA4()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_60CC;
  }
  else
  {
    (*(void (**)(void))(v2 + 304))();
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_60E4;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_60CC()
{
  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t sub_60E4()
{
  swift_release();
  *(unsigned char *)(v0 + 322) = *(unsigned char *)(v0 + 320);
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 240);
  return _swift_task_switch(sub_6150, v1, v2);
}

uint64_t sub_6150()
{
  int v1 = *(unsigned __int8 *)(v0 + 322);
  if (v1 == 2)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 200) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 192));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else
  {
    uint64_t v4 = v1 & 1;
    sub_A178();
    if (qword_39220 != -1) {
      swift_once();
    }
    uint64_t v5 = (uint64_t *)(*(void *)(v0 + 104) + *(void *)(v0 + 248));
    uint64_t v6 = *v5;
    uint64_t v7 = v5[1];
    swift_bridgeObjectRetain();
    sub_184F0(5, v4, v6, v7);
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_2A568();
    *(void *)(v0 + 256) = v8;
    if (v8)
    {
      swift_getObjectType();
      uint64_t v9 = sub_2A548();
      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v11 = 0;
    }
    *(void *)(v0 + 264) = v9;
    *(void *)(v0 + 272) = v11;
    return _swift_task_switch(sub_5970, v9, v11);
  }
}

uint64_t sub_6308(uint64_t a1, uint64_t a2)
{
  v3[11] = a2;
  v3[12] = v2;
  v3[10] = a1;
  if (a1)
  {
    swift_getObjectType();
    uint64_t v4 = sub_2A548();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v3[13] = v4;
  v3[14] = v6;
  return _swift_task_switch(sub_63A8, v4, v6);
}

uint64_t sub_63A8()
{
  v0[15] = sub_9134(&qword_393F0);
  uint64_t v1 = sub_2A728();
  if (v1 < 1)
  {
    sub_2A738();
    v0[19] = sub_2A718();
    sub_9134(&qword_393D0);
    sub_A7C8(&qword_39408, &qword_393D0);
    uint64_t v6 = (void *)swift_task_alloc();
    v0[20] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_68E8;
    uint64_t v3 = v0[10];
    uint64_t v4 = v0[11];
    uint64_t v5 = v0 + 21;
  }
  else
  {
    v0[16] = v1;
    v0[17] = sub_2A718();
    sub_9134(&qword_393D0);
    sub_A7C8(&qword_39408, &qword_393D0);
    uint64_t v2 = (void *)swift_task_alloc();
    v0[18] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_65A0;
    uint64_t v3 = v0[10];
    uint64_t v4 = v0[11];
    uint64_t v5 = (void *)((char *)v0 + 169);
  }
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v5, v3, v4);
}

uint64_t sub_65A0()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v5 = sub_A980;
  }
  else
  {
    (*(void (**)(void))(v2 + 136))();
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v5 = sub_66C8;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_66C8()
{
  uint64_t v1 = v0 + 169;
  if (*(unsigned char *)(v0 + 169) == 2)
  {
    sub_2A738();
    uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v2(2);
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + 128);
    BOOL v5 = v4 <= 1;
    uint64_t v6 = v4 - 1;
    if (v5)
    {
      uint64_t v1 = v0 + 168;
      sub_2A738();
      *(void *)(v0 + 152) = sub_2A718();
      sub_9134(&qword_393D0);
      sub_A7C8(&qword_39408, &qword_393D0);
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 160) = v7;
      void *v7 = v0;
      uint64_t v8 = sub_68E8;
    }
    else
    {
      *(void *)(v0 + 128) = v6;
      *(void *)(v0 + 136) = sub_2A718();
      sub_9134(&qword_393D0);
      sub_A7C8(&qword_39408, &qword_393D0);
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 144) = v7;
      void *v7 = v0;
      uint64_t v8 = sub_65A0;
    }
    v7[1] = v8;
    uint64_t v9 = *(void *)(v0 + 80);
    uint64_t v10 = *(void *)(v0 + 88);
    return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v1, v9, v10);
  }
}

uint64_t sub_68E8()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    BOOL v5 = sub_A978;
  }
  else
  {
    (*(void (**)(void))(v2 + 152))();
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    BOOL v5 = sub_A988;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_6A10(uint64_t a1, uint64_t a2)
{
  v3[11] = a2;
  v3[12] = v2;
  v3[10] = a1;
  if (a1)
  {
    swift_getObjectType();
    uint64_t v4 = sub_2A548();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v3[13] = v4;
  v3[14] = v6;
  return _swift_task_switch(sub_6AB0, v4, v6);
}

uint64_t sub_6AB0()
{
  v0[15] = sub_9134(&qword_39420);
  uint64_t v1 = sub_2A728();
  if (v1 < 1)
  {
    sub_2A738();
    v0[19] = sub_2A718();
    sub_9134(&qword_39428);
    sub_A7C8(&qword_39430, &qword_39428);
    uint64_t v6 = (void *)swift_task_alloc();
    v0[20] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_7064;
    uint64_t v3 = v0[10];
    uint64_t v4 = v0[11];
    uint64_t v5 = v0 + 21;
  }
  else
  {
    v0[16] = v1;
    v0[17] = sub_2A718();
    sub_9134(&qword_39428);
    sub_A7C8(&qword_39430, &qword_39428);
    uint64_t v2 = (void *)swift_task_alloc();
    v0[18] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_6CA8;
    uint64_t v3 = v0[10];
    uint64_t v4 = v0[11];
    uint64_t v5 = (void *)((char *)v0 + 169);
  }
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v5, v3, v4);
}

uint64_t sub_6CA8()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v5 = sub_6FF0;
  }
  else
  {
    (*(void (**)(void))(v2 + 136))();
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v5 = sub_6DD0;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_6DD0()
{
  uint64_t v1 = v0 + 169;
  if (*(unsigned char *)(v0 + 169) == 2)
  {
    sub_2A738();
    uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v2(2);
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + 128);
    BOOL v5 = v4 <= 1;
    uint64_t v6 = v4 - 1;
    if (v5)
    {
      uint64_t v1 = v0 + 168;
      sub_2A738();
      *(void *)(v0 + 152) = sub_2A718();
      sub_9134(&qword_39428);
      sub_A7C8(&qword_39430, &qword_39428);
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 160) = v7;
      void *v7 = v0;
      uint64_t v8 = sub_7064;
    }
    else
    {
      *(void *)(v0 + 128) = v6;
      *(void *)(v0 + 136) = sub_2A718();
      sub_9134(&qword_39428);
      sub_A7C8(&qword_39430, &qword_39428);
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 144) = v7;
      void *v7 = v0;
      uint64_t v8 = sub_6CA8;
    }
    v7[1] = v8;
    uint64_t v9 = *(void *)(v0 + 80);
    uint64_t v10 = *(void *)(v0 + 88);
    return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v1, v9, v10);
  }
}

uint64_t sub_6FF0()
{
  (*(void (**)(void))(v0 + 136))();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_7064()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    BOOL v5 = sub_71A8;
  }
  else
  {
    (*(void (**)(void))(v2 + 152))();
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    BOOL v5 = sub_718C;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_718C()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 168));
}

uint64_t sub_71A8()
{
  (*(void (**)(void))(v0 + 152))();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_721C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[13] = a4;
  v4[14] = sub_9134(&qword_39390);
  v4[15] = swift_task_alloc();
  v4[16] = sub_9134(&qword_39398);
  v4[17] = swift_task_alloc();
  uint64_t v5 = sub_9134(&qword_393A0);
  v4[18] = v5;
  v4[19] = *(void *)(v5 - 8);
  v4[20] = swift_task_alloc();
  uint64_t v6 = sub_9134(&qword_393A8);
  v4[21] = v6;
  v4[22] = *(void *)(v6 - 8);
  v4[23] = swift_task_alloc();
  uint64_t v7 = sub_9134(&qword_393B0);
  v4[24] = v7;
  v4[25] = *(void *)(v7 - 8);
  v4[26] = swift_task_alloc();
  v4[27] = sub_2A578();
  v4[28] = sub_2A568();
  uint64_t v9 = sub_2A548();
  v4[29] = v9;
  v4[30] = v8;
  return _swift_task_switch(sub_7440, v9, v8);
}

uint64_t sub_7440()
{
  uint64_t v1 = v0[23];
  uint64_t v11 = v0[22];
  uint64_t v3 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[19];
  swift_beginAccess();
  sub_9134(&qword_39340);
  sub_29EB8();
  swift_endAccess();
  sub_A7C8(&qword_393B8, &qword_393A0);
  sub_29EF8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  sub_A7C8(&qword_393C0, &qword_39398);
  sub_2A758();
  sub_2A6F8();
  sub_2A5B8();
  sub_2A708();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v2);
  sub_2A748();
  v0[31] = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings30CornerGesturesSectionViewModel_referrer;
  uint64_t v6 = sub_2A568();
  v0[32] = v6;
  if (v6)
  {
    swift_getObjectType();
    uint64_t v7 = sub_2A548();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  v0[33] = v7;
  v0[34] = v9;
  return _swift_task_switch(sub_766C, v7, v9);
}

uint64_t sub_766C()
{
  uint64_t v1 = sub_2A728();
  if (v1 < 1)
  {
    uint64_t v6 = v0[32];
    sub_2A738();
    v0[38] = sub_2A718();
    sub_A7C8(&qword_393C8, &qword_39390);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[39] = v7;
    void *v7 = v0;
    v7[1] = sub_7BC4;
    uint64_t v4 = v0 + 40;
    uint64_t v5 = v6;
  }
  else
  {
    v0[35] = v1;
    uint64_t v2 = v0[32];
    v0[36] = sub_2A718();
    sub_A7C8(&qword_393C8, &qword_39390);
    uint64_t v3 = (void *)swift_task_alloc();
    v0[37] = v3;
    void *v3 = v0;
    v3[1] = sub_7858;
    uint64_t v4 = (void *)((char *)v0 + 321);
    uint64_t v5 = v2;
  }
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v4, v5, &protocol witness table for MainActor);
}

uint64_t sub_7858()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_5EC8;
  }
  else
  {
    (*(void (**)(void))(v2 + 288))();
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_7980;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_7980()
{
  if (*(unsigned char *)(v0 + 321) == 3)
  {
    sub_2A738();
    swift_release();
    uint64_t v1 = *(void *)(v0 + 232);
    uint64_t v2 = *(void *)(v0 + 240);
    return _swift_task_switch(sub_5EE0, v1, v2);
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + 280);
    BOOL v4 = v3 <= 1;
    uint64_t v5 = v3 - 1;
    if (v4)
    {
      uint64_t v10 = *(void *)(v0 + 256);
      sub_2A738();
      *(void *)(v0 + 304) = sub_2A718();
      sub_A7C8(&qword_393C8, &qword_39390);
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 312) = v11;
      void *v11 = v0;
      v11[1] = sub_7BC4;
      uint64_t v8 = v0 + 320;
      uint64_t v9 = v10;
    }
    else
    {
      *(void *)(v0 + 280) = v5;
      uint64_t v6 = *(void *)(v0 + 256);
      *(void *)(v0 + 288) = sub_2A718();
      sub_A7C8(&qword_393C8, &qword_39390);
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 296) = v7;
      void *v7 = v0;
      v7[1] = sub_7858;
      uint64_t v8 = v0 + 321;
      uint64_t v9 = v6;
    }
    return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v8, v9, &protocol witness table for MainActor);
  }
}

uint64_t sub_7BC4()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_60CC;
  }
  else
  {
    (*(void (**)(void))(v2 + 304))();
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_7CEC;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_7CEC()
{
  swift_release();
  *(unsigned char *)(v0 + 322) = *(unsigned char *)(v0 + 320);
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 240);
  return _swift_task_switch(sub_7D58, v1, v2);
}

uint64_t sub_7D58()
{
  int v1 = *(unsigned __int8 *)(v0 + 322);
  if (v1 == 3)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 200) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 192));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else
  {
    if (*(unsigned char *)(v0 + 322))
    {
      if (qword_39230 != -1) {
        swift_once();
      }
      uint64_t v4 = (void *)qword_3A248;
      Class isa = sub_2A5C8().super.super.isa;
      NSString v6 = sub_2A4C8();
      [v4 setValue:isa forKey:v6];
    }
    else
    {
      if (qword_39230 != -1) {
        swift_once();
      }
      uint64_t v7 = (void *)qword_3A248;
      NSString v6 = sub_2A4C8();
      [v7 removeObjectForKey:v6];
    }
    uint64_t v8 = *(unsigned __int8 *)(v0 + 322);

    sub_A42C(v8, 1);
    if (qword_39220 != -1) {
      swift_once();
    }
    uint64_t v9 = (uint64_t *)(*(void *)(v0 + 104) + *(void *)(v0 + 248));
    uint64_t v10 = *v9;
    uint64_t v11 = v9[1];
    swift_bridgeObjectRetain();
    sub_184F0(6, v1 != 0, v10, v11);
    swift_bridgeObjectRelease();
    uint64_t v12 = sub_2A568();
    *(void *)(v0 + 256) = v12;
    if (v12)
    {
      swift_getObjectType();
      uint64_t v13 = sub_2A548();
      uint64_t v15 = v14;
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v15 = 0;
    }
    *(void *)(v0 + 264) = v13;
    *(void *)(v0 + 272) = v15;
    return _swift_task_switch(sub_766C, v13, v15);
  }
}

uint64_t sub_8010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[13] = a4;
  v4[14] = sub_9134(&qword_39390);
  v4[15] = swift_task_alloc();
  v4[16] = sub_9134(&qword_39398);
  v4[17] = swift_task_alloc();
  uint64_t v5 = sub_9134(&qword_393A0);
  v4[18] = v5;
  v4[19] = *(void *)(v5 - 8);
  v4[20] = swift_task_alloc();
  uint64_t v6 = sub_9134(&qword_393A8);
  v4[21] = v6;
  v4[22] = *(void *)(v6 - 8);
  v4[23] = swift_task_alloc();
  uint64_t v7 = sub_9134(&qword_393B0);
  v4[24] = v7;
  v4[25] = *(void *)(v7 - 8);
  v4[26] = swift_task_alloc();
  v4[27] = sub_2A578();
  v4[28] = sub_2A568();
  uint64_t v9 = sub_2A548();
  v4[29] = v9;
  v4[30] = v8;
  return _swift_task_switch(sub_8234, v9, v8);
}

uint64_t sub_8234()
{
  uint64_t v1 = v0[23];
  uint64_t v11 = v0[22];
  uint64_t v3 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[19];
  swift_beginAccess();
  sub_9134(&qword_39340);
  sub_29EB8();
  swift_endAccess();
  sub_A7C8(&qword_393B8, &qword_393A0);
  sub_29EF8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  sub_A7C8(&qword_393C0, &qword_39398);
  sub_2A758();
  sub_2A6F8();
  sub_2A5B8();
  sub_2A708();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v2);
  sub_2A748();
  v0[31] = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings30CornerGesturesSectionViewModel_referrer;
  uint64_t v6 = sub_2A568();
  v0[32] = v6;
  if (v6)
  {
    swift_getObjectType();
    uint64_t v7 = sub_2A548();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  v0[33] = v7;
  v0[34] = v9;
  return _swift_task_switch(sub_8460, v7, v9);
}

uint64_t sub_8460()
{
  uint64_t v1 = sub_2A728();
  if (v1 < 1)
  {
    uint64_t v6 = v0[32];
    sub_2A738();
    v0[38] = sub_2A718();
    sub_A7C8(&qword_393C8, &qword_39390);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[39] = v7;
    void *v7 = v0;
    v7[1] = sub_89B8;
    uint64_t v4 = v0 + 40;
    uint64_t v5 = v6;
  }
  else
  {
    v0[35] = v1;
    uint64_t v2 = v0[32];
    v0[36] = sub_2A718();
    sub_A7C8(&qword_393C8, &qword_39390);
    uint64_t v3 = (void *)swift_task_alloc();
    v0[37] = v3;
    void *v3 = v0;
    v3[1] = sub_864C;
    uint64_t v4 = (void *)((char *)v0 + 321);
    uint64_t v5 = v2;
  }
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v4, v5, &protocol witness table for MainActor);
}

uint64_t sub_864C()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_A984;
  }
  else
  {
    (*(void (**)(void))(v2 + 288))();
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_8774;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_8774()
{
  if (*(unsigned char *)(v0 + 321) == 3)
  {
    sub_2A738();
    swift_release();
    uint64_t v1 = *(void *)(v0 + 232);
    uint64_t v2 = *(void *)(v0 + 240);
    return _swift_task_switch(sub_A990, v1, v2);
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + 280);
    BOOL v4 = v3 <= 1;
    uint64_t v5 = v3 - 1;
    if (v4)
    {
      uint64_t v10 = *(void *)(v0 + 256);
      sub_2A738();
      *(void *)(v0 + 304) = sub_2A718();
      sub_A7C8(&qword_393C8, &qword_39390);
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 312) = v11;
      void *v11 = v0;
      v11[1] = sub_89B8;
      uint64_t v8 = v0 + 320;
      uint64_t v9 = v10;
    }
    else
    {
      *(void *)(v0 + 280) = v5;
      uint64_t v6 = *(void *)(v0 + 256);
      *(void *)(v0 + 288) = sub_2A718();
      sub_A7C8(&qword_393C8, &qword_39390);
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 296) = v7;
      void *v7 = v0;
      v7[1] = sub_864C;
      uint64_t v8 = v0 + 321;
      uint64_t v9 = v6;
    }
    return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v8, v9, &protocol witness table for MainActor);
  }
}

uint64_t sub_89B8()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_A97C;
  }
  else
  {
    (*(void (**)(void))(v2 + 304))();
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_8AE0;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_8AE0()
{
  swift_release();
  *(unsigned char *)(v0 + 322) = *(unsigned char *)(v0 + 320);
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 240);
  return _swift_task_switch(sub_8B4C, v1, v2);
}

uint64_t sub_8B4C()
{
  int v1 = *(unsigned __int8 *)(v0 + 322);
  if (v1 == 3)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 200) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 192));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else
  {
    if (*(unsigned char *)(v0 + 322))
    {
      if (qword_39230 != -1) {
        swift_once();
      }
      uint64_t v4 = (void *)qword_3A248;
      Class isa = sub_2A5C8().super.super.isa;
      NSString v6 = sub_2A4C8();
      [v4 setValue:isa forKey:v6];
    }
    else
    {
      if (qword_39230 != -1) {
        swift_once();
      }
      uint64_t v7 = (void *)qword_3A248;
      NSString v6 = sub_2A4C8();
      [v7 removeObjectForKey:v6];
    }
    uint64_t v8 = *(unsigned __int8 *)(v0 + 322);

    sub_A42C(v8, 0);
    if (qword_39220 != -1) {
      swift_once();
    }
    uint64_t v9 = (uint64_t *)(*(void *)(v0 + 104) + *(void *)(v0 + 248));
    uint64_t v10 = *v9;
    uint64_t v11 = v9[1];
    swift_bridgeObjectRetain();
    sub_184F0(7, v1 != 0, v10, v11);
    swift_bridgeObjectRelease();
    uint64_t v12 = sub_2A568();
    *(void *)(v0 + 256) = v12;
    if (v12)
    {
      swift_getObjectType();
      uint64_t v13 = sub_2A548();
      uint64_t v15 = v14;
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v15 = 0;
    }
    *(void *)(v0 + 264) = v13;
    *(void *)(v0 + 272) = v15;
    return _swift_task_switch(sub_8460, v13, v15);
  }
}

uint64_t sub_8E04()
{
  uint64_t v1 = v0
     + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings30CornerGesturesSectionViewModel__allowFingerToSwipeFromCorner;
  uint64_t v2 = sub_9134(&qword_39348);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0
     + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings30CornerGesturesSectionViewModel__bottomLeftCornerGestureFeature;
  uint64_t v4 = sub_9134(&qword_39340);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5(v0+ OBJC_IVAR____TtC31MultitaskingAndGesturesSettings30CornerGesturesSectionViewModel__bottomRightCornerGestureFeature, v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v7 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v6, v7);
}

uint64_t sub_8F34()
{
  return type metadata accessor for CornerGesturesSectionViewModel();
}

uint64_t type metadata accessor for CornerGesturesSectionViewModel()
{
  uint64_t result = qword_39278;
  if (!qword_39278) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_8F88()
{
  sub_A834(319, (unint64_t *)&qword_39288, (uint64_t)&type metadata for Bool, (uint64_t (*)(void, uint64_t))&type metadata accessor for Published);
  if (v0 <= 0x3F)
  {
    sub_A834(319, (unint64_t *)&unk_39290, (uint64_t)&type metadata for CornerGestureAction, (uint64_t (*)(void, uint64_t))&type metadata accessor for Published);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void type metadata accessor for UIDeviceOrientation(uint64_t a1)
{
}

void *sub_90D8()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_90E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_29E98();
  *a1 = result;
  return result;
}

uint64_t sub_9134(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_9178(uint64_t a1, uint64_t a2)
{
  return sub_9270(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_9190()
{
  sub_2A4F8();
  sub_2A518();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_91E4()
{
  sub_2A4F8();
  sub_2A778();
  sub_2A518();
  Swift::Int v0 = sub_2A798();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_9258(uint64_t a1, uint64_t a2)
{
  return sub_9270(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_9270(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_2A4F8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_92B4(uint64_t a1, id *a2)
{
  uint64_t result = sub_2A4D8();
  *a2 = 0;
  return result;
}

uint64_t sub_932C(uint64_t a1, id *a2)
{
  char v3 = sub_2A4E8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_93AC@<X0>(void *a1@<X8>)
{
  sub_2A4F8();
  NSString v2 = sub_2A4C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_93F0()
{
  uint64_t v0 = sub_2A4F8();
  uint64_t v2 = v1;
  if (v0 == sub_2A4F8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_2A768();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_947C@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_2A4C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_94C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2A4F8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_94F0(uint64_t a1)
{
  uint64_t v2 = sub_A8E8(&qword_39458);
  uint64_t v3 = sub_A8E8(&qword_39460);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_9588()
{
  if (qword_39230 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_3A248;
  NSString v1 = sub_2A4C8();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    sub_2A618();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  sub_9CCC((uint64_t)&v9, (uint64_t)v11);
  if (!v12) {
    goto LABEL_19;
  }
  sub_A0F0();
  if ((swift_dynamicCast() & 1) == 0) {
    return 1;
  }
  if (![v8 integerValue])
  {

    return 0;
  }
  uint64_t v3 = (void *)qword_3A248;
  NSString v4 = sub_2A4C8();
  id v5 = [v3 objectForKey:v4];

  if (v5)
  {
    sub_2A618();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  sub_9CCC((uint64_t)&v9, (uint64_t)v11);
  if (!v12)
  {

LABEL_19:
    sub_9D34((uint64_t)v11);
    return 1;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    return 1;
  }
  id v7 = [v8 integerValue];

  if ((unint64_t)v7 + 1 >= 3) {
    return 1;
  }
  else {
    return (v7 + 1);
  }
}

id sub_97AC()
{
  if (qword_39230 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_3A248;
  NSString v1 = sub_2A4C8();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    sub_2A618();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
  }
  sub_9CCC((uint64_t)&v14, (uint64_t)v16);
  if (!v17)
  {
    sub_9D34((uint64_t)v16);
    goto LABEL_12;
  }
  sub_A0F0();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    id result = (id)MobileGestalt_get_current_device();
    if (result)
    {
      id v7 = result;
      int quickNoteCapability = MobileGestalt_get_quickNoteCapability();

      BOOL v9 = quickNoteCapability == 0;
      goto LABEL_14;
    }
    __break(1u);
LABEL_30:
    __break(1u);
    return result;
  }
  if (![v13 integerValue])
  {
LABEL_23:

    return 0;
  }
  uint64_t v3 = (void *)qword_3A248;
  NSString v4 = sub_2A4C8();
  id v5 = [v3 objectForKey:v4];

  if (v5)
  {
    sub_2A618();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
  }
  sub_9CCC((uint64_t)&v14, (uint64_t)v16);
  if (v17)
  {
    if (swift_dynamicCast())
    {
      long long v10 = (char *)[v13 integerValue];

      if (v10 == (unsigned char *)&def_163AC + 1)
      {

        return &def_163AC + 2;
      }
      if (!v10)
      {

        return &def_163AC + 1;
      }
      if (v10 == (char *)-1) {
        goto LABEL_23;
      }
    }
  }
  else
  {
    sub_9D34((uint64_t)v16);
  }
  id result = (id)MobileGestalt_get_current_device();
  if (!result) {
    goto LABEL_30;
  }
  uint64_t v11 = result;
  int v12 = MobileGestalt_get_quickNoteCapability();

  BOOL v9 = v12 == 0;
LABEL_14:
  if (v9) {
    return 0;
  }
  else {
    return &def_163AC + 2;
  }
}

id sub_9A40()
{
  if (qword_39230 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_3A248;
  NSString v1 = sub_2A4C8();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    sub_2A618();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_9CCC((uint64_t)v8, (uint64_t)v9);
  if (v10)
  {
    sub_A0F0();
    if (swift_dynamicCast())
    {
      id v3 = [v7 integerValue];

      return v3;
    }
  }
  else
  {
    sub_9D34((uint64_t)v9);
  }
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    id v5 = result;
    unsigned int quickNoteCapability = MobileGestalt_get_quickNoteCapability();

    return (id)quickNoteCapability;
  }
  __break(1u);
  return result;
}

uint64_t sub_9B98()
{
  if (qword_39230 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_3A248;
  NSString v1 = sub_2A4C8();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    sub_2A618();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_9CCC((uint64_t)v6, (uint64_t)v7);
  if (!v8)
  {
    sub_9D34((uint64_t)v7);
    return 2;
  }
  sub_A0F0();
  if ((swift_dynamicCast() & 1) == 0) {
    return 2;
  }
  id v3 = [v5 integerValue];

  return (uint64_t)v3;
}

uint64_t sub_9CCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_9134(&qword_39350);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_9D34(uint64_t a1)
{
  uint64_t v2 = sub_9134(&qword_39350);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_9D98(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_A98C;
  return sub_5520(a1, v4, v5, v6);
}

uint64_t sub_9E50(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_9F04;
  return sub_721C(a1, v4, v5, v6);
}

uint64_t sub_9F04()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  NSString v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_9FFC()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_A03C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_A98C;
  return sub_8010(a1, v4, v5, v6);
}

unint64_t sub_A0F0()
{
  unint64_t result = qword_39388;
  if (!qword_39388)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_39388);
  }
  return result;
}

uint64_t sub_A130(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_A178()
{
  sub_9B98();
  if (qword_39230 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_3A248;
  NSString v1 = sub_2A4C8();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    sub_2A618();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
  }
  sub_9CCC((uint64_t)v15, (uint64_t)v16);
  if (v17)
  {
    sub_A0F0();
    if (swift_dynamicCast())
    {
      [v14 integerValue];

LABEL_12:
      uint64_t v5 = (void *)qword_3A248;
      Class isa = sub_2A5C8().super.super.isa;
      NSString v7 = sub_2A4C8();
      [v5 setValue:isa forKey:v7];

      uint64_t v8 = (void *)qword_3A248;
      Class v9 = sub_2A5C8().super.super.isa;
      NSString v10 = sub_2A4C8();
      [v8 setValue:v9 forKey:v10];

      sub_9A40();
      uint64_t v11 = (void *)qword_3A248;
      Class v12 = sub_2A5C8().super.super.isa;
      NSString v13 = sub_2A4C8();
      [v11 setValue:v12 forKey:v13];

      return;
    }
  }
  else
  {
    sub_9D34((uint64_t)v16);
  }
  id v3 = (id)MobileGestalt_get_current_device();
  if (v3)
  {
    uint64_t v4 = v3;
    MobileGestalt_get_quickNoteCapability();

    goto LABEL_12;
  }
  __break(1u);
}

void sub_A42C(uint64_t a1, char a2)
{
  if (a2)
  {
    sub_9B98();
    if (sub_9A40()) {
      goto LABEL_27;
    }
    goto LABEL_16;
  }
  if (qword_39230 != -1) {
    swift_once();
  }
  id v2 = (void *)qword_3A248;
  NSString v3 = sub_2A4C8();
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    sub_2A618();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }
  sub_9CCC((uint64_t)&v16, (uint64_t)v18);
  if (v19)
  {
    sub_A0F0();
    if (swift_dynamicCast())
    {
      [v15 integerValue];

      goto LABEL_15;
    }
  }
  else
  {
    sub_9D34((uint64_t)v18);
  }
  id v5 = (id)MobileGestalt_get_current_device();
  if (!v5)
  {
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v6 = v5;
  MobileGestalt_get_quickNoteCapability();

LABEL_15:
  if ((sub_9A40() & 1) == 0)
  {
LABEL_16:
    sub_9B98();
    if (qword_39230 != -1) {
      swift_once();
    }
    NSString v7 = (void *)qword_3A248;
    NSString v8 = sub_2A4C8();
    id v9 = [v7 objectForKey:v8];

    if (v9)
    {
      sub_2A618();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
    }
    sub_9CCC((uint64_t)&v16, (uint64_t)v18);
    if (v19)
    {
      sub_A0F0();
      if (swift_dynamicCast())
      {
        [v15 integerValue];

        goto LABEL_27;
      }
    }
    else
    {
      sub_9D34((uint64_t)v18);
    }
    id v10 = (id)MobileGestalt_get_current_device();
    if (v10)
    {
      uint64_t v11 = v10;
      MobileGestalt_get_quickNoteCapability();

      goto LABEL_27;
    }
LABEL_31:
    __break(1u);
    return;
  }
LABEL_27:
  if (qword_39230 != -1) {
    swift_once();
  }
  Class v12 = (void *)qword_3A248;
  Class isa = sub_2A5C8().super.super.isa;
  NSString v14 = sub_2A4C8();
  swift_bridgeObjectRelease();
  [v12 setValue:isa forKey:v14];
}

uint64_t sub_A7C8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_A130(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for NSKeyValueChangeKey(uint64_t a1)
{
}

void sub_A834(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_A880()
{
  return sub_A8E8(&qword_39440);
}

uint64_t sub_A8B4()
{
  return sub_A8E8(&qword_39448);
}

uint64_t sub_A8E8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for NSKeyValueChangeKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_A92C()
{
  return sub_A8E8(&qword_39450);
}

unsigned char *initializeBufferWithCopyOfBuffer for CornerGestureAction(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CornerGestureAction(unsigned __int8 *a1, unsigned int a2)
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
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CornerGestureAction(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0xAB00);
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

uint64_t sub_AB28(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_AB34(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CornerGestureAction()
{
  return &type metadata for CornerGestureAction;
}

uint64_t sub_AB4C()
{
  sub_2A0C8();
  if (qword_39200 != -1) {
    swift_once();
  }
  id v0 = (id)qword_3A210;
  return sub_2A1E8();
}

BOOL sub_AC5C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void *sub_AC70@<X0>(void *result@<X0>, unsigned char *a2@<X8>)
{
  if ((unint64_t)(*result + 1) < 3) {
    uint64_t v2 = *result + 1;
  }
  else {
    LOBYTE(v2) = 3;
  }
  *a2 = v2;
  return result;
}

void sub_AC8C(void *a1@<X8>)
{
  *a1 = *v1 - 1;
}

unint64_t sub_ACA0()
{
  unint64_t result = qword_39468;
  if (!qword_39468)
  {
    sub_A130(&qword_39470);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39468);
  }
  return result;
}

void sub_ACFC(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

Swift::Int sub_AD08()
{
  uint64_t v1 = *v0;
  sub_2A778();
  sub_2A788(v1 - 1);
  return sub_2A798();
}

void sub_AD50()
{
  sub_2A788(*v0 - 1);
}

Swift::Int sub_AD80()
{
  uint64_t v1 = *v0;
  sub_2A778();
  sub_2A788(v1 - 1);
  return sub_2A798();
}

id sub_ADC4@<X0>(void *a1@<X8>)
{
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    int v3 = result;
    int quickNoteCapability = MobileGestalt_get_quickNoteCapability();

    if (quickNoteCapability) {
      uint64_t v5 = &off_35250;
    }
    else {
      uint64_t v5 = &off_35278;
    }
    *a1 = v5;
    return (id)swift_bridgeObjectRetain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_AE40()
{
  unint64_t result = qword_39478;
  if (!qword_39478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39478);
  }
  return result;
}

unint64_t sub_AE98()
{
  unint64_t result = qword_39480;
  if (!qword_39480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39480);
  }
  return result;
}

uint64_t sub_AEEC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_AF60()
{
  uint64_t v1 = v0;
  sub_9134(&qword_39338);
  __chkstk_darwin();
  int v3 = &v16[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_9134(&qword_39348);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  BOOL v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_39230 != -1) {
    swift_once();
  }
  id v8 = (id)qword_3A248;
  *(void *)(v1 + 16) = sub_29F08();
  id v9 = v8;
  *(void *)(v1 + 24) = sub_29F08();
  uint64_t v10 = v1
      + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings36ProductivityGesturesSectionViewModel__productivityGesturesEnabled;
  v16[15] = sub_C198() & 1;
  sub_29EA8();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v5 + 32))(v10, v7, v4);
  uint64_t v11 = (void *)(v1 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings36ProductivityGesturesSectionViewModel_referrer);
  uint64_t v12 = sub_2A598();
  void *v11 = 0;
  v11[1] = 0;
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v3, 1, 1, v12);
  sub_2A578();
  swift_retain();
  uint64_t v13 = sub_2A568();
  NSString v14 = (void *)swift_allocObject();
  v14[2] = v13;
  v14[3] = &protocol witness table for MainActor;
  v14[4] = v1;
  sub_19004((uint64_t)v3, (uint64_t)&unk_39560, (uint64_t)v14);
  swift_release();
  return v1;
}

uint64_t sub_B1FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[13] = a4;
  v4[14] = sub_9134(&qword_393D0);
  v4[15] = swift_task_alloc();
  v4[16] = sub_9134(&qword_393D8);
  v4[17] = swift_task_alloc();
  uint64_t v5 = sub_9134(&qword_393E0);
  v4[18] = v5;
  v4[19] = *(void *)(v5 - 8);
  v4[20] = swift_task_alloc();
  uint64_t v6 = sub_9134(&qword_393E8);
  v4[21] = v6;
  v4[22] = *(void *)(v6 - 8);
  v4[23] = swift_task_alloc();
  uint64_t v7 = sub_9134(&qword_393F0);
  v4[24] = v7;
  v4[25] = *(void *)(v7 - 8);
  v4[26] = swift_task_alloc();
  v4[27] = sub_2A578();
  v4[28] = sub_2A568();
  uint64_t v9 = sub_2A548();
  v4[29] = v9;
  v4[30] = v8;
  return _swift_task_switch(sub_B420, v9, v8);
}

uint64_t sub_B420()
{
  uint64_t v1 = v0[23];
  uint64_t v11 = v0[22];
  uint64_t v3 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[19];
  swift_beginAccess();
  sub_9134(&qword_39348);
  sub_29EB8();
  swift_endAccess();
  sub_A7C8(&qword_393F8, &qword_393E0);
  sub_29EF8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  sub_A7C8(&qword_39400, &qword_393D8);
  sub_2A758();
  sub_2A6F8();
  sub_2A5B8();
  sub_2A708();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v2);
  sub_2A748();
  v0[31] = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings36ProductivityGesturesSectionViewModel_referrer;
  uint64_t v6 = sub_2A568();
  v0[32] = v6;
  if (v6)
  {
    swift_getObjectType();
    uint64_t v7 = sub_2A548();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  v0[33] = v7;
  v0[34] = v9;
  return _swift_task_switch(sub_B64C, v7, v9);
}

uint64_t sub_B64C()
{
  uint64_t v1 = sub_2A728();
  if (v1 < 1)
  {
    uint64_t v6 = v0[32];
    sub_2A738();
    v0[38] = sub_2A718();
    sub_A7C8(&qword_39408, &qword_393D0);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[39] = v7;
    void *v7 = v0;
    v7[1] = sub_BBBC;
    uint64_t v4 = v0 + 40;
    uint64_t v5 = v6;
  }
  else
  {
    v0[35] = v1;
    uint64_t v2 = v0[32];
    v0[36] = sub_2A718();
    sub_A7C8(&qword_39408, &qword_393D0);
    uint64_t v3 = (void *)swift_task_alloc();
    v0[37] = v3;
    void *v3 = v0;
    v3[1] = sub_B838;
    uint64_t v4 = (void *)((char *)v0 + 322);
    uint64_t v5 = v2;
  }
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v4, v5, &protocol witness table for MainActor);
}

uint64_t sub_B838()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_BBA4;
  }
  else
  {
    (*(void (**)(void))(v2 + 288))();
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_B960;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_B960()
{
  if (*(unsigned char *)(v0 + 322) == 2)
  {
    sub_2A738();
    swift_release();
    uint64_t v1 = *(void *)(v0 + 232);
    uint64_t v2 = *(void *)(v0 + 240);
    return _swift_task_switch(sub_5EE0, v1, v2);
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + 280);
    BOOL v4 = v3 <= 1;
    uint64_t v5 = v3 - 1;
    if (v4)
    {
      uint64_t v10 = *(void *)(v0 + 256);
      sub_2A738();
      *(void *)(v0 + 304) = sub_2A718();
      sub_A7C8(&qword_39408, &qword_393D0);
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 312) = v11;
      void *v11 = v0;
      v11[1] = sub_BBBC;
      uint64_t v8 = v0 + 320;
      uint64_t v9 = v10;
    }
    else
    {
      *(void *)(v0 + 280) = v5;
      uint64_t v6 = *(void *)(v0 + 256);
      *(void *)(v0 + 288) = sub_2A718();
      sub_A7C8(&qword_39408, &qword_393D0);
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 296) = v7;
      void *v7 = v0;
      v7[1] = sub_B838;
      uint64_t v8 = v0 + 322;
      uint64_t v9 = v6;
    }
    return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v8, v9, &protocol witness table for MainActor);
  }
}

uint64_t sub_BBA4()
{
  return (*(uint64_t (**)(void))(v0 + 288))();
}

uint64_t sub_BBBC()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_BCE4;
  }
  else
  {
    (*(void (**)(void))(v2 + 304))();
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_BCFC;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_BCE4()
{
  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t sub_BCFC()
{
  swift_release();
  *(unsigned char *)(v0 + 324) = *(unsigned char *)(v0 + 320);
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 240);
  return _swift_task_switch(sub_BD68, v1, v2);
}

uint64_t sub_BD68()
{
  int v1 = *(unsigned __int8 *)(v0 + 324);
  if (v1 == 2)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 200) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 192));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else
  {
    uint64_t v4 = v1 & 1;
    *(unsigned char *)(v0 + 323) = v1 & 1;
    swift_retain();
    sub_29F28();
    swift_release();
    *(unsigned char *)(v0 + 321) = 0;
    swift_retain();
    sub_29F28();
    swift_release();
    if (qword_39220 != -1) {
      swift_once();
    }
    uint64_t v5 = (uint64_t *)(*(void *)(v0 + 104) + *(void *)(v0 + 248));
    uint64_t v6 = *v5;
    uint64_t v7 = v5[1];
    swift_bridgeObjectRetain();
    sub_184F0(2, v4, v6, v7);
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_2A568();
    *(void *)(v0 + 256) = v8;
    if (v8)
    {
      swift_getObjectType();
      uint64_t v9 = sub_2A548();
      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v11 = 0;
    }
    *(void *)(v0 + 264) = v9;
    *(void *)(v0 + 272) = v11;
    return _swift_task_switch(sub_B64C, v9, v11);
  }
}

uint64_t sub_BF7C()
{
  swift_release();
  swift_release();
  uint64_t v1 = v0
     + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings36ProductivityGesturesSectionViewModel__productivityGesturesEnabled;
  uint64_t v2 = sub_9134(&qword_39348);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_C044()
{
  return type metadata accessor for ProductivityGesturesSectionViewModel();
}

uint64_t type metadata accessor for ProductivityGesturesSectionViewModel()
{
  uint64_t result = qword_394B8;
  if (!qword_394B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_C098()
{
  sub_C140();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_C140()
{
  if (!qword_39288)
  {
    unint64_t v0 = sub_29EE8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_39288);
    }
  }
}

uint64_t sub_C198()
{
  if (qword_39230 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)qword_3A248;
  NSString v1 = sub_2A4C8();
  id v2 = [v0 valueForKey:v1];

  if (v2)
  {
    sub_2A618();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }
  sub_9CCC((uint64_t)&v10, (uint64_t)v12);
  if (v13)
  {
    if (swift_dynamicCast())
    {
      int v3 = v9;
      goto LABEL_11;
    }
  }
  else
  {
    sub_9D34((uint64_t)v12);
  }
  int v3 = 1;
LABEL_11:
  uint64_t v4 = (void *)qword_3A248;
  NSString v5 = sub_2A4C8();
  id v6 = [v4 valueForKey:v5];

  if (v6)
  {
    sub_2A618();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }
  sub_9CCC((uint64_t)&v10, (uint64_t)v12);
  if (!v13)
  {
    sub_9D34((uint64_t)v12);
LABEL_19:
    int v7 = 0;
    uint64_t result = 0;
    if (!v3) {
      return result;
    }
    return v7 ^ 1u;
  }
  if (!swift_dynamicCast()) {
    goto LABEL_19;
  }
  if (v3)
  {
    int v7 = v9;
    return v7 ^ 1u;
  }
  return 0;
}

uint64_t sub_C390()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_C3D0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  int v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_9F04;
  return sub_B1FC(a1, v4, v5, v6);
}

uint64_t destroy for PictureInPictureSection()
{
  swift_release();

  return swift_release();
}

void *_s31MultitaskingAndGesturesSettings23PictureInPictureSectionVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for PictureInPictureSection(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for PictureInPictureSection(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for PictureInPictureSection(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PictureInPictureSection(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PictureInPictureSection(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PictureInPictureSection()
{
  return &type metadata for PictureInPictureSection;
}

uint64_t sub_C668()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_C684@<X0>(uint64_t a1@<X8>)
{
  if ([self isPictureInPictureSupported])
  {
    v10[1] = v10;
    __chkstk_darwin();
    sub_2A0C8();
    if (qword_39200 != -1) {
      swift_once();
    }
    id v2 = (id)qword_3A210;
    uint64_t v12 = sub_2A1E8();
    uint64_t v13 = v3;
    char v14 = v4 & 1;
    uint64_t v15 = v5;
    sub_CB54((uint64_t)&v11);
    sub_9134(&qword_39570);
    sub_9134(&qword_39578);
    sub_CD84();
    sub_CEB4();
    sub_2A3F8();
    uint64_t v6 = sub_9134(&qword_39568);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(a1, 0, 1, v6);
  }
  else
  {
    uint64_t v8 = sub_9134(&qword_39568);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    return v9(a1, 1, 1, v8);
  }
}

uint64_t sub_C928()
{
  uint64_t v0 = sub_9134(&qword_39590);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_29F38();
  sub_2A388();
  sub_CE00();
  sub_2A298();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_CA74@<X0>(uint64_t a1@<X8>)
{
  sub_2A0C8();
  if (qword_39200 != -1) {
    swift_once();
  }
  id v2 = (id)qword_3A210;
  uint64_t result = sub_2A1E8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

id sub_CB54@<X0>(uint64_t a1@<X8>)
{
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    uint64_t v3 = result;
    int homeButtonType = MobileGestalt_get_homeButtonType();

    if (homeButtonType == 2)
    {
      sub_2A0C8();
      if (qword_39200 == -1) {
        goto LABEL_6;
      }
    }
    else
    {
      sub_2A0C8();
      if (qword_39200 == -1)
      {
LABEL_6:
        id v5 = (id)qword_3A210;
        sub_2A1E8();
        id result = (id)sub_2A108();
        *(_OWORD *)a1 = v6;
        *(_OWORD *)(a1 + 16) = v7;
        *(unsigned char *)(a1 + 32) = v8;
        return result;
      }
    }
    swift_once();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_CD50()
{
  return sub_2A288();
}

uint64_t sub_CD6C@<X0>(uint64_t a1@<X8>)
{
  return sub_C684(a1);
}

uint64_t sub_CD78()
{
  return sub_C928();
}

unint64_t sub_CD84()
{
  unint64_t result = qword_39580;
  if (!qword_39580)
  {
    sub_A130(&qword_39570);
    sub_CE00();
    sub_CE5C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39580);
  }
  return result;
}

unint64_t sub_CE00()
{
  unint64_t result = qword_39588;
  if (!qword_39588)
  {
    sub_A130(&qword_39590);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39588);
  }
  return result;
}

unint64_t sub_CE5C()
{
  unint64_t result = qword_39598;
  if (!qword_39598)
  {
    sub_2A138();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39598);
  }
  return result;
}

unint64_t sub_CEB4()
{
  unint64_t result = qword_395A0;
  if (!qword_395A0)
  {
    sub_A130(&qword_39578);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_395A0);
  }
  return result;
}

unint64_t sub_CF24()
{
  unint64_t result = qword_395A8;
  if (!qword_395A8)
  {
    sub_A130(&qword_395B0);
    sub_CF98();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_395A8);
  }
  return result;
}

unint64_t sub_CF98()
{
  unint64_t result = qword_395B8;
  if (!qword_395B8)
  {
    sub_A130(&qword_39568);
    sub_CD84();
    sub_CEB4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_395B8);
  }
  return result;
}

uint64_t sub_D020()
{
  return sub_12E84();
}

uint64_t sub_D058@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_9134(&qword_395C0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  long long v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v17 = v1;
  sub_2A0C8();
  if (qword_39200 != -1) {
    swift_once();
  }
  id v7 = (id)qword_3A210;
  *(void *)&long long v18 = sub_2A1E8();
  *((void *)&v18 + 1) = v8;
  char v19 = v9 & 1;
  uint64_t v20 = v10;
  sub_9134(&qword_39570);
  sub_CD84();
  sub_2A408();
  long long v11 = v1[1];
  long long v21 = *v1;
  long long v18 = v11;
  char v19 = *((unsigned char *)v1 + 32);
  uint64_t v12 = swift_allocObject();
  long long v13 = v1[1];
  *(_OWORD *)(v12 + 16) = *v1;
  *(_OWORD *)(v12 + 32) = v13;
  *(unsigned char *)(v12 + 48) = *((unsigned char *)v1 + 32);
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v4 + 16))(a1, v6, v3);
  char v14 = (uint64_t (**)())(a1 + *(int *)(sub_9134(&qword_395C8) + 36));
  *char v14 = sub_DAF8;
  v14[1] = (uint64_t (*)())v12;
  v14[2] = 0;
  v14[3] = 0;
  sub_DB00((uint64_t)&v21);
  sub_DB2C((uint64_t)&v18);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_D2D0()
{
  uint64_t v0 = sub_9134(&qword_39590);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for FourAndFiveFingersSectionViewModel();
  sub_DB60(&qword_395D0, (void (*)(uint64_t))type metadata accessor for FourAndFiveFingersSectionViewModel);
  sub_29F68();
  swift_getKeyPath();
  sub_29FA8();
  swift_release();
  swift_release();
  sub_2A388();
  sub_CE00();
  sub_2A298();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_D4B0@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_D530()
{
  return sub_29ED8();
}

uint64_t sub_D5A4@<X0>(uint64_t a1@<X8>)
{
  sub_2A0C8();
  if (qword_39200 != -1) {
    swift_once();
  }
  id v2 = (id)qword_3A210;
  uint64_t result = sub_2A1E8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_D684(void *a1)
{
  type metadata accessor for FourAndFiveFingersSectionViewModel();
  sub_DB60(&qword_395D0, (void (*)(uint64_t))type metadata accessor for FourAndFiveFingersSectionViewModel);
  uint64_t v2 = sub_29F58();
  if (*a1)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (uint64_t *)(*a1 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings31MultitaskingAndGesturesDeepLink_referrer);
    uint64_t v6 = *v4;
    uint64_t v5 = v4[1];
    id v7 = (void *)(v3 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings34FourAndFiveFingersSectionViewModel_referrer);
    void *v7 = v6;
    v7[1] = v5;
    swift_bridgeObjectRetain();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for MultitaskingAndGesturesDeepLink(0);
    sub_DB60((unint64_t *)&qword_395D8, (void (*)(uint64_t))type metadata accessor for MultitaskingAndGesturesDeepLink);
    uint64_t result = sub_2A008();
    __break(1u);
  }
  return result;
}

uint64_t sub_D7C8@<X0>(uint64_t a1@<X8>)
{
  return sub_D058(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for FourAndFiveFingersSection(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_D838()
{
  return swift_retain();
}

uint64_t destroy for FourAndFiveFingersSection()
{
  swift_release();

  return sub_D880();
}

uint64_t sub_D880()
{
  return swift_release();
}

uint64_t initializeWithCopy for FourAndFiveFingersSection(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  char v6 = *(unsigned char *)(a2 + 32);
  swift_retain();
  sub_D838();
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  return a1;
}

uint64_t assignWithCopy for FourAndFiveFingersSection(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = v2[1];
  uint64_t v4 = v2[2];
  uint64_t v5 = v2[3];
  LOBYTE(v2) = *((unsigned char *)v2 + 32);
  sub_D838();
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = (_BYTE)v2;
  sub_D880();
  return a1;
}

__n128 initializeWithTake for FourAndFiveFingersSection(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for FourAndFiveFingersSection(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 24);
  char v5 = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  sub_D880();
  return a1;
}

uint64_t getEnumTagSinglePayload for FourAndFiveFingersSection(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 33)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FourAndFiveFingersSection(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FourAndFiveFingersSection()
{
  return &type metadata for FourAndFiveFingersSection;
}

uint64_t sub_DA90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_DAAC()
{
  return sub_D2D0();
}

uint64_t sub_DAB4()
{
  swift_release();
  sub_D880();

  return _swift_deallocObject(v0, 49, 7);
}

uint64_t sub_DAF8()
{
  return sub_D684((void *)(v0 + 16));
}

uint64_t sub_DB00(uint64_t a1)
{
  return a1;
}

uint64_t sub_DB2C(uint64_t a1)
{
  return a1;
}

uint64_t sub_DB60(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_DBB4()
{
  unint64_t result = qword_395E0;
  if (!qword_395E0)
  {
    sub_A130(&qword_395C8);
    sub_DC30();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_395E0);
  }
  return result;
}

unint64_t sub_DC30()
{
  unint64_t result = qword_395E8;
  if (!qword_395E8)
  {
    sub_A130(&qword_395C0);
    sub_CD84();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_395E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for CornerGestureTouchTypes()
{
  return &type metadata for CornerGestureTouchTypes;
}

void *sub_DCC8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_DCD4(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_DCDC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_DCF0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_DD04@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_DD18(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_DD48@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_DD74@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_DD98(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_DDAC(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_DDC0(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_DDD4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_DDE8(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_DDFC(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_DE10(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_DE24()
{
  return *v0 == 0;
}

uint64_t sub_DE34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_DE4C(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_DE60@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_DE70(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_DE7C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_DE90@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_E030(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

unint64_t sub_DED4()
{
  unint64_t result = qword_395F0;
  if (!qword_395F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_395F0);
  }
  return result;
}

unint64_t sub_DF2C()
{
  unint64_t result = qword_395F8;
  if (!qword_395F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_395F8);
  }
  return result;
}

unint64_t sub_DF84()
{
  unint64_t result = qword_39600;
  if (!qword_39600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39600);
  }
  return result;
}

unint64_t sub_DFDC()
{
  unint64_t result = qword_39608;
  if (!qword_39608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39608);
  }
  return result;
}

uint64_t sub_E030(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

id sub_E0AC()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FindClass()
{
  return self;
}

id sub_E108()
{
  type metadata accessor for FindClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_3A210 = (uint64_t)result;
  return result;
}

unint64_t sub_E160(char a1)
{
  unint64_t result = 0x73617469746C754DLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x69746375646F7250;
      break;
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    case 4:
      unint64_t result = 0x556F54656B616853;
      break;
    case 5:
      unint64_t result = 0x654772656E726F43;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_E25C()
{
  return sub_4F50();
}

uint64_t sub_E270(unsigned __int8 *a1, char *a2)
{
  return sub_22AD8(*a1, *a2);
}

Swift::Int sub_E27C()
{
  return sub_20D90();
}

uint64_t sub_E284()
{
  return sub_20FD4();
}

Swift::Int sub_E28C()
{
  return sub_21104();
}

uint64_t sub_E294@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_11468(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_E2C4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_E160(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_E2F0()
{
  return sub_4F50();
}

uint64_t sub_E304()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings31MultitaskingAndGesturesDeepLink__sectionPath;
  uint64_t v2 = sub_9134(&qword_397F8);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings31MultitaskingAndGesturesDeepLink__highlightPath, v2);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v5 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v4, v5);
}

uint64_t sub_E3EC()
{
  return type metadata accessor for MultitaskingAndGesturesDeepLink(0);
}

uint64_t type metadata accessor for MultitaskingAndGesturesDeepLink(uint64_t a1)
{
  return sub_F124(a1, (uint64_t *)&unk_39670);
}

void sub_E414()
{
  sub_E4B0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_E4B0()
{
  if (!qword_39680)
  {
    sub_A130((uint64_t *)&unk_39688);
    unint64_t v0 = sub_29EE8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_39680);
    }
  }
}

uint64_t getEnumTagSinglePayload for MultitaskingAndGesturesSectionPath(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MultitaskingAndGesturesSectionPath(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0xE668);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MultitaskingAndGesturesSectionPath()
{
  return &type metadata for MultitaskingAndGesturesSectionPath;
}

uint64_t *sub_E6A0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    BOOL v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    BOOL v7 = a1;
    a1[1] = a2[1];
    uint64_t v8 = a3[5];
    char v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2A478();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_retain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    char v14 = (char *)v7 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_29E28();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = a3[7];
    long long v18 = (char *)v7 + v17;
    char v19 = (char *)a2 + v17;
    uint64_t v20 = sub_29E58();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  }
  return v7;
}

uint64_t sub_E82C(uint64_t a1, int *a2)
{
  swift_release();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_2A478();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = sub_29E28();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + a2[7];
  uint64_t v9 = sub_29E58();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);

  return v10(v8, v9);
}

void *sub_E92C(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2A478();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_retain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = (char *)a1 + v12;
  char v14 = (char *)a2 + v12;
  uint64_t v15 = sub_29E28();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  uint64_t v16 = a3[7];
  uint64_t v17 = (char *)a1 + v16;
  long long v18 = (char *)a2 + v16;
  uint64_t v19 = sub_29E58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  return a1;
}

void *sub_EA64(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2A478();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_29E28();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_29E58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

_OWORD *sub_EB98(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2A478();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_29E28();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_29E58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  return a1;
}

void *sub_ECB4(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2A478();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_29E28();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_29E58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 40))(v15, v16, v17);
  return a1;
}

uint64_t sub_EDE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_EDF4);
}

uint64_t sub_EDF4(char *a1, uint64_t a2, int *a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  uint64_t v9 = sub_2A478();
  if (*(_DWORD *)(*(void *)(v9 - 8) + 84) == a2)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)(v9 - 8);
    uint64_t v12 = a3[5];
LABEL_11:
    uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
    return v14(&a1[v12], a2, v10);
  }
  uint64_t v13 = sub_29E28();
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
  {
    uint64_t v10 = v13;
    uint64_t v11 = *(void *)(v13 - 8);
    uint64_t v12 = a3[6];
    goto LABEL_11;
  }
  uint64_t v15 = sub_29E58();
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
  uint64_t v17 = v15;
  long long v18 = &a1[a3[7]];

  return v16(v18, a2, v17);
}

uint64_t sub_EF78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_EF8C);
}

char *sub_EF8C(char *result, uint64_t a2, int a3, int *a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)unint64_t result = a2;
    return result;
  }
  uint64_t v8 = sub_2A478();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return (char *)v13(&v5[v11], a2, a2, v9);
  }
  uint64_t v12 = sub_29E28();
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[6];
    goto LABEL_7;
  }
  uint64_t v14 = sub_29E58();
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v16 = v14;
  uint64_t v17 = &v5[a4[7]];

  return (char *)v15(v17, a2, a2, v16);
}

uint64_t type metadata accessor for MultitaskingAndGesturesSettingsList(uint64_t a1)
{
  return sub_F124(a1, qword_39770);
}

uint64_t sub_F124(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_F15C()
{
  uint64_t result = sub_2A478();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_29E28();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_29E58();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_F26C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_F288@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v51 = a3;
  uint64_t v49 = sub_29FC8();
  uint64_t v4 = *(void *)(v49 - 8);
  __chkstk_darwin();
  uint64_t v44 = v5;
  v47 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = type metadata accessor for MultitaskingAndGesturesSettingsList(0);
  uint64_t v34 = *(void *)(v50 - 8);
  __chkstk_darwin();
  uint64_t v37 = v6;
  uint64_t v42 = (uint64_t)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_9134(&qword_397B8);
  uint64_t v46 = *(void *)(v48 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_9134(&qword_397C0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_9134(&qword_397C8);
  uint64_t v38 = *(void *)(v40 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_9134(&qword_397D0);
  __chkstk_darwin();
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_9134(&qword_397D8);
  uint64_t v39 = *(void *)(v41 - 8);
  __chkstk_darwin();
  uint64_t v36 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = a2;
  sub_9134(&qword_397E0);
  sub_A7C8(&qword_397E8, &qword_397E0);
  sub_2A1B8();
  sub_A7C8(&qword_397F0, &qword_397C0);
  v35 = v14;
  sub_2A218();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if (*a2)
  {
    swift_beginAccess();
    swift_retain();
    sub_9134(&qword_397F8);
    sub_29EB8();
    swift_endAccess();
    swift_release();
    uint64_t v18 = (uint64_t)a2;
    uint64_t v19 = v42;
    sub_114B4(v18, v42);
    uint64_t v20 = v47;
    uint64_t v21 = v49;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v47, v45, v49);
    unint64_t v22 = (*(unsigned __int8 *)(v34 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
    unint64_t v23 = (v37 + *(unsigned __int8 *)(v4 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v24 = swift_allocObject();
    sub_1168C(v19, v24 + v22);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v24 + v23, v20, v21);
    uint64_t v25 = v38;
    uint64_t v26 = v35;
    uint64_t v27 = v40;
    (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v16, v35, v40);
    uint64_t v28 = v43;
    uint64_t v29 = v46;
    uint64_t v30 = v48;
    (*(void (**)(char *, char *, uint64_t))(v46 + 16))(&v16[*(int *)(v43 + 52)], v8, v48);
    v31 = (uint64_t (**)(unsigned __int8 *))&v16[*(int *)(v28 + 56)];
    void *v31 = sub_119D0;
    v31[1] = (uint64_t (*)(unsigned __int8 *))v24;
    (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v30);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
    sub_A7C8(&qword_39800, &qword_397D0);
    uint64_t v32 = v36;
    sub_2A228();
    sub_11D9C((uint64_t)v16, &qword_397D0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v51, v32, v41);
  }
  else
  {
    type metadata accessor for MultitaskingAndGesturesDeepLink(0);
    sub_11778();
    uint64_t result = sub_2A008();
    __break(1u);
  }
  return result;
}

uint64_t sub_F964@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (*a1)
  {
    swift_retain();
    sub_100A0(0, (uint64_t)sub_1A7F8, 0, 0, (uint64_t)v70);
    swift_release();
    type metadata accessor for MultitaskingAndGesturesDeepLink(0);
    sub_11778();
    uint64_t v3 = sub_2A018();
    uint64_t v5 = v4;
    if (qword_39230 != -1) {
      swift_once();
    }
    id v6 = (id)qword_3A248;
    uint64_t v7 = sub_29F08();
    swift_retain();
    sub_10238(1, v3, v5, v7, (uint64_t)&v74);
    swift_release();
    swift_release();
    swift_release();
    uint64_t v112 = sub_2A018();
    uint64_t v113 = v8;
    v114 = sub_14328;
    uint64_t v115 = 0;
    char v116 = 0;
    swift_retain();
    sub_103C8(2, (void (*)(long long *))sub_DB2C, (uint64_t)&v78);
    swift_release();
    swift_release();
    uint64_t v107 = sub_2A018();
    uint64_t v108 = v9;
    v109 = sub_D020;
    uint64_t v110 = 0;
    char v111 = 0;
    swift_retain();
    sub_103C8(3, (void (*)(long long *))sub_DB2C, (uint64_t)&v84);
    swift_release();
    swift_release();
    uint64_t v102 = sub_2A018();
    uint64_t v103 = v10;
    v104 = sub_1E614;
    uint64_t v105 = 0;
    char v106 = 0;
    swift_retain();
    sub_103C8(4, (void (*)(long long *))sub_11E5C, (uint64_t)&v90);
    swift_release();
    swift_release();
    uint64_t v11 = sub_2A018();
    uint64_t v13 = v12;
    id v14 = (id)qword_3A248;
    uint64_t v15 = sub_29F08();
    uint64_t v96 = v11;
    uint64_t v97 = v13;
    v98 = sub_1EED0;
    uint64_t v99 = 0;
    char v100 = 0;
    uint64_t v101 = v15;
    swift_retain();
    sub_105A8(5, (uint64_t)&v49);
    swift_release();
    swift_release();
    swift_release();
    uint64_t v16 = v50;
    uint64_t v17 = v51;
    char v18 = v52;
    uint64_t v19 = v53;
    uint64_t v20 = v54;
    char v21 = v55;
    long long v22 = v49;
    uint64_t v23 = v70[0];
    uint64_t v24 = v70[1];
    char v25 = v71;
    uint64_t v26 = v72;
    char v27 = v73;
    uint64_t v28 = v75;
    uint64_t v29 = v76;
    char v30 = v77;
    uint64_t v31 = v79;
    uint64_t v32 = v80;
    char v33 = v81;
    uint64_t v34 = v82;
    char v35 = v83;
    uint64_t v36 = v85;
    uint64_t v37 = v86;
    *(_DWORD *)(a2 + 17) = v49;
    *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)&v49 + 3);
    char v38 = v87;
    *(unsigned char *)(a2 + 32) = v27;
    *(_DWORD *)(a2 + 36) = *(_DWORD *)&v69[3];
    *(_DWORD *)(a2 + 33) = *(_DWORD *)v69;
    uint64_t v39 = v88;
    *(unsigned char *)(a2 + 72) = v30;
    *(_DWORD *)(a2 + 76) = *(_DWORD *)&v68[3];
    *(_DWORD *)(a2 + 73) = *(_DWORD *)v68;
    *(_DWORD *)(a2 + 116) = *(_DWORD *)&v67[3];
    *(_DWORD *)(a2 + 113) = *(_DWORD *)v67;
    char v40 = v89;
    *(unsigned char *)(a2 + 128) = v35;
    *(_DWORD *)(a2 + 132) = *(_DWORD *)&v66[3];
    *(_DWORD *)(a2 + 129) = *(_DWORD *)v66;
    *(_DWORD *)(a2 + 172) = *(_DWORD *)&v65[3];
    *(_DWORD *)(a2 + 169) = *(_DWORD *)v65;
    *(unsigned char *)(a2 + 184) = v40;
    *(_DWORD *)(a2 + 284) = *(_DWORD *)&v61[3];
    *(_DWORD *)(a2 + 281) = *(_DWORD *)v61;
    uint64_t v41 = v91;
    uint64_t v42 = v92;
    *(_DWORD *)(a2 + 188) = *(_DWORD *)&v64[3];
    *(_DWORD *)(a2 + 185) = *(_DWORD *)v64;
    *(_DWORD *)(a2 + 228) = *(_DWORD *)&v63[3];
    *(_DWORD *)(a2 + 225) = *(_DWORD *)v63;
    *(unsigned char *)(a2 + 240) = v95;
    *(_DWORD *)(a2 + 244) = *(_DWORD *)&v62[3];
    *(_DWORD *)(a2 + 241) = *(_DWORD *)v62;
    char v43 = v93;
    *(unsigned char *)(a2 + 304) = v21;
    uint64_t v44 = v94;
    uint64_t v47 = v23;
    uint64_t v48 = v24;
    *(void *)a2 = v23;
    *(void *)(a2 + 8) = v24;
    *(unsigned char *)(a2 + 16) = v25 & 1;
    *(void *)(a2 + 24) = v26;
    *(_OWORD *)(a2 + 40) = v74;
    *(void *)(a2 + 56) = v28;
    *(void *)(a2 + 64) = v29;
    *(_OWORD *)(a2 + 80) = v78;
    *(void *)(a2 + 96) = v31;
    *(void *)(a2 + 104) = v32;
    *(unsigned char *)(a2 + 112) = v33 & 1;
    *(void *)(a2 + 120) = v34;
    *(_OWORD *)(a2 + 136) = v84;
    *(void *)(a2 + 152) = v36;
    *(void *)(a2 + 160) = v37;
    *(unsigned char *)(a2 + 168) = v38 & 1;
    *(void *)(a2 + 176) = v39;
    *(_OWORD *)(a2 + 192) = v90;
    *(void *)(a2 + 208) = v41;
    *(void *)(a2 + 216) = v42;
    *(unsigned char *)(a2 + 224) = v43 & 1;
    *(void *)(a2 + 232) = v44;
    *(_OWORD *)(a2 + 248) = v22;
    *(void *)(a2 + 264) = v16;
    *(void *)(a2 + 272) = v17;
    *(unsigned char *)(a2 + 280) = v18;
    *(void *)(a2 + 288) = v19;
    *(void *)(a2 + 296) = v20;
    char v46 = v25 & 1;
    char v60 = v25 & 1;
    char v59 = v33 & 1;
    char v58 = v38 & 1;
    char v57 = v43 & 1;
    char v56 = v18;
    sub_11DF8(v23, v24, v25 & 1);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_D838();
    swift_retain();
    swift_retain();
    sub_D838();
    swift_retain();
    swift_retain();
    sub_D838();
    swift_retain();
    swift_retain();
    sub_D838();
    swift_retain();
    swift_retain();
    swift_release();
    sub_D880();
    swift_release();
    swift_release();
    swift_release();
    sub_D880();
    swift_release();
    swift_release();
    sub_D880();
    swift_release();
    swift_release();
    sub_D880();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    sub_11E08(v47, v48, v46);
    return swift_release();
  }
  else
  {
    type metadata accessor for MultitaskingAndGesturesDeepLink(0);
    sub_11778();
    uint64_t result = sub_2A008();
    __break(1u);
  }
  return result;
}

id sub_100A0@<X0>(char a1@<W1>, uint64_t a2@<X2>, uint64_t a3@<X3>, char a4@<W4>, uint64_t a5@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  if (v13 != 6 && (sub_22AD8(v13, a1) & 1) != 0)
  {
    sub_2A2B8();
LABEL_6:
    sub_2A428();
    swift_retain_n();
    swift_retain();
    sub_9134(&qword_39820);
    sub_A7C8(&qword_39828, &qword_39820);
    uint64_t v11 = sub_2A398();
    char v12 = a4 & 1;
    sub_11DF8(a2, a3, v12);
    swift_release();
    id result = (id)swift_release_n();
    *(void *)a5 = a2;
    *(void *)(a5 + 8) = a3;
    *(unsigned char *)(a5 + 16) = v12;
    *(void *)(a5 + 24) = v11;
    *(unsigned char *)(a5 + 32) = a1;
    return result;
  }
  id result = [self tableCellGroupedBackgroundColor];
  if (result)
  {
    sub_2A2A8();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

id sub_10238@<X0>(char a1@<W1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  if (v12 != 6 && (sub_22AD8(v12, a1) & 1) != 0)
  {
    sub_2A2B8();
LABEL_6:
    sub_2A428();
    swift_retain_n();
    swift_retain();
    sub_9134(&qword_39820);
    sub_A7C8(&qword_39828, &qword_39820);
    uint64_t v11 = sub_2A398();
    swift_retain();
    swift_retain();
    swift_release();
    id result = (id)swift_release_n();
    *(void *)a5 = a2;
    *(void *)(a5 + 8) = a3;
    *(void *)(a5 + 16) = a4;
    *(void *)(a5 + 24) = v11;
    *(unsigned char *)(a5 + 32) = a1;
    return result;
  }
  id result = [self tableCellGroupedBackgroundColor];
  if (result)
  {
    sub_2A2A8();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

id sub_103C8@<X0>(char a1@<W1>, void (*a2)(long long *)@<X2>, uint64_t a3@<X8>)
{
  uint64_t v7 = *v3;
  uint64_t v6 = v3[1];
  uint64_t v8 = v3[2];
  uint64_t v14 = v3[3];
  char v13 = *((unsigned char *)v3 + 32);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  if v15 != 6 && (sub_22AD8(v15, a1))
  {
    uint64_t v9 = sub_2A2B8();
LABEL_6:
    *(void *)&long long v15 = v9;
    *((void *)&v15 + 1) = sub_2A428();
    swift_retain_n();
    swift_retain();
    sub_9134(&qword_39820);
    sub_A7C8(&qword_39828, &qword_39820);
    uint64_t v11 = sub_2A398();
    long long v17 = *(_OWORD *)v3;
    long long v15 = *((_OWORD *)v3 + 1);
    char v16 = *((unsigned char *)v3 + 32);
    sub_DB00((uint64_t)&v17);
    a2(&v15);
    swift_release();
    id result = (id)swift_release_n();
    *(void *)a3 = v7;
    *(void *)(a3 + 8) = v6;
    *(void *)(a3 + 16) = v8;
    *(void *)(a3 + 24) = v14;
    *(unsigned char *)(a3 + 32) = v13 & 1;
    *(void *)(a3 + 40) = v11;
    *(unsigned char *)(a3 + 48) = a1;
    return result;
  }
  id result = [self tableCellGroupedBackgroundColor];
  if (result)
  {
    uint64_t v9 = sub_2A2A8();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

id sub_105A8@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t v6 = *v2;
  uint64_t v5 = v2[1];
  uint64_t v12 = v2[3];
  uint64_t v13 = v2[2];
  char v11 = *((unsigned char *)v2 + 32);
  uint64_t v7 = v2[5];
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  if v15 != 6 && (sub_22AD8(v15, a1))
  {
    uint64_t v8 = sub_2A2B8();
LABEL_6:
    *(void *)&long long v15 = v8;
    *((void *)&v15 + 1) = sub_2A428();
    swift_retain_n();
    swift_retain();
    sub_9134(&qword_39820);
    sub_A7C8(&qword_39828, &qword_39820);
    uint64_t v10 = sub_2A398();
    long long v17 = *(_OWORD *)v2;
    long long v15 = *((_OWORD *)v2 + 1);
    char v16 = *((unsigned char *)v2 + 32);
    uint64_t v14 = v7;
    sub_DB00((uint64_t)&v17);
    sub_DB2C((uint64_t)&v15);
    sub_DB00((uint64_t)&v14);
    swift_release();
    id result = (id)swift_release_n();
    *(void *)a2 = v6;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v13;
    *(void *)(a2 + 24) = v12;
    *(unsigned char *)(a2 + 32) = v11 & 1;
    *(void *)(a2 + 40) = v7;
    *(void *)(a2 + 48) = v10;
    *(unsigned char *)(a2 + 56) = a1;
    return result;
  }
  id result = [self tableCellGroupedBackgroundColor];
  if (result)
  {
    uint64_t v8 = sub_2A2A8();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_10790(unsigned __int8 *a1, void *a2)
{
  uint64_t v4 = *(void *)(type metadata accessor for MultitaskingAndGesturesSettingsList(0) - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin();
  uint64_t v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_9134(&qword_39338);
  uint64_t result = __chkstk_darwin();
  uint64_t v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  int v10 = *a1;
  if (v10 != 6)
  {
    if (*a2)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_29EC8();
      swift_release();
      swift_release();
      uint64_t result = swift_release();
      if (v16[15] == 6)
      {
        v16[14] = v10;
        sub_2A438();
        sub_11AAC();
        sub_29FB8();
        uint64_t v11 = sub_2A598();
        (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
        sub_114B4((uint64_t)a2, (uint64_t)&v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)]);
        sub_2A578();
        uint64_t v12 = sub_2A568();
        unint64_t v13 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
        uint64_t v14 = v13 + v5;
        uint64_t v15 = swift_allocObject();
        *(void *)(v15 + 16) = v12;
        *(void *)(v15 + 24) = &protocol witness table for MainActor;
        sub_1168C((uint64_t)v6, v15 + v13);
        *(unsigned char *)(v15 + v14) = v10;
        sub_110A8((uint64_t)v9, (uint64_t)&unk_39818, v15);
        return swift_release();
      }
    }
    else
    {
      type metadata accessor for MultitaskingAndGesturesDeepLink(0);
      sub_11778();
      uint64_t result = sub_2A008();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_10A30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 90) = a5;
  *(void *)(v5 + 16) = a4;
  sub_2A578();
  *(void *)(v5 + 24) = sub_2A568();
  uint64_t v7 = sub_2A548();
  *(void *)(v5 + 32) = v7;
  *(void *)(v5 + 40) = v6;
  return _swift_task_switch(sub_10ACC, v7, v6);
}

uint64_t sub_10ACC()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_10B64;
  return static Task<>.sleep(nanoseconds:)(1000000000);
}

uint64_t sub_10B64()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 56) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 40);
  uint64_t v4 = *(void *)(v2 + 32);
  if (v0) {
    uint64_t v5 = sub_10FE0;
  }
  else {
    uint64_t v5 = sub_10CA0;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10CA0()
{
  unint64_t v1 = *(uint64_t **)(v0 + 16);
  uint64_t v2 = *v1;
  *(void *)(v0 + 64) = *v1;
  if (v2)
  {
    char v3 = *(unsigned char *)(v0 + 90);
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 88) = v3;
    swift_retain();
    sub_29ED8();
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_10DEC;
    return static Task<>.sleep(nanoseconds:)(500000000);
  }
  else
  {
    type metadata accessor for MultitaskingAndGesturesDeepLink(0);
    sub_11778();
    return sub_2A008();
  }
}

uint64_t sub_10DEC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 80) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 40);
  uint64_t v4 = *(void *)(v2 + 32);
  if (v0) {
    uint64_t v5 = sub_11044;
  }
  else {
    uint64_t v5 = sub_10F28;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10F28()
{
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 89) = 6;
  swift_retain();
  sub_29ED8();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10FE0()
{
  swift_release();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_11044()
{
  swift_release();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_110A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2A598();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2A588();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_11D9C(a1, &qword_39338);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2A548();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_11230@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin();
  sub_114B4(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_1168C((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  *a2 = sub_116F0;
  a2[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v7;
  return result;
}

unint64_t sub_11320()
{
  unint64_t result = qword_397B0;
  if (!qword_397B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_397B0);
  }
  return result;
}

uint64_t sub_11374@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_113F4()
{
  return sub_29ED8();
}

uint64_t sub_11468(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_352A0;
  v6._object = a2;
  unint64_t v4 = sub_2A6E8(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 6) {
    return 6;
  }
  else {
    return v4;
  }
}

uint64_t sub_114B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MultitaskingAndGesturesSettingsList(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_11518()
{
  unint64_t v1 = (int *)(type metadata accessor for MultitaskingAndGesturesSettingsList(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_release();
  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = sub_2A478();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v6 + v1[8];
  uint64_t v10 = sub_29E28();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = v6 + v1[9];
  uint64_t v12 = sub_29E58();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_1168C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MultitaskingAndGesturesSettingsList(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_116F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for MultitaskingAndGesturesSettingsList(0) - 8);
  uint64_t v6 = (void *)(v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));

  return sub_F288(a1, v6, a2);
}

uint64_t sub_11770@<X0>(uint64_t a1@<X8>)
{
  return sub_F964(*(void **)(v1 + 16), a1);
}

unint64_t sub_11778()
{
  unint64_t result = qword_395D8;
  if (!qword_395D8)
  {
    type metadata accessor for MultitaskingAndGesturesDeepLink(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_395D8);
  }
  return result;
}

uint64_t sub_117D0()
{
  uint64_t v1 = (int *)(type metadata accessor for MultitaskingAndGesturesSettingsList(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = sub_29FC8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v3 + v4 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v2 | v7 | 7;
  uint64_t v11 = v0 + v3;
  swift_release();
  uint64_t v12 = v0 + v3 + v1[7];
  uint64_t v13 = sub_2A478();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  uint64_t v14 = v11 + v1[8];
  uint64_t v15 = sub_29E28();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  uint64_t v16 = v11 + v1[9];
  uint64_t v17 = sub_29E58();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v5);

  return _swift_deallocObject(v0, v9, v10);
}

uint64_t sub_119D0(unsigned __int8 *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for MultitaskingAndGesturesSettingsList(0) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_29FC8();

  return sub_10790(a1, (void *)(v1 + v4));
}

unint64_t sub_11AAC()
{
  unint64_t result = qword_39808;
  if (!qword_39808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_39808);
  }
  return result;
}

uint64_t sub_11B00()
{
  uint64_t v1 = (int *)(type metadata accessor for MultitaskingAndGesturesSettingsList(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  uint64_t v5 = *(void *)(*(void *)v1 + 64) + v3 + 1;
  swift_unknownObjectRelease();
  uint64_t v6 = v0 + v3;
  swift_release();
  uint64_t v7 = v0 + v3 + v1[7];
  uint64_t v8 = sub_2A478();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v6 + v1[8];
  uint64_t v10 = sub_29E28();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = v6 + v1[9];
  uint64_t v12 = sub_29E58();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);

  return _swift_deallocObject(v0, v5, v4);
}

uint64_t sub_11C80(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for MultitaskingAndGesturesSettingsList(0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  char v9 = *(unsigned char *)(v1 + v5 + *(void *)(v4 + 64));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_9F04;
  return sub_10A30(a1, v6, v7, v8, v9);
}

uint64_t sub_11D9C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_9134(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_11DF8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return _objc_retain_x1();
  }
  else {
    return swift_retain();
  }
}

uint64_t sub_11E08(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return _objc_release_x1();
  }
  else {
    return swift_release();
  }
}

uint64_t sub_11E20()
{
  return sub_A7C8(&qword_39830, &qword_39838);
}

id sub_11E60()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for MultiTaskingDisplayManager()) init];
  qword_3A220 = (uint64_t)result;
  return result;
}

uint64_t sub_11E94()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  return v1;
}

char *sub_11F08()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_9134(&qword_39348);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  unint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = &v0[OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager__isExternalDisplayConnected];
  uint64_t v7 = v0;
  LOBYTE(v22) = sub_12BDC() & 1;
  sub_29EA8();
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v5, v2);
  *(void *)&v7[OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_displayService] = 0;
  *(void *)&v7[OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayInfo] = 0;
  *(void *)&v7[OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayObserver] = 0;

  v23.receiver = v7;
  v23.super_class = ObjectType;
  uint64_t v8 = (char *)objc_msgSendSuper2(&v23, "init");
  id result = (char *)(id)MobileGestalt_get_current_device();
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v10 = result;
  char deviceSupportsEnhancedMultitasking = MobileGestalt_get_deviceSupportsEnhancedMultitasking();

  if (deviceSupportsEnhancedMultitasking)
  {
LABEL_5:
    id v14 = [objc_allocWithZone((Class)SBSExternalDisplayService) init];
    uint64_t v15 = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_displayService;
    uint64_t v16 = *(void **)&v8[OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_displayService];
    *(void *)&v8[OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_displayService] = v14;

    uint64_t v17 = *(void **)&v8[v15];
    if (v17) {
      [v17 addObserver:v8];
    }
    if (sub_12BDC()) {
      sub_121C0();
    }
    goto LABEL_9;
  }
  id result = (char *)(id)MobileGestalt_get_current_device();
  if (!result)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t v12 = result;
  int deviceSupportsSingleDisplayEnhancedMultitasking = MobileGestalt_get_deviceSupportsSingleDisplayEnhancedMultitasking();

  if (deviceSupportsSingleDisplayEnhancedMultitasking) {
    goto LABEL_5;
  }
LABEL_9:
  id v18 = [self TVOutDisplay];
  if (v18)
  {
    id v22 = v18;
    swift_getKeyPath();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v19 = sub_29E38();
    swift_release();
    swift_release();
  }
  else
  {

    uint64_t v19 = 0;
  }
  uint64_t v20 = *(void **)&v8[OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayObserver];
  *(void *)&v8[OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayObserver] = v19;

  return v8;
}

void sub_121C0()
{
  unsigned __int8 v1 = *(void **)(v0 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayInfo);
  *(void *)(v0 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayInfo) = 0;

  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_displayService);
  if (v2)
  {
    uint64_t v3 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v6[4] = sub_12D8C;
    v6[5] = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    _OWORD v6[2] = sub_124E0;
    v6[3] = &unk_358B8;
    uint64_t v4 = _Block_copy(v6);
    id v5 = v2;
    swift_release();
    [v5 getConnectedDisplayInfoWithCompletionHandler:v4];
    _Block_release(v4);
  }
}

void sub_122CC()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unsigned __int8 v1 = (void *)Strong;
    sub_121C0();
  }
}

uint64_t sub_12344(unint64_t a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (char *)Strong;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_2A6A8();
      uint64_t v4 = result;
      if (result) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
      uint64_t result = swift_bridgeObjectRetain();
      if (v4)
      {
LABEL_4:
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v6 = (id)sub_2A698();
        }
        else
        {
          if (!*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
          {
            __break(1u);
            return result;
          }
          id v6 = *(id *)(a1 + 32);
        }
        uint64_t v4 = (uint64_t)v6;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v7 = *(void **)&v3[OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayInfo];
    *(void *)&v3[OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayInfo] = v4;
  }
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    swift_beginAccess();
    uint64_t v8 = swift_unknownObjectWeakLoadStrong();
    if (v8)
    {
      char v9 = (void *)v8;
      uint64_t v10 = *(void **)(v8
                     + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayInfo);
      id v11 = v10;

      if (v10) {
    }
      }
    swift_getKeyPath();
    swift_getKeyPath();
    return sub_29ED8();
  }
  return result;
}

uint64_t sub_124E0(uint64_t a1)
{
  unsigned __int8 v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_12B9C();
  uint64_t v2 = sub_2A538();
  swift_retain();
  v1(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_12554(char a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayInfo);
  if (v3)
  {
    id v4 = [v3 identifier];
    sub_2A4F8();

    uint64_t v5 = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_displayService;
    id v6 = *(void **)(v1 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_displayService);
    if (v6)
    {
      id v7 = v6;
      NSString v8 = sub_2A4C8();
      swift_bridgeObjectRelease();
      [v7 setMirroringEnabled:a1 & 1 forDisplay:v8];

      char v9 = *(void **)(v1 + v5);
      if (!v9) {
        return;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      char v9 = *(void **)(v1 + v5);
      if (!v9) {
        return;
      }
    }
    uint64_t v10 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v13[4] = sub_12B7C;
    v13[5] = v10;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 1107296256;
    v13[2] = sub_124E0;
    v13[3] = &unk_35868;
    id v11 = _Block_copy(v13);
    id v12 = v9;
    swift_release();
    [v12 getConnectedDisplayInfoWithCompletionHandler:v11];
    _Block_release(v11);
  }
}

void sub_126EC(unint64_t a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (char *)Strong;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_2A6A8();
      if (v4) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      if (v4)
      {
LABEL_4:
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v5 = (id)sub_2A698();
        }
        else
        {
          if (!*(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)))
          {
            __break(1u);
            return;
          }
          id v5 = *(id *)(a1 + 32);
        }
        uint64_t v4 = (uint64_t)v5;
      }
    }
    swift_bridgeObjectRelease();
    id v6 = *(void **)&v3[OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayInfo];
    *(void *)&v3[OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayInfo] = v4;
  }
}

uint64_t sub_12A0C()
{
  return type metadata accessor for MultiTaskingDisplayManager();
}

uint64_t type metadata accessor for MultiTaskingDisplayManager()
{
  uint64_t result = qword_398E8;
  if (!qword_398E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_12A60()
{
  sub_C140();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_12AFC@<X0>(uint64_t *a1@<X8>)
{
  swift_getObjectType();
  uint64_t result = sub_29E98();
  *a1 = result;
  return result;
}

uint64_t sub_12B44()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_12B7C(unint64_t a1)
{
}

uint64_t sub_12B84(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_12B94()
{
  return swift_release();
}

unint64_t sub_12B9C()
{
  unint64_t result = qword_39900;
  if (!qword_39900)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_39900);
  }
  return result;
}

uint64_t sub_12BDC()
{
  id v0 = [self TVOutDisplay];
  if (v0)
  {
    uint64_t v1 = v0;
    id v2 = [v0 currentMode];

    if (v2)
    {
      if ((uint64_t)[v2 height] < 1)
      {
      }
      else
      {
        id v3 = [v2 width];

        if ((uint64_t)v3 > 0) {
          return 1;
        }
      }
    }
  }
  return 0;
}

void sub_12C88(uint64_t a1, uint64_t a2)
{
  id v5 = *(void **)(v2 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayInfo);
  *(void *)(v2 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayInfo) = 0;

  id v6 = *(void **)(v2 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_displayService);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v10[4] = a1;
    v10[5] = v7;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 1107296256;
    void v10[2] = sub_124E0;
    v10[3] = a2;
    NSString v8 = _Block_copy(v10);
    id v9 = v6;
    swift_release();
    [v9 getConnectedDisplayInfoWithCompletionHandler:v8];
    _Block_release(v8);
  }
}

uint64_t sub_12D8C(unint64_t a1)
{
  return sub_12344(a1);
}

const char *sub_12D94()
{
  return "preferences";
}

id sub_12DA0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 preferences];
  *a2 = result;
  return result;
}

id sub_12DDC(void *a1, id *a2)
{
  return [*a2 setPreferences:*a1];
}

void sub_12DF0()
{
}

uint64_t sub_12E10()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_12E84()
{
  uint64_t v1 = v0;
  sub_9134(&qword_39338);
  __chkstk_darwin();
  id v3 = &v16[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_9134(&qword_39348);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_39230 != -1) {
    swift_once();
  }
  id v8 = (id)qword_3A248;
  *(void *)(v1 + 16) = sub_29F08();
  id v9 = v8;
  *(void *)(v1 + 24) = sub_29F08();
  uint64_t v10 = v1
      + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings34FourAndFiveFingersSectionViewModel__fourAndFiveFingersEnabled;
  v16[15] = sub_14034() & 1;
  sub_29EA8();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v5 + 32))(v10, v7, v4);
  id v11 = (void *)(v1 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings34FourAndFiveFingersSectionViewModel_referrer);
  uint64_t v12 = sub_2A598();
  void *v11 = 0;
  v11[1] = 0;
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v3, 1, 1, v12);
  sub_2A578();
  swift_retain();
  uint64_t v13 = sub_2A568();
  id v14 = (void *)swift_allocObject();
  v14[2] = v13;
  v14[3] = &protocol witness table for MainActor;
  v14[4] = v1;
  sub_19004((uint64_t)v3, (uint64_t)&unk_39A48, (uint64_t)v14);
  swift_release();
  return v1;
}

uint64_t sub_13120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[13] = a4;
  v4[14] = sub_9134(&qword_393D0);
  v4[15] = swift_task_alloc();
  v4[16] = sub_9134(&qword_393D8);
  v4[17] = swift_task_alloc();
  uint64_t v5 = sub_9134(&qword_393E0);
  v4[18] = v5;
  v4[19] = *(void *)(v5 - 8);
  v4[20] = swift_task_alloc();
  uint64_t v6 = sub_9134(&qword_393E8);
  v4[21] = v6;
  v4[22] = *(void *)(v6 - 8);
  v4[23] = swift_task_alloc();
  uint64_t v7 = sub_9134(&qword_393F0);
  v4[24] = v7;
  v4[25] = *(void *)(v7 - 8);
  v4[26] = swift_task_alloc();
  v4[27] = sub_2A578();
  v4[28] = sub_2A568();
  uint64_t v9 = sub_2A548();
  v4[29] = v9;
  v4[30] = v8;
  return _swift_task_switch(sub_13344, v9, v8);
}

uint64_t sub_13344()
{
  uint64_t v1 = v0[23];
  uint64_t v11 = v0[22];
  uint64_t v3 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[19];
  swift_beginAccess();
  sub_9134(&qword_39348);
  sub_29EB8();
  swift_endAccess();
  sub_A7C8(&qword_393F8, &qword_393E0);
  sub_29EF8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  sub_A7C8(&qword_39400, &qword_393D8);
  sub_2A758();
  sub_2A6F8();
  sub_2A5B8();
  sub_2A708();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v2);
  sub_2A748();
  v0[31] = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings34FourAndFiveFingersSectionViewModel_referrer;
  uint64_t v6 = sub_2A568();
  v0[32] = v6;
  if (v6)
  {
    swift_getObjectType();
    uint64_t v7 = sub_2A548();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  v0[33] = v7;
  v0[34] = v9;
  return _swift_task_switch(sub_13570, v7, v9);
}

uint64_t sub_13570()
{
  uint64_t v1 = sub_2A728();
  if (v1 < 1)
  {
    uint64_t v6 = v0[32];
    sub_2A738();
    v0[38] = sub_2A718();
    sub_A7C8(&qword_39408, &qword_393D0);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[39] = v7;
    void *v7 = v0;
    v7[1] = sub_13AC8;
    uint64_t v4 = v0 + 40;
    uint64_t v5 = v6;
  }
  else
  {
    v0[35] = v1;
    uint64_t v2 = v0[32];
    v0[36] = sub_2A718();
    sub_A7C8(&qword_39408, &qword_393D0);
    uint64_t v3 = (void *)swift_task_alloc();
    v0[37] = v3;
    void *v3 = v0;
    v3[1] = sub_1375C;
    uint64_t v4 = (void *)((char *)v0 + 322);
    uint64_t v5 = v2;
  }
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v4, v5, &protocol witness table for MainActor);
}

uint64_t sub_1375C()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_BBA4;
  }
  else
  {
    (*(void (**)(void))(v2 + 288))();
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_13884;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_13884()
{
  if (*(unsigned char *)(v0 + 322) == 2)
  {
    sub_2A738();
    swift_release();
    uint64_t v1 = *(void *)(v0 + 232);
    uint64_t v2 = *(void *)(v0 + 240);
    return _swift_task_switch(sub_5EE0, v1, v2);
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + 280);
    BOOL v4 = v3 <= 1;
    uint64_t v5 = v3 - 1;
    if (v4)
    {
      uint64_t v10 = *(void *)(v0 + 256);
      sub_2A738();
      *(void *)(v0 + 304) = sub_2A718();
      sub_A7C8(&qword_39408, &qword_393D0);
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 312) = v11;
      void *v11 = v0;
      v11[1] = sub_13AC8;
      uint64_t v8 = v0 + 320;
      uint64_t v9 = v10;
    }
    else
    {
      *(void *)(v0 + 280) = v5;
      uint64_t v6 = *(void *)(v0 + 256);
      *(void *)(v0 + 288) = sub_2A718();
      sub_A7C8(&qword_39408, &qword_393D0);
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 296) = v7;
      void *v7 = v0;
      v7[1] = sub_1375C;
      uint64_t v8 = v0 + 322;
      uint64_t v9 = v6;
    }
    return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v8, v9, &protocol witness table for MainActor);
  }
}

uint64_t sub_13AC8()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_BCE4;
  }
  else
  {
    (*(void (**)(void))(v2 + 304))();
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_13BF0;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_13BF0()
{
  swift_release();
  *(unsigned char *)(v0 + 324) = *(unsigned char *)(v0 + 320);
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 240);
  return _swift_task_switch(sub_13C5C, v1, v2);
}

uint64_t sub_13C5C()
{
  int v1 = *(unsigned __int8 *)(v0 + 324);
  if (v1 == 2)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 200) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 192));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else
  {
    uint64_t v4 = v1 & 1;
    *(unsigned char *)(v0 + 323) = v1 & 1;
    swift_retain();
    sub_29F28();
    swift_release();
    *(unsigned char *)(v0 + 321) = 0;
    swift_retain();
    sub_29F28();
    swift_release();
    if (qword_39220 != -1) {
      swift_once();
    }
    uint64_t v5 = (uint64_t *)(*(void *)(v0 + 104) + *(void *)(v0 + 248));
    uint64_t v6 = *v5;
    uint64_t v7 = v5[1];
    swift_bridgeObjectRetain();
    sub_184F0(3, v4, v6, v7);
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_2A568();
    *(void *)(v0 + 256) = v8;
    if (v8)
    {
      swift_getObjectType();
      uint64_t v9 = sub_2A548();
      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v11 = 0;
    }
    *(void *)(v0 + 264) = v9;
    *(void *)(v0 + 272) = v11;
    return _swift_task_switch(sub_13570, v9, v11);
  }
}

uint64_t sub_13E70()
{
  swift_release();
  swift_release();
  uint64_t v1 = v0
     + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings34FourAndFiveFingersSectionViewModel__fourAndFiveFingersEnabled;
  uint64_t v2 = sub_9134(&qword_39348);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_13F38()
{
  return type metadata accessor for FourAndFiveFingersSectionViewModel();
}

uint64_t type metadata accessor for FourAndFiveFingersSectionViewModel()
{
  uint64_t result = qword_399A0;
  if (!qword_399A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_13F8C()
{
  sub_C140();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_14034()
{
  if (qword_39230 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)qword_3A248;
  NSString v1 = sub_2A4C8();
  id v2 = [v0 valueForKey:v1];

  if (v2)
  {
    sub_2A618();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }
  sub_9CCC((uint64_t)&v10, (uint64_t)v12);
  if (v13)
  {
    if (swift_dynamicCast())
    {
      int v3 = v9;
      goto LABEL_11;
    }
  }
  else
  {
    sub_9D34((uint64_t)v12);
  }
  int v3 = 1;
LABEL_11:
  uint64_t v4 = (void *)qword_3A248;
  NSString v5 = sub_2A4C8();
  id v6 = [v4 valueForKey:v5];

  if (v6)
  {
    sub_2A618();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }
  sub_9CCC((uint64_t)&v10, (uint64_t)v12);
  if (!v13)
  {
    sub_9D34((uint64_t)v12);
LABEL_19:
    int v7 = 0;
    uint64_t result = 0;
    if (!v3) {
      return result;
    }
    return v7 ^ 1u;
  }
  if (!swift_dynamicCast()) {
    goto LABEL_19;
  }
  if (v3)
  {
    int v7 = v9;
    return v7 ^ 1u;
  }
  return 0;
}

uint64_t sub_1422C()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1426C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  int v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_9F04;
  return sub_13120(a1, v4, v5, v6);
}

uint64_t sub_14328()
{
  return sub_AF60();
}

ValueMetadata *type metadata accessor for ProductivityGesturesSection()
{
  return &type metadata for ProductivityGesturesSection;
}

uint64_t sub_14370()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1438C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v23 = sub_9134(&qword_39A50);
  uint64_t v2 = *(void *)(v23 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = v1;
  sub_2A0C8();
  if (qword_39200 != -1) {
    swift_once();
  }
  id v5 = (id)qword_3A210;
  *(void *)&long long v31 = sub_2A1E8();
  *((void *)&v31 + 1) = v6;
  char v32 = v7 & 1;
  uint64_t v33 = v8;
  uint64_t v9 = sub_2A0E8();
  sub_2A0C8();
  id v10 = (id)qword_3A210;
  uint64_t v11 = sub_2A1E8();
  long long v25 = (unint64_t)v9;
  char v26 = 1;
  uint64_t v27 = v11;
  uint64_t v28 = v12;
  char v29 = v13 & 1;
  uint64_t v30 = v14;
  sub_9134(&qword_39570);
  sub_9134(&qword_39A58);
  sub_CD84();
  sub_A7C8(&qword_39A60, &qword_39A58);
  sub_2A3F8();
  long long v15 = v1[1];
  long long v31 = *v1;
  long long v25 = v15;
  char v26 = *((unsigned char *)v1 + 32);
  uint64_t v16 = swift_allocObject();
  long long v17 = v1[1];
  *(_OWORD *)(v16 + 16) = *v1;
  *(_OWORD *)(v16 + 32) = v17;
  *(unsigned char *)(v16 + 48) = *((unsigned char *)v1 + 32);
  uint64_t v19 = v22;
  uint64_t v18 = v23;
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 16))(v22, v4, v23);
  uint64_t v20 = (uint64_t (**)())(v19 + *(int *)(sub_9134(&qword_39A68) + 36));
  void *v20 = sub_14C7C;
  v20[1] = (uint64_t (*)())v16;
  v20[2] = 0;
  v20[3] = 0;
  sub_DB00((uint64_t)&v31);
  sub_DB2C((uint64_t)&v25);
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v18);
}

uint64_t sub_146D8()
{
  uint64_t v0 = sub_9134(&qword_39590);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ProductivityGesturesSectionViewModel();
  sub_14C84(&qword_39A70, (void (*)(uint64_t))type metadata accessor for ProductivityGesturesSectionViewModel);
  sub_29F68();
  swift_getKeyPath();
  sub_29FA8();
  swift_release();
  swift_release();
  sub_2A388();
  sub_A7C8((unint64_t *)&qword_39588, &qword_39590);
  sub_2A298();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_148DC@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1495C()
{
  return sub_29ED8();
}

uint64_t sub_149D0@<X0>(uint64_t a1@<X8>)
{
  sub_2A0C8();
  if (qword_39200 != -1) {
    swift_once();
  }
  id v2 = (id)qword_3A210;
  uint64_t result = sub_2A1E8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_14AB0(void *a1)
{
  type metadata accessor for ProductivityGesturesSectionViewModel();
  sub_14C84(&qword_39A70, (void (*)(uint64_t))type metadata accessor for ProductivityGesturesSectionViewModel);
  uint64_t v2 = sub_29F58();
  if (*a1)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (uint64_t *)(*a1 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings31MultitaskingAndGesturesDeepLink_referrer);
    uint64_t v6 = *v4;
    uint64_t v5 = v4[1];
    char v7 = (void *)(v3 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings36ProductivityGesturesSectionViewModel_referrer);
    void *v7 = v6;
    v7[1] = v5;
    swift_bridgeObjectRetain();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for MultitaskingAndGesturesDeepLink(0);
    sub_14C84((unint64_t *)&qword_395D8, (void (*)(uint64_t))type metadata accessor for MultitaskingAndGesturesDeepLink);
    uint64_t result = sub_2A008();
    __break(1u);
  }
  return result;
}

uint64_t sub_14BF4@<X0>(uint64_t a1@<X8>)
{
  return sub_1438C(a1);
}

uint64_t sub_14C30()
{
  return sub_146D8();
}

uint64_t sub_14C38()
{
  swift_release();
  sub_D880();

  return _swift_deallocObject(v0, 49, 7);
}

uint64_t sub_14C7C()
{
  return sub_14AB0((void *)(v0 + 16));
}

uint64_t sub_14C84(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_14CD8()
{
  unint64_t result = qword_39A78;
  if (!qword_39A78)
  {
    sub_A130(&qword_39A68);
    sub_14D54();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39A78);
  }
  return result;
}

unint64_t sub_14D54()
{
  unint64_t result = qword_39A80;
  if (!qword_39A80)
  {
    sub_A130(&qword_39A50);
    sub_CD84();
    sub_A7C8(&qword_39A60, &qword_39A58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39A80);
  }
  return result;
}

void destroy for MultitaskingSectionChoiceButton(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 56);
}

uint64_t initializeWithCopy for MultitaskingSectionChoiceButton(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void **)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v6 = v5;
  return a1;
}

uint64_t assignWithCopy for MultitaskingSectionChoiceButton(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 56);
  uint64_t v5 = *(void **)(a2 + 56);
  *(void *)(a1 + 56) = v5;
  id v6 = v5;

  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

__n128 initializeWithTake for MultitaskingSectionChoiceButton(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for MultitaskingSectionChoiceButton(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);

  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for MultitaskingSectionChoiceButton(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MultitaskingSectionChoiceButton(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MultitaskingSectionChoiceButton()
{
  return &type metadata for MultitaskingSectionChoiceButton;
}

uint64_t sub_150C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_150DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)&long long v55 = a1;
  uint64_t v61 = a2;
  sub_9134(&qword_39BA8);
  __chkstk_darwin();
  uint64_t v60 = (uint64_t)&v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_9134(&qword_39BB0);
  __chkstk_darwin();
  uint64_t v59 = (uint64_t)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_2A0D8();
  uint64_t v4 = *(void *)(v56 - 8);
  __chkstk_darwin();
  id v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_29FF8();
  __chkstk_darwin();
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2A328();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  uint64_t v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_9134(&qword_39BB8);
  __chkstk_darwin();
  uint64_t v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = qword_39200;
  swift_bridgeObjectRetain();
  if (v15 != -1) {
    swift_once();
  }
  id v16 = (id)qword_3A210;
  sub_2A348();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for Image.ResizingMode.stretch(_:), v9);
  uint64_t v17 = sub_2A338();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_2A418();
  sub_29F98();
  uint64_t v53 = v62;
  int v52 = v63;
  uint64_t v51 = v64;
  int v50 = v65;
  uint64_t v49 = v66;
  uint64_t v48 = v67;
  uint64_t v18 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  uint64_t v20 = v56;
  v19(v6, enum case for RoundedCornerStyle.continuous(_:), v56);
  uint64_t v21 = v6;
  uint64_t v22 = v57;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(&v8[*(int *)(v57 + 20)], v21, v20);
  __asm { FMOV            V0.2D, #5.0 }
  long long v55 = _Q0;
  *(_OWORD *)uint64_t v8 = _Q0;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v21, v20);
  uint64_t v28 = v59;
  sub_1788C((uint64_t)v8, v59);
  *(_WORD *)(v28 + *(int *)(v58 + 36)) = 256;
  sub_1794C(v28, (uint64_t)&v14[*(int *)(v54 + 36)], &qword_39BB0);
  *(void *)uint64_t v14 = v17;
  *((void *)v14 + 1) = 0;
  *((_WORD *)v14 + 8) = 1;
  *((void *)v14 + 3) = v53;
  v14[32] = v52;
  *((void *)v14 + 5) = v51;
  v14[48] = v50;
  uint64_t v29 = v48;
  *((void *)v14 + 7) = v49;
  *((void *)v14 + 8) = v29;
  swift_retain();
  sub_11D9C(v28, &qword_39BB0);
  sub_178F0((uint64_t)v8);
  swift_release();
  v19(&v8[*(int *)(v22 + 20)], v18, v20);
  *(_OWORD *)uint64_t v8 = v55;
  sub_2A2D8();
  uint64_t v30 = sub_2A2E8();
  swift_release();
  sub_29F78();
  uint64_t v31 = v60;
  sub_1788C((uint64_t)v8, v60);
  uint64_t v32 = v31 + *(int *)(sub_9134(&qword_39BC0) + 36);
  long long v33 = v69;
  *(_OWORD *)uint64_t v32 = v68;
  *(_OWORD *)(v32 + 16) = v33;
  *(void *)(v32 + 32) = v70;
  uint64_t v34 = sub_9134(&qword_39BC8);
  *(void *)(v31 + *(int *)(v34 + 52)) = v30;
  *(_WORD *)(v31 + *(int *)(v34 + 56)) = 256;
  uint64_t v35 = sub_2A418();
  uint64_t v37 = v36;
  char v38 = (uint64_t *)(v31 + *(int *)(sub_9134(&qword_39BD0) + 36));
  *char v38 = v35;
  v38[1] = v37;
  sub_178F0((uint64_t)v8);
  uint64_t v39 = sub_2A418();
  uint64_t v41 = v40;
  uint64_t v42 = sub_9134(&qword_39BD8);
  uint64_t v43 = v61;
  uint64_t v44 = v61 + *(int *)(v42 + 36);
  sub_1794C(v31, v44, &qword_39BA8);
  uint64_t v45 = (uint64_t *)(v44 + *(int *)(sub_9134(&qword_39BE0) + 36));
  *uint64_t v45 = v39;
  v45[1] = v41;
  sub_1794C((uint64_t)v14, v43, &qword_39BB8);
  sub_11D9C(v31, &qword_39BA8);
  return sub_11D9C((uint64_t)v14, &qword_39BB8);
}

uint64_t sub_1573C@<X0>(uint64_t a1@<X8>)
{
  return sub_150DC(*v1, a1);
}

void sub_15748()
{
  uint64_t v1 = *(void **)(v0 + 56);
  if (v1)
  {
    uint64_t v2 = self;
    id v3 = v1;
    id v4 = [v2 mainScreen];
    [v4 bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;

    v42.origin.x = v6;
    v42.origin.y = v8;
    v42.size.width = v10;
    v42.size.height = v12;
    double Height = CGRectGetHeight(v42);
    id v14 = [v2 mainScreen];
    [v14 bounds];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    v43.origin.x = v16;
    v43.origin.y = v18;
    v43.size.width = v20;
    v43.size.height = v22;
    double Width = CGRectGetWidth(v43);

    if (Height >= Width)
    {
      id v24 = [v2 mainScreen];
      [v24 bounds];
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      CGFloat v32 = v31;

      v44.origin.x = v26;
      v44.origin.y = v28;
      v44.size.width = v30;
      v44.size.height = v32;
      CGRectGetWidth(v44);
      id v33 = [v2 mainScreen];
      [v33 bounds];
      CGFloat v35 = v34;
      CGFloat v37 = v36;
      CGFloat v39 = v38;
      CGFloat v41 = v40;

      v45.origin.x = v35;
      v45.origin.y = v37;
      v45.size.width = v39;
      v45.size.height = v41;
      CGRectGetHeight(v45);
    }
  }
  else
  {
    type metadata accessor for MultiTaskingSectionViewModel();
    sub_17094((unint64_t *)&qword_39B08, (void (*)(uint64_t))type metadata accessor for MultiTaskingSectionViewModel);
    sub_2A008();
    __break(1u);
  }
}

uint64_t sub_15958@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v20 = sub_29FE8();
  uint64_t v2 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  id v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_9134(&qword_39A88);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  CGFloat v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_9134(&qword_39A90);
  __chkstk_darwin(v19);
  CGFloat v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  long long v12 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v11 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v11 + 64) = v12;
  *(void *)(v11 + 80) = *(void *)(v1 + 64);
  long long v13 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v11 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v11 + 32) = v13;
  uint64_t v22 = v1;
  sub_16F70(v1);
  sub_9134(&qword_39A98);
  sub_A7C8(&qword_39AA0, &qword_39A98);
  sub_2A358();
  unint64_t v23 = 0;
  unint64_t v24 = 0xE000000000000000;
  sub_2A688(45);
  swift_bridgeObjectRelease();
  unint64_t v23 = 0xD00000000000002BLL;
  unint64_t v24 = 0x800000000002D160;
  uint64_t v14 = *(void *)(v1 + 40);
  double v15 = *(void **)(v1 + 48);
  swift_bridgeObjectRetain();
  v25._countAndFlagsBits = v14;
  v25._object = v15;
  sub_2A528(v25);
  swift_bridgeObjectRelease();
  sub_A7C8(&qword_39AA8, &qword_39A88);
  sub_2A298();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_29FD8();
  sub_16FC4();
  sub_17094(&qword_39AB8, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
  uint64_t v16 = v20;
  sub_2A268();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v16);
  return sub_11D9C((uint64_t)v10, &qword_39A90);
}

void sub_15CE8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 56);
  if (v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v2 = v1;
    sub_29ED8();
    if (qword_39220 != -1) {
      swift_once();
    }
    sub_18B18();
  }
  else
  {
    type metadata accessor for MultiTaskingSectionViewModel();
    sub_17094((unint64_t *)&qword_39B08, (void (*)(uint64_t))type metadata accessor for MultiTaskingSectionViewModel);
    sub_2A008();
    __break(1u);
  }
}

uint64_t sub_15DF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_2A0E8();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v4 = sub_9134(&qword_39AC0);
  return sub_15E3C(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_15E3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v143 = sub_9134(&qword_39AC8);
  uint64_t v142 = *(void *)(v143 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v152 = (char *)&v123 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = sub_9134(&qword_39AD0);
  ((void (*)(void))__chkstk_darwin)();
  v138 = (char *)&v123 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = sub_9134(&qword_39AD8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v141 = (uint64_t)&v123 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = sub_9134(&qword_39AE0);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v144 = (uint64_t)&v123 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v140 = sub_9134(&qword_39AE8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  CGFloat v10 = (char *)&v123 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v139 = (uint64_t)&v123 - v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v123 - v13;
  uint64_t v131 = sub_9134(&qword_39AF0);
  uint64_t v129 = *(void *)(v131 - 8);
  __chkstk_darwin(v131);
  v128 = (char *)&v123 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = sub_9134(&qword_39AF8);
  __chkstk_darwin(v126);
  v130 = (char *)&v123 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_9134(&qword_39B00);
  uint64_t v17 = __chkstk_darwin(v127);
  uint64_t v159 = (uint64_t)&v123 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v158 = (uint64_t)&v123 - v19;
  uint64_t v20 = (unsigned char *)a1;
  uint64_t v21 = *(void **)(a1 + 56);
  if (!v21)
  {
    type metadata accessor for MultiTaskingSectionViewModel();
    sub_17094((unint64_t *)&qword_39B08, (void (*)(uint64_t))type metadata accessor for MultiTaskingSectionViewModel);
    sub_2A008();
    __break(1u);
    JUMPOUT(0x16EACLL);
  }
  unint64_t v22 = 0xED0000656D695441;
  unint64_t v23 = 0x7441707041656E4FLL;
  swift_getKeyPath();
  swift_getKeyPath();
  id v24 = v21;
  sub_29EC8();
  swift_release();
  swift_release();
  Swift::String v25 = (void *)v166;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();

  swift_release();
  swift_release();
  uint64_t v145 = a2;
  v154 = v10;
  id v125 = v24;
  if ((v166 & 1) == 0)
  {
    CGFloat v28 = v20;
    int v29 = *v20;
    goto LABEL_6;
  }
  id v26 = v24;
  char v27 = sub_22DB8();

  CGFloat v28 = v20;
  int v29 = *v20;
  if ((v27 & 1) == 0)
  {
LABEL_6:
    switch(v29)
    {
      case 0:
        break;
      case 1:
        unint64_t v22 = 0xEF676E69726F7272;
        unint64_t v23 = 0x694D6E6565726353;
        break;
      case 2:
        unint64_t v22 = 0x800000000002D1B0;
        unint64_t v23 = 0xD000000000000012;
        break;
      case 3:
        unint64_t v22 = 0xEC00000072656761;
        unint64_t v23 = 0x6E614D6567617453;
        break;
      default:
        JUMPOUT(0);
    }
    sub_15748();
    unint64_t v160 = v23;
    *(void *)&long long v161 = v22;
    *((void *)&v161 + 1) = v30;
    uint64_t v162 = 1;
    long long v163 = 0u;
    long long v164 = 0u;
    memset(v165, 0, 19);
    v165[19] = 1;
    goto LABEL_11;
  }
  switch(*v20)
  {
    case 3:
      swift_bridgeObjectRelease();
      break;
    default:
      char v118 = sub_2A768();
      swift_bridgeObjectRelease();
      if ((v118 & 1) == 0) {
        goto LABEL_6;
      }
      break;
  }
  uint64_t v119 = sub_2A0B8();
  sub_15748();
  uint64_t v121 = v120;
  sub_15748();
  unint64_t v160 = v119;
  long long v161 = xmmword_2BB40;
  uint64_t v162 = 0xD00000000000001DLL;
  *(void *)&long long v163 = 0x800000000002D1D0;
  *((void *)&v163 + 1) = v121;
  long long v164 = xmmword_2BB50;
  *(void *)v165 = 0x800000000002D1F0;
  *(void *)&v165[8] = v122;
  *(_DWORD *)&v165[16] = 65537;
LABEL_11:
  sub_9134(&qword_39B10);
  sub_9134(&qword_39B18);
  sub_170EC();
  sub_1718C();
  sub_2A108();
  uint64_t v157 = v166;
  uint64_t v156 = v167;
  uint64_t v151 = v168;
  uint64_t v150 = v169;
  uint64_t v149 = v170;
  uint64_t v148 = v171;
  uint64_t v155 = v172;
  uint64_t v147 = v173;
  uint64_t v146 = v174;
  uint64_t v134 = v175;
  int v133 = v176 | (v177 << 16);
  int v132 = v178;
  v124 = v28;
  v153 = v14;
  uint64_t v31 = qword_39200;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v31 != -1) {
    swift_once();
  }
  id v32 = (id)qword_3A210;
  uint64_t v33 = sub_2A1E8();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v123 = v36;
  char v39 = v38 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v41 = sub_2A1A8();
  uint64_t v42 = swift_getKeyPath();
  uint64_t v166 = v33;
  uint64_t v167 = v35;
  LOBYTE(v168) = v39;
  uint64_t v169 = v37;
  uint64_t v170 = KeyPath;
  LOBYTE(v171) = 1;
  uint64_t v172 = v42;
  uint64_t v173 = v41;
  sub_2A188();
  sub_9134(&qword_39B50);
  sub_1730C();
  CGRect v43 = v128;
  sub_2A258();
  sub_1744C(v33, v35, v39);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v44 = sub_2A2F8();
  uint64_t v45 = swift_getKeyPath();
  uint64_t v46 = v129;
  uint64_t v47 = (uint64_t)v130;
  uint64_t v48 = v131;
  (*(void (**)(char *, char *, uint64_t))(v129 + 16))(v130, v43, v131);
  uint64_t v49 = (uint64_t *)(v47 + *(int *)(v126 + 36));
  *uint64_t v49 = v45;
  v49[1] = v44;
  (*(void (**)(char *, uint64_t))(v46 + 8))(v43, v48);
  LOBYTE(v44) = sub_2A178();
  sub_29F48();
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v58 = v159;
  sub_1794C(v47, v159, &qword_39AF8);
  uint64_t v59 = v58 + *(int *)(v127 + 36);
  *(unsigned char *)uint64_t v59 = v44;
  *(void *)(v59 + 8) = v51;
  *(void *)(v59 + 16) = v53;
  *(void *)(v59 + 24) = v55;
  *(void *)(v59 + 32) = v57;
  *(unsigned char *)(v59 + 40) = 0;
  sub_11D9C(v47, &qword_39AF8);
  sub_1755C(v58, v158, &qword_39B00);
  LOBYTE(v47) = *v124;
  swift_getKeyPath();
  swift_getKeyPath();
  id v60 = v125;
  sub_29EC8();

  swift_release();
  swift_release();
  sub_22900(v47, v166);
  uint64_t v61 = sub_2A318();
  uint64_t v62 = sub_2A198();
  uint64_t v63 = swift_getKeyPath();
  uint64_t v166 = v61;
  uint64_t v167 = v63;
  uint64_t v168 = v62;
  sub_2A188();
  sub_9134(&qword_39B90);
  sub_174BC();
  sub_2A258();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  id v64 = v60;
  sub_29EC8();

  swift_release();
  swift_release();
  if (sub_22900(v47, v166))
  {
    uint64_t v65 = sub_2A2C8();
  }
  else
  {
    id v66 = [self tertiaryLabelColor];
    uint64_t v65 = sub_2A308();
  }
  uint64_t v67 = v65;
  uint64_t v68 = v145;
  uint64_t v69 = (uint64_t)v154;
  uint64_t v70 = (uint64_t)v153;
  uint64_t v71 = swift_getKeyPath();
  uint64_t v72 = v142;
  uint64_t v73 = (uint64_t)v138;
  long long v74 = v152;
  uint64_t v75 = v143;
  (*(void (**)(char *, char *, uint64_t))(v142 + 16))(v138, v152, v143);
  uint64_t v76 = (uint64_t *)(v73 + *(int *)(v136 + 36));
  *uint64_t v76 = v71;
  v76[1] = v67;
  (*(void (**)(char *, uint64_t))(v72 + 8))(v74, v75);
  uint64_t v77 = v141;
  sub_1794C(v73, v141, &qword_39AD0);
  *(_WORD *)(v77 + *(int *)(v135 + 36)) = 256;
  sub_11D9C(v73, &qword_39AD0);
  LOBYTE(v71) = sub_2A158();
  sub_29F48();
  uint64_t v79 = v78;
  uint64_t v81 = v80;
  uint64_t v83 = v82;
  uint64_t v85 = v84;
  uint64_t v86 = v144;
  sub_1794C(v77, v144, &qword_39AD8);
  uint64_t v87 = v86 + *(int *)(v137 + 36);
  *(unsigned char *)uint64_t v87 = v71;
  *(void *)(v87 + 8) = v79;
  *(void *)(v87 + 16) = v81;
  *(void *)(v87 + 24) = v83;
  *(void *)(v87 + 32) = v85;
  *(unsigned char *)(v87 + 40) = 0;
  sub_11D9C(v77, &qword_39AD8);
  LOBYTE(v71) = sub_2A168();
  sub_29F48();
  uint64_t v89 = v88;
  uint64_t v91 = v90;
  uint64_t v93 = v92;
  uint64_t v95 = v94;
  uint64_t v96 = v139;
  sub_1794C(v86, v139, &qword_39AE0);
  uint64_t v97 = v96 + *(int *)(v140 + 36);
  *(unsigned char *)uint64_t v97 = v71;
  *(void *)(v97 + 8) = v89;
  *(void *)(v97 + 16) = v91;
  *(void *)(v97 + 24) = v93;
  *(void *)(v97 + 32) = v95;
  *(unsigned char *)(v97 + 40) = 0;
  sub_11D9C(v86, &qword_39AE0);
  sub_1755C(v96, v70, &qword_39AE8);
  uint64_t v98 = v159;
  sub_1794C(v158, v159, &qword_39B00);
  sub_1794C(v70, v69, &qword_39AE8);
  uint64_t v99 = v157;
  uint64_t v100 = v156;
  *(void *)uint64_t v68 = v157;
  *(void *)(v68 + 8) = v100;
  uint64_t v156 = v100;
  uint64_t v101 = v150;
  *(void *)(v68 + 16) = v151;
  *(void *)(v68 + 24) = v101;
  uint64_t v102 = v148;
  *(void *)(v68 + 32) = v149;
  *(void *)(v68 + 40) = v102;
  uint64_t v103 = v155;
  uint64_t v104 = v147;
  *(void *)(v68 + 48) = v155;
  *(void *)(v68 + 56) = v104;
  uint64_t v105 = v134;
  *(void *)(v68 + 64) = v146;
  *(void *)(v68 + 72) = v105;
  LODWORD(v67) = v133;
  *(unsigned char *)(v68 + 82) = BYTE2(v133);
  *(_WORD *)(v68 + 80) = v67;
  LOBYTE(v70) = v132;
  *(unsigned char *)(v68 + 83) = v132;
  char v106 = (int *)sub_9134(&qword_39BA0);
  sub_1794C(v98, v68 + v106[12], &qword_39B00);
  uint64_t v107 = v68 + v106[16];
  *(void *)uint64_t v107 = 0;
  *(unsigned char *)(v107 + 8) = 0;
  sub_1794C(v69, v68 + v106[20], &qword_39AE8);
  uint64_t v108 = v146;
  uint64_t v109 = v99;
  uint64_t v110 = v100;
  uint64_t v111 = v151;
  uint64_t v112 = v150;
  uint64_t v113 = v149;
  uint64_t v114 = v148;
  uint64_t v115 = v103;
  uint64_t v116 = v147;
  sub_175C0(v109, v110, v151, v150, v149, v148, v115, v147, v146, v105, v67, v70);
  sub_11D9C((uint64_t)v153, &qword_39AE8);
  sub_11D9C(v158, &qword_39B00);
  sub_11D9C((uint64_t)v154, &qword_39AE8);
  sub_11D9C(v159, &qword_39B00);
  return sub_17608(v157, v156, v111, v112, v113, v114, v155, v116, v108, v105, v67, v70);
}

uint64_t sub_16ECC@<X0>(uint64_t a1@<X8>)
{
  return sub_15958(a1);
}

uint64_t sub_16F10()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 88, 7);
}

void sub_16F60()
{
  sub_15CE8(v0 + 16);
}

uint64_t sub_16F68@<X0>(uint64_t a1@<X8>)
{
  return sub_15DF0(*(void *)(v1 + 16), a1);
}

uint64_t sub_16F70(uint64_t a1)
{
  id v2 = *(id *)(a1 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_16FC4()
{
  unint64_t result = qword_39AB0;
  if (!qword_39AB0)
  {
    sub_A130(&qword_39A90);
    sub_A7C8(&qword_39AA8, &qword_39A88);
    sub_17094((unint64_t *)&qword_39598, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39AB0);
  }
  return result;
}

uint64_t sub_17094(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_170EC()
{
  unint64_t result = qword_39B20;
  if (!qword_39B20)
  {
    sub_A130(&qword_39B10);
    sub_A7C8(&qword_39B28, &qword_39B30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39B20);
  }
  return result;
}

unint64_t sub_1718C()
{
  unint64_t result = qword_39B38;
  if (!qword_39B38)
  {
    sub_A130(&qword_39B18);
    sub_17208();
    sub_1725C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39B38);
  }
  return result;
}

unint64_t sub_17208()
{
  unint64_t result = qword_39B40;
  if (!qword_39B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39B40);
  }
  return result;
}

unint64_t sub_1725C()
{
  unint64_t result = qword_39B48;
  if (!qword_39B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39B48);
  }
  return result;
}

uint64_t sub_172B0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2A048();
  *a1 = result;
  return result;
}

uint64_t sub_172DC()
{
  return sub_2A058();
}

unint64_t sub_1730C()
{
  unint64_t result = qword_39B58;
  if (!qword_39B58)
  {
    sub_A130(&qword_39B50);
    sub_173AC();
    sub_A7C8(&qword_39B80, &qword_39B88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39B58);
  }
  return result;
}

unint64_t sub_173AC()
{
  unint64_t result = qword_39B60;
  if (!qword_39B60)
  {
    sub_A130(&qword_39B68);
    sub_A7C8(&qword_39B70, &qword_39B78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39B60);
  }
  return result;
}

uint64_t sub_1744C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1745C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2A028();
  *a1 = result;
  return result;
}

uint64_t sub_17488()
{
  return sub_2A038();
}

unint64_t sub_174BC()
{
  unint64_t result = qword_39B98;
  if (!qword_39B98)
  {
    sub_A130(&qword_39B90);
    sub_A7C8(&qword_39B80, &qword_39B88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39B98);
  }
  return result;
}

uint64_t sub_1755C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_9134(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_175C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, char a12)
{
  if ((a12 & 1) == 0) {
    swift_bridgeObjectRetain();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_17608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, char a12)
{
  if ((a12 & 1) == 0) {
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

uint64_t destroy for MultitaskingChoiceImage()
{
  return swift_bridgeObjectRelease();
}

void *_s31MultitaskingAndGesturesSettings23MultitaskingChoiceImageVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for MultitaskingChoiceImage(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

void *assignWithTake for MultitaskingChoiceImage(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for MultitaskingChoiceImage(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MultitaskingChoiceImage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for MultitaskingChoiceImage()
{
  return &type metadata for MultitaskingChoiceImage;
}

uint64_t sub_177C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_17870()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1788C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_29FF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_178F0(uint64_t a1)
{
  uint64_t v2 = sub_29FF8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1794C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_9134(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_179B4()
{
  unint64_t result = qword_39BE8;
  if (!qword_39BE8)
  {
    sub_A130(&qword_39BD8);
    sub_17A54();
    sub_A7C8(&qword_39C20, &qword_39BE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39BE8);
  }
  return result;
}

unint64_t sub_17A54()
{
  unint64_t result = qword_39BF0;
  if (!qword_39BF0)
  {
    sub_A130(&qword_39BB8);
    sub_17AF4();
    sub_A7C8(&qword_39C18, &qword_39BB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39BF0);
  }
  return result;
}

unint64_t sub_17AF4()
{
  unint64_t result = qword_39BF8;
  if (!qword_39BF8)
  {
    sub_A130(&qword_39C00);
    sub_17B70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39BF8);
  }
  return result;
}

unint64_t sub_17B70()
{
  unint64_t result = qword_39C08;
  if (!qword_39C08)
  {
    sub_A130(&qword_39C10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39C08);
  }
  return result;
}

id sub_17BE8()
{
  id result = [self standardUserDefaults];
  qword_39C28 = (uint64_t)result;
  return result;
}

void sub_17C24()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = sub_2A4C8();
  id v2 = [v0 initWithSuiteName:v1];

  qword_39C30 = (uint64_t)v2;
}

id sub_17C94()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for MultitaskingAnalytics()) init];
  qword_3A230 = (uint64_t)result;
  return result;
}

unint64_t sub_17CC4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_9134(&qword_39C78);
  id v2 = (void *)sub_2A6C8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  uint64_t v4 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_18A54(v4, (uint64_t)&v16);
    uint64_t v5 = v16;
    uint64_t v6 = v17;
    unint64_t result = sub_1A350(v16, v17);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v9 = v5;
    v9[1] = v6;
    uint64_t v10 = v2[7] + 40 * result;
    long long v11 = v18;
    long long v12 = v19;
    *(void *)(v10 + 32) = v20;
    *(_OWORD *)uint64_t v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v2[2] = v15;
    v4 += 56;
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

Class sub_17DFC(uint64_t a1)
{
  NSString v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_18964();
    v4.super.Class isa = sub_2A488().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return v4.super.isa;
}

id sub_17EC8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MultitaskingAnalytics();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MultitaskingAnalytics()
{
  return self;
}

uint64_t sub_17F24(uint64_t a1)
{
  sub_9134(&qword_39C70);
  uint64_t result = sub_2A6B8();
  uint64_t v3 = (void *)result;
  int64_t v4 = 0;
  uint64_t v26 = a1;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v23 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v24 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v9 = result + 64;
  if ((v7 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v10 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    uint64_t v15 = (uint64_t *)(*(void *)(v26 + 48) + 16 * i);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    sub_189A4(*(void *)(v26 + 56) + 40 * i, (uint64_t)v25);
    swift_bridgeObjectRetain();
    Class isa = sub_2A648().isa;
    uint64_t result = sub_18A00((uint64_t)v25);
    *(void *)(v9 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    long long v19 = (void *)(v3[6] + 16 * i);
    *long long v19 = v16;
    v19[1] = v17;
    *(void *)(v3[7] + 8 * i) = isa;
    uint64_t v20 = v3[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v22;
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_24;
    }
    if (v12 >= v24) {
      return (uint64_t)v3;
    }
    unint64_t v13 = *(void *)(v23 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v24) {
        return (uint64_t)v3;
      }
      unint64_t v13 = *(void *)(v23 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v24) {
          return (uint64_t)v3;
        }
        unint64_t v13 = *(void *)(v23 + 8 * v4);
        if (!v13) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v8 = (v13 - 1) & v13;
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v24) {
    return (uint64_t)v3;
  }
  unint64_t v13 = *(void *)(v23 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v24) {
      return (uint64_t)v3;
    }
    unint64_t v13 = *(void *)(v23 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1813C(char a1)
{
  objc_super v2 = (void *)0xEC000000676E696BLL;
  v3._countAndFlagsBits = 0x73617469746C756DLL;
  switch(a1)
  {
    case 1:
      objc_super v2 = (void *)0x800000000002D330;
      v3._countAndFlagsBits = 0xD000000000000010;
      break;
    case 2:
      objc_super v2 = (void *)0xEC00000079746976;
      v3._countAndFlagsBits = 0x69746375646F7270;
      break;
    case 3:
      v3._countAndFlagsBits = 0xD000000000000012;
      int64_t v4 = "fourAndFiveFingers";
      goto LABEL_9;
    case 4:
      objc_super v2 = (void *)0xEB000000006F646ELL;
      v3._countAndFlagsBits = 0x556F54656B616873;
      break;
    case 5:
      v3._countAndFlagsBits = 0xD000000000000015;
      int64_t v4 = "cornerGesturesEnabled";
      goto LABEL_9;
    case 6:
      v3._countAndFlagsBits = 0xD000000000000017;
      int64_t v4 = "cornerGestureBottomLeft";
      goto LABEL_9;
    case 7:
      v3._countAndFlagsBits = 0xD000000000000018;
      int64_t v4 = "cornerGestureBottomRight";
LABEL_9:
      objc_super v2 = (void *)((unint64_t)(v4 - 32) | 0x8000000000000000);
      break;
    default:
      break;
  }
  v3._object = v2;
  sub_2A528(v3);
  swift_bridgeObjectRelease();
  if (qword_39210 != -1) {
    swift_once();
  }
  uint64_t v5 = (void *)qword_39C28;
  NSString v6 = sub_2A4C8();
  LODWORD(v5) = objc_msgSend(v5, "BOOLForKey:", v6, 0xD00000000000001FLL, 0x800000000002D3C0);

  uint64_t v7 = (void *)qword_39C28;
  NSString v8 = sub_2A4C8();
  swift_bridgeObjectRelease();
  [v7 setBool:1 forKey:v8];

  return v5 ^ 1;
}

uint64_t sub_18350()
{
  if (qword_39218 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_39C30;
  if (!qword_39C30)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    goto LABEL_17;
  }
  NSString v1 = sub_2A4C8();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    sub_2A618();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_9CCC((uint64_t)v7, (uint64_t)&v8);
  if (!*((void *)&v9 + 1)) {
    goto LABEL_17;
  }
  sub_9134(&qword_39C88);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  uint64_t v3 = *(void *)&v7[0];
  if (*(void *)(*(void *)&v7[0] + 16) && (unint64_t v4 = sub_1A350(0x646C696863, 0xE500000000000000), (v5 & 1) != 0))
  {
    sub_18ABC(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v8);
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v9 + 1))
  {
LABEL_17:
    sub_9D34((uint64_t)&v8);
    return 0;
  }
  uint64_t result = swift_dynamicCast();
  if (result) {
    return LOBYTE(v7[0]);
  }
  return result;
}

void sub_184F0(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v6 = sub_1813C(a1);
  sub_9134(&qword_39C60);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2BDB0;
  strcpy((char *)(inited + 32), "child_account");
  *(_WORD *)(inited + 46) = -4864;
  sub_18350();
  sub_2A678();
  strcpy((char *)(inited + 88), "first_update");
  *(unsigned char *)(inited + 101) = 0;
  *(_WORD *)(inited + 102) = -5120;
  LOBYTE(v12[0]) = v6 & 1;
  sub_2A678();
  *(void *)(inited + 144) = 0x6C69705F6D6F7266;
  *(void *)(inited + 152) = 0xE90000000000006CLL;
  if (a4 && (a3 != 0xD000000000000032 || a4 != 0x800000000002D350)) {
    sub_2A768();
  }
  sub_2A678();
  *(void *)(inited + 200) = 0x65727574736567;
  *(void *)(inited + 208) = 0xE700000000000000;
  sub_2A678();
  *(void *)(inited + 256) = 0x5F65727574736567;
  *(void *)(inited + 264) = 0xEA00000000006E6FLL;
  sub_2A678();
  unint64_t v8 = sub_17CC4(inited);
  NSString v9 = sub_2A4C8();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  v12[4] = sub_1891C;
  v12[5] = v10;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_17DFC;
  v12[3] = &unk_35B30;
  long long v11 = _Block_copy(v12);
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v11);
  swift_bridgeObjectRelease();
}

uint64_t sub_188E4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1891C()
{
  return sub_17F24(*(void *)(v0 + 16));
}

uint64_t sub_1894C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1895C()
{
  return swift_release();
}

unint64_t sub_18964()
{
  unint64_t result = qword_39C68;
  if (!qword_39C68)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_39C68);
  }
  return result;
}

uint64_t sub_189A4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_18A00(uint64_t a1)
{
  return a1;
}

uint64_t sub_18A54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_9134(&qword_39C80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_18ABC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_18B18()
{
  if (qword_39218 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_39C30;
  if (qword_39C30)
  {
    NSString v1 = sub_2A4C8();
    [v0 BOOLForKey:v1];

    uint64_t v2 = (void *)qword_39C30;
    if (qword_39C30)
    {
      NSString v3 = sub_2A4C8();
      [v2 BOOLForKey:v3];
    }
  }
  if (qword_39210 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)qword_39C28;
  NSString v5 = sub_2A4C8();
  [v4 BOOLForKey:v5];

  char v6 = (void *)qword_39C28;
  NSString v7 = sub_2A4C8();
  [v6 setBool:1 forKey:v7];

  sub_9134(&qword_39C60);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2BDC0;
  *(void *)(inited + 32) = 0x65735F7964647562;
  *(void *)(inited + 40) = 0xEB00000000707574;
  sub_2A678();
  *(void *)(inited + 88) = 0xD00000000000001CLL;
  *(void *)(inited + 96) = 0x800000000002D410;
  sub_2A678();
  strcpy((char *)(inited + 144), "child_account");
  *(_WORD *)(inited + 158) = -4864;
  sub_18350();
  sub_2A678();
  strcpy((char *)(inited + 200), "first_update");
  *(unsigned char *)(inited + 213) = 0;
  *(_WORD *)(inited + 214) = -5120;
  sub_2A678();
  *(void *)(inited + 256) = 0xD000000000000013;
  *(void *)(inited + 264) = 0x800000000002D430;
  sub_2A678();
  *(void *)(inited + 312) = 0x656372756F73;
  *(void *)(inited + 320) = 0xE600000000000000;
  sub_2A678();
  unint64_t v9 = sub_17CC4(inited);
  NSString v10 = sub_2A4C8();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  aBlock[4] = sub_19000;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_17DFC;
  aBlock[3] = &unk_35B80;
  int64_t v12 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v12);
  swift_bridgeObjectRelease();
}

uint64_t sub_19004(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2A598();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2A588();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_11D9C(a1, &qword_39338);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2A548();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_191B0()
{
  type metadata accessor for MultitaskingAndGesturesDeepLink(0);
  uint64_t v0 = swift_allocObject();
  sub_9134((uint64_t *)&unk_39688);
  sub_29EA8();
  uint64_t result = sub_29EA8();
  uint64_t v2 = (void *)(v0 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings31MultitaskingAndGesturesDeepLink_referrer);
  *uint64_t v2 = 0;
  v2[1] = 0;
  qword_3A238 = v0;
  return result;
}

Swift::Void __swiftcall MultitaskingAndGesturesSettings.viewDidLoad()()
{
  uint64_t v1 = sub_9134(&qword_39C90);
  __chkstk_darwin(v1 - 8);
  NSString v3 = (char *)v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for MultitaskingAndGesturesSettingsList(0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (void *)((char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v5);
  unint64_t v9 = (char *)v39 - v8;
  uint64_t v41 = sub_9134(&qword_39C98);
  uint64_t v10 = __chkstk_darwin(v41);
  uint64_t v40 = (uint64_t)v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v42 = (uint64_t)v39 - v12;
  CGRect v43 = v0;
  v44.receiver = v0;
  v44.super_class = (Class)MultitaskingAndGesturesSettings;
  objc_msgSendSuper2(&v44, "viewDidLoad");
  type metadata accessor for MultitaskingAndGesturesDeepLink(0);
  sub_11778();
  uint64_t *v7 = sub_2A018();
  v7[1] = v13;
  int64_t v14 = (uint64_t *)((char *)v7 + *(int *)(v4 + 20));
  *int64_t v14 = 0xD000000000000024;
  v14[1] = 0x800000000002D4D0;
  uint64_t v15 = enum case for SettingsEventImage.graphicIcon(_:);
  uint64_t v16 = sub_2A478();
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v14, v15, v16);
  sub_29E18();
  sub_29E48();
  uint64_t v17 = sub_29E58();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v3, 1, v17) == 1)
  {
    __break(1u);
  }
  else
  {
    v39[1] = "c-icon.stage-manager";
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))((char *)v7 + *(int *)(v4 + 28), v3, v17);
    sub_1168C((uint64_t)v7, (uint64_t)v9);
    if (qword_39228 != -1) {
      swift_once();
    }
    uint64_t v19 = qword_3A238;
    swift_retain();
    uint64_t v20 = sub_29E88();
    uint64_t v21 = v42;
    sub_114B4((uint64_t)v9, v42);
    uint64_t v22 = (uint64_t *)(v21 + *(int *)(v41 + 36));
    *uint64_t v22 = v20;
    v22[1] = v19;
    sub_197E4((uint64_t)v9);
    sub_19840(v21, v40);
    id v23 = objc_allocWithZone((Class)sub_9134(&qword_39CA0));
    int64_t v24 = (void *)sub_2A0F8();
    if (qword_39200 != -1) {
      swift_once();
    }
    id v25 = (id)qword_3A210;
    NSString v26 = sub_2A4C8();
    NSString v27 = [v25 localizedStringForKey:v26 value:0 table:0];

    CGFloat v28 = v43;
    if (!v27)
    {
      sub_2A4F8();
      NSString v27 = sub_2A4C8();
      swift_bridgeObjectRelease();
    }
    [v28 setTitle:v27];

    id v29 = [v24 view];
    if (!v29)
    {
      sub_11D9C(v21, &qword_39C98);

      return;
    }
    uint64_t v30 = v29;
    id v31 = [v28 view];
    if (v31)
    {
      id v32 = v31;
      [v31 addSubview:v30];

      id v33 = [v28 view];
      if (v33)
      {
        uint64_t v34 = v33;
        [v33 bounds];
        double v36 = v35;
        double v38 = v37;

        objc_msgSend(v30, "setFrame:", 0.0, 0.0, v36, v38);
        [v30 setAutoresizingMask:18];
        [v28 addChildViewController:v24];
        [v24 didMoveToParentViewController:v28];

        sub_11D9C(v21, &qword_39C98);
        return;
      }
      goto LABEL_15;
    }
  }
  __break(1u);
LABEL_15:
  __break(1u);
}

uint64_t sub_197E4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MultitaskingAndGesturesSettingsList(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_19840(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_9134(&qword_39C98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

Swift::Void __swiftcall MultitaskingAndGesturesSettings.handleURL(_:)(Swift::OpaquePointer a1)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_9134(&qword_39338);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = 1752457584;
  uint64_t v15 = (void *)0xE400000000000000;
  sub_2A678();
  if (*((void *)a1._rawValue + 2) && (unint64_t v6 = sub_1A3C8((uint64_t)v16), (v7 & 1) != 0))
  {
    sub_18ABC(*((void *)a1._rawValue + 7) + 32 * v6, (uint64_t)&v17);
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }
  sub_18A00((uint64_t)v16);
  if (*((void *)&v18 + 1))
  {
    if (swift_dynamicCast())
    {
      char v8 = sub_11468(v14, v15);
      if (v8 != 6)
      {
        char v9 = v8;
        uint64_t v10 = sub_2A598();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 1, 1, v10);
        sub_2A578();
        swift_bridgeObjectRetain();
        uint64_t v11 = sub_2A568();
        uint64_t v12 = swift_allocObject();
        *(void *)(v12 + 16) = v11;
        *(void *)(v12 + 24) = &protocol witness table for MainActor;
        *(unsigned char *)(v12 + 32) = v9;
        *(Swift::OpaquePointer *)(v12 + 40) = a1;
        *(void *)(v12 + 48) = ObjectType;
        sub_19004((uint64_t)v5, (uint64_t)&unk_39CB0, v12);
        swift_release();
      }
    }
  }
  else
  {
    sub_11D9C((uint64_t)&v17, &qword_39350);
  }
}

uint64_t sub_19AE8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  *(void *)(v5 + 104) = a5;
  *(unsigned char *)(v5 + 120) = a4;
  sub_2A578();
  *(void *)(v5 + 112) = sub_2A568();
  uint64_t v7 = sub_2A548();
  return _swift_task_switch(sub_19B84, v7, v6);
}

uint64_t sub_19B84()
{
  swift_release();
  if (qword_39228 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 104);
  char v2 = *(unsigned char *)(v0 + 120);
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 16) = v2;
  swift_retain();
  sub_29ED8();
  uint64_t v3 = qword_3A238;
  *(void *)(v0 + 88) = 0x7265727265666572;
  *(void *)(v0 + 96) = 0xE800000000000000;
  swift_retain();
  sub_2A678();
  if (*(void *)(v1 + 16) && (unint64_t v4 = sub_1A3C8(v0 + 16), (v5 & 1) != 0))
  {
    sub_18ABC(*(void *)(*(void *)(v0 + 104) + 56) + 32 * v4, v0 + 56);
  }
  else
  {
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
  }
  sub_18A00(v0 + 16);
  if (*(void *)(v0 + 80))
  {
    int v6 = swift_dynamicCast();
    uint64_t v7 = *(void *)(v0 + 88);
    uint64_t v8 = *(void *)(v0 + 96);
    if (!v6)
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
    }
  }
  else
  {
    sub_11D9C(v0 + 56, &qword_39350);
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = (void *)(v3 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings31MultitaskingAndGesturesDeepLink_referrer);
  *uint64_t v9 = v7;
  v9[1] = v8;
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

void __swiftcall MultitaskingAndGesturesSettings.init(nibName:bundle:)(MultitaskingAndGesturesSettings *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    NSString v4 = sub_2A4C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }
  [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithNibName:v4 bundle:isa];
}

id MultitaskingAndGesturesSettings.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_2A4C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)MultitaskingAndGesturesSettings;
  id v6 = objc_msgSendSuper2(&v8, "initWithNibName:bundle:", v5, a3);

  return v6;
}

void __swiftcall MultitaskingAndGesturesSettings.init(coder:)(MultitaskingAndGesturesSettings_optional *__return_ptr retstr, NSCoder coder)
{
}

id MultitaskingAndGesturesSettings.init(coder:)(void *a1)
{
  v4.super_class = (Class)MultitaskingAndGesturesSettings;
  id v2 = objc_msgSendSuper2(&v4, "initWithCoder:", a1);

  return v2;
}

uint64_t sub_1A088@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1A108()
{
  return sub_29ED8();
}

uint64_t sub_1A17C(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  objc_super v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *objc_super v4 = v2;
  v4[1] = sub_1A258;
  return v6(a1);
}

uint64_t sub_1A258()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_1A350(uint64_t a1, uint64_t a2)
{
  sub_2A778();
  sub_2A518();
  Swift::Int v4 = sub_2A798();

  return sub_1A40C(a1, a2, v4);
}

unint64_t sub_1A3C8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_2A658(*(void *)(v2 + 40));

  return sub_1A4F0(a1, v4);
}

unint64_t sub_1A40C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2A768() & 1) == 0)
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
      while (!v14 && (sub_2A768() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1A4F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_189A4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_2A668();
      sub_18A00((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1A5B8()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1A5F8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 40);
  char v7 = *(unsigned char *)(v1 + 32);
  objc_super v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *objc_super v8 = v2;
  v8[1] = sub_9F04;
  return sub_19AE8(a1, v4, v5, v7, v6);
}

unint64_t type metadata accessor for MultitaskingAndGesturesSettings()
{
  unint64_t result = qword_39CE0;
  if (!qword_39CE0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_39CE0);
  }
  return result;
}

uint64_t sub_1A700()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1A738(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_9F04;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_39CE8 + dword_39CE8);
  return v6(a1, v4);
}

id sub_1A7F8()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for MultiTaskingSectionViewModel());

  return [v0 init];
}

uint64_t destroy for MultitaskingSection(uint64_t a1)
{
  return sub_11E08(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s31MultitaskingAndGesturesSettings19MultitaskingSectionVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_11DF8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for MultitaskingSection(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_11DF8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_11E08(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for MultitaskingSection(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for MultitaskingSection(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_11E08(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for MultitaskingSection(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MultitaskingSection(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
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

ValueMetadata *type metadata accessor for MultitaskingSection()
{
  return &type metadata for MultitaskingSection;
}

uint64_t sub_1A9E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1A9FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v71 = a4;
  int v6 = a3 & 1;
  uint64_t v7 = sub_2A5F8();
  uint64_t v72 = *(void *)(v7 - 8);
  uint64_t v73 = v7;
  __chkstk_darwin(v7);
  uint64_t v70 = (char *)v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_9134(&qword_39CF8);
  uint64_t v67 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  id v66 = (char *)v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_9134(&qword_39D00);
  __chkstk_darwin(v65);
  uint64_t v69 = (char *)v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = a1;
  uint64_t v77 = a2;
  uint64_t v74 = a2;
  int v75 = v6;
  char v78 = v6;
  sub_2A0C8();
  if (qword_39200 != -1) {
    swift_once();
  }
  id v11 = (id)qword_3A210;
  uint64_t v84 = sub_2A1E8();
  uint64_t v85 = v12;
  char v86 = v13 & 1;
  uint64_t v87 = v14;
  sub_1D3BC();
  uint64_t v64 = a1;
  if (v15)
  {
    id v16 = (id)qword_3A210;
    uint64_t v17 = sub_2A1E8();
    uint64_t v19 = v18;
    uint64_t v63 = v20;
    int v62 = v21 & 1;
    uint64_t v22 = sub_1D5B4();
    uint64_t v24 = v23;
    char v26 = v25 & 1;
    sub_2A2C8();
    uint64_t v27 = sub_2A1C8();
    uint64_t v29 = v28;
    char v31 = v30;
    v59[1] = v32;
    swift_release();
    sub_1744C(v22, v24, v26);
    swift_bridgeObjectRelease();
    char v33 = v62;
    uint64_t v61 = sub_2A1D8();
    uint64_t v60 = v34;
    uint64_t v36 = v35;
    uint64_t v38 = v37 & 1;
    sub_1744C(v27, v29, v31 & 1);
    swift_bridgeObjectRelease();
    sub_1744C(v17, v19, v33);
    swift_bridgeObjectRelease();
    uint64_t v39 = v60;
    uint64_t v40 = v61;
  }
  else
  {
    uint64_t v40 = 0;
    uint64_t v39 = 0;
    uint64_t v38 = 0;
    uint64_t v36 = 0;
  }
  LODWORD(v63) = v75 != 0;
  uint64_t v79 = v40;
  uint64_t v80 = v39;
  uint64_t v81 = v38;
  uint64_t v82 = v36;
  __int16 v83 = 256;
  sub_9134(&qword_39D08);
  sub_9134(&qword_39D10);
  sub_A7C8(&qword_39D18, &qword_39D08);
  sub_1DD84();
  uint64_t v41 = v66;
  sub_2A3F8();
  type metadata accessor for MultiTaskingSectionViewModel();
  sub_1DE24();
  uint64_t v42 = v64;
  uint64_t v43 = v74;
  uint64_t v44 = sub_29F58();
  uint64_t v45 = sub_29E88();
  uint64_t v46 = v67;
  uint64_t v47 = (uint64_t)v69;
  uint64_t v48 = v68;
  (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v69, v41, v68);
  uint64_t v49 = (uint64_t *)(v47 + *(int *)(v65 + 36));
  *uint64_t v49 = v45;
  v49[1] = v44;
  (*(void (**)(char *, uint64_t))(v46 + 8))(v41, v48);
  id v50 = [self defaultCenter];
  uint64_t v51 = v70;
  sub_2A608();

  uint64_t v52 = swift_allocObject();
  *(void *)(v52 + 16) = v42;
  *(void *)(v52 + 24) = v43;
  *(unsigned char *)(v52 + 32) = v63;
  uint64_t v53 = v71;
  sub_1794C(v47, v71, &qword_39D00);
  uint64_t v54 = sub_9134(&qword_39D38);
  uint64_t v56 = v72;
  uint64_t v55 = v73;
  (*(void (**)(uint64_t, char *, uint64_t))(v72 + 16))(v53 + *(int *)(v54 + 52), v51, v73);
  uint64_t v57 = (uint64_t (**)())(v53 + *(int *)(v54 + 56));
  *uint64_t v57 = sub_1DEB8;
  v57[1] = (uint64_t (*)())v52;
  sub_11DF8(v42, v43, v75);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v51, v55);
  return sub_11D9C(v47, &qword_39D00);
}

uint64_t sub_1B0A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  char v7 = a3 & 1;
  *(void *)a4 = sub_2A0E8();
  *(void *)(a4 + 8) = 0;
  *(unsigned char *)(a4 + 16) = 0;
  uint64_t v8 = sub_9134(&qword_39D48);
  return sub_1B10C(a1, a2, v7, a4 + *(int *)(v8 + 44));
}

uint64_t sub_1B10C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v179 = a4;
  int v6 = a3 & 1;
  uint64_t v7 = sub_9134(&qword_39D50);
  __chkstk_darwin(v7 - 8);
  uint64_t v171 = (void *)((char *)v159 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_9134(&qword_39D58);
  uint64_t v176 = *(void *)(v9 - 8);
  uint64_t v177 = v9;
  __chkstk_darwin(v9);
  uint64_t v170 = (uint64_t)v159 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_9134(&qword_39D60);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v178 = (uint64_t)v159 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v184 = (uint64_t)v159 - v14;
  uint64_t v15 = sub_2A128();
  uint64_t v174 = *(void (***)(void, void))(v15 - 8);
  uint64_t v175 = v15;
  __chkstk_darwin(v15);
  uint64_t v172 = (char *)v159 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_9134(&qword_39D68);
  uint64_t v168 = *(void *)(v17 - 8);
  uint64_t v169 = v17;
  __chkstk_darwin(v17);
  long long v163 = (char *)v159 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_9134(&qword_39D70);
  uint64_t v166 = *(void *)(v19 - 8);
  uint64_t v167 = v19;
  __chkstk_darwin(v19);
  uint64_t v162 = (char *)v159 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = sub_9134(&qword_39D78);
  __chkstk_darwin(v160);
  v165 = (char *)v159 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = sub_9134(&qword_39D80);
  __chkstk_darwin(v161);
  uint64_t v173 = (uint64_t)v159 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_9134(&qword_39D88);
  uint64_t v180 = *(void *)(v23 - 8);
  uint64_t v181 = v23;
  __chkstk_darwin(v23);
  uint64_t v164 = (uint64_t)v159 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_9134(&qword_39D90);
  uint64_t v26 = __chkstk_darwin(v25 - 8);
  uint64_t v182 = (uint64_t)v159 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  uint64_t v186 = (uint64_t)v159 - v28;
  type metadata accessor for MultiTaskingSectionViewModel();
  sub_1DE24();
  uint64_t v29 = (void *)sub_29F58();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  char v30 = v188;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();

  swift_release();
  swift_release();
  uint64_t v185 = a1;
  LODWORD(v183) = v6;
  if (v188 != 1)
  {
    uint64_t v35 = 1;
    uint64_t v36 = a2;
    uint64_t v37 = v186;
    goto LABEL_6;
  }
  char v31 = (void *)sub_29F58();
  id v32 = (id)MobileGestalt_get_current_device();
  if (!v32)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  char v33 = v32;
  int deviceSupportsEnhancedMultitasking = MobileGestalt_get_deviceSupportsEnhancedMultitasking();

  if (!deviceSupportsEnhancedMultitasking)
  {
    id v39 = (id)MobileGestalt_get_current_device();
    if (!v39)
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    uint64_t v40 = v39;
    int deviceSupportsSingleDisplayEnhancedMultitasking = MobileGestalt_get_deviceSupportsSingleDisplayEnhancedMultitasking();

    if (deviceSupportsSingleDisplayEnhancedMultitasking) {
      goto LABEL_9;
    }
    uint64_t v35 = 1;
    uint64_t v37 = v186;
    uint64_t v36 = a2;
LABEL_6:
    uint64_t v38 = v181;
    goto LABEL_10;
  }

LABEL_9:
  sub_2A0C8();
  v159[1] = v43;
  v159[2] = v42;
  uint64_t v44 = (void *)sub_29F68();
  swift_getKeyPath();
  sub_29FA8();
  swift_release();

  v187[0] = v188;
  v187[1] = v189;
  LOBYTE(v187[2]) = v190;
  sub_9134(&qword_39DA8);
  sub_1E328();
  sub_1E37C(&qword_39DB8, &qword_39DA8);
  uint64_t v36 = a2;
  uint64_t v45 = v163;
  sub_2A378();
  uint64_t v46 = v172;
  sub_2A118();
  sub_A7C8(&qword_39DC0, &qword_39D68);
  uint64_t v47 = v162;
  uint64_t v48 = v169;
  uint64_t v49 = v175;
  sub_2A278();
  ((void (**)(char *, uint64_t))v174)[1](v46, v49);
  (*(void (**)(char *, uint64_t))(v168 + 8))(v45, v48);
  uint64_t v51 = (uint64_t)v165;
  uint64_t v50 = v166;
  uint64_t v52 = v167;
  (*(void (**)(char *, char *, uint64_t))(v166 + 16))(v165, v47, v167);
  *(_WORD *)(v51 + *(int *)(v160 + 36)) = 257;
  (*(void (**)(char *, uint64_t))(v50 + 8))(v47, v52);
  uint64_t v53 = sub_2A1A8();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v55 = v173;
  sub_1794C(v51, v173, &qword_39D78);
  uint64_t v56 = (uint64_t *)(v55 + *(int *)(v161 + 36));
  *uint64_t v56 = KeyPath;
  v56[1] = v53;
  sub_11D9C(v51, &qword_39D78);
  LOBYTE(v53) = sub_2A178();
  sub_29F48();
  uint64_t v58 = v57;
  uint64_t v60 = v59;
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  uint64_t v65 = v164;
  sub_1794C(v55, v164, &qword_39D80);
  uint64_t v38 = v181;
  uint64_t v66 = v65 + *(int *)(v181 + 36);
  *(unsigned char *)uint64_t v66 = v53;
  *(void *)(v66 + 8) = v58;
  *(void *)(v66 + 16) = v60;
  *(void *)(v66 + 24) = v62;
  *(void *)(v66 + 32) = v64;
  *(unsigned char *)(v66 + 40) = 0;
  sub_11D9C(v55, &qword_39D80);
  uint64_t v37 = v186;
  sub_1755C(v65, v186, &qword_39D88);
  uint64_t v35 = 0;
LABEL_10:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v180 + 56))(v37, v35, 1, v38);
  uint64_t v67 = sub_2A0A8();
  sub_1C478((uint64_t)v220);
  int v68 = sub_2A148();
  uint64_t v180 = v36;
  uint64_t v69 = (void *)sub_29F58();
  id v70 = (id)MobileGestalt_get_current_device();
  if (!v70)
  {
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v71 = v70;
  int v72 = MobileGestalt_get_deviceSupportsEnhancedMultitasking();

  LODWORD(v175) = v68;
  uint64_t v181 = v67;
  if (v72)
  {

LABEL_15:
    uint64_t v174 = (void (**)(void, void))sub_29F58();
    uint64_t v76 = self;
    id v77 = [v76 mainScreen];
    [v77 bounds];
    CGFloat v79 = v78;
    CGFloat v81 = v80;
    CGFloat v83 = v82;
    CGFloat v85 = v84;

    v221.origin.x = v79;
    v221.origin.y = v81;
    v221.size.width = v83;
    v221.size.height = v85;
    CGRectGetHeight(v221);
    id v86 = [v76 mainScreen];
    [v86 bounds];
    CGFloat v88 = v87;
    CGFloat v90 = v89;
    CGFloat v92 = v91;
    CGFloat v94 = v93;

    v222.origin.x = v88;
    v222.origin.y = v90;
    v222.size.width = v92;
    v222.size.height = v94;
    CGRectGetWidth(v222);

    goto LABEL_16;
  }
  id v73 = (id)MobileGestalt_get_current_device();
  if (!v73)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v74 = v73;
  int v75 = MobileGestalt_get_deviceSupportsSingleDisplayEnhancedMultitasking();

  if (v75) {
    goto LABEL_15;
  }
LABEL_16:
  v218[288] = 1;
  memcpy(&v218[7], v220, 0x118uLL);
  LODWORD(v173) = 1;
  memcpy(v219, v218, sizeof(v219));
  sub_29F48();
  uint64_t v96 = v95;
  uint64_t v98 = v97;
  uint64_t v100 = v99;
  uint64_t v102 = v101;
  LODWORD(v174) = sub_2A158();
  uint64_t v103 = (void *)sub_29F58();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  uint64_t v104 = v188;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();

  swift_release();
  swift_release();
  if (v188 == 1)
  {
    uint64_t v105 = (void *)sub_29F58();
    id v106 = (id)MobileGestalt_get_current_device();
    if (!v106)
    {
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    uint64_t v107 = v106;
    int v108 = MobileGestalt_get_deviceSupportsEnhancedMultitasking();

    if (v108)
    {
    }
    else
    {
      id v109 = (id)MobileGestalt_get_current_device();
      if (!v109)
      {
LABEL_42:
        __break(1u);
        JUMPOUT(0x1C30CLL);
      }
      uint64_t v110 = v109;
      MobileGestalt_get_deviceSupportsSingleDisplayEnhancedMultitasking();
    }
  }
  memcpy(v217, v219, sizeof(v217));
  unsigned __int8 v210 = 0;
  sub_29F48();
  uint64_t v112 = v111;
  uint64_t v114 = v113;
  uint64_t v116 = v115;
  uint64_t v118 = v117;
  int v119 = v210;
  unsigned __int8 v211 = 0;
  uint64_t v120 = (void *)sub_29F58();
  id v121 = (id)MobileGestalt_get_current_device();
  if (!v121) {
    goto LABEL_36;
  }
  uint64_t v122 = v121;
  int v123 = MobileGestalt_get_deviceSupportsEnhancedMultitasking();

  LODWORD(v172) = v119;
  if (v123)
  {

    goto LABEL_27;
  }
  id v124 = (id)MobileGestalt_get_current_device();
  if (!v124) {
    goto LABEL_40;
  }
  id v125 = v124;
  int v126 = MobileGestalt_get_deviceSupportsSingleDisplayEnhancedMultitasking();

  if (!v126)
  {
    uint64_t v129 = 1;
    uint64_t v130 = v176;
    uint64_t v128 = v177;
    goto LABEL_33;
  }
LABEL_27:
  uint64_t v127 = (void *)sub_29F58();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();

  swift_release();
  swift_release();
  uint64_t v128 = v177;
  switch((char)v188)
  {
    case 3:
      swift_bridgeObjectRelease();
      uint64_t v130 = v176;
      goto LABEL_32;
    default:
      char v131 = sub_2A768();
      swift_bridgeObjectRelease();
      uint64_t v130 = v176;
      if (v131)
      {
LABEL_32:
        uint64_t v132 = sub_2A0E8();
        uint64_t v133 = (uint64_t)v171;
        *uint64_t v171 = v132;
        *(void *)(v133 + 8) = 0;
        *(unsigned char *)(v133 + 16) = 1;
        uint64_t v134 = sub_9134(&qword_39DA0);
        sub_1CCF4((char *)(v133 + *(int *)(v134 + 44)));
        char v135 = sub_2A158();
        sub_29F48();
        uint64_t v176 = v118;
        uint64_t v136 = v112;
        uint64_t v137 = v96;
        uint64_t v139 = v138;
        v183 = v114;
        uint64_t v140 = v98;
        uint64_t v142 = v141;
        uint64_t v180 = v116;
        uint64_t v143 = v100;
        uint64_t v145 = v144;
        uint64_t v185 = v102;
        uint64_t v147 = v146;
        uint64_t v148 = v170;
        sub_1794C(v133, v170, &qword_39D50);
        uint64_t v149 = v148 + *(int *)(v128 + 36);
        *(unsigned char *)uint64_t v149 = v135;
        *(void *)(v149 + 8) = v139;
        *(void *)(v149 + 16) = v142;
        uint64_t v96 = v137;
        uint64_t v112 = v136;
        uint64_t v118 = v176;
        uint64_t v98 = v140;
        uint64_t v114 = v183;
        *(void *)(v149 + 24) = v145;
        *(void *)(v149 + 32) = v147;
        uint64_t v100 = v143;
        uint64_t v116 = v180;
        uint64_t v102 = v185;
        *(unsigned char *)(v149 + 40) = 0;
        sub_11D9C(v133, &qword_39D50);
        sub_1755C(v148, v184, &qword_39D58);
        uint64_t v129 = 0;
      }
      else
      {
        uint64_t v129 = 1;
      }
      break;
  }
LABEL_33:
  uint64_t v150 = v184;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v130 + 56))(v184, v129, 1, v128);
  uint64_t v151 = v182;
  sub_1794C(v186, v182, &qword_39D90);
  LODWORD(v185) = v211;
  uint64_t v152 = v178;
  sub_1794C(v150, v178, &qword_39D60);
  uint64_t v153 = v179;
  sub_1794C(v151, v179, &qword_39D90);
  uint64_t v154 = sub_9134(&qword_39D98);
  v183 = (void *)(v153 + *(int *)(v154 + 48));
  v187[0] = v181;
  v187[1] = 0;
  LOBYTE(v151) = v173;
  LOBYTE(v187[2]) = v173;
  memcpy((char *)&v187[2] + 1, v217, 0x11FuLL);
  LOWORD(v187[38]) = 256;
  *(_DWORD *)((char *)&v187[38] + 2) = v215;
  HIWORD(v187[38]) = v216;
  char v155 = v175;
  LOBYTE(v187[39]) = v175;
  *(_DWORD *)((char *)&v187[39] + 1) = *(_DWORD *)v214;
  HIDWORD(v187[39]) = *(_DWORD *)&v214[3];
  v187[40] = v96;
  v187[41] = v98;
  v187[42] = v100;
  v187[43] = v102;
  char v156 = (char)v172;
  LOBYTE(v187[44]) = (_BYTE)v172;
  *(_DWORD *)((char *)&v187[44] + 1) = *(_DWORD *)v213;
  HIDWORD(v187[44]) = *(_DWORD *)&v213[3];
  LOBYTE(v150) = (_BYTE)v174;
  LOBYTE(v187[45]) = (_BYTE)v174;
  *(_DWORD *)((char *)&v187[45] + 1) = *(_DWORD *)v212;
  HIDWORD(v187[45]) = *(_DWORD *)&v212[3];
  v187[46] = v112;
  v187[47] = v114;
  v187[48] = v116;
  v187[49] = v118;
  char v157 = v185;
  LOBYTE(v187[50]) = v185;
  memcpy(v183, v187, 0x191uLL);
  sub_1794C(v152, v153 + *(int *)(v154 + 64), &qword_39D60);
  sub_1E0E0((uint64_t)v187, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_1DFD4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))sub_1E080);
  sub_11D9C(v184, &qword_39D60);
  sub_11D9C(v186, &qword_39D90);
  sub_11D9C(v152, &qword_39D60);
  v188 = (void *)v181;
  uint64_t v189 = 0;
  char v190 = v151;
  memcpy(v191, v217, sizeof(v191));
  __int16 v192 = 256;
  int v193 = v215;
  __int16 v194 = v216;
  char v195 = v155;
  *(_DWORD *)v196 = *(_DWORD *)v214;
  *(_DWORD *)&v196[3] = *(_DWORD *)&v214[3];
  uint64_t v197 = v96;
  uint64_t v198 = v98;
  uint64_t v199 = v100;
  uint64_t v200 = v102;
  char v201 = v156;
  *(_DWORD *)v202 = *(_DWORD *)v213;
  *(_DWORD *)&v202[3] = *(_DWORD *)&v213[3];
  char v203 = v150;
  *(_DWORD *)v204 = *(_DWORD *)v212;
  *(_DWORD *)&v204[3] = *(_DWORD *)&v212[3];
  uint64_t v205 = v112;
  v206 = v114;
  uint64_t v207 = v116;
  uint64_t v208 = v118;
  char v209 = v157;
  sub_1E0E0((uint64_t)&v188, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_1E1EC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))sub_1E2B8);
  return sub_11D9C(v182, &qword_39D90);
}

uint64_t sub_1C31C()
{
  return sub_2A3D8();
}

uint64_t sub_1C3F0@<X0>(uint64_t a1@<X8>)
{
  sub_1E488();
  uint64_t result = sub_2A208();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

id sub_1C478@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MultiTaskingSectionViewModel();
  sub_1DE24();
  uint64_t v2 = (void *)sub_29F58();
  char v3 = sub_22DB8();

  if (v3)
  {
    LOBYTE(v103) = 1;
    *((void *)&v103 + 1) = sub_2A0C8();
    *(void *)&long long v104 = v4;
    BYTE8(v104) = v5 & 1;
    *(void *)&long long v105 = v6;
    *((void *)&v105 + 1) = 0x694D6E6565726373;
    *(void *)&long long v106 = 0xEF676E69726F7272;
    *((void *)&v106 + 1) = sub_2A018();
    *(void *)&long long v107 = v7;
    sub_1E5D0((uint64_t)&v103);
    sub_1755C((uint64_t)&v103, (uint64_t)&v90, &qword_39DE8);
    sub_9134(&qword_39DF0);
    sub_1E4F8();
    sub_A7C8(&qword_39E00, &qword_39DF0);
    sub_2A108();
LABEL_18:
    uint64_t v35 = (void *)sub_29F58();
    id result = (id)MobileGestalt_get_current_device();
    if (result)
    {
      uint64_t v36 = result;
      int deviceSupportsEnhancedMultitasking = MobileGestalt_get_deviceSupportsEnhancedMultitasking();

      if (deviceSupportsEnhancedMultitasking)
      {

        goto LABEL_23;
      }
      id result = (id)MobileGestalt_get_current_device();
      if (result)
      {
        uint64_t v38 = result;
        int deviceSupportsSingleDisplayEnhancedMultitasking = MobileGestalt_get_deviceSupportsSingleDisplayEnhancedMultitasking();

        if (!deviceSupportsSingleDisplayEnhancedMultitasking)
        {
          uint64_t v52 = 0;
          uint64_t v51 = 0;
          uint64_t v77 = 0;
          uint64_t v78 = 0;
          uint64_t v48 = 0;
          uint64_t v76 = 0;
          uint64_t v50 = 0;
          uint64_t v49 = 0;
          uint64_t v45 = 0;
          uint64_t v47 = 0;
          goto LABEL_25;
        }
LABEL_23:
        uint64_t v40 = sub_2A0C8();
        uint64_t v77 = v41;
        uint64_t v78 = v40;
        char v43 = v42;
        uint64_t v76 = v44;
        uint64_t v45 = (void *)sub_2A018();
        uint64_t v47 = v46;
        uint64_t v48 = v43 & 1;
        uint64_t v49 = 0xEC00000072656761;
        uint64_t v50 = 0x6E614D6567617473;
        uint64_t v51 = 3;
        uint64_t v52 = 1;
LABEL_25:
        long long v87 = v122;
        long long v88 = v123;
        *(_OWORD *)double v89 = v124[0];
        *(_OWORD *)&v89[11] = *(_OWORD *)((char *)v124 + 11);
        long long v53 = v118;
        long long v83 = v118;
        long long v84 = v119;
        long long v54 = v120;
        long long v85 = v120;
        long long v86 = v121;
        long long v55 = v114;
        long long v79 = v114;
        long long v80 = v115;
        long long v81 = v116;
        long long v82 = v117;
        long long v56 = v123;
        long long v98 = v122;
        long long v99 = v123;
        v100[0] = v124[0];
        *(_OWORD *)((char *)v100 + 11) = *(_OWORD *)((char *)v124 + 11);
        long long v57 = v119;
        long long v94 = v118;
        long long v95 = v119;
        long long v58 = v121;
        long long v96 = v120;
        long long v97 = v121;
        long long v59 = v115;
        long long v60 = v116;
        long long v90 = v114;
        long long v91 = v115;
        long long v61 = v117;
        long long v92 = v116;
        long long v93 = v117;
        *(_OWORD *)(a1 + 128) = v122;
        *(_OWORD *)(a1 + 144) = v56;
        *(_OWORD *)(a1 + 160) = v124[0];
        *(_OWORD *)(a1 + 171) = *(_OWORD *)((char *)v124 + 11);
        *(_OWORD *)(a1 + 64) = v53;
        *(_OWORD *)(a1 + 80) = v57;
        *(_OWORD *)(a1 + 96) = v54;
        *(_OWORD *)(a1 + 112) = v58;
        *(_OWORD *)a1 = v55;
        *(_OWORD *)(a1 + 16) = v59;
        *(_OWORD *)(a1 + 32) = v60;
        *(_OWORD *)(a1 + 48) = v61;
        *(void *)(a1 + 192) = 0;
        *(void *)(a1 + 200) = v52;
        *(void *)(a1 + 208) = v51;
        *(void *)(a1 + 216) = v78;
        *(void *)(a1 + 224) = v77;
        *(void *)(a1 + 232) = v48;
        *(void *)(a1 + 240) = v76;
        *(void *)(a1 + 248) = v50;
        *(void *)(a1 + 256) = v49;
        *(void *)(a1 + 264) = v45;
        *(void *)(a1 + 272) = v47;
        uint64_t v62 = v48;
        sub_1E54C((uint64_t)&v90, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_1DFD4);
        sub_1E080(0, v52, v51, v78, v77, v62, v76, v50, v49, v45);
        sub_1E2B8(0, v52, v51, v78, v77, v62, v76, v50, v49, v45);
        long long v111 = v87;
        long long v112 = v88;
        *(_OWORD *)uint64_t v113 = *(_OWORD *)v89;
        *(_OWORD *)&v113[11] = *(_OWORD *)&v89[11];
        long long v107 = v83;
        long long v108 = v84;
        long long v109 = v85;
        long long v110 = v86;
        long long v103 = v79;
        long long v104 = v80;
        long long v105 = v81;
        long long v106 = v82;
        return (id)sub_1E54C((uint64_t)&v103, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_1E1EC);
      }
      goto LABEL_29;
    }
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v8 = (void *)sub_29F58();
  id result = (id)MobileGestalt_get_current_device();
  if (!result)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v10 = result;
  int v11 = MobileGestalt_get_deviceSupportsEnhancedMultitasking();

  if (v11)
  {

LABEL_8:
    char v68 = 0;
    char v69 = 1;
    goto LABEL_10;
  }
  id result = (id)MobileGestalt_get_current_device();
  if (!result)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v12 = result;
  int v13 = MobileGestalt_get_deviceSupportsSingleDisplayEnhancedMultitasking();

  if (v13) {
    goto LABEL_8;
  }
  char v68 = 1;
  char v69 = 0;
LABEL_10:
  uint64_t v74 = sub_2A0C8();
  uint64_t v15 = v14;
  char v66 = v16;
  uint64_t v18 = v17;
  int v72 = (void *)sub_2A018();
  unint64_t v73 = v19;
  uint64_t v71 = sub_2A0C8();
  uint64_t v21 = v20;
  char v23 = v22;
  uint64_t v75 = v24;
  *(void *)&long long v70 = sub_2A018();
  *((void *)&v70 + 1) = v25;
  uint64_t v26 = (void *)sub_29F58();
  id result = (id)MobileGestalt_get_current_device();
  if (!result)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v27 = result;
  int v28 = MobileGestalt_get_deviceSupportsEnhancedMultitasking();

  if (v28)
  {

    goto LABEL_15;
  }
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    uint64_t v29 = result;
    int v30 = MobileGestalt_get_deviceSupportsSingleDisplayEnhancedMultitasking();

    if (!v30)
    {
      uint64_t v31 = v18;
      uint64_t v32 = v15;
      char v33 = 0;
      char v63 = 1;
      goto LABEL_17;
    }
LABEL_15:
    uint64_t v31 = v18;
    uint64_t v32 = v15;
    char v63 = 0;
    char v33 = 1;
LABEL_17:
    char v34 = v66 & 1;
    char v64 = v33;
    char v102 = 1;
    char v101 = v33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v67 = (id)v70;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v65 = v72;
    *(void *)&long long v103 = 0;
    BYTE8(v103) = v68;
    BYTE9(v103) = v69;
    LOBYTE(v104) = 0;
    *((void *)&v104 + 1) = v74;
    *(void *)&long long v105 = v32;
    BYTE8(v105) = v34;
    *(void *)&long long v106 = v31;
    *((void *)&v106 + 1) = 0x7441707041656E6FLL;
    *(void *)&long long v107 = 0xED0000656D695441;
    *((void *)&v107 + 1) = v72;
    long long v108 = v73;
    LOBYTE(v109) = 1;
    BYTE8(v109) = 2;
    *(void *)&long long v110 = v71;
    *((void *)&v110 + 1) = v21;
    LOBYTE(v111) = v23 & 1;
    *((void *)&v111 + 1) = v75;
    *(void *)&long long v112 = 0xD000000000000012;
    *((void *)&v112 + 1) = 0x800000000002C7E0;
    *(_OWORD *)uint64_t v113 = v70;
    *(void *)&v113[16] = 0;
    v113[24] = v63;
    v113[25] = v64;
    sub_1E4EC((uint64_t)&v103);
    sub_1755C((uint64_t)&v103, (uint64_t)&v114, &qword_39DE8);
    sub_9134(&qword_39DF0);
    sub_1E4F8();
    sub_A7C8(&qword_39E00, &qword_39DF0);
    sub_2A108();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    long long v122 = v98;
    long long v123 = v99;
    v124[0] = v100[0];
    *(_OWORD *)((char *)v124 + 11) = *(_OWORD *)((char *)v100 + 11);
    long long v118 = v94;
    long long v119 = v95;
    long long v120 = v96;
    long long v121 = v97;
    long long v114 = v90;
    long long v115 = v91;
    long long v116 = v92;
    long long v117 = v93;
    goto LABEL_18;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_1CCF4@<X0>(char *a1@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v35 = sub_9134(&qword_39590);
  uint64_t v42 = *(void *)(v35 - 8);
  uint64_t v1 = __chkstk_darwin(v35);
  uint64_t v44 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __chkstk_darwin(v1);
  char v43 = (char *)&v32 - v4;
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v40 = (char *)&v32 - v6;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v32 - v7;
  uint64_t v34 = sub_2A3C8();
  uint64_t v41 = *(void *)(v34 - 8);
  uint64_t v9 = __chkstk_darwin(v34);
  char v33 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v38 = (char *)&v32 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v37 = (char *)&v32 - v14;
  __chkstk_darwin(v13);
  id v39 = (char *)&v32 - v15;
  sub_2A3B8();
  type metadata accessor for MultiTaskingSectionViewModel();
  sub_1DE24();
  char v16 = (void *)sub_29F68();
  swift_getKeyPath();
  sub_29FA8();
  swift_release();

  uint64_t v32 = v8;
  sub_2A388();
  sub_2A3B8();
  uint64_t v17 = (void *)sub_29F68();
  swift_getKeyPath();
  sub_29FA8();
  swift_release();

  uint64_t v18 = v40;
  sub_2A388();
  unint64_t v19 = *(void (**)(char *, char *, uint64_t))(v41 + 16);
  uint64_t v20 = v38;
  uint64_t v21 = v34;
  v19(v38, v39, v34);
  char v22 = v43;
  char v23 = *(void (**)(char *, char *, uint64_t))(v42 + 16);
  uint64_t v24 = v35;
  v23(v43, v8, v35);
  uint64_t v25 = v33;
  v19(v33, v37, v21);
  v23(v44, v18, v24);
  uint64_t v26 = v36;
  v19(v36, v20, v21);
  uint64_t v27 = (int *)sub_9134(&qword_39DE0);
  v23(&v26[v27[12]], v22, v24);
  v19(&v26[v27[16]], v25, v21);
  int v28 = v44;
  v23(&v26[v27[20]], v44, v24);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v42 + 8);
  v29(v40, v24);
  int v30 = *(void (**)(char *, uint64_t))(v41 + 8);
  v30(v37, v21);
  v29(v32, v24);
  v30(v39, v21);
  v29(v28, v24);
  v30(v25, v21);
  v29(v43, v24);
  return ((uint64_t (*)(char *, uint64_t))v30)(v38, v21);
}

uint64_t sub_1D1F4@<X0>(uint64_t a1@<X8>)
{
  return sub_1D224(a1);
}

uint64_t sub_1D214@<X0>(uint64_t a1@<X8>)
{
  return sub_1D224(a1);
}

uint64_t sub_1D224@<X0>(uint64_t a1@<X8>)
{
  sub_2A0C8();
  if (qword_39200 != -1) {
    swift_once();
  }
  id v2 = (id)qword_3A210;
  uint64_t result = sub_2A1E8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_1D2EC()
{
  type metadata accessor for MultiTaskingSectionViewModel();
  sub_1DE24();
  sub_29F58();
  id v0 = [self currentDevice];
  [v0 orientation];

  swift_getKeyPath();
  swift_getKeyPath();
  return sub_29ED8();
}

uint64_t sub_1D3BC()
{
  type metadata accessor for MultiTaskingSectionViewModel();
  sub_1DE24();
  id v0 = (void *)sub_29F58();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();

  swift_release();
  swift_release();
  switch(v8)
  {
    case 1:
    case 2:
    case 3:
      return sub_2A0C8();
    default:
      uint64_t v1 = (void *)sub_29F58();
      id v2 = (id)MobileGestalt_get_current_device();
      if (!v2)
      {
        __break(1u);
        goto LABEL_9;
      }
      uint64_t v3 = v2;
      int deviceSupportsEnhancedMultitasking = MobileGestalt_get_deviceSupportsEnhancedMultitasking();

      if (!deviceSupportsEnhancedMultitasking)
      {
        id v5 = (id)MobileGestalt_get_current_device();
        if (v5)
        {
          uint64_t v6 = v5;
          MobileGestalt_get_deviceSupportsSingleDisplayEnhancedMultitasking();

          return sub_2A0C8();
        }
LABEL_9:
        __break(1u);
        JUMPOUT(0x1D5A4);
      }

      return sub_2A0C8();
  }
}

uint64_t sub_1D5B4()
{
  uint64_t v0 = sub_29DB8();
  uint64_t v45 = *(void *)(v0 - 8);
  uint64_t v46 = v0;
  __chkstk_darwin(v0);
  uint64_t v44 = (char *)&v39 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_29DC8();
  uint64_t v42 = *(void *)(v2 - 8);
  uint64_t v43 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_29DE8();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_9134(&qword_39C90);
  __chkstk_darwin(v6 - 8);
  char v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_9134(&qword_39D40);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_29E08();
  uint64_t v47 = *(void *)(v12 - 8);
  uint64_t v48 = v12;
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v40 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v41 = (char *)&v39 - v15;
  uint64_t v16 = sub_29E78();
  __chkstk_darwin(v16 - 8);
  uint64_t v17 = sub_2A4B8();
  __chkstk_darwin(v17 - 8);
  type metadata accessor for MultiTaskingSectionViewModel();
  sub_1DE24();
  uint64_t v18 = (void *)sub_29F58();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();

  swift_release();
  swift_release();
  int v19 = v49;
  sub_2A4A8();
  if (qword_39200 != -1) {
    swift_once();
  }
  uint64_t v20 = 0xD000000000000028;
  id v21 = (id)qword_3A210;
  sub_29E68();
  v22._countAndFlagsBits = sub_2A508();
  if (v19 == 2)
  {
    char v23 = "https://support.apple.com/en-us/HT207582";
  }
  else
  {
    if (v19 != 3)
    {
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    uint64_t v20 = 0xD000000000000059;
    char v23 = "https://support.apple.com/guide/ipad/move-resize-and-organize-windows-ipad1240f36f/ipados";
  }
  uint64_t v24 = (void *)((unint64_t)(v23 - 32) | 0x8000000000000000);
  uint64_t v49 = 23328;
  unint64_t v50 = 0xE200000000000000;
  sub_2A528(v22);
  swift_bridgeObjectRelease();
  v51._countAndFlagsBits = 10333;
  v51._object = (void *)0xE200000000000000;
  sub_2A528(v51);
  v52._countAndFlagsBits = v20;
  v52._object = v24;
  sub_2A528(v52);
  swift_bridgeObjectRelease();
  v53._countAndFlagsBits = 41;
  v53._object = (void *)0xE100000000000000;
  sub_2A528(v53);
  uint64_t v25 = sub_29E58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v8, 1, 1, v25);
  (*(void (**)(char *, void, uint64_t))(v42 + 104))(v4, enum case for AttributedString.MarkdownParsingOptions.InterpretedSyntax.full(_:), v43);
  (*(void (**)(char *, void, uint64_t))(v45 + 104))(v44, enum case for AttributedString.MarkdownParsingOptions.FailurePolicy.throwError(_:), v46);
  sub_29DD8();
  sub_29DF8();
  uint64_t v27 = v47;
  uint64_t v26 = v48;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(v11, 0, 1, v48);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v11, 1, v26) != 1)
  {
    int v30 = v41;
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v41, v11, v26);
    sub_2A0C8();
    uint64_t v45 = sub_2A1E8();
    uint64_t v46 = v31;
    uint64_t v43 = v32;
    LODWORD(v44) = v33 & 1;
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v40, v30, v26);
    uint64_t v34 = sub_2A1F8();
    uint64_t v36 = v35;
    LOBYTE(v30) = v37 & 1;
    uint64_t v38 = v43;
    uint64_t v28 = sub_2A1D8();
    sub_1744C(v34, v36, (char)v30);
    swift_bridgeObjectRelease();
    sub_1744C(v45, v38, (char)v44);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v41, v48);
    return v28;
  }
  sub_11D9C((uint64_t)v11, &qword_39D40);
LABEL_11:
  sub_2A0C8();
  return sub_2A1E8();
}

uint64_t sub_1DD6C@<X0>(uint64_t a1@<X8>)
{
  return sub_1A9FC(*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16), a1);
}

uint64_t sub_1DD78@<X0>(uint64_t a1@<X8>)
{
  return sub_1B0A8(*(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32), a1);
}

unint64_t sub_1DD84()
{
  unint64_t result = qword_39D20;
  if (!qword_39D20)
  {
    sub_A130(&qword_39D10);
    sub_1E37C(&qword_39D28, &qword_39D30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39D20);
  }
  return result;
}

unint64_t sub_1DE24()
{
  unint64_t result = qword_39B08;
  if (!qword_39B08)
  {
    type metadata accessor for MultiTaskingSectionViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39B08);
  }
  return result;
}

uint64_t sub_1DE7C()
{
  sub_11E08(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));

  return _swift_deallocObject(v0, 33, 7);
}

uint64_t sub_1DEB8()
{
  return sub_1D2EC();
}

uint64_t sub_1DECC@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1DF50(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_29ED8();
}

uint64_t sub_1DFD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,__int16 a24,char a25)
{
  if (a25)
  {
    id v26 = a21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    a10 = a8;
  }
  id v27 = a10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_1E080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  if (a5)
  {
    id v10 = a10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1E0E0(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))
{
  uint64_t v4 = *(void *)(a1 + 216);
  uint64_t v5 = *(void *)(a1 + 224);
  uint64_t v6 = *(void *)(a1 + 232);
  uint64_t v7 = *(void *)(a1 + 240);
  uint64_t v8 = *(void *)(a1 + 248);
  uint64_t v9 = *(void *)(a1 + 256);
  uint64_t v10 = *(void *)(a1 + 264);
  uint64_t v11 = *(void *)(a1 + 272);
  long long v15 = *(_OWORD *)(a1 + 280);
  uint64_t v12 = *(void *)(a1 + 296);
  BYTE2(v14) = *(unsigned char *)(a1 + 210);
  LOWORD(v14) = *(_WORD *)(a1 + 208);
  a2(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(void *)(a1 + 160), *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    v14);
  a3(v4, v5, v6, v7, v8, v9, v10, v11, v15, *((void *)&v15 + 1), v12);
  return a1;
}

void sub_1E1EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,__int16 a24,char a25)
{
  if (a25)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    a21 = a8;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_1E2B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  if (a5)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_1E328()
{
  unint64_t result = qword_39DB0;
  if (!qword_39DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39DB0);
  }
  return result;
}

uint64_t sub_1E37C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_A130(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1E3D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2A068();
  *a1 = result;
  return result;
}

uint64_t sub_1E404@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2A068();
  *a1 = result;
  return result;
}

uint64_t sub_1E430()
{
  return sub_2A078();
}

uint64_t sub_1E45C()
{
  return sub_2A078();
}

unint64_t sub_1E488()
{
  unint64_t result = qword_39DD8;
  if (!qword_39DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39DD8);
  }
  return result;
}

uint64_t sub_1E4EC(uint64_t result)
{
  *(unsigned char *)(result + 186) = 1;
  return result;
}

unint64_t sub_1E4F8()
{
  unint64_t result = qword_39DF8;
  if (!qword_39DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39DF8);
  }
  return result;
}

uint64_t sub_1E54C(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))
{
  BYTE2(v4) = *(unsigned char *)(a1 + 186);
  LOWORD(v4) = *(_WORD *)(a1 + 184);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    v4);
  return a1;
}

uint64_t sub_1E5D0(uint64_t result)
{
  *(unsigned char *)(result + 186) = 0;
  return result;
}

uint64_t sub_1E5D8()
{
  return sub_A7C8(&qword_39E08, &qword_39D38);
}

uint64_t sub_1E614()
{
  return sub_2164C();
}

uint64_t sub_1E64C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_9134(&qword_395C0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = v1;
  sub_2A0C8();
  if (qword_39200 != -1) {
    swift_once();
  }
  id v7 = (id)qword_3A210;
  *(void *)&long long v18 = sub_2A1E8();
  *((void *)&v18 + 1) = v8;
  char v19 = v9 & 1;
  uint64_t v20 = v10;
  sub_9134(&qword_39570);
  sub_CD84();
  sub_2A408();
  long long v11 = v1[1];
  long long v21 = *v1;
  long long v18 = v11;
  char v19 = *((unsigned char *)v1 + 32);
  uint64_t v12 = swift_allocObject();
  long long v13 = v1[1];
  *(_OWORD *)(v12 + 16) = *v1;
  *(_OWORD *)(v12 + 32) = v13;
  *(unsigned char *)(v12 + 48) = *((unsigned char *)v1 + 32);
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v4 + 16))(a1, v6, v3);
  int v14 = (uint64_t (**)())(a1 + *(int *)(sub_9134(&qword_395C8) + 36));
  *int v14 = sub_1EE78;
  v14[1] = (uint64_t (*)())v12;
  v14[2] = 0;
  v14[3] = 0;
  sub_DB00((uint64_t)&v21);
  sub_11E5C((uint64_t)&v18);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1E8C4()
{
  uint64_t v0 = sub_9134(&qword_39590);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ShakeToUndoSectionViewModel();
  sub_1EE80(&qword_39E10, (void (*)(uint64_t))type metadata accessor for ShakeToUndoSectionViewModel);
  sub_29F68();
  swift_getKeyPath();
  sub_29FA8();
  swift_release();
  swift_release();
  sub_2A388();
  sub_CE00();
  sub_2A298();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1EAA4@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1EB24()
{
  return sub_29ED8();
}

uint64_t sub_1EB98@<X0>(uint64_t a1@<X8>)
{
  sub_2A0C8();
  if (qword_39200 != -1) {
    swift_once();
  }
  id v2 = (id)qword_3A210;
  uint64_t result = sub_2A1E8();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_1EC80(void *a1)
{
  type metadata accessor for ShakeToUndoSectionViewModel();
  sub_1EE80(&qword_39E10, (void (*)(uint64_t))type metadata accessor for ShakeToUndoSectionViewModel);
  uint64_t v2 = sub_29F58();
  if (*a1)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (uint64_t *)(*a1 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings31MultitaskingAndGesturesDeepLink_referrer);
    uint64_t v6 = *v4;
    uint64_t v5 = v4[1];
    id v7 = (void *)(v3 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings27ShakeToUndoSectionViewModel_referrer);
    void *v7 = v6;
    v7[1] = v5;
    swift_bridgeObjectRetain();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for MultitaskingAndGesturesDeepLink(0);
    sub_1EE80((unint64_t *)&qword_395D8, (void (*)(uint64_t))type metadata accessor for MultitaskingAndGesturesDeepLink);
    uint64_t result = sub_2A008();
    __break(1u);
  }
  return result;
}

uint64_t sub_1EDC4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E64C(a1);
}

ValueMetadata *type metadata accessor for ShakeToUndoSection()
{
  return &type metadata for ShakeToUndoSection;
}

uint64_t sub_1EE10()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1EE2C()
{
  return sub_1E8C4();
}

uint64_t sub_1EE34()
{
  swift_release();
  sub_D880();

  return _swift_deallocObject(v0, 49, 7);
}

uint64_t sub_1EE78()
{
  return sub_1EC80((void *)(v0 + 16));
}

uint64_t sub_1EE80(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_1EED0()
{
  return sub_4FBC();
}

uint64_t destroy for CornerGesturesSection()
{
  swift_release();
  sub_D880();

  return swift_release();
}

uint64_t initializeWithCopy for CornerGesturesSection(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  swift_retain();
  sub_D838();
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CornerGesturesSection(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  char v6 = *(unsigned char *)(a2 + 32);
  sub_D838();
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  sub_D880();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for CornerGesturesSection(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CornerGesturesSection(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 24);
  char v5 = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  sub_D880();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CornerGesturesSection(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CornerGesturesSection(uint64_t result, int a2, int a3)
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CornerGesturesSection()
{
  return &type metadata for CornerGesturesSection;
}

uint64_t sub_1F180()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1F19C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_9134(&qword_39E18);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v16[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = v1;
  sub_2A0C8();
  if (qword_39200 != -1) {
    swift_once();
  }
  id v7 = (id)qword_3A210;
  *(void *)&long long v18 = sub_2A1E8();
  *((void *)&v18 + 1) = v8;
  char v19 = v9 & 1;
  uint64_t v20 = v10;
  sub_9134(&qword_39E20);
  sub_A7C8(&qword_39E28, &qword_39E20);
  sub_2A408();
  long long v11 = v1[1];
  long long v22 = *v1;
  long long v18 = v11;
  char v19 = *((unsigned char *)v1 + 32);
  uint64_t v21 = *((void *)v1 + 5);
  uint64_t v12 = (uint64_t (*)())swift_allocObject();
  long long v13 = v1[1];
  *((_OWORD *)v12 + 1) = *v1;
  *((_OWORD *)v12 + 2) = v13;
  *((_OWORD *)v12 + 3) = v1[2];
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v4 + 16))(a1, v6, v3);
  int v14 = (uint64_t (**)())(a1 + *(int *)(sub_9134(&qword_39E30) + 36));
  *int v14 = sub_207A0;
  v14[1] = v12;
  v14[2] = 0;
  v14[3] = 0;
  sub_DB00((uint64_t)&v22);
  sub_DB2C((uint64_t)&v18);
  sub_DB00((uint64_t)&v21);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1F448@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_2A0E8();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  uint64_t v4 = sub_9134(&qword_39E40);
  return sub_1F498(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_1F498@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v68 = a2;
  uint64_t v3 = sub_9134(&qword_39E48);
  uint64_t v59 = *(void *)(v3 - 8);
  uint64_t v60 = v3;
  __chkstk_darwin(v3);
  long long v56 = (char *)v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_9134(&qword_39E50);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v62 = (uint64_t)v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  long long v61 = (char *)v53 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  long long v58 = (char *)v53 - v11;
  __chkstk_darwin(v10);
  uint64_t v57 = (uint64_t)v53 - v12;
  uint64_t v13 = sub_9134(&qword_39E58);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v16 = (char *)v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v67 = (uint64_t)v53 - v17;
  uint64_t v18 = sub_9134(&qword_39590);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)v53 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_9134(&qword_39570);
  __chkstk_darwin(v22 - 8);
  uint64_t v24 = (char *)v53 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_9134(&qword_39E60);
  uint64_t v26 = __chkstk_darwin(v25);
  uint64_t v66 = (uint64_t)v53 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __chkstk_darwin(v26);
  id v65 = (char *)v53 - v29;
  __chkstk_darwin(v28);
  uint64_t v69 = (uint64_t)v53 - v30;
  uint64_t v64 = *(void *)(a1 + 40);
  sub_29F18();
  unint64_t v63 = a1;
  if (v73 == 1)
  {
    LOBYTE(v70) = 0;
    sub_2A3A8();
  }
  else
  {
    unint64_t v55 = (unint64_t)v24;
    uint64_t v54 = *(void *)(a1 + 24);
    type metadata accessor for CornerGesturesSectionViewModel();
    sub_20A68(&qword_39E38, (void (*)(uint64_t))type metadata accessor for CornerGesturesSectionViewModel);
    uint64_t v24 = (char *)v55;
    sub_29F68();
    swift_getKeyPath();
    sub_29FA8();
    swift_release();
    swift_release();
  }
  sub_2A388();
  sub_A7C8((unint64_t *)&qword_39588, &qword_39590);
  sub_2A298();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  sub_29F18();
  char v31 = v73;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v33 = swift_allocObject();
  *(unsigned char *)(v33 + 16) = v31;
  uint64_t v34 = (uint64_t)v65;
  sub_1794C((uint64_t)v24, (uint64_t)v65, &qword_39570);
  uint64_t v35 = (uint64_t *)(v34 + *(int *)(v25 + 36));
  uint64_t *v35 = KeyPath;
  v35[1] = (uint64_t)sub_20818;
  v35[2] = v33;
  sub_11D9C((uint64_t)v24, &qword_39570);
  uint64_t v36 = v69;
  sub_1755C(v34, v69, &qword_39E60);
  sub_29F18();
  if (v73) {
    goto LABEL_7;
  }
  uint64_t v37 = *(void *)(v63 + 24);
  int v38 = *(unsigned __int8 *)(v63 + 32);
  type metadata accessor for CornerGesturesSectionViewModel();
  sub_20A68(&qword_39E38, (void (*)(uint64_t))type metadata accessor for CornerGesturesSectionViewModel);
  sub_29F58();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  swift_release();
  if (v73 != 1)
  {
LABEL_7:
    uint64_t v48 = sub_9134(&qword_39E68);
    uint64_t v47 = v67;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v67, 1, 1, v48);
  }
  else
  {
    LODWORD(v64) = v38;
    sub_29F68();
    swift_getKeyPath();
    sub_29FA8();
    swift_release();
    swift_release();
    uint64_t v70 = v73;
    uint64_t v71 = v74;
    char v72 = v75;
    uint64_t v54 = sub_9134(&qword_39E78);
    unint64_t v63 = sub_AE98();
    unint64_t v55 = sub_20880();
    v53[1] = v37;
    uint64_t v39 = v56;
    sub_2A368();
    v53[2] = sub_A7C8(&qword_39E98, &qword_39E48);
    uint64_t v40 = (uint64_t)v58;
    uint64_t v41 = v60;
    sub_2A298();
    uint64_t v59 = *(void *)(v59 + 8);
    ((void (*)(char *, uint64_t))v59)(v39, v41);
    id v65 = v16;
    uint64_t v42 = v57;
    sub_1755C(v40, v57, &qword_39E50);
    sub_29F68();
    swift_getKeyPath();
    sub_29FA8();
    swift_release();
    swift_release();
    uint64_t v70 = v73;
    uint64_t v71 = v74;
    char v72 = v75;
    sub_2A368();
    uint64_t v43 = (uint64_t)v61;
    sub_2A298();
    ((void (*)(char *, uint64_t))v59)(v39, v41);
    uint64_t v36 = v69;
    sub_1755C(v43, v40, &qword_39E50);
    sub_1794C(v42, v43, &qword_39E50);
    uint64_t v44 = v62;
    sub_1794C(v40, v62, &qword_39E50);
    sub_1794C(v43, (uint64_t)v65, &qword_39E50);
    uint64_t v45 = sub_9134(&qword_39EA0);
    sub_1794C(v44, (uint64_t)&v65[*(int *)(v45 + 48)], &qword_39E50);
    sub_11D9C(v40, &qword_39E50);
    sub_11D9C(v42, &qword_39E50);
    sub_11D9C(v44, &qword_39E50);
    uint64_t v16 = v65;
    sub_11D9C(v43, &qword_39E50);
    uint64_t v46 = sub_9134(&qword_39E68);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v16, 0, 1, v46);
    uint64_t v47 = v67;
    sub_1755C((uint64_t)v16, v67, &qword_39E58);
  }
  uint64_t v49 = v66;
  sub_1794C(v36, v66, &qword_39E60);
  sub_1794C(v47, (uint64_t)v16, &qword_39E58);
  uint64_t v50 = v68;
  sub_1794C(v49, v68, &qword_39E60);
  uint64_t v51 = sub_9134(&qword_39E70);
  sub_1794C((uint64_t)v16, v50 + *(int *)(v51 + 48), &qword_39E58);
  sub_11D9C(v47, &qword_39E58);
  sub_11D9C(v36, &qword_39E60);
  sub_11D9C((uint64_t)v16, &qword_39E58);
  return sub_11D9C(v49, &qword_39E60);
}

uint64_t sub_1FFD0@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_20050()
{
  return sub_29ED8();
}

uint64_t sub_200C4@<X0>(uint64_t a1@<X8>)
{
  return sub_1D224(a1);
}

uint64_t sub_200E0@<X0>(unsigned char *a1@<X8>)
{
  return sub_20168(a1);
}

uint64_t sub_200F4()
{
  return sub_201F8();
}

id sub_20108()
{
  return sub_20280();
}

uint64_t sub_20120()
{
  return sub_203C4();
}

uint64_t sub_20138@<X0>(uint64_t a1@<X8>)
{
  return sub_1D224(a1);
}

uint64_t sub_20154@<X0>(unsigned char *a1@<X8>)
{
  return sub_20168(a1);
}

uint64_t sub_20168@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_201E4()
{
  return sub_201F8();
}

uint64_t sub_201F8()
{
  return sub_29ED8();
}

id sub_20268()
{
  return sub_20280();
}

id sub_20280()
{
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    uint64_t v1 = result;
    MobileGestalt_get_quickNoteCapability();

    swift_bridgeObjectRetain();
    sub_9134(&qword_39470);
    sub_9134(&qword_39E90);
    sub_A7C8(&qword_39EA8, &qword_39470);
    sub_A7C8(&qword_39E88, &qword_39E90);
    sub_20968();
    return (id)sub_2A3E8();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_203AC()
{
  return sub_203C4();
}

uint64_t sub_203C4()
{
  return sub_29F88();
}

uint64_t sub_20448@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_9134(&qword_39EB8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_AB4C();
  uint64_t v7 = v6;
  v12[0] = v5;
  v12[1] = v6;
  char v9 = v8 & 1;
  char v13 = v8 & 1;
  uint64_t v14 = v10;
  sub_2A298();
  swift_bridgeObjectRelease();
  sub_1744C(v5, v7, v9);
  swift_bridgeObjectRelease();
  return sub_1755C((uint64_t)v4, a1, &qword_39EB8);
}

uint64_t sub_205B0@<X0>(uint64_t a1@<X8>)
{
  return sub_1D224(a1);
}

uint64_t sub_205CC(void *a1)
{
  type metadata accessor for CornerGesturesSectionViewModel();
  sub_20A68(&qword_39E38, (void (*)(uint64_t))type metadata accessor for CornerGesturesSectionViewModel);
  uint64_t v2 = sub_29F58();
  if (*a1)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (uint64_t *)(*a1 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings31MultitaskingAndGesturesDeepLink_referrer);
    uint64_t v6 = *v4;
    uint64_t v5 = v4[1];
    uint64_t v7 = (void *)(v3 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings30CornerGesturesSectionViewModel_referrer);
    void *v7 = v6;
    v7[1] = v5;
    swift_bridgeObjectRetain();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    type metadata accessor for MultitaskingAndGesturesDeepLink(0);
    sub_20A68((unint64_t *)&qword_395D8, (void (*)(uint64_t))type metadata accessor for MultitaskingAndGesturesDeepLink);
    uint64_t result = sub_2A008();
    __break(1u);
  }
  return result;
}

uint64_t sub_20710@<X0>(uint64_t a1@<X8>)
{
  return sub_1F19C(a1);
}

uint64_t sub_2074C@<X0>(uint64_t a1@<X8>)
{
  return sub_1F448(*(void *)(v1 + 16), a1);
}

uint64_t sub_20754()
{
  swift_release();
  sub_D880();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_207A0()
{
  return sub_205CC((void *)(v0 + 16));
}

uint64_t sub_207B0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2A088();
  *a1 = result & 1;
  return result;
}

uint64_t sub_207E0()
{
  return sub_2A098();
}

uint64_t sub_20808()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_20818(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_20830@<X0>(unsigned char *a1@<X8>)
{
  return sub_20168(a1);
}

uint64_t sub_20858()
{
  return sub_201F8();
}

unint64_t sub_20880()
{
  unint64_t result = qword_39E80;
  if (!qword_39E80)
  {
    sub_A130(&qword_39E78);
    sub_A7C8(&qword_39E88, &qword_39E90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39E80);
  }
  return result;
}

uint64_t sub_20918@<X0>(unsigned char *a1@<X8>)
{
  return sub_20168(a1);
}

uint64_t sub_20940()
{
  return sub_201F8();
}

unint64_t sub_20968()
{
  unint64_t result = qword_39EB0;
  if (!qword_39EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39EB0);
  }
  return result;
}

unint64_t sub_209BC()
{
  unint64_t result = qword_39EC0;
  if (!qword_39EC0)
  {
    sub_A130(&qword_39EB8);
    sub_20A68((unint64_t *)&qword_39598, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39EC0);
  }
  return result;
}

uint64_t sub_20A68(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_20AB0@<X0>(uint64_t a1@<X8>)
{
  return sub_20448(a1);
}

unint64_t sub_20AD0()
{
  unint64_t result = qword_39EC8;
  if (!qword_39EC8)
  {
    sub_A130(&qword_39E30);
    sub_20B4C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39EC8);
  }
  return result;
}

unint64_t sub_20B4C()
{
  unint64_t result = qword_39ED0;
  if (!qword_39ED0)
  {
    sub_A130(&qword_39E18);
    sub_A7C8(&qword_39E28, &qword_39E20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39ED0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MultiTaskingWindowType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MultiTaskingWindowType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20D58);
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

ValueMetadata *type metadata accessor for MultiTaskingWindowType()
{
  return &type metadata for MultiTaskingWindowType;
}

Swift::Int sub_20D90()
{
  return sub_2A798();
}

Swift::Int sub_20ED4()
{
  return sub_2A798();
}

uint64_t sub_20FD4()
{
  sub_2A518();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_21104()
{
  return sub_2A798();
}

Swift::Int sub_21244()
{
  return sub_2A798();
}

uint64_t sub_21340(unsigned __int8 *a1, char *a2)
{
  return sub_22900(*a1, *a2);
}

Swift::Int sub_2134C()
{
  return sub_20ED4();
}

uint64_t sub_21354()
{
  sub_2A518();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_2143C()
{
  return sub_21244();
}

uint64_t sub_21444@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_2158C(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_21474(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xED0000656D695441;
  uint64_t v3 = 0x7441707041656E6FLL;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xEF676E69726F7272;
      uint64_t v3 = 0x694D6E6565726373;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 0xD000000000000012;
      *(void *)(a1 + 8) = 0x800000000002C7E0;
      break;
    case 3:
      strcpy((char *)a1, "stageManager");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

unint64_t sub_21538()
{
  unint64_t result = qword_39ED8;
  if (!qword_39ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39ED8);
  }
  return result;
}

uint64_t sub_2158C(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_35378;
  v6._object = a2;
  unint64_t v4 = sub_2A6E8(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t sub_215D8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2164C()
{
  uint64_t v1 = v0;
  sub_9134(&qword_39338);
  __chkstk_darwin();
  Swift::OpaquePointer v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_9134(&qword_39348);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  BOOL v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = v1 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings27ShakeToUndoSectionViewModel__shakeToUndoEnabled;
  v14[15] = _AXSShakeToUndoDisabled() == 0;
  sub_29EA8();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v5 + 32))(v8, v7, v4);
  char v9 = (void *)(v1 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings27ShakeToUndoSectionViewModel_referrer);
  uint64_t v10 = sub_2A598();
  *char v9 = 0;
  v9[1] = 0;
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v3, 1, 1, v10);
  sub_2A578();
  swift_retain();
  uint64_t v11 = sub_2A568();
  uint64_t v12 = (void *)swift_allocObject();
  void v12[2] = v11;
  v12[3] = &protocol witness table for MainActor;
  v12[4] = v1;
  sub_19004((uint64_t)v3, (uint64_t)&unk_39FA8, (uint64_t)v12);
  swift_release();
  return v1;
}

uint64_t sub_2184C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[13] = a4;
  v4[14] = sub_9134(&qword_393D0);
  v4[15] = swift_task_alloc();
  v4[16] = sub_9134(&qword_393D8);
  v4[17] = swift_task_alloc();
  uint64_t v5 = sub_9134(&qword_393E0);
  v4[18] = v5;
  v4[19] = *(void *)(v5 - 8);
  v4[20] = swift_task_alloc();
  uint64_t v6 = sub_9134(&qword_393E8);
  v4[21] = v6;
  v4[22] = *(void *)(v6 - 8);
  v4[23] = swift_task_alloc();
  uint64_t v7 = sub_9134(&qword_393F0);
  v4[24] = v7;
  v4[25] = *(void *)(v7 - 8);
  v4[26] = swift_task_alloc();
  v4[27] = sub_2A578();
  v4[28] = sub_2A568();
  uint64_t v9 = sub_2A548();
  v4[29] = v9;
  v4[30] = v8;
  return _swift_task_switch(sub_21A70, v9, v8);
}

uint64_t sub_21A70()
{
  uint64_t v1 = v0[23];
  uint64_t v11 = v0[22];
  uint64_t v3 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[19];
  swift_beginAccess();
  sub_9134(&qword_39348);
  sub_29EB8();
  swift_endAccess();
  sub_A7C8(&qword_393F8, &qword_393E0);
  sub_29EF8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  sub_A7C8(&qword_39400, &qword_393D8);
  sub_2A758();
  sub_2A6F8();
  sub_2A5B8();
  sub_2A708();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v2);
  sub_2A748();
  v0[31] = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings27ShakeToUndoSectionViewModel_referrer;
  uint64_t v6 = sub_2A568();
  v0[32] = v6;
  if (v6)
  {
    swift_getObjectType();
    uint64_t v7 = sub_2A548();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  v0[33] = v7;
  v0[34] = v9;
  return _swift_task_switch(sub_21C9C, v7, v9);
}

uint64_t sub_21C9C()
{
  uint64_t v1 = sub_2A728();
  if (v1 < 1)
  {
    uint64_t v6 = v0[32];
    sub_2A738();
    v0[38] = sub_2A718();
    sub_A7C8(&qword_39408, &qword_393D0);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[39] = v7;
    void *v7 = v0;
    v7[1] = sub_221F4;
    uint64_t v4 = v0 + 40;
    uint64_t v5 = v6;
  }
  else
  {
    v0[35] = v1;
    uint64_t v2 = v0[32];
    v0[36] = sub_2A718();
    sub_A7C8(&qword_39408, &qword_393D0);
    uint64_t v3 = (void *)swift_task_alloc();
    v0[37] = v3;
    void *v3 = v0;
    v3[1] = sub_21E88;
    uint64_t v4 = (void *)((char *)v0 + 321);
    uint64_t v5 = v2;
  }
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v4, v5, &protocol witness table for MainActor);
}

uint64_t sub_21E88()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_5EC8;
  }
  else
  {
    (*(void (**)(void))(v2 + 288))();
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_21FB0;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_21FB0()
{
  if (*(unsigned char *)(v0 + 321) == 2)
  {
    sub_2A738();
    swift_release();
    uint64_t v1 = *(void *)(v0 + 232);
    uint64_t v2 = *(void *)(v0 + 240);
    return _swift_task_switch(sub_5EE0, v1, v2);
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + 280);
    BOOL v4 = v3 <= 1;
    uint64_t v5 = v3 - 1;
    if (v4)
    {
      uint64_t v10 = *(void *)(v0 + 256);
      sub_2A738();
      *(void *)(v0 + 304) = sub_2A718();
      sub_A7C8(&qword_39408, &qword_393D0);
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 312) = v11;
      void *v11 = v0;
      v11[1] = sub_221F4;
      uint64_t v8 = v0 + 320;
      uint64_t v9 = v10;
    }
    else
    {
      *(void *)(v0 + 280) = v5;
      uint64_t v6 = *(void *)(v0 + 256);
      *(void *)(v0 + 288) = sub_2A718();
      sub_A7C8(&qword_39408, &qword_393D0);
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 296) = v7;
      void *v7 = v0;
      v7[1] = sub_21E88;
      uint64_t v8 = v0 + 321;
      uint64_t v9 = v6;
    }
    return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v8, v9, &protocol witness table for MainActor);
  }
}

uint64_t sub_221F4()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_60CC;
  }
  else
  {
    (*(void (**)(void))(v2 + 304))();
    uint64_t v3 = *(void *)(v2 + 264);
    uint64_t v4 = *(void *)(v2 + 272);
    uint64_t v5 = sub_2231C;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_2231C()
{
  swift_release();
  *(unsigned char *)(v0 + 322) = *(unsigned char *)(v0 + 320);
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 240);
  return _swift_task_switch(sub_22388, v1, v2);
}

uint64_t sub_22388()
{
  int v1 = *(unsigned __int8 *)(v0 + 322);
  if (v1 == 2)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 200) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 192));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else
  {
    _AXSSetShakeToUndoDisabled();
    if (qword_39220 != -1) {
      swift_once();
    }
    uint64_t v4 = (uint64_t *)(*(void *)(v0 + 104) + *(void *)(v0 + 248));
    uint64_t v5 = *v4;
    uint64_t v6 = v4[1];
    swift_bridgeObjectRetain();
    sub_184F0(4, v1 & 1, v5, v6);
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_2A568();
    *(void *)(v0 + 256) = v7;
    if (v7)
    {
      swift_getObjectType();
      uint64_t v8 = sub_2A548();
      uint64_t v10 = v9;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v10 = 0;
    }
    *(void *)(v0 + 264) = v8;
    *(void *)(v0 + 272) = v10;
    return _swift_task_switch(sub_21C9C, v8, v10);
  }
}

uint64_t sub_22544()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings27ShakeToUndoSectionViewModel__shakeToUndoEnabled;
  uint64_t v2 = sub_9134(&qword_39348);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_225FC()
{
  return type metadata accessor for ShakeToUndoSectionViewModel();
}

uint64_t type metadata accessor for ShakeToUndoSectionViewModel()
{
  uint64_t result = qword_39F10;
  if (!qword_39F10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_22650()
{
  sub_C140();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_226E8()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_22728(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_9F04;
  return sub_2184C(a1, v4, v5, v6);
}

void sub_227E4()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = sub_2A4C8();
  id v2 = [v0 initWithSuiteName:v1];

  if (v2) {
    qword_3A248 = (uint64_t)v2;
  }
  else {
    __break(1u);
  }
}

uint64_t sub_2285C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000010;
  }
  else {
    unint64_t v3 = 1684099177;
  }
  if (v2) {
    unint64_t v4 = 0xE400000000000000;
  }
  else {
    unint64_t v4 = 0x800000000002C810;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000010;
  }
  else {
    unint64_t v5 = 1684099177;
  }
  if (a2) {
    unint64_t v6 = 0x800000000002C810;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_2A768();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_22900(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xED0000656D695441;
  unint64_t v3 = 0x7441707041656E6FLL;
  uint64_t v4 = a1;
  unint64_t v5 = 0x7441707041656E6FLL;
  unint64_t v6 = 0xED0000656D695441;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x694D6E6565726373;
      unint64_t v6 = 0xEF676E69726F7272;
      break;
    case 2:
      unint64_t v6 = 0x800000000002C7E0;
      unint64_t v5 = 0xD000000000000012;
      break;
    case 3:
      unint64_t v5 = 0x6E614D6567617473;
      unint64_t v6 = 0xEC00000072656761;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xEF676E69726F7272;
      if (v5 == 0x694D6E6565726373) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v2 = 0x800000000002C7E0;
      unint64_t v3 = 0xD000000000000012;
      goto LABEL_9;
    case 3:
      unint64_t v2 = 0xEC00000072656761;
      if (v5 == 0x6E614D6567617473) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v3) {
        goto LABEL_14;
      }
LABEL_12:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_2A768();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_22AD8(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEC000000676E696BLL;
  uint64_t v3 = 0x73617469746C754DLL;
  uint64_t v4 = a1;
  unint64_t v5 = 0x73617469746C754DLL;
  unint64_t v6 = 0xEC000000676E696BLL;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0x800000000002C770;
      unint64_t v5 = 0xD000000000000010;
      break;
    case 2:
      unint64_t v5 = 0x69746375646F7250;
      unint64_t v6 = 0xEC00000079746976;
      break;
    case 3:
      unint64_t v5 = 0xD000000000000012;
      unint64_t v6 = 0x800000000002C790;
      break;
    case 4:
      unint64_t v5 = 0x556F54656B616853;
      unint64_t v6 = 0xEB000000006F646ELL;
      break;
    case 5:
      unint64_t v5 = 0x654772656E726F43;
      unint64_t v6 = 0xEE00736572757473;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x800000000002C770;
      if (v5 == 0xD000000000000010) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      unint64_t v2 = 0xEC00000079746976;
      if (v5 != 0x69746375646F7250) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      unint64_t v2 = 0x800000000002C790;
      if (v5 != 0xD000000000000012) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 4:
      uint64_t v3 = 0x556F54656B616853;
      unint64_t v2 = 0xEB000000006F646ELL;
      goto LABEL_15;
    case 5:
      unint64_t v2 = 0xEE00736572757473;
      if (v5 != 0x654772656E726F43) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
LABEL_15:
      if (v5 != v3) {
        goto LABEL_19;
      }
LABEL_16:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = sub_2A768();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_22D44()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_22DB8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();

  if (v3 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_29EC8();
    swift_release();
    swift_release();
    if (v2) {
      char v0 = 1;
    }
    else {
      char v0 = sub_2A768();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v0 = 0;
  }
  return v0 & 1;
}

uint64_t sub_22F1C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_22F90@<X0>(unsigned char *a1@<X8>)
{
  return sub_23088(a1);
}

uint64_t sub_22FA4(uint64_t a1, void **a2)
{
  return sub_28EF0(a1, a2);
}

uint64_t sub_22FB8()
{
  return sub_23008();
}

uint64_t sub_22FCC@<X0>(unsigned char *a1@<X8>)
{
  return sub_23088(a1);
}

uint64_t sub_22FE0(uint64_t a1, void **a2)
{
  return sub_28EF0(a1, a2);
}

uint64_t sub_22FF4()
{
  return sub_23008();
}

uint64_t sub_23008()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_23074@<X0>(unsigned char *a1@<X8>)
{
  return sub_23088(a1);
}

uint64_t sub_23088@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_23104(uint64_t a1, void **a2)
{
  return sub_28EF0(a1, a2);
}

uint64_t sub_23118(char *a1, char *a2)
{
  return sub_2285C(*a1, *a2);
}

Swift::Int sub_23124()
{
  return sub_2A798();
}

uint64_t sub_231A4()
{
  sub_2A518();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_23210()
{
  return sub_2A798();
}

uint64_t sub_2328C@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  char v3 = (void *)a1[1];
  v4._rawValue = &off_353F8;
  v8._object = v3;
  Swift::Int v5 = sub_2A6E8(v4, v8);
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

void sub_232EC(unint64_t *a1@<X8>)
{
  unint64_t v2 = 1684099177;
  if (*v1) {
    unint64_t v2 = 0xD000000000000010;
  }
  unint64_t v3 = 0x800000000002C810;
  if (!*v1) {
    unint64_t v3 = 0xE400000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

void sub_23328(void *a1@<X8>)
{
  *a1 = &off_35448;
}

uint64_t sub_23338@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_233B8(uint64_t a1, void **a2)
{
  unint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_29ED8();
}

uint64_t sub_23428()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2349C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  return v1;
}

id sub_23510()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_9134(&qword_39338);
  __chkstk_darwin(v2 - 8);
  long long v83 = (char *)&v69 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_9134(&qword_3A088);
  uint64_t v80 = *(void *)(v4 - 8);
  uint64_t v81 = v4;
  __chkstk_darwin(v4);
  long long v79 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_9134(&qword_3A090);
  uint64_t v77 = *(void *)(v6 - 8);
  uint64_t v78 = v6;
  __chkstk_darwin(v6);
  uint64_t v76 = (char *)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_9134(&qword_3A098);
  uint64_t v74 = *(void *)(v8 - 8);
  uint64_t v75 = v8;
  __chkstk_darwin(v8);
  uint64_t v73 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_9134(&qword_39348);
  uint64_t v71 = *(void *)(v10 - 8);
  uint64_t v72 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_9134(&qword_3A0A0);
  uint64_t v69 = *(void *)(v13 - 8);
  uint64_t v70 = v13;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__hideRecentAppsOnEmbeddedDisplay;
  uint64_t v17 = qword_39230;
  uint64_t v18 = v1;
  if (v17 != -1) {
    swift_once();
  }
  id v19 = (id)qword_3A248;
  *(void *)&v1[v16] = sub_29F08();
  uint64_t v20 = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__hideRecentAppsOnExternalDisplay;
  id v21 = v19;
  *(void *)&v18[v20] = sub_29F08();
  uint64_t v22 = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__hideDockOnEmbeddedDisplay;
  id v23 = v21;
  *(void *)&v18[v22] = sub_29F08();
  uint64_t v24 = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__hideDockOnExternalDisplay;
  id v25 = v23;
  *(void *)&v18[v24] = sub_29F08();
  uint64_t v26 = &v18[OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__multitaskingWindowType];
  LOBYTE(v85) = sub_29050();
  sub_29EA8();
  (*(void (**)(char *, char *, uint64_t))(v69 + 32))(v26, v15, v70);
  uint64_t v27 = &v18[OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__shouldShowRecentAppsInStageManager];
  LOBYTE(v85) = sub_2924C() & 1;
  sub_29EA8();
  uint64_t v28 = v72;
  uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v71 + 32);
  v29(v27, v12, v72);
  uint64_t v30 = &v18[OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__shouldShowDockInStageManager];
  LOBYTE(v85) = sub_2924C() & 1;
  sub_29EA8();
  v29(v30, v12, v28);
  char v31 = &v18[OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__orientation];
  id v32 = [self currentDevice];
  id v33 = [v32 orientation];

  uint64_t v85 = (uint64_t)v33;
  type metadata accessor for UIDeviceOrientation(0);
  uint64_t v34 = v73;
  sub_29EA8();
  (*(void (**)(char *, char *, uint64_t))(v74 + 32))(v31, v34, v75);
  uint64_t v35 = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__displayManager;
  if (qword_39208 != -1) {
    swift_once();
  }
  uint64_t v36 = &v18[v35];
  uint64_t v37 = (void *)qword_3A220;
  uint64_t v85 = qword_3A220;
  type metadata accessor for MultiTaskingDisplayManager();
  id v38 = v37;
  uint64_t v39 = v76;
  sub_29EA8();
  (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v36, v39, v78);
  uint64_t v40 = &v18[OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__selectedDisplaySection];
  LOBYTE(v85) = 0;
  uint64_t v41 = v79;
  sub_29EA8();
  (*(void (**)(char *, char *, uint64_t))(v80 + 32))(v40, v41, v81);

  uint64_t v42 = ObjectType;
  v84.receiver = v18;
  v84.super_class = ObjectType;
  id v43 = objc_msgSendSuper2(&v84, "init");
  uint64_t v44 = sub_2A598();
  uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56);
  uint64_t v46 = (uint64_t)v83;
  v45(v83, 1, 1, v44);
  sub_2A578();
  id v47 = v43;
  uint64_t v48 = sub_2A568();
  uint64_t v49 = (void *)swift_allocObject();
  v49[2] = v48;
  v49[3] = &protocol witness table for MainActor;
  v49[4] = v47;
  sub_19004(v46, (uint64_t)&unk_3A0B0, (uint64_t)v49);
  swift_release();
  v45((char *)v46, 1, 1, v44);
  id v50 = v47;
  uint64_t v51 = sub_2A568();
  Swift::String v52 = (void *)swift_allocObject();
  v52[2] = v51;
  v52[3] = &protocol witness table for MainActor;
  v52[4] = v50;
  v52[5] = v42;
  sub_19004(v46, (uint64_t)&unk_3A0C0, (uint64_t)v52);
  swift_release();
  v45((char *)v46, 1, 1, v44);
  id v53 = v50;
  uint64_t v54 = sub_2A568();
  unint64_t v55 = (void *)swift_allocObject();
  v55[2] = v54;
  v55[3] = &protocol witness table for MainActor;
  v55[4] = v53;
  v55[5] = v42;
  sub_19004(v46, (uint64_t)&unk_3A0D0, (uint64_t)v55);
  swift_release();
  v45((char *)v46, 1, 1, v44);
  id v56 = v53;
  uint64_t v57 = sub_2A568();
  long long v58 = (void *)swift_allocObject();
  v58[2] = v57;
  v58[3] = &protocol witness table for MainActor;
  v58[4] = v56;
  sub_19004(v46, (uint64_t)&unk_3A0E0, (uint64_t)v58);
  swift_release();
  v45((char *)v46, 1, 1, v44);
  id v59 = v56;
  uint64_t v60 = sub_2A568();
  long long v61 = (void *)swift_allocObject();
  v61[2] = v60;
  v61[3] = &protocol witness table for MainActor;
  v61[4] = v59;
  sub_19004(v46, (uint64_t)&unk_3A0F0, (uint64_t)v61);
  swift_release();
  uint64_t v62 = (void *)qword_3A248;
  id v63 = v59;
  NSString v64 = sub_2A4C8();
  [v62 addObserver:v63 forKeyPath:v64 options:3 context:0];

  id v65 = (void *)qword_3A248;
  id v66 = v63;
  NSString v67 = sub_2A4C8();
  [v65 addObserver:v66 forKeyPath:v67 options:3 context:0];

  return v66;
}

uint64_t sub_23EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[15] = a4;
  v4[16] = sub_9134(&qword_3A120);
  v4[17] = swift_task_alloc();
  v4[18] = sub_9134(&qword_3A128);
  v4[19] = swift_task_alloc();
  uint64_t v5 = sub_9134(&qword_3A130);
  v4[20] = v5;
  v4[21] = *(void *)(v5 - 8);
  v4[22] = swift_task_alloc();
  uint64_t v6 = sub_9134(&qword_3A138);
  v4[23] = v6;
  v4[24] = *(void *)(v6 - 8);
  v4[25] = swift_task_alloc();
  uint64_t v7 = sub_9134(&qword_3A140);
  v4[26] = v7;
  v4[27] = *(void *)(v7 - 8);
  v4[28] = swift_task_alloc();
  v4[29] = sub_2A578();
  v4[30] = sub_2A568();
  uint64_t v9 = sub_2A548();
  v4[31] = v9;
  v4[32] = v8;
  return _swift_task_switch(sub_240C4, v9, v8);
}

uint64_t sub_240C4()
{
  uint64_t v1 = v0[25];
  uint64_t v11 = v0[24];
  uint64_t v3 = v0[22];
  uint64_t v2 = v0[23];
  uint64_t v4 = v0[20];
  uint64_t v5 = v0[21];
  swift_beginAccess();
  sub_9134(&qword_3A0A0);
  sub_29EB8();
  swift_endAccess();
  sub_A7C8(&qword_3A148, &qword_3A130);
  sub_29EF8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  sub_A7C8(&qword_3A150, &qword_3A128);
  sub_2A758();
  sub_2A6F8();
  sub_2A5B8();
  sub_2A708();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v2);
  sub_2A748();
  uint64_t v6 = sub_2A568();
  v0[33] = v6;
  if (v6)
  {
    swift_getObjectType();
    uint64_t v7 = sub_2A548();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  v0[34] = v7;
  v0[35] = v9;
  return _swift_task_switch(sub_242E4, v7, v9);
}

uint64_t sub_242E4()
{
  uint64_t v1 = sub_2A728();
  if (v1 < 1)
  {
    uint64_t v6 = v0[33];
    sub_2A738();
    v0[39] = sub_2A718();
    sub_A7C8(&qword_3A158, &qword_3A120);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[40] = v7;
    void *v7 = v0;
    v7[1] = sub_24918;
    uint64_t v4 = v0 + 41;
    uint64_t v5 = v6;
  }
  else
  {
    v0[36] = v1;
    uint64_t v2 = v0[33];
    v0[37] = sub_2A718();
    sub_A7C8(&qword_3A158, &qword_3A120);
    uint64_t v3 = (void *)swift_task_alloc();
    v0[38] = v3;
    void *v3 = v0;
    v3[1] = sub_244D0;
    uint64_t v4 = (void *)((char *)v0 + 330);
    uint64_t v5 = v2;
  }
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v4, v5, &protocol witness table for MainActor);
}

uint64_t sub_244D0()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 272);
    uint64_t v4 = *(void *)(v2 + 280);
    uint64_t v5 = sub_2483C;
  }
  else
  {
    (*(void (**)(void))(v2 + 296))();
    uint64_t v3 = *(void *)(v2 + 272);
    uint64_t v4 = *(void *)(v2 + 280);
    uint64_t v5 = sub_245F8;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_245F8()
{
  if (*(unsigned char *)(v0 + 330) == 4)
  {
    sub_2A738();
    swift_release();
    uint64_t v1 = *(void *)(v0 + 248);
    uint64_t v2 = *(void *)(v0 + 256);
    return _swift_task_switch(sub_24854, v1, v2);
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + 288);
    BOOL v4 = v3 <= 1;
    uint64_t v5 = v3 - 1;
    if (v4)
    {
      uint64_t v10 = *(void *)(v0 + 264);
      sub_2A738();
      *(void *)(v0 + 312) = sub_2A718();
      sub_A7C8(&qword_3A158, &qword_3A120);
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 320) = v11;
      void *v11 = v0;
      v11[1] = sub_24918;
      uint64_t v8 = v0 + 328;
      uint64_t v9 = v10;
    }
    else
    {
      *(void *)(v0 + 288) = v5;
      uint64_t v6 = *(void *)(v0 + 264);
      *(void *)(v0 + 296) = sub_2A718();
      sub_A7C8(&qword_3A158, &qword_3A120);
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 304) = v7;
      void *v7 = v0;
      v7[1] = sub_244D0;
      uint64_t v8 = v0 + 330;
      uint64_t v9 = v6;
    }
    return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v8, v9, &protocol witness table for MainActor);
  }
}

uint64_t sub_2483C()
{
  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t sub_24854()
{
  (*(void (**)(void, void))(v0[27] + 8))(v0[28], v0[26]);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24918()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 272);
    uint64_t v4 = *(void *)(v2 + 280);
    uint64_t v5 = sub_24A40;
  }
  else
  {
    (*(void (**)(void))(v2 + 312))();
    uint64_t v3 = *(void *)(v2 + 272);
    uint64_t v4 = *(void *)(v2 + 280);
    uint64_t v5 = sub_24A58;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_24A40()
{
  return (*(uint64_t (**)(void))(v0 + 312))();
}

uint64_t sub_24A58()
{
  swift_release();
  *(unsigned char *)(v0 + 332) = *(unsigned char *)(v0 + 328);
  uint64_t v1 = *(void *)(v0 + 248);
  uint64_t v2 = *(void *)(v0 + 256);
  return _swift_task_switch(sub_24AC4, v1, v2);
}

uint64_t sub_24AC4()
{
  if (*(unsigned char *)(v0 + 332) == 4)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 216) + 8))(*(void *)(v0 + 224), *(void *)(v0 + 208));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  uint64_t v3 = *(void **)(v0 + 104);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();

  swift_release();
  swift_release();
  if (*(unsigned char *)(v0 + 331) != 1) {
    goto LABEL_10;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  if (*(unsigned char *)(v0 + 329) == 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  char v4 = sub_2A768();
  swift_bridgeObjectRelease();
  if ((v4 & 1) == 0)
  {
LABEL_10:
    if (qword_39230 != -1) {
      swift_once();
    }
    uint64_t v8 = (void *)qword_3A248;
    switch(*(unsigned char *)(v0 + 332))
    {
      case 3:
        swift_bridgeObjectRelease();
        NSString v15 = sub_2A4C8();
        [v8 setBool:1 forKey:v15];

        swift_bridgeObjectRelease();
        uint64_t v12 = &OBJC_METACLASS____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel;
        uint64_t v13 = &off_39000;
LABEL_25:
        swift_bridgeObjectRelease();
LABEL_27:
        if (v13[70] != (ClassDescriptor *)-1) {
          swift_once();
        }
        vtable = v12[14].vtable;
        NSString v19 = sub_2A4C8();
        [vtable setBool:1 forKey:v19];

        break;
      default:
        char v9 = sub_2A768();
        swift_bridgeObjectRelease();
        NSString v10 = sub_2A4C8();
        [v8 setBool:v9 & 1 forKey:v10];

        char v11 = sub_2A768();
        swift_bridgeObjectRelease();
        uint64_t v12 = &OBJC_METACLASS____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel;
        uint64_t v13 = &off_39000;
        if (v11) {
          goto LABEL_24;
        }
        uint64_t v14 = (void *)qword_3A248;
        if (*(unsigned char *)(v0 + 332) && *(unsigned char *)(v0 + 332) != 1) {
          char v16 = 1;
        }
        else {
          char v16 = sub_2A768();
        }
        swift_bridgeObjectRelease();
        NSString v6 = sub_2A4C8();
        [v14 setBool:v16 & 1 forKey:v6];
        goto LABEL_23;
    }
    goto LABEL_30;
  }
LABEL_9:
  uint64_t v5 = *(unsigned __int8 *)(v0 + 332);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  NSString v6 = *(NSString *)(v0 + 112);
  char v7 = 1;
  switch(v5)
  {
    case 1:
      break;
    default:
      char v7 = sub_2A768();
      break;
  }
  swift_bridgeObjectRelease();
  sub_12554(v7 & 1);
  uint64_t v12 = &OBJC_METACLASS____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel;
  uint64_t v13 = &off_39000;
LABEL_23:

LABEL_24:
  switch(*(unsigned char *)(v0 + 332))
  {
    case 3:
      goto LABEL_25;
    default:
      char v17 = sub_2A768();
      swift_bridgeObjectRelease();
      if (v17) {
        goto LABEL_27;
      }
      break;
  }
LABEL_30:
  uint64_t v20 = sub_2A568();
  *(void *)(v0 + 264) = v20;
  if (v20)
  {
    swift_getObjectType();
    uint64_t v21 = sub_2A548();
    uint64_t v23 = v22;
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v23 = 0;
  }
  *(void *)(v0 + 272) = v21;
  *(void *)(v0 + 280) = v23;
  return _swift_task_switch(sub_242E4, v21, v23);
}

uint64_t sub_252E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a4;
  sub_9134(&qword_393D0);
  v4[8] = swift_task_alloc();
  v4[9] = sub_9134(&qword_393D8);
  v4[10] = swift_task_alloc();
  uint64_t v5 = sub_9134(&qword_393E0);
  v4[11] = v5;
  v4[12] = *(void *)(v5 - 8);
  v4[13] = swift_task_alloc();
  uint64_t v6 = sub_9134(&qword_393E8);
  v4[14] = v6;
  v4[15] = *(void *)(v6 - 8);
  v4[16] = swift_task_alloc();
  uint64_t v7 = sub_9134(&qword_393F0);
  v4[17] = v7;
  v4[18] = *(void *)(v7 - 8);
  v4[19] = swift_task_alloc();
  v4[20] = sub_2A578();
  v4[21] = sub_2A568();
  uint64_t v9 = sub_2A548();
  v4[22] = v9;
  v4[23] = v8;
  return _swift_task_switch(sub_25504, v9, v8);
}

uint64_t sub_25504()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[13];
  uint64_t v10 = v0[14];
  uint64_t v11 = v0[15];
  uint64_t v3 = v0[12];
  uint64_t v9 = v0[11];
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  char v4 = (void *)v0[5];
  swift_beginAccess();
  sub_9134(&qword_39348);
  sub_29EB8();
  swift_endAccess();

  sub_A7C8(&qword_393F8, &qword_393E0);
  sub_29EF8();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v9);
  sub_A7C8(&qword_39400, &qword_393D8);
  sub_2A758();
  sub_2A6F8();
  sub_2A5B8();
  sub_2A708();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v10);
  sub_2A748();
  uint64_t v5 = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__hideRecentAppsOnEmbeddedDisplay;
  v0[24] = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__hideDockOnEmbeddedDisplay;
  v0[25] = v5;
  uint64_t v6 = sub_2A568();
  v0[26] = v6;
  uint64_t v12 = (char *)&dword_39410 + dword_39410;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[27] = v7;
  void *v7 = v0;
  v7[1] = sub_257C4;
  return ((uint64_t (*)(uint64_t, void *, void *))v12)(v6, &protocol witness table for MainActor, v0 + 6);
}

uint64_t sub_257C4(char a1)
{
  uint64_t v2 = *v1;
  *(unsigned char *)(*v1 + 230) = a1;
  swift_task_dealloc();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 184);
  uint64_t v4 = *(void *)(v2 + 176);
  return _swift_task_switch(sub_25910, v4, v3);
}

uint64_t sub_25910()
{
  if (*(unsigned char *)(v0 + 230) == 2)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 144) + 8))(*(void *)(v0 + 152), *(void *)(v0 + 136));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    uint64_t v3 = *(void **)(v0 + 56);
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 224) = 0;
    id v4 = v3;
    sub_29ED8();
    unsigned __int8 v5 = sub_29050();
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 225) = v5;
    id v6 = v4;
    sub_29ED8();
    swift_retain();
    sub_29F18();
    swift_release();
    char v7 = *(unsigned char *)(v0 + 226);
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 227) = (v7 & 1) == 0;
    id v8 = v6;
    sub_29ED8();
    swift_retain();
    sub_29F18();
    swift_release();
    LOBYTE(v3) = *(unsigned char *)(v0 + 228);
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 229) = (v3 & 1) == 0;
    id v9 = v8;
    sub_29ED8();
    uint64_t v10 = sub_2A568();
    *(void *)(v0 + 208) = v10;
    uint64_t v12 = (uint64_t (*)(uint64_t, void *, uint64_t))((char *)&dword_39410 + dword_39410);
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v11;
    void *v11 = v0;
    v11[1] = sub_257C4;
    return v12(v10, &protocol witness table for MainActor, v0 + 48);
  }
}

uint64_t sub_25C20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a4;
  sub_9134(&qword_39428);
  v4[7] = swift_task_alloc();
  v4[8] = sub_9134(&qword_3A0F8);
  v4[9] = swift_task_alloc();
  uint64_t v5 = sub_9134(&qword_3A100);
  v4[10] = v5;
  v4[11] = *(void *)(v5 - 8);
  v4[12] = swift_task_alloc();
  uint64_t v6 = sub_9134(&qword_3A108);
  v4[13] = v6;
  v4[14] = *(void *)(v6 - 8);
  v4[15] = swift_task_alloc();
  uint64_t v7 = sub_9134(&qword_39420);
  v4[16] = v7;
  v4[17] = *(void *)(v7 - 8);
  v4[18] = swift_task_alloc();
  v4[19] = sub_2A578();
  v4[20] = sub_2A568();
  uint64_t v9 = sub_2A548();
  v4[21] = v9;
  v4[22] = v8;
  return _swift_task_switch(sub_25E40, v9, v8);
}

uint64_t sub_25E40()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  uint64_t v4 = v0[10];
  uint64_t v5 = v0[11];
  uint64_t v11 = v0[14];
  swift_beginAccess();
  sub_9134(&qword_3A088);
  sub_29EB8();
  swift_endAccess();
  sub_A7C8(&qword_3A110, &qword_3A100);
  sub_29EF8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  sub_A7C8(&qword_3A118, &qword_3A0F8);
  sub_2A758();
  sub_2A6F8();
  sub_2A5B8();
  sub_2A708();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v3);
  sub_2A748();
  uint64_t v6 = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__hideRecentAppsOnEmbeddedDisplay;
  v0[23] = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__hideDockOnEmbeddedDisplay;
  v0[24] = v6;
  uint64_t v7 = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__hideRecentAppsOnExternalDisplay;
  v0[25] = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__hideDockOnExternalDisplay;
  v0[26] = v7;
  uint64_t v8 = sub_2A568();
  v0[27] = v8;
  uint64_t v12 = (char *)&dword_39418 + dword_39418;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[28] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_260B4;
  return ((uint64_t (*)(uint64_t, void *, void *))v12)(v8, &protocol witness table for MainActor, v0 + 5);
}

uint64_t sub_260B4(char a1)
{
  uint64_t v2 = *v1;
  *(unsigned char *)(*v1 + 242) = a1;
  swift_task_dealloc();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 176);
  uint64_t v4 = *(void *)(v2 + 168);
  return _swift_task_switch(sub_26200, v4, v3);
}

id sub_26200()
{
  int v1 = *(unsigned __int8 *)(v0 + 242);
  if (v1 == 2)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 136) + 8))(*(void *)(v0 + 144), *(void *)(v0 + 128));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v2();
  }
  if (v1)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    if (qword_39208 != -1) {
      swift_once();
    }
    uint64_t v11 = *(void **)(qword_3A220
                   + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayInfo);
    if (v11 && ([v11 isMirrored] & 1) != 0) {
      goto LABEL_18;
    }
    id result = (id)MobileGestalt_get_current_device();
    if (result)
    {
      uint64_t v12 = result;
      char deviceSupportsEnhancedMultitasking = MobileGestalt_get_deviceSupportsEnhancedMultitasking();

      if (deviceSupportsEnhancedMultitasking)
      {
LABEL_17:
        char v16 = 3;
LABEL_19:
        id v25 = (BOOL *)(v0 + 241);
        char v17 = *(void **)(v0 + 48);
        swift_getKeyPath();
        swift_getKeyPath();
        *(unsigned char *)(v0 + 237) = v16;
        id v18 = v17;
        sub_29ED8();
        swift_retain();
        sub_29F18();
        swift_release();
        char v19 = *(unsigned char *)(v0 + 238);
        swift_getKeyPath();
        swift_getKeyPath();
        BOOL v20 = (v19 & 1) == 0;
        uint64_t v5 = (char *)(v0 + 240);
        *(unsigned char *)(v0 + 239) = v20;
        id v10 = v18;
        sub_29ED8();
        swift_retain();
        goto LABEL_20;
      }
      id result = (id)MobileGestalt_get_current_device();
      if (result)
      {
        uint64_t v14 = result;
        int deviceSupportsSingleDisplayEnhancedMultitasking = MobileGestalt_get_deviceSupportsSingleDisplayEnhancedMultitasking();

        if (deviceSupportsSingleDisplayEnhancedMultitasking) {
          goto LABEL_17;
        }
LABEL_18:
        char v16 = 1;
        goto LABEL_19;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return result;
  }
  char v4 = sub_2A768();
  swift_bridgeObjectRelease();
  if (v4) {
    goto LABEL_9;
  }
  uint64_t v5 = (char *)(v0 + 235);
  id v25 = (BOOL *)(v0 + 236);
  uint64_t v6 = *(void **)(v0 + 48);
  unsigned __int8 v7 = sub_29050();
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 232) = v7;
  id v8 = v6;
  sub_29ED8();
  swift_retain();
  sub_29F18();
  swift_release();
  char v9 = *(unsigned char *)(v0 + 233);
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 234) = (v9 & 1) == 0;
  id v10 = v8;
  sub_29ED8();
  swift_retain();
LABEL_20:
  sub_29F18();
  swift_release();
  char v21 = *v5;
  swift_getKeyPath();
  swift_getKeyPath();
  *id v25 = (v21 & 1) == 0;
  id v22 = v10;
  sub_29ED8();
  uint64_t v23 = sub_2A568();
  *(void *)(v0 + 216) = v23;
  uint64_t v26 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_39418 + dword_39418);
  uint64_t v24 = (void *)swift_task_alloc();
  *(void *)(v0 + 224) = v24;
  *uint64_t v24 = v0;
  v24[1] = sub_260B4;
  return (id)v26(v23, (uint64_t)&protocol witness table for MainActor);
}

uint64_t sub_266D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[14] = a4;
  v4[15] = sub_9134(&qword_393D0);
  v4[16] = swift_task_alloc();
  v4[17] = sub_9134(&qword_393D8);
  v4[18] = swift_task_alloc();
  uint64_t v5 = sub_9134(&qword_393E0);
  v4[19] = v5;
  v4[20] = *(void *)(v5 - 8);
  v4[21] = swift_task_alloc();
  uint64_t v6 = sub_9134(&qword_393E8);
  v4[22] = v6;
  v4[23] = *(void *)(v6 - 8);
  v4[24] = swift_task_alloc();
  uint64_t v7 = sub_9134(&qword_393F0);
  v4[25] = v7;
  v4[26] = *(void *)(v7 - 8);
  v4[27] = swift_task_alloc();
  v4[28] = sub_2A578();
  v4[29] = sub_2A568();
  uint64_t v9 = sub_2A548();
  v4[30] = v9;
  v4[31] = v8;
  return _swift_task_switch(sub_268F8, v9, v8);
}

uint64_t sub_268F8()
{
  uint64_t v1 = v0[24];
  uint64_t v12 = v0[23];
  uint64_t v3 = v0[21];
  uint64_t v2 = v0[22];
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[20];
  swift_beginAccess();
  sub_9134(&qword_39348);
  sub_29EB8();
  swift_endAccess();
  sub_A7C8(&qword_393F8, &qword_393E0);
  sub_29EF8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  sub_A7C8(&qword_39400, &qword_393D8);
  sub_2A758();
  sub_2A6F8();
  sub_2A5B8();
  sub_2A708();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v2);
  sub_2A748();
  uint64_t v6 = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__hideDockOnExternalDisplay;
  v0[32] = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__hideDockOnEmbeddedDisplay;
  v0[33] = v6;
  uint64_t v7 = sub_2A568();
  v0[34] = v7;
  if (v7)
  {
    swift_getObjectType();
    uint64_t v8 = sub_2A548();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  v0[35] = v8;
  v0[36] = v10;
  return _swift_task_switch(sub_26B2C, v8, v10);
}

uint64_t sub_26B2C()
{
  uint64_t v1 = sub_2A728();
  if (v1 < 1)
  {
    uint64_t v6 = v0[34];
    sub_2A738();
    v0[40] = sub_2A718();
    sub_A7C8(&qword_39408, &qword_393D0);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[41] = v7;
    void *v7 = v0;
    v7[1] = sub_27148;
    uint64_t v4 = (char *)v0 + 337;
    uint64_t v5 = v6;
  }
  else
  {
    v0[37] = v1;
    uint64_t v2 = v0[34];
    v0[38] = sub_2A718();
    sub_A7C8(&qword_39408, &qword_393D0);
    uint64_t v3 = (void *)swift_task_alloc();
    v0[39] = v3;
    void *v3 = v0;
    v3[1] = sub_26D18;
    uint64_t v4 = (char *)v0 + 340;
    uint64_t v5 = v2;
  }
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v4, v5, &protocol witness table for MainActor);
}

uint64_t sub_26D18()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 280);
    uint64_t v4 = *(void *)(v2 + 288);
    uint64_t v5 = sub_60CC;
  }
  else
  {
    (*(void (**)(void))(v2 + 304))();
    uint64_t v3 = *(void *)(v2 + 280);
    uint64_t v4 = *(void *)(v2 + 288);
    uint64_t v5 = sub_26E40;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_26E40()
{
  if (*(unsigned char *)(v0 + 340) == 2)
  {
    sub_2A738();
    swift_release();
    uint64_t v1 = *(void *)(v0 + 240);
    uint64_t v2 = *(void *)(v0 + 248);
    return _swift_task_switch(sub_27084, v1, v2);
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + 296);
    BOOL v4 = v3 <= 1;
    uint64_t v5 = v3 - 1;
    if (v4)
    {
      uint64_t v10 = *(void *)(v0 + 272);
      sub_2A738();
      *(void *)(v0 + 320) = sub_2A718();
      sub_A7C8(&qword_39408, &qword_393D0);
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 328) = v11;
      void *v11 = v0;
      v11[1] = sub_27148;
      uint64_t v8 = v0 + 337;
      uint64_t v9 = v10;
    }
    else
    {
      *(void *)(v0 + 296) = v5;
      uint64_t v6 = *(void *)(v0 + 272);
      *(void *)(v0 + 304) = sub_2A718();
      sub_A7C8(&qword_39408, &qword_393D0);
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 312) = v7;
      void *v7 = v0;
      v7[1] = sub_26D18;
      uint64_t v8 = v0 + 340;
      uint64_t v9 = v6;
    }
    return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v8, v9, &protocol witness table for MainActor);
  }
}

uint64_t sub_27084()
{
  (*(void (**)(void, void))(v0[26] + 8))(v0[27], v0[25]);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_27148()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 280);
    uint64_t v4 = *(void *)(v2 + 288);
    uint64_t v5 = sub_27270;
  }
  else
  {
    (*(void (**)(void))(v2 + 320))();
    uint64_t v3 = *(void *)(v2 + 280);
    uint64_t v4 = *(void *)(v2 + 288);
    uint64_t v5 = sub_27288;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_27270()
{
  return (*(uint64_t (**)(void))(v0 + 320))();
}

uint64_t sub_27288()
{
  swift_release();
  *(unsigned char *)(v0 + 342) = *(unsigned char *)(v0 + 337);
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 248);
  return _swift_task_switch(sub_272F4, v1, v2);
}

uint64_t sub_272F4()
{
  int v1 = *(unsigned __int8 *)(v0 + 342);
  if (v1 == 2)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 208) + 8))(*(void *)(v0 + 216), *(void *)(v0 + 200));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  char v4 = v1 & 1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  uint64_t v5 = *(void **)(v0 + 104);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();

  swift_release();
  swift_release();
  if ((*(unsigned char *)(v0 + 336) & 1) == 0) {
    goto LABEL_10;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  if (*(unsigned char *)(v0 + 338) != 1)
  {
    char v6 = sub_2A768();
    swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_9;
    }
LABEL_10:
    *(unsigned char *)(v0 + 341) = v4 ^ 1;
    goto LABEL_11;
  }
  swift_bridgeObjectRelease();
LABEL_9:
  *(unsigned char *)(v0 + 339) = v4 ^ 1;
LABEL_11:
  swift_retain();
  sub_29F28();
  swift_release();
  uint64_t v7 = sub_2A568();
  *(void *)(v0 + 272) = v7;
  if (v7)
  {
    swift_getObjectType();
    uint64_t v8 = sub_2A548();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  *(void *)(v0 + 280) = v8;
  *(void *)(v0 + 288) = v10;
  return _swift_task_switch(sub_26B2C, v8, v10);
}

uint64_t sub_275E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[14] = a4;
  v4[15] = sub_9134(&qword_393D0);
  v4[16] = swift_task_alloc();
  v4[17] = sub_9134(&qword_393D8);
  v4[18] = swift_task_alloc();
  uint64_t v5 = sub_9134(&qword_393E0);
  v4[19] = v5;
  v4[20] = *(void *)(v5 - 8);
  v4[21] = swift_task_alloc();
  uint64_t v6 = sub_9134(&qword_393E8);
  v4[22] = v6;
  v4[23] = *(void *)(v6 - 8);
  v4[24] = swift_task_alloc();
  uint64_t v7 = sub_9134(&qword_393F0);
  v4[25] = v7;
  v4[26] = *(void *)(v7 - 8);
  v4[27] = swift_task_alloc();
  v4[28] = sub_2A578();
  v4[29] = sub_2A568();
  uint64_t v9 = sub_2A548();
  v4[30] = v9;
  v4[31] = v8;
  return _swift_task_switch(sub_2780C, v9, v8);
}

uint64_t sub_2780C()
{
  uint64_t v1 = v0[24];
  uint64_t v12 = v0[23];
  uint64_t v3 = v0[21];
  uint64_t v2 = v0[22];
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[20];
  swift_beginAccess();
  sub_9134(&qword_39348);
  sub_29EB8();
  swift_endAccess();
  sub_A7C8(&qword_393F8, &qword_393E0);
  sub_29EF8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  sub_A7C8(&qword_39400, &qword_393D8);
  sub_2A758();
  sub_2A6F8();
  sub_2A5B8();
  sub_2A708();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v2);
  sub_2A748();
  uint64_t v6 = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__hideRecentAppsOnExternalDisplay;
  v0[32] = OBJC_IVAR____TtC31MultitaskingAndGesturesSettings28MultiTaskingSectionViewModel__hideRecentAppsOnEmbeddedDisplay;
  v0[33] = v6;
  uint64_t v7 = sub_2A568();
  v0[34] = v7;
  if (v7)
  {
    swift_getObjectType();
    uint64_t v8 = sub_2A548();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  v0[35] = v8;
  v0[36] = v10;
  return _swift_task_switch(sub_27A40, v8, v10);
}

uint64_t sub_27A40()
{
  uint64_t v1 = sub_2A728();
  if (v1 < 1)
  {
    uint64_t v6 = v0[34];
    sub_2A738();
    v0[40] = sub_2A718();
    sub_A7C8(&qword_39408, &qword_393D0);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[41] = v7;
    void *v7 = v0;
    v7[1] = sub_27F98;
    uint64_t v4 = (char *)v0 + 337;
    uint64_t v5 = v6;
  }
  else
  {
    v0[37] = v1;
    uint64_t v2 = v0[34];
    v0[38] = sub_2A718();
    sub_A7C8(&qword_39408, &qword_393D0);
    uint64_t v3 = (void *)swift_task_alloc();
    v0[39] = v3;
    void *v3 = v0;
    v3[1] = sub_27C2C;
    uint64_t v4 = (char *)v0 + 340;
    uint64_t v5 = v2;
  }
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v4, v5, &protocol witness table for MainActor);
}

uint64_t sub_27C2C()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 280);
    uint64_t v4 = *(void *)(v2 + 288);
    uint64_t v5 = sub_A97C;
  }
  else
  {
    (*(void (**)(void))(v2 + 304))();
    uint64_t v3 = *(void *)(v2 + 280);
    uint64_t v4 = *(void *)(v2 + 288);
    uint64_t v5 = sub_27D54;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_27D54()
{
  if (*(unsigned char *)(v0 + 340) == 2)
  {
    sub_2A738();
    swift_release();
    uint64_t v1 = *(void *)(v0 + 240);
    uint64_t v2 = *(void *)(v0 + 248);
    return _swift_task_switch(sub_29D7C, v1, v2);
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + 296);
    BOOL v4 = v3 <= 1;
    uint64_t v5 = v3 - 1;
    if (v4)
    {
      uint64_t v10 = *(void *)(v0 + 272);
      sub_2A738();
      *(void *)(v0 + 320) = sub_2A718();
      sub_A7C8(&qword_39408, &qword_393D0);
      uint64_t v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 328) = v11;
      void *v11 = v0;
      v11[1] = sub_27F98;
      uint64_t v8 = v0 + 337;
      uint64_t v9 = v10;
    }
    else
    {
      *(void *)(v0 + 296) = v5;
      uint64_t v6 = *(void *)(v0 + 272);
      *(void *)(v0 + 304) = sub_2A718();
      sub_A7C8(&qword_39408, &qword_393D0);
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 312) = v7;
      void *v7 = v0;
      v7[1] = sub_27C2C;
      uint64_t v8 = v0 + 340;
      uint64_t v9 = v6;
    }
    return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v8, v9, &protocol witness table for MainActor);
  }
}

uint64_t sub_27F98()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 280);
    uint64_t v4 = *(void *)(v2 + 288);
    uint64_t v5 = sub_29D80;
  }
  else
  {
    (*(void (**)(void))(v2 + 320))();
    uint64_t v3 = *(void *)(v2 + 280);
    uint64_t v4 = *(void *)(v2 + 288);
    uint64_t v5 = sub_280C0;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_280C0()
{
  swift_release();
  *(unsigned char *)(v0 + 342) = *(unsigned char *)(v0 + 337);
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 248);
  return _swift_task_switch(sub_2812C, v1, v2);
}

uint64_t sub_2812C()
{
  int v1 = *(unsigned __int8 *)(v0 + 342);
  if (v1 == 2)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 208) + 8))(*(void *)(v0 + 216), *(void *)(v0 + 200));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  char v4 = v1 & 1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  uint64_t v5 = *(void **)(v0 + 104);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();

  swift_release();
  swift_release();
  if ((*(unsigned char *)(v0 + 336) & 1) == 0) {
    goto LABEL_10;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  swift_release();
  if (*(unsigned char *)(v0 + 338) != 1)
  {
    char v6 = sub_2A768();
    swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_9;
    }
LABEL_10:
    *(unsigned char *)(v0 + 341) = v4 ^ 1;
    goto LABEL_11;
  }
  swift_bridgeObjectRelease();
LABEL_9:
  *(unsigned char *)(v0 + 339) = v4 ^ 1;
LABEL_11:
  swift_retain();
  sub_29F28();
  swift_release();
  uint64_t v7 = sub_2A568();
  *(void *)(v0 + 272) = v7;
  if (v7)
  {
    swift_getObjectType();
    uint64_t v8 = sub_2A548();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  *(void *)(v0 + 280) = v8;
  *(void *)(v0 + 288) = v10;
  return _swift_task_switch(sub_27A40, v8, v10);
}

id sub_28444()
{
  swift_beginAccess();
  id result = (id)swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong && (uint64_t v2 = (void *)Strong, v3 = sub_22DB8(), v2, (v3 & 1) != 0))
    {
      if (qword_39208 != -1) {
        swift_once();
      }
      char v4 = *(void **)(qword_3A220
                    + OBJC_IVAR____TtC31MultitaskingAndGesturesSettings26MultiTaskingDisplayManager_externalDisplayInfo);
      if (v4 && ([v4 isMirrored] & 1) != 0) {
        goto LABEL_14;
      }
      id result = (id)MobileGestalt_get_current_device();
      if (!result)
      {
        __break(1u);
        goto LABEL_18;
      }
      uint64_t v5 = result;
      char deviceSupportsEnhancedMultitasking = MobileGestalt_get_deviceSupportsEnhancedMultitasking();

      if ((deviceSupportsEnhancedMultitasking & 1) == 0)
      {
        id result = (id)MobileGestalt_get_current_device();
        if (result)
        {
          uint64_t v7 = result;
          MobileGestalt_get_deviceSupportsSingleDisplayEnhancedMultitasking();

          goto LABEL_14;
        }
LABEL_18:
        __break(1u);
        return result;
      }
    }
    else
    {
      sub_29050();
    }
LABEL_14:
    swift_getKeyPath();
    swift_getKeyPath();
    return (id)sub_29ED8();
  }
  return result;
}

uint64_t sub_285C0(uint64_t a1)
{
  int v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_28940()
{
  return type metadata accessor for MultiTaskingSectionViewModel();
}

uint64_t type metadata accessor for MultiTaskingSectionViewModel()
{
  uint64_t result = qword_3A028;
  if (!qword_3A028) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_28994()
{
  sub_28BE0(319, &qword_3A038);
  if (v0 <= 0x3F)
  {
    sub_28BE0(319, (unint64_t *)&qword_39288);
    if (v1 <= 0x3F)
    {
      sub_28B8C(319, &qword_3A040, type metadata accessor for UIDeviceOrientation);
      if (v2 <= 0x3F)
      {
        sub_28B8C(319, &qword_3A048, (void (*)(uint64_t))type metadata accessor for MultiTaskingDisplayManager);
        if (v3 <= 0x3F)
        {
          sub_28BE0(319, &qword_3A050);
          if (v4 <= 0x3F) {
            swift_updateClassMetadata2();
          }
        }
      }
    }
  }
}

void sub_28B8C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_29EE8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_28BE0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_29EE8();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for MultiTaskingSectionViewModel.DisplaySection(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MultiTaskingSectionViewModel.DisplaySection(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x28D84);
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

unsigned char *sub_28DAC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MultiTaskingSectionViewModel.DisplaySection()
{
  return &type metadata for MultiTaskingSectionViewModel.DisplaySection;
}

uint64_t sub_28DC8()
{
  return sub_A7C8(&qword_3A058, &qword_39DC8);
}

unint64_t sub_28E08()
{
  unint64_t result = qword_3A060;
  if (!qword_3A060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3A060);
  }
  return result;
}

uint64_t sub_28E5C@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_28EDC(uint64_t a1, void **a2)
{
  return sub_28EF0(a1, a2);
}

uint64_t sub_28EF0(uint64_t a1, void **a2)
{
  int v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_29ED8();
}

uint64_t sub_28F5C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_29EC8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_28FDC(void **a1, void **a2)
{
  int v2 = *a1;
  uint64_t v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v2;
  id v5 = v3;
  return sub_29ED8();
}

id sub_29050()
{
  id result = (id)MobileGestalt_get_current_device();
  if (!result)
  {
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v1 = result;
  char deviceSupportsEnhancedMultitasking = MobileGestalt_get_deviceSupportsEnhancedMultitasking();

  if ((deviceSupportsEnhancedMultitasking & 1) == 0)
  {
    id result = (id)MobileGestalt_get_current_device();
    if (result)
    {
      uint64_t v3 = result;
      int deviceSupportsSingleDisplayEnhancedMultitasking = MobileGestalt_get_deviceSupportsSingleDisplayEnhancedMultitasking();

      if (!deviceSupportsSingleDisplayEnhancedMultitasking) {
        goto LABEL_9;
      }
      goto LABEL_5;
    }
LABEL_22:
    __break(1u);
    return result;
  }
LABEL_5:
  if (qword_39230 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_3A248;
  NSString v6 = sub_2A4C8();
  LOBYTE(v5) = [(id)v5 BOOLForKey:v6];

  if (v5) {
    return &def_163AC + 3;
  }
LABEL_9:
  if (qword_39230 != -1) {
    swift_once();
  }
  BOOL v7 = (void *)qword_3A248;
  NSString v8 = sub_2A4C8();
  id v9 = [v7 objectForKey:v8];

  if (v9)
  {
    sub_2A618();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  sub_9CCC((uint64_t)v11, (uint64_t)v12);
  if (!v13)
  {
    sub_9D34((uint64_t)v12);
    return &def_163AC + 2;
  }
  if (!swift_dynamicCast()) {
    return &def_163AC + 2;
  }
  if (v10) {
    return &def_163AC + 2;
  }
  else {
    return 0;
  }
}

uint64_t sub_2924C()
{
  if (qword_39230 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)qword_3A248;
  NSString v1 = sub_2A4C8();
  id v2 = [v0 valueForKey:v1];

  if (v2)
  {
    sub_2A618();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_9CCC((uint64_t)v6, (uint64_t)v7);
  if (!v8)
  {
    sub_9D34((uint64_t)v7);
    goto LABEL_10;
  }
  if (!swift_dynamicCast())
  {
LABEL_10:
    char v3 = 1;
    return v3 & 1;
  }
  char v3 = v5 ^ 1;
  return v3 & 1;
}

uint64_t sub_29368(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = sub_2A448();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  char v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2A468();
  uint64_t v21 = *(void *)(v11 - 8);
  uint64_t result = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a3 + 24) && a2)
  {
    if (a1 == 0xD00000000000001BLL && a2 == 0x800000000002DF50
      || (sub_2A768() & 1) != 0
      || a1 == 0xD000000000000019 && a2 == 0x800000000002CE70
      || (uint64_t result = sub_2A768(), (result & 1) != 0))
    {
      sub_29720();
      uint64_t v20 = sub_2A5D8();
      uint64_t v15 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = v15;
      *(void *)(v16 + 24) = ObjectType;
      aBlock[4] = sub_297D0;
      aBlock[5] = v16;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_285C0;
      aBlock[3] = &unk_35FB8;
      char v17 = _Block_copy(aBlock);
      swift_retain();
      sub_2A458();
      id v22 = &_swiftEmptyArrayStorage;
      sub_297F0(&qword_3A070, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_9134(&qword_3A078);
      sub_A7C8(&qword_3A080, &qword_3A078);
      sub_2A638();
      id v18 = (void *)v20;
      sub_2A5E8();
      _Block_release(v17);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v14, v11);
      swift_release();
      return swift_release();
    }
  }
  return result;
}

unint64_t sub_29720()
{
  unint64_t result = qword_3A068;
  if (!qword_3A068)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_3A068);
  }
  return result;
}

uint64_t sub_29760()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_29798()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

id sub_297D0()
{
  return sub_28444();
}

uint64_t sub_297D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_297E8()
{
  return swift_release();
}

uint64_t sub_297F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2984C(uint64_t a1, void **a2)
{
  return sub_28EF0(a1, a2);
}

uint64_t sub_29874@<X0>(unsigned char *a1@<X8>)
{
  return sub_23088(a1);
}

uint64_t sub_2989C(uint64_t a1, void **a2)
{
  return sub_28EF0(a1, a2);
}

uint64_t sub_298C4()
{
  return sub_29BD4(40);
}

uint64_t sub_298CC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_A98C;
  return sub_23EA0(a1, v4, v5, v6);
}

uint64_t sub_29980()
{
  return sub_29BD4(48);
}

uint64_t sub_29988(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_9F04;
  return sub_252E4(a1, v4, v5, v6);
}

uint64_t sub_29A48()
{
  return sub_29BD4(48);
}

uint64_t sub_29A50(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_A98C;
  return sub_25C20(a1, v4, v5, v6);
}

uint64_t sub_29B10()
{
  return sub_29BD4(40);
}

uint64_t sub_29B18(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_A98C;
  return sub_266D4(a1, v4, v5, v6);
}

uint64_t sub_29BCC()
{
  return sub_29BD4(40);
}

uint64_t sub_29BD4(uint64_t a1)
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v1, a1, 7);
}

uint64_t sub_29C20(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_A98C;
  return sub_275E8(a1, v4, v5, v6);
}

uint64_t sub_29CD4@<X0>(unsigned char *a1@<X8>)
{
  return sub_23088(a1);
}

uint64_t sub_29CFC(uint64_t a1, void **a2)
{
  return sub_28EF0(a1, a2);
}

uint64_t sub_29D24@<X0>(unsigned char *a1@<X8>)
{
  return sub_23088(a1);
}

uint64_t sub_29D4C(uint64_t a1, void **a2)
{
  return sub_28EF0(a1, a2);
}

uint64_t sub_29D84()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_29DB8()
{
  return type metadata accessor for AttributedString.MarkdownParsingOptions.FailurePolicy();
}

uint64_t sub_29DC8()
{
  return type metadata accessor for AttributedString.MarkdownParsingOptions.InterpretedSyntax();
}

uint64_t sub_29DD8()
{
  return AttributedString.MarkdownParsingOptions.init(allowsExtendedAttributes:interpretedSyntax:failurePolicy:languageCode:)();
}

uint64_t sub_29DE8()
{
  return type metadata accessor for AttributedString.MarkdownParsingOptions();
}

uint64_t sub_29DF8()
{
  return AttributedString.init(markdown:options:baseURL:)();
}

uint64_t sub_29E08()
{
  return type metadata accessor for AttributedString();
}

uint64_t sub_29E18()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_29E28()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_29E38()
{
  return _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)();
}

uint64_t sub_29E48()
{
  return URL.init(string:)();
}

uint64_t sub_29E58()
{
  return type metadata accessor for URL();
}

uint64_t sub_29E68()
{
  return static Locale.current.getter();
}

uint64_t sub_29E78()
{
  return type metadata accessor for Locale();
}

uint64_t sub_29E88()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t sub_29E98()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_29EA8()
{
  return Published.init(initialValue:)();
}

uint64_t sub_29EB8()
{
  return Published.projectedValue.getter();
}

uint64_t sub_29EC8()
{
  return static Published.subscript.getter();
}

uint64_t sub_29ED8()
{
  return static Published.subscript.setter();
}

uint64_t sub_29EE8()
{
  return type metadata accessor for Published();
}

uint64_t sub_29EF8()
{
  return Publisher<>.values.getter();
}

uint64_t sub_29F08()
{
  return AppStorage.init<A>(wrappedValue:_:store:)();
}

uint64_t sub_29F18()
{
  return AppStorage.wrappedValue.getter();
}

uint64_t sub_29F28()
{
  return AppStorage.wrappedValue.setter();
}

uint64_t sub_29F38()
{
  return AppStorage.projectedValue.getter();
}

uint64_t sub_29F48()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_29F58()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_29F68()
{
  return StateObject.projectedValue.getter();
}

uint64_t sub_29F78()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t sub_29F88()
{
  return PickerOption.init(value:content:)();
}

uint64_t sub_29F98()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_29FA8()
{
  return ObservedObject.Wrapper.subscript.getter();
}

uint64_t sub_29FB8()
{
  return ScrollViewProxy.scrollTo<A>(_:anchor:)();
}

uint64_t sub_29FC8()
{
  return type metadata accessor for ScrollViewProxy();
}

uint64_t sub_29FD8()
{
  return PlainButtonStyle.init()();
}

uint64_t sub_29FE8()
{
  return type metadata accessor for PlainButtonStyle();
}

uint64_t sub_29FF8()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_2A008()
{
  return EnvironmentObject.error()();
}

uint64_t sub_2A018()
{
  return EnvironmentObject.init()();
}

uint64_t sub_2A028()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_2A038()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_2A048()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_2A058()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_2A068()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_2A078()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_2A088()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_2A098()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_2A0A8()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_2A0B8()
{
  return static VerticalAlignment.bottom.getter();
}

uint64_t sub_2A0C8()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_2A0D8()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_2A0E8()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_2A0F8()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_2A108()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_2A118()
{
  return SegmentedPickerStyle.init()();
}

uint64_t sub_2A128()
{
  return type metadata accessor for SegmentedPickerStyle();
}

uint64_t sub_2A138()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t sub_2A148()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_2A158()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_2A168()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_2A178()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_2A188()
{
  return static Font.Weight.regular.getter();
}

uint64_t sub_2A198()
{
  return static Font.title2.getter();
}

uint64_t sub_2A1A8()
{
  return static Font.footnote.getter();
}

uint64_t sub_2A1B8()
{
  return List<>.init(content:)();
}

uint64_t sub_2A1C8()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_2A1D8()
{
  return static Text.+ infix(_:_:)();
}

uint64_t sub_2A1E8()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_2A1F8()
{
  return Text.init(_:)();
}

uint64_t sub_2A208()
{
  return Text.init<A>(_:)();
}

uint64_t sub_2A218()
{
  return View.settingsListAppearance()();
}

uint64_t sub_2A228()
{
  return View.emitNavigationEventOnAppearForSystemSetting(icon:title:localizedNavigationComponents:deepLink:)();
}

uint64_t sub_2A238()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_2A248()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_2A258()
{
  return View.fontWeight(_:)();
}

uint64_t sub_2A268()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_2A278()
{
  return View.pickerStyle<A>(_:)();
}

uint64_t sub_2A288()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_2A298()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t sub_2A2A8()
{
  return Color.init(uiColor:)();
}

uint64_t sub_2A2B8()
{
  return static Color.emphasizedGroupBackground.getter();
}

uint64_t sub_2A2C8()
{
  return static Color.blue.getter();
}

uint64_t sub_2A2D8()
{
  return static Color.black.getter();
}

uint64_t sub_2A2E8()
{
  return Color.opacity(_:)();
}

uint64_t sub_2A2F8()
{
  return static Color.primary.getter();
}

uint64_t sub_2A308()
{
  return Color.init(_:)();
}

uint64_t sub_2A318()
{
  return Image.init(systemName:)();
}

uint64_t sub_2A328()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_2A338()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_2A348()
{
  return Image.init(_:bundle:)();
}

uint64_t sub_2A358()
{
  return Button.init(action:label:)();
}

uint64_t sub_2A368()
{
  return Picker.init<A>(selection:content:label:)();
}

uint64_t sub_2A378()
{
  return Picker<>.init(_:selection:content:)();
}

uint64_t sub_2A388()
{
  return Toggle.init(isOn:label:)();
}

uint64_t sub_2A398()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_2A3A8()
{
  return static Binding.constant(_:)();
}

uint64_t sub_2A3B8()
{
  return Divider.init()();
}

uint64_t sub_2A3C8()
{
  return type metadata accessor for Divider();
}

uint64_t sub_2A3D8()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_2A3E8()
{
  return ForEach<>.init<A>(_:content:)();
}

uint64_t sub_2A3F8()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t sub_2A408()
{
  return Section<>.init(footer:content:)();
}

uint64_t sub_2A418()
{
  return static Alignment.center.getter();
}

uint64_t sub_2A428()
{
  return static Animation.easeInOut(duration:)();
}

uint64_t sub_2A438()
{
  return static UnitPoint.center.getter();
}

uint64_t sub_2A448()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_2A458()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_2A468()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_2A478()
{
  return type metadata accessor for SettingsEventImage();
}

NSDictionary sub_2A488()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_2A498()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_2A4A8()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_2A4B8()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_2A4C8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_2A4D8()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_2A4E8()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_2A4F8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_2A508()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_2A518()
{
  return String.hash(into:)();
}

void sub_2A528(Swift::String a1)
{
}

uint64_t sub_2A538()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_2A548()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_2A568()
{
  return static MainActor.shared.getter();
}

uint64_t sub_2A578()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_2A588()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_2A598()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_2A5B8()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

NSNumber sub_2A5C8()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_2A5D8()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_2A5E8()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_2A5F8()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t sub_2A608()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t sub_2A618()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_2A638()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

NSObject sub_2A648()
{
  return AnyHashable._bridgeToObjectiveC()();
}

Swift::Int sub_2A658(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_2A668()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_2A678()
{
  return AnyHashable.init<A>(_:)();
}

void sub_2A688(Swift::Int a1)
{
}

uint64_t sub_2A698()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_2A6A8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_2A6B8()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_2A6C8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_2A6E8(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_2A6F8()
{
  return AsyncDropFirstSequence.base.getter();
}

uint64_t sub_2A708()
{
  return AsyncDropFirstSequence.count.getter();
}

uint64_t sub_2A718()
{
  return AsyncDropFirstSequence.Iterator.baseIterator.modify();
}

uint64_t sub_2A728()
{
  return AsyncDropFirstSequence.Iterator.count.getter();
}

uint64_t sub_2A738()
{
  return AsyncDropFirstSequence.Iterator.count.setter();
}

uint64_t sub_2A748()
{
  return AsyncDropFirstSequence.Iterator.init(_:count:)();
}

uint64_t sub_2A758()
{
  return AsyncDropFirstSequence.init(_:dropping:)();
}

uint64_t sub_2A768()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_2A778()
{
  return Hasher.init(_seed:)();
}

void sub_2A788(Swift::UInt a1)
{
}

Swift::Int sub_2A798()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_deviceSupportsEnhancedMultitasking()
{
  return _MobileGestalt_get_deviceSupportsEnhancedMultitasking();
}

uint64_t MobileGestalt_get_deviceSupportsSingleDisplayEnhancedMultitasking()
{
  return _MobileGestalt_get_deviceSupportsSingleDisplayEnhancedMultitasking();
}

uint64_t MobileGestalt_get_homeButtonType()
{
  return _MobileGestalt_get_homeButtonType();
}

uint64_t MobileGestalt_get_quickNoteCapability()
{
  return _MobileGestalt_get_quickNoteCapability();
}

uint64_t _AXSSetShakeToUndoDisabled()
{
  return __AXSSetShakeToUndoDisabled();
}

uint64_t _AXSShakeToUndoDisabled()
{
  return __AXSShakeToUndoDisabled();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}