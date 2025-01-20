@interface CalAssistantEventSearch
- (EKEventStore)eventStore;
- (id)_validate;
- (id)_visibleCalendars;
- (void)performWithCompletion:(id)a3;
- (void)setEventStore:(id)a3;
@end

@implementation CalAssistantEventSearch

- (EKEventStore)eventStore
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

- (void)performWithCompletion:(id)a3
{
  uint64_t v197 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  sub_234902DF4();
  sub_234902DF4();
  v5 = (void *)qword_2687CDEB0;
  if (os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_DEBUG)) {
    sub_234906764(v5);
  }
  v6 = (os_log_t *)MEMORY[0x263F28388];
  v7 = (void *)*MEMORY[0x263F28388];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28388], OS_LOG_TYPE_DEBUG)) {
    sub_2349066C8(v7);
  }
  v14 = objc_msgSend__validate(self, v8, v9, v10);
  if (!v14)
  {
    objc_msgSend_timeZoneId(self, v11, v12, v13);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v15) {
      uint64_t v16 = (uint64_t)CFTimeZoneCreateWithName(0, v15, 1u);
    }
    else {
      uint64_t v16 = CalCopyTimeZone();
    }
    v20 = (void *)v16;
    if (v16)
    {
      v24 = objc_msgSend_limit(self, v17, v18, v19);
      if (v24)
      {
        v25 = objc_msgSend_limit(self, v21, v22, v23);
        int v29 = objc_msgSend_intValue(v25, v26, v27, v28);
      }
      else
      {
        int v29 = 0;
      }

      id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
      v37 = objc_msgSend_eventStore(self, v34, v35, v36);
      v41 = objc_msgSend__visibleCalendars(self, v38, v39, v40);
      v45 = v41;
      if (v41 && objc_msgSend_count(v41, v42, v43, v44))
      {
        int v167 = v29;
        v169 = v45;
        sub_234902DF4();
        v46 = (void *)qword_2687CDEB0;
        if (os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_DEBUG))
        {
          log = v46;
          v155 = objc_opt_class();
          id v158 = v155;
          v165 = objc_msgSend_startDate(self, v102, v103, v104);
          v163 = objc_msgSend_endDate(self, v105, v106, v107);
          v161 = objc_msgSend_title(self, v108, v109, v110);
          v154 = objc_msgSend_location(self, v111, v112, v113);
          v153 = objc_msgSend_notes(self, v114, v115, v116);
          objc_msgSend_participants(self, v117, v118, v119);
          *(_DWORD *)buf = 138414594;
          v176 = (const char *)v155;
          __int16 v177 = 2112;
          uint64_t v178 = (uint64_t)v20;
          __int16 v179 = 2112;
          v180 = v165;
          __int16 v181 = 2112;
          v182 = v163;
          __int16 v183 = 2112;
          v184 = v161;
          __int16 v185 = 2112;
          v186 = v154;
          __int16 v187 = 2112;
          v188 = v153;
          __int16 v189 = 2112;
          v190 = v45;
          v192 = __int16 v191 = 2112;
          v120 = (void *)v192;
          __int16 v193 = 2112;
          uint64_t v194 = (uint64_t)v37;
          _os_log_debug_impl(&dword_234900000, log, OS_LOG_TYPE_DEBUG, "[%@] - Creating predicate for event search with timeZone %@, startDate %@, endDate %@, title %@, location %@, notes %@, visibleCalendars %@ participants %@ in store %@", buf, 0x66u);
        }
        v160 = v4;
        v162 = v15;
        os_log_t v47 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
        {
          loga = v47;
          v121 = objc_opt_class();
          id v159 = v121;
          v166 = objc_msgSend_startDate(self, v122, v123, v124);
          v128 = objc_msgSend_endDate(self, v125, v126, v127);
          v132 = objc_msgSend_title(self, v129, v130, v131);
          v136 = objc_msgSend_location(self, v133, v134, v135);
          v140 = objc_msgSend_notes(self, v137, v138, v139);
          uint64_t v144 = objc_msgSend_participants(self, v141, v142, v143);
          *(_DWORD *)buf = 136317698;
          v176 = "-[CalAssistantEventSearch performWithCompletion:]";
          __int16 v177 = 2112;
          uint64_t v178 = (uint64_t)v121;
          __int16 v179 = 2112;
          v180 = v20;
          __int16 v181 = 2112;
          v182 = v166;
          __int16 v183 = 2112;
          v184 = v128;
          __int16 v185 = 2112;
          v186 = v132;
          __int16 v187 = 2112;
          v188 = v136;
          __int16 v189 = 2112;
          v190 = v140;
          __int16 v191 = 2112;
          uint64_t v192 = (uint64_t)v169;
          __int16 v193 = 2112;
          uint64_t v194 = v144;
          v145 = (void *)v144;
          __int16 v195 = 2112;
          v196 = v37;
          _os_log_debug_impl(&dword_234900000, loga, OS_LOG_TYPE_DEBUG, "%s [%@] - Creating predicate for event search with timeZone %@, startDate %@, endDate %@, title %@, location %@, notes %@, visibleCalendars %@ participants %@ in store %@", buf, 0x70u);
        }
        v51 = objc_msgSend_startDate(self, v48, v49, v50);
        v55 = objc_msgSend_endDate(self, v52, v53, v54);
        v59 = objc_msgSend_title(self, v56, v57, v58);
        v63 = objc_msgSend_location(self, v60, v61, v62);
        v67 = objc_msgSend_notes(self, v64, v65, v66);
        v71 = objc_msgSend_participants(self, v68, v69, v70);
        uint64_t v152 = v167;
        v168 = v37;
        uint64_t v73 = objc_msgSend_predicateForAssistantEventSearchWithTimeZone_startDate_endDate_title_location_notes_participants_calendars_limit_(v37, v72, (uint64_t)v20, (uint64_t)v51, v55, v59, v63, v67, v71, v169, v152);

        sub_234902DF4();
        v74 = (void *)qword_2687CDEB0;
        v164 = (void *)v73;
        if (v73)
        {
          BOOL v75 = os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_DEBUG);
          v76 = (os_log_t *)MEMORY[0x263F28388];
          v4 = v160;
          if (v75)
          {
            v146 = v74;
            v147 = (char *)objc_opt_class();
            *(_DWORD *)buf = 138412802;
            v176 = v147;
            __int16 v177 = 2112;
            uint64_t v178 = v73;
            __int16 v179 = 2112;
            v180 = v168;
            v148 = v147;
            _os_log_debug_impl(&dword_234900000, v146, OS_LOG_TYPE_DEBUG, "[%@] - Searching for events matching predicate %@ in store %@", buf, 0x20u);
          }
          os_log_t v77 = *v76;
          v80 = v168;
          if (os_log_type_enabled(*v76, OS_LOG_TYPE_DEBUG))
          {
            v149 = v77;
            v150 = objc_opt_class();
            *(_DWORD *)buf = 136315906;
            v176 = "-[CalAssistantEventSearch performWithCompletion:]";
            __int16 v177 = 2112;
            uint64_t v178 = (uint64_t)v150;
            __int16 v179 = 2112;
            v180 = v164;
            __int16 v181 = 2112;
            v182 = v168;
            id v151 = v150;
            _os_log_debug_impl(&dword_234900000, v149, OS_LOG_TYPE_DEBUG, "%s [%@] - Searching for events matching predicate %@ in store %@", buf, 0x2Au);

            v80 = v168;
          }
          v81 = objc_msgSend_eventsMatchingPredicate_(v80, v78, (uint64_t)v164, v79);
          sub_234902DF4();
          if (os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_DEBUG)) {
            sub_234906610();
          }
          if (os_log_type_enabled(*v76, OS_LOG_TYPE_DEBUG)) {
            sub_23490654C();
          }
          long long v172 = 0u;
          long long v173 = 0u;
          long long v170 = 0u;
          long long v171 = 0u;
          id v82 = v81;
          uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v83, (uint64_t)&v170, (uint64_t)v174, 16);
          if (v84)
          {
            uint64_t v85 = v84;
            uint64_t v86 = *(void *)v171;
            do
            {
              for (uint64_t i = 0; i != v85; ++i)
              {
                if (*(void *)v171 != v86) {
                  objc_enumerationMutation(v82);
                }
                id AceEventFromEKEvent_0 = CreateAceEventFromEKEvent_0(*(void **)(*((void *)&v170 + 1) + 8 * i), v20);
                objc_msgSend_addObject_(v33, v89, (uint64_t)AceEventFromEKEvent_0, v90);
              }
              uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v91, (uint64_t)&v170, (uint64_t)v174, 16);
            }
            while (v85);
          }

          sub_234902DF4();
          if (os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_DEBUG)) {
            sub_2349064A0();
          }
          v15 = v162;
          v37 = v168;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28388], OS_LOG_TYPE_DEBUG)) {
            sub_2349063EC();
          }

          v45 = v169;
        }
        else
        {
          BOOL v94 = os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_ERROR);
          v4 = v160;
          v15 = v162;
          v95 = (os_log_t *)MEMORY[0x263F28388];
          if (v94) {
            sub_23490634C(v74);
          }
          os_log_t v96 = *v95;
          BOOL v97 = os_log_type_enabled(*v95, OS_LOG_TYPE_ERROR);
          v37 = v168;
          v45 = v169;
          if (v97) {
            sub_2349062A8(v96);
          }
        }
      }
      else
      {
        sub_234902DF4();
        v92 = (void *)qword_2687CDEB0;
        if (os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_DEBUG)) {
          sub_234906218(v92);
        }
        os_log_t v93 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG)) {
          sub_23490617C(v93);
        }
      }
      id v98 = objc_alloc(MEMORY[0x263F647F0]);
      v14 = objc_msgSend_initWithResults_(v98, v99, (uint64_t)v33, v100);
    }
    else
    {
      id v30 = objc_alloc(MEMORY[0x263F64820]);
      v14 = objc_msgSend_initWithReason_(v30, v31, @"Invalid timezone", v32);
    }
  }
  v101 = objc_msgSend_dictionary(v14, v11, v12, v13);
  v4[2](v4, v101);
}

