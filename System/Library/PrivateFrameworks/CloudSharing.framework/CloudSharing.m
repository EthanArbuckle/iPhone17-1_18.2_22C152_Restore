const char *CSLogCategoryForCategory()
{
  return "general";
}

id CSLogForCategory(uint64_t a1)
{
  if (CSLogForCategory_onceToken[0] != -1) {
    dispatch_once(CSLogForCategory_onceToken, &__block_literal_global);
  }
  v2 = (void *)CSLogForCategory_logObjects[a1];

  return v2;
}

uint64_t __CSLogForCategory_block_invoke()
{
  CSLogForCategory_logObjects[0] = (uint64_t)os_log_create((const char *)CSLogSubsystem, "general");

  return MEMORY[0x1F41817F8]();
}

id sub_1C38A6C98()
{
  id result = sub_1C38A6CB8();
  qword_1EC027718 = (uint64_t)result;
  return result;
}

id sub_1C38A6CB8()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F29268]);
  v1 = (void *)sub_1C38BCED8();
  id v2 = objc_msgSend(v0, sel_initWithServiceName_, v1);

  id v3 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_1F1EE9A38);
  id v4 = (id)CKErrorUserInfoClasses();
  sub_1C38BCF88();

  v5 = (void *)sub_1C38BCF78();
  objc_msgSend(v3, sel_setClasses_forSelector_argumentIndex_ofReply_, v5, sel_addParticipantsToShare_containerSetupInfo_emailAddresses_phoneNumbers_permissionType_allowOthersToInvite_withReply_, 2, 1);

  v6 = (void *)sub_1C38BCF78();
  objc_msgSend(v3, sel_setClasses_forSelector_argumentIndex_ofReply_, v6, sel_addParticipantsToShare_containerSetupInfo_emailAddresses_phoneNumbers_withReply_, 2, 1);

  v7 = (void *)sub_1C38BCF78();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setClasses_forSelector_argumentIndex_ofReply_, v7, sel_addParticipantsToShareWithURLWrapper_share_emailAddresses_phoneNumbers_permissionType_allowOthersToInvite_withReply_, 2, 1);

  objc_msgSend(v2, sel_setRemoteObjectInterface_, v3);
  objc_msgSend(v2, sel_resume);

  return v2;
}

uint64_t sub_1C38A6E7C()
{
  uint64_t result = sub_1C38A6E9C();
  qword_1EC027720 = result;
  return result;
}

uint64_t sub_1C38A6E9C()
{
  if (qword_1EC0276B8 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_1EC027718;
  aBlock[4] = sub_1C38A7098;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C38A7290;
  aBlock[3] = &block_descriptor_283;
  v1 = _Block_copy(aBlock);
  id v2 = v0;
  id v3 = objc_msgSend(v2, sel_remoteObjectProxyWithErrorHandler_, v1);
  _Block_release(v1);

  sub_1C38BCFF8();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C0);
  if (swift_dynamicCast()) {
    return v9;
  }
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1C38BCEC8();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EC0276D8);
  v6 = sub_1C38BCEA8();
  os_log_type_t v7 = sub_1C38BCFB8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1C38A4000, v6, v7, "Failed to create SPIHelper remote object proxy", v8, 2u);
    MEMORY[0x1C8776AC0](v8, -1, -1);
  }

  return 0;
}

void sub_1C38A7098(void *a1)
{
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1C38BCEC8();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EC0276D8);
  id v3 = a1;
  id v4 = a1;
  oslog = sub_1C38BCEA8();
  os_log_type_t v5 = sub_1C38BCFB8();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v12 = v7;
    *(_DWORD *)v6 = 136315138;
    id v8 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA37F268);
    uint64_t v9 = sub_1C38BCF18();
    sub_1C38B1D20(v9, v10, &v12);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C38A4000, oslog, v5, "Received SPIHelper remoteObjectProxy error: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v7, -1, -1);
    MEMORY[0x1C8776AC0](v6, -1, -1);
  }
  else
  {
  }
}

void sub_1C38A7290(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_1C38A72F8(uint64_t a1, void (*a2)(void, void), uint64_t a3)
{
  sub_1C38BCDE8();
  MEMORY[0x1F4188790]();
  v34 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C38BCDF8();
  uint64_t v35 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790]();
  v33 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C38BCE68();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1C38BCEC8();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EC0276D8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  v14 = sub_1C38BCEA8();
  os_log_type_t v15 = sub_1C38BCFC8();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v36 = a1;
  if (v16)
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v32 = a3;
    v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v30 = v7;
    uint64_t v20 = v19;
    aBlock[0] = v19;
    *(_DWORD *)v18 = 136315138;
    v31 = a2;
    sub_1C38B2378(&qword_1EA37F200, MEMORY[0x1E4F276F0]);
    uint64_t v21 = sub_1C38BD068();
    uint64_t v37 = sub_1C38B1D20(v21, v22, aBlock);
    a2 = v31;
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    _os_log_impl(&dword_1C38A4000, v14, v15, "callForSharingStatus url: %s", v18, 0xCu);
    swift_arrayDestroy();
    uint64_t v23 = v20;
    uint64_t v7 = v30;
    MEMORY[0x1C8776AC0](v23, -1, -1);
    v24 = v18;
    a3 = v32;
    MEMORY[0x1C8776AC0](v24, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  v25 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    v26 = (void *)sub_1C38BCE38();
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = a2;
    *(void *)(v27 + 24) = a3;
    aBlock[4] = (uint64_t)sub_1C38B1B20;
    aBlock[5] = v27;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38A7828;
    aBlock[3] = (uint64_t)&block_descriptor;
    v28 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v25, sel_sharingStatusFor_withReply_, v26, v28);
    _Block_release(v28);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    v29 = v33;
    sub_1C38BCE18();
    v26 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v29, v7);
    a2(0, v26);
  }
}

void sub_1C38A7828(uint64_t a1, uint64_t a2, void *a3)
{
}

void sub_1C38A7848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void (*a7)(uint64_t, void, void *), uint64_t a8)
{
  v80 = a7;
  uint64_t v81 = a8;
  int v79 = a6;
  uint64_t v83 = a4;
  uint64_t v84 = a5;
  uint64_t v87 = a3;
  sub_1C38BCDE8();
  MEMORY[0x1F4188790]();
  v74 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1C38BCDF8();
  uint64_t v75 = *(void *)(v11 - 8);
  uint64_t v76 = v11;
  MEMORY[0x1F4188790]();
  v72 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  MEMORY[0x1F4188790]();
  v73 = (char *)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1C38BCE68();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v17 = (char *)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_1C38BCEC8();
  uint64_t v19 = __swift_project_value_buffer(v18, (uint64_t)qword_1EC0276D8);
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  uint64_t v77 = a1;
  v20(v17, a1, v14);
  uint64_t v21 = sub_1C38BCEA8();
  os_log_type_t v22 = sub_1C38BCFC8();
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v85 = v14;
  uint64_t v86 = v19;
  uint64_t v82 = a2;
  uint64_t v78 = v15;
  if (v23)
  {
    v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    aBlock[0] = v25;
    *(_DWORD *)v24 = 136315138;
    sub_1C38B2378(&qword_1EA37F200, MEMORY[0x1E4F276F0]);
    uint64_t v26 = sub_1C38BD068();
    uint64_t v88 = sub_1C38B1D20(v26, v27, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v85);
    _os_log_impl(&dword_1C38A4000, v21, v22, "callForFileSharing url: %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v25, -1, -1);
    MEMORY[0x1C8776AC0](v24, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }

  swift_bridgeObjectRetain_n();
  v28 = sub_1C38BCEA8();
  os_log_type_t v29 = sub_1C38BCF98();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    aBlock[0] = v31;
    *(_DWORD *)uint64_t v30 = 136315138;
    uint64_t v32 = swift_bridgeObjectRetain();
    uint64_t v33 = MEMORY[0x1C8776510](v32, MEMORY[0x1E4FBB1A0]);
    unint64_t v35 = v34;
    swift_bridgeObjectRelease();
    uint64_t v88 = sub_1C38B1D20(v33, v35, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v28, v29, "callForFileSharing emailAddresses: %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v31, -1, -1);
    MEMORY[0x1C8776AC0](v30, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v36 = sub_1C38BCEA8();
  os_log_type_t v37 = sub_1C38BCF98();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    aBlock[0] = v39;
    *(_DWORD *)v38 = 136315138;
    uint64_t v40 = swift_bridgeObjectRetain();
    uint64_t v41 = MEMORY[0x1C8776510](v40, MEMORY[0x1E4FBB1A0]);
    unint64_t v43 = v42;
    swift_bridgeObjectRelease();
    uint64_t v88 = sub_1C38B1D20(v41, v43, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v36, v37, "callForFileSharing phoneNumbers: %s", v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v39, -1, -1);
    MEMORY[0x1C8776AC0](v38, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v44 = sub_1C38BCEA8();
  os_log_type_t v45 = sub_1C38BCF98();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    *(_DWORD *)v46 = 136315138;
    uint64_t v88 = v83;
    aBlock[0] = v47;
    type metadata accessor for ParticipantPermission(0);
    uint64_t v48 = sub_1C38BCF18();
    uint64_t v88 = sub_1C38B1D20(v48, v49, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v44, v45, "callForFileSharing accessType: %s", v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v47, -1, -1);
    MEMORY[0x1C8776AC0](v46, -1, -1);
  }

  v50 = sub_1C38BCEA8();
  os_log_type_t v51 = sub_1C38BCF98();
  if (os_log_type_enabled(v50, v51))
  {
    v52 = (uint8_t *)swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    *(_DWORD *)v52 = 136315138;
    uint64_t v88 = v84;
    aBlock[0] = v53;
    type metadata accessor for ParticipantPermission(0);
    uint64_t v54 = sub_1C38BCF18();
    uint64_t v88 = sub_1C38B1D20(v54, v55, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v50, v51, "callForFileSharing permissionType: %s", v52, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v53, -1, -1);
    MEMORY[0x1C8776AC0](v52, -1, -1);
  }

  char v56 = v79;
  uint64_t v57 = v78;
  v58 = sub_1C38BCEA8();
  os_log_type_t v59 = sub_1C38BCF98();
  if (os_log_type_enabled(v58, v59))
  {
    v60 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v60 = 67109120;
    LODWORD(aBlock[0]) = v56 & 1;
    sub_1C38BCFD8();
    _os_log_impl(&dword_1C38A4000, v58, v59, "callForFileSharing allowOthersToInvite: %{BOOL}d", v60, 8u);
    MEMORY[0x1C8776AC0](v60, -1, -1);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  v61 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    v62 = (void *)sub_1C38BCE38();
    v63 = (void *)sub_1C38BCF48();
    v64 = (void *)sub_1C38BCF48();
    uint64_t v65 = swift_allocObject();
    uint64_t v66 = v81;
    *(void *)(v65 + 16) = v80;
    *(void *)(v65 + 24) = v66;
    aBlock[4] = (uint64_t)sub_1C38B2464;
    aBlock[5] = v65;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38A838C;
    aBlock[3] = (uint64_t)&block_descriptor_6;
    v67 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v61, sel_startFileSharing_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_withReply_, v62, v63, v64, v83, v84, v56 & 1, v67);
    _Block_release(v67);
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v68 = (uint64_t)v73;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v57 + 56))(v73, 1, 1, v85);
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    v69 = v72;
    uint64_t v70 = v76;
    sub_1C38BCE18();
    v71 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v75 + 8))(v69, v70);
    v80(v68, 0, v71);

    sub_1C38B2404(v68);
  }
}

uint64_t sub_1C38A838C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  MEMORY[0x1F4188790]();
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void (**)(char *, void *, void *))(a1 + 32);
  if (a2)
  {
    sub_1C38BCE58();
    uint64_t v11 = sub_1C38BCE68();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = sub_1C38BCE68();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  }
  swift_retain();
  id v13 = a3;
  id v14 = a4;
  v10(v9, a3, a4);

  swift_release();
  return sub_1C38B2404((uint64_t)v9);
}

void sub_1C38A8524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C38BC21C(a1, (uint64_t)v10, &qword_1EC0276A8);
  uint64_t v11 = sub_1C38BCE68();
  uint64_t v12 = *(void *)(v11 - 8);
  id v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
  {
    id v13 = (void *)sub_1C38BCE38();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  }
  if (a3) {
    id v14 = (void *)sub_1C38BCE28();
  }
  else {
    id v14 = 0;
  }
  (*(void (**)(uint64_t, void *, uint64_t, void *))(a4 + 16))(a4, v13, a2, v14);
}

