uint64_t sub_305C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t result;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char v101[8];
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  long long v106;
  uint64_t v107;

  *(void *)&v106 = sub_D040();
  *((void *)&v106 + 1) = v2;
  v3 = sub_CB70();
  sub_C7D4(v3, v4, v5, v6, v7, v8, v9, v10, v79, v87, v95, v101[0], v102, v103, v104, v105, v106);
  sub_B870((uint64_t)v101);
  if (v107)
  {
    if (sub_C78C())
    {
      v11 = v88;
      goto LABEL_6;
    }
  }
  else
  {
    sub_BD30((uint64_t)&v106, &qword_149F0);
  }
  v11 = 0;
LABEL_6:
  *(void *)&v106 = sub_D040();
  *((void *)&v106 + 1) = v12;
  v13 = sub_CB70();
  sub_C7D4(v13, v14, v15, v16, v17, v18, v19, v20, v80, v88, v96, v101[0], v102, v103, v104, v105, v106);
  sub_B870((uint64_t)v101);
  if (v107)
  {
    if (sub_C78C())
    {
      v21 = v89;
      goto LABEL_11;
    }
  }
  else
  {
    sub_BD30((uint64_t)&v106, &qword_149F0);
  }
  v21 = 0;
LABEL_11:
  v22 = sub_D170();
  sub_C7D4(v22, v23, v24, v25, v26, v27, v28, v29, v81, 0xD000000000000019, 0x800000000000DFF0, v101[0], v102, v103, v104, v105, v106);
  sub_B870((uint64_t)v101);
  if (!v107)
  {
    sub_BD30((uint64_t)&v106, &qword_149F0);
LABEL_16:
    v30 = 0;
    v31 = 0;
    if (v21) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (!sub_C78C()) {
    goto LABEL_16;
  }
  v30 = v90;
  v31 = v90;
  if ((v21 & 1) == 0) {
LABEL_17:
  }
    v31 = v11 ^ 1 | v30;
LABEL_18:
  HIDWORD(v82) = v31;
  *(void *)&v106 = sub_D040();
  *((void *)&v106 + 1) = v32;
  v33 = sub_CB70();
  sub_C7D4(v33, v34, v35, v36, v37, v38, v39, v40, v82, v90, v97, v101[0], v102, v103, v104, v105, v106);
  sub_B870((uint64_t)v101);
  if (v107)
  {
    v41 = sub_C78C();
    if (v41) {
      v42 = v91;
    }
    else {
      v42 = 0;
    }
    if (v41) {
      v43 = v98;
    }
    else {
      v43 = 0;
    }
  }
  else
  {
    sub_BD30((uint64_t)&v106, &qword_149F0);
    v42 = 0;
    v43 = 0;
  }
  *(void *)&v106 = sub_D040();
  *((void *)&v106 + 1) = v44;
  swift_bridgeObjectRetain();
  v45 = sub_CB70();
  sub_C7D4(v45, v46, v47, v48, v49, v50, v51, v52, v83, v91, v98, v101[0], v102, v103, v104, v105, v106);
  sub_B870((uint64_t)v101);
  if (v107)
  {
    v53 = sub_C78C();
    if (v53) {
      v54 = v92;
    }
    else {
      v54 = 0;
    }
    if (v53) {
      v55 = v99;
    }
    else {
      v55 = 0;
    }
  }
  else
  {
    sub_BD30((uint64_t)&v106, &qword_149F0);
    v54 = 0;
    v55 = 0;
  }
  *(void *)&v106 = sub_D040();
  *((void *)&v106 + 1) = v56;
  swift_bridgeObjectRetain();
  v57 = sub_CB70();
  sub_C7D4(v57, v58, v59, v60, v61, v62, v63, v64, v84, v92, v99, v101[0], v102, v103, v104, v105, v106);
  sub_B870((uint64_t)v101);
  if (v107)
  {
    v65 = sub_C78C();
    if (v65) {
      v66 = v93;
    }
    else {
      v66 = 0;
    }
    v67 = v65 ^ 1;
  }
  else
  {
    sub_BD30((uint64_t)&v106, &qword_149F0);
    v66 = 0;
    v67 = 1;
  }
  *(void *)&v106 = sub_D040();
  *((void *)&v106 + 1) = v68;
  v69 = sub_CB70();
  sub_C7D4(v69, v70, v71, v72, v73, v74, v75, v76, v85, v93, v100, v101[0], v102, v103, v104, v105, v106);
  swift_bridgeObjectRelease();
  sub_B870((uint64_t)v101);
  if (v107)
  {
    sub_9DB4(&qword_14B98);
    if (swift_dynamicCast()) {
      v77 = v94;
    }
    else {
      v77 = 0;
    }
  }
  else
  {
    sub_BD30((uint64_t)&v106, &qword_149F0);
    v77 = 0;
  }
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *(unsigned char *)a1 = v11;
  *(unsigned char *)(a1 + 1) = v86;
  *(void *)(a1 + 8) = v42;
  *(void *)(a1 + 16) = v43;
  *(void *)(a1 + 24) = v54;
  *(void *)(a1 + 32) = v55;
  *(void *)(a1 + 40) = v66;
  *(unsigned char *)(a1 + 48) = v67;
  *(void *)(a1 + 56) = v77;
  return result;
}

