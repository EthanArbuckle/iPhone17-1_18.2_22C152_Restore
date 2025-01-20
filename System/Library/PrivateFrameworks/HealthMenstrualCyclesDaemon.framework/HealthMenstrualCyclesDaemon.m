uint64_t sub_225724F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_225795CF4);
}

uint64_t sub_225724F70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_225795DB4);
}

uint64_t sub_225724F84()
{
  return swift_bridgeObjectRetain();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t *sub_225724FFC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_22572E408(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2257250CC()
{
  swift_getObjectType();
  v1 = (uint64_t *)(v0
                 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_unitTest_deletedPregnancySamplesQueryResults);
  swift_beginAccess();
  uint64_t v2 = *v1;
  if (!*v1)
  {
    sub_22572F19C(0, (unint64_t *)&unk_26ABF9520);
    uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_profile);
    uint64_t v7 = MEMORY[0x263F8EE78];
    uint64_t v4 = MEMORY[0x270FA5388](v3);
    v6[2] = &v7;
    sub_22572EC64(v4, 0, 1, (uint64_t)sub_22573C128, (uint64_t)v6);
    uint64_t v2 = v7;
  }
  swift_bridgeObjectRetain();
  return v2;
}

id HDMedicalIDDataManager.getMedicalIDData()()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  v6[0] = 0;
  id v1 = objc_msgSend(v0, sel_fetchMedicalIDIfSetUpWithError_, v6);
  id v2 = v6[0];
  if (!v1)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (void *)sub_22579F258();

    swift_willThrow();
    return 0;
  }
  return v1;
}

uint64_t sub_225725444(uint64_t a1)
{
  uint64_t v2 = sub_22572BD88(&qword_26ABF9880, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  return MEMORY[0x270F16F70](a1, v2);
}

uint64_t sub_2257254B0(uint64_t a1)
{
  uint64_t v2 = sub_22572BD88(&qword_26ABF9880, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  return MEMORY[0x270F16FC8](a1, v2);
}

uint64_t sub_2257255A8(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  v9 = *(uint64_t (**)(void *, void *, uint64_t, uint64_t))(a1 + 32);
  id v10 = a2;
  id v11 = a3;
  LOBYTE(a5) = v9(a2, a3, a4, a5);

  return a5 & 1;
}

void sub_2257256E8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_entitlements);
  unsigned int v2 = objc_msgSend(v1, sel_hasEntitlement_, *MEMORY[0x263F09BA8]);

  if (!v2)
  {
    uint64_t v3 = self;
    sub_22579FEB8();
    swift_bridgeObjectRelease();
    sub_22579FAC8();
    sub_22579FB08();
    swift_bridgeObjectRelease();
    uint64_t v4 = (void *)sub_22579FA98();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_hk_error_description_, 4, v4, 0xD00000000000001DLL, 0x80000002257A8160);

    swift_willThrow();
  }
}

uint64_t sub_225725808()
{
  return sub_22579F588();
}

uint64_t sub_225725888()
{
  return sub_22579F5D8();
}

uint64_t sub_225725900()
{
  swift_getObjectType();
  uint64_t v1 = sub_22579F338();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2257383A8(0, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v24 - v6;
  sub_22573C3A8(v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_medicalIDDataManager, (uint64_t)&v26);
  if (v27)
  {
    sub_22573527C(&v26, (uint64_t)v25);
    sub_22573527C(v25, (uint64_t)&v26);
    uint64_t v8 = v27;
    v9 = v28;
  }
  else
  {
    sub_22573C334((uint64_t)&v26);
    id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F43250]), sel_initWithProfile_, *(void *)(v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_profile));
    uint64_t v8 = sub_22572F19C(0, (unint64_t *)&unk_26ABF9B10);
    v9 = &protocol witness table for HDMedicalIDDataManager;
    uint64_t v27 = v8;
    v28 = &protocol witness table for HDMedicalIDDataManager;
    *(void *)&long long v26 = v10;
  }
  __swift_project_boxed_opaque_existential_1(&v26, v8);
  id v11 = (void *)((uint64_t (*)(uint64_t, _UNKNOWN **))v9[1])(v8, v9);
  if (v11)
  {
    v12 = v11;
    id v13 = objc_msgSend(v11, sel_pregnancyEstimatedDueDate);
    if (v13)
    {
      v14 = v13;
      sub_22579F2F8();

      (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v7, v4, v1);
      uint64_t v15 = 1;
      (*(void (**)(char *, void, uint64_t, uint64_t))(v2 + 56))(v7, 0, 1, v1);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) != 1) {
        goto LABEL_17;
      }
    }
    else
    {

      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56))(v7, 1, 1, v1);
    }
    uint64_t v15 = 0;
LABEL_17:
    sub_22573C520((uint64_t)v7, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v26);
    return v15;
  }
  if (HKShowSensitiveLogItems())
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_22579F458();
    __swift_project_value_buffer(v16, (uint64_t)qword_26ABF94A0);
    v17 = sub_22579F438();
    os_log_type_t v18 = sub_22579FC98();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(void *)&v25[0] = v20;
      *(_DWORD *)v19 = 136315138;
      uint64_t v21 = sub_2257A0188();
      v24[1] = sub_22572E428(v21, v22, (uint64_t *)v25);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v17, v18, "[%s] Error retrieving medical ID data", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v20, -1, -1);
      MEMORY[0x22A635470](v19, -1, -1);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v26);
  return 2;
}

uint64_t sub_225725D38(void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  v9 = _Block_copy(aBlock);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  id v11 = a1;
  a6(a5, v10);

  return swift_release();
}

uint64_t HDMCExperienceDaemonStore.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_225725E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22572BD88(&qword_26ABF9880, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  return MEMORY[0x270F16F48](a1, a2, v4);
}

uint64_t sub_225725E88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_22572BEA0(0);
  sub_22572BD88(&qword_26ABF9A20, sub_22572BEA0);
  sub_22572BD88(&qword_26ABF9A28, sub_22572BEA0);
  uint64_t result = sub_22579F7F8();
  *(void *)(a2 + *(int *)(a1 + 20)) = MEMORY[0x263F8EE80];
  return result;
}

void sub_225725F4C(void *a1, uint64_t a2, void *a3, void *a4, void (*a5)(void), void (*a6)(void), char *a7)
{
  v239 = a6;
  v240 = a5;
  v233 = a4;
  id v238 = a1;
  uint64_t ObjectType = swift_getObjectType();
  sub_22573C4A0();
  uint64_t v226 = v10;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v229 = (uint64_t)&v215 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_22579F338();
  uint64_t v235 = *(void *)(v12 - 8);
  uint64_t v236 = v12;
  uint64_t v13 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v231 = (char *)&v215 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v230 = (char *)&v215 - v15;
  uint64_t v16 = sub_22579F398();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  v19 = (char *)&v215 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2257383A8(0, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  v23 = (char *)&v215 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  v228 = (char *)&v215 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v225 = (char *)&v215 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  v227 = (char *)&v215 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v32 = (char *)&v215 - v31;
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  v35 = (char *)&v215 - v34;
  uint64_t v36 = MEMORY[0x270FA5388](v33);
  v38 = (char *)&v215 - v37;
  MEMORY[0x270FA5388](v36);
  v232 = (char *)&v215 - v39;
  uint64_t v241 = a2;
  swift_retain();
  v234 = a7;
  id v242 = sub_225728204();
  if (!v242
    || (id v40 = objc_msgSend(v242, sel_objectForKeyedSubscript_, *MEMORY[0x263F095B8]),
        unsigned int v41 = objc_msgSend(v40, sel_areAllRequirementsSatisfied),
        v40,
        !v41))
  {
    if (HKShowSensitiveLogItems())
    {
      if (qword_26ABF9378 != -1) {
        swift_once();
      }
      uint64_t v51 = sub_22579F458();
      __swift_project_value_buffer(v51, (uint64_t)qword_26ABF94A0);
      v44 = sub_22579F438();
      os_log_type_t v45 = sub_22579FCB8();
      if (!os_log_type_enabled(v44, v45)) {
        goto LABEL_15;
      }
      v46 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      v244[0] = v47;
      *(_DWORD *)v46 = 136315138;
      uint64_t v52 = sub_2257A0188();
      uint64_t v243 = sub_22572E428(v52, v53, v244);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      v50 = "[%s] LCF Notifications are either not available or currently active. Not making adjustment";
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  id v42 = v238;
  if (objc_msgSend(v238, sel_state) == (id)1)
  {
    if (HKShowSensitiveLogItems())
    {
      if (qword_26ABF9378 != -1) {
        swift_once();
      }
      uint64_t v43 = sub_22579F458();
      __swift_project_value_buffer(v43, (uint64_t)qword_26ABF94A0);
      v44 = sub_22579F438();
      os_log_type_t v45 = sub_22579FCB8();
      if (!os_log_type_enabled(v44, v45)) {
        goto LABEL_15;
      }
      v46 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      v244[0] = v47;
      *(_DWORD *)v46 = 136315138;
      uint64_t v48 = sub_2257A0188();
      uint64_t v243 = sub_22572E428(v48, v49, v244);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      v50 = "[%s] Pregnancy state is ongoing. Not making adjustment";
LABEL_14:
      _os_log_impl(&dword_225722000, v44, v45, v50, v46, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v47, -1, -1);
      MEMORY[0x22A635470](v46, -1, -1);
LABEL_15:
    }
LABEL_16:
    v240();
    swift_release();
LABEL_17:

    return;
  }
  if (!objc_msgSend(v42, sel_state))
  {
    v75 = (void *)*MEMORY[0x263F450D8];
    id v76 = objc_msgSend(a3, sel_pregnancyModeSetupCompletionSet);
    sub_22572F19C(0, (unint64_t *)&qword_26ABF9A88);
    sub_22572F36C(&qword_26ABF9A90, (unint64_t *)&qword_26ABF9A88);
    uint64_t v77 = sub_22579FBE8();

    id v78 = v75;
    sub_22577BB00(v77, (uint64_t)v78);
    unint64_t v80 = v79;

    if (v80 >> 62)
    {
      uint64_t v211 = sub_22579FF88();
      uint64_t v81 = v236;
      if (v211) {
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v81 = v236;
      if (*(void *)((v80 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_28:
        sub_22572F19C(0, (unint64_t *)&qword_26ABF9398);
        v82 = (void *)sub_22579FD18();
        uint64_t v83 = (uint64_t)v232;
        sub_22579F328();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v235 + 56))(v83, 0, 1, v81);
        sub_225778C9C(v80, v241, v233, v82, v83, v240, v239, v234);

        sub_22573C520(v83, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
        swift_release();

        swift_bridgeObjectRelease();
        return;
      }
    }
    swift_bridgeObjectRelease();
    if ((HKShowSensitiveLogItems() & 1) == 0) {
      goto LABEL_16;
    }
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v212 = sub_22579F458();
    __swift_project_value_buffer(v212, (uint64_t)qword_26ABF94A0);
    v44 = sub_22579F438();
    os_log_type_t v45 = sub_22579FCB8();
    if (!os_log_type_enabled(v44, v45)) {
      goto LABEL_15;
    }
    v46 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    v244[0] = v47;
    *(_DWORD *)v46 = 136315138;
    uint64_t v213 = sub_2257A0188();
    uint64_t v243 = sub_22572E428(v213, v214, v244);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    v50 = "[%s] Pregnancy state is none and we don't have any setup records needing an update. Not making adjustment";
    goto LABEL_14;
  }
  if (objc_msgSend(v42, sel_state) != (id)2)
  {
    swift_release();
    id v84 = v242;

    return;
  }
  id v54 = objc_msgSend(v42, sel_sample);
  if (!v54)
  {
    if ((HKShowSensitiveLogItems() & 1) == 0) {
      goto LABEL_16;
    }
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v85 = sub_22579F458();
    __swift_project_value_buffer(v85, (uint64_t)qword_26ABF94A0);
    v44 = sub_22579F438();
    os_log_type_t v45 = sub_22579FC98();
    if (!os_log_type_enabled(v44, v45)) {
      goto LABEL_15;
    }
    v46 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    v244[0] = v47;
    *(_DWORD *)v46 = 136315138;
    uint64_t v86 = sub_2257A0188();
    uint64_t v243 = sub_22572E428(v86, v87, v244);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    v50 = "[%s] Pregnancy state is in post pregnancy but we do not have a sample. This should not happen. Not making adjustment";
    goto LABEL_14;
  }
  id v223 = v54;
  id v55 = objc_msgSend(v54, sel_UUID);
  sub_22579F378();

  id v56 = objc_msgSend(a3, sel_pregnancyModeSetupCompletionSet);
  sub_22572F19C(0, (unint64_t *)&qword_26ABF9A88);
  sub_22572F36C(&qword_26ABF9A90, (unint64_t *)&qword_26ABF9A88);
  uint64_t v57 = sub_22579FBE8();

  MEMORY[0x270FA5388](v58);
  *(&v215 - 2) = (uint64_t)v19;
  sub_22578764C(sub_22577C0B8, (uint64_t)(&v215 - 4), v57);
  v60 = v59;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  if (!v60)
  {
    if (HKShowSensitiveLogItems())
    {
      if (qword_26ABF9378 != -1) {
        swift_once();
      }
      uint64_t v88 = sub_22579F458();
      __swift_project_value_buffer(v88, (uint64_t)qword_26ABF94A0);
      v89 = sub_22579F438();
      os_log_type_t v90 = sub_22579FCB8();
      if (os_log_type_enabled(v89, v90))
      {
        v91 = (uint8_t *)swift_slowAlloc();
        uint64_t v92 = swift_slowAlloc();
        v244[0] = v92;
        *(_DWORD *)v91 = 136315138;
        uint64_t v93 = sub_2257A0188();
        uint64_t v243 = sub_22572E428(v93, v94, v244);
        sub_22579FD68();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_225722000, v89, v90, "[%s] Pregnancy state is in post pregnancy but we do not have a corresponding setup record, not making adjustment", v91, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A635470](v92, -1, -1);
        MEMORY[0x22A635470](v91, -1, -1);
      }
    }
    v240();
    swift_release();

    v95 = &v245;
    goto LABEL_53;
  }
  id v224 = v60;
  id v61 = objc_msgSend(v60, sel_pregnancyAdjustedFeaturesSet);
  type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
  uint64_t v63 = v62;
  v64 = (void *)sub_22577C0D8(&qword_268105290, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
  uint64_t v222 = v63;
  uint64_t v65 = sub_22579FBE8();

  id v66 = (id)*MEMORY[0x263F450D8];
  char v67 = sub_22576F1B4((uint64_t)v66, v65);

  swift_bridgeObjectRelease();
  uint64_t v68 = v236;
  if ((v67 & 1) == 0)
  {
    id v69 = v66;
    id v70 = objc_msgSend(v224, sel_postPregnancyFeatureAdjustmentCompletionLog);
    uint64_t v71 = sub_22579FA38();

    if (*(void *)(v71 + 16) && (unint64_t v72 = sub_2257824B8((uint64_t)v69), (v73 & 1) != 0))
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v235 + 16))(v38, *(void *)(v71 + 56) + *(void *)(v235 + 72) * v72, v68);
      uint64_t v74 = 0;
    }
    else
    {
      uint64_t v74 = 1;
    }
    uint64_t v96 = v235;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v235 + 56))(v38, v74, 1, v68);

    swift_bridgeObjectRelease();
    int v97 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v96 + 48))(v38, 1, v68);
    sub_22573C520((uint64_t)v38, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
    if (v97 == 1)
    {
      if (HKShowSensitiveLogItems())
      {
        if (qword_26ABF9378 != -1) {
          swift_once();
        }
        uint64_t v98 = sub_22579F458();
        __swift_project_value_buffer(v98, (uint64_t)qword_26ABF94A0);
        v99 = sub_22579F438();
        os_log_type_t v100 = sub_22579FCB8();
        if (os_log_type_enabled(v99, v100))
        {
          v101 = (uint8_t *)swift_slowAlloc();
          uint64_t v102 = swift_slowAlloc();
          v244[0] = v102;
          *(_DWORD *)v101 = 136315138;
          uint64_t v103 = sub_2257A0188();
          uint64_t v243 = sub_22572E428(v103, v104, v244);
          sub_22579FD68();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_225722000, v99, v100, "[%s] Does not require the cardio fitness adjustment, not making adjustment", v101, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x22A635470](v102, -1, -1);
          MEMORY[0x22A635470](v101, -1, -1);
        }
      }
      v240();
      swift_release();

      v95 = &v246;
LABEL_53:

      return;
    }
  }
  id v105 = objc_msgSend(v238, sel_physiologicalWashoutEndDate);
  if (v105)
  {
    v106 = v105;
    id v238 = v64;
    v107 = v231;
    sub_22579F2F8();

    v108 = v107;
    v109 = (void *)v235;
    uint64_t v111 = v235 + 32;
    v110 = *(void (**)(char *, char *, uint64_t))(v235 + 32);
    v110(v35, v108, v68);
    v112 = (void (*)(char *, void, uint64_t, uint64_t))v109[7];
    v221 = v109 + 7;
    v112(v35, 0, 1, v68);
    v113 = (uint64_t (*)(char *, uint64_t, uint64_t))v109[6];
    v220 = v109 + 6;
    v219 = v113;
    if (v113(v35, 1, v68) == 1) {
      goto LABEL_58;
    }
    v218 = v112;
    v122 = v230;
    uint64_t v215 = v111;
    v217 = (void (*)(char *, uint64_t, uint64_t))v110;
    v110(v230, v35, v68);
    sub_22579F328();
    char v123 = sub_22579F2C8();
    v124 = v108;
    char v125 = v123;
    v126 = (void (*)(char *, uint64_t))v109[1];
    v126(v124, v68);
    if ((v125 & 1) == 0)
    {
      v126(v122, v68);
      v112 = v218;
      goto LABEL_59;
    }
    v216 = v126;
    id v127 = v66;
    id v128 = objc_msgSend(v224, sel_postPregnancyFeatureAdjustmentCompletionLog);
    uint64_t v129 = sub_22579FA38();

    if (*(void *)(v129 + 16))
    {
      unint64_t v130 = sub_2257824B8((uint64_t)v127);
      v131 = v218;
      v132 = v217;
      if (v133)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v235 + 16))(v32, *(void *)(v129 + 56) + *(void *)(v235 + 72) * v130, v236);
        uint64_t v134 = 0;
      }
      else
      {
        uint64_t v134 = 1;
      }
      v156 = v216;
    }
    else
    {
      uint64_t v134 = 1;
      v156 = v216;
      v131 = v218;
      v132 = v217;
    }
    uint64_t v157 = v236;
    v131(v32, v134, 1, v236);

    swift_bridgeObjectRelease();
    int v158 = v219(v32, 1, v157);
    sub_22573C520((uint64_t)v32, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
    if (v158 == 1)
    {
      if (HKShowSensitiveLogItems())
      {
        if (qword_26ABF9378 != -1) {
          swift_once();
        }
        uint64_t v159 = sub_22579F458();
        __swift_project_value_buffer(v159, (uint64_t)qword_26ABF94A0);
        v160 = sub_22579F438();
        os_log_type_t v161 = sub_22579FCB8();
        if (os_log_type_enabled(v160, v161))
        {
          v162 = (uint8_t *)swift_slowAlloc();
          uint64_t v163 = swift_slowAlloc();
          v244[0] = v163;
          *(_DWORD *)v162 = 136315138;
          uint64_t v164 = sub_2257A0188();
          uint64_t v243 = sub_22572E428(v164, v165, v244);
          sub_22579FD68();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_225722000, v160, v161, "[%s] Physiological washout date has not yet passed, and we do not have a post pregnancy adjustment date. No adjustment needed yet.", v162, 0xCu);
          swift_arrayDestroy();
          uint64_t v166 = v163;
          v156 = v216;
          MEMORY[0x22A635470](v166, -1, -1);
          MEMORY[0x22A635470](v162, -1, -1);
        }
      }
      v240();

      v156(v230, v157);
LABEL_115:
      swift_release();
      return;
    }
    id v167 = v127;
    id v168 = objc_msgSend(v224, sel_postPregnancyFeatureAdjustmentCompletionLog);
    uint64_t v169 = sub_22579FA38();

    if (*(void *)(v169 + 16))
    {
      unint64_t v170 = sub_2257824B8((uint64_t)v167);
      uint64_t v171 = (uint64_t)v227;
      uint64_t v172 = (uint64_t)v228;
      uint64_t v173 = (uint64_t)v225;
      if (v174)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v235 + 16))(v227, *(void *)(v169 + 56) + *(void *)(v235 + 72) * v170, v236);
        uint64_t v175 = 0;
      }
      else
      {
        uint64_t v175 = 1;
      }
    }
    else
    {
      uint64_t v175 = 1;
      uint64_t v171 = (uint64_t)v227;
      uint64_t v172 = (uint64_t)v228;
      uint64_t v173 = (uint64_t)v225;
    }
    uint64_t v176 = v236;
    v131((char *)v171, v175, 1, v236);

    swift_bridgeObjectRelease();
    sub_22579F288();
    v131((char *)v173, 0, 1, v176);
    uint64_t v177 = v229;
    uint64_t v178 = v229 + *(int *)(v226 + 48);
    sub_22577C120(v171, v229);
    sub_22577C120(v173, v178);
    v179 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v219;
    if (v219((char *)v177, 1, v176) == 1)
    {
      uint64_t v180 = v173;
      v181 = (void (*)(uint64_t))MEMORY[0x263F07490];
      sub_22573C520(v180, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
      sub_22573C520(v171, (unint64_t *)&unk_26ABF9490, v181);
      int v182 = v179(v178, 1, v176);
      uint64_t v183 = v176;
      id v184 = v224;
      if (v182 == 1)
      {
        sub_22573C520(v177, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
LABEL_108:
        if (HKShowSensitiveLogItems())
        {
          if (qword_26ABF9378 != -1) {
            swift_once();
          }
          uint64_t v192 = sub_22579F458();
          __swift_project_value_buffer(v192, (uint64_t)qword_26ABF94A0);
          v193 = sub_22579F438();
          os_log_type_t v194 = sub_22579FCB8();
          if (os_log_type_enabled(v193, v194))
          {
            v195 = (uint8_t *)swift_slowAlloc();
            uint64_t v196 = swift_slowAlloc();
            v244[0] = v196;
            *(_DWORD *)v195 = 136315138;
            uint64_t v197 = sub_2257A0188();
            uint64_t v243 = sub_22572E428(v197, v198, v244);
            sub_22579FD68();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_225722000, v193, v194, "[%s] Physiological washout date has not yet passed, but the user has adjusted their notifications to be on again", v195, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x22A635470](v196, -1, -1);
            MEMORY[0x22A635470](v195, -1, -1);
          }

          id v184 = v224;
        }
        v240();

        v216(v230, v183);
        goto LABEL_115;
      }
    }
    else
    {
      sub_22577C120(v177, v172);
      if (v179(v178, 1, v176) != 1)
      {
        uint64_t v186 = v173;
        v187 = v231;
        v132(v231, v178, v176);
        sub_22577C0D8(&qword_26ABF9B00, MEMORY[0x263F07490]);
        char v188 = sub_22579FA88();
        uint64_t v189 = v171;
        v190 = (void (*)(uint64_t, uint64_t))v216;
        v216(v187, v176);
        v191 = (void (*)(uint64_t))MEMORY[0x263F07490];
        sub_22573C520(v186, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
        sub_22573C520(v189, (unint64_t *)&unk_26ABF9490, v191);
        v190(v172, v176);
        sub_22573C520(v177, (unint64_t *)&unk_26ABF9490, v191);
        uint64_t v183 = v176;
        id v184 = v224;
        if (v188) {
          goto LABEL_108;
        }
LABEL_116:
        if (HKShowSensitiveLogItems())
        {
          if (qword_26ABF9378 != -1) {
            swift_once();
          }
          uint64_t v199 = sub_22579F458();
          __swift_project_value_buffer(v199, (uint64_t)qword_26ABF94A0);
          v200 = sub_22579F438();
          os_log_type_t v201 = sub_22579FCB8();
          if (os_log_type_enabled(v200, v201))
          {
            v202 = (uint8_t *)swift_slowAlloc();
            uint64_t v203 = swift_slowAlloc();
            v244[0] = v203;
            *(_DWORD *)v202 = 136315138;
            uint64_t v204 = sub_2257A0188();
            uint64_t v243 = sub_22572E428(v204, v205, v244);
            sub_22579FD68();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_225722000, v200, v201, "[%s)] Physiological washout date has not passed, but we have an adjustment date! We made a mistake - reverting adjustment", v202, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x22A635470](v203, -1, -1);
            MEMORY[0x22A635470](v202, -1, -1);
          }

          id v184 = v224;
        }
        sub_22572F400();
        uint64_t v206 = swift_allocObject();
        *(_OWORD *)(v206 + 16) = xmmword_2257A3D00;
        *(void *)(v206 + 32) = v184;
        v244[0] = v206;
        sub_22579FB78();
        uint64_t v207 = v244[0];
        sub_22572F19C(0, (unint64_t *)&qword_26ABF9398);
        id v208 = v184;
        v209 = (void *)sub_22579FD18();
        uint64_t v210 = (uint64_t)v232;
        v218(v232, 1, 1, v183);
        sub_225778C9C(v207, v241, v233, v209, v210, v240, v239, v234);

        sub_22573C520(v210, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
        swift_bridgeObjectRelease();
        v216(v230, v183);
        swift_release();
        return;
      }
      v185 = (void (*)(uint64_t))MEMORY[0x263F07490];
      sub_22573C520(v173, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
      sub_22573C520(v171, (unint64_t *)&unk_26ABF9490, v185);
      v216((char *)v172, v176);
      uint64_t v183 = v176;
      id v184 = v224;
    }
    sub_22577C1A0(v177);
    goto LABEL_116;
  }
  v112 = *(void (**)(char *, void, uint64_t, uint64_t))(v235 + 56);
  v112(v35, 1, 1, v68);
LABEL_58:
  sub_22573C520((uint64_t)v35, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
LABEL_59:
  id v114 = v66;
  id v115 = objc_msgSend(v224, sel_postPregnancyFeatureAdjustmentCompletionLog);
  uint64_t v116 = sub_22579FA38();

  if (*(void *)(v116 + 16))
  {
    unint64_t v117 = sub_2257824B8((uint64_t)v114);
    uint64_t v118 = v235;
    if (v119)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v235 + 16))(v23, *(void *)(v116 + 56) + *(void *)(v235 + 72) * v117, v68);
      uint64_t v120 = 0;
    }
    else
    {
      uint64_t v120 = 1;
    }
    id v121 = v224;
  }
  else
  {
    uint64_t v120 = 1;
    id v121 = v224;
    uint64_t v118 = v235;
  }
  v112(v23, v120, 1, v68);

  swift_bridgeObjectRelease();
  int v135 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v118 + 48))(v23, 1, v68);
  sub_22573C520((uint64_t)v23, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
  char v136 = HKShowSensitiveLogItems();
  if (v135 == 1)
  {
    if (v136)
    {
      if (qword_26ABF9378 != -1) {
        swift_once();
      }
      uint64_t v137 = sub_22579F458();
      __swift_project_value_buffer(v137, (uint64_t)qword_26ABF94A0);
      v138 = sub_22579F438();
      os_log_type_t v139 = sub_22579FCB8();
      if (os_log_type_enabled(v138, v139))
      {
        v140 = (uint8_t *)swift_slowAlloc();
        uint64_t v141 = swift_slowAlloc();
        v244[0] = v141;
        *(_DWORD *)v140 = 136315138;
        uint64_t v142 = sub_2257A0188();
        uint64_t v243 = sub_22572E428(v142, v143, v244);
        sub_22579FD68();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_225722000, v138, v139, "[%s)] Physiological washout date has passed, but we have not yet adjusted features, making adjustment", v140, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A635470](v141, -1, -1);
        MEMORY[0x22A635470](v140, -1, -1);
      }

      id v121 = v224;
    }
    sub_22572F400();
    uint64_t v144 = swift_allocObject();
    *(_OWORD *)(v144 + 16) = xmmword_2257A3D00;
    *(void *)(v144 + 32) = v121;
    v244[0] = v144;
    sub_22579FB78();
    uint64_t v145 = v244[0];
    sub_22572F19C(0, (unint64_t *)&qword_26ABF9398);
    id v146 = v121;
    v147 = (void *)sub_22579FD18();
    uint64_t v148 = (uint64_t)v232;
    sub_22579F328();
    v112((char *)v148, 0, 1, v68);
    sub_225778C9C(v145, v241, v233, v147, v148, v240, v239, v234);

    sub_22573C520(v148, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
    swift_release();
    swift_bridgeObjectRelease();

    goto LABEL_17;
  }
  if (v136)
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v149 = sub_22579F458();
    __swift_project_value_buffer(v149, (uint64_t)qword_26ABF94A0);
    v150 = sub_22579F438();
    os_log_type_t v151 = sub_22579FCB8();
    if (os_log_type_enabled(v150, v151))
    {
      v152 = (uint8_t *)swift_slowAlloc();
      uint64_t v153 = swift_slowAlloc();
      v244[0] = v153;
      *(_DWORD *)v152 = 136315138;
      uint64_t v154 = sub_2257A0188();
      uint64_t v243 = sub_22572E428(v154, v155, v244);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v150, v151, "[%s] Physiological washout date has passed, and we have a post pregnancy adjustment date. No more work needed here.", v152, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v153, -1, -1);
      MEMORY[0x22A635470](v152, -1, -1);
    }

    id v121 = v224;
  }
  v240();
  swift_release();
}

uint64_t sub_225728034(uint64_t (*a1)(uint64_t, void))
{
  uint64_t v2 = v1;
  swift_getObjectType();
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_22579F458();
  __swift_project_value_buffer(v4, (uint64_t)qword_26ABF94A0);
  uint64_t v5 = sub_22579F438();
  os_log_type_t v6 = sub_22579FCB8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v13 = v8;
    *(_DWORD *)uint64_t v7 = 136446210;
    uint64_t v9 = sub_2257A0188();
    sub_22572E428(v9, v10, &v13);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v5, v6, "[%{public}s] Starting observation", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v8, -1, -1);
    MEMORY[0x22A635470](v7, -1, -1);
  }

  uint64_t v11 = *(void **)(v2 + OBJC_IVAR___HDMCExperienceStoreServer_experienceModelManager);
  if (v11) {
    objc_msgSend(v11, sel_registerWithObserver_, v2);
  }
  return a1(1, 0);
}

id sub_225728204()
{
  v16[1] = *(id *)MEMORY[0x263EF8340];
  swift_getObjectType();
  if (*(void *)(v0
                 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_cardioFitnessFeatureStatusManager))
  {
    id v1 = *(id *)(v0
               + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_cardioFitnessFeatureStatusManager);
  }
  else
  {
    uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_profile);
    id v3 = objc_msgSend(v2, sel_featureAvailabilityProvidingForFeatureIdentifier_, *MEMORY[0x263F09730]);
    if (!v3)
    {
      if (HKShowSensitiveLogItems())
      {
        if (qword_26ABF9378 != -1) {
          swift_once();
        }
        uint64_t v9 = sub_22579F458();
        __swift_project_value_buffer(v9, (uint64_t)qword_26ABF94A0);
        unint64_t v10 = sub_22579F438();
        os_log_type_t v11 = sub_22579FCB8();
        if (os_log_type_enabled(v10, v11))
        {
          uint64_t v12 = (uint8_t *)swift_slowAlloc();
          uint64_t v13 = (void *)swift_slowAlloc();
          v16[0] = v13;
          *(_DWORD *)uint64_t v12 = 136315138;
          uint64_t v14 = sub_2257A0188();
          sub_22572E428(v14, v15, (uint64_t *)v16);
          sub_22579FD68();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_225722000, v10, v11, "[%s] Not making LCF Feature Adjustment: Could not get cardio fitness feature availability provider", v12, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x22A635470](v13, -1, -1);
          MEMORY[0x22A635470](v12, -1, -1);
        }
      }
      return 0;
    }
    id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A3D0]), sel_initWithFeatureAvailabilityProviding_healthDataSource_currentCountryCode_, v3, v2, 0);
    swift_unknownObjectRelease();
  }
  v16[0] = 0;
  swift_unknownObjectRetain();
  id v4 = objc_msgSend(v1, sel_featureStatusWithError_, v16);
  id v5 = v16[0];
  if (!v4)
  {
    os_log_type_t v6 = v5;
    uint64_t v7 = (void *)sub_22579F258();

    swift_willThrow();
    swift_unknownObjectRelease();

    return 0;
  }
  swift_unknownObjectRelease();
  return v4;
}

id HDMCExperienceStoreServer.init(uuid:configuration:client:delegate:)(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  swift_unknownObjectWeakInit();
  uint64_t v9 = v4;
  id v10 = objc_msgSend(a3, sel_profile);
  id v11 = objc_msgSend(v10, sel_profileExtensionWithIdentifier_, *MEMORY[0x263F450C8]);

  if (v11)
  {
    sub_22579FD88();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v21, 0, sizeof(v21));
  }
  sub_22572FD88((uint64_t)v21, (uint64_t)v22);
  if (!v23)
  {
    sub_22578F520((uint64_t)v22, (uint64_t (*)(void))sub_22578CB14);
    goto LABEL_8;
  }
  sub_22572F19C(0, (unint64_t *)&unk_26ABF9510);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    id v14 = 0;
    uint64_t v12 = 0;
    *(void *)&v9[OBJC_IVAR___HDMCExperienceStoreServer_experienceModelManager] = 0;
    goto LABEL_9;
  }
  uint64_t v12 = v19;
  id v13 = objc_msgSend(v19, sel_experienceModelManager);
  *(void *)&v9[OBJC_IVAR___HDMCExperienceStoreServer_experienceModelManager] = v13;
  id v14 = objc_msgSend(v19, sel_pregnancyManager);
LABEL_9:
  swift_unknownObjectWeakAssign();

  unint64_t v15 = (void *)sub_22579F358();
  v20.receiver = v9;
  v20.super_class = (Class)type metadata accessor for HDMCExperienceStoreServer();
  id v16 = objc_msgSendSuper2(&v20, sel_initWithUUID_configuration_client_delegate_, v15, a2, a3, a4);

  swift_unknownObjectRelease();
  uint64_t v17 = sub_22579F398();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(a1, v17);
  return v16;
}

void sub_2257286FC(uint64_t a1, void *a2, void *a3, void (*a4)(void), uint64_t a5, uint64_t a6)
{
  uint64_t v120 = a5;
  id v128 = a3;
  id v144 = a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v9 = sub_22579F338();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v125 = (char *)&v118 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2257383A8(0, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  v126 = (char *)&v118 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v136 = (uint64_t)&v118 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  id v19 = (char *)&v118 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v124 = (uint64_t)&v118 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v118 - v22;
  uint64_t v24 = sub_22579F398();
  id v146 = *(void (***)(char *, uint64_t))(v24 - 8);
  uint64_t v147 = v24;
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v135 = (uint64_t)&v118 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  v131 = (char *)&v118 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)&v118 - v29;
  uint64_t v31 = (void *)*MEMORY[0x263F450D8];
  swift_retain();
  id v134 = v31;
  BOOL v140 = sub_225729700();
  id v133 = (id)*MEMORY[0x263F450E0];
  BOOL v139 = sub_225729700();
  uint64_t v129 = a6;
  uint64_t v32 = sub_2257250CC();
  if (!v32)
  {
LABEL_10:
    swift_release();
    return;
  }
  unint64_t v33 = v32;
  v122 = v23;
  char v123 = v19;
  char v34 = HKShowSensitiveLogItems();
  unint64_t v35 = v33 >> 62;
  uint64_t v148 = v9;
  unint64_t v142 = v33;
  if ((v34 & 1) == 0) {
    goto LABEL_12;
  }
  if (qword_26ABF9378 != -1) {
    goto LABEL_61;
  }
  while (1)
  {
    uint64_t v36 = sub_22579F458();
    __swift_project_value_buffer(v36, (uint64_t)qword_26ABF94A0);
    swift_bridgeObjectRetain_n();
    uint64_t v37 = sub_22579F438();
    os_log_type_t v38 = sub_22579FCB8();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v118 = a4;
      uint64_t v127 = a1;
      uint64_t v39 = swift_slowAlloc();
      uint64_t v145 = (void *)swift_slowAlloc();
      v152 = v145;
      *(_DWORD *)uint64_t v39 = 136315650;
      uint64_t v40 = sub_2257A0188();
      uint64_t v151 = sub_22572E428(v40, v41, (uint64_t *)&v152);
      sub_22579FD68();
      unint64_t v42 = v142;
      swift_bridgeObjectRelease();
      *(_WORD *)(v39 + 12) = 2048;
      uint64_t v43 = v30;
      if (v35)
      {
        swift_bridgeObjectRetain();
        uint64_t v44 = sub_22579FF88();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v44 = *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      uint64_t v151 = v44;
      sub_22579FD68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v39 + 22) = 2080;
      uint64_t v45 = sub_22572F19C(0, &qword_268105618);
      swift_bridgeObjectRetain();
      uint64_t v46 = MEMORY[0x22A634010](v142, v45);
      unint64_t v48 = v47;
      swift_bridgeObjectRelease();
      uint64_t v151 = sub_22572E428(v46, v48, (uint64_t *)&v152);
      unint64_t v33 = v142;
      sub_22579FD68();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v37, v38, "[%s] Retrieved %ld deleted sample tombstones: %s", (uint8_t *)v39, 0x20u);
      id v49 = v145;
      swift_arrayDestroy();
      MEMORY[0x22A635470](v49, -1, -1);
      MEMORY[0x22A635470](v39, -1, -1);

      a1 = v127;
      a4 = v118;
      uint64_t v30 = v43;
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
LABEL_12:
    v152 = (void *)MEMORY[0x263F8EE88];
    if (v35)
    {
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_22579FF88();
      swift_bridgeObjectRelease();
      if (!v50)
      {
LABEL_52:
        swift_bridgeObjectRelease();
        uint64_t v109 = MEMORY[0x263F8EE88];
        if (*(void *)(MEMORY[0x263F8EE88] + 16)) {
          goto LABEL_49;
        }
        goto LABEL_53;
      }
    }
    else
    {
      uint64_t v50 = *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v50) {
        goto LABEL_52;
      }
    }
    if (v50 >= 1) {
      break;
    }
    __break(1u);
LABEL_61:
    swift_once();
  }
  uint64_t v118 = a4;
  uint64_t v127 = a1;
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  unint64_t v143 = v33 & 0xC000000000000001;
  ++v146;
  uint64_t v141 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v132 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  id v121 = (void (**)(char *, uint64_t, uint64_t))(v10 + 32);
  uint64_t v137 = v50;
  v138 = v30;
  do
  {
    if (v143) {
      id v53 = (id)MEMORY[0x22A634380](v51, v33);
    }
    else {
      id v53 = *(id *)(v33 + 8 * v51 + 32);
    }
    id v54 = v53;
    id v55 = objc_msgSend(v53, sel_UUID, v118, ObjectType, v120);
    sub_22579F378();

    id v56 = objc_msgSend(v144, sel_pregnancyModeSetupCompletionSet);
    sub_22572F19C(0, (unint64_t *)&qword_26ABF9A88);
    sub_22572F36C(&qword_26ABF9A90, (unint64_t *)&qword_26ABF9A88);
    uint64_t v57 = sub_22579FBE8();

    MEMORY[0x270FA5388](v58);
    *(&v118 - 2) = (void (*)(void))v30;
    sub_22578764C(sub_22577C9F4, (uint64_t)(&v118 - 4), v57);
    v60 = v59;
    swift_bridgeObjectRelease();
    id v61 = *v146;
    (*v146)(v30, v147);
    if (!v60)
    {

      goto LABEL_17;
    }
    uint64_t v145 = v54;
    id v62 = objc_msgSend(v60, sel_pregnancyAdjustedFeaturesSet);
    type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
    sub_22577C0D8(&qword_268105290, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
    uint64_t v63 = sub_22579FBE8();

    uint64_t v151 = v63;
    swift_bridgeObjectRetain();
    id v64 = objc_msgSend(v60, sel_postPregnancyFeatureAdjustmentCompletionLog);
    uint64_t v65 = sub_22579FA38();

    uint64_t v150 = v65;
    if (!v140)
    {
      swift_bridgeObjectRelease();
LABEL_28:
      if (v139) {
        goto LABEL_29;
      }
      goto LABEL_35;
    }
    id v66 = v134;
    char v67 = sub_22576F1B4((uint64_t)v66, v63);

    swift_bridgeObjectRelease();
    if ((v67 & 1) == 0) {
      goto LABEL_28;
    }
    id v68 = v66;
    id v69 = (void *)sub_225771048();

    id v70 = v68;
    uint64_t v71 = (uint64_t)v122;
    sub_22579F288();
    uint64_t v72 = v148;
    (*v141)(v71, 0, 1, v148);
    if ((*v132)(v71, 1, v72) == 1)
    {
      char v73 = (void (*)(uint64_t))MEMORY[0x263F07490];
      uint64_t v130 = v52;
      sub_22573C520(v71, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
      uint64_t v74 = v124;
      sub_22577125C((uint64_t)v70, v124);

      uint64_t v52 = v130;
      sub_22573C520(v74, (unint64_t *)&unk_26ABF9490, v73);
      if (v139) {
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v85 = (uint64_t)v125;
      (*v121)(v125, v71, v72);
      uint64_t v86 = v150;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v149 = v86;
      sub_225775630(v85, v70, isUniquelyReferenced_nonNull_native);
      uint64_t v150 = v149;

      swift_bridgeObjectRelease();
      if (v139)
      {
LABEL_29:
        uint64_t v75 = v151;
        swift_bridgeObjectRetain();
        id v76 = v133;
        char v77 = sub_22576F1B4((uint64_t)v76, v75);

        swift_bridgeObjectRelease();
        if (v77)
        {
          id v78 = v76;
          unint64_t v79 = (void *)sub_225771048();

          id v80 = v78;
          uint64_t v81 = (uint64_t)v123;
          sub_22579F288();
          uint64_t v82 = v148;
          (*v141)(v81, 0, 1, v148);
          if ((*v132)(v81, 1, v82) == 1)
          {
            uint64_t v83 = (void (*)(uint64_t))MEMORY[0x263F07490];
            uint64_t v130 = v52;
            sub_22573C520(v81, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
            uint64_t v84 = v124;
            sub_22577125C((uint64_t)v80, v124);

            uint64_t v52 = v130;
            sub_22573C520(v84, (unint64_t *)&unk_26ABF9490, v83);
          }
          else
          {
            uint64_t v88 = (uint64_t)v125;
            (*v121)(v125, v81, v82);
            uint64_t v89 = v150;
            char v90 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v149 = v89;
            sub_225775630(v88, v80, v90);
            uint64_t v150 = v149;

            swift_bridgeObjectRelease();
          }
        }
      }
    }
LABEL_35:
    uint64_t v91 = *(void *)(v151 + 16);
    if (v91)
    {
      id v92 = objc_msgSend(v60, sel_pregnancyAdjustedFeaturesSet);
      uint64_t v93 = sub_22579FBE8();

      uint64_t v94 = *(void *)(v93 + 16);
      swift_bridgeObjectRelease();
      if (v91 == v94)
      {

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        id v97 = objc_msgSend(v60, sel_version);
        id v98 = objc_msgSend(v60, sel_sampleUUID);
        sub_22579F378();

        id v99 = objc_msgSend(v60, sel_educationalStepsReviewDate);
        uint64_t v100 = v148;
        if (v99)
        {
          v101 = v99;
          uint64_t v102 = v136;
          sub_22579F2F8();

          uint64_t v103 = *v141;
          (*v141)(v102, 0, 1, v100);
        }
        else
        {
          uint64_t v103 = *v141;
          (*v141)(v136, 1, 1, v148);
        }
        id v104 = objc_msgSend(v60, sel_configurationStepsReviewDate);
        if (v104)
        {
          id v105 = v104;
          uint64_t v106 = (uint64_t)v126;
          sub_22579F2F8();

          uint64_t v107 = 0;
        }
        else
        {
          uint64_t v107 = 1;
          uint64_t v106 = (uint64_t)v126;
        }
        v103(v106, v107, 1, v148);
        objc_allocWithZone(MEMORY[0x263F451A8]);
        swift_bridgeObjectRetain();
        id v108 = sub_22577B8B0((uint64_t)v97, v135, v136, v106);

        sub_22577A730(v108, v128, v127);
        swift_bridgeObjectRelease();
      }
      uint64_t v30 = v138;
    }
    else
    {
      swift_bridgeObjectRelease();
      id v95 = objc_msgSend(v60, sel_sampleUUID);
      uint64_t v96 = v131;
      sub_22579F378();

      uint64_t v30 = v138;
      sub_22577141C((uint64_t)v138, v96);

      v61(v30, v147);
      swift_bridgeObjectRelease();
    }
    unint64_t v33 = v142;
    uint64_t v50 = v137;
LABEL_17:
    ++v51;
  }
  while (v50 != v51);
  swift_bridgeObjectRelease();
  uint64_t v109 = (uint64_t)v152;
  a1 = v127;
  a4 = v118;
  if (v152[2])
  {
LABEL_49:
    sub_2257796B0(v109, v128, a1);
    uint64_t v110 = swift_bridgeObjectRelease();
    if (a4) {
      a4(v110);
    }
    goto LABEL_10;
  }
LABEL_53:
  swift_bridgeObjectRelease();
  if ((HKShowSensitiveLogItems() & 1) == 0) {
    goto LABEL_10;
  }
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v111 = sub_22579F458();
  __swift_project_value_buffer(v111, (uint64_t)qword_26ABF94A0);
  v112 = sub_22579F438();
  os_log_type_t v113 = sub_22579FCB8();
  if (os_log_type_enabled(v112, v113))
  {
    id v114 = (uint8_t *)swift_slowAlloc();
    uint64_t v115 = swift_slowAlloc();
    uint64_t v151 = v115;
    *(_DWORD *)id v114 = 136315138;
    uint64_t v116 = sub_2257A0188();
    uint64_t v150 = sub_22572E428(v116, v117, &v151);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v112, v113, "[%s] No records meeting the deletion requirements", v114, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v115, -1, -1);
    MEMORY[0x22A635470](v114, -1, -1);
  }
  swift_release();
}

BOOL sub_225729700()
{
  uint64_t v0 = sub_22579FAC8();
  uint64_t v2 = v1;
  if (v0 == sub_22579FAC8() && v2 == v3)
  {
    swift_bridgeObjectRelease_n();
LABEL_13:
    id v13 = sub_225728204();
    if (!v13) {
      return 0;
    }
    uint64_t v14 = v13;
    id v15 = objc_msgSend(v13, sel_objectForKeyedSubscript_, *MEMORY[0x263F09600]);
    id v12 = objc_msgSend(v15, sel_areAllRequirementsSatisfied);

    return (BOOL)v12;
  }
  char v5 = sub_2257A0068();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v5) {
    goto LABEL_13;
  }
  uint64_t v6 = sub_22579FAC8();
  uint64_t v8 = v7;
  if (v6 == sub_22579FAC8() && v8 == v9)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v11 = sub_2257A0068();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v12 = 0;
    if ((v11 & 1) == 0) {
      return (BOOL)v12;
    }
  }
  char v16 = sub_225725900();
  return (v16 & 1) == 0 && v16 != 2;
}

void sub_22572987C(void (*a1)(id, void))
{
  uint64_t v2 = v1;
  swift_getObjectType();
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_22579F458();
  __swift_project_value_buffer(v4, (uint64_t)qword_26ABF94A0);
  char v5 = sub_22579F438();
  os_log_type_t v6 = sub_22579FCB8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v21 = v8;
    *(_DWORD *)uint64_t v7 = 136446210;
    uint64_t v9 = sub_2257A0188();
    sub_22572E428(v9, v10, &v21);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v5, v6, "[%{public}s] Fetching experience model", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v8, -1, -1);
    MEMORY[0x22A635470](v7, -1, -1);
  }

  id v11 = objc_msgSend(v2, sel_client);
  id v12 = objc_msgSend(v11, sel_profile);

  type metadata accessor for HDMCExperienceDaemonStore();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = v12;
  id v14 = objc_allocWithZone(MEMORY[0x263F43218]);
  id v15 = v12;
  char v16 = (void *)sub_22579FA98();
  id v17 = objc_msgSend(v14, sel_initWithCategory_domainName_profile_, 100, v16, v15);

  *(void *)(inited + 24) = v17;
  id v18 = HDMCExperienceDaemonStore.fetchPersistedOrDefaultState()();
  sub_225730A30();
  id v19 = sub_22572BEDC();
  swift_release();
  id v20 = v19;
  a1(v19, 0);
}

void sub_225729DB0(void *a1)
{
  id v2 = objc_msgSend(a1, sel_entitlements);
  unsigned int v3 = objc_msgSend(v2, sel_hasEntitlement_, *MEMORY[0x263F09BA8]);

  id v4 = objc_msgSend(a1, sel_entitlements);
  unsigned __int8 v5 = objc_msgSend(v4, sel_hasPrivateAccessEntitlementWithIdentifier_, *MEMORY[0x263F09B98]);

  if ((v5 & 1) == 0 && !v3)
  {
    sub_22579FEB8();
    swift_bridgeObjectRelease();
    sub_22579FAC8();
    sub_22579FB08();
    swift_bridgeObjectRelease();
    os_log_type_t v6 = self;
    sub_22579FB08();
    sub_22579FAC8();
    sub_22579FB08();
    swift_bridgeObjectRelease();
    uint64_t v7 = (void *)sub_22579FA98();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_hk_error_description_, 4, v7, 0xD00000000000001DLL, 0x80000002257A8160);

    swift_willThrow();
  }
}

uint64_t sub_225729F4C()
{
  if (qword_26ABF9878 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26ABFA540;
  swift_bridgeObjectRetain();
  swift_retain();
  return v0;
}

void sub_22572A090(void (*a1)(void), void (*a2)(void))
{
  swift_getObjectType();
  if (HKShowSensitiveLogItems())
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_22579F458();
    __swift_project_value_buffer(v4, (uint64_t)qword_26ABF94A0);
    unsigned __int8 v5 = sub_22579F438();
    os_log_type_t v6 = sub_22579FCB8();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v11 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      uint64_t v9 = sub_2257A0188();
      sub_22572E428(v9, v10, &v11);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v5, v6, "[%s] Performing requested work", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v8, -1, -1);
      MEMORY[0x22A635470](v7, -1, -1);
    }
  }
  sub_22572A244(a1, a2);
}

void sub_22572A244(void (*a1)(void), void (*a2)(void))
{
  unsigned int v3 = v2;
  swift_getObjectType();
  if (HKShowSensitiveLogItems())
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_22579F458();
    __swift_project_value_buffer(v5, (uint64_t)qword_26ABF94A0);
    os_log_type_t v6 = sub_22579F438();
    os_log_type_t v7 = sub_22579FCB8();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v32 = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      uint64_t v10 = sub_2257A0188();
      sub_22572E428(v10, v11, &v32);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v6, v7, "[%s] Updating adjusted features", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v9, -1, -1);
      MEMORY[0x22A635470](v8, -1, -1);
    }
  }
  id v12 = objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_pregnancyManager], sel_getCurrentPregnancyModel);
  if (v12)
  {
    id v13 = v12;
    id v14 = *(void **)&v3[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_profile];
    type metadata accessor for HDMCExperienceDaemonStore();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v14;
    id v16 = objc_allocWithZone(MEMORY[0x263F43218]);
    id v17 = v14;
    id v18 = (void *)sub_22579FA98();
    id v19 = objc_msgSend(v16, sel_initWithCategory_domainName_profile_, 100, v18, v17);

    *(void *)(v15 + 24) = v19;
    id v27 = HDMCExperienceDaemonStore.fetchPersistedOrDefaultState()();
    sub_225730A30();
    id v28 = sub_22572BEDC();
    swift_release();
    id v29 = v28;
    uint64_t v30 = swift_retain();
    sub_2257286FC(v30, v29, v27, (void (*)(void))a1, (uint64_t)a2, (uint64_t)v3);
    sub_225725F4C(v13, v15, v29, v27, a1, a2, v3);

    swift_release_n();
  }
  else
  {
    if (HKShowSensitiveLogItems())
    {
      if (qword_26ABF9378 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_22579F458();
      __swift_project_value_buffer(v20, (uint64_t)qword_26ABF94A0);
      uint64_t v21 = sub_22579F438();
      os_log_type_t v22 = sub_22579FC98();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = (uint8_t *)swift_slowAlloc();
        uint64_t v24 = swift_slowAlloc();
        uint64_t v32 = v24;
        *(_DWORD *)uint64_t v23 = 136315138;
        uint64_t v25 = sub_2257A0188();
        sub_22572E428(v25, v26, &v32);
        sub_22579FD68();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_225722000, v21, v22, "[%s] Could not get pregnancy state from pregnancy manager", v23, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A635470](v24, -1, -1);
        MEMORY[0x22A635470](v23, -1, -1);
      }
    }
    a1();
  }
}

void sub_22572B114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22572B170(uint64_t a1)
{
  sub_22572E408(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22572B1E4(uint64_t a1)
{
  return sub_22572B1FC(a1);
}

uint64_t sub_22572B1FC(uint64_t a1)
{
  return sub_22572B218(a1, *(void *)(v1 + 16));
}

uint64_t sub_22572B218(uint64_t a1, uint64_t a2)
{
  swift_retain();
  uint64_t v4 = sub_22572B3D0(a2, a1);
  swift_release();
  swift_getKeyPath();
  v7[4] = v4;
  sub_22572BD88(&qword_26ABF98A0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  uint64_t v5 = (void (*)(void *, void))sub_22579F938();
  sub_22572E408(0);
  sub_22572B6FC(0);
  sub_22572BD88(&qword_26ABF9A58, sub_22572B6FC);
  sub_22579F7B8();
  v5(v7, 0);
  swift_bridgeObjectRelease();
  return swift_release();
}

void sub_22572B36C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_22572B3D0(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = a2;
  sub_22572B36C(0, &qword_26ABF9A48, MEMORY[0x263F330F8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  os_log_type_t v6 = (char *)v22 - v5;
  uint64_t v25 = type metadata accessor for CoherentExperienceSetupRecord(0);
  uint64_t v7 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22572BEA0(0);
  uint64_t v24 = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = MEMORY[0x263F8EE78];
  if (v14)
  {
    v22[0] = v2;
    uint64_t v27 = MEMORY[0x263F8EE78];
    sub_2257827C8(0, v14, 0);
    uint64_t v15 = v27;
    uint64_t v16 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    uint64_t v17 = *(void *)(v7 + 72);
    v22[1] = v11 + 32;
    uint64_t v23 = v17;
    do
    {
      sub_225797084(v16, (uint64_t)v9);
      uint64_t v18 = sub_22579FA18();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v6, 1, 1, v18);
      sub_22572BD88(&qword_26ABF97B0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
      swift_retain();
      sub_22579F868();
      uint64_t v27 = v15;
      unint64_t v20 = *(void *)(v15 + 16);
      unint64_t v19 = *(void *)(v15 + 24);
      if (v20 >= v19 >> 1)
      {
        sub_2257827C8(v19 > 1, v20 + 1, 1);
        uint64_t v15 = v27;
      }
      *(void *)(v15 + 16) = v20 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v15+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(void *)(v11 + 72) * v20, v13, v24);
      v16 += v23;
      --v14;
    }
    while (v14);
  }
  return v15;
}

void sub_22572B6FC(uint64_t a1)
{
}

uint64_t sub_22572B730(void *a1)
{
  uint64_t v2 = type metadata accessor for CoherentExperienceSetupRecord(0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22579FA18();
  MEMORY[0x270FA5388](v6 - 8);
  unint64_t v42 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = type metadata accessor for CoherentExperienceSetupRecordDatabase(0);
  MEMORY[0x270FA5388](v41);
  uint64_t v39 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22572C448(0, (unint64_t *)&qword_26ABF9A40, &qword_26ABF98A8, (uint64_t)&unk_2257A50C8, MEMORY[0x263F33098]);
  uint64_t v43 = *(void *)(v9 - 8);
  uint64_t v44 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v40 = (char *)&v38 - v10;
  id v11 = objc_msgSend(a1, sel_pregnancyModeSetupCompletionSet);
  sub_22572C4E0();
  sub_22572BD88(&qword_26ABF9A90, (void (*)(uint64_t))sub_22572C4E0);
  uint64_t v12 = sub_22579FBE8();

  unint64_t v46 = v12 & 0xC000000000000001;
  if ((v12 & 0xC000000000000001) != 0)
  {
    uint64_t v13 = sub_22579FE18();
    if (v13) {
      goto LABEL_3;
    }
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t v17 = MEMORY[0x263F8EE78];
LABEL_23:
    type metadata accessor for CoherentExperienceSetupRecordDatabaseWrapper(0);
    uint64_t v33 = swift_allocObject();
    sub_22572BEA0(0);
    sub_22572BD88(&qword_26ABF9A20, sub_22572BEA0);
    sub_22572BD88(&qword_26ABF9A28, sub_22572BEA0);
    char v34 = v39;
    sub_22579F7F8();
    *(void *)&v34[*(int *)(v41 + 20)] = MEMORY[0x263F8EE80];
    sub_22579FA08();
    sub_22572BD88(&qword_26ABF98A0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
    uint64_t v35 = v40;
    uint64_t v36 = sub_22579F998();
    MEMORY[0x270FA5388](v36);
    *(&v38 - 2) = v17;
    uint64_t v37 = v44;
    sub_22579F958();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v43 + 32))(v33 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule, v35, v37);
    return v33;
  }
  uint64_t v13 = *(void *)(v12 + 16);
  if (!v13) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v51 = MEMORY[0x263F8EE78];
  sub_225782760(0, v13 & ~(v13 >> 63), 0);
  if (v46)
  {
    uint64_t result = sub_22579FDC8();
    unsigned __int8 v16 = 1;
  }
  else
  {
    uint64_t result = sub_225796C2C(v12);
    unsigned __int8 v16 = v18 & 1;
  }
  uint64_t v48 = result;
  uint64_t v49 = v15;
  unsigned __int8 v50 = v16;
  if ((v13 & 0x8000000000000000) == 0)
  {
    uint64_t v19 = v12 & 0xFFFFFFFFFFFFFF8;
    if (v12 < 0) {
      uint64_t v19 = v12;
    }
    uint64_t v45 = v19;
    do
    {
      while (1)
      {
        uint64_t v26 = v48;
        uint64_t v25 = v49;
        uint64_t v27 = v50;
        sub_2257969D4(v48, v49, v50, v12);
        sub_22577F7E0(v28, (uint64_t)v5);
        uint64_t v29 = v51;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_225782760(0, *(void *)(v29 + 16) + 1, 1);
          uint64_t v29 = v51;
        }
        unint64_t v31 = *(void *)(v29 + 16);
        unint64_t v30 = *(void *)(v29 + 24);
        if (v31 >= v30 >> 1)
        {
          sub_225782760(v30 > 1, v31 + 1, 1);
          uint64_t v29 = v51;
        }
        *(void *)(v29 + 16) = v31 + 1;
        uint64_t result = sub_2257973FC((uint64_t)v5, v29+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v31, type metadata accessor for CoherentExperienceSetupRecord);
        if (v46) {
          break;
        }
        uint64_t v20 = sub_2257832F0(v26, v25, v27, v12);
        uint64_t v22 = v21;
        char v24 = v23;
        sub_225783FD4(v26, v25, v27);
        uint64_t v48 = v20;
        uint64_t v49 = v22;
        unsigned __int8 v50 = v24 & 1;
        if (!--v13) {
          goto LABEL_22;
        }
      }
      if ((v27 & 1) == 0) {
        goto LABEL_25;
      }
      if (sub_22579FDE8()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      sub_225797464();
      uint64_t v32 = (void (*)(char *, void))sub_22579FC18();
      sub_22579FE58();
      v32(v47, 0);
      --v13;
    }
    while (v13);
LABEL_22:
    sub_225783FD4(v48, v49, v50);
    swift_bridgeObjectRelease();
    uint64_t v17 = v51;
    goto LABEL_23;
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_22572BD88(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22572BDD0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_22572BE08(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = type metadata accessor for CoherentExperienceSetupRecord(255);
    uint64_t v10 = sub_2257845A8(a3, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

void sub_22572BEA0(uint64_t a1)
{
}

id sub_22572BEDC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for CoherentExperienceSetupRecord(0);
  uint64_t v26 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22572E408(0);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22572C448(0, (unint64_t *)&qword_26ABF9A40, &qword_26ABF98A8, (uint64_t)&unk_2257A50C8, MEMORY[0x263F33098]);
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  int64_t v14 = (char *)&v25 - v13;
  uint64_t v15 = v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  swift_getKeyPath();
  sub_22572BD88(&qword_26ABF98A0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  sub_22579F968();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v16 = sub_22579F7A8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v17 = *(void *)(v16 + 16);
  if (v17)
  {
    unint64_t v28 = MEMORY[0x263F8EE78];
    sub_22579FF28();
    uint64_t v18 = v16 + ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80));
    uint64_t v19 = *(void *)(v26 + 72);
    do
    {
      sub_225797084(v18, (uint64_t)v4);
      sub_225794934((uint64_t)v4, &v27);
      sub_22579732C((uint64_t)v4, type metadata accessor for CoherentExperienceSetupRecord);
      sub_22579FF08();
      sub_22579FF38();
      sub_22579FF48();
      sub_22579FF18();
      v18 += v19;
      --v17;
    }
    while (v17);
    unint64_t v20 = v28;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v20 = MEMORY[0x263F8EE78];
  }
  sub_22572C520(v20);
  swift_bridgeObjectRelease();
  id v21 = objc_allocWithZone(MEMORY[0x263F45160]);
  sub_22572C4E0();
  sub_22572BD88(&qword_26ABF9A90, (void (*)(uint64_t))sub_22572C4E0);
  uint64_t v22 = (void *)sub_22579FBD8();
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(v21, sel_initWithPregnancyModeSetupCompletionSet_, v22);

  return v23;
}

uint64_t type metadata accessor for CoherentExperienceSetupRecord(uint64_t a1)
{
  return sub_22572BDD0(a1, qword_26ABF97C8);
}

uint64_t sub_22572C370()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
  sub_22572C448(0, (unint64_t *)&qword_26ABF9A40, &qword_26ABF98A8, (uint64_t)&unk_2257A50C8, MEMORY[0x263F33098]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

void sub_22572C448(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = type metadata accessor for CoherentExperienceSetupRecordDatabase(255);
    uint64_t v10 = sub_22572BD88(a3, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

unint64_t sub_22572C4E0()
{
  unint64_t result = qword_26ABF9A88;
  if (!qword_26ABF9A88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26ABF9A88);
  }
  return result;
}

uint64_t sub_22572C520(unint64_t a1)
{
  return sub_22572F1D8(a1, (unint64_t *)&qword_26ABF9A88, 0x263F451A8, &qword_26ABF9A90, (void (*)(id *, uint64_t))sub_2257713F8);
}

uint64_t sub_22572C61C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22572E408(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

Swift::Void __swiftcall HDMCPregnancyStateQueryServer._queue_start()()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_22579F398();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21.receiver = v1;
  v21.super_class = ObjectType;
  objc_msgSendSuper2(&v21, sel__queue_start);
  id v7 = objc_msgSend(v1, sel_clientProxy);
  if (v7
    && (id v8 = objc_msgSend(v7, sel_remoteObjectProxy),
        swift_unknownObjectRelease(),
        sub_22579FD88(),
        swift_unknownObjectRelease(),
        sub_2257311B0(),
        (swift_dynamicCast() & 1) != 0))
  {
    uint64_t v9 = (void *)v20[1];
    id v10 = objc_msgSend(v1, sel_configuration);
    self;
    unint64_t v11 = (void *)swift_dynamicCastObjCClass();
    if (v11)
    {
      unsigned int v12 = objc_msgSend(v11, sel_isRunningForMaintenance);
      uint64_t v13 = *(void *)&v1[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer_pregnancyManager];
      objc_msgSend(*(id *)(v13 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers), sel_registerObserver_, v1);
      if (v12)
      {
        uint64_t v14 = 2;
      }
      else
      {
        objc_msgSend(*(id *)(v13 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers), sel_registerObserver_, v1);
        uint64_t v14 = 1;
      }
      sub_22572CA2C(v14, 4);
      swift_unknownObjectRelease();
    }
    else
    {

      sub_22579FAC8();
      id v15 = objc_allocWithZone(MEMORY[0x263F087E8]);
      uint64_t v16 = (void *)sub_22579FA98();
      swift_bridgeObjectRelease();
      id v17 = objc_msgSend(v15, sel_initWithDomain_code_userInfo_, v16, 100, 0);

      uint64_t v18 = (void *)sub_22579F248();
      id v19 = objc_msgSend(v1, sel_queryUUID);
      sub_22579F378();

      id v10 = (id)sub_22579F358();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      objc_msgSend(v9, sel_client_deliverError_forQuery_, v18, v10);
      swift_unknownObjectRelease();
    }
  }
  else
  {
    sub_22579FF78();
    __break(1u);
  }
}

void sub_22572CA2C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  v52[1] = *MEMORY[0x263EF8340];
  uint64_t ObjectType = (void *)swift_getObjectType();
  uint64_t v7 = sub_22579F458();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v7, (uint64_t)qword_26ABF94A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  unsigned int v12 = sub_22579F438();
  os_log_type_t v13 = sub_22579FCB8();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v47 = v11;
    uint64_t v48 = a1;
    uint64_t v50 = v3;
    char v14 = a2;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    id v51 = ObjectType;
    v52[0] = v46;
    *(_DWORD *)uint64_t v15 = 136315394;
    uint64_t v49 = ObjectType;
    swift_getMetatypeMetadata();
    uint64_t v16 = sub_225737FD8();
    id v51 = (id)sub_22572E428(v16, v17, v52);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    unint64_t v18 = 0x80000002257A8EF0;
    uint64_t v19 = 0xD000000000000015;
    switch(v14)
    {
      case 1:
        unint64_t v18 = 0xEB00000000646564;
        uint64_t v19 = 0x6441656C706D6153;
        break;
      case 2:
        unint64_t v18 = 0xED0000646574656CLL;
        uint64_t v19 = 0x6544656C706D6153;
        break;
      case 3:
        break;
      case 4:
        unint64_t v20 = "NewObserverRegistered";
        goto LABEL_11;
      case 5:
        unint64_t v20 = "ExperienceModelUpdate";
LABEL_11:
        unint64_t v18 = (unint64_t)(v20 - 32) | 0x8000000000000000;
        break;
      case 6:
        unint64_t v18 = 0xEF6E69616741676ELL;
        uint64_t v19 = 0x6974736575716552;
        break;
      default:
        unint64_t v18 = 0xEE006E6F6974617ALL;
        uint64_t v19 = 0x696C616974696E49;
        break;
    }
    id v51 = (id)sub_22572E428(v19, v18, v52);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v12, v13, "[%s] Requesting protected data operation, reason: %s", (uint8_t *)v15, 0x16u);
    uint64_t v21 = v46;
    swift_arrayDestroy();
    MEMORY[0x22A635470](v21, -1, -1);
    MEMORY[0x22A635470](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t ObjectType = v49;
    uint64_t v3 = v50;
    a1 = v48;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  uint64_t v22 = *(void **)(v3 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_protectedDataOperation);
  id v51 = 0;
  if (objc_msgSend(v22, sel_requestWorkWithPriority_error_, a1, &v51))
  {
    uint64_t v23 = *(void *)(v3 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_lockedOperationState);
    char v24 = (unsigned char *)(v23 + 16);
    uint64_t v25 = (os_unfair_lock_s *)(v23 + 20);
    id v26 = v51;
    os_unfair_lock_lock(v25);
    sub_22572D084(v24);
    os_unfair_lock_unlock(v25);
  }
  else
  {
    id v27 = v51;
    unint64_t v28 = (void *)sub_22579F258();

    swift_willThrow();
    id v29 = v28;
    id v30 = v28;
    unint64_t v31 = sub_22579F438();
    os_log_type_t v32 = sub_22579FC98();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      char v34 = (void *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v36 = ObjectType;
      uint64_t v37 = v35;
      id v51 = v36;
      v52[0] = v35;
      *(_DWORD *)uint64_t v33 = 136315394;
      swift_getMetatypeMetadata();
      uint64_t v38 = sub_225737FD8();
      id v51 = (id)sub_22572E428(v38, v39, v52);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2112;
      id v40 = v28;
      uint64_t v41 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v51 = v41;
      sub_22579FD68();
      *char v34 = v41;

      _os_log_impl(&dword_225722000, v31, v32, "[%s] Failed to request protected data operation error: %@", (uint8_t *)v33, 0x16u);
      sub_2257934CC(0, (unint64_t *)&qword_26ABF9570, (unint64_t *)&qword_26ABF9568);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v34, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v37, -1, -1);
      MEMORY[0x22A635470](v33, -1, -1);
    }
    else
    {
    }
    unint64_t v42 = *(os_unfair_lock_s **)(v3
                               + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_lockedOperationState);
    uint64_t v43 = v42 + 4;
    uint64_t v44 = v42 + 5;
    os_unfair_lock_lock(v42 + 5);
    sub_225792098(v43);
    os_unfair_lock_unlock(v44);
  }
}

unsigned char *sub_22572D084(unsigned char *result)
{
  *unint64_t result = 1;
  return result;
}

void *static HDMCPregnancyStateQueryServer.createTaskServer(with:configuration:client:delegate:)(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v8 = sub_22579F398();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_msgSend(a3, sel_profile);
  id v13 = objc_msgSend(v12, sel_profileType);

  if (v13 != (id)1)
  {
    unint64_t v17 = self;
    unint64_t v48 = 0;
    unint64_t v49 = 0xE000000000000000;
    sub_22579FEB8();
    sub_22579FB08();
    sub_2257A0188();
    sub_22579FB08();
    swift_bridgeObjectRelease();
    sub_22579FB08();
    id v18 = objc_msgSend(a3, sel_profile);
    id v19 = objc_msgSend(v18, sel_profileType);

    *(void *)&v47[0] = v19;
    sub_2257A0038();
    sub_22579FB08();
    swift_bridgeObjectRelease();
    unint64_t v20 = (void *)v49;
    uint64_t v21 = (void *)sub_22579FA98();
    swift_bridgeObjectRelease();
    id v22 = objc_msgSend(v17, sel_hk_error_description_, 3, v21);
LABEL_14:
    v22;

    swift_willThrow();
    return v20;
  }
  uint64_t v44 = v9;
  char v14 = v45;
  id v15 = objc_msgSend(a3, sel_profile);
  id v16 = objc_msgSend(v15, sel_profileExtensionWithIdentifier_, *MEMORY[0x263F450C8]);

  if (v16)
  {
    sub_22579FD88();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v47, 0, sizeof(v47));
  }
  uint64_t v23 = a4;
  uint64_t v24 = a1;
  sub_22572FD88((uint64_t)v47, (uint64_t)&v48);
  if (!v50)
  {
    sub_22576E8F4((uint64_t)&v48);
    goto LABEL_13;
  }
  uint64_t v25 = a2;
  uint64_t v26 = v8;
  sub_22572F19C(0, (unint64_t *)&unk_26ABF9510);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_13:
    uint64_t v36 = self;
    unint64_t v48 = 0;
    unint64_t v49 = 0xE000000000000000;
    sub_22579FEB8();
    swift_bridgeObjectRelease();
    unint64_t v48 = 0xD00000000000001FLL;
    unint64_t v49 = 0x80000002257A7F50;
    sub_2257A0188();
    sub_22579FB08();
    swift_bridgeObjectRelease();
    unint64_t v20 = (void *)v49;
    uint64_t v21 = (void *)sub_22579FA98();
    swift_bridgeObjectRelease();
    id v22 = objc_msgSend(v36, sel_hk_error_description_, 3, v21);
    goto LABEL_14;
  }
  id v27 = v51;
  id v28 = objc_msgSend(v51, sel_pregnancyManager);
  uint64_t v46 = &unk_26D90E648;
  uint64_t v43 = v23;
  uint64_t v29 = swift_dynamicCastObjCProtocolConditional();
  if (v29)
  {
    id v41 = v27;
    unint64_t v42 = v28;
    if (v25 && (uint64_t v30 = v29, self, (v31 = swift_dynamicCastObjCClass()) != 0))
    {
      uint64_t v32 = v31;
      (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v11, v24, v26);
      objc_allocWithZone(v14);
      swift_unknownObjectRetain();
      id v33 = v25;
      id v34 = a3;
      uint64_t v35 = v42;
      unint64_t v20 = sub_22572E164((uint64_t)v11, v32, v34, v30, v42);

      swift_unknownObjectRelease();
    }
    else
    {
      unint64_t v39 = self;
      swift_unknownObjectRetain();
      unint64_t v20 = (void *)sub_22579FA98();
      objc_msgSend(v39, sel_hk_error_description_, 3, v20);

      swift_willThrow();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    uint64_t v38 = self;
    unint64_t v20 = (void *)sub_22579FA98();
    objc_msgSend(v38, sel_hk_error_description_, 3, v20);

    swift_willThrow();
  }
  return v20;
}

id sub_22572E164(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v6 = v5;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v13 = v6;
  id v14 = objc_msgSend(a3, sel_profile);
  id v15 = objc_msgSend(v14, sel_profileExtensionWithIdentifier_, *MEMORY[0x263F450C8]);

  if (v15)
  {
    sub_22579FD88();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v25, 0, sizeof(v25));
  }
  sub_22572FD88((uint64_t)v25, (uint64_t)v26);
  if (v27)
  {
    sub_22572F19C(0, (unint64_t *)&unk_26ABF9510);
    int v16 = swift_dynamicCast();
    uint64_t v17 = v23;
    if (!v16) {
      uint64_t v17 = 0;
    }
  }
  else
  {
    sub_22576E8F4((uint64_t)v26);
    uint64_t v17 = 0;
  }
  *(void *)&v13[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer_profileExtension] = v17;
  *(void *)&v13[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer_pregnancyManager] = a5;
  id v18 = a5;

  id v19 = (void *)sub_22579F358();
  v24.receiver = v13;
  v24.super_class = ObjectType;
  id v20 = objc_msgSendSuper2(&v24, sel_initWithUUID_configuration_client_delegate_, v19, a2, a3, a4);

  uint64_t v21 = sub_22579F398();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8))(a1, v21);
  return v20;
}

void sub_22572E334(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    sub_22572BEA0(255);
    uint64_t v7 = v6;
    uint64_t v8 = sub_225730E90(&qword_26ABF9A20, sub_22572BEA0);
    uint64_t v9 = sub_225730E90(&qword_26ABF9A28, sub_22572BEA0);
    unint64_t v10 = a3(a1, v7, v8, v9);
    if (!v11) {
      atomic_store(v10, a2);
    }
  }
}

void sub_22572E408(uint64_t a1)
{
}

uint64_t sub_22572E428(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22572E54C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22572E708((uint64_t)v12, *a3);
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
      sub_22572E708((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_22572E54C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_22579FD78();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_22579A244(a5, a6);
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
  uint64_t v8 = sub_22579FEF8();
  if (!v8)
  {
    sub_22579FF68();
    __break(1u);
LABEL_17:
    uint64_t result = sub_22579FFD8();
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

uint64_t sub_22572E708(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

id HDMCExperienceDaemonStore.fetchPersistedOrDefaultState()()
{
  id v2 = HDMCExperienceDaemonStore.fetchLocallyPersistedData()();
  if (!v0)
  {
    id v1 = v2;
    if (!v2)
    {
      sub_22572F1D8(MEMORY[0x263F8EE78], (unint64_t *)&qword_26ABF9A88, 0x263F451A8, &qword_26ABF9A90, (void (*)(id *, uint64_t))sub_2257713F8);
      id v4 = objc_allocWithZone(MEMORY[0x263F45160]);
      sub_22572F19C(0, (unint64_t *)&qword_26ABF9A88);
      sub_22572F3BC(&qword_26ABF9A90, (unint64_t *)&qword_26ABF9A88);
      uint64_t v5 = (void *)sub_22579FBD8();
      swift_bridgeObjectRelease();
      id v6 = objc_msgSend(v4, sel_initWithPregnancyModeSetupCompletionSet_, v5);

      sub_22572F19C(0, &qword_26ABF9A98);
      id v1 = sub_22572FE60(v6);

      if (qword_26ABF9378 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_22579F458();
      __swift_project_value_buffer(v7, (uint64_t)qword_26ABF94A0);
      uint64_t v8 = sub_22579F438();
      os_log_type_t v9 = sub_22579FCB8();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        uint64_t v11 = swift_slowAlloc();
        uint64_t v14 = v11;
        *(_DWORD *)uint64_t v10 = 136446210;
        uint64_t v12 = sub_2257A0188();
        sub_22572E428(v12, v13, &v14);
        sub_22579FD68();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_225722000, v8, v9, "[%{public}s] No model persisted locally, returning default model", v10, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A635470](v11, -1, -1);
        MEMORY[0x22A635470](v10, -1, -1);
      }
    }
  }
  return v1;
}

void sub_22572EC64(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  aBlock[11] = *(id *)MEMORY[0x263EF8340];
  sub_22572F19C(0, (unint64_t *)&unk_26ABF9520);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_22572F400();
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2257A3D00;
  sub_22572F19C(0, &qword_26ABF94E8);
  *(void *)(inited + 32) = MEMORY[0x22A634170]((id)*MEMORY[0x263F093C0]);
  sub_22579FB78();
  sub_22572F4C4(inited);
  swift_bridgeObjectRelease();
  sub_22572F19C(0, (unint64_t *)&unk_26ABF94D0);
  sub_22572F36C((unint64_t *)&qword_26ABF94E0, (unint64_t *)&unk_26ABF94D0);
  uint64_t v10 = (void *)sub_22579FBD8();
  swift_bridgeObjectRelease();
  aBlock[0] = 0;
  id v11 = objc_msgSend(ObjCClassFromMetadata, sel_entityEnumeratorWithTypes_profile_error_, v10, a1, aBlock);

  if (v11)
  {
    id v12 = aBlock[0];
    objc_msgSend(v11, sel_setPredicate_, a2);
    unint64_t v13 = (void *)sub_22579FBC8();
    objc_msgSend(v11, sel_setEncodingOption_forKey_, v13, *MEMORY[0x263F42FD0]);

    objc_msgSend(v11, sel_setLimitCount_, *MEMORY[0x263F434E8]);
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = a4;
    v14[3] = a5;
    aBlock[4] = sub_22573C0D8;
    aBlock[5] = v14;
    aBlock[0] = (id)MEMORY[0x263EF8330];
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_2257255A8;
    aBlock[3] = &block_descriptor_0;
    id v15 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    aBlock[0] = 0;
    unsigned __int8 v16 = objc_msgSend(v11, sel_enumerateIncludingDeletedObjects_error_handler_, a3 & 1, aBlock, v15);
    _Block_release(v15);
    id v17 = aBlock[0];
    LOBYTE(v15) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if (v15) {
      __break(1u);
    }
    if (v16)
    {

      return;
    }
    id v19 = (void *)sub_22579F258();

    swift_willThrow();
  }
  else
  {
    id v18 = aBlock[0];
    id v19 = (void *)sub_22579F258();

    swift_willThrow();
  }
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_22579F458();
  __swift_project_value_buffer(v20, (uint64_t)qword_26ABF94A0);
  id v21 = v19;
  id v22 = v19;
  uint64_t v23 = sub_22579F438();
  os_log_type_t v24 = sub_22579FC98();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v26 = (void *)swift_slowAlloc();
    aBlock[0] = v26;
    *(_DWORD *)uint64_t v25 = 136446466;
    uint64_t v27 = sub_2257A0188();
    sub_22572E428(v27, v28, (uint64_t *)aBlock);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v29 = sub_2257A00A8();
    sub_22572E428(v29, v30, (uint64_t *)aBlock);
    sub_22579FD68();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_225722000, v23, v24, "[%{public}s] Error enumerating entities: %s", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v26, -1, -1);
    MEMORY[0x22A635470](v25, -1, -1);
  }
  else
  {
  }
  swift_willThrow();
}

uint64_t sub_22572F19C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_22572F1D8(unint64_t a1, unint64_t *a2, uint64_t a3, unint64_t *a4, void (*a5)(id *, uint64_t))
{
  unint64_t v9 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_22579FF88();
    swift_bridgeObjectRelease();
  }
  sub_22572F19C(0, a2);
  sub_22572F3BC(a4, a2);
  uint64_t result = sub_22579FC08();
  uint64_t v17 = result;
  if (v9)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_22579FF88();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v11) {
      return v17;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v11) {
      return v17;
    }
  }
  if (v11 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        uint64_t v13 = MEMORY[0x22A634380](i, a1);
        a5(&v16, v13);
      }
    }
    else
    {
      uint64_t v14 = (void **)(a1 + 32);
      do
      {
        id v15 = *v14++;
        a5(&v16, (uint64_t)v15);

        --v11;
      }
      while (v11);
    }
    return v17;
  }
  __break(1u);
  return result;
}

uint64_t sub_22572F36C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_22572F19C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22572F3BC(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_22572F19C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_22572F400()
{
  if (!qword_26ABF95A0)
  {
    unint64_t v0 = sub_2257A0048();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ABF95A0);
    }
  }
}

unint64_t sub_22572F45C()
{
  unint64_t result = qword_26ABF94E0;
  if (!qword_26ABF94E0)
  {
    sub_22572F19C(255, (unint64_t *)&unk_26ABF94D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ABF94E0);
  }
  return result;
}

uint64_t sub_22572F4C4(unint64_t a1)
{
  return sub_22572F1D8(a1, (unint64_t *)&unk_26ABF94D0, 0x263F0A598, (unint64_t *)&qword_26ABF94E0, (void (*)(id *, uint64_t))sub_22572F998);
}

uint64_t sub_22572F4F4(void *a1, void *a2, unint64_t *a3, uint64_t a4, unint64_t *a5, unint64_t *a6)
{
  uint64_t v11 = v6;
  uint64_t v14 = *v6;
  if ((*v6 & 0xC000000000000001) != 0)
  {
    if (v14 < 0) {
      uint64_t v15 = *v6;
    }
    else {
      uint64_t v15 = v14 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v16 = a2;
    uint64_t v17 = sub_22579FE28();

    if (v17)
    {
      swift_bridgeObjectRelease();

      sub_22572F19C(0, a3);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v42;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_22579FE18();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v29 = sub_22577251C(v15, result + 1, a5, a3, a4, a6);
    uint64_t v43 = v29;
    unint64_t v30 = *(void *)(v29 + 16);
    if (*(void *)(v29 + 24) <= v30)
    {
      uint64_t v35 = a5;
      uint64_t v36 = v30 + 1;
      id v37 = v16;
      sub_225772744(v36, v35, a3, a4, a6);
      uint64_t v31 = v43;
    }
    else
    {
      uint64_t v31 = v29;
      id v32 = v16;
    }
    sub_22577366C((uint64_t)v16, v31);
    *uint64_t v11 = v31;
    swift_bridgeObjectRelease();
    *a1 = v16;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_22579FD28();
    uint64_t v20 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v21 = v19 & ~v20;
    uint64_t v40 = a4;
    if ((*(void *)(v14 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21))
    {
      sub_22572F19C(0, a3);
      id v22 = *(id *)(*(void *)(v14 + 48) + 8 * v21);
      char v23 = sub_22579FD38();

      if (v23)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v27 = *(void **)(*(void *)(*v6 + 48) + 8 * v21);
        *a1 = v27;
        id v28 = v27;
        return 0;
      }
      uint64_t v24 = ~v20;
      while (1)
      {
        unint64_t v21 = (v21 + 1) & v24;
        if (((*(void *)(v14 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
          break;
        }
        id v25 = *(id *)(*(void *)(v14 + 48) + 8 * v21);
        char v26 = sub_22579FD38();

        if (v26) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v44 = *v6;
    *id v6 = 0x8000000000000000;
    id v34 = a2;
    sub_22572F7E0((uint64_t)v34, v21, isUniquelyReferenced_nonNull_native, a5, a3, v40, a6);
    *id v6 = v44;
    swift_bridgeObjectRelease();
    *a1 = v34;
  }
  return 1;
}

void sub_22572F7E0(uint64_t a1, unint64_t a2, char a3, unint64_t *a4, unint64_t *a5, uint64_t a6, unint64_t *a7)
{
  unint64_t v11 = *(void *)(*v7 + 16);
  unint64_t v12 = *(void *)(*v7 + 24);
  if (v12 > v11 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v13 = v11 + 1;
  if (a3)
  {
    sub_225772744(v13, a4, a5, a6, a7);
  }
  else
  {
    if (v12 > v11)
    {
      sub_225773EC4(a4, a5, a6, a7);
      goto LABEL_14;
    }
    sub_22577480C(v13, a4, a5, a6, a7);
  }
  uint64_t v14 = *v7;
  uint64_t v15 = sub_22579FD28();
  uint64_t v16 = -1 << *(unsigned char *)(v14 + 32);
  a2 = v15 & ~v16;
  if ((*(void *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_22572F19C(0, a5);
    id v17 = *(id *)(*(void *)(v14 + 48) + 8 * a2);
    char v18 = sub_22579FD38();

    if (v18)
    {
LABEL_13:
      sub_2257A0088();
      __break(1u);
    }
    else
    {
      uint64_t v19 = ~v16;
      while (1)
      {
        a2 = (a2 + 1) & v19;
        if (((*(void *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v20 = *(id *)(*(void *)(v14 + 48) + 8 * a2);
        char v21 = sub_22579FD38();

        if (v21) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v22 = *v7;
  *(void *)(*v7 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v22 + 48) + 8 * a2) = a1;
  uint64_t v23 = *(void *)(v22 + 16);
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24) {
    __break(1u);
  }
  else {
    *(void *)(v22 + 16) = v25;
  }
}

uint64_t sub_22572F998(void *a1, void *a2)
{
  return sub_22572F4F4(a1, a2, (unint64_t *)&unk_26ABF94D0, 0x263F0A598, (unint64_t *)&qword_26ABF9580, (unint64_t *)&qword_26ABF94E0);
}

void sub_22572F9BC(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_22579FF88();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_22572FD14();
      uint64_t v3 = sub_22579FE98();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_22579FF88();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v43 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v41 = v1;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = MEMORY[0x22A634380](v8, v1);
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        uint64_t v12 = sub_22579FD28();
        uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
        unint64_t v14 = v12 & ~v13;
        unint64_t v15 = v14 >> 6;
        uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
        uint64_t v17 = 1 << v14;
        if (((1 << v14) & v16) != 0) {
          break;
        }
LABEL_20:
        *(void *)(v7 + 8 * v15) = v17 | v16;
        *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
        uint64_t v23 = *(void *)(v3 + 16);
        BOOL v10 = __OFADD__(v23, 1);
        uint64_t v24 = v23 + 1;
        if (v10) {
          goto LABEL_37;
        }
        *(void *)(v3 + 16) = v24;
        if (v8 == v5) {
          return;
        }
      }
      sub_22572F19C(0, (unint64_t *)&unk_26ABF94D0);
      id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
      char v19 = sub_22579FD38();

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = sub_22579FD38();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v41;
        uint64_t v5 = v43;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      unint64_t v1 = v41;
      uint64_t v5 = v43;
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  unint64_t v40 = v1 + 32;
  uint64_t v42 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    id v26 = *(id *)(v40 + 8 * v25);
    uint64_t v27 = sub_22579FD28();
    uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v29 = v27 & ~v28;
    unint64_t v30 = v29 >> 6;
    uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
    uint64_t v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      sub_22572F19C(0, (unint64_t *)&unk_26ABF94D0);
      id v33 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
      char v34 = sub_22579FD38();

      if (v34)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v35 = ~v28;
      while (1)
      {
        unint64_t v29 = (v29 + 1) & v35;
        unint64_t v30 = v29 >> 6;
        uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
        uint64_t v32 = 1 << v29;
        if ((v31 & (1 << v29)) == 0) {
          break;
        }
        id v36 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
        char v37 = sub_22579FD38();

        if (v37) {
          goto LABEL_24;
        }
      }
    }
    *(void *)(v7 + 8 * v30) = v32 | v31;
    *(void *)(*(void *)(v3 + 48) + 8 * v29) = v26;
    uint64_t v38 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v10) {
      goto LABEL_38;
    }
    *(void *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v43) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

void sub_22572FD14()
{
  if (!qword_26ABF9580)
  {
    sub_22572F19C(255, (unint64_t *)&unk_26ABF94D0);
    sub_22572F45C();
    unint64_t v0 = sub_22579FEA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ABF9580);
    }
  }
}

uint64_t sub_22572FD88(uint64_t a1, uint64_t a2)
{
  sub_22572FE14(0, qword_26ABF93A8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_22572FE14(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

id sub_22572FE60(void *a1)
{
  sub_225730DBC();
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_22579F858();
  uint64_t v8 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  BOOL v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  if (result)
  {
    id v22 = result;
    uint64_t v12 = sub_22572B730(a1);
    sub_22579F9F8();
    uint64_t v13 = (void *)sub_22579F9E8();
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F32EB8], v23);
    v21[1] = v12;
    uint64_t v14 = v12 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v14, v4);
    sub_225730E90(&qword_26ABF98A0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
    uint64_t v15 = sub_22579F988();
    if (v1)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_release();

      id v17 = v22;
    }
    else
    {
      uint64_t v18 = v15;
      unint64_t v19 = v16;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      uint64_t v20 = (void *)sub_22579F268();
      sub_2257309D8(v18, v19);
      id v17 = v22;
      objc_msgSend(v22, sel_setMenstrualCyclesExperienceModelData_, v20);
      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v23);
    return v17;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id HDMCExperienceDaemonStore.fetchLocallyPersistedData()()
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  unint64_t v2 = *(void **)(v0 + 24);
  uint64_t v3 = (void *)sub_22579FA98();
  v55[0] = 0;
  id v4 = objc_msgSend(v2, sel_dataForKey_error_, v3, v55);

  id v56 = v55[0];
  if (v4)
  {
    id v5 = v55[0];
    uint64_t v6 = sub_22579F278();
    unint64_t v8 = v7;

    id v9 = objc_allocWithZone(MEMORY[0x263F43198]);
    sub_22579A6C0(v6, v8);
    BOOL v10 = (void *)sub_22579F268();
    sub_2257309D8(v6, v8);
    id v1 = objc_msgSend(v9, sel_initWithData_, v10);

    if (v1)
    {
      if (qword_26ABF9378 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_22579F458();
      __swift_project_value_buffer(v11, (uint64_t)qword_26ABF94A0);
      id v12 = v1;
      uint64_t v13 = sub_22579F438();
      os_log_type_t v14 = sub_22579FCB8();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = swift_slowAlloc();
        id v54 = (void *)swift_slowAlloc();
        v55[0] = v54;
        *(_DWORD *)uint64_t v15 = 136446466;
        uint64_t v16 = sub_2257A0188();
        sub_22572E428(v16, v17, (uint64_t *)v55);
        sub_22579FD68();
        swift_bridgeObjectRelease();
        *(_WORD *)(v15 + 12) = 2080;
        uint64_t v18 = HDCodableMenstrualCyclesExperienceModel.logDescription.getter();
        sub_22572E428(v18, v19, (uint64_t *)v55);
        sub_22579FD68();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_225722000, v13, v14, "[%{public}s] Fetched content from local store: %s", (uint8_t *)v15, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x22A635470](v54, -1, -1);
        MEMORY[0x22A635470](v15, -1, -1);

        sub_2257309D8(v6, v8);
      }
      else
      {
        sub_2257309D8(v6, v8);
      }
    }
    else
    {
      if (qword_26ABF9378 != -1) {
        swift_once();
      }
      uint64_t v38 = sub_22579F458();
      __swift_project_value_buffer(v38, (uint64_t)qword_26ABF94A0);
      uint64_t v39 = sub_22579F438();
      os_log_type_t v40 = sub_22579FC98();
      if (os_log_type_enabled(v39, v40))
      {
        unint64_t v41 = (uint8_t *)swift_slowAlloc();
        id v1 = (id)swift_slowAlloc();
        v55[0] = v1;
        *(_DWORD *)unint64_t v41 = 136446210;
        uint64_t v42 = sub_2257A0188();
        sub_22572E428(v42, v43, (uint64_t *)v55);
        sub_22579FD68();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_225722000, v39, v40, "[%{public}s] Error decoding persisted state", v41, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A635470](v1, -1, -1);
        MEMORY[0x22A635470](v41, -1, -1);
      }

      sub_22579A604();
      swift_allocError();
      void *v44 = 0;
      v44[1] = 0;
      swift_willThrow();
      sub_2257309D8(v6, v8);
    }
LABEL_27:

    return v1;
  }
  uint64_t v20 = qword_26ABF9378;
  if (v55[0])
  {
    id v21 = v55[0];
    if (v20 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_22579F458();
    __swift_project_value_buffer(v22, (uint64_t)qword_26ABF94A0);
    uint64_t v23 = sub_22579F438();
    os_log_type_t v24 = sub_22579FC98();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      id v26 = (void *)swift_slowAlloc();
      v55[0] = v26;
      *(_DWORD *)uint64_t v25 = 136446466;
      uint64_t v27 = sub_2257A0188();
      sub_22572E428(v27, v28, (uint64_t *)v55);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2080;
      swift_beginAccess();
      id v29 = v56;
      sub_22579A658();
      id v30 = v29;
      uint64_t v31 = sub_22579FAD8();
      id v1 = (id)v32;
      sub_22572E428(v31, v32, (uint64_t *)v55);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v23, v24, "[%{public}s] Error trying to fetch data from local kvd: %s", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v26, -1, -1);
      MEMORY[0x22A635470](v25, -1, -1);
    }

    swift_beginAccess();
    if (v56)
    {
      id v33 = objc_msgSend(v56, sel_localizedDescription);
      uint64_t v34 = sub_22579FAC8();
      uint64_t v36 = v35;

      sub_22579A604();
      swift_allocError();
      *char v37 = v34;
      v37[1] = v36;
    }
    else
    {
      sub_22579A604();
      swift_allocError();
      *uint64_t v52 = xmmword_2257A5200;
    }
    swift_willThrow();
    goto LABEL_27;
  }
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v45 = sub_22579F458();
  __swift_project_value_buffer(v45, (uint64_t)qword_26ABF94A0);
  uint64_t v46 = sub_22579F438();
  os_log_type_t v47 = sub_22579FCB8();
  if (os_log_type_enabled(v46, v47))
  {
    unint64_t v48 = (uint8_t *)swift_slowAlloc();
    unint64_t v49 = (void *)swift_slowAlloc();
    v55[0] = v49;
    *(_DWORD *)unint64_t v48 = 136446210;
    uint64_t v50 = sub_2257A0188();
    sub_22572E428(v50, v51, (uint64_t *)v55);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v46, v47, "[%{public}s] No data persisted locally", v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v49, -1, -1);
    MEMORY[0x22A635470](v48, -1, -1);
  }

  return 0;
}

uint64_t sub_2257309D8(uint64_t a1, unint64_t a2)
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

uint64_t sub_225730A30()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  swift_getObjectType();
  sub_225730DBC();
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  id v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v23 - v10;
  id v12 = objc_msgSend(v3, sel_menstrualCyclesExperienceModelData);
  if (v12)
  {
    uint64_t v13 = v12;
    sub_22579F278();

    type metadata accessor for CoherentExperienceSetupRecordDatabase(0);
    sub_225730E90(&qword_26ABF98A0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
    sub_22579F978();
    if (!v1)
    {
      os_log_type_t v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v14(v9, v11, v5);
      type metadata accessor for CoherentExperienceSetupRecordDatabaseWrapper(0);
      uint64_t v2 = swift_allocObject();
      v14((char *)(v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule), v9, v5);
    }
  }
  else
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_22579F458();
    __swift_project_value_buffer(v15, (uint64_t)qword_26ABF94A0);
    uint64_t v16 = sub_22579F438();
    os_log_type_t v17 = sub_22579FC98();
    uint64_t v2 = v17;
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v24 = v19;
      *(_DWORD *)uint64_t v18 = 136446466;
      uint64_t v20 = sub_2257A0188();
      uint64_t v23 = sub_22572E428(v20, v21, &v24);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2080;
      uint64_t v23 = sub_22572E428(0xD000000000000044, 0x80000002257A8910, &v24);
      sub_22579FD68();
      _os_log_impl(&dword_225722000, v16, (os_log_type_t)v2, "[%{public}s] Underlying model data is missing, error: %s", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v19, -1, -1);
      MEMORY[0x22A635470](v18, -1, -1);
    }

    sub_22578D050();
    swift_allocError();
    swift_willThrow();
  }
  return v2;
}

void sub_225730DBC()
{
  if (!qword_26ABF9A40)
  {
    type metadata accessor for CoherentExperienceSetupRecordDatabase(255);
    sub_225730E90(&qword_26ABF98A8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
    unint64_t v0 = sub_22579F9A8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ABF9A40);
    }
  }
}

uint64_t type metadata accessor for CoherentExperienceSetupRecordDatabaseWrapper(uint64_t a1)
{
  return sub_22572BDD0(a1, (uint64_t *)&unk_26ABF9948);
}

uint64_t type metadata accessor for CoherentExperienceSetupRecordDatabase(uint64_t a1)
{
  return sub_22572BDD0(a1, qword_26ABF98B8);
}

uint64_t sub_225730E90(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_225730ED8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

id sub_225730F38(void *a1)
{
  return objc_msgSend(a1, sel_pregnancyModelDidUpdate_, *(void *)(v1 + 16));
}

void HDMCPregnancyStateQueryServer.pregnancyModelDidUpdate(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22579F398();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(v2, sel_clientProxy);
  if (v8
    && (id v9 = objc_msgSend(v8, sel_remoteObjectProxy),
        swift_unknownObjectRelease(),
        sub_22579FD88(),
        swift_unknownObjectRelease(),
        sub_2257311B0(),
        (swift_dynamicCast() & 1) != 0))
  {
    uint64_t v10 = (void *)v13[1];
    id v11 = objc_msgSend(v2, sel_queryUUID);
    sub_22579F378();

    id v12 = (void *)sub_22579F358();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    objc_msgSend(v10, sel_client_deliverPregnancyModel_queryUUID_, a1, v12);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_22579FF78();
    __break(1u);
  }
}

unint64_t sub_2257311B0()
{
  unint64_t result = qword_26ABF9558;
  if (!qword_26ABF9558)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26ABF9558);
  }
  return result;
}

void sub_225731270(uint64_t a1)
{
  uint64_t v2 = v1;
  v40[1] = *(id *)MEMORY[0x263EF8340];
  swift_getObjectType();
  id v4 = objc_msgSend(self, sel_sharedBehavior);
  if (!v4) {
    __break(1u);
  }
  uint64_t v5 = v4;
  unsigned __int8 v6 = objc_msgSend(v4, sel_isiPad);

  int v7 = HKShowSensitiveLogItems();
  if (v6)
  {
    if (v7)
    {
      if (qword_26ABF9378 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_22579F458();
      __swift_project_value_buffer(v8, (uint64_t)qword_26ABF94A0);
      oslog = sub_22579F438();
      os_log_type_t v9 = sub_22579FCB8();
      if (os_log_type_enabled(oslog, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        id v11 = (void *)swift_slowAlloc();
        v40[0] = v11;
        *(_DWORD *)uint64_t v10 = 136315138;
        uint64_t v12 = sub_2257A0188();
        sub_22572E428(v12, v13, (uint64_t *)v40);
        sub_22579FD68();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_225722000, oslog, v9, "[%s] Should not request work since this is an iPad", v10, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A635470](v11, -1, -1);
        MEMORY[0x22A635470](v10, -1, -1);
      }
      else
      {
      }
    }
  }
  else
  {
    if (v7)
    {
      if (qword_26ABF9378 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_22579F458();
      __swift_project_value_buffer(v14, (uint64_t)qword_26ABF94A0);
      uint64_t v15 = sub_22579F438();
      os_log_type_t v16 = sub_22579FCB8();
      if (os_log_type_enabled(v15, v16))
      {
        os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
        uint64_t v18 = (void *)swift_slowAlloc();
        v40[0] = v18;
        *(_DWORD *)os_log_type_t v17 = 136315138;
        uint64_t v19 = sub_2257A0188();
        sub_22572E428(v19, v20, (uint64_t *)v40);
        sub_22579FD68();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_225722000, v15, v16, "[%s] Requesting protected data operation", v17, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A635470](v18, -1, -1);
        MEMORY[0x22A635470](v17, -1, -1);
      }
    }
    unint64_t v21 = *(void **)(v2
                   + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_protectedDataOperation);
    v40[0] = 0;
    unsigned int v22 = objc_msgSend(v21, sel_requestWorkWithPriority_error_, a1, v40);
    id v23 = v40[0];
    if (!v22)
    {
      id v25 = v40[0];
      id v26 = (void *)sub_22579F258();

      swift_willThrow();
      if (HKShowSensitiveLogItems())
      {
        if (qword_26ABF9378 != -1) {
          swift_once();
        }
        uint64_t v27 = sub_22579F458();
        __swift_project_value_buffer(v27, (uint64_t)qword_26ABF94A0);
        id v28 = v26;
        id v29 = v26;
        id v30 = sub_22579F438();
        os_log_type_t v31 = sub_22579FC98();
        if (!os_log_type_enabled(v30, v31))
        {

          return;
        }
        uint64_t v32 = swift_slowAlloc();
        id v33 = (void *)swift_slowAlloc();
        v40[0] = v33;
        *(_DWORD *)uint64_t v32 = 136315394;
        uint64_t v34 = sub_2257A0188();
        sub_22572E428(v34, v35, (uint64_t *)v40);
        sub_22579FD68();
        swift_bridgeObjectRelease();
        *(_WORD *)(v32 + 12) = 2080;
        id v36 = v26;
        sub_22577C494(0, (unint64_t *)&qword_2681055E8);
        uint64_t v37 = sub_22579FAD8();
        sub_22572E428(v37, v38, (uint64_t *)v40);
        sub_22579FD68();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_225722000, v30, v31, "[%s] Failed to request protected data operation error: %s", (uint8_t *)v32, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x22A635470](v33, -1, -1);
        MEMORY[0x22A635470](v32, -1, -1);
      }
      return;
    }
    id v24 = v23;
  }
}

uint64_t sub_2257318AC(void *a1)
{
  return sub_2257318B4(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_2257318B4(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = self;
  objc_msgSend(a1, sel_featureAvailabilityRequirement_didUpdateSatisfaction_, objc_msgSend(v5, sel_noOngoingPregnancy), objc_msgSend(a3, sel_state) != (id)1);
  swift_unknownObjectRelease();
  objc_msgSend(a1, sel_featureAvailabilityRequirement_didUpdateSatisfaction_, objc_msgSend(v5, sel_isNotInPostPregnancy), sub_225738044(a3) & 1);
  return swift_unknownObjectRelease();
}

void sub_225731B64(uint64_t (*a1)(void))
{
  uint64_t v2 = v1;
  uint64_t ObjectType = swift_getObjectType();
  id v4 = *(os_unfair_lock_s **)(v1
                            + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_lockedOperationState);
  uint64_t v5 = v4 + 4;
  unsigned __int8 v6 = v4 + 5;
  os_unfair_lock_lock(v4 + 5);
  sub_225735240(v5);
  os_unfair_lock_unlock(v6);
  sub_225731F00((char *)aBlock);
  int v7 = LOBYTE(aBlock[0]);
  os_unfair_lock_lock(v6);
  sub_225735270(v5);
  os_unfair_lock_unlock(v6);
  if (v7 == 3)
  {
    MEMORY[0x270FA5388](v8);
    uint64_t v10 = (id *)&v9[4];
    id v11 = v9 + 6;
    os_unfair_lock_lock(v9 + 6);
    sub_225734DF4(v10);
    os_unfair_lock_unlock(v11);
  }
  else
  {
    uint64_t v12 = *(void **)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers);
    aBlock[4] = sub_2257923FC;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_225730ED8;
    aBlock[3] = &block_descriptor_2;
    unint64_t v13 = _Block_copy(aBlock);
    objc_msgSend(v12, sel_notifyObservers_, v13);
    _Block_release(v13);
  }
  uint64_t v14 = a1();
  MEMORY[0x270FA5388](v14);
  os_unfair_lock_lock(v6);
  sub_22573524C(v5);
  os_unfair_lock_unlock(v6);
  uint64_t v15 = OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_shouldReRequestWork;
  if (*(unsigned char *)(v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_shouldReRequestWork) == 1)
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_22579F458();
    __swift_project_value_buffer(v16, (uint64_t)qword_26ABF94A0);
    os_log_type_t v17 = sub_22579F438();
    os_log_type_t v18 = sub_22579FCB8();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v24 = v20;
      aBlock[0] = ObjectType;
      *(_DWORD *)uint64_t v19 = 136315138;
      swift_getMetatypeMetadata();
      uint64_t v21 = sub_225737FD8();
      aBlock[0] = sub_22572E428(v21, v22, &v24);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v17, v18, "[%s] Re-requesting work", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v20, -1, -1);
      MEMORY[0x22A635470](v19, -1, -1);
    }

    sub_22572CA2C(1, 6);
    *(unsigned char *)(v2 + v15) = 0;
  }
}

uint64_t sub_225731EE8()
{
  return sub_22573C238(*(void *)(v0 + 16));
}

uint64_t sub_225731EF0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_225731F00(char *a1@<X8>)
{
  uint64_t v2 = v1;
  unint64_t v87 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = type metadata accessor for HDMCPregnancyStateFactory();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (uint64_t *)((char *)&v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_22579F3A8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  os_log_type_t v9 = (char *)&v78 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22579F418();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v83 = v10;
  uint64_t v84 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v81 = (char *)&v78 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  id v80 = (char *)&v78 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v88 = ((char *)&v78 - v16);
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_22579F458();
  uint64_t v86 = __swift_project_value_buffer(v17, (uint64_t)qword_26ABF94A0);
  os_log_type_t v18 = sub_22579F438();
  os_log_type_t v19 = sub_22579FCB8();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v82 = v5;
  if (v20)
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v79 = v2;
    unint64_t v22 = (uint8_t *)v21;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v92 = v23;
    *(_DWORD *)unint64_t v22 = 136315138;
    *(void *)&long long v89 = ObjectType;
    swift_getMetatypeMetadata();
    uint64_t v24 = sub_225737FD8();
    *(void *)&long long v89 = sub_22572E428(v24, v25, &v92);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v18, v19, "[%s] Starting derivation work", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v23, -1, -1);
    id v26 = v22;
    uint64_t v2 = v79;
    MEMORY[0x22A635470](v26, -1, -1);
  }

  uint64_t v27 = MEMORY[0x22A635500](v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_profile);
  id v28 = v88;
  if (v27)
  {
    id v29 = (void *)v27;
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F07740], v6);
    sub_22579F3B8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v30 = type metadata accessor for HDMCExperienceDaemonStore();
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = v29;
    id v32 = objc_allocWithZone(MEMORY[0x263F43218]);
    id v33 = v29;
    uint64_t v34 = (void *)sub_22579FA98();
    id v35 = objc_msgSend(v32, sel_initWithCategory_domainName_profile_, 100, v34, v33);

    *(void *)(v31 + 24) = v35;
    uint64_t v90 = v30;
    uint64_t v91 = sub_225732B14(&qword_26ABF9628, (void (*)(uint64_t))type metadata accessor for HDMCExperienceDaemonStore);
    *(void *)&long long v89 = v31;
    id v36 = (char *)v33;
    swift_retain();
    uint64_t v37 = (void *)sub_22579F3D8();
    uint64_t v38 = HKMCTodayIndex();

    id v39 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_calendarCache), sel_currentCalendar);
    uint64_t v40 = (uint64_t)v80;
    sub_22579F3E8();

    uint64_t v41 = v83;
    uint64_t v42 = (uint64_t)v81;
    (*(void (**)(char *, NSObject *, uint64_t))(v84 + 16))(v81, v28, v83);
    unint64_t v43 = v82;
    HDMCPregnancyStateFactory.init(profile:experienceDaemonStore:todayDayIndex:calendar:gregorianCalendar:)(v36, &v89, v38, v40, v42, v82);
    id v51 = (id)HDMCPregnancyStateFactory.deriveState()();
    if (HKShowSensitiveLogItems())
    {
      id v53 = sub_22579F438();
      os_log_type_t v54 = sub_22579FCB8();
      if (os_log_type_enabled(v53, v54))
      {
        id v55 = (uint8_t *)swift_slowAlloc();
        uint64_t v56 = swift_slowAlloc();
        uint64_t v81 = v36;
        uint64_t v57 = v56;
        uint64_t v92 = v56;
        uint64_t v79 = v2;
        *(_DWORD *)id v55 = 136315138;
        *(void *)&long long v89 = ObjectType;
        swift_getMetatypeMetadata();
        uint64_t v58 = sub_225737FD8();
        *(void *)&long long v89 = sub_22572E428(v58, v59, &v92);
        sub_22579FD68();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_225722000, v53, v54, "[%s] Updating pregnancy state", v55, 0xCu);
        swift_arrayDestroy();
        uint64_t v60 = v57;
        id v36 = v81;
        MEMORY[0x22A635470](v60, -1, -1);
        MEMORY[0x22A635470](v55, -1, -1);
        swift_release();

        sub_225732BA4((uint64_t)v82);
        (*(void (**)(NSObject *, uint64_t))(v84 + 8))(v88, v83);
      }
      else
      {
        swift_release();

        sub_225732BA4((uint64_t)v43);
        (*(void (**)(NSObject *, uint64_t))(v84 + 8))(v28, v83);
      }
    }
    else
    {
      swift_release();
      sub_225732BA4((uint64_t)v43);
      (*(void (**)(NSObject *, uint64_t))(v84 + 8))(v28, v41);
    }
    uint64_t v61 = HKShowSensitiveLogItems();
    if (v61)
    {
      id v62 = v51;
      uint64_t v63 = sub_22579F438();
      os_log_type_t v64 = sub_22579FCB8();
      int v65 = v64;
      uint64_t v88 = v63;
      if (os_log_type_enabled(v63, v64))
      {
        uint64_t v66 = swift_slowAlloc();
        uint64_t v86 = swift_slowAlloc();
        *(void *)&long long v89 = v86;
        *(_DWORD *)uint64_t v66 = 136446466;
        LODWORD(v84) = v65;
        uint64_t v67 = sub_2257A0188();
        uint64_t v92 = sub_22572E428(v67, v68, (uint64_t *)&v89);
        sub_22579FD68();
        swift_bridgeObjectRelease();
        *(_WORD *)(v66 + 12) = 2080;
        uint64_t ObjectType = v66 + 14;
        id v69 = objc_msgSend(v62, sel_description);
        uint64_t v70 = sub_22579FAC8();
        unint64_t v72 = v71;

        uint64_t v92 = sub_22572E428(v70, v72, (uint64_t *)&v89);
        sub_22579FD68();

        swift_bridgeObjectRelease();
        char v73 = v88;
        _os_log_impl(&dword_225722000, v88, (os_log_type_t)v84, "[%{public}s] Updating model: %s", (uint8_t *)v66, 0x16u);
        uint64_t v74 = v86;
        swift_arrayDestroy();
        MEMORY[0x22A635470](v74, -1, -1);
        MEMORY[0x22A635470](v66, -1, -1);
      }
      else
      {
      }
    }
    MEMORY[0x270FA5388](v61);
    *(&v78 - 2) = (uint64_t)v51;
    id v76 = (id *)&v75[4];
    char v77 = v75 + 6;
    os_unfair_lock_lock(v75 + 6);
    sub_225734DB0(v76);
    os_unfair_lock_unlock(v77);

    char v50 = 3;
  }
  else
  {
    uint64_t v44 = sub_22579F438();
    os_log_type_t v45 = sub_22579FCB8();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      uint64_t v92 = v47;
      *(_DWORD *)uint64_t v46 = 136315138;
      *(void *)&long long v89 = ObjectType;
      swift_getMetatypeMetadata();
      uint64_t v48 = sub_225737FD8();
      *(void *)&long long v89 = sub_22572E428(v48, v49, &v92);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v44, v45, "[%s] Profile not available", v46, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v47, -1, -1);
      MEMORY[0x22A635470](v46, -1, -1);
    }

    char v50 = 5;
  }
  *unint64_t v87 = v50;
}

uint64_t type metadata accessor for HDMCExperienceDaemonStore()
{
  return self;
}

uint64_t sub_225732B14(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_225732B5C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_225732BA4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HDMCPregnancyStateFactory();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for HDMCPregnancyStateFactory(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_22579F418();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v5 - 8), v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  return v8(v6, v5);
}

uint64_t HDMCPregnancyStateFactory.init(profile:experienceDaemonStore:todayDayIndex:calendar:gregorianCalendar:)@<X0>(void *a1@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v36 = a4;
  id v35 = a2;
  uint64_t v34 = sub_22579F338();
  uint64_t v11 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (int *)type metadata accessor for HDMCPregnancyStateFactory();
  uint64_t v15 = v14[9];
  id v33 = a6;
  *(uint64_t *)((char *)a6 + v15) = 0x4167124000000000;
  uint64_t v16 = self;
  uint64_t v17 = (void *)sub_22579F3D8();
  id v18 = objc_msgSend(v16, sel_hk_dateOnDayIndex_atHour_calendar_, a3, 12, v17);

  sub_22579F2F8();
  sub_22572F19C(0, (unint64_t *)&unk_26ABF9520);
  _sSo17HDSQLitePredicateC27HealthMenstrualCyclesDaemonE26predicateForOngoingSamples2onABSi_tFZ_0(a3);
  BOOL v20 = (void *)v19;
  uint64_t v21 = static HDCategorySampleEntity.pregnancySamples(profile:predicate:)((uint64_t)a1, v19);
  if (v6)
  {

    uint64_t v22 = sub_22579F418();
    uint64_t v23 = *(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8);
    v23(a5, v22);
    v23(v36, v22);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v34);
  }
  else
  {
    uint64_t v25 = v21;

    *id v33 = v25;
    id v26 = (void *)_sSo17HDSQLitePredicateC27HealthMenstrualCyclesDaemonE45predicateForSamplesThatEndedInTheTwelveMonths6beforeAB10Foundation4DateV_tFZ_0(v13);
    uint64_t v27 = static HDCategorySampleEntity.pregnancySamples(profile:predicate:)((uint64_t)a1, (uint64_t)v26);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v34);
    id v28 = v33;
    v33[1] = v27;
    sub_22573527C(v35, (uint64_t)(v28 + 2));
    id v29 = (char *)v28 + v14[7];
    uint64_t v30 = sub_22579F418();
    uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 32);
    v31(v29, v36, v30);
    return ((uint64_t (*)(char *, uint64_t, uint64_t))v31)((char *)v28 + v14[8], a5, v30);
  }
}

uint64_t static HDCategorySampleEntity.pregnancySamples(profile:predicate:)(uint64_t a1, uint64_t a2)
{
  unint64_t v8 = MEMORY[0x263F8EE78];
  id v6[2] = &v8;
  sub_22572EC64(a1, a2, 0, (uint64_t)sub_22578624C, (uint64_t)v6);
  unint64_t v3 = v8;
  if (v2) {
    return swift_bridgeObjectRelease();
  }
  if ((v8 & 0x8000000000000000) != 0 || (v8 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v5 = (uint64_t)sub_2257856A0(v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = v8 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n();
  }
  uint64_t v7 = v5;
  sub_22573312C((uint64_t (*)(void **, void **))sub_225785530);
  swift_bridgeObjectRelease_n();
  return v7;
}

uint64_t sub_22573312C(uint64_t (*a1)(void **, void **))
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v2 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_2257331C4();
  }
  sub_2257331D8(a1);
  return sub_22579FF18();
}

void sub_2257331C4()
{
}

void sub_2257331D8(uint64_t (*a1)(void **, void **))
{
  uint64_t v3 = v1[1];
  uint64_t v4 = sub_2257A0028();
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_144;
    }
    if (v3) {
      sub_225785794(0, v3, 1, a1);
    }
    return;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 <= -2) {
    goto LABEL_153;
  }
  uint64_t v112 = v4;
  id v108 = v1;
  if (v3 < 2)
  {
    unint64_t v8 = (char *)MEMORY[0x263F8EE78];
    uint64_t v121 = MEMORY[0x263F8EE78];
    uint64_t v116 = (id *)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      unint64_t v34 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_105:
      if (v34 >= 2)
      {
        uint64_t v97 = *v108;
        do
        {
          unint64_t v98 = v34 - 2;
          if (v34 < 2) {
            goto LABEL_139;
          }
          if (!v97) {
            goto LABEL_152;
          }
          uint64_t v99 = (uint64_t)v8;
          uint64_t v100 = *(void *)&v8[16 * v98 + 32];
          uint64_t v101 = *(void *)&v8[16 * v34 + 24];
          sub_22578589C((id *)(v97 + 8 * v100), (id *)(v97 + 8 * *(void *)&v8[16 * v34 + 16]), v97 + 8 * v101, v116, a1);
          if (v2) {
            break;
          }
          if (v101 < v100) {
            goto LABEL_140;
          }
          if (swift_isUniquelyReferenced_nonNull_native()) {
            uint64_t v102 = (char *)v99;
          }
          else {
            uint64_t v102 = sub_225785EAC(v99);
          }
          if (v98 >= *((void *)v102 + 2)) {
            goto LABEL_141;
          }
          uint64_t v103 = &v102[16 * v98 + 32];
          *(void *)uint64_t v103 = v100;
          *((void *)v103 + 1) = v101;
          unint64_t v104 = *((void *)v102 + 2);
          if (v34 > v104) {
            goto LABEL_142;
          }
          id v105 = v102;
          memmove(&v102[16 * v34 + 16], &v102[16 * v34 + 32], 16 * (v104 - v34));
          unint64_t v8 = v105;
          *((void *)v105 + 2) = v104 - 1;
          unint64_t v34 = v104 - 1;
        }
        while (v104 > 2);
      }
LABEL_121:
      swift_bridgeObjectRelease();
      goto LABEL_122;
    }
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    sub_22572F19C(0, &qword_2681057D0);
    uint64_t v7 = sub_22579FB98();
    *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
    uint64_t v116 = (id *)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v121 = v7;
  }
  uint64_t v9 = 0;
  uint64_t v10 = *v1;
  uint64_t v109 = *v1 + 16;
  uint64_t v107 = *v1 - 8;
  unint64_t v8 = (char *)MEMORY[0x263F8EE78];
  uint64_t v113 = v3;
  uint64_t v117 = *v1;
LABEL_13:
  uint64_t v11 = v9++;
  if (v9 < v3)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void **)(v10 + 8 * v9);
    char v119 = *(void **)(v10 + 8 * v11);
    uint64_t v14 = v119;
    uint64_t v120 = v13;
    id v15 = v13;
    id v16 = v14;
    int v17 = a1(&v120, &v119);
    if (v2)
    {
      swift_bridgeObjectRelease();

      goto LABEL_122;
    }
    int v18 = v17;

    uint64_t v9 = v11 + 2;
    if (v11 + 2 < v3)
    {
      uint64_t v110 = v11;
      uint64_t v19 = (void **)(v109 + 8 * v11);
      while (1)
      {
        BOOL v20 = *v19;
        char v119 = *(v19 - 1);
        uint64_t v21 = v119;
        uint64_t v120 = v20;
        id v22 = v20;
        id v23 = v21;
        int v24 = a1(&v120, &v119);

        if ((v18 ^ v24)) {
          break;
        }
        ++v9;
        ++v19;
        uint64_t v3 = v113;
        if (v113 == v9)
        {
          uint64_t v9 = v113;
          goto LABEL_21;
        }
      }
      uint64_t v3 = v113;
LABEL_21:
      uint64_t v11 = v110;
    }
    unint64_t v8 = v12;
    uint64_t v10 = v117;
    if (v18)
    {
      if (v9 < v11) {
        goto LABEL_148;
      }
      if (v11 < v9)
      {
        uint64_t v25 = (uint64_t *)(v107 + 8 * v9);
        uint64_t v26 = v9;
        uint64_t v27 = v11;
        id v28 = (uint64_t *)(v117 + 8 * v11);
        do
        {
          if (v27 != --v26)
          {
            if (!v117) {
              goto LABEL_151;
            }
            uint64_t v29 = *v28;
            *id v28 = *v25;
            *uint64_t v25 = v29;
          }
          ++v27;
          --v25;
          ++v28;
        }
        while (v27 < v26);
      }
    }
  }
  if (v9 >= v3) {
    goto LABEL_40;
  }
  if (__OFSUB__(v9, v11)) {
    goto LABEL_145;
  }
  if (v9 - v11 >= v112)
  {
LABEL_40:
    if (v9 < v11) {
      goto LABEL_143;
    }
    goto LABEL_41;
  }
  if (__OFADD__(v11, v112)) {
    goto LABEL_146;
  }
  if (v11 + v112 >= v3) {
    uint64_t v30 = v3;
  }
  else {
    uint64_t v30 = v11 + v112;
  }
  if (v30 >= v11)
  {
    if (v9 == v30) {
      goto LABEL_40;
    }
    uint64_t v106 = v8;
    uint64_t v85 = (void **)(v107 + 8 * v9);
    uint64_t v111 = v11;
    uint64_t v115 = v30;
    while (1)
    {
      uint64_t v86 = *(void **)(v10 + 8 * v9);
      uint64_t v87 = v11;
      uint64_t v88 = v85;
      long long v89 = v85;
      while (1)
      {
        char v119 = *v89;
        uint64_t v90 = v119;
        uint64_t v120 = v86;
        id v91 = v86;
        id v92 = v90;
        char v93 = a1(&v120, &v119);
        if (v2)
        {
          swift_bridgeObjectRelease();

LABEL_122:
          *(void *)((v121 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
          sub_22579FB78();
          swift_bridgeObjectRelease();
          return;
        }
        char v94 = v93;

        if ((v94 & 1) == 0) {
          break;
        }
        uint64_t v10 = v117;
        if (!v117) {
          goto LABEL_150;
        }
        id v95 = *v89;
        uint64_t v86 = v89[1];
        NSObject *v89 = v86;
        v89[1] = v95;
        --v89;
        if (v9 == ++v87) {
          goto LABEL_99;
        }
      }
      uint64_t v10 = v117;
LABEL_99:
      ++v9;
      uint64_t v85 = v88 + 1;
      uint64_t v11 = v111;
      if (v9 == v115)
      {
        uint64_t v9 = v115;
        unint64_t v8 = v106;
        if (v115 < v111) {
          goto LABEL_143;
        }
LABEL_41:
        uint64_t v31 = v8;
        if (swift_isUniquelyReferenced_nonNull_native()) {
          unint64_t v8 = v31;
        }
        else {
          unint64_t v8 = sub_225785C0C(0, *((void *)v31 + 2) + 1, 1, v31);
        }
        unint64_t v33 = *((void *)v8 + 2);
        unint64_t v32 = *((void *)v8 + 3);
        unint64_t v34 = v33 + 1;
        uint64_t v10 = v117;
        if (v33 >= v32 >> 1)
        {
          uint64_t v96 = sub_225785C0C((char *)(v32 > 1), v33 + 1, 1, v8);
          uint64_t v10 = v117;
          unint64_t v8 = v96;
        }
        *((void *)v8 + 2) = v34;
        id v35 = v8 + 32;
        uint64_t v36 = &v8[16 * v33 + 32];
        *(void *)uint64_t v36 = v11;
        *((void *)v36 + 1) = v9;
        if (v33)
        {
          uint64_t v114 = v9;
          while (1)
          {
            unint64_t v37 = v34 - 1;
            if (v34 >= 4)
            {
              uint64_t v42 = &v35[16 * v34];
              uint64_t v43 = *((void *)v42 - 8);
              uint64_t v44 = *((void *)v42 - 7);
              BOOL v48 = __OFSUB__(v44, v43);
              uint64_t v45 = v44 - v43;
              if (v48) {
                goto LABEL_128;
              }
              uint64_t v47 = *((void *)v42 - 6);
              uint64_t v46 = *((void *)v42 - 5);
              BOOL v48 = __OFSUB__(v46, v47);
              uint64_t v40 = v46 - v47;
              char v41 = v48;
              if (v48) {
                goto LABEL_129;
              }
              unint64_t v49 = v34 - 2;
              char v50 = &v35[16 * v34 - 32];
              uint64_t v52 = *(void *)v50;
              uint64_t v51 = *((void *)v50 + 1);
              BOOL v48 = __OFSUB__(v51, v52);
              uint64_t v53 = v51 - v52;
              if (v48) {
                goto LABEL_131;
              }
              BOOL v48 = __OFADD__(v40, v53);
              uint64_t v54 = v40 + v53;
              if (v48) {
                goto LABEL_134;
              }
              if (v54 >= v45)
              {
                unint64_t v72 = &v35[16 * v37];
                uint64_t v74 = *(void *)v72;
                uint64_t v73 = *((void *)v72 + 1);
                BOOL v48 = __OFSUB__(v73, v74);
                uint64_t v75 = v73 - v74;
                if (v48) {
                  goto LABEL_138;
                }
                BOOL v65 = v40 < v75;
                goto LABEL_78;
              }
            }
            else
            {
              if (v34 != 3)
              {
                uint64_t v66 = *((void *)v8 + 4);
                uint64_t v67 = *((void *)v8 + 5);
                BOOL v48 = __OFSUB__(v67, v66);
                uint64_t v59 = v67 - v66;
                char v60 = v48;
                goto LABEL_72;
              }
              uint64_t v39 = *((void *)v8 + 4);
              uint64_t v38 = *((void *)v8 + 5);
              BOOL v48 = __OFSUB__(v38, v39);
              uint64_t v40 = v38 - v39;
              char v41 = v48;
            }
            if (v41) {
              goto LABEL_130;
            }
            unint64_t v49 = v34 - 2;
            id v55 = &v35[16 * v34 - 32];
            uint64_t v57 = *(void *)v55;
            uint64_t v56 = *((void *)v55 + 1);
            BOOL v58 = __OFSUB__(v56, v57);
            uint64_t v59 = v56 - v57;
            char v60 = v58;
            if (v58) {
              goto LABEL_133;
            }
            uint64_t v61 = &v35[16 * v37];
            uint64_t v63 = *(void *)v61;
            uint64_t v62 = *((void *)v61 + 1);
            BOOL v48 = __OFSUB__(v62, v63);
            uint64_t v64 = v62 - v63;
            if (v48) {
              goto LABEL_136;
            }
            if (__OFADD__(v59, v64)) {
              goto LABEL_137;
            }
            if (v59 + v64 >= v40)
            {
              BOOL v65 = v40 < v64;
LABEL_78:
              if (v65) {
                unint64_t v37 = v49;
              }
              goto LABEL_80;
            }
LABEL_72:
            if (v60) {
              goto LABEL_132;
            }
            unint64_t v68 = &v35[16 * v37];
            uint64_t v70 = *(void *)v68;
            uint64_t v69 = *((void *)v68 + 1);
            BOOL v48 = __OFSUB__(v69, v70);
            uint64_t v71 = v69 - v70;
            if (v48) {
              goto LABEL_135;
            }
            if (v71 < v59) {
              goto LABEL_89;
            }
LABEL_80:
            unint64_t v76 = v37 - 1;
            if (v37 - 1 >= v34)
            {
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
              goto LABEL_147;
            }
            if (!v10) {
              goto LABEL_149;
            }
            char v77 = v8;
            uint64_t v78 = &v35[16 * v76];
            uint64_t v79 = *(void *)v78;
            id v80 = v35;
            unint64_t v81 = v37;
            uint64_t v82 = &v35[16 * v37];
            uint64_t v83 = *((void *)v82 + 1);
            sub_22578589C((id *)(v10 + 8 * *(void *)v78), (id *)(v10 + 8 * *(void *)v82), v10 + 8 * v83, v116, a1);
            if (v2) {
              goto LABEL_121;
            }
            if (v83 < v79) {
              goto LABEL_125;
            }
            if (v81 > *((void *)v77 + 2)) {
              goto LABEL_126;
            }
            *(void *)uint64_t v78 = v79;
            *(void *)&v80[16 * v76 + 8] = v83;
            unint64_t v84 = *((void *)v77 + 2);
            if (v81 >= v84) {
              goto LABEL_127;
            }
            unint64_t v34 = v84 - 1;
            memmove(v82, v82 + 16, 16 * (v84 - 1 - v81));
            id v35 = v80;
            unint64_t v8 = v77;
            *((void *)v77 + 2) = v84 - 1;
            uint64_t v10 = v117;
            uint64_t v9 = v114;
            if (v84 <= 2) {
              goto LABEL_89;
            }
          }
        }
        unint64_t v34 = 1;
LABEL_89:
        uint64_t v3 = v113;
        if (v9 >= v113) {
          goto LABEL_105;
        }
        goto LABEL_13;
      }
    }
  }
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
  sub_22579FF68();
  __break(1u);
}

uint64_t _sSo17HDSQLitePredicateC27HealthMenstrualCyclesDaemonE45predicateForSamplesThatEndedInTheTwelveMonths6beforeAB10Foundation4DateV_tFZ_0(void *a1)
{
  uint64_t v2 = sub_22579F408();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2257382E8(0);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v49 = (uint64_t)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v43 - v9;
  uint64_t v11 = sub_22579F338();
  uint64_t v12 = *(char **)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v45 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  BOOL v48 = (char *)&v43 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  char v50 = (char *)&v43 - v18;
  MEMORY[0x270FA5388](v17);
  BOOL v20 = (char *)&v43 - v19;
  uint64_t v46 = sub_22579F418();
  uint64_t v44 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  id v22 = (char *)&v43 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v23 = objc_msgSend(self, sel_latestTimeZoneCalendar);
  sub_22579F3E8();

  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F078A8], v2);
  id v47 = a1;
  sub_22579F3F8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  int v24 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))*((void *)v12 + 6);
  uint64_t v25 = v11;
  if (v24((uint64_t)v10, 1, v11) != 1)
  {
    uint64_t v26 = (void (*)(char *, char *, uint64_t))*((void *)v12 + 4);
    v26(v20, v10, v25);
    uint64_t v45 = v20;
    uint64_t v27 = (void *)sub_22579F2B8();
    id v47 = (id)HDSampleEntityPredicateForEndDate();

    id v28 = v48;
    sub_22579F328();
    uint64_t v29 = v49;
    uint64_t v43 = v22;
    sub_225735294(v49);
    uint64_t v30 = v29;
    unint64_t v32 = (void (*)(char *, uint64_t))*((void *)v12 + 1);
    v12 += 8;
    uint64_t v31 = v32;
    BOOL v48 = v12;
    v32(v28, v25);
    if (v24(v30, 1, v25) == 1)
    {
      sub_22573831C(v30);
      goto LABEL_8;
    }
    unint64_t v33 = v50;
    v26(v50, (char *)v30, v25);
    unint64_t v34 = (void *)sub_22579F2B8();
    id v35 = (id)HDSampleEntityPredicateForEndDate();

    sub_2257341BC();
    uint64_t v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_2257A4BD0;
    unint64_t v37 = sub_225734218();
    uint64_t v38 = v47;
    *(void *)(v36 + 32) = v47;
    *(void *)(v36 + 88) = v37;
    *(void *)(v36 + 56) = v37;
    *(void *)(v36 + 64) = v35;
    id v39 = v38;
    uint64_t v10 = (char *)v35;
    uint64_t v40 = (void *)sub_22579FB48();
    swift_bridgeObjectRelease();
    id v41 = objc_msgSend(self, sel_predicateMatchingAllPredicates_, v40);

    if (v41)
    {

      v31(v33, v25);
      v31(v45, v25);
      (*(void (**)(char *, uint64_t))(v44 + 8))(v43, v46);
      return (uint64_t)v41;
    }
    __break(1u);
  }
  sub_22573831C((uint64_t)v10);
  (*((void (**)(char *, id, uint64_t))v12 + 2))(v45, v47, v25);
  unint64_t v51 = 0;
  unint64_t v52 = 0xE000000000000000;
  sub_22579FEB8();
  swift_bridgeObjectRelease();
  unint64_t v51 = 0xD000000000000021;
  unint64_t v52 = 0x80000002257A8A80;
  sub_22578F820();
  sub_2257A0038();
  sub_22579FB08();
  swift_bridgeObjectRelease();
LABEL_8:
  uint64_t result = sub_22579FF78();
  __break(1u);
  return result;
}

void _sSo17HDSQLitePredicateC27HealthMenstrualCyclesDaemonE26predicateForOngoingSamples2onABSi_tFZ_0(uint64_t a1)
{
  uint64_t v2 = sub_22579F338();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(self, sel_hk_latestPossibleDateWithDayIndex_, a1);
  id v7 = (id)HDSampleEntityPredicateForStartDate();
  sub_22579F298();
  uint64_t v8 = (void *)sub_22579F2B8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v9 = (id)HDSampleEntityPredicateForEndDate();

  sub_2257341BC();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2257A4BD0;
  unint64_t v11 = sub_225734218();
  *(void *)(v10 + 32) = v7;
  *(void *)(v10 + 88) = v11;
  *(void *)(v10 + 56) = v11;
  *(void *)(v10 + 64) = v9;
  id v12 = v7;
  id v13 = v9;
  uint64_t v14 = (void *)sub_22579FB48();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(self, sel_predicateMatchingAllPredicates_, v14);

  if (v15)
  {
  }
  else
  {
    __break(1u);
  }
}

void sub_2257341BC()
{
  if (!qword_26ABF95A8)
  {
    unint64_t v0 = sub_2257A0048();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ABF95A8);
    }
  }
}

unint64_t sub_225734218()
{
  unint64_t result = qword_26ABF94F0;
  if (!qword_26ABF94F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26ABF94F0);
  }
  return result;
}

uint64_t HDMCPregnancyStateFactory.deriveState()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22579F398();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2257383FC(0, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  id v9 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unint64_t v11 = (char *)&v59 - v10;
  uint64_t v12 = type metadata accessor for HDMCPregnancyStateFactory();
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  id v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (uint64_t *)((char *)&v59 - v17);
  MEMORY[0x270FA5388](v16);
  BOOL v20 = ((char *)&v59 - v19);
  if (!HKShowSensitiveLogItems()) {
    goto LABEL_14;
  }
  uint64_t v66 = v15;
  uint64_t v61 = v9;
  uint64_t v62 = v5;
  if (qword_26ABF9378 != -1) {
    goto LABEL_31;
  }
  while (1)
  {
    uint64_t v21 = sub_22579F458();
    __swift_project_value_buffer(v21, (uint64_t)qword_26ABF94A0);
    sub_225786254((uint64_t)v1, (uint64_t)v20);
    id v22 = sub_22579F438();
    os_log_type_t v23 = sub_22579FCB8();
    BOOL v24 = os_log_type_enabled(v22, v23);
    uint64_t v64 = v1;
    BOOL v65 = v11;
    uint64_t v63 = v2;
    if (v24)
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v70 = v26;
      *(_DWORD *)uint64_t v25 = 136446466;
      uint64_t v67 = sub_22572E428(0xD000000000000019, 0x80000002257A4910, &v70);
      sub_22579FD68();
      *(_WORD *)(v25 + 12) = 2080;
      uint64_t v59 = v25 + 14;
      uint64_t v67 = 0;
      unint64_t v68 = 0xE000000000000000;
      sub_22579FEB8();
      swift_bridgeObjectRelease();
      uint64_t v67 = 0xD000000000000015;
      unint64_t v68 = 0x80000002257A85C0;
      uint64_t v60 = v3;
      uint64_t v27 = sub_22572F19C(0, &qword_2681057D0);
      uint64_t v28 = swift_bridgeObjectRetain();
      MEMORY[0x22A634010](v28, v27);
      sub_22579FB08();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2257A0078();
      id v29 = (id)HKSensitiveLogItem();
      swift_unknownObjectRelease();
      sub_22579FD88();
      swift_unknownObjectRelease();
      uint64_t v30 = sub_22579FAD8();
      uint64_t v67 = sub_22572E428(v30, v31, &v70);
      uint64_t v3 = v60;
      sub_22579FD68();
      uint64_t v1 = v64;
      swift_bridgeObjectRelease();
      sub_225732BA4((uint64_t)v20);
      _os_log_impl(&dword_225722000, v22, v23, "[%{public}s] %s", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      uint64_t v32 = v26;
      uint64_t v2 = v63;
      MEMORY[0x22A635470](v32, -1, -1);
      MEMORY[0x22A635470](v25, -1, -1);
    }
    else
    {
      sub_225732BA4((uint64_t)v20);
    }

    sub_225786254((uint64_t)v1, (uint64_t)v18);
    unint64_t v33 = v66;
    sub_225786254((uint64_t)v1, (uint64_t)v66);
    BOOL v20 = sub_22579F438();
    os_log_type_t v34 = sub_22579FCB8();
    if (os_log_type_enabled(v20, v34))
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v60 = swift_slowAlloc();
      uint64_t v70 = v60;
      *(_DWORD *)uint64_t v35 = 136446722;
      uint64_t v67 = sub_22572E428(0xD000000000000019, 0x80000002257A4910, &v70);
      sub_22579FD68();
      *(_WORD *)(v35 + 12) = 2080;
      uint64_t v67 = 0;
      unint64_t v68 = 0xE000000000000000;
      sub_22579FEB8();
      swift_bridgeObjectRelease();
      uint64_t v67 = 0xD00000000000001BLL;
      unint64_t v68 = 0x80000002257A8570;
      if (*v18 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v36 = sub_22579FF88();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v36 = *(void *)((*v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      uint64_t v69 = v36;
      sub_2257A0038();
      sub_22579FB08();
      swift_bridgeObjectRelease();
      sub_2257A0078();
      id v37 = (id)HKSensitiveLogItem();
      swift_unknownObjectRelease();
      sub_22579FD88();
      swift_unknownObjectRelease();
      uint64_t v38 = sub_22579FAD8();
      uint64_t v67 = sub_22572E428(v38, v39, &v70);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      sub_225732BA4((uint64_t)v18);
      *(_WORD *)(v35 + 22) = 2080;
      uint64_t v67 = 0;
      unint64_t v68 = 0xE000000000000000;
      sub_22579FEB8();
      swift_bridgeObjectRelease();
      uint64_t v67 = 0xD000000000000022;
      unint64_t v68 = 0x80000002257A8590;
      if (*v66 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v40 = sub_22579FF88();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v40 = *(void *)((*v66 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      uint64_t v69 = v40;
      sub_2257A0038();
      sub_22579FB08();
      swift_bridgeObjectRelease();
      sub_2257A0078();
      id v41 = (id)HKSensitiveLogItem();
      swift_unknownObjectRelease();
      sub_22579FD88();
      swift_unknownObjectRelease();
      uint64_t v42 = sub_22579FAD8();
      uint64_t v67 = sub_22572E428(v42, v43, &v70);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      sub_225732BA4((uint64_t)v66);
      _os_log_impl(&dword_225722000, v20, v34, "[%{public}s] %s, %s", (uint8_t *)v35, 0x20u);
      uint64_t v44 = v60;
      swift_arrayDestroy();
      MEMORY[0x22A635470](v44, -1, -1);
      MEMORY[0x22A635470](v35, -1, -1);

      uint64_t v1 = v64;
      unint64_t v11 = v65;
      uint64_t v2 = v63;
    }
    else
    {
      sub_225732BA4((uint64_t)v18);
      sub_225732BA4((uint64_t)v33);

      unint64_t v11 = v65;
    }
    id v9 = v61;
    uint64_t v5 = v62;
LABEL_14:
    uint64_t v45 = *v1;
    if (*v1 >> 62) {
      break;
    }
    uint64_t v46 = *(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v46) {
      goto LABEL_21;
    }
LABEL_16:
    if ((v45 & 0xC000000000000001) != 0)
    {
      id v47 = (id)MEMORY[0x22A634380](0, v45);
      goto LABEL_19;
    }
    if (*(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v47 = *(id *)(v45 + 32);
LABEL_19:
      BOOL v48 = v47;
      swift_bridgeObjectRelease();
      id v49 = objc_msgSend(v48, sel_UUID);
      sub_22579F378();

      sub_225784948((uint64_t)v5, (uint64_t)v11);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      id v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A480]), sel_initWithPregnancySample_state_, v48, 1);
      uint64_t v51 = sub_22579FD08();

      goto LABEL_35;
    }
    __break(1u);
LABEL_31:
    swift_once();
  }
  swift_bridgeObjectRetain();
  if (sub_22579FF88()) {
    goto LABEL_16;
  }
LABEL_21:
  swift_bridgeObjectRelease();
  unint64_t v52 = v1[1];
  if (!(v52 >> 62))
  {
    uint64_t v53 = *(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v53) {
      goto LABEL_23;
    }
LABEL_33:
    swift_bridgeObjectRelease();
LABEL_34:
    id v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A480]), sel_initWithPregnancySample_state_, 0, 0);
    uint64_t v58 = sub_22579F338();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v11, 1, 1, v58);
    uint64_t v51 = sub_22579FD08();
    goto LABEL_35;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_22579FF88();
  if (!result) {
    goto LABEL_33;
  }
LABEL_23:
  if ((v52 & 0xC000000000000001) != 0)
  {
    id v55 = (id)MEMORY[0x22A634380](0, v52);
    goto LABEL_26;
  }
  if (*(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v55 = *(id *)(v52 + 32);
LABEL_26:
    uint64_t v56 = v55;
    swift_bridgeObjectRelease();
    id v57 = objc_msgSend(v56, sel_UUID);
    sub_22579F378();

    sub_225784948((uint64_t)v5, (uint64_t)v9);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if ((sub_2257850FC(v56) & 1) == 0)
    {
      sub_22573831C((uint64_t)v9);

      goto LABEL_34;
    }
    id v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A480]), sel_initWithPregnancySample_state_, v56, 2);
    uint64_t v51 = sub_22579FD08();

    unint64_t v11 = v9;
LABEL_35:

    sub_22573831C((uint64_t)v11);
    return v51;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for HDMCPregnancyStateFactory()
{
  uint64_t result = qword_26ABF9368;
  if (!qword_26ABF9368) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_225734DB0(id *a1)
{
  uint64_t v3 = *(void **)(v1 + 16);

  *a1 = v3;
  return v3;
}

void sub_225734DF4(id *a1)
{
  sub_225734E10(a1, *(void **)(v1 + 16));
}

void sub_225734E10(id *a1, void *a2)
{
  if (*a1)
  {
    uint64_t v3 = qword_26ABF9378;
    id v4 = *a1;
    if (v3 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_22579F458();
    __swift_project_value_buffer(v5, (uint64_t)qword_26ABF94A0);
    uint64_t v6 = a2;
    uint64_t v7 = sub_22579F438();
    os_log_type_t v8 = sub_22579FCB8();
    p_opt_class_meths = &OBJC_PROTOCOL___HKMCPregnancyModelProvidingInterface.opt_class_meths;
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v27 = v11;
      *(_DWORD *)uint64_t v10 = 136315394;
      swift_getMetatypeMetadata();
      uint64_t v12 = sub_225737FD8();
      aBlock[0] = sub_22572E428(v12, v13, &v27);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2048;
      id v14 = objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers], sel_count);

      aBlock[0] = v14;
      p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___HKMCPregnancyModelProvidingInterface + 48);
      sub_22579FD68();

      _os_log_impl(&dword_225722000, v7, v8, "[%s] Notifying %ld observers", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v11, -1, -1);
      MEMORY[0x22A635470](v10, -1, -1);
    }
    else
    {
    }
    id v22 = *(void **)((char *)p_opt_class_meths[336] + (void)v6);
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v4;
    aBlock[4] = sub_225730F38;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_225730ED8;
    aBlock[3] = &block_descriptor_15;
    BOOL v24 = _Block_copy(aBlock);
    id v25 = v4;
    swift_release();
    objc_msgSend(v22, sel_notifyObservers_, v24);
    _Block_release(v24);
  }
  else
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_22579F458();
    __swift_project_value_buffer(v15, (uint64_t)qword_26ABF94A0);
    uint64_t v16 = sub_22579F438();
    os_log_type_t v17 = sub_22579FC98();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v27 = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_getMetatypeMetadata();
      uint64_t v20 = sub_225737FD8();
      aBlock[0] = sub_22572E428(v20, v21, &v27);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v16, v17, "[%s] Not notifying clients due to nil model with .complete state", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v19, -1, -1);
      MEMORY[0x22A635470](v18, -1, -1);
    }
  }
}

unsigned char *sub_225735240(unsigned char *result)
{
  *uint64_t result = 2;
  return result;
}

unsigned char *sub_22573524C(unsigned char *result)
{
  if (!*result) {
    *(unsigned char *)(*(void *)(v1 + 16)
  }
             + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_shouldReRequestWork) = 1;
  return result;
}

unsigned char *sub_225735270(unsigned char *result)
{
  *uint64_t result = *(unsigned char *)(v1 + 16);
  return result;
}

uint64_t sub_22573527C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_225735294@<X0>(uint64_t a1@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v2 = sub_22579F408();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2257382E8(0);
  MEMORY[0x270FA5388](v6 - 8);
  os_log_type_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22579F338();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  unint64_t v21 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  id v14 = (char *)&v20 - v13;
  uint64_t v15 = *MEMORY[0x263F07870];
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v20(v5, v15, v2);
  uint64_t v22 = v1;
  sub_22579F3F8();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v3 + 8);
  v16(v5, v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_22573831C((uint64_t)v8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v23, 1, 1, v9);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v14, v8, v9);
    uint64_t v18 = v21;
    sub_22579F3C8();
    v20(v5, *MEMORY[0x263F078C8], v2);
    sub_22579F3F8();
    v16(v5, v2);
    uint64_t v19 = *(void (**)(char *, uint64_t))(v10 + 8);
    v19(v18, v9);
    return ((uint64_t (*)(char *, uint64_t))v19)(v14, v9);
  }
}

uint64_t sub_2257375AC(void *a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_22579F458();
  __swift_project_value_buffer(v4, (uint64_t)qword_26ABF94A0);
  swift_unknownObjectRetain_n();
  uint64_t v5 = sub_22579F438();
  os_log_type_t v6 = sub_22579FCB8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v55 = v53;
    uint64_t v8 = sub_2257A0188();
    uint64_t v57 = sub_22572E428(v8, v9, &v55);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    id v10 = objc_msgSend(a1, sel_description);
    uint64_t v11 = sub_22579FAC8();
    unint64_t v13 = v12;

    uint64_t v14 = v11;
    uint64_t v2 = v1;
    uint64_t v57 = sub_22572E428(v14, v13, &v55);
    sub_22579FD68();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v5, v6, "[%s] Running requirement evaluation for %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v53, -1, -1);
    MEMORY[0x22A635470](v7, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  id v15 = objc_msgSend(*(id *)(v2+ OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_pregnancyManager), sel_getCurrentPregnancyModel);
  if (v15)
  {
    id v16 = v15;
    os_log_type_t v17 = sub_22579F438();
    os_log_type_t v18 = sub_22579FCB8();
    id v54 = v16;
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v57 = v20;
      *(_DWORD *)uint64_t v19 = 136315394;
      uint64_t v21 = sub_2257A0188();
      uint64_t v55 = sub_22572E428(v21, v22, &v57);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2080;
      id v23 = v16;
      id v24 = (id)HKSensitiveLogItem();
      sub_22579FD88();
      swift_unknownObjectRelease();
      uint64_t v25 = sub_22579FAD8();
      unint64_t v27 = v26;

      uint64_t v55 = sub_22572E428(v25, v27, &v57);
      sub_22579FD68();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v17, v18, "[%s] Currently cached state: %s", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v20, -1, -1);
      MEMORY[0x22A635470](v19, -1, -1);
    }
    else
    {
    }
    swift_getObjectType();
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    id v36 = objc_msgSend(ObjCClassFromMetadata, sel_requirementIdentifier);
    uint64_t v37 = sub_22579FAC8();
    uint64_t v39 = v38;
    if (v37 == sub_22579FAC8() && v39 == v40)
    {

      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v41 = sub_2257A0068();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v41 & 1) == 0)
      {
        id v44 = objc_msgSend(ObjCClassFromMetadata, sel_requirementIdentifier);
        uint64_t v45 = sub_22579FAC8();
        uint64_t v47 = v46;
        if (v45 == sub_22579FAC8() && v47 == v48)
        {

          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v49 = sub_2257A0068();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v49 & 1) == 0)
          {
            id v50 = self;
            uint64_t v55 = 0;
            unint64_t v56 = 0xE000000000000000;
            sub_22579FEB8();
            sub_22579FB08();
            id v51 = objc_msgSend(ObjCClassFromMetadata, sel_requirementIdentifier);
            uint64_t v57 = (uint64_t)v51;
            type metadata accessor for HKFeatureAvailabilityRequirementIdentifier(0);
            sub_22579FF58();

            uint64_t v34 = v56;
            unint64_t v52 = (void *)sub_22579FA98();
            swift_bridgeObjectRelease();
            objc_msgSend(v50, sel_hk_error_description_, 3, v52);

            swift_willThrow();
            return v34;
          }
        }
        uint64_t v42 = v54;
        sub_225738044(v54);
        goto LABEL_18;
      }
    }
    uint64_t v42 = v54;
    objc_msgSend(v54, sel_state);
LABEL_18:
    uint64_t v34 = sub_22579FBC8();

    return v34;
  }
  uint64_t v28 = sub_22579F438();
  os_log_type_t v29 = sub_22579FC98();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v55 = v31;
    *(_DWORD *)uint64_t v30 = 136446210;
    uint64_t v32 = sub_2257A0188();
    uint64_t v57 = sub_22572E428(v32, v33, &v55);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v28, v29, "[%{public}s] Could not get pregnancy state from pregnancy manager", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v31, -1, -1);
    MEMORY[0x22A635470](v30, -1, -1);
  }

  sub_22578746C();
  return sub_22579FD18();
}

id sub_225737DE4@<X0>(void **a1@<X0>, void **a2@<X8>)
{
  return sub_225737DFC(a1, a2);
}

id sub_225737DFC@<X0>(void **a1@<X0>, void **a2@<X8>)
{
  return sub_225737E18(a1, *(void *)(v2 + 16), a2);
}

id sub_225737E18@<X0>(void **a1@<X0>, uint64_t a2@<X1>, void **a3@<X8>)
{
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_22579F458();
  __swift_project_value_buffer(v6, (uint64_t)qword_26ABF94A0);
  uint64_t v7 = sub_22579F438();
  os_log_type_t v8 = sub_22579FCB8();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = v10;
    *(_DWORD *)unint64_t v9 = 136315138;
    uint64_t v16 = a2;
    swift_getMetatypeMetadata();
    uint64_t v11 = sub_225737FD8();
    uint64_t v16 = sub_22572E428(v11, v12, &v15);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v7, v8, "[%s] Returning currently cached model", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v10, -1, -1);
    MEMORY[0x22A635470](v9, -1, -1);
  }

  unint64_t v13 = *a1;
  *a3 = *a1;
  return v13;
}

uint64_t sub_225737FD8()
{
  sub_2257A0058();
  id v0 = (id)HKSensitiveLogItem();
  swift_unknownObjectRelease();
  sub_22579FD88();
  swift_unknownObjectRelease();
  return sub_22579FAD8();
}

uint64_t sub_225738044(void *a1)
{
  sub_2257382E8(0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22579F338();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v18 - v10;
  id v12 = objc_msgSend(a1, sel_physiologicalWashoutEndDate);
  if (!v12)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_5;
  }
  unint64_t v13 = v12;
  sub_22579F2F8();

  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v14(v4, v9, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_5:
    sub_22573831C((uint64_t)v4);
    char v15 = 1;
    return v15 & 1;
  }
  v14(v11, v4, v5);
  sub_22579F328();
  char v15 = sub_22579F2D8();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v9, v5);
  v16(v11, v5);
  return v15 & 1;
}

void sub_225738284(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_2257382E8(uint64_t a1)
{
}

uint64_t sub_22573831C(uint64_t a1)
{
  sub_2257383FC(0, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2257383A8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_22579FD48();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_2257383FC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

id _UserCharacteristicOfType(void *a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [a1 userCharacteristicsManager];
  uint64_t v5 = [MEMORY[0x263F0A598] characteristicTypeForIdentifier:v3];
  id v10 = 0;
  uint64_t v6 = [v4 userCharacteristicForType:v5 error:&v10];
  id v7 = v10;

  if (v6) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v7 == 0;
  }
  if (!v8)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      _UserCharacteristicOfType_cold_1();
    }
  }

  return v6;
}

uint64_t _UserCharacteristicModificationDayOfType(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1 userCharacteristicsManager];
  BOOL v8 = [MEMORY[0x263F0A598] characteristicTypeForIdentifier:v5];
  id v14 = 0;
  uint64_t v9 = [v7 modificationDateForCharacteristicWithType:v8 error:&v14];
  id v10 = v14;

  if (v9) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v10 == 0;
  }
  if (!v11)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      _UserCharacteristicModificationDayOfType_cold_1();
    }
  }
  uint64_t v12 = objc_msgSend(v9, "hk_dayIndexWithCalendar:", v6);

  return v12;
}

void sub_22573B050(_Unwind_Exception *a1)
{
}

void sub_22573BBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

void sub_22573C080(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_22577C494(255, a3);
    unint64_t v4 = sub_22579FD48();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_22573C0D8()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

id sub_22573C104()
{
  return HDMedicalIDDataManager.getMedicalIDData()();
}

uint64_t sub_22573C128(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_22573C130(a1, a2, a3, a4, *(void **)(v4 + 16));
}

uint64_t sub_22573C130(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    id v6 = a2;
    MEMORY[0x22A633FE0]();
    if (*(void *)((*a5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_22579FB88();
    }
    sub_22579FBA8();
    sub_22579FB78();
  }
  return 1;
}

void sub_22573C1AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_22579F248();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

void sub_22573C21C(uint64_t a1, uint64_t a2)
{
  sub_22573C1AC(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_22573C238(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t type metadata accessor for HDMCExperienceStoreServer()
{
  return self;
}

uint64_t sub_22573C334(uint64_t a1)
{
  sub_22573C080(0, &qword_26ABF9B30, &qword_26ABF9B08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22573C3A8(uint64_t a1, uint64_t a2)
{
  sub_22573C080(0, &qword_26ABF9B30, &qword_26ABF9B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_22573C428(char a1, uint64_t a2)
{
  sub_22573C430(a1, a2, *(void *)(v2 + 16));
}

void sub_22573C430(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_22579F248();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

void sub_22573C4A0()
{
  if (!qword_26ABF9B20)
  {
    sub_2257383A8(255, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26ABF9B20);
    }
  }
}

uint64_t sub_22573C520(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_2257383A8(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_22573D72C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22573E50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22573EF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_2257443A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_225745904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0x16u);
}

id OUTLINED_FUNCTION_1_1(id a1, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return a1;
}

id OUTLINED_FUNCTION_3_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_6(uint64_t result, float a2)
{
  *(float *)uint64_t v2 = a2;
  *(void *)(v2 + 4) = result;
  *(_WORD *)(v2 + 12) = 2114;
  *(void *)(v2 + 14) = v3;
  return result;
}

void sub_225747FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_22574AA80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_3_1(id a1)
{
  return a1;
}

id OUTLINED_FUNCTION_5_0(uint64_t a1, void *a2)
{
  return a2;
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_22575071C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_225750D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_225752C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_2257539AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

id OUTLINED_FUNCTION_3_2(uint64_t a1, void *a2)
{
  return a2;
}

void sub_225756714(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t HDMCLocalFeatureAttributes()
{
  return [MEMORY[0x263F0A380] featureAttributesDerivedFromOSBuildAndFeatureVersion:@"4" watchDeviceIdentifier:@"(01)00194253312512" phoneDeviceIdentifier:@"(01)00194253312529"];
}

uint64_t HDMCHeartRateInputLocalFeatureAttributes()
{
  return [MEMORY[0x263F0A380] featureAttributesDerivedFromOSBuildAndFeatureVersion:@"4" watchDeviceIdentifier:@"(01)00194253312512" phoneDeviceIdentifier:@"(01)00194253312529"];
}

uint64_t HDMCWristTemperatureInputLocalFeatureAttributes()
{
  return [MEMORY[0x263F0A380] featureAttributesDerivedFromOSBuildAndFeatureVersion:@"4" watchDeviceIdentifier:@"(01)00194253312512" phoneDeviceIdentifier:@"(01)00194253312529"];
}

__CFString *NSStringFromHDMCOvulationConfirmationNotificationState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"FeatureOff";
  }
  else {
    return off_264750F00[a1 - 1];
  }
}

void sub_22575834C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_225758608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_225759234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_22575E324(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_22575E440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22575E5B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22575E670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22575E890(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22575EA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_22575EC14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
  _Block_object_dispose(&a15, 8);
  if (__p)
  {
    a22 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__8(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_22575EEAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22575F03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_22575F1F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22575F464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<double>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264750680, MEMORY[0x263F8C060]);
}

void sub_22575F510(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<double>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_22575F624(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x4A8], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<double>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void sub_225760834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_225767F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_225768FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

uint64_t HDMCPregnancyStateQueryServer.objectTypes.getter()
{
  sub_22572FE14(0, (unint64_t *)&qword_26ABF95A0, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2257A3D00;
  sub_22572F19C(0, &qword_26ABF94E8);
  *(void *)(inited + 32) = MEMORY[0x22A634170]((id)*MEMORY[0x263F093C0]);
  sub_22579FB78();
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_22579FF88();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v2 = MEMORY[0x263F8EE88];
    goto LABEL_6;
  }
  if (!*(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_5;
  }
LABEL_3:
  sub_22572F9BC(inited);
  uint64_t v2 = v1;
LABEL_6:
  swift_bridgeObjectRelease();
  return v2;
}

id HDMCPregnancyStateQueryServer.__allocating_init(uuid:configuration:client:delegate:pregnancyManager:)(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v11 = objc_allocWithZone(v5);
  id v12 = sub_22572E164(a1, (uint64_t)a2, a3, a4, a5);

  swift_unknownObjectRelease();
  return v12;
}

id HDMCPregnancyStateQueryServer.init(uuid:configuration:client:delegate:pregnancyManager:)(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = sub_22572E164(a1, (uint64_t)a2, a3, a4, a5);

  swift_unknownObjectRelease();
  return v8;
}

uint64_t static HDMCPregnancyStateQueryServer.queryClass()()
{
  return sub_22572F19C(0, (unint64_t *)&unk_26ABF9530);
}

void static HDMCPregnancyStateQueryServer.validate(_:client:)(uint64_t a1, void *a2)
{
}

Swift::Bool __swiftcall HDMCPregnancyStateQueryServer._shouldExecuteWhenProtectedDataIsUnavailable()()
{
  return 1;
}

Swift::Void __swiftcall HDMCPregnancyStateQueryServer._queue_stop()()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon29HDMCPregnancyStateQueryServer_pregnancyManager);
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers), sel_unregisterObserver_, v0);
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers);
  objc_msgSend(v2, sel_unregisterObserver_, v0);
}

id HDMCPregnancyStateQueryServer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22576E3E8(uint64_t a1, uint64_t a2)
{
  return sub_22576E75C(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_22576E408(uint64_t a1, uint64_t a2)
{
  return sub_22576E75C(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_22576E430(uint64_t a1, id *a2)
{
  uint64_t result = sub_22579FAA8();
  *a2 = 0;
  return result;
}

uint64_t sub_22576E4A8(uint64_t a1, id *a2)
{
  char v3 = sub_22579FAB8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_22576E528@<X0>(uint64_t *a1@<X8>)
{
  sub_22579FAC8();
  uint64_t v2 = sub_22579FA98();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22576E570@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_22579FA98();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22576E5B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22579FAC8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22576E5E4(uint64_t a1)
{
  uint64_t v2 = sub_22576EAA8(&qword_268105290, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
  uint64_t v3 = sub_22576EAA8(&qword_268105298, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_22576E6A0(uint64_t a1)
{
  uint64_t v2 = sub_22576EAA8(&qword_268105250, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
  uint64_t v3 = sub_22576EAA8((unint64_t *)&unk_268105258, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_22576E75C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_22579FAC8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22576E7A0()
{
  sub_22579FAC8();
  sub_22579FAF8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22576E7F4()
{
  sub_22579FAC8();
  sub_2257A0108();
  sub_22579FAF8();
  uint64_t v0 = sub_2257A0128();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22576E868()
{
  uint64_t v0 = sub_22579FAC8();
  uint64_t v2 = v1;
  if (v0 == sub_22579FAC8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_2257A0068();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_22576E8F4(uint64_t a1)
{
  sub_22572FE14(0, qword_26ABF93A8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for HDMCPregnancyStateQueryServer()
{
  return self;
}

uint64_t method lookup function for HDMCPregnancyStateQueryServer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HDMCPregnancyStateQueryServer);
}

uint64_t dispatch thunk of HDMCPregnancyStateQueryServer.__allocating_init(uuid:configuration:client:delegate:pregnancyManager:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void type metadata accessor for HKFeatureAvailabilityRequirementIdentifier(uint64_t a1)
{
}

uint64_t sub_22576EA18()
{
  return sub_22576EAA8(&qword_268105238, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
}

uint64_t sub_22576EA60()
{
  return sub_22576EAA8(&qword_268105240, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
}

uint64_t sub_22576EAA8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22576EAF0()
{
  return sub_22576EAA8(&qword_268105248, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
}

void type metadata accessor for HDCloudSyncStateResult(uint64_t a1)
{
}

void type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(uint64_t a1)
{
}

uint64_t sub_22576EB88()
{
  return sub_22576EAA8(&qword_268105278, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
}

uint64_t sub_22576EBD0()
{
  return sub_22576EAA8(&qword_268105280, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
}

uint64_t sub_22576EC18()
{
  return sub_22576EAA8(&qword_268105288, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
}

uint64_t sub_22576EC68(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2
                + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_unitTest_deletedPregnancySamplesQueryResults);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22576ECD4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_22576ED20(uint64_t a1)
{
  uint64_t v3 = (void *)(v1
                + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_unitTest_deletedPregnancySamplesQueryResults);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_22576ED74())()
{
  return j__swift_endAccess;
}

id HDMCPregnancyFeatureAdjustmentManager.protectedDataOperation.getter()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_protectedDataOperation));
}

char *HDMCPregnancyFeatureAdjustmentManager.__allocating_init(pregnancyManager:profile:experienceModelProvider:)(void *a1, void *a2, void *a3)
{
  id v7 = objc_allocWithZone(v3);
  memset(v11, 0, sizeof(v11));
  uint64_t v12 = 0;
  id v8 = (char *)objc_allocWithZone((Class)type metadata accessor for HDMCPregnancyFeatureAdjustmentManager());
  uint64_t v9 = sub_22577B3C0(a1, a2, a3, 0, 0, 0, (uint64_t)v11, v8);

  swift_unknownObjectRelease();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v9;
}

char *HDMCPregnancyFeatureAdjustmentManager.init(pregnancyManager:profile:experienceModelProvider:)(void *a1, void *a2, void *a3)
{
  memset(v9, 0, sizeof(v9));
  uint64_t v10 = 0;
  uint64_t v6 = (char *)objc_allocWithZone((Class)type metadata accessor for HDMCPregnancyFeatureAdjustmentManager());
  id v7 = sub_22577B3C0(a1, a2, a3, 0, 0, 0, (uint64_t)v9, v6);

  swift_unknownObjectRelease();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

uint64_t HDMCPregnancyFeatureAdjustmentManager.__allocating_init(pregnancyProvider:profile:experienceModelProvider:operation:cardioFitnessFeatureStatusManager:cardioFitnessFeatureAvailabilityManager:medicalIDDataManager:)(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_22576F068(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(uint64_t, void *, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_22577B820);
}

uint64_t type metadata accessor for HDMCPregnancyFeatureAdjustmentManager()
{
  return self;
}

uint64_t HDMCPregnancyFeatureAdjustmentManager.init(pregnancyProvider:profile:experienceModelProvider:operation:cardioFitnessFeatureStatusManager:cardioFitnessFeatureAvailabilityManager:medicalIDDataManager:)(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_22576F068(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(uint64_t, void *, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_22577B5EC);
}

uint64_t sub_22576F068(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t, void *, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v18 = a8(a1, a2, a3, a4, a5, a6, a7, v8, ObjectType);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v18;
}

uint64_t sub_22576F12C(void *a1, void *a2, void *a3, void *a4, void (*a5)(void), void (*a6)(void))
{
  uint64_t v12 = a2[3];
  uint64_t v13 = a2[4];
  id v14 = __swift_project_boxed_opaque_existential_1(a2, v12);
  return sub_225776ADC(a1, (uint64_t)v14, a3, a4, a5, a6, v6, v12, v13);
}

uint64_t sub_22576F1B4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    sub_22579FAC8();
    sub_2257A0108();
    sub_22579FAF8();
    uint64_t v3 = sub_2257A0128();
    swift_bridgeObjectRelease();
    uint64_t v4 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v5 = v3 & ~v4;
    uint64_t v6 = a2 + 56;
    if ((*(void *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
    {
      uint64_t v7 = sub_22579FAC8();
      uint64_t v9 = v8;
      if (v7 == sub_22579FAC8() && v9 == v10)
      {
LABEL_17:
        swift_bridgeObjectRelease_n();
        goto LABEL_18;
      }
      char v12 = sub_2257A0068();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v12)
      {
LABEL_18:
        char v20 = 1;
        return v20 & 1;
      }
      uint64_t v13 = ~v4;
      unint64_t v14 = (v5 + 1) & v13;
      if ((*(void *)(v6 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
      {
        while (1)
        {
          uint64_t v15 = sub_22579FAC8();
          uint64_t v17 = v16;
          if (v15 == sub_22579FAC8() && v17 == v18) {
            break;
          }
          char v20 = sub_2257A0068();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v20 & 1) == 0)
          {
            unint64_t v14 = (v14 + 1) & v13;
            if ((*(void *)(v6 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14)) {
              continue;
            }
          }
          return v20 & 1;
        }
        goto LABEL_17;
      }
    }
  }
  char v20 = 0;
  return v20 & 1;
}

uint64_t sub_22576F37C(id *a1)
{
  uint64_t v2 = sub_22579F398();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(*a1, sel_sampleUUID);
  sub_22579F378();

  char v7 = sub_22579F368();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7 & 1;
}

uint64_t sub_22576F488(char a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, uint64_t (*a9)(uint64_t))
{
  v193 = a7;
  os_log_type_t v194 = a8;
  uint64_t v192 = a6;
  uint64_t v173 = a5;
  uint64_t v191 = sub_22579F398();
  char v12 = *(void (***)(char *, uint64_t, uint64_t, uint64_t))(v191 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v191);
  id v184 = (char *)v168 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v168 - v15;
  uint64_t v190 = sub_22579F338();
  uint64_t v179 = *(void *)(v190 - 8);
  MEMORY[0x270FA5388](v190);
  unint64_t v170 = (char *)v168 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2257383A8(0, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v183 = (char *)v168 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  id v23 = (char *)v168 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  char v174 = (void (**)(char *, uint64_t))((char *)v168 - v25);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  int v182 = (char *)v168 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)v168 - v29;
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  uint64_t v189 = (char *)v168 - v32;
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)v168 - v34;
  uint64_t v36 = MEMORY[0x270FA5388](v33);
  uint64_t v172 = (char *)v168 - v37;
  MEMORY[0x270FA5388](v36);
  uint64_t v180 = (char *)v168 - v38;
  uint64_t v39 = HKShowSensitiveLogItems();
  if ((a1 & 1) == 0)
  {
    if (v39)
    {
      if (qword_26ABF9378 != -1) {
        swift_once();
      }
      uint64_t v114 = sub_22579F458();
      __swift_project_value_buffer(v114, (uint64_t)qword_26ABF94A0);
      id v115 = a2;
      id v116 = a2;
      uint64_t v117 = sub_22579F438();
      os_log_type_t v118 = sub_22579FC98();
      if (os_log_type_enabled(v117, v118))
      {
        uint64_t v119 = swift_slowAlloc();
        uint64_t v120 = swift_slowAlloc();
        uint64_t v199 = v120;
        *(_DWORD *)uint64_t v119 = 136315394;
        uint64_t v121 = sub_2257A0188();
        unint64_t v198 = (void *)sub_22572E428(v121, v122, &v199);
        sub_22579FD68();
        swift_bridgeObjectRelease();
        *(_WORD *)(v119 + 12) = 2080;
        unint64_t v198 = a2;
        id v123 = a2;
        sub_22573C080(0, &qword_2681055F0, (unint64_t *)&qword_2681055E8);
        uint64_t v124 = sub_22579FAD8();
        unint64_t v198 = (void *)sub_22572E428(v124, v125, &v199);
        sub_22579FD68();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_225722000, v117, v118, "[%s] Error updating Low Cardio Fitness Notifications feature settings: %s", (uint8_t *)v119, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x22A635470](v120, -1, -1);
        MEMORY[0x22A635470](v119, -1, -1);
      }
      else
      {
      }
    }
    return a9(v39);
  }
  uint64_t v169 = v35;
  char v188 = v30;
  uint64_t v196 = v23;
  if (v39)
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_22579F458();
    __swift_project_value_buffer(v40, (uint64_t)qword_26ABF94A0);
    char v41 = sub_22579F438();
    os_log_type_t v42 = sub_22579FCB8();
    if (os_log_type_enabled(v41, v42))
    {
      unint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      uint64_t v197 = v12;
      uint64_t v45 = v44;
      uint64_t v199 = v44;
      *(_DWORD *)unint64_t v43 = 136315138;
      uint64_t v46 = sub_2257A0188();
      unint64_t v198 = (void *)sub_22572E428(v46, v47, &v199);
      uint64_t v30 = v188;
      id v23 = v196;
      sub_22579FD68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v41, v42, "[%s] Successfully adjusted Low Cardio Fitness Notification settings. Attempting to update pregnancy setup record", v43, 0xCu);
      swift_arrayDestroy();
      uint64_t v48 = v45;
      char v12 = v197;
      MEMORY[0x22A635470](v48, -1, -1);
      MEMORY[0x22A635470](v43, -1, -1);
    }
  }
  sub_22572F19C(0, (unint64_t *)&qword_26ABF9398);
  char v49 = (void *)sub_22579FD18();
  char v50 = sub_22579FD38();

  unint64_t v187 = a4;
  unint64_t v51 = a4 >> 62;
  if (v50)
  {
    if (v51)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_22579FF88();
      uint64_t v52 = result;
      id v54 = v16;
      if (result) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v52 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      id v54 = v16;
      if (v52)
      {
LABEL_11:
        if (v52 >= 1)
        {
          uint64_t v55 = 0;
          id v177 = (id)(a4 & 0xC000000000000001);
          uint64_t v197 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v179 + 56);
          uint64_t v176 = (void (**)(char *, uint64_t))*MEMORY[0x263F450D8];
          v168[1] = v179 + 16;
          uint64_t v196 = (char *)(v179 + 48);
          uint64_t v171 = (void (**)(char *, uint64_t, uint64_t))(v179 + 32);
          uint64_t v175 = (void (**)(char *, uint64_t))(v179 + 8);
          char v174 = (void (**)(char *, uint64_t))(v12 + 1);
          uint64_t v178 = (char *)v52;
          v181 = v54;
          uint64_t v56 = v190;
          while (1)
          {
            uint64_t v186 = v55;
            uint64_t v70 = v177
                ? (char *)MEMORY[0x22A634380](v55, a4)
                : (char *)*(id *)(a4 + 8 * (void)v55 + 32);
            uint64_t v71 = v70;
            id v72 = objc_msgSend(v70, sel_pregnancyAdjustedFeaturesSet);
            type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
            uint64_t v74 = v73;
            uint64_t v75 = sub_22577C0D8(&qword_268105290, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
            uint64_t v76 = sub_22579FBE8();

            uint64_t v199 = v76;
            char v77 = v176;
            uint64_t v78 = (void *)sub_225771048();

            v195 = v71;
            id v79 = objc_msgSend(v71, sel_postPregnancyFeatureAdjustmentCompletionLog);
            id v184 = (char *)v75;
            uint64_t v185 = v74;
            uint64_t v80 = sub_22579FA38();

            unint64_t v81 = v189;
            if (!*(void *)(v80 + 16)) {
              break;
            }
            swift_bridgeObjectRetain();
            uint64_t v82 = v77;
            unint64_t v83 = sub_2257824B8((uint64_t)v82);
            if (v84)
            {
              uint64_t v85 = v179;
              uint64_t v86 = (uint64_t)v180;
              (*(void (**)(char *, unint64_t, uint64_t))(v179 + 16))(v180, *(void *)(v80 + 56) + *(void *)(v179 + 72) * v83, v56);
              uint64_t v87 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v85 + 56);
              v87((char *)v86, 0, 1, v56);
            }
            else
            {
              uint64_t v87 = *v197;
              uint64_t v86 = (uint64_t)v180;
              (*v197)(v180, 1, 1, v56);
            }

            uint64_t v88 = (void *)v80;
            swift_bridgeObjectRelease();
            uint64_t v90 = *(unsigned int (**)(char *, uint64_t, uint64_t))v196;
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))v196)(v86, 1, v56) == 1)
            {
              uint64_t v89 = v86;
LABEL_25:
              uint64_t v91 = (uint64_t)v172;
              sub_22573C520(v89, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
              sub_22577C120(v173, v91);
              uint64_t v90 = *(unsigned int (**)(char *, uint64_t, uint64_t))v196;
              if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))v196)(v91, 1, v56) == 1)
              {
                id v92 = v77;
                sub_22573C520(v91, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
                char v93 = v88;
                swift_bridgeObjectRetain();
                unint64_t v94 = sub_2257824B8((uint64_t)v92);
                char v96 = v95;
                swift_bridgeObjectRelease();
                if (v96)
                {
                  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                  unint64_t v198 = v88;
                  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                  {
                    sub_225772290();
                    char v93 = v198;
                  }

                  uint64_t v98 = (uint64_t)v169;
                  (*(void (**)(char *, unint64_t, uint64_t))(v179 + 32))(v169, v93[7] + *(void *)(v179 + 72) * v94, v56);
                  sub_225772064(v94, (uint64_t)v93);
                  swift_bridgeObjectRelease();
                  uint64_t v99 = 0;
                }
                else
                {
                  uint64_t v99 = 1;
                  uint64_t v98 = (uint64_t)v169;
                }
                v87((char *)v98, v99, 1, v56);

                sub_22573C520(v98, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
                uint64_t v103 = v195;
              }
              else
              {
                uint64_t v100 = (uint64_t)v170;
                (*v171)(v170, v91, v56);
                uint64_t v101 = v77;
                char v102 = swift_isUniquelyReferenced_nonNull_native();
                unint64_t v198 = v88;
                sub_225775630(v100, v101, v102);

                swift_bridgeObjectRelease();
                uint64_t v103 = v195;
              }
              goto LABEL_34;
            }
            sub_22573C520(v86, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
            uint64_t v103 = v195;
LABEL_34:
            uint64_t v183 = (char *)objc_msgSend(v103, sel_version);
            id v104 = objc_msgSend(v103, sel_sampleUUID);
            sub_22579F378();

            id v105 = objc_msgSend(v103, sel_educationalStepsReviewDate);
            if (v105)
            {
              uint64_t v106 = v105;
              sub_22579F2F8();

              uint64_t v107 = 0;
            }
            else
            {
              uint64_t v107 = 1;
            }
            uint64_t v108 = 1;
            v87(v81, v107, 1, v56);
            id v109 = objc_msgSend(v103, sel_configurationStepsReviewDate);
            if (v109)
            {
              uint64_t v110 = v109;
              sub_22579F2F8();

              uint64_t v108 = 0;
            }
            v87(v30, v108, 1, v56);
            int v182 = (char *)sub_22579F358();
            uint64_t v111 = v189;
            if (v90(v189, 1, v56) == 1)
            {
              uint64_t v112 = 0;
            }
            else
            {
              uint64_t v112 = (void *)sub_22579F2B8();
              (*v175)(v111, v56);
            }
            uint64_t v113 = v188;
            if (v90(v188, 1, v56) == 1)
            {
              uint64_t v57 = 0;
            }
            else
            {
              uint64_t v57 = (void *)sub_22579F2B8();
              (*v175)(v113, v56);
            }
            uint64_t v58 = v186 + 1;
            id v59 = objc_allocWithZone(MEMORY[0x263F451A8]);
            uint64_t v60 = (void *)sub_22579FBD8();
            swift_bridgeObjectRelease();
            uint64_t v61 = (void *)sub_22579FA28();
            swift_bridgeObjectRelease();
            uint64_t v63 = v182;
            uint64_t v62 = v183;
            id v64 = objc_msgSend(v59, sel_initWithVersion_sampleUUID_educationalStepsReviewDate_configurationStepsReviewDate_pregnancyAdjustedFeaturesSet_postPregnancyFeatureAdjustmentCompletionLog_, v183, v182, v112, v57, v60, v61);

            (*v174)(v181, v191);
            uint64_t v65 = v194[3];
            uint64_t v66 = v194[4];
            uint64_t v67 = __swift_project_boxed_opaque_existential_1(v194, v65);
            uint64_t v68 = v65;
            uint64_t v55 = v58;
            sub_22577AD7C(v64, v193, (uint64_t)v67, v192, v68, v66);

            BOOL v69 = v178 == v58;
            a4 = v187;
            uint64_t v30 = v188;
            if (v69) {
              goto LABEL_80;
            }
          }
          uint64_t v88 = (void *)v80;
          uint64_t v87 = *v197;
          uint64_t v89 = (uint64_t)v180;
          (*v197)(v180, 1, 1, v56);
          goto LABEL_25;
        }
        __break(1u);
        goto LABEL_83;
      }
    }
    goto LABEL_80;
  }
  if (!v51)
  {
    uint64_t v126 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v126) {
      goto LABEL_51;
    }
LABEL_80:
    uint64_t v39 = swift_bridgeObjectRelease();
    return a9(v39);
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_22579FF88();
  uint64_t v126 = result;
  if (!result) {
    goto LABEL_80;
  }
LABEL_51:
  if (v126 >= 1)
  {
    uint64_t v127 = 0;
    uint64_t v180 = (char *)(a4 & 0xC000000000000001);
    uint64_t v178 = (char *)(v179 + 56);
    id v177 = (id)*MEMORY[0x263F450D8];
    uint64_t v173 = v179 + 16;
    uint64_t v197 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v179 + 48);
    uint64_t v176 = (void (**)(char *, uint64_t))(v179 + 8);
    uint64_t v175 = (void (**)(char *, uint64_t))(v12 + 1);
    v181 = (char *)v126;
    uint64_t v128 = v190;
    do
    {
      v195 = v127;
      if (v180) {
        BOOL v140 = (char *)MEMORY[0x22A634380](v127, a4);
      }
      else {
        BOOL v140 = (char *)*(id *)(a4 + 8 * (void)v127 + 32);
      }
      uint64_t v141 = v140;
      id v142 = objc_msgSend(v140, sel_pregnancyAdjustedFeaturesSet);
      type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
      uint64_t v143 = sub_22577C0D8(&qword_268105290, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
      uint64_t v144 = sub_22579FBE8();

      uint64_t v199 = v144;
      id v145 = v177;
      sub_225771740(&v198, v145);

      id v146 = objc_msgSend(v141, sel_postPregnancyFeatureAdjustmentCompletionLog);
      char v188 = (char *)v143;
      uint64_t v147 = (void *)sub_22579FA38();

      unint64_t v198 = v147;
      uint64_t v148 = v182;
      uint64_t v149 = (void (**)(char *, uint64_t, uint64_t, uint64_t))v178;
      if (v147[2])
      {
        swift_bridgeObjectRetain();
        id v150 = v145;
        unint64_t v151 = sub_2257824B8((uint64_t)v150);
        if (v152)
        {
          uint64_t v153 = v179;
          (*(void (**)(char *, unint64_t, uint64_t))(v179 + 16))(v148, v147[7] + *(void *)(v179 + 72) * v151, v128);
          uint64_t v154 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v153 + 56);
          v154(v148, 0, 1, v128);
        }
        else
        {
          uint64_t v154 = *v149;
          (*v149)(v148, 1, 1, v128);
        }

        swift_bridgeObjectRelease();
        if (((unsigned int (*)(char *, uint64_t, uint64_t))*v197)(v148, 1, v128) != 1)
        {
          sub_22573C520((uint64_t)v148, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
          id v155 = v150;
          uint64_t v148 = (char *)v174;
          sub_22577125C((uint64_t)v155, (uint64_t)v174);
        }
      }
      else
      {
        uint64_t v154 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))v178;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))v178)(v182, 1, 1, v128);
      }
      sub_22573C520((uint64_t)v148, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
      uint64_t v186 = (char *)objc_msgSend(v141, sel_version);
      id v156 = objc_msgSend(v141, sel_sampleUUID);
      sub_22579F378();

      id v157 = objc_msgSend(v141, sel_educationalStepsReviewDate);
      int v158 = v183;
      if (v157)
      {
        uint64_t v159 = v157;
        sub_22579F2F8();

        uint64_t v160 = 0;
      }
      else
      {
        uint64_t v160 = 1;
      }
      uint64_t v161 = 1;
      v154(v23, v160, 1, v128);
      id v162 = objc_msgSend(v141, sel_configurationStepsReviewDate);
      if (v162)
      {
        uint64_t v163 = v162;
        sub_22579F2F8();

        uint64_t v161 = 0;
      }
      v154(v158, v161, 1, v128);
      uint64_t v185 = sub_22579F358();
      uint64_t v164 = v196;
      unint64_t v165 = *v197;
      if (((unsigned int (*)(char *, uint64_t, uint64_t))*v197)(v196, 1, v128) == 1)
      {
        uint64_t v166 = 0;
      }
      else
      {
        uint64_t v166 = (void *)sub_22579F2B8();
        (*v176)(v164, v128);
      }
      int v167 = ((uint64_t (*)(char *, uint64_t, uint64_t))v165)(v158, 1, v128);
      uint64_t v189 = v141;
      if (v167 == 1)
      {
        uint64_t v129 = 0;
      }
      else
      {
        uint64_t v129 = (void *)sub_22579F2B8();
        (*v176)(v158, v128);
      }
      uint64_t v127 = v195 + 1;
      id v130 = objc_allocWithZone(MEMORY[0x263F451A8]);
      v131 = (void *)sub_22579FBD8();
      swift_bridgeObjectRelease();
      v132 = (void *)sub_22579FA28();
      swift_bridgeObjectRelease();
      id v133 = v130;
      uint64_t v135 = (void *)v185;
      id v134 = v186;
      id v136 = objc_msgSend(v133, sel_initWithVersion_sampleUUID_educationalStepsReviewDate_configurationStepsReviewDate_pregnancyAdjustedFeaturesSet_postPregnancyFeatureAdjustmentCompletionLog_, v186, v185, v166, v129, v131, v132);

      (*v175)(v184, v191);
      uint64_t v137 = v194[3];
      uint64_t v138 = v194[4];
      BOOL v139 = __swift_project_boxed_opaque_existential_1(v194, v137);
      sub_22577AD7C(v136, v193, (uint64_t)v139, v192, v137, v138);

      a4 = v187;
      id v23 = v196;
    }
    while (v181 != v127);
    goto LABEL_80;
  }
LABEL_83:
  __break(1u);
  return result;
}

void sub_2257708E4(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_22577095C(void *a1, void *a2, void *a3, void (*a4)(uint64_t), uint64_t a5)
{
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  char v12 = __swift_project_boxed_opaque_existential_1(a1, v10);
  return sub_225775A30((uint64_t)v12, a2, a3, a4, a5, v5, v10, v11);
}

void sub_2257709D8(void *a1)
{
  uint64_t ObjectType = swift_getObjectType();
  id v3 = objc_msgSend(a1, sel_state);
  if (v3) {
    BOOL v4 = v3 == (id)2;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    sub_225731270(2);
  }
  else
  {
    if (v3 == (id)1)
    {
      if (!HKShowSensitiveLogItems()) {
        return;
      }
      if (qword_26ABF9378 != -1) {
        swift_once();
      }
      uint64_t v5 = sub_22579F458();
      __swift_project_value_buffer(v5, (uint64_t)qword_26ABF94A0);
      oslog = sub_22579F438();
      os_log_type_t v6 = sub_22579FCB8();
      if (os_log_type_enabled(oslog, v6))
      {
        char v7 = (uint8_t *)swift_slowAlloc();
        uint64_t v8 = swift_slowAlloc();
        uint64_t v17 = v8;
        *(_DWORD *)char v7 = 136315138;
        uint64_t v9 = sub_2257A0188();
        uint64_t v16 = sub_22572E428(v9, v10, &v17);
        sub_22579FD68();
        swift_bridgeObjectRelease();
        uint64_t v11 = "[%s] Received update to ongoing pregnancy. Wait to perform work when we receive the corresponding setup re"
LABEL_19:
        _os_log_impl(&dword_225722000, oslog, v6, v11, v7, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A635470](v8, -1, -1);
        MEMORY[0x22A635470](v7, -1, -1);

        return;
      }
    }
    else
    {
      if (qword_26ABF9378 != -1) {
        swift_once();
      }
      uint64_t v12 = sub_22579F458();
      __swift_project_value_buffer(v12, (uint64_t)qword_26ABF94A0);
      oslog = sub_22579F438();
      os_log_type_t v6 = sub_22579FC98();
      if (os_log_type_enabled(oslog, v6))
      {
        char v7 = (uint8_t *)swift_slowAlloc();
        uint64_t v8 = swift_slowAlloc();
        uint64_t v16 = v8;
        uint64_t v17 = ObjectType;
        *(_DWORD *)char v7 = 136315138;
        swift_getMetatypeMetadata();
        uint64_t v13 = sub_225737FD8();
        uint64_t v17 = sub_22572E428(v13, v14, &v16);
        sub_22579FD68();
        swift_bridgeObjectRelease();
        uint64_t v11 = "[%s] Received an unexpected state.";
        goto LABEL_19;
      }
    }
  }
}

void sub_225770CF0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), void (*a5)(void))
{
}

id HDMCPregnancyFeatureAdjustmentManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void HDMCPregnancyFeatureAdjustmentManager.init()()
{
}

id HDMCPregnancyFeatureAdjustmentManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HDMCPregnancyFeatureAdjustmentManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall HDMCPregnancyFeatureAdjustmentManager.experienceModelManagerDidUpdateModel()()
{
  swift_getObjectType();
  if (HKShowSensitiveLogItems())
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v0 = sub_22579F458();
    __swift_project_value_buffer(v0, (uint64_t)qword_26ABF94A0);
    id v1 = sub_22579F438();
    os_log_type_t v2 = sub_22579FCB8();
    if (os_log_type_enabled(v1, v2))
    {
      id v3 = (uint8_t *)swift_slowAlloc();
      uint64_t v4 = swift_slowAlloc();
      uint64_t v7 = v4;
      *(_DWORD *)id v3 = 136315138;
      uint64_t v5 = sub_2257A0188();
      sub_22572E428(v5, v6, &v7);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v1, v2, "[%s] Received experience model update", v3, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v4, -1, -1);
      MEMORY[0x22A635470](v3, -1, -1);
    }
  }
  sub_225731270(2);
}

uint64_t sub_225771048()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_22579FAC8();
  sub_2257A0108();
  swift_bridgeObjectRetain();
  sub_22579FAF8();
  uint64_t v3 = sub_2257A0128();
  swift_bridgeObjectRelease();
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = v3 & ~v4;
  if (((*(void *)(v2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v6 = sub_22579FAC8();
  uint64_t v8 = v7;
  if (v6 == sub_22579FAC8() && v8 == v9)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v11 = sub_2257A0068();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      do
      {
        unint64_t v5 = (v5 + 1) & v12;
        if (((*(void *)(v2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
          goto LABEL_15;
        }
        uint64_t v13 = sub_22579FAC8();
        uint64_t v15 = v14;
        if (v13 == sub_22579FAC8() && v15 == v16) {
          goto LABEL_16;
        }
        char v18 = sub_2257A0068();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      while ((v18 & 1) == 0);
    }
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v1;
  uint64_t v23 = *v1;
  uint64_t *v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_225774324();
    uint64_t v21 = v23;
  }
  uint64_t v19 = *(void *)(*(void *)(v21 + 48) + 8 * v5);
  sub_22577584C(v5);
  uint64_t *v1 = v23;
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t sub_22577125C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_2257824B8(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v19 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_225772290();
      uint64_t v9 = v19;
    }

    uint64_t v10 = *(void *)(v9 + 56);
    uint64_t v11 = sub_22579F338();
    uint64_t v18 = *(void *)(v11 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v18 + 32))(a2, v10 + *(void *)(v18 + 72) * v6, v11);
    sub_225772064(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56);
    uint64_t v13 = a2;
    uint64_t v14 = 0;
    uint64_t v15 = v11;
  }
  else
  {
    uint64_t v16 = sub_22579F338();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
    uint64_t v15 = v16;
    uint64_t v13 = a2;
    uint64_t v14 = 1;
  }
  return v12(v13, v14, 1, v15);
}

uint64_t sub_2257713F8(void *a1, void *a2)
{
  return sub_22572F4F4(a1, a2, (unint64_t *)&qword_26ABF9A88, 0x263F451A8, &qword_268105648, &qword_26ABF9A90);
}

uint64_t sub_22577141C(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_22579F398();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_22577C0D8(&qword_268105620, MEMORY[0x263F07508]);
  swift_bridgeObjectRetain();
  uint64_t v33 = a2;
  uint64_t v11 = sub_22579FA48();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      uint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_22577C0D8(&qword_268105628, MEMORY[0x263F07508]);
      char v21 = sub_22579FA88();
      uint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      uint64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_2257736F0((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_225771740(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  sub_22579FAC8();
  sub_2257A0108();
  swift_bridgeObjectRetain();
  sub_22579FAF8();
  uint64_t v7 = sub_2257A0128();
  swift_bridgeObjectRelease();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v24 = a2;
    sub_225773990((uint64_t)v24, v9, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v28;
    swift_bridgeObjectRelease();
    *a1 = v24;
    return 1;
  }
  uint64_t v10 = sub_22579FAC8();
  uint64_t v12 = v11;
  if (v10 == sub_22579FAC8() && v12 == v13)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v15 = sub_2257A0068();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      uint64_t v16 = ~v8;
      do
      {
        unint64_t v9 = (v9 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
          goto LABEL_15;
        }
        uint64_t v17 = sub_22579FAC8();
        uint64_t v19 = v18;
        if (v17 == sub_22579FAC8() && v19 == v20) {
          goto LABEL_16;
        }
        char v22 = sub_2257A0068();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      while ((v22 & 1) == 0);
    }
  }

  swift_bridgeObjectRelease();
  uint64_t v26 = *(void **)(*(void *)(*v3 + 48) + 8 * v9);
  *a1 = v26;
  id v27 = v26;
  return 0;
}

uint64_t sub_22577196C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_2257A0108();
  swift_bridgeObjectRetain();
  sub_22579FAF8();
  uint64_t v8 = sub_2257A0128();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2257A0068() & 1) != 0)
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
      if (v19 || (sub_2257A0068() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_225773BC0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_225771B1C(unsigned char *a1, char a2)
{
  uint64_t v4 = a2 & 1;
  uint64_t v5 = *v2;
  sub_2257A0108();
  sub_2257A0118();
  uint64_t v6 = sub_2257A0128();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_225773D5C(v4, v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if ((((v4 == 0) ^ *(unsigned __int8 *)(v9 + v8)) & 1) == 0)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while ((((v4 == 0) ^ *(unsigned __int8 *)(v9 + v8)) & 1) == 0);
  }
  uint64_t result = 0;
  LOBYTE(v4) = *(unsigned char *)(*(void *)(*v2 + 48) + v8);
LABEL_8:
  *a1 = v4;
  return result;
}

uint64_t sub_225771C58(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v46 = sub_22579F338();
  uint64_t v5 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v45 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  sub_22577C2F0();
  int v43 = a2;
  uint64_t v8 = sub_22579FFA8();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v40 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v38 = v2;
  int64_t v39 = (unint64_t)(v10 + 63) >> 6;
  char v41 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
  uint64_t v44 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
  uint64_t v14 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  uint64_t v42 = v7;
  while (1)
  {
    if (v13)
    {
      unint64_t v18 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_22;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v20 >= v39) {
      break;
    }
    uint64_t v21 = v40;
    unint64_t v22 = v40[v20];
    ++v16;
    if (!v22)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v39) {
        goto LABEL_34;
      }
      unint64_t v22 = v40[v16];
      if (!v22)
      {
        int64_t v23 = v20 + 2;
        if (v23 >= v39)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v38;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v22 = v40[v23];
        if (!v22)
        {
          while (1)
          {
            int64_t v16 = v23 + 1;
            if (__OFADD__(v23, 1)) {
              goto LABEL_43;
            }
            if (v16 >= v39) {
              goto LABEL_34;
            }
            unint64_t v22 = v40[v16];
            ++v23;
            if (v22) {
              goto LABEL_21;
            }
          }
        }
        int64_t v16 = v23;
      }
    }
LABEL_21:
    unint64_t v13 = (v22 - 1) & v22;
    unint64_t v19 = __clz(__rbit64(v22)) + (v16 << 6);
LABEL_22:
    id v24 = *(void **)(*(void *)(v7 + 48) + 8 * v19);
    uint64_t v25 = v5;
    uint64_t v26 = *(void *)(v5 + 72);
    unint64_t v27 = *(void *)(v7 + 56) + v26 * v19;
    if (v43)
    {
      (*v44)(v45, v27, v46);
    }
    else
    {
      (*v41)(v45, v27, v46);
      id v28 = v24;
    }
    sub_22579FAC8();
    sub_2257A0108();
    sub_22579FAF8();
    uint64_t v29 = sub_2257A0128();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v30 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v31 = v29 & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v14 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v31) & ~*(void *)(v14 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v35 = v32 == v34;
        if (v32 == v34) {
          unint64_t v32 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v14 + 8 * v32);
      }
      while (v36 == -1);
      unint64_t v17 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(void *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    *(void *)(*(void *)(v9 + 48) + 8 * v17) = v24;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v44)(*(void *)(v9 + 56) + v26 * v17, v45, v46);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v42;
    uint64_t v5 = v25;
  }
  swift_release();
  uint64_t v3 = v38;
  uint64_t v21 = v40;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v37 = 1 << *(unsigned char *)(v7 + 32);
  if (v37 >= 64) {
    bzero(v21, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v21 = -1 << v37;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

unint64_t sub_225772064(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_22579FDA8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        uint64_t v9 = *(void **)(*(void *)(a2 + 48) + 8 * v6);
        sub_22579FAC8();
        sub_2257A0108();
        id v10 = v9;
        sub_22579FAF8();
        uint64_t v11 = sub_2257A0128();

        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v12 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v13 = *(void *)(a2 + 48);
        uint64_t v14 = (void *)(v13 + 8 * v3);
        uint64_t v15 = (void *)(v13 + 8 * v6);
        if (v3 != v6 || v14 >= v15 + 1) {
          void *v14 = *v15;
        }
        uint64_t v16 = *(void *)(a2 + 56);
        uint64_t v17 = *(void *)(*(void *)(sub_22579F338() - 8) + 72);
        int64_t v18 = v17 * v3;
        uint64_t result = v16 + v17 * v3;
        int64_t v19 = v17 * v6;
        unint64_t v20 = v16 + v17 * v6 + v17;
        if (v18 < v19 || result >= v20)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v18 == v19) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v12 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v12) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    unint64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *unint64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

id sub_225772290()
{
  uint64_t v1 = sub_22579F338();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22577C2F0();
  uint64_t v24 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_22579FF98();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v24 = v7;
    return result;
  }
  id result = (id)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v25 = v5 + 64;
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  uint64_t v28 = v2 + 16;
  int64_t v26 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v27 = v2 + 32;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      int64_t v11 = v20 + 1;
      if (v20 + 1 >= v26) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v25 + 8 * v11);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v14 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    uint64_t v17 = 8 * v16;
    int64_t v18 = *(void **)(*(void *)(v5 + 48) + 8 * v16);
    unint64_t v19 = *(void *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 56) + v19, v1);
    *(void *)(*(void *)(v7 + 48) + v17) = v18;
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 56) + v19, v4, v1);
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v26) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v25 + 8 * v22);
  if (v21)
  {
    int64_t v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v11 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v11 >= v26) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_22577251C(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4, uint64_t a5, unint64_t *a6)
{
  if (a2)
  {
    sub_22577C6C0(0, a3, a4, a5, a6);
    uint64_t v10 = sub_22579FE88();
    uint64_t v23 = v10;
    sub_22579FDD8();
    if (sub_22579FE48())
    {
      sub_22572F19C(0, a4);
      do
      {
        swift_dynamicCast();
        uint64_t v10 = v23;
        unint64_t v17 = *(void *)(v23 + 16);
        if (*(void *)(v23 + 24) <= v17)
        {
          sub_225772744(v17 + 1, a3, a4, a5, a6);
          uint64_t v10 = v23;
        }
        uint64_t result = sub_22579FD28();
        uint64_t v12 = v10 + 56;
        uint64_t v13 = -1 << *(unsigned char *)(v10 + 32);
        unint64_t v14 = result & ~v13;
        unint64_t v15 = v14 >> 6;
        if (((-1 << v14) & ~*(void *)(v10 + 56 + 8 * (v14 >> 6))) != 0)
        {
          unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v10 + 56 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v18 = 0;
          unint64_t v19 = (unint64_t)(63 - v13) >> 6;
          do
          {
            if (++v15 == v19 && (v18 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v20 = v15 == v19;
            if (v15 == v19) {
              unint64_t v15 = 0;
            }
            v18 |= v20;
            uint64_t v21 = *(void *)(v12 + 8 * v15);
          }
          while (v21 == -1);
          unint64_t v16 = __clz(__rbit64(~v21)) + (v15 << 6);
        }
        *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
        *(void *)(*(void *)(v10 + 48) + 8 * v16) = v22;
        ++*(void *)(v10 + 16);
      }
      while (sub_22579FE48());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v10;
}

uint64_t sub_225772744(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, unint64_t *a5)
{
  uint64_t v6 = v5;
  uint64_t v7 = *v5;
  sub_22577C6C0(0, a2, a3, a4, a5);
  uint64_t v8 = sub_22579FE78();
  uint64_t v9 = v8;
  if (*(void *)(v7 + 16))
  {
    char v33 = v5;
    uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
    int64_t v11 = (void *)(v7 + 56);
    if (v10 < 64) {
      uint64_t v12 = ~(-1 << v10);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v13 = v12 & *(void *)(v7 + 56);
    int64_t v14 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v15 = v8 + 56;
    uint64_t result = swift_retain();
    int64_t v17 = 0;
    while (1)
    {
      if (v13)
      {
        unint64_t v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        unint64_t v20 = v19 | (v17 << 6);
      }
      else
      {
        int64_t v21 = v17 + 1;
        if (__OFADD__(v17, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v21 >= v14) {
          goto LABEL_33;
        }
        unint64_t v22 = v11[v21];
        ++v17;
        if (!v22)
        {
          int64_t v17 = v21 + 1;
          if (v21 + 1 >= v14) {
            goto LABEL_33;
          }
          unint64_t v22 = v11[v17];
          if (!v22)
          {
            int64_t v17 = v21 + 2;
            if (v21 + 2 >= v14) {
              goto LABEL_33;
            }
            unint64_t v22 = v11[v17];
            if (!v22)
            {
              int64_t v23 = v21 + 3;
              if (v23 >= v14)
              {
LABEL_33:
                swift_release();
                uint64_t v6 = v33;
                uint64_t v32 = 1 << *(unsigned char *)(v7 + 32);
                if (v32 > 63) {
                  bzero((void *)(v7 + 56), ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v11 = -1 << v32;
                }
                *(void *)(v7 + 16) = 0;
                break;
              }
              unint64_t v22 = v11[v23];
              if (!v22)
              {
                while (1)
                {
                  int64_t v17 = v23 + 1;
                  if (__OFADD__(v23, 1)) {
                    goto LABEL_39;
                  }
                  if (v17 >= v14) {
                    goto LABEL_33;
                  }
                  unint64_t v22 = v11[v17];
                  ++v23;
                  if (v22) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v17 = v23;
            }
          }
        }
LABEL_23:
        unint64_t v13 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v17 << 6);
      }
      uint64_t v24 = *(void *)(*(void *)(v7 + 48) + 8 * v20);
      uint64_t result = sub_22579FD28();
      uint64_t v25 = -1 << *(unsigned char *)(v9 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v15 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v26) & ~*(void *)(v15 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v15 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v18 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      *(void *)(*(void *)(v9 + 48) + 8 * v1_Block_object_dispose(&STACK[0x4A8], 8) = v24;
      ++*(void *)(v9 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v6 = v9;
  return result;
}

uint64_t sub_2257729E0()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_22579F398();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  char v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_22577C4E4();
  uint64_t v5 = sub_22579FE78();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    BOOL v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    int64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      unint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_22577C0D8(&qword_268105620, MEMORY[0x263F07508]);
      uint64_t result = sub_22579FA48();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_225772DD8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_22577C39C();
  uint64_t v3 = sub_22579FE78();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v27 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v29 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v28 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v13 = v12 | (v10 << 6);
      }
      else
      {
        int64_t v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v28) {
          goto LABEL_33;
        }
        unint64_t v15 = v29[v14];
        ++v10;
        if (!v15)
        {
          int64_t v10 = v14 + 1;
          if (v14 + 1 >= v28) {
            goto LABEL_33;
          }
          unint64_t v15 = v29[v10];
          if (!v15)
          {
            int64_t v10 = v14 + 2;
            if (v14 + 2 >= v28) {
              goto LABEL_33;
            }
            unint64_t v15 = v29[v10];
            if (!v15)
            {
              int64_t v16 = v14 + 3;
              if (v16 >= v28)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v27;
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero(v29, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v29 = -1 << v26;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v15 = v29[v16];
              if (!v15)
              {
                while (1)
                {
                  int64_t v10 = v16 + 1;
                  if (__OFADD__(v16, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v28) {
                    goto LABEL_33;
                  }
                  unint64_t v15 = v29[v10];
                  ++v16;
                  if (v15) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v16;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v13);
      sub_22579FAC8();
      sub_2257A0108();
      sub_22579FAF8();
      uint64_t v18 = sub_2257A0128();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = v18 & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v8 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v11 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(void *)(*(void *)(v4 + 48) + 8 * v11) = v17;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_2257730E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_22577C660();
  uint64_t v3 = sub_22579FE78();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    char v30 = (void *)(v2 + 56);
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
                  *char v30 = -1 << v29;
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
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_2257A0108();
      sub_22579FAF8();
      uint64_t result = sub_2257A0128();
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
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *unint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_2257733C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_22577C5B0();
  uint64_t result = sub_22579FE78();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v26;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      char v18 = *(unsigned char *)(*(void *)(v2 + 48) + v14);
      sub_2257A0108();
      sub_2257A0118();
      uint64_t result = sub_2257A0128();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(unsigned char *)(*(void *)(v4 + 48) + v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_22577366C(uint64_t a1, uint64_t a2)
{
  sub_22579FD28();
  unint64_t result = sub_22579FDB8();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_2257736F0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_22579F398();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  uint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_2257729E0();
  }
  else
  {
    if (v11 > v10)
    {
      sub_22577407C();
      goto LABEL_12;
    }
    sub_225774A84();
  }
  uint64_t v12 = *v3;
  sub_22577C0D8(&qword_268105620, MEMORY[0x263F07508]);
  uint64_t v13 = sub_22579FA48();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    int64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_22577C0D8(&qword_268105628, MEMORY[0x263F07508]);
      char v21 = sub_22579FA88();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_2257A0088();
  __break(1u);
  return result;
}

uint64_t sub_225773990(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_22;
  }
  if (a3)
  {
    sub_225772DD8();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (uint64_t)sub_225774324();
LABEL_22:
      uint64_t v25 = *v4;
      *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
      *(void *)(*(void *)(v25 + 48) + 8 * a2) = v6;
      uint64_t v26 = *(void *)(v25 + 16);
      BOOL v27 = __OFADD__(v26, 1);
      uint64_t v28 = v26 + 1;
      if (!v27)
      {
        *(void *)(v25 + 16) = v28;
        return result;
      }
      __break(1u);
      goto LABEL_25;
    }
    sub_225774E30();
  }
  uint64_t v9 = *v3;
  sub_22579FAC8();
  sub_2257A0108();
  sub_22579FAF8();
  uint64_t v10 = sub_2257A0128();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v12 = sub_22579FAC8();
  uint64_t v14 = v13;
  if (v12 == sub_22579FAC8() && v14 == v15)
  {
LABEL_25:
    swift_bridgeObjectRelease_n();
    goto LABEL_26;
  }
  char v17 = sub_2257A0068();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
  {
    uint64_t v18 = ~v11;
    do
    {
      a2 = (a2 + 1) & v18;
      if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v19 = sub_22579FAC8();
      uint64_t v21 = v20;
      if (v19 == sub_22579FAC8() && v21 == v22) {
        goto LABEL_25;
      }
      char v24 = sub_2257A0068();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
    }
    while ((v24 & 1) == 0);
  }
LABEL_26:
  type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
  uint64_t result = sub_2257A0088();
  __break(1u);
  return result;
}

uint64_t sub_225773BC0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  int64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_2257730E8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_2257744CC();
      goto LABEL_22;
    }
    sub_22577510C();
  }
  uint64_t v11 = *v4;
  sub_2257A0108();
  sub_22579FAF8();
  uint64_t result = sub_2257A0128();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_2257A0068(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_2257A0088();
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
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_2257A0068();
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
  *uint64_t v21 = v8;
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

uint64_t sub_225773D5C(uint64_t result, unint64_t a2, char a3)
{
  int v5 = result & 1;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_2257733C4();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_22577467C();
      goto LABEL_14;
    }
    sub_2257753B8();
  }
  uint64_t v8 = *v3;
  sub_2257A0108();
  sub_2257A0118();
  uint64_t result = sub_2257A0128();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (((v5 == 0) ^ *(unsigned __int8 *)(v10 + a2)))
    {
LABEL_13:
      uint64_t result = sub_2257A0088();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (((v5 == 0) ^ *(unsigned __int8 *)(v10 + a2))) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v12 + 48) + a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

id sub_225773EC4(unint64_t *a1, unint64_t *a2, uint64_t a3, unint64_t *a4)
{
  int v5 = v4;
  sub_22577C6C0(0, a1, a2, a3, a4);
  uint64_t v6 = *v4;
  uint64_t v7 = sub_22579FE68();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *int v5 = v8;
    return result;
  }
  id result = (id)(v7 + 56);
  uint64_t v10 = v6 + 56;
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11) {
    id result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  }
  int64_t v13 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v6 + 56);
  int64_t v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      unint64_t v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v17) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v10 + 8 * v22);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v17) {
        goto LABEL_28;
      }
      unint64_t v23 = *(void *)(v10 + 8 * v13);
      if (!v23)
      {
        int64_t v13 = v22 + 2;
        if (v22 + 2 >= v17) {
          goto LABEL_28;
        }
        unint64_t v23 = *(void *)(v10 + 8 * v13);
        if (!v23) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v16 = (v23 - 1) & v23;
    unint64_t v19 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_12:
    uint64_t v20 = 8 * v19;
    uint64_t v21 = *(void **)(*(void *)(v6 + 48) + v20);
    *(void *)(*(void *)(v8 + 48) + v20) = v21;
    id result = v21;
  }
  int64_t v24 = v22 + 3;
  if (v24 >= v17) {
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v10 + 8 * v24);
  if (v23)
  {
    int64_t v13 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v13 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v13 >= v17) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v10 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_22577407C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22579F398();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22577C4E4();
  uint64_t v6 = *v0;
  uint64_t v7 = sub_22579FE68();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    id result = (void *)swift_release();
LABEL_30:
    uint64_t *v1 = v8;
    return result;
  }
  id result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  unint64_t v23 = v1;
  int64_t v24 = (const void *)(v6 + 56);
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    id result = memmove(result, v24, 8 * v10);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v6 + 56);
  int64_t v25 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v17 = v16 | (v12 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v19 >= v25) {
      goto LABEL_28;
    }
    unint64_t v20 = *((void *)v24 + v19);
    ++v12;
    if (!v20)
    {
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_28;
      }
      unint64_t v20 = *((void *)v24 + v12);
      if (!v20)
      {
        int64_t v12 = v19 + 2;
        if (v19 + 2 >= v25) {
          goto LABEL_28;
        }
        unint64_t v20 = *((void *)v24 + v12);
        if (!v20) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v15 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_12:
    unint64_t v18 = *(void *)(v3 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v18, v2);
    id result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v18, v5, v2);
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v25)
  {
LABEL_28:
    id result = (void *)swift_release();
    uint64_t v1 = v23;
    goto LABEL_30;
  }
  unint64_t v20 = *((void *)v24 + v21);
  if (v20)
  {
    int64_t v12 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v25) {
      goto LABEL_28;
    }
    unint64_t v20 = *((void *)v24 + v12);
    ++v21;
    if (v20) {
      goto LABEL_27;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

id sub_225774324()
{
  uint64_t v1 = v0;
  sub_22577C39C();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22579FE68();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2257744CC()
{
  uint64_t v1 = v0;
  sub_22577C660();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22579FE68();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    id result = (void *)swift_bridgeObjectRetain();
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

void *sub_22577467C()
{
  uint64_t v1 = v0;
  sub_22577C5B0();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22579FE68();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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

uint64_t sub_22577480C(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, unint64_t *a5)
{
  uint64_t v6 = v5;
  uint64_t v7 = *v5;
  sub_22577C6C0(0, a2, a3, a4, a5);
  uint64_t v8 = sub_22579FE78();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v6 = v9;
    return result;
  }
  BOOL v32 = v5;
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = v7 + 56;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & *(void *)(v7 + 56);
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v15 = v8 + 56;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v19 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v20 = v19 | (v17 << 6);
      goto LABEL_24;
    }
    int64_t v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v21 >= v14) {
      goto LABEL_33;
    }
    unint64_t v22 = *(void *)(v11 + 8 * v21);
    ++v17;
    if (!v22)
    {
      int64_t v17 = v21 + 1;
      if (v21 + 1 >= v14) {
        goto LABEL_33;
      }
      unint64_t v22 = *(void *)(v11 + 8 * v17);
      if (!v22)
      {
        int64_t v17 = v21 + 2;
        if (v21 + 2 >= v14) {
          goto LABEL_33;
        }
        unint64_t v22 = *(void *)(v11 + 8 * v17);
        if (!v22) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v13 = (v22 - 1) & v22;
    unint64_t v20 = __clz(__rbit64(v22)) + (v17 << 6);
LABEL_24:
    id v24 = *(id *)(*(void *)(v7 + 48) + 8 * v20);
    uint64_t result = sub_22579FD28();
    uint64_t v25 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v15 + 8 * (v26 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v26) & ~*(void *)(v15 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v30 = v27 == v29;
        if (v27 == v29) {
          unint64_t v27 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v15 + 8 * v27);
      }
      while (v31 == -1);
      unint64_t v18 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(void *)(*(void *)(v9 + 48) + 8 * v1_Block_object_dispose(&STACK[0x4A8], 8) = v24;
    ++*(void *)(v9 + 16);
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v14)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v6 = v32;
    goto LABEL_35;
  }
  unint64_t v22 = *(void *)(v11 + 8 * v23);
  if (v22)
  {
    int64_t v17 = v23;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v17 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v22 = *(void *)(v11 + 8 * v17);
    ++v23;
    if (v22) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_225774A84()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22579F398();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_22577C4E4();
  uint64_t v7 = sub_22579FE78();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  int64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_22577C0D8(&qword_268105620, MEMORY[0x263F07508]);
    uint64_t result = sub_22579FA48();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_225774E30()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_22577C39C();
  uint64_t v3 = sub_22579FE78();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  unint64_t v27 = v0;
  uint64_t v28 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v28 + 8 * v10);
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v28 + 8 * v10);
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v13);
    sub_22579FAC8();
    sub_2257A0108();
    id v18 = v17;
    sub_22579FAF8();
    uint64_t v19 = sub_2257A0128();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = v19 & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v8 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v21) & ~*(void *)(v8 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v26 = *(void *)(v8 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v11 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(void *)(*(void *)(v4 + 48) + 8 * v11) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v15 = *(void *)(v28 + 8 * v16);
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v10);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_22577510C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_22577C660();
  uint64_t v3 = sub_22579FE78();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_2257A0108();
    swift_bridgeObjectRetain();
    sub_22579FAF8();
    uint64_t result = sub_2257A0128();
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
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *unint64_t v13 = v20;
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

uint64_t sub_2257753B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_22577C5B0();
  uint64_t result = sub_22579FE78();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    char v18 = *(unsigned char *)(*(void *)(v2 + 48) + v14);
    sub_2257A0108();
    sub_2257A0118();
    uint64_t result = sub_2257A0128();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(unsigned char *)(*(void *)(v4 + 48) + v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

id sub_225775630(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = sub_2257824B8((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v13 = v8;
  uint64_t v14 = v7[3];
  if (v14 < v12 || (a3 & 1) == 0)
  {
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_225772290();
      goto LABEL_7;
    }
    sub_225771C58(v12, a3 & 1);
    unint64_t v23 = sub_2257824B8((uint64_t)a2);
    if ((v13 & 1) == (v24 & 1))
    {
      unint64_t v9 = v23;
      int64_t v15 = *v4;
      if (v13) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
    id result = (id)sub_2257A0098();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v15 = *v4;
  if (v13)
  {
LABEL_8:
    uint64_t v16 = v15[7];
    uint64_t v17 = sub_22579F338();
    uint64_t v18 = *(void *)(v17 - 8);
    uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 40);
    uint64_t v20 = v17;
    uint64_t v21 = v16 + *(void *)(v18 + 72) * v9;
    return (id)v19(v21, a1, v20);
  }
LABEL_13:
  sub_2257757A0(v9, (uint64_t)a2, a1, v15);
  return a2;
}

uint64_t sub_2257757A0(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = sub_22579F338();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1, a3, v8);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

unint64_t sub_22577584C(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_22579FDA8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        uint64_t v10 = *(void **)(*(void *)(v3 + 48) + 8 * v6);
        sub_22579FAC8();
        sub_2257A0108();
        id v11 = v10;
        sub_22579FAF8();
        uint64_t v12 = sub_2257A0128();

        swift_bridgeObjectRelease();
        unint64_t v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 < v9) {
            goto LABEL_5;
          }
        }
        else if (v13 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v13)
        {
LABEL_11:
          uint64_t v14 = *(void *)(v3 + 48);
          int64_t v15 = (void *)(v14 + 8 * v2);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v15 >= v16 + 1))
          {
            *int64_t v15 = *v16;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v17 = *(void *)(v3 + 16);
  BOOL v18 = __OFSUB__(v17, 1);
  uint64_t v19 = v17 - 1;
  if (v18)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v19;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_225775A30(uint64_t a1, void *a2, void *a3, void (*a4)(uint64_t), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v133 = a8;
  v122[2] = a5;
  id v123 = a4;
  v131 = a3;
  id v151 = a2;
  v122[1] = swift_getObjectType();
  uint64_t v154 = sub_22579F338();
  uint64_t v10 = *(void *)(v154 - 8);
  MEMORY[0x270FA5388](v154);
  uint64_t v129 = (char *)v122 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2257383A8(0, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  int64_t v15 = (char *)v122 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v142 = (uint64_t)v122 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)v122 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v128 = (uint64_t)v122 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v127 = (char *)v122 - v23;
  uint64_t v24 = sub_22579F398();
  uint64_t v153 = *(void (***)(char *, uint64_t))(v24 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v141 = (uint64_t)v122 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v135 = (char *)v122 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  BOOL v31 = (char *)v122 - v30;
  uint64_t v32 = *(void *)(a7 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v34 = *(void (**)(void))(v32 + 16);
  uint64_t v137 = (uint64_t)v122 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v138 = a7;
  v34();
  id v140 = (id)*MEMORY[0x263F450D8];
  BOOL v146 = sub_225729700();
  id v139 = (id)*MEMORY[0x263F450E0];
  BOOL v145 = sub_225729700();
  uint64_t v132 = a6;
  uint64_t v35 = sub_2257250CC();
  if (!v35) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v137, v138);
  }
  unint64_t v36 = v35;
  uint64_t v126 = v20;
  id v130 = v15;
  int v37 = HKShowSensitiveLogItems();
  unint64_t v38 = v36 >> 62;
  uint64_t v124 = v32;
  unint64_t v148 = v36;
  if (!v37) {
    goto LABEL_9;
  }
  if (qword_26ABF9378 != -1) {
    goto LABEL_57;
  }
  while (1)
  {
    uint64_t v39 = sub_22579F458();
    __swift_project_value_buffer(v39, (uint64_t)qword_26ABF94A0);
    unint64_t v36 = v148;
    swift_bridgeObjectRetain_n();
    int64_t v40 = sub_22579F438();
    os_log_type_t v41 = sub_22579FCB8();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v143 = v31;
      uint64_t v144 = v24;
      uint64_t v42 = swift_slowAlloc();
      char v152 = (void *)swift_slowAlloc();
      int v158 = v152;
      *(_DWORD *)uint64_t v42 = 136315650;
      uint64_t v43 = sub_2257A0188();
      uint64_t v157 = sub_22572E428(v43, v44, (uint64_t *)&v158);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v42 + 12) = 2048;
      if (v38)
      {
        swift_bridgeObjectRetain();
        uint64_t v45 = sub_22579FF88();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v45 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      unint64_t v36 = v148;
      swift_bridgeObjectRelease();
      uint64_t v157 = v45;
      sub_22579FD68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v42 + 22) = 2080;
      uint64_t v46 = sub_22572F19C(0, &qword_268105618);
      uint64_t v47 = swift_bridgeObjectRetain();
      uint64_t v48 = MEMORY[0x22A634010](v47, v46);
      unint64_t v50 = v49;
      swift_bridgeObjectRelease();
      uint64_t v157 = sub_22572E428(v48, v50, (uint64_t *)&v158);
      sub_22579FD68();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v40, v41, "[%s] Retrieved %ld deleted sample tombstones: %s", (uint8_t *)v42, 0x20u);
      id v51 = v152;
      swift_arrayDestroy();
      MEMORY[0x22A635470](v51, -1, -1);
      MEMORY[0x22A635470](v42, -1, -1);

      uint64_t v32 = v124;
      BOOL v31 = v143;
      uint64_t v24 = v144;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v32 = v124;
    }
LABEL_9:
    int v158 = (void *)MEMORY[0x263F8EE88];
    if (v38)
    {
      unint64_t v38 = v148;
      swift_bridgeObjectRetain();
      uint64_t v52 = sub_22579FF88();
      swift_bridgeObjectRelease();
      if (!v52)
      {
LABEL_48:
        swift_bridgeObjectRelease();
        uint64_t v112 = MEMORY[0x263F8EE88];
        if (*(void *)(MEMORY[0x263F8EE88] + 16)) {
          goto LABEL_45;
        }
        goto LABEL_49;
      }
    }
    else
    {
      uint64_t v52 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
      unint64_t v38 = v148;
      if (!v52) {
        goto LABEL_48;
      }
    }
    if (v52 >= 1) {
      break;
    }
    __break(1u);
LABEL_57:
    swift_once();
  }
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  unint64_t v150 = v38 & 0xC000000000000001;
  ++v153;
  uint64_t v147 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  id v136 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  unint64_t v125 = (void (**)(char *, uint64_t, uint64_t))(v10 + 32);
  uint64_t v149 = v52;
  uint64_t v143 = v31;
  uint64_t v144 = v24;
  do
  {
    if (v150) {
      id v56 = (id)MEMORY[0x22A634380](v53, v38);
    }
    else {
      id v56 = *(id *)(v38 + 8 * v53 + 32);
    }
    uint64_t v57 = v56;
    id v58 = objc_msgSend(v56, sel_UUID);
    sub_22579F378();

    id v59 = objc_msgSend(v151, sel_pregnancyModeSetupCompletionSet);
    sub_22572F19C(0, (unint64_t *)&qword_26ABF9A88);
    sub_22572F36C(&qword_26ABF9A90, (unint64_t *)&qword_26ABF9A88);
    uint64_t v60 = sub_22579FBE8();

    MEMORY[0x270FA5388](v61);
    v122[-2] = v31;
    sub_22578764C(sub_22577C9F4, (uint64_t)&v122[-4], v60);
    uint64_t v63 = v62;
    swift_bridgeObjectRelease();
    id v64 = *v153;
    (*v153)(v31, v24);
    if (!v63)
    {

LABEL_14:
      uint64_t v55 = v149;
      goto LABEL_15;
    }
    char v152 = v57;
    id v65 = objc_msgSend(v63, sel_pregnancyAdjustedFeaturesSet);
    type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
    sub_22577C0D8(&qword_268105290, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
    uint64_t v66 = sub_22579FBE8();

    uint64_t v157 = v66;
    swift_bridgeObjectRetain();
    id v67 = objc_msgSend(v63, sel_postPregnancyFeatureAdjustmentCompletionLog);
    uint64_t v68 = sub_22579FA38();

    uint64_t v156 = v68;
    if (!v146)
    {
      swift_bridgeObjectRelease();
LABEL_26:
      if (!v145) {
        goto LABEL_33;
      }
      goto LABEL_27;
    }
    id v69 = v140;
    char v70 = sub_22576F1B4((uint64_t)v69, v66);

    swift_bridgeObjectRelease();
    if ((v70 & 1) == 0) {
      goto LABEL_26;
    }
    id v71 = v69;
    id v72 = (void *)sub_225771048();

    id v73 = v71;
    uint64_t v74 = (uint64_t)v127;
    sub_22579F288();
    uint64_t v75 = v154;
    (*v147)(v74, 0, 1, v154);
    if ((*v136)(v74, 1, v75) == 1)
    {
      uint64_t v76 = (void (*)(uint64_t))MEMORY[0x263F07490];
      uint64_t v134 = v54;
      sub_22573C520(v74, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
      uint64_t v77 = v128;
      sub_22577125C((uint64_t)v73, v128);

      uint64_t v54 = v134;
      sub_22573C520(v77, (unint64_t *)&unk_26ABF9490, v76);
      if (!v145) {
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v88 = (uint64_t)v129;
      (*v125)(v129, v74, v75);
      uint64_t v89 = v156;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v155 = v89;
      sub_225775630(v88, v73, isUniquelyReferenced_nonNull_native);
      uint64_t v156 = v155;

      swift_bridgeObjectRelease();
      if (!v145) {
        goto LABEL_33;
      }
    }
LABEL_27:
    uint64_t v78 = v157;
    swift_bridgeObjectRetain();
    id v79 = v139;
    char v80 = sub_22576F1B4((uint64_t)v79, v78);

    swift_bridgeObjectRelease();
    if (v80)
    {
      id v81 = v79;
      uint64_t v82 = (void *)sub_225771048();

      id v83 = v81;
      uint64_t v84 = (uint64_t)v126;
      sub_22579F288();
      uint64_t v85 = v154;
      (*v147)(v84, 0, 1, v154);
      if ((*v136)(v84, 1, v85) == 1)
      {
        uint64_t v86 = (void (*)(uint64_t))MEMORY[0x263F07490];
        uint64_t v134 = v54;
        sub_22573C520(v84, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
        uint64_t v87 = v128;
        sub_22577125C((uint64_t)v83, v128);

        uint64_t v54 = v134;
        sub_22573C520(v87, (unint64_t *)&unk_26ABF9490, v86);
      }
      else
      {
        uint64_t v91 = (uint64_t)v129;
        (*v125)(v129, v84, v85);
        uint64_t v92 = v156;
        char v93 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v155 = v92;
        sub_225775630(v91, v83, v93);
        uint64_t v156 = v155;

        swift_bridgeObjectRelease();
      }
    }
LABEL_33:
    uint64_t v94 = *(void *)(v157 + 16);
    if (!v94)
    {
      swift_bridgeObjectRelease();
      id v98 = objc_msgSend(v63, sel_sampleUUID);
      uint64_t v99 = v135;
      sub_22579F378();

      BOOL v31 = v143;
      sub_22577141C((uint64_t)v143, v99);

      uint64_t v24 = v144;
      v64(v31, v144);
      swift_bridgeObjectRelease();
      unint64_t v38 = v148;
      goto LABEL_14;
    }
    id v95 = objc_msgSend(v63, sel_pregnancyAdjustedFeaturesSet);
    uint64_t v96 = sub_22579FBE8();

    uint64_t v97 = *(void *)(v96 + 16);
    swift_bridgeObjectRelease();
    if (v94 == v97)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL v31 = v143;
      uint64_t v24 = v144;
      unint64_t v38 = v148;
      goto LABEL_14;
    }
    id v100 = objc_msgSend(v63, sel_version);
    id v101 = objc_msgSend(v63, sel_sampleUUID);
    sub_22579F378();

    id v102 = objc_msgSend(v63, sel_educationalStepsReviewDate);
    uint64_t v55 = v149;
    if (v102)
    {
      uint64_t v103 = v102;
      uint64_t v104 = v142;
      sub_22579F2F8();

      id v105 = *v147;
      (*v147)(v104, 0, 1, v154);
    }
    else
    {
      id v105 = *v147;
      (*v147)(v142, 1, 1, v154);
    }
    id v106 = objc_msgSend(v63, sel_configurationStepsReviewDate);
    if (v106)
    {
      uint64_t v107 = v106;
      uint64_t v108 = (uint64_t)v130;
      sub_22579F2F8();

      uint64_t v109 = 0;
    }
    else
    {
      uint64_t v109 = 1;
      uint64_t v108 = (uint64_t)v130;
    }
    v105(v108, v109, 1, v154);
    id v110 = objc_allocWithZone(MEMORY[0x263F451A8]);
    swift_bridgeObjectRetain();
    id v111 = sub_22577B8B0((uint64_t)v100, v141, v142, v108);

    sub_22577AD7C(v111, v131, v137, v132, v138, v133);
    swift_bridgeObjectRelease();

    BOOL v31 = v143;
    uint64_t v24 = v144;
    unint64_t v38 = v148;
LABEL_15:
    ++v53;
  }
  while (v55 != v53);
  swift_bridgeObjectRelease();
  uint64_t v112 = (uint64_t)v158;
  uint64_t v32 = v124;
  if (v158[2])
  {
LABEL_45:
    sub_225779EF4(v112, v131, v137, v132, v138, v133);
    uint64_t v113 = swift_bridgeObjectRelease();
    if (v123) {
      v123(v113);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v137, v138);
  }
LABEL_49:
  swift_bridgeObjectRelease();
  if (HKShowSensitiveLogItems())
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v114 = sub_22579F458();
    __swift_project_value_buffer(v114, (uint64_t)qword_26ABF94A0);
    id v115 = sub_22579F438();
    os_log_type_t v116 = sub_22579FCB8();
    if (os_log_type_enabled(v115, v116))
    {
      uint64_t v117 = (uint8_t *)swift_slowAlloc();
      uint64_t v118 = swift_slowAlloc();
      uint64_t v157 = v118;
      *(_DWORD *)uint64_t v117 = 136315138;
      uint64_t v119 = sub_2257A0188();
      uint64_t v156 = sub_22572E428(v119, v120, &v157);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v115, v116, "[%s] No records meeting the deletion requirements", v117, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v118, -1, -1);
      MEMORY[0x22A635470](v117, -1, -1);
    }

    uint64_t v32 = v124;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v137, v138);
}

uint64_t sub_225776ADC(void *a1, uint64_t a2, void *a3, void *a4, void (*a5)(void), void (*a6)(void), char *a7, uint64_t a8, uint64_t a9)
{
  v268 = a6;
  v269 = a5;
  v261 = a4;
  id v266 = a1;
  uint64_t ObjectType = swift_getObjectType();
  sub_22573C4A0();
  uint64_t v253 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v256 = (uint64_t)v240 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_22579F338();
  uint64_t v263 = *(void *)(v14 - 8);
  uint64_t v264 = v14;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  v258 = (char *)v240 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  v257 = (char *)v240 - v17;
  uint64_t v18 = sub_22579F398();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)v240 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2257383A8(0, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  v259 = (char *)v240 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v252 = (uint64_t)v240 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v254 = (uint64_t)v240 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v255 = (uint64_t)v240 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v33 = (char *)v240 - v32;
  uint64_t v34 = MEMORY[0x270FA5388](v31);
  unint64_t v36 = (char *)v240 - v35;
  uint64_t v37 = MEMORY[0x270FA5388](v34);
  uint64_t v39 = (char *)v240 - v38;
  uint64_t v40 = MEMORY[0x270FA5388](v37);
  v260 = (char *)v240 - v41;
  MEMORY[0x270FA5388](v40);
  uint64_t v270 = v43;
  uint64_t v271 = a8;
  unint64_t v44 = *(void (**)(void))(v43 + 16);
  uint64_t v272 = (uint64_t)v240 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44();
  v262 = a7;
  id v45 = sub_225728204();
  id v46 = v45;
  if (!v45
    || (id v47 = objc_msgSend(v45, sel_objectForKeyedSubscript_, *MEMORY[0x263F095B8]),
        id v267 = v46,
        id v48 = v47,
        unsigned int v49 = objc_msgSend(v47, sel_areAllRequirementsSatisfied),
        v48,
        id v46 = v267,
        !v49))
  {
    uint64_t v63 = v46;
    int v64 = HKShowSensitiveLogItems();
    uint64_t v53 = v271;
    uint64_t v52 = v272;
    if (v64)
    {
      if (qword_26ABF9378 != -1) {
        swift_once();
      }
      uint64_t v65 = sub_22579F458();
      __swift_project_value_buffer(v65, (uint64_t)qword_26ABF94A0);
      uint64_t v66 = sub_22579F438();
      os_log_type_t v67 = sub_22579FCB8();
      if (os_log_type_enabled(v66, v67))
      {
        uint64_t v68 = (uint8_t *)swift_slowAlloc();
        uint64_t v69 = swift_slowAlloc();
        uint64_t v274 = v69;
        *(_DWORD *)uint64_t v68 = 136315138;
        uint64_t v70 = sub_2257A0188();
        uint64_t v273 = sub_22572E428(v70, v71, &v274);
        sub_22579FD68();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_225722000, v66, v67, "[%s] LCF Notifications are either not available or currently active. Not making adjustment", v68, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A635470](v69, -1, -1);
        MEMORY[0x22A635470](v68, -1, -1);
      }
    }
    v269();

    goto LABEL_21;
  }
  id v50 = v266;
  if (objc_msgSend(v266, sel_state) != (id)1)
  {
    if (objc_msgSend(v50, sel_state))
    {
      if (objc_msgSend(v50, sel_state) != (id)2)
      {

        uint64_t v72 = v270;
        uint64_t v53 = v271;
        uint64_t v52 = v272;
        return (*(uint64_t (**)(uint64_t, uint64_t))(v72 + 8))(v52, v53);
      }
      id v74 = objc_msgSend(v50, sel_sample);
      if (!v74)
      {
        char v104 = HKShowSensitiveLogItems();
        uint64_t v53 = v271;
        uint64_t v52 = v272;
        if ((v104 & 1) == 0) {
          goto LABEL_11;
        }
        if (qword_26ABF9378 != -1) {
          swift_once();
        }
        uint64_t v105 = sub_22579F458();
        __swift_project_value_buffer(v105, (uint64_t)qword_26ABF94A0);
        uint64_t v55 = sub_22579F438();
        os_log_type_t v56 = sub_22579FC98();
        if (!os_log_type_enabled(v55, v56)) {
          goto LABEL_10;
        }
        uint64_t v57 = (uint8_t *)swift_slowAlloc();
        uint64_t v58 = swift_slowAlloc();
        uint64_t v274 = v58;
        *(_DWORD *)uint64_t v57 = 136315138;
        uint64_t v106 = sub_2257A0188();
        uint64_t v273 = sub_22572E428(v106, v107, &v274);
        sub_22579FD68();
        swift_bridgeObjectRelease();
        uint64_t v61 = "[%s] Pregnancy state is in post pregnancy but we do not have a sample. This should not happen. Not making adjustment";
        goto LABEL_9;
      }
      uint64_t v248 = a9;
      id v251 = v74;
      id v75 = objc_msgSend(v74, sel_UUID);
      sub_22579F378();

      id v76 = objc_msgSend(a3, sel_pregnancyModeSetupCompletionSet);
      sub_22572F19C(0, (unint64_t *)&qword_26ABF9A88);
      sub_22572F36C(&qword_26ABF9A90, (unint64_t *)&qword_26ABF9A88);
      uint64_t v77 = sub_22579FBE8();

      MEMORY[0x270FA5388](v78);
      v239 = v21;
      sub_22578764C(sub_22577C9F4, (uint64_t)&v240[-4], v77);
      id v80 = v79;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
      if (!v80)
      {
        char v108 = HKShowSensitiveLogItems();
        uint64_t v53 = v271;
        uint64_t v52 = v272;
        if (v108)
        {
          if (qword_26ABF9378 != -1) {
            swift_once();
          }
          uint64_t v109 = sub_22579F458();
          __swift_project_value_buffer(v109, (uint64_t)qword_26ABF94A0);
          id v110 = sub_22579F438();
          os_log_type_t v111 = sub_22579FCB8();
          if (os_log_type_enabled(v110, v111))
          {
            uint64_t v112 = (uint8_t *)swift_slowAlloc();
            uint64_t v113 = swift_slowAlloc();
            uint64_t v274 = v113;
            *(_DWORD *)uint64_t v112 = 136315138;
            uint64_t v114 = sub_2257A0188();
            uint64_t v273 = sub_22572E428(v114, v115, &v274);
            sub_22579FD68();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_225722000, v110, v111, "[%s] Pregnancy state is in post pregnancy but we do not have a corresponding setup record, not making adjustment", v112, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x22A635470](v113, -1, -1);
            MEMORY[0x22A635470](v112, -1, -1);
          }
        }
        v269();

        id v62 = v251;
        goto LABEL_13;
      }
      id v81 = objc_msgSend(v80, sel_pregnancyAdjustedFeaturesSet);
      type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
      uint64_t v83 = v82;
      uint64_t v249 = sub_22577C0D8(&qword_268105290, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
      uint64_t v84 = sub_22579FBE8();

      id v85 = (id)*MEMORY[0x263F450D8];
      char v86 = sub_22576F1B4((uint64_t)v85, v84);

      swift_bridgeObjectRelease();
      uint64_t v87 = v264;
      id v250 = v80;
      if ((v86 & 1) == 0)
      {
        id v88 = v85;
        id v89 = objc_msgSend(v80, sel_postPregnancyFeatureAdjustmentCompletionLog);
        uint64_t v90 = sub_22579FA38();

        uint64_t v91 = *(void *)(v90 + 16);
        uint64_t v247 = v83;
        if (v91 && (unint64_t v92 = sub_2257824B8((uint64_t)v88), (v93 & 1) != 0))
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v263 + 16))(v39, *(void *)(v90 + 56) + *(void *)(v263 + 72) * v92, v87);
          uint64_t v94 = 0;
        }
        else
        {
          uint64_t v94 = 1;
        }
        id v80 = v250;
        uint64_t v116 = v263;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v263 + 56))(v39, v94, 1, v87);

        swift_bridgeObjectRelease();
        int v117 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v116 + 48))(v39, 1, v87);
        sub_22573C520((uint64_t)v39, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
        uint64_t v83 = v247;
        if (v117 == 1)
        {
          int v118 = HKShowSensitiveLogItems();
          uint64_t v53 = v271;
          uint64_t v52 = v272;
          if (v118)
          {
            if (qword_26ABF9378 != -1) {
              swift_once();
            }
            uint64_t v119 = sub_22579F458();
            __swift_project_value_buffer(v119, (uint64_t)qword_26ABF94A0);
            unint64_t v120 = sub_22579F438();
            os_log_type_t v121 = sub_22579FCB8();
            if (!os_log_type_enabled(v120, v121)) {
              goto LABEL_82;
            }
            unint64_t v122 = (uint8_t *)swift_slowAlloc();
            uint64_t v123 = swift_slowAlloc();
            uint64_t v274 = v123;
            *(_DWORD *)unint64_t v122 = 136315138;
            uint64_t v124 = sub_2257A0188();
            uint64_t v273 = sub_22572E428(v124, v125, &v274);
            id v80 = v250;
            sub_22579FD68();
            swift_bridgeObjectRelease();
            uint64_t v126 = "[%s] Does not require the cardio fitness adjustment, not making adjustment";
LABEL_81:
            _os_log_impl(&dword_225722000, v120, v121, v126, v122, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x22A635470](v123, -1, -1);
            MEMORY[0x22A635470](v122, -1, -1);
LABEL_82:

            goto LABEL_83;
          }
          goto LABEL_83;
        }
      }
      id v127 = objc_msgSend(v266, sel_physiologicalWashoutEndDate);
      if (!v127)
      {
        uint64_t v134 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v263 + 56);
        v134(v36, 1, 1, v87);
        goto LABEL_58;
      }
      uint64_t v128 = v127;
      id v246 = v85;
      uint64_t v129 = v258;
      sub_22579F2F8();

      id v130 = (void *)v263;
      uint64_t v132 = v263 + 32;
      v131 = *(void (**)(char *, char *, uint64_t))(v263 + 32);
      v131(v36, v129, v87);
      id v266 = (id)v130[7];
      ((void (*)(char *, void, uint64_t, uint64_t))v266)(v36, 0, 1, v87);
      uint64_t v133 = (unsigned int (*)(char *, uint64_t, uint64_t))v130[6];
      uint64_t v245 = v130 + 6;
      v244 = v133;
      if (v133(v36, 1, v87) == 1)
      {
        id v80 = v250;
        uint64_t v134 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v266;
        id v85 = v246;
LABEL_58:
        sub_22573C520((uint64_t)v36, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
        goto LABEL_59;
      }
      uint64_t v247 = v83;
      uint64_t v243 = v130 + 7;
      uint64_t v143 = v257;
      uint64_t v144 = v36;
      uint64_t v242 = v132;
      BOOL v145 = v131;
      v131(v257, v144, v87);
      sub_22579F328();
      char v146 = sub_22579F2C8();
      uint64_t v149 = (void (*)(char *, uint64_t))v130[1];
      unint64_t v148 = v130 + 1;
      uint64_t v147 = v149;
      v149(v129, v87);
      if ((v146 & 1) == 0)
      {
        v147(v143, v87);
        id v80 = v250;
        uint64_t v134 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v266;
        id v85 = v246;
LABEL_59:
        id v135 = v85;
        id v136 = objc_msgSend(v80, sel_postPregnancyFeatureAdjustmentCompletionLog);
        uint64_t v137 = sub_22579FA38();

        if (*(void *)(v137 + 16))
        {
          unint64_t v138 = sub_2257824B8((uint64_t)v135);
          uint64_t v139 = v263;
          uint64_t v140 = (uint64_t)v259;
          if (v141)
          {
            (*(void (**)(char *, unint64_t, uint64_t))(v263 + 16))(v259, *(void *)(v137 + 56) + *(void *)(v263 + 72) * v138, v87);
            uint64_t v142 = 0;
          }
          else
          {
            uint64_t v142 = 1;
          }
        }
        else
        {
          uint64_t v142 = 1;
          uint64_t v139 = v263;
          uint64_t v140 = (uint64_t)v259;
        }
        v134((char *)v140, v142, 1, v87);

        swift_bridgeObjectRelease();
        int v156 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v139 + 48))(v140, 1, v87);
        sub_22573C520(v140, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
        char v157 = HKShowSensitiveLogItems();
        if (v156 == 1)
        {
          uint64_t v53 = v271;
          if (v157)
          {
            if (qword_26ABF9378 != -1) {
              swift_once();
            }
            uint64_t v158 = sub_22579F458();
            __swift_project_value_buffer(v158, (uint64_t)qword_26ABF94A0);
            uint64_t v159 = sub_22579F438();
            os_log_type_t v160 = sub_22579FCB8();
            if (os_log_type_enabled(v159, v160))
            {
              uint64_t v161 = (uint8_t *)swift_slowAlloc();
              uint64_t v162 = swift_slowAlloc();
              uint64_t v274 = v162;
              *(_DWORD *)uint64_t v161 = 136315138;
              uint64_t v163 = sub_2257A0188();
              uint64_t v273 = sub_22572E428(v163, v164, &v274);
              uint64_t v87 = v264;
              id v80 = v250;
              sub_22579FD68();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_225722000, v159, v160, "[%s)] Physiological washout date has passed, but we have not yet adjusted features, making adjustment", v161, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x22A635470](v162, -1, -1);
              MEMORY[0x22A635470](v161, -1, -1);
            }
          }
          sub_22572F400();
          uint64_t v165 = swift_allocObject();
          *(_OWORD *)(v165 + 16) = xmmword_2257A3D00;
          *(void *)(v165 + 32) = v80;
          uint64_t v274 = v165;
          sub_22579FB78();
          uint64_t v166 = v274;
          sub_22572F19C(0, (unint64_t *)&qword_26ABF9398);
          id v167 = v80;
          id v168 = (void *)sub_22579FD18();
          uint64_t v169 = (uint64_t)v260;
          sub_22579F328();
          v134((char *)v169, 0, 1, v87);
          uint64_t v52 = v272;
          sub_2257791B8(v166, v272, v261, v168, v169, v269, v268, v262, v53, v248);

          sub_22573C520(v169, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
          swift_bridgeObjectRelease();

          goto LABEL_12;
        }
        uint64_t v53 = v271;
        uint64_t v52 = v272;
        if (v157)
        {
          if (qword_26ABF9378 != -1) {
            swift_once();
          }
          uint64_t v170 = sub_22579F458();
          __swift_project_value_buffer(v170, (uint64_t)qword_26ABF94A0);
          unint64_t v120 = sub_22579F438();
          os_log_type_t v121 = sub_22579FCB8();
          if (!os_log_type_enabled(v120, v121)) {
            goto LABEL_82;
          }
          unint64_t v122 = (uint8_t *)swift_slowAlloc();
          uint64_t v123 = swift_slowAlloc();
          uint64_t v274 = v123;
          *(_DWORD *)unint64_t v122 = 136315138;
          uint64_t v171 = sub_2257A0188();
          uint64_t v273 = sub_22572E428(v171, v172, &v274);
          sub_22579FD68();
          swift_bridgeObjectRelease();
          uint64_t v126 = "[%s] Physiological washout date has passed, and we have a post pregnancy adjustment date. No more work needed here.";
          goto LABEL_81;
        }
LABEL_83:
        v269();

        goto LABEL_21;
      }
      id v150 = v246;
      id v151 = objc_msgSend(v250, sel_postPregnancyFeatureAdjustmentCompletionLog);
      uint64_t v152 = sub_22579FA38();

      if (*(void *)(v152 + 16))
      {
        unint64_t v153 = sub_2257824B8((uint64_t)v150);
        uint64_t v53 = v271;
        if (v154)
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v263 + 16))(v33, *(void *)(v152 + 56) + *(void *)(v263 + 72) * v153, v264);
          uint64_t v155 = 0;
        }
        else
        {
          uint64_t v155 = 1;
        }
      }
      else
      {
        uint64_t v155 = 1;
        uint64_t v53 = v271;
      }
      uint64_t v173 = v264;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v266)(v33, v155, 1, v264);

      swift_bridgeObjectRelease();
      unsigned int v174 = v244(v33, 1, v173);
      sub_22573C520((uint64_t)v33, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
      uint64_t v241 = v147;
      if (v174 == 1)
      {
        char v175 = HKShowSensitiveLogItems();
        uint64_t v52 = v272;
        id v176 = v250;
        id v177 = v257;
        if (v175)
        {
          if (qword_26ABF9378 != -1) {
            swift_once();
          }
          uint64_t v178 = sub_22579F458();
          __swift_project_value_buffer(v178, (uint64_t)qword_26ABF94A0);
          uint64_t v179 = sub_22579F438();
          os_log_type_t v180 = sub_22579FCB8();
          if (os_log_type_enabled(v179, v180))
          {
            v181 = (uint8_t *)swift_slowAlloc();
            uint64_t v182 = swift_slowAlloc();
            uint64_t v274 = v182;
            *(_DWORD *)v181 = 136315138;
            uint64_t v173 = v264;
            uint64_t v183 = sub_2257A0188();
            uint64_t v273 = sub_22572E428(v183, v184, &v274);
            uint64_t v52 = v272;
            id v176 = v250;
            sub_22579FD68();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_225722000, v179, v180, "[%s] Physiological washout date has not yet passed, and we do not have a post pregnancy adjustment date. No adjustment needed yet.", v181, 0xCu);
            swift_arrayDestroy();
            uint64_t v185 = v182;
            id v177 = v257;
            MEMORY[0x22A635470](v185, -1, -1);
            MEMORY[0x22A635470](v181, -1, -1);
          }
        }
        v269();

        v241(v177, v173);
        goto LABEL_21;
      }
      id v186 = v150;
      id v187 = objc_msgSend(v250, sel_postPregnancyFeatureAdjustmentCompletionLog);
      uint64_t v188 = sub_22579FA38();

      uint64_t v189 = *(void *)(v188 + 16);
      uint64_t v52 = v272;
      v240[1] = v148;
      v240[0] = v145;
      if (v189)
      {
        unint64_t v190 = sub_2257824B8((uint64_t)v186);
        uint64_t v191 = v255;
        if (v192)
        {
          (*(void (**)(uint64_t, unint64_t, uint64_t))(v263 + 16))(v255, *(void *)(v188 + 56) + *(void *)(v263 + 72) * v190, v264);
          uint64_t v193 = 0;
        }
        else
        {
          uint64_t v193 = 1;
        }
      }
      else
      {
        uint64_t v193 = 1;
        uint64_t v191 = v255;
      }
      uint64_t v194 = v264;
      v195 = (void (*)(uint64_t, void, uint64_t, uint64_t))v266;
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v266)(v191, v193, 1, v264);

      swift_bridgeObjectRelease();
      uint64_t v196 = v254;
      sub_22579F288();
      v195(v196, 0, 1, v194);
      uint64_t v197 = v256;
      uint64_t v198 = v256 + *(int *)(v253 + 48);
      uint64_t v199 = v191;
      sub_22577C120(v191, v256);
      sub_22577C120(v196, v198);
      v200 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v244;
      if (v244((char *)v197, 1, v194) == 1)
      {
        os_log_type_t v201 = v200;
        v202 = (void (*)(uint64_t))MEMORY[0x263F07490];
        sub_22573C520(v196, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
        sub_22573C520(v199, (unint64_t *)&unk_26ABF9490, v202);
        int v203 = v201(v198, 1, v194);
        uint64_t v204 = v194;
        if (v203 == 1)
        {
          sub_22573C520(v256, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
          id v205 = v250;
          uint64_t v206 = v257;
LABEL_107:
          if (HKShowSensitiveLogItems())
          {
            if (qword_26ABF9378 != -1) {
              swift_once();
            }
            uint64_t v214 = sub_22579F458();
            __swift_project_value_buffer(v214, (uint64_t)qword_26ABF94A0);
            uint64_t v215 = sub_22579F438();
            os_log_type_t v216 = sub_22579FCB8();
            if (os_log_type_enabled(v215, v216))
            {
              v217 = (uint8_t *)swift_slowAlloc();
              uint64_t v218 = swift_slowAlloc();
              uint64_t v274 = v218;
              *(_DWORD *)v217 = 136315138;
              uint64_t v204 = v264;
              uint64_t v219 = sub_2257A0188();
              uint64_t v273 = sub_22572E428(v219, v220, &v274);
              uint64_t v52 = v272;
              id v205 = v250;
              sub_22579FD68();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_225722000, v215, v216, "[%s] Physiological washout date has not yet passed, but the user has adjusted their notifications to be on again", v217, 0xCu);
              swift_arrayDestroy();
              uint64_t v221 = v218;
              uint64_t v206 = v257;
              MEMORY[0x22A635470](v221, -1, -1);
              MEMORY[0x22A635470](v217, -1, -1);
            }
          }
          v269();

          uint64_t v222 = v206;
LABEL_121:
          v241(v222, v204);
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v207 = v252;
        sub_22577C120(v197, v252);
        if (v200(v198, 1, v194) != 1)
        {
          uint64_t v211 = v258;
          ((void (*)(char *, uint64_t, uint64_t))v240[0])(v258, v198, v194);
          sub_22577C0D8(&qword_26ABF9B00, MEMORY[0x263F07490]);
          char v212 = sub_22579FA88();
          v147(v211, v194);
          uint64_t v213 = (void (*)(uint64_t))MEMORY[0x263F07490];
          sub_22573C520(v254, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
          sub_22573C520(v255, (unint64_t *)&unk_26ABF9490, v213);
          v147((char *)v207, v194);
          sub_22573C520(v197, (unint64_t *)&unk_26ABF9490, v213);
          uint64_t v204 = v194;
          id v205 = v250;
          uint64_t v206 = v257;
          uint64_t v210 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v266;
          if (v212) {
            goto LABEL_107;
          }
LABEL_114:
          if (HKShowSensitiveLogItems())
          {
            if (qword_26ABF9378 != -1) {
              swift_once();
            }
            uint64_t v223 = sub_22579F458();
            __swift_project_value_buffer(v223, (uint64_t)qword_26ABF94A0);
            id v224 = sub_22579F438();
            os_log_type_t v225 = sub_22579FCB8();
            if (os_log_type_enabled(v224, v225))
            {
              uint64_t v226 = (uint8_t *)swift_slowAlloc();
              uint64_t v227 = swift_slowAlloc();
              uint64_t v274 = v227;
              *(_DWORD *)uint64_t v226 = 136315138;
              uint64_t v204 = v264;
              uint64_t v228 = sub_2257A0188();
              uint64_t v273 = sub_22572E428(v228, v229, &v274);
              uint64_t v52 = v272;
              id v205 = v250;
              sub_22579FD68();
              uint64_t v53 = v271;
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_225722000, v224, v225, "[%s)] Physiological washout date has not passed, but we have an adjustment date! We made a mistake - reverting adjustment", v226, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x22A635470](v227, -1, -1);
              MEMORY[0x22A635470](v226, -1, -1);
            }
          }
          sub_22572F400();
          uint64_t v230 = swift_allocObject();
          *(_OWORD *)(v230 + 16) = xmmword_2257A3D00;
          *(void *)(v230 + 32) = v205;
          uint64_t v274 = v230;
          sub_22579FB78();
          uint64_t v231 = v274;
          sub_22572F19C(0, (unint64_t *)&qword_26ABF9398);
          id v232 = v205;
          v233 = (void *)sub_22579FD18();
          uint64_t v234 = (uint64_t)v260;
          v210(v260, 1, 1, v204);
          sub_2257791B8(v231, v52, v261, v233, v234, v269, v268, v262, v53, v248);

          sub_22573C520(v234, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
          swift_bridgeObjectRelease();
          uint64_t v222 = v257;
          goto LABEL_121;
        }
        uint64_t v208 = v207;
        v209 = (void (*)(uint64_t))MEMORY[0x263F07490];
        sub_22573C520(v254, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
        sub_22573C520(v255, (unint64_t *)&unk_26ABF9490, v209);
        v147((char *)v208, v194);
        uint64_t v204 = v194;
      }
      sub_22577C1A0(v256);
      id v205 = v250;
      uint64_t v210 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v266;
      goto LABEL_114;
    }
    id v95 = (void *)*MEMORY[0x263F450D8];
    id v96 = objc_msgSend(a3, sel_pregnancyModeSetupCompletionSet);
    sub_22572F19C(0, (unint64_t *)&qword_26ABF9A88);
    sub_22572F36C(&qword_26ABF9A90, (unint64_t *)&qword_26ABF9A88);
    uint64_t v97 = sub_22579FBE8();

    id v98 = v95;
    sub_22577BB00(v97, (uint64_t)v98);
    unint64_t v100 = v99;

    uint64_t v53 = v271;
    uint64_t v52 = v272;
    if (v100 >> 62)
    {
      uint64_t v235 = sub_22579FF88();
      uint64_t v101 = v264;
      if (v235) {
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v101 = v264;
      if (*(void *)((v100 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_33:
        sub_22572F19C(0, (unint64_t *)&qword_26ABF9398);
        id v102 = (void *)sub_22579FD18();
        uint64_t v103 = (uint64_t)v260;
        sub_22579F328();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v263 + 56))(v103, 0, 1, v101);
        sub_2257791B8(v100, v52, v261, v102, v103, v269, v268, v262, v53, a9);

        sub_22573C520(v103, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
        swift_bridgeObjectRelease();
        goto LABEL_21;
      }
    }
    swift_bridgeObjectRelease();
    if ((HKShowSensitiveLogItems() & 1) == 0) {
      goto LABEL_11;
    }
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v236 = sub_22579F458();
    __swift_project_value_buffer(v236, (uint64_t)qword_26ABF94A0);
    uint64_t v55 = sub_22579F438();
    os_log_type_t v56 = sub_22579FCB8();
    if (!os_log_type_enabled(v55, v56)) {
      goto LABEL_10;
    }
    uint64_t v57 = (uint8_t *)swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    uint64_t v274 = v58;
    *(_DWORD *)uint64_t v57 = 136315138;
    uint64_t v237 = sub_2257A0188();
    uint64_t v273 = sub_22572E428(v237, v238, &v274);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    uint64_t v61 = "[%s] Pregnancy state is none and we don't have any setup records needing an update. Not making adjustment";
    goto LABEL_9;
  }
  char v51 = HKShowSensitiveLogItems();
  uint64_t v53 = v271;
  uint64_t v52 = v272;
  if (v51)
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v54 = sub_22579F458();
    __swift_project_value_buffer(v54, (uint64_t)qword_26ABF94A0);
    uint64_t v55 = sub_22579F438();
    os_log_type_t v56 = sub_22579FCB8();
    if (!os_log_type_enabled(v55, v56)) {
      goto LABEL_10;
    }
    uint64_t v57 = (uint8_t *)swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    uint64_t v274 = v58;
    *(_DWORD *)uint64_t v57 = 136315138;
    uint64_t v59 = sub_2257A0188();
    uint64_t v273 = sub_22572E428(v59, v60, &v274);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    uint64_t v61 = "[%s] Pregnancy state is ongoing. Not making adjustment";
LABEL_9:
    _os_log_impl(&dword_225722000, v55, v56, v61, v57, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v58, -1, -1);
    MEMORY[0x22A635470](v57, -1, -1);
LABEL_10:
  }
LABEL_11:
  v269();
LABEL_12:
  id v62 = v267;
LABEL_13:

LABEL_21:
  uint64_t v72 = v270;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v72 + 8))(v52, v53);
}

uint64_t sub_225778C9C(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void (*a6)(void), void (*a7)(void), char *a8)
{
  os_log_type_t v56 = a4;
  uint64_t v57 = a1;
  uint64_t v58 = a3;
  uint64_t ObjectType = swift_getObjectType();
  sub_2257383A8(0, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v18 = (char *)&v49 - v17;
  v62[3] = type metadata accessor for HDMCExperienceDaemonStore();
  v62[4] = sub_22577C0D8(&qword_26ABF9628, (void (*)(uint64_t))type metadata accessor for HDMCExperienceDaemonStore);
  v62[0] = a2;
  uint64_t v19 = *(void **)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_cardioFitnessFeatureAvailabilityManager];
  uint64_t v59 = a8;
  if (v19)
  {
    uint64_t v53 = ObjectType;
    uint64_t v54 = a6;
    uint64_t v55 = a7;
    swift_retain();
    char v51 = v19;
    id v52 = v19;
LABEL_5:
    id v50 = (id)*MEMORY[0x263F09820];
    sub_22577C120(a5, (uint64_t)v18);
    sub_22577C204((uint64_t)v62, (uint64_t)v61);
    unint64_t v23 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    unint64_t v24 = (v16 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v25 = (v24 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v26 = (v25 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v27 = (v26 + 47) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v28 = swift_allocObject();
    uint64_t v30 = v56;
    uint64_t v29 = v57;
    *(void *)(v28 + 16) = v56;
    *(void *)(v28 + 24) = v29;
    sub_22577C26C((uint64_t)v18, v28 + v23);
    uint64_t v31 = v59;
    *(void *)(v28 + v24) = v59;
    uint64_t v32 = v58;
    *(void *)(v28 + v25) = v58;
    sub_22573527C(v61, v28 + v26);
    uint64_t v33 = (void (**)(void))(v28 + v27);
    uint64_t v34 = v55;
    *uint64_t v33 = v54;
    v33[1] = v34;
    *(void *)(v28 + ((v27 + 23) & 0xFFFFFFFFFFFFFFF8)) = v53;
    aBlock[4] = (uint64_t)sub_22577C2EC;
    aBlock[5] = v28;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_2257708E4;
    aBlock[3] = (uint64_t)&block_descriptor;
    uint64_t v35 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    unint64_t v36 = v52;
    swift_unknownObjectRetain();
    id v37 = v50;
    id v38 = v30;
    swift_bridgeObjectRetain();
    id v39 = v31;
    id v40 = v32;
    swift_retain();
    swift_release();
    objc_msgSend(v36, sel_setFeatureSettingNumber_forKey_completion_, v38, v37, v35);
    swift_unknownObjectRelease();
    _Block_release(v35);
    swift_unknownObjectRelease();

    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  uint64_t v20 = *(void **)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_profile];
  uint64_t v21 = *MEMORY[0x263F09730];
  swift_retain();
  id v22 = objc_msgSend(v20, sel_featureAvailabilityProvidingForFeatureIdentifier_, v21);
  if (v22)
  {
    uint64_t v53 = ObjectType;
    uint64_t v54 = a6;
    uint64_t v55 = a7;
    char v51 = 0;
    id v52 = v22;
    goto LABEL_5;
  }
  if (HKShowSensitiveLogItems())
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v42 = sub_22579F458();
    __swift_project_value_buffer(v42, (uint64_t)qword_26ABF94A0);
    uint64_t v43 = sub_22579F438();
    os_log_type_t v44 = sub_22579FC98();
    if (os_log_type_enabled(v43, v44))
    {
      id v45 = (uint8_t *)swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      aBlock[0] = v46;
      *(_DWORD *)id v45 = 136315138;
      uint64_t v47 = sub_2257A0188();
      *(void *)&v61[0] = sub_22572E428(v47, v48, aBlock);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v43, v44, "[%s] Could not get cardio fitness feature availability provider", v45, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v46, -1, -1);
      MEMORY[0x22A635470](v45, -1, -1);
    }
  }
  a6();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
}

uint64_t sub_2257791B8(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void (*a6)(void), void (*a7)(void), char *a8, uint64_t a9, uint64_t a10)
{
  uint64_t v57 = a5;
  uint64_t v58 = a4;
  uint64_t v59 = a3;
  uint64_t v60 = a1;
  uint64_t ObjectType = swift_getObjectType();
  sub_2257383A8(0, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v19 = (char *)&v50 - v18;
  v63[3] = a9;
  v63[4] = a10;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v63);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a9 - 8) + 16))(boxed_opaque_existential_1, a2, a9);
  uint64_t v21 = *(void **)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_cardioFitnessFeatureAvailabilityManager];
  if (v21)
  {
    uint64_t v53 = a8;
    uint64_t v54 = ObjectType;
    uint64_t v55 = a6;
    os_log_type_t v56 = a7;
    id v52 = v21;
LABEL_5:
    id v51 = (id)*MEMORY[0x263F09820];
    sub_22577C120(v57, (uint64_t)v19);
    sub_22577C204((uint64_t)v63, (uint64_t)v62);
    unint64_t v23 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
    unint64_t v24 = (v17 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v25 = (v24 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v26 = (v25 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v27 = (v26 + 47) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v28 = (v27 + 23) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v29 = swift_allocObject();
    uint64_t v30 = v58;
    uint64_t v31 = v60;
    *(void *)(v29 + 16) = v58;
    *(void *)(v29 + 24) = v31;
    sub_22577C26C((uint64_t)v19, v29 + v23);
    uint64_t v32 = v53;
    *(void *)(v29 + v24) = v53;
    uint64_t v33 = v59;
    *(void *)(v29 + v25) = v59;
    sub_22573527C(v62, v29 + v26);
    uint64_t v34 = (void (**)(void))(v29 + v27);
    uint64_t v35 = v56;
    *uint64_t v34 = v55;
    v34[1] = v35;
    *(void *)(v29 + v2_Block_object_dispose(&STACK[0x4A8], 8) = v54;
    aBlock[4] = (uint64_t)sub_22577C2EC;
    aBlock[5] = v29;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_2257708E4;
    aBlock[3] = (uint64_t)&block_descriptor_25;
    unint64_t v36 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    id v37 = v52;
    swift_unknownObjectRetain();
    id v38 = v51;
    id v39 = v30;
    swift_bridgeObjectRetain();
    id v40 = v32;
    id v41 = v33;
    swift_retain();
    swift_release();
    objc_msgSend(v37, sel_setFeatureSettingNumber_forKey_completion_, v39, v38, v36);
    swift_unknownObjectRelease();
    _Block_release(v36);
    swift_unknownObjectRelease();

    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
  }
  id v22 = objc_msgSend(*(id *)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_profile], sel_featureAvailabilityProvidingForFeatureIdentifier_, *MEMORY[0x263F09730]);
  if (v22)
  {
    uint64_t v53 = a8;
    uint64_t v54 = ObjectType;
    uint64_t v55 = a6;
    os_log_type_t v56 = a7;
    id v52 = v22;
    goto LABEL_5;
  }
  if (HKShowSensitiveLogItems())
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_22579F458();
    __swift_project_value_buffer(v43, (uint64_t)qword_26ABF94A0);
    os_log_type_t v44 = sub_22579F438();
    os_log_type_t v45 = sub_22579FC98();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      aBlock[0] = v47;
      *(_DWORD *)uint64_t v46 = 136315138;
      uint64_t v48 = sub_2257A0188();
      *(void *)&v62[0] = sub_22572E428(v48, v49, aBlock);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v44, v45, "[%s] Could not get cardio fitness feature availability provider", v46, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v47, -1, -1);
      MEMORY[0x22A635470](v46, -1, -1);
    }
  }
  a6();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
}

uint64_t sub_2257796B0(uint64_t a1, void *a2, uint64_t a3)
{
  swift_getObjectType();
  v20[3] = type metadata accessor for HDMCExperienceDaemonStore();
  v20[4] = sub_22577C0D8(&qword_26ABF9628, (void (*)(uint64_t))type metadata accessor for HDMCExperienceDaemonStore);
  v20[0] = a3;
  sub_22577C204((uint64_t)v20, (uint64_t)v19);
  sub_22577C494(0, &qword_268105610);
  swift_retain();
  if (swift_dynamicCast()) {
    uint64_t v6 = v18;
  }
  else {
    uint64_t v6 = 0;
  }
  HDCodableMenstrualCyclesExperienceModel.deleteRecords(with:)(a1);
  if (HKShowSensitiveLogItems())
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_22579F458();
    __swift_project_value_buffer(v7, (uint64_t)qword_26ABF94A0);
    swift_bridgeObjectRetain_n();
    uint64_t v8 = sub_22579F438();
    os_log_type_t v9 = sub_22579FCB8();
    if (!os_log_type_enabled(v8, v9))
    {

      swift_bridgeObjectRelease_n();
      if (!v6) {
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
      }
      goto LABEL_10;
    }
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    v19[0] = v17;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v11 = sub_2257A0188();
    sub_22572E428(v11, v12, v19);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    sub_22579F398();
    sub_22577C0D8(&qword_268105620, MEMORY[0x263F07508]);
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_22579FBF8();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    sub_22572E428(v13, v15, v19);
    sub_22579FD68();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v8, v9, "[%s] Deleted records with UUIDs: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v17, -1, -1);
    MEMORY[0x22A635470](v10, -1, -1);
  }
  if (v6)
  {
LABEL_10:
    swift_retain();
    HDMCExperienceDaemonStore.setModel(_:)(a2);
    swift_release_n();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
}

uint64_t sub_225779EF4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_getObjectType();
  v26[3] = a5;
  v26[4] = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v26);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))(boxed_opaque_existential_1, a3, a5);
  sub_22577C204((uint64_t)v26, (uint64_t)v25);
  sub_22577C494(0, &qword_268105610);
  type metadata accessor for HDMCExperienceDaemonStore();
  if (swift_dynamicCast()) {
    uint64_t v12 = v24;
  }
  else {
    uint64_t v12 = 0;
  }
  HDCodableMenstrualCyclesExperienceModel.deleteRecords(with:)(a1);
  if (HKShowSensitiveLogItems())
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_22579F458();
    __swift_project_value_buffer(v13, (uint64_t)qword_26ABF94A0);
    swift_bridgeObjectRetain_n();
    unint64_t v14 = sub_22579F438();
    os_log_type_t v15 = sub_22579FCB8();
    if (!os_log_type_enabled(v14, v15))
    {

      swift_bridgeObjectRelease_n();
      if (!v12) {
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      }
      goto LABEL_10;
    }
    uint64_t v16 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    v25[0] = v23;
    *(_DWORD *)uint64_t v16 = 136315394;
    uint64_t v17 = sub_2257A0188();
    sub_22572E428(v17, v18, v25);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    sub_22579F398();
    sub_22577C0D8(&qword_268105620, MEMORY[0x263F07508]);
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_22579FBF8();
    unint64_t v21 = v20;
    swift_bridgeObjectRelease();
    sub_22572E428(v19, v21, v25);
    sub_22579FD68();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v14, v15, "[%s] Deleted records with UUIDs: %s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v23, -1, -1);
    MEMORY[0x22A635470](v16, -1, -1);
  }
  if (v12)
  {
LABEL_10:
    swift_retain();
    HDMCExperienceDaemonStore.setModel(_:)(a2);
    swift_release_n();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
}

uint64_t sub_22577A730(void *a1, void *a2, uint64_t a3)
{
  swift_getObjectType();
  sub_2257383A8(0, &qword_268105940, MEMORY[0x263F07508]);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v12 - v7;
  v14[3] = type metadata accessor for HDMCExperienceDaemonStore();
  v14[4] = sub_22577C0D8(&qword_26ABF9628, (void (*)(uint64_t))type metadata accessor for HDMCExperienceDaemonStore);
  v14[0] = a3;
  sub_22577C204((uint64_t)v14, (uint64_t)v13);
  sub_22577C494(0, &qword_268105610);
  swift_retain();
  if (swift_dynamicCast()) {
    uint64_t v9 = v12[1];
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = sub_22579F398();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  HDCodableMenstrualCyclesExperienceModel.insert(record:oldSampleUUID:)(a1, (uint64_t)v8);
  sub_22573C520((uint64_t)v8, &qword_268105940, MEMORY[0x263F07508]);
  if (v9)
  {
    swift_retain();
    HDMCExperienceDaemonStore.setModel(_:)(a2);
    swift_release_n();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
}

uint64_t sub_22577AD7C(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_getObjectType();
  sub_2257383A8(0, &qword_268105940, MEMORY[0x263F07508]);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v18 - v12;
  v20[3] = a5;
  v20[4] = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v20);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))(boxed_opaque_existential_1, a3, a5);
  sub_22577C204((uint64_t)v20, (uint64_t)v19);
  sub_22577C494(0, &qword_268105610);
  type metadata accessor for HDMCExperienceDaemonStore();
  if (swift_dynamicCast()) {
    uint64_t v15 = v18[1];
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = sub_22579F398();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  HDCodableMenstrualCyclesExperienceModel.insert(record:oldSampleUUID:)(a1, (uint64_t)v13);
  sub_22573C520((uint64_t)v13, &qword_268105940, MEMORY[0x263F07508]);
  if (v15)
  {
    swift_retain();
    HDMCExperienceDaemonStore.setModel(_:)(a2);
    swift_release_n();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
}

char *sub_22577B3C0(void *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, char *a8)
{
  *(void *)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_unitTest_deletedPregnancySamplesQueryResults] = 0;
  *(void *)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_profile] = a2;
  *(void *)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_pregnancyManager] = a1;
  if (a4)
  {
    uint64_t v16 = a8;
    id v17 = a2;
    id v18 = a1;
    id v19 = a4;
  }
  else
  {
    id v20 = objc_allocWithZone(MEMORY[0x263F432D8]);
    unint64_t v21 = a8;
    id v22 = a2;
    id v23 = a1;
    uint64_t v24 = (void *)sub_22579FA98();
    id v19 = objc_msgSend(v20, sel_initWithProfile_debugIdentifier_delegate_, v22, v24, 0);
  }
  *(void *)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_protectedDataOperation] = v19;
  *(void *)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_cardioFitnessFeatureStatusManager] = a5;
  *(void *)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_cardioFitnessFeatureAvailabilityManager] = a6;
  sub_22573C3A8(a7, (uint64_t)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_medicalIDDataManager]);
  swift_unknownObjectRetain();
  id v25 = a4;
  swift_unknownObjectRetain();

  v32.receiver = a8;
  v32.super_class = (Class)type metadata accessor for HDMCPregnancyFeatureAdjustmentManager();
  id v26 = objc_msgSendSuper2(&v32, sel_init);
  unint64_t v27 = self;
  unint64_t v28 = (char *)v26;
  uint64_t result = (char *)objc_msgSend(v27, sel_sharedBehavior);
  if (result)
  {
    uint64_t v30 = result;
    unsigned __int8 v31 = objc_msgSend(result, sel_isiPad);

    if ((v31 & 1) == 0)
    {
      objc_msgSend(*(id *)&v28[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_protectedDataOperation], sel_setDelegate_, v28);
      objc_msgSend(*(id *)&v28[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_pregnancyManager], sel_registerObserver_isUserInitiated_, v28, 0);
      objc_msgSend(a3, sel_registerWithObserver_, v28);
      sub_225731270(2);
    }

    sub_22573C334(a7);
    return v28;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_22577B5EC(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, char *a8)
{
  *(void *)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_unitTest_deletedPregnancySamplesQueryResults] = 0;
  *(void *)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_profile] = a2;
  *(void *)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_pregnancyManager] = a1;
  if (a4)
  {
    uint64_t v15 = a8;
    id v16 = a2;
    swift_unknownObjectRetain();
    id v17 = a4;
  }
  else
  {
    id v18 = objc_allocWithZone(MEMORY[0x263F432D8]);
    id v19 = a8;
    id v20 = a2;
    swift_unknownObjectRetain();
    unint64_t v21 = (void *)sub_22579FA98();
    id v17 = objc_msgSend(v18, sel_initWithProfile_debugIdentifier_delegate_, v20, v21, 0);
  }
  *(void *)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_protectedDataOperation] = v17;
  *(void *)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_cardioFitnessFeatureStatusManager] = a5;
  *(void *)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_cardioFitnessFeatureAvailabilityManager] = a6;
  sub_22573C3A8(a7, (uint64_t)&a8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_medicalIDDataManager]);
  swift_unknownObjectRetain();
  id v22 = a4;
  swift_unknownObjectRetain();

  v29.receiver = a8;
  v29.super_class = (Class)type metadata accessor for HDMCPregnancyFeatureAdjustmentManager();
  id v23 = objc_msgSendSuper2(&v29, sel_init);
  uint64_t v24 = self;
  id v25 = (char *)v23;
  uint64_t result = (char *)objc_msgSend(v24, sel_sharedBehavior);
  if (result)
  {
    unint64_t v27 = result;
    unsigned __int8 v28 = objc_msgSend(result, sel_isiPad);

    if ((v28 & 1) == 0)
    {
      objc_msgSend(*(id *)&v25[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_protectedDataOperation], sel_setDelegate_, v25);
      objc_msgSend(*(id *)&v25[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_pregnancyManager], sel_registerObserver_isUserInitiated_, v25, 0);
      objc_msgSend(a3, sel_registerWithObserver_, v25);
      sub_225731270(2);
    }

    sub_22573C334(a7);
    return v25;
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_22577B820(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v14 = (char *)objc_allocWithZone((Class)type metadata accessor for HDMCPregnancyFeatureAdjustmentManager());
  return sub_22577B5EC(a1, a2, a3, a4, a5, a6, a7, v14);
}

id sub_22577B8B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v18 = (void *)sub_22579F358();
  uint64_t v6 = sub_22579F338();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  uint64_t v9 = 0;
  if (v8(a3, 1, v6) != 1)
  {
    uint64_t v9 = (void *)sub_22579F2B8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a3, v6);
  }
  if (v8(a4, 1, v6) == 1)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = (void *)sub_22579F2B8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a4, v6);
  }
  type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
  sub_22577C0D8(&qword_268105290, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
  uint64_t v11 = (void *)sub_22579FBD8();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_22579FA28();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v17, sel_initWithVersion_sampleUUID_educationalStepsReviewDate_configurationStepsReviewDate_pregnancyAdjustedFeaturesSet_postPregnancyFeatureAdjustmentCompletionLog_, a1, v18, v9, v10, v11, v12);

  uint64_t v14 = sub_22579F398();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a2, v14);
  return v13;
}

void sub_22577BB00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_22579FDD8();
    sub_22572F19C(0, (unint64_t *)&qword_26ABF9A88);
    sub_22572F36C(&qword_26ABF9A90, (unint64_t *)&qword_26ABF9A88);
    sub_22579FC38();
    uint64_t v3 = v22;
    uint64_t v20 = v23;
    uint64_t v4 = v24;
    uint64_t v5 = v25;
    unint64_t v6 = v26;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v20 = a1 + 56;
    uint64_t v4 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(a1 + 56);
  }
  int64_t v19 = (unint64_t)(v4 + 64) >> 6;
  while (v3 < 0)
  {
    if (!sub_22579FE48()) {
      goto LABEL_35;
    }
    sub_22572F19C(0, (unint64_t *)&qword_26ABF9A88);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v13 = v21;
    swift_unknownObjectRelease();
    uint64_t v12 = v5;
    uint64_t v10 = v6;
    if (!v21) {
      goto LABEL_35;
    }
LABEL_33:
    id v17 = objc_msgSend(v13, sel_pregnancyAdjustedFeaturesSet);
    type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
    sub_22577C0D8(&qword_268105290, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
    uint64_t v18 = sub_22579FBE8();

    LOBYTE(v17) = sub_22576F1B4(a2, v18);
    swift_bridgeObjectRelease();
    if (v17)
    {
      sub_22579FF08();
      sub_22579FF38();
      sub_22579FF48();
      sub_22579FF18();
    }
    else
    {
    }
    uint64_t v5 = v12;
    unint64_t v6 = v10;
  }
  if (v6)
  {
    uint64_t v10 = (v6 - 1) & v6;
    unint64_t v11 = __clz(__rbit64(v6)) | (v5 << 6);
    uint64_t v12 = v5;
LABEL_32:
    id v13 = *(id *)(*(void *)(v3 + 48) + 8 * v11);
    if (!v13) {
      goto LABEL_35;
    }
    goto LABEL_33;
  }
  int64_t v14 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v14 >= v19) {
      goto LABEL_35;
    }
    unint64_t v15 = *(void *)(v20 + 8 * v14);
    uint64_t v12 = v5 + 1;
    if (!v15)
    {
      uint64_t v12 = v5 + 2;
      if (v5 + 2 >= v19) {
        goto LABEL_35;
      }
      unint64_t v15 = *(void *)(v20 + 8 * v12);
      if (!v15)
      {
        uint64_t v12 = v5 + 3;
        if (v5 + 3 >= v19) {
          goto LABEL_35;
        }
        unint64_t v15 = *(void *)(v20 + 8 * v12);
        if (!v15)
        {
          uint64_t v12 = v5 + 4;
          if (v5 + 4 >= v19) {
            goto LABEL_35;
          }
          unint64_t v15 = *(void *)(v20 + 8 * v12);
          if (!v15)
          {
            uint64_t v12 = v5 + 5;
            if (v5 + 5 >= v19) {
              goto LABEL_35;
            }
            unint64_t v15 = *(void *)(v20 + 8 * v12);
            if (!v15)
            {
              uint64_t v16 = v5 + 6;
              while (v19 != v16)
              {
                unint64_t v15 = *(void *)(v20 + 8 * v16++);
                if (v15)
                {
                  uint64_t v12 = v16 - 1;
                  goto LABEL_31;
                }
              }
LABEL_35:
              sub_22577C1FC();
              return;
            }
          }
        }
      }
    }
LABEL_31:
    uint64_t v10 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v12 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

uint64_t sub_22577BE98@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1
                + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon37HDMCPregnancyFeatureAdjustmentManager_unitTest_deletedPregnancySamplesQueryResults);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for HDMCPregnancyFeatureAdjustmentManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HDMCPregnancyFeatureAdjustmentManager);
}

uint64_t dispatch thunk of HDMCPregnancyFeatureAdjustmentManager.unitTest_deletedPregnancySamplesQueryResults.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of HDMCPregnancyFeatureAdjustmentManager.unitTest_deletedPregnancySamplesQueryResults.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of HDMCPregnancyFeatureAdjustmentManager.unitTest_deletedPregnancySamplesQueryResults.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of HDMCPregnancyFeatureAdjustmentManager.__allocating_init(pregnancyProvider:profile:experienceModelProvider:operation:cardioFitnessFeatureStatusManager:cardioFitnessFeatureAvailabilityManager:medicalIDDataManager:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of HDMCPregnancyFeatureAdjustmentManager.updateCardioFitnessSettingsIfNecessary(for:experienceStore:experienceModel:codableExperienceModel:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of HDMCPregnancyFeatureAdjustmentManager.deleteRecordsWithNoAssociatedSampleOrOutstandingAdjustments(experienceStore:experienceModel:codableExperienceModel:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of HDMCPregnancyFeatureAdjustmentManager.pregnancyModelDidUpdate(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of HDMCPregnancyFeatureAdjustmentManager.performWork(for:profile:databaseAccessibilityAssertion:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of MedicalIDDataProviding.getMedicalIDData()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_22577C0B8(id *a1)
{
  return sub_22576F37C(a1) & 1;
}

uint64_t sub_22577C0D8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22577C120(uint64_t a1, uint64_t a2)
{
  sub_2257383A8(0, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22577C1A0(uint64_t a1)
{
  sub_22573C4A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22577C1FC()
{
  return swift_release();
}

uint64_t sub_22577C204(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22577C26C(uint64_t a1, uint64_t a2)
{
  sub_2257383A8(0, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_22577C2F0()
{
  if (!qword_2681055F8)
  {
    type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(255);
    sub_22579F338();
    sub_22577C0D8(&qword_268105290, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
    unint64_t v0 = sub_22579FFC8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2681055F8);
    }
  }
}

void sub_22577C39C()
{
  if (!qword_268105600)
  {
    type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(255);
    sub_22577C0D8(&qword_268105290, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
    unint64_t v0 = sub_22579FEA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268105600);
    }
  }
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_22577C494(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_22577C4E4()
{
  if (!qword_268105630)
  {
    sub_22579F398();
    sub_22577C0D8(&qword_268105620, MEMORY[0x263F07508]);
    unint64_t v0 = sub_22579FEA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268105630);
    }
  }
}

uint64_t sub_22577C578()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22577C5B0()
{
  if (!qword_26ABF95D8)
  {
    sub_22577C60C();
    unint64_t v0 = sub_22579FEA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ABF95D8);
    }
  }
}

unint64_t sub_22577C60C()
{
  unint64_t result = qword_26ABF96E0;
  if (!qword_26ABF96E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ABF96E0);
  }
  return result;
}

void sub_22577C660()
{
  if (!qword_268105638)
  {
    unint64_t v0 = sub_22579FEA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268105638);
    }
  }
}

void sub_22577C6C0(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, unint64_t *a5)
{
  if (!*a2)
  {
    sub_22572F19C(255, a3);
    sub_22572F36C(a5, a3);
    unint64_t v8 = sub_22579FEA8();
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t objectdestroyTm()
{
  sub_2257383A8(0, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);

  swift_bridgeObjectRelease();
  uint64_t v5 = sub_22579F338();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }
  unint64_t v7 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;

  __swift_destroy_boxed_opaque_existential_1(v0 + v9);
  swift_release();
  return MEMORY[0x270FA0238](v0, ((((v9 + 47) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_22577C8F0(char a1, void *a2)
{
  sub_2257383A8(0, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490]);
  unint64_t v6 = (*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  unint64_t v7 = (*(void *)(*(void *)(v5 - 8) + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_22576F488(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), v2 + v6, *(void *)(v2 + v7), *(void **)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8)), (void *)(v2 + ((((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(uint64_t (**)(uint64_t))(v2+ ((((((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 47) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_22577C9F4(id *a1)
{
  return sub_22577C0B8(a1) & 1;
}

uint64_t *sub_22577CA18(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v30 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v30 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_22577CC80();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    unint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    sub_22577CCE0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    id v13 = (char *)a1 + v12;
    int64_t v14 = (char *)a2 + v12;
    sub_22577CD40();
    uint64_t v16 = v15;
    id v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    v17(v13, v14, v15);
    v17((char *)a1 + a3[7], (char *)a2 + a3[7], v16);
    uint64_t v18 = a3[8];
    int64_t v19 = (char *)a1 + v18;
    uint64_t v20 = (char *)a2 + v18;
    sub_22577CE58();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    uint64_t v22 = a3[9];
    uint64_t v23 = (char *)a1 + v22;
    uint64_t v24 = (char *)a2 + v22;
    sub_22577CEC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
    uint64_t v26 = a3[10];
    unint64_t v27 = (char *)a1 + v26;
    unsigned __int8 v28 = (char *)a2 + v26;
    sub_22577CF8C();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
    *(uint64_t *)((char *)a1 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

void sub_22577CC80()
{
  if (!qword_26ABF95B8)
  {
    unint64_t v0 = sub_22579F4E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ABF95B8);
    }
  }
}

void sub_22577CCE0()
{
  if (!qword_26ABF9A08)
  {
    sub_22579F398();
    unint64_t v0 = sub_22579F4E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ABF9A08);
    }
  }
}

void sub_22577CD40()
{
  if (!qword_26ABF9A10)
  {
    sub_225738284(255, &qword_26ABF9740, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord, MEMORY[0x263F8D8F0]);
    sub_225783DA8((unint64_t *)&qword_26ABF9748, (void (*)(void))sub_22577CE24);
    unint64_t v0 = sub_22579F4E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ABF9A10);
    }
  }
}

uint64_t type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord(uint64_t a1)
{
  return sub_22572BDD0(a1, qword_26ABF9708);
}

uint64_t sub_22577CE24()
{
  return sub_2257845A8(&qword_26ABF96F8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
}

void sub_22577CE58()
{
  if (!qword_26ABF9A38)
  {
    unint64_t v0 = sub_22579F8D8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ABF9A38);
    }
  }
}

void sub_22577CEC0()
{
  if (!qword_26ABF9A00)
  {
    sub_2257382E8(255);
    sub_22577CF24();
    unint64_t v0 = sub_22579F4E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ABF9A00);
    }
  }
}

unint64_t sub_22577CF24()
{
  unint64_t result = qword_26ABF9610;
  if (!qword_26ABF9610)
  {
    sub_2257382E8(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ABF9610);
  }
  return result;
}

void sub_22577CF8C()
{
  if (!qword_26ABF9B38)
  {
    sub_22579F338();
    sub_2257845A8(&qword_26ABF9B00, MEMORY[0x263F07490]);
    unint64_t v0 = sub_22579F768();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ABF9B38);
    }
  }
}

uint64_t sub_22577D050(uint64_t a1, int *a2)
{
  sub_22577CC80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  sub_22577CCE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + a2[6];
  sub_22577CD40();
  uint64_t v9 = v8;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v10(v7, v8);
  v10(a1 + a2[7], v9);
  uint64_t v11 = a1 + a2[8];
  sub_22577CE58();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  uint64_t v13 = a1 + a2[9];
  sub_22577CEC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  uint64_t v15 = a1 + a2[10];
  sub_22577CF8C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22577D230(uint64_t a1, uint64_t a2, int *a3)
{
  sub_22577CC80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  sub_22577CCE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  sub_22577CD40();
  uint64_t v15 = v14;
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  v16(v12, v13, v14);
  v16(a1 + a3[7], a2 + a3[7], v15);
  uint64_t v17 = a3[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  sub_22577CE58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  uint64_t v21 = a3[9];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  sub_22577CEC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
  uint64_t v25 = a3[10];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  sub_22577CF8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22577D448(uint64_t a1, uint64_t a2, int *a3)
{
  sub_22577CC80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  sub_22577CCE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  sub_22577CD40();
  uint64_t v15 = v14;
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24);
  v16(v12, v13, v14);
  v16(a1 + a3[7], a2 + a3[7], v15);
  uint64_t v17 = a3[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  sub_22577CE58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 24))(v18, v19, v20);
  uint64_t v21 = a3[9];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  sub_22577CEC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 24))(v22, v23, v24);
  uint64_t v25 = a3[10];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  sub_22577CF8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 24))(v26, v27, v28);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22577D66C(uint64_t a1, uint64_t a2, int *a3)
{
  sub_22577CC80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  sub_22577CCE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  sub_22577CD40();
  uint64_t v15 = v14;
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32);
  v16(v12, v13, v14);
  v16(a1 + a3[7], a2 + a3[7], v15);
  uint64_t v17 = a3[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  sub_22577CE58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  uint64_t v21 = a3[9];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  sub_22577CEC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
  uint64_t v25 = a3[10];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  sub_22577CF8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 32))(v26, v27, v28);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_22577D880(uint64_t a1, uint64_t a2, int *a3)
{
  sub_22577CC80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  sub_22577CCE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  sub_22577CD40();
  uint64_t v15 = v14;
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40);
  v16(v12, v13, v14);
  v16(a1 + a3[7], a2 + a3[7], v15);
  uint64_t v17 = a3[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  sub_22577CE58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  uint64_t v21 = a3[9];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  sub_22577CEC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 40))(v22, v23, v24);
  uint64_t v25 = a3[10];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  sub_22577CF8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 40))(v26, v27, v28);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22577DA9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22577DAB0);
}

uint64_t sub_22577DAB0(uint64_t a1, uint64_t a2, int *a3)
{
  sub_22577CC80();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_14:
    return v9(v10, a2, v8);
  }
  sub_22577CCE0();
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_13:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_14;
  }
  sub_22577CD40();
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_13;
  }
  sub_22577CE58();
  if (*(_DWORD *)(*(void *)(v15 - 8) + 84) == a2)
  {
    uint64_t v8 = v15;
    uint64_t v12 = *(void *)(v15 - 8);
    uint64_t v13 = a3[8];
    goto LABEL_13;
  }
  sub_22577CEC0();
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a2)
  {
    uint64_t v8 = v16;
    uint64_t v12 = *(void *)(v16 - 8);
    uint64_t v13 = a3[9];
    goto LABEL_13;
  }
  sub_22577CF8C();
  if (*(_DWORD *)(*(void *)(v17 - 8) + 84) == a2)
  {
    uint64_t v8 = v17;
    uint64_t v12 = *(void *)(v17 - 8);
    uint64_t v13 = a3[10];
    goto LABEL_13;
  }
  unint64_t v19 = *(void *)(a1 + a3[11]);
  if (v19 >= 0xFFFFFFFF) {
    LODWORD(v19) = -1;
  }
  return (v19 + 1);
}

uint64_t sub_22577DCF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22577DD08);
}

void sub_22577DD08(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  sub_22577CC80();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    sub_22577CCE0();
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      sub_22577CD40();
      if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
      {
        uint64_t v10 = v16;
        uint64_t v14 = *(void *)(v16 - 8);
        uint64_t v15 = a4[6];
      }
      else
      {
        sub_22577CE58();
        if (*(_DWORD *)(*(void *)(v17 - 8) + 84) == a3)
        {
          uint64_t v10 = v17;
          uint64_t v14 = *(void *)(v17 - 8);
          uint64_t v15 = a4[8];
        }
        else
        {
          sub_22577CEC0();
          if (*(_DWORD *)(*(void *)(v18 - 8) + 84) == a3)
          {
            uint64_t v10 = v18;
            uint64_t v14 = *(void *)(v18 - 8);
            uint64_t v15 = a4[9];
          }
          else
          {
            sub_22577CF8C();
            if (*(_DWORD *)(*(void *)(v19 - 8) + 84) != a3)
            {
              *(void *)(a1 + a4[11]) = (a2 - 1);
              return;
            }
            uint64_t v10 = v19;
            uint64_t v14 = *(void *)(v19 - 8);
            uint64_t v15 = a4[10];
          }
        }
      }
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  v11(v12, a2, a2, v10);
}

void sub_22577DF48()
{
  sub_22577CC80();
  if (v0 <= 0x3F)
  {
    sub_22577CCE0();
    if (v1 <= 0x3F)
    {
      sub_22577CD40();
      if (v2 <= 0x3F)
      {
        sub_22577CE58();
        if (v3 <= 0x3F)
        {
          sub_22577CEC0();
          if (v4 <= 0x3F)
          {
            sub_22577CF8C();
            if (v5 <= 0x3F) {
              swift_initStructMetadata();
            }
          }
        }
      }
    }
  }
}

uint64_t *sub_22577E10C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_22579F338();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_22577E1DC(uint64_t a1)
{
  uint64_t v2 = sub_22579F338();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22577E250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22579F338();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22577E2D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22579F338();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22577E35C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22579F338();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_22577E3D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22579F338();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22577E45C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22577E470);
}

uint64_t sub_22577E470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22579F338();
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

uint64_t sub_22577E530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22577E544);
}

uint64_t sub_22577E544(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_22579F338();
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

uint64_t sub_22577E600()
{
  uint64_t result = sub_22579F338();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_22577E698(uint64_t a1)
{
  sub_225784098();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (void *)((char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_22577C2F0();
  uint64_t v7 = sub_22579FFB8();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  unint64_t v10 = (char *)v6 + *(int *)(v3 + 48);
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v24[1] = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v4 + 72);
  swift_retain();
  while (1)
  {
    sub_2257843B4(v13, (uint64_t)v6, (uint64_t (*)(void))sub_225784098);
    uint64_t v15 = *v6;
    unint64_t result = sub_2257824B8(*v6);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v8[6] + 8 * result) = v15;
    uint64_t v19 = v8[7];
    uint64_t v20 = sub_22579F338();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v19 + *(void *)(*(void *)(v20 - 8) + 72) * v18, v10, v20);
    uint64_t v21 = v8[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_11;
    }
    v8[2] = v23;
    v13 += v14;
    if (!--v9)
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

uint64_t sub_22577E894@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, void *a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v126 = a5;
  uint64_t v127 = a4;
  uint64_t v128 = a3;
  uint64_t v129 = a2;
  uint64_t v140 = a1;
  sub_225783F2C(0);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v143 = (uint64_t *)((char *)&v120 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v10);
  uint64_t v134 = (void **)((char *)&v120 - v12);
  sub_22577CF8C();
  uint64_t v141 = v13;
  uint64_t v122 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v142 = (char *)&v120 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_22579F338();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  unint64_t v18 = (char *)&v120 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2257382E8(0);
  uint64_t v124 = v19;
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v139 = (char *)&v120 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v123 = (char *)&v120 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  id v136 = (char *)&v120 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v120 - v26;
  sub_225738284(0, &qword_26ABF9740, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord, MEMORY[0x263F8D8F0]);
  uint64_t v144 = v28;
  uint64_t v29 = MEMORY[0x270FA5388](v28);
  unint64_t v138 = (char *)&v120 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  uint64_t v132 = (char *)&v120 - v31;
  sub_22577CD40();
  uint64_t v137 = v32;
  uint64_t v146 = *(void *)(v32 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v32);
  unint64_t v125 = (char *)&v120 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  uint64_t v133 = (char *)&v120 - v35;
  uint64_t v36 = sub_22579F398();
  uint64_t v37 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  id v39 = (char *)&v120 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = type metadata accessor for CoherentExperienceSetupRecord(0);
  *(void *)(a7 + *(int *)(v40 + 44)) = MEMORY[0x263F8EE80];
  uint64_t v147 = (uint64_t)v140;
  sub_22579F4F8();
  uint64_t v120 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v39, v129, v36);
  id v130 = (int *)v40;
  uint64_t v131 = a7;
  uint64_t v41 = v128;
  uint64_t v121 = v36;
  sub_22579F4F8();
  sub_2257843B4(v41, (uint64_t)v27, (uint64_t (*)(void))sub_2257382E8);
  uint64_t v42 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v43 = v42(v27, 1, v15);
  uint64_t v135 = v16;
  uint64_t v140 = v18;
  if (v43 == 1)
  {
    uint64_t v44 = type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v132, 1, 1, v44);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v27, v15);
    unint64_t v45 = sub_2257833D8(MEMORY[0x263F8EE78]);
    uint64_t v46 = v132;
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v132, v18, v15);
    uint64_t v47 = type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord(0);
    *(void *)&v46[*(int *)(v47 + 20)] = v45;
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v46, 0, 1, v47);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  uint64_t v48 = sub_225783DA8((unint64_t *)&qword_26ABF9748, (void (*)(void))sub_22577CE24);
  unint64_t v49 = v133;
  uint64_t v132 = (char *)v48;
  sub_22579F4F8();
  uint64_t v50 = *(void (**)(uint64_t, char *, uint64_t))(v146 + 32);
  uint64_t v51 = v137;
  v50(v131 + v130[6], v49, v137);
  id v52 = v136;
  sub_2257843B4(v127, (uint64_t)v136, (uint64_t (*)(void))sub_2257382E8);
  int v53 = v42(v52, 1, v15);
  uint64_t v146 = v15;
  uint64_t v54 = v138;
  if (v53 == 1)
  {
    uint64_t v55 = type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v54, 1, 1, v55);
  }
  else
  {
    uint64_t v56 = v135;
    uint64_t v57 = v140;
    (*(void (**)(char *, char *, uint64_t))(v135 + 32))(v140, v52, v15);
    unint64_t v58 = sub_2257833D8(MEMORY[0x263F8EE78]);
    (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v54, v57, v15);
    uint64_t v59 = type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord(0);
    *(void *)&v54[*(int *)(v59 + 20)] = v58;
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v54, 0, 1, v59);
    (*(void (**)(char *, uint64_t))(v56 + 8))(v57, v15);
  }
  uint64_t v60 = (uint64_t)v126;
  uint64_t v61 = v125;
  sub_22579F4F8();
  v50(v131 + v130[7], v61, v51);
  int64_t v62 = *(void *)(v60 + 16);
  BOOL v145 = a6;
  if (v62)
  {
    uint64_t v147 = MEMORY[0x263F8EE78];
    sub_2257827A8(0, v62, 0);
    uint64_t v63 = v147;
    uint64_t result = sub_225783250(v60);
    int64_t v65 = result;
    int v67 = v66;
    char v69 = v68 & 1;
    uint64_t v144 = v60 + 56;
    while ((v65 & 0x8000000000000000) == 0 && v65 < 1 << *(unsigned char *)(v60 + 32))
    {
      if (((*(void *)(v144 + (((unint64_t)v65 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v65) & 1) == 0) {
        goto LABEL_52;
      }
      if (*(_DWORD *)(v60 + 36) != v67) {
        goto LABEL_53;
      }
      uint64_t v70 = sub_22579FAC8();
      uint64_t v72 = v71;
      uint64_t v147 = v63;
      unint64_t v74 = *(void *)(v63 + 16);
      unint64_t v73 = *(void *)(v63 + 24);
      if (v74 >= v73 >> 1)
      {
        sub_2257827A8(v73 > 1, v74 + 1, 1);
        uint64_t v63 = v147;
      }
      *(void *)(v63 + 16) = v74 + 1;
      unint64_t v75 = v63 + 16 * v74;
      *(void *)(v75 + 32) = v70;
      *(void *)(v75 + 40) = v72;
      uint64_t result = sub_2257832F4(v65, v67, v69 & 1, v60);
      int64_t v65 = result;
      int v67 = v76;
      char v69 = v77 & 1;
      --v62;
      a6 = v145;
      if (!v62)
      {
        sub_225783FD4(result, v76, v77 & 1);
        swift_bridgeObjectRelease();
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v63 = MEMORY[0x263F8EE78];
LABEL_18:
    uint64_t v147 = v63;
    uint64_t v78 = MEMORY[0x263F8D310];
    sub_225784048(0, (unint64_t *)&qword_26ABF95C8, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
    sub_225780D64(&qword_268105718, (unint64_t *)&qword_26ABF95C8, v78);
    sub_22579F8E8();
    uint64_t v79 = v146;
    uint64_t v80 = v135;
    id v81 = v123;
    if (a6[2])
    {
      id v82 = (id)*MEMORY[0x263F450D8];
      unint64_t v83 = sub_2257824B8((uint64_t)v82);
      uint64_t v84 = v134;
      if (v85)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v80 + 16))(v81, a6[7] + *(void *)(v80 + 72) * v83, v79);
        uint64_t v86 = v80 + 56;
        uint64_t v87 = *(char **)(v80 + 56);
        id v88 = v81;
        uint64_t v89 = 0;
      }
      else
      {
        uint64_t v86 = v80 + 56;
        uint64_t v87 = *(char **)(v80 + 56);
        id v88 = v81;
        uint64_t v89 = 1;
      }
      id v136 = v87;
      uint64_t v137 = v86;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v87)(v88, v89, 1, v79);
    }
    else
    {
      id v136 = *(char **)(v135 + 56);
      uint64_t v137 = v135 + 56;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v136)(v123, 1, 1, v146);
      uint64_t v84 = v134;
    }
    uint64_t v90 = v80;
    sub_22577CF24();
    sub_22579F4F8();
    sub_2257845A8(&qword_26ABF9B00, MEMORY[0x263F07490]);
    uint64_t result = sub_22579F758();
    uint64_t v144 = 0;
    uint64_t v93 = a6[8];
    unint64_t v92 = (char *)(a6 + 8);
    uint64_t v91 = v93;
    uint64_t v94 = 1 << *(v92 - 32);
    uint64_t v95 = -1;
    if (v94 < 64) {
      uint64_t v95 = ~(-1 << v94);
    }
    unint64_t v96 = v95 & v91;
    uint64_t v97 = (void (**)(char *, char *, uint64_t))(v90 + 16);
    unint64_t v138 = (char *)(v90 + 32);
    id v98 = (uint64_t (**)(char *, uint64_t))(v90 + 8);
    uint64_t v132 = v92;
    uint64_t v133 = (char *)((unint64_t)(v94 + 63) >> 6);
    uint64_t v126 = v133 - 1;
    unint64_t v100 = v139;
    unint64_t v99 = v140;
    if ((v95 & v91) == 0) {
      goto LABEL_31;
    }
LABEL_29:
    unint64_t v106 = __clz(__rbit64(v96));
    v96 &= v96 - 1;
    unint64_t v107 = v106 | (v144 << 6);
LABEL_30:
    uint64_t v108 = v145[7];
    uint64_t v109 = *(void **)(v145[6] + 8 * v107);
    uint64_t v110 = (uint64_t)v143;
    *uint64_t v143 = v109;
    uint64_t v111 = v135;
    uint64_t v112 = v108 + *(void *)(v135 + 72) * v107;
    sub_225783F60();
    uint64_t v114 = v113;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v111 + 16))(v110 + *(int *)(v113 + 48), v112, v146);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v114 - 8) + 56))(v110, 0, 1, v114);
    id v115 = v109;
    uint64_t v84 = v134;
    while (1)
    {
      sub_2257841A8(v110, (uint64_t)v84, (uint64_t (*)(void))sub_225783F2C);
      sub_225783F60();
      if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(*(void *)(v114 - 8) + 48))(v84, 1, v114) == 1) {
        break;
      }
      uint64_t v101 = *v84;
      uint64_t v102 = v146;
      (*(void (**)(char *, char *, uint64_t))v138)(v99, (char *)v84 + *(int *)(v114 + 48), v146);
      uint64_t v103 = sub_22579FAC8();
      uint64_t v105 = v104;
      (*v97)(v100, v99, v102);
      ((void (*)(char *, void, uint64_t, uint64_t))v136)(v100, 0, 1, v102);
      uint64_t v147 = v103;
      uint64_t v148 = v105;
      sub_22579F788();

      uint64_t result = (*v98)(v99, v102);
      if (v96) {
        goto LABEL_29;
      }
LABEL_31:
      uint64_t v116 = v144 + 1;
      if (__OFADD__(v144, 1)) {
        goto LABEL_54;
      }
      uint64_t v110 = (uint64_t)v143;
      if (v116 < (uint64_t)v133)
      {
        unint64_t v117 = *(void *)&v132[8 * v116];
        if (v117) {
          goto LABEL_34;
        }
        uint64_t v118 = v144 + 2;
        ++v144;
        if (v116 + 1 < (uint64_t)v133)
        {
          unint64_t v117 = *(void *)&v132[8 * v118];
          if (v117) {
            goto LABEL_37;
          }
          uint64_t v144 = v116 + 1;
          if (v116 + 2 < (uint64_t)v133)
          {
            unint64_t v117 = *(void *)&v132[8 * v116 + 16];
            if (v117)
            {
              v116 += 2;
              goto LABEL_34;
            }
            uint64_t v118 = v116 + 3;
            uint64_t v144 = v116 + 2;
            if (v116 + 3 < (uint64_t)v133)
            {
              unint64_t v117 = *(void *)&v132[8 * v118];
              if (!v117)
              {
                while (1)
                {
                  uint64_t v116 = v118 + 1;
                  if (__OFADD__(v118, 1)) {
                    goto LABEL_55;
                  }
                  if (v116 >= (uint64_t)v133)
                  {
                    uint64_t v144 = (uint64_t)v126;
                    goto LABEL_48;
                  }
                  unint64_t v117 = *(void *)&v132[8 * v116];
                  ++v118;
                  if (v117) {
                    goto LABEL_34;
                  }
                }
              }
LABEL_37:
              uint64_t v116 = v118;
LABEL_34:
              unint64_t v96 = (v117 - 1) & v117;
              unint64_t v107 = __clz(__rbit64(v117)) + (v116 << 6);
              uint64_t v144 = v116;
              goto LABEL_30;
            }
          }
        }
      }
LABEL_48:
      sub_225783F60();
      uint64_t v114 = v119;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v119 - 8) + 56))(v110, 1, 1, v119);
      unint64_t v96 = 0;
    }
    sub_22578441C(v127, (uint64_t (*)(void))sub_2257382E8);
    sub_22578441C(v128, (uint64_t (*)(void))sub_2257382E8);
    (*(void (**)(uint64_t, uint64_t))(v120 + 8))(v129, v121);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v122 + 32))(v131 + v130[10], v142, v141);
  }
  return result;
}

void sub_22577F7E0(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  sub_2257382E8(0);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v27 - v7;
  uint64_t v9 = sub_22579F398();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_msgSend(a1, sel_version);
  uint64_t v13 = (char *)objc_msgSend(v12, sel_integerValue);

  id v14 = objc_msgSend(a1, sel_sampleUUID);
  sub_22579F378();

  id v15 = objc_msgSend(a1, sel_educationalStepsReviewDate);
  if (v15)
  {
    uint64_t v16 = v15;
    sub_22579F2F8();

    uint64_t v17 = sub_22579F338();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v8, 0, 1, v17);
  }
  else
  {
    uint64_t v18 = sub_22579F338();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
  }
  id v19 = objc_msgSend(a1, sel_configurationStepsReviewDate);
  if (v19)
  {
    uint64_t v20 = v19;
    sub_22579F2F8();

    uint64_t v21 = sub_22579F338();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v6, 0, 1, v21);
  }
  else
  {
    uint64_t v22 = sub_22579F338();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v6, 1, 1, v22);
  }
  id v23 = objc_msgSend(a1, sel_pregnancyAdjustedFeaturesSet);
  type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
  sub_2257845A8(&qword_268105290, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
  uint64_t v24 = (char *)sub_22579FBE8();

  id v25 = objc_msgSend(a1, sel_postPregnancyFeatureAdjustmentCompletionLog);
  sub_22579F338();
  uint64_t v26 = (void *)sub_22579FA38();

  sub_22577E894(v13, (uint64_t)v11, (uint64_t)v8, (uint64_t)v6, v24, v26, v28);
}

uint64_t sub_22577FB44()
{
  strcpy((char *)&xmmword_268107080, "modelVersion");
  BYTE13(xmmword_268107080) = 0;
  HIWORD(xmmword_268107080) = -5120;
  qword_268107090 = swift_getKeyPath();
  unk_268107098 = 0x5555656C706D6173;
  *(void *)&xmmword_2681070A0 = 0xEA00000000004449;
  *((void *)&xmmword_2681070A0 + 1) = swift_getKeyPath();
  unk_2681070B0 = 0xD000000000000020;
  qword_2681070B8 = 0x80000002257A8410;
  *(void *)&xmmword_2681070C0 = swift_getKeyPath();
  *((void *)&xmmword_2681070C0 + 1) = 0xD000000000000022;
  qword_2681070D0 = 0x80000002257A8440;
  qword_2681070D8 = swift_getKeyPath();
  unk_2681070E0 = 0xD00000000000001CLL;
  qword_2681070E8 = 0x80000002257A8470;
  qword_2681070F0 = swift_getKeyPath();
  unk_2681070F8 = 0xD00000000000002CLL;
  *(void *)&xmmword_268107100 = 0x80000002257A8490;
  *((void *)&xmmword_268107100 + 1) = swift_getKeyPath();
  unk_268107110 = 0xD00000000000002BLL;
  qword_268107118 = 0x80000002257A84C0;
  uint64_t result = swift_getKeyPath();
  qword_268107120 = result;
  return result;
}

uint64_t sub_22577FC90(char a1)
{
  if (a1) {
    return 0xD000000000000010;
  }
  else {
    return 0x6974656C706D6F63;
  }
}

BOOL sub_22577FCD8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_22577FCF0()
{
  return sub_2257A0128();
}

uint64_t sub_22577FD3C()
{
  return sub_2257A0118();
}

uint64_t sub_22577FD6C()
{
  return sub_2257A0128();
}

void *sub_22577FDB4@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == -1) {
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

void sub_22577FDD4(uint64_t *a1@<X8>)
{
  *a1 = (uint64_t)((unint64_t)*v1 << 63) >> 63;
}

uint64_t sub_22577FDE4()
{
  return sub_22577FC90(*v0);
}

uint64_t sub_22577FDEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_225784210(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22577FE14()
{
  return (uint64_t)((unint64_t)*v0 << 63) >> 63;
}

uint64_t sub_22577FE24@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  if (result == -1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!result) {
    char v2 = 0;
  }
  *a2 = v2;
  return result;
}

void sub_22577FE40(void *a1@<X8>)
{
  *a1 = &unk_26D8E4B30;
}

uint64_t sub_22577FE50(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_225780BC4();
  unint64_t v5 = sub_225780C1C();
  return MEMORY[0x270F180C8](a1, a2, v4, v5);
}

uint64_t sub_22577FEA8(uint64_t a1)
{
  unint64_t v2 = sub_225780C1C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22577FEE4(uint64_t a1)
{
  unint64_t v2 = sub_225780C1C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_22577FF20(void *a1)
{
  uint64_t v3 = v1;
  sub_22578447C(0, &qword_268105788, MEMORY[0x263F8E0C0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v11[-v8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_225780C1C();
  sub_2257A0148();
  char v13 = 0;
  sub_22579F338();
  sub_2257845A8(&qword_268105790, MEMORY[0x263F07490]);
  sub_2257A0008();
  if (!v2)
  {
    uint64_t v12 = *(void *)(v3 + *(int *)(type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord(0) + 20));
    v11[15] = 1;
    sub_225784310(0, &qword_268105770, MEMORY[0x263F8D060]);
    sub_2257844E0(&qword_268105798, (void (*)(void))sub_225784574);
    sub_2257A0008();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_22578015C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v26 = sub_22579F338();
  uint64_t v23 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22578447C(0, &qword_268105760, MEMORY[0x263F8E040]);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v24 = v6;
  uint64_t v25 = v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v20 - v8;
  uint64_t v10 = type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord(0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_225780C1C();
  sub_2257A0138();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v21 = v10;
  char v13 = v12;
  uint64_t v14 = v23;
  char v29 = 0;
  sub_2257845A8(&qword_268105768, MEMORY[0x263F07490]);
  uint64_t v15 = v26;
  uint64_t v16 = v24;
  sub_22579FFF8();
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  uint64_t v20 = (uint64_t)v13;
  v17(v13, v5, v15);
  sub_225784310(0, &qword_268105770, MEMORY[0x263F8D060]);
  char v28 = 1;
  sub_2257844E0(&qword_268105778, (void (*)(void))sub_225784380);
  sub_22579FFF8();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v16);
  uint64_t v18 = v20;
  *(void *)(v20 + *(int *)(v21 + 20)) = v27;
  sub_2257843B4(v18, v22, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_22578441C(v18, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
}

uint64_t sub_225780550(uint64_t a1)
{
  sub_2257A0108();
  sub_22579F338();
  sub_2257845A8(&qword_268105738, MEMORY[0x263F07490]);
  sub_22579FA58();
  uint64_t v3 = *(void *)(v1 + *(int *)(a1 + 20));
  swift_bridgeObjectRetain();
  sub_225782DBC(v5, v3);
  swift_bridgeObjectRelease();
  return sub_2257A0128();
}

uint64_t sub_225780608(long long *a1, uint64_t a2)
{
  sub_22579F338();
  sub_2257845A8(&qword_268105738, MEMORY[0x263F07490]);
  sub_22579FA58();
  uint64_t v5 = *(void *)(v2 + *(int *)(a2 + 20));
  swift_bridgeObjectRetain();
  sub_225782DBC(a1, v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2257806B4(uint64_t a1, uint64_t a2)
{
  sub_2257A0108();
  sub_22579F338();
  sub_2257845A8(&qword_268105738, MEMORY[0x263F07490]);
  sub_22579FA58();
  uint64_t v4 = *(void *)(v2 + *(int *)(a2 + 20));
  swift_bridgeObjectRetain();
  sub_225782DBC(v6, v4);
  swift_bridgeObjectRelease();
  return sub_2257A0128();
}

uint64_t sub_225780768(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((sub_22579F2E8() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = *(void *)(a1 + v6);
  uint64_t v8 = *(void *)(a2 + v6);
  return sub_225781F44(v7, v8);
}

uint64_t sub_2257807D4()
{
  return 0;
}

uint64_t sub_2257807DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22578015C(a1, a2);
}

uint64_t sub_2257807F4(void *a1)
{
  return sub_22577FF20(a1);
}

uint64_t sub_22578080C@<X0>(uint64_t a1@<X8>)
{
  return sub_2257843B4(v1, a1, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
}

uint64_t sub_225780844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22577CE24();
  uint64_t v7 = sub_225780DC0();
  return MEMORY[0x270F17D90](a1, a2, a3, v6, v7);
}

uint64_t sub_2257808B8()
{
  return sub_22579F838();
}

uint64_t sub_225780938()
{
  return sub_22579F848();
}

uint64_t sub_2257809B4(uint64_t a1)
{
  uint64_t v2 = sub_2257845A8(&qword_2681057A8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
  return MEMORY[0x270F17688](a1, v2);
}

uint64_t sub_225780A34()
{
  return sub_2257845A8(&qword_26ABF9700, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
}

uint64_t sub_225780A80()
{
  return sub_2257845A8(&qword_268105650, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
}

uint64_t sub_225780AC8()
{
  return sub_2257845A8(&qword_268105658, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
}

unint64_t sub_225780B14()
{
  unint64_t result = qword_268105660;
  if (!qword_268105660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268105660);
  }
  return result;
}

unint64_t sub_225780B6C()
{
  unint64_t result = qword_268105668;
  if (!qword_268105668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268105668);
  }
  return result;
}

unint64_t sub_225780BC4()
{
  unint64_t result = qword_268105670;
  if (!qword_268105670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268105670);
  }
  return result;
}

unint64_t sub_225780C1C()
{
  unint64_t result = qword_268105678;
  if (!qword_268105678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268105678);
  }
  return result;
}

unint64_t sub_225780C74()
{
  unint64_t result = qword_268105680;
  if (!qword_268105680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268105680);
  }
  return result;
}

unint64_t sub_225780CCC()
{
  unint64_t result = qword_268105688;
  if (!qword_268105688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268105688);
  }
  return result;
}

uint64_t sub_225780D20()
{
  return sub_225780D64(&qword_268105690, &qword_268105698, (uint64_t)&type metadata for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys);
}

uint64_t sub_225780D64(unint64_t *a1, unint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_225784048(255, a2, a3, MEMORY[0x263F8D488]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_225780DC0()
{
  return sub_2257845A8(&qword_2681056A0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
}

uint64_t sub_225780DF4()
{
  return sub_22579F698();
}

uint64_t sub_225780E74()
{
  return sub_22579F6E8();
}

uint64_t sub_225780EEC(uint64_t a1)
{
  uint64_t v2 = sub_2257845A8(&qword_2681056F8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  return MEMORY[0x270F17290](a1, v2);
}

double sub_225780F6C@<D0>(uint64_t a1@<X8>)
{
  if (qword_268105150 != -1) {
    swift_once();
  }
  long long v22 = xmmword_268107100;
  *(_OWORD *)uint64_t v23 = *(_OWORD *)&qword_268107110;
  *(void *)&v23[16] = qword_268107120;
  *(_OWORD *)&v19[16] = xmmword_2681070C0;
  long long v20 = *(_OWORD *)&qword_2681070D0;
  *(_OWORD *)uint64_t v21 = *(_OWORD *)&qword_2681070E0;
  *(_OWORD *)&v21[16] = *(_OWORD *)&qword_2681070F0;
  *(_OWORD *)uint64_t v17 = xmmword_268107080;
  *(_OWORD *)&v17[16] = *(_OWORD *)&qword_268107090;
  long long v18 = xmmword_2681070A0;
  *(_OWORD *)id v19 = *(_OWORD *)&qword_2681070B0;
  uint64_t v2 = xmmword_268107080;
  uint64_t v3 = unk_268107098;
  uint64_t v4 = qword_2681070B0;
  uint64_t v5 = *((void *)&xmmword_2681070C0 + 1);
  uint64_t v6 = qword_2681070E0;
  uint64_t v7 = unk_2681070F8;
  uint64_t v8 = qword_268107110;
  long long v10 = *(_OWORD *)&v17[8];
  long long v11 = xmmword_2681070A0;
  long long v12 = *(_OWORD *)&v19[8];
  long long v13 = *(_OWORD *)&qword_2681070D0;
  long long v14 = *(_OWORD *)&v21[8];
  long long v15 = xmmword_268107100;
  long long v16 = *(_OWORD *)&v23[8];
  sub_225783E44((uint64_t)v17);
  *(void *)a1 = v2;
  *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x4A8], 8) = v10;
  *(void *)(a1 + 24) = v3;
  *(_OWORD *)(a1 + 32) = v11;
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x4A8], 8) = v4;
  *(_OWORD *)(a1 + 56) = v12;
  *(void *)(a1 + 72) = v5;
  *(_OWORD *)(a1 + 80) = v13;
  *(void *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 104) = v14;
  *(void *)(a1 + 120) = v7;
  *(_OWORD *)(a1 + 12_Block_object_dispose(&STACK[0x4A8], 8) = v15;
  *(void *)(a1 + 144) = v8;
  double result = *(double *)&v16;
  *(_OWORD *)(a1 + 152) = v16;
  return result;
}

uint64_t sub_2257810C4(uint64_t a1)
{
  uint64_t v2 = sub_2257845A8(&qword_2681056F8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  return MEMORY[0x270F17300](a1, v2);
}

uint64_t sub_225781130()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_22578113C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(int *)(a2 + 44);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + v4) = a1;
  return result;
}

uint64_t (*sub_225781174())()
{
  return nullsub_1;
}

uint64_t sub_225781198@<X0>(uint64_t a1@<X8>)
{
  sub_2257382E8(0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v15 - v6;
  uint64_t v8 = sub_22579F398();
  MEMORY[0x270FA5388](v8 - 8);
  long long v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22579F388();
  uint64_t v11 = sub_22579F338();
  long long v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  v12(v7, 1, 1, v11);
  v12(v5, 1, 1, v11);
  long long v13 = (void *)sub_22577E698(MEMORY[0x263F8EE78]);
  return sub_22577E894((char *)2, (uint64_t)v10, (uint64_t)v7, (uint64_t)v5, MEMORY[0x263F8EE88], v13, a1);
}

uint64_t sub_225781318(uint64_t a1)
{
  uint64_t v2 = sub_2257845A8(&qword_26ABF97B8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  return MEMORY[0x270F17CC8](a1, v2);
}

uint64_t sub_225781384(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2257845A8(&qword_2681056F8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  return MEMORY[0x270F172A0](a1, a2, v4);
}

uint64_t sub_225781408(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2257845A8(&qword_2681056F8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  return MEMORY[0x270F172C8](a1, a2, v4);
}

uint64_t sub_225781484(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2257845A8(&qword_2681056F8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  return MEMORY[0x270F172F8](a1, a2, v4);
}

uint64_t sub_225781500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2257845A8(&qword_2681056F8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  return MEMORY[0x270F172D0](a1, a2, a3, v6);
}

uint64_t sub_225781594(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2257845A8(&qword_2681056F8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  return MEMORY[0x270F172F0](a1, a2, v4);
}

uint64_t sub_225781610(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2257845A8(&qword_2681056F8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  return MEMORY[0x270F172D8](a1, a2, v4);
}

uint64_t sub_22578168C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2257845A8(&qword_2681056F8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  return MEMORY[0x270F172B8](a1, a2, v4);
}

uint64_t sub_225781710(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2257845A8(&qword_2681056F8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  return MEMORY[0x270F172B0](a1, a2, v4);
}

uint64_t sub_225781794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2257845A8(&qword_2681056F8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  return MEMORY[0x270F17298](a1, a2, a3, v6);
}

uint64_t sub_225781828(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2257845A8(&qword_2681056F8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  return MEMORY[0x270F17280](a1, a2, v4);
}

uint64_t sub_2257818A4(uint64_t a1)
{
  uint64_t v2 = sub_2257845A8(&qword_2681056F8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  return MEMORY[0x270F172A8](a1, v2);
}

uint64_t sub_225781910(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2257845A8(&qword_2681056F8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  return MEMORY[0x270F17288](a1, a2, v4);
}

uint64_t sub_22578198C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2257845A8(&qword_2681056F8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  return MEMORY[0x270F172E0](a1, a2, v4);
}

uint64_t sub_225781A08()
{
  return sub_22579F898();
}

uint64_t sub_225781A88()
{
  return sub_22579F8A8();
}

uint64_t sub_225781B18()
{
  return sub_2257845A8(&qword_26ABF97C0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
}

uint64_t sub_225781B60()
{
  return sub_2257845A8(&qword_26ABF97B0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
}

uint64_t sub_225781BA8()
{
  return sub_2257845A8(&qword_2681056A8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
}

uint64_t sub_225781BF0()
{
  return sub_2257845A8(&qword_2681056B0, (void (*)(uint64_t))sub_22577CC80);
}

uint64_t sub_225781C38()
{
  return sub_2257845A8(&qword_2681056B8, (void (*)(uint64_t))sub_22577CCE0);
}

uint64_t sub_225781C80()
{
  return sub_2257845A8(&qword_2681056C0, (void (*)(uint64_t))sub_22577CD40);
}

uint64_t sub_225781CC8()
{
  return sub_2257845A8(&qword_2681056C8, (void (*)(uint64_t))sub_22577CE58);
}

uint64_t sub_225781D10()
{
  return sub_2257845A8(&qword_2681056D0, (void (*)(uint64_t))sub_22577CEC0);
}

uint64_t sub_225781D58()
{
  return sub_2257845A8(&qword_2681056D8, (void (*)(uint64_t))sub_22577CF8C);
}

uint64_t sub_225781DA0()
{
  return sub_2257845A8(&qword_2681056E0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
}

uint64_t sub_225781DE8()
{
  return sub_2257845A8(&qword_26ABF96F0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
}

uint64_t sub_225781E30()
{
  return sub_2257845A8(&qword_26ABF97A8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
}

uint64_t sub_225781E78()
{
  return sub_2257845A8(&qword_26ABF97B8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
}

uint64_t sub_225781EC0()
{
  return sub_2257845A8(&qword_2681056E8, sub_225781F08);
}

void sub_225781F08(uint64_t a1)
{
}

uint64_t sub_225781F44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22579F4A8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v50 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v43 - v8;
  sub_225784108(0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  long long v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v11);
  long long v16 = (int64_t *)((char *)&v43 - v15);
  if (a1 == a2) {
    return 1;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v46 = a1;
  uint64_t v19 = *(void *)(a1 + 64);
  uint64_t v18 = a1 + 64;
  uint64_t v17 = v19;
  uint64_t v20 = 1 << *(unsigned char *)(v18 - 32);
  uint64_t v21 = -1;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  unint64_t v22 = v21 & v17;
  int64_t v51 = 0;
  uint64_t v52 = v5 + 16;
  uint64_t v48 = (void (**)(char *, char *, uint64_t))(v5 + 32);
  uint64_t v49 = a2;
  uint64_t v47 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v44 = v18;
  int64_t v45 = (unint64_t)(v20 + 63) >> 6;
  int64_t v43 = v45 - 1;
  while (1)
  {
    if (v22)
    {
      unint64_t v23 = __clz(__rbit64(v22));
      v22 &= v22 - 1;
      unint64_t v24 = v23 | (v51 << 6);
      uint64_t v25 = v49;
LABEL_8:
      uint64_t v26 = *(void *)(v46 + 56);
      *(void *)long long v13 = *(void *)(*(void *)(v46 + 48) + 8 * v24);
      uint64_t v27 = v26 + *(void *)(v5 + 72) * v24;
      sub_22578413C();
      uint64_t v29 = v28;
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(&v13[*(int *)(v28 + 48)], v27, v4);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v13, 0, 1, v29);
      goto LABEL_30;
    }
    int64_t v30 = v51 + 1;
    uint64_t v25 = v49;
    if (__OFADD__(v51, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v30 < v45)
    {
      unint64_t v31 = *(void *)(v44 + 8 * v30);
      if (v31) {
        goto LABEL_12;
      }
      int64_t v32 = v51 + 2;
      ++v51;
      if (v30 + 1 < v45)
      {
        unint64_t v31 = *(void *)(v44 + 8 * v32);
        if (v31) {
          goto LABEL_15;
        }
        int64_t v51 = v30 + 1;
        if (v30 + 2 < v45)
        {
          unint64_t v31 = *(void *)(v44 + 8 * (v30 + 2));
          if (v31)
          {
            v30 += 2;
            goto LABEL_12;
          }
          int64_t v51 = v30 + 2;
          if (v30 + 3 < v45)
          {
            unint64_t v31 = *(void *)(v44 + 8 * (v30 + 3));
            if (v31)
            {
              v30 += 3;
              goto LABEL_12;
            }
            int64_t v32 = v30 + 4;
            int64_t v51 = v30 + 3;
            if (v30 + 4 < v45) {
              break;
            }
          }
        }
      }
    }
LABEL_29:
    sub_22578413C();
    uint64_t v29 = v33;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v13, 1, 1, v33);
    unint64_t v22 = 0;
LABEL_30:
    sub_2257841A8((uint64_t)v13, (uint64_t)v16, (uint64_t (*)(void))sub_225784108);
    sub_22578413C();
    int v34 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v29 - 8) + 48))(v16, 1, v29);
    BOOL v35 = v34 == 1;
    if (v34 == 1) {
      return v35;
    }
    uint64_t v36 = (char *)v16 + *(int *)(v29 + 48);
    uint64_t v37 = *v16;
    (*v48)(v9, v36, v4);
    unint64_t v38 = sub_225782474(v37);
    if ((v39 & 1) == 0)
    {
      (*v47)(v9, v4);
      return 0;
    }
    uint64_t v40 = v50;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v50, *(void *)(v25 + 56) + *(void *)(v5 + 72) * v38, v4);
    sub_2257845A8(&qword_268105758, MEMORY[0x263F32C08]);
    char v41 = sub_22579FA88();
    uint64_t v42 = *(void (**)(char *, uint64_t))(v5 + 8);
    v42(v40, v4);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v42)(v9, v4);
    if ((v41 & 1) == 0) {
      return v35;
    }
  }
  unint64_t v31 = *(void *)(v44 + 8 * v32);
  if (v31)
  {
LABEL_15:
    int64_t v30 = v32;
LABEL_12:
    unint64_t v22 = (v31 - 1) & v31;
    unint64_t v24 = __clz(__rbit64(v31)) + (v30 << 6);
    int64_t v51 = v30;
    goto LABEL_8;
  }
  while (1)
  {
    int64_t v30 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v30 >= v45)
    {
      int64_t v51 = v43;
      goto LABEL_29;
    }
    unint64_t v31 = *(void *)(v44 + 8 * v30);
    ++v32;
    if (v31) {
      goto LABEL_12;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

unint64_t sub_225782474(uint64_t a1)
{
  uint64_t v2 = sub_2257A00F8();
  return sub_22578254C(a1, v2);
}

unint64_t sub_2257824B8(uint64_t a1)
{
  sub_22579FAC8();
  sub_2257A0108();
  sub_22579FAF8();
  uint64_t v2 = sub_2257A0128();
  swift_bridgeObjectRelease();
  return sub_2257825E8(a1, v2);
}

unint64_t sub_22578254C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_2257825E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_22579FAC8();
    uint64_t v8 = v7;
    if (v6 == sub_22579FAC8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_2257A0068();
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
          uint64_t v13 = sub_22579FAC8();
          uint64_t v15 = v14;
          if (v13 == sub_22579FAC8() && v15 == v16) {
            break;
          }
          char v18 = sub_2257A0068();
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

uint64_t sub_225782760(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2257829BC(a1, a2, a3, (void *)*v3, sub_225784624, type metadata accessor for CoherentExperienceSetupRecord);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2257827A8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_225782830(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2257827C8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2257829BC(a1, a2, a3, (void *)*v3, sub_2257845F0, (uint64_t (*)(void))sub_22572BEA0);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_225782810(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_225782C08(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_225782830(char a1, int64_t a2, char a3, char *a4)
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
    sub_225784048(0, &qword_26ABF95E0, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
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
  uint64_t result = sub_22579FFD8();
  __break(1u);
  return result;
}

uint64_t sub_2257829BC(char a1, int64_t a2, char a3, void *a4, void (*a5)(void), uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  a5(0);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  id v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  unint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  unint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_22579FFD8();
  __break(1u);
  return result;
}

uint64_t sub_225782C08(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_225738284(0, &qword_2681057B8, (uint64_t (*)(uint64_t))type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier, MEMORY[0x263F8E0F8]);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_22579FFD8();
  __break(1u);
  return result;
}

uint64_t sub_225782DBC(long long *a1, uint64_t a2)
{
  uint64_t v4 = sub_22579F4A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v42 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225784108(0);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  int64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v36 - v11;
  uint64_t v13 = *(void *)(a2 + 64);
  uint64_t v37 = a2 + 64;
  uint64_t v14 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & v13;
  uint64_t v39 = v5 + 16;
  uint64_t v40 = v5;
  int64_t v43 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v44 = (void (**)(char *, char *, uint64_t))(v5 + 32);
  int64_t v38 = (unint64_t)(v14 + 63) >> 6;
  int64_t v36 = v38 - 1;
  uint64_t v41 = a2;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v18 = 0;
  int64_t v45 = 0;
  uint64_t v19 = v40;
  if (!v16) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v20 = v18;
  unint64_t v21 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  unint64_t v22 = v21 | (v45 << 6);
LABEL_5:
  uint64_t v23 = *(void *)(*(void *)(v41 + 48) + 8 * v22);
  unint64_t v24 = *(void *)(v41 + 56) + *(void *)(v19 + 72) * v22;
  sub_22578413C();
  uint64_t v26 = v25;
  (*(void (**)(char *, unint64_t, uint64_t))(v19 + 16))(&v10[*(int *)(v25 + 48)], v24, v4);
  *(void *)int64_t v10 = v23;
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v10, 0, 1, v26);
  uint64_t v18 = v20;
  while (1)
  {
    sub_2257841A8((uint64_t)v10, (uint64_t)v12, (uint64_t (*)(void))sub_225784108);
    sub_22578413C();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 48))(v12, 1, v26) == 1)
    {
      swift_release();
      return sub_2257A0118();
    }
    int64_t v32 = v42;
    (*v44)(v42, &v12[*(int *)(v26 + 48)], v4);
    uint64_t v33 = *((void *)a1 + 8);
    long long v34 = a1[1];
    long long v46 = *a1;
    long long v47 = v34;
    long long v35 = a1[3];
    long long v48 = a1[2];
    long long v49 = v35;
    uint64_t v50 = v33;
    sub_2257A0118();
    sub_2257845A8(&qword_268105750, MEMORY[0x263F32C08]);
    sub_22579FA58();
    (*v43)(v32, v4);
    uint64_t result = sub_2257A0128();
    v18 ^= result;
    if (v16) {
      goto LABEL_4;
    }
LABEL_6:
    int64_t v27 = v45 + 1;
    if (__OFADD__(v45, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v27 < v38)
    {
      unint64_t v28 = *(void *)(v37 + 8 * v27);
      if (v28) {
        goto LABEL_9;
      }
      int64_t v29 = v45 + 2;
      ++v45;
      if (v27 + 1 < v38)
      {
        unint64_t v28 = *(void *)(v37 + 8 * v29);
        if (v28)
        {
          ++v27;
LABEL_9:
          uint64_t v20 = v18;
          unint64_t v16 = (v28 - 1) & v28;
          unint64_t v22 = __clz(__rbit64(v28)) + (v27 << 6);
          int64_t v45 = v27;
          goto LABEL_5;
        }
        int64_t v30 = v27 + 2;
        int64_t v45 = v27 + 1;
        if (v27 + 2 < v38) {
          break;
        }
      }
    }
LABEL_21:
    sub_22578413C();
    uint64_t v26 = v31;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v10, 1, 1, v31);
    unint64_t v16 = 0;
  }
  unint64_t v28 = *(void *)(v37 + 8 * v30);
  if (v28)
  {
    v27 += 2;
    goto LABEL_9;
  }
  while (1)
  {
    int64_t v27 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v27 >= v38)
    {
      int64_t v45 = v36;
      goto LABEL_21;
    }
    unint64_t v28 = *(void *)(v37 + 8 * v27);
    ++v30;
    if (v28) {
      goto LABEL_9;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_225783250(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

int64_t sub_2257832F4(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

unint64_t sub_2257833D8(uint64_t a1)
{
  sub_225783FE0();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (uint64_t *)((char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = *(void *)(a1 + 16);
  if (v7)
  {
    sub_225784310(0, &qword_268105728, MEMORY[0x263F8DFB0]);
    unint64_t v8 = (void *)sub_22579FFB8();
    unint64_t v9 = (char *)v6 + *(int *)(v3 + 48);
    uint64_t v10 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v11 = *(void *)(v4 + 72);
    while (1)
    {
      sub_2257843B4(v10, (uint64_t)v6, (uint64_t (*)(void))sub_225783FE0);
      uint64_t v12 = *v6;
      unint64_t result = sub_225782474(*v6);
      if (v14) {
        break;
      }
      unint64_t v15 = result;
      *(void *)((char *)v8 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v8[6] + 8 * result) = v12;
      uint64_t v16 = v8[7];
      uint64_t v17 = sub_22579F4A8();
      unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v16 + *(void *)(*(void *)(v17 - 8) + 72) * v15, v9, v17);
      uint64_t v18 = v8[2];
      BOOL v19 = __OFADD__(v18, 1);
      uint64_t v20 = v18 + 1;
      if (v19) {
        goto LABEL_10;
      }
      v8[2] = v20;
      v10 += v11;
      if (!--v7) {
        return (unint64_t)v8;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

uint64_t sub_2257835C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CoherentExperienceSetupRecord(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v44 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v51 = (uint64_t)&v44 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)&v44 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v49 = (uint64_t)&v44 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v50 = (uint64_t)&v44 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v47 = (uint64_t)&v44 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v48 = (uint64_t)&v44 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v44 - v25;
  MEMORY[0x270FA5388](v24);
  unint64_t v28 = (char *)&v44 - v27;
  char v29 = sub_22579F4D8();
  sub_2257843B4(a1, (uint64_t)v28, type metadata accessor for CoherentExperienceSetupRecord);
  sub_2257843B4(a2, (uint64_t)v26, type metadata accessor for CoherentExperienceSetupRecord);
  if ((v29 & 1) == 0)
  {
    sub_22578441C((uint64_t)v26, type metadata accessor for CoherentExperienceSetupRecord);
    sub_22578441C((uint64_t)v28, type metadata accessor for CoherentExperienceSetupRecord);
    uint64_t v31 = v48;
    sub_2257843B4(a1, v48, type metadata accessor for CoherentExperienceSetupRecord);
    uint64_t v32 = v47;
    sub_2257843B4(a2, v47, type metadata accessor for CoherentExperienceSetupRecord);
    goto LABEL_8;
  }
  uint64_t v46 = v4;
  sub_22579F398();
  sub_2257845A8(&qword_268105628, MEMORY[0x263F07508]);
  char v30 = sub_22579F4D8();
  sub_22578441C((uint64_t)v26, type metadata accessor for CoherentExperienceSetupRecord);
  sub_22578441C((uint64_t)v28, type metadata accessor for CoherentExperienceSetupRecord);
  uint64_t v31 = v48;
  sub_2257843B4(a1, v48, type metadata accessor for CoherentExperienceSetupRecord);
  uint64_t v32 = v47;
  sub_2257843B4(a2, v47, type metadata accessor for CoherentExperienceSetupRecord);
  if ((v30 & 1) == 0)
  {
LABEL_8:
    sub_22578441C(v32, type metadata accessor for CoherentExperienceSetupRecord);
    sub_22578441C(v31, type metadata accessor for CoherentExperienceSetupRecord);
    uint64_t v37 = v50;
    sub_2257843B4(a1, v50, type metadata accessor for CoherentExperienceSetupRecord);
    uint64_t v38 = v49;
    sub_2257843B4(a2, v49, type metadata accessor for CoherentExperienceSetupRecord);
    goto LABEL_9;
  }
  uint64_t v33 = *(int *)(v46 + 24);
  uint64_t v44 = v32 + v33;
  uint64_t v45 = v31 + v33;
  sub_225738284(0, &qword_26ABF9740, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord, MEMORY[0x263F8D8F0]);
  uint64_t v35 = v34;
  uint64_t v36 = sub_225783DA8((unint64_t *)&qword_26ABF9748, (void (*)(void))sub_22577CE24);
  sub_225783DA8(&qword_268105700, (void (*)(void))sub_225780DC0);
  uint64_t v44 = v36;
  uint64_t v45 = v35;
  LOBYTE(v35) = sub_22579F4D8();
  sub_22578441C(v32, type metadata accessor for CoherentExperienceSetupRecord);
  sub_22578441C(v31, type metadata accessor for CoherentExperienceSetupRecord);
  uint64_t v37 = v50;
  sub_2257843B4(a1, v50, type metadata accessor for CoherentExperienceSetupRecord);
  uint64_t v38 = v49;
  sub_2257843B4(a2, v49, type metadata accessor for CoherentExperienceSetupRecord);
  if ((v35 & 1) == 0)
  {
LABEL_9:
    sub_22578441C(v38, type metadata accessor for CoherentExperienceSetupRecord);
    sub_22578441C(v37, type metadata accessor for CoherentExperienceSetupRecord);
    sub_2257843B4(a1, (uint64_t)v15, type metadata accessor for CoherentExperienceSetupRecord);
    uint64_t v40 = v51;
    sub_2257843B4(a2, v51, type metadata accessor for CoherentExperienceSetupRecord);
    goto LABEL_10;
  }
  char v39 = sub_22579F4D8();
  sub_22578441C(v38, type metadata accessor for CoherentExperienceSetupRecord);
  sub_22578441C(v37, type metadata accessor for CoherentExperienceSetupRecord);
  sub_2257843B4(a1, (uint64_t)v15, type metadata accessor for CoherentExperienceSetupRecord);
  uint64_t v40 = v51;
  sub_2257843B4(a2, v51, type metadata accessor for CoherentExperienceSetupRecord);
  if ((v39 & 1) == 0)
  {
LABEL_10:
    sub_22578441C(v40, type metadata accessor for CoherentExperienceSetupRecord);
    sub_22578441C((uint64_t)v15, type metadata accessor for CoherentExperienceSetupRecord);
    sub_2257843B4(a1, (uint64_t)v10, type metadata accessor for CoherentExperienceSetupRecord);
    sub_2257843B4(a2, (uint64_t)v7, type metadata accessor for CoherentExperienceSetupRecord);
    goto LABEL_11;
  }
  char v41 = sub_22579F8B8();
  sub_22578441C(v40, type metadata accessor for CoherentExperienceSetupRecord);
  sub_22578441C((uint64_t)v15, type metadata accessor for CoherentExperienceSetupRecord);
  sub_2257843B4(a1, (uint64_t)v10, type metadata accessor for CoherentExperienceSetupRecord);
  sub_2257843B4(a2, (uint64_t)v7, type metadata accessor for CoherentExperienceSetupRecord);
  if ((v41 & 1) == 0)
  {
LABEL_11:
    char v42 = 0;
    goto LABEL_12;
  }
  sub_22579F338();
  sub_2257845A8(&qword_26ABF9B00, MEMORY[0x263F07490]);
  char v42 = sub_22579F738();
LABEL_12:
  sub_22578441C((uint64_t)v7, type metadata accessor for CoherentExperienceSetupRecord);
  sub_22578441C((uint64_t)v10, type metadata accessor for CoherentExperienceSetupRecord);
  return v42 & 1;
}

uint64_t sub_225783DA8(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_225738284(255, &qword_26ABF9740, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord, MEMORY[0x263F8D8F0]);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_225783E44(uint64_t a1)
{
  return a1;
}

void sub_225783F2C(uint64_t a1)
{
}

void sub_225783F60()
{
  if (!qword_268105710)
  {
    type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(255);
    sub_22579F338();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268105710);
    }
  }
}

uint64_t sub_225783FD4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_225783FE0()
{
  if (!qword_268105720)
  {
    sub_22579F4A8();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268105720);
    }
  }
}

void sub_225784048(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_225784098()
{
  if (!qword_268105730)
  {
    type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(255);
    sub_22579F338();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268105730);
    }
  }
}

void sub_225784108(uint64_t a1)
{
}

void sub_22578413C()
{
  if (!qword_268105748)
  {
    sub_22579F4A8();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268105748);
    }
  }
}

uint64_t sub_2257841A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_225784210(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6974656C706D6F63 && a2 == 0xEE00657461446E6FLL;
  if (v3 || (sub_2257A0068() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000002257A8550)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2257A0068();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

void sub_225784310(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, void, uint64_t, void))
{
  if (!*a2)
  {
    uint64_t v6 = sub_22579F4A8();
    unint64_t v7 = a3(a1, MEMORY[0x263F8D6C8], v6, MEMORY[0x263F8D6D8]);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_225784380()
{
  return sub_2257845A8(&qword_268105780, MEMORY[0x263F32C08]);
}

uint64_t sub_2257843B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22578441C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_22578447C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_225780C1C();
    unint64_t v7 = a3(a1, &type metadata for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_2257844E0(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_225784310(255, &qword_268105770, MEMORY[0x263F8D060]);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_225784574()
{
  return sub_2257845A8(&qword_2681057A0, MEMORY[0x263F32C08]);
}

uint64_t sub_2257845A8(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_2257845F0(uint64_t a1)
{
}

void sub_225784624(uint64_t a1)
{
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2257847C4);
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

uint64_t sub_2257847EC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2257847F4(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys()
{
  return &type metadata for CoherentExperienceSetupRecord.CompletionRecord.CodingKeys;
}

unint64_t sub_225784814()
{
  unint64_t result = qword_2681057C8;
  if (!qword_2681057C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681057C8);
  }
  return result;
}

uint64_t static HDCategorySampleEntity.deletedPregnancySamples(profile:predicate:)(uint64_t a1, uint64_t a2)
{
  v5[2] = &v6;
  uint64_t v6 = MEMORY[0x263F8EE78];
  sub_22572EC64(a1, a2, 1, (uint64_t)sub_22573C128, (uint64_t)v5);
  uint64_t v3 = v6;
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v3;
}

uint64_t String.init<A>(describingSensitive:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_225737FD8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

uint64_t sub_225784948@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v46 = a1;
  sub_2257383FC(0, (unint64_t *)&unk_26ABF9490, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v45 = (char *)v40 - v6;
  uint64_t v7 = sub_22579F398();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22579F458();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (HKShowSensitiveLogItems())
  {
    uint64_t v44 = a2;
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v15 = __swift_project_value_buffer(v11, (uint64_t)qword_26ABF94A0);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v46, v7);
    uint64_t v16 = sub_22579F438();
    os_log_type_t v17 = sub_22579FCB8();
    int v18 = v17;
    if (os_log_type_enabled(v16, v17))
    {
      int v43 = v18;
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      uint64_t v49 = v42;
      *(_DWORD *)uint64_t v19 = 136315138;
      v40[1] = v19 + 12;
      char v41 = v19;
      uint64_t v47 = 0;
      unint64_t v48 = 0xE000000000000000;
      sub_22579FEB8();
      v40[0] = v19 + 4;
      sub_22579FB08();
      sub_22579FB08();
      sub_22579FB08();
      sub_22579F348();
      sub_22579FB08();
      swift_bridgeObjectRelease();
      sub_2257A0078();
      id v20 = (id)HKSensitiveLogItem();
      swift_unknownObjectRelease();
      sub_22579FD88();
      swift_unknownObjectRelease();
      uint64_t v21 = sub_22579FAD8();
      uint64_t v47 = sub_22572E428(v21, v22, &v49);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      uint64_t v23 = v41;
      _os_log_impl(&dword_225722000, v16, (os_log_type_t)v43, "%s", v41, 0xCu);
      uint64_t v24 = v42;
      swift_arrayDestroy();
      MEMORY[0x22A635470](v24, -1, -1);
      MEMORY[0x22A635470](v23, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    a2 = v44;
  }
  uint64_t v25 = v3[5];
  uint64_t v26 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v25);
  char v29 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v26 + 16))(v25, v26);
  id v30 = objc_msgSend(v29, sel_pregnancyModeSetupCompletionSet);
  sub_22572F19C(0, (unint64_t *)&qword_26ABF9A88);
  sub_22572F36C(&qword_26ABF9A90, (unint64_t *)&qword_26ABF9A88);
  uint64_t v31 = sub_22579FBE8();

  MEMORY[0x270FA5388](v32);
  v40[-2] = v46;
  sub_22578764C(sub_225786C5C, (uint64_t)&v40[-4], v31);
  uint64_t v34 = v33;
  swift_bridgeObjectRelease();
  if (v34)
  {
    id v35 = objc_msgSend(v34, sel_educationalStepsReviewDate);
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = (uint64_t)v45;
      sub_22579F2F8();

      uint64_t v38 = sub_22579F338();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v37, 0, 1, v38);
    }
    else
    {

      uint64_t v39 = sub_22579F338();
      uint64_t v37 = (uint64_t)v45;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v45, 1, 1, v39);
    }
    return sub_22577C26C(v37, a2);
  }
  else
  {

    uint64_t v27 = sub_22579F338();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(a2, 1, 1, v27);
  }
}

uint64_t sub_2257850FC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22579F338();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v22 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v22 - v12;
  id v14 = objc_msgSend(a1, sel_endDate);
  sub_22579F2F8();

  id v15 = objc_msgSend(a1, sel_startDate);
  sub_22579F2F8();

  sub_22579F2A8();
  double v17 = v16;
  int v18 = *(void (**)(char *, uint64_t))(v5 + 8);
  v18(v11, v4);
  v18(v13, v4);
  if (v17 >= *(double *)(v2 + *(int *)(type metadata accessor for HDMCPregnancyStateFactory() + 36)))
  {
    char v20 = 1;
  }
  else
  {
    sub_22579F328();
    sub_22579F318();
    v18(v13, v4);
    id v19 = objc_msgSend(a1, sel_endDate);
    sub_22579F2F8();

    sub_225786CE4(&qword_2681057D8, MEMORY[0x263F07490]);
    LOBYTE(v19) = sub_22579FA78();
    v18(v13, v4);
    v18(v8, v4);
    char v20 = v19 ^ 1;
  }
  return v20 & 1;
}

uint64_t sub_225785388(id *a1)
{
  uint64_t v2 = sub_22579F398();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(*a1, sel_sampleUUID);
  sub_22579F378();

  char v7 = sub_22579F368();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7 & 1;
}

uint64_t sub_225785494(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a1)
  {
    self;
    if (swift_dynamicCastObjCClass())
    {
      MEMORY[0x22A633FE0](a1);
      if (*(void *)((*a5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_22579FB88();
      }
      sub_22579FBA8();
      sub_22579FB78();
    }
  }
  return 1;
}

BOOL sub_225785530(id *a1, void **a2)
{
  uint64_t v4 = sub_22579F338();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v17 - v9;
  uint64_t v11 = *a2;
  id v12 = objc_msgSend(*a1, sel__creationDate);
  sub_22579F2F8();

  id v13 = objc_msgSend(v11, sel__creationDate);
  sub_22579F2F8();

  uint64_t v14 = sub_22579F308();
  id v15 = *(void (**)(char *, uint64_t))(v5 + 8);
  v15(v8, v4);
  v15(v10, v4);
  return v14 == 1;
}

void *sub_2257856A0(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      sub_22572F400();
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_225785EC0((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_22579FF88();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

void sub_225785794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void **, void **))
{
  if (a3 != a2)
  {
    uint64_t v6 = a3;
    uint64_t v7 = a1;
    uint64_t v8 = *v4;
    uint64_t v9 = (void **)(*v4 + 8 * a3 - 8);
LABEL_4:
    uint64_t v10 = *(void **)(v8 + 8 * v6);
    int v18 = v9;
    while (1)
    {
      uint64_t v21 = v10;
      char v20 = *v9;
      uint64_t v11 = v20;
      id v12 = v10;
      id v13 = v11;
      char v14 = a4(&v21, &v20);

      if (v5) {
        break;
      }
      if (v14)
      {
        if (!v8)
        {
          __break(1u);
          return;
        }
        id v15 = *v9;
        uint64_t v10 = v9[1];
        char *v9 = v10;
        v9[1] = v15;
        --v9;
        if (v6 != ++v7) {
          continue;
        }
      }
      ++v6;
      uint64_t v9 = v18 + 1;
      uint64_t v7 = a1;
      if (v6 != a2) {
        goto LABEL_4;
      }
      return;
    }
  }
}

uint64_t sub_22578589C(id *__src, id *a2, unint64_t a3, id *a4, uint64_t (*a5)(id *, void **))
{
  uint64_t v6 = v5;
  uint64_t v7 = a2;
  uint64_t v8 = __src;
  int64_t v9 = (char *)a2 - (char *)__src;
  int64_t v10 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v10 = (char *)a2 - (char *)__src;
  }
  uint64_t v11 = v10 >> 3;
  uint64_t v12 = a3 - (void)a2;
  uint64_t v13 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v13 = a3 - (void)a2;
  }
  uint64_t v14 = v13 >> 3;
  unint64_t v48 = __src;
  uint64_t v47 = a4;
  if (v11 >= v13 >> 3)
  {
    if (v12 <= -8) {
      goto LABEL_50;
    }
    if (a4 != a2 || &a2[v14] <= a4) {
      memmove(a4, a2, 8 * v14);
    }
    uint64_t v25 = (char *)&a4[v14];
    uint64_t v46 = v25;
    unint64_t v48 = v7;
    if (v8 >= v7 || v12 < 8)
    {
LABEL_49:
      sub_225785D34((void **)&v48, (const void **)&v47, &v46);
      return 1;
    }
    uint64_t v26 = (id *)(a3 - 8);
    uint64_t v27 = v7;
    uint64_t v39 = v8;
    while (1)
    {
      uint64_t v42 = v7;
      unint64_t v28 = (unint64_t)v25;
      char v29 = v25 - 8;
      id v45 = (id)*((void *)v25 - 1);
      id v30 = *--v27;
      uint64_t v44 = v30;
      id v31 = v45;
      id v32 = v30;
      char v33 = a5(&v45, &v44);
      if (v6)
      {

        goto LABEL_49;
      }
      char v34 = v33;
      id v35 = v26 + 1;

      if (v34)
      {
        uint64_t v25 = (char *)v28;
        if (v35 != v42 || v26 >= v42) {
          *uint64_t v26 = *v27;
        }
        unint64_t v48 = v27;
      }
      else
      {
        uint64_t v46 = v29;
        if ((unint64_t)v35 >= v28 && (unint64_t)v26 < v28)
        {
          unint64_t v36 = (unint64_t)v39;
          if (v35 != (id *)v28) {
            *uint64_t v26 = *(id *)v29;
          }
          uint64_t v37 = (char *)a4;
          uint64_t v27 = v42;
          uint64_t v25 = v29;
          uint64_t v6 = 0;
          goto LABEL_44;
        }
        *uint64_t v26 = *(id *)v29;
        uint64_t v27 = v42;
        uint64_t v25 = v29;
      }
      uint64_t v6 = 0;
      unint64_t v36 = (unint64_t)v39;
      uint64_t v37 = (char *)a4;
LABEL_44:
      if ((unint64_t)v27 > v36)
      {
        --v26;
        uint64_t v7 = v27;
        if (v25 > v37) {
          continue;
        }
      }
      goto LABEL_49;
    }
  }
  if (v9 > -8)
  {
    id v15 = a4;
    if (a4 != __src || &__src[v11] <= a4) {
      memmove(a4, __src, 8 * v11);
    }
    double v16 = (char *)&a4[v11];
    uint64_t v46 = v16;
    if ((unint64_t)v7 < a3 && v9 >= 8)
    {
      while (1)
      {
        uint64_t v17 = v8;
        id v45 = *v7;
        uint64_t v44 = *v15;
        int v18 = v44;
        id v19 = v45;
        id v20 = v18;
        char v21 = a5(&v45, &v44);
        if (v5) {
          break;
        }
        char v22 = v21;

        if (v22)
        {
          uint64_t v23 = v7 + 1;
          uint64_t v24 = v17;
          if (v17 < v7 || v17 >= v23 || v17 != v7) {
            id *v17 = *v7;
          }
        }
        else
        {
          uint64_t v24 = v17;
          if (v17 != v15) {
            id *v17 = *v15;
          }
          uint64_t v47 = ++v15;
          uint64_t v23 = v7;
        }
        uint64_t v8 = v24 + 1;
        unint64_t v48 = v8;
        if (v15 < (void **)v16)
        {
          uint64_t v7 = v23;
          if ((unint64_t)v23 < a3) {
            continue;
          }
        }
        goto LABEL_49;
      }
    }
    goto LABEL_49;
  }
LABEL_50:
  uint64_t result = sub_22579FFD8();
  __break(1u);
  return result;
}

char *sub_225785C0C(char *result, int64_t a2, char a3, char *a4)
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
    sub_2257383FC(0, &qword_2681057F0, (uint64_t (*)(uint64_t))sub_225786D2C, MEMORY[0x263F8E0F8]);
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

char *sub_225785D34(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_22579FFD8();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_225785DF0(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_22579FFD8();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_225785EAC(uint64_t a1)
{
  return sub_225785C0C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_225785EC0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_22579FF88();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_22579FF88();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_225786C7C();
        sub_225786CE4(&qword_2681057E8, (void (*)(uint64_t))sub_225786C7C);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          uint64_t v12 = sub_225786100(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_22572F19C(0, &qword_2681057D0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_22579FFD8();
  __break(1u);
  return result;
}

void (*sub_225786100(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_2257861B0(v6, a2, a3);
  return sub_225786168;
}

void sub_225786168(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_2257861B0(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x22A634380](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_225786230;
  }
  __break(1u);
  return result;
}

void sub_225786230(id *a1)
{
}

uint64_t sub_225786238(uint64_t a1)
{
  return sub_225782830(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_22578624C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_225785494(a1, a2, a3, a4, *(void **)(v4 + 16));
}

uint64_t sub_225786254(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HDMCPregnancyStateFactory();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for HDMCPregnancyStateFactory(uint64_t a1, uint64_t *a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(void *)(a1 + _Block_object_dispose(&STACK[0x4A8], 8) = a2[1];
    uint64_t v8 = a2 + 2;
    long long v9 = *(_OWORD *)(a2 + 5);
    *(_OWORD *)(a1 + 40) = v9;
    uint64_t v10 = v9;
    int64_t v11 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v9 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(a1 + 16, v8, v10);
    uint64_t v12 = a3[7];
    uint64_t v13 = a1 + v12;
    uint64_t v14 = (uint64_t)a2 + v12;
    uint64_t v15 = sub_22579F418();
    double v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
    v16(v13, v14, v15);
    v16(a1 + a3[8], (uint64_t)a2 + a3[8], v15);
    *(void *)(a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
  }
  return a1;
}

uint64_t initializeWithCopy for HDMCPregnancyStateFactory(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x4A8], 8) = v6;
  uint64_t v7 = a2 + 16;
  long long v8 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v8;
  uint64_t v9 = v8;
  uint64_t v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(a1 + 16, v7, v9);
  uint64_t v11 = a3[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_22579F418();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
  v15(v12, v13, v14);
  v15(a1 + a3[8], a2 + a3[8], v14);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  return a1;
}

void *assignWithCopy for HDMCPregnancyStateFactory(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  uint64_t v6 = a3[7];
  uint64_t v7 = (char *)a1 + v6;
  long long v8 = (char *)a2 + v6;
  uint64_t v9 = sub_22579F418();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10((char *)a1 + a3[8], (char *)a2 + a3[8], v9);
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
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
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *uint64_t v3 = *a2;
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

uint64_t initializeWithTake for HDMCPregnancyStateFactory(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x4A8], 8) = *(void *)(a2 + 48);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22579F418();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(a1 + a3[8], a2 + a3[8], v10);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithTake for HDMCPregnancyStateFactory(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + _Block_object_dispose(&STACK[0x4A8], 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x4A8], 8) = *(void *)(a2 + 48);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22579F418();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(a1 + a3[8], a2 + a3[8], v10);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  return a1;
}

uint64_t getEnumTagSinglePayload for HDMCPregnancyStateFactory(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_225786A38);
}

uint64_t sub_225786A38(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_22579F418();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for HDMCPregnancyStateFactory(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_225786AFC);
}

void *sub_225786AFC(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_22579F418();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 28);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_225786BA4()
{
  uint64_t result = sub_22579F418();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_225786C5C(id *a1)
{
  return sub_225785388(a1) & 1;
}

void sub_225786C7C()
{
  if (!qword_2681057E0)
  {
    sub_22572F19C(255, &qword_2681057D0);
    unint64_t v0 = sub_22579FBB8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2681057E0);
    }
  }
}

uint64_t sub_225786CE4(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_225786D2C()
{
  if (!qword_2681057F8)
  {
    unint64_t v0 = sub_22579FC88();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2681057F8);
    }
  }
}

uint64_t sub_225786D8C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id HDMCPregnancyRequirementEvaluator.__allocating_init(pregnancyManager:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  uint64_t v4 = (char *)objc_allocWithZone((Class)type metadata accessor for HDMCPregnancyRequirementEvaluator());
  id v5 = sub_225787218(a1, v4);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

id HDMCPregnancyRequirementEvaluator.init(pregnancyManager:)(void *a1)
{
  uint64_t v2 = (char *)objc_allocWithZone((Class)type metadata accessor for HDMCPregnancyRequirementEvaluator());
  id v3 = sub_225787218(a1, v2);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

id HDMCPregnancyRequirementEvaluator.__allocating_init(pregnancyProvider:)(uint64_t a1)
{
  swift_getObjectType();
  return sub_2257871D0(a1);
}

uint64_t type metadata accessor for HDMCPregnancyRequirementEvaluator()
{
  return self;
}

id HDMCPregnancyRequirementEvaluator.init(pregnancyProvider:)(uint64_t a1)
{
  swift_getObjectType();
  return sub_225787340(a1, v1);
}

id sub_225786F64(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_observers), sel_registerObserver_, a1);
}

id sub_225786F98(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_observers), sel_unregisterObserver_, a1);
}

void sub_225786FCC(void *a1)
{
  id v3 = *(void **)&v1[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_observers];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = a1;
  v8[4] = sub_2257318AC;
  v8[5] = v4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_225730ED8;
  v8[3] = &block_descriptor_1;
  id v5 = _Block_copy(v8);
  long long v6 = v1;
  id v7 = a1;
  swift_release();
  objc_msgSend(v3, sel_notifyObservers_, v5);
  _Block_release(v5);
}

id HDMCPregnancyRequirementEvaluator.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void HDMCPregnancyRequirementEvaluator.init()()
{
}

id HDMCPregnancyRequirementEvaluator.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HDMCPregnancyRequirementEvaluator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_2257871D0(uint64_t a1)
{
  objc_super v2 = (char *)objc_allocWithZone((Class)type metadata accessor for HDMCPregnancyRequirementEvaluator());
  return sub_225787340(a1, v2);
}

id sub_225787218(void *a1, char *a2)
{
  *(void *)&a2[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_pregnancyManager] = a1;
  uint64_t v4 = (void *)*MEMORY[0x263F09930];
  id v5 = objc_allocWithZone(MEMORY[0x263F0A5A8]);
  long long v6 = a2;
  id v7 = a1;
  id v8 = v4;
  uint64_t v9 = (void *)sub_22579FA98();
  id v10 = objc_msgSend(v5, sel_initWithName_loggingCategory_, v9, v8);

  *(void *)&v6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_observers] = v10;
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for HDMCPregnancyRequirementEvaluator();
  id v11 = objc_msgSendSuper2(&v13, sel_init);
  objc_msgSend((id)swift_unknownObjectRetain(), sel_registerObserver_isUserInitiated_, v11, 0);
  swift_unknownObjectRelease();

  return v11;
}

id sub_225787340(uint64_t a1, char *a2)
{
  *(void *)&a2[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_pregnancyManager] = a1;
  id v3 = (void *)*MEMORY[0x263F09930];
  id v4 = objc_allocWithZone(MEMORY[0x263F0A5A8]);
  id v5 = a2;
  swift_unknownObjectRetain();
  id v6 = v3;
  id v7 = (void *)sub_22579FA98();
  id v8 = objc_msgSend(v4, sel_initWithName_loggingCategory_, v7, v6);

  *(void *)&v5[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon33HDMCPregnancyRequirementEvaluator_observers] = v8;
  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for HDMCPregnancyRequirementEvaluator();
  id v9 = objc_msgSendSuper2(&v11, sel_init);
  objc_msgSend((id)swift_unknownObjectRetain(), sel_registerObserver_isUserInitiated_, v9, 0);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v9;
}

unint64_t sub_22578746C()
{
  unint64_t result = qword_26ABF9398;
  if (!qword_26ABF9398)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26ABF9398);
  }
  return result;
}

uint64_t sub_2257874AC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t method lookup function for HDMCPregnancyRequirementEvaluator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HDMCPregnancyRequirementEvaluator);
}

uint64_t dispatch thunk of HDMCPregnancyRequirementEvaluator.__allocating_init(pregnancyProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of HDMCPregnancyRequirementEvaluator.isRequirementSatisfied(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of HDMCPregnancyRequirementEvaluator.register(_:for:queue:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of HDMCPregnancyRequirementEvaluator.unregisterObserver(_:for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of HDMCPregnancyRequirementEvaluator.pregnancyModelDidUpdate(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t HDCodableMenstrualCyclesExperienceModel.getExperienceModel()()
{
  uint64_t result = sub_225730A30();
  if (!v0)
  {
    id v2 = sub_22572BEDC();
    swift_release();
    return (uint64_t)v2;
  }
  return result;
}

void sub_22578764C(uint64_t (*a1)(id *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v5 = a3;
  if ((a3 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_22579FDD8();
    sub_22572F19C(0, (unint64_t *)&qword_26ABF9A88);
    sub_22572F3BC(&qword_26ABF9A90, (unint64_t *)&qword_26ABF9A88);
    sub_22579FC38();
    uint64_t v5 = v24;
    uint64_t v23 = v25;
    uint64_t v7 = v26;
    int64_t v8 = v27;
    unint64_t v9 = v28;
  }
  else
  {
    uint64_t v10 = -1 << *(unsigned char *)(a3 + 32);
    uint64_t v23 = a3 + 56;
    uint64_t v11 = ~v10;
    uint64_t v12 = -v10;
    if (v12 < 64) {
      uint64_t v13 = ~(-1 << v12);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v9 = v13 & *(void *)(a3 + 56);
    swift_bridgeObjectRetain();
    uint64_t v7 = v11;
    int64_t v8 = 0;
  }
  int64_t v22 = (unint64_t)(v7 + 64) >> 6;
  if ((v5 & 0x8000000000000000) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  if (!sub_22579FE48()) {
    goto LABEL_36;
  }
  sub_22572F19C(0, (unint64_t *)&qword_26ABF9A88);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v14 = v29;
  swift_unknownObjectRelease();
  int64_t v15 = v8;
  uint64_t v16 = v9;
  if (!v14) {
    goto LABEL_36;
  }
  while (1)
  {
    id v29 = v14;
    char v20 = a1(&v29);
    if (v4)
    {

      goto LABEL_36;
    }
    if (v20) {
      goto LABEL_36;
    }

    int64_t v8 = v15;
    unint64_t v9 = v16;
    if (v5 < 0) {
      goto LABEL_8;
    }
LABEL_11:
    if (!v9) {
      break;
    }
    uint64_t v16 = (v9 - 1) & v9;
    unint64_t v17 = __clz(__rbit64(v9)) | (v8 << 6);
    int64_t v15 = v8;
LABEL_24:
    id v14 = *(id *)(*(void *)(v5 + 48) + 8 * v17);
    if (!v14) {
      goto LABEL_36;
    }
  }
  int64_t v15 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    return;
  }
  if (v15 >= v22) {
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v23 + 8 * v15);
  if (v18)
  {
LABEL_23:
    uint64_t v16 = (v18 - 1) & v18;
    unint64_t v17 = __clz(__rbit64(v18)) + (v15 << 6);
    goto LABEL_24;
  }
  int64_t v19 = v8 + 2;
  if (v8 + 2 >= v22) {
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v23 + 8 * v19);
  if (v18) {
    goto LABEL_22;
  }
  int64_t v19 = v8 + 3;
  if (v8 + 3 >= v22) {
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v23 + 8 * v19);
  if (v18) {
    goto LABEL_22;
  }
  int64_t v19 = v8 + 4;
  if (v8 + 4 >= v22) {
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v23 + 8 * v19);
  if (v18)
  {
LABEL_22:
    int64_t v15 = v19;
    goto LABEL_23;
  }
  int64_t v15 = v8 + 5;
  if (v8 + 5 >= v22) {
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v23 + 8 * v15);
  if (v18) {
    goto LABEL_23;
  }
  int64_t v21 = v8 + 6;
  while (v22 != v21)
  {
    unint64_t v18 = *(void *)(v23 + 8 * v21++);
    if (v18)
    {
      int64_t v15 = v21 - 1;
      goto LABEL_23;
    }
  }
LABEL_36:
  sub_22577C1FC();
}

uint64_t sub_225787998@<X0>(uint64_t (*a1)(char *)@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  char v33 = a1;
  uint64_t v34 = a2;
  unint64_t v28 = a3;
  sub_22572BEA0(0);
  uint64_t v5 = v4;
  uint64_t v30 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22578C6E4(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22572E408(0);
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  int64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22578D030(0);
  uint64_t v17 = v16;
  uint64_t v29 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  int64_t v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v36, v12);
  uint64_t v20 = v30;
  sub_225730E90(&qword_268105900, sub_22572E408);
  sub_22579FB28();
  uint64_t v21 = sub_225730E90(&qword_268105908, sub_22578D030);
  id v35 = v19;
  uint64_t v36 = v17;
  uint64_t v31 = v21;
  sub_22579FD58();
  int64_t v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  if (v22(v10, 1, v5) == 1)
  {
LABEL_6:
    (*(void (**)(char *, uint64_t))(v29 + 8))(v35, v36);
    uint64_t v25 = 1;
    uint64_t v26 = v28;
  }
  else
  {
    id v32 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
    uint64_t v23 = (void (**)(char *, uint64_t))(v20 + 8);
    while (1)
    {
      v32(v7, v10, v5);
      char v24 = v33(v7);
      if (v3)
      {
        (*v23)(v7, v5);
        return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v35, v36);
      }
      if (v24) {
        break;
      }
      (*v23)(v7, v5);
      sub_22579FD58();
      if (v22(v10, 1, v5) == 1) {
        goto LABEL_6;
      }
    }
    (*(void (**)(char *, uint64_t))(v29 + 8))(v35, v36);
    uint64_t v26 = v28;
    v32(v28, v7, v5);
    uint64_t v25 = 0;
  }
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56))(v26, v25, 1, v5);
}

uint64_t HDCodableMenstrualCyclesExperienceModel.insert(record:oldSampleUUID:)(void *a1, uint64_t a2)
{
  uint64_t v4 = v3;
  id v5 = v2;
  uint64_t v92 = a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v95 = sub_22579F858();
  uint64_t v8 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95);
  uint64_t v10 = (char *)v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22572BEA0(0);
  uint64_t v93 = *(void *)(v11 - 8);
  uint64_t v94 = v11;
  MEMORY[0x270FA5388](v11);
  unint64_t v83 = (char *)v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22572E408(0);
  uint64_t v90 = *(void *)(v13 - 8);
  uint64_t v91 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v89 = (char *)v77 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225730DBC();
  uint64_t v16 = v15;
  uint64_t v99 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  int64_t v19 = (char *)v77 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v87 = (char *)v77 - v20;
  sub_22578C6E4(0);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v88 = (uint64_t)v77 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  unint64_t v96 = (char *)v77 - v24;
  if (HKShowSensitiveLogItems())
  {
    uint64_t v86 = ObjectType;
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_22579F458();
    __swift_project_value_buffer(v25, (uint64_t)qword_26ABF94A0);
    uint64_t v26 = a1;
    id v27 = a1;
    unint64_t v28 = sub_22579F438();
    os_log_type_t v29 = sub_22579FCB8();
    LODWORD(v82) = v29;
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v80 = v3;
      uint64_t v31 = v30;
      uint64_t v79 = swift_slowAlloc();
      v98[0] = v79;
      *(_DWORD *)uint64_t v31 = 136315394;
      id v84 = v5;
      uint64_t v32 = sub_2257A0188();
      uint64_t v86 = v8;
      uint64_t v97 = sub_22572E428(v32, v33, v98);
      char v85 = v10;
      sub_22579FD68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v31 + 12) = 2080;
      uint64_t v78 = v31 + 14;
      id v34 = v27;
      id v35 = objc_msgSend(v34, sel_description);
      uint64_t v36 = sub_22579FAC8();
      id v81 = v26;
      uint64_t v37 = v19;
      uint64_t v38 = v16;
      unint64_t v40 = v39;

      uint64_t v41 = v36;
      uint64_t v8 = v86;
      uint64_t v97 = sub_22572E428(v41, v40, v98);
      uint64_t v10 = v85;
      sub_22579FD68();

      id v5 = v84;
      uint64_t v16 = v38;
      int64_t v19 = v37;
      a1 = v81;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v28, (os_log_type_t)v82, "[%s] Inserting record: %s", (uint8_t *)v31, 0x16u);
      uint64_t v42 = v79;
      swift_arrayDestroy();
      MEMORY[0x22A635470](v42, -1, -1);
      uint64_t v43 = v31;
      uint64_t v4 = v80;
      MEMORY[0x22A635470](v43, -1, -1);
    }
    else
    {

      a1 = v26;
    }
  }
  uint64_t result = sub_225730A30();
  if (!v4)
  {
    id v82 = v19;
    id v84 = v5;
    char v85 = v10;
    id v45 = a1;
    uint64_t v46 = v16;
    uint64_t v86 = v8;
    uint64_t v47 = result + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
    uint64_t v48 = result;
    swift_beginAccess();
    uint64_t v49 = v99;
    uint64_t v50 = *(void (**)(void, void, void))(v99 + 16);
    uint64_t v51 = v87;
    uint64_t v78 = v47;
    id v81 = (void *)(v99 + 16);
    uint64_t v80 = v50;
    v50(v87, v47, v16);
    swift_getKeyPath();
    uint64_t v52 = sub_225730E90(&qword_26ABF98A0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
    int v53 = v89;
    uint64_t v79 = v52;
    sub_22579F968();
    swift_release();
    uint64_t v54 = *(char **)(v49 + 8);
    uint64_t v99 = v49 + 8;
    uint64_t v87 = v54;
    uint64_t v55 = ((uint64_t (*)(char *, uint64_t))v54)(v51, v16);
    MEMORY[0x270FA5388](v55);
    uint64_t v56 = v92;
    v77[-4] = v48;
    v77[-3] = v56;
    v77[-2] = v45;
    uint64_t v57 = v45;
    unint64_t v58 = v96;
    sub_225787998((uint64_t (*)(char *))sub_22578C704, (uint64_t)&v77[-6], v96);
    (*(void (**)(char *, uint64_t))(v90 + 8))(v53, v91);
    uint64_t v59 = v88;
    sub_22578CFC8((uint64_t)v58, v88, (uint64_t (*)(void))sub_22578C6E4);
    uint64_t v61 = v93;
    uint64_t v60 = v94;
    int v62 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v93 + 48))(v59, 1, v94);
    v77[1] = v48;
    if (v62 == 1)
    {
      sub_22578CEF8(v59, (uint64_t (*)(void))sub_22578C6E4);
      sub_22578A704(v57);
      uint64_t v63 = v95;
      uint64_t v64 = v78;
    }
    else
    {
      int64_t v65 = v83;
      uint64_t v66 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v61 + 32))(v83, v59, v60);
      MEMORY[0x270FA5388](v66);
      v77[-4] = v56;
      v77[-3] = v57;
      v77[-2] = v65;
      uint64_t v64 = v78;
      swift_beginAccess();
      sub_22579F958();
      swift_endAccess();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v65, v60);
      uint64_t v63 = v95;
    }
    sub_22579F9F8();
    int v67 = (void *)sub_22579F9E8();
    char v68 = v85;
    uint64_t v69 = v86;
    (*(void (**)(char *, void, uint64_t))(v86 + 104))(v85, *MEMORY[0x263F32EB8], v63);
    uint64_t v70 = v82;
    v80(v82, v64, v46);
    uint64_t v71 = v70;
    uint64_t v72 = sub_22579F988();
    unint64_t v74 = v73;
    ((void (*)(char *, uint64_t))v87)(v71, v46);
    unint64_t v75 = v68;
    uint64_t v76 = (void *)sub_22579F268();
    sub_2257309D8(v72, v74);
    objc_msgSend(v84, sel_setMenstrualCyclesExperienceModelData_, v76);
    swift_release();

    (*(void (**)(char *, uint64_t))(v69 + 8))(v75, v63);
    return sub_22578CEF8((uint64_t)v96, (uint64_t (*)(void))sub_22578C6E4);
  }
  return result;
}

uint64_t HDCodableMenstrualCyclesExperienceModel.deleteRecords(with:)(uint64_t a1)
{
  uint64_t v3 = sub_22579F398();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22578CA8C(0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v22 = a1 + 56;
  uint64_t v11 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v10;
  uint64_t v26 = v4 + 16;
  id v27 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
  uint64_t v25 = v4 + 48;
  int64_t v23 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v24 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v28 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v15 = 0;
  if (!v13) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v16 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v16 | (v15 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v15 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v9, *(void *)(v28 + 48) + *(void *)(v4 + 72) * i, v3);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v9, 0, 1, v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) == 1) {
      return swift_release();
    }
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v9, v3);
    HDCodableMenstrualCyclesExperienceModel.deleteRecord(with:)((uint64_t)v6);
    if (v1)
    {
      (*v24)(v6, v3);
      return swift_release();
    }
    uint64_t result = ((uint64_t (*)(char *, uint64_t))*v24)(v6, v3);
    if (v13) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v15++, 1)) {
      break;
    }
    if (v15 >= v23) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v22 + 8 * v15);
    if (!v19)
    {
      int64_t v20 = v15 + 1;
      if (v15 + 1 >= v23) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v22 + 8 * v20);
      if (v19) {
        goto LABEL_14;
      }
      int64_t v20 = v15 + 2;
      if (v15 + 2 >= v23) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v22 + 8 * v20);
      if (v19)
      {
LABEL_14:
        int64_t v15 = v20;
        goto LABEL_15;
      }
      int64_t v20 = v15 + 3;
      if (v15 + 3 < v23)
      {
        unint64_t v19 = *(void *)(v22 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            int64_t v15 = v20 + 1;
            if (__OFADD__(v20, 1)) {
              goto LABEL_28;
            }
            if (v15 >= v23) {
              goto LABEL_25;
            }
            unint64_t v19 = *(void *)(v22 + 8 * v15);
            ++v20;
            if (v19) {
              goto LABEL_15;
            }
          }
        }
        goto LABEL_14;
      }
LABEL_25:
      (*v27)(v9, 1, 1, v3);
      return swift_release();
    }
LABEL_15:
    unint64_t v13 = (v19 - 1) & v19;
  }
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

id HDCodableMenstrualCyclesExperienceModel.init(model:)(void *a1)
{
  id v2 = sub_22572FE60(a1);

  return v2;
}

uint64_t HDCodableMenstrualCyclesExperienceModel.makeCopy()()
{
  swift_getObjectType();
  objc_msgSend(v0, sel_copy);
  sub_22579FD88();
  swift_unknownObjectRelease();
  if (swift_dynamicCast()) {
    return v2;
  }
  sub_22579FEB8();
  sub_22579FB08();
  sub_22572F3BC(&qword_2681058E8, &qword_26ABF9A98);
  sub_22578CAAC();
  sub_22579FB08();
  swift_bridgeObjectRelease();
  sub_22579FB08();
  uint64_t result = sub_22579FF78();
  __break(1u);
  return result;
}

uint64_t HDCodableMenstrualCyclesExperienceModel.merge(with:)(void (*a1)(char *, uint64_t, uint64_t))
{
  uint64_t v37 = a1;
  uint64_t v3 = sub_22579F858();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225730DBC();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v29 - v13;
  uint64_t result = sub_225730A30();
  if (!v2)
  {
    id v29 = v1;
    uint64_t v30 = v12;
    uint64_t v35 = v4;
    uint64_t v36 = result;
    uint64_t v33 = v3;
    id v34 = v14;
    uint64_t v31 = v6;
    uint64_t v32 = v9;
    uint64_t v16 = sub_225730A30()
        + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
    swift_beginAccess();
    uint64_t v17 = v32;
    uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 16);
    uint64_t v18 = v8;
    v37(v34, v16, v8);
    swift_release();
    uint64_t v19 = v36 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
    swift_beginAccess();
    type metadata accessor for CoherentExperienceSetupRecordDatabase(0);
    sub_225730E90(&qword_26ABF98A8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
    sub_22579F948();
    swift_endAccess();
    sub_22579F9F8();
    uint64_t v20 = sub_22579F9E8();
    uint64_t v21 = v31;
    (*(void (**)(char *, void, uint64_t))(v35 + 104))(v31, *MEMORY[0x263F32EB8], v33);
    uint64_t v22 = v30;
    v37(v30, v19, v18);
    sub_225730E90(&qword_26ABF98A0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
    int64_t v23 = (void *)v20;
    uint64_t v24 = sub_22579F988();
    unint64_t v26 = v25;
    id v27 = *(void (**)(char *, uint64_t))(v17 + 8);
    v27(v22, v18);
    uint64_t v28 = (void *)sub_22579F268();
    sub_2257309D8(v24, v26);
    objc_msgSend(v29, sel_setMenstrualCyclesExperienceModelData_, v28);
    swift_release();

    (*(void (**)(char *, uint64_t))(v35 + 8))(v21, v33);
    return ((uint64_t (*)(char *, uint64_t))v27)(v34, v18);
  }
  return result;
}

uint64_t sub_22578908C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v37 = a4;
  uint64_t v43 = a3;
  uint64_t v41 = a1;
  sub_22578CA8C(0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v42 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22579F398();
  uint64_t v39 = *(void *)(v7 - 8);
  uint64_t v40 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v44 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v38 = (char *)&v36 - v10;
  sub_22577CCE0();
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  int64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for CoherentExperienceSetupRecord(0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225730DBC();
  uint64_t v20 = v19;
  uint64_t v21 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  int64_t v23 = (char *)&v36 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = a2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v23, v24, v20);
  sub_225730E90(&qword_26ABF97B0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  sub_22579F9B8();
  uint64_t v25 = v20;
  uint64_t v26 = v39;
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v25);
  uint64_t v27 = v40;
  uint64_t v28 = *(int *)(v16 + 20);
  id v29 = v38;
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v15, &v18[v28], v12);
  sub_22578CEF8((uint64_t)v18, type metadata accessor for CoherentExperienceSetupRecord);
  sub_22579F4B8();
  uint64_t v30 = (uint64_t)v42;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  sub_22578CFC8(v43, v30, (uint64_t (*)(void))sub_22578CA8C);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v30, 1, v27) == 1)
  {
    id v31 = objc_msgSend(v37, sel_sampleUUID);
    uint64_t v32 = v44;
    sub_22579F378();

    sub_22578CEF8(v30, (uint64_t (*)(void))sub_22578CA8C);
  }
  else
  {
    uint64_t v32 = v44;
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))(v44, v30, v27);
  }
  char v33 = sub_22579F368();
  id v34 = *(void (**)(char *, uint64_t))(v26 + 8);
  v34(v32, v27);
  v34(v29, v27);
  return v33 & 1;
}

void sub_225789520(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v137 = a1;
  uint64_t v138 = a4;
  id v142 = a3;
  sub_22578CF74(0, &qword_268105708, (void (*)(uint64_t))sub_225783F60);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (uint64_t *)((char *)&v118 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v6);
  uint64_t v134 = (void **)((char *)&v118 - v9);
  uint64_t v10 = type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord(0);
  uint64_t v139 = *(void *)(v10 - 8);
  uint64_t v140 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v128 = (char *)&v118 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2257382E8(0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v123 = (char *)&v118 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v127 = (char *)&v118 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v133 = (char *)&v118 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v135 = (uint64_t)&v118 - v19;
  uint64_t v141 = sub_22579F338();
  uint64_t v125 = *(void *)(v141 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v141);
  uint64_t v143 = (char *)&v118 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  id v130 = (char *)&v118 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v126 = (char *)&v118 - v24;
  sub_22578CD48(0);
  uint64_t v26 = MEMORY[0x270FA5388](v25 - 8);
  uint64_t v124 = (uint64_t)&v118 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  id v29 = (char *)&v118 - v28;
  uint64_t v30 = type metadata accessor for CoherentExperienceSetupRecord(0);
  uint64_t v31 = MEMORY[0x270FA5388](v30);
  uint64_t v122 = (char *)&v118 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  uint64_t v132 = (char *)&v118 - v34;
  MEMORY[0x270FA5388](v33);
  uint64_t v131 = (void (**)(char *, char *, uint64_t))((char *)&v118 - v35);
  sub_22578CA8C(0);
  MEMORY[0x270FA5388](v36 - 8);
  uint64_t v38 = (char *)&v118 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_22579F398();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = MEMORY[0x270FA5388](v39);
  uint64_t v43 = (char *)&v118 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v41);
  id v45 = (char *)&v118 - v44;
  sub_22578CFC8(a2, (uint64_t)v38, (uint64_t (*)(void))sub_22578CA8C);
  int v46 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39);
  v144[10] = v30;
  if (v46 == 1)
  {
    sub_22578CEF8((uint64_t)v38, (uint64_t (*)(void))sub_22578CA8C);
    uint64_t v47 = v134;
  }
  else
  {
    id v136 = v29;
    (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v45, v38, v39);
    id v48 = objc_msgSend(v142, sel_sampleUUID);
    sub_22579F378();

    sub_225730E90(&qword_268105628, MEMORY[0x263F07508]);
    LOBYTE(v4_Block_object_dispose(&STACK[0x4A8], 8) = sub_22579FA88();
    uint64_t v49 = *(void (**)(char *, uint64_t))(v40 + 8);
    v49(v43, v39);
    if ((v48 & 1) == 0)
    {
      id v50 = objc_msgSend(v142, sel_sampleUUID);
      sub_22579F378();

      sub_22572BEA0(0);
      uint64_t v51 = (void (*)(void *, void))sub_22579F878();
      sub_22577CCE0();
      sub_22579F4C8();
      v51(v144, 0);
    }
    v49(v45, v39);
    uint64_t v47 = v134;
    id v29 = v136;
  }
  sub_22572BEA0(0);
  id v136 = v52;
  uint64_t v53 = (uint64_t)v131;
  sub_22579F888();
  sub_22578CD68(0, (unint64_t *)&qword_26ABF9A10, sub_22578CD48, (void (*)(void))sub_22578CDD8);
  int64_t v121 = v54;
  sub_22579F4B8();
  sub_22578CEF8(v53, type metadata accessor for CoherentExperienceSetupRecord);
  int v55 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v139 + 48))(v29, 1, v140);
  sub_22578CEF8((uint64_t)v29, (uint64_t (*)(void))sub_22578CD48);
  uint64_t v56 = v135;
  if (v55 != 1) {
    goto LABEL_12;
  }
  id v57 = objc_msgSend(v142, sel_configurationStepsReviewDate);
  if (!v57)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v125 + 56))(v56, 1, 1, v141);
    goto LABEL_11;
  }
  unint64_t v58 = v57;
  uint64_t v59 = v130;
  sub_22579F2F8();

  uint64_t v60 = v125;
  uint64_t v61 = *(void (**)(uint64_t, char *, uint64_t))(v125 + 32);
  uint64_t v62 = v141;
  v61(v56, v59, v141);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v60 + 56))(v56, 0, 1, v62);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v60 + 48))(v56, 1, v62) == 1)
  {
LABEL_11:
    sub_22578CEF8(v56, (uint64_t (*)(void))sub_2257382E8);
    goto LABEL_12;
  }
  uint64_t v63 = v126;
  uint64_t v64 = v141;
  v61((uint64_t)v126, (char *)v56, v141);
  unint64_t v65 = sub_2257833D8(MEMORY[0x263F8EE78]);
  uint64_t v66 = (uint64_t)v128;
  (*(void (**)(char *, char *, uint64_t))(v125 + 16))(v128, v63, v64);
  uint64_t v67 = v140;
  *(void *)(v66 + *(int *)(v140 + 20)) = v65;
  uint64_t v68 = v124;
  sub_22578CFC8(v66, v124, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v139 + 56))(v68, 0, 1, v67);
  uint64_t v69 = (void (*)(void *, void))sub_22579F878();
  sub_22579F4C8();
  v69(v144, 0);
  sub_22578CEF8(v66, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
  (*(void (**)(char *, uint64_t))(v125 + 8))(v63, v64);
LABEL_12:
  id v70 = objc_msgSend(v142, sel_postPregnancyFeatureAdjustmentCompletionLog);
  type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
  sub_225730E90(&qword_268105290, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
  uint64_t v71 = sub_22579FA38();

  uint64_t v135 = 0;
  uint64_t v72 = *(void *)(v71 + 64);
  uint64_t v120 = v71 + 64;
  uint64_t v124 = v71;
  uint64_t v73 = 1 << *(unsigned char *)(v71 + 32);
  uint64_t v74 = -1;
  if (v73 < 64) {
    uint64_t v74 = ~(-1 << v73);
  }
  unint64_t v75 = v74 & v72;
  uint64_t v131 = (void (**)(char *, char *, uint64_t))(v125 + 32);
  uint64_t v139 = v125 + 16;
  uint64_t v140 = v125 + 48;
  uint64_t v126 = (char *)(v125 + 56);
  id v130 = (char *)*MEMORY[0x263F450D8];
  uint64_t v128 = (char *)(v125 + 8);
  int64_t v121 = (unint64_t)(v73 + 63) >> 6;
  int64_t v119 = v121 - 1;
  uint64_t v129 = v8;
  while (1)
  {
    if (v75)
    {
      unint64_t v76 = __clz(__rbit64(v75));
      char v77 = (void *)((v75 - 1) & v75);
      unint64_t v78 = v76 | (v135 << 6);
LABEL_19:
      uint64_t v79 = *(void *)(v124 + 56);
      uint64_t v80 = *(void **)(*(void *)(v124 + 48) + 8 * v78);
      *uint64_t v8 = v80;
      uint64_t v81 = v125;
      uint64_t v82 = v79 + *(void *)(v125 + 72) * v78;
      sub_225783F60();
      uint64_t v84 = v83;
      (*(void (**)(char *, uint64_t, uint64_t))(v81 + 16))((char *)v8 + *(int *)(v83 + 48), v82, v141);
      (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v84 - 8) + 56))(v8, 0, 1, v84);
      id v85 = v80;
      goto LABEL_38;
    }
    int64_t v86 = v135 + 1;
    if (__OFADD__(v135, 1))
    {
      __break(1u);
      goto LABEL_50;
    }
    if (v86 < v121)
    {
      unint64_t v87 = *(void *)(v120 + 8 * v86);
      if (v87) {
        goto LABEL_23;
      }
      int64_t v88 = v135 + 2;
      ++v135;
      if (v86 + 1 < v121)
      {
        unint64_t v87 = *(void *)(v120 + 8 * v88);
        if (v87) {
          goto LABEL_26;
        }
        uint64_t v135 = v86 + 1;
        if (v86 + 2 < v121)
        {
          unint64_t v87 = *(void *)(v120 + 8 * (v86 + 2));
          if (v87)
          {
            v86 += 2;
            goto LABEL_23;
          }
          int64_t v88 = v86 + 3;
          uint64_t v135 = v86 + 2;
          if (v86 + 3 < v121) {
            break;
          }
        }
      }
    }
LABEL_37:
    sub_225783F60();
    uint64_t v84 = v89;
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v89 - 8) + 56))(v8, 1, 1, v89);
    char v77 = 0;
LABEL_38:
    sub_22578CE78((uint64_t)v8, (uint64_t)v47);
    sub_225783F60();
    if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(*(void *)(v84 - 8) + 48))(v47, 1, v84) == 1)
    {
      swift_release();
      return;
    }
    id v142 = v77;
    uint64_t v90 = v47;
    uint64_t v91 = *v47;
    uint64_t v92 = v141;
    (*v131)(v143, (char *)v90 + *(int *)(v84 + 48), v141);
    v144[4] = sub_22579FAC8();
    v144[5] = v93;
    uint64_t v94 = (void (*)(void *, void))sub_22579F878();
    sub_22577CE58();
    sub_22579F8C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v94(v144, 0);
    uint64_t v95 = sub_22579FAC8();
    uint64_t v97 = v96;
    uint64_t v98 = (uint64_t)v132;
    sub_22579F888();
    v144[0] = v95;
    v144[1] = v97;
    sub_22577CF8C();
    uint64_t v99 = (uint64_t)v133;
    sub_22579F778();
    swift_bridgeObjectRelease();
    sub_22578CEF8(v98, type metadata accessor for CoherentExperienceSetupRecord);
    unint64_t v100 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))v140;
    int v101 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))v140)(v99, 1, v92);
    sub_22578CEF8(v99, (uint64_t (*)(void))sub_2257382E8);
    if (v101 == 1)
    {
      uint64_t v102 = sub_22579FAC8();
      uint64_t v104 = v103;
      uint64_t v105 = v127;
      (*(void (**)(char *, char *, uint64_t))v139)(v127, v143, v92);
      (*(void (**)(char *, void, uint64_t, uint64_t))v126)(v105, 0, 1, v92);
      v144[6] = v102;
      v144[7] = v104;
      unint64_t v106 = (void (*)(void *, void))sub_22579F878();
      sub_22579F788();
      v106(v144, 0);
    }
    uint64_t v107 = sub_22579FAC8();
    uint64_t v109 = v108;
    if (v107 == sub_22579FAC8() && v109 == v110)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v111 = sub_2257A0068();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v111 & 1) == 0) {
        goto LABEL_15;
      }
    }
    uint64_t v112 = (uint64_t)v122;
    sub_22579F888();
    sub_22578CD68(0, (unint64_t *)&qword_26ABF9A00, sub_2257382E8, (void (*)(void))sub_22577CF24);
    uint64_t v113 = (uint64_t)v123;
    sub_22579F4B8();
    sub_22578CEF8(v112, type metadata accessor for CoherentExperienceSetupRecord);
    int v114 = v100(v113, 1, v92);
    sub_22578CEF8(v113, (uint64_t (*)(void))sub_2257382E8);
    if (v114 != 1)
    {
LABEL_15:
      (*(void (**)(char *, uint64_t))v128)(v143, v92);

      goto LABEL_16;
    }
    id v115 = v127;
    uint64_t v116 = v143;
    (*(void (**)(char *, char *, uint64_t))v139)(v127, v143, v92);
    (*(void (**)(char *, void, uint64_t, uint64_t))v126)(v115, 0, 1, v92);
    unint64_t v117 = (void (*)(void *, void))sub_22579F878();
    sub_22579F4C8();
    v117(v144, 0);

    (*(void (**)(char *, uint64_t))v128)(v116, v92);
LABEL_16:
    uint64_t v8 = v129;
    uint64_t v47 = v134;
    unint64_t v75 = (unint64_t)v142;
  }
  unint64_t v87 = *(void *)(v120 + 8 * v88);
  if (v87)
  {
LABEL_26:
    int64_t v86 = v88;
LABEL_23:
    char v77 = (void *)((v87 - 1) & v87);
    unint64_t v78 = __clz(__rbit64(v87)) + (v86 << 6);
    uint64_t v135 = v86;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v86 = v88 + 1;
    if (__OFADD__(v88, 1)) {
      break;
    }
    if (v86 >= v121)
    {
      uint64_t v135 = v119;
      goto LABEL_37;
    }
    unint64_t v87 = *(void *)(v120 + 8 * v86);
    ++v88;
    if (v87) {
      goto LABEL_23;
    }
  }
LABEL_50:
  __break(1u);
}

uint64_t sub_22578A704(void *a1)
{
  swift_getObjectType();
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22579F458();
  __swift_project_value_buffer(v2, (uint64_t)qword_26ABF94A0);
  id v3 = a1;
  uint64_t v4 = sub_22579F438();
  os_log_type_t v5 = sub_22579FCB8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    v17[0] = v7;
    *(_DWORD *)uint64_t v6 = 136315394;
    uint64_t v8 = sub_2257A0188();
    uint64_t v16 = sub_22572E428(v8, v9, v17);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    id v10 = objc_msgSend(v3, sel_debugDescription, v16);
    sub_22579FAC8();

    sub_2257A0078();
    id v11 = (id)HKSensitiveLogItem();
    swift_unknownObjectRelease();
    sub_22579FD88();
    swift_unknownObjectRelease();
    uint64_t v12 = sub_22579FAD8();
    sub_22572E428(v12, v13, v17);
    sub_22579FD68();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v4, v5, "[%s] Will insert new record %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v7, -1, -1);
    MEMORY[0x22A635470](v6, -1, -1);
  }
  else
  {
  }
  MEMORY[0x270FA5388](v14);
  swift_beginAccess();
  sub_225730DBC();
  sub_22579F958();
  return swift_endAccess();
}

uint64_t sub_22578AA08(uint64_t a1, void *a2)
{
  sub_22578CF74(0, &qword_26ABF9A48, MEMORY[0x263F330F8]);
  MEMORY[0x270FA5388](v3 - 8);
  os_log_type_t v5 = &v20[-v4];
  sub_22572BEA0(0);
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = type metadata accessor for CoherentExperienceSetupRecord(0);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = &v20[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = &v20[-v15];
  sub_22577F7E0(a2, (uint64_t)&v20[-v15]);
  sub_22578CFC8((uint64_t)v16, (uint64_t)v14, type metadata accessor for CoherentExperienceSetupRecord);
  uint64_t v17 = sub_22579FA18();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v5, 1, 1, v17);
  sub_225730E90(&qword_26ABF97B0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  swift_retain();
  sub_22579F868();
  swift_getKeyPath();
  sub_225730E90(&qword_26ABF98A0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  uint64_t v18 = (void (*)(unsigned char *, void))sub_22579F938();
  sub_22572E408(0);
  sub_22579F7C8();
  v18(v20, 0);
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
  return sub_22578CEF8((uint64_t)v16, type metadata accessor for CoherentExperienceSetupRecord);
}

uint64_t HDCodableMenstrualCyclesExperienceModel.deleteRecord(with:)(uint64_t a1)
{
  uint64_t v87 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_22579F858();
  uint64_t v81 = *(void *)(v3 - 8);
  uint64_t v82 = v3;
  MEMORY[0x270FA5388](v3);
  os_log_type_t v5 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22572BEA0(0);
  uint64_t v89 = *(void *)(v6 - 8);
  uint64_t v90 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22572E408(0);
  uint64_t v85 = *(void *)(v9 - 8);
  uint64_t v86 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v84 = (char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225730DBC();
  uint64_t v88 = v11;
  uint64_t v91 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v67 - v15;
  sub_22578C6E4(0);
  uint64_t v18 = v17;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v67 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v83 = (uint64_t)&v67 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v67 - v24;
  uint64_t result = sub_225730A30();
  if (!v2)
  {
    uint64_t v73 = v18;
    uint64_t v74 = v21;
    unint64_t v75 = v14;
    id v68 = v1;
    unint64_t v76 = v5;
    unint64_t v78 = v8;
    uint64_t v27 = result + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
    uint64_t v28 = result;
    swift_beginAccess();
    uint64_t v29 = v91;
    uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v91 + 16);
    uint64_t v31 = v88;
    uint64_t v72 = v91 + 16;
    uint64_t v71 = v30;
    v30(v16, v27, v88);
    swift_getKeyPath();
    uint64_t v77 = 0;
    uint64_t v32 = sub_225730E90(&qword_26ABF98A0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
    uint64_t v33 = v84;
    uint64_t v69 = v32;
    sub_22579F968();
    swift_release();
    uint64_t v35 = *(void (**)(char *, uint64_t))(v29 + 8);
    uint64_t v34 = v29 + 8;
    id v70 = v35;
    uint64_t v36 = ((uint64_t (*)(char *, uint64_t))v35)(v16, v31);
    MEMORY[0x270FA5388](v36);
    uint64_t v79 = v28;
    uint64_t v37 = v87;
    *(&v67 - 2) = v28;
    *(&v67 - 1) = v37;
    uint64_t v38 = v77;
    sub_225787998((uint64_t (*)(char *))sub_22578CAD8, (uint64_t)(&v67 - 4), v25);
    (*(void (**)(char *, uint64_t))(v85 + 8))(v33, v86);
    uint64_t v39 = v83;
    sub_22578CFC8((uint64_t)v25, v83, (uint64_t (*)(void))sub_22578C6E4);
    uint64_t v41 = v89;
    uint64_t v40 = v90;
    uint64_t v42 = (uint64_t)v25;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v89 + 48))(v39, 1, v90) == 1)
    {
      sub_22578CEF8(v39, (uint64_t (*)(void))sub_22578C6E4);
      if (qword_26ABF9378 != -1) {
        swift_once();
      }
      uint64_t v43 = sub_22579F458();
      __swift_project_value_buffer(v43, (uint64_t)qword_26ABF94A0);
      uint64_t v44 = sub_22579F438();
      os_log_type_t v45 = sub_22579FC98();
      BOOL v46 = os_log_type_enabled(v44, v45);
      uint64_t v47 = ObjectType;
      if (v46)
      {
        uint64_t v87 = v42;
        id v48 = (uint8_t *)swift_slowAlloc();
        uint64_t v49 = swift_slowAlloc();
        uint64_t v93 = v49;
        *(_DWORD *)id v48 = 136315138;
        uint64_t v92 = v47;
        swift_getMetatypeMetadata();
        uint64_t v50 = sub_225737FD8();
        uint64_t v92 = sub_22572E428(v50, v51, &v93);
        sub_22579FD68();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_225722000, v44, v45, "[%s] Unable to delete record that does not exist", v48, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A635470](v49, -1, -1);
        MEMORY[0x22A635470](v48, -1, -1);
        swift_release();

        uint64_t v52 = v87;
      }
      else
      {
        swift_release();

        uint64_t v52 = v42;
      }
      return sub_22578CEF8(v52, (uint64_t (*)(void))sub_22578C6E4);
    }
    else
    {
      uint64_t v87 = (uint64_t)v25;
      uint64_t v91 = v34;
      uint64_t v53 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v41 + 32);
      int64_t v54 = v78;
      uint64_t v55 = v53(v78, v39, v40);
      MEMORY[0x270FA5388](v55);
      *(&v67 - 2) = (uint64_t)v54;
      swift_beginAccess();
      uint64_t v56 = (uint64_t)v74;
      sub_22579F958();
      swift_endAccess();
      sub_22578CEF8(v56, (uint64_t (*)(void))sub_22578C6E4);
      sub_22579F9F8();
      id v57 = (void *)sub_22579F9E8();
      uint64_t v58 = v81;
      uint64_t v59 = v76;
      uint64_t v60 = v82;
      (*(void (**)(char *, void))(v81 + 104))(v76, *MEMORY[0x263F32EB8]);
      uint64_t v61 = v75;
      v71(v75, v27, v31);
      uint64_t v62 = sub_22579F988();
      if (v38)
      {
        v70(v61, v31);
        swift_release();
      }
      else
      {
        uint64_t v64 = v62;
        unint64_t v65 = v63;
        v70(v61, v31);
        uint64_t v66 = (void *)sub_22579F268();
        sub_2257309D8(v64, v65);
        objc_msgSend(v68, sel_setMenstrualCyclesExperienceModelData_, v66);
        swift_release();
      }
      (*(void (**)(char *, uint64_t))(v58 + 8))(v59, v60);
      sub_22578CEF8(v87, (uint64_t (*)(void))sub_22578C6E4);
      return (*(uint64_t (**)(char *, uint64_t))(v89 + 8))(v78, v90);
    }
  }
  return result;
}

uint64_t sub_22578B628(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = a3;
  uint64_t v23 = a1;
  uint64_t v4 = sub_22579F398();
  uint64_t v25 = *(void *)(v4 - 8);
  uint64_t v26 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v24 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22577CCE0();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for CoherentExperienceSetupRecord(0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225730DBC();
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = a2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v19, v15);
  sub_225730E90(&qword_26ABF97B0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  sub_22579F9B8();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, &v13[*(int *)(v11 + 20)], v7);
  sub_22578CEF8((uint64_t)v13, type metadata accessor for CoherentExperienceSetupRecord);
  uint64_t v20 = v24;
  sub_22579F4B8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v21 = v20;
  LOBYTE(v20) = sub_22579F368();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v21, v26);
  return v20 & 1;
}

uint64_t sub_22578B978()
{
  swift_getKeyPath();
  sub_225730E90(&qword_26ABF98A0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  uint64_t v0 = (void (*)(uint64_t *, void))sub_22579F938();
  sub_22572E408(0);
  sub_22579F7D8();
  v0(&v2, 0);
  return swift_release();
}

void sub_22578BA5C()
{
  sub_225730DBC();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22579F858();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_225730A30();
  if (!v1)
  {
    id v23 = v0;
    uint64_t v12 = v8;
    uint64_t v24 = v11;
    uint64_t v13 = v11 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
    swift_beginAccess();
    sub_22579F958();
    swift_endAccess();
    sub_22579F9F8();
    uint64_t v14 = sub_22579F9E8();
    uint64_t v15 = *MEMORY[0x263F32EB8];
    uint64_t v25 = v12;
    uint64_t v16 = v12;
    uint64_t v17 = (void *)v14;
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v10, v15, v7);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v13, v3);
    sub_225730E90(&qword_26ABF98A0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
    uint64_t v18 = sub_22579F988();
    unint64_t v20 = v19;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v21 = (void *)sub_22579F268();
    sub_2257309D8(v18, v20);
    objc_msgSend(v23, sel_setMenstrualCyclesExperienceModelData_, v21);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v7);
    swift_release();
  }
}

uint64_t sub_22578BD6C()
{
  swift_getKeyPath();
  sub_225730E90(&qword_26ABF98A0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  uint64_t v0 = (void (*)(uint64_t *, void))sub_22579F938();
  sub_22572E408(0);
  sub_22579F7E8();
  v0(&v2, 0);
  return swift_release();
}

BOOL HDCodableMenstrualCyclesExperienceModel.isEqual(_:)(uint64_t a1)
{
  sub_22572E408(0);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v34 - v9;
  sub_225730DBC();
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)(v11 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v34 - v17;
  sub_22578CFC8(a1, (uint64_t)v43, (uint64_t (*)(void))sub_22578CB14);
  if (v44)
  {
    sub_22572F19C(0, &qword_26ABF9A98);
    if (swift_dynamicCast())
    {
      uint64_t v41 = v5;
      unint64_t v19 = v42;
      uint64_t v20 = sub_225730A30();
      id v39 = v1;
      uint64_t v21 = v19;
      uint64_t v22 = v20;
      id v40 = v21;
      uint64_t v23 = sub_225730A30();
      uint64_t v37 = v22;
      uint64_t v38 = v23;
      uint64_t v25 = v22 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
      swift_beginAccess();
      uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
      uint64_t v36 = v13 + 16;
      v35(v18, v25, v12);
      swift_getKeyPath();
      sub_225730E90(&qword_26ABF98A0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
      sub_22579F968();
      swift_release();
      uint64_t v26 = *(void (**)(char *, uint64_t))(v13 + 8);
      v26(v18, v12);
      uint64_t v27 = v26;
      uint64_t v28 = v38 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
      swift_beginAccess();
      v35(v16, v28, v12);
      swift_getKeyPath();
      sub_22579F968();
      swift_release();
      v27(v16, v12);
      sub_22572BEA0(0);
      sub_225730E90(&qword_26ABF9A20, sub_22572BEA0);
      sub_225730E90(&qword_26ABF9A28, sub_22572BEA0);
      char v29 = sub_22579F798();
      uint64_t v30 = *(void (**)(char *, uint64_t))(v41 + 8);
      v30(v8, v4);
      v30(v10, v4);
      id v31 = v40;
      if (v29)
      {
        id v32 = objc_msgSend(v39, sel_epoch);
        id v33 = objc_msgSend(v31, sel_epoch);

        swift_release();
        swift_release();
        return v32 == v33;
      }

      swift_release();
      swift_release();
    }
  }
  else
  {
    sub_22578CEF8((uint64_t)v43, (uint64_t (*)(void))sub_22578CB14);
  }
  return 0;
}

BOOL sub_22578C2F4(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = a1;
    swift_unknownObjectRetain();
    sub_22579FD88();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = a1;
  }
  BOOL v6 = HDCodableMenstrualCyclesExperienceModel.isEqual(_:)((uint64_t)v8);

  sub_22578CEF8((uint64_t)v8, (uint64_t (*)(void))sub_22578CB14);
  return v6;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HDCodableMenstrualCyclesExperienceModel.purgeCoherentMetadataAndIncrementEpoch()()
{
  sub_225730DBC();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  BOOL v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_22579F858();
  uint64_t v7 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225730A30();
  if (!v1)
  {
    id v23 = v0;
    swift_retain();
    uint64_t v10 = sub_22579430C();
    swift_release_n();
    sub_22579F9F8();
    swift_retain();
    uint64_t v11 = sub_22579F9E8();
    uint64_t v12 = *MEMORY[0x263F32EB8];
    uint64_t v24 = v7;
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 104);
    uint64_t v14 = v26;
    v13(v9, v12, v26);
    uint64_t v25 = v10;
    uint64_t v15 = v10 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
    uint64_t v16 = (void *)v11;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v15, v3);
    sub_225730E90(&qword_26ABF98A0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
    uint64_t v17 = sub_22579F988();
    unint64_t v19 = v18;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v20 = (void *)sub_22579F268();
    sub_2257309D8(v17, v19);
    id v21 = v23;
    objc_msgSend(v23, sel_setMenstrualCyclesExperienceModelData_, v20);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v14);
    swift_release();
    uint64_t v22 = (char *)objc_msgSend(v21, sel_epoch);
    if (__OFADD__(v22, 1))
    {
      __break(1u);
    }
    else
    {
      objc_msgSend(v21, sel_setEpoch_, v22 + 1);
      swift_release();
    }
  }
}

void sub_22578C6E4(uint64_t a1)
{
}

uint64_t sub_22578C704(uint64_t a1)
{
  return sub_22578908C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32)) & 1;
}

void sub_22578C728(uint64_t a1)
{
  sub_225789520(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32));
}

unint64_t HDCodableMenstrualCyclesExperienceModel.Failure.debugDescription.getter()
{
  return 0xD000000000000044;
}

uint64_t HDCodableMenstrualCyclesExperienceModel.logDescription.getter()
{
  swift_getObjectType();
  sub_225730A30();
  type metadata accessor for CoherentExperienceSetupRecordDatabaseWrapper(0);
  swift_retain();
  sub_22579FAD8();
  sub_22579FB08();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = sub_2257A0188();
  sub_22579FB08();
  sub_22579FB08();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t static HDCodableMenstrualCyclesExperienceModel.Failure.== infix(_:_:)()
{
  return 1;
}

uint64_t HDCodableMenstrualCyclesExperienceModel.Failure.hash(into:)()
{
  return sub_2257A0118();
}

uint64_t HDCodableMenstrualCyclesExperienceModel.Failure.hashValue.getter()
{
  return sub_2257A0128();
}

uint64_t sub_22578C8E8()
{
  return 1;
}

uint64_t sub_22578C8F0()
{
  return sub_2257A0128();
}

uint64_t sub_22578C934()
{
  return sub_2257A0118();
}

uint64_t sub_22578C95C()
{
  return sub_2257A0128();
}

unint64_t sub_22578C9AC()
{
  return 0xD000000000000044;
}

id sub_22578C9C8()
{
  return objc_msgSend(v0, sel_epoch);
}

id sub_22578C9D8(uint64_t a1)
{
  return objc_msgSend(v1, sel_setEpoch_, a1);
}

id (*sub_22578C9EC(void *a1))(uint64_t a1)
{
  a1[1] = v1;
  *a1 = objc_msgSend(v1, sel_epoch);
  return sub_22578CA40;
}

id sub_22578CA40(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setEpoch_, *(void *)a1);
}

uint64_t sub_22578CA58(void (*a1)(char *, uint64_t, uint64_t))
{
  return HDCodableMenstrualCyclesExperienceModel.merge(with:)(a1);
}

void sub_22578CA70()
{
}

void sub_22578CA8C(uint64_t a1)
{
}

uint64_t sub_22578CAAC()
{
  return sub_2257A0038();
}

uint64_t sub_22578CAD8(uint64_t a1)
{
  return sub_22578B628(a1, *(void *)(v1 + 16), *(void *)(v1 + 24)) & 1;
}

uint64_t sub_22578CAF8()
{
  return sub_22578B978();
}

void sub_22578CB14()
{
  if (!qword_26ABF93A8[0])
  {
    unint64_t v0 = sub_22579FD48();
    if (!v1) {
      atomic_store(v0, qword_26ABF93A8);
    }
  }
}

unint64_t sub_22578CB70()
{
  unint64_t result = qword_2681055E8;
  if (!qword_2681055E8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_2681055E8);
  }
  return result;
}

unint64_t sub_22578CBCC()
{
  unint64_t result = qword_2681058F0;
  if (!qword_2681058F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681058F0);
  }
  return result;
}

uint64_t _s7FailureOwet(unsigned int *a1, int a2)
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

unsigned char *_s7FailureOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x22578CD10);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for HDCodableMenstrualCyclesExperienceModel.Failure()
{
  return &type metadata for HDCodableMenstrualCyclesExperienceModel.Failure;
}

void sub_22578CD48(uint64_t a1)
{
}

void sub_22578CD68(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(void))
{
  if (!*a2)
  {
    a3(255);
    a4();
    unint64_t v6 = sub_22579F4E8();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

unint64_t sub_22578CDD8()
{
  unint64_t result = qword_26ABF9748;
  if (!qword_26ABF9748)
  {
    sub_22578CD48(255);
    sub_225730E90(&qword_26ABF96F8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ABF9748);
  }
  return result;
}

uint64_t sub_22578CE78(uint64_t a1, uint64_t a2)
{
  sub_22578CF74(0, &qword_268105708, (void (*)(uint64_t))sub_225783F60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22578CEF8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22578CF58(uint64_t a1)
{
  return sub_22578AA08(a1, *(void **)(v1 + 16));
}

void sub_22578CF74(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_22579FD48();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_22578CFC8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_22578D030(uint64_t a1)
{
}

unint64_t sub_22578D050()
{
  unint64_t result = qword_268105910;
  if (!qword_268105910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268105910);
  }
  return result;
}

uint64_t sub_22578D0A4()
{
  uint64_t v0 = sub_22579F458();
  __swift_allocate_value_buffer(v0, qword_26ABF94A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26ABF94A0);
  return sub_22579F448();
}

uint64_t static Logger.menstrualCycles.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22579F458();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26ABF94A0);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
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

id HDMCExperienceStoreServer.__allocating_init(uuid:configuration:client:delegate:)(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  uint64_t v10 = (void *)sub_22579F358();
  id v11 = objc_msgSend(v9, sel_initWithUUID_configuration_client_delegate_, v10, a2, a3, a4);

  swift_unknownObjectRelease();
  uint64_t v12 = sub_22579F398();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  return v11;
}

id sub_22578D380()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22579F458();
  __swift_project_value_buffer(v2, (uint64_t)qword_26ABF94A0);
  uint64_t v3 = sub_22579F438();
  os_log_type_t v4 = sub_22579FCB8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v10 = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    uint64_t v7 = sub_2257A0188();
    sub_22572E428(v7, v8, &v10);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v3, v4, "[%{public}s] Stopping observation", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v6, -1, -1);
    MEMORY[0x22A635470](v5, -1, -1);
  }

  id result = *(id *)(v1 + OBJC_IVAR___HDMCExperienceStoreServer_experienceModelManager);
  if (result) {
    return objc_msgSend(result, sel_removeWithObserver_, v1);
  }
  return result;
}

uint64_t sub_22578D574(void *a1, void (*a2)(uint64_t, void), uint64_t a3)
{
  uint64_t v6 = sub_22579F398();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(a1, sel_sampleUUID);
  sub_22579F378();

  sub_22578D8E4(a1, (uint64_t)v9, a2, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_22578D7EC(void *a1, uint64_t a2, void (*a3)(uint64_t, void), uint64_t a4)
{
  uint64_t v7 = sub_22579F398();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22579F378();
  sub_22578D8E4(a1, (uint64_t)v10, a3, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_22578D8E4(void *a1, uint64_t a2, void (*a3)(uint64_t, void), uint64_t a4)
{
  id v33 = a3;
  uint64_t ObjectType = swift_getObjectType();
  sub_22578CA8C(0);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_22579F458();
  __swift_project_value_buffer(v11, (uint64_t)qword_26ABF94A0);
  uint64_t v12 = sub_22579F438();
  os_log_type_t v13 = sub_22579FCB8();
  if (os_log_type_enabled(v12, v13))
  {
    char v29 = a1;
    uint64_t v30 = v10;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v31 = a4;
    uint64_t v15 = (uint8_t *)v14;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v35 = v16;
    *(_DWORD *)uint64_t v15 = 136446210;
    uint64_t v17 = sub_2257A0188();
    uint64_t v34 = sub_22572E428(v17, v18, &v35);
    sub_22579FD68();
    a1 = v29;
    id v10 = v30;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v12, v13, "[%{public}s] Writing to experience model", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v16, -1, -1);
    MEMORY[0x22A635470](v15, -1, -1);
  }

  id v19 = objc_msgSend(v4, sel_client);
  id v20 = objc_msgSend(v19, sel_profile);

  type metadata accessor for HDMCExperienceDaemonStore();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = v20;
  id v22 = objc_allocWithZone(MEMORY[0x263F43218]);
  id v23 = v20;
  uint64_t v24 = (void *)sub_22579FA98();
  id v25 = objc_msgSend(v22, sel_initWithCategory_domainName_profile_, 100, v24, v23);

  *(void *)(inited + 24) = v25;
  id v26 = HDMCExperienceDaemonStore.fetchPersistedOrDefaultState()();
  uint64_t v27 = sub_22579F398();
  uint64_t v28 = *(void *)(v27 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v10, a2, v27);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v10, 0, 1, v27);
  HDCodableMenstrualCyclesExperienceModel.insert(record:oldSampleUUID:)(a1, (uint64_t)v10);
  sub_22578F520((uint64_t)v10, (uint64_t (*)(void))sub_22578CA8C);
  HDMCExperienceDaemonStore.setModel(_:)(v26);
  v33(1, 0);
  swift_setDeallocating();
}

void sub_22578E000(void *a1, void (*a2)(uint64_t, void), uint64_t a3)
{
  os_log_type_t v4 = v3;
  id v33 = a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = sub_22579F398();
  uint64_t v31 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_22579F458();
  __swift_project_value_buffer(v10, (uint64_t)qword_26ABF94A0);
  uint64_t v11 = sub_22579F438();
  os_log_type_t v12 = sub_22579FCB8();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v29 = v7;
    os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v30 = a3;
    uint64_t v15 = v14;
    uint64_t v35 = v14;
    uint64_t v28 = v4;
    *(_DWORD *)os_log_type_t v13 = 136446210;
    uint64_t v16 = sub_2257A0188();
    uint64_t v34 = sub_22572E428(v16, v17, &v35);
    os_log_type_t v4 = v28;
    uint64_t v7 = v29;
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v11, v12, "[%{public}s] Deleting record from experience model", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v15, -1, -1);
    MEMORY[0x22A635470](v13, -1, -1);
  }

  id v18 = objc_msgSend(v4, sel_client);
  id v19 = objc_msgSend(v18, sel_profile);

  type metadata accessor for HDMCExperienceDaemonStore();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = v19;
  id v21 = objc_allocWithZone(MEMORY[0x263F43218]);
  id v22 = v19;
  id v23 = (void *)sub_22579FA98();
  id v24 = objc_msgSend(v21, sel_initWithCategory_domainName_profile_, 100, v23, v22);

  *(void *)(inited + 24) = v24;
  id v25 = HDMCExperienceDaemonStore.fetchPersistedOrDefaultState()();
  id v26 = objc_msgSend(a1, sel_sampleUUID);
  sub_22579F378();

  HDCodableMenstrualCyclesExperienceModel.deleteRecord(with:)((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v7);
  HDMCExperienceDaemonStore.setModel(_:)(v25);
  v33(1, 0);
  swift_setDeallocating();
}

void sub_22578E640(void (*a1)(id, void))
{
  uint64_t v2 = v1;
  swift_getObjectType();
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_22579F458();
  __swift_project_value_buffer(v4, (uint64_t)qword_26ABF94A0);
  uint64_t v5 = sub_22579F438();
  os_log_type_t v6 = sub_22579FCB8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v15 = v8;
    *(_DWORD *)uint64_t v7 = 136446210;
    uint64_t v9 = sub_2257A0188();
    sub_22572E428(v9, v10, &v15);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v5, v6, "[%{public}s] Getting cached model", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v8, -1, -1);
    MEMORY[0x22A635470](v7, -1, -1);
  }

  uint64_t v11 = MEMORY[0x22A635500](v2 + OBJC_IVAR___HDMCExperienceStoreServer_pregnancyManager);
  if (v11)
  {
    os_log_type_t v12 = (void *)v11;
    os_log_type_t v13 = HDMCPregnancyManager.getCurrentPregnancyModel()();
  }
  else
  {
    os_log_type_t v13 = 0;
  }
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F45128]), sel_initWithModel_, v13);
  a1(v14, 0);
}

void sub_22578E874(void (*a1)(uint64_t, void))
{
  uint64_t v2 = v1;
  swift_getObjectType();
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_22579F458();
  __swift_project_value_buffer(v4, (uint64_t)qword_26ABF94A0);
  uint64_t v5 = sub_22579F438();
  os_log_type_t v6 = sub_22579FCB8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v19 = v8;
    *(_DWORD *)uint64_t v7 = 136446210;
    uint64_t v9 = sub_2257A0188();
    sub_22572E428(v9, v10, &v19);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v5, v6, "[%{public}s] Deleting all setup records", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v8, -1, -1);
    MEMORY[0x22A635470](v7, -1, -1);
  }

  id v11 = objc_msgSend(v2, sel_client);
  id v12 = objc_msgSend(v11, sel_profile);

  type metadata accessor for HDMCExperienceDaemonStore();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = v12;
  id v14 = objc_allocWithZone(MEMORY[0x263F43218]);
  id v15 = v12;
  uint64_t v16 = (void *)sub_22579FA98();
  id v17 = objc_msgSend(v14, sel_initWithCategory_domainName_profile_, 100, v16, v15);

  *(void *)(inited + 24) = v17;
  id v18 = HDMCExperienceDaemonStore.fetchPersistedOrDefaultState()();
  sub_22578BA5C();
  HDMCExperienceDaemonStore.setModel(_:)(v18);
  a1(1, 0);
}

id HDMCExperienceStoreServer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HDMCExperienceStoreServer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall HDMCExperienceStoreServer.experienceModelManagerDidUpdateModel()()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22579F458();
  __swift_project_value_buffer(v2, (uint64_t)qword_26ABF94A0);
  uint64_t v3 = sub_22579F438();
  os_log_type_t v4 = sub_22579FCB8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v35[0] = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    uint64_t v7 = sub_2257A0188();
    uint64_t v34 = (void *)sub_22572E428(v7, v8, v35);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v3, v4, "[%{public}s] Received an update for the experience model", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v6, -1, -1);
    MEMORY[0x22A635470](v5, -1, -1);
  }

  id v9 = objc_msgSend(v1, sel_client);
  id v10 = objc_msgSend(v9, sel_connection);

  if (v10
    && (id v11 = objc_msgSend(v10, sel_remoteObjectProxy),
        v10,
        sub_22579FD88(),
        swift_unknownObjectRelease(),
        sub_22578F580(),
        (swift_dynamicCast() & 1) != 0))
  {
    id v12 = objc_msgSend(v1, sel_client);
    id v13 = objc_msgSend(v12, sel_profile);

    type metadata accessor for HDMCExperienceDaemonStore();
    uint64_t inited = swift_initStackObject();
    *(void *)(inited + 16) = v13;
    id v15 = objc_allocWithZone(MEMORY[0x263F43218]);
    id v16 = v13;
    id v17 = (void *)sub_22579FA98();
    id v18 = objc_msgSend(v15, sel_initWithCategory_domainName_profile_, 100, v17, v16);

    *(void *)(inited + 24) = v18;
    id v19 = HDMCExperienceDaemonStore.fetchLocallyPersistedData()();
    id v26 = v19;
    if (v19)
    {
      sub_225730A30();
      id v33 = sub_22572BEDC();
      swift_release();
      objc_msgSend(v34, sel_client_experienceModelDidUpdate_, v33);

      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v27 = sub_22579F438();
      os_log_type_t v28 = sub_22579FCB8();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        uint64_t v30 = swift_slowAlloc();
        v35[0] = v30;
        *(_DWORD *)uint64_t v29 = 136315138;
        uint64_t v31 = sub_2257A0188();
        sub_22572E428(v31, v32, v35);
        sub_22579FD68();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_225722000, v27, v28, "[%s] Nil experience model", v29, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A635470](v30, -1, -1);
        MEMORY[0x22A635470](v29, -1, -1);
        swift_unknownObjectRelease();
      }
      else
      {

        swift_unknownObjectRelease();
      }
      swift_release();
    }
  }
  else
  {
    id v20 = sub_22579F438();
    os_log_type_t v21 = sub_22579FCA8();
    if (os_log_type_enabled(v20, v21))
    {
      id v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      v35[0] = v23;
      *(_DWORD *)id v22 = 136315138;
      uint64_t v24 = sub_2257A0188();
      sub_22572E428(v24, v25, v35);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v20, v21, "[%s] Unexpected client interface", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v23, -1, -1);
      MEMORY[0x22A635470](v22, -1, -1);
    }
  }
}

uint64_t sub_22578F520(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_22578F580()
{
  unint64_t result = qword_268105948;
  if (!qword_268105948)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_268105948);
  }
  return result;
}

uint64_t method lookup function for HDMCExperienceStoreServer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HDMCExperienceStoreServer);
}

uint64_t dispatch thunk of HDMCExperienceStoreServer.remote_startObservingChanges(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of HDMCExperienceStoreServer.remote_stopObservingChanges()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of HDMCExperienceStoreServer.remote_getExperienceModel(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of HDMCExperienceStoreServer.remote_persistSetupRecord(_:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of HDMCExperienceStoreServer.remote_persistSetupRecord(_:mergeWith:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

{
  void *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of HDMCExperienceStoreServer.remote_deleteSetupRecord(_:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of HDMCExperienceStoreServer.remote_getCachedPregnancyModel(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of HDMCExperienceStoreServer.remote_deleteAllPregnancySetupRecords(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t sub_22578F7C4()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t sub_22578F820()
{
  unint64_t result = qword_268105A20;
  if (!qword_268105A20)
  {
    sub_22579F338();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268105A20);
  }
  return result;
}

uint64_t ExperienceModelSyncStateUpdaterDelegate.__allocating_init(logger:key:supportedSyncVersionRange:domain:store:maxDataSizeInBytes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v18[1] = a6;
  void v18[2] = a8;
  uint64_t v11 = sub_22579F458();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = objc_allocWithZone(v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  v18[3] = a7;
  uint64_t v16 = sub_22579F428();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  return v16;
}

uint64_t ExperienceModelSyncStateUpdaterDelegate.init(logger:key:supportedSyncVersionRange:domain:store:maxDataSizeInBytes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v15[1] = a8;
  uint64_t v10 = sub_22579F458();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  v15[3] = a7;
  uint64_t v13 = sub_22579F428();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  return v13;
}

id ExperienceModelSyncStateUpdaterDelegate.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ExperienceModelSyncStateUpdaterDelegate()
{
  uint64_t result = qword_268105A28;
  if (!qword_268105A28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22578FB88()
{
  return swift_initClassMetadata2();
}

uint64_t sub_22578FBC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8)
{
  v19[1] = a6;
  v19[2] = a8;
  uint64_t v11 = sub_22579F458();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *a7;
  id v16 = objc_allocWithZone(v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  v19[3] = v15;
  uint64_t v17 = sub_22579F428();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  return v17;
}

uint64_t sub_22578FD14()
{
  return type metadata accessor for ExperienceModelSyncStateUpdaterDelegate();
}

uint64_t sub_22578FD1C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v18 = MEMORY[0x263F8EE78];
  sub_2257827A8(0, v1, 0);
  uint64_t v2 = v18;
  uint64_t result = sub_22578324C(a1);
  uint64_t v5 = result;
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(unsigned char *)(a1 + 32))
  {
    if (((*(void *)(a1 + 56 + (((unint64_t)v5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
      goto LABEL_19;
    }
    if (*(_DWORD *)(a1 + 36) != v7) {
      goto LABEL_20;
    }
    if (*(unsigned char *)(*(void *)(a1 + 48) + v5)) {
      unint64_t v10 = 0xD000000000000014;
    }
    else {
      unint64_t v10 = 0xD000000000000010;
    }
    if (*(unsigned char *)(*(void *)(a1 + 48) + v5)) {
      unint64_t v11 = 0x80000002257A8B30;
    }
    else {
      unint64_t v11 = 0x80000002257A8B50;
    }
    unint64_t v13 = *(void *)(v18 + 16);
    unint64_t v12 = *(void *)(v18 + 24);
    if (v13 >= v12 >> 1)
    {
      char v17 = v9;
      sub_2257827A8(v12 > 1, v13 + 1, 1);
      char v9 = v17;
    }
    *(void *)(v18 + 16) = v13 + 1;
    uint64_t v14 = v18 + 16 * v13;
    *(void *)(v14 + 32) = v10;
    *(void *)(v14 + 40) = v11;
    uint64_t result = sub_2257832F0(v5, v7, v9 & 1, a1);
    uint64_t v5 = result;
    uint64_t v7 = v15;
    char v9 = v16 & 1;
    if (!--v1)
    {
      sub_225783FD4(result, v15, v9);
      return v2;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

void sub_22578FEC8(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_225791034(a1);
  unint64_t v6 = v5;
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_22579F458();
  __swift_project_value_buffer(v7, (uint64_t)qword_26ABF94A0);
  swift_bridgeObjectRetain();
  char v8 = sub_22579F438();
  os_log_type_t v9 = sub_22579FCB8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v13 = v11;
    *(_DWORD *)uint64_t v10 = 136446466;
    sub_22572E428(0xD00000000000001ALL, 0x80000002257A4CD0, &v13);
    sub_22579FD68();
    *(_WORD *)(v10 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_22572E428(v4, v6, &v13);
    sub_22579FD68();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_225722000, v8, v9, "[%{public}s] reloading widgets with reason: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v11, -1, -1);
    MEMORY[0x22A635470](v10, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_225791034(a1);
  unint64_t v12 = (void *)sub_22579FA98();
  swift_bridgeObjectRelease();
}

unint64_t HDMCWidgetReloadReason.description.getter()
{
  if (*v0) {
    return 0xD000000000000014;
  }
  else {
    return 0xD000000000000010;
  }
}

void sub_225790140(uint64_t a1)
{
  sub_22578FEC8(a1, *v1);
}

BOOL static HDMCWidgetReloadReason.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t HDMCWidgetReloadReason.hash(into:)()
{
  return sub_2257A0118();
}

uint64_t HDMCWidgetReloadReason.hashValue.getter()
{
  return sub_2257A0128();
}

unint64_t sub_2257901D4()
{
  if (*v0) {
    return 0xD000000000000014;
  }
  else {
    return 0xD000000000000010;
  }
}

uint64_t sub_225790214()
{
  return sub_2257A0128();
}

uint64_t sub_22579025C()
{
  return sub_2257A0118();
}

uint64_t sub_225790288()
{
  return sub_2257A0128();
}

unint64_t sub_2257902D0()
{
  unint64_t result = qword_26ABF96E8;
  if (!qword_26ABF96E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ABF96E8);
  }
  return result;
}

uint64_t dispatch thunk of HDMCWidgetTimelineReloading.reloadWidgets(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

unsigned char *storeEnumTagSinglePayload for HDMCWidgetReloadReason(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x225790404);
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

ValueMetadata *type metadata accessor for HDMCWidgetReloadReason()
{
  return &type metadata for HDMCWidgetReloadReason;
}

uint64_t sub_22579043C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_225786238(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_2257904A8(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_2257904A8(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_2257A0028();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_225790B94(0, v3, 1, a1);
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
    goto LABEL_160;
  }
  uint64_t v105 = result;
  uint64_t v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v11 = (char *)MEMORY[0x263F8EE78];
LABEL_118:
      uint64_t v94 = v11;
      uint64_t v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          uint64_t v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_225790C64((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v97 = sub_225785EAC((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          unint64_t v100 = &v97[16 * v96 + 32];
          *(void *)unint64_t v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          uint64_t v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(void *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v104 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_22579FB98();
    *(void *)(v7 + 16) = v6;
    uint64_t v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v106 = v3;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    uint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    char v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = sub_2257A0068();
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    os_log_type_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      uint64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_2257A0068()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      uint64_t v22 = v20 + 1;
      uint64_t v9 = v20;
      uint64_t v20 = v22;
    }
    while (v22 < v3);
    uint64_t v20 = v22;
LABEL_36:
    uint64_t v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        uint64_t v27 = v20;
        uint64_t v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - _Block_object_dispose(&STACK[0x4A8], 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      uint64_t v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_225785C0C(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      uint64_t v11 = sub_225785C0C((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    uint64_t v42 = v11 + 32;
    uint64_t v43 = &v11[16 * v41 + 32];
    *(void *)uint64_t v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      uint64_t v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          id v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            uint64_t v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        uint64_t v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        id v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        unint64_t v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
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
          goto LABEL_154;
        }
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        uint64_t v85 = v11;
        uint64_t v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        uint64_t v88 = v42;
        unint64_t v89 = v44;
        uint64_t v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_225790C64((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)uint64_t v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        uint64_t v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        uint64_t v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        uint64_t v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v3 = v106;
    if (v9 >= v106)
    {
      uint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    uint64_t v32 = v3;
  }
  else {
    uint64_t v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      id v33 = (void *)(v10 + 16 * v9);
      do
      {
        uint64_t v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        uint64_t v37 = v13;
        uint64_t v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_2257A0068() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)uint64_t v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      uint64_t v9 = v32;
    }
    goto LABEL_67;
  }
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
  uint64_t result = sub_22579FF68();
  __break(1u);
  return result;
}

uint64_t sub_225790B94(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (uint64_t result = sub_2257A0068(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_225790C64(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  uint64_t v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      char v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      uint64_t v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          uint64_t v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (sub_2257A0068() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)uint64_t v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
            }
            uint64_t v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    uint64_t v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_2257A0068() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      uint64_t v27 = v7;
    }
LABEL_50:
    sub_225785DF0((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_22579FFD8();
  __break(1u);
  return result;
}

id sub_225790F00(void *a1)
{
  id v1 = objc_msgSend(a1, sel_daemon);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_behavior);

    objc_msgSend(v3, sel_isAppleWatch);
  }
  sub_22579FAC8();
  sub_22579FAC8();
  id v4 = objc_allocWithZone(MEMORY[0x263F31E68]);
  uint64_t v5 = (void *)sub_22579FA98();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)sub_22579FA98();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v4, sel_initWithExtensionBundleIdentifier_kind_, v5, v6);

  return v7;
}

ValueMetadata *type metadata accessor for HDMCWidgetTimelineReloader()
{
  return &type metadata for HDMCWidgetTimelineReloader;
}

uint64_t sub_225791034(uint64_t a1)
{
  v2[0] = sub_22578FD1C(a1);
  swift_bridgeObjectRetain();
  sub_22579043C(v2);
  swift_bridgeObjectRelease();
  v2[0] = 91;
  v2[1] = 0xE100000000000000;
  sub_225791110();
  sub_225791168();
  sub_22579FA68();
  swift_release();
  sub_22579FB08();
  swift_bridgeObjectRelease();
  sub_22579FB08();
  return v2[0];
}

void sub_225791110()
{
  if (!qword_26ABF95C8)
  {
    unint64_t v0 = sub_22579FBB8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ABF95C8);
    }
  }
}

unint64_t sub_225791168()
{
  unint64_t result = qword_26ABF9A60;
  if (!qword_26ABF9A60)
  {
    sub_225791110();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ABF9A60);
  }
  return result;
}

void HDMCPregnancyManager.register(_:isUserInitiated:)(uint64_t a1, char a2)
{
  swift_getObjectType();
  sub_225792BFC(a1, a2, v2);
}

id HDMCPregnancyManager.unregisterObserver(_:)(uint64_t a1)
{
  swift_getObjectType();
  return sub_225792C78(a1, v1);
}

void *HDMCPregnancyManager.getCurrentPregnancyModel()()
{
  swift_getObjectType();
  uint64_t v1 = *(os_unfair_lock_s **)(v0
                            + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_lockedPregnancyModel);
  uint64_t v2 = (void **)&v1[4];
  id v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_225737DFC(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

uint64_t HDMCPregnancyManager.DeriveOperationState.hash(into:)()
{
  return sub_2257A0118();
}

BOOL static HDMCPregnancyManager.DeriveOperationState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t HDMCPregnancyManager.DeriveOperationState.hashValue.getter()
{
  return sub_2257A0128();
}

BOOL sub_22579134C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

id HDMCPregnancyManager.protectedDataOperation.getter()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_protectedDataOperation));
}

uint64_t HDMCPregnancyManager.lockedOperationState.getter()
{
  return swift_retain();
}

char *HDMCPregnancyManager.__allocating_init(profile:operation:experienceModelProvider:notificationProvider:calendarCache:)(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v11 = objc_allocWithZone(v5);
  id v12 = objc_allocWithZone(v5);
  uint64_t v13 = HDMCPregnancyManager.init(shouldRequestWorkOnInitialization:profile:operation:experienceModelProvider:notificationProvider:calendarCache:)(1, a1, a2, a3, a4, a5);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v13;
}

char *HDMCPregnancyManager.init(profile:operation:experienceModelProvider:notificationProvider:calendarCache:)(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10 = objc_allocWithZone((Class)swift_getObjectType());
  id v11 = HDMCPregnancyManager.init(shouldRequestWorkOnInitialization:profile:operation:experienceModelProvider:notificationProvider:calendarCache:)(1, a1, a2, a3, a4, a5);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v11;
}

char *HDMCPregnancyManager.__allocating_init(shouldRequestWorkOnInitialization:profile:operation:experienceModelProvider:notificationProvider:calendarCache:)(int a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v13 = objc_allocWithZone(v6);
  return HDMCPregnancyManager.init(shouldRequestWorkOnInitialization:profile:operation:experienceModelProvider:notificationProvider:calendarCache:)(a1, a2, a3, a4, a5, a6);
}

char *HDMCPregnancyManager.init(shouldRequestWorkOnInitialization:profile:operation:experienceModelProvider:notificationProvider:calendarCache:)(int a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v59 = a5;
  id v60 = a6;
  uint64_t v63 = a4;
  id v57 = a3;
  uint64_t v58 = a2;
  int v62 = a1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v56 = sub_22579FCD8();
  uint64_t v7 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  int64_t v9 = (char *)v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22579FCE8();
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = sub_22579F478();
  MEMORY[0x270FA5388](v11 - 8);
  v55[1] = &v6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_profile];
  swift_unknownObjectWeakInit();
  uint64_t v12 = OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_lockedOperationState;
  sub_225792CE4();
  uint64_t v13 = swift_allocObject();
  *(_DWORD *)(v13 + 20) = 0;
  *(unsigned char *)(v13 + 16) = 0;
  *(void *)&v6[v12] = v13;
  uint64_t v14 = OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_lockedPregnancyModel;
  sub_225792D44();
  uint64_t v15 = swift_allocObject();
  *(_DWORD *)(v15 + 24) = 0;
  *(void *)(v15 + 16) = 0;
  *(void *)&v6[v14] = v15;
  v55[0] = OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_queue;
  sub_22572F19C(0, (unint64_t *)&qword_26ABF9548);
  uint64_t v16 = v6;
  sub_22579F468();
  uint64_t v66 = MEMORY[0x263F8EE78];
  sub_225732B14(&qword_26ABF9540, MEMORY[0x263F8F198]);
  sub_225792DC4();
  sub_225732B14((unint64_t *)&unk_26ABF94C0, (void (*)(uint64_t))sub_225792DC4);
  char v17 = v57;
  sub_22579FD98();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F138], v56);
  uint64_t v18 = v58;
  *(void *)&v6[v55[0]] = sub_22579FCF8();
  v16[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_shouldReRequestWork] = 0;
  swift_unknownObjectWeakAssign();
  id v19 = v59;
  *(void *)&v16[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_notificationProvider] = v59;
  id v20 = v19;
  *(void *)&v16[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_significantTimeChangeToken] = swift_slowAlloc();
  if (v17)
  {
    id v21 = v17;
  }
  else
  {
    id v22 = objc_allocWithZone(MEMORY[0x263F432D8]);
    id v23 = v18;
    uint64_t v24 = (void *)sub_22579FA98();
    id v21 = objc_msgSend(v22, sel_initWithProfile_debugIdentifier_delegate_, v23, v24, 0);
  }
  *(void *)&v16[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_protectedDataOperation] = v21;
  uint64_t v25 = (void **)MEMORY[0x263F09930];
  uint64_t v26 = (void *)*MEMORY[0x263F09930];
  id v27 = objc_allocWithZone(MEMORY[0x263F0A5A8]);
  id v59 = v17;
  id v28 = v26;
  uint64_t v29 = (void *)sub_22579FA98();
  id v30 = objc_msgSend(v27, sel_initWithName_loggingCategory_, v29, v28);

  *(void *)&v16[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers] = v30;
  uint64_t v31 = *v25;
  id v32 = objc_allocWithZone(MEMORY[0x263F0A5A8]);
  id v33 = v31;
  uint64_t v34 = (void *)sub_22579FA98();
  id v35 = objc_msgSend(v32, sel_initWithName_loggingCategory_, v34, v33);

  *(void *)&v16[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers] = v35;
  uint64_t v36 = v60;
  *(void *)&v16[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_calendarCache] = v60;
  id v37 = v36;

  uint64_t v38 = ObjectType;
  v65.receiver = v16;
  v65.super_class = ObjectType;
  id v39 = objc_msgSendSuper2(&v65, sel_init);
  uint64_t v40 = qword_26ABF9378;
  unint64_t v41 = (char *)v39;
  if (v40 != -1) {
    swift_once();
  }
  uint64_t v42 = sub_22579F458();
  __swift_project_value_buffer(v42, (uint64_t)qword_26ABF94A0);
  uint64_t v43 = sub_22579F438();
  os_log_type_t v44 = sub_22579FCB8();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    uint64_t v64 = v46;
    id v57 = v37;
    *(_DWORD *)uint64_t v45 = 136315138;
    id v60 = v20;
    uint64_t v66 = (uint64_t)v38;
    swift_getMetatypeMetadata();
    uint64_t v47 = sub_225737FD8();
    uint64_t v66 = sub_22572E428(v47, v48, &v64);
    id v20 = v60;
    id v37 = v57;
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v43, v44, "[%s] Initializing", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v46, -1, -1);
    MEMORY[0x22A635470](v45, -1, -1);
  }

  uint64_t v49 = v63;
  objc_msgSend(*(id *)&v41[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_protectedDataOperation], sel_setDelegate_, v41);
  objc_msgSend(v49, sel_registerWithObserver_, v41);
  uint64_t v50 = (void *)MEMORY[0x22A635500](&v41[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_profile]);
  if (v50)
  {
    uint64_t v51 = v50;
    id v52 = objc_msgSend(v50, sel_dataManager);

    sub_22572F19C(0, &qword_26ABF94E8);
    uint64_t v53 = (void *)MEMORY[0x22A634170]((id)*MEMORY[0x263F093C0]);
    objc_msgSend(v52, sel_addObserver_forDataType_, v41, v53);
  }
  sub_225791F70();
  if (v62) {
    sub_22572CA2C(2, 0);
  }

  swift_unknownObjectRelease();
  return v41;
}

id HDMCPregnancyManager.__deallocating_deinit()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v3 = (void *)MEMORY[0x22A635500](&v0[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_profile]);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(v3, sel_dataManager);

    sub_22572F19C(0, &qword_26ABF94E8);
    uint64_t v6 = (void *)*MEMORY[0x263F093C0];
    uint64_t v7 = v1;
    uint64_t v8 = (void *)MEMORY[0x22A634170](v6);
    objc_msgSend(v5, sel_removeObserver_forDataType_, v7, v8);
  }
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_notificationProvider], sel_removeObserver_, v1);
  uint64_t v9 = OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_significantTimeChangeToken;
  if (notify_is_valid_token(**(_DWORD **)&v1[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_significantTimeChangeToken]))
  {
    notify_cancel(**(_DWORD **)&v1[v9]);
    MEMORY[0x22A635470](*(void *)&v1[v9], -1, -1);
  }
  v11.receiver = v1;
  v11.super_class = ObjectType;
  return objc_msgSendSuper2(&v11, sel_dealloc);
}

id sub_225791F70()
{
  uint64_t v1 = *(int **)(v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_significantTimeChangeToken);
  uint64_t v2 = *(NSObject **)(v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_queue);
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  long long v6[4] = sub_22579355C;
  v6[5] = v3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  id v6[2] = sub_2257922C0;
  void v6[3] = &block_descriptor_21;
  id v4 = _Block_copy(v6);
  swift_release();
  notify_register_dispatch("SignificantTimeChangeNotification", v1, v2, v4);
  _Block_release(v4);
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_notificationProvider), sel_addObserver_selector_name_object_, v0, sel_significantTimeChangeDidOccur, *MEMORY[0x263EFF3C8], 0);
}

unsigned char *sub_225792098(unsigned char *result)
{
  *unint64_t result = 0;
  return result;
}

void sub_2257920A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x22A635500](v2);
  if (v3)
  {
    id v4 = (void *)v3;
    sub_2257920F4();
  }
}

void sub_2257920F4()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_22579F458();
  __swift_project_value_buffer(v3, (uint64_t)qword_26ABF94A0);
  id v4 = sub_22579F438();
  os_log_type_t v5 = sub_22579FCB8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v11 = v7;
    uint64_t v12 = ObjectType;
    *(_DWORD *)uint64_t v6 = 136315138;
    swift_getMetatypeMetadata();
    uint64_t v8 = sub_225737FD8();
    uint64_t v12 = sub_22572E428(v8, v9, &v11);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v4, v5, "[%s] Received a significant time change notification", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v7, -1, -1);
    MEMORY[0x22A635470](v6, -1, -1);
  }

  if ((uint64_t)objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers), sel_count) >= 1)uint64_t v10 = 1; {
  else
  }
    uint64_t v10 = 2;
  sub_22572CA2C(v10, 3);
}

uint64_t sub_2257922C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id HDMCPregnancyManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void HDMCPregnancyManager.init()()
{
}

void HDMCPregnancyManager.performWork(for:profile:databaseAccessibilityAssertion:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
}

void sub_2257923FC(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A488]), sel_initWithState_pregnancyStartDate_pregnancyEndDate_estimatedDueDate_pregnancyDuration_physiologicalWashoutEndDate_behavioralWashoutEndDate_trimesters_sample_educationalStepsCompletedDate_, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  objc_msgSend(a1, sel_pregnancyModelDidUpdate_, v2);
}

id HKMCPregnancyModel.init(state:)(uint64_t a1)
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithState_pregnancyStartDate_pregnancyEndDate_estimatedDueDate_pregnancyDuration_physiologicalWashoutEndDate_behavioralWashoutEndDate_trimesters_sample_educationalStepsCompletedDate_, a1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

Swift::String __swiftcall HDMCPregnancyManager.diagnosticDescription()()
{
  id v1 = (os_unfair_lock_s *)(*(void *)(v0
                                      + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_lockedOperationState)
                          + 20);
  os_unfair_lock_lock(v1);
  sub_2257931A4(v5);
  os_unfair_lock_unlock(v1);
  uint64_t v2 = v5[0];
  uint64_t v3 = (void *)v5[1];
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t sub_22579261C@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  sub_22579FEB8();
  sub_22579FB08();
  sub_22579FAD8();
  sub_22579FB08();
  swift_bridgeObjectRelease();
  sub_22579FB08();
  id v4 = *(void **)(a1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers);
  objc_msgSend(v4, sel_count);
  sub_2257A0038();
  sub_22579FB08();
  swift_bridgeObjectRelease();
  sub_22579FB08();
  objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers), sel_count);
  sub_2257A0038();
  sub_22579FB08();
  swift_bridgeObjectRelease();
  sub_22579FB08();
  id v5 = objc_msgSend(v4, sel_allObservers);
  unint64_t v6 = sub_22579343C();
  uint64_t v7 = sub_22579FB58();

  MEMORY[0x22A634010](v7, v6);
  sub_22579FB08();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = 0;
  a2[1] = 0xE000000000000000;
  return result;
}

Swift::Void __swiftcall HDMCPregnancyManager.experienceModelManagerDidUpdateModel()()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  if (HKShowSensitiveLogItems())
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_22579F458();
    __swift_project_value_buffer(v2, (uint64_t)qword_26ABF94A0);
    uint64_t v3 = sub_22579F438();
    os_log_type_t v4 = sub_22579FCB8();
    if (os_log_type_enabled(v3, v4))
    {
      id v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      uint64_t v11 = v6;
      *(_DWORD *)id v5 = 136315138;
      uint64_t v7 = sub_2257A0188();
      uint64_t v10 = sub_22572E428(v7, v8, &v11);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v3, v4, "[%s] Received experience model update", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v6, -1, -1);
      MEMORY[0x22A635470](v5, -1, -1);
    }
  }
  if ((uint64_t)objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers), sel_count, v10, v11) >= 1)uint64_t v9 = 1; {
  else
  }
    uint64_t v9 = 2;
  sub_22572CA2C(v9, 5);
}

void sub_225792BFC(uint64_t a1, char a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a3 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers), sel_registerObserver_, a1);
  if (a2)
  {
    objc_msgSend(*(id *)(a3 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers), sel_registerObserver_, a1);
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 2;
  }
  sub_22572CA2C(v6, 4);
}

id sub_225792C78(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_observers), sel_unregisterObserver_, a1);
  os_log_type_t v4 = *(void **)(a2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers);
  return objc_msgSend(v4, sel_unregisterObserver_, a1);
}

void sub_225792CE4()
{
  if (!qword_26ABF9590)
  {
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_22579FEE8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ABF9590);
    }
  }
}

void sub_225792D44()
{
  if (!qword_26ABF9598)
  {
    sub_2257934CC(255, (unint64_t *)&unk_26ABF9500, &qword_26ABF94F8);
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_22579FEE8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ABF9598);
    }
  }
}

void sub_225792DC4()
{
  if (!qword_26ABF94B8)
  {
    sub_22579FCE8();
    unint64_t v0 = sub_22579FBB8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ABF94B8);
    }
  }
}

void _s27HealthMenstrualCyclesDaemon20HDMCPregnancyManagerC12samplesAdded_6anchorySaySo8HKSampleCG_So8NSNumberCtF_0()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  if (HKShowSensitiveLogItems())
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_22579F458();
    __swift_project_value_buffer(v2, (uint64_t)qword_26ABF94A0);
    uint64_t v3 = sub_22579F438();
    os_log_type_t v4 = sub_22579FCB8();
    if (os_log_type_enabled(v3, v4))
    {
      id v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      uint64_t v11 = v6;
      *(_DWORD *)id v5 = 136315138;
      uint64_t v7 = sub_2257A0188();
      uint64_t v10 = sub_22572E428(v7, v8, &v11);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v3, v4, "[%s] Pregnancy samples added, requesting work", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v6, -1, -1);
      MEMORY[0x22A635470](v5, -1, -1);
    }
  }
  if ((uint64_t)objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers), sel_count, v10, v11) >= 1)uint64_t v9 = 1; {
  else
  }
    uint64_t v9 = 2;
  sub_22572CA2C(v9, 1);
}

void _s27HealthMenstrualCyclesDaemon20HDMCPregnancyManagerC7samples18ofTypesWereRemoved6anchorySaySo12HKSampleTypeCG_So8NSNumberCtF_0()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  if (HKShowSensitiveLogItems())
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_22579F458();
    __swift_project_value_buffer(v2, (uint64_t)qword_26ABF94A0);
    uint64_t v3 = sub_22579F438();
    os_log_type_t v4 = sub_22579FCB8();
    if (os_log_type_enabled(v3, v4))
    {
      id v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      uint64_t v11 = v6;
      *(_DWORD *)id v5 = 136315138;
      uint64_t v7 = sub_2257A0188();
      uint64_t v10 = sub_22572E428(v7, v8, &v11);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v3, v4, "[%s] Pregnancy samples deleted, requesting work", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A635470](v6, -1, -1);
      MEMORY[0x22A635470](v5, -1, -1);
    }
  }
  if ((uint64_t)objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon20HDMCPregnancyManager_userInitiatedObservers), sel_count, v10, v11) >= 1)uint64_t v9 = 1; {
  else
  }
    uint64_t v9 = 2;
  sub_22572CA2C(v9, 2);
}

uint64_t sub_2257931A4@<X0>(void *a1@<X8>)
{
  return sub_22579261C(*(void *)(v1 + 16), a1);
}

unint64_t sub_2257931C4()
{
  unint64_t result = qword_268105AA0;
  if (!qword_268105AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268105AA0);
  }
  return result;
}

uint64_t type metadata accessor for HDMCPregnancyManager()
{
  return self;
}

uint64_t method lookup function for HDMCPregnancyManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HDMCPregnancyManager);
}

uint64_t dispatch thunk of HDMCPregnancyManager.__allocating_init(shouldRequestWorkOnInitialization:profile:operation:experienceModelProvider:notificationProvider:calendarCache:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t getEnumTagSinglePayload for HDMCPregnancyManager.DeriveOperationState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HDMCPregnancyManager.DeriveOperationState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2257933C4);
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

unsigned char *sub_2257933EC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HDMCPregnancyManager.DeriveOperationState()
{
  return &type metadata for HDMCPregnancyManager.DeriveOperationState;
}

uint64_t sub_225793404()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t sub_22579343C()
{
  unint64_t result = qword_268105B70;
  if (!qword_268105B70)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_268105B70);
  }
  return result;
}

uint64_t sub_225793494()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2257934CC(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_22572F19C(255, a3);
    unint64_t v4 = sub_22579FD48();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_225793524()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22579355C(uint64_t a1)
{
  sub_2257920A0(a1, v1);
}

uint64_t sub_22579356C@<X0>(void *a1@<X8>)
{
  return sub_2257931A4(a1);
}

unint64_t static ExperienceModelStateSyncEntity.syncEntityDomain.getter()
{
  return 0xD000000000000023;
}

void sub_2257935A0()
{
  sub_22579AAB8((uint64_t)&unk_26D8E4B58);
  swift_arrayDestroy();
  uint64_t v0 = (void *)sub_22579FA98();
  uint64_t v1 = (void *)sub_22579FBD8();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(self, sel_schemaWithDomain_dataKeys_, v0, v1);

  qword_26ABF95B0 = (uint64_t)v2;
}

id static ExperienceModelStateSyncEntity.stateEntitySchema.getter()
{
  if (qword_26ABF9870 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26ABF95B0;
  return v0;
}

id ExperienceModelStateSyncEntity.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ExperienceModelStateSyncEntity.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExperienceModelStateSyncEntity();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ExperienceModelStateSyncEntity()
{
  return self;
}

id ExperienceModelStateSyncEntity.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExperienceModelStateSyncEntity();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static ExperienceModelStateSyncEntity.SyncSchemaVersion.v1.getter()
{
  return 1;
}

void static ExperienceModelStateSyncEntity.updateData(withStateStorage:profile:transaction:)(uint64_t a1, void *a2, uint64_t a3)
{
}

void static ExperienceModelStateSyncEntity.syncDidFinish(with:stateStore:profile:)(uint64_t a1, uint64_t a2, void *a3)
{
}

void sub_225793984(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = a1;
  uint64_t v25 = a3;
  v26[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = sub_22579F458();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  id v23 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v22 - v8;
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v4, (uint64_t)qword_26ABF94A0);
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11(v9, v10, v4);
  type metadata accessor for HDMCExperienceDaemonStore();
  uint64_t v12 = (void *)swift_allocObject();
  void v12[2] = a2;
  id v13 = objc_allocWithZone(MEMORY[0x263F43218]);
  id v14 = a2;
  uint64_t v15 = (void *)sub_22579FA98();
  id v16 = objc_msgSend(v13, sel_initWithCategory_domainName_profile_, 100, v15, v14);

  uint64_t v12[3] = v16;
  id v17 = objc_allocWithZone((Class)type metadata accessor for ExperienceModelSyncStateUpdaterDelegate());
  v11(v23, (uint64_t)v9, v4);
  v26[0] = v12;
  uint64_t v18 = (void *)sub_22579F428();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
  id v19 = self;
  v26[0] = 0;
  if (objc_msgSend(v19, sel_updateDataWithStateStore_delegate_profile_transaction_error_, v24, v18, v14, v25, v26))
  {
    id v20 = v26[0];
  }
  else
  {
    id v21 = v26[0];
    sub_22579F258();

    swift_willThrow();
  }
}

void sub_225793C84(uint64_t a1, void *a2)
{
  if (a1 == 1)
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_22579F458();
    __swift_project_value_buffer(v12, (uint64_t)qword_26ABF94A0);
    id v25 = a2;
    uint64_t v4 = sub_22579F438();
    os_log_type_t v5 = sub_22579FC98();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = swift_slowAlloc();
      uint64_t v7 = (void *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v28 = v8;
      *(_DWORD *)uint64_t v6 = 136446466;
      uint64_t v13 = sub_2257A0188();
      sub_22572E428(v13, v14, &v28);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v6 + 12) = 2112;
      id v27 = objc_msgSend(v25, sel_profileIdentifier);
      sub_22579FD68();
      *uint64_t v7 = v27;

      uint64_t v11 = "[%{public}s] %@ Unable to sync";
      goto LABEL_11;
    }
  }
  else if (a1)
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_22579F458();
    __swift_project_value_buffer(v16, (uint64_t)qword_26ABF94A0);
    id v25 = a2;
    uint64_t v4 = sub_22579F438();
    os_log_type_t v17 = sub_22579FC98();
    if (os_log_type_enabled(v4, v17))
    {
      uint64_t v6 = swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v28 = v19;
      *(_DWORD *)uint64_t v6 = 136446722;
      uint64_t v20 = sub_2257A0188();
      sub_22572E428(v20, v21, &v28);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v6 + 12) = 2112;
      id v22 = objc_msgSend(v25, sel_profileIdentifier);
      sub_22579FD68();
      *uint64_t v18 = v22;

      *(_WORD *)(v6 + 22) = 2080;
      type metadata accessor for HDCloudSyncStateResult(0);
      uint64_t v23 = sub_22579FAD8();
      sub_22572E428(v23, v24, &v28);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_225722000, v4, v17, "[%{public}s] %@ Unknown sync result: %s", (uint8_t *)v6, 0x20u);
      sub_225794274();
      swift_arrayDestroy();
      MEMORY[0x22A635470](v18, -1, -1);
      swift_arrayDestroy();
      uint64_t v15 = v19;
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_26ABF9378 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_22579F458();
    __swift_project_value_buffer(v3, (uint64_t)qword_26ABF94A0);
    id v25 = a2;
    uint64_t v4 = sub_22579F438();
    os_log_type_t v5 = sub_22579FCB8();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = swift_slowAlloc();
      uint64_t v7 = (void *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v28 = v8;
      *(_DWORD *)uint64_t v6 = 136446466;
      uint64_t v9 = sub_2257A0188();
      sub_22572E428(v9, v10, &v28);
      sub_22579FD68();
      swift_bridgeObjectRelease();
      *(_WORD *)(v6 + 12) = 2112;
      id v26 = objc_msgSend(v25, sel_profileIdentifier);
      sub_22579FD68();
      *uint64_t v7 = v26;

      uint64_t v11 = "[%{public}s] %@ Sync complete!";
LABEL_11:
      _os_log_impl(&dword_225722000, v4, v5, v11, (uint8_t *)v6, 0x16u);
      sub_225794274();
      swift_arrayDestroy();
      MEMORY[0x22A635470](v7, -1, -1);
      swift_arrayDestroy();
      uint64_t v15 = v8;
LABEL_16:
      MEMORY[0x22A635470](v15, -1, -1);
      MEMORY[0x22A635470](v6, -1, -1);

      return;
    }
  }
}

ValueMetadata *type metadata accessor for ExperienceModelStateSyncEntity.SyncSchemaVersion()
{
  return &type metadata for ExperienceModelStateSyncEntity.SyncSchemaVersion;
}

void sub_225794274()
{
  if (!qword_26ABF9570)
  {
    sub_2257942CC();
    unint64_t v0 = sub_22579FD48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ABF9570);
    }
  }
}

unint64_t sub_2257942CC()
{
  unint64_t result = qword_26ABF9568;
  if (!qword_26ABF9568)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26ABF9568);
  }
  return result;
}

uint64_t sub_22579430C()
{
  v19[2] = *v0;
  uint64_t v1 = sub_22579FA18();
  MEMORY[0x270FA5388](v1 - 8);
  id v22 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for CoherentExperienceSetupRecordDatabase(0);
  MEMORY[0x270FA5388](v21);
  uint64_t v20 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22572E408(0);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22572C448(0, (unint64_t *)&qword_26ABF9A40, &qword_26ABF98A8, (uint64_t)&unk_2257A50C8, MEMORY[0x263F33098]);
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v19 - v12;
  unint64_t v14 = (char *)v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v13, v14, v10);
  swift_getKeyPath();
  v19[1] = sub_22572BD88(&qword_26ABF98A0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  sub_22579F968();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  type metadata accessor for CoherentExperienceSetupRecord(0);
  uint64_t v15 = sub_22579F7A8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v16 = swift_allocObject();
  sub_22572BEA0(0);
  sub_22572BD88(&qword_26ABF9A20, sub_22572BEA0);
  sub_22572BD88(&qword_26ABF9A28, sub_22572BEA0);
  os_log_type_t v17 = v20;
  sub_22579F7F8();
  *(void *)&v17[*(int *)(v21 + 20)] = MEMORY[0x263F8EE80];
  sub_22579FA08();
  sub_22579F998();
  uint64_t v23 = v15;
  sub_22579F958();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v16 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule, v13, v10);
  return v16;
}

uint64_t sub_225794784(uint64_t a1, uint64_t a2)
{
  sub_22572C448(0, (unint64_t *)&qword_26ABF9A40, &qword_26ABF98A8, (uint64_t)&unk_2257A50C8, MEMORY[0x263F33098]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v10 - v6;
  uint64_t v8 = a2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  type metadata accessor for CoherentExperienceSetupRecord(0);
  sub_22572BD88(&qword_26ABF97B0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecord);
  sub_22579F9B8();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_225794934@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_22578CD48(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v135 = (char *)&v125 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v133 = (char *)&v125 - v7;
  uint64_t v8 = sub_22579F398();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v137 = (char *)&v125 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2257382E8(0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v125 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v138 = (char *)&v125 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v126 = (uint64_t)&v125 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v127 = (char *)&v125 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v128 = (char *)&v125 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v129 = (char *)&v125 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  id v142 = (char *)&v125 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v146 = (char *)&v125 - v26;
  uint64_t v27 = sub_22579F338();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v143 = v27;
  uint64_t v144 = v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v125 = (char *)&v125 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  id v130 = (char *)&v125 - v32;
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  BOOL v145 = (char *)&v125 - v34;
  MEMORY[0x270FA5388](v33);
  char v154 = (char *)&v125 - v35;
  sub_2257970E8(0);
  uint64_t v37 = MEMORY[0x270FA5388](v36 - 8);
  uint64_t v149 = (char *)&v125 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v37);
  uint64_t v148 = (char *)&v125 - v39;
  sub_225797260(0, &qword_268105C00, MEMORY[0x263F32C90]);
  uint64_t v151 = v40;
  uint64_t v132 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v152 = (char *)&v125 - v41;
  sub_225797188(0, &qword_268105C08, MEMORY[0x263F32FF8]);
  id v150 = v42;
  uint64_t v147 = (void (**)(char *, uint64_t))*(v42 - 1);
  MEMORY[0x270FA5388](v42);
  os_log_type_t v44 = (char *)&v125 - v43;
  uint64_t v140 = type metadata accessor for CoherentExperienceSetupRecord(0);
  sub_225797188(0, (unint64_t *)&qword_26ABF9A38, MEMORY[0x263F33008]);
  unint64_t v45 = sub_2257971EC();
  uint64_t v46 = sub_22579FC58();
  uint64_t v139 = a1;
  id v136 = a2;
  uint64_t v134 = v13;
  if (!v46)
  {
    uint64_t v131 = MEMORY[0x263F8EE78];
LABEL_9:
    unint64_t v155 = sub_22577E698(MEMORY[0x263F8EE78]);
    sub_225797260(0, (unint64_t *)&qword_26ABF9B38, MEMORY[0x263F32CA0]);
    sub_22579F728();
    uint64_t v53 = v143;
    uint64_t v54 = (void (**)(char *, uint64_t, uint64_t))(v144 + 32);
    id v150 = (void (**)(char *, char *, uint64_t))(v144 + 16);
    unint64_t v153 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v144 + 56);
    BOOL v55 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v144 + 48);
    uint64_t v141 = v144 + 40;
    uint64_t v147 = (void (**)(char *, uint64_t))(v144 + 8);
    uint64_t v56 = (uint64_t)v148;
    while (1)
    {
      uint64_t v59 = (uint64_t)v149;
      sub_22579F748();
      sub_2257973FC(v59, v56, (uint64_t (*)(void))sub_2257970E8);
      sub_22579711C();
      uint64_t v61 = v60;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 48))(v56, 1, v60) == 1) {
        break;
      }
      uint64_t v62 = v56 + *(int *)(v61 + 48);
      uint64_t v63 = *v54;
      uint64_t v64 = v154;
      (*v54)(v154, v62, v53);
      objc_super v65 = (void *)sub_22579FA98();
      swift_bridgeObjectRelease();
      uint64_t v66 = (uint64_t)v146;
      (*v150)(v146, v64, v53);
      char v67 = *v153;
      (*v153)(v66, 0, 1, v53);
      if ((*v55)(v66, 1, v53) == 1)
      {
        sub_22579732C(v66, (uint64_t (*)(void))sub_2257382E8);
        uint64_t v68 = v155;
        swift_bridgeObjectRetain();
        unint64_t v69 = sub_2257824B8((uint64_t)v65);
        char v71 = v70;
        swift_bridgeObjectRelease();
        if (v71)
        {
          int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v156 = v68;
          unint64_t v155 = 0x8000000000000000;
          if (!isUniquelyReferenced_nonNull_native)
          {
            sub_225772290();
            uint64_t v68 = v156;
          }

          uint64_t v58 = (uint64_t)v142;
          v63(v142, *(void *)(v68 + 56) + *(void *)(v144 + 72) * v69, v53);
          sub_225772064(v69, v68);
          unint64_t v155 = v68;
          swift_bridgeObjectRelease();
          uint64_t v57 = 0;
        }
        else
        {
          uint64_t v57 = 1;
          uint64_t v58 = (uint64_t)v142;
        }
        v67(v58, v57, 1, v53);

        sub_22579732C(v58, (uint64_t (*)(void))sub_2257382E8);
      }
      else
      {
        v63(v145, v66, v53);
        unint64_t v73 = v155;
        int v74 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v156 = v73;
        unint64_t v155 = 0x8000000000000000;
        unint64_t v76 = sub_2257824B8((uint64_t)v65);
        uint64_t v77 = *(void *)(v73 + 16);
        BOOL v78 = (v75 & 1) == 0;
        uint64_t v79 = v77 + v78;
        if (__OFADD__(v77, v78))
        {
          __break(1u);
LABEL_51:
          __break(1u);
          goto LABEL_52;
        }
        char v80 = v75;
        if (*(void *)(v73 + 24) >= v79)
        {
          if ((v74 & 1) == 0) {
            sub_225772290();
          }
        }
        else
        {
          sub_225771C58(v79, v74);
          unint64_t v81 = sub_2257824B8((uint64_t)v65);
          if ((v80 & 1) != (v82 & 1)) {
            goto LABEL_53;
          }
          unint64_t v76 = v81;
        }
        uint64_t v53 = v143;
        unint64_t v83 = (void *)v156;
        if (v80)
        {
          (*(void (**)(unint64_t, char *, uint64_t))(v144 + 40))(*(void *)(v156 + 56) + *(void *)(v144 + 72) * v76, v145, v143);
        }
        else
        {
          *(void *)(v156 + 8 * (v76 >> 6) + 64) |= 1 << v76;
          *(void *)(v83[6] + 8 * v76) = v65;
          v63((char *)(v83[7] + *(void *)(v144 + 72) * v76), (uint64_t)v145, v53);
          uint64_t v84 = v83[2];
          BOOL v85 = __OFADD__(v84, 1);
          uint64_t v86 = v84 + 1;
          if (v85) {
            goto LABEL_51;
          }
          v83[2] = v86;
          id v87 = v65;
        }
        unint64_t v155 = v156;

        swift_bridgeObjectRelease();
      }
      uint64_t v56 = (uint64_t)v148;
      (*v147)(v154, v53);
    }
    (*(void (**)(char *, uint64_t))(v132 + 8))(v152, v151);
    sub_22577CC80();
    sub_22579F4B8();
    uint64_t v88 = (uint64_t)v137;
    if (v156 != 1) {
      goto LABEL_43;
    }
    sub_22579738C(0, (unint64_t *)&qword_26ABF9A00, sub_2257382E8, (void (*)(void))sub_22577CF24);
    uint64_t v89 = (uint64_t)v129;
    sub_22579F4B8();
    uint64_t v90 = *v55;
    if ((*v55)(v89, 1, v53) == 1)
    {
      sub_22579732C(v89, (uint64_t (*)(void))sub_2257382E8);
LABEL_43:
      sub_22579F4B8();
      id v109 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v156);
      sub_22577CCE0();
      sub_22579F4B8();
      sub_22579738C(0, (unint64_t *)&qword_26ABF9A10, sub_22578CD48, (void (*)(void))sub_22578CDD8);
      uint64_t v110 = (uint64_t)v133;
      sub_22579F4B8();
      uint64_t v111 = type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord(0);
      uint64_t v112 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v111 - 8) + 48);
      if (v112(v110, 1, v111) == 1)
      {
        sub_22579732C(v110, (uint64_t (*)(void))sub_22578CD48);
        uint64_t v113 = *v153;
        (*v153)((uint64_t)v138, 1, 1, v143);
      }
      else
      {
        uint64_t v114 = (uint64_t)v138;
        uint64_t v115 = v143;
        (*v150)(v138, (char *)v110, v143);
        sub_22579732C(v110, type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord);
        uint64_t v113 = *v153;
        (*v153)(v114, 0, 1, v115);
      }
      uint64_t v116 = (uint64_t)v135;
      sub_22579F4B8();
      uint64_t v117 = 1;
      unsigned int v118 = v112(v116, 1, v111);
      int64_t v119 = (uint64_t (*)(void))sub_22578CD48;
      uint64_t v120 = (uint64_t)v134;
      uint64_t v121 = v143;
      if (v118 != 1)
      {
        (*v150)(v134, (char *)v116, v143);
        uint64_t v117 = 0;
        int64_t v119 = type metadata accessor for CoherentExperienceSetupRecord.CompletionRecord;
      }
      sub_22579732C(v116, v119);
      v113(v120, v117, 1, v121);
      sub_22579A9F8(v131);
      swift_bridgeObjectRelease();
      id v122 = objc_allocWithZone(MEMORY[0x263F451A8]);
      swift_bridgeObjectRetain();
      id v123 = sub_22577B8B0((uint64_t)v109, v88, (uint64_t)v138, v120);

      *id v136 = v123;
      return swift_bridgeObjectRelease();
    }
    uint64_t v91 = *v54;
    (*v54)(v130, v89, v53);
    uint64_t v92 = (void *)*MEMORY[0x263F450D8];
    unint64_t v93 = v155;
    uint64_t v94 = *(void *)(v155 + 16);
    char v154 = (char *)*MEMORY[0x263F450D8];
    if (v94)
    {
      id v95 = v92;
      unint64_t v96 = sub_2257824B8((uint64_t)v95);
      if (v97)
      {
        uint64_t v98 = *(void *)(v93 + 56);
        uint64_t v53 = v143;
        uint64_t v99 = v144;
        uint64_t v100 = (uint64_t)v128;
        (*(void (**)(char *, unint64_t, uint64_t))(v144 + 16))(v128, v98 + *(void *)(v144 + 72) * v96, v143);
        unint64_t v101 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v99 + 56);
        v101(v100, 0, 1, v53);
      }
      else
      {
        unint64_t v101 = *v153;
        uint64_t v100 = (uint64_t)v128;
        uint64_t v53 = v143;
        (*v153)((uint64_t)v128, 1, 1, v143);
      }

      if (v90(v100, 1, v53) != 1)
      {
        sub_22579732C(v100, (uint64_t (*)(void))sub_2257382E8);
        (*v147)(v130, v53);
        uint64_t v88 = (uint64_t)v137;
        goto LABEL_43;
      }
    }
    else
    {
      unint64_t v101 = *v153;
      uint64_t v100 = (uint64_t)v128;
      (*v153)((uint64_t)v128, 1, 1, v53);
    }
    sub_22579732C(v100, (uint64_t (*)(void))sub_2257382E8);
    uint64_t v102 = (uint64_t)v127;
    (*v150)(v127, v130, v53);
    v101(v102, 0, 1, v53);
    if (v90(v102, 1, v53) == 1)
    {
      uint64_t v103 = v154;
      sub_22579732C(v102, (uint64_t (*)(void))sub_2257382E8);
      uint64_t v104 = v126;
      sub_22577125C((uint64_t)v103, v126);

      sub_22579732C(v104, (uint64_t (*)(void))sub_2257382E8);
    }
    else
    {
      uint64_t v105 = (uint64_t)v125;
      v91(v125, v102, v53);
      uint64_t v106 = v154;
      unint64_t v107 = v155;
      char v108 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v156 = v107;
      sub_225775630(v105, v106, v108);
      unint64_t v155 = v156;

      swift_bridgeObjectRelease();
    }
    uint64_t v88 = (uint64_t)v137;
    (*v147)(v130, v53);
    goto LABEL_43;
  }
  uint64_t v47 = v46;
  uint64_t v156 = MEMORY[0x263F8EE78];
  sub_225782810(0, v46 & ~(v46 >> 63), 0);
  uint64_t v48 = v156;
  sub_22579FC48();
  if ((v47 & 0x8000000000000000) == 0)
  {
    unint64_t v153 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))v45;
    do
    {
      uint64_t v49 = (void (*)(unint64_t *, void))sub_22579FC78();
      swift_bridgeObjectRetain();
      v49(&v155, 0);
      uint64_t v50 = sub_22579FA98();
      swift_bridgeObjectRelease();
      uint64_t v156 = v48;
      unint64_t v52 = *(void *)(v48 + 16);
      unint64_t v51 = *(void *)(v48 + 24);
      if (v52 >= v51 >> 1)
      {
        sub_225782810(v51 > 1, v52 + 1, 1);
        uint64_t v48 = v156;
      }
      *(void *)(v48 + 16) = v52 + 1;
      *(void *)(v48 + 8 * v52 + 32) = v50;
      sub_22579FC68();
      --v47;
    }
    while (v47);
    v147[1](v44, (uint64_t)v150);
    uint64_t v131 = v156;
    goto LABEL_9;
  }
LABEL_52:
  __break(1u);
LABEL_53:
  type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
  uint64_t result = sub_2257A0098();
  __break(1u);
  return result;
}

uint64_t sub_225795A98()
{
  return type metadata accessor for CoherentExperienceSetupRecordDatabaseWrapper(0);
}

void sub_225795AA0()
{
  sub_22572C448(319, (unint64_t *)&qword_26ABF9A40, &qword_26ABF98A8, (uint64_t)&unk_2257A50C8, MEMORY[0x263F33098]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_225795B68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22572E408(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_225795BF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22572E408(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_225795C70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22572E408(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_225795CF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22572E408(0);
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

void sub_225795DB4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_22572E408(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v10(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
}

void sub_225795E70()
{
  sub_22572E408(319);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_225795F08(uint64_t *a1, uint64_t *a2)
{
  return sub_225796CB4(*a1, *a2);
}

uint64_t sub_225795F14()
{
  strcpy((char *)&qword_26ABFA540, "setupRecords");
  algn_26ABFA548[5] = 0;
  *(_WORD *)&algn_26ABFA548[6] = -5120;
  uint64_t result = swift_getKeyPath();
  qword_26ABFA550 = result;
  return result;
}

uint64_t sub_225795F68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(int *)(a2 + 20);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + v4) = a1;
  return result;
}

uint64_t (*sub_225795FA0())()
{
  return nullsub_1;
}

uint64_t sub_225795FC4(uint64_t a1)
{
  uint64_t v2 = sub_22572BD88(&qword_26ABF98A8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  return MEMORY[0x270F17CC8](a1, v2);
}

uint64_t sub_225796030(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22572BD88(&qword_26ABF9880, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  return MEMORY[0x270F16F68](a1, a2, v4);
}

uint64_t sub_2257960B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22572BD88(&qword_26ABF9880, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  return MEMORY[0x270F16F90](a1, a2, v4);
}

uint64_t sub_225796130(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22572BD88(&qword_26ABF9880, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  return MEMORY[0x270F16FC0](a1, a2, v4);
}

uint64_t sub_2257961AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22572BD88(&qword_26ABF9880, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  return MEMORY[0x270F16F98](a1, a2, a3, v6);
}

uint64_t sub_225796240(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22572BD88(&qword_26ABF9880, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  return MEMORY[0x270F16FB8](a1, a2, v4);
}

uint64_t sub_2257962BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22572BD88(&qword_26ABF9880, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  return MEMORY[0x270F16FA0](a1, a2, v4);
}

uint64_t sub_225796338(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22572BD88(&qword_26ABF9880, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  return MEMORY[0x270F16F80](a1, a2, v4);
}

uint64_t sub_2257963BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22572BD88(&qword_26ABF9880, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  return MEMORY[0x270F16F78](a1, a2, v4);
}

uint64_t sub_225796440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22572BD88(&qword_26ABF9880, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  return MEMORY[0x270F16F60](a1, a2, a3, v6);
}

uint64_t sub_2257964D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22572BD88(&qword_26ABF9880, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  return MEMORY[0x270F16F50](a1, a2, v4);
}

uint64_t sub_225796550(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22572BD88(&qword_26ABF9880, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  return MEMORY[0x270F16FA8](a1, a2, v4);
}

uint64_t sub_2257965CC()
{
  return sub_22579F898();
}

uint64_t sub_22579664C()
{
  return sub_22579F8A8();
}

uint64_t sub_2257966DC(uint64_t a1)
{
  uint64_t v2 = sub_22572BD88(&qword_26ABF9880, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  return MEMORY[0x270F16F58](a1, v2);
}

uint64_t sub_225796758()
{
  return sub_22572BD88(&qword_26ABF98A0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
}

uint64_t sub_2257967A0()
{
  return sub_22572BD88(&qword_26ABF9890, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
}

uint64_t sub_2257967E8()
{
  return sub_22572BD88(&qword_26ABF9A18, sub_22572E408);
}

uint64_t sub_225796830()
{
  return sub_22572BD88(&qword_26ABF9898, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
}

uint64_t sub_225796878()
{
  return sub_22572BD88(&qword_26ABF9888, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
}

uint64_t sub_2257968C0()
{
  return sub_22572BD88(&qword_26ABF98A8, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
}

uint64_t sub_225796908()
{
  return sub_22572BD88(&qword_268105BE0, sub_225796950);
}

void sub_225796950(uint64_t a1)
{
}

uint64_t sub_22579698C()
{
  return sub_22572BD88(&qword_26ABF98B0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
}

void sub_2257969D4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v7 = a4;
      }
      else {
        uint64_t v7 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      MEMORY[0x22A6342E0](a1, a2, v7);
      sub_22572C4E0();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
LABEL_27:
    __break(1u);
    return;
  }
  if (a3) {
    goto LABEL_13;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_20;
  }
  __break(1u);
LABEL_13:
  if (sub_22579FDF8() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  sub_22579FE08();
  sub_22572C4E0();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v4 = v17;
  swift_unknownObjectRelease();
  uint64_t v8 = sub_22579FD28();
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  id v10 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v11 = sub_22579FD38();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v6 = (v6 + 1) & v12;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_26;
      }
      id v13 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v14 = sub_22579FD38();
    }
    while ((v14 & 1) == 0);
  }

LABEL_20:
  uint64_t v15 = *(void **)(*(void *)(a4 + 48) + 8 * v6);
  id v16 = v15;
}

uint64_t sub_225796C2C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_225796CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = a2;
  sub_22572E408(0);
  uint64_t v27 = *(void *)(v3 - 8);
  uint64_t v28 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v25 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v25 - v6;
  sub_22572C448(0, (unint64_t *)&qword_26ABF9A40, &qword_26ABF98A8, (uint64_t)&unk_2257A50C8, MEMORY[0x263F33098]);
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  id v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v25 - v14;
  uint64_t v16 = a1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
  swift_beginAccess();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v17(v15, v16, v9);
  swift_getKeyPath();
  sub_22572BD88(&qword_26ABF98A0, (void (*)(uint64_t))type metadata accessor for CoherentExperienceSetupRecordDatabase);
  sub_22579F968();
  swift_release();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v15, v9);
  uint64_t v19 = v26 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon44CoherentExperienceSetupRecordDatabaseWrapper_capsule;
  swift_beginAccess();
  v17(v13, v19, v9);
  swift_getKeyPath();
  uint64_t v20 = v25;
  sub_22579F968();
  swift_release();
  v18(v13, v9);
  sub_22572BEA0(0);
  sub_22572BD88(&qword_26ABF9A20, sub_22572BEA0);
  sub_22572BD88(&qword_26ABF9A28, sub_22572BEA0);
  LOBYTE(v19) = sub_22579F798();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v27 + 8);
  uint64_t v22 = v20;
  uint64_t v23 = v28;
  v21(v22, v28);
  v21(v7, v23);
  return v19 & 1;
}

uint64_t sub_225797068(uint64_t a1)
{
  return sub_225794784(a1, v1);
}

uint64_t sub_225797084(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CoherentExperienceSetupRecord(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_2257970E8(uint64_t a1)
{
}

void sub_22579711C()
{
  if (!qword_268105BF8)
  {
    sub_22579F338();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268105BF8);
    }
  }
}

void sub_225797188(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, void, void, void))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, MEMORY[0x263F8D310], MEMORY[0x263F33140], MEMORY[0x263F8D320]);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_2257971EC()
{
  unint64_t result = qword_268105C10;
  if (!qword_268105C10)
  {
    sub_225797188(255, (unint64_t *)&qword_26ABF9A38, MEMORY[0x263F33008]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268105C10);
  }
  return result;
}

void sub_225797260(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, void *))
{
  if (!*a2)
  {
    uint64_t v6 = sub_22579F338();
    uint64_t v7 = sub_22572BD88(&qword_26ABF9B00, MEMORY[0x263F07490]);
    v10[0] = MEMORY[0x263F8D310];
    v10[1] = v6;
    v10[2] = MEMORY[0x263F33140];
    v10[3] = MEMORY[0x263F8D320];
    v10[4] = MEMORY[0x263F32BE0];
    v10[5] = v7;
    unint64_t v8 = a3(a1, v10);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_22579732C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_22579738C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(void))
{
  if (!*a2)
  {
    a3(255);
    a4();
    unint64_t v6 = sub_22579F4E8();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_2257973FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_225797464()
{
  if (!qword_268105C18)
  {
    sub_22572C4E0();
    sub_22572BD88(&qword_26ABF9A90, (void (*)(uint64_t))sub_22572C4E0);
    unint64_t v0 = sub_22579FC28();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268105C18);
    }
  }
}

uint64_t sub_2257974F8()
{
  if (objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_profile), sel_profileExtensionWithIdentifier_, *MEMORY[0x263F450C8]))
  {
    sub_22579FD88();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_22572FD88((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    sub_22572F19C(0, (unint64_t *)&unk_26ABF9510);
    if (swift_dynamicCast()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_22576E8F4((uint64_t)v4);
    return 0;
  }
}

char *HDMCWidgetSchedulingManager.__allocating_init(profile:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = a1;
  id v5 = sub_225790F00(v4);

  id v6 = v5;
  uint64_t v7 = (void *)sub_22579FA98();
  id v8 = (id)HKCreateSerialDispatchQueue();

  uint64_t v9 = sub_225798A70(v4, (uint64_t)v6, v8, 0, 0, (char *)objc_allocWithZone(v1), 1.0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v9;
}

char *HDMCWidgetSchedulingManager.init(profile:)(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v3 = a1;
  id v4 = sub_225790F00(v3);

  id v5 = v4;
  id v6 = (void *)sub_22579FA98();
  id v7 = (id)HKCreateSerialDispatchQueue();

  id v8 = sub_225798A70(v3, (uint64_t)v5, v7, 0, 0, (char *)objc_allocWithZone(ObjectType), 1.0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

char *HDMCWidgetSchedulingManager.__allocating_init(profile:widgetReloader:queue:debounceDelay:didBecomeReady:)(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v13 = *(void *)(a2 + 24);
  uint64_t v14 = *(void *)(a2 + 32);
  uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1(a2, v13);
  uint64_t v16 = sub_225798FA8(a1, v15, a3, a4, a5, a6, v6, v13, v14);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v16;
}

char *HDMCWidgetSchedulingManager.init(profile:widgetReloader:queue:debounceDelay:didBecomeReady:)(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v13 = *(void *)(a2 + 24);
  uint64_t v14 = *(void *)(a2 + 32);
  uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1(a2, v13);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v18 + 16))(v17);
  uint64_t v19 = sub_225798CD0(a1, (uint64_t)v17, a3, a4, a5, v6, v13, v14, a6);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v19;
}

void sub_225797990(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x22A635500](v1);
  if (v2)
  {
    id v3 = (void *)v2;
    sub_2257979E4();
  }
}

uint64_t sub_2257979E4()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = sub_22579F488();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (uint64_t *)((char *)&v22[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_queue);
  *id v5 = v6;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F0E0], v2);
  id v7 = v6;
  LOBYTE(v6) = sub_22579F498();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v5, v2);
  if (v6)
  {
    if (qword_26ABF9378 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v8 = sub_22579F458();
  __swift_project_value_buffer(v8, (uint64_t)qword_26ABF94A0);
  uint64_t v9 = sub_22579F438();
  os_log_type_t v10 = sub_22579FCB8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    v22[0] = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v13 = sub_2257A0188();
    uint64_t v21 = sub_22572E428(v13, v14, v22);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v9, v10, "[%s] requesting widgets reload", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v12, -1, -1);
    MEMORY[0x22A635470](v11, -1, -1);
  }

  uint64_t v15 = *(void *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_widgetReloader + 24);
  uint64_t v16 = *(void *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_widgetReloader + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_widgetReloader), v15);
  uint64_t v17 = (void *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadReasons);
  swift_beginAccess();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 8);
  uint64_t v19 = swift_bridgeObjectRetain();
  v18(v19, v15, v16);
  swift_bridgeObjectRelease();
  void *v17 = MEMORY[0x263F8EE88];
  return swift_bridgeObjectRelease();
}

id HDMCWidgetSchedulingManager.__deallocating_deinit()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = (void *)sub_2257974F8();
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = objc_msgSend(v2, sel__bridging_analysisProviding);

    if (v4)
    {
      id v5 = v0;
      objc_msgSend(v4, sel_unregisterObserver_, v5);

      swift_unknownObjectRelease();
    }
  }
  v7.receiver = v0;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t HDMCWidgetSchedulingManager.profileDidBecomeReady(_:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = swift_getObjectType();
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_22579F458();
  __swift_project_value_buffer(v5, (uint64_t)qword_26ABF94A0);
  uint64_t v6 = sub_22579F438();
  os_log_type_t v7 = sub_22579FCB8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    aBlock[0] = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v10 = sub_2257A0188();
    sub_22572E428(v10, v11, aBlock);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v6, v7, "[%s] profileDidBecomeReady", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v9, -1, -1);
    MEMORY[0x22A635470](v8, -1, -1);
  }

  uint64_t v12 = (void *)sub_2257974F8();
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = objc_msgSend(v12, sel__bridging_analysisProviding);

    if (v14) {
      objc_msgSend(v14, sel_registerObserver_queue_userInitiated_, v2, *(void *)(v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_queue), 0);
    }
  }
  id v15 = objc_msgSend(a1, sel_database);
  uint64_t v16 = *(void *)(v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_queue);
  uint64_t v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  *(void *)(v18 + 24) = ObjectType;
  aBlock[4] = (uint64_t)sub_22579913C;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2257986B4;
  aBlock[3] = (uint64_t)&block_descriptor_3;
  uint64_t v19 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v15, sel_performWhenDataProtectedByFirstUnlockIsAvailableOnQueue_block_, v16, v19);
  _Block_release(v19);

  uint64_t v20 = *(void (**)(void))(v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_didBecomeReady);
  if (v20) {
    v20();
  }
  return swift_unknownObjectRelease();
}

void sub_2257981C4(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22579F458();
  __swift_project_value_buffer(v2, (uint64_t)qword_26ABF94A0);
  uint64_t v3 = sub_22579F438();
  os_log_type_t v4 = sub_22579FCB8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v12[0] = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    uint64_t v7 = sub_2257A0188();
    uint64_t v11 = sub_22572E428(v7, v8, v12);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v3, v4, "[%{public}s] first unlock occurred", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v6, -1, -1);
    MEMORY[0x22A635470](v5, -1, -1);
  }

  swift_beginAccess();
  uint64_t v9 = MEMORY[0x22A635500](v1);
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    LOBYTE(v11) = 0;
    sub_22579837C((unsigned __int8 *)&v11);
  }
}

id sub_22579837C(unsigned __int8 *a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = sub_22579F488();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (uint64_t *)((char *)&v22[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  int v8 = *a1;
  uint64_t v9 = *(void **)(v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_queue);
  *uint64_t v7 = v9;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8F0E0], v4);
  id v10 = v9;
  LOBYTE(v9) = sub_22579F498();
  (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  if (v9)
  {
    if (qword_26ABF9378 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v11 = sub_22579F458();
  __swift_project_value_buffer(v11, (uint64_t)qword_26ABF94A0);
  uint64_t v12 = sub_22579F438();
  os_log_type_t v13 = sub_22579FCB8();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    v22[0] = v15;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v16 = sub_2257A0188();
    uint64_t v21 = sub_22572E428(v16, v17, v22);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2082;
    if (v8) {
      uint64_t v18 = 0xD000000000000014;
    }
    else {
      uint64_t v18 = 0xD000000000000010;
    }
    if (v8) {
      unint64_t v19 = 0x80000002257A8B30;
    }
    else {
      unint64_t v19 = 0x80000002257A8B50;
    }
    uint64_t v21 = sub_22572E428(v18, v19, v22);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v12, v13, "[%s] running reload operation with reason: %{public}s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v15, -1, -1);
    MEMORY[0x22A635470](v14, -1, -1);
  }

  swift_beginAccess();
  sub_225771B1C(&v21, v8);
  swift_endAccess();
  id result = *(id *)(v2 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadOperation);
  if (result) {
    return objc_msgSend(result, sel_execute);
  }
  return result;
}

uint64_t sub_2257986B4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id HDMCWidgetSchedulingManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void HDMCWidgetSchedulingManager.init()()
{
}

void HDMCWidgetSchedulingManager.didUpdate(_:)(void *a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_previousAnalysis;
  uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_previousAnalysis);
  if (v5)
  {
    sub_22572F19C(0, (unint64_t *)&unk_26ABF9A68);
    id v6 = a1;
    id v7 = v5;
    char v8 = sub_22579FD38();

    if (v8) {
      return;
    }
    uint64_t v9 = *(void **)(v2 + v4);
  }
  else
  {
    uint64_t v9 = 0;
  }
  *(void *)(v2 + v4) = a1;

  uint64_t v10 = qword_26ABF9378;
  id v11 = a1;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_22579F458();
  __swift_project_value_buffer(v12, (uint64_t)qword_26ABF94A0);
  os_log_type_t v13 = sub_22579F438();
  os_log_type_t v14 = sub_22579FCB8();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v19 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v17 = sub_2257A0188();
    sub_22572E428(v17, v18, &v19);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v13, v14, "[%s] Received cycle analysis update", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v16, -1, -1);
    MEMORY[0x22A635470](v15, -1, -1);
  }

  LOBYTE(v19) = 1;
  sub_22579837C((unsigned __int8 *)&v19);
}

char *sub_225798A70(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char *a6, double a7)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v27[4] = &off_26D8E50D8;
  *(void *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadReasons] = MEMORY[0x263F8EE88];
  *(void *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadOperation] = 0;
  v27[3] = &type metadata for HDMCWidgetTimelineReloader;
  v27[0] = a2;
  *(void *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_previousAnalysis] = 0;
  *(void *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_profile] = a1;
  sub_22577C204((uint64_t)v27, (uint64_t)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_widgetReloader]);
  *(void *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_queue] = a3;
  uint64_t v15 = (uint64_t *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_didBecomeReady];
  *uint64_t v15 = a4;
  v15[1] = a5;
  id v16 = a1;
  id v17 = a3;
  sub_2257991A4(a4);
  v26.receiver = a6;
  v26.super_class = ObjectType;
  unint64_t v18 = (char *)objc_msgSendSuper2(&v26, sel_init);
  objc_msgSend(v16, sel_registerProfileReadyObserver_queue_, v18, 0);
  uint64_t v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v20 = objc_allocWithZone(MEMORY[0x263F0A9B0]);
  aBlock[4] = sub_2257991B4;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2257986B4;
  aBlock[3] = &block_descriptor_15_0;
  uint64_t v21 = _Block_copy(aBlock);
  swift_retain();
  id v22 = objc_msgSend(v20, sel_initWithMode_clock_queue_delay_block_, 1, 1, v17, v21, a7);

  _Block_release(v21);
  swift_release();
  sub_225799194(a4);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  swift_release();
  uint64_t v23 = *(void **)&v18[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadOperation];
  *(void *)&v18[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadOperation] = v22;

  return v18;
}

char *sub_225798CD0(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char *a6, uint64_t a7, uint64_t a8, double a9)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v32[3] = a7;
  v32[4] = a8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v32);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a7 - 8) + 32))(boxed_opaque_existential_1, a2, a7);
  *(void *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadReasons] = MEMORY[0x263F8EE88];
  *(void *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadOperation] = 0;
  *(void *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_previousAnalysis] = 0;
  *(void *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_profile] = a1;
  sub_22577C204((uint64_t)v32, (uint64_t)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_widgetReloader]);
  *(void *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_queue] = a3;
  id v20 = (uint64_t *)&a6[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_didBecomeReady];
  *id v20 = a4;
  v20[1] = a5;
  id v21 = a1;
  id v22 = a3;
  sub_2257991A4(a4);
  v31.receiver = a6;
  v31.super_class = ObjectType;
  uint64_t v23 = (char *)objc_msgSendSuper2(&v31, sel_init);
  objc_msgSend(v21, sel_registerProfileReadyObserver_queue_, v23, 0);
  uint64_t v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v25 = objc_allocWithZone(MEMORY[0x263F0A9B0]);
  aBlock[4] = sub_2257991B4;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2257986B4;
  aBlock[3] = &block_descriptor_10;
  objc_super v26 = _Block_copy(aBlock);
  swift_retain();
  id v27 = objc_msgSend(v25, sel_initWithMode_clock_queue_delay_block_, 1, 1, v22, v26, a9);

  _Block_release(v26);
  swift_release();
  sub_225799194(a4);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  swift_release();
  uint64_t v28 = *(void **)&v23[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadOperation];
  *(void *)&v23[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon27HDMCWidgetSchedulingManager_reloadOperation] = v27;

  return v23;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

char *sub_225798FA8(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = *(void *)(a8 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v19 = (char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v21 = (char *)objc_allocWithZone(v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, a2, a8);
  return sub_225798CD0(a1, (uint64_t)v19, a3, a4, a5, v21, a8, a9, a6);
}

uint64_t sub_2257990CC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_225799104()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_22579913C()
{
  sub_2257981C4(*(void *)(v0 + 16));
}

uint64_t type metadata accessor for HDMCWidgetSchedulingManager()
{
  return self;
}

uint64_t method lookup function for HDMCWidgetSchedulingManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HDMCWidgetSchedulingManager);
}

uint64_t dispatch thunk of HDMCWidgetSchedulingManager.__allocating_init(profile:widgetReloader:queue:debounceDelay:didBecomeReady:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_225799194(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_2257991A4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void sub_2257991B4()
{
  sub_225797990(v0);
}

char *HDMCExperienceModelManager.__allocating_init(notificationProvider:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return HDMCExperienceModelManager.init(notificationProvider:)(a1);
}

char *HDMCExperienceModelManager.init(notificationProvider:)(void *a1)
{
  uint64_t v24 = a1;
  uint64_t v2 = sub_22579FCD8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22579FCE8();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_22579F478();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v23 = OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_queue;
  v22[1] = sub_225799584();
  char v8 = v1;
  sub_22579F468();
  uint64_t v26 = MEMORY[0x263F8EE78];
  sub_225732B5C(&qword_26ABF9540, MEMORY[0x263F8F198]);
  sub_225792DC4();
  sub_225732B5C((unint64_t *)&unk_26ABF94C0, (void (*)(uint64_t))sub_225792DC4);
  sub_22579FD98();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F138], v2);
  *(void *)(v22[2] + v23) = sub_22579FCF8();
  uint64_t v9 = v24;
  *(void *)&v8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_notificationProvider] = v24;
  uint64_t v10 = (void *)*MEMORY[0x263F09930];
  id v11 = objc_allocWithZone(MEMORY[0x263F0A5A8]);
  id v12 = v9;
  id v13 = v10;
  os_log_type_t v14 = (void *)sub_22579FA98();
  id v15 = objc_msgSend(v11, sel_initWithName_loggingCategory_, v14, v13);

  *(void *)&v8[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_observers] = v15;
  id v16 = (objc_class *)type metadata accessor for HDMCExperienceModelManager();
  v25.receiver = v8;
  v25.super_class = v16;
  uint64_t v17 = (char *)objc_msgSendSuper2(&v25, sel_init);
  uint64_t v18 = *(void **)&v17[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_notificationProvider];
  uint64_t v19 = v17;
  Class v20 = (void *)sub_22579FA98();
  objc_msgSend(v18, sel_addObserver_selector_name_object_, v19, sel_didReceiveExperienceModelUpdateNotification, v20, 0);

  return v19;
}

unint64_t sub_225799584()
{
  unint64_t result = qword_26ABF9548;
  if (!qword_26ABF9548)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26ABF9548);
  }
  return result;
}

uint64_t type metadata accessor for HDMCExperienceModelManager()
{
  return self;
}

id HDMCExperienceModelManager.__deallocating_deinit()
{
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_notificationProvider], sel_removeObserver_, v0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HDMCExperienceModelManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_225799720()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22579F458();
  __swift_project_value_buffer(v2, (uint64_t)qword_26ABF94A0);
  uint64_t v3 = sub_22579F438();
  os_log_type_t v4 = sub_22579FCB8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    aBlock[0] = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v7 = sub_2257A0188();
    sub_22572E428(v7, v8, aBlock);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v3, v4, "[%s] Received a experience model update notification, notifying clients", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v6, -1, -1);
    MEMORY[0x22A635470](v5, -1, -1);
  }

  uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_observers);
  aBlock[4] = (uint64_t)sub_225799938;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_225730ED8;
  aBlock[3] = (uint64_t)&block_descriptor_4;
  uint64_t v10 = _Block_copy(aBlock);
  objc_msgSend(v9, sel_notifyObservers_, v10);
  _Block_release(v10);
}

id sub_225799938(void *a1)
{
  return objc_msgSend(a1, sel_experienceModelManagerDidUpdateModel);
}

id HDMCExperienceModelManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void HDMCExperienceModelManager.init()()
{
}

id HDMCExperienceModelManager.register(observer:)(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_observers), sel_registerObserver_queue_, a1, *(void *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_queue));
}

id HDMCExperienceModelManager.remove(observer:)(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_observers), sel_unregisterObserver_, a1);
}

uint64_t method lookup function for HDMCExperienceModelManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HDMCExperienceModelManager);
}

uint64_t dispatch thunk of HDMCExperienceModelManager.__allocating_init(notificationProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t HDMCExperienceDaemonStore.__allocating_init(profile:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = a1;
  id v3 = objc_allocWithZone(MEMORY[0x263F43218]);
  id v4 = a1;
  uint64_t v5 = (void *)sub_22579FA98();
  id v6 = objc_msgSend(v3, sel_initWithCategory_domainName_profile_, 100, v5, v4);

  *(void *)(v2 + 24) = v6;
  return v2;
}

void HDMCExperienceDaemonStore.setModel(_:)(void *a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_22579F238();
  uint64_t v33 = *(void *)(v4 - 8);
  uint64_t v34 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v32 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26ABF9378 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_22579F458();
  __swift_project_value_buffer(v6, (uint64_t)qword_26ABF94A0);
  id v7 = a1;
  unint64_t v8 = sub_22579F438();
  os_log_type_t v9 = sub_22579FCB8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    v31[1] = v2;
    uint64_t v11 = v10;
    uint64_t v12 = swift_slowAlloc();
    *(void *)&v36[0] = v12;
    *(_DWORD *)uint64_t v11 = 136446466;
    uint64_t v13 = sub_2257A0188();
    uint64_t v35 = sub_22572E428(v13, v14, (uint64_t *)v36);
    sub_22579FD68();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v15 = HDCodableMenstrualCyclesExperienceModel.logDescription.getter();
    uint64_t v35 = sub_22572E428(v15, v16, (uint64_t *)v36);
    sub_22579FD68();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_225722000, v8, v9, "[%{public}s] Setting state to %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A635470](v12, -1, -1);
    MEMORY[0x22A635470](v11, -1, -1);
  }
  else
  {
  }
  uint64_t v17 = *(void **)(v1 + 24);
  id v18 = objc_msgSend(v7, sel_data);
  if (v18)
  {
    uint64_t v19 = sub_22579F278();
    unint64_t v21 = v20;

    id v18 = (id)sub_22579F268();
    sub_2257309D8(v19, v21);
  }
  id v22 = (void *)sub_22579FA98();
  *(void *)&v36[0] = 0;
  unsigned __int8 v23 = objc_msgSend(v17, sel_setData_forKey_error_, v18, v22, v36);

  uint64_t v24 = *(void **)&v36[0];
  if (v23)
  {
    objc_super v25 = self;
    id v26 = v24;
    id v27 = objc_msgSend(v25, sel_defaultCenter);
    sub_22579FA98();
    memset(v36, 0, sizeof(v36));
    uint64_t v28 = v32;
    sub_22579F228();
    uint64_t v29 = (void *)sub_22579F218();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v28, v34);
    objc_msgSend(v27, sel_postNotification_, v29);
  }
  else
  {
    id v30 = *(id *)&v36[0];
    sub_22579F258();

    swift_willThrow();
  }
}

uint64_t static HDMCExperienceDaemonStore.experienceModelDidChangeNotificationName.getter()
{
  return sub_22579FA98();
}

id HDMCExperienceDaemonStore.profile.getter()
{
  return *(id *)(v0 + 16);
}

id HDMCExperienceDaemonStore.keyValueDomain.getter()
{
  return *(id *)(v0 + 24);
}

uint64_t HDMCExperienceDaemonStore.init(profile:)(void *a1)
{
  *(void *)(v1 + 16) = a1;
  id v3 = objc_allocWithZone(MEMORY[0x263F43218]);
  id v4 = a1;
  uint64_t v5 = (void *)sub_22579FA98();
  id v6 = objc_msgSend(v3, sel_initWithCategory_domainName_profile_, 100, v5, v4);

  *(void *)(v1 + 24) = v6;
  return v1;
}

id HDMCExperienceDaemonStore.fetchPersistedOrDefaultExperienceModel()()
{
  id result = HDMCExperienceDaemonStore.fetchPersistedOrDefaultState()();
  if (!v0)
  {
    uint64_t v2 = result;
    sub_225730A30();
    id v3 = sub_22572BEDC();

    swift_release();
    return v3;
  }
  return result;
}

unint64_t HDMCExperienceDaemonStore.Failure.debugDescription.getter()
{
  if (!*(void *)(v0 + 8)) {
    return 0xD000000000000021;
  }
  sub_22579FEB8();
  swift_bridgeObjectRelease();
  sub_22579FB08();
  return 0xD00000000000001BLL;
}

uint64_t HDMCExperienceDaemonStore.deinit()
{
  return v0;
}

id sub_22579A188()
{
  id result = HDMCExperienceDaemonStore.fetchPersistedOrDefaultState()();
  if (!v0)
  {
    uint64_t v2 = result;
    sub_225730A30();
    id v3 = sub_22572BEDC();

    swift_release();
    return v3;
  }
  return result;
}

void sub_22579A1FC(void *a1)
{
}

id sub_22579A220()
{
  return HDMCExperienceDaemonStore.fetchLocallyPersistedData()();
}

uint64_t sub_22579A244(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_22579A2DC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_22579A4B8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_22579A4B8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22579A2DC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_22579A454(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_22579FEC8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_22579FF68();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_22579FB18();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_22579FFD8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_22579FF68();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_22579A454(uint64_t a1, uint64_t a2)
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
  sub_22579AB50();
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22579A4B8(char a1, int64_t a2, char a3, char *a4)
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
    sub_22579AB50();
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
  uint64_t result = sub_22579FFD8();
  __break(1u);
  return result;
}

unint64_t sub_22579A604()
{
  unint64_t result = qword_268105C78;
  if (!qword_268105C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268105C78);
  }
  return result;
}

void sub_22579A658()
{
  if (!qword_268105C80)
  {
    sub_22572F19C(255, &qword_268105C88);
    unint64_t v0 = sub_22579FD48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268105C80);
    }
  }
}

uint64_t sub_22579A6C0(uint64_t a1, unint64_t a2)
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

uint64_t sub_22579A718(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_22579A770((unint64_t *)&unk_26ABF9618, a2, (void (*)(uint64_t))type metadata accessor for HDMCExperienceDaemonStore);
  *(void *)(a1 + _Block_object_dispose(&STACK[0x4A8], 8) = result;
  return result;
}

uint64_t sub_22579A770(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_22579A7B8()
{
  return sub_22572F3BC(&qword_268105C90, &qword_26ABF9A98);
}

uint64_t dispatch thunk of ExperienceModelDaemonStorageProvider.fetchPersistedOrDefaultExperienceModel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t method lookup function for HDMCExperienceDaemonStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HDMCExperienceDaemonStore);
}

uint64_t dispatch thunk of HDMCExperienceDaemonStore.__allocating_init(profile:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void *initializeBufferWithCopyOfBuffer for HDMCExperienceDaemonStore.Failure(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for HDMCExperienceDaemonStore.Failure()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for HDMCExperienceDaemonStore.Failure(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for HDMCExperienceDaemonStore.Failure(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HDMCExperienceDaemonStore.Failure(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HDMCExperienceDaemonStore.Failure(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + _Block_object_dispose(&STACK[0x4A8], 8) = 0;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
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
      *(void *)(result + _Block_object_dispose(&STACK[0x4A8], 8) = a2;
    }
  }
  return result;
}

uint64_t sub_22579A9B0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_22579A9C8(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for HDMCExperienceDaemonStore.Failure()
{
  return &type metadata for HDMCExperienceDaemonStore.Failure;
}

uint64_t sub_22579A9F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier(0);
  sub_22579A770(&qword_268105290, 255, type metadata accessor for HKMCPregnancyAdjustedFeatureIdentifier);
  uint64_t result = sub_22579FC08();
  uint64_t v7 = result;
  if (v2)
  {
    unint64_t v4 = (void **)(a1 + 32);
    do
    {
      size_t v5 = *v4++;
      sub_225771740(&v6, v5);

      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_22579AAB8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_22579FC08();
  uint64_t v8 = result;
  if (v2)
  {
    unint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_22577196C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void sub_22579AB50()
{
  if (!qword_26ABF9AA0)
  {
    unint64_t v0 = sub_2257A0048();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26ABF9AA0);
    }
  }
}

void _UserCharacteristicOfType_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_225722000, v0, (uint64_t)v0, "Error retrieving user characteristic of type: %{public}@, error: %{public}@", v1);
}

void _UserCharacteristicModificationDayOfType_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_225722000, v0, (uint64_t)v0, "Error retrieving user characteristic modification date of type: %{public}@, error: %{public}@", v1);
}

uint64_t sub_22579F218()
{
  return MEMORY[0x270EEE360]();
}

uint64_t sub_22579F228()
{
  return MEMORY[0x270EEE388]();
}

uint64_t sub_22579F238()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_22579F248()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_22579F258()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22579F268()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_22579F278()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22579F288()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_22579F298()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t sub_22579F2A8()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_22579F2B8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_22579F2C8()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_22579F2D8()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_22579F2E8()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_22579F2F8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_22579F308()
{
  return MEMORY[0x270EF0BD0]();
}

uint64_t sub_22579F318()
{
  return MEMORY[0x270EF0BD8]();
}

uint64_t sub_22579F328()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_22579F338()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22579F348()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_22579F358()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_22579F368()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_22579F378()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_22579F388()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_22579F398()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_22579F3A8()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_22579F3B8()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_22579F3C8()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_22579F3D8()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_22579F3E8()
{
  return MEMORY[0x270EF1350]();
}

uint64_t sub_22579F3F8()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_22579F408()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_22579F418()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_22579F428()
{
  return MEMORY[0x270F31930]();
}

uint64_t sub_22579F438()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22579F448()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_22579F458()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22579F468()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22579F478()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22579F488()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_22579F498()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_22579F4A8()
{
  return MEMORY[0x270F16E90]();
}

uint64_t sub_22579F4B8()
{
  return MEMORY[0x270F16ED8]();
}

uint64_t sub_22579F4C8()
{
  return MEMORY[0x270F16EE0]();
}

uint64_t sub_22579F4D8()
{
  return MEMORY[0x270F16EF0]();
}

uint64_t sub_22579F4E8()
{
  return MEMORY[0x270F16EF8]();
}

uint64_t sub_22579F4F8()
{
  return MEMORY[0x270F16F08]();
}

uint64_t sub_22579F588()
{
  return MEMORY[0x270F16F88]();
}

uint64_t sub_22579F5D8()
{
  return MEMORY[0x270F16FB0]();
}

uint64_t sub_22579F698()
{
  return MEMORY[0x270F172C0]();
}

uint64_t sub_22579F6E8()
{
  return MEMORY[0x270F172E8]();
}

uint64_t sub_22579F728()
{
  return MEMORY[0x270F17428]();
}

uint64_t sub_22579F738()
{
  return MEMORY[0x270F17448]();
}

uint64_t sub_22579F748()
{
  return MEMORY[0x270F17450]();
}

uint64_t sub_22579F758()
{
  return MEMORY[0x270F17458]();
}

uint64_t sub_22579F768()
{
  return MEMORY[0x270F17460]();
}

uint64_t sub_22579F778()
{
  return MEMORY[0x270F17470]();
}

uint64_t sub_22579F788()
{
  return MEMORY[0x270F17478]();
}

uint64_t sub_22579F798()
{
  return MEMORY[0x270F174A0]();
}

uint64_t sub_22579F7A8()
{
  return MEMORY[0x270F174A8]();
}

uint64_t sub_22579F7B8()
{
  return MEMORY[0x270F174D0]();
}

uint64_t sub_22579F7C8()
{
  return MEMORY[0x270F174D8]();
}

uint64_t sub_22579F7D8()
{
  return MEMORY[0x270F17500]();
}

uint64_t sub_22579F7E8()
{
  return MEMORY[0x270F17520]();
}

uint64_t sub_22579F7F8()
{
  return MEMORY[0x270F17528]();
}

uint64_t sub_22579F808()
{
  return MEMORY[0x270F17670]();
}

uint64_t sub_22579F818()
{
  return MEMORY[0x270F17678]();
}

uint64_t sub_22579F838()
{
  return MEMORY[0x270F17690]();
}

uint64_t sub_22579F848()
{
  return MEMORY[0x270F17698]();
}

uint64_t sub_22579F858()
{
  return MEMORY[0x270F17930]();
}

uint64_t sub_22579F868()
{
  return MEMORY[0x270F17C18]();
}

uint64_t sub_22579F878()
{
  return MEMORY[0x270F17C30]();
}

uint64_t sub_22579F888()
{
  return MEMORY[0x270F17C38]();
}

uint64_t sub_22579F898()
{
  return MEMORY[0x270F17C60]();
}

uint64_t sub_22579F8A8()
{
  return MEMORY[0x270F17C68]();
}

uint64_t sub_22579F8B8()
{
  return MEMORY[0x270F17C80]();
}

uint64_t sub_22579F8C8()
{
  return MEMORY[0x270F17C88]();
}

uint64_t sub_22579F8D8()
{
  return MEMORY[0x270F17C98]();
}

uint64_t sub_22579F8E8()
{
  return MEMORY[0x270F17CA0]();
}

uint64_t sub_22579F8F8()
{
  return MEMORY[0x270F17CA8]();
}

uint64_t sub_22579F908()
{
  return MEMORY[0x270F17CB8]();
}

uint64_t sub_22579F938()
{
  return MEMORY[0x270F17E18]();
}

uint64_t sub_22579F948()
{
  return MEMORY[0x270F17E78]();
}

uint64_t sub_22579F958()
{
  return MEMORY[0x270F17E80]();
}

uint64_t sub_22579F968()
{
  return MEMORY[0x270F17E98]();
}

uint64_t sub_22579F978()
{
  return MEMORY[0x270F17EA0]();
}

uint64_t sub_22579F988()
{
  return MEMORY[0x270F17EA8]();
}

uint64_t sub_22579F998()
{
  return MEMORY[0x270F17ED0]();
}

uint64_t sub_22579F9A8()
{
  return MEMORY[0x270F17EE0]();
}

uint64_t sub_22579F9B8()
{
  return MEMORY[0x270F17EE8]();
}

uint64_t sub_22579F9C8()
{
  return MEMORY[0x270F17F68]();
}

uint64_t sub_22579F9D8()
{
  return MEMORY[0x270F17F78]();
}

uint64_t sub_22579F9E8()
{
  return MEMORY[0x270EF30A8]();
}

uint64_t sub_22579F9F8()
{
  return MEMORY[0x270F17FA0]();
}

uint64_t sub_22579FA08()
{
  return MEMORY[0x270F18030]();
}

uint64_t sub_22579FA18()
{
  return MEMORY[0x270F18048]();
}

uint64_t sub_22579FA28()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_22579FA38()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_22579FA48()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_22579FA58()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_22579FA68()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_22579FA78()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_22579FA88()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22579FA98()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22579FAA8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_22579FAB8()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_22579FAC8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22579FAD8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_22579FAE8()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_22579FAF8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22579FB08()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22579FB18()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22579FB28()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_22579FB38()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_22579FB48()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22579FB58()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22579FB68()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_22579FB78()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22579FB88()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_22579FB98()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_22579FBA8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_22579FBB8()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_22579FBC8()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_22579FBD8()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_22579FBE8()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_22579FBF8()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_22579FC08()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_22579FC18()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_22579FC28()
{
  return MEMORY[0x270F9DF30]();
}

uint64_t sub_22579FC38()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_22579FC48()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_22579FC58()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_22579FC68()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_22579FC78()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_22579FC88()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_22579FC98()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22579FCA8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_22579FCB8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22579FCC8()
{
  return MEMORY[0x270EF33E8]();
}

uint64_t sub_22579FCD8()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_22579FCE8()
{
  return MEMORY[0x270FA0F30]();
}

uint64_t sub_22579FCF8()
{
  return MEMORY[0x270FA0F48]();
}

uint64_t sub_22579FD08()
{
  return MEMORY[0x270EF34F8]();
}

uint64_t sub_22579FD18()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_22579FD28()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_22579FD38()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_22579FD48()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22579FD58()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_22579FD68()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22579FD78()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22579FD88()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22579FD98()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22579FDA8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_22579FDB8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_22579FDC8()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_22579FDD8()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_22579FDE8()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_22579FDF8()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_22579FE08()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_22579FE18()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_22579FE28()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_22579FE38()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_22579FE48()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_22579FE58()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_22579FE68()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_22579FE78()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_22579FE88()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_22579FE98()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_22579FEA8()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_22579FEB8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22579FEC8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22579FED8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22579FEE8()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t sub_22579FEF8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22579FF08()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_22579FF18()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_22579FF28()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_22579FF38()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_22579FF48()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_22579FF58()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_22579FF68()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22579FF78()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_22579FF88()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22579FF98()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_22579FFA8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_22579FFB8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22579FFC8()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_22579FFD8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22579FFF8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2257A0008()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2257A0018()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_2257A0028()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2257A0038()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2257A0048()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_2257A0058()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_2257A0068()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2257A0078()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_2257A0088()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2257A0098()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2257A00A8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2257A00B8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2257A00C8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2257A00D8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2257A00E8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2257A00F8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_2257A0108()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2257A0118()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2257A0128()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2257A0138()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2257A0148()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_2257A0188()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x270F18A30]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x270EE48C8](theDate);
  return result;
}

uint64_t HAMenstrualAlgorithmsPhaseFromHKMCCycleFactor()
{
  return MEMORY[0x270F35C20]();
}

uint64_t HDAnalyticsCountOfSleepDaysWithStandHoursPriorToDate()
{
  return MEMORY[0x270F31968]();
}

uint64_t HDCategorySampleEntityPredicateEqualToValues()
{
  return MEMORY[0x270F31970]();
}

uint64_t HDDataEntityPredicateForObjectsFromAppleWatchSources()
{
  return MEMORY[0x270F31998]();
}

uint64_t HDDataEntityPredicateForSourceEntitySet()
{
  return MEMORY[0x270F319B0]();
}

uint64_t HDIsUnitTesting()
{
  return MEMORY[0x270F31A40]();
}

uint64_t HDSQLiteColumnAsDouble()
{
  return MEMORY[0x270F31AA0]();
}

uint64_t HDSQLiteColumnAsInt64()
{
  return MEMORY[0x270F31AA8]();
}

uint64_t HDSQLiteColumnAsUUID()
{
  return MEMORY[0x270F31AC0]();
}

uint64_t HDSampleEntityOrderingTermsForRecentness()
{
  return MEMORY[0x270F319F0]();
}

uint64_t HDSampleEntityPredicateForDataType()
{
  return MEMORY[0x270F319F8]();
}

uint64_t HDSampleEntityPredicateForDataTypes()
{
  return MEMORY[0x270F31A00]();
}

uint64_t HDSampleEntityPredicateForDateInterval()
{
  return MEMORY[0x270F31A08]();
}

uint64_t HDSampleEntityPredicateForEndDate()
{
  return MEMORY[0x270F31A10]();
}

uint64_t HDSampleEntityPredicateForStartDate()
{
  return MEMORY[0x270F31A18]();
}

uint64_t HKAnalyticsPropertyValueForBiologicalSex()
{
  return MEMORY[0x270EF35F8]();
}

uint64_t HKCategoryTypeFromDeviationType()
{
  return MEMORY[0x270F35C38]();
}

NSSet *HKCategoryValueSleepAnalysisAsleepValues(void)
{
  return (NSSet *)MEMORY[0x270EF3628]();
}

uint64_t HKCompareDoubles()
{
  return MEMORY[0x270EF3638]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
}

uint64_t HKFeatureSettingsKeyForDeviationDetectionTypeEnabled()
{
  return MEMORY[0x270F35C40]();
}

uint64_t HKFeatureSettingsKeyForIsLoggingHiddenForDisplayTypeIdentifier()
{
  return MEMORY[0x270F35C48]();
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x270EF3710]();
}

uint64_t HKIntersectionDayIndexRange()
{
  return MEMORY[0x270EF3720]();
}

uint64_t HKLocalDeviceHardwareSupportsWristTemperatureMeasurements()
{
  return MEMORY[0x270EF3740]();
}

uint64_t HKLogAnalytics()
{
  return MEMORY[0x270EF3758]();
}

uint64_t HKMCAllDeviationTypes()
{
  return MEMORY[0x270F35C50]();
}

uint64_t HKMCAllDisplayTypeIdentifiers()
{
  return MEMORY[0x270F35C58]();
}

uint64_t HKMCAllNotificationCategories()
{
  return MEMORY[0x270F35C60]();
}

uint64_t HKMCAppendCycleFactorsPhaseFromDaySummary()
{
  return MEMORY[0x270F35C68]();
}

uint64_t HKMCBackgroundAndSedentaryHeartRateContextSet()
{
  return MEMORY[0x270F35C70]();
}

uint64_t HKMCCycleChartMainTypes()
{
  return MEMORY[0x270F35C78]();
}

uint64_t HKMCCycleFactorsTypes()
{
  return MEMORY[0x270F35C80]();
}

uint64_t HKMCCycleTrackingSampleTypes()
{
  return MEMORY[0x270F35C88]();
}

uint64_t HKMCDataTypeCodeFromMenstrualSymptom()
{
  return MEMORY[0x270F35C90]();
}

uint64_t HKMCDaySummaryBleedingFlowHasFlow()
{
  return MEMORY[0x270F35C98]();
}

uint64_t HKMCDaySummaryCategoryTypes()
{
  return MEMORY[0x270F35CA0]();
}

uint64_t HKMCDaySummaryQuantityTypes()
{
  return MEMORY[0x270F35CA8]();
}

uint64_t HKMCDaySummarySampleTypes()
{
  return MEMORY[0x270F35CB0]();
}

uint64_t HKMCDaySummarySymptomArrayFromSymptoms()
{
  return MEMORY[0x270F35CB8]();
}

uint64_t HKMCDeviationDetectionAnalyticsKeyFromDeviationType()
{
  return MEMORY[0x270F35CC0]();
}

uint64_t HKMCDeviationSampleTypes()
{
  return MEMORY[0x270F35CC8]();
}

uint64_t HKMCDisplayTypeIdentifierForSampleType()
{
  return MEMORY[0x270F35CD0]();
}

uint64_t HKMCExperienceStoreClientInterface()
{
  return MEMORY[0x270F35CD8]();
}

uint64_t HKMCExperienceStoreServerInterface()
{
  return MEMORY[0x270F35CE0]();
}

uint64_t HKMCFertileWindowNotificationCategories()
{
  return MEMORY[0x270F35CE8]();
}

uint64_t HKMCForceDisableFertileWindowProjectionsFromCycleFactorSamples()
{
  return MEMORY[0x270F35CF0]();
}

uint64_t HKMCHeartRateContextIsSedentary()
{
  return MEMORY[0x270F35CF8]();
}

uint64_t HKMCIsAlgorithmsVersionSameOnPairedDevice()
{
  return MEMORY[0x270F35D00]();
}

uint64_t HKMCNotificationCategoryBeforePeriodStartForDays()
{
  return MEMORY[0x270F35D10]();
}

uint64_t HKMCNotificationDateComponentScalarFromCategory()
{
  return MEMORY[0x270F35D18]();
}

uint64_t HKMCPeriodNotificationCategories()
{
  return MEMORY[0x270F35D20]();
}

uint64_t HKMCSensorBasedFertileWindowNotificationCategories()
{
  return MEMORY[0x270F35D28]();
}

uint64_t HKMCSymptomSampleTypes()
{
  return MEMORY[0x270F35D30]();
}

uint64_t HKMCTodayIndex()
{
  return MEMORY[0x270F35D38]();
}

uint64_t HKSafeObject()
{
  return MEMORY[0x270EF3800]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x270EF3808]();
}

uint64_t HKShowSensitiveLogItems()
{
  return MEMORY[0x270EF3818]();
}

uint64_t HKSynchronizeNanoPreferencesUserDefaults()
{
  return MEMORY[0x270EF3898]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x270EF2BB8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t NSStringFromDeviationType()
{
  return MEMORY[0x270F35D50]();
}

uint64_t NSStringFromHKDayIndexRange()
{
  return MEMORY[0x270EF38C0]();
}

uint64_t NSStringFromHKNotificationInstructionAction()
{
  return MEMORY[0x270EF38D8]();
}

uint64_t NSStringFromPredictionPrimarySource()
{
  return MEMORY[0x270F35D58]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKCategoryValueSleepAnalysisAsleepValues()
{
  return MEMORY[0x270EF3930]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x270EF3978]();
}

uint64_t _HKLogPersistedSignposts()
{
  return MEMORY[0x270EF3980]();
}

uint64_t _HKLogSignpostIDGenerate()
{
  return MEMORY[0x270EF3988]();
}

uint64_t _HKMCAppleSleepingWristTemperatureType()
{
  return MEMORY[0x270F35D60]();
}

uint64_t _HKStatisticsOptionBaselineRelativeQuantities()
{
  return MEMORY[0x270EF39C0]();
}

uint64_t _HKStatisticsOptionPercentile()
{
  return MEMORY[0x270EF39C8]();
}

uint64_t _HKStatisticsOptionPresence()
{
  return MEMORY[0x270EF39D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

uint64_t std::__sort<std::__less<double,double> &,double *>()
{
  return MEMORY[0x270F98BD8]();
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x270EDA750](*(void *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
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

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x270EDBCA8](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

uint64_t xpc_activity_set_completion_status()
{
  return MEMORY[0x270EDBCD8]();
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}