void sub_1C38A8688(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, void (*a8)(uint64_t, void, void *), uint64_t a9)
{
  uint64_t v86 = a8;
  uint64_t v87 = a5;
  uint64_t v88 = a6;
  uint64_t v89 = a3;
  uint64_t v13 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v13 - 8);
  v80 = (char *)&v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1C38BCDF8();
  uint64_t v81 = *(void *)(v15 - 8);
  uint64_t v82 = v15;
  MEMORY[0x1F4188790](v15);
  int v79 = (char *)&v78 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v78 = (char *)&v78 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_1C38BCEC8();
  uint64_t v20 = __swift_project_value_buffer(v19, (uint64_t)qword_1EC0276D8);
  id v21 = a1;
  os_log_type_t v22 = sub_1C38BCEA8();
  os_log_type_t v23 = sub_1C38BCFC8();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v90 = a4;
  uint64_t v91 = v20;
  int v85 = a7;
  id v84 = v21;
  if (v24)
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 138412290;
    aBlock[0] = (uint64_t)v21;
    id v27 = v21;
    sub_1C38BCFD8();
    void *v26 = v21;

    _os_log_impl(&dword_1C38A4000, v22, v23, "callForCloudKitAddToShare share: %@", v25, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v26, -1, -1);
    MEMORY[0x1C8776AC0](v25, -1, -1);
  }
  else
  {
  }
  v28 = a2;
  os_log_type_t v29 = sub_1C38BCEA8();
  os_log_type_t v30 = sub_1C38BCFC8();
  BOOL v31 = os_log_type_enabled(v29, v30);
  uint64_t v83 = v28;
  if (v31)
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v32 = 138412290;
    aBlock[0] = (uint64_t)v28;
    unint64_t v34 = v28;
    sub_1C38BCFD8();
    void *v33 = v28;

    _os_log_impl(&dword_1C38A4000, v29, v30, "callForCloudKitAddToShare containerSetupInfo: %@", v32, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v33, -1, -1);
    MEMORY[0x1C8776AC0](v32, -1, -1);
  }
  else
  {

    os_log_type_t v29 = v28;
  }

  swift_bridgeObjectRetain_n();
  unint64_t v35 = sub_1C38BCEA8();
  os_log_type_t v36 = sub_1C38BCF98();
  if (os_log_type_enabled(v35, v36))
  {
    os_log_type_t v37 = (uint8_t *)swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    aBlock[0] = v38;
    *(_DWORD *)os_log_type_t v37 = 136315138;
    uint64_t v39 = swift_bridgeObjectRetain();
    uint64_t v40 = MEMORY[0x1C8776510](v39, MEMORY[0x1E4FBB1A0]);
    unint64_t v42 = v41;
    swift_bridgeObjectRelease();
    uint64_t v92 = sub_1C38B1D20(v40, v42, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v35, v36, "callForCloudKitAddToShare emailAddresses: %s", v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v38, -1, -1);
    MEMORY[0x1C8776AC0](v37, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  unint64_t v43 = sub_1C38BCEA8();
  os_log_type_t v44 = sub_1C38BCF98();
  if (os_log_type_enabled(v43, v44))
  {
    os_log_type_t v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    aBlock[0] = v46;
    *(_DWORD *)os_log_type_t v45 = 136315138;
    uint64_t v47 = swift_bridgeObjectRetain();
    uint64_t v48 = MEMORY[0x1C8776510](v47, MEMORY[0x1E4FBB1A0]);
    unint64_t v50 = v49;
    swift_bridgeObjectRelease();
    uint64_t v92 = sub_1C38B1D20(v48, v50, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v43, v44, "callForCloudKitAddToShare phoneNumbers: %s", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v46, -1, -1);
    MEMORY[0x1C8776AC0](v45, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  os_log_type_t v51 = sub_1C38BCEA8();
  os_log_type_t v52 = sub_1C38BCF98();
  if (os_log_type_enabled(v51, v52))
  {
    uint64_t v53 = (uint8_t *)swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    *(_DWORD *)uint64_t v53 = 136315138;
    uint64_t v92 = v87;
    aBlock[0] = v54;
    type metadata accessor for ParticipantPermission(0);
    uint64_t v55 = sub_1C38BCF18();
    uint64_t v92 = sub_1C38B1D20(v55, v56, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v51, v52, "callForCloudKitAddToShare accessType: %s", v53, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v54, -1, -1);
    MEMORY[0x1C8776AC0](v53, -1, -1);
  }

  uint64_t v57 = sub_1C38BCEA8();
  os_log_type_t v58 = sub_1C38BCF98();
  if (os_log_type_enabled(v57, v58))
  {
    os_log_type_t v59 = (uint8_t *)swift_slowAlloc();
    uint64_t v60 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v59 = 136315138;
    uint64_t v92 = v88;
    aBlock[0] = v60;
    type metadata accessor for ParticipantPermission(0);
    uint64_t v61 = sub_1C38BCF18();
    uint64_t v92 = sub_1C38B1D20(v61, v62, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v57, v58, "callForCloudKitAddToShare permissionType: %s", v59, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v60, -1, -1);
    MEMORY[0x1C8776AC0](v59, -1, -1);
  }

  char v63 = v85;
  v64 = sub_1C38BCEA8();
  os_log_type_t v65 = sub_1C38BCF98();
  if (os_log_type_enabled(v64, v65))
  {
    uint64_t v66 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v66 = 67109120;
    LODWORD(aBlock[0]) = v63 & 1;
    sub_1C38BCFD8();
    _os_log_impl(&dword_1C38A4000, v64, v65, "callForCloudKitAddToShare allowOthersToInvite: %{BOOL}d", v66, 8u);
    MEMORY[0x1C8776AC0](v66, -1, -1);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  v67 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    uint64_t v68 = (void *)sub_1C38BCF48();
    v69 = (void *)sub_1C38BCF48();
    uint64_t v70 = swift_allocObject();
    *(void *)(v70 + 16) = v86;
    *(void *)(v70 + 24) = a9;
    aBlock[4] = (uint64_t)sub_1C38B2464;
    aBlock[5] = v70;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38A838C;
    aBlock[3] = (uint64_t)&block_descriptor_12;
    v71 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    LOBYTE(v77) = v63 & 1;
    objc_msgSend(v67, sel_addToCloudKitSharing_containerSetupInfo_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_withReply_, v84, v83, v68, v69, v87, v88, v77, v71);
    _Block_release(v71);
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v72 = sub_1C38BCE68();
    uint64_t v73 = (uint64_t)v78;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(v78, 1, 1, v72);
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    v74 = v79;
    uint64_t v75 = v82;
    sub_1C38BCE18();
    uint64_t v76 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v81 + 8))(v74, v75);
    v86(v73, 0, v76);

    sub_1C38B2404(v73);
  }
}

void sub_1C38A9328(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, void (*a8)(void, void, void *), uint64_t a9)
{
  uint64_t v88 = a8;
  uint64_t v89 = a5;
  uint64_t v90 = a6;
  uint64_t v91 = a3;
  uint64_t v92 = a4;
  uint64_t v12 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v82 = (char *)&v80 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1C38BCDF8();
  uint64_t v83 = *(void *)(v14 - 8);
  uint64_t v84 = v14;
  MEMORY[0x1F4188790](v14);
  uint64_t v81 = (char *)&v80 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1C38BCE68();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)&v80 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_1C38BCEC8();
  uint64_t v21 = __swift_project_value_buffer(v20, (uint64_t)qword_1EC0276D8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, a1, v16);
  os_log_type_t v22 = sub_1C38BCEA8();
  os_log_type_t v23 = sub_1C38BCFC8();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v93 = v21;
  int v87 = a7;
  uint64_t v86 = a1;
  if (v24)
  {
    uint64_t v25 = swift_slowAlloc();
    int v85 = a2;
    uint64_t v26 = (uint8_t *)v25;
    uint64_t v27 = swift_slowAlloc();
    aBlock[0] = v27;
    *(_DWORD *)uint64_t v26 = 136315138;
    v80 = v26 + 4;
    sub_1C38B2378(&qword_1EA37F200, MEMORY[0x1E4F276F0]);
    uint64_t v28 = sub_1C38BD068();
    uint64_t v94 = sub_1C38B1D20(v28, v29, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    _os_log_impl(&dword_1C38A4000, v22, v23, "callForSharingURLAddToShare sharingURL: %s", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v27, -1, -1);
    os_log_type_t v30 = v26;
    a2 = v85;
    MEMORY[0x1C8776AC0](v30, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }

  BOOL v31 = a2;
  uint64_t v32 = sub_1C38BCEA8();
  os_log_type_t v33 = sub_1C38BCFC8();
  BOOL v34 = os_log_type_enabled(v32, v33);
  int v85 = v31;
  if (v34)
  {
    unint64_t v35 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v36 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v35 = 138412290;
    aBlock[0] = (uint64_t)v31;
    os_log_type_t v37 = v31;
    uint64_t v38 = v31;
    sub_1C38BCFD8();
    *os_log_type_t v36 = v37;

    _os_log_impl(&dword_1C38A4000, v32, v33, "callForSharingURLAddToShare containerSetupInfo: %@", v35, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v36, -1, -1);
    MEMORY[0x1C8776AC0](v35, -1, -1);
  }
  else
  {

    uint64_t v32 = v31;
  }

  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_1C38BCEA8();
  os_log_type_t v40 = sub_1C38BCF98();
  if (os_log_type_enabled(v39, v40))
  {
    unint64_t v41 = (uint8_t *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    aBlock[0] = v42;
    *(_DWORD *)unint64_t v41 = 136315138;
    uint64_t v43 = swift_bridgeObjectRetain();
    uint64_t v44 = MEMORY[0x1C8776510](v43, MEMORY[0x1E4FBB1A0]);
    unint64_t v46 = v45;
    swift_bridgeObjectRelease();
    uint64_t v94 = sub_1C38B1D20(v44, v46, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v39, v40, "callForSharingURLAddToShare emailAddresses: %s", v41, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v42, -1, -1);
    MEMORY[0x1C8776AC0](v41, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v47 = sub_1C38BCEA8();
  os_log_type_t v48 = sub_1C38BCF98();
  if (os_log_type_enabled(v47, v48))
  {
    unint64_t v49 = (uint8_t *)swift_slowAlloc();
    uint64_t v50 = swift_slowAlloc();
    aBlock[0] = v50;
    *(_DWORD *)unint64_t v49 = 136315138;
    uint64_t v51 = swift_bridgeObjectRetain();
    uint64_t v52 = MEMORY[0x1C8776510](v51, MEMORY[0x1E4FBB1A0]);
    unint64_t v54 = v53;
    swift_bridgeObjectRelease();
    uint64_t v94 = sub_1C38B1D20(v52, v54, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v47, v48, "callForSharingURLAddToShare phoneNumbers: %s", v49, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v50, -1, -1);
    MEMORY[0x1C8776AC0](v49, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v55 = sub_1C38BCEA8();
  os_log_type_t v56 = sub_1C38BCF98();
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v57 = (uint8_t *)swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    *(_DWORD *)uint64_t v57 = 136315138;
    uint64_t v94 = v89;
    aBlock[0] = v58;
    type metadata accessor for ParticipantPermission(0);
    uint64_t v59 = sub_1C38BCF18();
    uint64_t v94 = sub_1C38B1D20(v59, v60, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v55, v56, "callForSharingURLAddToShare accessType: %s", v57, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v58, -1, -1);
    MEMORY[0x1C8776AC0](v57, -1, -1);
  }

  uint64_t v61 = sub_1C38BCEA8();
  os_log_type_t v62 = sub_1C38BCF98();
  if (os_log_type_enabled(v61, v62))
  {
    char v63 = (uint8_t *)swift_slowAlloc();
    uint64_t v64 = swift_slowAlloc();
    *(_DWORD *)char v63 = 136315138;
    uint64_t v94 = v90;
    aBlock[0] = v64;
    type metadata accessor for ParticipantPermission(0);
    uint64_t v65 = sub_1C38BCF18();
    uint64_t v94 = sub_1C38B1D20(v65, v66, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v61, v62, "callForSharingURLAddToShare permissionType: %s", v63, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v64, -1, -1);
    MEMORY[0x1C8776AC0](v63, -1, -1);
  }

  char v67 = v87;
  uint64_t v68 = sub_1C38BCEA8();
  os_log_type_t v69 = sub_1C38BCF98();
  if (os_log_type_enabled(v68, v69))
  {
    uint64_t v70 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v70 = 67109120;
    LODWORD(aBlock[0]) = v67 & 1;
    sub_1C38BCFD8();
    _os_log_impl(&dword_1C38A4000, v68, v69, "callForSharingURLAddToShare allowOthersToInvite: %{BOOL}d", v70, 8u);
    MEMORY[0x1C8776AC0](v70, -1, -1);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  v71 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    uint64_t v72 = (void *)sub_1C38BCE38();
    uint64_t v73 = (void *)sub_1C38BCF48();
    v74 = (void *)sub_1C38BCF48();
    uint64_t v75 = swift_allocObject();
    *(void *)(v75 + 16) = v88;
    *(void *)(v75 + 24) = a9;
    aBlock[4] = (uint64_t)sub_1C38B247C;
    aBlock[5] = v75;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38A9F30;
    aBlock[3] = (uint64_t)&block_descriptor_18;
    uint64_t v76 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    LOBYTE(v79) = v67 & 1;
    objc_msgSend(v71, sel_addToShareFromSharingURL_containerSetupInfo_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_withReply_, v72, v85, v73, v74, v89, v90, v79, v76);
    _Block_release(v76);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    uint64_t v77 = v81;
    uint64_t v78 = v84;
    sub_1C38BCE18();
    v74 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v83 + 8))(v77, v78);
    v88(0, 0, v74);
  }
}

void sub_1C38A9F30(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7 = *(void (**)(uint64_t, void *, void *))(a1 + 32);
  swift_retain();
  id v9 = a3;
  id v8 = a4;
  v7(a2, a3, a4);
  swift_release();
}

void sub_1C38AA158(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3) {
    uint64_t v7 = sub_1C38BCE28();
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  (*(void (**)(uint64_t, void, uint64_t))(a4 + 16))(a4, a1 & 1, a2);
}

void sub_1C38AA1D8(uint64_t a1, void *a2, void (*a3)(void, void *), uint64_t a4)
{
  uint64_t v44 = a3;
  uint64_t v45 = a4;
  id v42 = a2;
  uint64_t aBlock[6] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v39 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C38BCDF8();
  uint64_t v40 = *(void *)(v7 - 8);
  uint64_t v41 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v38 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C38BCE68();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1C38BCEC8();
  uint64_t v14 = __swift_project_value_buffer(v13, (uint64_t)qword_1EC0276D8);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v43 = a1;
  v15(v12, a1, v9);
  uint64_t v16 = sub_1C38BCEA8();
  os_log_type_t v17 = sub_1C38BCFC8();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    v37[1] = v14;
    uint64_t v20 = v19;
    aBlock[0] = v19;
    *(_DWORD *)uint64_t v18 = 136315138;
    sub_1C38B2378(&qword_1EA37F200, MEMORY[0x1E4F276F0]);
    uint64_t v21 = sub_1C38BD068();
    uint64_t v46 = sub_1C38B1D20(v21, v22, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    _os_log_impl(&dword_1C38A4000, v16, v17, "callForSharingURLRemoveShare sharingURL: %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v20, -1, -1);
    MEMORY[0x1C8776AC0](v18, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }

  id v23 = v42;
  BOOL v24 = v42;
  uint64_t v25 = sub_1C38BCEA8();
  os_log_type_t v26 = sub_1C38BCFC8();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 138412290;
    if (v23)
    {
      aBlock[0] = (uint64_t)v24;
      unint64_t v29 = v24;
    }
    else
    {
      aBlock[0] = 0;
    }
    sub_1C38BCFD8();
    void *v28 = v23;

    _os_log_impl(&dword_1C38A4000, v25, v26, "callForSharingURLRemoveShare containerSetupInfo: %@", v27, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v28, -1, -1);
    MEMORY[0x1C8776AC0](v27, -1, -1);
  }
  else
  {

    uint64_t v25 = v24;
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  os_log_type_t v30 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    BOOL v31 = (void *)sub_1C38BCE38();
    uint64_t v32 = swift_allocObject();
    uint64_t v33 = v45;
    *(void *)(v32 + 16) = v44;
    *(void *)(v32 + 24) = v33;
    aBlock[4] = (uint64_t)sub_1C38B2480;
    aBlock[5] = v32;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38AA850;
    aBlock[3] = (uint64_t)&block_descriptor_24;
    BOOL v34 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v30, sel_removeFromShareFromSharingURL_containerSetupInfo_withReply_, v31, v24, v34);
    _Block_release(v34);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    unint64_t v35 = v38;
    uint64_t v36 = v41;
    sub_1C38BCE18();
    BOOL v31 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v35, v36);
    v44(0, v31);
  }
}

void sub_1C38AA850(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_1C38AA8E0(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_1C38BCE28();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

void sub_1C38AA950(void *a1, void *a2, void (*a3)(void, void *), uint64_t a4)
{
  uint64_t v39 = a4;
  uint64_t v40 = a3;
  uint64_t aBlock[6] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v36 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C38BCDF8();
  uint64_t v37 = *(void *)(v8 - 8);
  uint64_t v38 = v8;
  MEMORY[0x1F4188790](v8);
  unint64_t v35 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1C38BCEC8();
  uint64_t v11 = __swift_project_value_buffer(v10, (uint64_t)qword_1EC0276D8);
  id v12 = a1;
  uint64_t v13 = sub_1C38BCEA8();
  os_log_type_t v14 = sub_1C38BCFC8();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v34 = v11;
    os_log_type_t v17 = (void *)v16;
    *(_DWORD *)uint64_t v15 = 138412290;
    aBlock[0] = v12;
    id v18 = v12;
    sub_1C38BCFD8();
    *os_log_type_t v17 = v12;

    _os_log_impl(&dword_1C38A4000, v13, v14, "callForRemoveShare share: %@", v15, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v17, -1, -1);
    MEMORY[0x1C8776AC0](v15, -1, -1);
  }
  else
  {
  }
  uint64_t v19 = a2;
  uint64_t v20 = sub_1C38BCEA8();
  os_log_type_t v21 = sub_1C38BCFC8();
  if (os_log_type_enabled(v20, v21))
  {
    id v22 = v12;
    id v23 = (uint8_t *)swift_slowAlloc();
    BOOL v24 = (void *)swift_slowAlloc();
    *(_DWORD *)id v23 = 138412290;
    if (a2)
    {
      aBlock[0] = v19;
      uint64_t v25 = v19;
      os_log_type_t v26 = a2;
    }
    else
    {
      os_log_type_t v26 = 0;
      aBlock[0] = 0;
    }
    sub_1C38BCFD8();
    void *v24 = v26;

    _os_log_impl(&dword_1C38A4000, v20, v21, "callForRemoveShare containerSetupInfo: %@", v23, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v24, -1, -1);
    MEMORY[0x1C8776AC0](v23, -1, -1);
    id v12 = v22;
  }
  else
  {

    uint64_t v20 = v19;
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  uint64_t v27 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    uint64_t v28 = swift_allocObject();
    uint64_t v29 = v39;
    *(void *)(v28 + 16) = v40;
    *(void *)(v28 + 24) = v29;
    aBlock[4] = sub_1C38BC298;
    aBlock[5] = v28;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C38AA850;
    aBlock[3] = &block_descriptor_30;
    os_log_type_t v30 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v27, sel_removeFromShare_containerSetupInfo_withReply_, v12, v19, v30);
    _Block_release(v30);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    BOOL v31 = v35;
    uint64_t v32 = v38;
    sub_1C38BCE18();
    uint64_t v33 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v31, v32);
    v40(0, v33);
  }
}

void sub_1C38AAEFC(uint64_t a1, void (*a2)(void, void), uint64_t a3)
{
  uint64_t v6 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v6 - 8);
  unint64_t v35 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C38BCDF8();
  uint64_t v36 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v34 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C38BCE68();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1C38BCEC8();
  __swift_project_value_buffer(v14, (uint64_t)qword_1EC0276D8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  uint64_t v15 = sub_1C38BCEA8();
  os_log_type_t v16 = sub_1C38BCFC8();
  BOOL v17 = os_log_type_enabled(v15, v16);
  uint64_t v37 = a1;
  if (v17)
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v33 = a3;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v31 = v8;
    uint64_t v21 = v20;
    aBlock[0] = v20;
    *(_DWORD *)uint64_t v19 = 136315138;
    uint64_t v32 = a2;
    sub_1C38B2378(&qword_1EA37F200, MEMORY[0x1E4F276F0]);
    uint64_t v22 = sub_1C38BD068();
    uint64_t v38 = sub_1C38B1D20(v22, v23, aBlock);
    a2 = v32;
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    _os_log_impl(&dword_1C38A4000, v15, v16, "callForFileURLRemoveShare url: %s", v19, 0xCu);
    swift_arrayDestroy();
    uint64_t v24 = v21;
    uint64_t v8 = v31;
    MEMORY[0x1C8776AC0](v24, -1, -1);
    uint64_t v25 = v19;
    a3 = v33;
    MEMORY[0x1C8776AC0](v25, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  os_log_type_t v26 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    uint64_t v27 = (void *)sub_1C38BCE38();
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = a2;
    *(void *)(v28 + 24) = a3;
    aBlock[4] = (uint64_t)sub_1C38BC298;
    aBlock[5] = v28;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38AA850;
    aBlock[3] = (uint64_t)&block_descriptor_36;
    uint64_t v29 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v26, sel_removeFromShareForFileURL_withReply_, v27, v29);
    _Block_release(v29);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    os_log_type_t v30 = v34;
    sub_1C38BCE18();
    uint64_t v27 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v30, v8);
    a2(0, v27);
  }
}

void sub_1C38AB444(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, void (*a8)(void, void, void, void, void *), uint64_t a9)
{
  uint64_t v91 = a8;
  uint64_t v92 = a4;
  unint64_t v93 = a5;
  uint64_t v94 = a3;
  uint64_t v13 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v78 = (char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_1C38BCDF8();
  uint64_t v79 = *(void *)(v80 - 8);
  MEMORY[0x1F4188790](v80);
  uint64_t v77 = (char *)&v76 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  uint64_t v16 = MEMORY[0x1F4188790](v82);
  uint64_t v86 = (uint64_t)&v76 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  uint64_t v81 = (uint64_t)&v76 - v19;
  MEMORY[0x1F4188790](v18);
  uint64_t v88 = (char *)&v76 - v20;
  uint64_t v21 = sub_1C38BCE68();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  uint64_t v24 = (char *)&v76 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_1C38BCEC8();
  uint64_t v26 = __swift_project_value_buffer(v25, (uint64_t)qword_1EC0276D8);
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
  uint64_t v87 = a1;
  v27(v24, a1, v21);
  uint64_t v95 = v26;
  uint64_t v28 = sub_1C38BCEA8();
  os_log_type_t v29 = sub_1C38BCFC8();
  BOOL v30 = os_log_type_enabled(v28, v29);
  uint64_t v89 = a6;
  unint64_t v90 = a7;
  uint64_t v84 = v22;
  uint64_t v85 = v21;
  if (v30)
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v83 = a2;
    uint64_t v33 = v32;
    aBlock[0] = v32;
    *(_DWORD *)uint64_t v31 = 136315138;
    sub_1C38B2378(&qword_1EA37F200, MEMORY[0x1E4F276F0]);
    uint64_t v34 = sub_1C38BD068();
    uint64_t v96 = sub_1C38B1D20(v34, v35, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    uint64_t v76 = *(void (**)(char *, uint64_t))(v22 + 8);
    v76(v24, v21);
    _os_log_impl(&dword_1C38A4000, v28, v29, "callForMailContent sharingURL: %s", v31, 0xCu);
    swift_arrayDestroy();
    uint64_t v36 = v33;
    a2 = v83;
    MEMORY[0x1C8776AC0](v36, -1, -1);
    MEMORY[0x1C8776AC0](v31, -1, -1);
  }
  else
  {
    uint64_t v76 = *(void (**)(char *, uint64_t))(v22 + 8);
    v76(v24, v21);
  }

  uint64_t v37 = a2;
  uint64_t v38 = sub_1C38BCEA8();
  os_log_type_t v39 = sub_1C38BCFC8();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v40 = 138412290;
    aBlock[0] = (uint64_t)v37;
    id v42 = v37;
    sub_1C38BCFD8();
    *uint64_t v41 = v37;

    _os_log_impl(&dword_1C38A4000, v38, v39, "callForMailContent share: %@", v40, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v41, -1, -1);
    MEMORY[0x1C8776AC0](v40, -1, -1);
  }
  else
  {

    uint64_t v38 = v37;
  }
  uint64_t v43 = (uint64_t)v88;
  uint64_t v44 = v89;

  sub_1C38BC21C(v94, v43, &qword_1EC0276A8);
  uint64_t v45 = sub_1C38BCEA8();
  os_log_type_t v46 = sub_1C38BCFC8();
  BOOL v47 = os_log_type_enabled(v45, v46);
  uint64_t v83 = v37;
  if (v47)
  {
    os_log_type_t v48 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    aBlock[0] = v49;
    *(_DWORD *)os_log_type_t v48 = 136315138;
    sub_1C38BC21C(v43, v81, &qword_1EC0276A8);
    uint64_t v50 = sub_1C38BCF18();
    uint64_t v96 = sub_1C38B1D20(v50, v51, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    sub_1C38B2404(v43);
    _os_log_impl(&dword_1C38A4000, v45, v46, "callForMailContent fileURL: %s", v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v49, -1, -1);
    MEMORY[0x1C8776AC0](v48, -1, -1);
  }
  else
  {
    sub_1C38B2404(v43);
  }

  unint64_t v52 = v90;
  unint64_t v53 = v93;
  swift_bridgeObjectRetain_n();
  unint64_t v54 = sub_1C38BCEA8();
  os_log_type_t v55 = sub_1C38BCF98();
  if (os_log_type_enabled(v54, v55))
  {
    os_log_type_t v56 = (uint8_t *)swift_slowAlloc();
    uint64_t v57 = swift_slowAlloc();
    aBlock[0] = v57;
    *(_DWORD *)os_log_type_t v56 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v96 = sub_1C38B1D20(v92, v53, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C38A4000, v54, v55, "callForMailContent appName: %s", v56, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v57, -1, -1);
    MEMORY[0x1C8776AC0](v56, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1C38B24A8(v44, v52);
  sub_1C38B24A8(v44, v52);
  uint64_t v58 = sub_1C38BCEA8();
  os_log_type_t v59 = sub_1C38BCFA8();
  if (os_log_type_enabled(v58, v59))
  {
    unint64_t v60 = (uint8_t *)swift_slowAlloc();
    uint64_t v61 = swift_slowAlloc();
    aBlock[0] = v61;
    *(_DWORD *)unint64_t v60 = 136315138;
    sub_1C38B24A8(v44, v52);
    uint64_t v62 = sub_1C38BCE78();
    unint64_t v64 = v63;
    sub_1C38B2500(v44, v52);
    uint64_t v96 = sub_1C38B1D20(v62, v64, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    sub_1C38B2500(v44, v52);
    sub_1C38B2500(v44, v52);
    _os_log_impl(&dword_1C38A4000, v58, v59, "callForMailContent appIconData: %s", v60, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v61, -1, -1);
    MEMORY[0x1C8776AC0](v60, -1, -1);
  }
  else
  {
    sub_1C38B2500(v44, v52);
    sub_1C38B2500(v44, v52);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  uint64_t v65 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    unint64_t v66 = (void *)sub_1C38BCE38();
    uint64_t v67 = v86;
    sub_1C38BC21C(v94, v86, &qword_1EC0276A8);
    uint64_t v68 = v85;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v84 + 48))(v67, 1, v85) == 1)
    {
      os_log_type_t v69 = 0;
    }
    else
    {
      os_log_type_t v69 = (void *)sub_1C38BCE38();
      v76((char *)v67, v68);
    }
    uint64_t v73 = (void *)sub_1C38BCED8();
    uint64_t v72 = (void *)sub_1C38BCE88();
    uint64_t v74 = swift_allocObject();
    *(void *)(v74 + 16) = v91;
    *(void *)(v74 + 24) = a9;
    aBlock[4] = (uint64_t)sub_1C38B2558;
    aBlock[5] = v74;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38AC01C;
    aBlock[3] = (uint64_t)&block_descriptor_42;
    uint64_t v75 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v65, sel_mailContentFromSharingURL_share_fileURL_appName_appIconData_withReply_, v66, v83, v69, v73, v72, v75);
    _Block_release(v75);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    uint64_t v70 = v77;
    uint64_t v71 = v80;
    sub_1C38BCE18();
    uint64_t v72 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v79 + 8))(v70, v71);
    v91(0, 0, 0, 0, v72);
  }
}

