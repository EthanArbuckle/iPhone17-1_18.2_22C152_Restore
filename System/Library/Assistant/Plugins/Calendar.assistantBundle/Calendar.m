void sub_234901C54(uint64_t a1, void *a2, void *a3)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  id AceEventFromEKEvent_0;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  char *v50;
  char *v51;
  NSObject *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  id obj;
  long long v73;
  long long v74;
  long long v75;
  long long v76;
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  unsigned char v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x263EF8340];
  v8 = a2;
  if (!v8)
  {
    v66 = *(void *)(a1 + 48);
    v67 = objc_msgSend_dictionary(a3, v5, v6, v7);
    (*(void (**)(uint64_t, void *))(v66 + 16))(v66, v67);

    goto LABEL_32;
  }
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v71 = a1 + 32;
  objc_msgSend_identifiers(*(void **)(a1 + 32), v5, v6, v7);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v73, (uint64_t)v83, 16);
  v14 = a1;
  if (!v10) {
    goto LABEL_26;
  }
  v15 = v10;
  v16 = *(void *)v74;
  v68 = 136315650;
  v69 = v8;
  v70 = v14;
  do
  {
    v17 = 0;
    do
    {
      if (*(void *)v74 != v16) {
        objc_enumerationMutation(obj);
      }
      v18 = *(void **)(*((void *)&v73 + 1) + 8 * v17);
      objc_msgSend_timeZoneId(v18, v11, v12, v13, v68);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v19) {
        v20 = (uint64_t)CFTimeZoneCreateWithName(0, v19, 1u);
      }
      else {
        v20 = CalCopyTimeZone();
      }
      v21 = (void *)v20;
      if (v20)
      {
        sub_234902DF4();
        v22 = (void *)qword_2687CDEB0;
        if (os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_DEBUG))
        {
          v35 = v22;
          v36 = objc_opt_class();
          v37 = v36;
          v41 = objc_msgSend_identifier(v18, v38, v39, v40);
          *(_DWORD *)buf = 138412546;
          v78 = (const char *)v36;
          v8 = v69;
          v79 = 2112;
          v80 = v41;
          _os_log_debug_impl(&dword_234900000, v35, OS_LOG_TYPE_DEBUG, "[%@] - Looking for event with identifier %@", buf, 0x16u);

          v14 = v70;
        }
        v23 = (void *)*MEMORY[0x263F28388];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28388], OS_LOG_TYPE_DEBUG))
        {
          v42 = v23;
          v43 = objc_opt_class();
          v44 = v43;
          v48 = objc_msgSend_identifier(v18, v45, v46, v47);
          *(_DWORD *)buf = v68;
          v78 = "-[CalAssistantEventRetrieve performWithCompletion:]_block_invoke";
          v79 = 2112;
          v80 = v43;
          v81 = 2112;
          v82 = v48;
          _os_log_debug_impl(&dword_234900000, v42, OS_LOG_TYPE_DEBUG, "%s [%@] - Looking for event with identifier %@", buf, 0x20u);

          v8 = v69;
          v14 = v70;
        }
        v27 = objc_msgSend_identifier(v18, v24, v25, v26);
        v29 = objc_msgSend__eventWithURI_checkValid_(v8, v28, (uint64_t)v27, 1);

        sub_234902DF4();
        v30 = (void *)qword_2687CDEB0;
        if (os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_DEBUG))
        {
          v49 = v30;
          v50 = (char *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v78 = v50;
          v79 = 2112;
          v80 = v29;
          v51 = v50;
          _os_log_debug_impl(&dword_234900000, v49, OS_LOG_TYPE_DEBUG, "[%@] - Found event %@", buf, 0x16u);

          v14 = v70;
        }
        v31 = (void *)*MEMORY[0x263F28388];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28388], OS_LOG_TYPE_DEBUG))
        {
          v52 = v31;
          v53 = objc_opt_class();
          *(_DWORD *)buf = v68;
          v78 = "-[CalAssistantEventRetrieve performWithCompletion:]_block_invoke";
          v79 = 2112;
          v80 = v53;
          v81 = 2112;
          v82 = v29;
          v54 = v53;
          _os_log_debug_impl(&dword_234900000, v52, OS_LOG_TYPE_DEBUG, "%s [%@] - Found event %@", buf, 0x20u);

          v14 = v70;
          if (v29)
          {
LABEL_19:
            AceEventFromEKEvent_0 = CreateAceEventFromEKEvent_0(v29, v21);
            objc_msgSend_addObject_(*(void **)(v14 + 40), v33, (uint64_t)AceEventFromEKEvent_0, v34);
          }
        }
        else if (v29)
        {
          goto LABEL_19;
        }
        CFRelease(v21);
      }
      ++v17;
    }
    while (v15 != v17);
    v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v73, (uint64_t)v83, 16);
    v15 = v55;
  }
  while (v55);
LABEL_26:

  sub_234902DF4();
  v56 = (void *)qword_2687CDEB0;
  if (os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_DEBUG)) {
    sub_2349060B8(v71, v56, v14);
  }
  v57 = (void *)*MEMORY[0x263F28388];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28388], OS_LOG_TYPE_DEBUG)) {
    sub_234905FE4(v71, v57, v14);
  }
  v58 = objc_alloc_init(MEMORY[0x263F648A8]);
  objc_msgSend_setObjects_(v58, v59, *(void *)(v14 + 40), v60);
  v61 = *(void *)(v14 + 48);
  v65 = objc_msgSend_dictionary(v58, v62, v63, v64);
  (*(void (**)(uint64_t, void *))(v61 + 16))(v61, v65);

