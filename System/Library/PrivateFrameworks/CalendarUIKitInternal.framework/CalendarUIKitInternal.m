uint64_t CUIKITriggerReminderSync(uint64_t a1)
{
  uint64_t result;
  uint64_t vars8;

  result = [MEMORY[0x263F04B20] isReminderAppLocked];
  if ((result & 1) == 0)
  {
    return +[CUIKIReminderSyncTrigger triggerSyncWithWhy:a1];
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

uint64_t sub_2496E0CF0(uint64_t a1)
{
  return sub_2496E0D34(a1, qword_2696CBB58);
}

uint64_t sub_2496E0D10(uint64_t a1)
{
  return sub_2496E0D34(a1, qword_26B160E10);
}

uint64_t sub_2496E0D34(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2496F9900();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2496F98F0();
}

unint64_t static ReminderColorDeserializer.deserialize(from:)(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_2496F9820();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496E0EB4(a1, a2);
  sub_2496F9800();
  if (!v2)
  {
    a2 = sub_2496F97E0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return a2;
}

uint64_t sub_2496E0EB4(uint64_t a1, unint64_t a2)
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

id ReminderColorDeserializer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ReminderColorDeserializer.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReminderColorDeserializer();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ReminderColorDeserializer()
{
  return self;
}

id ReminderColorDeserializer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReminderColorDeserializer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2496E1190(uint64_t a1, unint64_t a2)
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

void RemindersInCalendarEditingReminderProperties.init(event:)(void *a1)
{
  sub_2496F9870();
  id v2 = objc_msgSend(a1, sel_title);
  if (v2)
  {
    uint64_t v3 = v2;
    sub_2496F9950();
  }
  sub_2496F9860();
  id v4 = objc_msgSend(a1, sel_notes);
  if (v4)
  {
    uint64_t v5 = v4;
    sub_2496F9950();
  }
  sub_2496F9850();
  id v6 = objc_msgSend(a1, sel_startDateComponents);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB910);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v6)
  {
    sub_2496F93C0();

    uint64_t v9 = sub_2496F93F0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_2496F93F0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  sub_2496F9830();
  id v11 = [a1 URL];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBAF0);
  MEMORY[0x270FA5388]();
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v11)
  {
    sub_2496F9440();

    uint64_t v14 = sub_2496F9460();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = sub_2496F9460();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 1, 1, v15);
  }
  sub_2496F9840();
}

id REMReminderChangeItem.cuiki_list.getter()
{
  v9[1] = *(id *)MEMORY[0x263EF8340];
  id v1 = objc_msgSend(v0, sel_listID);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = (void *)sub_2496F9AD0();
  v9[0] = 0;
  id v4 = objc_msgSend(v3, sel_fetchListWithObjectID_error_, v2, v9);

  id v5 = v9[0];
  if (!v4)
  {
    id v6 = v5;
    uint64_t v7 = (void *)sub_2496F9410();

    swift_willThrow();
    return 0;
  }

  return v4;
}

uint64_t sub_2496E1590(uint64_t a1, uint64_t a2)
{
  return sub_2496E1640(a1, a2, (SEL *)&selRef_titleAsString);
}

uint64_t sub_2496E159C(uint64_t a1, uint64_t a2)
{
  return sub_2496E1640(a1, a2, (SEL *)&selRef_notesAsString);
}

uint64_t sub_2496E15A8@<X0>(uint64_t a1@<X8>)
{
  return sub_2496E16A4((SEL *)&selRef_icsUrl, MEMORY[0x270FA8DD8], MEMORY[0x270FA8ED8], a1);
}

uint64_t sub_2496E15C4@<X0>(uint64_t a1@<X8>)
{
  return sub_2496E16A4((SEL *)&selRef_effectiveDisplayDateComponents_forCalendar, MEMORY[0x270FA8100], MEMORY[0x270FA8150], a1);
}

id sub_2496E15E4()
{
  return REMReminderChangeItem.cuiki_list.getter();
}

id REMReminder.cuiki_list.getter()
{
  id v1 = objc_msgSend(v0, sel_list);
  return v1;
}

uint64_t sub_2496E1640(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v4 = [*v3 *a3];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  uint64_t v6 = sub_2496F9950();

  return v6;
}

uint64_t sub_2496E16A4@<X0>(SEL *a1@<X2>, void (*a2)(void)@<X3>, uint64_t (*a3)(void)@<X4>, uint64_t a4@<X8>)
{
  id v8 = [*v4 *a1];
  if (v8)
  {
    uint64_t v9 = v8;
    a2();

    uint64_t v10 = ((uint64_t (*)(void))a3)(0);
    id v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v12 = v10;
    uint64_t v13 = a4;
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v15 = a3();
    id v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v12 = v15;
    uint64_t v13 = a4;
    uint64_t v14 = 1;
  }
  return v11(v13, v14, 1, v12);
}

uint64_t sub_2496E1784()
{
  id v1 = objc_msgSend(*v0, sel_recurrenceRules);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  sub_2496E5150(0, &qword_2696CB948);
  uint64_t v3 = sub_2496F99A0();

  return v3;
}

id sub_2496E17F8()
{
  id v1 = objc_msgSend(*v0, sel_list);
  return v1;
}

id sub_2496E1830()
{
  id v1 = objc_msgSend(*v0, sel_objectID);
  return v1;
}

void EKEvent.update(from:updateDates:forSavingIntegrationEvent:)(void *a1, char a2, int a3)
{
  id v4 = v3;
  LODWORD(v5) = a3;
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v8);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v9);
  if (v10)
  {
    id v11 = (void *)sub_2496F9940();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_setTitle_, v11);
  }
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v12);
  (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v12, v13);
  if (v14)
  {
    uint64_t v15 = (void *)sub_2496F9940();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = 0;
  }
  objc_msgSend(v4, sel_setNotes_, v15);

  uint64_t v16 = a1[3];
  uint64_t v17 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v16);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBAF0);
  MEMORY[0x270FA5388](v18 - 8);
  v20 = (char *)v135 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(v17 + 24))(v16, v17);
  uint64_t v21 = sub_2496F9460();
  uint64_t v22 = *(void *)(v21 - 8);
  v23 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) != 1)
  {
    v23 = (void *)sub_2496F9430();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v20, v21);
  }
  objc_msgSend(v4, sel_setURL_, v23);

  uint64_t v24 = a1[3];
  uint64_t v25 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v24);
  v26 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v25 + 56))(v24, v25);
  id v27 = objc_msgSend(v26, sel_urlRepresentation);

  MEMORY[0x270FA5388](v28);
  v30 = (char *)v135 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496F9440();

  sub_2496F9420();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v30, v21);
  v31 = (void *)sub_2496F9940();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setUniqueID_, v31);

  if ((a2 & 1) == 0) {
    goto LABEL_38;
  }
  id v156 = v4;
  int v155 = (int)v5;
  uint64_t v32 = sub_2496F93F0();
  uint64_t v33 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  v153 = v34;
  v35 = (char *)v135 - ((unint64_t)(v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = a1[3];
  uint64_t v37 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v36);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB910);
  MEMORY[0x270FA5388](v38 - 8);
  v40 = (char *)v135 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(v37 + 32))(v36, v37);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v40, 1, v32) != 1)
  {
    v150 = v135;
    uint64_t v151 = v33;
    v41 = *(void (**)(char *, char *, uint64_t))(v33 + 32);
    uint64_t v152 = v32;
    v41(v35, v40, v32);
    uint64_t v148 = sub_2496F9540();
    v149 = v135;
    uint64_t v147 = *(void *)(v148 - 8);
    MEMORY[0x270FA5388](v148);
    v43 = (char *)v135 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v44 = sub_2496F94D0();
    uint64_t v45 = *(void *)(v44 - 8);
    MEMORY[0x270FA5388](v44);
    v47 = (char *)v135 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, void, uint64_t))(v45 + 104))(v47, *MEMORY[0x263F07738], v44);
    v154 = v43;
    sub_2496F94E0();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v47, v44);
    id v48 = objc_msgSend(v156, sel_effectiveTimeZone);
    uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB920);
    MEMORY[0x270FA5388](v49 - 8);
    v51 = (char *)v135 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v48)
    {
      id v5 = v35;
      uint64_t v52 = sub_2496F9560();
      uint64_t v53 = *(void *)(v52 - 8);
      MEMORY[0x270FA5388](v52);
      v55 = (char *)v135 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_2496F9550();

      (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v51, v55, v52);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v53 + 56))(v51, 0, 1, v52);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48))(v51, 1, v52) != 1)
      {
        sub_2496F9520();
        id v4 = v156;
        unsigned __int8 v56 = objc_msgSend(v156, sel_isAllDay);
        sub_2496F93E0();
        char v58 = v57;
        v144 = v5;
        LODWORD(v143) = v57;
        if ((v57 & 1) == 0)
        {
          if ((v56 & 1) == 0) {
            objc_msgSend(v4, sel_duration);
          }
          uint64_t v140 = 0;
          goto LABEL_30;
        }
        uint64_t v59 = sub_2496F94C0();
        v142 = (char *)v135;
        v60 = *(void **)(v59 - 8);
        MEMORY[0x270FA5388](v59);
        v145 = v61;
        unint64_t v62 = ((unint64_t)v61 + 15) & 0xFFFFFFFFFFFFFFF0;
        v141 = (char *)v135 - v62;
        id v63 = objc_msgSend(v4, sel_startDate);
        uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB928);
        v146 = v135;
        uint64_t v65 = *(void *)(*(void *)(v64 - 8) + 64);
        uint64_t v66 = MEMORY[0x270FA5388](v64 - 8);
        if (v63)
        {
          v139 = v135;
          MEMORY[0x270FA5388](v66);
          sub_2496F94B0();

          v67 = (void (*)(char *, char *, uint64_t))v60[4];
          char v58 = (char)v143;
          v67((char *)v135 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)v135 - v62, v59);
          v138 = (void *)v60[7];
          ((void (*)(char *, void, uint64_t, uint64_t))v138)((char *)v135 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v59);
          v139 = v60;
          uint64_t v140 = v59;
          v137 = (unsigned int (*)(char *, uint64_t, uint64_t))v60[6];
          if (v137((char *)v135 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v59) != 1)
          {
            v136 = (uint64_t (*)(void))v67;
            uint64_t v68 = ((uint64_t (*)(char *, char *, uint64_t))v67)(v141, (char *)v135 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0), v140);
            v146 = v135;
            MEMORY[0x270FA5388](v68);
            unint64_t v70 = (v69 + 15) & 0xFFFFFFFFFFFFFFF0;
            id v71 = objc_msgSend(v4, sel_endDateUnadjustedForLegacyClients);
            uint64_t v72 = MEMORY[0x270FA5388](v71);
            v73 = (char *)v135 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
            if (v72)
            {
              v135[0] = (char *)v135 - v70;
              v135[1] = v135;
              MEMORY[0x270FA5388](v72);
              sub_2496F94B0();

              v74 = (char *)v135 - v70;
              uint64_t v75 = v140;
              v76 = v136;
              ((void (*)(char *, char *, uint64_t))v136)(v73, v74, v140);
              ((void (*)(char *, void, uint64_t, uint64_t))v138)(v73, 0, 1, v75);
              if (v137(v73, 1, v75) != 1)
              {
                v77 = (char *)v135[0];
                uint64_t v78 = v76();
                v138 = v135;
                MEMORY[0x270FA5388](v78);
                v80 = (char *)v135 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0);
                __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB930);
                uint64_t v81 = sub_2496F9530();
                uint64_t v82 = *(void *)(v81 - 8);
                unint64_t v83 = (*(unsigned __int8 *)(v82 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80);
                uint64_t v84 = swift_allocObject();
                *(_OWORD *)(v84 + 16) = xmmword_2496FA7A0;
                (*(void (**)(unint64_t, void, uint64_t))(v82 + 104))(v84 + v83, *MEMORY[0x263F07868], v81);
                sub_2496E3A1C(v84);
                swift_setDeallocating();
                swift_arrayDestroy();
                uint64_t v85 = swift_deallocClassInstance();
                MEMORY[0x270FA5388](v85);
                v87 = (char *)v135 - ((v86 + 15) & 0xFFFFFFFFFFFFFFF0);
                v88 = v77;
                sub_2496F9490();
                v89 = v141;
                sub_2496F94F0();
                swift_bridgeObjectRelease();
                uint64_t v90 = v140;
                v91 = (void (*)(char *, uint64_t))v139[1];
                v91(v87, v140);
                uint64_t v92 = sub_2496F93D0();
                LOBYTE(v87) = v93;
                (*(void (**)(char *, uint64_t))(v151 + 8))(v80, v152);
                v91(v88, v90);
                v91(v89, v90);
                if (v87)
                {
                  uint64_t v94 = 1;
                }
                else if (v92 <= 1)
                {
                  uint64_t v94 = 1;
                }
                else
                {
                  uint64_t v94 = v92;
                }
                uint64_t v140 = v94;
                id v5 = v144;
                char v58 = (char)v143;
                id v4 = v156;
                goto LABEL_30;
              }
            }
            else
            {
              uint64_t v75 = v140;
              ((void (*)(char *, uint64_t, uint64_t, uint64_t))v138)(v73, 1, 1, v140);
            }
            ((void (*)(char *, uint64_t))v139[1])(v141, v75);
            sub_2496E44D4((uint64_t)v73, &qword_2696CB928);
            uint64_t v140 = 1;
            char v58 = (char)v143;
LABEL_29:
            id v5 = v144;
LABEL_30:
            objc_msgSend(v4, sel_setAllDay_, v58 & 1);
            v95 = (void *)sub_2496F94C0();
            v146 = v135;
            v96 = (void *)*(v95 - 1);
            v97 = (unsigned int (*)(char *, uint64_t, uint64_t))v96[8];
            MEMORY[0x270FA5388](v95);
            v142 = (char *)(((unint64_t)v97 + 15) & 0xFFFFFFFFFFFFFFF0);
            v153 = (char *)((char *)v135 - v142);
            uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB928);
            v145 = v135;
            uint64_t v99 = *(void *)(*(void *)(v98 - 8) + 64);
            MEMORY[0x270FA5388](v98 - 8);
            v100 = v154;
            sub_2496F9500();
            v101 = (char *)v96[6];
            id v156 = v95;
            v141 = v101;
            if (((unsigned int (*)(char *, uint64_t, void *))v101)((char *)v135 - ((v99 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v95) == 1)
            {
              (*(void (**)(char *, uint64_t))(v147 + 8))(v100, v148);
              (*(void (**)(char *, uint64_t))(v151 + 8))(v5, v152);
              sub_2496E44D4((uint64_t)v135 - ((v99 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2696CB928);
              LOBYTE(v5) = v155;
            }
            else
            {
              v138 = (void *)v96[4];
              v139 = v96 + 4;
              ((void (*)(char *, char *, id))v138)(v153, (char *)v135 - ((v99 + 15) & 0xFFFFFFFFFFFFFFF0), v156);
              v102 = (void *)sub_2496F94A0();
              objc_msgSend(v4, sel_setStartDate_, v102);

              uint64_t v104 = MEMORY[0x270FA5388](v103);
              v105 = v96;
              if (v143)
              {
                v136 = (uint64_t (*)(void))((char *)v135 - v142);
                v137 = v97;
                v145 = v135;
                v143 = v135;
                MEMORY[0x270FA5388](v104);
                v106 = (char *)v135 - ((v99 + 15) & 0xFFFFFFFFFFFFFFF0);
                uint64_t v107 = sub_2496F9530();
                v142 = (char *)v135;
                uint64_t v108 = *(void *)(v107 - 8);
                MEMORY[0x270FA5388](v107);
                v110 = (char *)v135 - ((v109 + 15) & 0xFFFFFFFFFFFFFFF0);
                (*(void (**)(char *, void, uint64_t))(v108 + 104))(v110, *MEMORY[0x263F07868], v107);
                v111 = v154;
                sub_2496F9510();
                uint64_t v112 = v107;
                v113 = v106;
                (*(void (**)(char *, uint64_t))(v108 + 8))(v110, v112);
                if (((unsigned int (*)(char *, uint64_t, id))v141)(v106, 1, v156) == 1)
                {
                  ((void (*)(char *, id))v105[1])(v153, v156);
                  (*(void (**)(char *, uint64_t))(v147 + 8))(v111, v148);
                  (*(void (**)(char *, uint64_t))(v151 + 8))(v144, v152);
                  sub_2496E44D4((uint64_t)v106, &qword_2696CB928);
                }
                else
                {
                  v120 = v136;
                  id v121 = v156;
                  uint64_t v122 = ((uint64_t (*)(uint64_t (*)(void), char *, id))v138)(v136, v113, v156);
                  MEMORY[0x270FA5388](v122);
                  v124 = v105;
                  v125 = (char *)v135 - ((v123 + 15) & 0xFFFFFFFFFFFFFFF0);
                  sub_2496F9490();
                  v126 = (void *)sub_2496F94A0();
                  v127 = (void (*)(char *, id))v124[1];
                  v127(v125, v121);
                  objc_msgSend(v4, sel_setEndDateUnadjustedForLegacyClients_, v126);

                  v127((char *)v120, v121);
                  v127(v153, v121);
                  (*(void (**)(char *, uint64_t))(v147 + 8))(v111, v148);
                  (*(void (**)(char *, uint64_t))(v151 + 8))(v144, v152);
                }
              }
              else
              {
                v114 = v153;
                v115 = (char *)((char *)v135 - v142);
                sub_2496F9490();
                v116 = (void *)sub_2496F94A0();
                v117 = (void (*)(char *, id))v96[1];
                v118 = v115;
                id v119 = v156;
                v117(v118, v156);
                objc_msgSend(v4, sel_setEndDateUnadjustedForLegacyClients_, v116);

                v117(v114, v119);
                (*(void (**)(char *, uint64_t))(v147 + 8))(v154, v148);
                (*(void (**)(char *, uint64_t))(v151 + 8))(v144, v152);
              }
              LOBYTE(v5) = v155;
            }
            goto LABEL_38;
          }
        }
        else
        {
          ((void (*)(char *, uint64_t, uint64_t, uint64_t))v60[7])((char *)v135 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v59);
        }
        sub_2496E44D4((uint64_t)v135 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2696CB928);
        uint64_t v140 = 1;
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v134 = sub_2496F9560();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v134 - 8) + 56))(v51, 1, 1, v134);
    }
    __break(1u);
    return;
  }
  sub_2496E44D4((uint64_t)v40, &qword_2696CB910);
  LOBYTE(v5) = v155;
  id v4 = v156;
LABEL_38:
  uint64_t v128 = a1[3];
  uint64_t v129 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v128);
  unint64_t v130 = (*(uint64_t (**)(uint64_t, uint64_t))(v129 + 40))(v128, v129);
  uint64_t v131 = _sSo16EKRecurrenceRuleC21CalendarUIKitInternalE7convertySayABGSgSaySo013REMRecurrenceB0CGSgFZ_0(v130);
  swift_bridgeObjectRelease();
  if (v131)
  {
    sub_2496E5150(0, &qword_2696CB918);
    v132 = (void *)sub_2496F9990();
    swift_bridgeObjectRelease();
  }
  else
  {
    v132 = 0;
  }
  objc_msgSend(v4, sel_setRecurrenceRules_, v132);

  if (v5)
  {
    id v133 = sub_2496E2D40(a1);
    objc_msgSend(v4, sel_setColor_, v133);
  }
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

id sub_2496E2D40(void *a1)
{
  id v2 = v1;
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  id v5 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 48))(v3, v4);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  id v7 = objc_msgSend(v5, sel_objectID);
  id v8 = objc_msgSend(v7, sel_urlRepresentation);

  uint64_t v9 = sub_2496F9460();
  uint64_t v10 = *(void *)(v9 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496F9440();

  sub_2496F9420();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  id result = objc_msgSend(v2, sel_eventStore);
  if (result)
  {
    uint64_t v14 = result;
    id v15 = (id)*MEMORY[0x263F30288];
    uint64_t v16 = (void *)sub_2496F9940();
    id v17 = objc_msgSend(v14, sel_colorWithProviderIdentifier_externalIdentifier_, v15, v16);

    if (v17)
    {

      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v18 = sub_2496F9820();
      v28[0] = v28;
      uint64_t v19 = *(void *)(v18 - 8);
      MEMORY[0x270FA5388](v18);
      uint64_t v21 = (char *)v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      id v22 = objc_msgSend(v6, sel_color, v28[0]);
      sub_2496F9810();
      uint64_t v23 = sub_2496F97F0();
      unint64_t v25 = v24;
      id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04B70]), sel_init);
      objc_msgSend(v17, sel_setProviderIdentifier_, v15);
      v26 = (void *)sub_2496F9940();
      swift_bridgeObjectRelease();
      objc_msgSend(v17, sel_setExternalID_, v26);

      id v27 = (void *)sub_2496F9470();
      objc_msgSend(v17, sel_setData_, v27);

      sub_2496E1190(v23, v25);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
    }
    return v17;
  }
  __break(1u);
  return result;
}

id static EKRecurrenceRule.convert(_:)(void *a1)
{
  id v2 = objc_msgSend(a1, sel_frequency);
  if ((unint64_t)v2 > 3) {
    return 0;
  }
  uint64_t v3 = (uint64_t)v2;
  id v4 = objc_msgSend(a1, sel_interval);
  id v5 = objc_msgSend(a1, sel_daysOfTheWeek);
  if (v5)
  {
    uint64_t v6 = v5;
    sub_2496E5150(0, &qword_2696CB940);
    unint64_t v7 = sub_2496F99A0();
  }
  else
  {
    unint64_t v7 = 0;
  }
  unint64_t v9 = sub_2496E48D8(v7, (Class *)0x263F04BC0);
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(a1, sel_daysOfTheMonth);
  if (v10)
  {
    uint64_t v11 = v10;
    sub_2496E5150(0, &qword_2696CB938);
    uint64_t v12 = sub_2496F99A0();
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = objc_msgSend(a1, sel_monthsOfTheYear);
  if (v13)
  {
    uint64_t v14 = v13;
    sub_2496E5150(0, &qword_2696CB938);
    uint64_t v15 = sub_2496F99A0();
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v16 = objc_msgSend(a1, sel_weeksOfTheYear);
  if (v16)
  {
    id v17 = v16;
    sub_2496E5150(0, &qword_2696CB938);
    uint64_t v18 = sub_2496F99A0();
  }
  else
  {
    uint64_t v18 = 0;
  }
  id v19 = objc_msgSend(a1, sel_daysOfTheYear);
  if (v19)
  {
    uint64_t v20 = v19;
    sub_2496E5150(0, &qword_2696CB938);
    uint64_t v21 = sub_2496F99A0();
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v22 = objc_msgSend(a1, sel_setPositions);
  if (v22)
  {
    uint64_t v23 = v22;
    sub_2496E5150(0, &qword_2696CB938);
    uint64_t v24 = sub_2496F99A0();
  }
  else
  {
    uint64_t v24 = 0;
  }
  id v25 = objc_msgSend(a1, sel_recurrenceEnd);
  v26 = (void *)sub_2496E4530(v25);

  id v27 = objc_allocWithZone(MEMORY[0x263F04BD8]);
  return sub_2496E3590(v3, (uint64_t)v4, v9, v12, v15, v18, v21, v24, v26);
}

uint64_t static REMRecurrenceRule.convert(_:account:reminder:)(unint64_t a1, void *a2, void *a3)
{
  unint64_t v3 = a1;
  if (!a1) {
    return v3;
  }
  unint64_t v13 = MEMORY[0x263F8EE78];
  if (!(a1 >> 62))
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v6) {
      goto LABEL_4;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    unint64_t v3 = MEMORY[0x263F8EE78];
    if (!(MEMORY[0x263F8EE78] >> 62)) {
      goto LABEL_15;
    }
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_2496F9CF0();
  uint64_t v6 = result;
  if (!result) {
    goto LABEL_19;
  }
LABEL_4:
  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v9 = (id)MEMORY[0x24C5A9840](i, v3);
      }
      else {
        id v9 = *(id *)(v3 + 8 * i + 32);
      }
      id v10 = v9;
      id v11 = _sSo17REMRecurrenceRuleC21CalendarUIKitInternalE7convert_7account8reminderABSgSo012EKRecurrenceB0C_So11REMObjectIDCAKtFZ_0(v9, a2, a3);

      if (v11)
      {
        MEMORY[0x24C5A9580]();
        if (*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_2496F99D0();
        }
        sub_2496F99F0();
        sub_2496F99B0();
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v3 = v13;
    if (!(v13 >> 62))
    {
LABEL_15:
      if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        return v3;
      }
LABEL_16:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_2496F9CF0();
    swift_bridgeObjectRelease();
    if (v12) {
      return v3;
    }
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

id sub_2496E3590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  if (a3)
  {
    sub_2496E5150(0, &qword_2696CB950);
    id v16 = (void *)sub_2496F9990();
    swift_bridgeObjectRelease();
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = 0;
    if (a4)
    {
LABEL_3:
      sub_2496E5150(0, &qword_2696CB938);
      id v17 = (void *)sub_2496F9990();
      swift_bridgeObjectRelease();
      if (a5) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  id v17 = 0;
  if (a5)
  {
LABEL_4:
    sub_2496E5150(0, &qword_2696CB938);
    uint64_t v18 = (void *)sub_2496F9990();
    swift_bridgeObjectRelease();
    if (a6) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v18 = 0;
  if (a6)
  {
LABEL_5:
    sub_2496E5150(0, &qword_2696CB938);
    id v19 = (void *)sub_2496F9990();
    swift_bridgeObjectRelease();
    if (a7) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v20 = 0;
    uint64_t v21 = a9;
    if (a8) {
      goto LABEL_7;
    }
LABEL_13:
    id v22 = 0;
    goto LABEL_14;
  }
LABEL_11:
  id v19 = 0;
  if (!a7) {
    goto LABEL_12;
  }
LABEL_6:
  sub_2496E5150(0, &qword_2696CB938);
  uint64_t v20 = (void *)sub_2496F9990();
  swift_bridgeObjectRelease();
  uint64_t v21 = a9;
  if (!a8) {
    goto LABEL_13;
  }
LABEL_7:
  sub_2496E5150(0, &qword_2696CB938);
  id v22 = (void *)sub_2496F9990();
  swift_bridgeObjectRelease();
LABEL_14:
  id v23 = objc_msgSend(v25, sel_initRecurrenceWithFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_, a1, a2, v16, v17, v18, v19, v20, v22, v21);

  return v23;
}

id sub_2496E37BC(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  if (a7)
  {
    sub_2496E5150(0, &qword_2696CB940);
    id v16 = (void *)sub_2496F9990();
    swift_bridgeObjectRelease();
    uint64_t v17 = a9;
    if (a8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = 0;
    uint64_t v17 = a9;
    if (a8)
    {
LABEL_3:
      sub_2496E5150(0, &qword_2696CB938);
      uint64_t v18 = (void *)sub_2496F9990();
      swift_bridgeObjectRelease();
      uint64_t v19 = a10;
      if (v17) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  uint64_t v18 = 0;
  uint64_t v19 = a10;
  if (v17)
  {
LABEL_4:
    sub_2496E5150(0, &qword_2696CB938);
    uint64_t v20 = (void *)sub_2496F9990();
    swift_bridgeObjectRelease();
    uint64_t v21 = a11;
    if (v19) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v20 = 0;
  uint64_t v21 = a11;
  if (v19)
  {
LABEL_5:
    sub_2496E5150(0, &qword_2696CB938);
    id v22 = (void *)sub_2496F9990();
    swift_bridgeObjectRelease();
    uint64_t v23 = a12;
    if (v21) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v24 = 0;
    id v25 = a13;
    if (v23) {
      goto LABEL_7;
    }
LABEL_13:
    v26 = 0;
    goto LABEL_14;
  }
LABEL_11:
  id v22 = 0;
  uint64_t v23 = a12;
  if (!v21) {
    goto LABEL_12;
  }
LABEL_6:
  sub_2496E5150(0, &qword_2696CB938);
  uint64_t v24 = (void *)sub_2496F9990();
  swift_bridgeObjectRelease();
  id v25 = a13;
  if (!v23) {
    goto LABEL_13;
  }
LABEL_7:
  sub_2496E5150(0, &qword_2696CB938);
  v26 = (void *)sub_2496F9990();
  swift_bridgeObjectRelease();
LABEL_14:
  id v27 = objc_msgSend(v29, sel_initRecurrenceRuleWithObjectID_accountID_reminderID_frequency_interval_firstDayOfTheWeek_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_, a1, a2, a3, a4, a5, a6, v16, v18, v20, v22, v24, v26, v25);

  return v27;
}

uint64_t sub_2496E3A1C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB958);
    uint64_t v3 = sub_2496F9C10();
    uint64_t v36 = v3 + 56;
    uint64_t result = sub_2496F9530();
    uint64_t v5 = result;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)(result - 8);
    id v8 = *(void (**)(char *))(v7 + 16);
    uint64_t v34 = v7 + 16;
    v35 = v8;
    uint64_t v29 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    uint64_t v9 = v3;
    uint64_t v37 = *(void *)(v7 + 72);
    uint64_t v33 = *(void *)(v7 + 64);
    id v10 = (uint64_t (**)(char *, uint64_t))(v7 + 8);
    uint64_t v27 = v1;
    uint64_t v28 = (uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32);
    while (1)
    {
      MEMORY[0x270FA5388](result);
      unint64_t v32 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
      uint64_t v12 = (char *)&v26 - v32;
      v35((char *)&v26 - v32);
      sub_2496E518C(&qword_2696CB960);
      uint64_t v13 = sub_2496F9920();
      uint64_t v14 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v15 = v13 & v14;
      unint64_t v16 = (v13 & (unint64_t)v14) >> 6;
      uint64_t v17 = *(void *)(v36 + 8 * v16);
      uint64_t v18 = 1 << (v13 & v14);
      if ((v18 & v17) != 0)
      {
        v30 = &v26;
        uint64_t v31 = v6;
        do
        {
          MEMORY[0x270FA5388](v13);
          uint64_t v19 = (char *)&v26 - v32;
          uint64_t v20 = v9;
          ((void (*)(char *, unint64_t, uint64_t))v35)((char *)&v26 - v32, *(void *)(v9 + 48) + v15 * v37, v5);
          sub_2496E518C(&qword_2696CB968);
          char v21 = sub_2496F9930();
          id v22 = *v10;
          uint64_t v13 = (*v10)(v19, v5);
          if (v21)
          {
            uint64_t result = v22(v12, v5);
            uint64_t v1 = v27;
            uint64_t v9 = v20;
            uint64_t v6 = v31;
            goto LABEL_4;
          }
          unint64_t v15 = (v15 + 1) & v14;
          unint64_t v16 = v15 >> 6;
          uint64_t v17 = *(void *)(v36 + 8 * (v15 >> 6));
          uint64_t v18 = 1 << v15;
          uint64_t v9 = v20;
        }
        while ((v17 & (1 << v15)) != 0);
        uint64_t v1 = v27;
        uint64_t v6 = v31;
      }
      *(void *)(v36 + 8 * v16) = v18 | v17;
      uint64_t result = (*v28)(*(void *)(v9 + 48) + v15 * v37, v12, v5);
      uint64_t v23 = *(void *)(v9 + 16);
      BOOL v24 = __OFADD__(v23, 1);
      uint64_t v25 = v23 + 1;
      if (v24) {
        break;
      }
      *(void *)(v9 + 16) = v25;
LABEL_4:
      if (++v6 == v1) {
        return v9;
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE88];
  }
  return result;
}

uint64_t _sSo16EKRecurrenceRuleC21CalendarUIKitInternalE7convertySayABGSgSaySo013REMRecurrenceB0CGSgFZ_0(unint64_t a1)
{
  if (!a1) {
    return 0;
  }
  unint64_t v1 = a1;
  unint64_t v62 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
LABEL_51:
    swift_bridgeObjectRetain();
    uint64_t result = sub_2496F9CF0();
    uint64_t v2 = result;
    if (result) {
      goto LABEL_4;
    }
    goto LABEL_52;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v2)
  {
LABEL_52:
    swift_bridgeObjectRelease();
    unint64_t v43 = MEMORY[0x263F8EE78];
    if (!(MEMORY[0x263F8EE78] >> 62)) {
      goto LABEL_46;
    }
LABEL_53:
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_2496F9CF0();
    swift_bridgeObjectRelease();
    if (v44) {
      return v43;
    }
LABEL_47:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_4:
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v4 = 0;
  unint64_t v5 = v1 & 0xC000000000000001;
  unint64_t v6 = 0x265261000uLL;
  uint64_t v48 = v2;
  unint64_t v49 = v1;
  unint64_t v47 = v1 & 0xC000000000000001;
  do
  {
    if (v5) {
      id v7 = (id)MEMORY[0x24C5A9840](v4, v1);
    }
    else {
      id v7 = *(id *)(v1 + 8 * v4 + 32);
    }
    id v8 = v7;
    id v9 = [v7 *(SEL *)(v6 + 2640)];
    if ((unint64_t)v9 >= 4)
    {

      goto LABEL_7;
    }
    uint64_t v61 = (uint64_t)v9;
    id v60 = objc_msgSend(v8, sel_interval);
    id v10 = objc_msgSend(v8, sel_daysOfTheWeek);
    if (v10)
    {
      uint64_t v11 = v10;
      sub_2496E5150(0, &qword_2696CB940);
      unint64_t v12 = sub_2496F99A0();
    }
    else
    {
      unint64_t v12 = 0;
    }
    unint64_t v59 = sub_2496E48D8(v12, (Class *)0x263F04BC0);
    swift_bridgeObjectRelease();
    id v13 = objc_msgSend(v8, sel_daysOfTheMonth);
    if (v13)
    {
      uint64_t v14 = v13;
      sub_2496E5150(0, &qword_2696CB938);
      uint64_t v58 = sub_2496F99A0();
    }
    else
    {
      uint64_t v58 = 0;
    }
    id v15 = objc_msgSend(v8, sel_monthsOfTheYear);
    if (v15)
    {
      unint64_t v16 = v15;
      sub_2496E5150(0, &qword_2696CB938);
      uint64_t v57 = sub_2496F99A0();
    }
    else
    {
      uint64_t v57 = 0;
    }
    id v17 = objc_msgSend(v8, sel_weeksOfTheYear);
    if (v17)
    {
      uint64_t v18 = v17;
      sub_2496E5150(0, &qword_2696CB938);
      uint64_t v56 = sub_2496F99A0();
    }
    else
    {
      uint64_t v56 = 0;
    }
    id v19 = objc_msgSend(v8, sel_daysOfTheYear);
    if (v19)
    {
      uint64_t v20 = v19;
      sub_2496E5150(0, &qword_2696CB938);
      uint64_t v55 = sub_2496F99A0();
    }
    else
    {
      uint64_t v55 = 0;
    }
    id v21 = objc_msgSend(v8, sel_setPositions);
    if (v21)
    {
      id v22 = v21;
      sub_2496E5150(0, &qword_2696CB938);
      uint64_t v54 = sub_2496F99A0();
    }
    else
    {
      uint64_t v54 = 0;
    }
    id v23 = objc_msgSend(v8, sel_recurrenceEnd);
    if (v23)
    {
      BOOL v24 = v23;
      uint64_t v25 = sub_2496F94C0();
      uint64_t v52 = &v45;
      uint64_t v26 = *(void *)(v25 - 8);
      uint64_t v27 = *(void *)(v26 + 64);
      MEMORY[0x270FA5388](v25);
      unint64_t v28 = (v27 + 15) & 0xFFFFFFFFFFFFFFF0;
      id v53 = v24;
      unint64_t v1 = (unint64_t)objc_msgSend(v53, sel_endDate);
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB928);
      v51 = &v45;
      uint64_t v30 = *(void *)(*(void *)(v29 - 8) + 64);
      uint64_t v31 = MEMORY[0x270FA5388](v29 - 8);
      if (!v1)
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56))((char *)&v45 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v25);
LABEL_37:
        sub_2496E44D4((uint64_t)&v45 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2696CB928);
        id v38 = v53;
        unint64_t v39 = (unint64_t)objc_msgSend(v53, sel_occurrenceCount);
        if ((v39 & 0x8000000000000000) != 0)
        {
          __break(1u);
          goto LABEL_51;
        }
        id v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04BC8]), sel_initWithOccurrenceCount_, v39);

        uint64_t v2 = v48;
        unint64_t v1 = v49;
        unint64_t v5 = v47;
        unint64_t v6 = 0x265261000;
        goto LABEL_41;
      }
      uint64_t v50 = (char *)&v45 - v28;
      MEMORY[0x270FA5388](v31);
      unint64_t v32 = (char *)&v45 - v28;
      sub_2496F94B0();

      uint64_t v33 = v26;
      unint64_t v1 = *(void *)(v26 + 32);
      ((void (*)(char *, char *, uint64_t))v1)((char *)&v45 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0), v32, v25);
      uint64_t v46 = *(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56);
      v46((char *)&v45 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v25);
      uint64_t v45 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
      if (v45((char *)&v45 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v25) == 1) {
        goto LABEL_37;
      }
      uint64_t v34 = ((uint64_t (*)(char *, char *, uint64_t))v1)(v50, (char *)&v45 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0), v25);
      v51 = &v45;
      MEMORY[0x270FA5388](v34);
      v35 = (char *)&v45 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v35, v50, v25);
      v46(v35, 0, 1, v25);
      if (v45(v35, 1, v25) == 1)
      {
        uint64_t v36 = 0;
      }
      else
      {
        uint64_t v36 = (void *)sub_2496F94A0();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v35, v25);
      }
      unint64_t v1 = v49;
      unint64_t v6 = 0x265261000;
      id v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04BC8]), sel_initWithEndDate_, v36);
      id v40 = v53;

      (*(void (**)(char *, uint64_t))(v33 + 8))(v50, v25);
      unint64_t v5 = v47;
      uint64_t v2 = v48;
    }
    else
    {
      id v37 = 0;
    }