uint64_t sub_1C38AC01C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = a3;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    uint64_t v7 = sub_1C38BCF08();
    uint64_t v9 = v8;
    if (v5)
    {
LABEL_3:
      uint64_t v10 = sub_1C38BCF08();
      uint64_t v5 = v11;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
LABEL_6:
  swift_retain();
  id v12 = a4;
  v6(v7, v9, v10, v5, a4);
  swift_release();

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void sub_1C38AC320(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = a4;
  if (a2)
  {
    uint64_t v9 = (void *)sub_1C38BCED8();
    if (!v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v9 = 0;
  if (a4) {
LABEL_3:
  }
    uint64_t v8 = (void *)sub_1C38BCED8();
LABEL_4:
  if (a5) {
    uint64_t v10 = sub_1C38BCE28();
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = (id)v10;
  (*(void (**)(uint64_t, void *, void *))(a6 + 16))(a6, v9, v8);
}

void sub_1C38AC3E0(uint64_t a1, void *a2, void (*a3)(void, void *), uint64_t a4)
{
  uint64_t v44 = a3;
  uint64_t v45 = a4;
  id v42 = a2;
  uint64_t aBlock[6] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v5 - 8);
  os_log_type_t v39 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C38BCDF8();
  uint64_t v40 = *(void *)(v7 - 8);
  uint64_t v41 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v38 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C38BCE68();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  id v12 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1C38BCEC8();
  uint64_t v14 = __swift_project_value_buffer(v13, (uint64_t)qword_1EC0276D8);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v43 = a1;
  v15(v12, a1, v9);
  uint64_t v16 = sub_1C38BCEA8();
  os_log_type_t v17 = sub_1C38BCFC8();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    v37[1] = v14;
    uint64_t v20 = v19;
    aBlock[0] = v19;
    *(_DWORD *)uint64_t v18 = 136315138;
    sub_1C38B2378(&qword_1EA37F200, MEMORY[0x1E4F276F0]);
    uint64_t v21 = sub_1C38BD068();
    uint64_t v46 = sub_1C38B1D20(v21, v22, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    _os_log_impl(&dword_1C38A4000, v16, v17, "callForMetadataFromShareURL sharingURL: %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v20, -1, -1);
    MEMORY[0x1C8776AC0](v18, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }

  id v23 = v42;
  uint64_t v24 = v42;
  uint64_t v25 = sub_1C38BCEA8();
  os_log_type_t v26 = sub_1C38BCFC8();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 138412290;
    if (v23)
    {
      aBlock[0] = (uint64_t)v24;
      os_log_type_t v29 = v24;
    }
    else
    {
      aBlock[0] = 0;
    }
    sub_1C38BCFD8();
    void *v28 = v23;

    _os_log_impl(&dword_1C38A4000, v25, v26, "callForMetadataFromShareURL containerSetupInfo: %@", v27, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v28, -1, -1);
    MEMORY[0x1C8776AC0](v27, -1, -1);
  }
  else
  {

    uint64_t v25 = v24;
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  BOOL v30 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    uint64_t v31 = (void *)sub_1C38BCE38();
    uint64_t v32 = swift_allocObject();
    uint64_t v33 = v45;
    *(void *)(v32 + 16) = v44;
    *(void *)(v32 + 24) = v33;
    aBlock[4] = (uint64_t)sub_1C38B255C;
    aBlock[5] = v32;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38ACA58;
    aBlock[3] = (uint64_t)&block_descriptor_48;
    uint64_t v34 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v30, sel_getMetadataFromShareFromSharingURL_containerSetupInfo_withReply_, v31, v24, v34);
    _Block_release(v34);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    unint64_t v35 = v38;
    uint64_t v36 = v41;
    sub_1C38BCE18();
    uint64_t v31 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v35, v36);
    v44(0, v31);
  }
}

void sub_1C38ACA58(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_1C38ACAFC(void *a1, uint64_t a2, uint64_t a3, void *a4, const void *a5, void (*a6)(char *, void *, void *))
{
  uint64_t v10 = sub_1C38BCE68();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a5);
  sub_1C38BCE58();
  _Block_copy(v14);
  id v15 = a4;
  id v16 = a1;
  a6(v13, a4, v14);
  _Block_release(v14);
  _Block_release(v14);

  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

void sub_1C38ACC34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_1C38BCE28();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_1C38ACCA4(void *a1, void *a2, void (*a3)(uint64_t, void, void *), uint64_t a4)
{
  uint64_t v44 = a4;
  uint64_t v45 = a3;
  uint64_t aBlock[6] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v41 = (char *)v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C38BCDF8();
  uint64_t v42 = *(void *)(v8 - 8);
  uint64_t v43 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v40 = (char *)v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  MEMORY[0x1F4188790](v10 - 8);
  os_log_type_t v39 = (char *)v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1C38BCEC8();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_1EC0276D8);
  id v14 = a1;
  id v15 = sub_1C38BCEA8();
  os_log_type_t v16 = sub_1C38BCFC8();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v38[1] = v13;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v19 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 138412290;
    aBlock[0] = v14;
    id v20 = v14;
    sub_1C38BCFD8();
    *uint64_t v19 = v14;

    _os_log_impl(&dword_1C38A4000, v15, v16, "callForUpdateShare share: %@", v18, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v19, -1, -1);
    MEMORY[0x1C8776AC0](v18, -1, -1);
  }
  else
  {
  }
  uint64_t v21 = a2;
  unint64_t v22 = sub_1C38BCEA8();
  os_log_type_t v23 = sub_1C38BCFC8();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 138412290;
    if (a2)
    {
      aBlock[0] = v21;
      os_log_type_t v26 = v21;
      uint64_t v27 = a2;
    }
    else
    {
      uint64_t v27 = 0;
      aBlock[0] = 0;
    }
    sub_1C38BCFD8();
    void *v25 = v27;

    _os_log_impl(&dword_1C38A4000, v22, v23, "callForUpdateShare containerSetupInfo: %@", v24, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v25, -1, -1);
    MEMORY[0x1C8776AC0](v24, -1, -1);
  }
  else
  {

    unint64_t v22 = v21;
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  uint64_t v28 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    uint64_t v29 = swift_allocObject();
    uint64_t v30 = v44;
    *(void *)(v29 + 16) = v45;
    *(void *)(v29 + 24) = v30;
    aBlock[4] = sub_1C38B2464;
    aBlock[5] = v29;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C38A838C;
    aBlock[3] = &block_descriptor_54;
    uint64_t v31 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v28, sel_updateShare_containerSetupInfo_withReply_, v14, v21, v31);
    _Block_release(v31);
    return swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v33 = sub_1C38BCE68();
    uint64_t v34 = (uint64_t)v39;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v39, 1, 1, v33);
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    unint64_t v35 = v40;
    uint64_t v36 = v43;
    sub_1C38BCE18();
    uint64_t v37 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v36);
    v45(v34, 0, v37);

    return sub_1C38B2404(v34);
  }
}

void sub_1C38AD2DC(void *a1, int a2, void *a3, void *a4, void *aBlock, void (*a6)(id, void *, void *))
{
  uint64_t v10 = _Block_copy(aBlock);
  _Block_copy(v10);
  id v11 = a3;
  id v12 = a4;
  id v13 = a1;
  a6(v11, a4, v10);
  _Block_release(v10);
  _Block_release(v10);
}

void sub_1C38AD388(void *a1, void (*a2)(void, void), uint64_t a3)
{
  uint64_t v31 = a3;
  uint64_t v5 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v6 = sub_1C38BCDF8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1C38BCEC8();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EC0276D8);
  id v11 = a1;
  id v12 = sub_1C38BCEA8();
  os_log_type_t v13 = sub_1C38BCFC8();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v30 = a2;
    id v15 = (uint8_t *)v14;
    uint64_t v27 = (void *)swift_slowAlloc();
    uint64_t v28 = v15;
    *(_DWORD *)id v15 = 138412290;
    aBlock[0] = v11;
    id v16 = v11;
    uint64_t v29 = v7;
    id v17 = v16;
    sub_1C38BCFD8();
    uint64_t v18 = v27;
    *uint64_t v27 = v11;

    uint64_t v19 = v28;
    uint64_t v7 = v29;
    _os_log_impl(&dword_1C38A4000, v12, v13, "callForCurrentUserSharingStatus share: %@", v28, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v18, -1, -1);
    id v20 = v19;
    a2 = v30;
    MEMORY[0x1C8776AC0](v20, -1, -1);
  }
  else
  {
  }
  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  uint64_t v21 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    uint64_t v22 = swift_allocObject();
    uint64_t v23 = v31;
    *(void *)(v22 + 16) = a2;
    *(void *)(v22 + 24) = v23;
    aBlock[4] = sub_1C38B2584;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C38AD7C4;
    aBlock[3] = &block_descriptor_60;
    uint64_t v24 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v21, sel_currentUserSharingStatusFor_withReply_, v11, v24);
    _Block_release(v24);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    sub_1C38BCE18();
    uint64_t v25 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    a2(0, v25);
  }
}

void sub_1C38AD7C4(uint64_t a1, uint64_t a2, void *a3)
{
}

void sub_1C38AD7CC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_1C38AD8D4(void *a1, void *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, void, void *), uint64_t a6)
{
  unint64_t v66 = a5;
  uint64_t v67 = a6;
  uint64_t v10 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v61 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1C38BCDF8();
  uint64_t v62 = *(void *)(v12 - 8);
  uint64_t v63 = v12;
  MEMORY[0x1F4188790](v12);
  unint64_t v60 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  MEMORY[0x1F4188790](v14 - 8);
  os_log_type_t v59 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_1C38BCEC8();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1EC0276D8);
  id v18 = a1;
  uint64_t v19 = sub_1C38BCEA8();
  os_log_type_t v20 = sub_1C38BCFC8();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v68 = v17;
  uint64_t v69 = a3;
  id v64 = v18;
  uint64_t v65 = a4;
  if (v21)
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 138412290;
    aBlock[0] = (uint64_t)v18;
    uint64_t v24 = a2;
    id v25 = v18;
    sub_1C38BCFD8();
    *uint64_t v23 = v18;

    a2 = v24;
    _os_log_impl(&dword_1C38A4000, v19, v20, "callForAddParticipantsToShare share: %@", v22, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v23, -1, -1);
    MEMORY[0x1C8776AC0](v22, -1, -1);
  }
  else
  {
  }
  uint64_t v26 = a2;
  uint64_t v27 = sub_1C38BCEA8();
  os_log_type_t v28 = sub_1C38BCFC8();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 138412290;
    aBlock[0] = (uint64_t)v26;
    uint64_t v31 = v26;
    sub_1C38BCFD8();
    *uint64_t v30 = v26;

    _os_log_impl(&dword_1C38A4000, v27, v28, "callForAddParticipantsToShare containerSetupInfo: %@", v29, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v30, -1, -1);
    MEMORY[0x1C8776AC0](v29, -1, -1);
  }
  else
  {

    uint64_t v27 = v26;
  }

  swift_bridgeObjectRetain_n();
  uint64_t v32 = sub_1C38BCEA8();
  os_log_type_t v33 = sub_1C38BCF98();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    aBlock[0] = v35;
    *(_DWORD *)uint64_t v34 = 136315138;
    uint64_t v36 = swift_bridgeObjectRetain();
    uint64_t v37 = MEMORY[0x1C8776510](v36, MEMORY[0x1E4FBB1A0]);
    unint64_t v39 = v38;
    swift_bridgeObjectRelease();
    uint64_t v70 = sub_1C38B1D20(v37, v39, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v32, v33, "callForAddParticipantsToShare emailAddresses: %s", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v35, -1, -1);
    MEMORY[0x1C8776AC0](v34, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v40 = sub_1C38BCEA8();
  os_log_type_t v41 = sub_1C38BCF98();
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v68 = v26;
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    aBlock[0] = v43;
    *(_DWORD *)uint64_t v42 = 136315138;
    uint64_t v44 = swift_bridgeObjectRetain();
    uint64_t v45 = MEMORY[0x1C8776510](v44, MEMORY[0x1E4FBB1A0]);
    unint64_t v47 = v46;
    swift_bridgeObjectRelease();
    uint64_t v70 = sub_1C38B1D20(v45, v47, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v40, v41, "callForAddParticipantsToShare phoneNumbers: %s", v42, 0xCu);
    uint64_t v26 = v68;
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v43, -1, -1);
    MEMORY[0x1C8776AC0](v42, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  os_log_type_t v48 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    uint64_t v49 = (void *)sub_1C38BCF48();
    uint64_t v50 = (void *)sub_1C38BCF48();
    uint64_t v51 = swift_allocObject();
    uint64_t v52 = v67;
    *(void *)(v51 + 16) = v66;
    *(void *)(v51 + 24) = v52;
    aBlock[4] = (uint64_t)sub_1C38B2464;
    aBlock[5] = v51;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38A838C;
    aBlock[3] = (uint64_t)&block_descriptor_66;
    unint64_t v53 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v48, sel_addParticipantsToShare_containerSetupInfo_emailAddresses_phoneNumbers_withReply_, v64, v26, v49, v50, v53);
    _Block_release(v53);
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v54 = sub_1C38BCE68();
    uint64_t v55 = (uint64_t)v59;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v59, 1, 1, v54);
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    os_log_type_t v56 = v60;
    uint64_t v57 = v63;
    sub_1C38BCE18();
    uint64_t v58 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v56, v57);
    v66(v55, 0, v58);

    sub_1C38B2404(v55);
  }
}

void sub_1C38AE280(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void (*a7)(uint64_t, void, void *), uint64_t a8)
{
  uint64_t v72 = a7;
  uint64_t v73 = a8;
  int v71 = a6;
  uint64_t v75 = a5;
  uint64_t v70 = a2;
  uint64_t v11 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v11 - 8);
  unint64_t v66 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1C38BCDF8();
  uint64_t v67 = *(void *)(v13 - 8);
  uint64_t v68 = v13;
  MEMORY[0x1F4188790](v13);
  uint64_t v65 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  MEMORY[0x1F4188790](v15 - 8);
  id v64 = (char *)&v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_1C38BCEC8();
  uint64_t v18 = __swift_project_value_buffer(v17, (uint64_t)qword_1EC0276D8);
  id v19 = a1;
  os_log_type_t v20 = sub_1C38BCEA8();
  os_log_type_t v21 = sub_1C38BCFC8();
  BOOL v22 = os_log_type_enabled(v20, v21);
  uint64_t v76 = v18;
  uint64_t v77 = a4;
  uint64_t v74 = a3;
  id v69 = v19;
  if (v22)
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 138412290;
    aBlock[0] = (uint64_t)v19;
    id v25 = v19;
    id v26 = v19;
    sub_1C38BCFD8();
    void *v24 = v25;

    _os_log_impl(&dword_1C38A4000, v20, v21, "callForAddParticipantsToShare urlWrapper: %@", v23, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v24, -1, -1);
    MEMORY[0x1C8776AC0](v23, -1, -1);
  }
  else
  {
  }
  swift_bridgeObjectRetain_n();
  uint64_t v27 = sub_1C38BCEA8();
  os_log_type_t v28 = sub_1C38BCF98();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    aBlock[0] = v30;
    *(_DWORD *)uint64_t v29 = 136315138;
    uint64_t v31 = swift_bridgeObjectRetain();
    uint64_t v32 = MEMORY[0x1C8776510](v31, MEMORY[0x1E4FBB1A0]);
    unint64_t v34 = v33;
    swift_bridgeObjectRelease();
    uint64_t v78 = sub_1C38B1D20(v32, v34, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v27, v28, "callForAddParticipantsToShare emailAddresses: %s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v30, -1, -1);
    MEMORY[0x1C8776AC0](v29, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v35 = sub_1C38BCEA8();
  os_log_type_t v36 = sub_1C38BCF98();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = (uint8_t *)swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    aBlock[0] = v38;
    *(_DWORD *)uint64_t v37 = 136315138;
    uint64_t v39 = swift_bridgeObjectRetain();
    uint64_t v40 = MEMORY[0x1C8776510](v39, MEMORY[0x1E4FBB1A0]);
    unint64_t v42 = v41;
    swift_bridgeObjectRelease();
    uint64_t v78 = sub_1C38B1D20(v40, v42, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v35, v36, "callForAddParticipantsToShare phoneNumbers: %s", v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v38, -1, -1);
    MEMORY[0x1C8776AC0](v37, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v43 = sub_1C38BCEA8();
  os_log_type_t v44 = sub_1C38BCF98();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    *(_DWORD *)uint64_t v45 = 136315138;
    uint64_t v78 = v75;
    aBlock[0] = v46;
    type metadata accessor for ParticipantPermission(0);
    uint64_t v47 = sub_1C38BCF18();
    uint64_t v78 = sub_1C38B1D20(v47, v48, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v43, v44, "callForAddParticipantsToShare permissionType: %s", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v46, -1, -1);
    MEMORY[0x1C8776AC0](v45, -1, -1);
  }

  char v49 = v71;
  uint64_t v50 = sub_1C38BCEA8();
  os_log_type_t v51 = sub_1C38BCF98();
  if (os_log_type_enabled(v50, v51))
  {
    uint64_t v52 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v52 = 67109120;
    LODWORD(aBlock[0]) = v49 & 1;
    sub_1C38BCFD8();
    _os_log_impl(&dword_1C38A4000, v50, v51, "callForAddParticipantsToShare allowOthersToInvite: %{BOOL}d", v52, 8u);
    MEMORY[0x1C8776AC0](v52, -1, -1);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  unint64_t v53 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    uint64_t v54 = (void *)sub_1C38BCF48();
    uint64_t v55 = (void *)sub_1C38BCF48();
    uint64_t v56 = swift_allocObject();
    uint64_t v57 = v73;
    *(void *)(v56 + 16) = v72;
    *(void *)(v56 + 24) = v57;
    aBlock[4] = (uint64_t)sub_1C38B2464;
    aBlock[5] = v56;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38A838C;
    aBlock[3] = (uint64_t)&block_descriptor_72;
    uint64_t v58 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v53, sel_addParticipantsToShareWithURLWrapper_share_emailAddresses_phoneNumbers_permissionType_allowOthersToInvite_withReply_, v69, v70, v54, v55, v75, v49 & 1, v58);
    _Block_release(v58);
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v59 = sub_1C38BCE68();
    uint64_t v60 = (uint64_t)v64;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v64, 1, 1, v59);
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    uint64_t v61 = v65;
    uint64_t v62 = v68;
    sub_1C38BCE18();
    uint64_t v63 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v61, v62);
    v72(v60, 0, v63);

    sub_1C38B2404(v60);
  }
}

void sub_1C38AEC0C(void *a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void (*a7)(uint64_t, void, void *), uint64_t a8)
{
  uint64_t v80 = a7;
  uint64_t v81 = a8;
  uint64_t v82 = a5;
  uint64_t v13 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v75 = (char *)&v73 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1C38BCDF8();
  uint64_t v76 = *(void *)(v15 - 8);
  uint64_t v77 = v15;
  MEMORY[0x1F4188790](v15);
  uint64_t v74 = (char *)&v73 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v73 = (char *)&v73 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_1C38BCEC8();
  uint64_t v20 = __swift_project_value_buffer(v19, (uint64_t)qword_1EC0276D8);
  id v21 = a1;
  BOOL v22 = sub_1C38BCEA8();
  os_log_type_t v23 = sub_1C38BCFC8();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v85 = v20;
  uint64_t v86 = a4;
  uint64_t v84 = a3;
  int v79 = a6;
  id v78 = v21;
  if (v24)
  {
    id v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v83 = a2;
    uint64_t v27 = (void *)v26;
    *(_DWORD *)id v25 = 138412290;
    aBlock[0] = (uint64_t)v21;
    id v28 = v21;
    sub_1C38BCFD8();
    *uint64_t v27 = v21;

    _os_log_impl(&dword_1C38A4000, v22, v23, "callForAddParticipantsToShare share: %@", v25, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    uint64_t v29 = v27;
    a2 = v83;
    MEMORY[0x1C8776AC0](v29, -1, -1);
    MEMORY[0x1C8776AC0](v25, -1, -1);
  }
  else
  {
  }
  uint64_t v83 = a2;
  uint64_t v30 = sub_1C38BCEA8();
  os_log_type_t v31 = sub_1C38BCFC8();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    unint64_t v33 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v32 = 138412290;
    unint64_t v34 = v83;
    aBlock[0] = (uint64_t)v83;
    uint64_t v35 = v83;
    sub_1C38BCFD8();
    void *v33 = v34;

    _os_log_impl(&dword_1C38A4000, v30, v31, "callForAddParticipantsToShare containerSetupInfo: %@", v32, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v33, -1, -1);
    MEMORY[0x1C8776AC0](v32, -1, -1);
  }
  else
  {

    uint64_t v30 = v83;
  }

  swift_bridgeObjectRetain_n();
  os_log_type_t v36 = sub_1C38BCEA8();
  os_log_type_t v37 = sub_1C38BCF98();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    aBlock[0] = v39;
    *(_DWORD *)uint64_t v38 = 136315138;
    uint64_t v40 = swift_bridgeObjectRetain();
    uint64_t v41 = MEMORY[0x1C8776510](v40, MEMORY[0x1E4FBB1A0]);
    unint64_t v43 = v42;
    swift_bridgeObjectRelease();
    uint64_t v87 = sub_1C38B1D20(v41, v43, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v36, v37, "callForAddParticipantsToShare emailAddresses: %s", v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v39, -1, -1);
    MEMORY[0x1C8776AC0](v38, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  os_log_type_t v44 = sub_1C38BCEA8();
  os_log_type_t v45 = sub_1C38BCF98();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    aBlock[0] = v47;
    *(_DWORD *)uint64_t v46 = 136315138;
    uint64_t v48 = swift_bridgeObjectRetain();
    uint64_t v49 = MEMORY[0x1C8776510](v48, MEMORY[0x1E4FBB1A0]);
    unint64_t v51 = v50;
    swift_bridgeObjectRelease();
    uint64_t v87 = sub_1C38B1D20(v49, v51, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v44, v45, "callForAddParticipantsToShare phoneNumbers: %s", v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v47, -1, -1);
    MEMORY[0x1C8776AC0](v46, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v52 = sub_1C38BCEA8();
  os_log_type_t v53 = sub_1C38BCF98();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = (uint8_t *)swift_slowAlloc();
    uint64_t v55 = swift_slowAlloc();
    *(_DWORD *)uint64_t v54 = 136315138;
    uint64_t v87 = v82;
    aBlock[0] = v55;
    type metadata accessor for ParticipantPermission(0);
    uint64_t v56 = sub_1C38BCF18();
    uint64_t v87 = sub_1C38B1D20(v56, v57, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v52, v53, "callForAddParticipantsToShare permissionType: %s", v54, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v55, -1, -1);
    MEMORY[0x1C8776AC0](v54, -1, -1);
  }

  char v58 = v79;
  uint64_t v59 = sub_1C38BCEA8();
  os_log_type_t v60 = sub_1C38BCF98();
  if (os_log_type_enabled(v59, v60))
  {
    uint64_t v61 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v61 = 67109120;
    LODWORD(aBlock[0]) = v58 & 1;
    sub_1C38BCFD8();
    _os_log_impl(&dword_1C38A4000, v59, v60, "callForAddParticipantsToShare allowOthersToInvite: %{BOOL}d", v61, 8u);
    MEMORY[0x1C8776AC0](v61, -1, -1);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  uint64_t v62 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    uint64_t v63 = (void *)sub_1C38BCF48();
    id v64 = (void *)sub_1C38BCF48();
    uint64_t v65 = swift_allocObject();
    uint64_t v66 = v81;
    *(void *)(v65 + 16) = v80;
    *(void *)(v65 + 24) = v66;
    aBlock[4] = (uint64_t)sub_1C38B2464;
    aBlock[5] = v65;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38A838C;
    aBlock[3] = (uint64_t)&block_descriptor_78;
    uint64_t v67 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v62, sel_addParticipantsToShare_containerSetupInfo_emailAddresses_phoneNumbers_permissionType_allowOthersToInvite_withReply_, v78, v83, v63, v64, v82, v58 & 1, v67);
    _Block_release(v67);
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v68 = sub_1C38BCE68();
    uint64_t v69 = (uint64_t)v73;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56))(v73, 1, 1, v68);
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    uint64_t v70 = v74;
    uint64_t v71 = v77;
    sub_1C38BCE18();
    uint64_t v72 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v76 + 8))(v70, v71);
    v80(v69, 0, v72);

    sub_1C38B2404(v69);
  }
}