double sub_3444@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_AF10(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_B92C(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

double sub_34A8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_AF54(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_B92C(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_350C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_AF54(a1, a2), (v3 & 1) != 0)) {
    return swift_unknownObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_3550(char a1)
{
  if (a1) {
    return 0x53746E756F636361;
  }
  else {
    return 0x746E756F636361;
  }
}

uint64_t sub_3590()
{
  uint64_t v0 = sub_D040();
  uint64_t v2 = v1;
  if (v0 == sub_D040() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_D210();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

id sub_3618()
{
  id result = [objc_allocWithZone((Class)AKAppleIDAuthenticationController) init];
  if (result)
  {
    id result = [self shared];
    if (result)
    {
      sub_CFA0();
      swift_allocObject();
      sub_CF80();
      id v1 = [objc_allocWithZone((Class)AAFollowUpController) init];
      id v2 = objc_allocWithZone((Class)type metadata accessor for AccountAuthenticationPlugin());
      uint64_t v3 = sub_CEB4();
      id v5 = sub_3734(v3, v4, (uint64_t)v1);
      swift_getObjectType();
      swift_deallocPartialClassInstance();
      return v5;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_3734(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR___GKAccountAuthenticationPlugin_authController] = a1;
  *(void *)&v3[OBJC_IVAR___GKAccountAuthenticationPlugin_responseHandler] = a2;
  *(void *)&v3[OBJC_IVAR___GKAccountAuthenticationPlugin_followUpController] = a3;
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for AccountAuthenticationPlugin();
  return objc_msgSendSuper2(&v5, "init");
}

void sub_378C()
{
  sub_CD94();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  char v7 = v6;
  v9 = v8;
  uint64_t v10 = sub_9DB4(&qword_14A50);
  uint64_t v11 = sub_CD88(v10);
  __chkstk_darwin(v11);
  uint64_t v12 = sub_CAE0();
  sub_CE7C(v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v0;
  v13[5] = v9;
  v13[6] = v7;
  v13[7] = v5;
  v13[8] = v3;
  id v14 = v7;
  id v15 = v0;
  id v16 = v9;
  sub_C3E0(v5);
  sub_3AA0(v1, (uint64_t)&unk_14BB8, (uint64_t)v13);
  swift_release();
  sub_CD68();
}

uint64_t sub_3868()
{
  sub_C7C8();
  v0[3] = v1;
  v0[4] = v2;
  v0[2] = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_3914;
  sub_CBBC();
  return sub_3D78();
}

uint64_t sub_3914()
{
  sub_C758();
  sub_C6B0();
  sub_C74C();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 48) = v3;
  swift_task_dealloc();
  sub_C764();
  return _swift_task_switch(v4, v5, v6);
}

void sub_39E4()
{
  sub_C7C8();
  uint64_t v1 = (char *)v0[6];
  uint64_t v2 = (void (*)(void, char *))v0[3];
  if (v1 != (unsigned char *)&dword_0 + 1)
  {
    if (v2)
    {
      uint64_t v3 = v1;
      v2(0, v1);
      swift_errorRelease();
      sub_C504(v1);
      goto LABEL_6;
    }
LABEL_10:
    __break(1u);
    return;
  }
  if (!v2)
  {
    __break(1u);
    goto LABEL_10;
  }
  v2(v0[2], 0);
LABEL_6:
  sub_CA28();
  v4();
}

uint64_t sub_3AA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_D0C0();
  if (sub_B770(a1, 1, v6) == 1)
  {
    sub_BD30(a1, &qword_14A50);
  }
  else
  {
    sub_D0B0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_D090();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

void sub_3D08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_CF50();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_3D78()
{
  sub_C758();
  v1[4] = v2;
  v1[5] = v0;
  v1[3] = v3;
  uint64_t v4 = sub_CFD0();
  v1[6] = v4;
  sub_C6E4(v4);
  v1[7] = v5;
  v1[8] = sub_C95C();
  v1[9] = swift_task_alloc();
  sub_C764();
  return _swift_task_switch(v6, v7, v8);
}

void sub_3E14()
{
  sub_CA34();
  sub_CFB0();
  uint64_t v1 = (void *)sub_CFC0();
  os_log_type_t v2 = sub_D110();
  if (sub_CCB8(v2))
  {
    *(_WORD *)sub_C8E8() = 0;
    sub_CA5C(&dword_0, v3, v4, "Received call to verify Game Center credentials");
    sub_C6FC();
  }
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v6 = *(void *)(v0 + 32);

  *(void *)(v0 + 80) = *(void *)(v5 + 8);
  *(void *)(v0 + 88) = (v5 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v7 = sub_C9B0();
  v8(v7);
  if (!v6)
  {
    __break(1u);
    goto LABEL_14;
  }
  id v9 = [*(id *)(v0 + 32) client];
  if (!v9)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    return;
  }
  uint64_t v10 = v9;
  uint64_t v11 = sub_D040();
  unsigned __int8 v13 = sub_B6EC(v11, v12, v10);

  if ((v13 & 1) == 0)
  {
    sub_C1EC(0, &qword_14A28);
    sub_CE50((uint64_t)"The application is not permitted to renew GameCenter account credentials.");
    swift_task_dealloc();
    swift_task_dealloc();
    sub_CA14();
    __asm { BRAA            X2, X16 }
  }
  if (!*(void *)(v0 + 24)) {
    goto LABEL_15;
  }
  id v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v14;
  *id v14 = v0;
  v14[1] = sub_3FF4;
  sub_CA14();
  sub_8570();
}

uint64_t sub_3FF4()
{
  sub_C758();
  sub_C6B0();
  uint64_t v3 = v2;
  sub_C74C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_C74C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_C764();
    return _swift_task_switch(v7, v8, v9);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = *(uint64_t (**)(uint64_t))(v5 + 8);
    return v10(1);
  }
}

uint64_t sub_4108()
{
  sub_CFB0();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = (void *)sub_CFC0();
  os_log_type_t v2 = sub_D100();
  if (sub_CC20(v2))
  {
    sub_C9C4();
    uint64_t v3 = (void *)sub_C8C0();
    sub_CE30(5.7779e-34);
    uint64_t v4 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v4;
    sub_D120();
    *uint64_t v3 = v4;
    swift_errorRelease();
    swift_errorRelease();
    sub_CF04(&dword_0, v5, v6, "Token fetching during verification failed with error: %@");
    sub_9DB4(&qword_149E8);
    swift_arrayDestroy();
    sub_C6FC();
    sub_C6FC();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(void, void))(v0 + 80))(*(void *)(v0 + 64), *(void *)(v0 + 48));
  uint64_t v7 = sub_CF50();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v8(v7);
}

id sub_42A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_D040();
  uint64_t v6 = v5;
  sub_9DB4(&qword_14A30);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_D7A0;
  *(void *)(inited + 32) = sub_D040();
  *(void *)(inited + 40) = v8;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = a1;
  *(void *)(inited + 56) = a2;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_D000();
  id v10 = objc_allocWithZone((Class)NSError);
  return sub_A020(v4, v6, 7, v9);
}

void sub_4390()
{
  sub_CD94();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = sub_9DB4(&qword_14A50);
  uint64_t v13 = sub_CD88(v12);
  __chkstk_darwin(v13);
  uint64_t v14 = sub_CAE0();
  sub_CE7C(v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v0;
  v15[5] = v11;
  v15[6] = v9;
  v15[7] = v7;
  v15[8] = v5;
  v15[9] = v3;
  swift_bridgeObjectRetain();
  id v16 = v0;
  id v17 = v11;
  id v18 = v9;
  sub_C3E0(v5);
  sub_3AA0(v1, (uint64_t)&unk_14BA8, (uint64_t)v15);
  swift_release();
  sub_CD68();
}

uint64_t sub_4478()
{
  sub_C7C8();
  v0[2] = v1;
  v0[3] = v5;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[4] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_4534;
  return sub_4810();
}

uint64_t sub_4534()
{
  sub_C758();
  sub_C6B0();
  sub_C74C();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 40) = v3;
  *(unsigned char *)(v1 + 48) = v4;
  swift_task_dealloc();
  sub_C764();
  return _swift_task_switch(v5, v6, v7);
}

void sub_4608()
{
  sub_C7C8();
  if (!*(unsigned char *)(v0 + 48))
  {
    uint64_t v6 = *(void (**)(uint64_t, void *))(v0 + 16);
    if (v6)
    {
      uint64_t v7 = *(void **)(v0 + 40);
      id v8 = v7;
      v6(1, v7);
      sub_C3F0(v7, 0);
      char v4 = v7;
      unsigned __int8 v5 = 0;
      goto LABEL_7;
    }
    goto LABEL_14;
  }
  if (*(unsigned char *)(v0 + 48) != 1)
  {
    uint64_t v9 = *(void (**)(void, void))(v0 + 16);
    if (v9)
    {
      v9(0, 0);
      goto LABEL_10;
    }
LABEL_15:
    __break(1u);
    return;
  }
  uint64_t v1 = *(void (**)(uint64_t, void *))(v0 + 16);
  if (!v1)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v2 = *(void **)(v0 + 40);
  id v3 = v2;
  v1(2, v2);
  swift_errorRelease();
  char v4 = v2;
  unsigned __int8 v5 = 1;
LABEL_7:
  sub_C3F0(v4, v5);
LABEL_10:
  sub_CA28();
  v10();
}

uint64_t sub_4810()
{
  sub_C758();
  v1[27] = v2;
  v1[28] = v0;
  v1[25] = v3;
  v1[26] = v4;
  uint64_t v5 = sub_CFD0();
  v1[29] = v5;
  sub_C6E4(v5);
  v1[30] = v6;
  v1[31] = sub_C95C();
  v1[32] = swift_task_alloc();
  sub_C764();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_48AC()
{
  sub_CA34();
  sub_CFB0();
  uint64_t v1 = (void *)sub_CFC0();
  os_log_type_t v2 = sub_D110();
  if (sub_CCB8(v2))
  {
    *(_WORD *)sub_C8E8() = 0;
    sub_CA5C(&dword_0, v3, v4, "Received call to renew Game Center credentials");
    sub_C6FC();
  }
  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v6 = *(void *)(v0 + 208);

  *(void *)(v0 + 264) = *(void *)(v5 + 8);
  *(void *)(v0 + 272) = (v5 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v7 = sub_C9B0();
  v8(v7);
  if (!v6)
  {
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v9 = *(void **)(v0 + 208);
  id v10 = [v9 client];
  if (!v10)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v11 = v10;
  uint64_t v12 = sub_D040();
  unsigned __int8 v14 = sub_B6EC(v12, v13, v11);

  if ((v14 & 1) == 0)
  {
    sub_C1EC(0, &qword_14A28);
    sub_CE50((uint64_t)"The application is not permitted to renew GameCenter account credentials.");
    swift_task_dealloc();
    swift_task_dealloc();
    sub_CE08();
    sub_CA14();
    __asm { BRAA            X3, X16 }
  }
  uint64_t v15 = *(void **)(v0 + 200);
  if (!v15) {
    goto LABEL_20;
  }
  if ([*(id *)(v0 + 200) isAuthenticated])
  {
    [v15 setAuthenticated:0];
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 184;
    *(void *)(v0 + 24) = sub_4B94;
    uint64_t v16 = swift_continuation_init();
    *(void *)(v0 + 144) = _NSConcreteStackBlock;
    *(void *)(v0 + 152) = 0x40000000;
    *(void *)(v0 + 160) = sub_4F6C;
    *(void *)(v0 + 168) = &unk_10800;
    *(void *)(v0 + 176) = v16;
    [v9 gkSaveAccount:v15 verify:0 withCompletion:v0 + 144];
    sub_CA14();
    return _swift_continuation_await();
  }
  if (!*(void *)(v0 + 216))
  {
LABEL_21:
    __break(1u);
    return _swift_continuation_await();
  }
  swift_bridgeObjectRetain();
  sub_305C(v0 + 80);
  v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 280) = v20;
  void *v20 = v0;
  v20[1] = sub_4E48;
  sub_CCFC();
  sub_CA14();
  return sub_4FC8();
}

uint64_t sub_4B94()
{
  sub_C758();
  sub_C900();
  uint64_t v1 = *v0;
  sub_C74C();
  *os_log_type_t v2 = v1;
  sub_C764();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_4C48()
{
  sub_CBA0();
  uint64_t v1 = (void *)v0[23];
  id v2 = [v1 error];
  if (v2)
  {
    uint64_t v3 = v2;
    sub_CFB0();
    uint64_t v4 = v3;
    uint64_t v5 = sub_CFC0();
    os_log_type_t v6 = sub_D100();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)sub_C9C4();
      uint64_t v8 = (void *)sub_C8C0();
      *(_DWORD *)uint64_t v7 = 138412290;
      uint64_t v4 = v4;
      uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
      v0[24] = v9;
      sub_D120();
      *uint64_t v8 = v9;

      _os_log_impl(&dword_0, v5, v6, "Failed to save account during credential renewal: %@", v7, 0xCu);
      sub_9DB4(&qword_149E8);
      swift_arrayDestroy();
      sub_C6FC();
      sub_C6FC();
    }
    else
    {

      uint64_t v5 = v4;
    }

    id v10 = (void (*)(uint64_t))v0[33];
    uint64_t v11 = sub_CC78();
    v10(v11);
  }
  else
  {
  }
  uint64_t result = v0[27];
  if (result)
  {
    swift_bridgeObjectRetain();
    sub_305C((uint64_t)(v0 + 10));
    uint64_t v13 = (void *)swift_task_alloc();
    v0[35] = v13;
    void *v13 = v0;
    v13[1] = sub_4E48;
    sub_CCFC();
    sub_CC9C();
    return sub_4FC8();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_4E48()
{
  sub_CA34();
  sub_C870();
  sub_C74C();
  *id v2 = v1;
  uint64_t v3 = v1 + 80;
  uint64_t v4 = *v0;
  sub_C74C();
  *uint64_t v5 = v4;
  swift_task_dealloc();
  sub_C280(v3);
  swift_task_dealloc();
  swift_task_dealloc();
  sub_CA14();
  __asm { BRAA            X3, X16 }
}

uint64_t sub_4F6C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  return sub_4FA8(v2, (uint64_t)v3);
}

uint64_t sub_4FA8(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(a1 + 64) + 40) = a2;
  return _swift_continuation_resume();
}

uint64_t sub_4FC8()
{
  sub_C758();
  v1[8] = v2;
  v1[9] = v0;
  v1[6] = v3;
  v1[7] = v4;
  uint64_t v5 = sub_CFD0();
  v1[10] = v5;
  sub_C6E4(v5);
  v1[11] = v6;
  v1[12] = sub_C95C();
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  sub_C764();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_5070()
{
  sub_C7C8();
  uint64_t v1 = *(char **)(v0 + 64);
  uint64_t v3 = *(void **)(v0 + 48);
  uint64_t v2 = *(void **)(v0 + 56);
  *(unsigned char *)(v0 + 232) = [v3 isAuthenticated];
  sub_C1EC(0, &qword_14A88);
  id v4 = sub_5D74(v3, v2, v1);
  *(void *)(v0 + 120) = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_515C;
  return sub_646C((uint64_t)v4);
}

uint64_t sub_515C()
{
  sub_C758();
  sub_C6B0();
  sub_C74C();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 136) = v3;
  *(void *)(v1 + 144) = v4;
  swift_task_dealloc();
  sub_C764();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_522C()
{
  sub_C7C8();
  uint64_t v1 = v0[17];
  uint64_t v2 = (void *)v0[18];
  if (!v1)
  {
    id v14 = v2;
    goto LABEL_10;
  }
  uint64_t v3 = sub_D040();
  uint64_t v5 = v4;
  id v6 = v2;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_350C(v3, v5, v1);
  swift_bridgeObjectRelease();
  if (!v7 || (v0[4] = v7, sub_9DB4(&qword_14B60), uint64_t v8 = swift_dynamicCast(), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_10:
    sub_CFB0();
    uint64_t v15 = (void *)sub_CFC0();
    os_log_type_t v16 = sub_D100();
    if (sub_CCB8(v16))
    {
      *(_WORD *)sub_C8E8() = 0;
      sub_CA5C(&dword_0, v17, v18, "Missing token info required to proceed with renewal.");
      sub_C6FC();
    }

    uint64_t v19 = sub_C9B0();
    v20(v19);
    uint64_t v21 = (void *)swift_task_alloc();
    v0[27] = v21;
    *uint64_t v21 = v0;
    v22 = sub_5A3C;
    goto LABEL_13;
  }
  uint64_t v9 = (void *)v0[15];
  uint64_t v10 = v0[3];
  v0[19] = v0[2];
  v0[20] = v10;
  char v11 = sub_74A8(v8, v9);
  swift_bridgeObjectRelease();
  if (v11)
  {
    sub_6684();
    uint64_t v12 = (void *)swift_task_alloc();
    v0[21] = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_54AC;
    return sub_8570();
  }
  swift_bridgeObjectRelease();
  uint64_t v21 = (void *)swift_task_alloc();
  v0[23] = v21;
  *uint64_t v21 = v0;
  v22 = sub_55FC;
LABEL_13:
  v21[1] = v22;
  return sub_7794();
}

uint64_t sub_54AC()
{
  sub_C758();
  sub_C6B0();
  uint64_t v3 = v2;
  sub_C74C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_C74C();
  *id v6 = v5;
  v3[22] = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    sub_C764();
    return _swift_task_switch(v7, v8, v9);
  }
  else
  {
    uint64_t v10 = (void *)swift_task_alloc();
    v3[25] = v10;
    *uint64_t v10 = v5;
    v10[1] = sub_5768;
    uint64_t v11 = v3[20];
    uint64_t v12 = v3[18];
    uint64_t v13 = v3[6];
    uint64_t v14 = v3[19];
    return sub_7C48(v14, v11, v12, v13);
  }
}

uint64_t sub_55FC()
{
  sub_C758();
  sub_C6B0();
  sub_C74C();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 192) = v3;
  *(unsigned char *)(v1 + 233) = v4;
  swift_task_dealloc();
  sub_C764();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_56D0()
{
  sub_C7C8();
  uint64_t v1 = *(void **)(v0 + 144);

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = sub_CE1C();
  return v3(v2);
}

uint64_t sub_5768()
{
  sub_C758();
  sub_C6B0();
  sub_C74C();
  *uint64_t v2 = v1;
  uint64_t v3 = *v0;
  sub_C74C();
  *char v4 = v3;
  *(void *)(v6 + 208) = v5;
  *(unsigned char *)(v6 + 234) = v7;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  sub_C764();
  return _swift_task_switch(v8, v9, v10);
}

uint64_t sub_5858()
{
  sub_CA34();
  if (*(unsigned __int8 *)(v1 + 234) >= 2u)
  {
    sub_CFB0();
    char v4 = sub_CFC0();
    os_log_type_t v5 = sub_D110();
    BOOL v6 = sub_CC20(v5);
    char v7 = *(NSObject **)(v1 + 144);
    uint64_t v8 = *(NSObject **)(v1 + 120);
    if (v6)
    {
      uint64_t v9 = (_WORD *)sub_C8E8();
      sub_CD14(v9);
      sub_CB88(&dword_0, v4, v0, "Successfully renewed credentials.");
      sub_C6FC();
    }
    else
    {

      char v4 = v7;
      uint64_t v8 = v7;
    }

    swift_bridgeObjectRelease();
    (*(void (**)(void, void))(*(void *)(v1 + 88) + 8))(*(void *)(v1 + 112), *(void *)(v1 + 80));
    uint64_t v10 = 2;
  }
  else
  {
    uint64_t v2 = *(void **)(v1 + 144);
    if (v2)
    {
      if ((objc_msgSend(v2, "ak_isUnableToPromptError") & 1) != 0
        || (objc_msgSend(*(id *)(v1 + 144), "ak_isUserCancelError") & 1) != 0)
      {
        unsigned __int8 v3 = 1;
      }
      else
      {
        unsigned __int8 v3 = objc_msgSend(*(id *)(v1 + 144), "ak_isAuthenticationErrorWithCode:", -7014);
      }
      uint64_t v11 = *(void *)(v1 + 64);

      uint64_t v12 = *(void **)(v1 + 144);
      uint64_t v13 = *(void **)(v1 + 120);
      if (*(unsigned char *)(v11 + 1) & 1) != 0 && (v3) {
        sub_6744(*(void **)(v1 + 48), *(void **)(v1 + 56));
      }
    }
    else
    {
    }
    swift_bridgeObjectRelease();
    uint64_t v10 = *(unsigned __int8 *)(v1 + 234);
  }
  uint64_t v14 = *(void *)(v1 + 208);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8);
  return v15(v14, v10);
}

uint64_t sub_5A3C()
{
  sub_C758();
  sub_C6B0();
  sub_C74C();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 224) = v3;
  *(unsigned char *)(v1 + 235) = v4;
  swift_task_dealloc();
  sub_C764();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_5B10()
{
  sub_C7C8();
  uint64_t v1 = *(void **)(v0 + 144);

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = sub_CE1C();
  return v3(v2);
}

uint64_t sub_5BA8()
{
  sub_CFB0();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = (void *)sub_CFC0();
  os_log_type_t v2 = sub_D100();
  if (sub_CC20(v2))
  {
    sub_C9C4();
    uint64_t v3 = (void *)sub_C8C0();
    sub_CE30(5.7779e-34);
    uint64_t v4 = _swift_stdlib_bridgeErrorToNSError();
    v0[5] = v4;
    sub_D120();
    *uint64_t v3 = v4;
    swift_errorRelease();
    swift_errorRelease();
    sub_CF04(&dword_0, v5, v6, "Token fetching failed during renewal with error: %@");
    sub_9DB4(&qword_149E8);
    swift_arrayDestroy();
    sub_C6FC();
    sub_C6FC();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v7 = (void *)v0[18];
  uint64_t v8 = (void *)v0[15];
  uint64_t v10 = v0[11];
  uint64_t v9 = v0[12];
  uint64_t v11 = v0[10];

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  sub_CF50();
  swift_bridgeObjectRelease();

  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = sub_CE08();
  return v13(v12);
}

id sub_5D74(void *a1, void *a2, char *a3)
{
  uint64_t v52 = sub_CFD0();
  sub_C6C8();
  uint64_t v53 = v7;
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v49 - v12;
  id v14 = [objc_allocWithZone((Class)AKAppleIDAuthenticationContext) init];
  uint64_t v15 = sub_B9E8(a1, (SEL *)&selRef_username);
  if (v16)
  {
    sub_D010();
    uint64_t v15 = sub_CCE4();
  }
  else
  {
    uint64_t v3 = 0;
  }
  sub_CB58(v15, "setUsername:");

  [v14 setIsUsernameEditable:0];
  uint64_t v17 = sub_B9E8(a1, (SEL *)&selRef_aa_personID);
  if (v18)
  {
    sub_D010();
    uint64_t v17 = sub_CCE4();
  }
  else
  {
    uint64_t v3 = 0;
  }
  sub_CB58(v17, "setDSID:");

  uint64_t v19 = sub_B9E8(a1, (SEL *)&selRef_aa_altDSID);
  if (v20)
  {
    sub_D010();
    uint64_t v19 = sub_CCE4();
  }
  else
  {
    uint64_t v3 = 0;
  }
  sub_CB58(v19, "setAltDSID:");

  [v14 setAnticipateEscrowAttempt:1];
  sub_C228((uint64_t)(a3 + 8), (uint64_t)v56, &qword_14B78);
  uint64_t v21 = sub_C228((uint64_t)v56, (uint64_t)v57, &qword_14B78);
  if (v57[1])
  {
    uint64_t v21 = (uint64_t)sub_D010();
    v22 = (void *)v21;
  }
  else
  {
    v22 = 0;
  }
  sub_CB58(v21, "setReason:");

  [v14 _setProxyingForApp:1];
  id result = [a2 client];
  if (!result)
  {
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v24 = sub_BB00(result, (SEL *)&selRef_name);
  if (v25)
  {
    sub_D010();
    uint64_t v24 = sub_CCE4();
  }
  else
  {
    v22 = 0;
  }
  sub_CB58(v24, "_setProxiedAppName:");

  v26 = (void *)*((void *)a3 + 4);
  if (v26) {
    goto LABEL_20;
  }
  id result = [a2 client];
  if (!result)
  {
LABEL_36:
    __break(1u);
    return result;
  }
  uint64_t v27 = sub_BB00(result, (SEL *)&selRef_bundleID);
  if (v28)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    sub_D010();
    uint64_t v27 = sub_CCE4();
    goto LABEL_21;
  }
  v26 = 0;
LABEL_21:
  sub_CB58(v27, "_setProxiedAppBundleID:");

  [v14 setAuthenticationType:*a3 & 1];
  sub_9DB4(&qword_14B80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_D7B0;
  *(void *)(inited + 32) = 0x746E756F636361;
  *(void *)(inited + 40) = 0xE700000000000000;
  *(void *)(inited + 48) = a1;
  strcpy((char *)(inited + 56), "accountStore");
  *(unsigned char *)(inited + 69) = 0;
  *(_WORD *)(inited + 70) = -5120;
  *(void *)(inited + 72) = a2;
  sub_C1EC(0, &qword_14B88);
  id v30 = a1;
  id v31 = a2;
  sub_D000();
  Class isa = sub_CFE0().super.isa;
  swift_bridgeObjectRelease();
  [v14 setClientInfo:isa];

  sub_C228((uint64_t)(a3 + 40), (uint64_t)v55, &qword_14B90);
  sub_C228((uint64_t)v55, (uint64_t)&v58, &qword_14B90);
  if ((v59 & 1) != 0 || !v58)
  {
    v51 = a3;
    sub_CFB0();
    v33 = sub_CFC0();
    os_log_type_t v34 = sub_D100();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)sub_C9C4();
      uint64_t v36 = swift_slowAlloc();
      v50 = (uint8_t *)v13;
      *(_DWORD *)v35 = 136315138;
      uint64_t v54 = v36;
      uint64_t v37 = sub_D040();
      uint64_t v39 = sub_A758(v37, v38, &v54);
      sub_CF30(v39);
      sub_D120();
      uint64_t v40 = v52;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v33, v34, "Invalid value service type for key %s in renewCredentials", v35, 0xCu);
      swift_arrayDestroy();
      sub_C6FC();
      sub_C6FC();

      (*(void (**)(uint8_t *, uint64_t))(v53 + 8))(v50, v40);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v53 + 8))(v13, v52);
    }
    a3 = v51;
  }
  else
  {
    objc_msgSend(v14, "setServiceType:");
  }
  uint64_t v41 = *((void *)a3 + 7);
  if (v41)
  {
    sub_CFB0();
    swift_bridgeObjectRetain_n();
    v42 = sub_CFC0();
    os_log_type_t v43 = sub_D0F0();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)sub_C9C4();
      uint64_t v54 = swift_slowAlloc();
      v51 = v11;
      *(_DWORD *)v44 = 136315138;
      v50 = v44 + 4;
      swift_bridgeObjectRetain();
      uint64_t v45 = sub_D080();
      unint64_t v47 = v46;
      swift_bridgeObjectRelease();
      uint64_t v48 = sub_A758(v45, v47, &v54);
      sub_CF30(v48);
      sub_D120();
      sub_C8A8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v42, v43, "Will request GC service tokens resulting from auth: %s", v44, 0xCu);
      swift_arrayDestroy();
      sub_C6FC();
      sub_C6FC();

      (*(void (**)(char *, uint64_t))(v53 + 8))(v51, v52);
    }
    else
    {

      sub_C8A8();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v11, v52);
    }
    sub_BA44(v41, v14);
    [v14 setShouldUpdatePersistentServiceTokens:1];
  }
  return v14;
}