LABEL_41:
    id v41 = objc_allocWithZone(MEMORY[0x263F04BD8]);
    id v42 = sub_2496E3590(v61, (uint64_t)v60, v59, v58, v57, v56, v55, v54, v37);

    if (v42)
    {
      MEMORY[0x24C5A9580]();
      if (*(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_2496F99D0();
      }
      sub_2496F99F0();
      sub_2496F99B0();
    }
LABEL_7:
    ++v4;
  }
  while (v2 != v4);
  swift_bridgeObjectRelease();
  unint64_t v43 = v62;
  if (v62 >> 62) {
    goto LABEL_53;
  }
LABEL_46:
  if (!*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_47;
  }
  return v43;
}

uint64_t sub_2496E44D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2496E4530(void *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = sub_2496F94C0();
  uint64_t v25 = &v20;
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  id v24 = a1;
  id v6 = objc_msgSend(v24, sel_endDate);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB928);
  id v23 = &v20;
  uint64_t v8 = *(void *)(*(void *)(v7 - 8) + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v7 - 8);
  if (v6)
  {
    id v22 = (char *)&v20 - v5;
    MEMORY[0x270FA5388](v9);
    sub_2496F94B0();

    id v10 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v10((char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v20 - v5, v2);
    uint64_t v11 = *(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56);
    v11((char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), 0, 1, v2);
    unint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
    if (v12((char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v2) != 1)
    {
      id v21 = v11;
      id v13 = v22;
      uint64_t v14 = ((uint64_t (*)(char *, char *, uint64_t))v10)(v22, (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
      MEMORY[0x270FA5388](v14);
      id v15 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v15, v13, v2);
      v21(v15, 0, 1, v2);
      if (v12(v15, 1, v2) == 1)
      {
        unint64_t v16 = 0;
      }
      else
      {
        unint64_t v16 = (void *)sub_2496F94A0();
        (*(void (**)(char *, uint64_t))(v3 + 8))(v15, v2);
      }
      id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04BC8]), sel_initWithEndDate_, v16);

      (*(void (**)(char *, uint64_t))(v3 + 8))(v13, v2);
      return (unint64_t)v17;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))((char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v2);
  }
  sub_2496E44D4((uint64_t)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2696CB928);
  id v18 = v24;
  unint64_t result = (unint64_t)objc_msgSend(v24, sel_occurrenceCount);
  if ((result & 0x8000000000000000) == 0)
  {
    id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F04BC8]), sel_initWithOccurrenceCount_, result);

    return (unint64_t)v17;
  }
  __break(1u);
  return result;
}

unint64_t sub_2496E48D8(unint64_t result, Class *a2)
{
  if (result)
  {
    unint64_t v3 = result;
    if (result >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_2496F9CF0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v4 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    unint64_t result = MEMORY[0x263F8EE78];
    if (v4)
    {
      uint64_t v10 = MEMORY[0x263F8EE78];
      unint64_t result = sub_2496F9C80();
      if (v4 < 0)
      {
        __break(1u);
      }
      else
      {
        uint64_t v5 = 0;
        do
        {
          if ((v3 & 0xC000000000000001) != 0) {
            id v6 = (id)MEMORY[0x24C5A9840](v5, v3);
          }
          else {
            id v6 = *(id *)(v3 + 8 * v5 + 32);
          }
          uint64_t v7 = v6;
          uint64_t v8 = (char *)objc_msgSend(v6, sel_dayOfTheWeek);
          if ((unint64_t)(v8 - 1) >= 7) {
            uint64_t v9 = 7;
          }
          else {
            uint64_t v9 = (uint64_t)v8;
          }
          ++v5;
          objc_msgSend(objc_allocWithZone(*a2), sel_initWithDayOfTheWeek_weekNumber_, v9, objc_msgSend(v7, sel_weekNumber));

          sub_2496F9C60();
          sub_2496F9C90();
          sub_2496F9CA0();
          sub_2496F9C70();
        }
        while (v4 != v5);
        return v10;
      }
    }
  }
  return result;
}

uint64_t sub_2496E4A4C(void *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = sub_2496F94C0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  id v6 = a1;
  id v7 = objc_msgSend(v6, sel_endDate);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB928);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v7)
  {
    uint64_t v20 = (char *)&v19 - v5;
    MEMORY[0x270FA5388](v9);
    unint64_t v12 = (char *)&v19 - v5;
    sub_2496F94B0();

    id v13 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v13(v11, v12, v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v11, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v11, 1, v2) != 1)
    {
      uint64_t v14 = v20;
      v13(v20, v11, v2);
      id v15 = (void *)sub_2496F94A0();
      id v16 = objc_msgSend(self, sel_recurrenceEndWithEndDate_, v15);

      (*(void (**)(char *, uint64_t))(v3 + 8))(v14, v2);
      return (uint64_t)v16;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v11, 1, 1, v2);
  }
  sub_2496E44D4((uint64_t)v11, &qword_2696CB928);
  unint64_t v17 = (unint64_t)objc_msgSend(v6, sel_occurrenceCount);
  if ((v17 & 0x8000000000000000) == 0)
  {
    id v16 = objc_msgSend(self, sel_recurrenceEndWithOccurrenceCount_, v17);

    return (uint64_t)v16;
  }
  uint64_t result = sub_2496F9CE0();
  __break(1u);
  return result;
}

id _sSo17REMRecurrenceRuleC21CalendarUIKitInternalE7convert_7account8reminderABSgSo012EKRecurrenceB0C_So11REMObjectIDCAKtFZ_0(void *a1, void *a2, void *a3)
{
  id v6 = objc_msgSend(a1, sel_frequency);
  if ((unint64_t)v6 > 3) {
    return 0;
  }
  uint64_t v7 = (uint64_t)v6;
  id v32 = objc_msgSend(self, sel_newObjectID);
  id v31 = objc_msgSend(a1, sel_interval);
  id v30 = objc_msgSend(a1, sel_firstDayOfTheWeek);
  id v8 = objc_msgSend(a1, sel_daysOfTheWeek);
  if (v8)
  {
    uint64_t v9 = v8;
    sub_2496E5150(0, &qword_2696CB950);
    unint64_t v10 = sub_2496F99A0();
  }
  else
  {
    unint64_t v10 = 0;
  }
  unint64_t v29 = sub_2496E48D8(v10, (Class *)0x263F62EF0);
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(a1, sel_daysOfTheMonth);
  if (v12)
  {
    id v13 = v12;
    sub_2496E5150(0, &qword_2696CB938);
    uint64_t v14 = sub_2496F99A0();
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = objc_msgSend(a1, sel_monthsOfTheYear);
  if (v15)
  {
    id v16 = v15;
    sub_2496E5150(0, &qword_2696CB938);
    uint64_t v17 = sub_2496F99A0();
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v18 = objc_msgSend(a1, sel_weeksOfTheYear);
  if (v18)
  {
    uint64_t v19 = v18;
    sub_2496E5150(0, &qword_2696CB938);
    uint64_t v20 = sub_2496F99A0();
  }
  else
  {
    uint64_t v20 = 0;
  }
  id v21 = objc_msgSend(a1, sel_daysOfTheYear);
  if (v21)
  {
    id v22 = v21;
    sub_2496E5150(0, &qword_2696CB938);
    uint64_t v23 = sub_2496F99A0();
  }
  else
  {
    uint64_t v23 = 0;
  }
  id v24 = objc_msgSend(a1, sel_setPositions);
  if (v24)
  {
    uint64_t v25 = v24;
    sub_2496E5150(0, &qword_2696CB938);
    uint64_t v26 = sub_2496F99A0();
  }
  else
  {
    uint64_t v26 = 0;
  }
  id v27 = objc_msgSend(a1, sel_recurrenceEnd);
  unint64_t v28 = (void *)sub_2496E4A4C(v27);

  objc_allocWithZone(MEMORY[0x263F62F10]);
  return sub_2496E37BC(v32, a2, a3, v7, (uint64_t)v31, (uint64_t)v30, v29, v14, v17, v20, v23, v26, v28);
}

uint64_t dispatch thunk of EKEvent.ReminderConvertable.titleAsString.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of EKEvent.ReminderConvertable.notesAsString.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of EKEvent.ReminderConvertable.icsUrl.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of EKEvent.ReminderConvertable.effectiveDisplayDateComponents_forCalendar.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of EKEvent.ReminderConvertable.recurrenceRules.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of EKEvent.ReminderConvertable.cuiki_list.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of EKEvent.ReminderConvertable.objectID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_2496E5150(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2496E518C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2496F9530();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t EKEvent.recurrentReminderOccurrenceDate.getter@<X0>(uint64_t a1@<X8>)
{
  if ((objc_msgSend(v1, sel_hasRecurrenceRules) & 1) != 0
    || (id v3 = objc_msgSend(v1, sel_masterEvent), v3, v3))
  {
    id v4 = objc_msgSend(v1, sel_startDateComponents);
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB910);
    MEMORY[0x270FA5388](v5 - 8);
    uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v4)
    {
      sub_2496F93C0();

      uint64_t v8 = sub_2496F93F0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
    }
    else
    {
      uint64_t v9 = sub_2496F93F0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
    }
    return sub_2496E5398((uint64_t)v7, a1);
  }
  else
  {
    uint64_t v11 = sub_2496F93F0();
    id v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    return v12(a1, 1, 1, v11);
  }
}

uint64_t sub_2496E5398(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB910);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2496E5400(void *a1)
{
  uint64_t v2 = sub_2496F9380();
  MEMORY[0x270FA5388](v2);
  uint64_t v3 = sub_2496F98A0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB970);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496E56AC(a1, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) == 1)
  {
    sub_2496E44D4((uint64_t)v9, &qword_2696CB970);
    return 0;
  }
  else
  {
    uint64_t v11 = (*(uint64_t (**)(char *, char *, uint64_t))(v4 + 32))((char *)v13 - v6, v9, v3);
    MEMORY[0x270FA5388](v11);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v13 - v6, (char *)v13 - v6, v3);
    v13[1] = MEMORY[0x263F8EE78];
    sub_2496E59FC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB980);
    sub_2496E5A54();
    sub_2496F9B40();
    sub_2496F98B0();
    objc_allocWithZone((Class)sub_2496F9580());
    sub_2496E5AF8();
    uint64_t v10 = sub_2496F9570();
    (*(void (**)(char *, uint64_t))(v4 + 8))((char *)v13 - v6, v3);
  }
  return v10;
}

uint64_t sub_2496E56AC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v5 = objc_msgSend(a1, sel_uniqueID);
  if (v5)
  {
    unint64_t v6 = v5;
    v23[1] = v2;
    sub_2496F9950();

    uint64_t v7 = sub_2496F9460();
    uint64_t v8 = *(void *)(v7 - 8);
    MEMORY[0x270FA5388](v7);
    uint64_t v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBAF0);
    MEMORY[0x270FA5388](v11 - 8);
    uint64_t v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2496F9450();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1, v7) == 1)
    {
      sub_2496E44D4((uint64_t)v13, &qword_2696CBAF0);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v13, v7);
      uint64_t v14 = (void *)sub_2496F9430();
      id v15 = objc_msgSend(self, sel_objectIDWithURL_, v14);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      if (v15)
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB998);
        uint64_t v17 = *(void *)(*(void *)(v16 - 8) + 64);
        MEMORY[0x270FA5388](v16 - 8);
        unint64_t v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0;
        uint64_t v19 = sub_2496E5EFC(a1, (uint64_t)v23 - v18);
        MEMORY[0x270FA5388](v19);
        sub_2496E6290((uint64_t)v23 - v18, (uint64_t)v23 - v18);
        sub_2496F9880();
        sub_2496E44D4((uint64_t)v23 - v18, &qword_2696CB998);
        uint64_t v20 = sub_2496F98A0();
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(a2, 0, 1, v20);
      }
    }
  }
  uint64_t v22 = sub_2496F98A0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(a2, 1, 1, v22);
}

unint64_t sub_2496E59FC()
{
  unint64_t result = qword_2696CB978;
  if (!qword_2696CB978)
  {
    sub_2496F9380();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696CB978);
  }
  return result;
}

unint64_t sub_2496E5A54()
{
  unint64_t result = qword_2696CB988;
  if (!qword_2696CB988)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696CB980);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696CB988);
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

unint64_t sub_2496E5AF8()
{
  unint64_t result = qword_2696CB990;
  if (!qword_2696CB990)
  {
    sub_2496F98B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696CB990);
  }
  return result;
}

uint64_t sub_2496E5B94(void *a1)
{
  uint64_t v2 = sub_2496F98A0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB970);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496E56AC(a1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    sub_2496E44D4((uint64_t)v8, &qword_2696CB970);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    uint64_t v9 = sub_2496F9890();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v9;
}

uint64_t sub_2496E5EFC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2496F93F0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB910);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  EKEvent.recurrentReminderOccurrenceDate.getter((uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    sub_2496E44D4((uint64_t)v10, &qword_2696CB910);
    uint64_t v11 = sub_2496F98D0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(a2, 1, 1, v11);
  }
  else
  {
    uint64_t v13 = (*(uint64_t (**)(char *, char *, uint64_t))(v5 + 32))((char *)&v15 - v7, v10, v4);
    MEMORY[0x270FA5388](v13);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))((char *)&v15 - v7, (char *)&v15 - v7, v4);
    objc_msgSend(a1, sel_CUIK_reminderShouldBeEditable);
    sub_2496F98C0();
    (*(void (**)(char *, uint64_t))(v5 + 8))((char *)&v15 - v7, v4);
    uint64_t v14 = sub_2496F98D0();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a2, 0, 1, v14);
  }
}

id ReminderEntityAnnotation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id ReminderEntityAnnotation.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReminderEntityAnnotation();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ReminderEntityAnnotation()
{
  return self;
}

id ReminderEntityAnnotation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReminderEntityAnnotation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for ReminderEntityAnnotation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ReminderEntityAnnotation);
}

uint64_t dispatch thunk of static ReminderEntityAnnotation.annotation(withReminderIntegrationEvent:)()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static ReminderEntityAnnotation.entityIdentifier(forReminderIntegrationEvent:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_2496E6290(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB998);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id CUIKIReminderSyncTrigger.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id CUIKIReminderSyncTrigger.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CUIKIReminderSyncTrigger();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CUIKIReminderSyncTrigger.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CUIKIReminderSyncTrigger();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s21CalendarUIKitInternal24CUIKIReminderSyncTriggerC07triggerE03whyySo0dE6ReasonV_tFZ_0(unint64_t a1)
{
  uint64_t v2 = sub_2496F9900();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B160DA8 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_26B160E10);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  unint64_t v7 = sub_2496F98E0();
  os_log_type_t v8 = sub_2496F9AC0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v23 = v10;
    *(_DWORD *)uint64_t v9 = 136446210;
    if (a1 > 2)
    {
      uint64_t v11 = 0x6E776F6E6B6E55;
      unint64_t v12 = 0xE700000000000000;
    }
    else
    {
      uint64_t v11 = *(void *)&aAppLaunappActi[8 * a1];
      unint64_t v12 = *(void *)&aAppLaunappActi[8 * a1 + 24];
    }
    uint64_t v22 = sub_2496F6E70(v11, v12, &v23);
    sub_2496F9B10();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2496DE000, v7, v8, "Requesting a reminders sync with reason %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5A9F00](v10, -1, -1);
    MEMORY[0x24C5A9F00](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (a1 == 2)
  {
    uint64_t v13 = sub_2496F9650();
    uint64_t v14 = *(void *)(v13 - 8);
    MEMORY[0x270FA5388](v13);
    uint64_t v16 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = (unsigned int *)MEMORY[0x263F633F8];
  }
  else if (a1 == 1)
  {
    uint64_t v13 = sub_2496F9650();
    uint64_t v14 = *(void *)(v13 - 8);
    MEMORY[0x270FA5388](v13);
    uint64_t v16 = (char *)&v22 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = (unsigned int *)MEMORY[0x263F633F0];
  }
  else if (a1)
  {
    uint64_t v13 = sub_2496F9650();
    uint64_t v14 = *(void *)(v13 - 8);
    MEMORY[0x270FA5388](v13);
    uint64_t v16 = (char *)&v22 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(void *)uint64_t v16 = 0x6E776F6E6B6E75;
    *((void *)v16 + 1) = 0xE700000000000000;
    uint64_t v17 = (unsigned int *)MEMORY[0x263F63400];
  }
  else
  {
    uint64_t v13 = sub_2496F9650();
    uint64_t v14 = *(void *)(v13 - 8);
    MEMORY[0x270FA5388](v13);
    uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = (unsigned int *)MEMORY[0x263F633E8];
  }
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, *v17, v13);
  sub_2496F95D0();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t type metadata accessor for CUIKIReminderSyncTrigger()
{
  return self;
}

uint64_t sub_2496E68E8(uint64_t a1)
{
  uint64_t v2 = sub_2496F9750();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - v4;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - v4, a1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (!MEMORY[0x263F63438] || v6 != *MEMORY[0x263F63438])
  {
    if (MEMORY[0x263F63430] && v6 == *MEMORY[0x263F63430]) {
      return 1;
    }
    if (MEMORY[0x263F63428] && v6 == *MEMORY[0x263F63428]) {
      return 2;
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return 0;
}

uint64_t sub_2496E6A38()
{
  uint64_t result = sub_2496F9940();
  qword_2696CB9A0 = result;
  return result;
}

id static NSNotificationName.reminderEventDeleted.getter()
{
  return sub_2496E6AF0(&qword_2696CB840, (void **)&qword_2696CB9A0);
}

uint64_t sub_2496E6A94()
{
  uint64_t result = sub_2496F9940();
  qword_2696CB9A8 = result;
  return result;
}

id static NSNotificationName.reminderEventCompleted.getter()
{
  return sub_2496E6AF0(&qword_2696CB848, (void **)&qword_2696CB9A8);
}

id sub_2496E6AF0(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  return v3;
}

id CUIKIReminderEditorImplementation.__allocating_init(eventStore:alertDisplayer:undoManager:changeTracker:)(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = objc_allocWithZone(v4);
  id v10 = sub_2496F1944(a1, a2, (uint64_t)a3, a4);

  swift_unknownObjectRelease();
  return v10;
}

id CUIKIReminderEditorImplementation.init(eventStore:alertDisplayer:undoManager:changeTracker:)(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = sub_2496F1944(a1, a2, (uint64_t)a3, a4);

  swift_unknownObjectRelease();
  return v7;
}

uint64_t sub_2496E6CFC()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_2496E6DE4(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_alertDisplayer);
  swift_beginAccess();
  *uint64_t v3 = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)(v1 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation__requestPerformer) = 0;
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t sub_2496E6E6C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_alertDisplayer);
  swift_beginAccess();
  *uint64_t v4 = v2;
  swift_unknownObjectRetain_n();
  swift_unknownObjectRelease();
  *(void *)(v3 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation__requestPerformer) = 0;
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t (*sub_2496E6EFC(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_2496E6F5C;
}

uint64_t sub_2496E6F5C(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0)
  {
    *(void *)(*(void *)(a1 + 24)
              + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation__requestPerformer) = 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_2496E6FB8()
{
  uint64_t v1 = OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation__requestPerformer;
  if (*(void *)(v0 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation__requestPerformer))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation__requestPerformer);
  }
  else
  {
    uint64_t v3 = v0;
    uint64_t v4 = sub_2496F9740();
    uint64_t v5 = *(void *)(v4 - 8);
    uint64_t v6 = *(void *)(v5 + 64);
    MEMORY[0x270FA5388](v4);
    unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
    sub_2496F9730();
    uint64_t v8 = (uint64_t *)(v0 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_alertDisplayer);
    swift_beginAccess();
    uint64_t v9 = *v8;
    uint64_t v14 = &type metadata for CUIKIReminderEditorImplementation.AlertDisplayerAdapter;
    unint64_t v15 = sub_2496F2368();
    uint64_t v13 = v9;
    swift_unknownObjectRetain();
    uint64_t v10 = sub_2496F9720();
    MEMORY[0x270FA5388](v10);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16))(&v12[-v7], &v12[-v7], v4);
    sub_2496F9620();
    swift_allocObject();
    uint64_t v2 = sub_2496F95E0();
    *(void *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(&v12[-v7], v4);
  }
  swift_retain();
  return v2;
}