uint64_t sub_1C38AF6C8(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, void (*a10)(id, id, uint64_t, uint64_t, uint64_t, uint64_t, void *))
{
  uint64_t v15 = _Block_copy(a9);
  uint64_t v16 = sub_1C38BCF58();
  uint64_t v17 = sub_1C38BCF58();
  _Block_copy(v15);
  id v18 = a3;
  id v19 = a4;
  id v20 = a1;
  a10(v18, v19, v16, v17, a7, a8, v15);
  _Block_release(v15);
  _Block_release(v15);

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void sub_1C38AF7D0(uint64_t a1, void (*a2)(void, void, void), uint64_t a3)
{
  uint64_t v44 = a3;
  uint64_t v5 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v5 - 8);
  unint64_t v42 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C38BCDF8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v41 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v40 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1C38BCE68();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_1C38BCEC8();
  __swift_project_value_buffer(v16, (uint64_t)qword_1EC0276D8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1, v12);
  uint64_t v17 = sub_1C38BCEA8();
  os_log_type_t v18 = sub_1C38BCFC8();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v43 = a1;
  if (v19)
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v39 = a2;
    id v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v37 = v8;
    uint64_t v23 = v22;
    aBlock[0] = v22;
    *(_DWORD *)id v21 = 136315138;
    uint64_t v38 = v7;
    sub_1C38B2378(&qword_1EA37F200, MEMORY[0x1E4F276F0]);
    uint64_t v24 = sub_1C38BD068();
    uint64_t v45 = sub_1C38B1D20(v24, v25, aBlock);
    uint64_t v7 = v38;
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    _os_log_impl(&dword_1C38A4000, v17, v18, "callForExistingShareForFile url: %s", v21, 0xCu);
    swift_arrayDestroy();
    uint64_t v26 = v23;
    uint64_t v8 = v37;
    MEMORY[0x1C8776AC0](v26, -1, -1);
    uint64_t v27 = v21;
    a2 = v39;
    MEMORY[0x1C8776AC0](v27, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  id v28 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    uint64_t v29 = (void *)sub_1C38BCE38();
    uint64_t v30 = swift_allocObject();
    uint64_t v31 = v44;
    *(void *)(v30 + 16) = a2;
    *(void *)(v30 + 24) = v31;
    aBlock[4] = (uint64_t)sub_1C38B2464;
    aBlock[5] = v30;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38A838C;
    aBlock[3] = (uint64_t)&block_descriptor_84;
    uint64_t v32 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v28, sel_existingShareForFile_withReply_, v29, v32);
    _Block_release(v32);
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v33 = (uint64_t)v40;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v40, 1, 1, v12);
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    unint64_t v34 = v41;
    sub_1C38BCE18();
    uint64_t v35 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v34, v7);
    a2(v33, 0, v35);

    sub_1C38B2404(v33);
  }
}

uint64_t sub_1C38AFDA0(void *a1, uint64_t a2, uint64_t a3, const void *a4, void (*a5)(char *, void *))
{
  uint64_t v8 = sub_1C38BCE68();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a4);
  sub_1C38BCE58();
  _Block_copy(v12);
  id v13 = a1;
  a5(v11, v12);
  _Block_release(v12);
  _Block_release(v12);

  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

void sub_1C38AFEC4(uint64_t a1, void *a2, void (*a3)(void, void, void *), uint64_t a4)
{
  uint64_t v52 = a3;
  uint64_t v53 = a4;
  uint64_t aBlock[6] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v48 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C38BCDF8();
  uint64_t v49 = *(void *)(v8 - 8);
  uint64_t v50 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v47 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  id v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  uint64_t v16 = (char *)&v44 - v15;
  MEMORY[0x1F4188790](v14);
  os_log_type_t v18 = (char *)&v44 - v17;
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_1C38BCEC8();
  __swift_project_value_buffer(v19, (uint64_t)qword_1EC0276D8);
  uint64_t v51 = a1;
  sub_1C38BC21C(a1, (uint64_t)v18, &qword_1EC0276A8);
  uint64_t v20 = sub_1C38BCEA8();
  os_log_type_t v21 = sub_1C38BCFC8();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v46 = v13;
    uint64_t v24 = v23;
    aBlock[0] = v23;
    uint64_t v45 = a2;
    *(_DWORD *)uint64_t v22 = 136315138;
    sub_1C38BC21C((uint64_t)v18, (uint64_t)v16, &qword_1EC0276A8);
    uint64_t v25 = sub_1C38BCF18();
    uint64_t v54 = sub_1C38B1D20(v25, v26, aBlock);
    a2 = v45;
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    sub_1C38B2404((uint64_t)v18);
    _os_log_impl(&dword_1C38A4000, v20, v21, "callForUserNameAndEmail url: %s", v22, 0xCu);
    swift_arrayDestroy();
    uint64_t v27 = v24;
    id v13 = v46;
    MEMORY[0x1C8776AC0](v27, -1, -1);
    MEMORY[0x1C8776AC0](v22, -1, -1);
  }
  else
  {
    sub_1C38B2404((uint64_t)v18);
  }

  id v28 = a2;
  uint64_t v29 = sub_1C38BCEA8();
  os_log_type_t v30 = sub_1C38BCFC8();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 138412290;
    if (a2)
    {
      aBlock[0] = (uint64_t)v28;
      uint64_t v33 = v28;
    }
    else
    {
      aBlock[0] = 0;
    }
    sub_1C38BCFD8();
    *uint64_t v32 = a2;

    _os_log_impl(&dword_1C38A4000, v29, v30, "callForUserNameAndEmail containerSetupInfo: %@", v31, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v32, -1, -1);
    MEMORY[0x1C8776AC0](v31, -1, -1);
  }
  else
  {

    uint64_t v29 = v28;
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  unint64_t v34 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    sub_1C38BC21C(v51, (uint64_t)v13, &qword_1EC0276A8);
    uint64_t v35 = sub_1C38BCE68();
    uint64_t v36 = *(void *)(v35 - 8);
    int v37 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v36 + 48))(v13, 1, v35);
    swift_unknownObjectRetain();
    uint64_t v38 = 0;
    if (v37 != 1)
    {
      uint64_t v38 = (void *)sub_1C38BCE38();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v13, v35);
    }
    uint64_t v39 = swift_allocObject();
    uint64_t v40 = v53;
    *(void *)(v39 + 16) = v52;
    *(void *)(v39 + 24) = v40;
    aBlock[4] = (uint64_t)sub_1C38B25AC;
    aBlock[5] = v39;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38B05B0;
    aBlock[3] = (uint64_t)&block_descriptor_90;
    uint64_t v41 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v34, sel_userNameAndEmail_containerSetupInfo_withReply_, v38, v28, v41);
    _Block_release(v41);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    unint64_t v42 = v47;
    uint64_t v43 = v50;
    sub_1C38BCE18();
    uint64_t v38 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v49 + 8))(v42, v43);
    v52(0, 0, v38);
  }
}

void sub_1C38B05B0(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = *(void (**)(void *, void *, void *))(a1 + 32);
  swift_retain();
  id v10 = a2;
  id v8 = a3;
  id v9 = a4;
  v7(a2, a3, a4);
  swift_release();
}

void sub_1C38B07B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3) {
    uint64_t v7 = sub_1C38BCE28();
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a1, a2);
}

void sub_1C38B0838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void (*a7)(uint64_t, void, void *), uint64_t a8)
{
  int v79 = a7;
  uint64_t v80 = a8;
  int v78 = a6;
  uint64_t v82 = a5;
  uint64_t v76 = a4;
  uint64_t v11 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v72 = (char *)&v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1C38BCDF8();
  uint64_t v73 = *(void *)(v13 - 8);
  uint64_t v74 = v13;
  MEMORY[0x1F4188790](v13);
  uint64_t v71 = (char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v70 = (char *)&v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1C38BCE68();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_1C38BCEC8();
  uint64_t v22 = __swift_project_value_buffer(v21, (uint64_t)qword_1EC0276D8);
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  uint64_t v75 = a1;
  v23(v20, a1, v17);
  uint64_t v84 = v22;
  uint64_t v24 = sub_1C38BCEA8();
  os_log_type_t v25 = sub_1C38BCFC8();
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v83 = a3;
  uint64_t v81 = a2;
  uint64_t v69 = v17;
  uint64_t v77 = v18;
  if (v26)
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    aBlock[0] = v28;
    *(_DWORD *)uint64_t v27 = 136315138;
    sub_1C38B2378(&qword_1EA37F200, MEMORY[0x1E4F276F0]);
    uint64_t v29 = sub_1C38BD068();
    uint64_t v85 = sub_1C38B1D20(v29, v30, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    _os_log_impl(&dword_1C38A4000, v24, v25, "callForForciblyShareFolder folderURL: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v28, -1, -1);
    MEMORY[0x1C8776AC0](v27, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  }

  swift_bridgeObjectRetain_n();
  uint64_t v31 = sub_1C38BCEA8();
  os_log_type_t v32 = sub_1C38BCF98();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    aBlock[0] = v34;
    *(_DWORD *)uint64_t v33 = 136315138;
    uint64_t v35 = swift_bridgeObjectRetain();
    uint64_t v36 = MEMORY[0x1C8776510](v35, MEMORY[0x1E4FBB1A0]);
    unint64_t v38 = v37;
    swift_bridgeObjectRelease();
    uint64_t v85 = sub_1C38B1D20(v36, v38, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v31, v32, "callForForciblyShareFolder emailAddresses: %s", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v34, -1, -1);
    MEMORY[0x1C8776AC0](v33, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_1C38BCEA8();
  os_log_type_t v40 = sub_1C38BCF98();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = (uint8_t *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    aBlock[0] = v42;
    *(_DWORD *)uint64_t v41 = 136315138;
    uint64_t v43 = swift_bridgeObjectRetain();
    uint64_t v44 = MEMORY[0x1C8776510](v43, MEMORY[0x1E4FBB1A0]);
    unint64_t v46 = v45;
    swift_bridgeObjectRelease();
    uint64_t v85 = sub_1C38B1D20(v44, v46, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v39, v40, "callForForciblyShareFolder phoneNumbers: %s", v41, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v42, -1, -1);
    MEMORY[0x1C8776AC0](v41, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v47 = sub_1C38BCEA8();
  os_log_type_t v48 = sub_1C38BCF98();
  if (os_log_type_enabled(v47, v48))
  {
    uint64_t v49 = (uint8_t *)swift_slowAlloc();
    uint64_t v50 = swift_slowAlloc();
    *(_DWORD *)uint64_t v49 = 136315138;
    uint64_t v85 = v82;
    aBlock[0] = v50;
    type metadata accessor for ParticipantPermission(0);
    uint64_t v51 = sub_1C38BCF18();
    uint64_t v85 = sub_1C38B1D20(v51, v52, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v47, v48, "callForForciblyShareFolder permissionType: %s", v49, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v50, -1, -1);
    MEMORY[0x1C8776AC0](v49, -1, -1);
  }

  char v53 = v78;
  uint64_t v54 = v77;
  uint64_t v55 = sub_1C38BCEA8();
  os_log_type_t v56 = sub_1C38BCF98();
  if (os_log_type_enabled(v55, v56))
  {
    unint64_t v57 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v57 = 67109120;
    LODWORD(aBlock[0]) = v53 & 1;
    sub_1C38BCFD8();
    _os_log_impl(&dword_1C38A4000, v55, v56, "callForForciblyShareFolder allowOthersToInvite: %{BOOL}d", v57, 8u);
    MEMORY[0x1C8776AC0](v57, -1, -1);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  char v58 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    uint64_t v59 = (void *)sub_1C38BCE38();
    os_log_type_t v60 = (void *)sub_1C38BCF48();
    uint64_t v61 = (void *)sub_1C38BCF48();
    uint64_t v62 = swift_allocObject();
    uint64_t v63 = v80;
    *(void *)(v62 + 16) = v79;
    *(void *)(v62 + 24) = v63;
    aBlock[4] = (uint64_t)sub_1C38B2464;
    aBlock[5] = v62;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38A838C;
    aBlock[3] = (uint64_t)&block_descriptor_96;
    id v64 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v58, sel_forciblyShareFolder_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_withReply_, v59, v60, v61, v76, v82, v53 & 1, v64);
    _Block_release(v64);
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v65 = (uint64_t)v70;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v54 + 56))(v70, 1, 1, v69);
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    uint64_t v66 = v71;
    uint64_t v67 = v74;
    sub_1C38BCE18();
    uint64_t v68 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v73 + 8))(v66, v67);
    v79(v65, 0, v68);

    sub_1C38B2404(v65);
  }
}

uint64_t sub_1C38B12D8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, const void *a9, void (*a10)(char *, uint64_t, uint64_t, uint64_t, uint64_t, void, void *))
{
  unsigned int v22 = a8;
  uint64_t v21 = a7;
  uint64_t v12 = sub_1C38BCE68();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a9);
  sub_1C38BCE58();
  uint64_t v17 = sub_1C38BCF58();
  uint64_t v18 = sub_1C38BCF58();
  _Block_copy(v16);
  id v19 = a1;
  a10(v15, v17, v18, a6, v21, v22, v16);
  _Block_release(v16);
  _Block_release(v16);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

id InitiateSharing.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id InitiateSharing.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InitiateSharing();
  return objc_msgSendSuper2(&v2, sel_init);
}