uint64_t sub_646C(uint64_t a1)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = v1;
  return sub_C7F0((uint64_t)sub_6484);
}

uint64_t sub_6484()
{
  sub_C7C8();
  uint64_t v1 = (int8x16_t *)swift_task_alloc();
  v0[3].i64[0] = (uint64_t)v1;
  v1[1] = vextq_s8(v0[2], v0[2], 8uLL);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[3].i64[1] = (uint64_t)v2;
  sub_9DB4(&qword_14B68);
  *uint64_t v2 = v0;
  v2[1] = sub_6584;
  sub_C764();
  return withCheckedContinuation<A>(isolation:function:_:)();
}

uint64_t sub_6584()
{
  sub_C758();
  sub_C6B0();
  uint64_t v1 = *v0;
  sub_C74C();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  sub_C764();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_666C()
{
  return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_6684()
{
  if ([v0 credential])
  {
    uint64_t v1 = sub_CEB4();
    id v7 = v2;
    sub_BAA8(v1, v3, v2);
  }
  else
  {
    objc_allocWithZone((Class)ACAccountCredential);
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_CEB4();
    id v7 = sub_A160(v4, v5, v6);
    objc_msgSend(v0, "setCredential:");
  }
}

id sub_6744(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_9DB4(&qword_14A50);
  uint64_t v7 = sub_CD88(v6);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v19[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = &_swiftEmptyDictionarySingleton;
  id result = [a2 client];
  if (result)
  {
    uint64_t v11 = sub_BB00(result, (SEL *)&selRef_adamOrDisplayID);
    if (v12)
    {
      v19[3] = &type metadata for String;
      v19[0] = v11;
      v19[1] = v12;
      sub_68A4((uint64_t)v19, AAFollowUpUserInfoClientName);
    }
    uint64_t v13 = sub_D0C0();
    sub_B748((uint64_t)v9, 1, 1, v13);
    id v14 = v20;
    uint64_t v15 = (void *)swift_allocObject();
    v15[2] = 0;
    v15[3] = 0;
    v15[4] = v3;
    v15[5] = a1;
    v15[6] = v14;
    id v16 = v3;
    id v17 = a1;
    sub_3AA0((uint64_t)v9, (uint64_t)&unk_14A60, (uint64_t)v15);
    return (id)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_68A4(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_B8C4((_OWORD *)a1, v3);
    sub_B4D4(v3, a2);
  }
  else
  {
    sub_BD30(a1, &qword_149F0);
    sub_B384((uint64_t)a2, v3);

    sub_BD30((uint64_t)v3, &qword_149F0);
  }
}

uint64_t sub_6924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return sub_C7F0((uint64_t)sub_6940);
}

uint64_t sub_6940()
{
  sub_C7C8();
  uint64_t v1 = *(void **)(*(void *)(v0 + 16) + OBJC_IVAR___GKAccountAuthenticationPlugin_followUpController);
  sub_70E4(*(void *)(v0 + 32));
  uint64_t v2 = sub_CEB4();
  sub_BE6C(v2, v3, v4, 0, v1);
  sub_CA28();
  return v5();
}

uint64_t sub_69D0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_9DB4(&qword_14A20);
    uint64_t v2 = (void *)sub_D1D0();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
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
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    uint64_t v15 = (void *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v16 = v15[1];
    *(void *)&v36[0] = *v15;
    *((void *)&v36[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_9DB4(&qword_149E0);
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_B8C4(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_B8C4(v35, v36);
    sub_B8C4(v36, &v32);
    uint64_t result = sub_D150(v2[5]);
    uint64_t v17 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)&v6[8 * (v18 >> 6)]) == 0)
    {
      char v21 = 0;
      unint64_t v22 = (unint64_t)(63 - v17) >> 6;
      while (++v19 != v22 || (v21 & 1) == 0)
      {
        BOOL v23 = v19 == v22;
        if (v19 == v22) {
          unint64_t v19 = 0;
        }
        v21 |= v23;
        uint64_t v24 = *(void *)&v6[8 * v19];
        if (v24 != -1)
        {
          unint64_t v20 = __clz(__rbit64(~v24)) + (v19 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v20 = __clz(__rbit64((-1 << v18) & ~*(void *)&v6[8 * (v18 >> 6)])) | v18 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)&v6[(v20 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v20;
    uint64_t v25 = v2[6] + 40 * v20;
    *(_OWORD *)uint64_t v25 = v28;
    *(_OWORD *)(v25 + 16) = v29;
    *(void *)(v25 + 32) = v30;
    uint64_t result = (uint64_t)sub_B8C4(&v32, (_OWORD *)(v2[7] + 32 * v20));
    ++v2[2];
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v26) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_36;
      }
      unint64_t v12 = *(void *)(v27 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_36;
        }
        unint64_t v12 = *(void *)(v27 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_36;
          }
          unint64_t v12 = *(void *)(v27 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v8 = v13;
  }
  int64_t v14 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_36:
    swift_release();
    sub_B924();
    return (uint64_t)v2;
  }
  unint64_t v12 = *(void *)(v27 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v26) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

unint64_t sub_6D84(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_9DB4(&qword_14A08);
    uint64_t v2 = (void *)sub_D1D0();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v32 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v37;
  uint64_t v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  unint64_t v10 = (char *)&type metadata for Any + 8;
  int64_t v11 = &type metadata for String;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        uint64_t v34 = (v5 - 1) & v5;
        unint64_t v12 = __clz(__rbit64(v5)) | (v9 << 6);
      }
      else
      {
        int64_t v13 = v9 + 1;
        if (__OFADD__(v9, 1)) {
          goto LABEL_34;
        }
        if (v13 >= v31)
        {
LABEL_31:
          sub_B924();
          return (unint64_t)v2;
        }
        unint64_t v14 = *(void *)(v32 + 8 * v13);
        int64_t v15 = v9 + 1;
        if (!v14)
        {
          int64_t v15 = v9 + 2;
          if (v9 + 2 >= v31) {
            goto LABEL_31;
          }
          unint64_t v14 = *(void *)(v32 + 8 * v15);
          if (!v14)
          {
            int64_t v15 = v9 + 3;
            if (v9 + 3 >= v31) {
              goto LABEL_31;
            }
            unint64_t v14 = *(void *)(v32 + 8 * v15);
            if (!v14)
            {
              int64_t v15 = v9 + 4;
              if (v9 + 4 >= v31) {
                goto LABEL_31;
              }
              unint64_t v14 = *(void *)(v32 + 8 * v15);
              if (!v14)
              {
                int64_t v16 = v9 + 5;
                if (v9 + 5 >= v31) {
                  goto LABEL_31;
                }
                unint64_t v14 = *(void *)(v32 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v15 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      goto LABEL_35;
                    }
                    if (v15 >= v31) {
                      goto LABEL_31;
                    }
                    unint64_t v14 = *(void *)(v32 + 8 * v15);
                    ++v16;
                    if (v14) {
                      goto LABEL_25;
                    }
                  }
                }
                int64_t v15 = v9 + 5;
              }
            }
          }
        }
LABEL_25:
        uint64_t v34 = (v14 - 1) & v14;
        unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        int64_t v9 = v15;
      }
      uint64_t v17 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v12);
      uint64_t v35 = *v17;
      uint64_t v36 = v17[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      sub_B8C4(v6, v7);
      sub_B8C4(v7, v40);
      sub_B8C4(v40, &v38);
      unint64_t result = sub_AF54(v35, v36);
      unint64_t v18 = result;
      if ((v19 & 1) == 0) {
        break;
      }
      int64_t v33 = v9;
      unint64_t v20 = v7;
      char v21 = v6;
      uint64_t v22 = v1;
      BOOL v23 = v11;
      uint64_t v24 = v10;
      uint64_t v25 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v25 = v35;
      v25[1] = v36;
      unint64_t v10 = v24;
      int64_t v11 = v23;
      uint64_t v1 = v22;
      uint64_t v6 = v21;
      uint64_t v7 = v20;
      int64_t v9 = v33;
      int64_t v26 = (_OWORD *)(v2[7] + 32 * v18);
      sub_B8D4((uint64_t)v26);
      unint64_t result = (unint64_t)sub_B8C4(&v38, v26);
      unint64_t v5 = v34;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v27 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_B8C4(&v38, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v28 = v2[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_33;
    }
    v2[2] = v30;
    unint64_t v5 = v34;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_70E4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_9DB4(&qword_14A20);
    uint64_t v2 = (void *)sub_D1D0();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
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
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    int64_t v15 = *(void **)(*(void *)(a1 + 48) + 8 * v10);
    sub_B92C(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v39 + 8);
    *(void *)&v39[0] = v15;
    v37[0] = v39[0];
    v37[1] = v39[1];
    uint64_t v38 = v40;
    *(void *)&v36[0] = v15;
    type metadata accessor for AAFollowUpUserInfo(0);
    id v16 = v15;
    swift_dynamicCast();
    sub_B8C4((_OWORD *)((char *)v37 + 8), v31);
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_B8C4(v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_B8C4(v35, v36);
    sub_B8C4(v36, &v32);
    uint64_t result = sub_D150(v2[5]);
    uint64_t v17 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)&v6[8 * (v18 >> 6)]) == 0)
    {
      char v21 = 0;
      unint64_t v22 = (unint64_t)(63 - v17) >> 6;
      while (++v19 != v22 || (v21 & 1) == 0)
      {
        BOOL v23 = v19 == v22;
        if (v19 == v22) {
          unint64_t v19 = 0;
        }
        v21 |= v23;
        uint64_t v24 = *(void *)&v6[8 * v19];
        if (v24 != -1)
        {
          unint64_t v20 = __clz(__rbit64(~v24)) + (v19 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v20 = __clz(__rbit64((-1 << v18) & ~*(void *)&v6[8 * (v18 >> 6)])) | v18 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)&v6[(v20 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v20;
    uint64_t v25 = v2[6] + 40 * v20;
    *(_OWORD *)uint64_t v25 = v28;
    *(_OWORD *)(v25 + 16) = v29;
    *(void *)(v25 + 32) = v30;
    uint64_t result = (uint64_t)sub_B8C4(&v32, (_OWORD *)(v2[7] + 32 * v20));
    ++v2[2];
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v26) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_36;
      }
      unint64_t v12 = *(void *)(v27 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_36;
        }
        unint64_t v12 = *(void *)(v27 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_36;
          }
          unint64_t v12 = *(void *)(v27 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v8 = v13;
  }
  int64_t v14 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_36:
    swift_release();
    sub_B924();
    return (uint64_t)v2;
  }
  unint64_t v12 = *(void *)(v27 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v26) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_74A8(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_CFD0();
  sub_C6C8();
  uint64_t v5 = v4;
  uint64_t v7 = __chkstk_darwin(v6);
  unint64_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  int64_t v11 = (char *)v25 - v10;
  if ([a2 serviceType] != (char *)&dword_0 + 2)
  {
    if ([a2 clientInfo])
    {
      sub_D140();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v26, 0, sizeof(v26));
    }
    sub_C228((uint64_t)v26, (uint64_t)v27, &qword_149F0);
    if (v28)
    {
      sub_9DB4(&qword_14A38);
      if ((swift_dynamicCast() & 1) == 0)
      {
LABEL_17:
        sub_CFB0();
        unint64_t v22 = sub_CFC0();
        os_log_type_t v23 = sub_D110();
        if (os_log_type_enabled(v22, v23))
        {
          uint64_t v24 = (_WORD *)sub_C8E8();
          sub_CD14(v24);
          sub_CB88(&dword_0, v22, v23, "Authentication results are not valid, because we are missing critical info");
          sub_C6FC();
        }

        (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v3);
        return 0;
      }
      uint64_t v15 = v25[1];
      uint64_t v16 = sub_CDE8();
      sub_34A8(v16 & 0xFFFFFFFFFFFFLL | 0x74000000000000, 0xE700000000000000, v15, v17);
      if (v28)
      {
        sub_C1EC(0, &qword_14A40);
        if ((sub_CC54() & 1) == 0)
        {
          swift_bridgeObjectRelease();
          goto LABEL_17;
        }
        unint64_t v18 = *(void **)&v26[0];
        uint64_t v19 = sub_CDE8();
        sub_34A8(v19 & 0xFFFFFFFFFFFFLL | 0x5374000000000000, 0xEC00000065726F74, v15, v20);

        swift_bridgeObjectRelease();
        if (v28)
        {
          sub_C1EC(0, &qword_14A48);
          if (sub_CC54())
          {

            return 1;
          }
          goto LABEL_17;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    sub_BD30((uint64_t)v27, &qword_149F0);
    goto LABEL_17;
  }
  sub_CFB0();
  unint64_t v12 = sub_CFC0();
  os_log_type_t v13 = sub_D110();
  if (os_log_type_enabled(v12, v13))
  {
    int64_t v14 = (_WORD *)sub_C8E8();
    sub_CD14(v14);
    sub_CB88(&dword_0, v12, v13, "Authentication results are not valid, because this is an iTunes login.");
    sub_C6FC();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v3);
  return 0;
}

uint64_t sub_7794()
{
  sub_C758();
  *(unsigned char *)(v0 + 184) = v1;
  *(void *)(v0 + 144) = v2;
  *(void *)(v0 + 152) = v3;
  *(void *)(v0 + 136) = v4;
  uint64_t v5 = sub_CFD0();
  *(void *)(v0 + 160) = v5;
  sub_C6E4(v5);
  *(void *)(v0 + 168) = v6;
  *(void *)(v0 + 176) = swift_task_alloc();
  sub_C764();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_7830()
{
  sub_CA34();
  char v1 = *(void **)(v0 + 136);
  if (v1)
  {
    id v2 = v1;
    if (objc_msgSend(v2, "ak_isUserCancelError")) {
      goto LABEL_9;
    }
  }
  if (*(unsigned char *)(v0 + 184) != 1)
  {
    id v7 = *(id *)(v0 + 136);
LABEL_9:
    swift_task_dealloc();
    sub_CA14();
    __asm { BRAA            X3, X16 }
  }
  uint64_t v4 = *(void **)(v0 + 144);
  uint64_t v3 = *(void **)(v0 + 152);
  [v4 setAuthenticated:1];
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = sub_79D0;
  uint64_t v5 = swift_continuation_init();
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_4F6C;
  *(void *)(v0 + 104) = &unk_10748;
  *(void *)(v0 + 112) = v5;
  [v3 gkSaveAccount:v4 verify:0 withCompletion:v0 + 80];
  sub_CA14();
  return _swift_continuation_await();
}

uint64_t sub_79D0()
{
  sub_C758();
  sub_C900();
  uint64_t v1 = *v0;
  sub_C74C();
  *id v2 = v1;
  sub_C764();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_7A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_CBA0();
  os_log_type_t v13 = *(void **)(v12 + 120);
  id v14 = [v13 error];
  if (v14)
  {
    uint64_t v15 = v14;
    sub_CFB0();
    uint64_t v16 = v15;
    uint64_t v17 = sub_CFC0();
    os_log_type_t v18 = sub_D100();
    if (os_log_type_enabled(v17, v18))
    {
      a9 = v12 + 128;
      uint64_t v19 = (_DWORD *)sub_C9C4();
      unint64_t v20 = (void *)sub_C8C0();
      *uint64_t v19 = 138412290;
      char v21 = v16;
      uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v12 + 128) = v22;
      sub_D120();
      void *v20 = v22;

      sub_CEE4(&dword_0, v23, v24, "Failed to save account while handling authentication results. Error: %@");
      sub_9DB4(&qword_149E8);
      swift_arrayDestroy();
      sub_C6FC();
      sub_C6FC();
      uint64_t v16 = v17;
      uint64_t v17 = v21;
    }
    else
    {
    }
    uint64_t v25 = sub_CC78();
    v26(v25);
  }
  else
  {
  }
  id v27 = *(id *)(v12 + 136);
  swift_task_dealloc();
  sub_CC9C();
  return v31(v28, v29, v30, v31, v32, v33, v34, v35, a9, a10, a11, a12);
}

uint64_t sub_7C48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return sub_C7F0((uint64_t)sub_7C64);
}

uint64_t sub_7C64()
{
  sub_C758();
  uint64_t v1 = *(void **)(v0 + 32);
  if (v1 && !objc_msgSend(*(id *)(v0 + 32), "ak_isAuthenticationErrorWithCode:", -7033))
  {
    id v4 = v1;
    uint64_t v2 = *(void *)(v0 + 32);
    uint64_t v3 = 1;
  }
  else
  {
    sub_6684();
    uint64_t v2 = 0;
    uint64_t v3 = 2;
  }
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v5(v2, v3);
}

uint64_t sub_7CFC()
{
  uint64_t v1 = sub_CFD0();
  sub_C6C8();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_CAB8();
  uint64_t v5 = sub_CFC0();
  os_log_type_t v6 = sub_D110();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (_WORD *)sub_C8E8();
    sub_CD14(v7);
    sub_CB88(&dword_0, v5, v6, "Received call to for whether Game Center accounts are push enabled.");
    sub_C6FC();
  }

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return 1;
}

uint64_t sub_7E18(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_CFD0();
  sub_C6C8();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  uint64_t v9 = &v30[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_CFB0();
  uint64_t v10 = sub_CFC0();
  os_log_type_t v11 = sub_D110();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_0, v10, v11, "Received call to for retrieve Game Center credentials.", v12, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v4);
  if (!a2)
  {
    sub_D040();
    sub_9DB4(&qword_14A30);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_D7A0;
    *(void *)(inited + 32) = sub_D040();
    *(void *)(inited + 40) = v19;
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = 0xD000000000000037;
    *(void *)(inited + 56) = 0x800000000000DE60;
    uint64_t v20 = sub_D000();
    id v21 = objc_allocWithZone((Class)NSError);
    uint64_t v22 = sub_CBBC();
    uint64_t v13 = v23;
    sub_A020(v22, v24, 1, v20);
    swift_willThrow();
    return v13;
  }
  uint64_t v13 = sub_D040();
  uint64_t v15 = v14;
  id v16 = a2;
  if ((sub_B6EC(v13, v15, v16) & 1) == 0)
  {
    sub_C1EC(0, &qword_14A28);
    sub_42A4(0xD00000000000004CLL, 0x800000000000DEA0);
LABEL_10:
    swift_willThrow();

    return v13;
  }
  id v17 = [self credentialForAccount:a1 clientID:0];
  if (!v17)
  {
    sub_D040();
    id v25 = objc_allocWithZone((Class)NSError);
    uint64_t v26 = sub_CBBC();
    uint64_t v13 = v27;
    sub_A020(v26, v28, 11, 0);
    goto LABEL_10;
  }
  uint64_t v13 = (uint64_t)v17;

  return v13;
}

void sub_81F4(uint64_t a1, void *a2, uint64_t a3, void (*a4)(void, id))
{
  uint64_t v7 = sub_CFD0();
  sub_C6C8();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  sub_CAB8();
  os_log_type_t v11 = sub_CFC0();
  os_log_type_t v12 = sub_D110();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)sub_C8E8();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_0, v11, v12, "Received call to discover Game Center properties.", v13, 2u);
    sub_C6FC();
  }

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v4, v7);
  if (!a2)
  {
    __break(1u);
    goto LABEL_12;
  }
  id v14 = [a2 client];
  if (!v14)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v15 = v14;
  uint64_t v16 = sub_D040();
  unsigned __int8 v18 = sub_B6EC(v16, v17, v15);

  if (v18)
  {
    uint64_t v19 = sub_D040();
    uint64_t v21 = v20;
    sub_9DB4(&qword_14A30);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_D7A0;
    *(void *)(inited + 32) = sub_D040();
    *(void *)(inited + 40) = v23;
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = 0xD000000000000063;
    *(void *)(inited + 56) = 0x800000000000DDF0;
    uint64_t v24 = sub_D000();
    id v25 = objc_allocWithZone((Class)NSError);
    id v26 = sub_A020(v19, v21, 4, v24);
    if (a4)
    {
LABEL_10:
      uint64_t v27 = v26;
      a4(0, v26);

      return;
    }
    __break(1u);
  }
  if (a4)
  {
    sub_C1EC(0, &qword_14A28);
    id v26 = sub_42A4(0xD00000000000004ALL, 0x800000000000DDA0);
    goto LABEL_10;
  }
LABEL_13:
  __break(1u);
}

uint64_t sub_8570()
{
  sub_C758();
  v1[48] = v2;
  v1[49] = v0;
  v1[47] = v3;
  uint64_t v4 = sub_CF70();
  v1[50] = v4;
  sub_C6E4(v4);
  v1[51] = v5;
  v1[52] = swift_task_alloc();
  uint64_t v6 = sub_9DB4(&qword_149D0);
  sub_CD88(v6);
  v1[53] = swift_task_alloc();
  uint64_t v7 = sub_CFD0();
  v1[54] = v7;
  sub_C6E4(v7);
  v1[55] = v8;
  v1[56] = sub_C95C();
  v1[57] = swift_task_alloc();
  v1[58] = swift_task_alloc();
  sub_C764();
  return _swift_task_switch(v9, v10, v11);
}

#error "8A64: call analysis failed (funcsize=348)"

uint64_t sub_8C1C()
{
  sub_C758();
  sub_C74C();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  uint64_t v4 = *(void *)(v3 + 48);
  *(void *)(v1 + 512) = v4;
  if (v4) {
    swift_bridgeObjectRelease();
  }
  sub_C764();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_8D28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void (*a15)(void), void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_C914();
  a29 = v36;
  a30 = v37;
  sub_CED8();
  a28 = v31;
  uint64_t v38 = *(void **)(v31 + 488);

  uint64_t v39 = *(void **)(v31 + 320);
  if (!v39)
  {
LABEL_12:
    id v65 = [*(id *)(v31 + 376) objectID];
    v66 = *(void **)(v31 + 424);
    if (v65)
    {
      sub_C850();

      uint64_t v67 = sub_C770();
      v68(v67);
      sub_C714();
      if (!v69)
      {
        uint64_t v70 = sub_CE70();
        sub_BD30(v70, &qword_149D0);
        if (sub_B798(v66))
        {
          sub_CF44();
          if (v71)
          {
            sub_C9F8();
            id v72 = v39;
            swift_bridgeObjectRetain();
            v73 = (void *)sub_CFC0();
            os_log_type_t v74 = sub_D0F0();
            sub_CA40(v74);
            sub_C83C();
            if (v75)
            {
              a12 = v31 + 368;
              a9 = v31 + 344;
              a10 = v31 + 376;
              a17 = v32;
              v76 = (_DWORD *)swift_slowAlloc();
              sub_C8C0();
              a11 = v73;
              a13 = sub_CA7C();
              a18 = a13;
              _DWORD *v76 = 138412546;
              a15 = v30;
              a16 = v39;
              *(void *)(v31 + 344) = v34;
              a14 = v33;
              id v77 = v34;
              sub_D120();
              void *v73 = v34;

              sub_C81C();
              sub_D0E0();
              sub_C9DC();
              *(void *)(v31 + 368) = sub_A758((uint64_t)(v76 + 3), v31 + 352, &a18);
              sub_D120();
              swift_bridgeObjectRelease();
              sub_C8A8();
              sub_C888(&dword_0, v78, v79, "About to refresh to pick up changes made by auth delegates, but the account already has the following dirty properties: %@ %s");
              sub_9DB4(&qword_149E8);
              sub_CDC8();
              sub_C6FC();
              uint64_t v39 = (void *)a13;
              swift_arrayDestroy();
              sub_C6FC();
              sub_C6FC();

              ((void (*)(uint64_t, uint64_t))v30)(a17, v33);
            }
            else
            {

              sub_C8A8();
              uint64_t v82 = sub_CD7C();
              v30(v82);
            }
          }
          else
          {
            swift_bridgeObjectRelease();
          }
        }
        v83 = *(void **)(v31 + 376);
        [v83 refresh];
        v84 = self;
        id v85 = sub_CD50(v84, "credentialForAccount:clientID:");
        sub_CF24();
        if (v86)
        {
          if (v39)
          {
            v87 = *(void **)(v31 + 496);
            id v88 = v83;
            sub_CEC0();
            id v89 = (id)sub_CC3C();
          }
          else
          {
            id v89 = v83;
            v87 = 0;
          }
          sub_CE9C((uint64_t)v89, "setPassword:");
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        [(id)sub_CDFC() setCredential:v83];

        goto LABEL_32;
      }
    }
    else
    {
      sub_C7FC();
    }
    sub_C994();

    sub_BD30((uint64_t)v66, &qword_149D0);
LABEL_32:
    sub_C978();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_C8D8();
    goto LABEL_33;
  }
  self;
  uint64_t v40 = (void (*)(void))swift_dynamicCastObjCClass();
  if (!v40)
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v30 = v40;
  id v41 = [v40 status];
  if (!v41)
  {
    __break(1u);
LABEL_41:
    __break(1u);
    return AuthenticationPluginResponseHandler.process(response:account:store:)(v41, v42, v43, v44, v45, v46, v47, v48, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22);
  }
  uint64_t v49 = v41;
  id v50 = [v41 integerValue];

  if ((uint64_t)v50 < 1)
  {
    id v60 = v39;
    uint64_t v61 = sub_B7F8(v30);
    if (v61)
    {
      uint64_t v62 = v61;
      *(void *)(v31 + 328) = sub_D040();
      *(void *)(v31 + 336) = v63;
      sub_D170();
      sub_3444(v31 + 200, v62, (_OWORD *)(v31 + 280));

      sub_B870(v31 + 200);
      if (*(void *)(v31 + 304))
      {
        sub_9DB4(&qword_149F8);
        if (swift_dynamicCast())
        {
          uint64_t v64 = *(void *)(v31 + 360);
          swift_bridgeObjectRelease();
          uint64_t v62 = v64;
        }
      }
      else
      {
        sub_BD30(v31 + 280, &qword_149F0);
      }
      *(void *)(v31 + 520) = v62;
      v99 = (void *)swift_task_alloc();
      *(void *)(v31 + 528) = v99;
      void *v99 = v31;
      v99[1] = sub_9384;
      sub_C7AC();
      return AuthenticationPluginResponseHandler.process(response:account:store:)(v41, v42, v43, v44, v45, v46, v47, v48, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
               a20,
               a21,
               a22);
    }
    goto LABEL_11;
  }
  swift_bridgeObjectRelease();
  id v51 = v39;
  uint64_t v52 = sub_BB00(v30, (SEL *)&selRef_statusMessage);
  if (v53)
  {
    uint64_t v54 = v52;
    uint64_t v55 = v53;
    sub_9DB4(&qword_14A00);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_D7A0;
    *(void *)(inited + 32) = sub_D040();
    *(void *)(inited + 40) = v57;
    *(void *)(inited + 48) = v54;
    *(void *)(inited + 56) = v55;
    uint64_t v58 = sub_D000();
    unint64_t v59 = sub_6D84(v58);
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v59 = 0;
  }
  id v80 = objc_allocWithZone((Class)NSError);
  sub_A020(0xD000000000000016, 0x800000000000DA70, (uint64_t)v50, v59);
  swift_willThrow();

  id v41 = [*(id *)(v31 + 376) credential];
  if (!v41) {
    goto LABEL_41;
  }
  sub_CC84();
  [v81 setPassword:0];

  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_CA28();
LABEL_33:
  sub_C7AC();
  return v91(v90, v91, v92, v93, v94, v95, v96, v97, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22);
}

uint64_t sub_9384()
{
  sub_C7C8();
  sub_C870();
  sub_C74C();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 536) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  sub_C764();
  return _swift_task_switch(v4, v5, v6);
}

#error "9594: call analysis failed (funcsize=167)"

id sub_9738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_CBA0();
  uint64_t v15 = *(void **)(v13 + 488);
  swift_willThrow();

  id result = [*(id *)(v13 + 376) credential];
  if (result)
  {
    sub_CC84();
    [v17 setPassword:0];

    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_CA28();
    sub_CC9C();
    return (id)v19(v18, v19, v20, v21, v22, v23, v24, v25, a9, a10, a11, a12);
  }
  else
  {
    __break(1u);
  }
  return result;
}