uint64_t sub_2496E7194(unint64_t a1)
{
  v129[8] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB9C0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v112 = (char *)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = v1;
  unint64_t v7 = swift_bridgeObjectRetain();
  unint64_t v97 = sub_2496F2010(v7);

  swift_bridgeObjectRelease();
  uint64_t v8 = (char *)v6;
  unint64_t v9 = swift_bridgeObjectRetain();
  unint64_t v96 = sub_2496F21BC(v9);
  uint64_t v101 = v2;

  swift_bridgeObjectRelease();
  v129[0] = (id)MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
LABEL_56:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2496F9CF0();
  }
  else
  {
    uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v113 = v8;
  if (v10)
  {
    if (v10 < 1)
    {
      __break(1u);
LABEL_60:
      __break(1u);
    }
    for (uint64_t i = 0; i != v10; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v12 = (id)MEMORY[0x24C5A9840](i, a1);
      }
      else {
        id v12 = *(id *)(a1 + 8 * i + 32);
      }
      uint64_t v13 = v12;
      sub_2496F9950();
      uint64_t v14 = (void *)sub_2496F9940();
      swift_bridgeObjectRelease();
      unsigned int v15 = objc_msgSend(v13, sel__hasChangesForKey_, v14);

      if (v15)
      {
        sub_2496F9C60();
        sub_2496F9C90();
        sub_2496F9CA0();
        sub_2496F9C70();
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v16 = (unint64_t)v129[0];
    if (((unint64_t)v129[0] & 0x8000000000000000) != 0)
    {
LABEL_57:
      swift_bridgeObjectRetain();
      uint64_t v8 = (char *)sub_2496F9CF0();
      swift_release();
      if (!v8) {
        goto LABEL_58;
      }
      goto LABEL_18;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v16 = MEMORY[0x263F8EE78];
    if ((MEMORY[0x263F8EE78] & 0x8000000000000000) != 0) {
      goto LABEL_57;
    }
  }
  if ((v16 & 0x4000000000000000) != 0) {
    goto LABEL_57;
  }
  uint64_t v8 = *(char **)(v16 + 16);
  if (v8)
  {
LABEL_18:
    uint64_t v104 = OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_eventStore;
    uint64_t v100 = OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_changeTracker;
    uint64_t v103 = OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation__requestPerformer;
    unint64_t v119 = v16 & 0xC000000000000001;
    uint64_t v98 = (void **)&v113[OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_alertDisplayer];
    swift_beginAccess();
    uint64_t v17 = 4;
    *((void *)&v18 + 1) = 3;
    long long v99 = xmmword_2496FA8E0;
    uint64_t v102 = MEMORY[0x263F8EE60] + 8;
    *(void *)&long long v18 = 138412290;
    long long v95 = v18;
    unint64_t v115 = v16;
    v116 = v8;
    do
    {
      a1 = v17 - 4;
      if (v119) {
        id v19 = (id)MEMORY[0x24C5A9840](v17 - 4, v16);
      }
      else {
        id v19 = *(id *)(v16 + 8 * v17);
      }
      uint64_t v20 = v19;
      id v21 = (char *)(v17 - 3);
      if (__OFADD__(a1, 1))
      {
        __break(1u);
        goto LABEL_56;
      }
      id v22 = sub_2496F1A5C(v19);
      if (v22)
      {
        uint64_t v121 = v17;
        id v122 = v22;
        uint64_t v124 = v17 - 3;
        uint64_t v23 = sub_2496F93F0();
        uint64_t v123 = &v95;
        uint64_t v24 = *(void *)(v23 - 8);
        uint64_t v25 = v20;
        uint64_t v26 = *(void *)(v24 + 64);
        id v27 = (void *)MEMORY[0x270FA5388](v25);
        unint64_t v28 = (v26 + 15) & 0xFFFFFFFFFFFFFFF0;
        v120 = (char *)&v95 - v28;
        unint64_t v29 = v27;
        id v30 = objc_msgSend(v27, sel_startDateComponents);
        uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB910);
        uint64_t v32 = MEMORY[0x270FA5388](v31 - 8);
        uint64_t v34 = (char *)&v95 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
        if (!v30)
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v34, 1, 1, v23);
LABEL_32:
          sub_2496E44D4((uint64_t)v34, &qword_2696CB910);
          if (qword_26B160DA8 != -1) {
            swift_once();
          }
          uint64_t v49 = sub_2496F9900();
          __swift_project_value_buffer(v49, (uint64_t)qword_26B160E10);
          uint64_t v50 = sub_2496F98E0();
          os_log_type_t v51 = sub_2496F9AB0();
          if (os_log_type_enabled(v50, v51))
          {
            uint64_t v52 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v52 = 0;
            _os_log_impl(&dword_2496DE000, v50, v51, "Not saving changes to reminder without a date", v52, 2u);
            MEMORY[0x24C5A9F00](v52, -1, -1);
          }
          else
          {
          }
          uint64_t v8 = v116;
          id v21 = (char *)v124;
          uint64_t v17 = v121;
          goto LABEL_20;
        }
        uint64_t v114 = v26;
        MEMORY[0x270FA5388](v32);
        sub_2496F93C0();

        v35 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
        v35(v34, (char *)&v95 - v28, v23);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v34, 0, 1, v23);
        unint64_t v16 = v115;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v34, 1, v23) == 1) {
          goto LABEL_32;
        }
        uint64_t v117 = v24;
        uint64_t v118 = v23;
        uint64_t v111 = v24 + 32;
        v110 = v35;
        v35(v120, v34, v23);
        uint64_t v36 = v29;
        int v37 = objc_msgSend(v29, sel_sequenceNumber);
        id v38 = v113;
        unint64_t v39 = *(void **)&v113[v104];
        uint64_t v40 = sub_2496F9AE0();
        v129[0] = 0;
        if (objc_msgSend(v39, sel_saveEvent_span_commit_error_, v36, v40, 0, v129))
        {
          uint64_t v41 = *(void *)&v38[v100];
          id v42 = v129[0];
          sub_2496F4370(v36, v37, 1, v41);
          id v43 = objc_msgSend(v36, sel_objectID);
          uint64_t v44 = v114;
          if (!v43) {
            goto LABEL_60;
          }
          uint64_t v45 = v43;
          __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA10);
          uint64_t v46 = swift_allocObject();
          *(_OWORD *)(v46 + 16) = v99;
          *(void *)(v46 + 32) = v45;
          v129[0] = (id)v46;
          sub_2496F99B0();
          id v47 = v129[0];
          id v48 = v45;
          sub_2496F5BF8((uint64_t)v47);
          swift_bridgeObjectRelease();
        }
        else
        {
          id v53 = v129[0];
          uint64_t v54 = (void *)sub_2496F9410();

          swift_willThrow();
          uint64_t v44 = v114;
          if (qword_26B160DA8 != -1) {
            swift_once();
          }
          uint64_t v101 = 0;
          uint64_t v55 = sub_2496F9900();
          __swift_project_value_buffer(v55, (uint64_t)qword_26B160E10);
          id v56 = v54;
          id v57 = v54;
          uint64_t v58 = sub_2496F98E0();
          os_log_type_t v59 = sub_2496F9AB0();
          if (os_log_type_enabled(v58, v59))
          {
            uint64_t v60 = swift_slowAlloc();
            uint64_t v61 = (void *)swift_slowAlloc();
            *(_DWORD *)uint64_t v60 = v95;
            id v62 = v54;
            uint64_t v63 = _swift_stdlib_bridgeErrorToNSError();
            *(void *)(v60 + 4) = v63;
            void *v61 = v63;

            _os_log_impl(&dword_2496DE000, v58, v59, "Error saving integration event: %@", (uint8_t *)v60, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA08);
            swift_arrayDestroy();
            MEMORY[0x24C5A9F00](v61, -1, -1);
            MEMORY[0x24C5A9F00](v60, -1, -1);
          }
          else
          {
          }
        }
        uint64_t v64 = v103;
        LODWORD(v114) = v37;
        uint64_t v65 = v113;
        uint64_t v66 = v117;
        if (*(void *)&v113[v103])
        {
          v67 = v113;
          uint64_t v68 = *(void *)&v113[v103];
        }
        else
        {
          uint64_t v108 = sub_2496F9740();
          uint64_t v109 = (uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))&v95;
          uint64_t v69 = *(void *)(v108 - 8);
          uint64_t v70 = *(void *)(v69 + 64);
          MEMORY[0x270FA5388](v108);
          id v71 = (char *)&v95 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
          sub_2496F9730();
          uint64_t v72 = *v98;
          v129[3] = &type metadata for CUIKIReminderEditorImplementation.AlertDisplayerAdapter;
          v129[4] = (id)sub_2496F2368();
          v129[0] = v72;
          swift_unknownObjectRetain();
          uint64_t v73 = sub_2496F9720();
          uint64_t v107 = &v95;
          uint64_t v66 = v117;
          MEMORY[0x270FA5388](v73);
          uint64_t v74 = v108;
          (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v71, v71, v108);
          sub_2496F9620();
          swift_allocObject();
          uint64_t v75 = sub_2496F95E0();
          *(void *)&v65[v64] = v75;
          v67 = v65;
          uint64_t v68 = v75;
          swift_retain();
          swift_release();
          (*(void (**)(char *, uint64_t))(v69 + 8))(v71, v74);
        }
        uint64_t v108 = sub_2496F9A80();
        uint64_t v109 = *(uint64_t (***)(char *, uint64_t, uint64_t, uint64_t))(v108 - 8);
        uint64_t v76 = v109[7](v112, 1, 1, v108);
        uint64_t v107 = &v95;
        MEMORY[0x270FA5388](v76);
        v77 = (char *)&v95 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v77, v120, v118);
        sub_2496F9A60();
        id v106 = v67;
        swift_retain();
        id v78 = v122;
        swift_retain();
        id v105 = v36;
        uint64_t v79 = sub_2496F9A50();
        unint64_t v80 = (*(unsigned __int8 *)(v66 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80);
        unint64_t v81 = (v44 + v80 + 7) & 0xFFFFFFFFFFFFFFF8;
        unint64_t v82 = (v81 + 15) & 0xFFFFFFFFFFFFFFF8;
        unint64_t v83 = (v82 + 11) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v84 = (char *)swift_allocObject();
        *((void *)v84 + 2) = v79;
        uint64_t v85 = (uint64_t)v112;
        id v86 = v106;
        *((void *)v84 + 3) = MEMORY[0x263F8F500];
        *((void *)v84 + 4) = v86;
        id v122 = v78;
        *((void *)v84 + 5) = v78;
        v110(&v84[v80], v77, v118);
        *(void *)&v84[v81] = v68;
        v87 = v105;
        *(void *)&v84[v82] = v105;
        v88 = v109;
        *(_DWORD *)&v84[v83] = v114;
        uint64_t v89 = v108;
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v88[6])(v85, 1, v108) == 1)
        {
          sub_2496E44D4(v85, &qword_2696CB9C0);
        }
        else
        {
          sub_2496F9A70();
          ((void (*)(uint64_t, uint64_t))v88[1])(v85, v89);
        }
        if (*((void *)v84 + 2))
        {
          swift_getObjectType();
          swift_unknownObjectRetain();
          uint64_t v90 = sub_2496F9A10();
          uint64_t v92 = v91;
          swift_unknownObjectRelease();
        }
        else
        {
          uint64_t v90 = 0;
          uint64_t v92 = 0;
        }
        unint64_t v16 = v115;
        id v21 = (char *)v124;
        uint64_t v93 = swift_allocObject();
        *(void *)(v93 + 16) = &unk_2696CB9F0;
        *(void *)(v93 + 24) = v84;
        if (v92 | v90)
        {
          uint64_t v125 = 0;
          uint64_t v126 = 0;
          uint64_t v127 = v90;
          uint64_t v128 = v92;
        }
        uint64_t v17 = v121;
        swift_task_create();
        swift_release();

        swift_release();
        (*(void (**)(char *, uint64_t))(v117 + 8))(v120, v118);
        uint64_t v8 = v116;
      }
      else
      {
      }
LABEL_20:
      ++v17;
    }
    while (v21 != v8);
  }
LABEL_58:
  swift_release();
  sub_2496E8668(v97, 1);
  swift_bridgeObjectRelease();
  sub_2496E8668(v96, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2496E8030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_DWORD *)(v8 + 64) = v16;
  *(void *)(v8 + 16) = a4;
  *(void *)(v8 + 24) = a8;
  *(void *)(v8 + 32) = sub_2496F9A60();
  *(void *)(v8 + 40) = sub_2496F9A50();
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v8 + 48) = v13;
  void *v13 = v8;
  v13[1] = sub_2496E8124;
  v13[9] = a7;
  v13[10] = a4;
  v13[7] = a5;
  v13[8] = a6;
  return MEMORY[0x270FA2498](sub_2496ED004, 0, 0);
}

uint64_t sub_2496E8124(uint64_t a1)
{
  *(void *)(*(void *)v2 + 56) = a1;
  swift_task_dealloc();
  if (v1)
  {

    uint64_t v3 = sub_2496F9A10();
    uint64_t v5 = v4;
    id v6 = sub_2496E838C;
  }
  else
  {
    uint64_t v3 = sub_2496F9A10();
    uint64_t v5 = v7;
    id v6 = sub_2496E82B0;
  }
  return MEMORY[0x270FA2498](v6, v3, v5);
}

uint64_t sub_2496E82B0()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_release();
  if (v1)
  {
    uint64_t v2 = *(void **)(v0 + 56);
    int v3 = *(_DWORD *)(v0 + 64);
    uint64_t v4 = *(void *)(*(void *)(v0 + 16)
                   + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_changeTracker);
    id v5 = *(id *)(v0 + 24);
    id v6 = v2;
    sub_2496F81F8(v5, v3, 1, v4, v5, v6);
  }
  else
  {
    sub_2496F3D94(*(void **)(v0 + 24), 1);
  }
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_2496E838C()
{
  swift_release();
  sub_2496F3D94(*(void **)(v0 + 24), 1);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2496E8404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2496F9A80();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2496F9A70();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2496E44D4(a1, &qword_2696CB9C0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2496F9A10();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2496E8668(unint64_t a1, int a2)
{
  uint64_t v3 = v2;
  LODWORD(v2) = a2;
  v57[15] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB9C0);
  uint64_t result = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_22;
  }
  for (i = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10); i; uint64_t result = swift_bridgeObjectRelease())
  {
    uint64_t v46 = v8;
    int v47 = (int)v2;
    id v55 = self;
    uint64_t v51 = OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_changeTracker;
    id v54 = *(id *)&v3[OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_eventStore];
    unint64_t v56 = a1 & 0xC000000000000001;
    swift_bridgeObjectRetain();
    uint64_t v10 = 4;
    long long v53 = xmmword_2496FA7A0;
    uint64_t v52 = MEMORY[0x263F8EE58] + 8;
    *((void *)&v11 + 1) = 3;
    long long v50 = xmmword_2496FA8E0;
    *(void *)&long long v11 = 138412290;
    long long v48 = v11;
    uint64_t v49 = i;
    while (1)
    {
      uint64_t v13 = v56 ? (char *)MEMORY[0x24C5A9840](v10 - 4, a1) : (char *)*(id *)(a1 + 8 * v10);
      uint64_t v2 = v13;
      uint64_t v14 = v10 - 3;
      if (__OFADD__(v10 - 4, 1)) {
        break;
      }
      id v15 = objc_msgSend(v55, sel_defaultCenter);
      if (qword_2696CB848 != -1) {
        swift_once();
      }
      uint64_t v16 = qword_2696CB9A8;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBAC0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v53;
      v57[0] = (id)0x746E657665;
      v57[1] = (id)0xE500000000000000;
      sub_2496F9BD0();
      *(void *)(inited + 96) = sub_2496E5150(0, &qword_2696CBAB0);
      *(void *)(inited + 72) = v2;
      id v12 = v2;
      sub_2496E8CEC(inited);
      long long v18 = (void *)sub_2496F9910();
      swift_bridgeObjectRelease();
      objc_msgSend(v15, sel_postNotificationName_object_userInfo_, v16, 0, v18);

      v57[0] = 0;
      if (objc_msgSend(v54, sel_saveEvent_span_commit_error_, v12, 0, 0, v57))
      {
        uint64_t v19 = *(void *)&v3[v51];
        id v20 = v57[0];
        sub_2496F4370(v12, (int)[v12 sequenceNumber], 1, v19);
        id v21 = [v12 objectID];
        if (!v21) {
          __break(1u);
        }
        id v22 = v21;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA10);
        uint64_t v23 = swift_allocObject();
        *(_OWORD *)(v23 + 16) = v50;
        *(void *)(v23 + 32) = v22;
        v57[0] = (id)v23;
        sub_2496F99B0();
        id v24 = v57[0];
        uint64_t v8 = v22;
        sub_2496F5BF8((uint64_t)v24);
        swift_bridgeObjectRelease();
      }
      else
      {
        id v25 = v57[0];
        uint64_t v26 = (void *)sub_2496F9410();

        swift_willThrow();
        if (qword_26B160DA8 != -1) {
          swift_once();
        }
        uint64_t v27 = sub_2496F9900();
        __swift_project_value_buffer(v27, (uint64_t)qword_26B160E10);
        id v28 = v26;
        id v29 = v26;
        id v30 = sub_2496F98E0();
        os_log_type_t v31 = sub_2496F9AB0();
        uint64_t v8 = (char *)v31;
        if (os_log_type_enabled(v30, v31))
        {
          uint64_t v32 = swift_slowAlloc();
          uint64_t v33 = v3;
          unint64_t v34 = a1;
          v35 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v32 = v48;
          id v36 = v26;
          uint64_t v37 = _swift_stdlib_bridgeErrorToNSError();
          *(void *)(v32 + 4) = v37;
          void *v35 = v37;

          _os_log_impl(&dword_2496DE000, v30, (os_log_type_t)v8, "Error saving integration event: %@", (uint8_t *)v32, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA08);
          swift_arrayDestroy();
          id v38 = v35;
          a1 = v34;
          uint64_t v3 = v33;
          uint64_t i = v49;
          MEMORY[0x24C5A9F00](v38, -1, -1);
          MEMORY[0x24C5A9F00](v32, -1, -1);
        }
        else
        {

          id v12 = v30;
        }
      }

      ++v10;
      if (v14 == i)
      {
        swift_bridgeObjectRelease();
        uint64_t v39 = sub_2496E6FB8();
        uint64_t v40 = sub_2496F9A80();
        uint64_t v41 = (uint64_t)v46;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v46, 1, 1, v40);
        sub_2496F9A60();
        swift_bridgeObjectRetain();
        id v42 = v3;
        swift_retain();
        uint64_t v43 = sub_2496F9A50();
        uint64_t v44 = swift_allocObject();
        uint64_t v45 = MEMORY[0x263F8F500];
        *(void *)(v44 + 16) = v43;
        *(void *)(v44 + 24) = v45;
        *(void *)(v44 + 32) = a1;
        *(void *)(v44 + 40) = v42;
        *(unsigned char *)(v44 + 48) = v47 & 1;
        *(void *)(v44 + 56) = v39;
        sub_2496EAFD0(v41, (uint64_t)&unk_2696CBAE0, v44);
        swift_release();
        return swift_release();
      }
    }
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain();
    uint64_t i = sub_2496F9CF0();
  }
  return result;
}

unint64_t sub_2496E8CEC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBAC8);
  uint64_t v2 = sub_2496F9D30();
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
    sub_2496F3244(v6, (uint64_t)v15, &qword_2696CBAD0);
    unint64_t result = sub_2496EECB8((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_2496F32A8(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_2496E8E30(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBAB8);
  uint64_t v2 = (void *)sub_2496F9D30();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_2496EECFC((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
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

unint64_t sub_2496E8F3C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA78);
  uint64_t v2 = (void *)sub_2496F9D30();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void *)(a1 + 80);
  while (1)
  {
    uint64_t v5 = *(v4 - 6);
    uint64_t v6 = *(v4 - 5);
    long long v20 = *((_OWORD *)v4 - 2);
    int v7 = *((_DWORD *)v4 - 4);
    char v8 = (void *)*(v4 - 1);
    uint64_t v9 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v10 = (id)v20;
    id v11 = *((id *)&v20 + 1);
    id v12 = v8;
    unint64_t result = sub_2496EEC40(v5, v6);
    if (v14) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v15 = (uint64_t *)(v2[6] + 16 * result);
    *id v15 = v5;
    v15[1] = v6;
    uint64_t v16 = v2[7] + 40 * result;
    *(_OWORD *)uint64_t v16 = v20;
    *(_DWORD *)(v16 + 16) = v7;
    *(void *)(v16 + 24) = v8;
    *(void *)(v16 + 32) = v9;
    uint64_t v17 = v2[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_11;
    }
    v4 += 7;
    v2[2] = v19;
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

uint64_t sub_2496E90A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  *(void *)(v7 + 240) = a5;
  *(void *)(v7 + 248) = a7;
  *(unsigned char *)(v7 + 416) = a6;
  *(void *)(v7 + 232) = a4;
  sub_2496F9A60();
  *(void *)(v7 + 256) = sub_2496F9A50();
  uint64_t v8 = sub_2496F9A10();
  *(void *)(v7 + 264) = v8;
  *(void *)(v7 + 272) = v9;
  return MEMORY[0x270FA2498](sub_2496E9178, v8, v9);
}

uint64_t sub_2496E9178()
{
  unint64_t v1 = v0[29];
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v0[35] = v2;
    if (v2) {
      goto LABEL_3;
    }
LABEL_24:
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v34 = v0[1];
    __asm { BRAA            X1, X16 }
  }
  swift_bridgeObjectRetain();
  uint64_t v33 = sub_2496F9CF0();
  v0[35] = v33;
  if (!v33) {
    goto LABEL_24;
  }
LABEL_3:
  uint64_t v3 = v0[29];
  uint64_t v4 = OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_changeTracker;
  v0[36] = OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_eventStore;
  v0[37] = v4;
  v0[38] = OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_undoManager;
  if ((v3 & 0xC000000000000001) != 0) {
    id v5 = (id)MEMORY[0x24C5A9840](0);
  }
  else {
    id v5 = *(id *)(v3 + 32);
  }
  uint64_t v6 = v5;
  v0[39] = v5;
  v0[40] = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA90);
  uint64_t v7 = sub_2496F9640();
  uint64_t v8 = *(void *)(v7 - 8);
  unint64_t v9 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v39 = *(void *)(v8 + 72);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2496FA7A0;
  id v11 = sub_2496F1A5C(v6);
  if (v11)
  {
    unint64_t v38 = v10 + v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB910);
    uint64_t v14 = swift_task_alloc();
    uint64_t v37 = v0;
    if ((objc_msgSend(v6, sel_hasRecurrenceRules) & 1) != 0
      || (id v15 = objc_msgSend(v6, sel_masterEvent), v15, v15))
    {
      id v16 = objc_msgSend(v6, sel_startDateComponents);
      uint64_t v17 = swift_task_alloc();
      if (v16)
      {
        sub_2496F93C0();

        uint64_t v18 = sub_2496F93F0();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 0, 1, v18);
      }
      else
      {
        uint64_t v19 = sub_2496F93F0();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, 1, 1, v19);
      }
      sub_2496E5398(v17, v14);
      swift_task_dealloc();
    }
    else
    {
      uint64_t v32 = sub_2496F93F0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v14, 1, 1, v32);
    }
    sub_2496F9630();
    swift_task_dealloc();
    sub_2496F31B8(&qword_2696CBA98);
    uint64_t v20 = sub_2496F9A90();
    uint64_t v21 = swift_task_alloc();
    uint64_t v40 = *(void (**)(uint64_t, unint64_t, uint64_t))(v8 + 16);
    v40(v21, v38, v7);
    swift_bridgeObjectRetain();
    uint64_t v41 = v21;
    uint64_t v22 = sub_2496F9920();
    uint64_t v23 = -1 << *(unsigned char *)(v20 + 32);
    unint64_t v24 = v22 & ~v23;
    uint64_t v36 = v8;
    if ((*(void *)(v20 + 56 + ((v24 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v24))
    {
      uint64_t v25 = ~v23;
      uint64_t v26 = (void (**)(uint64_t, uint64_t))(v8 + 8);
      while (1)
      {
        uint64_t v27 = swift_task_alloc();
        v40(v27, *(void *)(v20 + 48) + v24 * v39, v7);
        sub_2496F31B8(&qword_2696CBAA0);
        char v28 = sub_2496F9930();
        id v29 = *v26;
        (*v26)(v27, v7);
        swift_task_dealloc();
        if (v28) {
          break;
        }
        unint64_t v24 = (v24 + 1) & v25;
        if (((*(void *)(v20 + 56 + ((v24 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v24) & 1) == 0) {
          goto LABEL_17;
        }
      }
      swift_bridgeObjectRelease();
      v29(v41, v7);
    }
    else
    {
LABEL_17:
      swift_bridgeObjectRelease();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v31 = swift_task_alloc();
      v40(v31, v41, v7);
      sub_2496F0034(v31, v24, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v41, v7);
    }
    v37[41] = v20;
    swift_task_dealloc();
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    id v11 = sub_2496E97A8;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](v11, v12, v13);
}

uint64_t sub_2496E97A8()
{
  uint64_t v1 = v0[30] + v0[38];
  uint64_t v2 = sub_2496F9710();
  v0[42] = v2;
  v0[43] = *(void *)(v2 - 8);
  uint64_t v3 = swift_task_alloc();
  v0[44] = v3;
  swift_bridgeObjectRetain();
  sub_2496F9700();
  MEMORY[0x24C5A9FB0](v1);
  sub_2496F96F0();
  uint64_t v4 = sub_2496F96E0();
  v0[45] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v0[46] = v5;
  v0[47] = *(void *)(v5 + 64);
  uint64_t v6 = swift_task_alloc();
  v0[48] = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[49] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_2496E9984;
  return MEMORY[0x270F5A178](v6, v3);
}

uint64_t sub_2496E9984()
{
  *(void *)(*(void *)v1 + 400) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2496E9DC4;
  }
  else {
    uint64_t v2 = sub_2496E9AC4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2496E9AC4()
{
  uint64_t v1 = v0[48];
  uint64_t v2 = v0[45];
  uint64_t v3 = v0[46];
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v1, v2);
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v4, v2);
  if (MEMORY[0x263F63418] && v5 == *MEMORY[0x263F63418])
  {
    uint64_t v6 = v0[48];
    uint64_t v8 = v0[45];
    uint64_t v7 = v0[46];
    uint64_t v9 = v0[43];
    uint64_t v25 = v0[42];
    uint64_t v26 = v0[44];
    (*(void (**)(uint64_t, uint64_t))(v7 + 96))(v4, v8);
    uint64_t v10 = sub_2496F96D0();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = swift_task_alloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v12, v4, v10);
    uint64_t v13 = sub_2496F96C0();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v10);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v26, v25);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
  }
  else
  {
    if (MEMORY[0x263F63420] && v5 == *MEMORY[0x263F63420])
    {
      uint64_t v15 = v0[43];
      uint64_t v14 = v0[44];
      uint64_t v16 = v0[42];
      (*(void (**)(void, void))(v0[46] + 8))(v0[48], v0[45]);
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    }
    else
    {
      uint64_t v17 = v0[45];
      uint64_t v19 = v0[43];
      uint64_t v18 = v0[44];
      uint64_t v20 = v0[42];
      uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v0[46] + 8);
      v21(v0[48], v17);
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
      v21(v4, v17);
    }
    swift_bridgeObjectRelease();
    uint64_t v13 = MEMORY[0x263F8EE78];
  }
  v0[51] = v13;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = v0[33];
  uint64_t v23 = v0[34];
  return MEMORY[0x270FA2498](sub_2496EA4A8, v22, v23);
}

uint64_t sub_2496E9DC4()
{
  uint64_t v1 = (void *)v0[50];
  (*(void (**)(void, void))(v0[43] + 8))(v0[44], v0[42]);

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = v0[33];
  uint64_t v3 = v0[34];
  return MEMORY[0x270FA2498](sub_2496E9EA0, v2, v3);
}