id InitiateSharing.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InitiateSharing();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1C38B157C(uint64_t a1, uint64_t a2)
{
  return sub_1C38B16E8(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1C38B1594(uint64_t a1, id *a2)
{
  uint64_t result = sub_1C38BCEE8();
  *a2 = 0;
  return result;
}

uint64_t sub_1C38B160C(uint64_t a1, id *a2)
{
  char v3 = sub_1C38BCEF8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1C38B168C@<X0>(uint64_t *a1@<X8>)
{
  sub_1C38BCF08();
  uint64_t v2 = sub_1C38BCED8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1C38B16D0(uint64_t a1, uint64_t a2)
{
  return sub_1C38B16E8(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1C38B16E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1C38BCF08();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1C38B172C()
{
  sub_1C38BCF08();
  sub_1C38BCF28();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C38B1780()
{
  sub_1C38BCF08();
  sub_1C38BD088();
  sub_1C38BCF28();
  uint64_t v0 = sub_1C38BD098();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1C38B17F4()
{
  uint64_t v0 = sub_1C38BCF08();
  uint64_t v2 = v1;
  if (v0 == sub_1C38BCF08() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1C38BD078();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1C38B1880@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1C38BCED8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1C38B18C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C38BCF08();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1C38B18F4(uint64_t a1)
{
  uint64_t v2 = sub_1C38B2378(&qword_1EA37F240, type metadata accessor for URLResourceKey);
  uint64_t v3 = sub_1C38B2378(&qword_1EA37F248, type metadata accessor for URLResourceKey);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

unint64_t sub_1C38B19B0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA37F258);
  uint64_t v2 = sub_1C38BD038();
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
    sub_1C38BC21C(v6, (uint64_t)&v15, &qword_1EA37F260);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1C38B1B60(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1C38BC280(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_1C38B1AE8()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C38B1B20()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

unint64_t sub_1C38B1B60(uint64_t a1, uint64_t a2)
{
  sub_1C38BD088();
  sub_1C38BCF28();
  uint64_t v4 = sub_1C38BD098();

  return sub_1C38B1BD8(a1, a2, v4);
}

unint64_t sub_1C38B1BD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_1C38BD078() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_1C38BD078() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_1C38BD078()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_1C38B1D20(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1C38B1DF4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1C38BC1BC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1C38BC1BC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1C38B1DF4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1C38BCFE8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1C38B1FB0(a5, a6);
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
  uint64_t v8 = sub_1C38BD018();
  if (!v8)
  {
    sub_1C38BD028();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1C38BD048();
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

uint64_t sub_1C38B1FB0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1C38B2048(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1C38B2228(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1C38B2228(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C38B2048(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1C38B21C0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1C38BD008();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1C38BD028();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1C38BCF38();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1C38BD048();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1C38BD028();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1C38B21C0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA37F250);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1C38B2228(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA37F250);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
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
  uint64_t result = sub_1C38BD048();
  __break(1u);
  return result;
}

uint64_t sub_1C38B2378(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C38B2404(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void type metadata accessor for ParticipantPermission(uint64_t a1)
{
}

uint64_t sub_1C38B2480()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C38B24A8(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C38B2500(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C38B255C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C38B2584()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t type metadata accessor for InitiateSharing()
{
  return self;
}

uint64_t method lookup function for InitiateSharing(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for InitiateSharing);
}

uint64_t dispatch thunk of InitiateSharing.callForSharingStatus(_:reply:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x50))();
}

uint64_t dispatch thunk of InitiateSharing.callForFileSharing(_:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:reply:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of InitiateSharing.callForCloudKitAddToShare(_:containerSetupInfo:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:reply:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of InitiateSharing.callForSharingURLAddToShare(_:containerSetupInfo:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:reply:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of InitiateSharing.callForSharingURLRemoveShare(_:containerSetupInfo:reply:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of InitiateSharing.callForRemoveShare(_:containerSetupInfo:reply:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of InitiateSharing.callForFileURLRemoveShare(_:reply:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of InitiateSharing.callForMailContent(_:share:fileURL:appName:appIconData:reply:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of InitiateSharing.callForMetadataFromShareURL(_:containerSetupInfo:reply:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of InitiateSharing.callForUpdateShare(_:containerSetupInfo:reply:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of InitiateSharing.callForCurrentUserSharingStatus(_:reply:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of InitiateSharing.callForAddParticipantsToShare(_:containerSetupInfo:emailAddresses:phoneNumbers:reply:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of InitiateSharing.callForAddParticipantsToShareWithURLWrapper(_:share:emailAddresses:phoneNumbers:permissionType:allowOthersToInvite:reply:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of InitiateSharing.callForAddParticipantsToShare(_:containerSetupInfo:emailAddresses:phoneNumbers:permissionType:allowOthersToInvite:reply:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of InitiateSharing.callForExistingShareForFile(_:reply:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of InitiateSharing.callForUserNameAndEmail(_:containerSetupInfo:reply:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of InitiateSharing.callForForciblyShareFolder(_:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:reply:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

void type metadata accessor for CSUICurrentUserCKShareStatus(uint64_t a1)
{
}

void type metadata accessor for CSUIShareItemStatus(uint64_t a1)
{
}

void sub_1C38B29B4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1C38B29FC()
{
  return sub_1C38B2378(&qword_1EA37F228, type metadata accessor for URLResourceKey);
}

uint64_t sub_1C38B2A44()
{
  return sub_1C38B2378(&qword_1EA37F230, type metadata accessor for URLResourceKey);
}

uint64_t sub_1C38B2A8C()
{
  return sub_1C38B2378(&qword_1EA37F238, type metadata accessor for URLResourceKey);
}

void sub_1C38B2AD4(uint64_t a1, void (**a2)(void, void, void))
{
  sub_1C38BCDE8();
  MEMORY[0x1F4188790]();
  size_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1C38BCDF8();
  uint64_t v36 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v35 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C38BCE68();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790]();
  size_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  _Block_copy(a2);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_1C38BCEC8();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EC0276D8);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v37 = a1;
  v14(v11, a1, v8);
  uint64_t v15 = sub_1C38BCEA8();
  os_log_type_t v16 = sub_1C38BCFC8();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v32 = v6;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v33 = a2;
    uint64_t v20 = v19;
    aBlock[0] = v19;
    uint64_t v34 = v12;
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v31 = v5;
    sub_1C38B2378(&qword_1EA37F200, MEMORY[0x1E4F276F0]);
    uint64_t v21 = sub_1C38BD068();
    uint64_t v38 = sub_1C38B1D20(v21, v22, aBlock);
    uint64_t v12 = v34;
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    _os_log_impl(&dword_1C38A4000, v15, v16, "callForSharingStatus url: %s", v18, 0xCu);
    swift_arrayDestroy();
    uint64_t v23 = v20;
    a2 = v33;
    MEMORY[0x1C8776AC0](v23, -1, -1);
    uint64_t v24 = v18;
    uint64_t v6 = v32;
    MEMORY[0x1C8776AC0](v24, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  os_log_type_t v25 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    BOOL v26 = (void *)sub_1C38BCE38();
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = sub_1C38BC150;
    *(void *)(v27 + 24) = v12;
    aBlock[4] = (uint64_t)sub_1C38BC2A4;
    aBlock[5] = v27;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38A7828;
    aBlock[3] = (uint64_t)&block_descriptor_280;
    uint64_t v28 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v25, sel_sharingStatusFor_withReply_, v26, v28);
    _Block_release(v28);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    uint64_t v29 = v35;
    sub_1C38BCE18();
    unint64_t v30 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v29, v6);
    BOOL v26 = (void *)sub_1C38BCE28();
    ((void (**)(void, void, void *))a2)[2](a2, 0, v26);
    swift_release();
  }
}

void sub_1C38B3058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void (**a7)(const void *, void *, void, void *))
{
  int v95 = a6;
  uint64_t v96 = a4;
  uint64_t v97 = a5;
  sub_1C38BCDE8();
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v87 = (char *)&v83 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_1C38BCDF8();
  uint64_t v88 = *(void *)(v90 - 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v85 = (char *)&v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  uint64_t v13 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v15 = (char *)&v83 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v91 = (char *)&v83 - v16;
  uint64_t v17 = sub_1C38BCE68();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v83 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = swift_allocObject();
  *(void *)(v93 + 16) = a7;
  uint64_t v84 = a7;
  _Block_copy(a7);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_1C38BCEC8();
  uint64_t v22 = __swift_project_value_buffer(v21, (uint64_t)qword_1EC0276D8);
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  uint64_t v92 = a1;
  v23(v20, a1, v17);
  uint64_t v100 = v22;
  uint64_t v24 = sub_1C38BCEA8();
  os_log_type_t v25 = sub_1C38BCFC8();
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v98 = a2;
  uint64_t v99 = a3;
  uint64_t v89 = v15;
  if (v26)
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    aBlock[0] = v28;
    *(_DWORD *)uint64_t v27 = 136315138;
    sub_1C38B2378(&qword_1EA37F200, MEMORY[0x1E4F276F0]);
    uint64_t v29 = sub_1C38BD068();
    uint64_t v101 = sub_1C38B1D20(v29, v30, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    uint64_t v83 = *(void (**)(char *, uint64_t))(v18 + 8);
    v83(v20, v17);
    _os_log_impl(&dword_1C38A4000, v24, v25, "callForFileSharing url: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v28, -1, -1);
    MEMORY[0x1C8776AC0](v27, -1, -1);
  }
  else
  {
    uint64_t v83 = *(void (**)(char *, uint64_t))(v18 + 8);
    v83(v20, v17);
  }

  swift_bridgeObjectRetain_n();
  uint64_t v31 = sub_1C38BCEA8();
  os_log_type_t v32 = sub_1C38BCF98();
  BOOL v33 = os_log_type_enabled(v31, v32);
  uint64_t v94 = v18;
  if (v33)
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    aBlock[0] = v35;
    *(_DWORD *)uint64_t v34 = 136315138;
    uint64_t v36 = swift_bridgeObjectRetain();
    uint64_t v37 = MEMORY[0x1C8776510](v36, MEMORY[0x1E4FBB1A0]);
    unint64_t v39 = v38;
    swift_bridgeObjectRelease();
    uint64_t v101 = sub_1C38B1D20(v37, v39, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v31, v32, "callForFileSharing emailAddresses: %s", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v35, -1, -1);
    MEMORY[0x1C8776AC0](v34, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  os_log_type_t v40 = sub_1C38BCEA8();
  os_log_type_t v41 = sub_1C38BCF98();
  BOOL v42 = os_log_type_enabled(v40, v41);
  uint64_t v86 = v17;
  if (v42)
  {
    uint64_t v43 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    aBlock[0] = v44;
    *(_DWORD *)uint64_t v43 = 136315138;
    uint64_t v45 = swift_bridgeObjectRetain();
    uint64_t v46 = MEMORY[0x1C8776510](v45, MEMORY[0x1E4FBB1A0]);
    unint64_t v48 = v47;
    swift_bridgeObjectRelease();
    uint64_t v101 = sub_1C38B1D20(v46, v48, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v40, v41, "callForFileSharing phoneNumbers: %s", v43, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v44, -1, -1);
    MEMORY[0x1C8776AC0](v43, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v49 = v94;
  uint64_t v50 = sub_1C38BCEA8();
  os_log_type_t v51 = sub_1C38BCF98();
  if (os_log_type_enabled(v50, v51))
  {
    unint64_t v52 = (uint8_t *)swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    *(_DWORD *)unint64_t v52 = 136315138;
    uint64_t v101 = v96;
    aBlock[0] = v53;
    type metadata accessor for ParticipantPermission(0);
    uint64_t v54 = sub_1C38BCF18();
    uint64_t v101 = sub_1C38B1D20(v54, v55, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v50, v51, "callForFileSharing accessType: %s", v52, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v53, -1, -1);
    MEMORY[0x1C8776AC0](v52, -1, -1);
  }

  os_log_type_t v56 = sub_1C38BCEA8();
  os_log_type_t v57 = sub_1C38BCF98();
  if (os_log_type_enabled(v56, v57))
  {
    char v58 = (uint8_t *)swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    *(_DWORD *)char v58 = 136315138;
    uint64_t v101 = v97;
    aBlock[0] = v59;
    type metadata accessor for ParticipantPermission(0);
    uint64_t v60 = sub_1C38BCF18();
    uint64_t v101 = sub_1C38B1D20(v60, v61, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v56, v57, "callForFileSharing permissionType: %s", v58, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v59, -1, -1);
    MEMORY[0x1C8776AC0](v58, -1, -1);
  }

  uint64_t v62 = sub_1C38BCEA8();
  os_log_type_t v63 = sub_1C38BCF98();
  BOOL v64 = os_log_type_enabled(v62, v63);
  char v65 = v95;
  if (v64)
  {
    uint64_t v66 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v66 = 67109120;
    LODWORD(aBlock[0]) = v65 & 1;
    sub_1C38BCFD8();
    _os_log_impl(&dword_1C38A4000, v62, v63, "callForFileSharing allowOthersToInvite: %{BOOL}d", v66, 8u);
    MEMORY[0x1C8776AC0](v66, -1, -1);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  uint64_t v67 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    uint64_t v68 = (void *)sub_1C38BCE38();
    uint64_t v69 = (void *)sub_1C38BCF48();
    uint64_t v70 = (void *)sub_1C38BCF48();
    uint64_t v71 = swift_allocObject();
    uint64_t v72 = v93;
    *(void *)(v71 + 16) = sub_1C38BC47C;
    *(void *)(v71 + 24) = v72;
    aBlock[4] = (uint64_t)sub_1C38B2464;
    aBlock[5] = v71;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38A838C;
    aBlock[3] = (uint64_t)&block_descriptor_270;
    uint64_t v73 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v67, sel_startFileSharing_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_withReply_, v68, v69, v70, v96, v97, v65 & 1, v73);
    _Block_release(v73);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v74 = (uint64_t)v91;
    uint64_t v75 = v86;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v49 + 56))(v91, 1, 1, v86);
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    uint64_t v76 = v85;
    uint64_t v77 = v90;
    sub_1C38BCE18();
    int v78 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v88 + 8))(v76, v77);
    uint64_t v79 = (uint64_t)v89;
    sub_1C38BC21C(v74, (uint64_t)v89, &qword_1EC0276A8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v49 + 48))(v79, 1, v75) == 1)
    {
      uint64_t v80 = 0;
    }
    else
    {
      uint64_t v80 = (void *)sub_1C38BCE38();
      v83((char *)v79, v75);
    }
    uint64_t v81 = v84;
    uint64_t v82 = (void *)sub_1C38BCE28();
    v81[2](v81, v80, 0, v82);

    sub_1C38B2404(v74);
    swift_release();
  }
}

void sub_1C38B3CDC(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, void (**a8)(const void *, void *, void, void *))
{
  int v93 = a7;
  uint64_t v95 = a5;
  uint64_t v96 = a6;
  uint64_t v97 = a3;
  uint64_t v12 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v12 - 8);
  v85[1] = (char *)v85 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1C38BCDF8();
  uint64_t v86 = *(void *)(v14 - 8);
  uint64_t v87 = v14;
  MEMORY[0x1F4188790](v14);
  v85[0] = (char *)v85 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  uint64_t v17 = MEMORY[0x1F4188790](v16 - 8);
  uint64_t v88 = (uint64_t)v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v89 = (char *)v85 - v19;
  uint64_t v94 = swift_allocObject();
  *(void *)(v94 + 16) = a8;
  uint64_t v90 = a8;
  _Block_copy(a8);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_1C38BCEC8();
  uint64_t v21 = __swift_project_value_buffer(v20, (uint64_t)qword_1EC0276D8);
  id v22 = a1;
  uint64_t v99 = v21;
  uint64_t v23 = sub_1C38BCEA8();
  os_log_type_t v24 = sub_1C38BCFC8();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v98 = a4;
  id v92 = v22;
  if (v25)
  {
    BOOL v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = (void *)swift_slowAlloc();
    *(_DWORD *)BOOL v26 = 138412290;
    aBlock[0] = (uint64_t)v22;
    id v28 = v22;
    sub_1C38BCFD8();
    *uint64_t v27 = v22;

    _os_log_impl(&dword_1C38A4000, v23, v24, "callForCloudKitAddToShare share: %@", v26, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v27, -1, -1);
    MEMORY[0x1C8776AC0](v26, -1, -1);
  }
  else
  {
  }
  uint64_t v29 = a2;
  unint64_t v30 = sub_1C38BCEA8();
  os_log_type_t v31 = sub_1C38BCFC8();
  BOOL v32 = os_log_type_enabled(v30, v31);
  uint64_t v91 = v29;
  if (v32)
  {
    BOOL v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = (void *)swift_slowAlloc();
    *(_DWORD *)BOOL v33 = 138412290;
    aBlock[0] = (uint64_t)v29;
    uint64_t v35 = v29;
    sub_1C38BCFD8();
    void *v34 = v29;

    _os_log_impl(&dword_1C38A4000, v30, v31, "callForCloudKitAddToShare containerSetupInfo: %@", v33, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v34, -1, -1);
    MEMORY[0x1C8776AC0](v33, -1, -1);
  }
  else
  {

    unint64_t v30 = v29;
  }

  swift_bridgeObjectRetain_n();
  uint64_t v36 = sub_1C38BCEA8();
  os_log_type_t v37 = sub_1C38BCF98();
  if (os_log_type_enabled(v36, v37))
  {
    unint64_t v38 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    aBlock[0] = v39;
    *(_DWORD *)unint64_t v38 = 136315138;
    uint64_t v40 = swift_bridgeObjectRetain();
    uint64_t v41 = MEMORY[0x1C8776510](v40, MEMORY[0x1E4FBB1A0]);
    unint64_t v43 = v42;
    swift_bridgeObjectRelease();
    uint64_t v100 = sub_1C38B1D20(v41, v43, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v36, v37, "callForCloudKitAddToShare emailAddresses: %s", v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v39, -1, -1);
    MEMORY[0x1C8776AC0](v38, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v44 = sub_1C38BCEA8();
  os_log_type_t v45 = sub_1C38BCF98();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    aBlock[0] = v47;
    *(_DWORD *)uint64_t v46 = 136315138;
    uint64_t v48 = swift_bridgeObjectRetain();
    uint64_t v49 = MEMORY[0x1C8776510](v48, MEMORY[0x1E4FBB1A0]);
    unint64_t v51 = v50;
    swift_bridgeObjectRelease();
    uint64_t v100 = sub_1C38B1D20(v49, v51, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v44, v45, "callForCloudKitAddToShare phoneNumbers: %s", v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v47, -1, -1);
    MEMORY[0x1C8776AC0](v46, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  unint64_t v52 = sub_1C38BCEA8();
  os_log_type_t v53 = sub_1C38BCF98();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = (uint8_t *)swift_slowAlloc();
    uint64_t v55 = swift_slowAlloc();
    *(_DWORD *)uint64_t v54 = 136315138;
    uint64_t v100 = v95;
    aBlock[0] = v55;
    type metadata accessor for ParticipantPermission(0);
    uint64_t v56 = sub_1C38BCF18();
    uint64_t v100 = sub_1C38B1D20(v56, v57, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v52, v53, "callForCloudKitAddToShare accessType: %s", v54, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v55, -1, -1);
    MEMORY[0x1C8776AC0](v54, -1, -1);
  }

  char v58 = sub_1C38BCEA8();
  os_log_type_t v59 = sub_1C38BCF98();
  if (os_log_type_enabled(v58, v59))
  {
    uint64_t v60 = (uint8_t *)swift_slowAlloc();
    uint64_t v61 = swift_slowAlloc();
    *(_DWORD *)uint64_t v60 = 136315138;
    uint64_t v100 = v96;
    aBlock[0] = v61;
    type metadata accessor for ParticipantPermission(0);
    uint64_t v62 = sub_1C38BCF18();
    uint64_t v100 = sub_1C38B1D20(v62, v63, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v58, v59, "callForCloudKitAddToShare permissionType: %s", v60, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v61, -1, -1);
    MEMORY[0x1C8776AC0](v60, -1, -1);
  }

  BOOL v64 = sub_1C38BCEA8();
  os_log_type_t v65 = sub_1C38BCF98();
  BOOL v66 = os_log_type_enabled(v64, v65);
  char v67 = v93;
  if (v66)
  {
    uint64_t v68 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v68 = 67109120;
    LODWORD(aBlock[0]) = v67 & 1;
    sub_1C38BCFD8();
    _os_log_impl(&dword_1C38A4000, v64, v65, "callForCloudKitAddToShare allowOthersToInvite: %{BOOL}d", v68, 8u);
    MEMORY[0x1C8776AC0](v68, -1, -1);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  uint64_t v69 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    uint64_t v70 = (void *)sub_1C38BCF48();
    uint64_t v71 = (void *)sub_1C38BCF48();
    uint64_t v72 = swift_allocObject();
    uint64_t v73 = v94;
    *(void *)(v72 + 16) = sub_1C38BC47C;
    *(void *)(v72 + 24) = v73;
    aBlock[4] = (uint64_t)sub_1C38B2464;
    aBlock[5] = v72;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38A838C;
    aBlock[3] = (uint64_t)&block_descriptor_259;
    uint64_t v74 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    LOBYTE(v84) = v67 & 1;
    objc_msgSend(v69, sel_addToCloudKitSharing_containerSetupInfo_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_withReply_, v92, v91, v70, v71, v95, v96, v84, v74);
    _Block_release(v74);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v75 = sub_1C38BCE68();
    uint64_t v76 = *(void *)(v75 - 8);
    uint64_t v77 = (uint64_t)v89;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v76 + 56))(v89, 1, 1, v75);
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    uint64_t v78 = v85[0];
    uint64_t v79 = v87;
    sub_1C38BCE18();
    uint64_t v80 = (void *)sub_1C38BCDC8();
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v78, v79);
    uint64_t v81 = v88;
    sub_1C38BC21C(v77, v88, &qword_1EC0276A8);
    uint64_t v82 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v76 + 48))(v81, 1, v75) != 1)
    {
      uint64_t v82 = (void *)sub_1C38BCE38();
      (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v81, v75);
    }
    uint64_t v83 = (void *)sub_1C38BCE28();
    v90[2](v90, v82, 0, v83);

    sub_1C38B2404(v77);
    swift_release();
  }
}

void sub_1C38B4994(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, const void *a8)
{
  uint64_t v93 = a6;
  uint64_t v94 = a5;
  uint64_t v95 = a3;
  uint64_t v96 = a4;
  uint64_t v12 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v85 = (char *)v83 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1C38BCDF8();
  uint64_t v86 = *(void *)(v14 - 8);
  uint64_t v87 = v14;
  MEMORY[0x1F4188790](v14);
  uint64_t v84 = (char *)v83 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1C38BCE68();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)v83 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = swift_allocObject();
  *(void *)(v92 + 16) = a8;
  uint64_t v88 = a8;
  _Block_copy(a8);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_1C38BCEC8();
  uint64_t v21 = __swift_project_value_buffer(v20, (uint64_t)qword_1EC0276D8);
  id v22 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  uint64_t v90 = a1;
  v22(v19, a1, v16);
  uint64_t v23 = sub_1C38BCEA8();
  os_log_type_t v24 = sub_1C38BCFC8();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v97 = v21;
  int v91 = a7;
  if (v25)
  {
    BOOL v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v89 = a2;
    uint64_t v28 = v27;
    aBlock[0] = v27;
    *(_DWORD *)BOOL v26 = 136315138;
    v83[1] = v26 + 4;
    sub_1C38B2378(&qword_1EA37F200, MEMORY[0x1E4F276F0]);
    uint64_t v29 = sub_1C38BD068();
    uint64_t v98 = sub_1C38B1D20(v29, v30, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    _os_log_impl(&dword_1C38A4000, v23, v24, "callForSharingURLAddToShare sharingURL: %s", v26, 0xCu);
    swift_arrayDestroy();
    uint64_t v31 = v28;
    a2 = v89;
    MEMORY[0x1C8776AC0](v31, -1, -1);
    MEMORY[0x1C8776AC0](v26, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }

  BOOL v32 = a2;
  BOOL v33 = sub_1C38BCEA8();
  os_log_type_t v34 = sub_1C38BCFC8();
  BOOL v35 = os_log_type_enabled(v33, v34);
  uint64_t v89 = v32;
  if (v35)
  {
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v37 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v36 = 138412290;
    aBlock[0] = (uint64_t)v32;
    unint64_t v38 = v32;
    uint64_t v39 = v32;
    sub_1C38BCFD8();
    *os_log_type_t v37 = v38;

    _os_log_impl(&dword_1C38A4000, v33, v34, "callForSharingURLAddToShare containerSetupInfo: %@", v36, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v37, -1, -1);
    MEMORY[0x1C8776AC0](v36, -1, -1);
  }
  else
  {

    BOOL v33 = v32;
  }

  swift_bridgeObjectRetain_n();
  uint64_t v40 = sub_1C38BCEA8();
  os_log_type_t v41 = sub_1C38BCF98();
  if (os_log_type_enabled(v40, v41))
  {
    unint64_t v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    aBlock[0] = v43;
    *(_DWORD *)unint64_t v42 = 136315138;
    uint64_t v44 = swift_bridgeObjectRetain();
    uint64_t v45 = MEMORY[0x1C8776510](v44, MEMORY[0x1E4FBB1A0]);
    unint64_t v47 = v46;
    swift_bridgeObjectRelease();
    uint64_t v98 = sub_1C38B1D20(v45, v47, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v40, v41, "callForSharingURLAddToShare emailAddresses: %s", v42, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v43, -1, -1);
    MEMORY[0x1C8776AC0](v42, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v48 = sub_1C38BCEA8();
  os_log_type_t v49 = sub_1C38BCF98();
  if (os_log_type_enabled(v48, v49))
  {
    unint64_t v50 = (uint8_t *)swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    aBlock[0] = v51;
    *(_DWORD *)unint64_t v50 = 136315138;
    uint64_t v52 = swift_bridgeObjectRetain();
    uint64_t v53 = MEMORY[0x1C8776510](v52, MEMORY[0x1E4FBB1A0]);
    unint64_t v55 = v54;
    swift_bridgeObjectRelease();
    uint64_t v98 = sub_1C38B1D20(v53, v55, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v48, v49, "callForSharingURLAddToShare phoneNumbers: %s", v50, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v51, -1, -1);
    MEMORY[0x1C8776AC0](v50, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v56 = v93;
  unint64_t v57 = sub_1C38BCEA8();
  os_log_type_t v58 = sub_1C38BCF98();
  if (os_log_type_enabled(v57, v58))
  {
    os_log_type_t v59 = (uint8_t *)swift_slowAlloc();
    uint64_t v60 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v59 = 136315138;
    uint64_t v98 = v94;
    aBlock[0] = v60;
    type metadata accessor for ParticipantPermission(0);
    uint64_t v61 = sub_1C38BCF18();
    uint64_t v98 = sub_1C38B1D20(v61, v62, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v57, v58, "callForSharingURLAddToShare accessType: %s", v59, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v60, -1, -1);
    MEMORY[0x1C8776AC0](v59, -1, -1);
  }

  unint64_t v63 = sub_1C38BCEA8();
  os_log_type_t v64 = sub_1C38BCF98();
  if (os_log_type_enabled(v63, v64))
  {
    os_log_type_t v65 = (uint8_t *)swift_slowAlloc();
    uint64_t v66 = swift_slowAlloc();
    uint64_t v98 = v56;
    aBlock[0] = v66;
    *(_DWORD *)os_log_type_t v65 = 136315138;
    type metadata accessor for ParticipantPermission(0);
    uint64_t v67 = sub_1C38BCF18();
    uint64_t v98 = sub_1C38B1D20(v67, v68, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v63, v64, "callForSharingURLAddToShare permissionType: %s", v65, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v66, -1, -1);
    MEMORY[0x1C8776AC0](v65, -1, -1);
  }

  char v69 = v91;
  uint64_t v70 = sub_1C38BCEA8();
  os_log_type_t v71 = sub_1C38BCF98();
  if (os_log_type_enabled(v70, v71))
  {
    uint64_t v72 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v72 = 67109120;
    LODWORD(aBlock[0]) = v69 & 1;
    sub_1C38BCFD8();
    _os_log_impl(&dword_1C38A4000, v70, v71, "callForSharingURLAddToShare allowOthersToInvite: %{BOOL}d", v72, 8u);
    MEMORY[0x1C8776AC0](v72, -1, -1);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  uint64_t v73 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    uint64_t v74 = (void *)sub_1C38BCE38();
    uint64_t v75 = (void *)sub_1C38BCF48();
    uint64_t v76 = (void *)sub_1C38BCF48();
    uint64_t v77 = swift_allocObject();
    uint64_t v78 = v92;
    *(void *)(v77 + 16) = sub_1C38BC0F8;
    *(void *)(v77 + 24) = v78;
    aBlock[4] = (uint64_t)sub_1C38B247C;
    aBlock[5] = v77;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38A9F30;
    aBlock[3] = (uint64_t)&block_descriptor_248;
    uint64_t v79 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    LOBYTE(v82) = v69 & 1;
    objc_msgSend(v73, sel_addToShareFromSharingURL_containerSetupInfo_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_withReply_, v74, v89, v75, v76, v94, v56, v82, v79);
    _Block_release(v79);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    uint64_t v80 = v84;
    uint64_t v81 = v87;
    sub_1C38BCE18();
    uint64_t v75 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v86 + 8))(v80, v81);
    uint64_t v76 = (void *)sub_1C38BCE28();
    (*((void (**)(const void *, void, void, void *))v88 + 2))(v88, 0, 0, v76);
    swift_release();
  }
}

void sub_1C38B55E8(uint64_t a1, void *a2, void (**a3)(const void *, void, void *))
{
  id v47 = a2;
  uint64_t aBlock[6] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v5 - 8);
  unint64_t v42 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C38BCDF8();
  uint64_t v43 = *(void *)(v7 - 8);
  uint64_t v44 = v7;
  MEMORY[0x1F4188790](v7);
  os_log_type_t v41 = (char *)v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C38BCE68();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  uint64_t v45 = a3;
  _Block_copy(a3);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1C38BCEC8();
  uint64_t v15 = __swift_project_value_buffer(v14, (uint64_t)qword_1EC0276D8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  uint64_t v16 = sub_1C38BCEA8();
  os_log_type_t v17 = sub_1C38BCFC8();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v46 = a1;
  if (v18)
  {
    v39[1] = v15;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v40 = v13;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    aBlock[0] = v21;
    *(_DWORD *)uint64_t v20 = 136315138;
    v39[0] = v20 + 4;
    sub_1C38B2378(&qword_1EA37F200, MEMORY[0x1E4F276F0]);
    uint64_t v22 = sub_1C38BD068();
    uint64_t v48 = sub_1C38B1D20(v22, v23, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    _os_log_impl(&dword_1C38A4000, v16, v17, "callForSharingURLRemoveShare sharingURL: %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v21, -1, -1);
    os_log_type_t v24 = v20;
    uint64_t v13 = v40;
    MEMORY[0x1C8776AC0](v24, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }

  id v25 = v47;
  BOOL v26 = v47;
  uint64_t v27 = sub_1C38BCEA8();
  os_log_type_t v28 = sub_1C38BCFC8();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    unint64_t v30 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 138412290;
    if (v25)
    {
      aBlock[0] = (uint64_t)v26;
      uint64_t v31 = v26;
    }
    else
    {
      aBlock[0] = 0;
    }
    sub_1C38BCFD8();
    *unint64_t v30 = v25;

    _os_log_impl(&dword_1C38A4000, v27, v28, "callForSharingURLRemoveShare containerSetupInfo: %@", v29, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v30, -1, -1);
    MEMORY[0x1C8776AC0](v29, -1, -1);
  }
  else
  {

    uint64_t v27 = v26;
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  BOOL v32 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    BOOL v33 = (void *)sub_1C38BCE38();
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 16) = sub_1C38BC290;
    *(void *)(v34 + 24) = v13;
    aBlock[4] = (uint64_t)sub_1C38BC298;
    aBlock[5] = v34;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38AA850;
    aBlock[3] = (uint64_t)&block_descriptor_238;
    BOOL v35 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v32, sel_removeFromShareFromSharingURL_containerSetupInfo_withReply_, v33, v26, v35);
    _Block_release(v35);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    uint64_t v36 = v41;
    uint64_t v37 = v44;
    sub_1C38BCE18();
    unint64_t v38 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v36, v37);
    BOOL v33 = (void *)sub_1C38BCE28();
    v45[2](v45, 0, v33);
    swift_release();
  }
}

void sub_1C38B5CC0(void *a1, void *a2, void (**a3)(const void *, void, void *))
{
  uint64_t aBlock[6] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v36 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C38BCDF8();
  uint64_t v37 = *(void *)(v8 - 8);
  uint64_t v38 = v8;
  MEMORY[0x1F4188790](v8);
  BOOL v35 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = swift_allocObject();
  uint64_t v39 = a3;
  uint64_t v40 = v10;
  *(void *)(v10 + 16) = a3;
  _Block_copy(a3);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1C38BCEC8();
  __swift_project_value_buffer(v11, (uint64_t)qword_1EC0276D8);
  id v12 = a1;
  uint64_t v13 = sub_1C38BCEA8();
  os_log_type_t v14 = sub_1C38BCFC8();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v34 = a2;
    os_log_type_t v17 = (void *)v16;
    *(_DWORD *)uint64_t v15 = 138412290;
    aBlock[0] = v12;
    id v18 = v12;
    sub_1C38BCFD8();
    *os_log_type_t v17 = v12;

    _os_log_impl(&dword_1C38A4000, v13, v14, "callForRemoveShare share: %@", v15, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    uint64_t v19 = v17;
    a2 = v34;
    MEMORY[0x1C8776AC0](v19, -1, -1);
    MEMORY[0x1C8776AC0](v15, -1, -1);
  }
  else
  {
  }
  uint64_t v20 = a2;
  uint64_t v21 = sub_1C38BCEA8();
  os_log_type_t v22 = sub_1C38BCFC8();
  if (os_log_type_enabled(v21, v22))
  {
    unint64_t v23 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v24 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v23 = 138412290;
    if (a2)
    {
      aBlock[0] = v20;
      id v25 = v20;
    }
    else
    {
      aBlock[0] = 0;
    }
    sub_1C38BCFD8();
    void *v24 = a2;

    _os_log_impl(&dword_1C38A4000, v21, v22, "callForRemoveShare containerSetupInfo: %@", v23, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v24, -1, -1);
    MEMORY[0x1C8776AC0](v23, -1, -1);
  }
  else
  {

    uint64_t v21 = v20;
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  BOOL v26 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    uint64_t v27 = swift_allocObject();
    uint64_t v28 = v40;
    *(void *)(v27 + 16) = sub_1C38BC290;
    *(void *)(v27 + 24) = v28;
    aBlock[4] = sub_1C38BC298;
    aBlock[5] = v27;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C38AA850;
    aBlock[3] = &block_descriptor_227;
    uint64_t v29 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v26, sel_removeFromShare_containerSetupInfo_withReply_, v12, v20, v29);
    _Block_release(v29);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    unint64_t v30 = v35;
    uint64_t v31 = v38;
    sub_1C38BCE18();
    BOOL v32 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v30, v31);
    BOOL v33 = (void *)sub_1C38BCE28();
    v39[2](v39, 0, v33);
    swift_release();
  }
}

void sub_1C38B6294(uint64_t a1, void (**a2)(void, void, void))
{
  uint64_t v4 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C38BCDF8();
  uint64_t v37 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v36 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C38BCE68();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  id v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  _Block_copy(a2);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1C38BCEC8();
  __swift_project_value_buffer(v14, (uint64_t)qword_1EC0276D8);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v38 = a1;
  v15(v12, a1, v9);
  uint64_t v16 = sub_1C38BCEA8();
  os_log_type_t v17 = sub_1C38BCFC8();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v33 = v7;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v34 = a2;
    uint64_t v21 = v20;
    aBlock[0] = v20;
    uint64_t v35 = v13;
    *(_DWORD *)uint64_t v19 = 136315138;
    BOOL v32 = v6;
    sub_1C38B2378(&qword_1EA37F200, MEMORY[0x1E4F276F0]);
    uint64_t v22 = sub_1C38BD068();
    uint64_t v39 = sub_1C38B1D20(v22, v23, aBlock);
    uint64_t v13 = v35;
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    _os_log_impl(&dword_1C38A4000, v16, v17, "callForFileURLRemoveShare url: %s", v19, 0xCu);
    swift_arrayDestroy();
    uint64_t v24 = v21;
    a2 = v34;
    MEMORY[0x1C8776AC0](v24, -1, -1);
    id v25 = v19;
    uint64_t v7 = v33;
    MEMORY[0x1C8776AC0](v25, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  BOOL v26 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    uint64_t v27 = (void *)sub_1C38BCE38();
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = sub_1C38BC0F0;
    *(void *)(v28 + 24) = v13;
    aBlock[4] = (uint64_t)sub_1C38BC298;
    aBlock[5] = v28;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38AA850;
    aBlock[3] = (uint64_t)&block_descriptor_216;
    uint64_t v29 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v26, sel_removeFromShareForFileURL_withReply_, v27, v29);
    _Block_release(v29);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    unint64_t v30 = v36;
    sub_1C38BCE18();
    uint64_t v31 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v30, v7);
    uint64_t v27 = (void *)sub_1C38BCE28();
    ((void (**)(void, void, void *))a2)[2](a2, 0, v27);
    swift_release();
  }
}

void sub_1C38B6818(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, const void *a8)
{
  uint64_t v85 = a6;
  uint64_t v89 = a4;
  uint64_t v91 = a3;
  uint64_t v82 = a2;
  uint64_t v12 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v74 = (char *)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_1C38BCDF8();
  uint64_t v75 = *(void *)(v76 - 8);
  MEMORY[0x1F4188790](v76);
  uint64_t v73 = (char *)&v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  uint64_t v15 = MEMORY[0x1F4188790](v79);
  uint64_t v80 = (uint64_t)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v78 = (uint64_t)&v72 - v18;
  MEMORY[0x1F4188790](v17);
  uint64_t v83 = (char *)&v72 - v19;
  uint64_t v20 = sub_1C38BCE68();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  unint64_t v23 = (char *)&v72 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = swift_allocObject();
  *(void *)(v87 + 16) = a8;
  uint64_t v77 = a8;
  _Block_copy(a8);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_1C38BCEC8();
  __swift_project_value_buffer(v24, (uint64_t)qword_1EC0276D8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v23, a1, v20);
  id v25 = sub_1C38BCEA8();
  os_log_type_t v26 = sub_1C38BCFC8();
  BOOL v27 = os_log_type_enabled(v25, v26);
  unint64_t v90 = a5;
  uint64_t v88 = v21;
  unint64_t v86 = a7;
  uint64_t v81 = a1;
  uint64_t v84 = v20;
  if (v27)
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    aBlock[0] = v29;
    *(_DWORD *)uint64_t v28 = 136315138;
    sub_1C38B2378(&qword_1EA37F200, MEMORY[0x1E4F276F0]);
    uint64_t v30 = sub_1C38BD068();
    uint64_t v92 = sub_1C38B1D20(v30, v31, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    uint64_t v72 = *(void (**)(char *, uint64_t))(v88 + 8);
    v72(v23, v20);
    _os_log_impl(&dword_1C38A4000, v25, v26, "callForMailContent sharingURL: %s", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v29, -1, -1);
    MEMORY[0x1C8776AC0](v28, -1, -1);
  }
  else
  {
    uint64_t v72 = *(void (**)(char *, uint64_t))(v21 + 8);
    v72(v23, v20);
  }

  BOOL v32 = v82;
  uint64_t v33 = sub_1C38BCEA8();
  os_log_type_t v34 = sub_1C38BCFC8();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v35 = 138412290;
    aBlock[0] = (uint64_t)v32;
    uint64_t v37 = v32;
    sub_1C38BCFD8();
    *uint64_t v36 = v32;

    _os_log_impl(&dword_1C38A4000, v33, v34, "callForMailContent share: %@", v35, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v36, -1, -1);
    MEMORY[0x1C8776AC0](v35, -1, -1);
  }
  else
  {

    uint64_t v33 = v32;
  }
  uint64_t v38 = v85;
  uint64_t v39 = (uint64_t)v83;

  sub_1C38BC21C(v91, v39, &qword_1EC0276A8);
  uint64_t v40 = sub_1C38BCEA8();
  os_log_type_t v41 = sub_1C38BCFC8();
  BOOL v42 = os_log_type_enabled(v40, v41);
  uint64_t v82 = v32;
  if (v42)
  {
    uint64_t v43 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    aBlock[0] = v44;
    *(_DWORD *)uint64_t v43 = 136315138;
    sub_1C38BC21C(v39, v78, &qword_1EC0276A8);
    uint64_t v45 = sub_1C38BCF18();
    uint64_t v92 = sub_1C38B1D20(v45, v46, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    sub_1C38B2404(v39);
    _os_log_impl(&dword_1C38A4000, v40, v41, "callForMailContent fileURL: %s", v43, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v44, -1, -1);
    MEMORY[0x1C8776AC0](v43, -1, -1);
  }
  else
  {
    sub_1C38B2404(v39);
  }

  unint64_t v47 = v86;
  unint64_t v48 = v90;
  swift_bridgeObjectRetain_n();
  os_log_type_t v49 = sub_1C38BCEA8();
  os_log_type_t v50 = sub_1C38BCF98();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = (uint8_t *)swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    aBlock[0] = v52;
    *(_DWORD *)uint64_t v51 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v92 = sub_1C38B1D20(v89, v48, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C38A4000, v49, v50, "callForMailContent appName: %s", v51, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v52, -1, -1);
    MEMORY[0x1C8776AC0](v51, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1C38B24A8(v38, v47);
  sub_1C38B24A8(v38, v47);
  uint64_t v53 = sub_1C38BCEA8();
  os_log_type_t v54 = sub_1C38BCFA8();
  if (os_log_type_enabled(v53, v54))
  {
    unint64_t v55 = (uint8_t *)swift_slowAlloc();
    uint64_t v56 = swift_slowAlloc();
    aBlock[0] = v56;
    *(_DWORD *)unint64_t v55 = 136315138;
    sub_1C38B24A8(v38, v47);
    uint64_t v57 = sub_1C38BCE78();
    unint64_t v59 = v58;
    sub_1C38B2500(v38, v47);
    uint64_t v92 = sub_1C38B1D20(v57, v59, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    sub_1C38B2500(v38, v47);
    sub_1C38B2500(v38, v47);
    _os_log_impl(&dword_1C38A4000, v53, v54, "callForMailContent appIconData: %s", v55, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v56, -1, -1);
    MEMORY[0x1C8776AC0](v55, -1, -1);
  }
  else
  {
    sub_1C38B2500(v38, v47);
    sub_1C38B2500(v38, v47);
  }

  uint64_t v60 = v84;
  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  uint64_t v61 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    unint64_t v62 = (void *)sub_1C38BCE38();
    uint64_t v63 = v80;
    sub_1C38BC21C(v91, v80, &qword_1EC0276A8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v88 + 48))(v63, 1, v60) == 1)
    {
      os_log_type_t v64 = 0;
    }
    else
    {
      os_log_type_t v64 = (void *)sub_1C38BCE38();
      v72((char *)v63, v60);
    }
    uint64_t v67 = (void *)sub_1C38BCED8();
    unint64_t v68 = (void *)sub_1C38BCE88();
    uint64_t v69 = swift_allocObject();
    uint64_t v70 = v87;
    *(void *)(v69 + 16) = sub_1C38BC0C0;
    *(void *)(v69 + 24) = v70;
    aBlock[4] = (uint64_t)sub_1C38B2558;
    aBlock[5] = v69;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38AC01C;
    aBlock[3] = (uint64_t)&block_descriptor_206;
    os_log_type_t v71 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v61, sel_mailContentFromSharingURL_share_fileURL_appName_appIconData_withReply_, v62, v82, v64, v67, v68, v71);
    _Block_release(v71);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    os_log_type_t v65 = v73;
    uint64_t v66 = v76;
    sub_1C38BCE18();
    uint64_t v67 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v75 + 8))(v65, v66);
    unint64_t v68 = (void *)sub_1C38BCE28();
    (*((void (**)(const void *, void, void, void *))v77 + 2))(v77, 0, 0, v68);
    swift_release();
  }
}

void sub_1C38B7444(uint64_t a1, void *a2, void (**a3)(const void *, void, void *))
{
  id v47 = a2;
  uint64_t aBlock[6] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v5 - 8);
  BOOL v42 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C38BCDF8();
  uint64_t v43 = *(void *)(v7 - 8);
  uint64_t v44 = v7;
  MEMORY[0x1F4188790](v7);
  os_log_type_t v41 = (char *)v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C38BCE68();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  uint64_t v45 = a3;
  _Block_copy(a3);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1C38BCEC8();
  uint64_t v15 = __swift_project_value_buffer(v14, (uint64_t)qword_1EC0276D8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  uint64_t v16 = sub_1C38BCEA8();
  os_log_type_t v17 = sub_1C38BCFC8();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v46 = a1;
  if (v18)
  {
    v39[1] = v15;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v40 = v13;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    aBlock[0] = v21;
    *(_DWORD *)uint64_t v20 = 136315138;
    v39[0] = v20 + 4;
    sub_1C38B2378(&qword_1EA37F200, MEMORY[0x1E4F276F0]);
    uint64_t v22 = sub_1C38BD068();
    uint64_t v48 = sub_1C38B1D20(v22, v23, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    _os_log_impl(&dword_1C38A4000, v16, v17, "callForMetadataFromShareURL sharingURL: %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v21, -1, -1);
    uint64_t v24 = v20;
    uint64_t v13 = v40;
    MEMORY[0x1C8776AC0](v24, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }

  id v25 = v47;
  os_log_type_t v26 = v47;
  BOOL v27 = sub_1C38BCEA8();
  os_log_type_t v28 = sub_1C38BCFC8();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 138412290;
    if (v25)
    {
      aBlock[0] = (uint64_t)v26;
      unint64_t v31 = v26;
    }
    else
    {
      aBlock[0] = 0;
    }
    sub_1C38BCFD8();
    *uint64_t v30 = v25;

    _os_log_impl(&dword_1C38A4000, v27, v28, "callForMetadataFromShareURL containerSetupInfo: %@", v29, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v30, -1, -1);
    MEMORY[0x1C8776AC0](v29, -1, -1);
  }
  else
  {

    BOOL v27 = v26;
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  BOOL v32 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    uint64_t v33 = (void *)sub_1C38BCE38();
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 16) = sub_1C38BC0B8;
    *(void *)(v34 + 24) = v13;
    aBlock[4] = (uint64_t)sub_1C38BC2A0;
    aBlock[5] = v34;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38ACA58;
    aBlock[3] = (uint64_t)&block_descriptor_196;
    uint64_t v35 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v32, sel_getMetadataFromShareFromSharingURL_containerSetupInfo_withReply_, v33, v26, v35);
    _Block_release(v35);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    uint64_t v36 = v41;
    uint64_t v37 = v44;
    sub_1C38BCE18();
    uint64_t v38 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v36, v37);
    uint64_t v33 = (void *)sub_1C38BCE28();
    v45[2](v45, 0, v33);
    swift_release();
  }
}

uint64_t sub_1C38B7B1C(void *a1, void *a2, void (**a3)(const void *, void *, void, void *))
{
  uint64_t aBlock[6] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v52 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C38BCDF8();
  uint64_t v53 = *(void *)(v8 - 8);
  uint64_t v54 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v51 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v56 = (uint64_t)&v48 - v14;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  os_log_type_t v50 = a3;
  _Block_copy(a3);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_1C38BCEC8();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1EC0276D8);
  id v18 = a1;
  uint64_t v19 = sub_1C38BCEA8();
  os_log_type_t v20 = sub_1C38BCFC8();
  BOOL v21 = os_log_type_enabled(v19, v20);
  unint64_t v55 = v13;
  if (v21)
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v48 = v17;
    unint64_t v23 = (uint8_t *)v22;
    uint64_t v24 = swift_slowAlloc();
    id v49 = a2;
    id v25 = (void *)v24;
    *(_DWORD *)unint64_t v23 = 138412290;
    aBlock[0] = v18;
    uint64_t v26 = v15;
    id v27 = v18;
    sub_1C38BCFD8();
    void *v25 = v18;

    uint64_t v15 = v26;
    _os_log_impl(&dword_1C38A4000, v19, v20, "callForUpdateShare share: %@", v23, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    os_log_type_t v28 = v25;
    a2 = v49;
    MEMORY[0x1C8776AC0](v28, -1, -1);
    MEMORY[0x1C8776AC0](v23, -1, -1);
  }
  else
  {
  }
  uint64_t v29 = a2;
  uint64_t v30 = sub_1C38BCEA8();
  os_log_type_t v31 = sub_1C38BCFC8();
  if (os_log_type_enabled(v30, v31))
  {
    id v49 = v18;
    BOOL v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = (void *)swift_slowAlloc();
    *(_DWORD *)BOOL v32 = 138412290;
    if (a2)
    {
      aBlock[0] = v29;
      uint64_t v34 = v29;
    }
    else
    {
      aBlock[0] = 0;
    }
    sub_1C38BCFD8();
    void *v33 = a2;

    _os_log_impl(&dword_1C38A4000, v30, v31, "callForUpdateShare containerSetupInfo: %@", v32, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v33, -1, -1);
    MEMORY[0x1C8776AC0](v32, -1, -1);
    id v18 = v49;
  }
  else
  {

    uint64_t v30 = v29;
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  uint64_t v35 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = sub_1C38BC47C;
    *(void *)(v36 + 24) = v15;
    aBlock[4] = sub_1C38B2464;
    aBlock[5] = v36;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C38A838C;
    aBlock[3] = &block_descriptor_186;
    uint64_t v37 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v35, sel_updateShare_containerSetupInfo_withReply_, v18, v29, v37);
    _Block_release(v37);
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v39 = sub_1C38BCE68();
    uint64_t v40 = *(void *)(v39 - 8);
    uint64_t v41 = v56;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v40 + 56))(v56, 1, 1, v39);
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    BOOL v42 = v51;
    uint64_t v43 = v54;
    sub_1C38BCE18();
    uint64_t v44 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v42, v43);
    uint64_t v45 = (uint64_t)v55;
    sub_1C38BC21C(v41, (uint64_t)v55, &qword_1EC0276A8);
    uint64_t v46 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v45, 1, v39) != 1)
    {
      uint64_t v46 = (void *)sub_1C38BCE38();
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v45, v39);
    }
    id v47 = (void *)sub_1C38BCE28();
    v50[2](v50, v46, 0, v47);

    sub_1C38B2404(v56);
    return swift_release();
  }
}

void sub_1C38B8264(void *a1, void (**a2)(void, void, void))
{
  uint64_t v4 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v5 = sub_1C38BCDF8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  _Block_copy(a2);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1C38BCEC8();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EC0276D8);
  id v11 = a1;
  uint64_t v12 = sub_1C38BCEA8();
  os_log_type_t v13 = sub_1C38BCFC8();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v29 = v5;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v28 = v6;
    uint64_t v15 = (uint8_t *)v14;
    id v25 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 138412290;
    uint64_t v26 = v9;
    id v27 = v8;
    aBlock[0] = v11;
    id v16 = v11;
    uint64_t v9 = v26;
    uint64_t v8 = v27;
    sub_1C38BCFD8();
    uint64_t v17 = v25;
    void *v25 = v11;

    uint64_t v5 = v29;
    _os_log_impl(&dword_1C38A4000, v12, v13, "callForCurrentUserSharingStatus share: %@", v15, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v17, -1, -1);
    id v18 = v15;
    uint64_t v6 = v28;
    MEMORY[0x1C8776AC0](v18, -1, -1);
  }
  else
  {
  }
  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  uint64_t v19 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = sub_1C38BC294;
    *(void *)(v20 + 24) = v9;
    aBlock[4] = sub_1C38BC29C;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C38AD7C4;
    aBlock[3] = &block_descriptor_175;
    BOOL v21 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v19, sel_currentUserSharingStatusFor_withReply_, v11, v21);
    _Block_release(v21);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    sub_1C38BCE18();
    uint64_t v22 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    unint64_t v23 = (void *)sub_1C38BCE28();
    ((void (**)(void, void, void *))a2)[2](a2, 0, v23);
    swift_release();
  }
}

void sub_1C38B86EC(void *a1, void *a2, uint64_t a3, uint64_t a4, void (**a5)(const void *, void *, void, void *))
{
  uint64_t v10 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v10 - 8);
  v65[1] = (char *)v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1C38BCDF8();
  uint64_t v66 = *(void *)(v12 - 8);
  uint64_t v67 = v12;
  MEMORY[0x1F4188790](v12);
  v65[0] = (char *)v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  uint64_t v15 = MEMORY[0x1F4188790](v14 - 8);
  uint64_t v68 = (uint64_t)v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v72 = (char *)v65 - v17;
  uint64_t v73 = swift_allocObject();
  *(void *)(v73 + 16) = a5;
  uint64_t v69 = a5;
  _Block_copy(a5);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_1C38BCEC8();
  uint64_t v19 = __swift_project_value_buffer(v18, (uint64_t)qword_1EC0276D8);
  id v20 = a1;
  BOOL v21 = sub_1C38BCEA8();
  os_log_type_t v22 = sub_1C38BCFC8();
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v74 = v19;
  uint64_t v75 = a3;
  id v70 = v20;
  uint64_t v71 = a4;
  if (v23)
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    id v25 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 138412290;
    aBlock[0] = (uint64_t)v20;
    uint64_t v26 = a2;
    id v27 = v20;
    sub_1C38BCFD8();
    void *v25 = v20;

    a2 = v26;
    _os_log_impl(&dword_1C38A4000, v21, v22, "callForAddParticipantsToShare share: %@", v24, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v25, -1, -1);
    MEMORY[0x1C8776AC0](v24, -1, -1);
  }
  else
  {
  }
  uint64_t v28 = a2;
  uint64_t v29 = sub_1C38BCEA8();
  os_log_type_t v30 = sub_1C38BCFC8();
  if (os_log_type_enabled(v29, v30))
  {
    os_log_type_t v31 = (uint8_t *)swift_slowAlloc();
    BOOL v32 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v31 = 138412290;
    aBlock[0] = (uint64_t)v28;
    uint64_t v33 = v28;
    sub_1C38BCFD8();
    *BOOL v32 = v28;

    _os_log_impl(&dword_1C38A4000, v29, v30, "callForAddParticipantsToShare containerSetupInfo: %@", v31, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v32, -1, -1);
    MEMORY[0x1C8776AC0](v31, -1, -1);
  }
  else
  {

    uint64_t v29 = v28;
  }

  swift_bridgeObjectRetain_n();
  uint64_t v34 = sub_1C38BCEA8();
  os_log_type_t v35 = sub_1C38BCF98();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    aBlock[0] = v37;
    *(_DWORD *)uint64_t v36 = 136315138;
    uint64_t v38 = swift_bridgeObjectRetain();
    uint64_t v39 = MEMORY[0x1C8776510](v38, MEMORY[0x1E4FBB1A0]);
    unint64_t v41 = v40;
    swift_bridgeObjectRelease();
    uint64_t v76 = sub_1C38B1D20(v39, v41, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v34, v35, "callForAddParticipantsToShare emailAddresses: %s", v36, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v37, -1, -1);
    MEMORY[0x1C8776AC0](v36, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  BOOL v42 = sub_1C38BCEA8();
  os_log_type_t v43 = sub_1C38BCF98();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    aBlock[0] = v45;
    uint64_t v74 = v28;
    *(_DWORD *)uint64_t v44 = 136315138;
    uint64_t v46 = swift_bridgeObjectRetain();
    uint64_t v47 = MEMORY[0x1C8776510](v46, MEMORY[0x1E4FBB1A0]);
    unint64_t v49 = v48;
    swift_bridgeObjectRelease();
    uint64_t v76 = sub_1C38B1D20(v47, v49, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v42, v43, "callForAddParticipantsToShare phoneNumbers: %s", v44, 0xCu);
    uint64_t v28 = v74;
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v45, -1, -1);
    MEMORY[0x1C8776AC0](v44, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v50 = (uint64_t)v72;
  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  uint64_t v51 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    uint64_t v52 = (void *)sub_1C38BCF48();
    uint64_t v53 = (void *)sub_1C38BCF48();
    uint64_t v54 = swift_allocObject();
    uint64_t v55 = v73;
    *(void *)(v54 + 16) = sub_1C38BC47C;
    *(void *)(v54 + 24) = v55;
    aBlock[4] = (uint64_t)sub_1C38B2464;
    aBlock[5] = v54;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38A838C;
    aBlock[3] = (uint64_t)&block_descriptor_165;
    uint64_t v56 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v51, sel_addParticipantsToShare_containerSetupInfo_emailAddresses_phoneNumbers_withReply_, v70, v28, v52, v53, v56);
    _Block_release(v56);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v57 = sub_1C38BCE68();
    uint64_t v58 = *(void *)(v57 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 56))(v50, 1, 1, v57);
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    uint64_t v59 = v65[0];
    uint64_t v60 = v67;
    sub_1C38BCE18();
    uint64_t v61 = (void *)sub_1C38BCDC8();
    (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v59, v60);
    uint64_t v62 = v68;
    sub_1C38BC21C(v50, v68, &qword_1EC0276A8);
    uint64_t v63 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v62, 1, v57) != 1)
    {
      uint64_t v63 = (void *)sub_1C38BCE38();
      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v62, v57);
    }
    os_log_type_t v64 = (void *)sub_1C38BCE28();
    v69[2](v69, v63, 0, v64);

    sub_1C38B2404(v50);
    swift_release();
  }
}