LABEL_32:
}

id sub_234902D40(id a1)
{
  return a1;
}

uint64_t sub_234902D60()
{
  return objc_opt_class();
}

void sub_234902D78(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_234902D90(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_234902DB0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_234902DD0()
{
  return objc_opt_class();
}

void sub_234902DF4()
{
  if (qword_2687CDEA8 != -1) {
    dispatch_once(&qword_2687CDEA8, &unk_26E797888);
  }
}

uint64_t sub_234902E1C()
{
  qword_2687CDEB0 = (uint64_t)os_log_create((const char *)qword_2687CDEA0, "CalendarAssistant");

  return MEMORY[0x270F9A758]();
}

id sub_234902E60()
{
  id v0 = objc_alloc(MEMORY[0x263F04B98]);
  v3 = objc_msgSend_initWithEKOptions_(v0, v1, 4, v2);

  return v3;
}

void sub_234902E98(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F04B98]);
  v7 = objc_msgSend_initWithEKOptions_(v4, v5, 4, v6);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_234902F54;
  v12[3] = &unk_264BFA2A8;
  id v13 = v7;
  id v14 = v3;
  id v8 = v7;
  id v9 = v3;
  objc_msgSend_requestFullAccessToEventsWithCompletion_(v8, v10, (uint64_t)v12, v11);
}

void sub_234902F54(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    sub_234902DF4();
    uint64_t v6 = qword_2687CDEB0;
    if (os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_ERROR)) {
      sub_234906880((uint64_t)v5, v6);
    }
    v7 = *MEMORY[0x263F28388];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28388], OS_LOG_TYPE_ERROR)) {
      sub_2349067F4((uint64_t)v5, v7);
    }
    uint64_t v10 = objc_msgSend_stringWithFormat_(NSString, v8, @"We weren't granted access to EventKit. %@", v9, v5);
    id v11 = objc_alloc(MEMORY[0x263F64820]);
    id v14 = objc_msgSend_initWithReason_(v11, v12, (uint64_t)v10, v13);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_2349038E4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id sub_234903904(id a1)
{
  return a1;
}

id sub_23490391C(void *a1)
{
  id v1 = a1;
  uint64_t v5 = objc_msgSend_count(v1, v2, v3, v4);
  uint64_t v9 = objc_msgSend_bundle(CalAssistantBundle, v6, v7, v8);
  v12 = v9;
  if (v5)
  {
    if (v5 == 2)
    {
      id v14 = NSString;
      v15 = objc_msgSend_localizedStringForKey_value_table_(v9, v10, @"%@ and %@ (two attendee format)", @"%@ and %@", 0);
      v18 = objc_msgSend_objectAtIndex_(v1, v16, 0, v17);
      v21 = objc_msgSend_objectAtIndex_(v1, v19, 1, v20);
      uint64_t v13 = objc_msgSend_localizedStringWithFormat_(v14, v22, (uint64_t)v15, v23, v18, v21);
    }
    else if (v5 == 1)
    {
      uint64_t v13 = objc_msgSend_objectAtIndex_(v1, v10, 0, v11);
    }
    else
    {
      unint64_t v24 = 0x263F08000uLL;
      v25 = NSString;
      v26 = objc_msgSend_localizedStringForKey_value_table_(v9, v10, @"%@, %@ (three or more start format)", @"%@, %@", 0);
      v29 = objc_msgSend_objectAtIndex_(v1, v27, 0, v28);
      v32 = objc_msgSend_objectAtIndex_(v1, v30, 1, v31);
      v35 = objc_msgSend_localizedStringWithFormat_(v25, v33, (uint64_t)v26, v34, v29, v32);

      uint64_t v56 = v5 - 1;
      if ((unint64_t)(v5 - 1) < 3)
      {
        v47 = v35;
      }
      else
      {
        uint64_t v37 = 3;
        do
        {
          v38 = *(void **)(v24 + 2880);
          objc_msgSend_localizedStringForKey_value_table_(v12, v36, @"%@, %@ (three or more middle format)", @"%@, %@", 0);
          v40 = v39 = v12;
          objc_msgSend_objectAtIndex_(v1, v41, v37 - 1, v42);
          v44 = unint64_t v43 = v24;
          v47 = objc_msgSend_localizedStringWithFormat_(v38, v45, (uint64_t)v40, v46, v35, v44);

          unint64_t v24 = v43;
          v12 = v39;

          ++v37;
          v35 = v47;
        }
        while (v5 != v37);
      }
      v48 = *(void **)(v24 + 2880);
      v49 = objc_msgSend_localizedStringForKey_value_table_(v12, v36, @"%@ and %@ (three or more end format)", @"%@ and %@", 0);
      v52 = objc_msgSend_objectAtIndex_(v1, v50, v56, v51);
      uint64_t v13 = objc_msgSend_localizedStringWithFormat_(v48, v53, (uint64_t)v49, v54, v47, v52);
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t sub_234903BC4(int a1)
{
  if (a1 < 5) {
    return qword_234908D70[a1];
  }
  sub_234902DF4();
  uint64_t v3 = qword_2687CDEB0;
  if (os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_ERROR)) {
    sub_234907174(a1, v3);
  }
  uint64_t v4 = *MEMORY[0x263F28388];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28388], OS_LOG_TYPE_ERROR)) {
    sub_2349070E8(a1, v4);
  }
  return 0;
}