#error "9A54: call analysis failed (funcsize=241)"

uint64_t sub_9BF8(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a4)
  {
    id v5 = a4;
    return sub_9C7C(v4, (uint64_t)v5);
  }
  else
  {
    id v9 = a2;
    id v10 = a3;
    return sub_9CE0(v4, (uint64_t)a2, (uint64_t)a3);
  }
}

uint64_t sub_9C7C(uint64_t a1, uint64_t a2)
{
  sub_9DB4(&qword_14A10);
  uint64_t v4 = swift_allocError();
  *id v5 = a2;
  return _swift_continuation_throwingResumeWithError(a1, v4);
}

uint64_t sub_9CE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 64) + 40);
  *uint64_t v3 = a2;
  v3[1] = a3;
  return _swift_continuation_throwingResume();
}

id sub_9D00()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountAuthenticationPlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AccountAuthenticationPlugin()
{
  return self;
}

uint64_t sub_9DB4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void sub_9DF8()
{
  sub_CD94();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = sub_9DB4(&qword_14B70);
  sub_C6C8();
  uint64_t v8 = v7;
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v5, v6);
  unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v13 + v12, (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v15[4] = sub_BFAC;
  v15[5] = v13;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_9F78;
  v15[3] = &unk_107D8;
  id v14 = _Block_copy(v15);
  swift_release();
  [v3 authenticateWithContext:v1 completion:v14];
  _Block_release(v14);
  sub_CD68();
}