void sub_1C38B90C8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void (**a7)(const void *, void *, void, void *))
{
  int v80 = a6;
  uint64_t v83 = a5;
  uint64_t v79 = a2;
  uint64_t v11 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v72 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1C38BCDF8();
  uint64_t v73 = *(void *)(v13 - 8);
  uint64_t v74 = v13;
  MEMORY[0x1F4188790](v13);
  uint64_t v71 = (char *)&v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  uint64_t v16 = MEMORY[0x1F4188790](v15 - 8);
  uint64_t v75 = (uint64_t)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v76 = (char *)&v70 - v18;
  uint64_t v81 = swift_allocObject();
  *(void *)(v81 + 16) = a7;
  uint64_t v77 = a7;
  _Block_copy(a7);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_1C38BCEC8();
  uint64_t v20 = __swift_project_value_buffer(v19, (uint64_t)qword_1EC0276D8);
  id v21 = a1;
  os_log_type_t v22 = sub_1C38BCEA8();
  os_log_type_t v23 = sub_1C38BCFC8();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v84 = v20;
  uint64_t v85 = a4;
  uint64_t v82 = a3;
  id v78 = v21;
  if (v24)
  {
    id v25 = v21;
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    id v27 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 138412290;
    aBlock[0] = (uint64_t)v25;
    id v28 = v25;
    sub_1C38BCFD8();
    *id v27 = v25;

    _os_log_impl(&dword_1C38A4000, v22, v23, "callForAddParticipantsToShare urlWrapper: %@", v26, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v27, -1, -1);
    MEMORY[0x1C8776AC0](v26, -1, -1);
  }
  else
  {
  }
  swift_bridgeObjectRetain_n();
  uint64_t v29 = sub_1C38BCEA8();
  os_log_type_t v30 = sub_1C38BCF98();
  if (os_log_type_enabled(v29, v30))
  {
    os_log_type_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    aBlock[0] = v32;
    *(_DWORD *)os_log_type_t v31 = 136315138;
    uint64_t v33 = swift_bridgeObjectRetain();
    uint64_t v34 = MEMORY[0x1C8776510](v33, MEMORY[0x1E4FBB1A0]);
    unint64_t v36 = v35;
    swift_bridgeObjectRelease();
    uint64_t v86 = sub_1C38B1D20(v34, v36, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v29, v30, "callForAddParticipantsToShare emailAddresses: %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v32, -1, -1);
    MEMORY[0x1C8776AC0](v31, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v37 = sub_1C38BCEA8();
  os_log_type_t v38 = sub_1C38BCF98();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    aBlock[0] = v40;
    *(_DWORD *)uint64_t v39 = 136315138;
    uint64_t v41 = swift_bridgeObjectRetain();
    uint64_t v42 = MEMORY[0x1C8776510](v41, MEMORY[0x1E4FBB1A0]);
    unint64_t v44 = v43;
    swift_bridgeObjectRelease();
    uint64_t v86 = sub_1C38B1D20(v42, v44, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v37, v38, "callForAddParticipantsToShare phoneNumbers: %s", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v40, -1, -1);
    MEMORY[0x1C8776AC0](v39, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v45 = sub_1C38BCEA8();
  os_log_type_t v46 = sub_1C38BCF98();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    *(_DWORD *)uint64_t v47 = 136315138;
    uint64_t v86 = v83;
    aBlock[0] = v48;
    type metadata accessor for ParticipantPermission(0);
    uint64_t v49 = sub_1C38BCF18();
    uint64_t v86 = sub_1C38B1D20(v49, v50, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v45, v46, "callForAddParticipantsToShare permissionType: %s", v47, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v48, -1, -1);
    MEMORY[0x1C8776AC0](v47, -1, -1);
  }

  char v51 = v80;
  uint64_t v52 = sub_1C38BCEA8();
  os_log_type_t v53 = sub_1C38BCF98();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v54 = 67109120;
    LODWORD(aBlock[0]) = v51 & 1;
    sub_1C38BCFD8();
    _os_log_impl(&dword_1C38A4000, v52, v53, "callForAddParticipantsToShare allowOthersToInvite: %{BOOL}d", v54, 8u);
    MEMORY[0x1C8776AC0](v54, -1, -1);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  uint64_t v55 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    uint64_t v56 = (void *)sub_1C38BCF48();
    uint64_t v57 = (void *)sub_1C38BCF48();
    uint64_t v58 = swift_allocObject();
    uint64_t v59 = v81;
    *(void *)(v58 + 16) = sub_1C38BC47C;
    *(void *)(v58 + 24) = v59;
    aBlock[4] = (uint64_t)sub_1C38B2464;
    aBlock[5] = v58;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38A838C;
    aBlock[3] = (uint64_t)&block_descriptor_154;
    uint64_t v60 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v55, sel_addParticipantsToShareWithURLWrapper_share_emailAddresses_phoneNumbers_permissionType_allowOthersToInvite_withReply_, v78, v79, v56, v57, v83, v51 & 1, v60);
    _Block_release(v60);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v61 = sub_1C38BCE68();
    uint64_t v62 = *(void *)(v61 - 8);
    uint64_t v63 = (uint64_t)v76;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v62 + 56))(v76, 1, 1, v61);
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    os_log_type_t v64 = v71;
    uint64_t v65 = v74;
    sub_1C38BCE18();
    uint64_t v66 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v73 + 8))(v64, v65);
    uint64_t v67 = v75;
    sub_1C38BC21C(v63, v75, &qword_1EC0276A8);
    uint64_t v68 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v67, 1, v61) != 1)
    {
      uint64_t v68 = (void *)sub_1C38BCE38();
      (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v67, v61);
    }
    uint64_t v69 = (void *)sub_1C38BCE28();
    v77[2](v77, v68, 0, v69);

    sub_1C38B2404(v63);
    swift_release();
  }
}