id sub_234903C5C(void *a1)
{
  id v1 = a1;
  int v5 = objc_msgSend_frequency(v1, v2, v3, v4);
  uint64_t v6 = sub_234903BC4(v5);
  uint64_t v10 = objc_msgSend_endDate(v1, v7, v8, v9);

  if (v10)
  {
    id v14 = objc_alloc(MEMORY[0x263F04BC8]);
    v18 = objc_msgSend_endDate(v1, v15, v16, v17);
    v21 = objc_msgSend_initWithEndDate_(v14, v19, (uint64_t)v18, v20);
  }
  else if (objc_msgSend_endCount(v1, v11, v12, v13) < 1)
  {
    v21 = 0;
  }
  else
  {
    id v22 = objc_alloc(MEMORY[0x263F04BC8]);
    uint64_t v26 = objc_msgSend_endCount(v1, v23, v24, v25);
    v21 = objc_msgSend_initWithOccurrenceCount_(v22, v27, v26, v28);
  }
  id v29 = objc_alloc(MEMORY[0x263F04BD8]);
  uint64_t v33 = objc_msgSend_interval(v1, v30, v31, v32);
  inited = objc_msgSend_initRecurrenceWithFrequency_interval_end_(v29, v34, v6, v33, v21);

  return inited;
}

id CreateAceEventFromEKEvent_0(void *a1, void *a2)
{
  uint64_t v191 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  sub_234902DF4();
  id v8 = objc_alloc_init(MEMORY[0x263F647E8]);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_externalURI(v3, v5, v6, v7);
    objc_msgSend_setIdentifier_(v8, v10, (uint64_t)v9, v11);

    v15 = objc_msgSend_externalURI(v3, v12, v13, v14);
    objc_msgSend_setCalendarPunchoutURI_(v8, v16, (uint64_t)v15, v17);

    v21 = objc_msgSend_title(v3, v18, v19, v20);
    objc_msgSend_setTitle_(v8, v22, (uint64_t)v21, v23);

    v27 = objc_msgSend_location(v3, v24, v25, v26);
    objc_msgSend_setLocation_(v8, v28, (uint64_t)v27, v29);

    uint64_t isAllDay = objc_msgSend_isAllDay(v3, v30, v31, v32);
    objc_msgSend_setAllDay_(v8, v34, isAllDay, v35);
    v39 = objc_msgSend_startDate(v3, v36, v37, v38);
    objc_msgSend_setStartDate_(v8, v40, (uint64_t)v39, v41);

    v45 = objc_msgSend_endDate(v3, v42, v43, v44);
    objc_msgSend_setEndDate_(v8, v46, (uint64_t)v45, v47);

    id v184 = v4;
    uint64_t v51 = objc_msgSend_name(v4, v48, v49, v50);
    objc_msgSend_setTimeZoneId_(v8, v52, (uint64_t)v51, v53);

    v57 = objc_msgSend_calendar(v3, v54, v55, v56);
    v61 = objc_msgSend_externalURI(v57, v58, v59, v60);
    objc_msgSend_setCalendarId_(v8, v62, (uint64_t)v61, v63);

    if ((objc_msgSend_isEditable(v3, v64, v65, v66) & 1) == 0)
    {
      v69 = objc_msgSend_numberWithBool_(NSNumber, v67, 1, v68);
      objc_msgSend_setReadOnly_(v8, v70, (uint64_t)v69, v71);
    }
    id v72 = v8;
    v76 = objc_msgSend_attendees(v3, v73, v74, v75);
    id v185 = v8;
    if (objc_msgSend_count(v76, v77, v78, v79))
    {
      v182 = v72;
      id v80 = objc_alloc(MEMORY[0x263EFF980]);
      v83 = objc_msgSend_initWithCapacity_(v80, v81, 0, v82);
      long long v186 = 0u;
      long long v187 = 0u;
      long long v188 = 0u;
      long long v189 = 0u;
      v180 = v76;
      id v84 = v76;
      uint64_t v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v85, (uint64_t)&v186, (uint64_t)v190, 16);
      if (v86)
      {
        uint64_t v90 = v86;
        uint64_t v91 = *(void *)v187;
        do
        {
          for (uint64_t i = 0; i != v90; ++i)
          {
            if (*(void *)v187 != v91) {
              objc_enumerationMutation(v84);
            }
            v93 = *(void **)(*((void *)&v186 + 1) + 8 * i);
            uint64_t v94 = objc_msgSend_name(v93, v87, v88, v89, v180);
            uint64_t v98 = objc_msgSend_emailAddress(v93, v95, v96, v97);
            if (v98 | v94)
            {
              id v99 = objc_alloc_init(MEMORY[0x263F64B30]);
              v102 = v99;
              if (v98) {
                objc_msgSend_setData_(v99, v100, v98, v101);
              }
              else {
                objc_msgSend_setData_(v99, v100, v94, v101);
              }
              if (v94) {
                objc_msgSend_setDisplayText_(v102, v103, v94, v104);
              }
              else {
                objc_msgSend_setDisplayText_(v102, v103, v98, v104);
              }
              objc_msgSend_addObject_(v83, v105, (uint64_t)v102, v106);
            }
          }
          uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v84, v87, (uint64_t)&v186, (uint64_t)v190, 16);
        }
        while (v90);
      }

      id v72 = v182;
      objc_msgSend_setAttendees_(v182, v107, (uint64_t)v83, v108);

      id v8 = v185;
      v76 = v180;
    }

    id v109 = v72;
    v113 = objc_msgSend_recurrenceRules(v3, v110, v111, v112);
    if (objc_msgSend_count(v113, v114, v115, v116))
    {
      v183 = v109;
      id v117 = objc_alloc(MEMORY[0x263EFF980]);
      uint64_t v121 = objc_msgSend_count(v113, v118, v119, v120);
      v124 = objc_msgSend_initWithCapacity_(v117, v122, v121, v123);
      long long v186 = 0u;
      long long v187 = 0u;
      long long v188 = 0u;
      long long v189 = 0u;
      v181 = v113;
      id v125 = v113;
      uint64_t v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v126, (uint64_t)&v186, (uint64_t)v190, 16);
      if (v127)
      {
        uint64_t v128 = v127;
        uint64_t v129 = *(void *)v187;
        do
        {
          for (uint64_t j = 0; j != v128; ++j)
          {
            if (*(void *)v187 != v129) {
              objc_enumerationMutation(v125);
            }
            v131 = *(void **)(*((void *)&v186 + 1) + 8 * j);
            id v132 = objc_alloc_init(MEMORY[0x263F647F8]);
            unint64_t v136 = objc_msgSend_frequency(v131, v133, v134, v135);
            if (v136 <= 3) {
              objc_msgSend_setFrequency_(v132, v137, (v136 + 1), v139);
            }
            uint64_t v140 = objc_msgSend_interval(v131, v137, v138, v139, v181);
            objc_msgSend_setInterval_(v132, v141, v140, v142);
            v146 = objc_msgSend_recurrenceEnd(v131, v143, v144, v145);
            v150 = v146;
            if (v146)
            {
              v151 = objc_msgSend_endDate(v146, v147, v148, v149);

              if (v151)
              {
                v155 = objc_msgSend_endDate(v150, v152, v153, v154);
                objc_msgSend_setEndDate_(v132, v156, (uint64_t)v155, v157);
              }
              else if (objc_msgSend_occurrenceCount(v150, v152, v153, v154))
              {
                uint64_t v159 = objc_msgSend_occurrenceCount(v150, v147, v158, v149);
                objc_msgSend_setEndCount_(v132, v160, v159, v161);
              }
            }
            objc_msgSend_addObject_(v124, v147, (uint64_t)v132, v149);
          }
          uint64_t v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v162, (uint64_t)&v186, (uint64_t)v190, 16);
        }
        while (v128);
      }

      id v109 = v183;
      objc_msgSend_setRecurrences_(v183, v163, (uint64_t)v124, v164);

      id v8 = v185;
      v113 = v181;
    }

    id v165 = v109;
    unint64_t v169 = objc_msgSend_selfParticipantStatus(v3, v166, v167, v168);
    if (v169 <= 7) {
      objc_msgSend_setSelfParticipantStatus_(v165, v170, **((void **)&unk_264BFA2C8 + v169), v171);
    }

    id v172 = v165;
    unint64_t v176 = objc_msgSend_status(v3, v173, v174, v175);
    id v4 = v184;
    if (v176 <= 3) {
      objc_msgSend_setStatus_(v172, v177, **((void **)&unk_264BFA308 + v176), v178);
    }
  }
  return v8;
}