- (id)_visibleCalendars
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc(MEMORY[0x263F04B68]);
  v8 = objc_msgSend_eventStore(self, v5, v6, v7);
  uint64_t v10 = objc_msgSend_initWithEventStore_visibilityChangedCallback_queue_(v4, v9, (uint64_t)v8, 0, 0);

  v14 = objc_msgSend_visibleCalendars(v10, v11, v12, v13);
  objc_msgSend_addObjectsFromArray_(v3, v15, (uint64_t)v14, v16);

  return v3;
}

- (id)_validate
{
  v5 = objc_msgSend_startDate(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_endDate(self, v6, v7, v8);
  uint64_t v12 = (void *)v9;
  if ((v5 != 0) != (v9 != 0))
  {
    uint64_t v13 = @"Start date and end date must be either both specified or omitted";
LABEL_7:
    id v15 = objc_alloc(MEMORY[0x263F64820]);
    v14 = objc_msgSend_initWithReason_(v15, v16, (uint64_t)v13, v17);
    goto LABEL_8;
  }
  v14 = 0;
  if (v5 && v9)
  {
    if (objc_msgSend_compare_(v5, v10, v9, v11) == 1)
    {
      uint64_t v13 = @"End date cannot be earlier than start date";
      goto LABEL_7;
    }
    v14 = 0;
  }
LABEL_8:

  return v14;
}

- (void).cxx_destruct
{
}

@end