void sub_1C38B9B40(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void (**a7)(const void *, void *, void, void *))
{
  int v87 = a6;
  uint64_t v90 = a5;
  uint64_t v91 = a3;
  uint64_t v11 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v11 - 8);
  int v80 = (char *)&v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1C38BCDF8();
  uint64_t v81 = *(void *)(v13 - 8);
  uint64_t v82 = v13;
  MEMORY[0x1F4188790](v13);
  uint64_t v79 = (char *)&v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  uint64_t v16 = MEMORY[0x1F4188790](v15 - 8);
  uint64_t v83 = (uint64_t)&v78 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)&v78 - v18;
  uint64_t v89 = swift_allocObject();
  *(void *)(v89 + 16) = a7;
  uint64_t v84 = a7;
  _Block_copy(a7);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_1C38BCEC8();
  uint64_t v21 = __swift_project_value_buffer(v20, (uint64_t)qword_1EC0276D8);
  id v22 = a1;
  uint64_t v93 = v21;
  os_log_type_t v23 = sub_1C38BCEA8();
  os_log_type_t v24 = sub_1C38BCFC8();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v92 = a4;
  uint64_t v88 = v19;
  id v86 = v22;
  if (v25)
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    id v27 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 138412290;
    aBlock[0] = (uint64_t)v22;
    id v28 = a2;
    id v29 = v22;
    sub_1C38BCFD8();
    *id v27 = v22;

    a2 = v28;
    _os_log_impl(&dword_1C38A4000, v23, v24, "callForAddParticipantsToShare share: %@", v26, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v27, -1, -1);
    MEMORY[0x1C8776AC0](v26, -1, -1);
  }
  else
  {
  }
  os_log_type_t v30 = a2;
  os_log_type_t v31 = sub_1C38BCEA8();
  os_log_type_t v32 = sub_1C38BCFC8();
  BOOL v33 = os_log_type_enabled(v31, v32);
  uint64_t v85 = v30;
  if (v33)
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    unint64_t v35 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v34 = 138412290;
    aBlock[0] = (uint64_t)v30;
    unint64_t v36 = v30;
    sub_1C38BCFD8();
    *unint64_t v35 = v30;

    _os_log_impl(&dword_1C38A4000, v31, v32, "callForAddParticipantsToShare containerSetupInfo: %@", v34, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v35, -1, -1);
    MEMORY[0x1C8776AC0](v34, -1, -1);
  }
  else
  {

    os_log_type_t v31 = v30;
  }

  swift_bridgeObjectRetain_n();
  uint64_t v37 = sub_1C38BCEA8();
  os_log_type_t v38 = sub_1C38BCF98();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    aBlock[0] = v40;
    *(_DWORD *)uint64_t v39 = 136315138;
    uint64_t v41 = swift_bridgeObjectRetain();
    uint64_t v42 = MEMORY[0x1C8776510](v41, MEMORY[0x1E4FBB1A0]);
    unint64_t v44 = v43;
    swift_bridgeObjectRelease();
    uint64_t v94 = sub_1C38B1D20(v42, v44, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v37, v38, "callForAddParticipantsToShare emailAddresses: %s", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v40, -1, -1);
    MEMORY[0x1C8776AC0](v39, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v45 = sub_1C38BCEA8();
  os_log_type_t v46 = sub_1C38BCF98();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    aBlock[0] = v48;
    *(_DWORD *)uint64_t v47 = 136315138;
    uint64_t v49 = swift_bridgeObjectRetain();
    uint64_t v50 = MEMORY[0x1C8776510](v49, MEMORY[0x1E4FBB1A0]);
    unint64_t v52 = v51;
    swift_bridgeObjectRelease();
    uint64_t v94 = sub_1C38B1D20(v50, v52, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v45, v46, "callForAddParticipantsToShare phoneNumbers: %s", v47, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v48, -1, -1);
    MEMORY[0x1C8776AC0](v47, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  os_log_type_t v53 = sub_1C38BCEA8();
  os_log_type_t v54 = sub_1C38BCF98();
  if (os_log_type_enabled(v53, v54))
  {
    uint64_t v55 = (uint8_t *)swift_slowAlloc();
    uint64_t v56 = swift_slowAlloc();
    *(_DWORD *)uint64_t v55 = 136315138;
    uint64_t v94 = v90;
    aBlock[0] = v56;
    type metadata accessor for ParticipantPermission(0);
    uint64_t v57 = sub_1C38BCF18();
    uint64_t v94 = sub_1C38B1D20(v57, v58, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v53, v54, "callForAddParticipantsToShare permissionType: %s", v55, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v56, -1, -1);
    MEMORY[0x1C8776AC0](v55, -1, -1);
  }

  uint64_t v59 = (uint64_t)v88;
  char v60 = v87;
  uint64_t v61 = sub_1C38BCEA8();
  os_log_type_t v62 = sub_1C38BCF98();
  if (os_log_type_enabled(v61, v62))
  {
    uint64_t v63 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v63 = 67109120;
    LODWORD(aBlock[0]) = v60 & 1;
    sub_1C38BCFD8();
    _os_log_impl(&dword_1C38A4000, v61, v62, "callForAddParticipantsToShare allowOthersToInvite: %{BOOL}d", v63, 8u);
    MEMORY[0x1C8776AC0](v63, -1, -1);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  os_log_type_t v64 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    uint64_t v65 = (void *)sub_1C38BCF48();
    uint64_t v66 = (void *)sub_1C38BCF48();
    uint64_t v67 = swift_allocObject();
    uint64_t v68 = v89;
    *(void *)(v67 + 16) = sub_1C38BC47C;
    *(void *)(v67 + 24) = v68;
    aBlock[4] = (uint64_t)sub_1C38B2464;
    aBlock[5] = v67;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38A838C;
    aBlock[3] = (uint64_t)&block_descriptor_143;
    uint64_t v69 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v64, sel_addParticipantsToShare_containerSetupInfo_emailAddresses_phoneNumbers_permissionType_allowOthersToInvite_withReply_, v86, v85, v65, v66, v90, v60 & 1, v69);
    _Block_release(v69);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v70 = sub_1C38BCE68();
    uint64_t v71 = *(void *)(v70 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v71 + 56))(v59, 1, 1, v70);
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    uint64_t v72 = v79;
    uint64_t v73 = v82;
    sub_1C38BCE18();
    uint64_t v74 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v81 + 8))(v72, v73);
    uint64_t v75 = v83;
    sub_1C38BC21C(v59, v83, &qword_1EC0276A8);
    uint64_t v76 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v71 + 48))(v75, 1, v70) != 1)
    {
      uint64_t v76 = (void *)sub_1C38BCE38();
      (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v75, v70);
    }
    uint64_t v77 = (void *)sub_1C38BCE28();
    v84[2](v84, v76, 0, v77);

    sub_1C38B2404(v59);
    swift_release();
  }
}