void sub_234905D80(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_234905DBC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t sub_234905DEC()
{
  return v0;
}

void sub_234905DF8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_234905E60(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_234905E80(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v1 = a1;
  int v3 = 136315394;
  id v4 = "-[CalAssistantEventRetrieve performWithCompletion:]";
  __int16 v5 = 2112;
  id v6 = (id)objc_opt_class();
  id v2 = v6;
  _os_log_debug_impl(&dword_234900000, v1, OS_LOG_TYPE_DEBUG, "%s [%@] - Performing Event Retrieve", (uint8_t *)&v3, 0x16u);
}

void sub_234905F3C(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v1 = a1;
  int v3 = 138412290;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_debug_impl(&dword_234900000, v1, OS_LOG_TYPE_DEBUG, "[%@] - Performing Event Retrieve", (uint8_t *)&v3, 0xCu);
}

void sub_234905FE4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a2;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = *(void *)(a3 + 40);
  int v8 = 136315650;
  uint64_t v9 = "-[CalAssistantEventRetrieve performWithCompletion:]_block_invoke";
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  uint64_t v13 = v6;
  id v7 = v5;
  _os_log_debug_impl(&dword_234900000, v4, OS_LOG_TYPE_DEBUG, "%s [%@] - Returning results %@", (uint8_t *)&v8, 0x20u);
}

void sub_2349060B8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a2;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = *(void *)(a3 + 40);
  int v8 = 138412546;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v6;
  id v7 = v5;
  _os_log_debug_impl(&dword_234900000, v4, OS_LOG_TYPE_DEBUG, "[%@] - Returning results %@", (uint8_t *)&v8, 0x16u);
}

void sub_23490617C(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a1;
  int v3 = (void *)sub_234902D60();
  v6[0] = 136315394;
  id v4 = sub_234902D40(v3);
  sub_234902D78(&dword_234900000, v1, v5, "%s [%@] - There are no visible calendars.  Will not fetch events.", (uint8_t *)v6);
}