uint64_t sub_9F78(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_9DB4(&qword_14B60);
    uint64_t v4 = sub_CFF0();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

id sub_A020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSString v7 = sub_D010();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v8.super.Class isa = sub_CFE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v8.super.Class isa = 0;
  }
  id v9 = [v4 initWithDomain:v7 code:a3 userInfo:v8.super.isa];

  return v9;
}

id sub_A0D0(void *a1, uint64_t a2)
{
  if (a2)
  {
    v4.super.Class isa = sub_CFE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }
  id v5 = [v2 initWithAccount:a1 parameters:v4.super.isa];

  return v5;
}

id sub_A160(uint64_t a1, uint64_t a2, SEL *a3)
{
  if (a2)
  {
    NSString v5 = sub_D010();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  id v6 = objc_msgSend(v3, *a3, v5);

  return v6;
}

uint64_t sub_A1C4()
{
  return sub_A384(*v0, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_A1F8(uint64_t a1, id *a2)
{
  uint64_t result = sub_D020();
  *a2 = 0;
  return result;
}

uint64_t sub_A274(uint64_t a1, id *a2)
{
  char v3 = sub_D030();
  *a2 = 0;
  return v3 & 1;
}

NSString sub_A2F4@<X0>(void *a1@<X8>)
{
  NSString result = sub_A31C();
  *a1 = result;
  return result;
}

NSString sub_A31C()
{
  sub_D040();
  NSString v0 = sub_D010();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_A354()
{
  return sub_A384(*v0, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_A384(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_D040();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_A3C4()
{
  return sub_A3CC();
}

uint64_t sub_A3CC()
{
  sub_D040();
  sub_D050();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_A420()
{
  return sub_A428();
}

Swift::Int sub_A428()
{
  sub_D040();
  sub_D230();
  sub_D050();
  Swift::Int v0 = sub_D240();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_A49C()
{
  return sub_3590();
}

uint64_t sub_A4A8@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_D010();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_A4F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_A51C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_A520(uint64_t a1)
{
  uint64_t v2 = sub_C5F4(&qword_14A70);
  uint64_t v3 = sub_C5F4(&qword_14BE8);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_A5B8(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_A694;
  return v6(a1);
}

uint64_t sub_A694()
{
  sub_C758();
  sub_C6B0();
  uint64_t v1 = *v0;
  sub_C74C();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_C8D8();
  return v3();
}

uint64_t sub_A758(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_A82C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_B92C((uint64_t)v12, *a3);
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
      sub_B92C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_B8D4((uint64_t)v12);
  return v7;
}

uint64_t sub_A82C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_A984((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_D130();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_AA5C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_D190();
    if (!v8)
    {
      uint64_t result = sub_D1C0();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_A984(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_D1E0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_AA5C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_AAF4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_ACD0(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_ACD0((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_AAF4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_D060();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_AC68(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_D180();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_D1E0();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_D1C0();
  __break(1u);
  return result;
}

void *sub_AC68(uint64_t a1, uint64_t a2)
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
  sub_9DB4(&qword_14A18);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_ACD0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_9DB4(&qword_14A18);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_AE80(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_ADA8(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_ADA8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_D1E0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_AE80(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_D1E0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_AF10(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_D150(*(void *)(v2 + 40));
  return sub_B060(a1, v4);
}

unint64_t sub_AF54(uint64_t a1, uint64_t a2)
{
  sub_D230();
  sub_D050();
  Swift::Int v4 = sub_D240();
  return sub_B128(a1, a2, v4);
}

unint64_t sub_AFCC(uint64_t a1)
{
  sub_D040();
  sub_D230();
  sub_D050();
  Swift::Int v2 = sub_D240();
  swift_bridgeObjectRelease();
  return sub_B20C(a1, v2);
}

unint64_t sub_B060(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_B988(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_D160();
      sub_B870((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_B128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_D210() & 1) == 0)
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
      while (!v14 && (sub_D210() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_B20C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_D040();
    uint64_t v8 = v7;
    if (v6 == sub_D040() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_D210();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_D040();
          uint64_t v15 = v14;
          if (v13 == sub_D040() && v15 == v16) {
            break;
          }
          char v18 = sub_D210();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

double sub_B384@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_AFCC(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v3;
    uint64_t v9 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    Swift::Int v10 = *(void *)(v9 + 24);
    sub_9DB4(&qword_14A68);
    sub_D1A0(isUniquelyReferenced_nonNull_native, v10);

    sub_B8C4((_OWORD *)(*(void *)(v12 + 56) + 32 * v6), a2);
    type metadata accessor for AAFollowUpUserInfo(0);
    sub_C5F4(&qword_14A70);
    sub_D1B0();
    *uint64_t v3 = v12;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_B4D4(_OWORD *a1, void *a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_B554(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v2 = v7;
  return swift_bridgeObjectRelease();
}

_OWORD *sub_B554(_OWORD *a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v8 = sub_AFCC((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v9 & 1) == 0;
  Swift::Int v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v13 = v8;
  char v14 = v9;
  sub_9DB4(&qword_14A68);
  if (!sub_D1A0(a3 & 1, v12)) {
    goto LABEL_5;
  }
  unint64_t v15 = sub_AFCC((uint64_t)a2);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_13:
    type metadata accessor for AAFollowUpUserInfo(0);
    double result = (_OWORD *)sub_D220();
    __break(1u);
    return result;
  }
  unint64_t v13 = v15;
LABEL_5:
  id v17 = *v4;
  if (v14)
  {
    char v18 = (_OWORD *)(v17[7] + 32 * v13);
    sub_B8D4((uint64_t)v18);
    return sub_B8C4(a1, v18);
  }
  else
  {
    sub_B684(v13, (uint64_t)a2, a1, v17);
    return a2;
  }
}

_OWORD *sub_B684(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  double result = sub_B8C4(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

id sub_B6EC(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_D010();
  swift_bridgeObjectRelease();
  id v5 = [a3 hasEntitlement:v4];

  return v5;
}

uint64_t sub_B748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_B770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_B798(void *a1)
{
  id v1 = [a1 gkDirtyProperties];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_D0D0();

  return v3;
}

uint64_t sub_B7F8(void *a1)
{
  id v2 = [a1 responseParameters];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_CFF0();

  return v3;
}

uint64_t sub_B870(uint64_t a1)
{
  return a1;
}

_OWORD *sub_B8C4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_B8D4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_B924()
{
  return swift_release();
}

uint64_t sub_B92C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_B988(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_B9E8(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (v2)
  {
    uint64_t v3 = v2;
    sub_D040();
  }
  return sub_CBBC();
}

void sub_BA44(uint64_t a1, void *a2)
{
  Class isa = sub_D070().super.isa;
  [a2 setServiceIdentifiers:isa];
}

void sub_BAA8(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_D010();
  [a3 setPassword:v4];
}

uint64_t sub_BB00(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (v3)
  {
    sub_D040();
  }
  return sub_CC78();
}

uint64_t sub_BB68()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_BBB8()
{
  sub_C7C8();
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v4 = swift_task_alloc();
  id v5 = (void *)sub_CD44(v4);
  *id v5 = v8;
  v5[1] = sub_BC58;
  return sub_6924((uint64_t)v5, v6, v7, v1, v2, v3);
}

uint64_t sub_BC58()
{
  sub_C758();
  sub_C6B0();
  uint64_t v1 = *v0;
  sub_C74C();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_CA28();
  return v3();
}

void type metadata accessor for AAFollowUpUserInfo(uint64_t a1)
{
}

uint64_t sub_BD30(uint64_t a1, uint64_t *a2)
{
  sub_9DB4(a2);
  sub_CCD4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_BD84()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_BDBC()
{
  sub_C7C8();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_CD44(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_BC58;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_14A78 + dword_14A78);
  return v7(v2, v3);
}

void sub_BE6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  Class isa = sub_CFE0().super.isa;
  swift_bridgeObjectRelease();
  [a5 postFollowUpWithIdentifier:a1 forAccount:a2 userInfo:isa completion:a4];
}

void sub_BF18()
{
}

uint64_t sub_BF20()
{
  sub_9DB4(&qword_14B70);
  sub_CCD4();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return _swift_deallocObject(v0, v4, v5);
}

void sub_BFAC(uint64_t a1, uint64_t a2)
{
  sub_9DB4(&qword_14B70);
  if (a2)
  {
    swift_errorRetain();
    swift_errorRetain();
    sub_9DB4(&qword_14A10);
    sub_C1EC(0, &qword_14A28);
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRetain();
      id v3 = v11;
    }
    else
    {
      uint64_t v4 = sub_D040();
      uint64_t v6 = v5;
      sub_9DB4(&qword_14A30);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_D7A0;
      *(void *)(inited + 32) = sub_D040();
      *(void *)(inited + 40) = v8;
      *(void *)(inited + 72) = &type metadata for String;
      *(void *)(inited + 48) = 0xD000000000000036;
      *(void *)(inited + 56) = 0x800000000000DF60;
      uint64_t v9 = sub_D000();
      id v10 = objc_allocWithZone((Class)NSError);
      id v3 = sub_A020(v4, v6, 1, v9);
    }
    sub_9DB4(&qword_14B70);
    sub_D0A0();
    swift_errorRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_9DB4(&qword_14B70);
    sub_D0A0();
  }
}

uint64_t sub_C1D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_C1E4()
{
  return swift_release();
}

uint64_t sub_C1EC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_C228(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_9DB4(a3);
  sub_CCD4();
  uint64_t v4 = sub_CBBC();
  v5(v4);
  return a2;
}

uint64_t sub_C280(uint64_t a1)
{
  return a1;
}

uint64_t sub_C2CC()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 64)) {
    swift_release();
  }
  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_C334()
{
  sub_CA34();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_CD44(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_C6AC;
  sub_CC08();
  return sub_4478();
}

uint64_t sub_C3E0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void sub_C3F0(id a1, unsigned __int8 a2)
{
  if (a2 <= 1u) {
}
  }

uint64_t sub_C404()
{
  swift_unknownObjectRelease();

  if (*(void *)(v0 + 56)) {
    swift_release();
  }
  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_C464()
{
  sub_CA34();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_CD44(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_C6AC;
  sub_CC08();
  sub_CA14();
  return sub_3868();
}

void sub_C504(id a1)
{
  if (a1 != (char *)&dword_0 + 1) {
}
  }

uint64_t sub_C514()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_C54C(uint64_t a1, uint64_t a2)
{
  sub_3D08(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_C554(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void type metadata accessor for ACAccountCredentialRenewResult(uint64_t a1)
{
}

void sub_C578(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_C5C0()
{
  return sub_C5F4(&qword_14BD0);
}

uint64_t sub_C5F4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AAFollowUpUserInfo(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_C638()
{
  return sub_C5F4(&qword_14BD8);
}

uint64_t sub_C66C()
{
  return sub_C5F4(&qword_14BE0);
}

uint64_t sub_C6E4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_C6FC()
{
  return swift_slowDealloc();
}

uint64_t sub_C714()
{
  sub_B748(v0, 0, 1, v1);
  return sub_B770(v0, 1, v1);
}

uint64_t sub_C770()
{
  return v0;
}

uint64_t sub_C78C()
{
  return swift_dynamicCast();
}

double sub_C7D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17)
{
  return sub_3444((uint64_t)&a12, v17, &a17);
}

uint64_t sub_C7F0(uint64_t a1)
{
  return _swift_task_switch(a1, 0, 0);
}

uint64_t sub_C7FC()
{
  uint64_t v3 = *(void *)(v1 + 400);
  return sub_B748(v0, 1, 1, v3);
}

uint64_t sub_C81C()
{
  *(_WORD *)(v0 + 12) = 2080;
  return swift_bridgeObjectRetain();
}

uint64_t sub_C850()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

void sub_C888(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t sub_C8A8()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_C8C0()
{
  return swift_slowAlloc();
}

uint64_t sub_C8D8()
{
  return v0 + 8;
}

uint64_t sub_C8E8()
{
  return swift_slowAlloc();
}

uint64_t sub_C930()
{
  return swift_slowAlloc();
}

uint64_t sub_C95C()
{
  return swift_task_alloc();
}

uint64_t sub_C978()
{
  return swift_task_dealloc();
}

uint64_t sub_C994()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_C9B0()
{
  return v0;
}

uint64_t sub_C9C4()
{
  return swift_slowAlloc();
}

uint64_t sub_C9DC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_C9F8()
{
  return sub_CFB0();
}

uint64_t sub_CA28()
{
  return v0 + 8;
}

BOOL sub_CA40(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void sub_CA5C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t sub_CA7C()
{
  return swift_slowAlloc();
}

uint64_t sub_CA98()
{
  return swift_arrayDestroy();
}

uint64_t sub_CAB8()
{
  return sub_CFB0();
}

uint64_t sub_CAE0()
{
  return sub_D0C0();
}

uint64_t sub_CB08()
{
  return sub_D120();
}

id sub_CB30(float a1)
{
  *uint64_t v2 = a1;
  *(void *)(v1 + 344) = v3;
  return v3;
}

id sub_CB58(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_CB70()
{
  return sub_D170();
}

void sub_CB88(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

uint64_t sub_CBBC()
{
  return v0;
}

uint64_t sub_CBC8(uint64_t a1)
{
  *(void *)(v1 + 368) = a1;
  return sub_D120();
}

uint64_t sub_CBEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  return sub_A758(v10, v11, (uint64_t *)va);
}

BOOL sub_CC20(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_CC3C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_CC54()
{
  return swift_dynamicCast();
}

uint64_t sub_CC78()
{
  return v0;
}

BOOL sub_CCB8(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_CCE4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_CCFC()
{
  return v0;
}

_WORD *sub_CD14(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

void *sub_CD20(int a1, int a2, int a3, int a4, int a5, void *aBlock)
{
  return _Block_copy(aBlock);
}

uint64_t sub_CD44(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

id sub_CD50(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v2, 0);
}

uint64_t sub_CD7C()
{
  return v0;
}

uint64_t sub_CD88(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_CDA8()
{
  return swift_arrayDestroy();
}

uint64_t sub_CDC8()
{
  return swift_arrayDestroy();
}

uint64_t sub_CDE8()
{
  return 0x6E756F636361;
}

uint64_t sub_CDFC()
{
  return *(void *)(v0 + 376);
}

uint64_t sub_CE08()
{
  return v0;
}

uint64_t sub_CE1C()
{
  return v0;
}

uint64_t sub_CE30(float a1)
{
  *uint64_t v1 = a1;
  return swift_errorRetain();
}

id sub_CE50@<X0>(uint64_t a1@<X8>)
{
  return sub_42A4(0xD000000000000049, (a1 - 32) | 0x8000000000000000);
}

uint64_t sub_CE70()
{
  return *(void *)(v0 + 424);
}

uint64_t sub_CE7C(uint64_t a1)
{
  return sub_B748(v1, 1, 1, a1);
}

id sub_CE9C(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_CEB4()
{
  return v0;
}

NSString sub_CEC0()
{
  return sub_D010();
}

void sub_CEE4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void sub_CF04(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

uint64_t sub_CF30(uint64_t a1)
{
  *(void *)(v1 - 248) = a1;
  return v1 - 248;
}

uint64_t sub_CF50()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_CF70()
{
  return type metadata accessor for URL();
}

uint64_t sub_CF80()
{
  return AuthenticationPluginResponseHandler.init(preferences:)();
}

uint64_t sub_CFA0()
{
  return type metadata accessor for AuthenticationPluginResponseHandler();
}

uint64_t sub_CFB0()
{
  return static GKLog.account.getter();
}

uint64_t sub_CFC0()
{
  return Logger.logObject.getter();
}

uint64_t sub_CFD0()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_CFE0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_CFF0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_D000()
{
  return Dictionary.init(dictionaryLiteral:)();
}

NSString sub_D010()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_D020()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_D030()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_D040()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_D050()
{
  return String.hash(into:)();
}

Swift::Int sub_D060()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_D070()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_D080()
{
  return Array.description.getter();
}

uint64_t sub_D090()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_D0A0()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_D0B0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_D0C0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_D0D0()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_D0E0()
{
  return Set.description.getter();
}

uint64_t sub_D0F0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_D100()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_D110()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_D120()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_D130()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_D140()
{
  return _bridgeAnyObjectToAny(_:)();
}

Swift::Int sub_D150(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_D160()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_D170()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_D180()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_D190()
{
  return _StringObject.sharedUTF8.getter();
}

BOOL sub_D1A0(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_D1B0()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t sub_D1C0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_D1D0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_D1E0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_D210()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_D220()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_D230()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_D240()
{
  return Hasher._finalize()();
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}