uint64_t sub_2496E9EA0()
{
  uint64_t v1 = (void *)v0[39];
  sub_2496F3D94(v1, 1);

  uint64_t v2 = v0[40];
  if (v2 == v0[35])
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v3 = v0[1];
    __asm { BRAA            X1, X16 }
  }
  uint64_t v4 = v0[29];
  if ((v4 & 0xC000000000000001) != 0) {
    id v5 = (id)MEMORY[0x24C5A9840](v0[40]);
  }
  else {
    id v5 = *(id *)(v4 + 8 * v2 + 32);
  }
  uint64_t v6 = v5;
  v0[39] = v5;
  v0[40] = v2 + 1;
  if (__OFADD__(v2, 1)) {
    __break(1u);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA90);
  uint64_t v7 = sub_2496F9640();
  uint64_t v8 = *(void *)(v7 - 8);
  unint64_t v9 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v38 = *(void *)(v8 + 72);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2496FA7A0;
  uint64_t v11 = (uint64_t (*)())sub_2496F1A5C(v6);
  if (v11)
  {
    unint64_t v37 = v10 + v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB910);
    uint64_t v14 = swift_task_alloc();
    uint64_t v36 = v0;
    if ((objc_msgSend(v6, sel_hasRecurrenceRules) & 1) != 0
      || (id v15 = objc_msgSend(v6, sel_masterEvent), v15, v15))
    {
      id v16 = objc_msgSend(v6, sel_startDateComponents);
      uint64_t v17 = swift_task_alloc();
      if (v16)
      {
        sub_2496F93C0();

        uint64_t v18 = sub_2496F93F0();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 0, 1, v18);
      }
      else
      {
        uint64_t v19 = sub_2496F93F0();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, 1, 1, v19);
      }
      sub_2496E5398(v17, v14);
      swift_task_dealloc();
    }
    else
    {
      uint64_t v33 = sub_2496F93F0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v14, 1, 1, v33);
    }
    sub_2496F9630();
    swift_task_dealloc();
    sub_2496F31B8(&qword_2696CBA98);
    uint64_t v20 = sub_2496F9A90();
    uint64_t v21 = swift_task_alloc();
    uint64_t v39 = *(void (**)(uint64_t, unint64_t, uint64_t))(v8 + 16);
    v39(v21, v37, v7);
    swift_bridgeObjectRetain();
    uint64_t v40 = v21;
    uint64_t v22 = sub_2496F9920();
    uint64_t v23 = -1 << *(unsigned char *)(v20 + 32);
    unint64_t v24 = v22 & ~v23;
    uint64_t v35 = v8;
    if ((*(void *)(v20 + 56 + ((v24 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v24))
    {
      uint64_t v25 = v8;
      uint64_t v26 = ~v23;
      uint64_t v27 = (void (**)(uint64_t, uint64_t))(v25 + 8);
      while (1)
      {
        uint64_t v28 = swift_task_alloc();
        v39(v28, *(void *)(v20 + 48) + v24 * v38, v7);
        sub_2496F31B8(&qword_2696CBAA0);
        char v29 = sub_2496F9930();
        id v30 = *v27;
        (*v27)(v28, v7);
        swift_task_dealloc();
        if (v29) {
          break;
        }
        unint64_t v24 = (v24 + 1) & v26;
        if (((*(void *)(v20 + 56 + ((v24 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v24) & 1) == 0) {
          goto LABEL_20;
        }
      }
      swift_bridgeObjectRelease();
      v30(v40, v7);
    }
    else
    {
LABEL_20:
      swift_bridgeObjectRelease();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v32 = swift_task_alloc();
      v39(v32, v40, v7);
      sub_2496F0034(v32, v24, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v40, v7);
    }
    v36[41] = v20;
    swift_task_dealloc();
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    uint64_t v11 = sub_2496E97A8;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](v11, v12, v13);
}

uint64_t sub_2496EA4A8()
{
  unint64_t v2 = v1[51];
  if (!(v2 >> 62))
  {
    if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    id v28 = (id)v1[39];
    sub_2496F3D94(v28, 1);
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_2496F9CF0();
  swift_bridgeObjectRelease();
  if (!v38) {
    goto LABEL_12;
  }
LABEL_3:
  if ((v2 & 0xC000000000000001) != 0)
  {
    id v0 = (id)MEMORY[0x24C5A9840](0, v1[51]);
  }
  else
  {
    if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_41;
    }
    id v0 = *(id *)(v1[51] + 32);
  }
  uint64_t v74 = v1 + 28;
  uint64_t v3 = (void *)v1[39];
  swift_bridgeObjectRelease();
  id v4 = v3;
  id v5 = objc_msgSend(v0, sel_objectID);
  id v6 = objc_msgSend(v5, sel_urlRepresentation);

  uint64_t v7 = sub_2496F9460();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = swift_task_alloc();
  sub_2496F9440();

  sub_2496F9420();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v7);
  uint64_t v10 = (void *)sub_2496F9940();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  objc_msgSend(v4, sel_setUniqueID_, v10);

  unint64_t v2 = (unint64_t)objc_msgSend(self, sel_defaultCenter);
  if (qword_2696CB848 != -1) {
LABEL_41:
  }
    swift_once();
  uint64_t v11 = (void *)v1[39];
  uint64_t v71 = v1[36];
  uint64_t v12 = v1[30];
  uint64_t v13 = qword_2696CB9A8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBAC0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2496FA8F0;
  v1[24] = 0x746E657665;
  v1[25] = 0xE500000000000000;
  sub_2496F9BD0();
  *(void *)(inited + 96) = sub_2496E5150(0, &qword_2696CBAB0);
  *(void *)(inited + 72) = v11;
  v1[26] = 0x7265646E696D6572;
  v1[27] = 0xE800000000000000;
  id v15 = v11;
  sub_2496F9BD0();
  *(void *)(inited + 168) = sub_2496E5150(0, &qword_2696CBAE8);
  *(void *)(inited + 144) = v0;
  id v16 = v0;
  sub_2496E8CEC(inited);
  uint64_t v17 = (void *)sub_2496F9910();
  swift_bridgeObjectRelease();
  objc_msgSend((id)v2, sel_postNotificationName_object_userInfo_, v13, 0, v17);

  uint64_t v18 = *(void **)(v12 + v71);
  v1[28] = 0;
  unsigned int v19 = objc_msgSend(v18, sel_saveEvent_span_commit_error_, v15, 0, 0, v74);
  uint64_t v20 = (void *)v1[28];
  uint64_t v21 = (void *)v1[39];
  if (!v19)
  {
    id v36 = v20;
    swift_bridgeObjectRelease();
    swift_release();
    sub_2496F9410();

    swift_willThrow();
    uint64_t v37 = v1[1];
    goto LABEL_15;
  }
  uint64_t v22 = v1[37];
  uint64_t v23 = v1;
  uint64_t v24 = v1[30];
  id v25 = v20;
  objc_msgSend(v18, sel_addPendingIntegrationEvent_, v21);
  uint64_t v26 = *(void *)(v24 + v22);
  LODWORD(v22) = objc_msgSend(v21, sel_sequenceNumber);
  id v27 = v21;
  id v28 = v16;
  sub_2496F81F8(v27, v22, 1, v26, v27, v28);

  sub_2496F4370(v27, (int)objc_msgSend(v27, sel_sequenceNumber), 1, v26);
  char v29 = (uint64_t (*)())objc_msgSend(v27, sel_objectID);
  if (!v29)
  {
    __break(1u);
LABEL_44:
    __break(1u);
    return MEMORY[0x270FA2498](v29, v30, v31);
  }
  uint64_t v32 = v29;
  uint64_t v33 = (void *)v1[39];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA10);
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_2496FA8E0;
  *(void *)(v34 + 32) = v32;
  uint64_t v76 = v34;
  sub_2496F99B0();
  uint64_t v35 = v32;
  sub_2496F5BF8(v76);
  swift_bridgeObjectRelease();

  uint64_t v1 = v23;
LABEL_13:

  uint64_t v39 = v1[40];
  if (v39 == v1[35])
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v37 = v1[1];
LABEL_15:
    __asm { BRAA            X1, X16 }
  }
  uint64_t v40 = v1[29];
  if ((v40 & 0xC000000000000001) != 0) {
    id v41 = (id)MEMORY[0x24C5A9840](v1[40]);
  }
  else {
    id v41 = *(id *)(v40 + 8 * v39 + 32);
  }
  uint64_t v42 = v41;
  v1[39] = v41;
  v1[40] = v39 + 1;
  if (__OFADD__(v39, 1)) {
    __break(1u);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA90);
  uint64_t v43 = sub_2496F9640();
  uint64_t v44 = *(void *)(v43 - 8);
  unint64_t v45 = (*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
  uint64_t v72 = *(void *)(v44 + 72);
  uint64_t v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_2496FA7A0;
  char v29 = (uint64_t (*)())sub_2496F1A5C(v42);
  if (!v29) {
    goto LABEL_44;
  }
  unint64_t v70 = v46 + v45;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB910);
  uint64_t v47 = swift_task_alloc();
  uint64_t v69 = v1;
  if ((objc_msgSend(v42, sel_hasRecurrenceRules) & 1) != 0
    || (id v48 = objc_msgSend(v42, sel_masterEvent), v48, v48))
  {
    id v49 = objc_msgSend(v42, sel_startDateComponents);
    uint64_t v50 = swift_task_alloc();
    if (v49)
    {
      sub_2496F93C0();

      uint64_t v51 = sub_2496F93F0();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v50, 0, 1, v51);
    }
    else
    {
      uint64_t v52 = sub_2496F93F0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v50, 1, 1, v52);
    }
    sub_2496E5398(v50, v47);
    swift_task_dealloc();
  }
  else
  {
    uint64_t v66 = sub_2496F93F0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56))(v47, 1, 1, v66);
  }
  sub_2496F9630();
  swift_task_dealloc();
  sub_2496F31B8(&qword_2696CBA98);
  uint64_t v53 = sub_2496F9A90();
  uint64_t v54 = swift_task_alloc();
  uint64_t v73 = *(void (**)(uint64_t, unint64_t, uint64_t))(v44 + 16);
  v73(v54, v70, v43);
  swift_bridgeObjectRetain();
  uint64_t v75 = v54;
  uint64_t v55 = sub_2496F9920();
  uint64_t v56 = -1 << *(unsigned char *)(v53 + 32);
  unint64_t v57 = v55 & ~v56;
  uint64_t v68 = v44;
  if ((*(void *)(v53 + 56 + ((v57 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v57))
  {
    uint64_t v58 = v44;
    uint64_t v59 = ~v56;
    uint64_t v60 = (void (**)(uint64_t, uint64_t))(v58 + 8);
    while (1)
    {
      uint64_t v61 = swift_task_alloc();
      v73(v61, *(void *)(v53 + 48) + v57 * v72, v43);
      sub_2496F31B8(&qword_2696CBAA0);
      char v62 = sub_2496F9930();
      uint64_t v63 = *v60;
      (*v60)(v61, v43);
      swift_task_dealloc();
      if (v62) {
        break;
      }
      unint64_t v57 = (v57 + 1) & v59;
      if (((*(void *)(v53 + 56 + ((v57 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v57) & 1) == 0) {
        goto LABEL_33;
      }
    }
    swift_bridgeObjectRelease();
    v63(v75, v43);
  }
  else
  {
LABEL_33:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v65 = swift_task_alloc();
    v73(v65, v75, v43);
    sub_2496F0034(v65, v57, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v75, v43);
  }
  v69[41] = v53;
  swift_task_dealloc();
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  char v29 = sub_2496E97A8;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  return MEMORY[0x270FA2498](v29, v30, v31);
}

uint64_t sub_2496EAFD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2496F9A80();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2496F9A70();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_2496E44D4(a1, &qword_2696CB9C0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2496F9A10();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_2496EB158(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v45 = a2;
  uint64_t v46 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB9C0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v44 = (char *)v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2496E8E30(MEMORY[0x263F8EE78]);
  if (a1 >> 62)
  {
LABEL_34:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2496F9CF0();
    if (v7) {
      goto LABEL_3;
    }
LABEL_35:
    swift_bridgeObjectRelease();
    uint64_t v32 = (void *)v43[1];
    uint64_t v33 = sub_2496E6FB8();
    uint64_t v34 = sub_2496F9A80();
    uint64_t v35 = (uint64_t)v44;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v44, 1, 1, v34);
    sub_2496F9A60();
    id v36 = v32;
    swift_retain();
    uint64_t v37 = v46;
    swift_retain();
    uint64_t v38 = sub_2496F9A50();
    uint64_t v39 = (void *)swift_allocObject();
    uint64_t v40 = MEMORY[0x263F8F500];
    v39[2] = v38;
    v39[3] = v40;
    v39[4] = v6;
    v39[5] = v36;
    uint64_t v41 = v45;
    v39[6] = v33;
    v39[7] = v41;
    v39[8] = v37;
    sub_2496E8404(v35, (uint64_t)&unk_2696CBA20, (uint64_t)v39);
    swift_release();
    return swift_release();
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v7) {
    goto LABEL_35;
  }
LABEL_3:
  unint64_t v47 = a1;
  unint64_t v48 = a1 & 0xC000000000000001;
  uint64_t v8 = 4;
  while (1)
  {
    if (v48) {
      id v9 = (id)MEMORY[0x24C5A9840](v8 - 4, a1);
    }
    else {
      id v9 = *(id *)(a1 + 8 * v8);
    }
    uint64_t v10 = v9;
    uint64_t v11 = v8 - 3;
    if (__OFADD__(v8 - 4, 1))
    {
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    id v12 = sub_2496F1A5C(v9);
    if (v12) {
      break;
    }

LABEL_5:
    ++v8;
    if (v11 == v7) {
      goto LABEL_35;
    }
  }
  uint64_t v13 = v12;
  if ((v6 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v14 = v6;
    }
    else {
      uint64_t v14 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    id v15 = v10;
    uint64_t v16 = sub_2496F9B80();
    if (__OFADD__(v16, 1)) {
      goto LABEL_32;
    }
    uint64_t v6 = sub_2496F0D04(v14, v16 + 1);
  }
  else
  {
    id v17 = v10;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v49 = v6;
  a1 = v6;
  unint64_t v20 = sub_2496EECFC((uint64_t)v13);
  uint64_t v21 = *(void *)(v6 + 16);
  BOOL v22 = (v19 & 1) == 0;
  uint64_t v23 = v21 + v22;
  if (__OFADD__(v21, v22)) {
    goto LABEL_31;
  }
  char v24 = v19;
  if (*(void *)(v6 + 24) >= v23)
  {
    if (isUniquelyReferenced_nonNull_native)
    {
      a1 = 8 * v20;
      if (v19) {
        goto LABEL_25;
      }
    }
    else
    {
      sub_2496F179C();
      uint64_t v6 = v49;
      a1 = 8 * v20;
      if (v24) {
        goto LABEL_25;
      }
    }
LABEL_27:
    *(void *)(v6 + 8 * (v20 >> 6) + 64) |= 1 << v20;
    *(void *)(*(void *)(v6 + 48) + a1) = v13;
    *(void *)(*(void *)(v6 + 56) + a1) = v10;
    uint64_t v28 = *(void *)(v6 + 16);
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_33;
    }
    *(void *)(v6 + 16) = v30;
    id v31 = v13;
    goto LABEL_29;
  }
  sub_2496F12BC(v23, isUniquelyReferenced_nonNull_native);
  uint64_t v6 = v49;
  unint64_t v25 = sub_2496EECFC((uint64_t)v13);
  if ((v24 & 1) == (v26 & 1))
  {
    unint64_t v20 = v25;
    a1 = 8 * v25;
    if ((v24 & 1) == 0) {
      goto LABEL_27;
    }
LABEL_25:
    uint64_t v27 = *(void *)(v6 + 56);

    *(void *)(v27 + a1) = v10;
LABEL_29:
    swift_bridgeObjectRelease();

    a1 = v47;
    goto LABEL_5;
  }
  sub_2496E5150(0, &qword_2696CBA28);
  uint64_t result = sub_2496F9D80();
  __break(1u);
  return result;
}

uint64_t sub_2496EB50C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[26] = a7;
  v8[27] = a8;
  v8[24] = a5;
  v8[25] = a6;
  v8[23] = a4;
  sub_2496F9A60();
  v8[28] = sub_2496F9A50();
  uint64_t v9 = sub_2496F9A10();
  v8[29] = v9;
  v8[30] = v10;
  return MEMORY[0x270FA2498](sub_2496EB5E0, v9, v10);
}

uint64_t sub_2496EB5E0()
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(v0 + 184);
  if ((v1 & 0xC000000000000001) != 0)
  {
    unint64_t v2 = 0;
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    unint64_t v5 = sub_2496F9CB0() | 0x8000000000000000;
  }
  else
  {
    uint64_t v6 = -1 << *(unsigned char *)(v1 + 32);
    uint64_t v3 = ~v6;
    unint64_t v2 = (void *)(v1 + 64);
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v4 = v8 & *(void *)(v1 + 64);
    unint64_t v5 = *(void *)(v0 + 184);
  }
  *(void *)(v0 + 248) = v5;
  *(void *)(v0 + 256) = v2;
  *(unsigned char *)(v0 + 336) = 1;
  *(void *)(v0 + 272) = 0;
  *(void *)(v0 + 280) = v4;
  *(void *)(v0 + 264) = v3;
  swift_bridgeObjectRetain();
  if ((v5 & 0x8000000000000000) == 0)
  {
    if (v4)
    {
      uint64_t v9 = 0;
      unint64_t v10 = __clz(__rbit64(v4));
      uint64_t v11 = (v4 - 1) & v4;
LABEL_10:
      uint64_t v12 = 8 * v10;
      uint64_t v13 = *(void **)(*(void *)(v5 + 48) + v12);
      uint64_t v14 = *(void **)(*(void *)(v5 + 56) + v12);
      id v15 = v13;
      id v16 = v14;
      goto LABEL_13;
    }
    unint64_t v27 = v3 + 64;
    if ((unint64_t)(v3 + 64) > 0x7F)
    {
      unint64_t v28 = v2[1];
      if (v28)
      {
        uint64_t v9 = 1;
LABEL_21:
        uint64_t v11 = (v28 - 1) & v28;
        unint64_t v10 = __clz(__rbit64(v28)) + (v9 << 6);
        goto LABEL_10;
      }
      if (v27 >= 0xC0)
      {
        unint64_t v28 = v2[2];
        if (v28)
        {
          uint64_t v9 = 2;
          goto LABEL_21;
        }
        if (v27 >= 0x100)
        {
          unint64_t v28 = v2[3];
          if (v28)
          {
            uint64_t v9 = 3;
            goto LABEL_21;
          }
          if (v27 >= 0x140)
          {
            unint64_t v28 = v2[4];
            if (v28)
            {
              uint64_t v9 = 4;
            }
            else
            {
              unint64_t v32 = v27 >> 6;
              uint64_t v33 = 5;
              do
              {
                if (v32 == v33) {
                  goto LABEL_41;
                }
                unint64_t v28 = v2[v33++];
              }
              while (!v28);
              uint64_t v9 = v33 - 1;
            }
            goto LABEL_21;
          }
        }
      }
    }
LABEL_41:
    sub_2496F323C();
    swift_release();
    (*(void (**)(void, void))(v0 + 208))(*(unsigned __int8 *)(v0 + 336), 0);
    uint64_t v34 = *(void *)(v0 + 8);
    __asm { BRAA            X1, X16 }
  }
  uint64_t v17 = sub_2496F9CD0();
  if (!v17) {
    goto LABEL_41;
  }
  uint64_t v19 = v18;
  *(void *)(v0 + 160) = v17;
  sub_2496E5150(0, &qword_2696CBA28);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v15 = *(id *)(v0 + 152);
  swift_unknownObjectRelease();
  *(void *)(v0 + 176) = v19;
  sub_2496E5150(0, &qword_2696CBAB0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v16 = *(id *)(v0 + 168);
  swift_unknownObjectRelease();
  uint64_t v9 = 0;
  uint64_t v11 = v4;
LABEL_13:
  *(void *)(v0 + 304) = v9;
  *(void *)(v0 + 312) = v11;
  *(void *)(v0 + 288) = v15;
  *(void *)(v0 + 296) = v16;
  if (!v15) {
    goto LABEL_41;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB910);
  uint64_t v20 = swift_task_alloc();
  *(void *)(v0 + 320) = v20;
  id v21 = v15;
  id v22 = v16;
  if ((objc_msgSend(v22, sel_hasRecurrenceRules) & 1) != 0
    || (id v23 = objc_msgSend(v22, sel_masterEvent), v23, v23))
  {
    id v24 = objc_msgSend(v22, sel_startDateComponents, v36);
    uint64_t v25 = swift_task_alloc();
    if (v24)
    {
      sub_2496F93C0();

      uint64_t v26 = sub_2496F93F0();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 0, 1, v26);
    }
    else
    {
      uint64_t v29 = sub_2496F93F0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v25, 1, 1, v29);
    }
    sub_2496E5398(v25, v20);
    swift_task_dealloc();
  }
  else
  {
    uint64_t v31 = sub_2496F93F0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v20, 1, 1, v31);
  }
  uint64_t v30 = swift_task_alloc();
  *(void *)(v0 + 328) = v30;
  *(void *)uint64_t v30 = v0;
  *(void *)(v30 + 8) = sub_2496EBB2C;
  *(int8x16_t *)(v30 + 40) = vextq_s8(*(int8x16_t *)(v0 + 192), *(int8x16_t *)(v0 + 192), 8uLL);
  *(void *)(v30 + 24) = v21;
  *(void *)(v30 + 32) = v20;
  return MEMORY[0x270FA2498](sub_2496EC7C0, 0, 0);
}

uint64_t sub_2496EBB2C(char a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 320);
  *(unsigned char *)(*v1 + 337) = a1;
  swift_task_dealloc();
  sub_2496E44D4(v3, &qword_2696CB910);
  swift_task_dealloc();
  uint64_t v4 = *(void *)(v2 + 240);
  uint64_t v5 = *(void *)(v2 + 232);
  return MEMORY[0x270FA2498](sub_2496EBCB4, v5, v4);
}

uint64_t sub_2496EBCB4()
{
  int v1 = *(unsigned __int8 *)(v0 + 337);
  if (v1 == 1)
  {
    uint64_t v30 = *(void **)(v0 + 288);
    uint64_t v29 = *(void **)(v0 + 296);
    sub_2496F323C();

    swift_release();
    uint64_t v31 = 0;
    goto LABEL_49;
  }
  uint64_t v2 = (id *)(v0 + 152);
  if (v1 == 2 && (objc_msgSend(*(id *)(v0 + 296), sel_hasEverBeenCommitted) & 1) != 0)
  {
    uint64_t v3 = *(void **)(v0 + 288);
    uint64_t v4 = *(void **)(v0 + 296);

    uint64_t v5 = *(void *)(v0 + 304);
    unint64_t v6 = *(void *)(v0 + 312);
    *(unsigned char *)(v0 + 336) = 0;
  }
  else
  {
    id v7 = objc_msgSend(self, sel_defaultCenter);
    if (qword_2696CB840 != -1) {
      swift_once();
    }
    uint64_t v8 = *(void **)(v0 + 296);
    uint64_t v9 = *(void *)(v0 + 192);
    uint64_t v10 = qword_2696CB9A0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBAC0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2496FA7A0;
    *(void *)(v0 + 120) = 0x746E657665;
    *(void *)(v0 + 128) = 0xE500000000000000;
    sub_2496F9BD0();
    *(void *)(inited + 96) = sub_2496E5150(0, &qword_2696CBAB0);
    *(void *)(inited + 72) = v8;
    id v12 = v8;
    sub_2496E8CEC(inited);
    uint64_t v13 = (void *)sub_2496F9910();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_postNotificationName_object_userInfo_, v10, 0, v13);

    int v14 = objc_msgSend(v12, sel_sequenceNumber);
    id v15 = *(void **)(v9 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_eventStore);
    *(void *)(v0 + 136) = 0;
    unsigned int v16 = objc_msgSend(v15, sel_removeEvent_span_commit_error_, v12, 0, 0, v0 + 136);
    uint64_t v17 = *(void **)(v0 + 136);
    if (v16)
    {
      uint64_t v18 = *(void **)(v0 + 296);
      uint64_t v19 = *(void *)(*(void *)(v0 + 192)
                      + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_changeTracker);
      id v20 = v17;
      sub_2496F4370(v18, v14, 1, v19);
      id v21 = (uint64_t (*)())objc_msgSend(v18, sel_objectID);
      if (!v21)
      {
        __break(1u);
        return MEMORY[0x270FA2498](v21, v22, v23);
      }
      id v24 = v21;
      uint64_t v25 = *(void **)(v0 + 288);
      uint64_t v26 = *(NSObject **)(v0 + 296);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA10);
      uint64_t v27 = swift_allocObject();
      *(_OWORD *)(v27 + 16) = xmmword_2496FA8E0;
      *(void *)(v27 + 32) = v24;
      os_log_t log = (os_log_t)v27;
      sub_2496F99B0();
      unint64_t v28 = v24;
      sub_2496F5BF8((uint64_t)log);
      swift_bridgeObjectRelease();
    }
    else
    {
      id v32 = v17;
      uint64_t v33 = (void *)sub_2496F9410();

      swift_willThrow();
      if (qword_26B160DA8 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_2496F9900();
      __swift_project_value_buffer(v34, (uint64_t)qword_26B160E10);
      id v35 = v33;
      id v36 = v33;
      uint64_t v37 = sub_2496F98E0();
      os_log_type_t v38 = sub_2496F9AB0();
      BOOL v39 = os_log_type_enabled(v37, v38);
      uint64_t v26 = *(NSObject **)(v0 + 288);
      uint64_t v40 = *(void **)(v0 + 296);
      if (v39)
      {
        uint64_t v73 = *(void **)(v0 + 296);
        uint64_t v41 = (uint8_t *)swift_slowAlloc();
        uint64_t v72 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v41 = 138412290;
        id v42 = v33;
        uint64_t v43 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v0 + 144) = v43;
        uint64_t v2 = (id *)(v0 + 152);
        sub_2496F9B10();
        *uint64_t v72 = v43;

        _os_log_impl(&dword_2496DE000, v37, v38, "Error deleting integration event: %@", v41, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA08);
        swift_arrayDestroy();
        MEMORY[0x24C5A9F00](v72, -1, -1);
        MEMORY[0x24C5A9F00](v41, -1, -1);
      }
      else
      {

        uint64_t v26 = v37;
      }
    }

    uint64_t v5 = *(void *)(v0 + 304);
    unint64_t v6 = *(void *)(v0 + 312);
  }
  *(void *)(v0 + 272) = v5;
  *(void *)(v0 + 280) = v6;
  uint64_t v44 = *(void *)(v0 + 248);
  if (v44 < 0)
  {
    uint64_t v52 = sub_2496F9CD0();
    if (!v52)
    {
LABEL_48:
      sub_2496F323C();
      swift_release();
      uint64_t v31 = *(unsigned __int8 *)(v0 + 336);
LABEL_49:
      (*(void (**)(uint64_t, void))(v0 + 208))(v31, 0);
      uint64_t v70 = *(void *)(v0 + 8);
      __asm { BRAA            X1, X16 }
    }
    uint64_t v54 = v53;
    *(void *)(v0 + 160) = v52;
    sub_2496E5150(0, &qword_2696CBA28);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v50 = *v2;
    swift_unknownObjectRelease();
    *(void *)(v0 + 176) = v54;
    sub_2496E5150(0, &qword_2696CBAB0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v51 = *(id *)(v0 + 168);
    swift_unknownObjectRelease();
    uint64_t v47 = v5;
    uint64_t v45 = v6;
  }
  else
  {
    if (v6)
    {
      uint64_t v45 = (v6 - 1) & v6;
      unint64_t v46 = __clz(__rbit64(v6)) | (v5 << 6);
      uint64_t v47 = v5;
    }
    else
    {
      int64_t v62 = v5 + 1;
      if (__OFADD__(v5, 1)) {
        __break(1u);
      }
      int64_t v63 = (unint64_t)(*(void *)(v0 + 264) + 64) >> 6;
      if (v62 >= v63) {
        goto LABEL_48;
      }
      uint64_t v64 = *(void *)(v0 + 256);
      unint64_t v65 = *(void *)(v64 + 8 * v62);
      uint64_t v47 = v5 + 1;
      if (!v65)
      {
        uint64_t v47 = v5 + 2;
        if (v5 + 2 >= v63) {
          goto LABEL_48;
        }
        unint64_t v65 = *(void *)(v64 + 8 * v47);
        if (!v65)
        {
          uint64_t v47 = v5 + 3;
          if (v5 + 3 >= v63) {
            goto LABEL_48;
          }
          unint64_t v65 = *(void *)(v64 + 8 * v47);
          if (!v65)
          {
            uint64_t v47 = v5 + 4;
            if (v5 + 4 >= v63) {
              goto LABEL_48;
            }
            unint64_t v65 = *(void *)(v64 + 8 * v47);
            if (!v65)
            {
              uint64_t v69 = v5 + 5;
              do
              {
                if (v63 == v69) {
                  goto LABEL_48;
                }
                unint64_t v65 = *(void *)(v64 + 8 * v69++);
              }
              while (!v65);
              uint64_t v47 = v69 - 1;
            }
          }
        }
      }
      uint64_t v45 = (v65 - 1) & v65;
      unint64_t v46 = __clz(__rbit64(v65)) + (v47 << 6);
    }
    uint64_t v48 = 8 * v46;
    uint64_t v49 = *(void **)(*(void *)(v44 + 56) + v48);
    id v50 = *(id *)(*(void *)(v44 + 48) + v48);
    id v51 = v49;
  }
  *(void *)(v0 + 304) = v47;
  *(void *)(v0 + 312) = v45;
  *(void *)(v0 + 288) = v50;
  *(void *)(v0 + 296) = v51;
  if (!v50) {
    goto LABEL_48;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB910);
  uint64_t v55 = swift_task_alloc();
  *(void *)(v0 + 320) = v55;
  id v56 = v50;
  id v57 = v51;
  if ((objc_msgSend(v57, sel_hasRecurrenceRules) & 1) != 0
    || (id v58 = objc_msgSend(v57, sel_masterEvent), v58, v58))
  {
    id v59 = objc_msgSend(v57, sel_startDateComponents);
    uint64_t v60 = swift_task_alloc();
    if (v59)
    {
      sub_2496F93C0();

      uint64_t v61 = sub_2496F93F0();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56))(v60, 0, 1, v61);
    }
    else
    {
      uint64_t v66 = sub_2496F93F0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56))(v60, 1, 1, v66);
    }
    sub_2496E5398(v60, v55);
    swift_task_dealloc();
  }
  else
  {
    uint64_t v68 = sub_2496F93F0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56))(v55, 1, 1, v68);
  }
  uint64_t v67 = swift_task_alloc();
  *(void *)(v0 + 328) = v67;
  *(void *)uint64_t v67 = v0;
  *(void *)(v67 + 8) = sub_2496EBB2C;
  *(int8x16_t *)(v67 + 40) = vextq_s8(*(int8x16_t *)(v0 + 192), *(int8x16_t *)(v0 + 192), 8uLL);
  *(void *)(v67 + 24) = v56;
  *(void *)(v67 + 32) = v55;
  id v21 = sub_2496EC7C0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  return MEMORY[0x270FA2498](v21, v22, v23);
}

void sub_2496EC72C(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_2496F9400();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

uint64_t sub_2496EC79C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return MEMORY[0x270FA2498](sub_2496EC7C0, 0, 0);
}

uint64_t sub_2496EC7C0()
{
  uint64_t v17 = v0[6];
  uint64_t v2 = (void *)v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = sub_2496F9640();
  v0[7] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v0[8] = v4;
  uint64_t v5 = swift_task_alloc();
  v0[9] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CB910);
  uint64_t v6 = swift_task_alloc();
  sub_2496F3244(v1, v6, &qword_2696CB910);
  id v7 = v2;
  sub_2496F9630();
  swift_task_dealloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA90);
  unint64_t v8 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_2496FA7A0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 16))(v9 + v8, v5, v3);
  sub_2496F3048(v9);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v10 = sub_2496F95C0();
  v0[10] = v10;
  v0[11] = *(void *)(v10 - 8);
  uint64_t v11 = swift_task_alloc();
  v0[12] = v11;
  sub_2496F95B0();
  MEMORY[0x24C5A9FB0](v17 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_undoManager);
  sub_2496F95A0();
  uint64_t v12 = sub_2496F9590();
  v0[13] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v0[14] = v13;
  v0[15] = *(void *)(v13 + 64);
  uint64_t v14 = swift_task_alloc();
  v0[16] = v14;
  id v15 = (void *)swift_task_alloc();
  v0[17] = v15;
  *id v15 = v0;
  v15[1] = sub_2496ECAE0;
  return MEMORY[0x270F5A168](v14, v11);
}