void sub_234906218(void *a1)
{
  id v2 = a1;
  id v3 = (id)sub_234902D60();
  sub_234902DB0(&dword_234900000, v4, v5, "[%@] - There are no visible calendars.  Will not fetch events.", v6, v7, v8, v9, 2u);
}

void sub_2349062A8(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  id v3 = (void *)sub_234902D60();
  v5[0] = 136315394;
  id v4 = sub_234902D40(v3);
  _os_log_error_impl(&dword_234900000, v1, OS_LOG_TYPE_ERROR, "%s [%@] - Predicate was nil", (uint8_t *)v5, 0x16u);
}

void sub_23490634C(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  int v4 = 138412290;
  id v5 = (id)sub_234902D60();
  id v3 = v5;
  _os_log_error_impl(&dword_234900000, v1, OS_LOG_TYPE_ERROR, "[%@] - Predicate was nil", (uint8_t *)&v4, 0xCu);
}

void sub_2349063EC()
{
  sub_234902DE8();
  id v2 = v1;
  id v3 = (id)sub_234902DD0();
  sub_234902D90(&dword_234900000, v4, v5, "%s [%@] - Event Search completed with results %@", v6, v7, v8, v9, 2u);
}

void sub_2349064A0()
{
  sub_234902DE8();
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = v2;
  int v6 = 138412546;
  id v7 = (id)sub_234902DD0();
  __int16 v8 = 2112;
  uint64_t v9 = v0;
  id v4 = v7;
  sub_234902D78(&dword_234900000, v1, v5, "[%@] - Event Search completed with results %@", (uint8_t *)&v6);
}

void sub_23490654C()
{
  sub_234902DE8();
  id v3 = v2;
  id v4 = (id)sub_234902DD0();
  objc_msgSend_count(v0, v5, v6, v7);
  sub_234902D90(&dword_234900000, v8, v9, "%s [%@] - Found %ld matching events", v10, v11, v12, v13, 2u);
}

void sub_234906610()
{
  sub_234902DE8();
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = v2;
  id v4 = (void *)sub_234902DD0();
  id v5 = v4;
  int v10 = 138412546;
  uint64_t v11 = v4;
  __int16 v12 = 2048;
  uint64_t v13 = objc_msgSend_count(v0, v6, v7, v8);
  sub_234902D78(&dword_234900000, v1, v9, "[%@] - Found %ld matching events", (uint8_t *)&v10);
}

void sub_2349066C8(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a1;
  id v3 = (void *)sub_234902D60();
  v6[0] = 136315394;
  id v4 = sub_234902D40(v3);
  sub_234902D78(&dword_234900000, v1, v5, "%s [%@] - Performing Event Search", (uint8_t *)v6);
}

void sub_234906764(void *a1)
{
  id v2 = a1;
  id v3 = (id)sub_234902D60();
  sub_234902DB0(&dword_234900000, v4, v5, "[%@] - Performing Event Search", v6, v7, v8, v9, 2u);
}

void sub_2349067F4(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "+[EKEventStore(CalAssistant) _ca_performBlock:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_234900000, a2, OS_LOG_TYPE_ERROR, "%s We weren't granted access to EventKit. %@", (uint8_t *)&v2, 0x16u);
}

void sub_234906880(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_234900000, a2, OS_LOG_TYPE_ERROR, "We weren't granted access to EventKit. %@", (uint8_t *)&v2, 0xCu);
}

void sub_2349068F8(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (void *)sub_234902D60();
  id v4 = sub_234902D40(v3);
  sub_2349038E4(&dword_234900000, v5, v6, "%s [%@] - Performing Event Delete", v7, v8, v9, v10, 2u);
}

void sub_23490698C(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (void *)sub_234902D60();
  id v4 = sub_234903904(v3);
  sub_234902DB0(&dword_234900000, v5, v6, "[%@] - Performing Event Delete", v7, v8, v9, v10, v11);
}

void sub_234906A14(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (void *)sub_234902D60();
  id v4 = sub_234902D40(v3);
  sub_2349038E4(&dword_234900000, v5, v6, "%s [%@] - Validation failed because the event identifier was nil", v7, v8, v9, v10, 2u);
}

void sub_234906AA8(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (void *)sub_234902D60();
  id v4 = sub_234903904(v3);
  sub_234902DB0(&dword_234900000, v5, v6, "[%@] - Validation failed because the event identifier was nil", v7, v8, v9, v10, v11);
}

void sub_234906B30(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_opt_class();
  id v3 = v2;
  int v5 = 136315650;
  uint64_t v6 = "-[CalAssistantEventDelete _validateEvent:]";
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  __int16 v9 = 2112;
  id v10 = (id)objc_opt_class();
  id v4 = v10;
  _os_log_debug_impl(&dword_234900000, v1, OS_LOG_TYPE_DEBUG, "%s [%@] - Validation failed because event was of class [%@], not the expected class SACalendarEvent", (uint8_t *)&v5, 0x20u);
}

void sub_234906C18(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_opt_class();
  id v3 = v2;
  int v5 = 138412546;
  uint64_t v6 = v2;
  __int16 v7 = 2112;
  id v8 = (id)objc_opt_class();
  id v4 = v8;
  _os_log_debug_impl(&dword_234900000, v1, OS_LOG_TYPE_DEBUG, "[%@] - Validation failed because event was of class [%@], not the expected class SACalendarEvent", (uint8_t *)&v5, 0x16u);
}

