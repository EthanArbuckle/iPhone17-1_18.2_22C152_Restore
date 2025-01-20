@interface CalAssistantEventCommit
- (id)_commitEvent:(id)a3 serviceHelper:(id)a4;
- (id)_validateEvent:(id)a3;
- (id)eventStore;
- (void)performWithCompletion:(id)a3;
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
- (void)setEventStore:(id)a3;
@end

@implementation CalAssistantEventCommit

- (id)eventStore
{
  eventStore = self->_eventStore;
  if (!eventStore)
  {
    objc_msgSend__ca_eventStoreWithError_(MEMORY[0x263F04B98], a2, 0, v2);
    v5 = (EKEventStore *)objc_claimAutoreleasedReturnValue();
    v6 = self->_eventStore;
    self->_eventStore = v5;

    eventStore = self->_eventStore;
  }

  return eventStore;
}

- (void)setEventStore:(id)a3
{
  if (self->_eventStore != a3) {
    objc_storeStrong((id *)&self->_eventStore, a3);
  }

  MEMORY[0x270F9A758]();
}

- (id)_validateEvent:(id)a3
{
  id v3 = a3;
  v7 = objc_msgSend_title(v3, v4, v5, v6);

  if (!v7)
  {
    id v20 = objc_alloc(MEMORY[0x263F64820]);
    v23 = objc_msgSend_initWithReason_(v20, v21, @"No title specified", v22);
    goto LABEL_11;
  }
  v11 = objc_msgSend_startDate(v3, v8, v9, v10);
  uint64_t v15 = objc_msgSend_endDate(v3, v12, v13, v14);
  v18 = (void *)v15;
  if (v11)
  {
    if (v15)
    {
      if (objc_msgSend_compare_(v11, v16, v15, v17) != 1)
      {
        v23 = 0;
        goto LABEL_10;
      }
      v19 = @"End date cannot be earlier than start date";
    }
    else
    {
      v19 = @"No end date specified";
    }
  }
  else
  {
    v19 = @"No start date specified";
  }
  id v24 = objc_alloc(MEMORY[0x263F64820]);
  v23 = objc_msgSend_initWithReason_(v24, v25, (uint64_t)v19, v26);
LABEL_10:

LABEL_11:

  return v23;
}