uint64_t sub_2496ECAE0()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2496ECD90;
  }
  else {
    uint64_t v2 = sub_2496ECBF4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2496ECBF4()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[9];
  uint64_t v5 = v0[7];
  uint64_t v6 = v0[8];
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  uint64_t v7 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v7, v1, v2);
  int v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v7, v2);
  if (MEMORY[0x263F633B0] && v8 == *MEMORY[0x263F633B0])
  {
    (*(void (**)(uint64_t, void))(v0[14] + 8))(v7, v0[13]);
    uint64_t v9 = 0;
  }
  else if (MEMORY[0x263F633B8] && v8 == *MEMORY[0x263F633B8])
  {
    uint64_t v9 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, void))(v0[14] + 8))(v7, v0[13]);
    uint64_t v9 = 2;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(uint64_t))v0[1];
  return v10(v9);
}

uint64_t sub_2496ECD90()
{
  swift_task_dealloc();
  if (qword_26B160DA8 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[18];
  uint64_t v2 = sub_2496F9900();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B160E10);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_2496F98E0();
  os_log_type_t v6 = sub_2496F9AB0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  int v8 = (void *)v0[18];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v12;
    sub_2496F9B10();
    *uint64_t v10 = v12;

    _os_log_impl(&dword_2496DE000, v5, v6, "Error deleting reminder: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA08);
    swift_arrayDestroy();
    MEMORY[0x24C5A9F00](v10, -1, -1);
    MEMORY[0x24C5A9F00](v9, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = v0[9];
  uint64_t v14 = v0[7];
  uint64_t v15 = v0[8];
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  unsigned int v16 = (uint64_t (*)(uint64_t))v0[1];
  return v16(2);
}

uint64_t sub_2496ECFE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[9] = a3;
  v4[10] = v3;
  v4[7] = a1;
  v4[8] = a2;
  return MEMORY[0x270FA2498](sub_2496ED004, 0, 0);
}

uint64_t sub_2496ED004()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = (void *)v0[7];
  uint64_t v3 = sub_2496F96B0();
  v0[11] = v3;
  v0[12] = *(void *)(v3 - 8);
  uint64_t v4 = swift_task_alloc();
  v0[13] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA10);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2496FA8E0;
  *(void *)(inited + 32) = v2;
  unint64_t v13 = inited;
  sub_2496F99B0();
  id v6 = v2;
  sub_2496F2E98(v13);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(sub_2496F93F0() - 8);
  swift_task_alloc();
  (*(void (**)(void))(v7 + 16))();
  sub_2496F9690();
  swift_task_dealloc();
  MEMORY[0x24C5A9FB0](v1 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_undoManager);
  sub_2496F96A0();
  uint64_t v8 = sub_2496F9680();
  v0[14] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v0[15] = v9;
  v0[16] = *(void *)(v9 + 64);
  uint64_t v10 = swift_task_alloc();
  v0[17] = v10;
  id v11 = (void *)swift_task_alloc();
  v0[18] = v11;
  *id v11 = v0;
  v11[1] = sub_2496ED284;
  return MEMORY[0x270F5A170](v10, v4);
}

uint64_t sub_2496ED284()
{
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2496ED6C4;
  }
  else {
    uint64_t v2 = sub_2496ED398;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2496ED398()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[15];
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v1, v2);
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v4, v2);
  if (!MEMORY[0x263F63408] || v5 != *MEMORY[0x263F63408])
  {
    if (MEMORY[0x263F63410] && v5 == *MEMORY[0x263F63410])
    {
      uint64_t v15 = v0[12];
      uint64_t v14 = v0[13];
      uint64_t v16 = v0[11];
      (*(void (**)(void, void))(v0[15] + 8))(v0[17], v0[14]);
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    }
    else
    {
      uint64_t v17 = v0[14];
      uint64_t v19 = v0[12];
      uint64_t v18 = v0[13];
      uint64_t v20 = v0[11];
      id v21 = *(void (**)(uint64_t, uint64_t))(v0[15] + 8);
      v21(v0[17], v17);
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
      v21(v4, v17);
    }
    id v13 = 0;
    goto LABEL_17;
  }
  (*(void (**)(uint64_t, void))(v0[15] + 96))(v4, v0[14]);
  uint64_t v6 = sub_2496F9670();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v8, v4, v6);
  unint64_t v9 = sub_2496F9660();
  unint64_t v10 = v9;
  if (v9 >> 62)
  {
    uint64_t result = sub_2496F9CF0();
    uint64_t v29 = v8;
    uint64_t v30 = v6;
    if (result) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t result = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v29 = v8;
    uint64_t v30 = v6;
    if (result)
    {
LABEL_5:
      if ((v10 & 0xC000000000000001) != 0)
      {
        id v12 = (id)MEMORY[0x24C5A9840](0, v10);
      }
      else
      {
        if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return result;
        }
        id v12 = *(id *)(v10 + 32);
      }
      id v13 = v12;
      swift_bridgeObjectRelease();
      goto LABEL_16;
    }
  }
  swift_bridgeObjectRelease();
  id v13 = 0;
LABEL_16:
  uint64_t v22 = v0[17];
  uint64_t v24 = v0[14];
  uint64_t v23 = v0[15];
  uint64_t v25 = v0[12];
  uint64_t v26 = v0[13];
  uint64_t v27 = v0[11];
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v29, v30);
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v26, v27);
  swift_task_dealloc();
LABEL_17:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v28 = (uint64_t (*)(id))v0[1];
  return v28(v13);
}

uint64_t sub_2496ED6C4()
{
  (*(void (**)(void, void))(v0[12] + 8))(v0[13], v0[11]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_2496ED750()
{
  return 1;
}

uint64_t sub_2496ED758()
{
  return sub_2496F9DF0();
}

uint64_t sub_2496ED79C()
{
  return sub_2496F9DE0();
}

uint64_t sub_2496ED7C4()
{
  return sub_2496F9DF0();
}

uint64_t sub_2496ED814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = sub_2496F9A60();
  v4[7] = sub_2496F9A50();
  uint64_t v6 = sub_2496F9A10();
  v4[8] = v6;
  v4[9] = v5;
  return MEMORY[0x270FA2498](sub_2496ED8B4, v6, v5);
}

uint64_t sub_2496ED8B4()
{
  uint64_t v1 = *(void *)(v0 + 40);
  long long v9 = *(_OWORD *)(v0 + 24);
  uint64_t v2 = sub_2496F9A50();
  *(void *)(v0 + 80) = v2;
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  *(void *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v9;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2496ED9CC;
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v6 = *(void *)(v0 + 16);
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA2360](v6, v2, v7, 0x28746E6573657270, 0xEB00000000293A5FLL, sub_2496F2A28, v3, v5);
}

uint64_t sub_2496ED9CC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 64);
    uint64_t v4 = *(void *)(v2 + 72);
    uint64_t v5 = sub_2496EDB54;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 64);
    uint64_t v4 = *(void *)(v2 + 72);
    uint64_t v5 = sub_2496EDAF0;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_2496EDAF0()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2496EDB54()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_2496EDBCC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v63 = a3;
  uint64_t v86 = a1;
  uint64_t v6 = *(void *)(a4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v79 = (char *)v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v62 - v9;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696CBA60);
  uint64_t v85 = sub_2496F9A40();
  uint64_t v11 = *(void *)(v85 - 8);
  uint64_t v82 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v85);
  unint64_t v83 = (char *)v62 - v12;
  uint64_t v95 = MEMORY[0x263F8EE78];
  v62[1] = sub_2496F97D0();
  uint64_t v13 = sub_2496F97B0();
  uint64_t v14 = a4;
  uint64_t v15 = sub_2496F97A0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v81 = *(void *)(v16 + 64);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v62 - v17;
  uint64_t v19 = MEMORY[0x24C5A9600](v13, v15);
  uint64_t v84 = v11;
  if (!v19)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v92 = sub_2496F9760();
    uint64_t v50 = v49;
    uint64_t v51 = sub_2496F97C0();
    uint64_t v53 = v52;
    uint64_t v54 = v95;
    uint64_t v55 = v83;
    uint64_t v56 = v84;
    uint64_t v57 = v85;
    (*(void (**)(char *, uint64_t, uint64_t))(v84 + 16))(v83, v86, v85);
    unint64_t v58 = (*(unsigned __int8 *)(v56 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
    uint64_t v59 = swift_allocObject();
    *(void *)(v59 + 16) = v14;
    (*(void (**)(unint64_t, char *, uint64_t))(v56 + 32))(v59 + v58, v55, v57);
    id v60 = objc_allocWithZone(MEMORY[0x263F304D8]);
    id v61 = sub_2496EE904(v92, v50, v51, v53, v54, (uint64_t)sub_2496F2D08, v59);
    objc_msgSend(v63, sel_displayIntegrationAlert_, v61);

    return;
  }
  v62[0] = a2;
  uint64_t v20 = 0;
  id v78 = (void (**)(char *, void *, uint64_t))(v16 + 16);
  uint64_t v73 = (void (**)(char *, char *, uint64_t))(v16 + 32);
  uint64_t v72 = v11 + 16;
  uint64_t v71 = v6 + 16;
  uint64_t v70 = v11 + 32;
  uint64_t v69 = v6 + 32;
  uint64_t v68 = v94;
  uint64_t v77 = v6;
  uint64_t v67 = (void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v66 = (void (**)(char *, uint64_t))(v16 + 8);
  uint64_t v76 = v13;
  uint64_t v75 = v16;
  uint64_t v74 = v18;
  unint64_t v65 = v10;
  uint64_t v64 = v15;
  uint64_t v21 = v6;
  while (1)
  {
    char v22 = sub_2496F99E0();
    sub_2496F99C0();
    if ((v22 & 1) == 0) {
      break;
    }
    uint64_t v23 = (*(uint64_t (**)(char *, unint64_t, uint64_t))(v16 + 16))(v18, v13+ ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))+ *(void *)(v16 + 72) * v20, v15);
    uint64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      goto LABEL_14;
    }
LABEL_5:
    uint64_t v91 = v24;
    uint64_t v92 = v20;
    uint64_t v90 = v62;
    MEMORY[0x270FA5388](v23);
    uint64_t v26 = (char *)v62 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*v73)(v26, v18, v15);
    uint64_t v27 = sub_2496F9780();
    uint64_t v88 = v28;
    uint64_t v89 = v27;
    uint64_t v29 = v14;
    uint64_t v30 = sub_2496F9750();
    uint64_t v31 = *(void *)(v30 - 8);
    MEMORY[0x270FA5388](v30);
    uint64_t v33 = (char *)v62 - v32;
    sub_2496F9770();
    uint64_t v87 = sub_2496E68E8((uint64_t)v33);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v33, v30);
    sub_2496F9790();
    id v35 = v83;
    uint64_t v34 = v84;
    id v36 = v10;
    uint64_t v37 = v85;
    (*(void (**)(char *, uint64_t, uint64_t))(v84 + 16))(v83, v86, v85);
    os_log_type_t v38 = v79;
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v79, v36, v29);
    unint64_t v39 = (*(unsigned __int8 *)(v34 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
    unint64_t v40 = (v82 + *(unsigned __int8 *)(v21 + 80) + v39) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
    uint64_t v41 = swift_allocObject();
    *(void *)(v41 + 16) = v29;
    (*(void (**)(unint64_t, char *, uint64_t))(v34 + 32))(v41 + v39, v35, v37);
    uint64_t v14 = v29;
    (*(void (**)(unint64_t, char *, uint64_t))(v21 + 32))(v41 + v40, v38, v29);
    id v42 = objc_allocWithZone(MEMORY[0x263F304E0]);
    uint64_t v43 = (void *)sub_2496F9940();
    swift_bridgeObjectRelease();
    v94[2] = sub_2496F2B5C;
    v94[3] = v41;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    v94[0] = sub_2496EE8C0;
    v94[1] = &block_descriptor;
    uint64_t v44 = _Block_copy(aBlock);
    id v45 = objc_msgSend(v42, sel_initWithTitle_style_handler_, v43, v87, v44, v62[0]);

    _Block_release(v44);
    swift_release();
    id v46 = v45;
    MEMORY[0x24C5A9580]();
    if (*(void *)((v95 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v95 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2496F99D0();
    }
    sub_2496F99F0();
    sub_2496F99B0();

    uint64_t v10 = v65;
    (*v67)(v65, v14);
    uint64_t v15 = v64;
    (*v66)(v26, v64);
    uint64_t v13 = v76;
    uint64_t v47 = MEMORY[0x24C5A9600](v76, v15);
    uint64_t v20 = v92 + 1;
    uint64_t v16 = v75;
    uint64_t v18 = v74;
    if (v91 == v47) {
      goto LABEL_13;
    }
  }
  uint64_t v48 = sub_2496F9C30();
  if (v81 != 8) {
    goto LABEL_15;
  }
  aBlock[0] = v48;
  (*v78)(v18, aBlock, v15);
  uint64_t v23 = swift_unknownObjectRelease();
  uint64_t v24 = v20 + 1;
  if (!__OFADD__(v20, 1)) {
    goto LABEL_5;
  }
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
}

uint64_t sub_2496EE474(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696CBA60);
  sub_2496F9A40();
  return sub_2496F9A30();
}

uint64_t sub_2496EE554()
{
  return sub_2496F9A20();
}

uint64_t sub_2496EE5D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v3;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_2496EE688;
  return sub_2496ED814(a1, a2, v8, a3);
}

uint64_t sub_2496EE688()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id CUIKIReminderEditorImplementation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void CUIKIReminderEditorImplementation.init()()
{
}

id CUIKIReminderEditorImplementation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CUIKIReminderEditorImplementation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2496EE8C0(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_2496EE904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2)
  {
    uint64_t v12 = (void *)sub_2496F9940();
    swift_bridgeObjectRelease();
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v13 = 0;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v14 = 0;
    goto LABEL_8;
  }
  uint64_t v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v13 = (void *)sub_2496F9940();
  swift_bridgeObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  sub_2496E5150(0, &qword_2696CBA68);
  uint64_t v14 = (void *)sub_2496F9990();
  swift_bridgeObjectRelease();
LABEL_8:
  v18[4] = a6;
  v18[5] = a7;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 1107296256;
  v18[2] = sub_2496EE8C0;
  v18[3] = &block_descriptor_31;
  uint64_t v15 = _Block_copy(v18);
  id v16 = objc_msgSend(v7, sel_initWithTitle_message_actions_cancelBlock_, v12, v13, v14, v15);

  _Block_release(v15);
  swift_release();
  return v16;
}

uint64_t sub_2496EEA6C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2496EEB48;
  return v6(a1);
}

uint64_t sub_2496EEB48()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_2496EEC40(uint64_t a1, uint64_t a2)
{
  sub_2496F9DD0();
  sub_2496F9960();
  uint64_t v4 = sub_2496F9DF0();
  return sub_2496EED40(a1, a2, v4);
}

unint64_t sub_2496EECB8(uint64_t a1)
{
  uint64_t v2 = sub_2496F9BB0();
  return sub_2496EEE24(a1, v2);
}

unint64_t sub_2496EECFC(uint64_t a1)
{
  uint64_t v2 = sub_2496F9AF0();
  return sub_2496EEEEC(a1, v2);
}