void sub_234906CF0(void *a1)
{
  id v2 = a1;
  id v3 = (void *)sub_234902D60();
  id v4 = sub_234902D40(v3);
  sub_2349038E4(&dword_234900000, v5, v6, "%s [%@] - Event deletion failed because the event was not in the event store", v7, v8, v9, v10, 2u);
}

void sub_234906D84(void *a1)
{
  id v2 = a1;
  id v3 = (void *)sub_234902D60();
  id v4 = sub_234903904(v3);
  sub_234902DB0(&dword_234900000, v5, v6, "[%@] - Event deletion failed because the event was not in the event store", v7, v8, v9, v10, v11);
}

void sub_234906E0C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a1;
  uint64_t v5 = objc_opt_class();
  id v6 = v5;
  uint64_t v10 = objc_msgSend_localizedDescription(a3, v7, v8, v9);
  int v11 = 136315650;
  __int16 v12 = "-[CalAssistantEventDelete _deleteEvent:]";
  __int16 v13 = 2112;
  uint64_t v14 = v5;
  __int16 v15 = 2112;
  uint64_t v16 = v10;
  _os_log_debug_impl(&dword_234900000, v4, OS_LOG_TYPE_DEBUG, "%s [%@] - Event deletion failed because removeEvent returned a non nil error: [%@]", (uint8_t *)&v11, 0x20u);
}

void sub_234906EF4(void *a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a1;
  uint64_t v5 = objc_opt_class();
  id v6 = v5;
  uint64_t v10 = objc_msgSend_localizedDescription(a3, v7, v8, v9);
  int v11 = 138412546;
  __int16 v12 = v5;
  __int16 v13 = 2112;
  uint64_t v14 = v10;
  _os_log_debug_impl(&dword_234900000, v4, OS_LOG_TYPE_DEBUG, "[%@] - Event deletion failed because removeEvent returned a non nil error: [%@]", (uint8_t *)&v11, 0x16u);
}

void sub_234906FCC(void *a1)
{
  id v2 = a1;
  id v3 = (void *)sub_234902D60();
  id v4 = sub_234902D40(v3);
  sub_2349038E4(&dword_234900000, v5, v6, "%s [%@] - Event deletion failed because the event was read only", v7, v8, v9, v10, 2u);
}

void sub_234907060(void *a1)
{
  id v2 = a1;
  id v3 = (void *)sub_234902D60();
  id v4 = sub_234903904(v3);
  sub_234902DB0(&dword_234900000, v5, v6, "[%@] - Event deletion failed because the event was read only", v7, v8, v9, v10, v11);
}

void sub_2349070E8(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "EKRecurrenceFrequencyFromSACalendarRecurrenceFrequency";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_234900000, a2, OS_LOG_TYPE_ERROR, "%s Error: Invalid SACalendarRecurrenceFrequency [%d]", (uint8_t *)&v2, 0x12u);
}

void sub_234907174(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_234900000, a2, OS_LOG_TYPE_ERROR, "Error: Invalid SACalendarRecurrenceFrequency [%d]", (uint8_t *)v2, 8u);
}

void sub_2349071EC()
{
  id v0 = (id)objc_opt_class();
  sub_234905DDC();
  sub_234905D80(&dword_234900000, v1, v2, "%s [%@] - Event committed successfully", v3, v4, v5, v6, 2u);
}

void sub_234907284()
{
  id v0 = (id)objc_opt_class();
  sub_234905E34();
  sub_234905DF8(&dword_234900000, v1, v2, "[%@] - Event committed successfully", v3, v4, v5, v6, v7);
}

void sub_23490730C()
{
  id v0 = (id)objc_opt_class();
  sub_234905DDC();
  sub_234905D80(&dword_234900000, v1, v2, "%s [%@] - Event saved successfully", v3, v4, v5, v6, 2u);
}

void sub_2349073A4()
{
  id v0 = (id)objc_opt_class();
  sub_234905E34();
  sub_234905DF8(&dword_234900000, v1, v2, "[%@] - Event saved successfully", v3, v4, v5, v6, v7);
}

void sub_23490742C()
{
  sub_234902DE8();
  uint64_t v3 = *MEMORY[0x263EF8340];
  id v1 = (id)objc_opt_class();
  v2[0] = 136315650;
  sub_234905E18();
  _os_log_error_impl(&dword_234900000, v0, OS_LOG_TYPE_ERROR, "%s [%@] - Event failed to save with error %@", (uint8_t *)v2, 0x20u);
}

void sub_2349074D8()
{
  sub_234902DE8();
  id v0 = (id)objc_opt_class();
  sub_234905E50();
  sub_234905E60(&dword_234900000, v1, v2, "[%@] - Event failed to save with error %@", v3, v4, v5, v6, 2u);
}

void sub_234907570()
{
  id v0 = (id)objc_opt_class();
  sub_234905DDC();
  sub_234905E60(&dword_234900000, v1, v2, "%s [%@] - Calendar plugin doesn't handle multiple recurrences.", v3, v4, v5, v6, 2u);
}

void sub_234907608(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = (id)objc_opt_class();
  sub_234905E34();
  _os_log_error_impl(&dword_234900000, a2, OS_LOG_TYPE_ERROR, "[%@] - Calendar plugin doesn't handle multiple recurrences.", v4, 0xCu);
}