- (id)_commitEvent:(id)a3 serviceHelper:(id)a4
{
  uint64_t v419 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  sub_234902DF4();
  v7 = (id)qword_2687CDEB0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_234908840();
  }

  v8 = (id)*MEMORY[0x263F28388];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_2349087A8();
  }

  objc_msgSend_timeZoneId(v5, v9, v10, v11);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v12) {
    uint64_t v13 = (uint64_t)CFTimeZoneCreateWithName(0, v12, 1u);
  }
  else {
    uint64_t v13 = CalCopyTimeZone();
  }
  uint64_t v17 = v13;
  if (!v13)
  {
    id v70 = objc_alloc(MEMORY[0x263F64820]);
    id v73 = (id)objc_msgSend_initWithReason_(v70, v71, @"Invalid timezone", v72);
    goto LABEL_170;
  }
  v18 = objc_msgSend_eventStore(self, v14, v15, v16);
  cf = (void *)v17;
  objc_msgSend_setTimeZone_(v18, v19, v17, v20);

  id v24 = objc_msgSend_startDate(v5, v21, v22, v23);
  v392 = objc_msgSend_endDate(v5, v25, v26, v27);
  sub_234902DF4();
  v28 = (id)qword_2687CDEB0;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    id v379 = (id)objc_opt_class();
    units.years = 138412802;
    *(void *)&units.months = v379;
    LOWORD(units.hours) = 2112;
    *(void *)((char *)&units.hours + 2) = v24;
    *((_WORD *)&units.minutes + 3) = 2112;
    *(void *)&units.seconds = v392;
    _os_log_debug_impl(&dword_234900000, v28, OS_LOG_TYPE_DEBUG, "[%@] - Giving event start date %@ and end date %@", (uint8_t *)&units, 0x20u);
  }
  v29 = (id)*MEMORY[0x263F28388];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    id v380 = (id)objc_opt_class();
    units.years = 136315906;
    *(void *)&units.months = "-[CalAssistantEventCommit _commitEvent:serviceHelper:]";
    LOWORD(units.hours) = 2112;
    *(void *)((char *)&units.hours + 2) = v380;
    *((_WORD *)&units.minutes + 3) = 2112;
    *(void *)&units.seconds = v24;
    __int16 v417 = 2112;
    v418 = v392;
    _os_log_debug_impl(&dword_234900000, v29, OS_LOG_TYPE_DEBUG, "%s [%@] - Giving event start date %@ and end date %@", (uint8_t *)&units, 0x2Au);
  }
  v33 = objc_msgSend_identifier(v5, v30, v31, v32);
  uint64_t v37 = objc_msgSend_scheme(v33, v34, v35, v36);
  if (!v37)
  {

LABEL_28:
    v74 = (void *)MEMORY[0x263F04B90];
    v75 = objc_msgSend_eventStore(self, v49, v50, v51);
    v63 = objc_msgSend_eventWithEventStore_(v74, v76, (uint64_t)v75, v77);

    v81 = objc_msgSend_eventStore(self, v78, v79, v80);
    v85 = objc_msgSend_acquireDefaultCalendarForNewEvents(v81, v82, v83, v84);
    objc_msgSend_setCalendar_(v63, v86, (uint64_t)v85, v87);

    sub_234902DF4();
    v88 = (id)qword_2687CDEB0;
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG)) {
      sub_2349082C4();
    }

    v89 = (id)*MEMORY[0x263F28388];
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG)) {
      sub_234908208();
    }

    int v69 = 0;
    goto LABEL_33;
  }
  v41 = (void *)v37;
  v42 = objc_msgSend_identifier(v5, v38, v39, v40);
  v46 = objc_msgSend_scheme(v42, v43, v44, v45);
  uint64_t v48 = objc_msgSend_compare_options_(v46, v47, *MEMORY[0x263F04C28], 1);

  if (v48) {
    goto LABEL_28;
  }
  sub_234902DF4();
  v52 = (id)qword_2687CDEB0;
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
    sub_234908700();
  }

  v53 = (id)*MEMORY[0x263F28388];
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
    sub_234908654();
  }

  v57 = objc_msgSend_eventStore(self, v54, v55, v56);
  v61 = objc_msgSend_identifier(v5, v58, v59, v60);
  v63 = objc_msgSend__eventWithURI_checkValid_(v57, v62, (uint64_t)v61, 1);

  sub_234902DF4();
  v64 = (id)qword_2687CDEB0;
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
    sub_2349085A4();
  }

  v65 = (id)*MEMORY[0x263F28388];
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
    sub_2349084D4();
  }

  if (!v63) {
    goto LABEL_28;
  }
  if ((objc_msgSend_isEditable(v63, v49, v50, v51) & 1) == 0)
  {
    sub_234902DF4();
    v374 = (void *)qword_2687CDEB0;
    if (os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_ERROR)) {
      sub_234908430(v374);
    }
    v375 = (void *)*MEMORY[0x263F28388];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28388], OS_LOG_TYPE_ERROR)) {
      sub_23490837C(v375);
    }
    CFRelease(cf);
    id v376 = objc_alloc(MEMORY[0x263F64820]);
    id v73 = (id)objc_msgSend_initWithReason_(v376, v377, @"Can't modify a read-only event.", v378);
    goto LABEL_169;
  }
  int v69 = 1;