void sub_1C38BA6D4(uint64_t a1, void (**a2)(void, void, void, void))
{
  uint64_t v4 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v4 - 8);
  unint64_t v44 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_1C38BCDF8();
  uint64_t v45 = *(void *)(v47 - 8);
  MEMORY[0x1F4188790](v47);
  unint64_t v43 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  uint64_t v8 = MEMORY[0x1F4188790](v7 - 8);
  uint64_t v46 = (uint64_t)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v49 = (uint64_t)&v41 - v10;
  uint64_t v11 = sub_1C38BCE68();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a2;
  _Block_copy(a2);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_1C38BCEC8();
  __swift_project_value_buffer(v16, (uint64_t)qword_1EC0276D8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  uint64_t v17 = sub_1C38BCEA8();
  os_log_type_t v18 = sub_1C38BCFC8();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v48 = a1;
  if (v19)
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v41 = v15;
    uint64_t v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v42 = a2;
    uint64_t v23 = v22;
    aBlock[0] = v22;
    *(_DWORD *)uint64_t v21 = 136315138;
    sub_1C38B2378(&qword_1EA37F200, MEMORY[0x1E4F276F0]);
    uint64_t v24 = sub_1C38BD068();
    uint64_t v50 = sub_1C38B1D20(v24, v25, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    uint64_t v26 = *(void (**)(char *, uint64_t))(v12 + 8);
    v26(v14, v11);
    _os_log_impl(&dword_1C38A4000, v17, v18, "callForExistingShareForFile url: %s", v21, 0xCu);
    swift_arrayDestroy();
    uint64_t v27 = v23;
    a2 = v42;
    MEMORY[0x1C8776AC0](v27, -1, -1);
    id v28 = v21;
    uint64_t v15 = v41;
    MEMORY[0x1C8776AC0](v28, -1, -1);
  }
  else
  {
    uint64_t v26 = *(void (**)(char *, uint64_t))(v12 + 8);
    v26(v14, v11);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  id v29 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    os_log_type_t v30 = (void *)sub_1C38BCE38();
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = sub_1C38BC47C;
    *(void *)(v31 + 24) = v15;
    aBlock[4] = (uint64_t)sub_1C38B2464;
    aBlock[5] = v31;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38A838C;
    aBlock[3] = (uint64_t)&block_descriptor_132;
    os_log_type_t v32 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v29, sel_existingShareForFile_withReply_, v30, v32);
    _Block_release(v32);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v33 = v49;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v49, 1, 1, v11);
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    uint64_t v34 = v43;
    uint64_t v35 = v47;
    sub_1C38BCE18();
    unint64_t v36 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v34, v35);
    uint64_t v37 = v33;
    uint64_t v38 = v46;
    sub_1C38BC21C(v37, v46, &qword_1EC0276A8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v38, 1, v11) == 1)
    {
      uint64_t v39 = 0;
    }
    else
    {
      uint64_t v39 = (void *)sub_1C38BCE38();
      v26((char *)v38, v11);
    }
    uint64_t v40 = (void *)sub_1C38BCE28();
    ((void (**)(void, void *, void, void *))a2)[2](a2, v39, 0, v40);

    sub_1C38B2404(v49);
    swift_release();
  }
}

void sub_1C38BAD74(uint64_t a1, void *a2, void (**a3)(void, void, void, void))
{
  uint64_t aBlock[6] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v6 - 8);
  unint64_t v52 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C38BCDF8();
  uint64_t v53 = *(void *)(v8 - 8);
  uint64_t v54 = v8;
  MEMORY[0x1F4188790](v8);
  unint64_t v51 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  uint64_t v55 = (uint64_t)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v48 - v14;
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v48 - v16;
  uint64_t v57 = swift_allocObject();
  *(void *)(v57 + 16) = a3;
  _Block_copy(a3);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_1C38BCEC8();
  __swift_project_value_buffer(v18, (uint64_t)qword_1EC0276D8);
  sub_1C38BC21C(a1, (uint64_t)v17, &qword_1EC0276A8);
  BOOL v19 = sub_1C38BCEA8();
  os_log_type_t v20 = sub_1C38BCFC8();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v56 = a1;
  if (v21)
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v50 = a3;
    uint64_t v23 = (uint8_t *)v22;
    uint64_t v24 = swift_slowAlloc();
    aBlock[0] = v24;
    uint64_t v49 = a2;
    *(_DWORD *)uint64_t v23 = 136315138;
    sub_1C38BC21C((uint64_t)v17, (uint64_t)v15, &qword_1EC0276A8);
    uint64_t v25 = sub_1C38BCF18();
    uint64_t v58 = sub_1C38B1D20(v25, v26, aBlock);
    a2 = v49;
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    sub_1C38B2404((uint64_t)v17);
    _os_log_impl(&dword_1C38A4000, v19, v20, "callForUserNameAndEmail url: %s", v23, 0xCu);
    swift_arrayDestroy();
    uint64_t v27 = v24;
    a1 = v56;
    MEMORY[0x1C8776AC0](v27, -1, -1);
    id v28 = v23;
    a3 = v50;
    MEMORY[0x1C8776AC0](v28, -1, -1);
  }
  else
  {
    sub_1C38B2404((uint64_t)v17);
  }

  id v29 = a2;
  os_log_type_t v30 = sub_1C38BCEA8();
  os_log_type_t v31 = sub_1C38BCFC8();
  if (os_log_type_enabled(v30, v31))
  {
    os_log_type_t v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v32 = 138412290;
    if (a2)
    {
      aBlock[0] = (uint64_t)v29;
      uint64_t v34 = v29;
      uint64_t v35 = a2;
    }
    else
    {
      uint64_t v35 = 0;
      aBlock[0] = 0;
    }
    sub_1C38BCFD8();
    void *v33 = v35;

    _os_log_impl(&dword_1C38A4000, v30, v31, "callForUserNameAndEmail containerSetupInfo: %@", v32, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276C8);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v33, -1, -1);
    MEMORY[0x1C8776AC0](v32, -1, -1);
    a1 = v56;
  }
  else
  {

    os_log_type_t v30 = v29;
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  unint64_t v36 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    uint64_t v37 = v55;
    sub_1C38BC21C(a1, v55, &qword_1EC0276A8);
    uint64_t v38 = sub_1C38BCE68();
    uint64_t v39 = *(void *)(v38 - 8);
    int v40 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v37, 1, v38);
    swift_unknownObjectRetain();
    uint64_t v41 = 0;
    if (v40 != 1)
    {
      uint64_t v41 = (void *)sub_1C38BCE38();
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v37, v38);
    }
    uint64_t v42 = swift_allocObject();
    uint64_t v43 = v57;
    *(void *)(v42 + 16) = sub_1C38BC088;
    *(void *)(v42 + 24) = v43;
    aBlock[4] = (uint64_t)sub_1C38B25AC;
    aBlock[5] = v42;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38B05B0;
    aBlock[3] = (uint64_t)&block_descriptor_121;
    unint64_t v44 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v36, sel_userNameAndEmail_containerSetupInfo_withReply_, v41, v29, v44);
    _Block_release(v44);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    uint64_t v45 = v51;
    uint64_t v46 = v54;
    sub_1C38BCE18();
    uint64_t v47 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v45, v46);
    uint64_t v41 = (void *)sub_1C38BCE28();
    ((void (**)(void, void, void, void *))a3)[2](a3, 0, 0, v41);
    swift_release();
  }
}

void sub_1C38BB4C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void (**a7)(const void *, void *, void, void *))
{
  int v88 = a6;
  uint64_t v89 = a5;
  uint64_t v86 = a4;
  uint64_t v92 = a3;
  uint64_t v10 = sub_1C38BCDE8();
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v79 = (char *)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_1C38BCDF8();
  uint64_t v80 = *(void *)(v82 - 8);
  MEMORY[0x1F4188790](v82);
  uint64_t v78 = (char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0276A8);
  uint64_t v14 = MEMORY[0x1F4188790](v13 - 8);
  uint64_t v16 = (char *)&v76 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v83 = (char *)&v76 - v17;
  uint64_t v93 = sub_1C38BCE68();
  uint64_t v18 = *(void *)(v93 - 8);
  MEMORY[0x1F4188790](v93);
  os_log_type_t v20 = (char *)&v76 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = swift_allocObject();
  *(void *)(v87 + 16) = a7;
  uint64_t v84 = a7;
  _Block_copy(a7);
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_1C38BCEC8();
  uint64_t v22 = __swift_project_value_buffer(v21, (uint64_t)qword_1EC0276D8);
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  uint64_t v85 = a1;
  v23(v20, a1, v93);
  uint64_t v24 = sub_1C38BCEA8();
  os_log_type_t v25 = sub_1C38BCFC8();
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v90 = a2;
  uint64_t v91 = v22;
  uint64_t v81 = v16;
  if (v26)
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    aBlock[0] = v28;
    *(_DWORD *)uint64_t v27 = 136315138;
    sub_1C38B2378(&qword_1EA37F200, MEMORY[0x1E4F276F0]);
    uint64_t v29 = v93;
    uint64_t v30 = sub_1C38BD068();
    uint64_t v94 = sub_1C38B1D20(v30, v31, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    uint64_t v76 = *(void (**)(char *, uint64_t))(v18 + 8);
    v76(v20, v29);
    _os_log_impl(&dword_1C38A4000, v24, v25, "callForForciblyShareFolder folderURL: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v28, -1, -1);
    MEMORY[0x1C8776AC0](v27, -1, -1);
  }
  else
  {
    uint64_t v76 = *(void (**)(char *, uint64_t))(v18 + 8);
    v76(v20, v93);
  }

  swift_bridgeObjectRetain_n();
  os_log_type_t v32 = sub_1C38BCEA8();
  os_log_type_t v33 = sub_1C38BCF98();
  BOOL v34 = os_log_type_enabled(v32, v33);
  uint64_t v77 = v18;
  if (v34)
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    aBlock[0] = v36;
    *(_DWORD *)uint64_t v35 = 136315138;
    uint64_t v37 = swift_bridgeObjectRetain();
    uint64_t v38 = MEMORY[0x1C8776510](v37, MEMORY[0x1E4FBB1A0]);
    unint64_t v40 = v39;
    swift_bridgeObjectRelease();
    uint64_t v94 = sub_1C38B1D20(v38, v40, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v32, v33, "callForForciblyShareFolder emailAddresses: %s", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v36, -1, -1);
    MEMORY[0x1C8776AC0](v35, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v41 = sub_1C38BCEA8();
  os_log_type_t v42 = sub_1C38BCF98();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    aBlock[0] = v44;
    *(_DWORD *)uint64_t v43 = 136315138;
    uint64_t v45 = swift_bridgeObjectRetain();
    uint64_t v46 = MEMORY[0x1C8776510](v45, MEMORY[0x1E4FBB1A0]);
    unint64_t v48 = v47;
    swift_bridgeObjectRelease();
    uint64_t v94 = sub_1C38B1D20(v46, v48, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v41, v42, "callForForciblyShareFolder phoneNumbers: %s", v43, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v44, -1, -1);
    MEMORY[0x1C8776AC0](v43, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v49 = sub_1C38BCEA8();
  os_log_type_t v50 = sub_1C38BCF98();
  if (os_log_type_enabled(v49, v50))
  {
    unint64_t v51 = (uint8_t *)swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    *(_DWORD *)unint64_t v51 = 136315138;
    uint64_t v94 = v89;
    aBlock[0] = v52;
    type metadata accessor for ParticipantPermission(0);
    uint64_t v53 = sub_1C38BCF18();
    uint64_t v94 = sub_1C38B1D20(v53, v54, aBlock);
    sub_1C38BCFD8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C38A4000, v49, v50, "callForForciblyShareFolder permissionType: %s", v51, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C8776AC0](v52, -1, -1);
    MEMORY[0x1C8776AC0](v51, -1, -1);
  }

  uint64_t v55 = sub_1C38BCEA8();
  os_log_type_t v56 = sub_1C38BCF98();
  BOOL v57 = os_log_type_enabled(v55, v56);
  char v58 = v88;
  if (v57)
  {
    uint64_t v59 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v59 = 67109120;
    LODWORD(aBlock[0]) = v58 & 1;
    sub_1C38BCFD8();
    _os_log_impl(&dword_1C38A4000, v55, v56, "callForForciblyShareFolder allowOthersToInvite: %{BOOL}d", v59, 8u);
    MEMORY[0x1C8776AC0](v59, -1, -1);
  }

  if (qword_1EC0276B0 != -1) {
    swift_once();
  }
  char v60 = (void *)qword_1EC027720;
  if (qword_1EC027720)
  {
    swift_unknownObjectRetain();
    uint64_t v61 = (void *)sub_1C38BCE38();
    os_log_type_t v62 = (void *)sub_1C38BCF48();
    uint64_t v63 = (void *)sub_1C38BCF48();
    uint64_t v64 = swift_allocObject();
    uint64_t v65 = v87;
    *(void *)(v64 + 16) = sub_1C38BC080;
    *(void *)(v64 + 24) = v65;
    aBlock[4] = (uint64_t)sub_1C38B2464;
    aBlock[5] = v64;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C38A838C;
    aBlock[3] = (uint64_t)&block_descriptor_111;
    uint64_t v66 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v60, sel_forciblyShareFolder_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_withReply_, v61, v62, v63, v86, v89, v58 & 1, v66);
    _Block_release(v66);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v67 = v77;
    uint64_t v68 = (uint64_t)v83;
    uint64_t v69 = v93;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v77 + 56))(v83, 1, 1, v93);
    sub_1C38BCDD8();
    sub_1C38B19B0(MEMORY[0x1E4FBC860]);
    sub_1C38B2378(&qword_1EA37F1F8, MEMORY[0x1E4F26C20]);
    uint64_t v70 = v78;
    uint64_t v71 = v82;
    sub_1C38BCE18();
    uint64_t v72 = (void *)sub_1C38BCDC8();
    (*(void (**)(char *, uint64_t))(v80 + 8))(v70, v71);
    uint64_t v73 = (uint64_t)v81;
    sub_1C38BC21C(v68, (uint64_t)v81, &qword_1EC0276A8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v67 + 48))(v73, 1, v69) == 1)
    {
      uint64_t v74 = 0;
    }
    else
    {
      uint64_t v74 = (void *)sub_1C38BCE38();
      v76((char *)v73, v93);
    }
    uint64_t v75 = (void *)sub_1C38BCE28();
    v84[2](v84, v74, 0, v75);

    sub_1C38B2404(v68);
    swift_release();
  }
}

uint64_t sub_1C38BC048()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1C38BC080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1C38A8524(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_1C38BC088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1C38B07B8(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_1C38BC090()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1C38BC0B8(uint64_t a1, uint64_t a2)
{
  sub_1C38ACC34(a1, a2, *(void *)(v2 + 16));
}

void sub_1C38BC0C0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  sub_1C38AC320(a1, a2, a3, a4, a5, *(void *)(v5 + 16));
}

uint64_t sub_1C38BC0C8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1C38BC0F0(char a1, uint64_t a2)
{
  sub_1C38AA8E0(a1, a2, *(void *)(v2 + 16));
}

void sub_1C38BC0F8(char a1, uint64_t a2, uint64_t a3)
{
  sub_1C38AA158(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_1C38BC100()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C38BC128()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1C38BC150(uint64_t a1, uint64_t a2)
{
  sub_1C38ACC34(a1, a2, *(void *)(v2 + 16));
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

uint64_t sub_1C38BC1BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C38BC21C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_1C38BC280(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void URL.evictionSafeResourceValues(forKeys:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  v22[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA37F270);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  uint64_t v20 = (uint64_t)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v18 - v6;
  v22[0] = 0;
  uint64_t v8 = sub_1C38BCE08();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28CA0]), sel_init);
  uint64_t v11 = (void *)sub_1C38BCE38();
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v7;
  uint64_t v12[3] = a1;
  v12[4] = v22;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = sub_1C38BC984;
  v13[3] = v12;
  aBlock[4] = sub_1C38BC9A0;
  aBlock[5] = v13;
  aBlock[0] = (id)MEMORY[0x1E4F143A8];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_1C38BC9C8;
  aBlock[3] = &block_descriptor_0;
  uint64_t v14 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  aBlock[0] = 0;
  objc_msgSend(v10, sel_coordinateReadingItemAtURL_options_error_byAccessor_, v11, 4, aBlock, v14);
  _Block_release(v14);

  id v15 = aBlock[0];
  LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v14) {
    __break(1u);
  }
  if (v15)
  {
    id v16 = v15;
    swift_willThrow();
    sub_1C38BCB2C((uint64_t)v7);

    swift_release();
  }
  else if (v22[0])
  {
    v22[0];
    swift_willThrow();
    sub_1C38BCB2C((uint64_t)v7);

    swift_release();
  }
  else
  {
    uint64_t v17 = v20;
    sub_1C38BCAC4((uint64_t)v7, v20);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v17, 1, v8) == 1)
    {
      __break(1u);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v19, v17, v8);
      sub_1C38BCB2C((uint64_t)v7);

      swift_release();
    }
  }
}

uint64_t sub_1C38BC80C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA37F270);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C38BCE48();
  uint64_t v6 = sub_1C38BCE08();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
  return sub_1C38BCBCC((uint64_t)v5, a2);
}

uint64_t sub_1C38BC94C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1C38BC984(uint64_t a1)
{
  return sub_1C38BC80C(a1, *(void *)(v1 + 16));
}

uint64_t sub_1C38BC990()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C38BC9A0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1C38BC9C8(uint64_t a1)
{
  uint64_t v2 = sub_1C38BCE68();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_1C38BCE58();
  v6(v5);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
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

uint64_t sub_1C38BCAC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA37F270);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C38BCB2C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA37F270);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1C38BCB8C()
{
  unint64_t result = qword_1EA37F278;
  if (!qword_1EA37F278)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA37F278);
  }
  return result;
}

uint64_t sub_1C38BCBCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA37F270);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C38BCC34()
{
  uint64_t v0 = sub_1C38BCEC8();
  __swift_allocate_value_buffer(v0, qword_1EC0276D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EC0276D8);
  swift_bridgeObjectRetain();
  return sub_1C38BCEB8();
}

uint64_t static Logger.general.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EC0276D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1C38BCEC8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EC0276D8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
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

uint64_t sub_1C38BCDC8()
{
  return MEMORY[0x1F40E2D28]();
}

uint64_t sub_1C38BCDD8()
{
  return MEMORY[0x1F40E2DB0]();
}

uint64_t sub_1C38BCDE8()
{
  return MEMORY[0x1F40E2DF0]();
}

uint64_t sub_1C38BCDF8()
{
  return MEMORY[0x1F40E2E08]();
}

uint64_t sub_1C38BCE08()
{
  return MEMORY[0x1F40E4008]();
}

uint64_t sub_1C38BCE18()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_1C38BCE28()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1C38BCE38()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1C38BCE48()
{
  return MEMORY[0x1F40E4A38]();
}

uint64_t sub_1C38BCE58()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1C38BCE68()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1C38BCE78()
{
  return MEMORY[0x1F40E4C30]();
}

uint64_t sub_1C38BCE88()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1C38BCE98()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1C38BCEA8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C38BCEB8()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1C38BCEC8()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C38BCED8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C38BCEE8()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1C38BCEF8()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1C38BCF08()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C38BCF18()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1C38BCF28()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C38BCF38()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C38BCF48()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1C38BCF58()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1C38BCF68()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1C38BCF78()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1C38BCF88()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1C38BCF98()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1C38BCFA8()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1C38BCFB8()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C38BCFC8()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C38BCFD8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C38BCFE8()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C38BCFF8()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1C38BD008()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C38BD018()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C38BD028()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C38BD038()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1C38BD048()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C38BD068()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1C38BD078()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C38BD088()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C38BD098()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t CKErrorUserInfoClasses()
{
  return MEMORY[0x1F40D6338]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}