void sub_2349076A0()
{
  sub_234902DE8();
  id v0 = (id)objc_opt_class();
  sub_234905E18();
  sub_234905DBC(&dword_234900000, v1, v2, "%s [%@] - Giving event recurrence rule %@", v3, v4, v5, v6, 2u);
}

void sub_23490773C()
{
  sub_234902DE8();
  id v0 = (id)objc_opt_class();
  sub_234905E50();
  sub_234905D80(&dword_234900000, v1, v2, "[%@] - Giving event recurrence rule %@", v3, v4, v5, v6, 2u);
}

void sub_2349077D4()
{
  sub_234902DE8();
  id v1 = (id)objc_opt_class();
  uint64_t v2 = (void *)sub_234905DEC();
  uint64_t v6 = objc_msgSend_title(v2, v3, v4, v5);
  sub_234905DA0();
  sub_234905DBC(&dword_234900000, v7, v8, "%s [%@] - Event title is now %@", v9, v10, v11, v12, 2u);
}

void sub_234907880()
{
  sub_234902DE8();
  id v1 = (id)objc_opt_class();
  uint64_t v2 = (void *)sub_234905DEC();
  uint64_t v6 = objc_msgSend_title(v2, v3, v4, v5);
  sub_234905DDC();
  sub_234905D80(&dword_234900000, v7, v8, "[%@] - Event title is now %@", v9, v10, v11, v12, 2u);
}

void sub_234907928()
{
  id v5 = (id)objc_opt_class();
  sub_234905E40();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x1Cu);
}

void sub_2349079EC()
{
  id v0 = (id)objc_opt_class();
  sub_234905E34();
  sub_234905E40();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x12u);
}

void sub_234907A98()
{
  sub_234902DE8();
  id v10 = (id)objc_opt_class();
  objc_msgSend_count(v0, v1, v2, v3);
  sub_234905DBC(&dword_234900000, v4, v5, "%s [%@] - Giving event %ld attendees", v6, v7, v8, v9, 2u);
}

void sub_234907B54()
{
  sub_234902DE8();
  id v1 = (id)objc_opt_class();
  objc_msgSend_count(v0, v2, v3, v4);
  sub_234905D80(&dword_234900000, v5, v6, "[%@] - Giving event %ld attendees", v7, v8, v9, v10, 2u);
}

void sub_234907BFC(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = (id)objc_opt_class();
  uint64_t v9 = objc_msgSend_startDate(a2, v6, v7, v8);
  __int16 v13 = objc_msgSend_endDate(a2, v10, v11, v12);
  int v17 = 136316162;
  v18 = "-[CalAssistantEventCommit _commitEvent:serviceHelper:]";
  __int16 v19 = 2112;
  id v20 = v5;
  __int16 v21 = 2112;
  id v22 = v9;
  __int16 v23 = 2112;
  uint64_t v24 = v13;
  __int16 v25 = 1024;
  int isAllDay = objc_msgSend_isAllDay(a2, v14, v15, v16);
  _os_log_debug_impl(&dword_234900000, a3, OS_LOG_TYPE_DEBUG, "%s [%@] - Event has start date %@, end date %@, all day %d", (uint8_t *)&v17, 0x30u);
}

void sub_234907D0C(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = (id)objc_opt_class();
  uint64_t v9 = objc_msgSend_startDate(a2, v6, v7, v8);
  __int16 v13 = objc_msgSend_endDate(a2, v10, v11, v12);
  int v17 = 138413058;
  id v18 = v5;
  __int16 v19 = 2112;
  id v20 = v9;
  __int16 v21 = 2112;
  id v22 = v13;
  __int16 v23 = 1024;
  int isAllDay = objc_msgSend_isAllDay(a2, v14, v15, v16);
  _os_log_debug_impl(&dword_234900000, a3, OS_LOG_TYPE_DEBUG, "[%@] - Event has start date %@, end date %@, all day %d", (uint8_t *)&v17, 0x26u);
}

void sub_234907E0C()
{
  sub_234902DE8();
  id v1 = (id)objc_opt_class();
  uint64_t v2 = (void *)sub_234905DEC();
  uint64_t v6 = objc_msgSend_notes(v2, v3, v4, v5);
  sub_234905DA0();
  sub_234905DBC(&dword_234900000, v7, v8, "%s [%@] - Giving event notes %@", v9, v10, v11, v12, 2u);
}

void sub_234907EB8()
{
  sub_234902DE8();
  id v1 = (id)objc_opt_class();
  uint64_t v2 = (void *)sub_234905DEC();
  uint64_t v6 = objc_msgSend_notes(v2, v3, v4, v5);
  sub_234905DDC();
  sub_234905D80(&dword_234900000, v7, v8, "[%@] - Giving event notes %@", v9, v10, v11, v12, 2u);
}

void sub_234907F60()
{
  sub_234902DE8();
  id v1 = (id)objc_opt_class();
  uint64_t v2 = (void *)sub_234905DEC();
  uint64_t v6 = objc_msgSend_location(v2, v3, v4, v5);
  sub_234905DA0();
  sub_234905DBC(&dword_234900000, v7, v8, "%s [%@] - Giving event location %@", v9, v10, v11, v12, 2u);
}

void sub_23490800C()
{
  sub_234902DE8();
  id v1 = (id)objc_opt_class();
  uint64_t v2 = (void *)sub_234905DEC();
  uint64_t v6 = objc_msgSend_location(v2, v3, v4, v5);
  sub_234905DDC();
  sub_234905D80(&dword_234900000, v7, v8, "[%@] - Giving event location %@", v9, v10, v11, v12, 2u);
}