LABEL_33:
  v90 = objc_msgSend_title(v5, v66, v67, v68);

  if (v90)
  {
    v94 = objc_msgSend_title(v5, v91, v92, v93);
    objc_msgSend_setTitle_(v63, v95, (uint64_t)v94, v96);

    sub_234902DF4();
    v97 = (id)qword_2687CDEB0;
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG)) {
      sub_234908160();
    }

    v98 = (id)*MEMORY[0x263F28388];
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG)) {
      sub_2349080B4();
    }
  }
  v99 = objc_msgSend_location(v5, v91, v92, v93);

  if (v99)
  {
    v103 = objc_msgSend_location(v5, v100, v101, v102);
    objc_msgSend_setLocation_(v63, v104, (uint64_t)v103, v105);

    sub_234902DF4();
    v106 = (id)qword_2687CDEB0;
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG)) {
      sub_23490800C();
    }

    v107 = (id)*MEMORY[0x263F28388];
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG)) {
      sub_234907F60();
    }
  }
  v108 = objc_msgSend_notes(v5, v100, v101, v102);

  if (v108)
  {
    v112 = objc_msgSend_notes(v5, v109, v110, v111);
    objc_msgSend_setNotes_(v63, v113, (uint64_t)v112, v114);

    sub_234902DF4();
    v115 = (id)qword_2687CDEB0;
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG)) {
      sub_234907EB8();
    }

    v116 = (id)*MEMORY[0x263F28388];
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG)) {
      sub_234907E0C();
    }
  }
  objc_msgSend_setStartDate_(v63, v109, (uint64_t)v24, v111);
  uint64_t v120 = (uint64_t)v392;
  if (!v392)
  {
    v121 = objc_msgSend_endDate(v63, v117, v118, v119);

    if (v121)
    {
      uint64_t v120 = 0;
    }
    else
    {
      objc_msgSend_timeIntervalSinceReferenceDate(v24, v117, v122, v119);
      *(void *)&units.years = 0;
      *(void *)&units.days = 0x100000000;
      *(void *)&units.minutes = 0;
      units.seconds = 0.0;
      CFAbsoluteTime v124 = CFAbsoluteTimeAddGregorianUnits(v123, (CFTimeZoneRef)cf, &units);
      uint64_t v120 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x263EFF910], v125, v126, v127, v124);
    }
  }
  v392 = (void *)v120;
  objc_msgSend_setEndDate_(v63, v117, v120, v119);
  objc_msgSend_setTimeZone_(v63, v128, (uint64_t)cf, v129);
  uint64_t v133 = objc_msgSend_allDay(v5, v130, v131, v132);
  objc_msgSend_setAllDay_(v63, v134, v133, v135);
  sub_234902DF4();
  v136 = (id)qword_2687CDEB0;
  if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG)) {
    sub_234907D0C((uint64_t)self, v63, v136);
  }

  v137 = (id)*MEMORY[0x263F28388];
  if (os_log_type_enabled(v137, OS_LOG_TYPE_DEBUG)) {
    sub_234907BFC((uint64_t)self, v63, v137);
  }

  v390 = objc_msgSend_attendees(v5, v138, v139, v140);
  v387 = v12;
  v388 = v6;
  v386 = v24;
  v389 = v5;
  if (objc_msgSend_count(v390, v141, v142, v143))
  {
    sub_234902DF4();
    v147 = (id)qword_2687CDEB0;
    if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG)) {
      sub_234907B54();
    }

    v148 = (id)*MEMORY[0x263F28388];
    if (os_log_type_enabled(v148, OS_LOG_TYPE_DEBUG)) {
      sub_234907A98();
    }

    v395 = objc_msgSend_array(MEMORY[0x263EFF980], v149, v150, v151);
    v155 = objc_msgSend_calendar(v63, v152, v153, v154);
    v159 = objc_msgSend_source(v155, v156, v157, v158);
    v163 = objc_msgSend_constraints(v159, v160, v161, v162);
    int v167 = objc_msgSend_supportsOutgoingInvitations(v163, v164, v165, v166);

    if (v167)
    {
      v171 = objc_msgSend_constraints(v159, v168, v169, v170);
      int v175 = objc_msgSend_requiresOutgoingInvitationsInDefaultCalendar(v171, v172, v173, v174);

      if (v175) {
        int isDefaultSchedulingCalendar = objc_msgSend_isDefaultSchedulingCalendar(v155, v176, v177, v178);
      }
      else {
        int isDefaultSchedulingCalendar = 1;
      }
    }
    else
    {
      int isDefaultSchedulingCalendar = 0;
    }
    sub_234902DF4();
    v179 = (id)qword_2687CDEB0;
    if (os_log_type_enabled(v179, OS_LOG_TYPE_DEBUG)) {
      sub_2349079EC();
    }
    v383 = v155;
    int v385 = v69;

    v180 = (id)*MEMORY[0x263F28388];
    if (os_log_type_enabled(v180, OS_LOG_TYPE_DEBUG)) {
      sub_234907928();
    }
    v381 = v159;
    v396 = v63;

    long long v411 = 0u;
    long long v412 = 0u;
    long long v409 = 0u;
    long long v410 = 0u;
    obuint64_t j = v390;
    uint64_t v182 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v181, (uint64_t)&v409, (uint64_t)v415, 16);
    if (v182)
    {
      uint64_t v186 = v182;
      int v394 = 0;
      uint64_t v187 = *(void *)v410;
      do
      {
        for (uint64_t i = 0; i != v186; ++i)
        {
          if (*(void *)v410 != v187) {
            objc_enumerationMutation(obj);
          }
          v189 = *(void **)(*((void *)&v409 + 1) + 8 * i);
          v193 = objc_msgSend_object(v189, v183, v184, v185);
          if (v193)
          {
            v194 = objc_msgSend_data(v189, v190, v191, v192);
            v198 = objc_msgSend_displayText(v189, v195, v196, v197);
            v199 = (void *)MEMORY[0x263F333F8];
            v203 = objc_msgSend_identifier(v193, v200, v201, v202);
            v206 = objc_msgSend_externalIdentifierFromAssistantID_(v199, v204, (uint64_t)v203, v205);

            v210 = objc_msgSend_emails(v193, v207, v208, v209);
            uint64_t v214 = objc_msgSend_count(v210, v211, v212, v213);

            if (v214)
            {
              v218 = objc_msgSend_emails(v193, v215, v216, v217);
              v221 = objc_msgSend_objectAtIndex_(v218, v219, 0, v220);
              v225 = objc_msgSend_emailAddress(v221, v222, v223, v224);

              sub_234902DF4();
              v226 = (id)qword_2687CDEB0;
              if (os_log_type_enabled(v226, OS_LOG_TYPE_DEBUG))
              {
                id v245 = (id)objc_opt_class();
                units.years = 138412546;
                *(void *)&units.months = v245;
                LOWORD(units.hours) = 2112;
                *(void *)((char *)&units.hours + 2) = v225;
                _os_log_debug_impl(&dword_234900000, v226, OS_LOG_TYPE_DEBUG, "[%@] - Attendee has email %@", (uint8_t *)&units, 0x16u);
              }
              v227 = (id)*MEMORY[0x263F28388];
              if (os_log_type_enabled(v227, OS_LOG_TYPE_DEBUG))
              {
                id v246 = (id)objc_opt_class();
                units.years = 136315650;
                *(void *)&units.months = "-[CalAssistantEventCommit _commitEvent:serviceHelper:]";
                LOWORD(units.hours) = 2112;
                *(void *)((char *)&units.hours + 2) = v246;
                *((_WORD *)&units.minutes + 3) = 2112;
                *(void *)&units.seconds = v225;
                _os_log_debug_impl(&dword_234900000, v227, OS_LOG_TYPE_DEBUG, "%s [%@] - Attendee has email %@", (uint8_t *)&units, 0x20u);
              }
            }
            else
            {
              v225 = v194;
            }
            int v228 = isDefaultSchedulingCalendar;
            if (!v225) {
              int v228 = 0;
            }
            if (v228 == 1)
            {
              v229 = (void *)MEMORY[0x263F04B28];
              if (v206)
              {
                v230 = objc_msgSend_URLWithString_(NSURL, v215, (uint64_t)v206, v217);
                v232 = objc_msgSend_attendeeWithName_emailAddress_phoneNumber_url_(v229, v231, (uint64_t)v198, (uint64_t)v225, 0, v230);
              }
              else
              {
                v232 = objc_msgSend_attendeeWithName_emailAddress_phoneNumber_url_(MEMORY[0x263F04B28], v215, (uint64_t)v198, (uint64_t)v225, 0, 0);
              }
              objc_msgSend_setParticipantType_(v232, v233, 1, v234);
              objc_msgSend_setParticipantStatus_(v232, v235, 0, v236);
              objc_msgSend_setParticipantRole_(v232, v237, 1, v238);
              objc_msgSend_addObject_(v395, v239, (uint64_t)v232, v240);
              objc_msgSend_addAttendee_(v396, v241, (uint64_t)v232, v242);
              sub_234902DF4();
              v243 = (id)qword_2687CDEB0;
              if (os_log_type_enabled(v243, OS_LOG_TYPE_DEBUG))
              {
                id v247 = (id)objc_opt_class();
                units.years = 138412546;
                *(void *)&units.months = v247;
                LOWORD(units.hours) = 2112;
                *(void *)((char *)&units.hours + 2) = v232;
                _os_log_debug_impl(&dword_234900000, v243, OS_LOG_TYPE_DEBUG, "[%@] - Added attendee %@", (uint8_t *)&units, 0x16u);
              }
              v244 = (id)*MEMORY[0x263F28388];
              if (os_log_type_enabled(v244, OS_LOG_TYPE_DEBUG))
              {
                id v248 = (id)objc_opt_class();
                units.years = 136315650;
                *(void *)&units.months = "-[CalAssistantEventCommit _commitEvent:serviceHelper:]";
                LOWORD(units.hours) = 2112;
                *(void *)((char *)&units.hours + 2) = v248;
                *((_WORD *)&units.minutes + 3) = 2112;
                *(void *)&units.seconds = v232;
                _os_log_debug_impl(&dword_234900000, v244, OS_LOG_TYPE_DEBUG, "%s [%@] - Added attendee %@", (uint8_t *)&units, 0x20u);
              }
              int v394 = 1;
            }
          }
        }
        uint64_t v186 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v183, (uint64_t)&v409, (uint64_t)v415, 16);
      }
      while (v186);
    }
    else
    {
      int v394 = 0;
    }

    v252 = objc_msgSend_array(MEMORY[0x263EFF980], v249, v250, v251);
    long long v405 = 0u;
    long long v406 = 0u;
    long long v407 = 0u;
    long long v408 = 0u;
    id v253 = obj;
    uint64_t v255 = objc_msgSend_countByEnumeratingWithState_objects_count_(v253, v254, (uint64_t)&v405, (uint64_t)v414, 16);
    id v5 = v389;
    if (v255)
    {
      uint64_t v259 = v255;
      uint64_t v260 = *(void *)v406;
      do
      {
        for (uint64_t j = 0; j != v259; ++j)
        {
          if (*(void *)v406 != v260) {
            objc_enumerationMutation(v253);
          }
          v262 = objc_msgSend_displayText(*(void **)(*((void *)&v405 + 1) + 8 * j), v256, v257, v258);
          objc_msgSend_addObject_(v252, v263, (uint64_t)v262, v264);
        }
        uint64_t v259 = objc_msgSend_countByEnumeratingWithState_objects_count_(v253, v256, (uint64_t)&v405, (uint64_t)v414, 16);
      }
      while (v259);
    }

    v265 = sub_23490391C(v252);
    v269 = objc_msgSend_bundle(CalAssistantBundle, v266, v267, v268);
    v271 = v269;
    v272 = NSString;
    if (v388)
    {
      v273 = objc_msgSend_assistantLocalizedStringForKey_table_bundle_(v388, v270, @"%1$@ with %2$@", 0, v269);
      v277 = objc_msgSend_title(v389, v274, v275, v276);
      objc_msgSend_stringWithFormat_(v272, v278, (uint64_t)v273, v279, v277, v265, v381, v383);
    }
    else
    {
      v273 = objc_msgSend_localizedStringForKey_value_table_(v269, v270, @"%1$@ with %2$@", (uint64_t)&stru_26E797B08, 0);
      v277 = objc_msgSend_title(v389, v280, v281, v282);
      objc_msgSend_localizedStringWithFormat_(v272, v283, (uint64_t)v273, v284, v277, v265, v381, v383);
    v285 = };

    if ((v385 | v394))
    {
      v289 = objc_msgSend_title(v389, v286, v287, v288);
      objc_msgSend_setTitle_(v396, v290, (uint64_t)v289, v291);
    }
    else
    {
      objc_msgSend_setTitle_(v396, v286, (uint64_t)v285, v288);
    }
    sub_234902DF4();
    v292 = (id)qword_2687CDEB0;
    if (os_log_type_enabled(v292, OS_LOG_TYPE_DEBUG)) {
      sub_234907880();
    }

    v293 = (id)*MEMORY[0x263F28388];
    if (os_log_type_enabled(v293, OS_LOG_TYPE_DEBUG)) {
      sub_2349077D4();
    }

    v63 = v396;
  }
  v294 = objc_msgSend_recurrences(v5, v144, v145, v146);
  uint64_t v298 = objc_msgSend_count(v294, v295, v296, v297);

  if (v298)
  {
    if (v298 == 1)
    {
      v302 = objc_msgSend_recurrences(v5, v299, v300, v301);
      v305 = objc_msgSend_objectAtIndex_(v302, v303, 0, v304);
      v306 = sub_234903C5C(v305);

      sub_234902DF4();
      v307 = (id)qword_2687CDEB0;
      if (os_log_type_enabled(v307, OS_LOG_TYPE_DEBUG)) {
        sub_23490773C();
      }

      v308 = (id)*MEMORY[0x263F28388];
      if (os_log_type_enabled(v308, OS_LOG_TYPE_DEBUG)) {
        sub_2349076A0();
      }

      v311 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF8C0], v309, (uint64_t)v306, v310);
      v312 = v63;
      objc_msgSend_setRecurrenceRules_(v63, v313, (uint64_t)v311, v314);

      v397 = 0;
    }
    else
    {
      sub_234902DF4();
      v315 = (id)qword_2687CDEB0;
      if (os_log_type_enabled(v315, OS_LOG_TYPE_ERROR)) {
        sub_234907608((uint64_t)self, v315);
      }

      v316 = (id)*MEMORY[0x263F28388];
      if (os_log_type_enabled(v316, OS_LOG_TYPE_ERROR)) {
        sub_234907570();
      }

      id v317 = objc_alloc(MEMORY[0x263F64820]);
      v397 = objc_msgSend_initWithReason_(v317, v318, @"Calendar plugin doesn't handle multiple recurrences.", v319);
      v306 = v63;
      v312 = 0;
    }
  }
  else
  {
    v312 = v63;
    v397 = 0;
  }
  long long v403 = 0u;
  long long v404 = 0u;
  long long v401 = 0u;
  long long v402 = 0u;
  v320 = objc_msgSend_alerts(v5, v299, v300, v301);
  uint64_t v322 = objc_msgSend_countByEnumeratingWithState_objects_count_(v320, v321, (uint64_t)&v401, (uint64_t)v413, 16);
  if (v322)
  {
    uint64_t v323 = v322;
    uint64_t v324 = *(void *)v402;
    do
    {
      for (uint64_t k = 0; k != v323; ++k)
      {
        if (*(void *)v402 != v324) {
          objc_enumerationMutation(v320);
        }
        v326 = *(void **)(*((void *)&v401 + 1) + 8 * k);
        id v327 = objc_alloc(MEMORY[0x263F04B18]);
        objc_msgSend_doubleValue(v326, v328, v329, v330);
        v334 = objc_msgSend_initWithRelativeOffset_(v327, v331, v332, v333);
        if (v334)
        {
          sub_234902DF4();
          v335 = (id)qword_2687CDEB0;
          if (os_log_type_enabled(v335, OS_LOG_TYPE_DEBUG))
          {
            id v340 = (id)objc_opt_class();
            units.years = 138412546;
            *(void *)&units.months = v340;
            LOWORD(units.hours) = 2112;
            *(void *)((char *)&units.hours + 2) = v334;
            _os_log_debug_impl(&dword_234900000, v335, OS_LOG_TYPE_DEBUG, "[%@] - Giving event alarm %@", (uint8_t *)&units, 0x16u);
          }
          v336 = (id)*MEMORY[0x263F28388];
          if (os_log_type_enabled(v336, OS_LOG_TYPE_DEBUG))
          {
            id v341 = (id)objc_opt_class();
            units.years = 136315650;
            *(void *)&units.months = "-[CalAssistantEventCommit _commitEvent:serviceHelper:]";
            LOWORD(units.hours) = 2112;
            *(void *)((char *)&units.hours + 2) = v341;
            *((_WORD *)&units.minutes + 3) = 2112;
            *(void *)&units.seconds = v334;
            _os_log_debug_impl(&dword_234900000, v336, OS_LOG_TYPE_DEBUG, "%s [%@] - Giving event alarm %@", (uint8_t *)&units, 0x20u);
          }
          objc_msgSend_addAlarm_(v312, v337, (uint64_t)v334, v338);
        }
      }
      uint64_t v323 = objc_msgSend_countByEnumeratingWithState_objects_count_(v320, v339, (uint64_t)&v401, (uint64_t)v413, 16);
    }
    while (v323);
  }

  v63 = v312;
  if (v312)
  {
    v345 = objc_msgSend_eventStore(self, v342, v343, v344);
    id v400 = 0;
    char v347 = objc_msgSend_saveEvent_span_commit_error_(v345, v346, (uint64_t)v312, v298 != 0, 1, &v400);
    id v348 = v400;

    sub_234902DF4();
    v349 = (id)qword_2687CDEB0;
    v350 = v349;
    id v6 = v388;
    id v5 = v389;
    id v24 = v386;
    v12 = v387;
    v351 = cf;
    v352 = v397;
    if (v347)
    {
      if (os_log_type_enabled(v349, OS_LOG_TYPE_DEBUG)) {
        sub_2349073A4();
      }

      v353 = (id)*MEMORY[0x263F28388];
      if (os_log_type_enabled(v353, OS_LOG_TYPE_DEBUG)) {
        sub_23490730C();
      }

      AceEventFromEKEvent_0 = CreateAceEventFromEKEvent_0(v63, cf);
      if (AceEventFromEKEvent_0)
      {
        sub_234902DF4();
        v355 = (id)qword_2687CDEB0;
        if (os_log_type_enabled(v355, OS_LOG_TYPE_DEBUG)) {
          sub_234907284();
        }

        v356 = (id)*MEMORY[0x263F28388];
        if (os_log_type_enabled(v356, OS_LOG_TYPE_DEBUG)) {
          sub_2349071EC();
        }

        id v357 = objc_alloc_init(MEMORY[0x263F64898]);
        v352 = objc_msgSend_identifier(AceEventFromEKEvent_0, v358, v359, v360);
        objc_msgSend_setIdentifier_(v357, v361, (uint64_t)v352, v362);
        goto LABEL_167;
      }
      id v370 = objc_alloc(MEMORY[0x263F64820]);
      uint64_t v369 = objc_msgSend_initWithReason_(v370, v371, @"Unable to create ace event from calendar event", v372);
    }
    else
    {
      if (os_log_type_enabled(v349, OS_LOG_TYPE_ERROR)) {
        sub_2349074D8();
      }

      v363 = (id)*MEMORY[0x263F28388];
      if (os_log_type_enabled(v363, OS_LOG_TYPE_ERROR)) {
        sub_23490742C();
      }

      id v364 = objc_alloc(MEMORY[0x263F64820]);
      AceEventFromEKEvent_0 = objc_msgSend_stringWithFormat_(NSString, v365, @"Unable to save event: %@", v366, v348);
      uint64_t v369 = objc_msgSend_initWithReason_(v364, v367, (uint64_t)AceEventFromEKEvent_0, v368);
    }
    id v357 = (id)v369;
LABEL_167:

    goto LABEL_168;
  }
  id v6 = v388;
  id v5 = v389;
  id v24 = v386;
  v12 = v387;
  v351 = cf;
  id v357 = v397;
LABEL_168:
  CFRelease(v351);
  id v73 = v357;

LABEL_169:
LABEL_170:

  return v73;
}

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  id v22 = a4;
  id v6 = (void (**)(id, void *))a3;
  sub_234902DF4();
  uint64_t v10 = objc_msgSend_identifier(self, v7, v8, v9);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = objc_msgSend__validateEvent_(self, v11, (uint64_t)v10, v12);
    if (v16) {
      goto LABEL_6;
    }
    uint64_t v17 = objc_msgSend__commitEvent_serviceHelper_(self, v13, (uint64_t)v10, (uint64_t)v22);
  }
  else
  {
    id v18 = objc_alloc(MEMORY[0x263F64820]);
    uint64_t v17 = objc_msgSend_initWithReason_(v18, v19, @"I could not find the event to commit.", v20);
  }
  uint64_t v16 = (void *)v17;
LABEL_6:
  v21 = objc_msgSend_dictionary(v16, v13, v14, v15);
  v6[2](v6, v21);
}

- (void)performWithCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end