unint64_t sub_2496EED40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2496F9D50() & 1) == 0)
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
      while (!v14 && (sub_2496F9D50() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2496EEE24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_2496F2DE8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x24C5A97C0](v9, a1);
      sub_2496F2E44((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_2496EEEEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_2496E5150(0, &qword_2696CBA28);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_2496F9B00();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_2496F9B00();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_2496EF008(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_2496F9B90();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_2496E5150(0, &qword_2696CBA28);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_2496F9B80();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_2496EF5D0(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_2496EF7C8();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_2496EFE28((uint64_t)v8, v22);
    *uint64_t v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_2496F9AF0();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_2496E5150(0, &qword_2696CBA28);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_2496F9B00();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_2496F9B00();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    id v8 = a2;
    sub_2496EFEAC((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_2496EF2A8(char *a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_2496F9640();
  sub_2496F31B8(&qword_2696CBA98);
  swift_bridgeObjectRetain();
  uint64_t v37 = a2;
  uint64_t v8 = sub_2496F9920();
  uint64_t v9 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v10 = v8 & ~v9;
  uint64_t v34 = v6 + 56;
  uint64_t v11 = v7 - 8;
  if ((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v30 = v2;
    uint64_t v31 = a1;
    uint64_t v32 = ~v9;
    uint64_t v12 = *(void **)v11;
    v28[1] = v11 & 0xFFFFFFFFFFFFLL | 0x2E3F000000000000;
    uint64_t v29 = v12;
    unint64_t v13 = (void (*)(char *, unint64_t, uint64_t))v12[2];
    id v35 = v12 + 2;
    id v36 = v13;
    uint64_t v14 = v12[8];
    uint64_t v33 = v12[9];
    char v15 = (uint64_t (**)(char *, uint64_t))(v12 + 1);
    while (1)
    {
      MEMORY[0x270FA5388](v8);
      uint64_t v16 = v6;
      uint64_t v17 = *(void *)(v6 + 48);
      unint64_t v18 = v33 * v10;
      v36((char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v33 * v10, v7);
      sub_2496F31B8(&qword_2696CBAA0);
      char v19 = sub_2496F9930();
      id v20 = *v15;
      uint64_t v8 = (*v15)((char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
      if (v19) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v32;
      uint64_t v6 = v16;
      if (((*(void *)(v34 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v30;
        a1 = v31;
        uint64_t v21 = v29;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v20(v37, v7);
    v36(v31, *(void *)(*v30 + 48) + v18, v7);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = *(void **)v11;
LABEL_7:
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    char v23 = isUniquelyReferenced_nonNull_native;
    MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native);
    id v25 = (char *)v28 - v24;
    uint64_t v26 = v37;
    ((void (*)(char *, char *, uint64_t))v21[2])((char *)v28 - v24, v37, v7);
    uint64_t v38 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_2496F0034((uint64_t)v25, v10, v23);
    *uint64_t v3 = v38;
    swift_bridgeObjectRelease();
    ((void (*)(char *, char *, uint64_t))v21[4])(a1, v26, v7);
    return 1;
  }
}

uint64_t sub_2496EF5D0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA88);
    uint64_t v2 = sub_2496F9C00();
    uint64_t v14 = v2;
    sub_2496F9B70();
    if (sub_2496F9BA0())
    {
      sub_2496E5150(0, &qword_2696CBA28);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_2496EF7C8();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_2496F9AF0();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_2496F9BA0());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_2496EF7C8()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA88);
  uint64_t v3 = sub_2496F9BF0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                id v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_2496F9AF0();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *id v1 = v4;
  return result;
}

uint64_t sub_2496EFA68()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBAA8);
  uint64_t v3 = sub_2496F9BF0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = *(void *)(v2 + 56);
    uint64_t v38 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & v6;
    id v36 = v0;
    int64_t v37 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v13 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        int64_t v40 = v11;
        unint64_t v14 = v13 | (v11 << 6);
      }
      else
      {
        int64_t v15 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v37) {
          goto LABEL_33;
        }
        unint64_t v16 = v38[v15];
        int64_t v17 = v11 + 1;
        if (!v16)
        {
          int64_t v17 = v11 + 2;
          if (v11 + 2 >= v37) {
            goto LABEL_33;
          }
          unint64_t v16 = v38[v17];
          if (!v16)
          {
            int64_t v17 = v11 + 3;
            if (v11 + 3 >= v37) {
              goto LABEL_33;
            }
            unint64_t v16 = v38[v17];
            if (!v16)
            {
              uint64_t v18 = v11 + 4;
              if (v11 + 4 >= v37)
              {
LABEL_33:
                swift_release();
                id v1 = v36;
                uint64_t v34 = 1 << *(unsigned char *)(v2 + 32);
                if (v34 > 63) {
                  bzero(v38, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v38 = -1 << v34;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v38[v18];
              if (!v16)
              {
                while (1)
                {
                  int64_t v17 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v17 >= v37) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v38[v17];
                  ++v18;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v17 = v11 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v16 - 1) & v16;
        int64_t v40 = v17;
        unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
      }
      uint64_t v19 = sub_2496F9640();
      unint64_t v39 = &v35;
      uint64_t v20 = *(void *)(v19 - 8);
      MEMORY[0x270FA5388](v19);
      unint64_t v22 = (char *)&v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v23 = v2;
      uint64_t v24 = *(void *)(v2 + 48);
      BOOL v25 = *(void (**)(char *, unint64_t, uint64_t))(v20 + 32);
      uint64_t v26 = *(void *)(v20 + 72);
      v25(v22, v24 + v26 * v14, v19);
      sub_2496F31B8(&qword_2696CBA98);
      uint64_t result = sub_2496F9920();
      uint64_t v27 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v9 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v28) & ~*(void *)(v9 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v33 = *(void *)(v9 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v12 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v25)(*(void *)(v4 + 48) + v12 * v26, v22, v19);
      ++*(void *)(v4 + 16);
      int64_t v11 = v40;
      uint64_t v2 = v23;
    }
  }
  uint64_t result = swift_release();
  *id v1 = v4;
  return result;
}

unint64_t sub_2496EFE28(uint64_t a1, uint64_t a2)
{
  sub_2496F9AF0();
  unint64_t result = sub_2496F9B60();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_2496EFEAC(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_2496EF7C8();
  }
  else
  {
    if (v7 > v6)
    {
      sub_2496F0298();
      goto LABEL_14;
    }
    sub_2496F06EC();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_2496F9AF0();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_2496E5150(0, &qword_2696CBA28);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_2496F9B00();

    if (v12)
    {
LABEL_13:
      sub_2496F9D70();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_2496F9B00();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

uint64_t sub_2496F0034(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v29 = a1;
  unint64_t v5 = *(void *)(*v3 + 16);
  unint64_t v6 = *(void *)(*v3 + 24);
  if (v6 > v5 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_2496EFA68();
  }
  else
  {
    if (v6 > v5)
    {
      sub_2496F0444();
      goto LABEL_12;
    }
    sub_2496F0968();
  }
  uint64_t v7 = *v3;
  uint64_t v8 = sub_2496F9640();
  sub_2496F31B8(&qword_2696CBA98);
  uint64_t v9 = sub_2496F9920();
  uint64_t v10 = -1 << *(unsigned char *)(v7 + 32);
  a2 = v9 & ~v10;
  uint64_t v27 = v7 + 56;
  uint64_t v28 = v7;
  if ((*(void *)(v7 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v26 = ~v10;
    id v11 = *(void **)(v8 - 8);
    char v12 = (void (*)(char *, unint64_t, uint64_t))v11[2];
    uint64_t v13 = v11[8];
    uint64_t v14 = v11[9];
    char v15 = (uint64_t (**)(char *, uint64_t))(v11 + 1);
    do
    {
      MEMORY[0x270FA5388](v9);
      v12((char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), *(void *)(v28 + 48) + v14 * a2, v8);
      sub_2496F31B8(&qword_2696CBAA0);
      char v16 = sub_2496F9930();
      uint64_t v9 = (*v15)((char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
      if (v16) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v26;
    }
    while (((*(void *)(v27 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v17 = *v25;
  *(void *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t v18 = *(void *)(v17 + 48);
  uint64_t v19 = sub_2496F9640();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * a2, v29, v19);
  uint64_t v21 = *(void *)(v17 + 16);
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (!v22)
  {
    *(void *)(v17 + 16) = v23;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_2496F9D70();
  __break(1u);
  return result;
}

id sub_2496F0298()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA88);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2496F9BE0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *id v1 = v4;
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
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
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

void *sub_2496F0444()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBAA8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2496F9BE0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_30:
    *id v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
  unint64_t v6 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  uint64_t v24 = v1;
  BOOL v25 = (const void *)(v2 + 56);
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v6) {
    id result = memmove(result, v25, 8 * v6);
  }
  int64_t v8 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v9 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(v2 + 56);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v8 << 6);
      goto LABEL_12;
    }
    int64_t v21 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v12) {
      goto LABEL_28;
    }
    unint64_t v22 = *((void *)v25 + v21);
    ++v8;
    if (!v22)
    {
      int64_t v8 = v21 + 1;
      if (v21 + 1 >= v12) {
        goto LABEL_28;
      }
      unint64_t v22 = *((void *)v25 + v8);
      if (!v22)
      {
        int64_t v8 = v21 + 2;
        if (v21 + 2 >= v12) {
          goto LABEL_28;
        }
        unint64_t v22 = *((void *)v25 + v8);
        if (!v22) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v11 = (v22 - 1) & v22;
    unint64_t v14 = __clz(__rbit64(v22)) + (v8 << 6);
LABEL_12:
    uint64_t v15 = sub_2496F9640();
    uint64_t v16 = *(void *)(v15 - 8);
    MEMORY[0x270FA5388](v15);
    int64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    unint64_t v20 = *(void *)(v19 + 72) * v14;
    (*(void (**)(char *, unint64_t, uint64_t))(v16 + 16))(v18, *(void *)(v2 + 48) + v20, v15);
    id result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v16 + 32))(*(void *)(v4 + 48) + v20, v18, v15);
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v12)
  {
LABEL_28:
    id result = (void *)swift_release();
    id v1 = v24;
    goto LABEL_30;
  }
  unint64_t v22 = *((void *)v25 + v23);
  if (v22)
  {
    int64_t v8 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v8 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v8 >= v12) {
      goto LABEL_28;
    }
    unint64_t v22 = *((void *)v25 + v8);
    ++v23;
    if (v22) {
      goto LABEL_27;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_2496F06EC()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA88);
  uint64_t v3 = sub_2496F9BF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *id v1 = v4;
    return result;
  }
  uint64_t v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_2496F9AF0();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    id v1 = v27;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2496F0968()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBAA8);
  uint64_t v3 = sub_2496F9BF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *id v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = *(void *)(v2 + 56);
  uint64_t v35 = v0;
  uint64_t v36 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & v6;
  int64_t v37 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  for (int64_t i = 0; ; int64_t i = v38)
  {
    if (v8)
    {
      unint64_t v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      int64_t v38 = i;
      unint64_t v14 = v13 | (i << 6);
      goto LABEL_24;
    }
    int64_t v15 = i + 1;
    if (__OFADD__(i, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v37) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v36 + 8 * v15);
    int64_t v17 = i + 1;
    if (!v16)
    {
      int64_t v17 = i + 2;
      if (i + 2 >= v37) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v36 + 8 * v17);
      if (!v16)
      {
        int64_t v17 = i + 3;
        if (i + 3 >= v37) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v36 + 8 * v17);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v16 - 1) & v16;
    int64_t v38 = v17;
    unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
LABEL_24:
    uint64_t v19 = sub_2496F9640();
    uint64_t v20 = *(void *)(v19 - 8);
    MEMORY[0x270FA5388](v19);
    unint64_t v22 = (char *)&v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v24 = v23;
    uint64_t v25 = v2;
    uint64_t v26 = *(void *)(v2 + 48);
    uint64_t v27 = *(void *)(v24 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v20 + 16))(v22, v26 + v27 * v14, v19);
    sub_2496F31B8(&qword_2696CBA98);
    uint64_t result = sub_2496F9920();
    uint64_t v28 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v9 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v29) & ~*(void *)(v9 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v9 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v12 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v20 + 32))(*(void *)(v4 + 48) + v12 * v27, v22, v19);
    ++*(void *)(v4 + 16);
    uint64_t v2 = v25;
  }
  uint64_t v18 = i + 4;
  if (i + 4 >= v37)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    id v1 = v35;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v36 + 8 * v18);
  if (v16)
  {
    int64_t v17 = i + 4;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v17 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v17 >= v37) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v36 + 8 * v17);
    ++v18;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2496F0D04(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBAB8);
    uint64_t v2 = sub_2496F9D20();
    uint64_t v18 = v2;
    sub_2496F9CB0();
    uint64_t v3 = sub_2496F9CD0();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_2496E5150(0, &qword_2696CBA28);
      do
      {
        swift_dynamicCast();
        sub_2496E5150(0, &qword_2696CBAB0);
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_2496F12BC(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        uint64_t result = sub_2496F9AF0();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_2496F9CD0();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE80];
  }
  return v2;
}

uint64_t sub_2496F0F58(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA78);
  char v42 = a2;
  uint64_t v6 = sub_2496F9D10();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  unint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v40) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v41 + 8 * v22);
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v41 + 8 * v13);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v41 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v41 + 8 * v13);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    unint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(v5 + 56) + 40 * v21;
    int v34 = *(_DWORD *)(v33 + 16);
    long long v43 = *(_OWORD *)(v33 + 24);
    long long v44 = *(_OWORD *)v33;
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v35 = (id)v44;
      id v36 = *((id *)&v44 + 1);
      id v37 = (id)v43;
    }
    sub_2496F9DD0();
    sub_2496F9960();
    uint64_t result = sub_2496F9DF0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v16 == v27;
        if (v16 == v27) {
          unint64_t v16 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      unint64_t v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v32;
    v18[1] = v31;
    uint64_t v19 = *(void *)(v7 + 56) + 40 * v17;
    *(_OWORD *)uint64_t v19 = v44;
    *(_DWORD *)(v19 + 16) = v34;
    *(_OWORD *)(v19 + 24) = v43;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2496F12BC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBAB8);
  uint64_t v6 = sub_2496F9D10();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  id v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    uint64_t result = sub_2496F9AF0();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

id sub_2496F1590()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA78);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2496F9D00();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *id v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v30 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v30 >= v13) {
      goto LABEL_26;
    }
    unint64_t v31 = *(void *)(v6 + 8 * v30);
    ++v9;
    if (!v31)
    {
      int64_t v9 = v30 + 1;
      if (v30 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v31 = *(void *)(v6 + 8 * v9);
      if (!v31) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v31 - 1) & v31;
    unint64_t v15 = __clz(__rbit64(v31)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    uint64_t v20 = 40 * v15;
    uint64_t v21 = *(void *)(v2 + 56) + v20;
    int v22 = *(_DWORD *)(v21 + 16);
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    long long v24 = *(_OWORD *)(v21 + 24);
    long long v33 = *(_OWORD *)v21;
    long long v25 = *(_OWORD *)v21;
    void *v23 = v18;
    v23[1] = v19;
    uint64_t v26 = *(void *)(v4 + 56) + v20;
    *(_OWORD *)uint64_t v26 = v25;
    *(_DWORD *)(v26 + 16) = v22;
    *(_OWORD *)(v26 + 24) = v24;
    unint64_t v27 = (void *)v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v28 = (id)v33;
    id v29 = *((id *)&v33 + 1);
    id result = v27;
  }
  int64_t v32 = v30 + 2;
  if (v32 >= v13) {
    goto LABEL_26;
  }
  unint64_t v31 = *(void *)(v6 + 8 * v32);
  if (v31)
  {
    int64_t v9 = v32;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v31 = *(void *)(v6 + 8 * v9);
    ++v32;
    if (v31) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2496F179C()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBAB8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2496F9D00();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *id v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2496F1944(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  swift_unknownObjectWeakInit();
  *(void *)&v4[OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation__requestPerformer] = 0;
  swift_unknownObjectWeakAssign();
  uint64_t v8 = v4;
  id v9 = objc_msgSend(a4, sel_impl);
  sub_2496F9B30();
  swift_unknownObjectRelease();
  type metadata accessor for PendingReminderTracker();
  swift_dynamicCast();
  *(void *)&v8[OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_changeTracker] = v13;
  *(void *)&v8[OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_eventStore] = a1;
  *(void *)&v8[OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_alertDisplayer] = a2;
  id v10 = a1;
  swift_unknownObjectRetain();

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for CUIKIReminderEditorImplementation();
  return objc_msgSendSuper2(&v12, sel_init);
}

id sub_2496F1A5C(void *a1)
{
  id v1 = objc_msgSend(a1, sel_uniqueID);
  if (!v1)
  {
    if (qword_26B160DA8 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_2496F9900();
    __swift_project_value_buffer(v18, (uint64_t)qword_26B160E10);
    id v19 = sub_2496F98E0();
    os_log_type_t v20 = sub_2496F9AB0();
    if (os_log_type_enabled(v19, v20))
    {
      unint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v21 = 0;
      _os_log_impl(&dword_2496DE000, v19, v20, "skipping event with nil uniqueID", v21, 2u);
      MEMORY[0x24C5A9F00](v21, -1, -1);
    }

    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_2496F9950();
  unint64_t v5 = v4;

  uint64_t v6 = sub_2496F9460();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBAF0);
  MEMORY[0x270FA5388](v10 - 8);
  objc_super v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496F9450();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) == 1)
  {
    sub_2496E44D4((uint64_t)v12, &qword_2696CBAF0);
    if (qword_26B160DA8 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_2496F9900();
    __swift_project_value_buffer(v13, (uint64_t)qword_26B160E10);
    swift_bridgeObjectRetain();
    unint64_t v14 = sub_2496F98E0();
    os_log_type_t v15 = sub_2496F9AB0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v33 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_2496F6E70(v3, v5, &v33);
      sub_2496F9B10();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2496DE000, v14, v15, "event ID %s is not a valid reminder ID", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5A9F00](v17, -1, -1);
      MEMORY[0x24C5A9F00](v16, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v12, v6);
  int64_t v22 = (void *)sub_2496F9430();
  id v23 = objc_msgSend(self, sel_objectIDWithURL_, v22);

  if (!v23)
  {
    if (qword_26B160DA8 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_2496F9900();
    __swift_project_value_buffer(v24, (uint64_t)qword_26B160E10);
    swift_bridgeObjectRetain();
    long long v25 = sub_2496F98E0();
    os_log_type_t v26 = sub_2496F9AB0();
    if (os_log_type_enabled(v25, v26))
    {
      unint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v33 = v31;
      *(_DWORD *)unint64_t v27 = 136315138;
      int64_t v30 = v27 + 4;
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_2496F6E70(v3, v5, &v33);
      sub_2496F9B10();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2496DE000, v25, v26, "event ID %s is not a valid reminder ID", v27, 0xCu);
      uint64_t v28 = v31;
      swift_arrayDestroy();
      MEMORY[0x24C5A9F00](v28, -1, -1);
      MEMORY[0x24C5A9F00](v27, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return 0;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_2496F2010(unint64_t a1)
{
  unint64_t v1 = a1;
  uint64_t v13 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      unint64_t v4 = v1 & 0xC000000000000001;
      uint64_t v5 = v1 & 0xFFFFFFFFFFFFFF8;
      uint64_t v6 = *MEMORY[0x263F2FDC8];
      unint64_t v12 = v1;
      while (v4)
      {
        id v7 = (id)MEMORY[0x24C5A9840](v3, v1);
LABEL_9:
        uint64_t v8 = v7;
        unint64_t v9 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_17;
        }
        id v10 = sub_2496F1A5C(v7);

        if (v10
          && objc_msgSend(v8, sel__hasChangesForKey_, v6)
          && (objc_msgSend(v8, sel_completed) & 1) != 0)
        {
          sub_2496F9C60();
          sub_2496F9C90();
          unint64_t v1 = v12;
          sub_2496F9CA0();
          sub_2496F9C70();
        }
        else
        {
        }
        ++v3;
        if (v9 == v2) {
          return v13;
        }
      }
      if (v3 < *(void *)(v5 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v2 = sub_2496F9CF0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v7 = *(id *)(v1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_2496F21BC(unint64_t a1)
{
  unint64_t v1 = a1;
  uint64_t v13 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      unint64_t v4 = v1 & 0xC000000000000001;
      uint64_t v5 = v1 & 0xFFFFFFFFFFFFFF8;
      uint64_t v6 = *MEMORY[0x263F2FDC8];
      unint64_t v12 = v1;
      while (v4)
      {
        id v7 = (id)MEMORY[0x24C5A9840](v3, v1);
LABEL_9:
        uint64_t v8 = v7;
        unint64_t v9 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_17;
        }
        id v10 = sub_2496F1A5C(v7);

        if (v10
          && objc_msgSend(v8, sel__hasChangesForKey_, v6)
          && (objc_msgSend(v8, sel_completed) & 1) == 0)
        {
          sub_2496F9C60();
          sub_2496F9C90();
          unint64_t v1 = v12;
          sub_2496F9CA0();
          sub_2496F9C70();
        }
        else
        {
        }
        ++v3;
        if (v9 == v2) {
          return v13;
        }
      }
      if (v3 < *(void *)(v5 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v2 = sub_2496F9CF0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v7 = *(id *)(v1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

unint64_t sub_2496F2368()
{
  unint64_t result = qword_2696CB9E0;
  if (!qword_2696CB9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2696CB9E0);
  }
  return result;
}

uint64_t sub_2496F23BC()
{
  uint64_t v1 = sub_2496F93F0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, (v6 + 11) & 0xFFFFFFFFFFFFFFF8 | 4, v5);
}

uint64_t sub_2496F24CC(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_2496F93F0() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[4];
  uint64_t v10 = v1[5];
  uint64_t v11 = (uint64_t)v1 + v5;
  uint64_t v12 = *(void *)((char *)v1 + v6);
  uint64_t v13 = *(void *)((char *)v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  unint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v14;
  *unint64_t v14 = v2;
  v14[1] = sub_2496EE688;
  return sub_2496E8030(a1, v7, v8, v9, v10, v11, v12, v13);
}

uint64_t sub_2496F2630()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2496F2668(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_2496F3570;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2696CB9F8 + dword_2696CB9F8);
  return v6(a1, v4);
}

uint64_t sub_2496F2720()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2496F2778(uint64_t a1)
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
  v11[1] = sub_2496F3570;
  return sub_2496EB50C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t type metadata accessor for CUIKIReminderEditorImplementation()
{
  return self;
}

uint64_t sub_2496F2878@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_alertDisplayer);
  swift_beginAccess();
  *a2 = *v3;
  return swift_unknownObjectRetain();
}

uint64_t method lookup function for CUIKIReminderEditorImplementation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CUIKIReminderEditorImplementation);
}

uint64_t dispatch thunk of CUIKIReminderEditorImplementation.__allocating_init(eventStore:alertDisplayer:undoManager:changeTracker:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of CUIKIReminderEditorImplementation.alertDisplayer.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of CUIKIReminderEditorImplementation.alertDisplayer.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of CUIKIReminderEditorImplementation.alertDisplayer.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of CUIKIReminderEditorImplementation.saveChanges(toEvents:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of CUIKIReminderEditorImplementation.delete(_:completionHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

ValueMetadata *type metadata accessor for CUIKIReminderEditorImplementation.AlertDisplayerAdapter()
{
  return &type metadata for CUIKIReminderEditorImplementation.AlertDisplayerAdapter;
}

void sub_2496F2A28(uint64_t a1)
{
  sub_2496EDBCC(a1, *(void *)(v1 + 24), *(void **)(v1 + 32), *(void *)(v1 + 16));
}

uint64_t sub_2496F2A34()
{
  uint64_t v1 = *(void *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696CBA60);
  uint64_t v2 = sub_2496F9A40();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 24) & ~v4;
  uint64_t v6 = *(void *)(v1 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v5 + *(void *)(v3 + 64) + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v4 | v7 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, v2);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v1);
  return MEMORY[0x270FA0238](v0, v9, v10);
}

uint64_t sub_2496F2B5C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696CBA60);
  uint64_t v1 = *(void *)(sub_2496F9A40() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_2496EE474(v2);
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

uint64_t sub_2496F2C58()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696CBA60);
  uint64_t v1 = sub_2496F9A40();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2496F2D08()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696CBA60);
  sub_2496F9A40();
  return sub_2496EE554();
}

unint64_t sub_2496F2D94()
{
  unint64_t result = qword_2696CBA70;
  if (!qword_2696CBA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696CBA70);
  }
  return result;
}

uint64_t sub_2496F2DE8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2496F2E44(uint64_t a1)
{
  return a1;
}

uint64_t sub_2496F2E98(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_2496F9CF0();
    swift_bridgeObjectRelease();
  }
  sub_2496E5150(0, &qword_2696CBA28);
  sub_2496F2FEC();
  uint64_t result = sub_2496F9A90();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_2496F9CF0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)MEMORY[0x24C5A9840](i, a1);
        sub_2496EF008(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_2496EF008(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_2496F2FEC()
{
  unint64_t result = qword_2696CBA80;
  if (!qword_2696CBA80)
  {
    sub_2496E5150(255, &qword_2696CBA28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696CBA80);
  }
  return result;
}

uint64_t sub_2496F3048(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = sub_2496F9640();
  sub_2496F31B8(&qword_2696CBA98);
  uint64_t result = sub_2496F9A90();
  uint64_t v16 = result;
  if (v2)
  {
    uint64_t v5 = *(void *)(v3 - 8);
    uint64_t v6 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v14[1] = v5 + 16;
    os_log_type_t v15 = v6;
    uint64_t v7 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v8 = *(void *)(v5 + 64);
    v14[0] = *(void *)(v5 + 72);
    id v9 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
    do
    {
      uint64_t v10 = MEMORY[0x270FA5388](result);
      uint64_t v11 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      MEMORY[0x270FA5388](v10);
      uint64_t v13 = (char *)v14 - v12;
      v15((char *)v14 - v12, v7, v3);
      sub_2496EF2A8(v11, v13);
      uint64_t result = (*v9)(v11, v3);
      v7 += v14[0];
      --v2;
    }
    while (v2);
    return v16;
  }
  return result;
}

uint64_t sub_2496F31B8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2496F9640();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2496F31FC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2496F3234(char a1, uint64_t a2)
{
  sub_2496EC72C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_2496F323C()
{
  return swift_release();
}

uint64_t sub_2496F3244(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_2496F32A8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2496F32B8()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2496F3308(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_2496EE688;
  return sub_2496E90A4(a1, v4, v5, v6, v7, v8, v9);
}

uint64_t getEnumTagSinglePayload for CUIKIReminderEditorImplementation.AlertDisplayerAdapter.CUIKReminderEditorAlertErrors(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for CUIKIReminderEditorImplementation.AlertDisplayerAdapter.CUIKReminderEditorAlertErrors(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2496F34D4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2496F34FC()
{
  return 0;
}

ValueMetadata *type metadata accessor for CUIKIReminderEditorImplementation.AlertDisplayerAdapter.CUIKReminderEditorAlertErrors()
{
  return &type metadata for CUIKIReminderEditorImplementation.AlertDisplayerAdapter.CUIKReminderEditorAlertErrors;
}

unint64_t sub_2496F351C()
{
  unint64_t result = qword_2696CBB00;
  if (!qword_2696CBB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696CBB00);
  }
  return result;
}

char *PendingReminderTracker.__allocating_init(eventStore:)(void *a1)
{
  int v3 = (char *)objc_allocWithZone(v1);
  uint64_t v4 = OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_trackedEvents;
  uint64_t v5 = v3;
  *(void *)&v3[v4] = sub_2496E8F3C(MEMORY[0x263F8EE78]);
  *(void *)&v5[OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_eventStore] = a1;
  id v6 = a1;

  v12.receiver = v5;
  v12.super_class = v1;
  id v7 = objc_msgSendSuper2(&v12, sel_init);
  char v8 = self;
  uint64_t v9 = (char *)v7;
  id v10 = objc_msgSend(v8, sel_defaultCenter);
  objc_msgSend(v10, sel_addObserver_selector_name_object_, v9, sel_eventStoreDidChange_, *MEMORY[0x263F04AD8], *(void *)&v9[OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_eventStore]);

  return v9;
}

char *PendingReminderTracker.init(eventStore:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_trackedEvents;
  uint64_t v4 = v1;
  *(void *)&v1[v3] = sub_2496E8F3C(MEMORY[0x263F8EE78]);
  *(void *)&v4[OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_eventStore] = a1;
  id v5 = a1;

  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for PendingReminderTracker();
  id v6 = objc_msgSendSuper2(&v11, sel_init);
  id v7 = self;
  char v8 = (char *)v6;
  id v9 = objc_msgSend(v7, sel_defaultCenter);
  objc_msgSend(v9, sel_addObserver_selector_name_object_, v8, sel_eventStoreDidChange_, *MEMORY[0x263F04AD8], *(void *)&v8[OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_eventStore]);

  return v8;
}

uint64_t type metadata accessor for PendingReminderTracker()
{
  return self;
}

id sub_2496F37C4(void *a1, int a2)
{
  uint64_t v3 = v2;
  sub_2496F4370(a1, a2, 1, v3);
  id result = objc_msgSend(a1, sel_objectID);
  if (result)
  {
    id v6 = result;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA10);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_2496FA8E0;
    *(void *)(v7 + 32) = v6;
    uint64_t v9 = v7;
    sub_2496F99B0();
    id v8 = v6;
    sub_2496F5BF8(v9);

    return (id)swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2496F397C(void *a1, int a2, void *a3)
{
  id v6 = a1;
  id v7 = a3;
  sub_2496F81F8(v6, a2, 1, v3, v6, v7);
}

void sub_2496F39F4(uint64_t a1, void *a2, void *a3)
{
  if (qword_26B160DA8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2496F9900();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B160E10);
  id v7 = a2;
  id v8 = sub_2496F98E0();
  os_log_type_t v9 = sub_2496F9AA0();
  if (os_log_type_enabled(v8, v9))
  {
    id v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v19 = v11;
    *(_DWORD *)id v10 = 136315138;
    id v12 = objc_msgSend(v7, sel_uniqueID);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = sub_2496F9950();
      unint64_t v16 = v15;
    }
    else
    {
      uint64_t v14 = 0;
      unint64_t v16 = 0xE000000000000000;
    }
    sub_2496F6E70(v14, v16, &v19);
    sub_2496F9B10();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2496DE000, v8, v9, "Saving optimistic result for %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5A9F00](v11, -1, -1);
    MEMORY[0x24C5A9F00](v10, -1, -1);
  }
  else
  {
  }
  uint64_t v17 = *(void **)(a1 + 24);
  id v18 = a3;

  *(void *)(a1 + 24) = a3;
}

uint64_t sub_2496F3C70(void *a1)
{
  uint64_t v7 = 0;
  long long v5 = 0u;
  long long v6 = 0u;
  sub_2496F4E3C(a1, 0, 0, v1, (uint64_t)&v5);
  uint64_t v2 = (void *)v5;
  if (!(void)v5) {
    return 0;
  }
  uint64_t v3 = *((void *)&v6 + 1);

  swift_bridgeObjectRelease();
  return v3;
}

void sub_2496F3D94(void *a1, char a2)
{
  uint64_t v3 = v2;
  id v6 = objc_msgSend(a1, sel_originalItem);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = objc_msgSend(v6, sel_uniqueID);
    if (v8)
    {
      os_log_type_t v9 = v8;
      uint64_t v10 = sub_2496F9950();
      unint64_t v12 = v11;

      goto LABEL_6;
    }
  }
  else
  {
    id v13 = objc_msgSend(a1, sel_uniqueID);
    if (v13)
    {
      uint64_t v7 = v13;
      uint64_t v10 = sub_2496F9950();
      unint64_t v12 = v14;
LABEL_6:

      unint64_t v15 = (uint64_t *)(v3 + OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_trackedEvents);
      swift_beginAccess();
      uint64_t v16 = *v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2496F426C(v10, v12, v16, v31);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2496F9298((uint64_t)v31, (uint64_t)v33, &qword_2696CBB30);
      if (*(void *)&v33[0])
      {
        long long v35 = v33[0];
        long long v36 = v33[1];
        unint64_t v37 = v34;
        swift_beginAccess();
        sub_2496F74C8(v10, v12, (uint64_t)v32);
        swift_endAccess();
        sub_2496F8D54((uint64_t)v32);
        swift_bridgeObjectRelease();
        uint64_t v17 = (void *)v35;
        sub_2496F7B10((void *)v35, v37, a2 & 1);

        sub_2496F9298((uint64_t)&v36 + 8, (uint64_t)v30, &qword_2696CBB38);
        sub_2496F8DE0(v30);
        swift_bridgeObjectRelease();
      }
      else
      {
        if (qword_2696CB830 != -1) {
          swift_once();
        }
        uint64_t v24 = sub_2496F9900();
        __swift_project_value_buffer(v24, (uint64_t)qword_2696CBB58);
        swift_bridgeObjectRetain();
        long long v25 = sub_2496F98E0();
        os_log_type_t v26 = sub_2496F9AC0();
        if (os_log_type_enabled(v25, v26))
        {
          unint64_t v27 = (uint8_t *)swift_slowAlloc();
          uint64_t v28 = swift_slowAlloc();
          *(void *)&long long v35 = v28;
          *(_DWORD *)unint64_t v27 = 136446210;
          swift_bridgeObjectRetain();
          v32[0] = sub_2496F6E70(v10, v12, (uint64_t *)&v35);
          sub_2496F9B10();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2496DE000, v25, v26, "Ignoring attempt to reset event not tracked with id %{public}s", v27, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C5A9F00](v28, -1, -1);
          MEMORY[0x24C5A9F00](v27, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
      }
      return;
    }
  }
  if (qword_26B160DA8 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_2496F9900();
  __swift_project_value_buffer(v18, (uint64_t)qword_26B160E10);
  id v29 = a1;
  uint64_t v19 = sub_2496F98E0();
  os_log_type_t v20 = sub_2496F9AB0();
  if (os_log_type_enabled(v19, v20))
  {
    unint64_t v21 = (uint8_t *)swift_slowAlloc();
    int64_t v22 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v21 = 138412290;
    *(void *)&long long v35 = v29;
    id v23 = v29;
    sub_2496F9B10();
    *int64_t v22 = v29;

    _os_log_impl(&dword_2496DE000, v19, v20, "Ignoring attempt to reset event with no uniqueID (%@)", v21, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA08);
    swift_arrayDestroy();
    MEMORY[0x24C5A9F00](v22, -1, -1);
    MEMORY[0x24C5A9F00](v21, -1, -1);
  }
  else
  {
  }
}

unint64_t sub_2496F426C@<X0>(unint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (id result = sub_2496EEC40(result, a2), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a3 + 56) + 40 * result;
    id v8 = *(void **)v7;
    os_log_type_t v9 = *(void **)(v7 + 8);
    uint64_t v10 = *(unsigned int *)(v7 + 16);
    unint64_t v12 = *(void **)(v7 + 24);
    uint64_t v11 = *(void *)(v7 + 32);
    swift_bridgeObjectRetain();
    id v13 = v8;
    id v14 = v9;
    id result = v12;
  }
  else
  {
    id v8 = 0;
    os_log_type_t v9 = 0;
    uint64_t v10 = 0;
    unint64_t v12 = 0;
    uint64_t v11 = 0;
  }
  *a4 = v8;
  a4[1] = v9;
  a4[2] = v10;
  a4[3] = v12;
  a4[4] = v11;
  return result;
}

void sub_2496F4370(void *a1, int a2, char a3, uint64_t a4)
{
  id v8 = objc_msgSend(a1, sel_originalItem);
  os_log_type_t v9 = v8;
  if (v8)
  {
    id v10 = objc_msgSend(v8, sel_uniqueID);
    if (v10)
    {
      uint64_t v11 = v10;
      int v72 = a2;
      unint64_t v12 = sub_2496F9950();
      uint64_t v14 = v13;

      unint64_t v15 = v9;
LABEL_6:

      uint64_t v18 = (uint64_t *)(a4 + OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_trackedEvents);
      swift_beginAccess();
      uint64_t v19 = *v18;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v71 = v12;
      sub_2496F426C(v12, v14, v19, v79);
      os_log_type_t v20 = (void *)v79[0];
      unint64_t v21 = (void *)v79[1];
      uint64_t v22 = v79[2];
      id v23 = (void *)v79[3];
      uint64_t v24 = (void *)v14;
      unint64_t v25 = v79[4];
      id v73 = v24;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2496F9298((uint64_t)v79, (uint64_t)v82, &qword_2696CBB30);
      if (v82[0])
      {
        *(void *)&long long v76 = v20;
        *((void *)&v76 + 1) = v21;
        *((void *)&v77 + 1) = v23;
        unint64_t v78 = v25;
        if (a3)
        {
          uint64_t v26 = v22;
          uint64_t v70 = a1;
          goto LABEL_18;
        }

        swift_bridgeObjectRelease();
LABEL_50:
        swift_bridgeObjectRelease();
        return;
      }
      if ((a3 & 1) == 0) {
        goto LABEL_50;
      }
      uint64_t v70 = a1;
      id v34 = a1;
      sub_2496F796C(v34, v80);
      os_log_type_t v20 = (void *)v80[0];
      unint64_t v21 = (void *)v80[1];
      uint64_t v26 = v80[2];
      id v23 = (void *)v80[3];
      unint64_t v35 = v80[4];
      sub_2496F9298((uint64_t)v80, (uint64_t)v81, &qword_2696CBB30);
      if (v81[0])
      {
        *(void *)&long long v76 = v20;
        *((void *)&v76 + 1) = v21;
        *((void *)&v77 + 1) = v23;
        unint64_t v78 = v35;
LABEL_18:
        if (v26)
        {
          sub_2496F923C(v20, v21, v26, v23);
          if (v26 == v72)
          {
            swift_bridgeObjectRetain();
            id v36 = v20;
            id v37 = v21;
            id v38 = v23;
LABEL_41:
            swift_beginAccess();
            LODWORD(v77) = v72;
            if (v9)
            {
              if (v78)
              {
                swift_bridgeObjectRetain();
                if ((sub_2496F5A70((uint64_t)v70, v78) & 1) == 0)
                {
                  *(void *)&long long v83 = v78;
                  id v59 = v70;
                  MEMORY[0x24C5A9580]();
                  if (*(void *)((v83 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v83 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                    sub_2496F99D0();
                  }
                  sub_2496F99F0();
                  sub_2496F99B0();
                  unint64_t v78 = v83;
                }
              }
              else
              {
                __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA10);
                uint64_t v60 = swift_allocObject();
                *(_OWORD *)(v60 + 16) = xmmword_2496FA8E0;
                *(void *)(v60 + 32) = v70;
                *(void *)&long long v83 = v60;
                sub_2496F99B0();
                unint64_t v78 = v83;
                id v61 = v70;
              }
              swift_bridgeObjectRelease();
            }
            long long v83 = v76;
            long long v84 = v77;
            unint64_t v85 = v78;
            sub_2496F9298((uint64_t)&v84 + 8, (uint64_t)&v86, &qword_2696CBB38);
            sub_2496F9298((uint64_t)&v85, (uint64_t)v87, &qword_2696CBB48);
            swift_beginAccess();
            id v62 = (id)v76;
            id v63 = *((id *)&v76 + 1);
            sub_2496F92FC(&v86);
            sub_2496F9328((uint64_t)v87);
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v75 = *v18;
            *uint64_t v18 = 0x8000000000000000;
            sub_2496F77C4((uint64_t)&v83, v71, (uint64_t)v73, isUniquelyReferenced_nonNull_native);
            *uint64_t v18 = v75;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_endAccess();
            sub_2496F8D88(v20, v21, v26, v23);

            swift_bridgeObjectRelease();
            goto LABEL_50;
          }
          uint64_t v47 = qword_26B160DA8;
          id v48 = v20;
          id v49 = v21;
          id v50 = v23;
          swift_bridgeObjectRetain();
          if (v47 != -1) {
            swift_once();
          }
          uint64_t v51 = sub_2496F9900();
          __swift_project_value_buffer(v51, (uint64_t)qword_26B160E10);
          swift_bridgeObjectRetain_n();
          uint64_t v52 = sub_2496F98E0();
          os_log_type_t loga = sub_2496F9AA0();
          if (os_log_type_enabled(v52, loga))
          {
            uint64_t v67 = v52;
            uint64_t v53 = swift_slowAlloc();
            uint64_t v65 = swift_slowAlloc();
            *(void *)&long long v83 = v65;
            *(_DWORD *)uint64_t v53 = 67109634;
            swift_beginAccess();
            sub_2496F9B10();
            *(_WORD *)(v53 + 8) = 1024;
            sub_2496F9B10();
            *(_WORD *)(v53 + 14) = 2080;
            swift_bridgeObjectRetain();
            sub_2496F6E70(v71, (unint64_t)v73, (uint64_t *)&v83);
            sub_2496F9B10();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_2496DE000, v67, loga, "Updating tracked sequence number (%d->%d) for %s", (uint8_t *)v53, 0x18u);
            swift_arrayDestroy();
            MEMORY[0x24C5A9F00](v65, -1, -1);
            MEMORY[0x24C5A9F00](v53, -1, -1);

            goto LABEL_41;
          }
        }
        else
        {
          sub_2496F923C(v20, v21, v26, v23);
          uint64_t v39 = qword_26B160DA8;
          id v40 = v20;
          id v41 = v21;
          id v42 = v23;
          swift_bridgeObjectRetain();
          if (v39 != -1) {
            swift_once();
          }
          uint64_t v43 = sub_2496F9900();
          __swift_project_value_buffer(v43, (uint64_t)qword_26B160E10);
          swift_bridgeObjectRetain_n();
          long long v44 = sub_2496F98E0();
          os_log_type_t v45 = sub_2496F9AA0();
          os_log_t log = v44;
          if (os_log_type_enabled(v44, v45))
          {
            id v46 = (uint8_t *)swift_slowAlloc();
            uint64_t v66 = swift_slowAlloc();
            *(void *)&long long v83 = v66;
            *(_DWORD *)id v46 = 136446210;
            swift_bridgeObjectRetain();
            sub_2496F6E70(v71, (unint64_t)v73, (uint64_t *)&v83);
            sub_2496F9B10();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_2496DE000, log, v45, "Now tracking pending reminder with id %{public}s", v46, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24C5A9F00](v66, -1, -1);
            MEMORY[0x24C5A9F00](v46, -1, -1);

            goto LABEL_41;
          }
        }
        swift_bridgeObjectRelease_n();
        goto LABEL_41;
      }
      swift_bridgeObjectRelease();
      if (qword_26B160DA8 != -1) {
        swift_once();
      }
      uint64_t v54 = sub_2496F9900();
      __swift_project_value_buffer(v54, (uint64_t)qword_26B160E10);
      id v55 = v34;
      uint64_t v28 = sub_2496F98E0();
      os_log_type_t v56 = sub_2496F9AB0();
      if (os_log_type_enabled(v28, v56))
      {
        int64_t v30 = (uint8_t *)swift_slowAlloc();
        uint64_t v57 = (void *)swift_slowAlloc();
        *(_DWORD *)int64_t v30 = 138412290;
        *(void *)&long long v83 = v55;
        id v58 = v55;
        sub_2496F9B10();
        *uint64_t v57 = v55;

        _os_log_impl(&dword_2496DE000, v28, v56, "Couldn't create tracked event info for event %@", v30, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA08);
        swift_arrayDestroy();
        uint64_t v33 = v57;
        goto LABEL_14;
      }

      return;
    }
  }
  else
  {
    id v16 = objc_msgSend(a1, sel_uniqueID);
    if (v16)
    {
      unint64_t v15 = v16;
      int v72 = a2;
      unint64_t v12 = sub_2496F9950();
      uint64_t v14 = v17;
      goto LABEL_6;
    }
  }
  if (qword_26B160DA8 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_2496F9900();
  __swift_project_value_buffer(v27, (uint64_t)qword_26B160E10);
  id v74 = a1;
  uint64_t v28 = sub_2496F98E0();
  os_log_type_t v29 = sub_2496F9AB0();
  if (os_log_type_enabled(v28, v29))
  {
    int64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = (void *)swift_slowAlloc();
    *(_DWORD *)int64_t v30 = 138412290;
    *(void *)&long long v83 = v74;
    id v32 = v74;
    sub_2496F9B10();
    void *v31 = v74;

    _os_log_impl(&dword_2496DE000, v28, v29, "Ignoring pending event with no uniqueID (%@)", v30, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA08);
    swift_arrayDestroy();
    uint64_t v33 = v31;
LABEL_14:
    MEMORY[0x24C5A9F00](v33, -1, -1);
    MEMORY[0x24C5A9F00](v30, -1, -1);

    return;
  }
}

void sub_2496F4E3C(void *a1, int a2, char a3, uint64_t a4, uint64_t a5)
{
  id v10 = objc_msgSend(a1, sel_originalItem);
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = objc_msgSend(v10, sel_uniqueID);
    if (v12)
    {
      uint64_t v13 = v12;
      int v86 = a2;
      uint64_t v97 = a5;
      char v14 = a3;
      unint64_t v15 = sub_2496F9950();
      unint64_t v17 = v16;

      uint64_t v94 = v11;
      uint64_t v18 = v11;
LABEL_6:

      unint64_t v21 = (uint64_t *)(a4 + OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_trackedEvents);
      swift_beginAccess();
      uint64_t v22 = v21;
      uint64_t v23 = *v21;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v96 = v15;
      sub_2496F426C(v15, v17, v23, v104);
      unint64_t v25 = (void *)v104[0];
      uint64_t v24 = (void *)v104[1];
      uint64_t v26 = v104[2];
      uint64_t v27 = (void *)v104[3];
      unint64_t v28 = v104[4];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2496F9298((uint64_t)v104, (uint64_t)v107, &qword_2696CBB30);
      if (v107[0])
      {
        *(void *)&long long v101 = v25;
        *((void *)&v101 + 1) = v24;
        LODWORD(v102) = v26;
        *((void *)&v102 + 1) = v27;
        unint64_t v103 = v28;
        os_log_type_t v29 = v24;
        char v93 = v14;
        if ((v14 & 1) == 0)
        {
          unint64_t v85 = v22;
          uint64_t v44 = v97;
          uint64_t v92 = v17;
          uint64_t v90 = v26;
          sub_2496F923C(v25, v24, v26, v27);
          swift_bridgeObjectRetain();
          uint64_t v88 = v25;
          id v87 = v25;
          uint64_t v89 = v24;
          id v98 = v24;
          uint64_t v91 = v27;
          id v46 = v27;
LABEL_49:
          swift_beginAccess();
          long long v108 = v101;
          long long v109 = v102;
          unint64_t v110 = v103;
          sub_2496F9298((uint64_t)&v109 + 8, (uint64_t)v112, &qword_2696CBB38);
          sub_2496F9298((uint64_t)&v110, (uint64_t)v111, &qword_2696CBB48);
          id v74 = *(void **)v44;
          id v73 = *(void **)(v44 + 8);
          uint64_t v75 = *(void *)(v44 + 16);
          uint64_t v95 = *(void **)(v44 + 24);
          *(_OWORD *)uint64_t v44 = v101;
          *(void *)(v44 + 16) = v102;
          *(void *)(v44 + 24) = *((void *)&v102 + 1);
          *(void *)(v44 + 32) = v103;
          id v76 = (id)v101;
          id v77 = *((id *)&v101 + 1);
          sub_2496F92FC(v112);
          sub_2496F9328((uint64_t)v111);
          sub_2496F8D88(v74, v73, v75, v95);
          if (v93)
          {
            swift_beginAccess();
            id v78 = v76;
            id v79 = v77;
            sub_2496F92FC(v112);
            sub_2496F9328((uint64_t)v111);
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v100 = *v85;
            *unint64_t v85 = 0x8000000000000000;
            sub_2496F77C4((uint64_t)&v108, v96, v92, isUniquelyReferenced_nonNull_native);
            *unint64_t v85 = v100;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_endAccess();
            sub_2496F8D88(v88, v89, v90, v91);

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            sub_2496F8D88(v88, v89, v90, v91);

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_2496F8DE0(v112);
            sub_2496F9354((uint64_t)v111);
          }
          return;
        }
        id v98 = v24;
        int64_t v30 = v25;
        long long v84 = a1;
LABEL_18:
        uint64_t v90 = v26;
        uint64_t v91 = v27;
        unint64_t v85 = v22;
        uint64_t v88 = v25;
        uint64_t v89 = v29;
        if (v26)
        {
          sub_2496F923C(v25, v29, v26, v27);
          int v40 = v86;
          if (v26 == v86)
          {
            swift_bridgeObjectRetain();
            id v41 = v30;
            id v42 = v98;
            id v43 = v27;
            uint64_t v44 = v97;
            os_log_type_t v45 = v94;
            goto LABEL_41;
          }
          uint64_t v57 = qword_26B160DA8;
          id v58 = v30;
          id v59 = v98;
          id v60 = v27;
          swift_bridgeObjectRetain();
          uint64_t v44 = v97;
          os_log_type_t v45 = v94;
          if (v57 != -1) {
            swift_once();
          }
          uint64_t v61 = sub_2496F9900();
          __swift_project_value_buffer(v61, (uint64_t)qword_26B160E10);
          swift_bridgeObjectRetain_n();
          id v62 = sub_2496F98E0();
          os_log_type_t v63 = sub_2496F9AA0();
          if (os_log_type_enabled(v62, v63))
          {
            os_log_type_t v81 = v63;
            uint64_t v64 = swift_slowAlloc();
            uint64_t typea = swift_slowAlloc();
            *(void *)&long long v108 = typea;
            *(_DWORD *)uint64_t v64 = 67109634;
            swift_beginAccess();
            sub_2496F9B10();
            *(_WORD *)(v64 + 8) = 1024;
            sub_2496F9B10();
            *(_WORD *)(v64 + 14) = 2080;
            swift_bridgeObjectRetain();
            sub_2496F6E70(v96, v17, (uint64_t *)&v108);
            sub_2496F9B10();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_2496DE000, v62, v81, "Updating tracked sequence number (%d->%d) for %s", (uint8_t *)v64, 0x18u);
            swift_arrayDestroy();
            MEMORY[0x24C5A9F00](typea, -1, -1);
            MEMORY[0x24C5A9F00](v64, -1, -1);

            goto LABEL_41;
          }
        }
        else
        {
          sub_2496F923C(v25, v29, v26, v27);
          uint64_t v47 = qword_26B160DA8;
          id v48 = v30;
          id v49 = v98;
          id v50 = v27;
          swift_bridgeObjectRetain();
          if (v47 != -1) {
            swift_once();
          }
          uint64_t v51 = sub_2496F9900();
          __swift_project_value_buffer(v51, (uint64_t)qword_26B160E10);
          swift_bridgeObjectRetain_n();
          uint64_t v52 = sub_2496F98E0();
          os_log_type_t v53 = sub_2496F9AA0();
          uint64_t v44 = v97;
          int v40 = v86;
          os_log_type_t v45 = v94;
          if (os_log_type_enabled(v52, v53))
          {
            os_log_type_t type = v53;
            uint64_t v54 = (uint8_t *)swift_slowAlloc();
            *(void *)&long long v108 = swift_slowAlloc();
            uint64_t v55 = v108;
            *(_DWORD *)uint64_t v54 = 136446210;
            swift_bridgeObjectRetain();
            sub_2496F6E70(v96, v17, (uint64_t *)&v108);
            sub_2496F9B10();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_2496DE000, v52, type, "Now tracking pending reminder with id %{public}s", v54, 0xCu);
            swift_arrayDestroy();
            uint64_t v56 = v55;
            os_log_type_t v45 = v94;
            MEMORY[0x24C5A9F00](v56, -1, -1);
            MEMORY[0x24C5A9F00](v54, -1, -1);

            goto LABEL_41;
          }
        }
        swift_bridgeObjectRelease_n();
LABEL_41:
        swift_beginAccess();
        LODWORD(v102) = v40;
        uint64_t v92 = v17;
        id v87 = v30;
        if (v45)
        {
          if (v103)
          {
            swift_bridgeObjectRetain();
            if ((sub_2496F5A70((uint64_t)v84, v103) & 1) == 0)
            {
              *(void *)&long long v108 = v103;
              id v70 = v84;
              MEMORY[0x24C5A9580]();
              if (*(void *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_2496F99D0();
              }
              sub_2496F99F0();
              sub_2496F99B0();
              unint64_t v103 = v108;
            }
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA10);
            uint64_t v71 = swift_allocObject();
            *(_OWORD *)(v71 + 16) = xmmword_2496FA8E0;
            *(void *)(v71 + 32) = v84;
            *(void *)&long long v108 = v71;
            sub_2496F99B0();
            unint64_t v103 = v108;
            id v72 = v84;
          }
          swift_bridgeObjectRelease();
        }
        goto LABEL_49;
      }
      if ((v14 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        return;
      }
      char v93 = v14;
      id v38 = a1;
      sub_2496F796C(v38, v105);
      unint64_t v25 = (void *)v105[0];
      os_log_type_t v29 = (void *)v105[1];
      uint64_t v26 = v105[2];
      uint64_t v27 = (void *)v105[3];
      unint64_t v39 = v105[4];
      sub_2496F9298((uint64_t)v105, (uint64_t)v106, &qword_2696CBB30);
      if (v106[0])
      {
        long long v84 = a1;
        *(void *)&long long v101 = v25;
        *((void *)&v101 + 1) = v29;
        id v98 = v29;
        int64_t v30 = v25;
        *((void *)&v102 + 1) = v27;
        unint64_t v103 = v39;
        goto LABEL_18;
      }
      swift_bridgeObjectRelease();
      if (qword_26B160DA8 != -1) {
        swift_once();
      }
      uint64_t v65 = sub_2496F9900();
      __swift_project_value_buffer(v65, (uint64_t)qword_26B160E10);
      id v66 = v38;
      id v32 = sub_2496F98E0();
      os_log_type_t v67 = sub_2496F9AB0();
      if (!os_log_type_enabled(v32, v67))
      {

        return;
      }
      id v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v68 = (void *)swift_slowAlloc();
      *(_DWORD *)id v34 = 138412290;
      *(void *)&long long v108 = v66;
      id v69 = v66;
      sub_2496F9B10();
      *uint64_t v68 = v66;

      _os_log_impl(&dword_2496DE000, v32, v67, "Couldn't create tracked event info for event %@", v34, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA08);
      swift_arrayDestroy();
      id v37 = v68;
LABEL_14:
      MEMORY[0x24C5A9F00](v37, -1, -1);
      MEMORY[0x24C5A9F00](v34, -1, -1);

      return;
    }
  }
  else
  {
    id v19 = objc_msgSend(a1, sel_uniqueID);
    if (v19)
    {
      uint64_t v18 = v19;
      uint64_t v94 = 0;
      int v86 = a2;
      uint64_t v97 = a5;
      char v14 = a3;
      unint64_t v15 = sub_2496F9950();
      unint64_t v17 = v20;
      goto LABEL_6;
    }
  }
  if (qword_26B160DA8 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_2496F9900();
  __swift_project_value_buffer(v31, (uint64_t)qword_26B160E10);
  id v99 = a1;
  id v32 = sub_2496F98E0();
  os_log_type_t v33 = sub_2496F9AB0();
  if (os_log_type_enabled(v32, v33))
  {
    id v34 = (uint8_t *)swift_slowAlloc();
    unint64_t v35 = (void *)swift_slowAlloc();
    *(_DWORD *)id v34 = 138412290;
    *(void *)&long long v108 = v99;
    id v36 = v99;
    sub_2496F9B10();
    void *v35 = v99;

    _os_log_impl(&dword_2496DE000, v32, v33, "Ignoring pending event with no uniqueID (%@)", v34, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA08);
    swift_arrayDestroy();
    id v37 = v35;
    goto LABEL_14;
  }
}

uint64_t sub_2496F5A70(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_2496F9CF0())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)MEMORY[0x24C5A9840](0, a2);
LABEL_5:
      char v6 = v5;
      sub_2496E5150(0, &qword_2696CBAB0);
      char v7 = sub_2496F9B00();

      if (v7)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1) {
        goto LABEL_18;
      }
      if (v4) {
        break;
      }
      unint64_t v4 = 5;
      while (1)
      {
        unint64_t v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1)) {
          break;
        }
        id v13 = *(id *)(a2 + 8 * v4);
        char v14 = sub_2496F9B00();

        if (v14) {
          goto LABEL_6;
        }
        ++v4;
        if (v12 == v3) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    uint64_t v9 = 1;
    while (1)
    {
      MEMORY[0x24C5A9840](v9, a2);
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = sub_2496F9B00();
      swift_unknownObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
      ++v9;
      if (v10 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

void sub_2496F5BF8(uint64_t a1)
{
  sub_2496E8CEC(MEMORY[0x263F8EE78]);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBAC0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2496FAA50;
  sub_2496F9950();
  sub_2496F9BD0();
  *(void *)(inited + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBB50);
  *(void *)(inited + 72) = a1;
  sub_2496F9950();
  swift_bridgeObjectRetain();
  sub_2496F9BD0();
  *(void *)(inited + 168) = MEMORY[0x263F8D9D0];
  *(void *)(inited + 144) = 1;
  sub_2496F9950();
  sub_2496F9BD0();
  uint64_t v4 = MEMORY[0x263F8D4F8];
  *(void *)(inited + 240) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 216) = 1;
  sub_2496F9950();
  sub_2496F9BD0();
  *(void *)(inited + 312) = v4;
  *(unsigned char *)(inited + 288) = 0;
  swift_bridgeObjectRetain();
  sub_2496F9BD0();
  *(void *)(inited + 384) = v4;
  *(unsigned char *)(inited + 360) = 1;
  sub_2496E8CEC(inited);
  id v5 = objc_msgSend(self, sel_defaultCenter);
  uint64_t v6 = *MEMORY[0x263F04AD8];
  id v7 = *(id *)(v1 + OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_eventStore);
  id v8 = (void *)sub_2496F9910();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_postNotificationName_object_userInfo_, v6, v7, v8);
}

void sub_2496F5E50()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2496F93A0();
  if (v2)
  {
    uint64_t v3 = v2;
    v119[0] = qword_2696CBB10;
    v119[1] = (uint64_t)off_2696CBB18;
    swift_bridgeObjectRetain();
    sub_2496F9BD0();
    if (*(void *)(v3 + 16) && (unint64_t v4 = sub_2496EECB8((uint64_t)v122), (v5 & 1) != 0))
    {
      sub_2496F91E0(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v120);
    }
    else
    {
      long long v120 = 0u;
      long long v121 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_2496F2E44((uint64_t)v122);
    if (*((void *)&v121 + 1))
    {
      if swift_dynamicCast() && (v122[0]) {
        return;
      }
      goto LABEL_12;
    }
  }
  else
  {
    long long v120 = 0u;
    long long v121 = 0u;
  }
  sub_2496F9180((uint64_t)&v120);
LABEL_12:
  uint64_t v6 = (uint64_t *)(v1 + OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_trackedEvents);
  swift_beginAccess();
  uint64_t v100 = *v6 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(*v6 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(*v6 + 64);
  uint64_t v106 = OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_eventStore;
  int64_t v102 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v108 = *v6;
  swift_bridgeObjectRetain();
  int64_t v10 = 0;
  uint64_t v107 = v1;
  long long v101 = v6;
  while (v9)
  {
    unint64_t v16 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v17 = v16 | (v10 << 6);
LABEL_33:
    unint64_t v21 = (uint64_t *)(*(void *)(v108 + 48) + 16 * v17);
    uint64_t v22 = *v21;
    unint64_t v23 = v21[1];
    uint64_t v24 = *(void *)(v108 + 56) + 40 * v17;
    unint64_t v25 = *(void **)v24;
    uint64_t v26 = *(void **)(v24 + 8);
    int v27 = *(_DWORD *)(v24 + 16);
    unint64_t v28 = *(void **)(v24 + 24);
    unint64_t v114 = *(void *)(v24 + 32);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    id v29 = v25;
    id v30 = v26;
    id v31 = v28;
    id v32 = v29;
    swift_bridgeObjectRetain();
    id v33 = v32;
    id v115 = v30;
    id v112 = v31;
    unsigned __int8 v34 = objc_msgSend(v33, sel_isTemporary);
    unint64_t v35 = *(void **)(v1 + v106);
    if (v34)
    {
      uint64_t v104 = v33;
      id v36 = v35;
      uint64_t v99 = v22;
      id v37 = (void *)sub_2496F9940();
      id v38 = objc_msgSend(v36, sel_allEventsWithUniqueId_occurrenceDate_, v37, 0);

      if (!v38)
      {
        swift_bridgeObjectRelease_n();

        goto LABEL_76;
      }
      unint64_t v109 = v9;
      int64_t v111 = v10;
      sub_2496E5150(0, &qword_2696CBAB0);
      unint64_t v39 = sub_2496F99A0();

      unint64_t v103 = v23;
      if (!(v39 >> 62))
      {
        uint64_t v40 = *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v40) {
          goto LABEL_37;
        }
LABEL_78:

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();

        swift_bridgeObjectRelease_n();
        uint64_t v1 = v107;
        goto LABEL_79;
      }
      swift_bridgeObjectRetain();
      uint64_t v40 = sub_2496F9CF0();
      swift_bridgeObjectRelease();
      if (!v40) {
        goto LABEL_78;
      }
LABEL_37:
      uint64_t v41 = 4;
      while (1)
      {
        if ((v39 & 0xC000000000000001) != 0) {
          id v42 = (id)MEMORY[0x24C5A9840](v41 - 4, v39);
        }
        else {
          id v42 = *(id *)(v39 + 8 * v41);
        }
        id v43 = v42;
        uint64_t v44 = v41 - 3;
        if (__OFADD__(v41 - 4, 1))
        {
          __break(1u);
          goto LABEL_82;
        }
        id v45 = objc_msgSend(v42, sel_calendar);
        if (!v45) {
          goto LABEL_84;
        }
        id v46 = v45;
        id v47 = objc_msgSend(v45, sel_objectID);

        if (v47)
        {
          sub_2496E5150(0, &qword_2696CBB40);
          id v48 = v115;
          id v49 = v47;
          char v50 = sub_2496F9B00();

          if (v50) {
            break;
          }
        }

        ++v41;
        if (v44 == v40) {
          goto LABEL_78;
        }
      }
      swift_bridgeObjectRelease();
      if (qword_26B160DA8 != -1) {
        swift_once();
      }
      uint64_t v51 = sub_2496F9900();
      __swift_project_value_buffer(v51, (uint64_t)qword_26B160E10);
      swift_bridgeObjectRetain_n();
      uint64_t v52 = sub_2496F98E0();
      os_log_type_t v53 = sub_2496F9AA0();
      if (os_log_type_enabled(v52, v53))
      {
        uint64_t v54 = (uint8_t *)swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        v119[0] = v55;
        *(_DWORD *)uint64_t v54 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v56 = v99;
        sub_2496F6E70(v99, v103, v119);
        sub_2496F9B10();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2496DE000, v52, v53, "Clearing pending state for %s because it now exists", v54, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5A9F00](v55, -1, -1);
        MEMORY[0x24C5A9F00](v54, -1, -1);

        unint64_t v9 = v109;
        int64_t v10 = v111;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        unint64_t v9 = v109;
        uint64_t v56 = v99;
      }
      sub_2496F7B10(v104, v114, 1);
      swift_beginAccess();
      sub_2496F74C8(v56, v103, (uint64_t)v122);
      swift_endAccess();
      sub_2496F8D54((uint64_t)v122);

      swift_bridgeObjectRelease_n();
      uint64_t v1 = v107;
LABEL_76:
      swift_bridgeObjectRelease_n();
    }
    else
    {
      uint64_t v57 = v1;
      id v58 = v33;
      id v59 = objc_msgSend(v35, sel_publicObjectWithObjectID_, v33);
      if (!v59) {
        goto LABEL_56;
      }
      id v60 = v59;
      self;
      uint64_t v61 = (void *)swift_dynamicCastObjCClass();
      if (v61)
      {
        unsigned int v62 = objc_msgSend(v61, sel_sequenceNumber);
        if (v27 == v62)
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          uint64_t v1 = v57;
        }
        else
        {
          unsigned int v73 = v62;
          unint64_t v109 = v9;
          int64_t v111 = v10;
          if (qword_26B160DA8 != -1) {
            swift_once();
          }
          uint64_t v74 = sub_2496F9900();
          __swift_project_value_buffer(v74, (uint64_t)qword_26B160E10);
          id v75 = v58;
          swift_bridgeObjectRetain_n();
          id v76 = v115;
          id v77 = v112;
          swift_bridgeObjectRetain_n();
          id v116 = v75;
          id v78 = v76;
          id v79 = v77;
          uint64_t v80 = sub_2496F98E0();
          os_log_type_t v81 = sub_2496F9AA0();
          v113 = v78;
          id v105 = v79;
          if (os_log_type_enabled(v80, v81))
          {
            os_log_type_t type = v81;
            uint64_t v82 = v78;
            uint64_t v83 = swift_slowAlloc();
            uint64_t v98 = swift_slowAlloc();
            v119[0] = v98;
            *(_DWORD *)uint64_t v83 = 136315650;
            swift_bridgeObjectRetain();
            *(void *)(v83 + 4) = sub_2496F6E70(v22, v23, v119);
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v83 + 12) = 1024;
            swift_bridgeObjectRelease();

            *(_DWORD *)(v83 + 14) = v27;
            swift_bridgeObjectRelease();

            *(_WORD *)(v83 + 18) = 1024;
            uint64_t v84 = v22;
            *(_DWORD *)(v83 + 20) = v73;
            _os_log_impl(&dword_2496DE000, v80, type, "Clearing pending state for %s because it has been updated (%d->%d)", (uint8_t *)v83, 0x18u);
            swift_arrayDestroy();
            MEMORY[0x24C5A9F00](v98, -1, -1);
            MEMORY[0x24C5A9F00](v83, -1, -1);

            unint64_t v85 = v114;
            int v86 = v116;
          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();

            int v86 = v116;
            unint64_t v85 = v114;
            uint64_t v84 = v22;
          }
          uint64_t v1 = v107;
          sub_2496F7B10(v86, v85, 1);
          swift_beginAccess();
          swift_bridgeObjectRetain();
          unint64_t v87 = sub_2496EEC40(v84, v23);
          char v89 = v88;
          swift_bridgeObjectRelease();
          uint64_t v90 = 0;
          uint64_t v91 = 0;
          uint64_t v92 = 0;
          char v93 = 0;
          if (v89)
          {
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v95 = *v101;
            uint64_t v118 = *v101;
            uint64_t *v101 = 0x8000000000000000;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_2496F1590();
              uint64_t v95 = v118;
            }
            swift_bridgeObjectRelease();
            uint64_t v96 = *(void *)(v95 + 56) + 40 * v87;
            uint64_t v90 = *(void **)v96;
            uint64_t v91 = *(void **)(v96 + 8);
            uint64_t v92 = *(unsigned int *)(v96 + 16);
            char v93 = *(void **)(v96 + 24);
            sub_2496F75D8(v87, v95);
            uint64_t *v101 = v95;
            swift_bridgeObjectRelease();
            int v86 = v116;
          }
          swift_endAccess();
          sub_2496F8D88(v90, v91, v92, v93);

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
LABEL_79:
          unint64_t v9 = v109;
          int64_t v10 = v111;
        }
      }
      else
      {

LABEL_56:
        if (qword_26B160DA8 != -1) {
          swift_once();
        }
        uint64_t v63 = sub_2496F9900();
        __swift_project_value_buffer(v63, (uint64_t)qword_26B160E10);
        swift_bridgeObjectRetain_n();
        uint64_t v64 = sub_2496F98E0();
        os_log_type_t v65 = sub_2496F9AA0();
        unint64_t v110 = v9;
        if (os_log_type_enabled(v64, v65))
        {
          uint64_t v66 = swift_slowAlloc();
          uint64_t v67 = swift_slowAlloc();
          v119[0] = v67;
          *(_DWORD *)uint64_t v66 = 136315138;
          swift_bridgeObjectRetain();
          *(void *)(v66 + 4) = sub_2496F6E70(v22, v23, v119);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2496DE000, v64, v65, "Clearing pending state for %s because it has been deleted", (uint8_t *)v66, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C5A9F00](v67, -1, -1);
          MEMORY[0x24C5A9F00](v66, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        sub_2496F7B10(v58, v114, 1);
        swift_beginAccess();
        swift_bridgeObjectRetain();
        unint64_t v68 = sub_2496EEC40(v22, v23);
        char v70 = v69;
        swift_bridgeObjectRelease();
        unint64_t v12 = 0;
        id v13 = 0;
        uint64_t v14 = 0;
        unint64_t v15 = 0;
        if (v70)
        {
          char v71 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v72 = *v101;
          uint64_t v117 = *v101;
          uint64_t *v101 = 0x8000000000000000;
          if ((v71 & 1) == 0)
          {
            sub_2496F1590();
            uint64_t v72 = v117;
          }
          swift_bridgeObjectRelease();
          uint64_t v11 = *(void *)(v72 + 56) + 40 * v68;
          unint64_t v12 = *(void **)v11;
          id v13 = *(void **)(v11 + 8);
          uint64_t v14 = *(unsigned int *)(v11 + 16);
          unint64_t v15 = *(void **)(v11 + 24);
          sub_2496F75D8(v68, v72);
          uint64_t *v101 = v72;
          swift_bridgeObjectRelease();
        }
        swift_endAccess();
        sub_2496F8D88(v12, v13, v14, v15);
        swift_bridgeObjectRelease_n();

        swift_bridgeObjectRelease_n();
        unint64_t v9 = v110;
        uint64_t v1 = v107;
      }
    }
  }
  int64_t v18 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  if (v18 >= v102) {
    goto LABEL_80;
  }
  unint64_t v19 = *(void *)(v100 + 8 * v18);
  ++v10;
  if (v19) {
    goto LABEL_32;
  }
  int64_t v10 = v18 + 1;
  if (v18 + 1 >= v102) {
    goto LABEL_80;
  }
  unint64_t v19 = *(void *)(v100 + 8 * v10);
  if (v19) {
    goto LABEL_32;
  }
  int64_t v10 = v18 + 2;
  if (v18 + 2 >= v102) {
    goto LABEL_80;
  }
  unint64_t v19 = *(void *)(v100 + 8 * v10);
  if (v19)
  {
LABEL_32:
    unint64_t v9 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v10 << 6);
    goto LABEL_33;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v102)
  {
LABEL_80:
    swift_release();
    return;
  }
  unint64_t v19 = *(void *)(v100 + 8 * v20);
  if (v19)
  {
    int64_t v10 = v20;
    goto LABEL_32;
  }
  while (1)
  {
    int64_t v10 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v10 >= v102) {
      goto LABEL_80;
    }
    unint64_t v19 = *(void *)(v100 + 8 * v10);
    ++v20;
    if (v19) {
      goto LABEL_32;
    }
  }
LABEL_83:
  __break(1u);
LABEL_84:
  __break(1u);
}

id PendingReminderTracker.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PendingReminderTracker.init()()
{
}

id PendingReminderTracker.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PendingReminderTracker();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2496F6E70(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2496F6F44(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2496F91E0((uint64_t)v12, *a3);
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
      sub_2496F91E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2496F6F44(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2496F9B20();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2496F7100(a5, a6);
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
  uint64_t v8 = sub_2496F9C50();
  if (!v8)
  {
    sub_2496F9CE0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2496F9D40();
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

uint64_t sub_2496F7100(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2496F7198(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2496F7378(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2496F7378(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2496F7198(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2496F7310(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2496F9C20();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2496F9CE0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2496F9970();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2496F9D40();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2496F9CE0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2496F7310(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B160DB0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2496F7378(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B160DB0);
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
  id v13 = a4 + 32;
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
  uint64_t result = sub_2496F9D40();
  __break(1u);
  return result;
}

uint64_t sub_2496F74C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_2496EEC40(a1, a2);
  LOBYTE(a2) = v9;
  uint64_t result = swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v4;
    uint64_t v19 = *v4;
    *unint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_2496F1590();
      uint64_t v12 = v19;
    }
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void *)(v12 + 56) + 40 * v8;
    long long v18 = *(_OWORD *)v13;
    uint64_t v14 = *(unsigned int *)(v13 + 16);
    uint64_t v15 = *(void *)(v13 + 24);
    uint64_t v16 = *(void *)(v13 + 32);
    sub_2496F75D8(v8, v12);
    *unint64_t v4 = v12;
    uint64_t result = swift_bridgeObjectRelease();
    long long v17 = v18;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    long long v17 = 0uLL;
  }
  *(_OWORD *)a3 = v17;
  *(void *)(a3 + 16) = v14;
  *(void *)(a3 + 24) = v15;
  *(void *)(a3 + 32) = v16;
  return result;
}

unint64_t sub_2496F75D8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2496F9B50();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2496F9DD0();
        swift_bridgeObjectRetain();
        sub_2496F9960();
        uint64_t v11 = sub_2496F9DF0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          uint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          uint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            *uint64_t v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = v16 + 40 * v3;
          long long v18 = (long long *)(v16 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            long long v9 = *v18;
            long long v10 = v18[1];
            *(void *)(v17 + 32) = *((void *)v18 + 4);
            *(_OWORD *)unint64_t v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *uint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_2496F77C4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_2496EEC40(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2496F1590();
LABEL_7:
    long long v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7] + 40 * v12;
      uint64_t v20 = *(void **)v19;
      uint64_t v21 = *(void **)(v19 + 24);

      uint64_t result = swift_bridgeObjectRelease();
      long long v23 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)uint64_t v19 = *(_OWORD *)a1;
      *(_OWORD *)(v19 + 16) = v23;
      *(void *)(v19 + 32) = *(void *)(a1 + 32);
      return result;
    }
    goto LABEL_11;
  }
  sub_2496F0F58(v15, a4 & 1);
  unint64_t v24 = sub_2496EEC40(a2, a3);
  if ((v16 & 1) != (v25 & 1))
  {
LABEL_17:
    uint64_t result = sub_2496F9D80();
    __break(1u);
    return result;
  }
  unint64_t v12 = v24;
  long long v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v26 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v26 = a2;
  v26[1] = a3;
  uint64_t v27 = v18[7] + 40 * v12;
  long long v28 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v27 = *(_OWORD *)a1;
  *(_OWORD *)(v27 + 16) = v28;
  *(void *)(v27 + 32) = *(void *)(a1 + 32);
  uint64_t v29 = v18[2];
  BOOL v30 = __OFADD__(v29, 1);
  uint64_t v31 = v29 + 1;
  if (v30)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v31;
  return swift_bridgeObjectRetain();
}

void sub_2496F796C(void *a1@<X0>, void *a2@<X8>)
{
  id v4 = objc_msgSend(a1, sel_originalItem);
  if (!v4)
  {
    id v6 = objc_msgSend(a1, sel_objectID);
    if (v6)
    {
      id v12 = objc_msgSend(a1, sel_calendar);
      if (v12)
      {
        uint64_t v13 = v12;
        id v9 = objc_msgSend(v12, sel_objectID);

        if (!v9)
        {

          id v6 = 0;
        }
        goto LABEL_17;
      }

      goto LABEL_15;
    }
LABEL_11:

LABEL_16:
    id v9 = 0;
    goto LABEL_17;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_objectID);
  if (!v6)
  {

    goto LABEL_11;
  }
  id v7 = objc_msgSend(v5, sel_calendar);
  if (!v7)
  {

LABEL_15:
    id v6 = 0;
    goto LABEL_16;
  }
  unint64_t v8 = v7;
  id v9 = objc_msgSend(v7, sel_objectID);

  if (!v9)
  {

    id v6 = 0;
LABEL_17:
    uint64_t v11 = 0;
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA10);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2496FA8E0;
  *(void *)(v10 + 32) = a1;
  uint64_t v14 = v10;
  sub_2496F99B0();
  uint64_t v11 = v14;

LABEL_18:
  *a2 = v6;
  a2[1] = v9;
  a2[2] = 0;
  a2[3] = 0;
  a2[4] = v11;
}

uint64_t sub_2496F7B10(void *a1, unint64_t a2, char a3)
{
  uint64_t v6 = v3;
  unint64_t v8 = a1;
  uint64_t v62 = *MEMORY[0x263EF8340];
  unint64_t v61 = MEMORY[0x263F8EE78];
  unint64_t v9 = 0x2696CB000uLL;
  uint64_t v59 = v6;
  if (a2)
  {
    unint64_t v10 = a2;
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_2496F9CF0();
      if (v11) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v11 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v11)
      {
LABEL_4:
        if (v11 >= 1)
        {
          char v56 = a3;
          uint64_t v12 = 0;
          uint64_t v13 = OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_eventStore;
          unint64_t v14 = v10 & 0xC000000000000001;
          unint64_t v58 = v10;
          while (1)
          {
            if (v14) {
              id v16 = (id)MEMORY[0x24C5A9840](v12, v10);
            }
            else {
              id v16 = *(id *)(v10 + 8 * v12 + 32);
            }
            uint64_t v17 = v16;
            long long v18 = objc_msgSend(v16, sel_objectID);
            if (v18)
            {
              uint64_t v19 = v18;
              if (([v18 isTemporary] & 1) == 0)
              {

LABEL_23:
                goto LABEL_7;
              }
              uint64_t v20 = v19;
              MEMORY[0x24C5A9580]();
              if (*(void *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_2496F99D0();
              }
              sub_2496F99F0();
              sub_2496F99B0();
            }
            uint64_t v21 = *(void **)(v6 + v13);
            id v60 = 0;
            if (objc_msgSend(v21, sel_removeEvent_span_commit_error_, v17, 0, 0, &v60))
            {
              id v15 = v60;
            }
            else
            {
              id v22 = v60;
              long long v23 = (void *)sub_2496F9410();

              swift_willThrow();
              if (qword_26B160DA8 != -1) {
                swift_once();
              }
              uint64_t v24 = sub_2496F9900();
              __swift_project_value_buffer(v24, (uint64_t)qword_26B160E10);
              id v25 = v23;
              id v26 = v23;
              uint64_t v19 = sub_2496F98E0();
              os_log_type_t v27 = sub_2496F9AB0();
              if (!os_log_type_enabled(v19, v27))
              {

                goto LABEL_23;
              }
              uint64_t v28 = v11;
              unint64_t v29 = v14;
              uint64_t v30 = v13;
              uint64_t v31 = swift_slowAlloc();
              id v32 = (void *)swift_slowAlloc();
              *(_DWORD *)uint64_t v31 = 138412290;
              id v33 = v23;
              uint64_t v34 = _swift_stdlib_bridgeErrorToNSError();
              *(void *)(v31 + 4) = v34;
              *id v32 = v34;

              _os_log_impl(&dword_2496DE000, v19, v27, "Couldn't remove temporary event: %@", (uint8_t *)v31, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA08);
              swift_arrayDestroy();
              unint64_t v35 = v32;
              uint64_t v6 = v59;
              MEMORY[0x24C5A9F00](v35, -1, -1);
              uint64_t v36 = v31;
              uint64_t v13 = v30;
              unint64_t v14 = v29;
              uint64_t v11 = v28;
              unint64_t v10 = v58;
              MEMORY[0x24C5A9F00](v36, -1, -1);
            }
LABEL_7:
            if (v11 == ++v12)
            {
              swift_bridgeObjectRelease();
              a3 = v56;
              unint64_t v8 = a1;
              unint64_t v9 = 0x2696CB000;
              goto LABEL_27;
            }
          }
        }
        __break(1u);
LABEL_48:
        sub_2496F99D0();
        goto LABEL_30;
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v8 = a1;
  }
LABEL_27:
  unint64_t v9 = *(void *)(v9 + 2856);
  id v37 = objc_msgSend(*(id *)(v6 + v9), sel_publicObjectWithObjectID_, v8);
  if (!v37) {
    goto LABEL_35;
  }
  uint64_t v5 = v37;
  self;
  uint64_t v38 = swift_dynamicCastObjCClass();
  if (!v38) {
    goto LABEL_34;
  }
  id v4 = (void *)v38;
  id v39 = v8;
  MEMORY[0x24C5A9580]();
  if (*(void *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_48;
  }
LABEL_30:
  sub_2496F99F0();
  sub_2496F99B0();
  if (objc_msgSend(v4, sel_hasEverBeenCommitted))
  {
    objc_msgSend(v4, sel_reset);
LABEL_34:

    goto LABEL_35;
  }
  uint64_t v40 = *(void **)(v6 + v9);
  id v60 = 0;
  if (objc_msgSend(v40, sel_removeEvent_span_commit_error_, v4, 0, 0, &v60))
  {
    id v41 = v60;
    goto LABEL_34;
  }
  id v44 = v60;
  id v45 = (void *)sub_2496F9410();

  swift_willThrow();
  if (qword_26B160DA8 != -1) {
    swift_once();
  }
  uint64_t v46 = sub_2496F9900();
  __swift_project_value_buffer(v46, (uint64_t)qword_26B160E10);
  id v47 = v45;
  id v48 = v45;
  id v49 = sub_2496F98E0();
  os_log_type_t v50 = sub_2496F9AB0();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = (uint8_t *)swift_slowAlloc();
    uint64_t v52 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v51 = 138412290;
    id v53 = v45;
    uint64_t v54 = (void *)_swift_stdlib_bridgeErrorToNSError();
    id v60 = v54;
    sub_2496F9B10();
    *uint64_t v52 = v54;

    _os_log_impl(&dword_2496DE000, v49, v50, "Couldn't remove temporary event: %@", v51, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA08);
    swift_arrayDestroy();
    MEMORY[0x24C5A9F00](v52, -1, -1);
    MEMORY[0x24C5A9F00](v51, -1, -1);
  }
  else
  {
  }
LABEL_35:
  if (a3)
  {
    if (v61 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v55 = sub_2496F9CF0();
      swift_bridgeObjectRelease();
      if (v55 < 1) {
        return swift_bridgeObjectRelease();
      }
      goto LABEL_38;
    }
    if (*(uint64_t *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 1)
    {
LABEL_38:
      uint64_t v42 = swift_bridgeObjectRetain();
      sub_2496F5BF8(v42);
      swift_bridgeObjectRelease();
    }
  }
  return swift_bridgeObjectRelease();
}

void sub_2496F81F8(void *a1, int a2, char a3, uint64_t a4, void *a5, void *a6)
{
  id v11 = objc_msgSend(a1, sel_originalItem);
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = objc_msgSend(v11, sel_uniqueID);
    if (v13)
    {
      unint64_t v14 = v13;
      int v79 = a2;
      uint64_t v82 = a5;
      uint64_t v83 = a6;
      uint64_t v85 = sub_2496F9950();
      unint64_t v16 = v15;

      uint64_t v17 = v12;
LABEL_6:

      uint64_t v20 = (uint64_t *)(a4 + OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_trackedEvents);
      swift_beginAccess();
      uint64_t v21 = *v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2496F426C(v85, v16, v21, v92);
      long long v23 = (void *)v92[0];
      id v22 = (id)v92[1];
      uint64_t v25 = v92[2];
      uint64_t v24 = (void *)v92[3];
      unint64_t v26 = v92[4];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2496F9298((uint64_t)v92, (uint64_t)v95, &qword_2696CBB30);
      if (v95[0])
      {
        *(void *)&long long v89 = v23;
        *((void *)&v89 + 1) = v22;
        LODWORD(v90) = v25;
        *((void *)&v90 + 1) = v24;
        unint64_t v91 = v26;
        uint64_t v27 = v25;
        uint64_t v28 = v22;
        if ((a3 & 1) == 0)
        {
          sub_2496F923C(v23, v22, v25, v24);
          swift_bridgeObjectRetain();
          id v84 = v23;
          os_log_type_t v81 = v22;
          id v22 = v22;
          id v42 = v24;
          uint64_t v80 = v23;
LABEL_50:
          swift_beginAccess();
          sub_2496F39F4((uint64_t)&v89, v82, v83);
          swift_endAccess();
          if (a3)
          {
            long long v96 = v89;
            long long v97 = v90;
            unint64_t v98 = v91;
            long long v67 = v89;
            sub_2496F9298((uint64_t)&v97 + 8, (uint64_t)&v99, &qword_2696CBB38);
            sub_2496F9298((uint64_t)&v98, (uint64_t)v100, &qword_2696CBB48);
            swift_beginAccess();
            id v68 = (id)v67;
            id v69 = *((id *)&v67 + 1);
            sub_2496F92FC(&v99);
            sub_2496F9328((uint64_t)v100);
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v88 = *v20;
            uint64_t *v20 = 0x8000000000000000;
            sub_2496F77C4((uint64_t)&v96, v85, v16, isUniquelyReferenced_nonNull_native);
            uint64_t *v20 = v88;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_endAccess();
            sub_2496F8D88(v80, v81, v27, v24);
          }
          else
          {
            sub_2496F8D88(v80, v81, v27, v24);
            swift_bridgeObjectRelease();
          }

          swift_bridgeObjectRelease();
          goto LABEL_54;
        }
        id v84 = v23;
LABEL_18:
        uint64_t v80 = v23;
        os_log_type_t v81 = v28;
        if (v27)
        {
          sub_2496F923C(v23, v28, v27, v24);
          int v38 = v79;
          if (v27 == v79)
          {
            swift_bridgeObjectRetain();
            id v39 = v84;
            id v40 = v22;
            id v41 = v24;
          }
          else
          {
            uint64_t v78 = v27;
            uint64_t v52 = qword_26B160DA8;
            id v53 = v84;
            id v54 = v22;
            id v55 = v24;
            swift_bridgeObjectRetain();
            if (v52 != -1) {
              swift_once();
            }
            uint64_t v56 = sub_2496F9900();
            __swift_project_value_buffer(v56, (uint64_t)qword_26B160E10);
            swift_bridgeObjectRetain_n();
            uint64_t v57 = sub_2496F98E0();
            os_log_type_t log = sub_2496F9AA0();
            if (os_log_type_enabled(v57, log))
            {
              id v75 = v57;
              uint64_t v58 = swift_slowAlloc();
              uint64_t typea = swift_slowAlloc();
              *(void *)&long long v96 = typea;
              *(_DWORD *)uint64_t v58 = 67109634;
              swift_beginAccess();
              sub_2496F9B10();
              *(_WORD *)(v58 + 8) = 1024;
              sub_2496F9B10();
              *(_WORD *)(v58 + 14) = 2080;
              swift_bridgeObjectRetain();
              sub_2496F6E70(v85, v16, (uint64_t *)&v96);
              sub_2496F9B10();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_2496DE000, v75, log, "Updating tracked sequence number (%d->%d) for %s", (uint8_t *)v58, 0x18u);
              swift_arrayDestroy();
              MEMORY[0x24C5A9F00](typea, -1, -1);
              MEMORY[0x24C5A9F00](v58, -1, -1);
            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            uint64_t v27 = v78;
          }
        }
        else
        {
          uint64_t v77 = v27;
          sub_2496F923C(v23, v28, v27, v24);
          uint64_t v43 = qword_26B160DA8;
          id v44 = v84;
          id v45 = v22;
          id v46 = v24;
          swift_bridgeObjectRetain();
          if (v43 != -1) {
            swift_once();
          }
          uint64_t v47 = sub_2496F9900();
          __swift_project_value_buffer(v47, (uint64_t)qword_26B160E10);
          swift_bridgeObjectRetain_n();
          id v48 = sub_2496F98E0();
          os_log_type_t v49 = sub_2496F9AA0();
          if (os_log_type_enabled(v48, v49))
          {
            id v76 = v22;
            os_log_type_t v50 = (uint8_t *)swift_slowAlloc();
            os_log_t v74 = (os_log_t)swift_slowAlloc();
            *(void *)&long long v96 = v74;
            *(_DWORD *)os_log_type_t v50 = 136446210;
            os_log_type_t type = v49;
            uint64_t v51 = v50;
            swift_bridgeObjectRetain();
            id v22 = v76;
            sub_2496F6E70(v85, v16, (uint64_t *)&v96);
            sub_2496F9B10();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_2496DE000, v48, type, "Now tracking pending reminder with id %{public}s", v51, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24C5A9F00](v74, -1, -1);
            MEMORY[0x24C5A9F00](v51, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          uint64_t v27 = v77;
          int v38 = v79;
        }
        swift_beginAccess();
        LODWORD(v90) = v38;
        if (v12)
        {
          if (v91)
          {
            swift_bridgeObjectRetain();
            if ((sub_2496F5A70((uint64_t)a1, v91) & 1) == 0)
            {
              *(void *)&long long v96 = v91;
              id v64 = a1;
              MEMORY[0x24C5A9580]();
              if (*(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_2496F99D0();
              }
              sub_2496F99F0();
              sub_2496F99B0();
              unint64_t v91 = v96;
            }
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA10);
            uint64_t v65 = swift_allocObject();
            *(_OWORD *)(v65 + 16) = xmmword_2496FA8E0;
            *(void *)(v65 + 32) = a1;
            *(void *)&long long v96 = v65;
            sub_2496F99B0();
            unint64_t v91 = v96;
            id v66 = a1;
          }
          swift_bridgeObjectRelease();
        }
        goto LABEL_50;
      }
      if ((a3 & 1) == 0)
      {
LABEL_54:
        swift_bridgeObjectRelease();
        return;
      }
      id v36 = a1;
      sub_2496F796C(v36, v93);
      long long v23 = (void *)v93[0];
      id v22 = (id)v93[1];
      uint64_t v27 = v93[2];
      uint64_t v24 = (void *)v93[3];
      unint64_t v37 = v93[4];
      sub_2496F9298((uint64_t)v93, (uint64_t)v94, &qword_2696CBB30);
      if (v94[0])
      {
        *(void *)&long long v89 = v23;
        *((void *)&v89 + 1) = v22;
        LODWORD(v90) = v27;
        id v84 = v23;
        *((void *)&v90 + 1) = v24;
        unint64_t v91 = v37;
        uint64_t v28 = v22;
        goto LABEL_18;
      }
      swift_bridgeObjectRelease();
      if (qword_26B160DA8 != -1) {
        swift_once();
      }
      uint64_t v59 = sub_2496F9900();
      __swift_project_value_buffer(v59, (uint64_t)qword_26B160E10);
      id v60 = v36;
      uint64_t v30 = sub_2496F98E0();
      os_log_type_t v61 = sub_2496F9AB0();
      if (os_log_type_enabled(v30, v61))
      {
        id v32 = (uint8_t *)swift_slowAlloc();
        uint64_t v62 = (void *)swift_slowAlloc();
        *(_DWORD *)id v32 = 138412290;
        *(void *)&long long v96 = v60;
        id v63 = v60;
        sub_2496F9B10();
        *uint64_t v62 = v60;

        _os_log_impl(&dword_2496DE000, v30, v61, "Couldn't create tracked event info for event %@", v32, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA08);
        swift_arrayDestroy();
        unint64_t v35 = v62;
        goto LABEL_14;
      }

      return;
    }
  }
  else
  {
    id v18 = objc_msgSend(a1, sel_uniqueID);
    if (v18)
    {
      uint64_t v17 = v18;
      int v79 = a2;
      uint64_t v82 = a5;
      uint64_t v83 = a6;
      uint64_t v85 = sub_2496F9950();
      unint64_t v16 = v19;
      goto LABEL_6;
    }
  }
  if (qword_26B160DA8 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_2496F9900();
  __swift_project_value_buffer(v29, (uint64_t)qword_26B160E10);
  id v87 = a1;
  uint64_t v30 = sub_2496F98E0();
  os_log_type_t v31 = sub_2496F9AB0();
  if (os_log_type_enabled(v30, v31))
  {
    id v32 = (uint8_t *)swift_slowAlloc();
    id v33 = (void *)swift_slowAlloc();
    *(_DWORD *)id v32 = 138412290;
    *(void *)&long long v96 = v87;
    id v34 = v87;
    sub_2496F9B10();
    *id v33 = v87;

    _os_log_impl(&dword_2496DE000, v30, v31, "Ignoring pending event with no uniqueID (%@)", v32, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696CBA08);
    swift_arrayDestroy();
    unint64_t v35 = v33;
LABEL_14:
    MEMORY[0x24C5A9F00](v35, -1, -1);
    MEMORY[0x24C5A9F00](v32, -1, -1);

    return;
  }
}

uint64_t sub_2496F8D54(uint64_t a1)
{
  return a1;
}

void *sub_2496F8D88(void *result, void *a2, uint64_t a3, void *a4)
{
  if (result)
  {

    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

id *sub_2496F8DE0(id *a1)
{
  return a1;
}

uint64_t method lookup function for PendingReminderTracker(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PendingReminderTracker);
}

uint64_t dispatch thunk of PendingReminderTracker.__allocating_init(eventStore:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of PendingReminderTracker.addPending(event:sequenceNumber:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of PendingReminderTracker.setOptimisticReminder(event:sequenceNumber:optimisticReminder:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of PendingReminderTracker.optimisticReminder(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of PendingReminderTracker.revertPending(event:sendNotification:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t initializeBufferWithCopyOfBuffer for PendingReminderTracker.TrackedEventInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PendingReminderTracker.TrackedEventInfo(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PendingReminderTracker.TrackedEventInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  id v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v6 = *(void **)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v5;
  id v7 = v3;
  id v8 = v4;
  id v9 = v6;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PendingReminderTracker.TrackedEventInfo(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  unint64_t v10 = *(void **)(a1 + 24);
  id v11 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v11;
  id v12 = v11;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PendingReminderTracker.TrackedEventInfo(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PendingReminderTracker.TrackedEventInfo(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PendingReminderTracker.TrackedEventInfo(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PendingReminderTracker.TrackedEventInfo()
{
  return &type metadata for PendingReminderTracker.TrackedEventInfo;
}

uint64_t sub_2496F9180(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B160DB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2496F91E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_2496F923C(id result, void *a2, uint64_t a3, void *a4)
{
  if (result)
  {
    uint64_t v5 = result;
    swift_bridgeObjectRetain();
    id v6 = v5;
    id v7 = a2;
    return a4;
  }
  return result;
}

uint64_t sub_2496F9298(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id *sub_2496F92FC(id *a1)
{
  id v2 = *a1;
  return a1;
}

uint64_t sub_2496F9328(uint64_t a1)
{
  return a1;
}

uint64_t sub_2496F9354(uint64_t a1)
{
  return a1;
}

uint64_t sub_2496F9380()
{
  return MEMORY[0x270EE0BA8]();
}

uint64_t sub_2496F9390()
{
  return MEMORY[0x270EEE370]();
}

uint64_t sub_2496F93A0()
{
  return MEMORY[0x270EEE3B0]();
}

uint64_t sub_2496F93B0()
{
  return MEMORY[0x270EEE3C8]();
}

uint64_t sub_2496F93C0()
{
  return MEMORY[0x270EEE758]();
}

uint64_t sub_2496F93D0()
{
  return MEMORY[0x270EEE770]();
}

uint64_t sub_2496F93E0()
{
  return MEMORY[0x270EEE7C0]();
}

uint64_t sub_2496F93F0()
{
  return MEMORY[0x270EEE8F0]();
}

uint64_t sub_2496F9400()
{
  return MEMORY[0x270EEF828]();
}

uint64_t sub_2496F9410()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_2496F9420()
{
  return MEMORY[0x270EEFC60]();
}

uint64_t sub_2496F9430()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_2496F9440()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_2496F9450()
{
  return MEMORY[0x270EEFF08]();
}

uint64_t sub_2496F9460()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_2496F9470()
{
  return MEMORY[0x270EF0128]();
}

uint64_t sub_2496F9480()
{
  return MEMORY[0x270EF0170]();
}

uint64_t sub_2496F9490()
{
  return MEMORY[0x270EF08A0]();
}

uint64_t sub_2496F94A0()
{
  return MEMORY[0x270EF0990]();
}

uint64_t sub_2496F94B0()
{
  return MEMORY[0x270EF0BB0]();
}

uint64_t sub_2496F94C0()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_2496F94D0()
{
  return MEMORY[0x270EF10C0]();
}

uint64_t sub_2496F94E0()
{
  return MEMORY[0x270EF10D0]();
}

uint64_t sub_2496F94F0()
{
  return MEMORY[0x270EF1240]();
}

uint64_t sub_2496F9500()
{
  return MEMORY[0x270EF1370]();
}

uint64_t sub_2496F9510()
{
  return MEMORY[0x270EF1390]();
}

uint64_t sub_2496F9520()
{
  return MEMORY[0x270EF1408]();
}

uint64_t sub_2496F9530()
{
  return MEMORY[0x270EF1420]();
}

uint64_t sub_2496F9540()
{
  return MEMORY[0x270EF1448]();
}

uint64_t sub_2496F9550()
{
  return MEMORY[0x270EF15F0]();
}

uint64_t sub_2496F9560()
{
  return MEMORY[0x270EF1610]();
}

uint64_t sub_2496F9570()
{
  return MEMORY[0x270F07E98]();
}

uint64_t sub_2496F9580()
{
  return MEMORY[0x270F07EA8]();
}

uint64_t sub_2496F9590()
{
  return MEMORY[0x270F5A0D0]();
}

uint64_t sub_2496F95A0()
{
  return MEMORY[0x270F5A0D8]();
}

uint64_t sub_2496F95B0()
{
  return MEMORY[0x270F5A0E0]();
}

uint64_t sub_2496F95C0()
{
  return MEMORY[0x270F5A0E8]();
}

uint64_t sub_2496F95D0()
{
  return MEMORY[0x270F5A158]();
}

uint64_t sub_2496F95E0()
{
  return MEMORY[0x270F5A160]();
}

uint64_t sub_2496F9620()
{
  return MEMORY[0x270F5A180]();
}

uint64_t sub_2496F9630()
{
  return MEMORY[0x270F5A188]();
}

uint64_t sub_2496F9640()
{
  return MEMORY[0x270F5A190]();
}

uint64_t sub_2496F9650()
{
  return MEMORY[0x270F5A198]();
}

uint64_t sub_2496F9660()
{
  return MEMORY[0x270F5A1A0]();
}

uint64_t sub_2496F9670()
{
  return MEMORY[0x270F5A1A8]();
}

uint64_t sub_2496F9680()
{
  return MEMORY[0x270F5A1B0]();
}

uint64_t sub_2496F9690()
{
  return MEMORY[0x270F5A1B8]();
}

uint64_t sub_2496F96A0()
{
  return MEMORY[0x270F5A1C0]();
}

uint64_t sub_2496F96B0()
{
  return MEMORY[0x270F5A1C8]();
}

uint64_t sub_2496F96C0()
{
  return MEMORY[0x270F5A1D0]();
}

uint64_t sub_2496F96D0()
{
  return MEMORY[0x270F5A1D8]();
}

uint64_t sub_2496F96E0()
{
  return MEMORY[0x270F5A1E0]();
}

uint64_t sub_2496F96F0()
{
  return MEMORY[0x270F5A1E8]();
}

uint64_t sub_2496F9700()
{
  return MEMORY[0x270F5A1F0]();
}

uint64_t sub_2496F9710()
{
  return MEMORY[0x270F5A1F8]();
}

uint64_t sub_2496F9720()
{
  return MEMORY[0x270F5A200]();
}

uint64_t sub_2496F9730()
{
  return MEMORY[0x270F5A208]();
}

uint64_t sub_2496F9740()
{
  return MEMORY[0x270F5A210]();
}

uint64_t sub_2496F9750()
{
  return MEMORY[0x270F5A218]();
}

uint64_t sub_2496F9760()
{
  return MEMORY[0x270F5A220]();
}

uint64_t sub_2496F9770()
{
  return MEMORY[0x270F5A228]();
}

uint64_t sub_2496F9780()
{
  return MEMORY[0x270F5A230]();
}

uint64_t sub_2496F9790()
{
  return MEMORY[0x270F5A238]();
}

uint64_t sub_2496F97A0()
{
  return MEMORY[0x270F5A240]();
}

uint64_t sub_2496F97B0()
{
  return MEMORY[0x270F5A248]();
}

uint64_t sub_2496F97C0()
{
  return MEMORY[0x270F5A250]();
}

uint64_t sub_2496F97D0()
{
  return MEMORY[0x270F5A258]();
}

uint64_t sub_2496F97E0()
{
  return MEMORY[0x270F5A260]();
}

uint64_t sub_2496F97F0()
{
  return MEMORY[0x270F5A268]();
}

uint64_t sub_2496F9800()
{
  return MEMORY[0x270F5A270]();
}

uint64_t sub_2496F9810()
{
  return MEMORY[0x270F5A278]();
}

uint64_t sub_2496F9820()
{
  return MEMORY[0x270F5A280]();
}

uint64_t sub_2496F9830()
{
  return MEMORY[0x270F5A288]();
}

uint64_t sub_2496F9840()
{
  return MEMORY[0x270F5A290]();
}

uint64_t sub_2496F9850()
{
  return MEMORY[0x270F5A298]();
}

uint64_t sub_2496F9860()
{
  return MEMORY[0x270F5A2A0]();
}

uint64_t sub_2496F9870()
{
  return MEMORY[0x270F5A2A8]();
}

uint64_t sub_2496F9880()
{
  return MEMORY[0x270F5A2B0]();
}

uint64_t sub_2496F9890()
{
  return MEMORY[0x270F5A2B8]();
}

uint64_t sub_2496F98A0()
{
  return MEMORY[0x270F5A2C0]();
}

uint64_t sub_2496F98B0()
{
  return MEMORY[0x270F5A300]();
}

uint64_t sub_2496F98C0()
{
  return MEMORY[0x270F5A308]();
}

uint64_t sub_2496F98D0()
{
  return MEMORY[0x270F5A310]();
}

uint64_t sub_2496F98E0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2496F98F0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2496F9900()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2496F9910()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_2496F9920()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2496F9930()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2496F9940()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_2496F9950()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_2496F9960()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2496F9970()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2496F9980()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2496F9990()
{
  return MEMORY[0x270EF1B90]();
}

uint64_t sub_2496F99A0()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_2496F99B0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2496F99C0()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_2496F99D0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2496F99E0()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_2496F99F0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2496F9A00()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_2496F9A10()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2496F9A20()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2496F9A30()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2496F9A40()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_2496F9A50()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2496F9A60()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2496F9A70()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2496F9A80()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2496F9A90()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2496F9AA0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2496F9AB0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2496F9AC0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2496F9AD0()
{
  return MEMORY[0x270F5A828]();
}

uint64_t sub_2496F9AE0()
{
  return MEMORY[0x270EEB660]();
}

uint64_t sub_2496F9AF0()
{
  return MEMORY[0x270FA1178]();
}

uint64_t sub_2496F9B00()
{
  return MEMORY[0x270FA1188]();
}

uint64_t sub_2496F9B10()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2496F9B20()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2496F9B30()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2496F9B40()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2496F9B50()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2496F9B60()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_2496F9B70()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_2496F9B80()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_2496F9B90()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_2496F9BA0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_2496F9BB0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2496F9BC0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2496F9BD0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2496F9BE0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2496F9BF0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2496F9C00()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_2496F9C10()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2496F9C20()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2496F9C30()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_2496F9C40()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2496F9C50()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2496F9C60()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2496F9C70()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2496F9C80()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2496F9C90()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2496F9CA0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2496F9CB0()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_2496F9CC0()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_2496F9CD0()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_2496F9CE0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2496F9CF0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2496F9D00()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2496F9D10()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2496F9D20()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_2496F9D30()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2496F9D40()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2496F9D50()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2496F9D70()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2496F9D80()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2496F9D90()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2496F9DA0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2496F9DB0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2496F9DC0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2496F9DD0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2496F9DE0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2496F9DF0()
{
  return MEMORY[0x270F9FC90]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}