void sub_2349080B4()
{
  sub_234902DE8();
  id v1 = (id)objc_opt_class();
  uint64_t v2 = (void *)sub_234905DEC();
  uint64_t v6 = objc_msgSend_title(v2, v3, v4, v5);
  sub_234905DA0();
  sub_234905DBC(&dword_234900000, v7, v8, "%s [%@] - Giving event title %@", v9, v10, v11, v12, 2u);
}

void sub_234908160()
{
  sub_234902DE8();
  id v1 = (id)objc_opt_class();
  uint64_t v2 = (void *)sub_234905DEC();
  uint64_t v6 = objc_msgSend_title(v2, v3, v4, v5);
  sub_234905DDC();
  sub_234905D80(&dword_234900000, v7, v8, "[%@] - Giving event title %@", v9, v10, v11, v12, 2u);
}

void sub_234908208()
{
  sub_234902DE8();
  id v1 = (id)objc_opt_class();
  uint64_t v2 = (void *)sub_234905DEC();
  uint64_t v6 = objc_msgSend_calendar(v2, v3, v4, v5);
  uint64_t v10 = objc_msgSend_title(v6, v7, v8, v9);
  sub_234905DA0();
  sub_234905DBC(&dword_234900000, v11, v12, "%s [%@] - Created a new event in calendar %@", v13, v14, v15, v16, 2u);
}

void sub_2349082C4()
{
  sub_234902DE8();
  id v1 = (id)objc_opt_class();
  uint64_t v2 = (void *)sub_234905DEC();
  uint64_t v6 = objc_msgSend_calendar(v2, v3, v4, v5);
  uint64_t v10 = objc_msgSend_title(v6, v7, v8, v9);
  sub_234905DDC();
  sub_234905D80(&dword_234900000, v11, v12, "[%@] - Created a new event in calendar %@", v13, v14, v15, v16, 2u);
}

void sub_23490837C(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_opt_class();
  int v4 = 136315394;
  uint64_t v5 = "-[CalAssistantEventCommit _commitEvent:serviceHelper:]";
  sub_234905DDC();
  id v3 = v2;
  _os_log_error_impl(&dword_234900000, v1, OS_LOG_TYPE_ERROR, "%s [%@] - Can't modify a read-only event", (uint8_t *)&v4, 0x16u);
}

void sub_234908430(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_opt_class();
  sub_234905E34();
  id v3 = v2;
  _os_log_error_impl(&dword_234900000, v1, OS_LOG_TYPE_ERROR, "[%@] - Can't modify a read-only event", v4, 0xCu);
}

void sub_2349084D4()
{
  sub_234902DE8();
  id v1 = (id)objc_opt_class();
  id v2 = (void *)sub_234905DEC();
  uint64_t v11 = objc_msgSend_title(v2, v3, v4, v5);
  sub_234905E40();
  _os_log_debug_impl(v6, v7, v8, v9, v10, 0x2Au);
}

void sub_2349085A4()
{
  sub_234902DE8();
  id v1 = (id)objc_opt_class();
  id v2 = (void *)sub_234905DEC();
  uint64_t v6 = objc_msgSend_title(v2, v3, v4, v5);
  sub_234905E50();
  sub_234905DBC(&dword_234900000, v7, v8, "[%@] - Found existing event %@ with title %@", v9, v10, v11, v12, 2u);
}

void sub_234908654()
{
  sub_234902DE8();
  id v1 = (id)objc_opt_class();
  id v2 = (void *)sub_234905DEC();
  uint64_t v6 = objc_msgSend_identifier(v2, v3, v4, v5);
  sub_234905DA0();
  sub_234905DBC(&dword_234900000, v7, v8, "%s [%@] - Looking for event with identifier %@", v9, v10, v11, v12, 2u);
}

void sub_234908700()
{
  sub_234902DE8();
  id v1 = (id)objc_opt_class();
  id v2 = (void *)sub_234905DEC();
  uint64_t v6 = objc_msgSend_identifier(v2, v3, v4, v5);
  sub_234905DDC();
  sub_234905D80(&dword_234900000, v7, v8, "[%@] - Looking for event with identifier %@", v9, v10, v11, v12, 2u);
}

void sub_2349087A8()
{
  id v0 = (id)objc_opt_class();
  sub_234905DDC();
  sub_234905D80(&dword_234900000, v1, v2, "%s [%@] - Performing Event Commit", v3, v4, v5, v6, 2u);
}

void sub_234908840()
{
  id v0 = (id)objc_opt_class();
  sub_234905E34();
  sub_234905DF8(&dword_234900000, v1, v2, "[%@] - Performing Event Commit", v3, v4, v5, v6, v7);
}

CFAbsoluteTime CFAbsoluteTimeAddGregorianUnits(CFAbsoluteTime at, CFTimeZoneRef tz, CFGregorianUnits *units)
{
  MEMORY[0x270EE4270](tz, units, at);
  return result;
}

void CFRelease(CFTypeRef cf)
{
}

CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev)
{
  return (CFTimeZoneRef)MEMORY[0x270EE52F0](allocator, name, tryAbbrev);
}

uint64_t CalCopyTimeZone()
{
  return MEMORY[0x270F14990]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}